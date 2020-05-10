import logging
import requests
from bs4 import BeautifulSoup

logger = logging.getLogger('nodes.data_preparation')


def run(client, params):
	logger.info(f'Connecting to {params.url}')

	response = requests.get(params.url)
	html = response.content
	soup = BeautifulSoup(html, 'lxml')

	# get raw csv link from url
	params.csv_files = ['https://github.com' + tag['href'] for tag in soup.find_all('a') if tag['href'].endswith('.csv')]
