.SILENT:

all: measure.out website.out

measure.out: measure.cpp
	$(CXX) -std=c++11 -Wall measure.cpp -o measure.out -L../measure -I../measure -l:libmeasure.a

website.out: website.cpp
	$(CXX) -std=c++11 -Wall website.cpp -o website.out

run: measure.out website.out
	@echo "Running the measurement and website rendering loop..."
	@chmod +x run_1_load_profile.sh  # Make sure the shell script is executable
	./run_1_load_profile.sh          # Execute the shell script

# plot:
# 	python3 plot.py power_readings.csv

clean:
	rm -f measure.out website.out power_readings.csv

.PHONY: all run clean plot
