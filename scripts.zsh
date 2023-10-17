alias compile='function _compile(){ g++ -std=c++11 -O2 -Wall "$1" -o "${2:-a.out}" && ./"${2:-a.out}"; };_compile'
