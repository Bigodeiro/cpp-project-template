#include <iostream>
#include <assert.h>
#include "../include/funcoes.hpp"


using namespace std;

int main(int argc, char* argv[]) {

    assert(quadrado(2) == 4);
    assert(quadrado(3) == 9);

    return 0;
}