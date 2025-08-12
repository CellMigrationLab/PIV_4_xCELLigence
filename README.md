# Particle Image Velocimetry (PIV) Analysis Workflow for xCELLigence Timelapse Data

## Overview
This repository provides an end-to-end **Particle Image Velocimetry (PIV)** analysis pipeline tailored for **xCELLigence timelapse image data**, with potential applicability to other multi-frame TIFF video sources. The workflow automates preprocessing, PIV computation, visualization, metric extraction, result compilation, condition mapping, and comparative plotting.

The notebook is designed to run in **Google Colab** with integrated Google Drive support for input and output handling.

To run the notebook click here: [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/CellMigrationLab/PIV_4_xCELLigence/blob/main/notebooks/PIV-analysis_96_well_plate.ipynb)

---

## Expected Input Data
- **Time-lapse multi-frame TIFF files** (RGB or grayscale).
- **File naming**: Well/identifier at the start of the filename (e.g., `A3_frames0-60` or `A3_W2_frames0-60` or just the identifier).
- **RGB images** are automatically converted to grayscale.

---

## Workflow Outputs
1. **Flow Field Visualizations**
   - Frame-by-frame color-coded flow vectors.
   - Summary flow fields for user-defined frame intervals.
   - Overall summary flow field for the full video.

2. **PIV Metrics (per frame pair)**
   - Average velocity (µm/min)
   - Maximum flow magnitude (µm/min)
   - Average flow direction (degrees)
   - Divergence (1/min)

3. **Plots**
   - Individual plots for each video and metric.
   - Condition-mapped individual and averaged plots.
   - Error-bar plots for grouped conditions.

4. **CSV Data**
   - One per video containing all calculated metrics.
   - A combined CSV for all processed videos with condition mapping.

---

## Key Features

### 1. Dependencies Installation and Imports
- Automatic installation of required libraries:  
  `numpy`, `opencv-python`, `matplotlib`, `openpiv`, `tifffile`, `natsort`, `scipy`, `pandas`, `ipywidgets`
- Force-reinstall of **NumPy** for compatibility with `openpiv`.

---

### 2. Data Handling
- **Google Drive integration** for accessing and saving files.
- Configurable input/output folder paths.
- Automatic file counting for verification.

---

### 3. Video Loading and Preprocessing
- Supports multi-frame RGB and grayscale TIFFs.
- Automatic grayscale conversion for RGB frames.
- Modularized functions for loading and processing frames.

---

### 4. PIV Computation
- Parameters configurable via UI in Colab:
  - `pixel_size_um` – physical calibration
  - `time_interval_min` – time per frame
  - `window_size`, `overlap`, `search_area_size` – PIV grid parameters
  - `summary_interval` – cumulative frame count before summary plots are generated
- **OpenPIV**-based computation using `extended_search_area_piv`.
- Outlier removal with local mean replacement.

---

### 5. Metrics Calculation
For each frame pair:
- Calibrated **u** and **v** velocity components.
- Magnitude and direction of flow.
- Divergence from spatial velocity gradients.
- Metrics stored with timestamps in structured dictionaries before CSV export.

---

### 6. Visualization
- **Per-frame flow vectors** saved as `.tiff`.
- **Interval summary flows** saved periodically.
- **Full-video cumulative flow field** saved at the end.
- HSV colormap based on flow direction.

---

### 7. CSV Management
- Each video gets an individual `_flow_summary.csv`.
- **Concatenation function** merges all individual CSVs into a single `combined_results.csv`.
- Adds `"CSV File Name"` column for traceability.

---

### 8. Condition Mapping
- Extracts identifiers from filenames (e.g., `A4`, `A4_1W`).
- Interactive **ipywidgets** interface for mapping identifiers to conditions.
- Saves updated `combined_results.csv` with `"Condition"` column.

---

### 9. Plotting Functions

#### 9.1 Individual Video Plots
For each video CSV:
- Average Velocity (µm/min)
- Average Direction (degrees)
- Maximum Flow Magnitude (µm/min)
- Divergence (1/min)
- Styled with markers, legends, and axis labels.

#### 9.2 Individual Condition Plots
- User-selected conditions and metrics.
- Optional smoothing (`uniform_filter1d`).
- Output in PNG and PDF formats.

#### 9.3 Averaged Condition Plots
- Groups data by condition and averages across replicates.
- Error bars represent standard deviation.
- Supports smoothing and custom graph naming.

---

## Usage Instructions

1. **Open the Notebook in Google Colab**  
   - Click the provided link or upload to Colab manually.

2. **Mount Google Drive**  
   - Connect your Google Drive for input/output file access.

3. **Set Input/Output Paths**  
   - Specify folders containing `.tif/.tiff` videos and desired output location.

4. **Calibrate and Configure Parameters**  
   - Set physical calibration, PIV grid size, overlap, and summary interval.

5. **Run Analysis**  
   - The notebook processes each video sequentially, outputs visualizations, and saves metrics.

6. **Concatenate CSV Files**  
   - Combine all individual CSVs into one for easier downstream processing.

7. **Map Experimental Conditions**  
   - Use the interactive widget to link file identifiers to condition names.

8. **Generate Plots**  
   - Create individual, comparative, or averaged plots with or without error bars.

---

## Dependencies
- Python 3.x
- NumPy
- OpenCV
- Matplotlib
- OpenPIV
- tifffile
- natsort
- pandas
- scipy
- ipywidgets


---

## If you use this tool please cite the original code
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4409178.svg)](https://doi.org/10.5281/zenodo.4409178)



