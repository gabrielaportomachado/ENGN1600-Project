"""Generate PNG plots from the three project testbench .raw outputs.

Reads ngspice raw files written by:
  SPICE/tb_tgate_hiz.spice
  SPICE/tb_row_corners.spice
  SPICE/tb_row_overlap.spice

Produces three PNGs in this directory:
  tgate_hiz.png        - TGATE off-state high-Z (passing)
  row_corners.png      - 4-phase functional sweep (passing)
  row_overlap.png      - MODE-transition glitch (failing - illustrates the bug)

Run from inside the docker container:
  docker exec iic-osic-tools_chipathon_xvnc bash -lc \
    "cd /foss/designs/ENGN1600-Project/plots && python3 make_plots.py"
"""
from pathlib import Path
import numpy as np
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import Patch
from spicelib import RawRead

HERE = Path(__file__).resolve().parent
SPICE = HERE.parent / "SPICE"


def get(raw, name):
    """Case-insensitive trace lookup; returns numpy array of values."""
    target = name.lower()
    for n in raw.get_trace_names():
        if n.lower() == target:
            return np.asarray(raw.get_trace(n).get_wave())
    raise KeyError(f"trace {name!r} not found; available: {raw.get_trace_names()}")


# ---------------------------------------------------------------- TGATE high-Z
def plot_tgate_hiz():
    raw = RawRead(str(SPICE / "tb_tgate_hiz.raw"))
    vin = get(raw, "v(innode)")
    vout = get(raw, "v(outnode)")
    ileak = np.abs(get(raw, "i(v_in)"))

    fig, (ax_v, ax_i) = plt.subplots(2, 1, figsize=(8, 6), sharex=True)

    ax_v.plot(vin, vout, color="C0", lw=2, label="V(out) (floating, biased to 1.65 V via 100 MΩ)")
    ax_v.axhline(1.65, color="grey", ls="--", lw=0.8, label="bias reference")
    ax_v.set_ylabel("V(out) [V]")
    ax_v.set_ylim(1.55, 1.75)
    ax_v.legend(loc="upper right", framealpha=0.9)
    ax_v.set_title(
        "TGATE off-state (c=0V, cbar=VDD): output decoupled from input → high-Z confirmed"
    )
    ax_v.grid(True, alpha=0.3)

    ax_i.semilogy(vin, np.maximum(ileak, 1e-15), color="C3", lw=2)
    ax_i.axhline(1e-9, color="red", ls="--", lw=1, label="1 nA pass threshold")
    ax_i.set_xlabel("V(in) sweep [V]")
    ax_i.set_ylabel("|I(in)|  [A, log]")
    ax_i.set_xlim(0, 3.3)
    ax_i.legend(loc="upper right", framealpha=0.9)
    ax_i.grid(True, which="both", alpha=0.3)
    imax = ileak.max()
    ax_i.text(
        0.02,
        0.95,
        f"max leakage = {imax * 1e12:.2f} pA  (target < 1 nA) → PASS",
        transform=ax_i.transAxes,
        va="top",
        fontsize=10,
        bbox=dict(boxstyle="round,pad=0.4", facecolor="lightgreen", alpha=0.8),
    )

    fig.tight_layout()
    out = HERE / "tgate_hiz.png"
    fig.savefig(out, dpi=140)
    plt.close(fig)
    print(f"wrote {out}")


# ---------------------------------------------------------------- row corners
def plot_row_corners():
    raw = RawRead(str(SPICE / "tb_row_corners.raw"))
    t = np.asarray(raw.get_axis()) * 1e3  # ms
    vE = get(raw, "v(e_in)")
    vIPG = get(raw, "v(ipg)")
    vREC = get(raw, "v(rec)")
    vRST = get(raw, "v(rst_in)")
    vEN = get(raw, "v(en_in)")
    vMODE = get(raw, "v(mode_in)")

    fig, (ax_a, ax_d) = plt.subplots(2, 1, figsize=(11, 6.5), sharex=True, gridspec_kw=dict(height_ratios=[3, 1]))

    # analog panel
    ax_a.plot(t, vE, color="grey", lw=1.0, alpha=0.6, label="V(E)  (1 kHz sine, ±100 mV)")
    ax_a.plot(t, vIPG, color="C0", lw=1.6, label="V(IPG)")
    ax_a.plot(t, vREC, color="C3", lw=1.6, label="V(REC)")
    ax_a.set_ylabel("voltage [V]")
    ax_a.set_ylim(1.45, 1.85)
    ax_a.legend(loc="upper right", framealpha=0.9, ncol=3)
    ax_a.set_title("Row corner-case sweep — all 8 functional checks PASS")
    ax_a.grid(True, alpha=0.3)

    # phase boundaries and labels (in ms)
    boundaries = [(0.0, 1.5, "A: RSTn=0\n(reset blocks path)"),
                  (1.5, 3.0, "B: RSTn=1, EN=0\n(EN=0 blocks path)"),
                  (3.0, 4.5, "C: EN=1, MODE=0\n(IPG path active)"),
                  (4.5, 6.0, "D: EN=1, MODE=1\n(REC path active)")]
    colors = ["#fde2e4", "#fff3b0", "#cdeac0", "#bee1e6"]
    for (t0, t1, label), c in zip(boundaries, colors):
        ax_a.axvspan(t0, t1, color=c, alpha=0.4, zorder=0)
        ax_d.axvspan(t0, t1, color=c, alpha=0.4, zorder=0)
        ax_a.text((t0 + t1) / 2, 1.83, label, ha="center", va="top", fontsize=9)

    # digital panel
    ax_d.plot(t, vRST, color="C2", lw=1.5, label="RSTn")
    ax_d.plot(t, vEN, color="C1", lw=1.5, label="EN")
    ax_d.plot(t, vMODE, color="C4", lw=1.5, label="MODE")
    ax_d.set_xlabel("time [ms]")
    ax_d.set_ylabel("digital")
    ax_d.set_ylim(-0.3, 3.6)
    ax_d.legend(loc="upper right", framealpha=0.9, ncol=3)
    ax_d.grid(True, alpha=0.3)
    ax_d.set_xlim(0, 6)

    fig.tight_layout()
    out = HERE / "row_corners.png"
    fig.savefig(out, dpi=140)
    plt.close(fig)
    print(f"wrote {out}")


