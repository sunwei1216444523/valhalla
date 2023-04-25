#include "sunweitest/aid.h"

using namespace valhalla;

namespace valhalla {
    const std::string& sunwei_Options_Format_Enum_Name(const Options::Format match) {
    static const std::string empty;
    static const std::unordered_map<int, std::string> formats{
        {Options::json, "json"},
        {Options::gpx, "gpx"},
        {Options::osrm, "osrm"},
        {Options::pbf, "pbf"},
    };
    auto i = formats.find(match);
    return i == formats.cend() ? empty : i->second;
    }
}