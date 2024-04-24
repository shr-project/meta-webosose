# http://gecko.lge.com:8000/Errors/Details/832842
# git/third_party/openthread/repo/src/core/border_router/routing_manager.hpp:615:11: error: 'ot::BorderRouter::RoutingManager::DiscoveredPrefixTable' declared with greater visibility than the type of its field 'ot::BorderRouter::RoutingManager::DiscoveredPrefixTable::mEntryTimer' [-Werror=attributes]
CXXFLAGS += "-Wno-error=attributes"
