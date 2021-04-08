const parseNeo4JResultsToWorkbook = require("./neo4jParser");
const parseSqlResultsToWorkbook =  require("./sqlParser");

const excelPopulate = require('xlsx-populate');

excelPopulate.fromBlankAsync()
    .then((workbook)=>{
        parseSqlResultsToWorkbook(workbook)
        parseNeo4JResultsToWorkbook(workbook)
        workbook.deleteSheet('Sheet1');
        return workbook.toFileAsync(`${__dirname}/../results_v2.xlsx`)
    })
