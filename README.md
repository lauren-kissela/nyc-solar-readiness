New York City aims to install 100MW of solar PV capacity. The NYC Department of Citywide Administrative Services (DCAS) collects [data on government buildings' readiness to host solar PV systems](https://data.cityofnewyork.us/City-Government/City-of-New-York-Municipal-Solar-Readiness-Assessm/cfz5-6fvh/about_data) every two years in accordance with local laws. For a building to be deemed solar-ready, it must be 10,000 or more gross building square feet, have a roof that is ten years old or newer, and be in good structural condition. In this project, I analyze the solar readiness data to answer questions and create visuals regarding how NYC can best acheive their goal of 100 MW. (insights, and recommendations for the city’s plan to reach 100MW of solar PV capacity. How to prioritize solar ready buildings and what the outcomes would be, and recommendations for creating more solar ready projects.)

After downloading teh CSV file from the NYC DCAS website, I cleaned the data in Excel by filtering for 2022 data, creating a unique site identifier variable (site_address), identifying and deleting duplicates of this variable, trimming spaces, converting number data stored as string data to number data types, checking for typos, and identifying and making a plan to deal with missing data (see cleaning_changelog).

After the data was in good shape to use, examined it in Excel. I added a column converting KW to MW (KW/1000), to facilitate easier comparison to the goal solar PV capacity, which is listed in MW. I created pivot tables and several scatter plots to get a sense of the data and the relationship / correlation between several variables (see city of new york excel). 

In these pivot tables, I calculate and show the results that will come from all completed and in progress solar PV installations, including the total installed MW capacity, total project cost, the total annual energy savings, annual CO2 emissions reduction, and more. I calculate the average cost to install 1MW of solar capacity at $3,329,242.91.

Put scatter plot findings in excel

Come back and write about progress toward goal.

Then, I uploaded my data into SQL (BigQuery). I recieved a "bad character" error when uploading, and discovered that the data had various null characters that appeared in SQL (despite my file being UTF-8 encoded). I used the Excel VBM editor to clean the data (see VBM file), and successfully uplaoded to SQL. A few errors persisted in the data type casting, but after examining the data, there was nothing else major wrong with the data. I cleaned the data by correctly casting data types for analysis and correcting several minor errors (SQL cleanign queries).



