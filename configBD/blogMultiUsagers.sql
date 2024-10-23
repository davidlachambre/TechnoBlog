-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2015 at 01:39 AM
-- Server version: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `blogmultiusagers`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `idArticle` int(11) NOT NULL AUTO_INCREMENT,
  `titreFR` varchar(200) NOT NULL,
  `texteFR` text NOT NULL,
  `titreEN` varchar(200) NOT NULL,
  `texteEN` text NOT NULL,
  `auteurArticle` int(11) NOT NULL,
  PRIMARY KEY (`idArticle`),
  KEY `auteurArticle` (`auteurArticle`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`idArticle`, `titreFR`, `texteFR`, `titreEN`, `texteEN`, `auteurArticle`) VALUES
(1, 'Le chargeur pour mobile sans fil Qi accélère', 'La recharge sans fil d''un téléphone portable devient 3 fois plus rapide avec la nouvelle norme Qi du Wireless Power Consortium. \r\n\r\nPour accélérer les temps de chargement des smartphones, le Wireless Power Consortium annonce la révision du standard Qi de chargement sans fil. L''objectif est d''atteindre les mêmes performances de vitesse de recharge que pour les systèmes filaires. La technologie Qi a un coté pratique pour l''utilisateur puisqu''il n''est pas nécessaire de relier par un câble le chargeur et le smartphone à recharger. Jusqu''à présent, ce standard souffrait d''un défaut : la lenteur du rechargement. Depuis 7 ans que la technologie est adoptée par des grands noms de la high tech comme Sony, Asus, HTC, Huawei, LG ou Samsung, cette lenteur freine son adoption par le grand-public. \r\n\r\nL''annonce cette semaine pourrait changer la donne, puisque la norme du standard Qi passe à une puissance de 15W contre 5W seulement jusqu''à maintenant. Concrètement, cela devrait se traduire par un temps de recharge divisé par 3 même sans fil, pour atteindre des niveaux proches des chargeurs pour mobiles avec fil. Il faudra compter une demi-heure pour recharger une batterie standard des deux-tiers environ. Cela devrait changer le quotidien des 50 millions d''utilisateurs de la technologie Qi dans le monde.', 'The charger for mobile wireless speeds without Qi', 'Wireless charging of a mobile phone is three times faster with the new standard Qi Wireless Power Consortium.\r\n\r\nTo speed smartphones loading time, the Wireless Power Consortium announced the revision of the Qi wireless charging standard. The objective is to achieve the same charging speed performance for wired systems. Qi technology has a practical side to the user since it is not necessary to connect a cable and the charger to recharge the smartphone. So far, this standard was suffering from a defect: the slow reload. For 7 years the technology is adopted by big names in high tech like Sony, Asus, HTC, Huawei, LG and Samsung, this slowness hampers its adoption by the general public.\r\n\r\nThe announcement this week could change that, since the Qi standard switches to a standard 15W 5W against only so far. In practice this should translate into a cooldown divided by 3 even wireless, to reach levels close to mobile chargers with wire. It will take half an hour to charge a standard battery of two-thirds. This should change the lives of 50 million users of the Qi technology in the world.', 5),
(2, 'Enfin des précisions sur la prochaine version de Windows 10 Mobile', 'Microsoft vient de dévoiler plusieurs des nouveautés prévues lors du lancement de la nouvelle version de Windows 10 Mobile, édition mobile du nouvel OS de Microsoft. \r\n\r\nAvec les Build 10139 et 10146 pour Windows 10 Mobile, Microsoft a fait fort et sorti deux versions remplies de nouveautés, correctifs et améliorations en à peine une semaine. Il faut dire que l''enjeu est énorme. A quelques jours du déploiement de Windows 10, les attentes des utilisateurs de la version mobile du système d''exploitation sont énormes. Voici quelques éléments sur les nouveautés que dévoilent les versions de travail de Windows 0 Mobile. Au-delà des bugs et erreurs encore présents de manière tout à fait normale à ce stade développement, on note d''entrée de jeu un nouvel écran de verrouillage et un pavé numérique translucide, bien pensés pour les smartphones Lumia - conçus par Microsoft faut-il le rappeler... L''application Photos a été particulièrement travaillée dans la dernière version expérimentale de Windows 10 Mobile avec l''objectif d''en améliorer l''ergonomie pour accéder plus facilement aux photos que ce soit en local ou avec OneDrive dans le cloud. En particulier, un calendrier permet désormais de trouver instantanément des photos par mois. Des fonctionnalités de partage de photos sont aussi prévues, mais elles sont encore en développement, donc impossibles à tester pour le moment. \r\n\r\nLe navigateur Microsoft Edge est aussi intégré dans sa version mobile, avec une barre d''adresse en bas et la possibilité de surfer sur les versions mobiles des sites par défaut. Windows 10 Mobile inclut aussi l''assistante virtuelle Cortana, synchronisée avec son PC, ainsi que les applications Bing Maps et Here qui permettent de télécharger en PDF des cartes personnalisées. \r\n', 'Finally details of the next version of Windows Mobile 10', 'Microsoft has unveiled several new products planned for the launch of the new version of Windows Mobile 10 mobile edition of the new OS from Microsoft.\r\n\r\nWith Build 10139 and 10146 for Windows 10 Mobile, Microsoft has made strong and filled out two new versions, fixes and improvements in just one week. It must be said that the challenge is huge. A few days of deploying Windows 10, user expectations of the mobile version of the operating system are enormous. Here are some things that reveal the latest working versions of Windows Mobile 0. Beyond the bugs and errors still present so quite normal at this stage development, from the outset there is a new lock screen and a translucent keypad, designed with the Lumia smartphones - designed by Microsoft SHOULD CRANIAL be remembered ... The Photos app has been particularly tailored in the latest experimental version of Mobile Windows 10 with the objective of improving ergonomics for easier access to the photos either locally or in the onedrive cloud. In particular, a calendar is now possible to instantly find photos per month. Photo sharing features are also planned, but they are still developing, so impossible to test yet.\r\n\r\nThe Microsoft browser Edge is also integrated into its mobile version, with a low address bar and the ability to surf the mobile versions of sites by default. Windows 10 also includes Cortana Mobile virtual assistant, synchronized with their PC, as well as Bing Maps and Here to download applications that allow custom maps in PDF.', 3),
(3, 'L''ordinateur PC qui tient dans la poche : Archos PC Stick', 'A la rentrée, Archos sort son modèle PC Stick, ultra-léger, pas cher et performant. Un pari du constructeur high tech français sur le secteur des ultra-portables accessibles au grand public. \r\n\r\nAvec un poids de 60g, une taille d''à peine plus de 10 cm, un prix inférieur à 100€ et Windows 10 comme système d''exploitation, le nouveau PC Stick d''Archos pourrait bien révolutionner l''utilisation des ordinateurs PC. Dès septembre 2015, on saura si ce nouveau type d''ordinateur très innovant dans ses usages répond à un vrai besoin des utilisateurs et trouve son public. Derrière l''Archos PC Stick se cache la conviction que n''importe quel écran - y compris une télévision - doit pouvoir se transformer simplement et rapidement en ordinateur PC. Avec son entrée HDMI, le PC Stick se branche facilement sur une télévision et apporte ainsi toute l''ergonomie high tech d''un ordinateur. Connexion Bluetooth pour une souris et un clavier, connexions USB pour les autres périphériques, mais aussi un port microSD sont intégrés pour assurer une portabilité maximale , d''autant qu''une connexion Wifi est aussi prévue. \r\n\r\nCoté performance, Archos n''annonce rien de transcendant pour son dernier PC Stick. Le but n''est clairement pas de concurrencer la puissance d''un desktop. Mais avec 32 GB de stockage interne, un processeur Intel Quad-Core Atom 1,33 GHz, et avec ses 2GB de RAM, l''Archos PC Stick se défend. Avec Windows 10 et les applications mobiles de Microsoft Office, les utilisateurs de ce PC de poche d''entrée de gamme d''Archos pourront surfer, travailler voire même jouer de manière satisfaisante, avec une configuration mobile à un point jamais atteint auparavant. ', 'The PC that fits in your pocket PC Archos Stick', 'In September, Archos released their PC Stick model, ultra-light, cheap and efficient. A French high tech manufacturer bet on the ultra-portable segment accessible to the general public.\r\n\r\nWith a weight of 60g, barely a size more than 10 cm, a price below 100 € and Windows 10 as the operating system, the new PC Stick Archos could revolutionize the use of PC computers. By September 2015, we will know if this new type of highly innovative in its uses computer responds to a real need of users and finds its audience. Behind the Archos Stick PC lurks the belief that any screen - including a TV - must be transformed quickly and easily by PC. With its HDMI input, PC Stick connects easily to a TV, thus providing all the high tech ergonomics of a computer. Bluetooth connection for a mouse and keyboard, USB connections for other devices, but also a microSD slot are integrated for maximum portability, especially as a Wi-Fi connection is also planned.\r\n\r\nSide performance, Archos announces nothing transcendent for its latest PC Stick. The goal is clearly not to compete with the power of a desktop. But with 32 GB of internal storage, an Intel Quad-Core Atom processor 1.33 GHz, and with 2GB of RAM, the Archos Stick defends PC. With Windows 10 and Microsoft Office mobile applications, users of this PC entry-pocket Archos can surf, work, play or even satisfactorily, with a mobile configuration to a point never before.', 4),
(4, 'Annuler l''envoi d''un email avec Gmail', 'Avec Gmail il est aujourd''hui possible d''annuler un email même après l''avoir envoyé. Explications sur cette nouvelle fonctionnalité du service de messagerie électronique de Google. \r\n\r\nLa nouvelle fonction de Gmail et Inbox fait beaucoup parler : tous les utilisateurs ont désormais la possibilité d''« annuler», comme un bouton le propose lors de l''envoi d''un message par le service d''email de Google. Après une période de test fructueuse, Gmail a décidé de généraliser l''usage de ce bouton à tous ces inscrits. Pendant quelques secondes - chaque utilisateur peut paramétrer la durée entre 5 et 30 secondes selon son besoin - il est possible de revenir en arrière et d''annuler un envoi par email. Ce genre de bouton peut se révéler très pratique quand l''expéditeur a appuyé un peu vite sur « envoyer », ou quand il s''est trompé de destinataire, ou quand il s''aperçoit d''une énorme faute d''orthographe... Cette nouveauté de Gmail instaure ainsi un délai-tampon pendant lequel le message est en suspens. Une fois les quelques secondes écoulées, le message est définitivement envoyé et il n''est alors plus possible de la rattraper. Pour récupérer un mail envoyé par erreur, il faut donc rester sur le qui-vive et ne pas perdre de temps. \r\n\r\nPour les dizaines de millions d''utilisateurs de Gmail et Inbox dans le monde, cette fonctionnalité est une innovation bienvenue qui pourra résoudre bien des situations embarrassantes. De leur coté, les utilisateurs d''Outlook - la messagerie professionnelle de Microsoft - disposent déjà de cette fonctionnalité par défaut. Ils peuvent même demander le rappel d''un email déjà reçu, à condition qu''il n''est pas encore été ouvert par le destinataire, lui-même utilisateur d''Outlook. Mais cela, Gmail ne le propose pas encore.   ', 'Cancel sending an email with Gmail', 'With Gmail today it is possible to cancel a single email after you send it. Explanations about this new feature of e-mail service from Google.\r\n\r\nThe new feature in Gmail Inbox and is much talk: All users now have the option to cancel as proposed by a button when sending a message by the Google email service. After a successful test period, Gmail has decided to extend the use of this button all those registered. For a few seconds - each user can set the time from 5 to 30 seconds according to his need - it is possible to go back and cancel sending by email. This type of button can be very handy when the sender has pressed too quickly send or when he was wrong recipient, or when he discovers an enormous misspelling ... This new Gmail and creates a buffer period during which the message is pending. After a few seconds elapsed, the message is sent and it is definitely no longer possible to catch up. To retrieve an email sent by mistake, we must stay on the alert and do not waste time.\r\n\r\nFor the tens of millions of users of Gmail Inbox and in the world, this feature is a welcome innovation that can solve many embarrassing situations. For their part, users of Outlook - Microsoft professional messaging - already have this feature by default. They can even request the recall of an email already received, provided that it has not yet been opened by the recipient himself Outlook user. But that Gmail does not offer it.', 1),
(5, 'Vos objets connectés à la plage', 'Cet été sur la plage, pas de coup de soleil et le waterproof est dans la place. Musique, lecture, bronzette... Pour chaque activité, on vous propose le bon objet connecté qui résiste au soleil, au sable et à l''eau ! \r\n\r\nMusique \r\nEcouter vos tubes préférés dans les rouleaux ? C''est possible avec le baladeur NWZ-W273S de Sony. Complètement étanche jusqu''à 2 m de profondeur, il peut contenir jusqu''à 2000 chansons. Bon après, il faut être bon en apnée... \r\n\r\nLecture \r\nLes livres résistent bien au sable, mais pas à l''eau, alors que la liseuse Aura H2O de Kobo, oui ! Étanche, avec son écran de 6,8 pouces avec son éclairage frontal, elle est conçue pour embarquer 4Go de lecture numérique à la plage, même de nuit. (En vente dans les magasins high-tech). \r\n\r\nSelfies aquatiques \r\nLe Xperia M4 Aqua de Sony est complètement étanche. Bien pratique pour immortaliser des moments sous-marins ou inaugurer une série de selfies sur le bord de la piscine ! \r\n\r\nBronzage \r\nLa gamme de maillots de bain intelligents de Spinali Design intègre un capteur d''UV qui vous alerte avant d''attraper un coup de soleil, en fonction du temps d''exposition et de votre type de peau. \r\n\r\nL''élégant bracelet connecté June de Netamo calcule aussi le taux d''UV absorbé quotidiennement par votre peau. Il vous indique la quantité de soleil que vous pouvez encore emmagasiner et quand remettre de la crème solaire. \r\n\r\nGPS \r\nLa montre Linkoo Kids V2 ne donne pas seulement l''heure, elle localise aussi les enfants qui ont tendance à parcourir des kilomètres de plage à la recherche du coquillage rare. Elle vous signale quand Junior dépasse le périmètre défini, et est munie de boutons d''appels d''urgence. Petit plus, elle est complètement étanche ! ', 'Your objects connected to the beach', 'This summer on the beach, no sunburn and is waterproof in the place. Music, reading, sunbathing ... For each activity, it offers you the right object connected resistant to sun, sand and water!\r\n\r\nMusic\r\nListen to your favorite tunes in the rollers? This is possible with the NWZ-W273S Sony Walkman. Completely waterproof up to 2 m deep, it holds up to 2,000 songs. Well after, it must be good snorkeling ...\r\n\r\nReading\r\nThe books are resistant to sand, but not to water, while the Aura H2O Kobo reading light, yes! Waterproof, with its 6.8 inch screen with his headlights, it is designed for shipping 4GB digital reading at the beach, even at night. (On sale in the high-tech stores).\r\n\r\nAquatic Selfies\r\nThe Sony Xperia M4 Aqua is completely sealed. Handy to capture underwater moments when inaugurating a series of selfies on the edge of the pool!\r\n\r\nTanning\r\nThe range of intelligent swimwear Spinali Design incorporates a UV sensor that alerts you before catching a sunburn, depending on the exposure time and your skin type.\r\n\r\nThe elegant bracelet of connected June Netamo also calculates the rate of daily UV absorbed by your skin. It tells you the amount of sun that you can store and when put on sunscreen.\r\n\r\nGPS\r\nThe watch Linkoo V2 Kids not only tells the time, it also locates children who tend to travel kilometers of beach in search of a rare shell. It alerts you when Junior exceeds the defined perimeter, and is equipped with emergency call buttons. Little more, it is completely waterproof!', 2),
(6, 'Instagram se lance dans le temps réel pour rivaliser avec Twitter', 'La version 7 d''Instagram viendra accompagnée de nouvelles fonctionnalités, notamment les « trending tags » qui permettront de visualiser en temps réel les thèmes les plus consultés. \r\n\r\nDepuis longtemps, les utilisateurs d''Instagram se plaignent du manque de flexibilité des fonctionnalités d''exploration. En effet, la page « Explore » ou « Rechercher » se basait sur les posts likés et la popularité des comptes (autrement dit les comptes les plus suivis) pour afficher ses contenus. Un nouveau mode d''exploration existe désormais : les « trending tags ». Cette nouvelle fonctionnalité, comme son nom l''indique, s''inspire des tendances du moment en affichant les thèmes les plus consultés. \r\n\r\nLes utilisateurs du réseau social de photos, propriété de Facebook, pourront grâce à cette nouvelle fonctionnalité suivre les évènements en temps réel. Comme l''affirme l''entreprise sur son blog : « Avec 70 millions de photos et de vidéos postées chaque jour sur Instagram, peu importe où quelque chose se passe, il y a toutes les chances que vous puissiez le voir ici ». Concrètement, les utilisateurs d''Instagram pourront préparer au mieux leurs vacances quelle que soit leur destination car la recherche se fera par localisation. \r\n\r\nLes nouvelles fonctionnalités d''Instagram sont pour le moment uniquement disponibles aux Etats-Unis, mais d''autres pays devraient bientôt en bénéficier. Curieusement, cette mise à jour coïncide avec le Project Lightning de Twitter, grâce auquel un évènement pourrait être suivi en temps réel grâce à une curation des contenus et des tweets.', 'Instagram launches in real time to compete with Twitter', 'Version 7 Instagram come accompanied by new features, including trending tags that allow to visualize in real time the most viewed topics.\r\n\r\nHistorically, Instagram users complain about the lack of flexibility of mining features. Indeed, the Explore page or Search was based on the likes posts and popularity of the accounts (ie the most followed accounts) to display its contents. A new mode of exploration is now: the trending tags. This new feature, as the name suggests, is inspired by current trends by displaying the most viewed topics.\r\n\r\nUsers of the social network of photos, property of Facebook, will through this new feature to follow events in real time. As stated by the company on his blog: With 70 million photos and videos posted on Instagram every day no matter where something happens, there is every chance that you can see it here. Specifically, users Instagram will best prepare their holiday destination regardless because research will be by location.\r\n\r\nNew features Instagram are currently only available in the US, but other countries will soon benefit. Curiously, this update coincides with the Project Lightning Twitter, through which an event could be followed in real time through a curation of content and tweets.', 3),
(7, 'Microsoft Office et smartphones Android font bon ménage', 'Depuis le 24 juin, les smartphones qui tournent sous Android peuvent comme leurs homologues tablettes bénéficier des logiciels de Microsoft Office Word, Excel et Powerpoint. \r\n\r\nJusqu''à présent, la suite bureautique de Microsoft était déjà disponible sur Android, la plateforme d''exploitation mobile de Google, mais uniquement pour les tablettes. La firme de Redmond a annoncé avant-hier que les utilisateurs de smartphones tournant sous Android auront désormais le même privilège. La nouvelle était attendue, en particulier depuis le lancement il y a environ 5 semaines d''une version bêta qui lui a permis de peaufiner son offre (notamment la synchronisation avec Google Drive et d''autres services de stockage tiers). \r\n\r\nMicrosoft explique dans sa vidéo de présentation que ses trois logiciels disponibles sur Android offriront aux utilisateurs la possibilité de « consulter et éditer des documents en déplacement ainsi que de préparer et de présenter un diaporama depuis un smartphone, et ce rapidement ». \r\n\r\nLe géant américain a misé sur le concept Freemium, une approche basée sur une gratuité limitée. Les utilisateurs pourront effectivement télécharger gratuitement Word, Excel et Powerpoint, mais ils n''auront pas accès à toutes les fonctionnalités existantes. Pour ce faire, ils devront s''abonner à Office 365. Par ailleurs, Microsoft travaille activement « avec de nombreux partenaires OEM, mondiaux ou locaux, tels que Samsung, Sony, LG, pour pré-installer ces applications sur les appareils Android ». ', 'Microsoft Office and Android smartphones go hand', 'Since June 24 smartphones that run on Android tablets like their counterparts can benefit from software Microsoft Office Word, Excel and Powerpoint.\r\n\r\nSo far, the office suite Microsoft was already available on Android, the mobile operating platform from Google, but only for tablets. The Redmond company announced the day before yesterday that the Android-running smartphone users will now have the same privilege. The news was expected, especially since the launch there are about 5 weeks a beta version that allowed him to refine his offer (including synchronization with Google Drive and other third-party storage services).\r\n\r\nMicrosoft explains in his video presentation that his three software available on Android will offer users the ability to view and edit documents on the go in and prepare and present a slideshow from a smartphone, and quickly.\r\n\r\nThe US giant has backed the Freemium concept, an approach based on a limited gratuity. Users can actually download Word, Excel and Powerpoint, but they will not have access to all the existing features. To do this, they must subscribe to Office 365. Microsoft also actively working with many OEM partners, global or local, such as Samsung, Sony, LG, to pre-install these applications on Android devices.\r\n\r\nTo install Word, Excel and Powerpoint on its Android smartphone, simply download the software from the Google Play store.', 4),
(8, 'Messenger accessible sans passer par Facebook', 'Facebook est en train de déployer une nouvelle mise à jour qui permettra aux utilisateurs de communiquer via Messenger sans avoir un compte Facebook. \r\n\r\nL''application de messagerie instantanée Messenger, qui compte environ 700 millions d''utilisateurs, est très populaire. Propriété de Facebook, elle présente cependant au moins un inconvénient aux yeux de beaucoup : pour y accéder, il faut nécessairement avoir un compte Facebook. Plus pour longtemps. \r\n\r\nLe réseau social de Mark Zuckerberg est en train de déployer la mise à jour 30.0 qui n''obligera plus les utilisateurs à posséder un compte Facebook pour accéder à Messenger. Pour bénéficier des services de la messagerie instantanée, il suffira d''introduire son numéro de téléphone ainsi que d''autres informations personnelles. Une fois connecté, l''utilisateur pourra ensuite entrer en contact avec ses amis qui auront réalisé la même démarche. Il pourra également faire des appels vidéo, converser en groupe, échanger des photos... \r\n\r\nCe nouveau mode d''inscription rappelle celui de WhatsApp, une autre application de messagerie instantanée qui appartient aussi à Facebook et qui réunit également 700 millions d''utilisateurs. Pour le moment, la nouvelle mise à jour a été lancée aux Etats-Unis, au Canada, au Pérou et au Venezuela. D''autres pays devraient en bénéficier dans les jours ou les semaines à venir. Facebook a probablement ciblé le Pérou et le Venezuela en raison du succès de WhatsApp dans ces deux pays. Avec Messenger facilement accessible, les utilisateurs auront désormais le choix entre deux applications de messagerie instantanée. \r\n\r\nQue vous choisissiez Messenger ou WhatsApp, les ficelles seront toujours tirées par Facebook. ', 'Messenger accessed without using Facebook', 'Facebook is rolling out a new update that will allow users to communicate via Messenger without a Facebook account.\r\n\r\nThe Messenger instant messaging application, which has about 700 million users, is very popular. Property Facebook, it nevertheless has at least one disadvantage in many eyes: to access it, it must necessarily have a Facebook account. Not for long.\r\n\r\nThe social network Mark Zuckerberg is now deploying the 30.0 update that no longer require users to have a Facebook account to access Messenger. To gain access to instant messaging, simply to introduce his telephone number and other personal information. Once connected, the user will then get in touch with friends who have done the same approach. They can also make video calls, group chat, exchange photos ...\r\n\r\nThis new registration method reminiscent of WhatsApp, another instant messaging application that also belongs to Facebook and also brings together 700 million users. For now, the new update has been launched in the United States, Canada, Peru and Venezuela. Other countries expected to benefit in the days or weeks ahead. Facebook has probably targeted Peru and Venezuela because of the success of WhatsApp in both countries. With easily accessible Messenger, users now have the choice between two instant messaging applications.\r\n\r\nWhether you choose Messenger or WhatsApp, the strings will still be driven by Facebook.', 3),
(9, 'Skiller : partager, c''est s''enrichir', 'Nouvelle appli qui monte, qui monte, en tout cas, dont tout le monde parle : Skiller. Son principe, très tendance : partager ses compétences et ses savoirs entre professionnels. \r\n\r\nCôté donneur, on partage ses tuyaux, ses contacts, ses expériences, et côté receveur, on vérifie un point un peu technique auprès des experts de la communauté ou on lance un appel pour une réponse conjointe à un appel d''offres. Et bien sûr, on peut être les deux. \r\n\r\nDans la droite mouvance de l''économie collaborative, Skiller part du principe que c''est dans l''échange que l''on réussit. Pas très envie de livrer vos bons plans en public sur le Net ? Cela se comprend et les échanges peuvent se poursuivre en privé. Mais finalement, en étant émetteur d''info, vous gagnez un statut d''expert auprès des autres membres. Une légitimité. Ceci doit sûrement avoir une valeur... :) \r\n\r\nAutre argument de Skiller : sa cible (chefs d''entreprise, freelance, indépendant, professions libérales) doit solutionner des problèmes de plus en plus complexes. Trouver du soutien, et en donner en échange, facilite forcément le travail. \r\n\r\nEt derrière tout cela, ce sont bien de nouvelles valeurs qui émergent.', 'Skiller: sharing is getting rich', 'New app which rising, rising, in any case, which everyone speaks: Skiller. Its principle, very trendy: sharing skills and knowledge among professionals.\r\n\r\nDonor side, it shares its pipes, contacts, experience, and recipient side, one checks a somewhat technical experts from the community or an appeal is launched for a joint response to a call for tenders. And of course, it can be both.\r\n\r\nIn the right movement of the collaborative economy, Skiller assumes that it is in the sharing that we succeed. Not really want to deliver your tips in public on the Net? This is understandable and exchanges can continue in private. But ultimately, being information transmitter, you gain expert status to other members. Legitimacy. This must surely have a value ... :)\r\n\r\nAnother argument Skiller: its target (entrepreneurs, freelance, independent, professional) should solve problems of increasing complexity. Finding support and give in exchange, inevitably facilitates the work.\r\n\r\nAnd behind all this are new values that are emerging.', 2),
(10, 'Les Français possèdent plus de 3 écrans mobiles', 'En moyenne, chaque Français dispose de 3,2 écrans mobiles. Ordinateur portable, smartphone, tablette, phablette, console : à chacun son appareil de prédilection. \r\n\r\nD''après l''étude Screen 360 réalisée par Médiamétrie, les écrans mobiles prennent de plus en plus de place dans les foyers et dans le quotidien des Français. En effet, chaque individu possédait en moyenne 3,2 écrans mobiles entre le 27 avril et le 15 mai 2015, ce qui représente une hausse de 7% par rapport à 2014 sur la même période. Une personne interrogée sur deux (49%) reconnaît qu''elle visionne des vidéos en dehors de son domicile, par exemple dans le transport public, sur son lieu de travail, dans les lieux publics ou chez des amis. L''appareil mobile préféré des Français pour visionner des vidéos hors domicile reste l''ordinateur portable (33%), suivi du téléphone portable (27%) et de la tablette (17%). \r\n\r\nQuels contenus vidéo les Français regardent-ils sur leurs écrans mobiles ? \r\n\r\nLes Français sont très friands des contenus gratuits sur Internet (37%), des vidéos stockées (35%) et des programmes de télévision en direct ou en replay (24%). Par ailleurs, une personne interrogée sur cinq affirme avoir commencé à regarder une vidéo sur un terminal et avoir vu la fin sur un autre écran. Cette tendance concerne surtout les jeunes âgés entre 15 et 24 ans. Le passage d''un écran à un autre se réalise surtout d''un écran de télévision à celui d''une tablette (16%) ou d''un ordinateur (14%).', 'The French have over three mobile screens', 'On average, each French has 3.2 mobile screens. Laptop, smartphone, tablet, PHABLET console: to each his favorite instrument.\r\n\r\nAccording to Screen 360 study by Médiamétrie, mobile screens are becoming more and more space in homes and in the everyday life of French. Indeed, each individual had an average of 3.2 mobile screens between 27 April and 15 May 2015, which represents an increase of 7% compared to 2014 over the same period. One in two (49%) recognize that viewing videos outside his home, for example in public transport, in the workplace, in public places or with friends. The favorite of the French mobile device for viewing outside the home video remains the laptop (33%), followed by mobile phone (27%) and tablet (17%).\r\n\r\nWhat the French video content they watch on their mobile screens?\r\n\r\nThe French are very fond of free content on the Internet (37%), the stored videos (35%) and television programs live or replay (24%). Furthermore, one respondent in five person claims to have started watching a video on a terminal and have seen the end on another screen. This trend concerns mainly young people aged between 15 and 24 years. The transition from one screen to another is realized principally of a television screen as a tablet (16%) or a computer (14%).', 1);

