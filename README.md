New York City aims to install 100MW of solar PV capacity. The NYC Department of Citywide Administrative Services (DCAS) collects [data on government buildings' readiness to host solar PV systems](https://data.cityofnewyork.us/City-Government/City-of-New-York-Municipal-Solar-Readiness-Assessm/cfz5-6fvh/about_data) every two years in accordance with local laws. For a building to be deemed solar-ready, it must be 10,000 or more gross building square feet, have a roof that is ten years old or newer, and be in good structural condition. In this project, I analyze the solar readiness data to answer questions and create visuals regarding how NYC can best acheive their goal of 100 MW. (insights, and recommendations for the city’s plan to reach 100MW of solar PV capacity. How to prioritize solar ready buildings and what the outcomes would be, and recommendations for creating more solar ready projects.)

After downloading teh CSV file from the NYC DCAS website, I cleaned the data in Excel by filtering for 2022 data, creating a unique site identifier variable (site_address), identifying and deleting duplicates of this variable, trimming spaces, converting number data stored as string data to number data types, checking for typos, and identifying and making a plan to deal with missing data (see cleaning_changelog).

Add issues iwth data
Add how I approached duplicates adn missing

After the data was in good shape to use, examined it in Excel. I added a column converting KW to MW (KW/1000), to facilitate easier comparison to the goal solar PV capacity, which is listed in MW. I created pivot tables and several scatter plots to get a sense of the data and the relationship / correlation between several variables (see city of new york excel). 

In these pivot tables, I calculate and show the results that will come from all completed and in progress solar PV installations, including the total installed MW capacity, total project cost, the total annual energy savings, annual CO2 emissions reduction, and more. I calculate the average cost to install 1MW of solar capacity at $3,329,242.91.

Put scatter plot findings in excel

Come back and write about progress toward goal.

Then, I uploaded my data into SQL (BigQuery). I recieved a "bad character" error when uploading, and discovered that the data had various null characters that appeared in SQL (despite my file being UTF-8 encoded). I used the Excel VBM editor to clean the data (see VBM file), and successfully uplaoded to SQL. A few errors persisted in the data type casting, but after examining the data, there was nothing else major wrong with the data. I cleaned the data by correctly casting data types for analysis and correcting several minor errors (SQL cleanign queries).

Then, I began analysis in SQL. I pulled summary statistics for several variables (see sql queries) and calculated the correlation coefficients for serveral sets of variables (write a few here but see sql).

I wanted to know how to best approach the non-solar ready sites to fill the 9(blank) gap that would still exist after installing solar PV at all solar ready sites. I made a column showing the reason each site was not solar ready, which I planned to later use in a visual as well as for analysis. While writing code to classify sites based on the reason they were nto solar ready, I discovered that several sites had values in their solar reasiness variables indicating that they actually were solar ready, or under construction. I included this in my code to identify these sites. (See query additional solar ready info) I found that the MW capacity of these sites misidentified as not solar ready = 7.616 MW, bringing the gap to ___.

I used the average MW capacity per site multiplied by the count of roof replacement eligible sites to get a very rough estimate of the total MW capacity potential of the roof replacement eligible sites: 216.179 MW.

I discovered that the vast majority of non solar-ready sites had roofs that were too old and not in good condition. 

Based on this column, I pulled a list of all sites that would be eligible for a roof replacement, and would then be solar ready. I sorted this list by GSF, with the largest roofs as highest priority, assuming some economies of scale in roof replacement (see replacement eligible list).


I then wanted to find out if there was any benefit to prioritizing certain soalr ready sites for solar PV installation. Due to cost data not being collected for solar ready sites, I could not identify the highest MW capacity sites with the lowest relative cost. Cost was correlated with MW capacity, but not GSF, so I could not use GSF to estimate/proxy the cost of each solar installation. However, since cost is related to MW capacity, a higher cost woul dmean greater value in terms of MW capacity, so prioritixing sites in this way is not necessary. I pulled a list of solar ready sites, sorted highest to lowest by MW capacity, for prioritizing solar installatins, however, it make sense to install solar pv on all solar ready roofs.  

Lastly, I used used the linear equation that defines the relationshipt between to make projections for future results.

View my tableau dashboard for a visual view of the data: https://public.tableau.com/views/NYCSolarReadiness/Dashboard2?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

Based on my analysis, the following steps are likely most efficient for NYC to reach its goal of installing 100 MW solar PV capacity:
<ul>
<li>First do solar ready</li>
<li>Add under construction and misidentified to solar ready</li>
<li>Don’t necessarily assume there are economies of scale in terms of MW capacity for bigger gsf projects. Do higher MW capacity first, cost is lightly correlated (factor) so you get what you pay for.</li>
<li>Made list sorting by this</li>
<li>But do other funding sources first</li>
<li>Will need to do all of them anyway</li>
<li>For not solar ready, the main reason is roof is both too old and not in good condition. Replace these roofs first (as it would have other benefits as well) starting with highest gsf (assumption of some economies of scale)</li>
<li>Made list sorted by this</li>
<li>Projections of energy savings and MT CO2 reduction at 100MW</li>
</ul>







