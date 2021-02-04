import cv2

from image_processing import process_image


class ImageMatchService:
    def __init__(self, image):
        self.img = process_image(image)
        self.orb = cv2.ORB_create(nfeatures=1000)
        self.kp, self.des = self.orb.detectAndCompute(self.img, None)
        self.bf = cv2.BFMatcher()

    def handle(self, images):
        scores = []
        for image in images:
            img = process_image(image)
            kp, des = self.orb.detectAndCompute(img, None)

            matches = self.bf.knnMatch(self.des, des, k=2)

            good = []
            for m, n in matches:
                if m.distance < 0.75*n.distance:
                    good.append([m])

            scores.append(len(good))

        return scores
