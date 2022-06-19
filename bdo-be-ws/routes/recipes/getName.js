module.exports = {
	method: 'GET',
	path: '/api/recipes/getName',
	handler: (request, h) => {
		console.log("I got a query");
		return { "name" : "Recipe Name" };
	}
};
