# http://gecko.lge.com:8000/Errors/Details/832836
# avro-c++/1.11.3/git/lang/c++/impl/Compiler.cc:304:18: error: possibly dangling reference to a temporary [-Werror=dangling-reference]
# avro-c++/1.11.3/git/lang/c++/impl/Compiler.cc:370:18: error: possibly dangling reference to a temporary [-Werror=dangling-reference]
CXXFLAGS += "-Wno-error=dangling-reference"
