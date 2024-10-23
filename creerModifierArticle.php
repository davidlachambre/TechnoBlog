<?php
//LANGUE
    if (isset($_GET["langue"]) && ($_GET["langue"] === "FR" || $_GET["langue"] === "EN")) {
                $langue = $_GET["langue"];//la langue est sauvegardée seulement si une langue a été choisie et que le $_GET correspond à une des deux valeurs disponibles (pour ne pas qu'on puisse changer la langue manuellement dans l'url pour quelque chose qui n'existe pas). 
            }
    elseif (isset($_COOKIE["langue"])) {
        $langue = $_COOKIE["langue"];// Récupération de la langue du cookie.
    }
    else {
        $langue = "FR";//Langue par défaut.
    }
    setcookie("langue", $langue, time() + (60 * 60 * 24 * 365));//Crée le cookie à chaque visite de page.


//CHARGEMENT DES FICHIERS EXTERNES
	require_once("./php/fonctionsDB.php");
    require_once("./php/fonctionsXML.php");
    connectDB();//connexion à la bdd
    chargerXML();//Chargement du document XML des langues.


//VERIFIE SI ON EST AUTHENTIFIÉ À L'AIDE DE LA VARIABLE SESSION
    session_start();
    if (!isset($_SESSION["nomUsager"])) {
        echo traduire($langue, 'pageModifErreur1')."<br>";
        echo "<a href='index.php'>".traduire($langue, 'pageModifLien1')."</a>";
        exit();
    }


//VALIDATION
	$erreurTitreFR = "";
	$erreurTexteFR = "";
	$erreurTitreEN = "";
	$erreurTexteEN = "";
    $erreurMotsCles = "";
	$messageAjout = "";
	$erreurs = false;

	$titreFR = "";
	$texteFR = "";
	$titreEN = "";
	$texteEN = "";
    $nouveauMotCle ="";

	//première arrivée sur le formulaire, soit en ajout, soit en modif
	if(isset($_GET["action"]))
	{
		//déterminer le contenu du formulaire	
		if(isset($_GET["action"]) && $_GET["action"] === "modifier" && isset($_GET["idArticle"]))
		{
			//en modification, obtenir les infos dans la BD et les afficher dans le formulaire
			$idArticle = $_GET["idArticle"];
			$articles = getArticleByID($idArticle);
			
			//obtenir les infos de l'article existant dans la base de données
			if($article = mysqli_fetch_assoc($articles))
			{
				$titreFR = $article["titreFR"];
				$texteFR = $article["texteFR"];
				$titreEN = $article["titreEN"];
				$texteEN = $article["texteEN"];
				
				//déterminer la prochaine action
				$action = "sauvegardeModif";
			}
			else
			{
				//rediriger vers l'accueil
				header("Location: index.php?messageErreur=Article_inexistant.");
			}
		}
		else if(isset($_GET["action"]) && $_GET["action"] === "ajouter")
		{
			//en ajout, les champs restent vides
			//déterminer la prochaine action
			$action = "sauvegardeAjout";
		}
	}
	
	//lorsqu'on arrive du formulaire
	if(isset($_POST["sauvegarder"]))
	{	
		//validation du titre en français
		if(trim($_POST["titreFR"]) === "")
		{
			$erreurs = true;
			$erreurTitreFR = traduire($langue, 'pageModifErreur2');
		}
		else
			$titreFR = htmlspecialchars($_POST["titreFR"]);
		
		//validation du texte en français
		if(trim($_POST["texteFR"]) === "")
		{
			$erreurs = true;
			$erreurTexteFR = traduire($langue, 'pageModifErreur3');
		}
		else
			$texteFR = htmlspecialchars($_POST["texteFR"]);

        //validation du titre en anglais
		if(trim($_POST["titreEN"]) === "")
		{
			$erreurs = true;
			$erreurTitreEN = traduire($langue, 'pageModifErreur4');
		}
		else
			$titreEN = htmlspecialchars($_POST["titreEN"]);
		
		//validation du texte en anglais
		if(trim($_POST["texteEN"]) === "")
		{
			$erreurs = true;
			$erreurTexteEN = traduire($langue, 'pageModifErreur5');
		}
		else
			$texteEN = htmlspecialchars($_POST["texteEN"]);	
        
		//remettre le bon idArticle	
		if(isset($_POST["idArticle"]))
		{
			$idArticle = $_POST["idArticle"];
        }
        
        //validation du champs mots clés
        if (isset($_POST["ajoutMotCle"])) {
            if (trim($_POST["ajoutMotCle"]) === "") {
                $erreurs = true;
                $erreurMotsCles = traduire($langue, 'pageModifErreur6');
            }
            elseif (!preg_match_all("/^[a-z0-9\-\.]+(&[a-z0-9\-\.]*)*[a-z0-9\-\.]$/i", $_POST["ajoutMotCle"], $resultatRegEx)) {
                $erreurs = true;
                $erreurMotsCles = traduire($langue, 'pageModifErreur7');
            }
            else {
                $nouveauMotCle = $_POST["ajoutMotCle"];
            }
        }

		//si il n'y a aucune erreur
		if(!$erreurs)
		{
			if($_POST["action"] === "sauvegardeAjout")
			{
                //insérer dans la BD
				if(creerArticle($titreFR, $texteFR, $titreEN, $texteEN, $_SESSION["idAuteur"]))
				{
                    //récupération de l'id pour le nouvel article créé
                    $idArticle = IdNouvelArticle($titreFR, $_SESSION["idAuteur"]);
                    //créer un tableau à partir d'une chaine de mots clés
                    $tabNouveauMotCle = explode("&", $nouveauMotCle);
                    foreach($tabNouveauMotCle as $nouveauMotCle)
                    {
                        //récupération de l'id du mot clé s'il existe dans la BD
                        $idMotCle = idMotCle($nouveauMotCle);
                        if (!$idMotCle) {
                            ajouterMotCle($nouveauMotCle);
                            $idMotCle = idMotCle($nouveauMotCle);
                        }
                        //crée le lien entre l'article et le mot clé dans la BD
                        ajouterIdMotCleEtIdArticle($idArticle, $idMotCle);
                    }
					//rediriger vers la page index.php
					header("Location: index.php");
					exit();
				}
				else
					$messageAjout = "*Erreur de l'ajout.";
			}
			else if($_POST["action"] === "sauvegardeModif")
			{
				//update dans la base de données
				$idArticle = $_POST["idArticle"];
				if(modifierArticle($titreFR, $texteFR, $titreEN, $texteEN, $idArticle))
				{
					//rediriger vers la page index.php
					header("Location: index.php");
					exit();
				}
				else
					$messageAjout = "*Erreur de la modification.";
			}
		}
		else
			$action = $_POST["action"];
	}
