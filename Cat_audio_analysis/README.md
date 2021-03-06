# 머신러닝을 활용한 고양이 음성데이터 분석 및 응용


- 목표: 머신러닝을 활용한 고양이의 울음 소리 분석
- 개발환경/사용언어: Windows 10 Jupyter Notebook / Python3 / Tensorflow
- 고양이 음성 데이터수: 2950개
- 라벨링: 10개 (Angry / Defence / Fighting / Happy / HuntingMind / Mating / MotherCall / Paining / Resting / Warning)
- MFCC 특징값 사용

## 1) 간단한 분류기와 5겹 교차 검증을 통한 데이터 학습

![머신1](https://user-images.githubusercontent.com/53013786/82657709-c5f23600-9c60-11ea-9d1f-c89fd8467f18.JPG)

## 2) CNN을 통한 딥러닝

1. 트레인셋:테스트셋 = 8:2
2. 스펙토그램 생성
3. 생성된 스펙토그램을 여러 층의 레이어로 분류
4. CNN 분석/분류
5. 테스트 진행

![image](https://user-images.githubusercontent.com/53013786/82658347-cb03b500-9c61-11ea-98e8-22722ba5b520.png)
