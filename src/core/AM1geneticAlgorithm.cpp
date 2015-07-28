//
// Created by Dustin Tracy on 7/3/15.
//

#include <fstream>
#include <iostream>
#include <omp.h>
#include <sstream>
#include "AM1geneticAlgorithm.h"
#include "../utils/tools.h"
#include "AM1gene.h"

using std::cout;
using std::endl;
using std::cerr;

AM1geneticAlgorithm::AM1geneticAlgorithm(int a, char *b[]) : inputFile("input.ipt"), outputFile("output.opt")
{
    argumentReader(a, b);
    inputReader();
    AM1gene furan(inputFile);
}

void AM1geneticAlgorithm::runGaussian(const std::string &infile, const std::string &outfile) const
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

void AM1geneticAlgorithm::inputReader()
{
    cout << "Opening input file " << inputFile << endl;
    ifstream infile(inputFile.c_str());
    if (!infile)
    {
        cerr << "Cannot open input file" << endl;
    }
    else
    {
        cout << "input file open successfully" << endl;
        string s_infile, s_word;
        while (getline(infile, s_infile))
        {
            istringstream stream(s_infile);
            while (stream >> s_word)
            {
                // Determine the number of processors
                if (s_word == "nproc:")
                {
                    stream >> nproc;
                }
                /* Find the name of the AM1 file and the
                 * target file, note that I removed the
                 * suffixes of both */
                else if (s_word == "TargetFilename:")
                {
                    string target;
                    stream >> target;
                    target = removeSuffix(target);
                    targetFile = target;
                }
                else if (s_word == "AM1GauFilename:")
                {
                    string originalAM1;
                    stream >> originalAM1;
                    originalAM1 = removeSuffix(originalAM1);
                    am1orig = originalAM1;
                }
                else if (s_word == "N:")
                {
                    stream >> population;
                }
            }
        }
    }
}

void AM1geneticAlgorithm::argumentReader(int b, char *a[])
{
    string argument;
    string arguments;
    for (int i = 0; i != b; ++i)
    {
        argument = a[i];
        arguments += argument + " ";
    }
    cout << arguments << endl;

    // Find the input and output files
    istringstream stream(arguments);
    while (stream >> argument)
    {
        if (argument == "-i")
        {
            stream >> inputFile;
        }
        if (argument == "-o")
        {
            stream >> outputFile;
        }
    }
}


