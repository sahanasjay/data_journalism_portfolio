# Sahana's Data Journalism Work Samples

* [Overview](https://github.com/sahanasjay/data_journalism_portfolio/tree/dev#overview)
* [Coding a webscraper](https://github.com/sahanasjay/data_journalism_portfolio/tree/dev#coding-a-web-scraper-for-library-of-congress-website)
* [Working with APIs, creating dynamic directories — and more](https://github.com/sahanasjay/data_journalism_portfolio/tree/dev#working-with-apis-creating-dynamic-directory-structures-automating-guide-text-and-binding-pdfs)
* [Data analysis](https://github.com/sahanasjay/data_journalism_portfolio/tree/dev#analysis-of-national-osha-records) 
* [In-depth data cleaning](https://github.com/sahanasjay/data_journalism_portfolio/tree/dev#victim-data-cleaning)
* [Data story](https://github.com/sahanasjay/data_journalism_portfolio#analysis-of-college-park-housing-prices)
* [Graphics fact-check](https://github.com/sahanasjay/data_journalism_portfolio#senior-edition-fact-check)

## Overview

This repository exists to show examples of the code I have written as a data journalist at the Howard Center for Investigative Journalism and as deputy managing editor for The Diamondback.

The code samples are chosen to display my growth since first learning basic R in Fall 2020. Since then, I've written a web scraper in Python, worked with APIs in R and secured positions interning at the Howard Center for Investigative Journalism and The Washington Post.   

## Coding a web scraper for Library of Congress website

This code was written as part of an ongoing Howard Center investigation into historically white-owned newspapers’ role in supporting racial terror.

Starting with a list of current newspaper titles pulled down from the Library of Congress API, [loc_scraper.ipnyb](https://github.com/sahanasjay/data_journalism_portfolio/blob/dev/loc_webscraper/loc_scraper_hana.ipynb) collects information on each paper's antecedents — their titles, the dates they ran, the url and Library of Congress cataloguing number associated with each one. The result is a newspaper "family tree" of sorts that connects each current title with its historical relatives.  We joined this dataset with lynching victim data, gaining insight into which papers may have covered lynchings.

## Working with APIs, creating dynamic directory structures, automating guide text and binding pdfs

In [loc_api_pdf_download_combine.Rmd](https://github.com/sahanasjay/data_journalism_portfolio/blob/main/loc_api_pdf_download_combine/loc_pdf_download_and_package.Rmd), I wrote a function to hit the Library of Congress’ API and pull down newspaper page pdfs or ocr text from the 60-day window surrounding a lynching date. As they’re downloaded, pdfs and ocr text are saved into a dynamic folder structure that reflects the newspaper issue each file belongs to. I used a proxy server to avoid library of congress rate limits, and implemented parallel processing to speed up the download process. I practiced error handling, writing if/else statements to skip over pages with a 404 status code.

I used lapply and purrr map functions to replace for loops in my work. I experimented with the parallel package, learning how to write parallel processing code that will work on mac, linux and windows operating systems.   

I wrote another function to combine the downloaded pdfs into packets, complete with automatically produced guide text pages that contained information about the contents of each packet.  

To see my code, go to [loc_api_pdf_download_combine.Rmd](https://github.com/sahanasjay/data_journalism_portfolio/blob/main/loc_api_pdf_download_combine/loc_pdf_download_and_package.Rmd). To see output from the pdf download function, check out [newspaper_pdfs_example_set](https://github.com/sahanasjay/data_journalism_portfolio/tree/main/loc_api_pdf_download_combine/newspaper_pdfs_example_set). To see output from the pdf packaging code, go to [pdf_packets_bound_example](https://github.com/sahanasjay/data_journalism_portfolio/tree/main/loc_api_pdf_download_combine/pdf_packets_bound_example).

## Analysis of national OSHA records

The weighted comparative analysis in [OSHA_investigation_samples.Rmd](https://github.com/sahanasjay/data_journalism_portfolio/blob/main/howard_center_OSHA_investigation_examples/OSHA_investigation_samples.Rmd) on OSHA complaints in federal and state-plan states returned one of the key findings in the Howard Center for Investigative Journalism's stories on worker safety during COVID-19.

The analysis I did to get a count of outbreaks in New Mexico stores revealed that nearly all the Walmart-owned stores in the state had seen an associated coronavirus outbreak.

Working on this project  exponentially increased my data analysis skills: in addition to learning how to create for loops and functions, I grew more comfortable with baseR, the tidyverse package, the lubridate package, the janitor package and many others.

I have a byline on the project, which was published on [AP](https://apnews.com/article/coronavirus-pandemic-health-business-caf5e31d883a18deae6cd367a5ee8978) and picked up by several notable outlets — including The Washington Post. Read the full version on the [Howard Center's website](https://cnsmaryland.org/2021/05/12/as-walmart-sales-soared-workers-got-scant-covid-19-protection-from-osha/).

## Victim data cleaning

I wrote the script in [victim_data_cleaning.Rmd](https://github.com/sahanasjay/data_journalism_portfolio/blob/main/victim_data_cleaning/victims_newspaper_lineage%20copy.Rmd) to scrub and combine three sets of data on lynching victims and people threatened with lynching. The project deepened my understanding of the tidyverse and janitor packages — baseR functions, too.


## Analysis of College Park housing prices  

Even before I began learning how to code, I was writing data-driven stories. [This one](https://dbknews.com/2019/12/29/umd-college-park-student-housing-rent-prices-expensive-vacancy-commons-varsity-view/) centers on the astronomical student housing prices in College Park, Maryland — and why they're unlikely to come down anytime soon.

I researched and analyzed historical and current price ranges for several of the most popular housing developments in the area, finding that monthly rent went up by as much as $30 for some developments in 2019.

Read the [story](https://dbknews.com/2019/12/29/umd-college-park-student-housing-rent-prices-expensive-vacancy-commons-varsity-view/).


## Senior edition fact-check

To fact-check [two graphics](https://dbknews.com/2021/04/27/senior-edition-looking-back-survey/) using survey data for The Diamondback's 2021 Senior Edition, I loaded and cleaned the data and performed some analysis on it.

I wrote and commented all code for the fact-check.

See my work in [senior_edition_data.Rmd](https://github.com/sahanasjay/data_journalism_portfolio/blob/main/senior_edition_data_fact_check/senior_edition_data.Rmd). Check out the graphics on The Diamondback's [website](https://dbknews.com/2021/04/27/senior-edition-looking-back-survey/).
