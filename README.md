# Sahana's Data Journalism Work Samples

* [Overview](https://github.com/sahanasjay/data_journalism_portfolio#overview)
* [Coding a webscraper](https://github.com/sahanasjay/data_journalism_portfolio#coding-a-web-scraper-for-the-library-of-congress-website)
* [Working with APIs, creating dynamic directories — and more](https://github.com/sahanasjay/data_journalism_portfolio#working-with-apis-creating-dynamic-directory-structures-automating-guide-text-and-binding-pdfs)
* [Creating a Personal Website](https://github.com/sahanasjay/data_journalism_portfolio/blob/main/README.md#creating-my-personal-website)
* [Analysis of national OSHA records](https://github.com/sahanasjay/data_journalism_portfolio#analysis-of-national-osha-records) 
* [In-depth data cleaning](https://github.com/sahanasjay/data_journalism_portfolio#in-depth-cleaning-on-lynching-victim-data)
* [Pitching and writing a data-driven story](https://github.com/sahanasjay/data_journalism_portfolio#analysis-of-college-park-housing-prices)
* [Data fact-check](https://github.com/sahanasjay/data_journalism_portfolio#senior-edition-fact-check)

## Overview

Hi, I'm Sahana. 👋

I created this repository to display examples of the code I've written as a data journalist at the Howard Center for Investigative Journalism and as deputy managing editor for The Diamondback.

I chose code samples that best display my growth since I started learning basic R in Fall 2020. Since then, I've written a web scraper in Python, worked with APIs in R and secured positions interning at the Howard Center for Investigative Journalism and The Washington Post.   

## Coding a web scraper for the Library of Congress' website

I co-wrote [loc_scraper.ipnyb](https://github.com/sahanasjay/data_journalism_portfolio/blob/main/loc_webscraper/loc_scraper.ipynb), a scraper that uses a list of current newspaper titles from the Library of Congress' API to collect information on each paper's antecedents: their titles, the dates they ran, their URLS and their Library of Congress cataloguing numbers. I came up with a way to check and nix duplicate links from the output dataframes. The result is a newspaper "family tree"; a dataset connecting each current title with its historical relatives.  

Scraping this data was a crucial first step to finding out which current papers may have once covered lynching. The script was my first foray into Python — but my colleague and I had a working scraper running in about a week.

I wrote this code for a Howard Center investigation into historically white-owned newspapers’ role in supporting and inciting racial terror. The project will be published in December.

## Working with APIs, creating dynamic directory structures, automating guide text and binding pdfs

In [loc_api_pdf_download_combine.Rmd](https://github.com/sahanasjay/data_journalism_portfolio/blob/main/loc_api_pdf_download_combine/loc_pdf_download_and_package.Rmd), I wrote code that uses the Library of Congress' API to locate and download newspaper page PDFs and OCR text from a 60-day window surrounding a lynching date. As they're downloaded, a custom function saves the files into a dynamic folder structure that reflects the newspaper each file belongs to. Another custom function binds the PDFs into packets, adding automated guidetext to help reporters navigate the contents of each booklet. I practiced error handling and experimented with parallell processing, making my download code more efficient.

My work helped kick off the search for lynching coverage in newspapers, part of a Howard Center investigation into historically white-owned newspapers’ role in supporting and inciting racial terror. The project will be published in December. 

To see my code, go to [loc_api_pdf_download_combine.Rmd](https://github.com/sahanasjay/data_journalism_portfolio/blob/main/loc_api_pdf_download_combine/loc_pdf_download_and_package.Rmd). To see output from the pdf download function, check out [newspaper_pdfs_example_set](https://github.com/sahanasjay/data_journalism_portfolio/tree/main/loc_api_pdf_download_combine/newspaper_pdfs_example_set). To see output from the pdf packaging code, go to [pdf_packets_bound_example](https://github.com/sahanasjay/data_journalism_portfolio/tree/main/loc_api_pdf_download_combine/pdf_packets_bound_example/current_title_Daily%20herald/victim_1936-08-14).

## Creating my personal website 

I created a personal website using ZURB's Foundation 6. I designed and coded the responsive site myself using HTML, CSS and basic JavaScript. Check it out [here](https://sahanasjay.github.io). 

## Analysis of national OSHA records

The weighted comparative analysis in [OSHA_investigation_samples.Rmd](https://github.com/sahanasjay/data_journalism_portfolio/blob/main/OSHA_investigation_examples/OSHA_investigation_samples.Rmd) on OSHA complaints in federal and state-plan states returned one of the key findings in the Howard Center for Investigative Journalism's stories on worker safety during COVID-19.

The analysis I did to get a count of outbreaks in New Mexico stores revealed that nearly all the Walmart-owned stores in the state had seen an associated coronavirus outbreak.

Working on this project expanded my data analysis skills: In addition to learning how to create for loops and functions, I grew more comfortable with baseR, the tidyverse package, the lubridate package, the janitor package and many others.

I have a byline on the project, which was published on [AP](https://apnews.com/article/coronavirus-pandemic-health-business-caf5e31d883a18deae6cd367a5ee8978) and picked up by several notable outlets — including The Washington Post. Read the full version on the [Howard Center's website](https://cnsmaryland.org/2021/05/12/as-walmart-sales-soared-workers-got-scant-covid-19-protection-from-osha/).

## In-depth cleaning on lynching victim data 

I wrote the code in [victim_data_cleaning.Rmd](https://github.com/sahanasjay/data_journalism_portfolio/blob/main/victim_data_cleaning/victims_data_cleaning.Rmd) to scrub and combine three sets of data on lynching victims and people threatened with lynching. The project deepened my understanding of baseR functions, the tidyverse and janitor. 

## Analysis of College Park housing prices  

Even before I began learning how to code, I was writing data-driven stories. I wrote [this one](https://dbknews.com/2019/12/29/umd-college-park-student-housing-rent-prices-expensive-vacancy-commons-varsity-view/) as a city development reporter for my college paper. The piece centers on the astronomical student housing prices in College Park, Maryland — and why they're unlikely to come down anytime soon.

I researched and analyzed historical and current price ranges for several of the most popular housing developments in the area, finding that monthly rent went up by as much as $30 for some developments in 2019.

Read the [story here](https://dbknews.com/2019/12/29/umd-college-park-student-housing-rent-prices-expensive-vacancy-commons-varsity-view/).

## Senior edition fact-check

I fact-checked [two graphics](https://dbknews.com/2021/04/27/senior-edition-looking-back-survey/) using survey data for The Diamondback's 2021 Senior Edition. I loaded and cleaning the data and performed some analysis on it.

See my work in [senior_edition_data.Rmd](https://github.com/sahanasjay/data_journalism_portfolio/blob/main/senior_edition_data_fact_check/senior_edition_data.Rmd). Check out the graphics on The Diamondback's [website](https://dbknews.com/2021/04/27/senior-edition-looking-back-survey/).
