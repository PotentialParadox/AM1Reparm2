//
// Created by Dustin Tracy on 7/3/15.
//

#ifndef AM1REPARM2_AM1GEN_H
#define AM1REPARM2_AM1GEN_H

#include <string>

class AM1gen
{
public:

    AM1gen(int a, char *b[]);

private:

    void argumentReader(int b, char *a[]);

    void inputReader(const std::string &iFile);

    void runGaussian(const std::string &, const std::string &) const;

    std::string inputFile;
    std::string parmeters;

};


#endif //AM1REPARM2_AM1GEN_H
