'use strict';

const Hapi = require('@hapi/hapi');
const server = Hapi.server({
	port: 3000,
	host: '10.132.8.166'
});
const HapiPostgresConnection = require('hapi-postgres-connection');

const init = async () => {


	await server.register({
		plugin: require('hapi-router'),
		options: { routes: 'routes/**/*.js' }
	});
	await server.register({
		plugin: HapiPostgresConnection
	});

	await server.start();
	console.log('Server running on %s', server.info.uri);
};

process.on('unhandledRejection', (err) => {

	console.log(err);
	process.exit(1);
});

init();
