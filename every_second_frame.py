import cv2
import math

rtsp = ""
imagesFolder = ""
cap = cv2.VideoCapture(rtsp)
frameRate = cap.get(cv2.CAP_PROP_FPS) # frame rate (5)
while(cap.isOpened()):
    frameId = cap.get(cv2.CAP_PROP_POS_FRAMES) # current frame number (1)
    ret, frame = cap.read()
    if (ret != True):
        break
    if (frameId % (math.floor(frameRate)*2) == 0):
        filename = imagesFolder + "/image_" +  str(int(frameId)) + ".jpg"
        cv2.imwrite(filename, frame)
cap.release()
print("Done!")