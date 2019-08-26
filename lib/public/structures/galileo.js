var inital = {
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
}

var structures = [
    inital,
    {
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
    }
];

