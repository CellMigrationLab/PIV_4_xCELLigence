# Particle Image Velocimetry (PIV) Analysis Workflow

## Overview
This repository provides a comprehensive workflow for **Particle Image Velocimetry (PIV)** analysis, enabling the processing of multi-frame TIFF videos to compute and analyze flow metrics. This tool was created for xCELLigence timelapse image data, but may be suitable for other data sources as well. 

The workflow generates:
- **Flow field visualizations**: Color-coded flow vectors.
- **PIV metrics**: Metrics such as average velocity, direction, and divergence.
- **Summary plots**: Graphs for individual and averaged data with error bars.

**Expected input data:**

- Time-lapse tiffs, with well number in the beginning of the file name (e.g. A3_frames0-60)
- RGB images (will be converted to grayscale)

To run the notebook click here: [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/CellMigrationLab/PIV_4_xCELLigence/blob/main/notebooks/PIV-analysis_96_well_plate.ipynb)


---

## Features
1. **Dependencies Installation and Imports**:
   - Automatic installation of required libraries.
   - Imports modules for PIV analysis, data processing, and visualization.

2. **Video Loading and Preprocessing**:
   - Load multi-frame TIFF videos.
   - Convert images to grayscale for analysis.

3. **PIV Analysis and Metrics Calculation**:
   - Calculate displacement vectors using the `openpiv` library.
   - Compute calibrated flow metrics based on pixel size and time interval.

4. **Data Visualization**:
   - Generate flow field visualizations for individual frames and cumulative intervals.
   - Save metrics in CSV files for further analysis.

5. **CSV Concatenation**:
   - Combine individual CSV files into one for easier data handling.
   - Add a columns indicating the source file for traceability and mapped conditions.

6. **Plotting Summary Graphs**:
   - Individual plots for user defined PIV metrics.
   - Plots for user defined groups and conditions.
   - Averaged plots with error bars for groups sharing the same label.

---

## If you use this tool please cite the original code
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4409178.svg)](https://doi.org/10.5281/zenodo.4409178)



