//
// Created by Dustin Tracy on 7/3/15.
//

#include <fstream>
#include <iostream>
#include "AM1gen.h"
#include "../utils/tools.h"

AM1gen::AM1gen(std::string inputFile)
{
    setInputFile(inputFile);
}

void AM1gen::setInputFile(std::string z) {
    inputFile = z;
}

void AM1gen::printLine() {
    std::string line;
    std::ifstream infile(inputFile);
    if(!infile)
    {
        std::cerr << "Unable to open AM1Original"  << std::endl;
        exit(1);
    }
    getline(infile, line);
    std::cout << line << std::endl;
}

void AM1gen::runGaussian() {
    string x = "g09 FuranAM1.com FuranAM1.log";
    execg09(x, "1", 1);


}
