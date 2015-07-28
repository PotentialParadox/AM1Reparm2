//
// Created by Dustin Tracy on 7/3/15.
//

#ifndef AM1REPARM2_AM1GEN_H
#define AM1REPARM2_AM1GEN_H

#include <string>

class AM1geneticAlgorithm
{
public:

    AM1geneticAlgorithm(int a, char *b[]);

private:

    void argumentReader(int b, char *a[]);
    void inputReader();
    void runGaussian(const std::string &, const std::string &) const;

    std::string inputFile;
    std::string outputFile;
    std::string am1orig;  // Original AM1 input file
    std::string targetFile;  // Original target file
    int nproc; // Number of processors
    int population;  // Population size
    int ngen;  // Number of generations

};


#endif //AM1REPARM2_AM1GEN_H
