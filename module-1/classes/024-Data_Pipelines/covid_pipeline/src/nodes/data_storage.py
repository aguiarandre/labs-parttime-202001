import logging

logger = logging.getLogger('nodes.data_storage')


def update(client, params):
	"""
	Store table in database.
	"""
	df = params.df
	table_name = params.filename.split('.')[0]

	logger.info(f'Storing {table_name} into {params.database}')
	df.to_sql(table_name, client.conn, if_exists='fail', index=False)

def done(client, params):
	"""
	Verify if table exists in the database.
	"""
	table_name = params.filename.split('.')[0]

	if client.conn.engine.has_table(table_name):
		return True

	return False