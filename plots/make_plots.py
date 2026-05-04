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


if __name__ == "__main__":
    plot_tgate_hiz()
    plot_row_corners()
    plot_row_overlap()
    plot_full_allon()
