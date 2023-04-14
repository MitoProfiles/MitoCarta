README
================

# MitoCarta

The goal of {MitoCarta} is to provide a better interaction with three
data frames that can be found in the original MitoCarta. Each data frame
corresponds to a different kind of data:

Firstly, we have a dataframe called “A_Human_MitoCarta3,” which helps us
see all the genes present in human mitochondria.

Then we have another dataframe called “B_Human_All_Genes,” where we can
find all the genes present in the human genome.

Finally, we also have a dataframe called “C_MitoPathways” containing all
the pathways present in the mitochondria.

## Installation

You can install the package `{MitoCarta}` from
[GitHub](https://github.com/).

Make sure you have the `{remotes}` package installed:

``` r
install.packages('remotes')
```

Now you can install `{MitoCarta}` from [GitHub](https://github.com/)
with:

``` r
remotes::install_github("MitoProfiles/MitoCarta")
```

## Using the Dataframes

To learn more about what is contained in each dataframe in {MitoCarta},
use the following command in your R console:

``` r
# Access to the hepl page of the package
??mitocarta_data
```

To run one of the dataframes included in `{MitoCarta}` use the command:

``` r
# to run the dataframe with all mitochondria genes
mitocarta::mitocarta_data$A_Human_MitoCarta3

# to run the dataframe with human genoma
mitocarta::mitocarta_data$B_Human_All_Genes

# to run the daaframe with mitochondria patways
mitocarta::mitocarta_data$C_MitoPathways
```

To analyze data from a specific column in a dataframe included in
{MitoCarta}, simply add a “\$” in front of the dataframe’s name. For
example, to see what the column “Symbol” in the dataframe
“A_Human_MitoCarta3” contains, use the following command:

``` r
# to run a specific column of a dataframe
mitocarta::mitocarta_data$A_Human_MitoCarta3$Symbol
```
