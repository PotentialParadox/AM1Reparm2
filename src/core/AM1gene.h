//
// Created by Dustin Tracy on 7/28/15.
// Stores the information of each gene
//

#ifndef AM1REPARM2_AM1GENE_H
#define AM1REPARM2_AM1GENE_H

#include <string>
#include <vector>

/*
 *      The Standard AM1 gene that will be used for evolution. Note that
 *      the original AM1 and Target file have there own "genes" with
 *      their corresponding classes below AM1gene
 */

class AM1gene
{
public:
    /* The constructor parameters are the fileName minus the suffix (for example
     * "furan" instead of "furan.com"), the original AM1 gene, and the target */
    AM1gene(const std::string &filename, const AM1Original &, const Target &);


    void doFitness();

    void mutate();

    AM1gene cross();

private:
    void runGaussian(const std::string &, const std::string &) const;

    void coordReader();

    void geneReader();

    void createGaussianInput();

    std::vector<float> evReader();

    std::vector<float> forceReader();

    std::vector<float> chargeReader();

    std::string fileName;
    std::string gaussianInput;
    std::string coordinates;
    std::vector<float> gene;
    float fitness;
};

class AM1Original
{
public:
    AM1Original();

private:
};

class Target
{
public:
};


#endif //AM1REPARM2_AM1GENE_H
