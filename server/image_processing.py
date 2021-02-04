import cv2
import numpy as np
from urllib.request import urlopen


def process_image(image):
    file = urlopen(image)
    img = np.asarray(bytearray(file.read()), dtype="uint8")
    img = cv2.imdecode(img, cv2.IMREAD_GRAYSCALE)
    return img