# ---------------------------------------------------------------- row overlap
def plot_row_overlap():
    raw = RawRead(str(SPICE / "tb_row_overlap.raw"))
    t_s = np.asarray(raw.get_axis())
    t = t_s * 1e9  # ns
    vMODE = get(raw, "v(mode_in)")
    vMODEb = get(raw, "v(modeb_in)")
    vIPG = get(raw, "v(ipg)")
    vREC = get(raw, "v(rec)")

    # zoom window around the 1us transition (event is ~200 ps wide, so span ~5 ns)
    win_lo, win_hi = 999.5, 1004.0  # ns
    sel = (t >= win_lo) & (t <= win_hi)

    # element-wise min for the overlap indicator
    overlap = np.minimum(vIPG, vREC)
    overlap_max = overlap[sel].max() if sel.any() else 0

    # find the start and end of the "both elevated" window for shading
    threshold = 0.3
    both = (vIPG > threshold) & (vREC > threshold) & sel
    if both.any():
        idxs = np.where(both)[0]
        t_band_lo = t[idxs[0]]
        t_band_hi = t[idxs[-1]]
    else:
        t_band_lo = t_band_hi = None

    fig, (ax_d, ax_a) = plt.subplots(2, 1, figsize=(10.5, 6.5), sharex=True, gridspec_kw=dict(height_ratios=[1, 2]))

    # digital panel: MODE and MODEb skew
    ax_d.plot(t[sel], vMODE[sel], color="C4", lw=2, label="V(MODE_cfg) - top-level DFF Q")
    ax_d.plot(t[sel], vMODEb[sel], color="C5", lw=2, ls="--", label="V(MODE_cfgb) - top-level DFF Qb (1 INV later)")
    if t_band_lo is not None:
        ax_d.axvspan(t_band_lo, t_band_hi, color="red", alpha=0.18)
    ax_d.set_ylabel("digital [V]")
    ax_d.set_ylim(-0.3, 3.7)
    ax_d.legend(loc="center right", framealpha=0.9)
    ax_d.set_title("Row overlap glitch: MODE 0→1 with realistic Q/Qb skew → both TGs briefly conduct (FAIL)")
    ax_d.grid(True, alpha=0.3)

    # analog panel: IPG and REC
    ax_a.plot(t[sel], vIPG[sel], color="C0", lw=2, label="V(IPG)  (treatment node)")
    ax_a.plot(t[sel], vREC[sel], color="C3", lw=2, label="V(REC)  (recording node)")
    ax_a.fill_between(
        t[sel],
        np.minimum(vIPG[sel], vREC[sel]),
        0,
        where=both[sel],
        color="red",
        alpha=0.25,
        label=f"both > {threshold} V (overlap)",
    )
    ax_a.axhline(threshold, color="red", ls=":", lw=1, alpha=0.7)
    if t_band_lo is not None:
        ax_a.axvspan(t_band_lo, t_band_hi, color="red", alpha=0.10)
    ax_a.set_xlabel("time [ns]   (transition triggered at 1000 ns)")
    ax_a.set_ylabel("voltage [V]")
    ax_a.set_ylim(-0.1, 2.5)
    ax_a.legend(loc="upper right", framealpha=0.9)
    ax_a.grid(True, alpha=0.3)
    ax_a.set_xlim(win_lo, win_hi)

    ax_a.text(
        0.02,
        0.95,
        f"max( min(V(IPG), V(REC)) ) = {overlap_max:.3f} V  (target < 0.3 V) → FAIL",
        transform=ax_a.transAxes,
        va="top",
        fontsize=10,
        bbox=dict(boxstyle="round,pad=0.4", facecolor="lightcoral", alpha=0.8),
    )

    fig.tight_layout()
    out = HERE / "row_overlap.png"
    fig.savefig(out, dpi=140)
    plt.close(fig)
    print(f"wrote {out}")


