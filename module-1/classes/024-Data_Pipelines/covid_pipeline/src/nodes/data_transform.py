import logging
import pandas as pd

logger = logging.getLogger('nodes.data_transform')


def update(client, params):
	"""
	Perform the data cleaning and transformation.
	"""
	logger.info(f'Updating data-transform node.')
	logger.debug(f'Folder: {params.intermediate_data}')
	logger.debug(f'Filename: {params.filename}')

	df = pd.read_csv(params.intermediate_data + params.filename)
	
	# rename columns
	colnames = df.rename({'Province/State':'province', 
                      'Country/Region':'country', 
                      'Country_Region':'country',
                      'Last Update': 'last_update'}, 
                     axis=1).columns

	df.columns = [col.lower() for col in colnames]

	# normalize date format
	df['last_update'] = pd.to_datetime(df['last_update'])

	# normalize names
	df.loc[df.country.str.contains('China'), 'country'] = 'China'

	# creating variable
	df['anomesdia'] = df.last_update.apply(lambda x : f'{str(x.year)}-{str(x.month).zfill(2)}-{str(x.day).zfill(2)}')
	
	params.df = df

	logger.debug(df.head())


def done(client, params):
	"""
	This always return False. 

	You'll always update the node status.
	"""
	return False