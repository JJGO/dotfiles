#!/usr/bin/env python

import datetime


def percentage(current_hour, start_hour=7, end_hour=22):

    hour_range = end_hour - start_hour
    current_percentage = (current_hour - start_hour)/hour_range*100
    return int(current_percentage)


now = datetime.datetime.now()
current_hour = now.hour + now.minute/60.0
print("{:02d}%".format(percentage(current_hour)))

# import numpy as np
# for i in np.arange(6,23.1,0.25):
#     print(i, '\t', percentage(i))
