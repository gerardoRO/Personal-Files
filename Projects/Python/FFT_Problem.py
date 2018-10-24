
import numpy as np
import numpy.fft as fft
import scipy.signal as sig

t_vector = np.arange(0,10,.0001)
x_vector = np.sin(2*np.pi*50*t_vector)
