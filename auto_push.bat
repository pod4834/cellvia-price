@echo off
chcp 65001 > nul
cd /d "C:\Users\kbj\OneDrive\Viable\http_HP\cellvia-price"

:: 1. Git 저장소가 아직 초기화되지 않았다면 자동으로 초기화
if not exist ".git" (
    echo ==========================================
    echo 최초 실행: Git 저장소를 초기화합니다...
    echo ==========================================
    git init
)

:: 2. 브랜치를 main으로 설정하고 GitHub 주소(pod4834/cellvia-price) 자동 연결
git branch -M main
git remote remove origin 2>nul
git remote add origin https://github.com/pod4834/cellvia-price.git

:: 3. 파일 추가, 커밋 및 GitHub 업로드
echo ==========================================
echo GitHub(pod4834/cellvia-price)로 업로드를 시작합니다...
echo ==========================================
git add .
set "commit_msg=Update price.html (%date% %time:~0,8%)"
git commit -m "%commit_msg%"
git push -u origin main

echo ==========================================
echo 업로드(Push)가 완료되었습니다!
echo GitHub 페이지를 새로고침(F5)하여 확인해 보세요.
echo ==========================================
pause