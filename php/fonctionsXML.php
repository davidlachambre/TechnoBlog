<?php
/* Fonction pour charger le XML : */
    function chargerXML() {
        global $dom;
        $dom = new DOMDocument();
        $dom->load('./xml/contenu.xml', LIBXML_DTDLOAD);//Load document XML
    }

/* Fonction pour extraire le texte dans un XML en fonction de la langue :
Paramètres : (string, string)
return string */
    function traduire($langue, $idContenu) {
        global $dom;
        $contenu = $dom->getElementById($idContenu);//Récupère le tag 'contenu' dans le XML
        $resultat = $contenu->getElementsByTagName($langue)->item(0)->nodeValue;//Récupère le texte du tag 'contenu' dans le XML
        return $resultat;
    }
?>