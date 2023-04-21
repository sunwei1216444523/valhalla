#include <iostream>
// 引用方式是通过相对于文件在第三方包中的相对目录的路径
#include "src/fileformat.pb.h"
#include "src/osmformat.pb.h"
#include "valhalla/config.h"

#include <lauxlib.h>

// #include <cpp-statsd-client/StatsdClient.hpp>

int main() {
    char version_[16];
    strncpy(version_, PACKAGE_VERSION, 16);

    OSMPBF::HeaderBlock hb;
    std::cout << "Hello World!" << std::endl;
    return 0;
}