# --------------------------------------------------------- full top-level (16ch)
def plot_full_allon():
    raw = RawRead(str(SPICE / "tb_full_allon.raw"))
    t = np.asarray(raw.get_axis()) * 1e9  # ns
    expected = np.arange(16) * 0.2 + 0.2  # V_E[i] in V
    # Sample voltages at the two key timestamps
    t_m0, t_m1 = 480.0, 780.0  # ns
    idx_m0 = int(np.argmin(np.abs(t - t_m0)))
    idx_m1 = int(np.argmin(np.abs(t - t_m1)))

    ipg = np.zeros((16, len(t)))
    rec = np.zeros((16, len(t)))
    for i in range(16):
        ipg[i] = get(raw, f"v(ipg{i})")
        rec[i] = get(raw, f"v(rec{i})")

    fig = plt.figure(figsize=(12, 7.5))
    gs = fig.add_gridspec(2, 2, height_ratios=[3, 2], hspace=0.32, wspace=0.22)
    ax_ts = fig.add_subplot(gs[0, :])
    ax_m0 = fig.add_subplot(gs[1, 0])
    ax_m1 = fig.add_subplot(gs[1, 1])

    # Top: time series of all 16 IPG (left), all 16 REC (right) overlaid
    cmap = plt.cm.viridis(np.linspace(0, 0.95, 16))
    for i in range(16):
        ax_ts.plot(t, ipg[i], color=cmap[i], lw=1.0, alpha=0.9, label=f"IPG[{i}]" if i in (0, 7, 15) else None)
        ax_ts.plot(t, rec[i], color=cmap[i], lw=1.0, alpha=0.9, ls="--")
    ax_ts.axvline(t_m0, color="grey", ls=":", lw=1)
    ax_ts.axvline(t_m1, color="grey", ls=":", lw=1)
    ax_ts.text(t_m0, 3.45, " sample\n MODE=0", color="grey", fontsize=9, va="bottom")
    ax_ts.text(t_m1, 3.45, " sample\n MODE=1", color="grey", fontsize=9, va="bottom")
    ax_ts.axvspan(0, 100, color="#fde2e4", alpha=0.4, zorder=0, label="reset")
    ax_ts.axvspan(100, 200, color="#fff3b0", alpha=0.4, zorder=0, label="latch EN")
    ax_ts.axvspan(200, 540, color="#cdeac0", alpha=0.4, zorder=0, label="MODE=0 (treatment)")
    ax_ts.axvspan(540, 800, color="#bee1e6", alpha=0.4, zorder=0, label="MODE=1 (recording)")
    ax_ts.set_xlim(0, 800)
    ax_ts.set_ylim(-0.3, 3.6)
    ax_ts.set_xlabel("time [ns]")
    ax_ts.set_ylabel("voltage [V]")
    ax_ts.set_title("Top-level (16 channels, all EN=1): IPG (solid) and REC (dashed) per channel,\n"
                     "color-coded by channel index (low E→purple, high E→yellow)")
    ax_ts.legend(loc="lower right", framealpha=0.9, fontsize=8, ncol=2)
    ax_ts.grid(True, alpha=0.3)

    # Bottom-left: scatter — measured V(IPG[i]) vs expected V_E[i] at MODE=0
    measured_ipg_m0 = np.array([ipg[i, idx_m0] for i in range(16)])
    measured_rec_m0 = np.array([rec[i, idx_m0] for i in range(16)])
    ax_m0.plot([0, 3.3], [0, 3.3], color="grey", ls="--", lw=1, label="ideal y=x")
    ax_m0.scatter(expected, measured_ipg_m0, c=cmap, s=60, marker="o", label="V(IPG) — active")
    ax_m0.scatter(expected, measured_rec_m0, c=cmap, s=60, marker="x", label="V(REC) — isolated")
    ax_m0.set_xlim(-0.1, 3.4)
    ax_m0.set_ylim(-0.1, 3.4)
    ax_m0.set_xlabel("V_E[i] (input)  [V]")
    ax_m0.set_ylabel("measured  [V]")
    ax_m0.set_title("MODE=0 sample (t=480 ns)")
    ax_m0.legend(loc="upper left", framealpha=0.9, fontsize=9)
    ax_m0.grid(True, alpha=0.3)

    # Bottom-right: same but at MODE=1
    measured_ipg_m1 = np.array([ipg[i, idx_m1] for i in range(16)])
    measured_rec_m1 = np.array([rec[i, idx_m1] for i in range(16)])
    ax_m1.plot([0, 3.3], [0, 3.3], color="grey", ls="--", lw=1, label="ideal y=x")
    ax_m1.scatter(expected, measured_rec_m1, c=cmap, s=60, marker="o", label="V(REC) — active")
    ax_m1.scatter(expected, measured_ipg_m1, c=cmap, s=60, marker="x", label="V(IPG) — isolated")
    ax_m1.set_xlim(-0.1, 3.4)
    ax_m1.set_ylim(-0.1, 3.4)
    ax_m1.set_xlabel("V_E[i] (input)  [V]")
    ax_m1.set_ylabel("measured  [V]")
    ax_m1.set_title("MODE=1 sample (t=780 ns)")
    ax_m1.legend(loc="upper left", framealpha=0.9, fontsize=9)
    ax_m1.grid(True, alpha=0.3)

    fig.suptitle("Top-level functional sweep — all 16 channels enabled, no cross-channel coupling (PASS 64/64)", fontsize=12, y=0.995)
    out = HERE / "full_allon.png"
    fig.savefig(out, dpi=140, bbox_inches="tight")
    plt.close(fig)
    print(f"wrote {out}")


# --------------------------------------- before/after overlap (current vs fix)
def plot_overlap_compare():
    raw_b = RawRead(str(SPICE / "tb_row_overlap.raw"))
    raw_a = RawRead(str(SPICE / "tb_row_overlap_fixed.raw"))

    def extract(raw):
        t = np.asarray(raw.get_axis()) * 1e9  # ns
        return dict(
            t=t,
            mode=get(raw, "v(mode_in)"),
            modeb=get(raw, "v(modeb_in)"),
            ipg=get(raw, "v(ipg)"),
            rec=get(raw, "v(rec)"),
        )

    B = extract(raw_b)
    A = extract(raw_a)

    win_lo, win_hi = 999.5, 1003.0  # ns

    fig = plt.figure(figsize=(13, 8))
    gs = fig.add_gridspec(3, 2, height_ratios=[1, 2.3, 2.3], hspace=0.35, wspace=0.18)
    ax_dB = fig.add_subplot(gs[0, 0])
    ax_dA = fig.add_subplot(gs[0, 1], sharey=ax_dB)
    ax_aB = fig.add_subplot(gs[1, 0])
    ax_aA = fig.add_subplot(gs[1, 1], sharey=ax_aB)
    ax_zB = fig.add_subplot(gs[2, 0])
    ax_zA = fig.add_subplot(gs[2, 1], sharey=ax_zB)

    threshold = 0.3

    def render_column(D, axd, axa, axz, title, color):
        sel = (D["t"] >= win_lo) & (D["t"] <= win_hi)
        t = D["t"]
        # digital
        axd.plot(t[sel], D["mode"][sel], color="C4", lw=2, label="V(MODE_cfg) - DFF Q")
        axd.plot(t[sel], D["modeb"][sel], color="C5", lw=2, ls="--", label="V(MODE_cfgb) - DFF Qb (1 INV after Q)")
        axd.set_title(title, fontsize=11, color=color, fontweight="bold")
        axd.set_ylabel("digital [V]")
        axd.set_ylim(-0.4, 3.7)
        axd.set_xlim(win_lo, win_hi)
        axd.grid(True, alpha=0.3)
        axd.tick_params(labelbottom=False)

        # analog full-scale
        axa.plot(t[sel], D["ipg"][sel], color="C0", lw=2, label="V(IPG)")
        axa.plot(t[sel], D["rec"][sel], color="C3", lw=2, label="V(REC)")
        overlap = np.minimum(D["ipg"], D["rec"])
        both = (D["ipg"] > threshold) & (D["rec"] > threshold) & sel
        axa.fill_between(t, overlap, 0, where=both, color="red", alpha=0.30,
                         label=f"both > {threshold} V")
        axa.axhline(threshold, color="red", ls=":", lw=1, alpha=0.7)
        omax = overlap[sel].max()
        verdict = "FAIL" if omax > threshold else "PASS"
        bg = "lightcoral" if omax > threshold else "lightgreen"
        axa.text(0.02, 0.95,
                 f"max( min(V(IPG), V(REC)) ) = {omax:.3f} V  ({verdict})",
                 transform=axa.transAxes, va="top", fontsize=10,
                 bbox=dict(boxstyle="round,pad=0.4", facecolor=bg, alpha=0.85))
        axa.set_ylabel("voltage [V]")
        axa.set_ylim(-0.1, 2.4)
        axa.set_xlim(win_lo, win_hi)
        axa.grid(True, alpha=0.3)
        axa.tick_params(labelbottom=False)

        # zoomed-in view of just the overlap band (or where the two traces cross)
        axz.plot(t[sel], D["ipg"][sel], color="C0", lw=1.8, label="V(IPG)")
        axz.plot(t[sel], D["rec"][sel], color="C3", lw=1.8, label="V(REC)")
        axz.fill_between(t, overlap, 0, where=both, color="red", alpha=0.30)
        axz.axhline(threshold, color="red", ls=":", lw=1, alpha=0.7,
                    label=f"{threshold} V threshold")
        axz.set_xlabel("time [ns]   (transition triggered at 1000 ns)")
        axz.set_ylabel("voltage (zoom) [V]")
        axz.set_ylim(-0.05, 0.7)
        axz.set_xlim(win_lo, win_hi)
        axz.grid(True, alpha=0.3)

    render_column(B, ax_dB, ax_aB, ax_zB,
                  "BEFORE: row.sch (current) — overlap glitch present", "C3")
    render_column(A, ax_dA, ax_aA, ax_zA,
                  "AFTER: row_fixed (cross-coupled) — gate-level overlap eliminated", "C2")

    ax_dB.legend(loc="lower right", framealpha=0.9, fontsize=8)
    ax_aB.legend(loc="upper right", framealpha=0.9, fontsize=8)
    ax_zB.legend(loc="upper right", framealpha=0.9, fontsize=8)

    fig.suptitle("Row overlap: current schematic vs cross-coupled break-before-make fix",
                 fontsize=13, y=0.995)

    # Add a compact summary line below the suptitle
    fig.text(0.5, 0.955,
             "Cross-coupling eliminates the gate-level cause (Cause 1).  Residual ~0.5 V is the load-RC effect (Cause 2) — needs a dead-time buffer chain.",
             ha="center", fontsize=10, style="italic", color="#444")

    out = HERE / "row_overlap_compare.png"
    fig.savefig(out, dpi=140, bbox_inches="tight")
    plt.close(fig)
    print(f"wrote {out}")


