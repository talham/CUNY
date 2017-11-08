//reference
//http://christopheviau.com/d3_tutorial/
//http://bl.ocks.org/jfreels/6814721
var tabulate = function (data,columns) {
var table = d3.select('body').append('table')
var thead = table.append('thead')
var tbody = table.append('tbody')

	thead.append('tr')
	  .selectAll('th')
	    .data(columns)
	    .enter()
	  .append('th')
	    .text(function (d) { return d })

	var rows = tbody.selectAll('tr')
	    .data(data)
	    .enter()
	  .append('tr')

	var cells = rows.selectAll('td')
	    .data(function(row) {
	    	return columns.map(function (column) {
	    		return { column: column, value: row[column] }
	      })
      })
      .enter()
    .append('td')
	.on("mouseover", function(){d3.select(this).style("background-color", "purple").style("font-size","16px")})
    .on("mouseout", function(){d3.select(this).style("background-color", "white").style("font-size","12px")})
      .text(function (d) { return d.value })

  return table;
};

d3.csv('presidents.csv',function (den) {
	var columns = ['Name','Height','Weight']
	tabulate(den,columns);
});