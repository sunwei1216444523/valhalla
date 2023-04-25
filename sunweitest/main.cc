#include <iostream>
// 引用方式是通过相对于文件在第三方包中的相对目录的路径
#include "src/fileformat.pb.h"
#include "src/osmformat.pb.h"

#include <boost/property_tree/ptree.hpp>
#include "valhalla/tyr/actor.h"

// #include <cpp-statsd-client/StatsdClient.hpp>

int main() {
    boost::property_tree::ptree config;
    // 注释放开就会报错
    valhalla::tyr::actor_t actor(config);

    OSMPBF::HeaderBlock hb;
    std::cout << "Hello World!" << std::endl;
    return 0;
}