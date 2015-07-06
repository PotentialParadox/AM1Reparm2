//
// Created by Dustin Tracy on 7/3/15.
//

#ifndef AM1REPARM2_AM1GEN_H
#define AM1REPARM2_AM1GEN_H

#include <string>

class AM1gen
{
public:
    AM1gen(std::string inputFile);

    void setInputFile(std::string z);

    void printLine();

    void runGaussian();

private:
    std::string inputFile;

};


#endif //AM1REPARM2_AM1GEN_H
