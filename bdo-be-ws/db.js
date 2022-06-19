const { Pool, Client } = require('pg')

class pvtdbpool {
    constructor() {
        this.pool = new Pool()
    }


}

class dbpool {
    constructor() {
            throw new Error('Use getPool()');
    }
    static getPool() { 
        if (!dbpool.instance)
        {
                dbpool.instance = new pvtdbpool();
        }
        return dbpool.instance;
    }
}

module.exports = dbpool;