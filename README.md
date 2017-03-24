asptt
=====

Projet site Internet Asptt Nantes Handball en Symfony 3

Contributeurs:
  - Laetitia Autier
  - Thomas Billiau
  - Francois Le Gallo
  - Alexandre Thorel
  - Emmanuel Ripoll

Pour Installer le projet:
  - git clone https://github.com/manolo317/fil-rouge.git 
  - $ (dev) git pull origin dev (je récupère la dernière version de dev)
  - $ (dev) git checkout -b picsou-featureUser (je créé ma branche)
  - $ (picsou-featureUser) composer update (ou composer.phar update)
  - dans le fichier fil-rouge/app/config/parameters.yml je modifie:
      - database_host: localhost
      - database_port: null
      - database_name: symfony_asptt
      - database_user: root
      - database_password: tonmotdepasse
  - je lance mon Wamp
  - je créé un projet avec mon IDE préféré (PhpStorm!!!)
  - $ (picsou-featureUser) php bin/console doctrine:database:create
  - sur phpMyAdmin, j'importe le fichier symfony_asptt.sql (données Team, Category, Image)
  - $ (picsou-featureUser) php bin/console doctrine:schema:update --force
  - $ (picsou-featureUser) php bin/console doctrine:schema:validate
 
  
  Quand j'ai des choses à commit:
  - $ (picsou-featureUser) git add .
  - $ (picsou-featureUser) git commit -m “Added blabla”
  Et de tems en temps un push
  - $ (picsou-featureUser) git push origin picsou-featureUser

  Pour merger dans la branche dev, je demande à Papa :p
  Reste plus qu'à coder!
