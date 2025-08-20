@echo off
echo 🚀 Starting Flutter Web Deployment...

:: Step 1 - Build Flutter Web
echo 📦 Building Flutter Web...
flutter build web
if %errorlevel% neq 0 (
    echo ❌ Flutter build failed!
    pause
    exit /b %errorlevel%
)

:: Step 2 - Commit changes to main branch
echo 🔄 Committing changes to main branch...
git add .
git commit -m "Update project and web build" || echo (No changes to commit)
git branch -M main
git push -u origin main

:: Step 3 - Deploy build/web to gh-pages
echo 🌍 Deploying build/web to gh-pages...
git subtree push --prefix build/web origin gh-pages

echo ✅ Deployment Complete!
echo Your app will be live soon at: https://sellorammile.github.io/flipbook/
pause
