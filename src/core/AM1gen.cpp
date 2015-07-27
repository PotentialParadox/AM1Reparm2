//
// Created by Dustin Tracy on 7/3/15.
//

#include <fstream>
#include <iostream>
#include <omp.h>
#include <sstream>
#include "AM1gen.h"
#include "../utils/tools.h"

using std::cout;
using std::endl;
using std::cerr;

AM1gen::AM1gen(int a, char *b[])
{
    argumentReader(a, b);

/*    cout << "Begining genetic algorithm" << endl;
    int njobs = 8;
#pragma omp parallel
    {
        int nthrds = omp_get_num_threads();
        int i = omp_get_thread_num();
        for (i ; i < njobs; i =i + nthrds)
        {
            stringstream jobi;
            stringstream jobo;
            jobi << inputFile << ".com";
            jobo << inputFile << "_" << i << ".log";
            runGaussian(jobi.str(), jobo.str());
        }
    }
*/

}

void AM1gen::runGaussian(const std::string &infile, const std::string &outfile) const
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

void AM1gen::inputReader(const std::string &iFile)
{
    cout << "Opening input file " << iFile << endl;
    ifstream infile(iFile.c_str());
    if (!infile)
    {
        cerr << "Cannot open input file" << endl;
    }
    else
    {
        cout << "input file open successfully" << endl;
    }
}


void AM1gen::argumentReader(int b, char *a[])
{
    stringstream arguments;
    for (int i = 0; i != b; ++i)
    {
        arguments <<
    }
    cout << arguments << endl;

    // Find the input file

}
