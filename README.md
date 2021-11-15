# Marondalgram 프로젝트

### 💻 프로젝트 소개 💻
Marondal 프로젝트는 SNS 중 **INSTARGRAM의 서비스를 카피**한 프로젝트 서비스입니다. INSTARGRAM의 **주요기능인 게시물 작성, 게시물 댓글 작성, 게시물 좋아요 등록 / 취소, 게시물 삭제** 등을 구현했습니다. 

### 💪 기술 정보 💪
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=java&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white)  
![Eclipse](https://img.shields.io/badge/Eclipse-FE7A16.svg?style=for-the-badge&logo=Eclipse&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)

### 📝 기획 및 설계 📝
- **UI 기획**  
https://ovenapp.io/project/WkO17YNj7SJYRczHJU67eTuZ5sDRr70M#1x0l9
- **DB, URL 설계**  
https://docs.google.com/spreadsheets/d/1_1TEfRFOkuqSpVpsPiafXd0sfzcAEp82I4ikD5ABIVY/edit#gid=0

### 🛠 주요 기능 🛠
- 회원가입, 로그인
  - package : [com.starkyb.marondalgram.user.*](https://github.com/Starkyoobin/web_marondalgram/tree/develop/src/main/java/com/starkyb/marondalgram/user)
  - view : [/webapp/WEB-INF/jsp/user/*](https://github.com/Starkyoobin/web_marondalgram/tree/develop/src/main/webapp/WEB-INF/jsp/user)
- Marondalgram 이미지 첨부 글 작성
  - package : [[com.starkyb.marondalgram.post.*](https://github.com/Starkyoobin/web_marondalgram/tree/develop/src/main/java/com/starkyb/marondalgram/post)
  - view : [/webapp/WEB-INF/jsp/post/*](https://github.com/Starkyoobin/web_marondalgram/tree/develop/src/main/webapp/WEB-INF/jsp/post)
- Marondalgram 좋아요
  - package : [[com.starkyb.marondalgram.post.like.*](https://github.com/Starkyoobin/web_marondalgram/tree/develop/src/main/java/com/starkyb/marondalgram/post/like)
  - view : [/webapp/WEB-INF/jsp/post/*](https://github.com/Starkyoobin/web_marondalgram/tree/develop/src/main/webapp/WEB-INF/jsp/post)
- Marondalgram 게시물 댓글 작성
  - package : [[com.starkyb.marondalgram.post.comment.*](https://github.com/Starkyoobin/web_marondalgram/tree/develop/src/main/java/com/starkyb/marondalgram/post/comment)
  - view : [/webapp/WEB-INF/jsp/post/*](https://github.com/Starkyoobin/web_marondalgram/tree/develop/src/main/webapp/WEB-INF/jsp/post)

### 📋 향후 계획 📋
- 로그인 보안성 강화 (Spring Security)
- 유저 팔로우 기능
