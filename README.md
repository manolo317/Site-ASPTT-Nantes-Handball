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
  - git clone https://github.com/manolo317/fil-rouge.git  (dans un repertoire de www de Wamp)
  - $ (master) git checkout dev (je me mets sur la branche dev)
  - $ (dev) git pull origin dev (je récupère la dernière version de dev)
  - $ (dev) git checkout -b picsou-featureUser
  - $ (picsou-featureUser) composer update (ou composer.phar update)
  - je lance mon Wamp
  - je créé un projet avec mon IDE préféré (PhpStorm!!!)
  - dans le fichier fil-rouge/app/config/parameters.yml je modifie:
      database_host: localhost
      database_port: null
      database_name: symfony_asptt
      database_user: root
      database_password: tonmotdepasse
      
  - $ (picsou-featureUser) php bin/console doctrine:database:create
  - $ (picsou-featureUser) php bin/console doctrine:schema:update --force
  - $ (picsou-featureUser) php bin/console doctrine:schema:validate
  - sur phpMyAdmin, j'importe le fichier symfony_asptt.sql (données Team, Category, Image)
  Reste plus qu'à coder!