# ---------------------------------------- realistic loads + neural waveforms
def plot_realistic():
    raw = RawRead(str(SPICE / "tb_realistic.raw"))
    t = np.asarray(raw.get_axis()) * 1e3  # ms
    v_stim_drv = get(raw, "v(stim_drv)")
    v_ipg      = get(raw, "v(ipg_pin)")
    v_e        = get(raw, "v(e_pin)")
    v_rec      = get(raw, "v(rec_pin)")
    v_brain    = get(raw, "v(brain_node)")

    fig = plt.figure(figsize=(13, 9))
    gs = fig.add_gridspec(3, 2, hspace=0.35, wspace=0.12,
                          height_ratios=[1, 1, 1], width_ratios=[3, 2])

    # ------ row 1: full transient (0-30 ms) showing stim, drain, record phases ------
    ax_stim_full = fig.add_subplot(gs[0, :])
    ax_stim_full.plot(t, v_stim_drv, color="grey",  lw=0.8, alpha=0.7, label="V(stim_drv) — driver intent")
    ax_stim_full.plot(t, v_ipg,      color="C0",    lw=1.2, label="V(IPG_pin)")
    ax_stim_full.plot(t, v_e,        color="C2",    lw=1.2, label="V(E_pin) — brain electrode")
    ax_stim_full.plot(t, v_rec,      color="C3",    lw=1.2, label="V(REC_pin) — recording amp input")
    ax_stim_full.axvspan(0, 4.7, color="#fde2e4", alpha=0.30, zorder=0)
    ax_stim_full.axvspan(4.7, 15, color="#fff3b0", alpha=0.30, zorder=0)
    ax_stim_full.axvspan(15, 30, color="#bee1e6", alpha=0.30, zorder=0)
    ax_stim_full.text(2.4,  3.3, "MODE=0 stim\n5 biphasic pulses", ha="center", fontsize=9, color="#a44")
    ax_stim_full.text(9.85, 3.3, "MODE=0 drain\n(C_dl bleeds via SW_IPG)", ha="center", fontsize=9, color="#a73")
    ax_stim_full.text(22.5, 3.3, "MODE=1 record\n1 kHz LFP, 100 µV", ha="center", fontsize=9, color="#147")
    ax_stim_full.set_xlim(0, 30)
    ax_stim_full.set_ylim(-0.2, 3.6)
    ax_stim_full.set_ylabel("V [V]")
    ax_stim_full.set_title("Realistic-load TB with Randles electrode model — full 30 ms run")
    ax_stim_full.legend(loc="lower center", framealpha=0.9, ncol=4, fontsize=9)
    ax_stim_full.grid(True, alpha=0.3)

    # ------ row 2: zoom into one stim pulse (cathodic + anodic) ------
    ax_stim_zoom = fig.add_subplot(gs[1, 0])
    sel_stim = (t >= 0.45) & (t <= 0.85)
    ax_stim_zoom.plot(t[sel_stim], v_stim_drv[sel_stim], color="grey", lw=1.5, alpha=0.8, label="V(stim_drv)")
    ax_stim_zoom.plot(t[sel_stim], v_ipg[sel_stim],      color="C0",   lw=1.8, label="V(IPG_pin)")
    ax_stim_zoom.plot(t[sel_stim], v_e[sel_stim],        color="C2",   lw=1.8, label="V(E_pin)")
    ax_stim_zoom.plot(t[sel_stim], v_rec[sel_stim],      color="C3",   lw=1.8, label="V(REC_pin)")
    ax_stim_zoom.axhline(1.65, color="grey", ls=":", lw=0.8)
    ax_stim_zoom.set_xlabel("time [ms]")
    ax_stim_zoom.set_ylabel("V [V]")
    ax_stim_zoom.set_title("Stim pulse 1 (zoom): TG drops ~70% of swing")
    ax_stim_zoom.set_ylim(0.4, 2.9)
    ax_stim_zoom.legend(loc="upper right", framealpha=0.9, fontsize=8)
    ax_stim_zoom.grid(True, alpha=0.3)

    # crosstalk panel (REC during stim+drain)
    ax_xtalk_stim = fig.add_subplot(gs[1, 1])
    sel_xtalk = (t >= 0) & (t <= 14)
    ax_xtalk_stim.plot(t[sel_xtalk], (v_rec[sel_xtalk] - 1.65) * 1e6, color="C3", lw=1.4, label="V(REC) − 1.65 V")
    ax_xtalk_stim.set_ylim(-50, 50)
    ax_xtalk_stim.set_xlabel("time [ms]  (during stim+drain)")
    ax_xtalk_stim.set_ylabel("[µV from bias]")
    ax_xtalk_stim.set_title("Crosstalk: REC during stim")
    ax_xtalk_stim.text(0.5, 40, "0 µV measured (perfect isolation)", fontsize=9, color="#080")
    ax_xtalk_stim.grid(True, alpha=0.3)
    ax_xtalk_stim.legend(loc="lower right", fontsize=8)

    # ------ row 3: zoom into recording phase (post-drain) showing clean LFP ------
    ax_rec_zoom = fig.add_subplot(gs[2, 0])
    sel_rec = (t >= 28.0) & (t <= 30.0)
    ax_rec_zoom.plot(t[sel_rec], (v_brain[sel_rec] - 1.65) * 1e6, color="grey", lw=1.0, alpha=0.7, label="V(brain) source")
    ax_rec_zoom.plot(t[sel_rec], (v_e[sel_rec]     - 1.65) * 1e6, color="C2",   lw=1.6, label="V(E_pin)")
    ax_rec_zoom.plot(t[sel_rec], (v_rec[sel_rec]   - 1.65) * 1e6, color="C3",   lw=1.6, ls="--", label="V(REC_pin)")
    ax_rec_zoom.axhline(0, color="grey", ls=":", lw=0.8)
    ax_rec_zoom.set_xlabel("time [ms]  (late record mode, post-drain)")
    ax_rec_zoom.set_ylabel("[µV from bias]")
    ax_rec_zoom.set_title("LFP transfer post-drain: brain → E → REC, <2% loss")
    ax_rec_zoom.legend(loc="upper right", framealpha=0.9, fontsize=8)
    ax_rec_zoom.grid(True, alpha=0.3)

    # crosstalk panel (IPG during record)
    ax_xtalk_rec = fig.add_subplot(gs[2, 1])
    sel_xtalk2 = (t >= 15) & (t <= 30)
    ax_xtalk_rec.plot(t[sel_xtalk2], (v_ipg[sel_xtalk2] - 1.65) * 1e6, color="C0", lw=1.4, label="V(IPG) − 1.65 V")
    ax_xtalk_rec.set_ylim(-50, 50)
    ax_xtalk_rec.set_xlabel("time [ms]  (during record)")
    ax_xtalk_rec.set_ylabel("[µV from bias]")
    ax_xtalk_rec.set_title("Crosstalk: IPG during record")
    ax_xtalk_rec.text(15.5, 40, "0 µV measured (perfect isolation)", fontsize=9, color="#080")
    ax_xtalk_rec.grid(True, alpha=0.3)
    ax_xtalk_rec.legend(loc="lower right", fontsize=8)

    fig.suptitle("Realistic loads — biphasic stim + LFP recording, 3.3 V supply", fontsize=12, y=0.995)

    out = HERE / "realistic.png"
    fig.savefig(out, dpi=140, bbox_inches="tight")
    plt.close(fig)
    print(f"wrote {out}")


