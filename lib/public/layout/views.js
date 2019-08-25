var table_select = {rows:[
    {height: 10},
    {cols:[
        {
            view:"combo", width:250, id: "tables",
            label: 'Table:',  name:"tables", labelWidth: 50,
            options:[],
        },
        {width: 5},
        {
            view: "button",
            value: "submit",
            width: 100
        }
    ]},
    {height: 10}
]};

var structure_default ={
    rows: ["Model"],
    columns: [ "CPU Speed" ],
    values: [
        {name: "VMs", operation: "sum"},
        {name: "CPU Cores", operation: "sum"},
        {name: "CPU Sockets", operation: "sum"}
    ],
};

var structures = [{
    label: "Resource usage",
    structure:{
      rows: ["Datacenter", "Name"],
      columns: [],
      values: [
      {name: "Peak CPU (24 hours)", operation: "sum"},
      {name: "Peak CPU (7 days)", operation: "sum"},
      {name: "Peak CPU (30 days)", operation: "sum"},
      {name: "Peak Memory (24 hours)", operation: "sum"},
      {name: "Peak Memory (7 days)", operation: "sum"},
      {name: "Peak Memory (30 days)", operation: "sum"},
      {name: "Avg CPU (24 hours)", operation: "sum"},
      {name: "Avg CPU (7 days)", operation: "sum"},
      {name: "Avg CPU (30 days)", operation: "sum"},
      {name: "Avg Memory (24 hours)", operation: "sum"},
      {name: "Avg Memory (7 days)", operation: "sum"},
      {name: "Avg Memory (30 days)", operation: "sum"}
      ],
    }
}, {
    label: "Specs",
    structure: {
        rows: ["Model"],
        columns: [ "CPU Speed" ],
        values: [
            {name: "VMs", operation: "sum"},
            {name: "CPU Cores", operation: "sum"},
            {name: "CPU Sockets", operation: "sum"}
        ]
    }
}];

var list = {rows:[
    {template:"<span class='webix_structure_header'>Structures</span>", type:"header", height: 56,
        onClick:{
            webix_structure_header: function(){
                var str = $$("pivot").getStructure();
                webix.message(JSON.stringify(str));
            }
        }
    },
    {
        view:"list",
        id:"structures",
        type:{height:40},
        css:"webix_pivot_structures",
        data:structures,
        template:"#label#",
        width: 250, select:true
    }
]};

var pivot = {
    id:"pivot",
    view:"pivot",
    data: "",
    columnWidth: 150,
    datatable:{
        rowHeight:33,
        rowLineHeight:33,
        headerRowHeight:33,
    },
    max: true,
    structure: structure_default
};
