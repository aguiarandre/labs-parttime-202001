from pandas import DataFrame


class Params:
	"""
	Parameters class.

	This file centralizes anything that can be 
	parametrized in the code.
	"""

	raw_data = '../data/raw/'
	external_data = '../data/external/'
	processed_data = '../data/processed/'
	intermediate_data = '../data/intermediate/'

	log_name = '../log/dump.log'

	# if this is set to True, then all the nodes will be automatically 
	# considered not up-to-date and will be rerun.
	rerun = True 

	## Database connection params
	user = 'postgres'
	password = 'admin'
	host = 'localhost'
	database = 'covid_pipeline'

	# url for john hopkins university repo
	url = 'https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_daily_reports'

	# all files to be downloaded - generated on the execution of the code.
	csv_files = None

	# each url to download
	file_url = None

	# name of each file - to be determined on the fly.
	filename = None

	# dataframe to be populated in the data_transform step.
	df = DataFrame()