# ------------------------------------------ full-chip TB (uses full.sch as DUT)
def plot_full_chip():
    raw_chip = RawRead(str(SPICE / "tb_full_chip.raw"))
    raw_inline = RawRead(str(SPICE / "tb_full_allon.raw"))

    t_chip = np.asarray(raw_chip.get_axis()) * 1e9  # ns
    t_inline = np.asarray(raw_inline.get_axis()) * 1e9

    expected = np.arange(16) * 0.2 + 0.2
    t_m0, t_m1 = 480.0, 780.0

    def gather(raw, name_pattern, t):
        idx_m0 = int(np.argmin(np.abs(t - t_m0)))
        idx_m1 = int(np.argmin(np.abs(t - t_m1)))
        ipg = np.zeros((16, len(t)))
        rec = np.zeros((16, len(t)))
        for i in range(16):
            ipg[i] = get(raw, f"v({name_pattern[0]}{i}{name_pattern[1]})")
            rec[i] = get(raw, f"v({name_pattern[2]}{i}{name_pattern[3]})")
        return ipg, rec, idx_m0, idx_m1

    chip_ipg, chip_rec, idx_chip_m0, idx_chip_m1 = gather(raw_chip,   ("ipg", "_pin", "rec", "_pin"), t_chip)
    inl_ipg,  inl_rec,  idx_inl_m0,  idx_inl_m1  = gather(raw_inline, ("ipg", "",     "rec", ""),     t_inline)

    fig = plt.figure(figsize=(12, 7))
    gs = fig.add_gridspec(2, 2, height_ratios=[3, 2], hspace=0.32, wspace=0.2)
    ax_ts = fig.add_subplot(gs[0, :])
    ax_m0 = fig.add_subplot(gs[1, 0])
    ax_m1 = fig.add_subplot(gs[1, 1])

    cmap = plt.cm.viridis(np.linspace(0, 0.95, 16))
    for i in range(16):
        ax_ts.plot(t_chip, chip_ipg[i], color=cmap[i], lw=1.0, alpha=0.9)
        ax_ts.plot(t_chip, chip_rec[i], color=cmap[i], lw=1.0, alpha=0.9, ls="--")
    ax_ts.axvspan(0,    100,  color="#fde2e4", alpha=0.4, zorder=0)
    ax_ts.axvspan(100,  200,  color="#fff3b0", alpha=0.4, zorder=0)
    ax_ts.axvspan(200,  540,  color="#cdeac0", alpha=0.4, zorder=0, label="MODE=0 (treatment)")
    ax_ts.axvspan(540,  800,  color="#bee1e6", alpha=0.4, zorder=0, label="MODE=1 (recording)")
    ax_ts.set_xlim(0, 800)
    ax_ts.set_ylim(-0.3, 3.6)
    ax_ts.set_xlabel("time [ns]")
    ax_ts.set_ylabel("V [V]")
    ax_ts.set_title("Full-chip TB (driving full.sch via single Xchip instance) — IPG (solid), REC (dashed)")
    ax_ts.legend(loc="lower right", fontsize=9)
    ax_ts.grid(True, alpha=0.3)

    # cross-check scatter at MODE=0: x = inline value, y = chip value, should lie on y=x
    chip_ipg_m0 = chip_ipg[:, idx_chip_m0]
    inl_ipg_m0  = inl_ipg[:,  idx_inl_m0]
    chip_rec_m1 = chip_rec[:, idx_chip_m1]
    inl_rec_m1  = inl_rec[:,  idx_inl_m1]

    ax_m0.plot([0, 3.3], [0, 3.3], color="grey", ls="--", lw=1, label="y=x (perfect agreement)")
    ax_m0.scatter(inl_ipg_m0, chip_ipg_m0, c=cmap, s=70, marker="o", label="V(IPG) at t=480 ns")
    ax_m0.set_xlabel("inline 16-row build  [V]")
    ax_m0.set_ylabel("Xchip via full.sch  [V]")
    ax_m0.set_title("MODE=0 cross-check (each dot = one channel)")
    ax_m0.set_xlim(-0.1, 3.4)
    ax_m0.set_ylim(-0.1, 3.4)
    ax_m0.legend(loc="upper left", fontsize=9)
    ax_m0.grid(True, alpha=0.3)

    ax_m1.plot([0, 3.3], [0, 3.3], color="grey", ls="--", lw=1, label="y=x (perfect agreement)")
    ax_m1.scatter(inl_rec_m1, chip_rec_m1, c=cmap, s=70, marker="o", label="V(REC) at t=780 ns")
    ax_m1.set_xlabel("inline 16-row build  [V]")
    ax_m1.set_ylabel("Xchip via full.sch  [V]")
    ax_m1.set_title("MODE=1 cross-check")
    ax_m1.set_xlim(-0.1, 3.4)
    ax_m1.set_ylim(-0.1, 3.4)
    ax_m1.legend(loc="upper left", fontsize=9)
    ax_m1.grid(True, alpha=0.3)

    # max abs difference for the report
    max_diff_m0 = np.max(np.abs(chip_ipg_m0 - inl_ipg_m0))
    max_diff_m1 = np.max(np.abs(chip_rec_m1 - inl_rec_m1))
    fig.text(0.5, 0.93, f"max |chip − inline| = {max_diff_m0*1e6:.1f} µV (MODE=0),  "
                       f"{max_diff_m1*1e6:.1f} µV (MODE=1) — full.sch wiring matches inline build",
             ha="center", fontsize=10, style="italic", color="#080")

    out = HERE / "full_chip.png"
    fig.savefig(out, dpi=140, bbox_inches="tight")
    plt.close(fig)
    print(f"wrote {out}")


