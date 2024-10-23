<?php
header('Content-Type: text/html; charset=utf-8');

    /* Connexion à la bdd */
	function connectDB()
	{
		global $connexion;
        $connexion = mysqli_connect("localhost", "root", "");
		if(!$connexion)
		{
			//fin de l'exécution du script
			die("Erreur de connexion à la base de données." . mysqli_connect_error());				
		}
        
        $selected = mysqli_select_db($connexion, "root");
        
		if(!$selected)
			die("La base de données n'existe pas.");

		//s'assurer que les requêtes sont en utf-8	
        mysqli_query($connexion,"SET NAMES 'utf8'");		
	}

    /* Déconnexion à la bdd */
	function closeDB()
	{
		global $connexion;
		mysqli_close($connexion);			
	}
    
    //retourne le mot de passe encrypté pour un usager donné	
	function MotDePasse($nomUsager)
	{
		global $connexion;
		$resultats = mysqli_query($connexion, "SELECT motDePasse FROM auteurs WHERE nomUsager = '" . mysqli_real_escape_string($connexion, $nomUsager) . "';");
		if($resultats)
		{
			$rangee = mysqli_fetch_assoc($resultats);
			return $rangee["motDePasse"];
		}
		else
		{
			return false;
		}
	}

    /* Récupérer tous les articles en ordre décroissant (id), leur titre, le nom de l'auteur de l'article ainsi que le id de l'auteur de l'article - en fonction de la langue choisie */
	function getAllArticles($langue)
	{
		global $connexion;
		$resultats = mysqli_query($connexion, "SELECT idArticle, titre" . $langue . ", texte" . $langue . ", CONCAT(prenomAuteur, ' ', nomAuteur) AS auteur, auteurArticle FROM articles JOIN auteurs ON auteurArticle = idAuteur ORDER BY idArticle DESC;");
		return $resultats;
	}

    /* Récupérer un article avec son id */
    function getArticleByID($idArticle)
    {
        global $connexion;
        $resultats = mysqli_query($connexion, "SELECT idArticle, titreFR, texteFR, titreEN, texteEN FROM articles WHERE idArticle =" . $idArticle . ";");
        return $resultats;   
    }

    /* Récupérer tous les mots clés associés à un article */
	function getAllMotsCles($idArticle)
	{
		global $connexion;
		$resultats = mysqli_query($connexion, "SELECT idMotCle, motCle FROM motsCles JOIN articlesMotsCles ON idMotCle = mot WHERE article =" . $idArticle . ";");
		return $resultats;
	}

    /* Récupérer tous les articles associés à un usager en ordre décroissant (id), leur titre ainsi que le nom de l'auteur de l'article - en fonction de la langue choisie */
	function getArticlesByIdAuteur($langue, $idAuteur)
	{
		global $connexion;
		$resultats = mysqli_query($connexion, "SELECT idArticle, titre" . $langue . ", texte" . $langue . ", CONCAT(prenomAuteur, ' ', nomAuteur) AS auteur FROM articles JOIN auteurs ON auteurArticle = idAuteur WHERE idAuteur =" . $idAuteur . " ORDER BY idArticle DESC;");
		return $resultats;
	}
    
    /* Récupérer tous les articles associés à un mot-clé en ordre décroissant (id), leur titre ainsi que le nom de l'auteur de l'article - en fonction de la langue choisie */
	function getArticlesByMot($langue, $mot)
	{
		global $connexion;
		$resultats = mysqli_query($connexion, "SELECT idArticle, titre" . $langue . ", texte" . $langue . ", CONCAT(prenomAuteur, ' ', nomAuteur) AS auteur, auteurArticle FROM articles JOIN auteurs ON auteurArticle = idAuteur JOIN articlesMotsCles ON idArticle = article WHERE mot =" . $mot . " ORDER BY idArticle DESC;");
		return $resultats;
	}

    /* Récupérer tous les mots clés et leur id triés par popularité (références) */
	function getAllMotsClesPopularite()
	{
		global $connexion;
		$resultats = mysqli_query($connexion, "SELECT motCle, idMotCle, COUNT(mot) AS nbReferences FROM motsCles JOIN articlesMotsCles ON idMotCle = mot GROUP BY motCle ORDER BY nbReferences DESC;");
		return $resultats;
	}

    /* Créer un article */
	function creerArticle($titreFR, $texteFR, $titreEN, $texteEN, $idAuteur)
	{
		global $connexion;
		$resultats = mysqli_query($connexion, "INSERT INTO articles (titreFR, texteFR, titreEN, texteEN, auteurArticle) VALUES ('" . mysqli_real_escape_string($connexion, $titreFR) . "', '" . mysqli_real_escape_string($connexion, $texteFR) . "', '" . mysqli_real_escape_string($connexion, $titreEN) . "', '" . mysqli_real_escape_string($connexion, $texteEN) . "', '" . mysqli_real_escape_string($connexion, $idAuteur) . "');");
		return $resultats;
	}

    /* Modifier un article */
	function modifierArticle($titreFR, $texteFR, $titreEN, $texteEN, $idArticle)
	{
		global $connexion;
		$resultats = mysqli_query($connexion, "UPDATE articles SET titreFR='" . mysqli_real_escape_string($connexion, $titreFR) . "', texteFR='" . mysqli_real_escape_string($connexion, $texteFR) . "', titreEN='" . mysqli_real_escape_string($connexion, $titreEN) . "', texteEN='" . mysqli_real_escape_string($connexion, $texteEN) . "' WHERE idArticle=" . $idArticle . ";");
		return $resultats;
	}

    /* Récupérer l'auteur d'un article */
    function auteurArticle($nomUsager)
	{
		global $connexion;
		$resultats = mysqli_query($connexion, "SELECT idAuteur FROM auteurs WHERE nomUsager ='" . $nomUsager . "';");
		return $resultats;
	}

    /*Récupérer l'id du nouvel article créé*/
    function IdNouvelArticle($titreFR, $idAuteur) {
        global $connexion;
        $resultats = mysqli_query($connexion, "SELECT idArticle FROM articles WHERE titreFR ='" . $titreFR . "' AND auteurArticle = '" . $idAuteur . "';");
		$resultat = mysqli_fetch_assoc($resultats);
		return $resultat["idArticle"];
    }

    /* Ajouter un mot clé à la bdd */
    function ajouterMotCle($nouveauMotCle)
	{
		global $connexion;
		$resultats = mysqli_query($connexion, "INSERT INTO motsCles (motCle) VALUES ('" . $nouveauMotCle . "');");
		return $resultats;
	}

    /* Récupérer l'id d'un mot clé */
    function idMotCle($nouveauMotCle)
	{
		global $connexion;
		$resultats = mysqli_query($connexion, "SELECT idMotCle FROM motsCles WHERE motCle = '" . $nouveauMotCle . "';");
        if ($resultats) {
            $resultat = mysqli_fetch_assoc($resultats);
		return $resultat["idMotCle"];
        }
        else {
            return false;
        }
	}  

    /* Ajouter le id d'un nouveau mot clé et le id de l'article associé dans la bdd */
    function ajouterIdMotCleEtIdArticle($idArticle, $idMotCle)
	{
		global $connexion;
        $verif = mysqli_query($connexion, "SELECT article, mot FROM articlesMotsCles WHERE article = '" . $idArticle . "' AND mot = '" . $idMotCle . "';");//vérification pour s'assurer que l'association article / mot clé n'existe pas avant de la créer
        $resultatVerif = mysqli_fetch_assoc($verif);
        if ($resultatVerif["mot"] === null) {
            $resultats = mysqli_query($connexion, "INSERT INTO articlesMotsCles (article, mot) VALUES (" . $idArticle . ", " . $idMotCle . ");");
        return $resultats;
        }
	} 
?>