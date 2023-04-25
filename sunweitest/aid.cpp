#include "sunweitest/aid.h"
#include "proto/options.pb.h"

using namespace valhalla;

namespace valhalla {
    void test() {
        auto x = valhalla::Options::Costing_Type::Costing_type_bus;
        if (x == valhalla::Options::Costing_Type::Costing_type_bus) {
            std::cout << "test" << std::endl;
        }
    }
}