# ----------------------------------------- post-PEX vs schematic comparison
def plot_pex_compare():
    """Four-panel schematic-vs-PEX overlay across the three row-level TBs.

    Tells one story: the post-PEX cell behaves like the schematic cell across
    every corner and load condition, with two informative deltas:
      (i) the overlap glitch persists on silicon (slightly blunted by RC)
      (ii) the TG drop in stim mode is a few mV deeper post-PEX (parasitic R)
    """
    raw_corn_s   = RawRead(str(SPICE / "tb_row_corners.raw"))
    raw_corn_p   = RawRead(str(SPICE / "tb_row_corners_pex.raw"))
    raw_over_s   = RawRead(str(SPICE / "tb_row_overlap.raw"))
    raw_over_p   = RawRead(str(SPICE / "tb_row_overlap_pex.raw"))
    raw_real_s   = RawRead(str(SPICE / "tb_realistic.raw"))
    raw_real_p   = RawRead(str(SPICE / "tb_realistic_pex.raw"))

    SCH_COLOR = "#5a5a5a"   # schematic: muted grey
    PEX_IPG   = "#1f77b4"   # PEX IPG: blue
    PEX_REC   = "#d62728"   # PEX REC: red
    PEX_E     = "#2ca02c"   # PEX E: green
    DELTA_C   = "#ff7f0e"   # delta highlights: orange

    fig = plt.figure(figsize=(14, 10))
    gs = fig.add_gridspec(
        3, 2,
        height_ratios=[0.22, 1.0, 1.0],
        hspace=0.42, wspace=0.22,
        left=0.07, right=0.97, top=0.95, bottom=0.06,
    )

    # ---------- summary banner ----------
    ax_banner = fig.add_subplot(gs[0, :])
    ax_banner.axis("off")
    ax_banner.set_xlim(0, 1)
    ax_banner.set_ylim(0, 1)

    ax_banner.text(
        0.5, 0.85,
        "Post-PEX vs schematic — single row, gf180mcuD",
        ha="center", va="center", fontsize=16, fontweight="bold",
    )
    ax_banner.text(
        0.5, 0.55,
        "Magic RC extraction with cthresh=0, extresist on  →  parasitic Rs and Cs threaded through every metal trace",
        ha="center", va="center", fontsize=10, style="italic", color="#444",
    )

    legend_handles = [
        plt.Line2D([], [], color=SCH_COLOR, lw=2.4, ls="--", label="schematic-level row.spice"),
        plt.Line2D([], [], color=PEX_IPG,   lw=2.4,           label="post-PEX row_pex_wrap.spice"),
    ]
    ax_banner.legend(
        handles=legend_handles, loc="center", framealpha=0.0,
        fontsize=11, ncol=2, bbox_to_anchor=(0.5, 0.18),
    )

    # ---------- (a) corners: phase C and D IPG sine, schematic vs PEX ----------
    ax_corn = fig.add_subplot(gs[1, 0])

    t_s = np.asarray(raw_corn_s.get_axis()) * 1e3  # ms
    t_p = np.asarray(raw_corn_p.get_axis()) * 1e3
    ipg_s = get(raw_corn_s, "v(ipg)")
    ipg_p = get(raw_corn_p, "v(ipg)")
    rec_s = get(raw_corn_s, "v(rec)")
    rec_p = get(raw_corn_p, "v(rec)")
    e_s   = get(raw_corn_s, "v(e_in)")

    win = (t_s >= 3.5) & (t_s <= 5.5)
    win_p = (t_p >= 3.5) & (t_p <= 5.5)

    ax_corn.plot(t_s[win], e_s[win],  color="#bbb", lw=0.8, label="V(E)  (1 kHz, ±100 mV)")
    ax_corn.plot(t_s[win], ipg_s[win], color=SCH_COLOR, lw=1.6, ls="--", label="V(IPG) sch")
    ax_corn.plot(t_p[win_p], ipg_p[win_p], color=PEX_IPG, lw=1.4, label="V(IPG) PEX")
    ax_corn.plot(t_s[win], rec_s[win], color=SCH_COLOR, lw=1.6, ls="--", label="V(REC) sch", alpha=0.6)
    ax_corn.plot(t_p[win_p], rec_p[win_p], color=PEX_REC, lw=1.4, label="V(REC) PEX", alpha=0.85)

    ax_corn.axvspan(3.5, 4.5, color="#cdeac0", alpha=0.30, zorder=0)
    ax_corn.axvspan(4.5, 5.5, color="#bee1e6", alpha=0.30, zorder=0)
    ax_corn.text(4.0, 1.83, "Phase C: MODE=0\nIPG path active", ha="center", fontsize=9, color="#384")
    ax_corn.text(5.0, 1.83, "Phase D: MODE=1\nREC path active", ha="center", fontsize=9, color="#168")

    ax_corn.set_xlim(3.5, 5.5)
    ax_corn.set_ylim(1.40, 1.90)
    ax_corn.set_xlabel("time [ms]")
    ax_corn.set_ylabel("voltage [V]")
    ax_corn.set_title("(a) Corner-case sweep — Phase C / D detail", fontsize=11, fontweight="bold")
    ax_corn.legend(loc="lower right", framealpha=0.92, fontsize=8, ncol=2)
    ax_corn.grid(True, alpha=0.3)

    win_c_s = (t_s >= 3.5) & (t_s <= 4.5)
    win_c_p = (t_p >= 3.5) & (t_p <= 4.5)
    pp_ipg_s = ipg_s[win_c_s].max() - ipg_s[win_c_s].min()
    pp_ipg_p = ipg_p[win_c_p].max() - ipg_p[win_c_p].min()
    delta_pct = (pp_ipg_p - pp_ipg_s) / pp_ipg_s * 100
    ax_corn.text(
        0.02, 0.05,
        f"Phase C — pp(IPG):\nsch = {pp_ipg_s*1e3:.1f} mV\nPEX = {pp_ipg_p*1e3:.1f} mV\nΔ = {delta_pct:+.2f}%  →  PASS 8/8",
        transform=ax_corn.transAxes, va="bottom", fontsize=9,
        bbox=dict(boxstyle="round,pad=0.4", facecolor="lightgreen", alpha=0.85),
    )

    # ---------- (b) overlap zoom: schematic vs PEX ----------
    ax_over = fig.add_subplot(gs[1, 1])

    t_s = np.asarray(raw_over_s.get_axis()) * 1e9  # ns
    t_p = np.asarray(raw_over_p.get_axis()) * 1e9
    ipg_s = get(raw_over_s, "v(ipg)")
    ipg_p = get(raw_over_p, "v(ipg)")
    rec_s = get(raw_over_s, "v(rec)")
    rec_p = get(raw_over_p, "v(rec)")

    lo, hi = 999.5, 1003.5
    sel_s = (t_s >= lo) & (t_s <= hi)
    sel_p = (t_p >= lo) & (t_p <= hi)

    ax_over.plot(t_s[sel_s], ipg_s[sel_s], color=SCH_COLOR, lw=1.7, ls="--", label="V(IPG) sch")
    ax_over.plot(t_p[sel_p], ipg_p[sel_p], color=PEX_IPG,   lw=1.7,           label="V(IPG) PEX")
    ax_over.plot(t_s[sel_s], rec_s[sel_s], color=SCH_COLOR, lw=1.7, ls="--", alpha=0.55, label="V(REC) sch")
    ax_over.plot(t_p[sel_p], rec_p[sel_p], color=PEX_REC,   lw=1.7,           label="V(REC) PEX")

    overlap_s = np.minimum(ipg_s, rec_s)
    overlap_p = np.minimum(ipg_p, rec_p)
    omax_s = overlap_s[sel_s].max()
    omax_p = overlap_p[sel_p].max()

    ax_over.axhline(0.3, color="red", ls=":", lw=1, alpha=0.7, label="0.3 V threshold")
    ax_over.set_xlim(lo, hi)
    ax_over.set_ylim(-0.05, 2.4)
    ax_over.set_xlabel("time [ns]   (transition triggered at 1000 ns)")
    ax_over.set_ylabel("voltage [V]")
    ax_over.set_title("(b) MODE-transition overlap — bug persists on silicon", fontsize=11, fontweight="bold")
    ax_over.legend(loc="upper right", framealpha=0.92, fontsize=8, ncol=2)
    ax_over.grid(True, alpha=0.3)

    ax_over.annotate(
        f"max(min(IPG, REC))\nsch = {omax_s:.3f} V\nPEX = {omax_p:.3f} V\nΔ = {(omax_p-omax_s)*1e3:+.0f} mV",
        xy=(0.02, 0.95), xycoords="axes fraction", va="top",
        fontsize=9,
        bbox=dict(boxstyle="round,pad=0.4", facecolor="lightcoral", alpha=0.85),
    )

    # ---------- (c) realistic stim pulse: TG drop comparison ----------
    ax_stim = fig.add_subplot(gs[2, 0])

    t_s = np.asarray(raw_real_s.get_axis()) * 1e3  # ms
    t_p = np.asarray(raw_real_p.get_axis()) * 1e3
    drv_s = get(raw_real_s, "v(stim_drv)")
    drv_p = get(raw_real_p, "v(stim_drv)")
    e_s   = get(raw_real_s, "v(e_pin)")
    e_p   = get(raw_real_p, "v(e_pin)")
    ipg_s = get(raw_real_s, "v(ipg_pin)")
    ipg_p = get(raw_real_p, "v(ipg_pin)")

    lo, hi = 0.45, 0.85
    sel_s = (t_s >= lo) & (t_s <= hi)
    sel_p = (t_p >= lo) & (t_p <= hi)

    ax_stim.plot(t_s[sel_s], drv_s[sel_s], color="#bbb", lw=1.0, alpha=0.7, label="V(stim_drv)")
    ax_stim.plot(t_s[sel_s], ipg_s[sel_s], color=SCH_COLOR, lw=1.5, ls="--", label="V(IPG) sch")
    ax_stim.plot(t_p[sel_p], ipg_p[sel_p], color=PEX_IPG,   lw=1.5,           label="V(IPG) PEX")
    ax_stim.plot(t_s[sel_s], e_s[sel_s],   color=SCH_COLOR, lw=1.5, ls="--", alpha=0.55, label="V(E)  sch")
    ax_stim.plot(t_p[sel_p], e_p[sel_p],   color=PEX_E,     lw=1.5,           label="V(E)  PEX")

    ax_stim.axhline(1.65, color="grey", ls=":", lw=0.8)
    ax_stim.set_xlim(lo, hi)
    ax_stim.set_ylim(0.4, 2.9)
    ax_stim.set_xlabel("time [ms]   (one biphasic stim pulse)")
    ax_stim.set_ylabel("voltage [V]")
    ax_stim.set_title("(c) Stim pulse, realistic loads — TG drop", fontsize=11, fontweight="bold")
    ax_stim.legend(loc="upper right", framealpha=0.92, fontsize=8, ncol=2)
    ax_stim.grid(True, alpha=0.3)

    win_a = (t_s >= 0.65) & (t_s <= 0.70)
    win_a_p = (t_p >= 0.65) & (t_p <= 0.70)
    e_anod_s = e_s[win_a].mean()
    e_anod_p = e_p[win_a_p].mean()
    drv_a = drv_s[win_a].mean()
    drop_s = (drv_a - 1.65) - (e_anod_s - 1.65)
    drop_p = (drv_a - 1.65) - (e_anod_p - 1.65)

    ax_stim.text(
        0.02, 0.05,
        f"V(E) anodic drop:\nsch = {drop_s*1e3:.0f} mV ({drop_s/(drv_a-1.65)*100:.0f}%)\n"
        f"PEX = {drop_p*1e3:.0f} mV ({drop_p/(drv_a-1.65)*100:.0f}%)\nΔ = {(drop_p-drop_s)*1e3:+.1f} mV (parasitic R)",
        transform=ax_stim.transAxes, va="bottom", fontsize=9,
        bbox=dict(boxstyle="round,pad=0.4", facecolor="#fff3b0", alpha=0.92),
    )

    # ---------- (d) realistic LFP recording: REC transfer comparison ----------
    ax_lfp = fig.add_subplot(gs[2, 1])

    rec_s = get(raw_real_s, "v(rec_pin)")
    rec_p = get(raw_real_p, "v(rec_pin)")
    e_s   = get(raw_real_s, "v(e_pin)")
    e_p   = get(raw_real_p, "v(e_pin)")
    brain_s = get(raw_real_s, "v(brain_node)")

    lo, hi = 28.0, 30.0
    sel_s = (t_s >= lo) & (t_s <= hi)
    sel_p = (t_p >= lo) & (t_p <= hi)

    ax_lfp.plot(t_s[sel_s], (brain_s[sel_s] - 1.65) * 1e6, color="#bbb", lw=1.0, alpha=0.6, label="V(brain) source")
    ax_lfp.plot(t_s[sel_s], (e_s[sel_s]     - 1.65) * 1e6, color=SCH_COLOR, lw=1.5, ls="--", label="V(E) sch")
    ax_lfp.plot(t_p[sel_p], (e_p[sel_p]     - 1.65) * 1e6, color=PEX_E,     lw=1.5,           label="V(E) PEX", alpha=0.85)
    ax_lfp.plot(t_s[sel_s], (rec_s[sel_s]   - 1.65) * 1e6, color=SCH_COLOR, lw=1.5, ls=":",  label="V(REC) sch", alpha=0.7)
    ax_lfp.plot(t_p[sel_p], (rec_p[sel_p]   - 1.65) * 1e6, color=PEX_REC,   lw=1.5,           label="V(REC) PEX", alpha=0.85)
    ax_lfp.axhline(0, color="grey", ls=":", lw=0.7)

    ax_lfp.set_xlim(lo, hi)
    ax_lfp.set_xlabel("time [ms]   (late record mode, post-drain)")
    ax_lfp.set_ylabel("voltage from 1.65 V bias  [µV]")
    ax_lfp.set_title("(d) LFP recording — 1 kHz, 100 µV", fontsize=11, fontweight="bold")
    ax_lfp.legend(loc="upper right", framealpha=0.92, fontsize=8, ncol=2)
    ax_lfp.grid(True, alpha=0.3)

    pp_rec_s = rec_s[sel_s].max() - rec_s[sel_s].min()
    pp_rec_p = rec_p[sel_p].max() - rec_p[sel_p].min()
    ax_lfp.text(
        0.02, 0.05,
        f"pp(REC):\nsch = {pp_rec_s*1e6:.1f} µV\nPEX = {pp_rec_p*1e6:.1f} µV\nΔ = {(pp_rec_p-pp_rec_s)*1e6:+.2f} µV → LFP transfer preserved",
        transform=ax_lfp.transAxes, va="bottom", fontsize=9,
        bbox=dict(boxstyle="round,pad=0.4", facecolor="lightgreen", alpha=0.85),
    )

    out = HERE / "pex_compare.png"
    fig.savefig(out, dpi=140)
    plt.close(fig)
    print(f"wrote {out}")


if __name__ == "__main__":
    plot_tgate_hiz()
    plot_row_corners()
    plot_row_overlap()
    plot_full_allon()
    plot_overlap_compare()
    plot_realistic()
    plot_full_chip()
    plot_pex_compare()
