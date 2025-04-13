1. make
2. make run 
// Seperate files for loading website and measure (because measure requires to run using sudo, but we can't run website loading using sudo because of safety reasons as website will get access to superuser permission)

// The program will load a website on browser and then kills the browser process and then again reloads website on browser and again kills it and keep on repeating (no of realoads time, declared in run.sh)

project-directory/
│
├── final_project_1/      # Main project folder
│   ├── Makefile          # The Makefile for compiling and running the program
│   ├── measure.cpp       # C++ source file for power measurement
│   ├── website.cpp       # C++ source file for opening and closing the website
│   ├── run.sh            # Shell script for automating the process
│   └── power_readings.csv # Output CSV file for power readings
│
└── measure/              # Measure-related folder
    ├── measure.cpp       # C++ source file for power measurement
    ├── libmeasure.a      # Static library for power measurement
    └── ...               # Other measure-related files
