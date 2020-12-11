# DSC180A-Capstone-Project
DSC Capstpne Project: Exploring System Usage Report based on Intel SDK Collector
and Analyzer

## Usage Instructions
To run our current working, we have targets: data, analysis, model. test, all. To run our project, simply type `python run.py [target name]`. 

## Description of Contents
```
PROJECT
├── config
    └── data-params.json
    └── inputs.json
├── notebooks
    └── final_code.ipynb
├── references
    └── README.md
└── src
    ├── analysis(empty folder for now)
        ├── analysis.py
    ├── data
        ├── Collecting_Data
                ├── data.py
                └── example.bat
                └── mouse_input.c
                └── mouse_input.h
                └── mouse_input.sln
                └── mouse_input.dll
        ├── battery_use-000025.db
        ├── battery_data.csv
        ├── V8DEMOANALYZERTASK_20201208153257.V8
        └── Loading_Data.py
    └── model
        └── data.py
├── .gitignore
├── README.md
└── run.py
└── submission.json
```
### `config/`
* `data-params.json`: parameters for loading data
* `inputs.json`:parameters for other analysis

### `notebooks/`
* `final_code.ipynb`: EDA and preprocessing on collected data

### `references/`
* `README.md`: External sources

### `src/`
* `analysis/`: Later for developing data analysis code there
* `data/Collecting_Data/data.py`: code for executing batch file (recommended to use only when you have _xlsdk downloaded and have access to it)
* `data/Collecting_Data/example.bat`: batch script for collecting data
* `data/Collecting_Data/mouse_input.c` /`data/Collecting_Data/mouse_input.h` / `data/Collecting_Data/mouse_input.sln` / `data/Collecting_Data/mouse_input.dll` : our input libraries for collecting data
* `battery_use-000025.db`: Pre-collected Database
* `battery_data.csv`: preprocessed data
* `V8DEMOANALYZERTASK_20201208153257.V8`: data from ALTSDK
* `Loading_Data.py`: Main code for loading and analyzing data

### `model/`
* `data.py`: supervised learning regression model for prediction 


### `run.py`
* Main driver for this project. See cp2.ipynb for a basic analysis for Checkpoint2 on the battery table.
