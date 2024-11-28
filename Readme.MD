1.	Instalación de:
-	Node.js
-	Ganache (App para usar una red personal de Ethereum)

2.	Dentro de Node.js:
-	npm install truffle –g (Instala truflle de forma global en el sistema)

3.	Moverse a un directorio y ejecutar para iniciar un proyecto:
-	truffle init “Nombre de dapp”

4.	Ir a “truffle-config.js” y confirgurar la sección:
-	 “development” con los datos de ganache al inciarlo
-	“compilers” con la version de solidity a usar

5.	Dentro del editor, abrir la terminal y ejecutar:
-	Para instalar dependencias: npm i lite.server bootstrap
-	Para iniciar los contratos inteligentes: “truflle deploy”
-	Para crear el archivo “package.json”: npm init –yes

6.	Dentro de “package.json” agregar en la sección “scripts”:
-	"dev": "lite-server"

7.	Comando para ejecutar la dapp: npm run dev