?>
<html>
    <head>
        <title><?php echo traduire($langue, "titreSite")?></title>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" href="img/favicon.png">
        <link rel="stylesheet" type="text/css" href="./css/styles.css">
    </head>
    <header>
        <img src="img/logo_technoblog.png" alt="Logo TechnoBlog" width="250">
    </header>
	<body>
        <h1><?php echo traduire($langue, "pageModifTitre1")?></h1>
		<div>
            <a class='btn_article' href="index.php?langue=<?php echo $langue ?>"><?php echo traduire($langue, "pageModifLien1")?></a>
			<form class='form_creer_modifier' method="POST" action="<?php echo $_SERVER["PHP_SELF"];?>">
			    <p>
				<?php
                if(isset($_GET["action"]) && $_GET["action"] === "modifier" && isset($_GET["idArticle"]) || isset($_POST["idArticle"])) {
                ?>
                    <input type="hidden" name="idArticle" value="<?php echo $idArticle; ?>"><br>
                <?php
				}
				?>
				<?php echo traduire($langue, "pageModifTexte1")?> <input type="text" name="titreFR" value="<?php echo $titreFR; ?>"><span class="espaceBas20 erreur"><?php echo $erreurTitreFR;?></span>
				<?php echo traduire($langue, "pageModifTexte2")?> <textarea name="texteFR"><?php echo $texteFR; ?></textarea><span class="espaceBas20 erreur"><?php echo $erreurTexteFR;?></span>
				<?php echo traduire($langue, "pageModifTexte3")?> <input type="text" name="titreEN" value="<?php echo $titreEN; ?>"><span class="espaceBas20 erreur"><?php echo $erreurTitreEN;?></span>
				<?php echo traduire($langue, "pageModifTexte4")?> <textarea name="texteEN"><?php echo $texteEN; ?></textarea><span class="espaceBas20 erreur"><?php echo $erreurTexteEN;?></span>

                <?php
                //si on ajoute un article, affiche l'input de l'ajout de mots clés
                if((isset($_GET["action"]) && $_GET["action"] === "ajouter") || (isset($_POST["action"]) && $_POST["action"] === "sauvegardeAjout")) {
                    echo traduire($langue, "pageModifTexte5");?> <input type="text" name="ajoutMotCle" value="<?php echo $nouveauMotCle?>"><span class="espaceBas20 erreur"><?php echo $erreurMotsCles;?></span>
                <?php
				}
				?>
				</p>
				<input type="hidden" name="action" value="<?php echo $action; ?>">
				<input type="submit" name="sauvegarder" value="<?php echo traduire($langue, "pageModifBouton1")?>">
			</form>
		</div>
		<p><?php echo $messageAjout; ?></p>
        <?php
			//fermeture de la connexion
			closeDB();
        ?>
        <footer>
            <p>Gr. 1797 / David Lachambre et Amélie Léveillé / TP2 - Médiatiques et bdd, Programmation Web II</p>
        </footer>
	</body>
</html>