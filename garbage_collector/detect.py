# import the necessary packages
from __future__ import print_function
from imutils.object_detection import non_max_suppression
from imutils import paths
import numpy as np
import argparse
import imutils
import cv2
from serial import Serial
from time import sleep

ser = Serial('/dev/ttyACM0', 9600)

hog = cv2.HOGDescriptor()
hog.setSVMDetector(cv2.HOGDescriptor_getDefaultPeopleDetector())

cap = cv2.VideoCapture(0)

while True:
	ret, image = cap.read()	
	image = imutils.resize(image, width=min(400, image.shape[1]))
	# orig = image.copy()
	# detect people in the image
	(rects, weights) = hog.detectMultiScale(image, winStride=(4, 4),
		padding=(8, 8), scale=1.05)
	# draw the original bounding boxes
	# for (x, y, w, h) in rects:
	# 	cv2.rectangle(orig, (x, y), (x + w, y + h), (0, 0, 255), 2)
	if len(rects) > 0:
		rects = np.array([[x, y, x + w, y + h] for (x, y, w, h) in rects])
		pick = non_max_suppression(rects, probs=None, overlapThresh=0.65)
		# draw the final bounding boxes
		for (xA, yA, xB, yB) in pick:
			cv2.rectangle(image, (xA, yA), (xB, yB), (0, 255, 0), 2)
		print("[INFO]: {} original boxes, {} after suppression".format(
			len(rects), len(pick)))
		cv2.imshow("After NMS", image)
		ser.write('1'.encode())
	else:
		print('No person in view')
		# ser.write()
	key = cv2.waitKey(1) & 0xFF
cap.stop()
cv2.destroyAllWindows()