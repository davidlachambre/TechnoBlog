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


//VARIABLE SESSION
session_start();//La variable session sera créé et affecté à true si login est bon.
if(!isset($_SESSION["grainSel"])) {
    $nombreAleatoire = rand(1, 1000);
    $_SESSION["grainSel"] = $nombreAleatoire;
}


//CHARGEMENT DES FICHIERS EXTERNES
	require_once("./php/fonctionsDB.php");
    require_once("./php/fonctionsXML.php");
    chargerXML();//Chargement du document XML des langues.
    connectDB();//connexion à la bdd


//VALIDATION
    $msgUsager = "";
    $nomUsager = "";
    $motDePasse = "";
    $login = false;
    $erreurs = false;

    //si le grain de sel n'a pas été créé, le créer
	if(!isset($_SESSION["grainSel"])) {
		$nombreAleatoire = rand(1, 1000);
		$_SESSION["grainSel"] = $nombreAleatoire;
	}

    //logout
    if (isset($_POST["logout"])) {
        //détruit la variable session (déconnexion)
        unset($_SESSION['nomUsager']);
        $login = false;
    }

    //erreurs
    if (isset($_POST["username"])) {
        if (trim($_POST["username"]) === "") {
            $msgUsager = "<span class='erreur alignementDroit'>".traduire($langue, "pageAccueilMsgUsager1")."</span>";
            $erreurs = true;
        }
        else {
            $nomUsager = htmlspecialchars($_POST["username"]);
        }           
    }

    if (isset($_POST["password"])) {
        if (trim($_POST["password"]) === "") {
            $msgUsager = "<span class='erreur alignementDroit'>".traduire($langue, "pageAccueilMsgUsager1")."</span>";
            $erreurs = true;
        }
        else {
            $motDePasse = htmlspecialchars($_POST["password"]);
        }           
    }

	//valider si l'usager est authentifié
	if(isset($_POST["username"]) && isset($_POST["password"]) && $erreurs === false) {
		//vérifier si la combinaison username/password est valide
		$motDePasseMD5 = MotDePasse($nomUsager);
		$motDePassePlusGrainSel = md5($_SESSION["grainSel"] . $motDePasseMD5);

		if($motDePasse === $motDePassePlusGrainSel) {
			//créer la variable session pour spécifier que l'usager est authentifié
			$_SESSION["nomUsager"] = $nomUsager;
        }
        else {
            //message d'erreur "Nom d'usager et / ou mot de passe invalide(s)"
            $msgUsager = "<span class='erreur alignementDroit'>".traduire($langue, "pageAccueilMsgUsager3")."</span>";
        }
    }

    if (isset($_SESSION["nomUsager"])) {
        $msgUsager = traduire($langue, "pageAccueilMsgUsager2").$_SESSION["nomUsager"]."!";
        $login = true;
    }
