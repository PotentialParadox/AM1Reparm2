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

/*-------------------------------------------
     	G09 Command Execution
-------------------------------------------*/
inline extern bool execg09(string cmd,string wkdir,int tid) {
	//cout << "EXEC: " << cmd << endl;
	stringstream sscmd,errout;

	errout << wkdir << "gauerr_tid" << tid << ".e";
	sscmd << cmd << " 2> " << errout.str();

	// Open a pipe and run command
	FILE* pipe = popen(sscmd.str().c_str(), "r");
	if (!pipe)
	{
		cout << "Cannot execute gaussian" << endl;
		exit(1);
	}
	char buffer[100];
	string result = "";
	while(!feof(pipe)) {
	    if(fgets(buffer, 100, pipe) != NULL)
	            result += buffer;
	}
	pclose(pipe);

	//Check for gaussian error
	string line;
	bool gerr = false;
	ifstream errfile (errout.str().c_str());
	if (errfile.is_open())
	{
		getline (errfile,line);
		//cout << "FIRSTLINE: " << trim(line) << endl;
		if (trim(line).compare("Error: segmentation violation")==0)
			{gerr=true;}
		errfile.close();
	}
	else cout << "**Unable to open gaussian error file: " << errout.str() << " **"<<endl;

	stringstream rmcmd;
	rmcmd << "rm " << errout.str();

	// Open a pipe and run command
        FILE* pipe2 = popen(rmcmd.str().c_str(), "r");
        if (!pipe2)
		{
			cout << "Cannot execute gaussian" << endl;
			exit(1);
		}
        char buffer2[100];
        std::string result2 = "";
        while(!feof(pipe2)) {
            if(fgets(buffer2, 100, pipe2) != NULL)
                    result2 += buffer2;
        }
        pclose(pipe2);

    	return gerr;
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
