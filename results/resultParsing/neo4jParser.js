const fs = require('fs');
const path = require('path');

const sqlResultsFolder = path.join( __dirname, '../neo4j_v2');

const queryNumberRegex = new RegExp(/[0-9][0-9]|[0-9]/)

const files = fs.readdirSync(sqlResultsFolder)
    .filter(f=>f.includes('.result'))
    .sort((a,b)=>queryNumberRegex.exec(a)[0] - queryNumberRegex.exec(b)[0])
const timeRegex = new RegExp(/[0-9]+ ms|\d+.\d+ ms/)

module.exports = function parseNeo4JResultsToWorkbook (workbook) {
    const worksheet = workbook.addSheet('NEO4J');

    files.forEach((f, col) => {
        const fileContent = fs.readFileSync(`${sqlResultsFolder}/${f}`).toString('utf8');

        const cellNumber = col + 1;
        worksheet.row(1).cell(cellNumber).value(f)
        fileContent.split('\n').filter(s => s.length > 0).forEach((time, index) => {
            const timeSplit = time.split(',')
            const executionTime = parseFloat(timeRegex.exec(timeSplit[0])[0].replace(' ms', ''))
            const queryTime = parseFloat(timeRegex.exec(timeSplit[1])[0].replace(' ms', ''))

            const endValue = queryTime + executionTime
            const cell = worksheet.row(index + 2).cell(cellNumber);
            cell.value(endValue)
        })
    })
}
