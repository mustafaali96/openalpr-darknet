import base64
import cv2

IMAGE_PATH = r'C:\Users\musta\Xclusive_solutions\darknet\ANPR\Licence_plate_detection\ocr.jpg'

with open(IMAGE_PATH, 'rb') as image_file:
        img_base64 = base64.b64encode(image_file.read())
        img = cv2.imread(IMAGE_PATH)
        print (img_base64)
cv2.imshow("image",img)
cv2.waitKey(0)
cv2.destroyAllWindows()