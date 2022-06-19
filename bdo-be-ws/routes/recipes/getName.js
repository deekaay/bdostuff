module.exports = {
	method: 'GET',
	path: '/api/recipes/getName',
	handler: async (request, h) => {
	console.log(request.query.item_id);
		const res = await request.pg.client.query('SELECT en from items where item_id = $1', [ request.query.item_id ]);
		return { "name" : res.rows[0].en };
	}
};