-- --------------------------------------------------------

--
-- Table structure for table `articlesMotsCles`
--

CREATE TABLE IF NOT EXISTS `articlesMotsCles` (
  `article` int(11) NOT NULL,
  `mot` int(11) DEFAULT NULL,
  KEY `article` (`article`),
  KEY `mot` (`mot`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articlesMotsCles`
--

INSERT INTO `articlesMotsCles` (`article`, `mot`) VALUES
(1, 1),
(1, 10),
(2, 1),
(2, 2),
(2, 3),
(2, 10),
(2, 19),
(3, 1),
(3, 2),
(3, 3),
(3, 19),
(4, 4),
(4, 5),
(5, 6),
(5, 7),
(5, 20),
(6, 8),
(6, 9),
(6, 13),
(7, 1),
(7, 5),
(7, 10),
(7, 11),
(7, 17),
(7, 19),
(8, 12),
(8, 13),
(8, 19),
(9, 14),
(10, 1),
(10, 10),
(10, 15),
(10, 16),
(10, 17),
(10, 18);

-- --------------------------------------------------------

--
-- Table structure for table `auteurs`
--

CREATE TABLE IF NOT EXISTS `auteurs` (
  `idAuteur` int(11) NOT NULL AUTO_INCREMENT,
  `nomUsager` varchar(50) NOT NULL,
  `motDePasse` varchar(32) NOT NULL,
  `nomAuteur` varchar(50) NOT NULL,
  `prenomAuteur` varchar(50) NOT NULL,
  PRIMARY KEY (`idAuteur`),
  UNIQUE KEY `nomUsager` (`nomUsager`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `auteurs`
--

INSERT INTO `auteurs` (`idAuteur`, `nomUsager`, `motDePasse`, `nomAuteur`, `prenomAuteur`) VALUES
(1, 'aleveille', '854c93fe7947e215bc146ec1583138b5', 'Leveille', 'Amelie'),
(2, 'dlachambre', 'a73e88bbe9a374e808ae94eacd6a1b98', 'Lachambre', 'David'),
(3, 'blapointe', '8ff4e8b1608ca8904b21942b65038c66', 'Lapointe', 'Benoit'),
(4, 'gharvey', 'dab7dac8e614cfaf80574d43bc487d89', 'Harvey', 'Guillaume'),
(5, 'jsmith', '4a0d1419563b6189e484c7307f988c91', 'Smith', 'John');

-- --------------------------------------------------------

--
-- Table structure for table `motsCles`
--

CREATE TABLE IF NOT EXISTS `motsCles` (
  `idMotCle` int(11) NOT NULL AUTO_INCREMENT,
  `motCle` varchar(50) NOT NULL,
  PRIMARY KEY (`idMotCle`),
  UNIQUE KEY `motCle` (`motCle`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `motsCles`
--

INSERT INTO `motsCles` (`idMotCle`, `motCle`) VALUES
(11, 'android'),
(19, 'application'),
(18, 'console'),
(13, 'facebook'),
(4, 'gmail'),
(5, 'google'),
(7, 'gps'),
(8, 'instagram'),
(16, 'internet'),
(6, 'kobo'),
(12, 'messenger'),
(1, 'mobile'),
(3, 'pc'),
(15, 'phablette'),
(20, 'selfies'),
(14, 'skiller'),
(10, 'smartphone'),
(17, 'tablette'),
(9, 'twitter'),
(2, 'windows');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`auteurArticle`) REFERENCES `auteurs` (`idAuteur`) ON DELETE CASCADE;

--
-- Constraints for table `articlesMotsCles`
--
ALTER TABLE `articlesMotsCles`
  ADD CONSTRAINT `articlesMotsCles_ibfk_1` FOREIGN KEY (`article`) REFERENCES `articles` (`idArticle`) ON DELETE CASCADE,
  ADD CONSTRAINT `articlesMotsCles_ibfk_2` FOREIGN KEY (`mot`) REFERENCES `motsCles` (`idMotCle`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
