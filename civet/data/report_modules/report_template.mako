<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://raw.githubusercontent.com/COG-UK/civet/master/docs/doc_figures/civet_logo.svg">

    <title>${config["report_title"]}</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/gh/rambaut/figtree.js@db798529/dist/figtree.umd.js"></script>
    <script src="https://d3js.org/d3.v6.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vega@5.15.0"></script>
  <script src="https://cdn.jsdelivr.net/npm/vega-lite@4.15.0"></script>
  <script src="https://cdn.jsdelivr.net/npm/vega-embed@6.11.1"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <style>
      body {
        padding-top: 50px;
        font-family: "ArialNova-Light","HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
      }
      table text{
          font-family: "ArialNova-Light","HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; 
      }
      header {
          display: block;
          text-align: right;
      
      }
      svg {width: 90%; height: auto;}
      .accordion {
          background-color: #eee;
          color: #444;
          cursor: pointer;
          padding: 13px;
          width: 100%;
          border: none;
          text-align: left;
          outline: none;
          transition: 0.4s;
        }

        .active, .accordion:hover {
          background-color: #ccc;
        }

        .accordion:after {
          content: '\002B';
          color: #777;
          font-weight: bold;
          float: right;
          margin-left: 5px;
        }

        .active:after {
          content: "\2212";
        }

        .panel {
          padding: 0 13px;
          background-color: white;
          max-height: 0;
          overflow: hidden;
          transition: max-height 0.2s ease-out;
        }
      .center {
          display: block;
          margin-left: auto;
          margin-right: auto;
          width: 50%;
          }
      .node-background{
          fill:dimgrey;
          stroke:dimgrey;
      }
      .node circle{
        stroke-width:0;
        cursor:pointer;
        fill:#86b0a6;
        stroke:dimgrey;
        }
      .node circle.selected{
        stroke-width:0;
        cursor:pointer;
        fill:#b08686;
        stroke:dimgrey;
        }
      .node rect{
        stroke-width:2;
        fill:#b08686;
        stroke:dimgrey;
      }
      .svg-tooltip {
          background: rgba(69,77,93,.9);
          border-radius: .1rem;
          color: #fff;
          display: block;
          font-size: 14px;
          max-width: 320px;
          padding: .2rem .4rem;
          position: absolute;
          text-overflow: ellipsis;
          white-space: pre;
          z-index: 300;
          visibility: hidden;
    }
    .tooltip-header {
      font-size: 1.3em;
    }
    .tooltip-key {
      font-weight: bold;
    }
    .branch path{
      stroke-width:2;
      stroke: dimgrey;
      stroke-linejoin:round;
      cursor: pointer;
      }
      .branch.hovered path{
        stroke-width:4;
        stroke: dimgrey;
      }
        .node.hovered circle{
        stroke-width:5;
        stroke: dimgrey
        }
        .node text{
          font-family: "ArialNova-Light","HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; 
          font-weight: 300;
          font-size: 0.9em;
        }
      /* .starter-template {
        padding: 40px 15px;
        text-align: left;
      } */
      .svg-icon {
      display: inline-flex;
      align-self: center;
      }
      h3{
          font-size: 1em;
      }
      #toTopBtn {
      position: fixed;
      bottom: 26px;
      right: 39px;
      z-index: 98;
      padding: 21px;
      background-color: #86b0a6
      }
      .js .cd-top--fade-out {
          opacity: .5
      }
      .js .cd-top--is-visible {
          visibility: visible;
          opacity: 1
      }
      .js .cd-top {
          visibility: hidden;
          opacity: 0;
          transition: opacity .3s, visibility .3s, background-color .3s
      }
      .cd-top {
          position: fixed;
          bottom: 20px;
          bottom: var(--cd-back-to-top-margin);
          right: 20px;
          right: var(--cd-back-to-top-margin);
          display: inline-block;
          height: 40px;
          height: var(--cd-back-to-top-size);
          width: 40px;
          width: var(--cd-back-to-top-size);
          box-shadow: 0 0 10px rgba(0, 0, 0, .05) !important;
          background: url(https://res.cloudinary.com/dxfq3iotg/image/upload/v1571057658/cd-top-arrow.svg) no-repeat center 50%;
          background-color:#86b0a6;
          background-color: hsla(var(--cd-color-3-h), var(--cd-color-3-s), var(--cd-color-3-l), 0.8)
      }
      .slidecontainer {
        width: 100%;
      }
      .slider {
        -webkit-appearance: none;
        width: 100%;
        height: 15px;
        background: #d3d3d3;
        border-radius: 5px;
        stroke: dimgrey;
        outline: none;
        opacity: 0.7;
        -webkit-transition: .2s;
        transition: opacity .2s;
      }
      .slider:hover {
        opacity: 1; 
      }
      .slider::-webkit-slider-thumb {
        -webkit-appearance: none;
        appearance: none;
        width: 25px;
        height: 25px;
        border-radius: 50%; 
        background: #86b0a6;
        stroke: dimgrey;
        cursor: pointer;
      }
      .slider::-moz-range-thumb {
        width: 25px;
        height: 25px;
        border-radius: 50%;
        stroke: dimgrey;
        background: #86b0a6;
        cursor: pointer;
      } 
      .tree-container{
        max-height: 1000px;
        overflow: scroll;
      }
      .label{
        display: none;
      }
      .label.show{
        display: inline;
      }
      .node.hovered .label {
          display:inline;
        }
      div.sticky {
          position: -webkit-sticky; /* Safari */
          position: sticky;
          top: 0;
        }
        .searchbar {
          border-style:solid; 
          border-color: lightgrey; 
          border-radius: 5px; 
          float:right
        }
      @media print {
        .tree-container{
        max-height: none;
        overflow: visible;
        
        }
        
        .slider-block {
          display: none;
        }
        .container {
        padding-right: 1.5cm;
        padding-left: 1.5cm;
        padding-bottom: 1.5cm;
        margin: 1cm;
        min-width: 2200px;
        font-size:2.5vw;
        }
        .searchbar {
          display: none;
        }
        h3{ 
          font-size: 2.5vw;
        }
        h2 {
          font-size: 4vw;
          padding: 1cm;
        }
        h1 {
          font-size: 5vw;
        }
        .command-block {
          display: none;
        }
        pre {
          display: none;
        }
        .civet-logo {
          width: 2cm;
          height: 2cm;
        }
        .tree_svg {
          width: 1200px
        }
        .page-footer {
          display: none;
        }
        .civet-header {
          text-align: left;
        }
        .content-block, p {
        page-break-inside: avoid;
        }
      }
      @media screen and (prefers-color-scheme: dark) {
        body {
            background-color: #17141F;
            color: #F2E7DC;
            opacity: 0.95;
          }
          img {
            filter: brightness(.8) contrast(1.2);
          }
        .component {
          background-color: #2C2640;
        }
        .table-striped>tbody>tr:nth-child(odd) {
          background-color: #2C2640;
          /* border-top-color: #3B325B; */
          /* border-color: #2C2640; */
          opacity: 0.9;
        }
        .table {
          border-top: 0px;
          /* border-color: #3B325B; */
          background-color: #17141F;
      }
      .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
        border-top: none;
      }
      .accordion {
          background-color: #2C2640;
          color: #F2E7DC;
          cursor: pointer;
          padding: 12px;
          width: 100%;
          border: none;
          text-align: left;
          outline: none;
          transition: 0.4s;
        }

        .active, .accordion:hover {
          background-color: #17141F;
        }

        .accordion:after {
          content: '\002B';
          color: #F2E7DC;
          font-weight: bold;
          float: right;
          margin-left: 5px;
        }

        .active:after {
          content: "\2212";
        }

        .panel {
          padding: 0 12px;
          background-color: #2C2640;
          max-height: 0;
          overflow: hidden;
          transition: max-height 0.2s ease-out;
        }
      pre {
        background-color: #3B325B;
        color: #F2E7DC;
        border: none;
        opacity: 0.8;
      }
      .searchbar {
        background-color: #3B325B;
        color: #F2E7DC;
        border-style:none;
        opacity: 0.8;
        }
      .slider {
        background: #F2E7DC;
        stroke: #F2E7DC;
      }
      .slider::-webkit-slider-thumb {
        background: #5F9C82;
        fill: #5F9C82;
        stroke: #F2E7DC;
      }
      .slider::-moz-range-thumb {
        stroke: #F2E7DC;
        background: #5F9C82;
        fill: #5F9C82;
      } 
      .node-background{
          fill:#F2E7DC;
          stroke:#F2E7DC;
          opacity: 0.85;
      }
      .node circle{
        stroke-width:0;
        cursor:pointer;
        fill:#5F9C82;
        stroke:#F2E7DC;
        
        }
      .node circle.selected{
        stroke-width:0;
        cursor:pointer;
        fill:#E27E7E;
        stroke:#F2E7DC;
        opacity: 1;
        }
      .node rect{
        stroke-width:2;
        fill:#E27E7E;
        stroke:#F2E7DC;
      }
      .svg-tooltip {
          background: rgba(69,77,93,.9);
          color: #F2E7DC;
    }
    .branch path{
      stroke: #F2E7DC;
      opacity: 0.85;
      }
      .branch.hovered path{
        stroke:#F2E7DC;
        opacity: 1;
      }
        .node.hovered circle{
          stroke:#F2E7DC;
        opacity: 1;
        }
        .node text{
          font-family: "ArialNova-Light","HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; 
          font-weight: 300;
          font-size: 0.9em;
          color: #F2E7DC;
          fill: #F2E7DC;        
        }
        .scale-bar line {
          stroke: #F2E7DC;
        }
        .scale-bar text{
          fill: #F2E7DC;
          color:  #F2E7DC;
        }
      }
    </style>

  </head>

  <body>
    <script>
      $(document).ready(function() {
        $(window).scroll(function() {
        if ($(this).scrollTop() > 20) {
        $('#toTopBtn').fadeIn();
        } else {
        $('#toTopBtn').fadeOut();
        }
        });
        
        $('#toTopBtn').click(function() {
        $("html, body").animate({
        scrollTop: 0
        }, 400);
        return false;
        });
        });
    </script>
            
    <script>
          function myFunction(myInput, myTable) {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById(myInput);
            filter = input.value.toUpperCase();
            table = document.getElementById(myTable);
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
              td = tr[i].getElementsByTagName("td")[0];
              if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                  tr[i].style.display = "";
                } else {
                  tr[i].style.display = "none";
                }
              }       
            }
          }
    </script>

    <!--Figtree.js-->
    <script type="text/javascript"> 
      const updateTableFactory = (tooltipId,metadata)=>(tipId)=>{
              const data = metadata[tipId];
              const tableDiv = d3.select(document.getElementById(tooltipId));
              //Remove table
          tableDiv.html("")
              if (data !== undefined) {
                  const visibleData = Object.keys(data).filter(d=>d!=='${config["report_column"]}');
                  tableDiv.append("h3")
                      .attr("class",'tooltip-header')
                      .text(tipId)
                      .append("hr");
                  tableDiv.selectAll("p")
                          .data(visibleData)
                          .enter()
                          .append("p")
                          .attr("class","tooltip-text")
                              .selectAll("span")
                              .data(d=>[d,data[d]])
                              .enter()
                              .append("span")
                              .attr("class",(d,i)=> i===0? "tooltip-key" :"tooltip-value")
                              .text((d,i)=>i===0? d + " : ": d);
              }
      }
      <%text>
      
      function addSliderEventHandler(sliderID,fig){
        const svg = fig.svgSelection.select(function() { return this.parentNode; })
        const initialHeight = svg.attr("height");
        const maxHeight = fig.tree().externalNodes.length*50; // 50 pixels for each tip plus a little for margins;
        if(maxHeight<=initialHeight){
          d3.select(`#${sliderID}`).remove();// don't need  a slider
          return;
        }
        const heightScale = d3.scaleLinear()
                .range([initialHeight,maxHeight])
                .domain([0,1])
            if(initialHeight/fig.tree().externalNodes.length>12){
              fig.svgSelection.selectAll(".label")
              .classed("show",true)
            }
        d3.select(`#${sliderID}`).on("input",function(){
              const svgHeight = heightScale(this.value);
              //magic number!!
              svg.attr("height", svgHeight);
            fig.update();
            if(svgHeight/fig.tree().externalNodes.filter(node=>!node[fig.id].ignore).length>12){
              fig.svgSelection.selectAll(".label")
              .classed("show",true)
            }else{
              fig.svgSelection.selectAll(".label")
              .classed("show",false)
            }
        })
      }
      </%text>
      function buildTree(svgID, myTreeString,tooltipID,backgroundDataString,sliderID) {
          const backgroundData = JSON.parse(backgroundDataString);
          const updateTable = updateTableFactory(tooltipID, backgroundData);
          const margins = {top:50,bottom:60,left:100,right:250}
          const svg = d3.select(document.getElementById(svgID))
          svg.selectAll("g").remove();
          const newickString = myTreeString;
          const tree = figtree.Tree.parseNewick(newickString);
          const fig = new figtree.FigTree(document.getElementById(svgID),margins, tree)
          fig.layout(figtree.rectangularLayout)
                  .nodes(figtree.circle()
                                  .filter(n=>!n.children)
                                  .attr("r",8)
                                  .hilightOnHover(20)
                                  .onClick((node,i,n)=>{
                                    updateTable(node.name);
                                    fig.svgSelection.selectAll(".selected").classed("selected",false);
                                    d3.select(n[i]).classed("selected",true);
                                  }),
                          figtree.tipLabel(v=>v.name).attr("dx",10),
                          figtree.rectangle()
                                  .filter(n=>n[fig.id].collapsed)
                                  .attr("width",20)
                                  .attr("height",20)
                  )
                        .nodeBackgrounds(figtree.circle()
                                          .attr("r", 10)
                                .filter(n=>!n.children)
                                        )
                        .branches(figtree.branch()
                                    .hilightOnHover(20) 
                                    .collapseOnClick()
                                    .on("click",()=>{
                                      const svgHeight = fig.svgSelection.select(function() { return this.parentNode; }).attr("height");
                                      if(svgHeight/fig.tree().externalNodes.filter(node=>!node[fig.id].ignore).length>12){
                                        fig.svgSelection.selectAll(".label")
                                          .classed("show",true)
                                      }else{
                                        fig.svgSelection.selectAll(".label")
                                        .classed("show",false)
                                      }
                                    })
                            )
                            .feature(
                                    figtree.scaleBar()
                                      .direction("x")
                                      .length(1/29903)
                                      .x(-60)
                                      .y(-30)
                                      // .y(fig.svgSelection.select(function() { return this.parentNode; }).attr("height")-margins.top-margins.bottom+20)
                                      .title({text:"~1 SNP",
                                      yPadding:10})
                                        )
        addSliderEventHandler(sliderID,fig);
      }
    </script>

    <div class="container">
      <a href="#" id="toTopBtn" class="cd-top text-replace js-cd-top cd-top--is-visible cd-top--fade-out" data-abc="true"></a>
      <div>
        <header class="civet-header">
            civet ${version} | 
            <small class="text-muted">Cluster Investigation and Virus Epidemiology Tool</small>
            <hr>
        </header>
        
        <h1>${config["report_title"]}
            <small class="text-muted">${date}</small>
        </h1> 
        <br>
        </div>
    
    <br>
  
   %if '1' in config["report_content"]:
      
          <h3><strong>Table 1</strong> | Summary of queries  <input class="searchbar" type="text" id="myInput" onkeyup="myFunction('myInput','myTable')" placeholder="Search for sequence..." title="searchbar"></h3>
          <table class="table table-striped" id="myTable">
              <tr class="header">
              %for col in config["table_content"]:
              <th style="width:10%;">${col.title().replace("_"," ")}</th>
              %endfor
              </tr>
              % for row in query_summary_data:
                  <tr>
                    %for col in config["table_content"]:
                    <td>${row[col]}</td>
                    %endfor
                  </tr>
              % endfor
              </table>

    
          <h3><strong>Table 2 </strong> | Queries provided in fasta file</h3>
          <button class="accordion">Passed QC</button>
          <div class="panel">
            <table class="table table-striped" id="myTable2">
            <tr class="header">
                %for col in config["fasta_table_content"]:
                <th style="width:10%;">${col.title().replace("_"," ")}</th>
                %endfor
                </tr>
                % for row in fasta_summary_pass:
                    <tr>
                      %for col in config['fasta_table_content']:
                      <td>${row[col]}</td>
                      %endfor
                    </tr>
                % endfor
            </table>
          </div>
          <button class="accordion">Failed QC</button>
          <div class="panel">
          <table class="table table-striped" id="myTable2">
            <tr class="header">
                %for col in config["fasta_table_content"]:
                <th style="width:10%;">${col.title().replace("_"," ")}</th>
                %endfor
                </tr>
                % for row in fasta_summary_fail:
                    <tr>
                      %for col in config['fasta_table_content']:
                      <td>${row[col]}</td>
                      %endfor
                    </tr>
                % endfor
            </table>
          </div>

  %endif

    %for catchment in catchments:
        
        <h2>${catchment.replace("_"," ").title()}</h2> 
        
        %if '2' in config["report_content"]:
            <h3><strong>Table ${2+int(data_for_report[catchment]["catchmentID"].split("_")[1])}</strong> | Summary of catchment ${data_for_report[catchment]["catchmentID"]}</h3>
              <table class="table table-striped" id='${data_for_report[catchment]["catchmentID"]}'>
                  <tr class="header">
                  </tr>
                  <table class="table table-striped">
                  <tr class="header">
                  <th style="width:30%;">Information</th>
                  <th style="width:60%;"> </th>
                  </tr>
                  % for stat in data_for_report[catchment]['catchment_summary_data']:
                    <tr>
                      <td>${stat.title().replace("_"," ")}</td>
                      <td>${data_for_report[catchment]['catchment_summary_data'][stat]}</td>
                    </tr>
                  % endfor
                </table>
            %endif

        %if '3' in config["report_content"]:
            
          <div class="slider-block" id="slider_${data_for_report[catchment]["catchmentID"]}">
            <p>Expansion</p>
            <input class="slider" type="range" id="rangeinput_${data_for_report[catchment]["catchmentID"]}"  min="0" max="1" style="width: 100px" step="0.01" value="0" />
            <span class="highlight"></span>
          </div> 

          <div class="row tree-container">
      
            <div class="col-xs-7">
              <svg class="tree_svg" width="600" height="400" id="tree_${data_for_report[catchment]["catchmentID"]}"></svg>
            </div>
            <div class="col-xs-4 sticky" id="tooltip_${data_for_report[catchment]["catchmentID"]}">
            </div> 
            <script type="text/javascript">
              buildTree("tree_${data_for_report[catchment]['catchmentID']}", 
                        "${data_for_report[catchment]['newick']}",
                        "tooltip_${data_for_report[catchment]['catchmentID']}",
                        '${background_data}',
                        "rangeinput_${data_for_report[catchment]['catchmentID']}");
            </script> 
          </div> 
            
        %endif
        %if '4' in config["report_content"]:
            <div id="${catchment}_snipit">
            ${data_for_report[catchment]["snipit_svg"]}
            </div>
            
        %endif
        %if '5' in config["report_content"]:
        <%timeline_data = data_for_report[catchment]["timeline_data"] %>
              
              <div id="${catchment}_timeline"></div>
                <script>
                  var vlSpec_time = {
                    "$schema": "https://vega.github.io/schema/vega-lite/v5.json",
                    "width": 600,
                    "height": 400,
                    "datasets": ${timeline_data}
                    ,
                    "data": {
                      "name": "${catchment}_timeline"
                        },
                      "transform":[
                        {
                        "filter": {
                          "field": "date_type",
                          "oneOf": ${config["timeline_dates"]}
                        }
                        }
                      ],
                      "encoding": {
                        "x": 
                        {"field": "date", 
                        "type": "temporal", 
                        "axis": {"grid": false}},
                        "y": 
                        {"field": "sequence_name", 
                        "type": "nominal",
                        "axis": {"title": "Sequence name"}},
                        "color": 
                        {"field": "date_type", 
                        "type": "nominal",
                        "legend": null}
                      },
                      "layer": [
                        {
                        "mark": "line",
                        "encoding": {
                          "detail": {
                          "field": "sequence_name",
                          "type": "nominal"
                          },
                          "color": {"value": "#A9A9A9"}
                        }
                        },
                        {
                        "mark": {
                          "type": "point",
                          "filled": true,
                          "tooltip":true
                        },
                        "encoding": {
                          "color": {
                          "field": "date_type",
                          "type": "nominal",
                          "scale": {
                            "domain": ${config["timeline_dates"]},
                            "range": ${config["timeline_colours"]}
                          },
                          "title": "Date"
                          },
                          "size": {"value": 100},
                          "opacity": {"value": 1}
                        }
                        }
                      ]
                      };          
                vegaEmbed('#${catchment}_timeline', vlSpec_time);

              </script>
        %endif
        %endfor
        
        
        %if '6' in config["report_content"]:
        
        here is where the local lineages will go
        
        %endif
        %if '7' in config["report_content"]:
        <h2>Map of queries</h2> 
        <%qmap_data = data_for_report["query_map_data"] %>
        <div id="query_map"></div>

        <script>
			      var vSpec_qmap = {

            "$schema": "https://vega.github.io/schema/vega/v5.json",
            "autosize": "none",
            "background": "white",
            "padding": 5,
            "width": 500,
            "height": 500,
            "style": "cell",

          "signals": [
              { "name": "tx", "update": "width / 2" },
              { "name": "ty", "update": "height / 2" },
              {
                "name": "scale",
                "value": 1000,
                "on": [{
                  "events": {"type": "wheel", "consume": true},
                  "update": "clamp(scale * pow(1.0005, -event.deltaY * pow(16, event.deltaMode)), 100, 3000)"
                }]
              },
              {
                "name": "angles",
                "value": [0, 0],
                "on": [{
                  "events": "mousedown",
                  "update": "[rotateX, centerY]"
                }]
              },
              {
                "name": "cloned",
                "value": null,
                "on": [{
                  "events": "mousedown",
                  "update": "copy('projection')"
                }]
              },
              {
                "name": "start",
                "value": null,
                "on": [{
                  "events": "mousedown",
                  "update": "invert(cloned, xy())"
                }]
              },
              {
                "name": "drag", "value": null,
                "on": [{
                  "events": "[mousedown, window:mouseup] > window:mousemove",
                  "update": "invert(cloned, xy())"
                }]
              },
              {
                "name": "delta", "value": null,
                "on": [{
                  "events": {"signal": "drag"},
                  "update": "[drag[0] - start[0], start[1] - drag[1]]"
                }]
              },
              {
                "name": "rotateX", "value": 0,
                "on": [{
                  "events": {"signal": "delta"},
                  "update": "angles[0] + delta[0]"
                }]
              },
              {
                "name": "centerY", "value": ${config["start_centre_lat"]},
                "on": [{
                  "events": {"signal": "delta"},
                  "update": "clamp(angles[1] + delta[1], -60, 60)"
                }]
              }
            ],

            "projections": [
              {
                "name": "projection",
                "type": "mercator",
                "scale": {"signal": "scale"},
                "rotate": [{"signal": "rotateX"}, 0, 0],
                "center": [${config["start_centre_long"]}, {"signal": "centerY"}],
                "translate": [{"signal": "tx"}, {"signal": "ty"}]
              }
            ],

            "data": [
              {
                "name": "background_data",
                "url": "${config['query_map_file']}",
                "format": {"property": "features"}
              },
              {
                "name": "source_0",
                "values": ${qmap_data}
              },
              {
                "name": "data_0",
                "source": "background_data",
              },
              {
                "name": "data_1",
                "source": "source_0",
                "transform": [
                  {
                    "type": "geopoint",
                    "projection": "projection",
                    "fields": ["longitude", "latitude"],
                    "as": ["layer_1_x", "layer_1_y"]
                  }
                ]
              }
            ],
            "marks": [
              {
                "name": "layer_0_marks",
                "type": "shape",
                "clip": true,
                "style": ["geoshape"],
                "from": {"data": "data_0"},
                "encode": {
                  "update": {
                    "fill": {"value": null},
                    "stroke": {"value": "darkgrey"},
                    "ariaRoleDescription": {"value": "geoshape"}
                  }
                },
                "transform": [{"type": "geoshape", "projection": "projection"}]
              },
              {
                "name": "layer_1_marks",
                "type": "symbol",
                "clip": true,
                "style": ["circle"],
                "from": {"data": "data_1"},
                "encode": {
                  "update": {
                    "opacity": {"value": 0.7},
                    "tooltip": {"signal": "datum"},
                    "fill": {"value": "#A6626F"},
                    "ariaRoleDescription": {"value": "circle"},
                    "description": {
                      "signal": "\"longitude: \" + (format(datum[\"longitude\"], \"\")) + \"; latitude: \" + (format(datum[\"latitude\"], \"\"))"
                    },
                    "x": {"field": "layer_1_x"},
                    "y": {"field": "layer_1_y"},
                    "size": {"value": 100},
                    "shape": {"value": "circle"}
                  }
                }
              }
            ]
      }

			vegaEmbed('#query_map', vSpec_qmap);

		  </script>
        
      %endif

    <script>
        var acc = document.getElementsByClassName("accordion");
        var i;
        for (i = 0; i < acc.length; i++) {
              acc[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.maxHeight) {
                  panel.style.maxHeight = null;
                } else {
                  panel.style.maxHeight = panel.scrollHeight + "px";
                } 
              });
            }
    </script>

    <footer class="page-footer">
      <div class="container-fluid text-right text-md-right">
        <hr>
        <div class="row">
          <!--<div class="col-sm-1">
            <p>
            <img class="civet-logo" src="https://raw.githubusercontent.com/COG-UK/civet/master/docs/doc_figures/civet_logo.svg" vertical-align="left" width="50" height="50"></img>
            <p> -->
        </div>

      <div class="col-sm-11" style="text-align: right;">
        civet ${version} | <small class="text-muted">Cluster Investigation and Virus Epidemiology Tool</small> <br><small class="text-muted">GNU General Public License v3.0</small></div>

        <br><br>
        </p>
      </div>
    </footer>
    </div>
    
    

    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    
    
  </body>
</html>