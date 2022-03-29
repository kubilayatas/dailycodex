import cv2
vid = cv2.VideoCapture(0)

while(True):
  ret, frame = vid.read()
  cv2.imshow('frame', frame)
  keyCode = cv2.waitKey(10) & 0xFF
  # Stop the program on the ESC key or 'q'
  if keyCode == 27 or keyCode == ord('q'):
    break

vid.release()
cv2.destroyAllWindows()