?>
<html>
    <head>
        <title><?php echo traduire($langue, "titreSite")?></title>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" href="img/favicon.png">
        <link rel="stylesheet" type="text/css" href="./css/styles.css">
        <script type="text/javascript" src="./js/fonctionsBlogue.js"></script>
    </head>
	<body>
        <header>
            <!--sélection de la langue-->
            <form method="GET" name="choixLangue" class="choixLangue">
                <?php echo traduire($langue, "pageAccueilTexte1")?>
                <select class="select" name="langue" onchange="this.form.submit();">
                    <option value="FR" <?php if($langue === "FR") echo "selected='selected'"?>>Français</option>;
                    <option value="EN" <?php if($langue === "EN") echo "selected='selected'"?>>English</option>;
                </select>
            </form>
            <?php
            if (!isset($_SESSION["nomUsager"]) || $login === false) {
                    echo "<form method='POST' name='loginForm'><input type='text' name='username' class='login'><br class='clear'><input type='password' name='password' class='login'><br class='clear'><input type='button' class='login' value='" . traduire($langue, 'pageAccueilBouton1') . "' onclick='encrypte()'><input type='hidden' name='grainSel' value='" . $_SESSION['grainSel'] . "'></form><br class='clear'><form method='POST' name='formEncrypte' action='index.php'><input type='hidden' name='username'><input type='hidden' name='password'></form>";
            }

            //affiche la zone de message usager (erreur ou bienvenu si authentifié)
            echo "<p class='msg'>$msgUsager</p><br>";
            if ($login === true) {
                //bouton logout si authentifié
                echo "<form name='logoutForm' method='POST'><input type='submit' name='logout' value='".traduire($langue, 'pageAccueilBouton2')."' class='logout'></form>";
            }
            ?>
            <img src="img/logo_technoblog.png" alt="Logo TechnoBlog" width="380">
        </header>
        <h1><?php echo traduire($langue, "pageAccueilTitre1")?></h1>
        <?php
            //lien pour ajouter un article
            if ($login === true) {
                echo "<a class='btn_ajouter' href='creerModifierArticle.php?action=ajouter&langue=$langue'>".traduire($langue, "pageAccueilLien1")."</a>";
            }

            //lien pour afficher tous les articles
            if (isset($_GET['idMotCle'])) {
                echo "<a class='btn_article' href='index.php?langue=$langue' class='espaceBas20'>".traduire($langue, "pageAccueilLien4")."</a>";
            }

            //affichage des mots clé par popularité
            echo "<p class='espaceBas30'>" . traduire($langue, "pageAccueilTexte2");
            $motsClesPop = getAllMotsClesPopularite();
            while($motClePop = mysqli_fetch_assoc($motsClesPop)) {
                echo "<a href='index.php?idMotCle=".$motClePop['idMotCle']."&motCle=".$motClePop['motCle']."'>".$motClePop["motCle"]."</a> ";
            }
            echo "</p>";

            //si un mot clé est sélectionné
            if (isset($_GET['idMotCle'])) {
                //affichage des articles par mot-clé
                $articles = getArticlesByMot($langue, $_GET['idMotCle']);
            }
            else {
                //affichage de tous les articles
                $articles = getAllArticles($langue);
            }

            //affichage du titre, du lien pour modifier l'article (si l'auteur est 'logé'), du texte, de l'auteur et des mots clés associés à l'article
            while($article = mysqli_fetch_assoc($articles)) {
                echo "<article>" . "<h2 class='titreArticle'>" . $article["titre" . $langue] . "</h2>";
                
                //récupérer le id de l'auteur
                if($login === true) {
                    $auteurArticle = auteurArticle($_SESSION["nomUsager"]);
                }
                else {
                    $auteurArticle = auteurArticle($nomUsager);
                }
                $rangee = mysqli_fetch_assoc($auteurArticle);
                $idAuteur = $rangee["idAuteur"];
                $_SESSION["idAuteur"] = $idAuteur;

                if($_SESSION["idAuteur"] === $article["auteurArticle"]) {
                    if ($login === true) {
                        //lien pour modifier l'article (si l'auteur est 'logé')
                        echo "<a class='btn_modifier' href='creerModifierArticle.php?action=modifier&idArticle=".$article["idArticle"]."&langue=$langue' class='modifArticle'>".traduire($langue, "pageAccueilLien2")."</a>";
                    }
                }
                echo "<p class='espaceBas10'>" . $article["texte" . $langue] . "</p>";
                echo "<h3 class='titreAuteur'>" . traduire($langue, "pageAccueilTitre3") . $article["auteur"] . "</h3><br>";
                //récupérer les mots clés associés à l'article
                $motsCles = getAllMotsCles($article["idArticle"]);
                echo "<span>" . traduire($langue, "pageAccueilTexte3") . "</span>";
                while($motCle = mysqli_fetch_assoc($motsCles)) {
                    echo "<a href='index.php?idMotCle=".$motCle["idMotCle"]."&motCle=".$motCle['motCle']."'>".$motCle["motCle"]."</a> ";
                }
                echo  "</article>";
            }

			//fermeture de la connexion
			closeDB();
        ?>
        <footer>
            <p>Gr. 1797 / David Lachambre et Amélie Léveillé / TP2 - Médiatiques et bdd, Programmation Web II</p>
        </footer>
    </body>
</html>