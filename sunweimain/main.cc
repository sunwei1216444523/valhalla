#include <iostream>

#include "sunweitest/aid.h"
// 引用方式是通过相对于文件在第三方包中的相对目录的路径
// #include "src/fileformat.pb.h"
// #include "src/osmformat.pb.h"

// #include <boost/property_tree/ptree.hpp>
// #include "valhalla/tyr/actor.h"

// #include <cpp-statsd-client/StatsdClient.hpp>
#include "proto/options.pb.h"

using namespace valhalla;

int main() {
    // boost::property_tree::ptree config;
    // 注释放开就会报错
    // valhalla::tyr::actor_t actor(config);
    // auto x = valhalla::sunwei_Options_Format_Enum_Name(valhalla::Options::json);

    // enum to string
    Costing::Type type1 = Costing::auto_;
    std::string type_str = Costing_Type_Name(type1);

    // string to enum
    Costing::Type ret_type;
    bool ret = Costing_Type_Parse(type_str, &ret_type);
    if (ret) {
        std::cout << "yes!! "<< std::endl;
    } else {
        std::cout << "no!! "<< std::endl;
    }

    // OSMPBF::HeaderBlock hb;
    std::cout << "Hello World! " << type_str << std::endl;
    return 0;
}