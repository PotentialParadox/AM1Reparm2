//
// Created by Justin Smith and Dustin Tracy on 7/5/15.
//

#ifndef AM1REPARM2_TOOLS_H
#define AM1REPARM2_TOOLS_H

#include <stdio.h>
#include <string>
#include <sstream>
#include <fstream>
#include <iostream>

using namespace std;

/*----------------------------------------
         Trim String Function
------------------------------------------*/
inline extern string trim (string line)
{
        string trimmed_line;
        unsigned long first = line.find_first_not_of(" \t\r\n\x0b");
        unsigned long last = line.find_last_not_of(" \t\r\n\x0b") + 1;


        last = last - first;

        //Check for string of blanks and set default to blank
        int length = (int)line.length();
        int cntr = 0;
        for (unsigned long i=0;i<length;++i)
        {
                string test = line.substr(i,1);
                if(test.find_first_of(" \t\r\n\x0b")==0)
                {++cntr;}
        }

        //Trim spaces from front and end of line
        if (line.length() == 0 || (length - cntr) == 0)
        {
                trimmed_line = "";
        } else {
                trimmed_line = line.substr(first,last);
        }

        return trimmed_line;
};

/*----------------------------------------
           Command Execution
------------------------------------------*/
inline extern string exec(string cmd) {
    //cout << "EXEC: " << cmd << endl;
    FILE* pipe = popen(cmd.c_str(), "r");
    if (!pipe) return "ERROR";
    char buffer[4000];
    std::string result = "";
    while(!feof(pipe)) {
        if(fgets(buffer, 4000, pipe) != NULL)
                result += buffer;
    }
    pclose(pipe);
    return result;
};

/*----------------------------------------
           Tilde Replace
------------------------------------------*/
string tildeReplace(string directory)
{
    stringstream tildedDirectory;
    string truncated_directory = directory;
    truncated_directory =  directory.substr(directory.find("home") + 4, 200);
    tildedDirectory << "~" << truncated_directory;
    string newdirectory = tildedDirectory.str();
    string wantedDirectory = trim(newdirectory);
    return wantedDirectory;
}

#endif //AM1REPARM2_TOOLS_H