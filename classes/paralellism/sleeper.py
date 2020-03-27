import time

def my_sleep_py(x):
    '''
    Sleeps for x-seconds and returns the result x
    '''
    print(f'Sleeping for {x} seconds.')
    time.sleep(x)
    print(f'Returning {x}')
    return x