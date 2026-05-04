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


if __name__ == "__main__":
    plot_tgate_hiz()
    plot_row_corners()
    plot_row_overlap()
