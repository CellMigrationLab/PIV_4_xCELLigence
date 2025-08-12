// ----------------------------------------------------------------------------- 
// ImageJ Macro Script: Group and Concatenate TIFF Files by Identifier with Timestamp Sorting
// Author: Joanna Pylvänäinen
// Description: Åbo Akademi University
//
// This script processes a folder of TIFF (.tif) images by:
// - Grouping them by identifier (well + field of view, e.g., A1_1W)
// - Sorting each group by chronological timestamp extracted from filename
// - Concatenating each group into a stack
// - Saving the result into a separate output folder
// -----------------------------------------------------------------------------

// Specify the input and output folders
inputFolder = getDirectory("input");
outputFolder = getDirectory("output");

setBatchMode(true);

// Function to pad a string to a given length with leading characters
function padLeft(text, length, padChar) {
    while (lengthOf(text) < length) {
        text = padChar + text;
    }
    return text;
}

// Function to extract a padded timestamp key (hhmmss) for chronological sorting
function extractTimeKey(filename) {
    parts = split(filename, "_");
    timeString = parts[1]; // e.g., 105h28m56s

    hIndex = indexOf(timeString, "h");
    mIndex = indexOf(timeString, "m");
    sIndex = indexOf(timeString, "s");

    hours = substring(timeString, 0, hIndex);
    minutes = substring(timeString, hIndex + 1, mIndex);
    seconds = substring(timeString, mIndex + 1, sIndex);

    hours = padLeft(hours, 3, "0");
    minutes = padLeft(minutes, 2, "0");
    seconds = padLeft(seconds, 2, "0");

    return hours + minutes + seconds; // e.g., 1052856 becomes 1052856
}

// Function to find the index of an item in an array
function findIndex(array, item) {
    for (i = 0; i < array.length; i++) {
        if (array[i] == item) {
            return i;
        }
    }
    return -1;
}

// Get all TIFF files in the folder
fileList = getFileList(inputFolder);
nFiles = fileList.length;

if (nFiles == 0) {
    exit("No TIFF files found in the selected folder.");
}

// Organize files into groups based on identifiers (e.g., A1_1W, B2_W2, etc.)
groupIDs = newArray();
fileGroups = newArray();

for (i = 0; i < nFiles; i++) {
    if (endsWith(fileList[i], ".tif")) {
        filename = fileList[i];
        parts = split(filename, "_");
        identifier = parts[2] + "_" + replace(parts[3], ".tif", "");

        index = findIndex(groupIDs, identifier);
        if (index == -1) {
            groupIDs = Array.concat(groupIDs, identifier);
            fileGroups = Array.concat(fileGroups, filename);
        } else {
            fileGroups[index] = fileGroups[index] + "," + filename;
        }
    }
}

// Process each group
for (g = 0; g < groupIDs.length; g++) {
    groupID = groupIDs[g];
    fileGroup = split(fileGroups[g], ",");

// Create key array for sorting
keyArray = newArray(fileGroup.length);
for (k = 0; k < fileGroup.length; k++) {
    keyArray[k] = extractTimeKey(fileGroup[k]);
}

// Bubble sort both keyArray and fileGroup
for (i = 0; i < keyArray.length - 1; i++) {
    for (j = 0; j < keyArray.length - i - 1; j++) {
        if (keyArray[j] > keyArray[j + 1]) {
            // Swap keys
            tempKey = keyArray[j];
            keyArray[j] = keyArray[j + 1];
            keyArray[j + 1] = tempKey;

            // Swap files in same order
            tempFile = fileGroup[j];
            fileGroup[j] = fileGroup[j + 1];
            fileGroup[j + 1] = tempFile;
        }
    }
}


    // Print sorted list
    print("Processing Identifier: " + groupID);
    for (f = 0; f < fileGroup.length; f++) {
        print(" - " + fileGroup[f]);
    }

    // Concatenate images
    run("Close All");
    for (j = 0; j < fileGroup.length; j++) {
        filePath = inputFolder + fileGroup[j];
        open(filePath);

        if (j == 0) {
            newName = groupID;
            rename(newName);
        } else {
            run("Concatenate...", "title=" + newName + " image1=" + newName + " image2=" + fileGroup[j]);
        }
    }

    // Save result
    outputFilePath = outputFolder + groupID + ".tif";
    saveAs("Tiff", outputFilePath);
    print("Saved: " + outputFilePath);
}

print("Processing complete!");
