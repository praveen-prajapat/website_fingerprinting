#include <iostream>
#include <cstdlib>
#include "../measure/measure.h"

int main() {
    init();
    Measurement start = measure();
    std::cout << "RAPL_READOUT: " << start.rapl_readout << std::endl;
    std::cout << "TIMESTAMP: " << start.time_stamp << std::endl;
    return 0;
}
