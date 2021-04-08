const fs = require('fs');
const path = require('path');

const sqlResultsFolder = path.join( __dirname, '../sql_v2');

const queryNumberRegex = new RegExp(/[0-9][0-9]|[0-9]/)

const files = fs.readdirSync(sqlResultsFolder)
    .filter(f=>f.includes('.result'))
    .sort((a,b)=>queryNumberRegex.exec(a)[0] - queryNumberRegex.exec(b)[0])

module.exports = function parseSqlResultsToWorkbook (workbook) {
        const worksheet = workbook.addSheet('SQL');

        files.forEach((f, col)=> {
            const fileContent = fs.readFileSync(`${sqlResultsFolder}/${f}`).toString('utf8');
            const time = fileContent
                .replace(/Time: /g, '')
                .replace(/\(.*\)/g, '')
                .replace(/ ms/g, '');

            const cellNumber = col + 1;
            worksheet.row(1).cell(cellNumber).value(f)
            time.split('\n').forEach((time, index) => {
                const cell = worksheet.row(index + 2).cell(cellNumber);
                cell.value(time)
            })
        })

}
