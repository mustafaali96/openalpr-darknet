
#!/usr/bin/python
from database import db_insert
import requests
import base64
import json
import sys
import cv2
import cv2 as cv
import argparse
import numpy as np
import os.path
from PIL import Image
import pytesseract


confThreshold = 0.001 #0.5  #Confidence threshold
nmsThreshold = 0.001  #0.4 #Non-maximum suppression threshold

inpWidth =  608 #416  #608     #Width of network's input image
inpHeight = 608 #416 #608     #Height of network's input image
classesFile = "classes.names";
classes = None

modelConfiguration = "darknet-yolov3.cfg";
modelWeights = "lapi.weights";
    
#parser = argparse.ArgumentParser(description='Object Detection using YOLO in OPENCV')
#parser.add_argument('--image', help='Path to image file.', default=image_path)
#parser.add_argument('--video', help='Path to video file.')
#args = parser.parse_args()    
    
with open(classesFile, 'rt') as f:
    classes = f.read().rstrip('\n').split('\n')
    
net = cv.dnn.readNetFromDarknet(modelConfiguration, modelWeights)
net.setPreferableBackend(cv.dnn.DNN_BACKEND_OPENCV)
net.setPreferableTarget(cv.dnn.DNN_TARGET_CPU)    
    

#ocr_num = "Openalpr file"

