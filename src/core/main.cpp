//
//  AM1 Reparameterization Version using  the GAlib libraries
//
//  written July 3rd 2015
//  by Dustin Tracy and Justin Smith
//  University of Florida

#include <iostream>
#include "AM1gen.h"

using namespace std;


int main()
{
    AM1gen Furan("FuranAM1.com");
    Furan.runGaussian();

    return 0;
}