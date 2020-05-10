from bs4 import BeautifulSoup
import logging
import pandas as pd
import re
import requests
import os

logger = logging.getLogger('nodes.data_gathering')


def update(client, params):
	"""
	Download the file for the specific date.
	"""
	logger.info('Updating data gathering node.')
	
	file = params.file_url

	response = requests.get(file)
	html = response.content
	soup = BeautifulSoup(html, 'lxml')

	# append it with github.com
	csv_url = 'https://github.com' + soup.find_all('div', attrs={'class':'BtnGroup'})[-1].find_all('a')[0]['href']

	# extract date 
	date = re.findall('\d{2}-\d{2}-\d{4}', csv_url)[0].replace('-','_')

	params.filename = 'corona_' + date + '.csv'

	logger.info(f'Downloading from {csv_url}')
	df = pd.read_csv(csv_url)

	logger.info(f'Storing file in {params.intermediate_data + params.filename}')
	df.to_csv(params.intermediate_data + params.filename)

	
def done(client, params):
	"""
	Verify if each file name is in the intermediate_data directory.
	"""

	# extract date 
	logger.debug(f'params.file_url: {params.file_url}')
	date = re.findall('\d{2}-\d{2}-\d{4}', params.file_url)[0].replace('-','_')
	

	logger.debug(f'date: {date}')
	params.filename = 'corona_' + date + '.csv'

	files_list = os.listdir(params.intermediate_data)

	if params.filename in files_list:
		logger.info(f'Node is up to date for {date}')
		return True

	return False


