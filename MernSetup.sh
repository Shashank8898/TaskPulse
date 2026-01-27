#!/bin/bash
mkdir client server


#Setting up server
cd server
npm init -y
mkdir src&&cd src&&touch app.js index.js&&cd ..
#Routes
mkdir routes&&cd routes&&touch auth.route.js user.route.js&&cd ..
#Controllers
mkdir controller&&cd controller&&touch auth.controller.js user.controller.j&&cd ..
#Models
mkdir models&&cd models&&touch user.js&&cd ..
#Middlewares
mkdir middlewares&&cd middlewares&&touch auth.middleware.js error.middleware.js rateLimit.middleware.js&&cd ..
#Utils
mkdir utils&&cd utils&&touch asyncHandles.js logger.js&&cd ..
#Enviroment
touch .env
cd ..

#To be removed for deployment

rm -r server


#Setting up Client
echo "Setting up client now"
echo "Project Name:";read Project_Name

cd client
yes "" | npm create vite@latest $Project_Name . -- --template react







