#include <iostream>
#include <cstdlib>
#include <thread>
#include <chrono>

int main() {
    std::string url = "https://www.awwwards.com/";

    #ifdef _WIN32
        system(("start " + url).c_str()); // Windows
    #elif __APPLE__
        system(("open " + url).c_str());  // macOS
    #else
        system(("xdg-open " + url).c_str());  // Linux
    #endif
    // std::this_thread::sleep_for(std::chrono::seconds(5));
    return 0;
}
