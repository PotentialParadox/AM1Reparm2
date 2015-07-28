//
// Created by fury on 7/28/15.
//

#include <iostream>
#include <string>
#include "AM1gene.h"
#include "../utils/tools.h"

using std::string;
using std::cout;
using std::endl;

AM1gene::AM1gene(const std::string &filename,
                 const AM1Original &orig, const Target &target) : fileName(filename)
{ };

void AM1gene::runGaussian(const std::string &infile, const std::string &outfile) const
{
    string efile = outfile + ".e";
    string x = "g09 " + infile + " " + outfile + " 2> " + efile;
    exec(x);

    // Check for segmentation fault
    string line;
    ifstream errorfile(efile.c_str());
    if (getline(errorfile, line) && line == "Error: segmentation violation")
    {
        cout << "Error: Segmentation fault" << endl;
    }

    // Remove created error file
    x = "rm " + efile;
    exec(x);
}


