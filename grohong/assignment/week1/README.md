# LoginPage

- UITextField 와 UIButton 을 동시에 처리하기 위해 **StackView** 로 관리
- UIButton을 StackView에서 같은 크기로 처리하기 위해서 Distribution 속성을 **Fill 에서 Fill Equally** 로 수정
(보통 추천 방법에는 Hugging Priority를 바꿔서 처리하라고 하지만 창남이 형님 방법이 더 좋은거 같습니다.)

- asset에 이미지를 넣기 위해서는 꼭 Universal에 이미지가 있어야 한다.
- aspect Ration: 가로와 세로 비율을 맞춘다.

- UITextField에 비밀번호를 처리 할려면 **Secure Text Entry** 클릭
![secure](./images/SecureTextEntry)
