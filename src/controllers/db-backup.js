const { promiseHandler } = require("../middleware/promiseHandler");
const helpers = require("../helpers");
const fs = require("fs");
const path = require('path');
module.exports = {
    generateDBBackup: promiseHandler(async (req, res, next) => {

        const dumpFilePath = await helpers.generateDumpSQL();
        const backupFile = path.join(__dirname, '../../backup_db.sql');
        if (dumpFilePath) {
            return res.download(backupFile, 'backup_db.sql', (err) => {
                if (err) {
                    console.error('Error sending file:', err);
                    return helpers.response(res, 500, "GET db gagal",);

                } else {
                    console.log('File sent successfully');
                    // return helpers.response(res, 200, "GET db berhasil", { isFetched: true });
                    return
                    // Optionally, you can delete the file after sending it
                }
            });
        } else {
            return helpers.response(res, 500, "GET db gagal",);

        }

    },),
}