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
            id: "submit",
            width: 100
        }
    ]},
    {height: 10}
]};

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
        data:"",
        template:"#label#",
        width: 250, select:true
    }
]};

if (typeof initial == "undefined") { initial = "" }

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
    structure: initial
};
