#!/bin/bash
mkdir client server


#Setting up server
cd server
npm init -y
npm i express mongoose cors dotenv
npm i -D nodemon
mkdir src&&cd src&&touch app.js index.js

#Default express server in index.js
cat <<EOF > index.js
const express = require("express");

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());

app.get("/", (req, res) => {
  res.send(`Sup, Server Online 🚀`);
});

// Start server
app.listen(PORT, () => {
  console.log(\`Server listening on port \${PORT}\`);
});
EOF

cd ..

#Adding Nodemon
# Update package.json scripts (SAFE way using node)
node <<'EOF'
const fs = require("fs");

const pkg = JSON.parse(fs.readFileSync("package.json", "utf-8"));

pkg.scripts = {
  ...pkg.scripts,
  start: "node index.js",
  dev: "nodemon index.js"
};

fs.writeFileSync("package.json", JSON.stringify(pkg, null, 2));
EOF

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
#npm run dev


#Setting up Client


cd client
yes "" | npm create vite@latest . -- --template react --yes
npm i

#Folder Structure
cd src
mkdir components pages layouts routes services hooks context store utils
cd ..

#npm run dev