def openalpr_read_plate(image_path):
    
    parser = argparse.ArgumentParser(description='Object Detection using YOLO in OPENCV')
    parser.add_argument('--image', help='Path to image file.', default=image_path)
    parser.add_argument('--video', help='Path to video file.')
    args = parser.parse_args()  

    
    
    if (image_path is None):
        print("Invalid image path: None")
        exit

    if (image_path == ""):
        print("Invalid image path: Empty")
        exit
    
    #print("Image path " + image_path)

    IMAGE_PATH = image_path 

    #SECRET_KEY = 'sk_8273e46a5c80033d585dd73c'
    #SECRET_KEY = 'sk_9e0e935470a5dac1139d26e1'
 



    img = cv.imread(IMAGE_PATH)
        
    # Get the names of the output layers
    def getOutputsNames(net):
        # Get the names of all the layers in the network
        layersNames = net.getLayerNames()
        # Get the names of the output layers, i.e. the layers with unconnected outputs
        return [layersNames[i[0] - 1] for i in net.getUnconnectedOutLayers()]

    def postprocess(frame, outs):
        frameHeight = frame.shape[0]
        frameWidth = frame.shape[1]

        classIds = []
        confidences = []
        boxes = []
        # Scan through all the bounding boxes output from the network and keep only the
        # ones with high confidence scores. Assign the box's class label as the class with the highest score.
        classIds = []
        confidences = []
        boxes = []
        for out in outs:
            print("out.shape : ", out.shape)
            for detection in out:
                #if detection[4]>0.001:
                scores = detection[5:]
                classId = np.argmax(scores)
                #if scores[classId]>confThreshold:
                confidence = scores[classId]
                if detection[4]>confThreshold:
                    print(detection[4], " - ", scores[classId], " - th : ", confThreshold)
                    print(detection)
                if confidence > confThreshold:
                    center_x = int(detection[0] * frameWidth)
                    center_y = int(detection[1] * frameHeight)
                    width = int(detection[2] * frameWidth)
                    height = int(detection[3] * frameHeight)
                    left = int(center_x - width / 2)
                    top = int(center_y - height / 2)
                    classIds.append(classId)
                    confidences.append(float(confidence))
                    boxes.append([left, top, width, height])

        # Perform non maximum suppression to eliminate redundant overlapping boxes with
        # lower confidences.
        indices = cv.dnn.NMSBoxes(boxes, confidences, confThreshold, nmsThreshold)
        for i in indices:
            i = i[0]
            box = boxes[i]
            left = box[0]
            top = box[1]
            width = box[2]
            height = box[3]
            plate_roi(left, top, left + width, top + height)
            drawPred(classIds[i], confidences[i], left, top, left + width, top + height)
            #print("v is", v)
    
    # Get License Plate ROI
    def plate_roi(left,top,right,bottom):
        
        lic_plate = frame[top:bottom+3, left:right]
        img = cv2.resize(lic_plate, (0,0), fx=7.0, fy=7.0)
        gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
        blur = cv2.GaussianBlur(gray,(5,5),0)
        ret, thresh = cv2.threshold(gray, 0, 255, cv2.THRESH_OTSU)
        ret1, bin_otsu = cv2.threshold(blur,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)
        thr = cv2.adaptiveThreshold(gray,255,cv2.ADAPTIVE_THRESH_MEAN_C,cv2.THRESH_BINARY,21,13)
        kernel = np.ones((3,3),np.uint8)                           #kernel window size 7x7
        erosion = cv2.erode(bin_otsu,kernel,iterations = 2) 
        dialate = cv2.dilate(erosion,kernel,iterations = 3) 
        pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract'
        ocr_thr, ocr_thresh, ocr_ero, ocr_dia, ocr_bin_otsu = pytesseract.image_to_string(thr),  pytesseract.image_to_string(thresh), pytesseract.image_to_string(erosion), pytesseract.image_to_string(dialate) , pytesseract.image_to_string(bin_otsu)
        print("OCR result by thr: ", ocr_thr ," \nOCR result by thresh ", ocr_thresh , "\nOCR result by Erosion", ocr_ero  , "\nOCR results by Dialation " , ocr_dia, "\nOCR results bu bin_otsu" , ocr_bin_otsu)
        #ocr_thr = ocr_thr.split()
        #ocr_thr = ocr_thr[0] + ocr_thr[1]
        plate = ocr_thresh #ocr_thr
        global ocr_num
        ocr_num = plate
        print("Plate number is: ",ocr_num)
        cv.imwrite("PlateImages\plate.jpg",lic_plate)
        return ocr_num

    #return ocr_num
        #cv.imshow("Plate",lic_plate)
        #cv.waitKey(0)
        #cv.destroyAllWindows()

    
    
    # Draw the predicted bounding box
    def drawPred(classId, conf, left, top, right, bottom):

        #lic_plate = frame[top:bottom+3, left:right]
        #cv.imshow("Plate",lic_plate)
        #cv.waitKey(0)
        #cv.destroyAllWindows()

        # Draw a bounding box.
        #    cv.rectangle(frame, (left, top), (right, bottom), (255, 178, 50), 3)
        cv.rectangle(frame, (left, top), (right, bottom), (0, 255, 0), 3)


    outputFile = "yolo_out_py.avi"
    if (args.image):
        # Open the image file
        if not os.path.isfile(args.image):
            print("Input image file ", args.image, " doesn't exist")
            sys.exit(1)
        cap = cv.VideoCapture(args.image)
        outputFile = args.image[:-4]+'_yolo_out_py.jpg'
    elif (args.video):
        # Open the video file
        if not os.path.isfile(args.video):
            print("Input video file ", args.video, " doesn't exist")
            sys.exit(1)
        cap = cv.VideoCapture(args.video)
        outputFile = args.video[:-4]+'_yolo_out_py.avi'
    else:
        # Webcam input
        cap = cv.VideoCapture(0)

    # Get the video writer initialized to save the output video
    if (not args.image):
        vid_writer = cv.VideoWriter(outputFile, cv.VideoWriter_fourcc('M','J','P','G'), 30, (round(cap.get(cv.CAP_PROP_FRAME_WIDTH)),round(cap.get(cv.CAP_PROP_FRAME_HEIGHT))))

    while cv.waitKey(1) < 0:

        # get frame from the video
        hasFrame, frame = cap.read()

        # Stop the program if reached end of video
        if not hasFrame:
            print("Done processing !!!")
            print("Output file is stored as ", outputFile)
            cv.waitKey(3000)
            break

        # Create a 4D blob from a frame.
        blob = cv.dnn.blobFromImage(frame, 1/255, (inpWidth, inpHeight), [0,0,0], 1, crop=False)

        # Sets the input to the network
        net.setInput(blob)

        # Runs the forward pass to get output of the output layers
        outs = net.forward(getOutputsNames(net))

        # Remove the bounding boxes with low confidence
        postprocess(frame, outs)

        # Put efficiency information. The function getPerfProfile returns the overall time for inference(t) and the timings for each of the layers(in layersTimes)
        t, _ = net.getPerfProfile()
        label = 'Inference time: %.2f ms' % (t * 1000.0 / cv.getTickFrequency())
        #cv.putText(frame, label, (0, 15), cv.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255))

       
    
    print("Ocr return funtion ",ocr_num)
    return ocr_num
#plate,make,color,type = openalpr_read_plate("C:/Users/admin/Desktop/openalpr/LicPlateImages/1.png")
#print(plate,make,color,type)