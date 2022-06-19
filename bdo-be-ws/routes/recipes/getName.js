module.exports = {
	method: 'GET',
	path: '/api/recipes/getName',
	handler: async (request, h) => {
		try {
		const res = await request.pg.client.query('SELECT en from recipes where recipe_id = $1', [ request.query.recipe_id ]);
		return { "name" : res.rows[0].en };
		} catch (err)
		{
			console.log(err);

		}
	}
};
