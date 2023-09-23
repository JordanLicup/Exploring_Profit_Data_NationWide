/*Gross, Net Profit, and Loss made during 2014-2017*/
Select SUM(Profit) [Gross Profit 2014-2017] from Superstore_Product_Orders_Analysis..Orders$
where Profit > 0;

Select SUM(Profit) [Total Loss 2014-2017] from Superstore_Product_Orders_Analysis..Orders$
where Profit < 0;

Select SUM(Profit) [Net Profit 2014-2017] from Superstore_Product_Orders_Analysis..Orders$;


/*Yearly tracking of Gross, Net Profits and Losses from 2014-2017*/
Select SUM(Profit) [Yearly Gross Profit], DATEPART(yy, [Order Date]) as 'Year'
from Superstore_Product_Orders_Analysis..Orders$ where Profit > 0 group by DATEPART(yy, [Order Date]) 
order by DATEPART(yy, [Order Date]);

Select SUM(Profit) [Yearly Loss], DATEPART(yy, [Order Date]) as 'Year'
from Superstore_Product_Orders_Analysis..Orders$ where Profit < 0 group by DATEPART(yy, [Order Date]) 
order by DATEPART(yy, [Order Date]);

Select SUM(Profit) [Yearly Net Profit], DATEPART(yy, [Order Date]) as 'Year'
from Superstore_Product_Orders_Analysis..Orders$ group by DATEPART(yy, [Order Date]) 
order by DATEPART(yy, [Order Date]);

/*Percentage and amount of Gross Profit and Loss share from each Market Segment*/
Select Segment, SUM(Profit) [Total Profit], SUM((Profit/442528.307399996)*100) [Percentage of Share] 
from Superstore_Product_Orders_Analysis..Orders$
where Profit > 0
group by Segment order by SUM(Profit) DESC;

Select Segment, SUM(Profit) [Total Loss], SUM((Profit/-156131.2857)*100) [Percentage of Share] 
from Superstore_Product_Orders_Analysis..Orders$
where Profit < 0
group by Segment order by SUM(Profit) DESC;

Select SUM(Profit) from Superstore_Product_Orders_Analysis..Orders$ where Profit > 0;
Select SUM(Profit) from Superstore_Product_Orders_Analysis..Orders$ where Profit < 0;

/*Percentage share of Categories in Total Gross Profit and Loss*/
Select Category, SUM(Profit) [Total Profit], SUM((Profit/442528.307399996)*100) [Percentage of Share]
from Superstore_Product_Orders_Analysis..Orders$
where Profit > 0
group by Category order by SUM(Profit) DESC;

Select Category, SUM(Profit) [Total Loss], SUM((Profit/-156131.2857)*100) [Percentage of Share]
from Superstore_Product_Orders_Analysis..Orders$
where Profit < 0
group by Category order by SUM(Profit) DESC;

/*Tracking Gross Profit by Categories per year*/
Select DATEPART(yy, [Order Date]) as 'Year', Category, SUM(Profit) [Total Profit] 
from Superstore_Product_Orders_Analysis..Orders$
where Profit > 0
group by DATEPART(yy, [Order Date]), Category order by DATEPART(yy, [Order Date]) ;

/*Share of Contribution to Gross Profit according to Location*/
Select SUM((Profit/286397.021699999)*100), SUM(Profit), State from Superstore_Product_Orders_Analysis..Orders$
GROUP BY State ORDER BY SUM(Profit) DESC;