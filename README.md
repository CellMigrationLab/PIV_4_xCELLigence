# PIV_4_xCELLigence
PIV analysis for xCELLigence timelapse image data

  [![Open In Colab](https://github.com/CellMigrationLab/PIV_4_xCELLigence/blob/main/notebooks/PIV-analysis_96_well_plate.ipynb)

# Particle Image Velocimetry (PIV) Analysis Workflow

## Overview
This repository provides a comprehensive workflow for **Particle Image Velocimetry (PIV)** analysis, enabling the processing of multi-frame TIFF videos to compute and analyze flow metrics. The workflow generates:
- **Flow field visualizations**: Color-coded flow vectors.
- **CSV metrics**: Metrics such as average velocity, direction, and divergence.
- **Summary plots**: Graphs for individual and averaged data with error bars.

---

## If you use this too please cite the original code
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4409178.svg)](https://doi.org/10.5281/zenodo.4409178)

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
   - Add a column indicating the source file for traceability.

6. **Plotting Summary Graphs**:
   - Individual plots for each group and condition.
   - Averaged plots with error bars for groups sharing the same label.





