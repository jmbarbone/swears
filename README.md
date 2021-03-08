
<!-- README.md is generated from README.Rmd. Please edit that file -->

# swears <a href="https://en.wikipedia.org/wiki/Parental_Advisory"><img src="man/figures/Parental_Advisory_label.svg" align="right" height="80" /></a>

<!-- badges: start -->
<!-- badges: end -->

The goal of `swears` is to add some colorful language to your coding.

## Installation

You can install the developmental version of `swears` from
[GitHub](github.com) with:

``` r
remotes::install_github("jmbarbone/swears")
```

## Example

``` r
library(swears)
swear()
#> Fuck, this code sucks
```

Want to not be so offensive?

``` r
swear("censored", id = 1)
#> F**k!
swear("alternative", id = 1)
#> Frick!
```

Need to censor anything else?

``` r
censor("What the fuck is this bullshit?")
#> [1] "What the f**k is this bullsh*t?"
```

Add cursing to your error messages:

``` r
> options(swear.method = "alternative")
> swear_on_stop()
successfully updated error option
> stop()
Error: 
how the heck?

> options(swear.method = "censored")
> df[1]
Error in df[1] : object of type 'closure' is not subsettable
You're not f*cking subsettable!
```

## Acknowledgments

-   Guilherme Hermanson’s [cuRse](https://github.com/G-Hermanson/cuRse)
    package.
-   `stats::df`
