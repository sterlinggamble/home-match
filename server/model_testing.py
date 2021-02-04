import cv2

img1 = cv2.imread('test_images/modern1.jpg', 0)
# img2 = cv2.imread('test_images/modern2.jpg', 0)
img2 = cv2.imread('test_images/sf-victorian-architecture.jpg', 0)

orb = cv2.ORB_create(nfeatures=1000)

kp1, des1 = orb.detectAndCompute(img1, None)
kp2, des2 = orb.detectAndCompute(img2, None)

bf = cv2.BFMatcher()
matches = bf.knnMatch(des1, des2, k=2)

good = []
for m, n in matches:
    if m.distance < 0.75*n.distance:
        good.append([m])

print(len(good))
img3 = cv2.drawMatchesKnn(img1, kp1, img2, kp2, good, None, flags=2)
cv2.imshow('img3', img3)
# cv2.waitKey(0)

# # import image from url
# url = "image.com/image.jpg"
# file = urlopen(url)
# img = np.asarray(bytearray(file.read()), dtype="uint8")
# img = cv2.imdecode(img, cv2.IMREAD_GRAYSCALE)
