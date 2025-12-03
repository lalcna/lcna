-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2025 at 10:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('editor','admin') NOT NULL DEFAULT 'editor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `role`) VALUES
(7, 'editorial', '$2y$10$YWjECWls/WW29GpB0I/KdOYzLa12S05.UaRhKinvdyVDPElfeZzpi', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `created_at`) VALUES
(3, 'CHANCHIN THA HRIL HI RINGTUTE TIH TUR A NI', 'Isaia 6:1-10, Marka 16:15-18\r\n\r\nChanchin tha chu Lal Isua Kristaa Pathian hnathawh zawng zawng hi a ni a, Lal Isuan chhandamna hna a thawh chanchin hi a ni kan ti thei bawk ang. Bible chuan kawng hrang hrangin a sawifiah a, Pathian Ram Chanchin Tha te, Chhandamna Chanchin Tha te, Khawngaihna Chanchin Tha te, Remna Chanchin Tha te, Sual ngaihdamna Chanchin Tha te, Tihthianghlimna te. Nunna Thu te leh a dangte pawh. Mihringin thinlung taka Isua Krista chu Lal leh Chhandamtua a pawmin piangthar a lo ni a, thil siam thar a lo ni bawk a; a sual a sim a, sual ngaihdamna a chang a, chatuana nunna neiin a lo awm ta a ni tih hÉ chanchin tha kan hril thin, kan la hril zel tur chu a ni. \r\n\r\n1. Tumah kan bâng thei lo: Kan Thurin No 9-nain ringtute tih tur a sawi zingah, ‘Khawvel puma Krista ram tizau tura beih’ tih hi a tel avangin chanchin tha hril hi ringtu zawng zawng tih tur leh tih makmawh a ni a, tumah kan bång thei lo. Krista chhandamna chu a thlawna kan hmuh avangin a thlawn vçkin kan pek chhuah a ngai a. Nitin thlarau bo tam tak an boral avangin hmanhmawh a ngai bawk. Krista chhandamna chang inti si, chanchin tha hril ngai pawimawh lo chu ringtu tak a ni lovang. Tirhkoh Paula chuan, “Tih mâkmawh ka chunga innghat a ni si; chanchin tha hril suh ila, ka chung a pik dawn si,” a ti bawk a. Chhandamna hlut zia hretu tan chuan engmah sawi chhawn châkna neih loh chu a inhmeh lo hlë; “Sawi lovin kan awm thei lo,” ti ve tur kan ni zawk. \r\n\r\n2. Insenso huam a ngai: Lal Isuan, “Ngai teh u, chinghne zinga beram awm angin ka tirh che u hi,” a ti a, nuam taka hril tura beisei chi a ni lo. Ringlote hnena chanchin tha hril chu hautak tak a ni. Mahni intum vek a ngai a, mahni intum chung pawhin lawm kan hlawh lova; lawm ahnekin tihduhdah kan tuar zawk thin a ni. Chuvangin, engkim huama thawh chi a ni. Sum leh pai; tha leh rilru sên a ngai a, hrehawm tuar a ngai a, nunna hial pawh chân a ngaih hun a awm thei. Mahni lam chu insensona tur hlir a ni.\r\n\r\n 3. Thlarau bo pakhat tal man kan tum tur a ni: Mihring hi Pathian anpuia siam kan nih avangin Pathian mithmuhah kan hlu em em a ni. Mi pakhat boral pawh Lalpan a ui em em a, chuvangin, thlarau boral tur chhanchhuak turin ringtu tawh phawt chuan mawhphurhna kan nei a ni. Mahni kan kal chhuak theilo a nih pawhin tawng taiin emaw, mite ruaiin emaw engtin emaw tala kan tan ve a ngai a. Thenawm hnaiah pawh ringlo mi an awm chuan kan hrilh ve thei. Ram hla tak kal kher lo pawhin, kan hmuh phakah leh kan hrilh theiha awm apiang hnenah Isua chanchin tha hi hrilh mawlh mawih mai tur a ni. Ringtu puitling ve lem chuan thlarau bo pakhat tal man ve tum fiat a tul a ni.\r\n\r\n 4. Tih theih tâwk tih: Lal Isua, Bethani khua a hmeichhe pakhatin hriak rimtui a thih khan, “A tih theih tawk a ti a ni,” tih a sawi khan, hmeichhe thil tih chuan a ti lawm a, a chhan pawh a tih theih tawk a tih vang a ni tih kan hria a. Hei hi Isua ringtu apiangin hrerengin, Isua lawm zawng eng noe ni tih kan ngaihtuah a tul. Aman thu min pek kan tihhlawhtlin chuan a lawm dawn a ni tih a lang. Hetah hian a hming mai nilo, theihtawp takmeuh chhuah a tul zia a lang bawk. Kan theih chinah chuan tlänchhe lovin kan ti ve mai tur a ni. Mahni kalchhuah emaw, sum leh pala lo tan ve emaw, thildang pawh kan tih ve theih tawk kan tih hi Isua lawm zawng a ni.', '2025-10-05'),
(4, 'RINAWMNA', 'Malakia 3:6, Galatia 5:22, Hebrai 13:8, Thupuan 3:10\r\n\r\nRinawmna awmzia chu kan fiah sa deuh mai awm e, Nghet, Rintlåk, Rinngam leh Danglamlo tihna te a ni. Kan ramin a mamawh êm êm chu Rinawmna hi a ni. Ringtute mamawh,kohhran leh chhungkaw tin mamawh a ni tak meuh mai. Pa leh Fapa leh Thlarau Thianghlim hi Rinawmna a khat Pathian\r\nnihna nei an ni a, a ringtu chu a rinawm thin.\r\n\r\n1.Pathian zia: Kan Kohhran thurin II-na ah chuan hetiang hian Pathian nihna a sawi kan hmu, “Kei Lalpa hi ka danglam silo tiin a inpuang. Jakoba 1:17b-ah “Amahah chuan danglamna leh herna hlim reng reng a awm thei lo, tiin Jakoban a lo sawi bawk a ni. Amah Pathian a danglam ngai lova, a duh zawng a danglam ngai hek lo. Hmâna a duhdan kha tunah pawh a la ngai reng. Chhandamna pawh ti tunlaiin a thlak danglarm hauh lo. A pangngai reng Chhandamna chu Kraws a ni.Chhandamna chan dân pawh a thlak lo; Amah ringa chan a la ni reng e. Tunlai khawvel danglam zel hian a ti danglam ve lo. A thu a thlak ve lo, awih hmiah a fuh ber zel a ni.\r\n\r\n\r\n2) Lal Isua zia a ni: Kan Lal Isua chuan Thupuan 22:13-ah chuan, “Kei Alpha leh Omega, a Hmasaber leh a Hnuhnungber, a bul leh a tawp ka ni” a ti a, Hebrai ziaktu pawhin, “Isua Krista chu niminah nen, vawiinah nen, kumkhua pawhin a pangngaiin a awm fo ang” a lo ti bawk (Hebrai 13:8). Kan Lal Isua hi Pa Pathian tirhnaah a rinawm tluan chhuak parh a. Krawsa thihna a tuar lai pawhin a la rinawm zel a ni. Kan tan a rinawm em em a, Krawsah thih thlengin mahni chauhin a tuar a ni. A thawhleh hnuah pawh Vanah Pa dinglamah min sawi saktu a la ni fan. Vawiin thlengin misualte chhandamtu a la ni reng a, a pangngai reng kan Chhandamtu hi.\r\n\r\n\r\n3) Thlarau Thianghlim zia a ni: Hebrai 9:14-ah chuan, ‘Chatuan Thlarau’ tih kan hmu a. khawvel siam tirhah pawh a tel a. “Pathian Thlarau chuan tui chungte chu a awp reng a” tih ziak a ni (Genesis 1:2), awp rengtu a nih chu. Bible-ah hian Thlarau Thianghlim chu zirtirtu. chenchilhtu, hruaitu leh thlamuantu a nih thu kan hmu a, Thlarau rah chi kua zinga pasarihna chu ‘Rinawmna’ a ni. Kan tan a rinawm em em a, min hruai peih a, min zirtir peih a, min chênchilh tlat a, tawngtai ngaihna hrelo khawpa kan awm lai pawhin rûm sawi hleihtheih lohin min tawng tai sak thin a ni. Heng Pa leh Fapa leh Thlarau Thianghlim zia hi keini ringtute chuan kan entawn ber tur leh kan nun innghahna bul thut tur a ni. Rinawmna neilo ringtu chuan Thlarau rah chu a chang ve dawlo tihna a ni.', '2025-09-21'),
(5, 'RINGTU NUNKAWNG / VANRAM KAWNG - Pi Lalthanngengi', 'II TIMOTHEA 2: 3-4, LUKA 9: 23, HEBRAI 12: 1-2\r\n\r\nRingtu nun kawng hi kawng awlsam leh nuam a ni lo ti phawt mai teh ang. Davida kha Lal ni tura Samuela’n hriak a thih hnu khan Philistia mi lian leh chak Goliatha beih a tul a, Davida chuan a chakna chu Lalpa a ni tih leh indona chu lalpa indona a ni tih a hrechiang a, hmanraw mawlte anga langin ralthuam famkima inthuam Goliatha chu beiin a that a ni. Hemi hnu hian Saula atangin harsatna tam tak a tawk leh a, a nun humhim turin ramhnuaiah te a biru zak zak a, heilo pawh ama fapa a hmangaih em em Absaloma chuan a lal thuthleng luah tumin a bei a, a fapa ngeiin harsatna namenlo a thlen a ni. \r\n\r\n\r\nThuthlungthar lamah Paula nun kawng hi thlir leh ila, Damaska khaw daia Isua a hnena a inlar atangin harsatna a tawk nghal a, a mit a del a, Pathian thu avangin vuakin a awm a, tan inah a tang a, Isua hnung a zuina kawngah hian harsatna tam tak a tawk a ni. \r\n\r\n\r\nLal Isua hnungzui hi thil awlsam leh nuam a ni lova, hrehawm tam tak tuar a ngai a ni. kohhran ten campinhg kan buaitsaih thin a, campers te’n piantharna/siamthar lehna changin hlim takin camp kan chhuahsan a, mahse reiloteah kan nun ngaiah bawk kan let leh mai thin te hi chhandamna chan a vanram kai hi chu kan duh a, Lal Isua hnungzuia hrehawm tuar hi kan peih lo niin a lang. \r\n\r\n\r\nKristian Vanram Kawngzawh buah khan John Banyan-a khan ringtu te’n vanram kan panna kawng khirh zia a tarlang a -n Lungngaihna chirhdup, Lawilo Dawrpui, Tangka laihchhuahna khur, Zahna Kawn leh a dangte pawh. Beidawnsan hialna tur tam tak a awm, heng zawng zawngte hi tuarin Kristiana te thiandun khan Vanram Kawngkhar an thleng tih kan hria a ni. \r\n\r\n\r\nLal Isua hnung kan zuina kawngah hian harsatna tawh tur ava tam em. Khawvel tukverhah kan dak a, raulawhna hlir mai a ni a. Thil changkan tak tak alo chhuak a, kan awta neihdan kan ngaihtuah a. Kan sumin a phakbakin kan che a, chu chuan kut tlingloa pawisa lak luh duhna ah min hruai a, pawisa neih theih dan ringawt kan ngaihtuah ni te pawhin a lang. Tangka laihchhuahna khura lut lo chhuak leh tumah ka hmu lo John Banyana khan a ti. Lal Isua hnungzui reng emaw kan intih lai hian Lawilo Dawrpui ah te hian kan lo bazar reng zawk lo maw? \r\n\r\nVanram pana kan kal lai hian harsatna hrang hrang kan tawk thin a, kan harsatna tawhte erawh a in ang kher lo ang. Harsatna kan tawhte inhnehtir mai lovin Lal lukhum chang turin Kross kan put a ngai tih hre thar leh ila. Ringtute hian chan tur te, tuar tur te kan nei. Kan duh ngawih ngawih pawh ka duh love tih hunte, kan duh miah loh pawh ka duh e tih ngaih tlat changte a awm thin. Min tihnawktu thil hrang hrang te paihthlain Isua kan rinna siamtu leh ti famkimtu en tlatin rinawm takin i kal zel ang u.\r\n\r\nPetera khan Lal Isua hnenah tui chunga kal a dil a, Lal Isua enin Petera kha tui chungah khan a kal ta mai a, mahse tui fawn lam a en a, a hlau a, a pil dawn ta mai a. Chuvangin entur dik Lal Isua chauh hi en ila vanram kan panna kawngah hian Setana’n harsatna hrang hrang hmangin min bei thin mahse chatuan ral hma loha hnehtu ni zel tur Lal Isua hnehna puang chung zelin ringtu nun kawng/ vanram kawng hi i zawh zel ang u.', '2025-09-28'),
(6, 'FATE THUTAKA AWM HLUTNA (Naupang te ni pual)', 'Bible III Johana 4 Inkaihhruaina fel leh tha tak hnuaiah Mizoram Baptist Kohhran chuan Kristian Naupang Pawl (KNP) te a enkawl a, a tum bul ber pawh Naupangte Thlarauah an lo puitlin a Ringtu tha tak an nih theih Programme hrang hrang te , Thuzir bu leh Inkhawm hun te a buatsaih thin a ni. Tukin zing pawh hi BCM ni pawimawh bu ah l Naupangte ni hi a chuang hial a ni a, Tukin zing sermon pawh hetiang lam hawi sermon hi a nih ngei pawh a rinawm.\r\n\r\n\r\nNaupangte ni chungchang hi Kum 2015 Assembly in Tunlai khawvel sualna pung zel thlirin Naupangte ngaihsak lehzual tha a ti a, Kum tin November Sunday vawi 3 na apiang hi hemi pual atan hian hman thin ni se tiin a rel ta a ni. \r\n\r\nKhawvel finna thiamna sanna thang mek zelah hian Nu leh pa te hian kan fate thutak an awm leh awm loh engzat takin ngaihtuahin ngaih ven thin ang maw ? Nu leh pa tam berin kan fate kan duhsakna chu zirna lamah a ni a. Lehkha an thiamna tûr a nih chuan pûk chawp pawh kan huam. A sual a ni hauh lo, rual awhna mha a ni. Amaherawhchu, zirna ai pawha kan duhsakna tûr chu thutaka an awm hi a ni. Kan fate thil danga kan duhsak luatah leh rual kan awhpui luat na hian Pathian be hman lo khawpin min ti mul a. Pathian hriatna lama an rilru kan tih vâr loh avângin Nu leh pa ten rim taka kan thawhchhuah sa tlak ral zawngin an tlan a nu leh pa te kan rum mek a nih hi. \r\n\r\n\r\nJoshua chuan Kei leh ka chhungte erawh hi zawngin Lalpa rawng a n ikan bawl dawn ni a ti. Joshua hian a chhungkua a hre chiang a a fate thu takah hruai a tum tih kan hmu chiang hle mai \r\n\r\n\r\nTunlai khawvel hmasawn zelna leh than zelna avangte leh sualna lo pung zel avangte hian fanaute thlarau nun kawnga hruai hi tih tak zeta kan vei a hun tawh a ni. Hei hi Pathian pawhin min phut tlat a ni. Mi thiamte chuan naupang enkawl that hlutzia hriain, “Puitling pakhat i chhandam chuan, mi pkhat i chhandam a, naupang pakhat i chhandam chuan mi tam tak i chhandam a ni,” an lo ti a ni. \r\n\r\n\r\nKan Lal Isuan a ngaih pawimawh e mem chu Naupangte an ni Isua hnenah an rawn hruai pawhin Zirtir te chuan an lo hnar maia nih kha Mahse Lal Isua chhanna chu Naupangte te ka hnenah han kal tir rawh u. Zirtirna tha pek hun lai an rilru thianghlim lai thu hrilh an dawn te a tak a pek chhuah leh mai an duh hun a ni tih Lal Isuan a hriat avangin hnar a phal lo a nih kha \r\n\r\n1. PATHIAN LAKA KAN MAWHPHURHNA Thufingte 22:6-ah chuan “Naupang chu a kalna awm kawngah chuan zirtir ula, a upat hun pawhin a thlah lo vang” tih kan hmu a Hebrai nu leh pate chuan an fate sakhaw lam zirtrnaah Pathianin ti tura a phut leh thupekte chu an ngai pawimawhin, hlen chhuah ngei an tum a, an fate chu an tawng theih tirh atangin Pathin thu an zirtir thin. An puitlin thleng pawh a an thlah tawh loh tur chatuan nunna an zirtir thin a ni.\r\n\r\nSouth Korea Missionary pakhat chuan ti hian a sawi Ka nu hian thutak Lal isua ah hian ka awm lovang tih hlauin Kum 8 mi ka nih laiin Pathian thu a mi hruai thin Team pakhat chu Puk chawpin ka zui theih nan Loan a puk a chumi rah chu tunah hian India ramah missionary a ka lokal theihna chhan hi a ni , a ti. Nu leh pa tan chuan a va thlamuan thlak dawn em \r\n\r\n\r\nPathian hnung zuitute hian kan fate hi eng kawng zawh turin nge kan zirtir thin a, engtiang a hun hmang turin nge kan fuih thin le? \r\n\r\n\r\nNu leh pa te hian kan fate hi kawng dik leh tha ni a kan hriatte theih ang tawk in kan kawh hmuh thin a rinawm a. Fate thatna duh lo pawh kan awm awm lo ve. Kan fate thatna tur ni a kan ngaih chu eng nge ni ta ang le?\r\nThenkhat tan chuan thiamna sang tak tak neih a ni thei a, thenkhat tan chuan Pathian tan a mi tangkai tak ni se, Lalpa tan a theih tawp a thawktu ni se kan duh ngei . Tunlai khawvel dinhmun thlir chuan thiamna leh finna mitin in kan mamawh a. He lamah tlan pawh kan tlan na sa. Amaherawh chu Krista tel lo thiamna leh finna chu a khingbai thin.Kan faten thiamna zirin hun an hmang anih pawh in krista nen zir sela, thiamna leh finna pawh Krista nen ni rawh se. \r\n\r\nChuvang chuan kan fate hi an naupan lai a an kalna awm kawng Krista lam kan kawh hmuh a, kan hruai loh chuan an lo puitlin tawh hnuah a. chuan inhruai that a lo har tawh thin. Kristian chhungkua din alo harsa tawh thin a ni. Engvang nge kan tih chuan kan fate hi an tet lai a Krista hnen lam ah hruai lo vin, an len hnu ah hruai kan tum thin vang a ni fo . Chuvang chuan kan fate hi an kalna awm tak Krista hnen lam a kan hruai a pawimawh in a tul a. Chu chu nu leh paten kan tih awm reng a ni. \r\n\r\nKan fate hi kan enkawl that loh chuan, ni tin sikul zirtirtute kutah kan dah a, eng emaw chen chu a that viau rualin, naupang enkawl tha tak tak tur chuan zirtirtute aiin “Nu leh pa kan pawimawh zawk.” In chhungkhura naupang enkawl that loh chu sikulah pawh naupang tha an ni ngai lo vang. Kan fate Sikul kalna tur kan buaipui a, Sikul tha, man to pawh sawi lovin kan kaltir a, kan buaipui em em laiin, an thlarau nun lam kan hlamchhiah leh lawi si, an lo thanglian a, sual kawng an rawn dai chho a, a tawpah kan buai leh si. Kan fate enkawl tha tur chuan nu leh pa tluk an awm lo. Nu leh pate chuan kan fate hi lehkhathiam thei, zu in lo, mi fel tak, ram leh hnam tan leh kohhran tana mi tangkai neih kan duh theuh a ni. Mahs e, chutiang chu an ni vek thei si lo, chutiang ni thei chu mi tlem te chauh an ni si. Kan fate zirtirna tha pe chuang si lova fa tha leh mi entawn tlak, lehkhathiam neih kan duh leh si a, kan enkawl dan leh kan ngaihsak dan en chuan fa tha tak neih chu a harsa duh mai thei a ni. Nu leh paten kan fate zirtirna tha kan pek loh avangin, chhungkaw tam tak chuan kan tuar mek niin a hriat a. Thu tha kan hrilh mawlh mawlh chung pawhin, thenkhat chuan sual rawng an bawl lui tlat mai bawk a. Kan hrilh loh phei chuan eng kawng nge an zawh tak ang le ? Nu leh pa ten Vanram thleng a kan chhawm theih leh kan ro chante thu taka an awm theuh theih nan kan fate Lal Isua chanchin a tam thei ang berin hrilhin zirtir mawlh mawlh ang u chu chu thutak a awm na a ni si.', '2025-11-16'),
(7, 'BMS CHAWNPUI,TLABUNG REPORTS - F. Lalramdinpuia', 'BCM Salem kohhran members zawng zawngte min chhandamtu kan Lalpa Isua Krista hmingin chibai kan buk a che u. AICS-ah Diploma in Mission Studies leh Diploma in Church Music tluang tak leh tha taka training kan zawh hnu-in, kan hotu te ruahman-a BMS Chawnpui Tlabung-ah 17th April 2025 atangin Headmaster hna thawk turin kan lo awm veleh ta a ni. Ram pawn-ah kum 22 years zet hun kan hman tawh hnu-ah mahni ramah kan han thawk ve leh a, thawh thiam pawh ahar viau mai kan la in zir chho ve zel e. Kohhran ho te min tawngtaipuina zawng zawng-ah lawmthu kan sawi a, min lo tawngtaipui zel tur che u in kan sawm nghal bawk a che u.\r\n\r\nKan thawhna School leh kohhran reports tlangpui:\r\n\r\n1. SCHOOL LAM: Kan School hi Baptist Mission School (BMS) Chawnpui Tlabung tih ani a kum 2014-ah Tlabung Bial-in an din a ni. Tunah chuan BCM Mission Department hnen-ah hlan ani tawh. Zirlai 236 kan nei a, Class KG I atanga Class X thleng kan nei a, thawk tu te Missionary 8 leh Local Teacher School atanga hlawh pek 8, Peon 1 leh Mid-Day Meal chaw chhum 3 kan nei ani. Kan zirlai te hi Mizo, Pang, Bawm leh Chakma te ani a, Mizo naupang a tam ber ani.\r\n\r\nHUN HMANDAN TLANGPUI: Zing tin devotion/assembly kan nei a, zai hona leh Pathian thu sawina hun zirtirtu ten kan inhman chhawk thin a. Zirlai te atangin Bible chhiar, solo, tawngtai leh devotion hruaite chanvo kan pe thin. Zirtawp class banah thawktu te office-ah tawngtai hona hun kan hmang thin. A rem chan dan angin thawktu zawng zawngte fellowship hun hlimawm tak kan hmang thin. Kar tin nilai chawhnu-ah CCA programme kan hmang thin a, CCA-ah hian heng: music, tailoring, dance, singing leh electric wiring te kan zirtir thin. Naupang hoin an mahni ngei in an awmna tur leh tuina an thlang a, naupang ho an phur thei hle. CCA class-ah hian 40 minutes hi kar tin zirtirtu te class tinah in-sem-in Moral & Character Development leh Career Guidance hun atan kan hmang thin bawk. Heng kan CCA programme-a bik takin Music, Tailoring-ah te hmanrua practical tih nan engemaw zat kan mamawh a. Kan kohhran BCM Salem, NU pawl leh kan thiante’n guitar tha tak pahnih min lo donate a, kan lawm hle ani. Music class-ah tangkai takin kan hmang tawh e. Kan thawhna school-ah hian Buddhist zirlai 29 kan nei a, zirtirtu ten an hming pawtin kan tawngtaipui a. He school-a an awm chhung ngei a, ringtu an nih theih nan theih tawpin hma kan la chho ve ani. Heng Buddhist naupang te hi private hostel-ah an awm hlawm a, hostel neitu te rem tihna in devotion kan neih pui thin a, Pathian thu hrilhna remchang tak kan nei thei a kan lawm hle ani.\r\n\r\n2. HOME VISIT: Tun kum school session chhung hian home visit tum thum tal neih chhuah vek kan tum a, tum hnih kan nei tawh a. Group hrang hrang-ah in-then-in kan zirlai te in-ah tum hnih kan kal chhuak vek tawh a, kan hlawkpui khawp mai. Zirlai te fuihna leh an tan leh an chhungkaw tan tawngtai sakna hun te kan hmang a, an harsatna te pawh an lo share ve a, kan hlawkpui hle. Kumin hian matric exam tur 16 lai kan nei a, kan in hlangkai vek lovang tih a hlauhawm khawp mai. Dated 17th Nov atangin Study Camp kan neihpui dawn a, min lo tawngtaipui thin dawn nia.\r\n\r\n3. GOSPEL MEETING: Kan zirlai te zingah piantharna tak tak pawh lo an tam hle a, tin Buddhist zirlai 29 vel kan nei bawk a, kan nau ten chhandamna an chan ngei theih nan Gospel Meeting programme dated 19th & 20th Nov hian kan nei dawn a. Speaker-ah Rev. K. Lalnunsanga, Director Christian Education, Worship & FOD leh kan Chakma Pastor Suresh Bachan kan sawm a. Thlarau lam malsawmna kan chan ngei theih nan min lo tawngtaipui ve rawh u.\r\n\r\n4. OUTREACH PROGRAMME: Dated 17th Oct khan Tiperaghat-ah Outreach Programme kan hmang a, tlaiah home visit neiin kan programme a rawn tel turin kan sawm a. Zanah hun kan hmang a mipui an lo kal tha hle a. Pathian thuchah “Thlamuanna Dik” tih thupui hmangin thuchah ka sawi a, zai, cultural dance leh film show te kan nei thei a. Pathianin hna a thawh chhunzawm zel kan beisei.\r\n\r\n5. KOHHRAN LAM: Chakma kohhran pakhat kan enkawl tel a, members 130 bawr vel anni a. Kan Chakma kohhran te rinna kawngah an chak lova, tisa thil tak pawhin an rethei a, nawr kal ngai tak tak an la ni. A chang chuan beidawn mai te pawh a hlauhawm. Home visit te kan nei a, in khawm tur ten kan han sawm a. Inkhawm pawh Sunday zingah chuan Biak In kan khat dal tawh a, Sunday School pawh kai kan tha ta viau a, kan lawm khawp mai. Week end-ah a remchan dan angin chheh vel khua leh kohhran te tlawhna hun kan nei thin bawk.\r\n\r\n6. PRAYER FELLOWSHIP: Zirtawp zan apiangin Missionary te Prayer Fellowship kan nei thin a, sharing, zai hona leh tawngtai hona hun kan hmang thin. Nuam kan ti in kan hlawkpui thin khawp mai. Thlarau lama kan intuai tharna hun pawimawh tak ani.\r\n\r\nHe lai hmunah hian Lalpan eng chen nge min dah dawn kan hre lova, kan awm chhung hun ah hian Pathian tan tangkai taka kan thawh theih nan leh midang te tan malsawmna kan nih zel theih nan kohhran ho te tawngtaina ah min lo hre ve reng dawn nia. He lai hmun hi Presbyterian leh Baptist in epna hmun lian tak mai alo ni a. Synod ho hian school changtlung tak mai kum 42 years lai a upa an lo nei tawh a, harsatna neuh neuh lo chhuakin tuna kan thawhna school BMS pawh hi chu mi harsatna avanga din chhoh alo ni a. Mihring lama tanga thlir chuan thil huphurh awm tak ani, Pathian a tanga finna, remhriatna, rorel thiamna te kan mamawh tak meuh ani.', '2025-11-09'),
(8, 'Sunday school pawimawhna', 'Sunday School hi Kohhran rawngbawlna peng hrang hrang zinga lungphum pawimawh ber pakhat a\r\nni a. Bible-ah Sunday School tih thumal hmuh tur awm lo mah se, a tum leh a ngaih pawimawhna chu \r\nPathian thua innghah a ni.\r\n\r\nMizoram Baptist Kohhran (BCM) chuan bul a tan tirh atangin Sunday School hi a ngai pawimawh em em a,\r\nMissionary hmasate (Sap Upa leh Pu Buanga) khan Mizote thiamna kawngkhar hawnna atan an hmang a ni. \r\n\r\nA Pawimawhna Tlangpui:\r\n\r\n1.Pathian thu zirna hmun ber a ni: Sunday School hi Pathian thu kan zira, kan bel chianna hmun\r\npawimawh ber a ni. Pathian thu hi kan ke atan khawnvar, kan kawng atan eng a ni a (Sam 119:105), he thu hian\r\nchatuan nun kawng min kawhhmuh a ni.\r\n\r\n\r\n2.Rinna tinghettu leh nun kawng\r\nkaihruaitu: Naupangte leh puitlingte taksa, rilru, leh thlarau Pathian thua an nun a ngheh theihna tura\r\ninchherna hmun hmasa ber a ni. Thomas Rainer-a sawi danah chuan, America rama kohhran member thar lo\r\nlut tam zawk (80%) chu Sunday School atanga inpe an ni. Hei hian a pawimawhzia a tarlang chiang hle.\r\n\r\n\r\n3.Kohhran dinhmun tinghettu leh ban pawimawh: \r\nRev. Dr. V. Lalzawnga’n a sawi thin ang hian, “Sunday School hi Mizote thiamna min petu,\r\nKohhran dinhmun tinghettu, Kohhran ban a ni”. Kohhran tha leh chak tak neih duh chuan, Sunday School\r\ntha tak neih a pawimawh hle a ni.\r\n\r\n\r\n4.Mimal leh chhungkuaa nghawng tha nei: \r\nSunday School zirtirnain mimal, chhungkua, leh kan ram nun hnuk a khawih danglam nasat theihzia hi\r\nsawi uar a pawimawh. New York Judge Fawcett-a chuan a court-a thubuai an chinfelte chu Sunday School kal\r\ntha lo deuh vek an nih thu a sawi bawk. Hei hian mimal nuna Sunday School zirtirna nghawng thatzia a tilang.\r\n\r\n\r\n5.“Zir la, Nunpui rawh” tih thiltihna hmun:\r\nBCM Sunday School thupui ber pakhat chu “Zir la, Nunpui rawh” tih hi a ni. Pathian thu zir mai piah\r\nlamah, chu thu chu nuna lantir (nunpui) hi a tum ber a ni. \r\n\r\n\r\n· Khawvel Sunday School Ni hi kum tin hman thin a ni a, he ni hian Sunday School tangkaina leh \r\npawimawhna kan hriat thar leh a pawimawh hle. Sunday School hi kan kohhran tan, kan\r\nchhungkua tan, leh kan mimal nun tan a pawimawh em avangin i ngai pawimawh zel ang u. Pathian thu\r\nzir taima ila, a thu ang in nung thin ila, he khawvelah\r\nnun kawng dik kan chhar chhuak ang a, chatuan nunna pawh kan chang thei dawn a ni', '2025-11-02'),
(9, 'In ring rengin awm rawh u (Marka 13:37) - K. Liankimi (Kimpuii)', 'Engvanga inring tur nge kan nih ?\r\nLal Isua a mite lam tura a lo kal leh dawn avangin. Chuvangin, nangni pawh inring rengin\r\nawm rawh u, in rin loh hunah Mihring Fapa a lo kal dawn si a.\r\n\r\nIsua chu eng hunah nge a lo kal dawn?\r\nNimahsela chu mi ni leh dar thu chu Pa chauh lo chuan tuman Vana Vantirhkohte pawhin,Fapa\r\npawhin a hre lo. (Marka 13:32)\r\n\r\nEngtinnge kan inrin ang?\r\nInrinna tur kawng tam tak a awm ang, mahse kawng 2 chauh sawi ila.\r\n\r\n1. Lal Isua Kristaa awm reng :\r\nJohana 15:4 – ah chuan,”Keimahah awm reng rawh u, kei pawh nangmahni ah ka awm reng ang”a ti. Lal Isua Kristaa kan awm reng chuan eng hunah pawh lo kal se hlau lovin kan tawk thei ang.\r\n\r\nHe kan taksa hi Pathian In a nih I Kor 3:16-17 ah kan hmu a. Tupawhin Pathian In chu a tihkhawloh chuan chumi chu Pathianin a tikhawlovang. Pathian In chu a thianghlim si a, chu In chu nangmahni in ni e. \r\n\r\nPathian in thianghlim hi thil tha lo tam takin kan tibawlhhlawh thin, mahni i in en theuh ang u.\r\nSual ngam che in awm suh la, thatnain sual chu ngam zawk rawh. (Rom 12:21) A theih phawt chuan nangmahni lam tal mi zawng zawng nen in rem in awm rawh u.(Rom 12:18) Keimahnia thil tha lo – rukruk, dawt sawi, mi rem theih loh neih te, kan taksa ti chhe thei ruihtheih thil tih kan chin chuan Lal Isuaah kan awm reng lo tihna a ni. \r\n\r\nLal Isua hi a lo kal leh ngei ngei dawn. Ngai teh, kawngkhar bula dingin ka kik hi,tupawhin ka aw hriaa kawng a hawn chuan a hnenah ka lut ang a, a hnenah zanriah ka ei ang a, a ni pawhin ka hnenah a ei bawk ang.(Thupuan 3:20)\r\n\r\n\r\n2. Rinawmna :\r\nThih thlengin rinawmin lo awm rawh, tichuan nunna lallukhum ka pe ang che.(Thupuan 2:10) Khawvel hmun hrang hrangah Kristian ten tihduhdahna an tawk nasa em em a, heti chung hian Pathian rinna an phat ngai lo. An inkhawm lai ten misualin an kap a, thenkhat an thi a, thenkhat na takin an hliam a. Mozambique hmar lam mite chu Muslim firfiak pawlten an bei a, Kristian an mante zinga 30 chuang an Lu an tan a, an Biak In leh chenna In an hal sak a (Makedonia Ni 19). Hetiang khawpa harsatna tawk hmun tam takah awm mahsela rinawm takin Lal Isua an zui tlat a ni. Fimkhur ula, inring renga awmin tawngtai rawh u. (Marka 13:33)\r\n\r\n\r\nKan ram dinhmun lo thlir ila, inring reng hian kan awm hlawm em aw? Sum leh pai duh luat avangin mi tam takin Lal Isua zui hleithei lovin kan chau thuap niin a lang. Tangka sum ngainat hi sual tin reng bul a ni. (Tim 6:10) Sum tel lovin kan khawsa thei lo, sum ngainat hi a\r\nni pawi ta thin chu. Hei hian rukruk, tualthah, duhamna, rinawm lohna etc a hring a, ruihhlo ngai ten an mamawh ber chu sum bawk a ni. Heng thil avang hian mi tam tak Lal Isua tawk tur hian kan in ring thei lovang tih ava hlauhawm em! Lal Isua a lo kal hun tur tumahin\r\nkan hre lo. Chuvangin, nangni pawh inring rengin awm rawh u, in rin loh hunah Mihring Fapa a lo kal dawn si a. (Matt 24:44) \r\n\r\n\r\nTun hunah hian kan thu hriatte hi ngaihven a, khawvel han thlir hian a tha lam aiin a chhe lam thil rapthlak tak tak lirnghing te, hrileng mak tak tak te, indo thuthang hriat tur awm reng te, sualna lo pung mek leh Pathian thu tak tluksanna lo pung nasa tak te hi min tiharhtu tu atan, in ring renga kan awm theih nan hmang ila ava tha dawn em! \r\n\r\n\r\nCharlie Kirk, tunlai khawvela lar em em hi ka ngaisang a, a chanchin ziakna ka hmuh theih ang chu ka chhiar zel a, huaisen taka Lal Isua chanchin puangtu a nihna te, kumkhatah lehkhabu 100 chuang a chhiar te kha rawngbawla a chhuah loh pawhin a awm mai mai lo tihna a ni. Martar thisen chu mi tam takin an harh phah a, inkhawm ngai lo te, Bible chhiar ngai tawh lo tam tak an inkhawm a, Bible an chhiar phah a, Bible pawh an hralh tam phah hle niin an sawi. Lalpa tan rinawm taka a thawhna chuan mi tam tak nun a kai harh a ni. Rinawm leh fel takin Lalpa rawng bawl ila, alo kal hun ah hlau leh khura kan awm loh nan. Tin, inhnena ka sawi hi mi zawng zawng hnena sawi ka ni, in ring rengin awm rawh u.\r\n\r\nLalpa’n a thu malsawm rawh se.\r\n', '2025-10-26'),
(10, 'Kan tih makmawh - Environment humhalh - Rev. Lianchhunga Khiangte', 'Khawvêl hian a ni têlin lum lam a pan zêl a, tuifinriat chîm chin sâng zêlin khaw tam tak a hnawt tiau va, chutih laiin tuihna ten kiam lam an pan zêl a, tui thianghlim kan tlachham mêk lawi si! Boruak a bawlhhlawh a, lei chunglang hâng pawh tûr (chemical) chi hrang hrang hmangin kan tibawlhlawh mêk a ni. Nungcha tam tak an chimang tawh a; mi thiamte chhût lâwk dân chuan tûn anga kan khawvêl hian chhiat lam a pan zêl chuan kum 2050-ah meuh chuan tûna nungcha awm mêk zaa sawmthum (30%) hi chu an mang hlauh tawh ang. Nang leh kei hian thilsiamte humhalh kawngah mawhphurhna lian tak kan nei a ni. Hetiangin a chhan kawng hrang hrangin sawi ila: \r\n\r\n\r\n1. Thilsiamte hi Pathian duhlaite an ni. Genesis-ah thil siam thu kan hmu a. Pathian chuan a thil siamte chu a en a, tha a ti êm êm hlawm a ni tih a lang. Tin, a siam zawh khân hnuchhawnin a thlahthlam nghâl mai lo va, enkawlin a châwm zui zâwk a ni. Hei hi kan Lal Isua ngei hian a sawi chiang hle. Savâte a châwm a (Mt. 6:26), ram tûktinpârte pawh a chei a (Mt. 6:30), Chawngzawng pakhat pawh a thu lovin leiah a tla lo a ni (Mt. 10:29). Amah chu thawhpui a, thilsiamte enkawl hna, mawhphurhna sâng tak chu Pathianin min bah a ni (Gen.1:28). \r\n\r\n\r\n2. Pathian mite hmaah thilsiamten zalênna an chang thîn. A siamtu Pathian thinlunga an len ang chiahin thilsiamte hian Pathian fate thinlungah hmun an chang tlat thîn. Pu Chawngkhupa khân luia mi aiâwt chiaha chakai lo tla a han hmu chu a lainat êm êm mai a, “Saltâng chhuahna Jubili” ti chungin a chhuah hem hem mai a ni an ti. Tirhkoh Mankima pawh kha thuhrila a vahna khaw pakhatah a thlen in nu chuan a fate Tuaingâwt a rawn hawnsak a. A ke hmâwr hriam chin ulh bung veka khâwllaa an chaih chu a lo lainat êm êm mai hi a lo ni a. Zanriah an kîl a, tawngtai tûra an han sâwm chuan, “Aw Lalpa, he khawvêlah hian Tuaingâwt te nên hian kan rûm tlâng a nih hi,” a ti e an ti! Nang pawh Kristaah chuan Pathian faa vuah i ni tawh a, thilsiamte laka i mawhphurhna kha hre reng ang che. Thil siam zawng zawngte chuan beisei êm êmin, Pathian fâte lo lanna chu an nghâkhlel hle si a (Rom 8:19). \r\n\r\n\r\n3. Kan Lalpa thupêk a ni. Khawvêl zawng zawnga kal a, thil siam zawng zawng hnêna Chanchin Tha hril tûrin Lal Isuan thupêk ropui (The Great Commission) min pe a ni (Mk. 16:15). Chuvângin Chanchin Tha hi mihring, thlarau bote chauhvin an mamawh a ni lo, thilsiam zawng zawng hian Chanchin Tha an dawng ve tur a ni. Amaherawhchu mihringte anga tawngkaa hrilh theih an ni lo va, duat taka enkawl leh humhalh tlatin an hnênah Chanchin Tha kan hril tûr a ni.\r\n\r\n\r\n 4. Khua leh tui tha kan nih avângin. Pathian thu chuan kan chunga rorêltute thu thua awm tûrin min zirtîr a (Rom 13:1). India ram te ang mipui rorêlna (Democracy) ramah hi chuan kan dânte hi thuneitu leh rorêltu a ni. India dânpui (Constitution) chuan, “India khua leh tui zawng zawngte chuan kan chênna leilung leh a chhûnga ramngaw te, lui te, dîl te leh nungchâte chungah hmangaihna kan lantîr ngei ngei tûr a ni,” a ti a. Environment humhalh tûrin min phût tlat a ni.', '2025-10-19'),
(11, 'TUNLAI THIL AWMZIA', 'Thuhriltu tam takten hun hnuhnung kan thleng ta, hun khirhkhan chu kan thleng ta e tiin an au a, mi\r\nthenkhat chuan chu thu chu kan hriat atang kan nun kan inenfiah a, mi thenkhat erawh chuan kan muan\r\nngaiin kan la muang a, a ngaihna hre lo hian kilkhatah kan lo thu ringawt thung a, thenkhat ve\r\nthung chu sual hnathawhin an taksa ngei a fanchhuah an ni a, kal dan an thiam lo va, an nun hi a beidawng\r\nem em thung a ni.\r\n\r\n\r\nChu khawvel mihring inthlau lutuk mai chu avang chuan a ni a, speaker tamtakten an au a, tha hnem\r\nngai tak mai a, hma an lak a, a au chiam ni. Hun tha chu aliam thuai dawn a, a pawi mang e aw tih\r\ntawngkam hian tlai hun a nei dawn a, a pawi hmaa inrinlawkna turin min hrilhin an tlangau zawk a ni tih\r\nhriata kan dinhmun, kan awmna hmun sual thim thuk tak ata chhuak a, kan Lalpa hnen lam kan pan hi a\r\nhun tak zet zet a ni.\r\n\r\nLal ISUA ngei khan buhchi theh thu min hrilh a, khang buhchite kha an tlakna hmun a inang lo ang\r\nbawk khan mihringte pawh kan tlakna hmun a inang lo va, a then chu thuawih tak anga lang si zawm\r\nchuang si lo, zung kai thei tlat lo an ni a, a then erawh he khawvel sualin a chimpil mekte an ni a, thenkhat\r\nchauh lei thaa tla an awm a, tlemte chauh an ni.\r\n\r\n\r\nLal ISUA lo kal hun tur hi Biblein min hrilh dan chuan a lo kal a hun tawh hle a, thleng turte\r\nchu a thleng chet chet zel mai. Mahse engvanga lo kal si lo nge a nih tih chuan nang leh kei mi tam tak\r\nchhandamin kan la awm loh vang a ni. Mi zawng zawng chhandama awmah leh thutak hriaah a duh\r\nvangin, min hmangaih vang liau liau in hun tawp hi a la thlen tir loh mai zawk a ni. Chu thu chu kan tan a\r\nlawmawm em em a, mahse a lawmawm em a vang chuan kan muangchang phah tur erawh a ni lo.\r\nInbuatsaiha a hnen lam pana kir thuai turin min duh a ni.', '2025-10-12');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `image`, `description`, `created_at`) VALUES
(1, 'Ruihhlo thatlohzia Inzirtirna', 'uploads/gallery_1760458540.jpg', 'Ni 2 October 2025 khan Jr.TKP te chuan LDF Futsal Ground ah Ruihho thatlohzia Inzirtirna neih pahin Intihhlimna an nei a.\r\nMember 40 vel kalin, Futsal,Poison ball,Dual Stick race,Blind penalty Shootout,Volleyball etc hmangin intihhlimna an nei a.\r\n\'Ruihhlo thatlohzia\' Slogan Writing lawmman semna neih nghal a ni bawk.\r\n\r\nResource Person: Tv Lalremliana Chhakchhuak.', '2025-10-04 18:30:00'),
(2, 'Dt 28.09. 2025 - Sunday School Report', 'uploads/gallery_1760458690.png', 'Ni 28.09.2025 a Sunday School Kai dan Report', '2025-10-04 18:30:00'),
(3, 'Jr.TKP - ‘Eiruk thatlohzia Inzirtirna Awareness’', 'uploads/gallery_1760461878.jpg', 'Ni 21 September 2025 khan Jr.TKP te chuan Upa Tlantununga(Lecturer BHSS) ho in ‘Eiruk thatlohzia Inzirtirna Awareness’ an nei a, Member 45 vel an kal a ni.', '2025-09-27 18:30:00'),
(4, 'Dt 21.09.2025 - Sunday School Report', 'uploads/gallery_1760462670.png', 'Ni 21.09.2025 a Sunday School Kai dan Report', '2025-09-27 18:30:00'),
(5, 'Dt 14.09. 2025 - SUNDAY SCHOOL REPORT', 'uploads/gallery_1760463385.png', 'NI 14.09. 2025 SUNDAY SCHOOL Kai dan Report', '2025-09-20 18:30:00'),
(6, 'TKP GROUP REPORT', 'uploads/gallery_1763652733.png', 'SUMEONA GROUP:\r\n\r\nI. Ni 8 November 2025 khan Motor Silin inhlawhfakna an nei a. Hetah hian member thahnem\r\ntak thawk chhuak in pawisa an hlawh chhuak nual a ni. Anni Group hian Kumtluang Auto Spa (Pu\r\nMarotea) an Asst.Leader ni bawk chungah, a motor silna phal taka a hman tir avangin lawmthu an sawi\r\na.\r\n\r\nTin,Kohhran leh vengchhunga motor lo sil tir tu zawng zawng te chungah thinlung takin lawmthu\r\nan sawi bawk a ni.\r\n\r\nII. Ni 13 November 2025 khan Mizofed ah Bungrua an thiar bawk a.Member thawk chhuak zawng\r\nzawng te chungah lawmthu an sawi mai bakah. Mizofed Manager Pu Jeffrey Lalremruata’n bungrua\r\na thiar tir avangin a chungah lawmthu an sawi bawk a ni.', '2025-11-15 18:30:00'),
(7, 'Dt 9.11. 2025 SUNDAY SCHOOL REPORT', 'uploads/gallery_1763652975.png', 'Dt 9.11. 2025 SUNDAY SCHOOL REPORT', '2025-11-15 18:30:00'),
(8, 'TKP TAWNGTAI TLAIVAR', 'uploads/gallery_1763653133.jpeg', 'MTKP Rorel 2025 in kumin hian ‘TKP ten thlaraubo man beihpui thlak’ neih ni se ti a a lo rel tawh ang in, \r\nkan unit pawn ni 19 October, 2025 Pathianni zan zaikhawm ban khan biak inah neih a ni a. \r\nMember pawh mi 70 lai kan kal thei a. \r\n\r\nSawhchhiar min siamsaktu Pu F.Zonunsanga, Pu C.Lalhmingthanga, Pu T. Zoramthanga\r\nleh Pu T. Lalropuia te chungah lawmthu kan sawi e. \r\n\r\nTin, Pu C.Lalhmingthanga’n sawhchhiar tur arsa kg 8 tur kha kg 5 in min tihsak bawk a, achungah TKP ten lawmthu kan sawi e.', '2025-10-25 18:30:00'),
(9, 'Dt 19.10. 2025 SUNDAY SCHOOL REPORT', 'uploads/gallery_1763653530.png', 'Dt 19.10. 2025 SUNDAY SCHOOL REPORT', '2025-10-25 18:30:00'),
(10, 'Dt 12.10. 2025 - Sunday School Report', 'uploads/gallery_1763653968.png', 'Dt 12.10. 2025 - Sunday School Report', '2025-10-18 18:30:00'),
(11, 'TKP GROUP REPORT', 'uploads/gallery_1763654029.png', 'MIKA GROUP\r\nNi 4 October 2025 khan Mika group te chuan Gospel rose car wash-ah motor sila inhlawhna an nei a.Member thahnem tak thawk\r\nchhuakin,phal taka a motor silna hmun hman tirtu Pu.Samuel.Lalruatfela chungah an lawmhle ani.\r\n\r\nLEVIA GROUP\r\nDt 02/10/2025 khan Kumtluang Auto Spa-ah Motor silin an in hlawh a, sum tam tak an thawk chhuak a ni. Phal taka a hmun hma hman tirtu \r\nPu. T. Rothangzela chungah lawmthu an sawi mawlh mawlh e.\r\n\r\nEZRA GROUP\r\nNi 04/10/2025 leh Ni 08/10/2025 khan Pu R.Hrangzama te brick thiar leh Mizo fed dawng bungrua thiara inhlawhfakna an nei a,\r\ninhlawhfakna siam saktute chuang lawmthu an sawi takzet a ni.', '2025-10-11 18:30:00'),
(12, 'Dt 5.10. 2025 SUNDAY SCHOOL REPORT', 'uploads/gallery_1763654111.png', 'Dt 5.10. 2025 SUNDAY SCHOOL REPORT', '2025-10-11 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `image_cards`
--

CREATE TABLE `image_cards` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `content`, `created_at`) VALUES
(2, 'Salemthar PDF file download duh tan a chung download button atangin a download theih.', '2025-09-21'),
(4, 'OCTOBER 2025 chhung atana Biakin chanvo neitute, hriattur pawimawh section ah tarlan ani.', '2025-09-28'),
(5, 'Salemthar PDF file download duh tan a chung download button atangin a download theih.', '2025-11-16'),
(6, 'Salemthar PDF file download duh tan a chung download button atangin a download theih.', '2025-11-09'),
(7, 'Salemthar PDF file download duh tan a chung download button atangin a download theih.', '2025-11-02'),
(8, 'Salemthar PDF file download duh tan a chung download button atangin a download theih.', '2025-10-26'),
(10, 'Salemthar PDF file download duh tan a chung download button atangin a download theih.', '2025-10-19'),
(11, 'Salemthar PDF file download duh tan a chung download button atangin a download theih.', '2025-10-12'),
(12, 'Salemthar PDF file download duh tan a chung download button atangin a download theih.', '2025-10-05'),
(13, 'Salemthar PDF file download duh tan a chung download button atangin a download theih.', '2025-09-28');

-- --------------------------------------------------------

--
-- Table structure for table `pdfs`
--

CREATE TABLE `pdfs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pdfs`
--

INSERT INTO `pdfs` (`id`, `title`, `file`, `created_at`) VALUES
(10, '21st September 2025', 'uploads/21st_September_2025.pdf', '2025-09-21'),
(11, '28th September 2025', 'uploads/28th_September_2025.pdf', '2025-09-28'),
(13, '12th October 2025', 'uploads/12_October_2025.pdf', '2025-10-12'),
(14, '5th October 2025', 'uploads/5th_October_2025.pdf', '2025-10-05'),
(15, '19th October 2025', 'uploads/Salemthar_19_october_cmp.pdf', '2025-10-19'),
(16, '26th October 2025', 'uploads/Salemthar_26_october_2025___2_.pdf', '2025-10-26'),
(17, '2nd November 2025', 'uploads/2nd_November_2025-_Salemthar.pdf', '2025-11-02'),
(18, '9 November 2025', 'uploads/9_Nov_2025__1_.pdf', '2025-11-09'),
(19, '16th November 2025', 'uploads/16th_November2025.pdf', '2025-11-16');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `content`, `created_at`) VALUES
(1, 'Tun Pathian Ni a mawi taka Pangpar Khawitute chu   Pi. RK Saimawii leh Nl. Lalawmpuii Khiangte te an ni e.', '2025-10-05'),
(2, ' Tun Pathian Ni a mawi taka Pangpar Khawitute chu Pi. M.Varparhi leh Nl B.Laldamchhani te an ni e.  ', '2025-09-21'),
(3, 'Tun Pathian Ni a mawi taka Pangpar Khawitute chu Pi. PC.Lalremruati leh Nl C.Lalnunfeli te an ni e.', '2025-09-28'),
(4, '\r\nBial hrang hrang a , FAITH PROMISE pe tlak te hming.\r\n\r\n\r\nMc. Lalhlimpuii bial ( MGP)\r\n1. Biakthansanga\r\n2. Lalchhanchhuaha\r\n3. Vanlalruata\r\n4. Benjamin Lalawmpuia\r\n5. Jonathan Laltlankima\r\n6. PC. Lalchhuanmawia\r\n7. B. Laldamchhani\r\n8. Lalduhsangi\r\n9. LH. VL Rosangpuia\r\n10. Rebec Lalrammuani\r\n11. Freddy Lalremsiama\r\n12. B. Lalhruaitluangi ( Jr TKP)\r\n13. B. Lalmuankima ( Jr TKP)\r\n14. ZD. Lalbiakveli\r\n15. V. Lalhriatpuii\r\n16. Lalzarmawii Sailo\r\n17. Lalmalsawmi Sailo\r\n18. Hmangaihsangi\r\n19. Lalmalsawma Sailo\r\n20. Lalmuanpuii Hlawnchhing\r\n21. Lalhriatpuii Hlawnchhing\r\n22. Saidingpuii Sailo\r\n23. Vanlalsiama\r\n24. K. Malsawmtluanga\r\n25. K. Lalawmpuia\r\n\r\nPu Lalsangliana Bial ( AOC )\r\n1. Tv B. Vanlalrengpuia\r\n\r\nTv Robin Lalramnuama Bial ( Biak in bul)\r\n1. ZD. Lalruatsanga\r\n2. John Lalthanpuia\r\n3. Vanlalhnema\r\n4. L. Zodinsangi', '2025-10-26');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(1, 'display_mode', 'latest');

-- --------------------------------------------------------

--
-- Table structure for table `side_sections`
--

CREATE TABLE `side_sections` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `side_sections`
--

INSERT INTO `side_sections` (`id`, `title`, `content`, `created_at`) VALUES
(2, 'HUN CHANGTU TURTE', 'Pathianni Zing (9:45 AM)\r\n\r\nHruaitu : Upa K.Lalrohlua\r\n\r\nThupuan : Secretary\r\n\r\nZaipawl : Standing Choir\r\n\r\nThuchah : Rbt PC Lalnunmawia\r\n\r\n\r\n\r\nPathianni Zan (6:30PM)\r\n\r\nHruaitu : Upa Ngentluanga\r\n\r\nSolo : ZD Lalruatsanga\r\n\r\nThuchah : Zotlang North\r\n\r\nNilai Zan : Rbt C.Laldingpuia\r\n\r\nInrinni Zan : Upa F.Lalhlira', '2025-10-05'),
(3, 'SEPTEMBER 2025 THILPEK', 'PRZ 19,18,090\r\n\r\nRAMTHIM 3,13,310\r\n\r\nBUHFAITHAM 1,30,330\r\n\r\nBUILDING 1,87,750\r\n\r\nTUALCHHUNG 2,12,170\r\n\r\nKRISMAS 1,05,020\r\n\r\n\r\nTOTAL 28,66,670\r\n\r\nEnvelope lut zat 240', '2025-10-05'),
(4, 'BKHP PROGRAMME', 'Dt 10.10.25 (Zirtawp zan) ah Tu leh fate pual tawngtai inkhawm neih tur a ni dawn a\r\n\r\nHruaitu : Pi Lalengmawii', '2025-10-05'),
(5, 'EVANGELICAL CELL TLAI TAWNGTAI HRUAITU', 'October 2025\r\n\r\n5.10.2025 – Tv Lalremliana chhakchhuak\r\n\r\n19.10.2025 – Tv Vanlalruatfela\r\n\r\n\r\nNovember\r\n\r\n2.11.2025 - Nl. F. Lallawmsangi\r\n\r\n16.11.2025 – Tv K. Lalhmingsanga\r\n\r\n23.11.2025 – Nl B. Lalhruaitluangi\r\n\r\nDecember\r\n\r\n7.12.2025 – Nl.Zd lalbiakveli\r\n\r\n21.12.2025 – Tv. Lalthlangmawia', '2025-10-05'),
(6, 'TKP INKHAWM PROGRAMME', 'A hun : Ni 6th October 2025\r\n\r\nA hmun : BCM Biak in Salem\r\n\r\nTan hun : Zan Dar 6:30\r\n\r\nHruaitu : Nl S.Lalenkawli\r\n\r\nTantu : Pu C.Lalsangliana\r\n\r\nThupuan : Secretary\r\n\r\nTawngtai rual hruaitu : Nl C.Lalneihzuali\r\n\r\nThawhlawm khawn turte :\r\n\r\n 1) Nl Sabina Rinhluzuali\r\n 2) Nl Rachel Lalenkawli\r\n 3) Nl Christina Lallawmawmi\r\n\r\nSolo : Nl Laldinsangi Ralte\r\n\r\nSharing : Pu J. Lalremruata (Sawihawngtu)+A duh\r\napiang tan\r\n\r\nBible Chhiar rualhruaitu: Tv Freddy Lalremsiama\r\n\r\nBible Chhiar turte:\r\n\r\n 1) Tv B.Lalrohluna\r\n 2) Pu F.Lalnunthara\r\n\r\n\r\nThuchah : Nl ZD Lalbiakveli\r\n\r\n\r\nNote:\r\n1) Relief Bawm hun a ni ang.', '2025-10-05'),
(7, 'ZAIKHAWM PROGRAMME', 'Pathian hnathawh ropui tak kan kohhranin kan chan mek chu nasa lehzuala a lo thlen a,\r\na lo darhzau zelna tur anih beiseiin kohhran comt leh fellowship hrang hrang OB Joint meeting\r\nchuan tunkar chhung khan inkhawm loh zan apiangin mawngmaiho na neih mhin nise a ti a,\r\nsharing sawi leh zaiho te pawh neih a ni bawk ang.\r\n\r\nKohhran memberte thahnemngai taka tel theuh turin kan insawm e.\r\n\r\nDt 5.10.2025\r\n\r\nPathianni zan Inkhawm ban\r\n\r\nHruaitu: Pu Samuel Lalruatfela', '2025-10-05'),
(8, 'HUN CHANGTU TURTE', 'Pathianni Zing (9:45 AM)\r\nHruaitu : Upa B.Lalkhuma\r\nThupuan : Secretary\r\nZaipawl : Standing Choir\r\nThuchah : Upa JC.Zosanga\r\n\r\nPathianni Zan (6:45PM)\r\nHruaitu : Upa F.Lalrinthanga\r\nLive Band : Jr.TKP\r\nThuchah : Upa B.Sangsiama\r\n\r\nNilai Zan : Rbt Lalramliana(Papuia)\r\n\r\nInrinni Zan : TKP Crusade', '2025-09-21'),
(9, 'ZING TAWNGTAI INKHAWM HRUAITU TURTE', 'Tan hun : Dar 5:15 AM\r\n\r\nDt 22.9.2025 - Pi.H.Darbuki\r\nDt 23.9.2025 - Pu.K.Lalhmingmawia\r\nDt 24.9.2025 - Pi. Vanlalpari\r\nDt 25.9.2025 - Pi. H.Lalawmpuii\r\nDt 26.9.2025 - Pi. R.Lalbiakchhungi\r\nDt 27.9.2025 - Pi V.Lalnunmawii\r\nDt 28.9.2025 - Upa F.Lallianzara', '2025-09-21'),
(10, 'TKP CRUSADE PROGRAMME', 'A hun : Dt 26th – 28th September 2025\r\nA hmun : BCM Biak In, Salem\r\n\r\nSpeaker : Rev K. Lalnunsanga\r\nThupui : “Pathian nena lendun” Mika 6:8\r\n\r\n\r\nDt 26th September 2025 (Zirtawpni)\r\nZan Inkhawm @ 6:45 p.m\r\nHruaitu : Nl. MC. Lalhlimpuii (Unit Finance\r\nSecretary)\r\nSolo : Nl. F. Ramchhuanawmi\r\nGroup zai : BKHP\r\nThuchah : Speaker\r\n\r\n\r\nDt 27th September 2025 (Inrinni)\r\nZan Inkhawm @ 6:45 p.m.\r\nHruaitu : Pu F. Lalthlengmawia (Executive Comt.\r\nMember)\r\nTawngtai rual : Hruaitu\r\n Solo : Pu ZD. Lalruatsanga\r\nGroup zai : 1.BMP\r\n 2. Jr. TKP\r\nThuchah : Speaker \r\n\r\n\r\nDt 28th September 2025 (Pathianni)\r\n\r\nZing Inkhawm @ 9:45 A.m.\r\nHruaitu : Tv Robin Lalramnuama (Unit\r\nPresident)\r\nThupuan : Kohhran Secretary\r\nGroup Zai : Nl. Vanlalfakpuii Chhakchhuak leh a\r\nthiante\r\nZaipawl : 1. Lunglawn Pastor Bial Zaipawl\r\n 2. KNP Zaipawl\r\nThuchah : Speaker \r\n\r\n\r\nDt 28th September 2025 (Pathianni)\r\n\r\nZan Inkhawm @ 6:45 p.m.\r\nHruaitu : Tv. V. Lalruatpuia (Unit Secretary)\r\nSolo : Lalruatsangi Chawngthu – BCM Lunglawn\r\nGroup zai : Harmony of Praise\r\nZaipawl : Kohhran Zaipawl\r\nThilpek hlan : Nl. J. Lalrintluangi (Unit Tresurer)\r\nThuchah : Speaker', '2025-09-21'),
(11, 'Jr.TKP FELLOWSHIP PROGRAMME', 'A Hun : Ni 21st September 2025\r\nA hmun : Gospel Centenary Hall\r\nTan hun : Dar 1:30 PM\r\n\r\nHruaitu : Tv. Lalremliana Chhakchhuak\r\n\r\nTantu : PC Lalduhawma\r\n\r\nBible Chhiar Turte: \r\n1.Angel Lalhruaitluangi\r\n2.A.Lallawmawma\r\n\r\nThupuan : Jr.TKP Secretary\r\n\r\n(Jr TKP thuvawn Sam 119:9 leh TKP thutiam sawi\r\nrual tur a ni ang)\r\n\r\nBible chhiar rual Hruaitu : Lalramchhani\r\n\r\nTawngtai rual hruaitu : F.Lalnunpuii\r\n\r\nAwareness : Upa Tlantununga\r\n (BCM Moria, Rahsiveng)\r\n\r\n\r\nNote: Fellowship-na ah hian “Eiruk thatlohzia\r\nInzirtirna” hun hman tur a ni dawn a,Member te\r\nngai pawimawh a kal vek turin kan in sawm e.\r\n\r\n\r\n *REFRESHMENT A AWM ANG*\r\n', '2025-09-21'),
(12, 'TKP TAWNGTAI PROGRAMME', '22.09.2025 THAWHTAN ZAN PROGRAMME\r\n\r\nTawngtai Vawikhatna (First Session)\r\nTAN HUN : 7:00pm - 8:30pm\r\n\r\nHRUAITU : Tv. Robin Lalramnuama(Unit\r\nPresident)\r\n\r\nTEA BREAK ~ 8:30pm - 9:00pm TEA BREAK\r\n\r\nTawngtai Vawihnihna (Second Session)\r\nTAN HUN : 9:00pm - 10:00pm\r\n\r\nHRUAITU : Pu F. Lalthlengmawia(Chairman\r\nEvangelical cell)\r\n\r\n\r\n\r\n23.09.2025(THAWHLEH ZAN PROGRAMME)\r\n\r\nTawngtai Vawikhatna (First Session)\r\nTAN HUN : 7:00pm - 8:30pm\r\n\r\nHRUAITU : Tv. V. Lalruatpuia (Unit Secretary)\r\nTEA BREAK ~ 8:30pm - 9:00pm TEA BREAK\r\n\r\nTawngtai Vawihnihna (Second Session)\r\nTAN HUN : 9:00pm - 10:00pm\r\n\r\nHRUAITU : Pu Lalsangliana Khiangte (Unit Vice\r\nPresident)', '2025-09-21'),
(13, 'OCTOBER 2025 CHHUNG ATANA BIAKIN CHANVO INRUATNA', 'Worship Team:\r\n      Pu F.Ramropuia (Leader) \r\n      Pu. Laldingmawia\r\n      Nl. Laldinsangi Ralte\r\n      Nl. V.Lalthazuali\r\n\r\nMusicians:\r\n      Keyboardist : Upa C. Saihmingliana\r\n      Bassist : Tv. Henry Lallianzuala\r\n      Drummer : Tv.MC Lalthuamfamkima \r\n      Guitarist : Tv. Lalthlamuanpuia\r\n\r\nKhuangbengtute : \r\n   1) Upa Lalduhawma Chhakchhuak  \r\n   2) Pu. MC.Lalchhanhima\r\n\r\nMike Operator : \r\n   1) Pu F.Rohmingpuia \r\n   2) Tv. Lalrammawia\r\n\r\nVisual duty : \r\n              1) Pu MC.Lalrindika (Leader) \r\n              2) Tv. Vl.Hruaipuia\r\n              3) Tv B.Lalremmawia\r\n\r\n\r\nLight Incharge : \r\n              1) Pu Visona Khiangte \r\n              2) Pu F Zonunsanga\r\n\r\n\r\nMedical duty : \r\n             1) Pi. Lalthangengi(Leader) \r\n             2) Nl. LH Lalhruaizeli\r\n             3) Nl. ZD.Zothanpuii\r\n\r\nUshers\r\nPu.Lalsangliana Khiangte (Leader)          \r\nTv. Lalrotluanga Sailo                     \r\nTv.Jonathan Laltlankima                    \r\nTv. K.Lalrinkima                          \r\nTv. Isaak Malsawmtluanga                   \r\nTv. R.Lalchhanchhuaha                      \r\nTv. Samuel Lalrindika                      \r\nTv F.Lalmawizuala                          \r\nTv. T.Laldinthara                          \r\nTv. TC.Zahmingthanga                       \r\n\r\nNl. Chawngthanzuali Chawngthu (Leader)\r\nNl. PC. Zaithanmawii\r\nNl. B.Malsawmzuali\r\nNl. A.Malsawmsangi\r\nNl. K.Lalramhmachhuani\r\nNl. C. Lalnunkimi\r\nNl. Juliet Lalrinchhani\r\nNl. K.Remsangzuali\r\nNl.R.Rosangpuii\r\nNl. Esther Lalsangpuii\r\n\r\nOverall incharge : Tv Lalduhawma & Nl Lalrinengi\r\n\r\n\r\nChanvo changtu ten kan chanvo kan tihhlawhtlin theihloh tum a awm a nihchuan kan aiawh tur midang ruat mai a tha hle a, Worship Committee Secretary hrilh hriat mai pawh a theih ang. Ushering bikah chuan Overall Incharge te kan hriattir thin dawn nia.', '2025-09-28'),
(14, 'HUN CHANGTU TURTE', 'Pathianni Zing (9:45 AM)\r\n\r\nHruaitu : Tv Robin Lalramnuama\r\nThupuan : Secretary\r\nThuchah : Rev K.Lalnunsanga\r\n\r\n\r\nPathianni Zan (6:45PM)\r\nHruaitu : Tv V.Lalruatpuia\r\nThupuan : Secretary\r\nThuchah : Rev K.Lalnunsanga\r\n\r\n\r\nNilai Zan : Rbt R.Lalawmpuia\r\n\r\nInrinni Zan : Upa P.Vanchhunga\r\n\r\n(TKP Crusade hun a ni a,Programme kimchang phek hnungah dah a ni)', '2025-09-28'),
(15, 'TKP FELLOWSHIP PROGRAMME', 'A Hun : Ni 28 September 2025\r\nA hmun : Gospel Centenary Hall\r\n\r\nTan hun : Dar 1:30 PM\r\n\r\n(MIKA GROUP KAIHHRUAI)\r\n\r\nHruaitu : Nl.Malsawmsangi\r\nTantu : Nl C.Lalremruati\r\n\r\nBible Chhiar Turte: \r\n\r\n1.Joel Lalhruaitluanga\r\n2.V.Lalhriatpuii\r\n\r\nThupuan :TKP Secretary\r\n\r\nBible chhiar rual Hruaitu : C.Lalramzawna\r\n\r\nTawngtai rual hruaitu : Samuel Lalhruaitluanga\r\n\r\nThusawi :A duh a piang tan\r\n\r\nQuiz : Group lam atangin\r\n\r\n**REFRESHMENT TUI TAK MIKA GROUP TE HIAN MIN RAWN CHHAWPCHHUAH SAK DAWN A NI**', '2025-09-28'),
(16, 'INKHAWM PROGRAMME (PRAISE & WORSHIP PROGRAMME)', 'A hun : Ni 29th September 2025\r\n\r\nAhmun :BCM Biak In Salem\r\n\r\nTan hun :6:45 PM\r\n\r\nHruaitu : Pu Isaak Rosangliana\r\n\r\nThupuan : Secretary\r\n\r\nTawngtai rual hruaitu: NI. VL. Ruatmawii\r\n\r\nTawngtai thupui:\r\n\r\n1) Kan member hnathawhna leh Zirna avanga hmun danga awmte tan\r\n2) Kan member ruihhlo in a tih buai te tan\r\n3) Kan kohhran Upa leh Rawngbawltute tan\r\n4) Missionary te tan.\r\n5) TKP ten kan plan te kan tihhlawhtlin zel theih nan\r\n6) TKP hnuai a Group hrang hrang hruaitute Tan\r\n\r\nSolo: NI MC. Lairuatsaki\r\n\r\nThawhlawm khawn turte:\r\n\r\n1) NI. B.Lalhruaitluangi\r\n2) Nl. Saidingpuii Hlawnchhing\r\n3) NI. S. Lalruatfeli\r\n\r\nGroup Zai(Male Voice) :Tv K. Lalhmingsanga leh a thiante\r\n\r\nBible Chhiar rual : Tv. Lalruatfela\r\n\r\nThuchah :Tv Lalremliana Chhakchhuak\r\n\r\nNote:\r\n1) Relief Bawm hun a ni ang.\r\n2.Thawhlawm hi Youth Centre pual a pek tur a ni ang.', '2025-09-28'),
(17, 'BKHP PROGRAMME', 'Vawiin chawhnu dar 1:30-ah BKHP te Hall No.1-ah Fellowship neih tur ani ang.\r\nTawngtai hona te a awm anga a duh apiang tan Sharing sawina hun hawn ani dawn a memberte kal theuh\r\nturin kan in sawm ani e.\r\n\r\nHruaitu : Pi Ramthanzuali', '2025-09-28'),
(18, 'ZAIKHAWM PROGRAMME', 'Crusade neih chhung hian Inkhawm banah zaikhawm a awm zel dawn a.\r\nHruaitu hetiang hian inruat a ni.\r\n\r\n1.Ni 26 Septermber 2025(zirtawpni) zan : Pu Lalsangliana Khiangte\r\n\r\n2. 27 September 2025 (Inrinni) zan : Nl J. Lalrintluangi\r\n\r\n3. Ni 28 September 2025 (Pathianni) zan : Tv Lalduhawma', '2025-09-28'),
(19, 'Jr.TKP RUIHHLO AWARENESS', 'Jr.TKP te Ni 2 October 2025 hian Ruihhlo thatlohna inzirtirna neih pah in intihhlimna neih tur a ni dawn a. Member te kal vek kan\r\ntum dawn nia. Hetiang hi Programme tlangpui chu a ni ang:\r\n\r\nA hun : 2nd October 2025\r\nA hmun : LDF Futsal Ground\r\nTan hun : Dar 10:00 A.M\r\n\r\n1.Zing dar 9:30 ah Biakin Parking atangin chhuah tur a ni ang.\r\n2.Bus a kal tur a ni ang.\r\n3.Jr.TKP Form hak tur a ni ang.\r\n4.Item tur te\r\n\r\nMipa :Futsal leh a dangte\r\n\r\nHmeichhia: Item chi hrang hrang, kan tel vek theihna tur tamtak a awm dawn.\r\n\r\nHunserh & Ruihho thatlohzia sawi tur:\r\nTv Lalremliana Chhakchhuak.\r\n\r\n\r\n**Refreshment a awm ang**', '2025-09-28'),
(20, 'HUN CHANGTU TURTE', 'Pathianni Zing (9:45 AM)\r\n\r\nHruaitu : Upa. PC.Lianbuanga\r\nThupuan : Secretary\r\nZaipawl : Standing Choir\r\nThuchah : Rbt. Lalmuanzuala\r\nPathianni Zan (6:15PM)\r\nHruaitu : Upa. B.Sangsiama\r\nSolo : Pu ZD. Lalruatsanga\r\nThuchah : Upa. K.Lalduhawma\r\n\r\nNilai Zan : Camping\r\n\r\nInrinni Zan : Camping Follow-up', '2025-11-16'),
(21, 'ZING TAWNGTAI INKHAWM HRUAITU TURTE', 'Tan hun : Dar 5:15 AM\r\n\r\nDt 17.11.2025 - Pi. V. Lalnunmawii\r\nDt 18.11.2025 - Tleirawl Pual Camping\r\nDt 19.11.2025 - Tleirawl Pual Camping\r\nDt 20.11.2025 - Tleirawl Pual Camping\r\nDt 21.11.2025 - Pi. Nawlzingi\r\nDt 22.11.2025 - Pu. HC. Muanzuala\r\nDt 23.11.2025 - Rbt. PC. Lalnunmawia', '2025-11-16'),
(22, 'Jr.TKP THU-HLA', 'Jr.TKP te chuan “Ruihhlo thatlohzia” chungchang ah Slogan inziahsiakna neiin lawmman sem a ni\r\na.Lawmman Pakhatna hi Christina Lallawmawmi’n a la a ni.\r\n\r\nLawmman Pakhatna Dawngtu Thuziak:\r\nBMP/BKHP i over thleng a dam turin kan duh che.Ruihhlo lakah lo fihlim rawh.\r\n\r\nLawmman Pahnihna Dawngtu Thuziak:\r\nRuihho chu reilote nawmna damchhung tan in a ni.\r\n\r\nLawmman Pathumna Dawngtu Thuziak:\r\nRuihhlo hi hmahun,nun,hriselna tichhetu a ni.Ti chhin ngai suh ang che.', '2025-11-16'),
(23, 'HLA ZIR', 'Ni 19th November 2025 (Nilaini) zanah Lunglawn Pastor Bial TKP hla rem tur zir leh tur a ni dawn a,\r\nTKP Member zawng zawng hla zir turin kan insawm e.\r\n\r\nTan hun : Inkhawm Ban\r\nA hmun : BCM Lunglawn', '2025-11-16'),
(24, 'SUNDAY SIKUL THUPUAN', '1. Chhungkua a hming ziakte secretary te hnenah in report tur a ni a\r\n2. Senior A leh B question hi Dt. 23.11.2025 sunday sikul ah sem chhuah a ni ang.', '2025-11-16'),
(25, 'TKP EDUCATION COMMITTEE THUPUAN', 'Salem TKP Education Committee in zirlai hlawhtlingte chawimawina kan pekchhuah tak\r\nzingah tih dik loh palh, siam that ngai te kan awm anih chuan November thla chhungin\r\na hnuaia Phone number tarlan ah hian kan in report dawn nia.\r\n\r\nTin, pek hmaih palh emaw, in report theihnghilh kan lo awm anih chuan hun tiam chhungin a rang lamin\r\nkan in report bawk dawn nia.\r\n\r\nIn report na tur-\r\nTv P.c Lalchhuanmawia (9862747072)\r\nTv Lalduhawma (97745 53842)', '2025-11-16'),
(26, 'HUN CHANGTU TURTE', 'Pathianni Zing (9:45 AM)\r\n\r\nHruaitu : Upa C.Chalhlira\r\nThupuan : Secretary\r\nZaipawl : KNP\r\nThuchah : Upa K.Lalrohlua\r\n\r\nPathianni Zan (6:15PM)\r\nHruaitu : Upa B.Sangsiama\r\nGroup Zai : Tv K. Lalnunmawia leh a\r\nthiante\r\nThuchah : Upa Ngentluanga\r\n\r\nNilai Zan : Upa K.Lalduhawma\r\n\r\nInrinni Zan : Pre-Camping Crusade', '2025-11-09'),
(27, 'ZING TAWNGTAI INKHAWM HRUAITU TURTE', 'Tan hun : Dar 5:15 AM\r\n\r\nDt 10.11.2025 - Pu R.Lalchhanhima\r\nDt 11.11.2025 - Pi K.Vanlalruati\r\nDt 12.11.2025 - Pi Vanlalpari\r\nDt 13.11.2025 - Pu C.Lalrimawia\r\nDt 14.11.2025 - Pi H.Lalawmpuii\r\nDt 15.11.2025 - Pi R.Lalbiakchhungi\r\nDt 16.11.2025 - Upa C.Saihmingliana', '2025-11-09'),
(28, 'BKHP TE HRIATTUR', 'I. Dt 10 November 2025 (Thawhtan Zan)\r\n\r\nHruaitu : Pi Lallianpuii Zawngte\r\n\r\nBKHP Dinchhan, Thiltum\r\nleh Thutiam sawirualna :Hruaitu\r\n\r\nBible chhiar : 1) Pi B. Lalduhawmi\r\n2) Pi Mimi Vanlalnghaki\r\n3) Pi Kapthuami\r\n\r\nThawhlawm khawntu:\r\n1) Pi C. Lalhruaitluangi\r\n2) Pi Pinky Zorempuii\r\n\r\nTawngtai Rual\r\nMal zai : Pi M. Varparhi\r\n\r\nThusawitu(10 mins) \r\n\r\n1) Pi PC. Lalengmawii\r\n2) Pi Lalthanngengi\r\n\r\nKhuangbengtute : \r\n\r\n1) Pi Lalthasiami\r\n2) Pi Lalrintluangi Pautu\r\n\r\nHla hriltu : Pi Lalrohlui\r\n\r\nMike Operator : \r\n\r\n1) Pi V. Lalnunmawii\r\n2) Pi J. Lalremruati\r\n\r\n\r\nII. Vawiin chawhnu dar 1:30-ah BKHP Tlangnuam Unit tlawh\r\ntur a ni a,member a tam thei ang ber kal kan tum dawn nia.\r\nMahni remchan dana kal mai tur ani ang.\r\nHetiang hi programme tur a ni ang:\r\n\r\nHruaitu: Pi RK Rotluangi, Salem Unit\r\n\r\nThilpek hlantu: Pi PC Lalengmawii, Salem Unit\r\nSecretary report: \r\n1) BKHP Salem Unit\r\n2) BKHP Tlangnuam Unit\r\n\r\nGroup zai : \r\n1) BKHP Salem Unit\r\n2)BKHP Tlangnuam Unit\r\n\r\nThuchah tawi: \r\n1) President, BKHP Tlangnuam Unit\r\n2) President BKHP Salem Unit\r\n\r\nChangvawn sawi: Pi Hmingthanzami, Salem Unit\r\n\r\nIII. Dt 14.11.2025 Zirtawp zanah tu leh fate puala\r\ntawngtai neih tur a ni a.Hemi chhunzawm hian Bial\r\nrorel bawhzuina bial huapa hun thuhmuna mahni Unit\r\ntheuha tawngtai hun hman tur', '2025-11-09'),
(29, 'TKP JOINT FELLOWSHIP PROGRAMME', 'A hun : Ni 9 November 2025 (Pathianni) Chawhnu\r\nDar 1 : 45 pm\r\n\r\nA hmun : BCM Sazaikawn Biak In\r\n\r\nComperes : \r\nTv R Lalrosiama TKP Sazaikawn leh \r\nNlB. Lalhruaitluangi TKP Salem Unit\r\n\r\nHunserh : Tv B Lalengzuala (TKP Sazaikawn Unit)\r\n\r\nSecretary Report :\r\nTKP Sazaikawn Unit leh TKP Salem Unit\r\n\r\nGroup Zai : \r\n1) Male Voice (TKP Sazaikawn Unit)\r\n2) Nl Miriam Lalrinawmi leh a thiante (TKP Salem\r\nunit)\r\n\r\nSolo : \r\n1) Tv B. Romalsawma (TKP Sazaikawn Unit)\r\n2) Nl F. Lalhmangaihkimi (TKP Salem Unit)\r\n\r\nSpecial Item (10 mins) : \r\n1) Tv T. Lalremkima, \r\nNl Elizabeth Malsawmzuali, \r\nNl LH. Lalrinzuali\r\n(Sazaikawn Unit)\r\n\r\n2) Pu Isaak Rosangliana leh Tv Lalremliana\r\nChhakchuak (Salem Unit)\r\n\r\nHlathlang :\r\n1) Tv FC Laldinpuia (Sazaikawn Unit)\r\n2) Nl Lalawmpuii Fanai (Finance Secretary, TKP\r\nSazaikawn Unit)\r\n3) Nl MC Lalhlimpuii (Finance secretary, TKP Salem\r\nUnit)\r\n\r\nThawhlawm khawn : Ushers (TKP Sazaikawn Unit)\r\n\r\nThawhlawm hlan : \r\nTawngtairual (Hruaitu, Sazaikawn Unit)\r\n\r\nThuchah tawi : Tv Robin Lalrammuana \r\n(President, TKP Salem Unit)\r\n\r\nTawpna tawngtai : Upa LH.Lalngaihzuala, \r\nSenior Adviser (TKP Sazaikawn Unit)\r\n\r\nRefreshment a awm dawn bawk a ni\r\nNote :\r\n\r\n1. Thawhlawm a awm dawn a, member te thahnem ngai\r\ntaka thawhlawm thawh turin kan inngen e.\r\n\r\n2. A kal nan Bus hman a ni dawn a, chawhnu dar 1:00 p.m.\r\nchhuak hman turin Kawihnaiah innghakhawm tur a ni.\r\n\r\nMimal lirthei nei ten tlawmngai a thawhchhuahpui turin\r\nkan inngen bawk e.', '2025-11-09'),
(30, 'PANGPAR KHAWITUTE', 'Dt 9th November 2025\r\n\r\n1. Pi PC Lalhertluangi\r\n2. Nl Lalremruati Sailo', '2025-11-09'),
(31, 'HUN CHANGTU TURTE', 'Pathianni Zing (9:45 AM)\r\nBaptisma chan programme\r\n\r\nChantirtu : Rev. Sangliankhuma Chinzah\r\n(Bialtu Pastor)\r\nThupuan : Secretary\r\nBaptisma chang tur hi mi 17 an awm a,\r\nkohhran ten i tawngtaipui ang u.\r\n\r\n Pathianni Zan (6:30PM)\r\nSacrement Inkhawm\r\n\r\nBuatsaihtu : Rev. Sangliankhuma Chinzah\r\n(Bialtu Pastor)\r\n\r\nZaipawl : Standing Choir\r\n\r\nNilai Zan : Upa Lalduhawma Chhakchhuak\r\n\r\nInrinni Zan : Upa Lallungkhama', '2025-11-02'),
(32, 'ZING TAWNGTAI INKHAWM HRUAITU TURTE', 'Tan hun : Dar 5:15 AM\r\n\r\nDt 03.11.2025 - Pi PC. Roluahpuii\r\n\r\nDt 04.11.2025 - Pi C. Lalhmangaihzuali\r\n\r\nDt 05.11.2025 - Pi Zokungi\r\n\r\nDt 06.11.2025 - Pi C. Laldinpuii\r\n\r\nDt 07.11.2025 - Pi C. Biakchungnungi\r\n\r\nDt 08.11.2025 - Pi Lalruatpuii\r\n\r\nDt 09.11.2025 - Upa C. Challianbuanga', '2025-11-02'),
(33, 'TKP ZAN INKHAWM PROGRAMME', 'A hun : Ni 3 November 2025(Zan Dar 6:30)\r\nA hmun : BCM Salem Biakin\r\n\r\nHruaitu : Dr. R. Lalhriatpuia\r\n\r\nTantu : Tv Zodinsanga\r\n\r\nThupuan : Secretary\r\n\r\nTawngtairual Hruaitu :\r\n Nl B. Malsawmzuali\r\n\r\nThawhlawm khawn tur te :\r\n 1. Nl Lalnunpuii\r\n 2. Nl Deborah H. Liandingpuii\r\n 3. Nl F. Lalremruatpuii\r\n\r\nMal Zai : Nl. Vanlalfakpuii Chhakchhuak\r\n\r\nGroup Zai : Group OB Zawng zawng leh Jr. TKP OB te.\r\n\r\nBible Chhiar tur te:\r\n 1. Nl K. Lalramhmachhuani\r\n 2. Tv Liandingpuia Lianhna\r\n\r\nBible Chhiar Rual Hruaitu :\r\n Tv F. VL Remruatpuia\r\n\r\nThuzir : Upa K. Lalrohlua (Senior Adviser)\r\n (Rilru Hrisel Inzirtirna)\r\n\r\n\r\n (Relief Bawm hun a ni ang', '2025-11-02'),
(34, 'BKHP TE HRIAT TUR', '1. Vawiin chawhnu dar 1:30-ah MBKHP atanga lehkha hmuh angin ‘Naupang venhim leh enkawl\r\nchungchang inzirtirna’ District Child Protection Officer (DCPO) atangin hun an rawn hmang dawn\r\na member a tam thei ang ber kal kan tum dawn nia.\r\n\r\n2. Dt.3.11.2026 Thawhtanni hi BWA hmeichhe tawngtai ni a ni a. Biak Inah hun hm an tur a ni a,\r\nmember te tawngtai theuh turin kan in sawm e.\r\n\r\nTan hun : Dar 10:30am\r\n\r\nHruaitu : Pi Ramthanzuali\r\n\r\nThu ziak chhiar turte :\r\n1)Pi ZD. Lalthanzami\r\n2)Pi K.Lalawmpuii\r\n3)Pi PC. Lalnunmawii\r\n\r\nThawhlawm khawn tur te :\r\n1)Pi Lalhlimpuii\r\n2)Pi Lalremmawii\r\n\r\nRefreshment a awm ang\r\n\r\n3. MBKHP thuzir exam question chhangtu ten\r\nDt. 9.11.2025 hmain mahni bialtute hnenah thehluh vek tur a ni ang.\r\n\r\n4. Ni 7 November 2025 (Zirtawp Zan) hian tu leh fate puala tawngtai inkhawm', '2025-11-02'),
(35, 'KNP FELLOWSHIP PROGRAMME', 'A hun : Dt 19 October ,2025 Dar 1:30 PM\r\n\r\nA hmun : BCM Biak In, Salem\r\n\r\nHruaitu : Pi C. Lallawmsangi\r\n\r\nTantu : Joey Sanglehzuala\r\n\r\nThawhlawm khawn turte :\r\n 1) Rothangpuii Fanai\r\n 2) Lalrinchhani\r\n\r\nBible chhiar turte :\r\n 1) Malsawmtluangi\r\n 2) Jacob S. Lalmalsawma\r\n\r\nLive Band : \r\nBrandon J. Hmingthanpuia leh a thiante\r\n\r\nRecitation : Mimi Lalnunfeli\r\n\r\nHlazir : Conductor', '2025-11-02'),
(36, 'TKP OUTDOOR FELLOWSHIP PROGRAMME', 'A hun : Ni 2nd November 2025\r\nA hmun : Upa ZH. Ropuia In\r\n\r\nTan hun : Dar 1:45 PM\r\n\r\nHost : Nl B. Lalhruaitluangi\r\n\r\nTantu : Tv Robin Lalramnuama (Unit President)\r\n\r\nRoll Call : Unit Secretary\r\n\r\nBible Study : Nl K. Lalramthianghlimi\r\n\r\nGames : \r\nTv Henry Lallianzuala & Tv Lalfakzuala\r\n\r\nBYOC : Nl Malsawmsangi\r\n\r\nZaihruai turte : Tv Lalremliana Chhakchhuak & Nl Lalawmpuii\r\n\r\nGuitarist : Tv Lalremliana Chhakchhuak\r\n\r\nKeyboardist : Pu Jeffrey Lalremruata\r\n\r\nBass guitarist : Tv Aldrin Lalramdinpuia\r\n\r\nClap Box : Tv MC. Lalthuamfamkima\r\n\r\n Zai ho na a tam thei ang ber neih a ni ang.', '2025-11-02'),
(37, 'WORK CAMP', 'Tahrik ni 24 - 29, November 2025 chhung hian Tipperaghat ah Hall sa a Work camp neih tur\r\na ni a. A ban leh Beam Rcc tur a nih dawn avangin mistiri hetiang lam thiam leh thiam\r\nlo pawh Work camp tlawmngai a kal thei tur kan awm a nih chuan Tualchhung Mission\r\nhruaitu te hnen Dt. 16.11.2025 hmain inhriattir tur a ni e.', '2025-11-02'),
(38, 'HUN CHANGTU TURTE', 'Pathianni Zing (9:45 AM)\r\n\r\nHruaitu : Upa F. Lalhlira\r\n\r\nThupuan : Secretary\r\n\r\nMal Zai : Angela Nunhlupuii (KNP)\r\n\r\nThuchah : Upa P.C. Lallianzara\r\n\r\n\r\n\r\nPathianni Zan (6:30PM)\r\n\r\nHruaitu : Upa K. Lalrohlua\r\n\r\nLive Band : Tv K. Lalhmingsanga leh a thiante\r\n\r\nThuchah : Upa P.C. Lianbuanga\r\n\r\n\r\n\r\nNilai Zan : Upa C. Saihmingliana\r\n\r\nInrinni Zan : Upa F. Lallianzara', '2025-10-26'),
(39, 'ZING TAWNGTAI INKHAWM HRUAITU TURTE', 'Tan hun : Dar 5:15 AM\r\n\r\nDt 27.10.2025 - Pu C. Lalsangzuala\r\n\r\nDt 28.10.2025 - Pi H. Darbuki\r\n\r\nDt 29.10.2025 - Pi K. Zopari\r\n\r\nDt 30.10.2025 - Pi. R.K. Rotluangi\r\n\r\nDt 31.10.2025 - Pi. Lalthankhumi Chhakchhuak\r\n\r\nDt 01.11.2025 - Pi K. Zodinpuii\r\n\r\nDt 02.11.2025 - Upa. J.C. Zosanga', '2025-10-26'),
(40, 'BMP FELLOWSHIP PROGRAMME', 'A hun : Dt 26 October 2025\r\n\r\nA hmun : BCM Biak In Salem, Hall no-1\r\n\r\nHruaitu : Pu. Joseph Lalchhandama\r\n\r\nBible Chhiar : Pu. Vanlalhnuna Ralte\r\n\r\nHla thlang tute : \r\n\r\n1) Pu PC. Johana\r\n2) Pu MC. Lalchhanhima\r\n\r\nThupuan : Secretary\r\n\r\nShort Sermon : Pu. F. Ramropuia\r\n\r\nTawngtai rual : Hruaitu\r\n\r\nKhuangbengtu : Pu. K. Zohlunthanga\r\n\r\nKeyboardist : Pu. Michael Lalpekhlua\r\n\r\nHla hriltu : Pu. R. Lalzawmliana\r\n\r\nThingpui lumtu te :\r\n\r\nPu HC. Lalmuanzuala & Pu PC. Lalzarzova', '2025-10-26'),
(41, 'KNP FELLOWSHIP PROGRAMME', 'A hun : Dt 19 October ,2025 Dar 1:30 PM\r\n\r\nA hmun : BCM Biak In, Salem\r\n\r\nHruaitu : Tv. Lalbiakngheta\r\n\r\nTantu : Lallianmawia Khiangte\r\n\r\nThawhlawm khawn turte :\r\n1) Joshua Lalrinzuala\r\n2) Malsawmtluanga Mualchin\r\n\r\nMal zai : Ephraim Vanlalneihpuia', '2025-10-26'),
(42, 'TKP FELLOWSHIP PROGRAMME', 'A hun : Ni 26 October 2025\r\n\r\nA hmun : Gospel Centenary Hall\r\n\r\nTan hun : Dar 1:30 PM\r\n\r\n(Jr TKP KAIHHRUAI)\r\n\r\nHruai tu : Tv.Henry Lallianzuala\r\n\r\nTantu : Lalremruata Khiangte\r\n\r\nBible Chhiar Turte :\r\n1) K.Zomuanpuia\r\n2) Cindy Lalhruaitluangi\r\n\r\nThupuan : Unit Secretary\r\n\r\nBible chhiar rual Hruaitu :\r\nJerome Rosangzuala\r\n\r\nTawngtai rual hruaitu :\r\nK.Lalhruaitluanga\r\n\r\nLive Band : Biakthansanga leh a thiante\r\n\r\nSpecial Item : Tv.Lalremliana Chhakchhuak\r\n\r\nMal Zai : Mary VL Hmangaihsangi\r\n\r\nWorship Dance :\r\nSabina Rinhluzuali leh a thiante\r\n\r\nPu Buanga leh Sap Upa chanchin zirna :\r\nNl. Lalrinengi', '2025-10-26'),
(43, 'NOVEMBER 2025 CHHUNG ATANA BIAKIN CHANVO INRUATNA', 'Worship Team:\r\nPu K. Zohlunthanga(Leader)\r\nTv.MC.Zoengpuia\r\nNl.Vanlalfakpuii Chhakchhuak \r\nNl.Zonunmawii Pachuau\r\n\r\nMusicians:\r\n\r\nKeyboardist : Pu.H.Lalrammawia \r\nBassist : Tv.Rodinpuia Tlangte\r\nDrummer : Rbt.Lalmuanzuala \r\nGuitarist : Tv.K.Lalhmingsanga\r\n\r\nKhuangbengtute : \r\n1) Upa.C.Lalhmingmuana \r\n2) Pu.C.Lalramdinpuia\r\n\r\nMike Operator : \r\n1) Pu.Lalrotluanga \r\n2) Tv.Peter Ramdinzauva\r\n\r\nVisual duty : \r\n1) Tv.B.Lalramtana(Leader) \r\n2) Tv.Samuel Lalhruaitluanga\r\n3) Pu.Israel Lalhriatkima\r\n\r\n\r\nLight Incharge : \r\n1) Upa.K.Lalrohlua \r\n2) Pu.Vanlalrawna Sailo\r\n\r\nMedical duty : \r\n1) Pi.Vanlalthuami Renthlei(Leader) \r\n2) Nl.Malsawmsangi\r\n3) Nl.Grace Zonunpuii\r\n\r\n\r\nUshers\r\nTv.Jonathan Vanlalropuia (Leader) \r\nTv.ZD.Lallianpuia \r\nTv.H.Lalfakzuala \r\nTv.Lalmuanpuia Khiangte \r\nTv.B.Lalrohluna \r\nTv.Lalrinawma \r\nTv.H.Lalpekhlua \r\nTv.Liandingpuia Lianhna\r\nTv.Zodinsanga \r\nTv.RVL Malsawmkima \r\n\r\nNl.K.Lalrinpuii(Leader)\r\nNl.F.Lalremruatpuii\r\nNl.K.Roluahpuii\r\nNl.Deborah H Liandingpuii\r\nNl.Malsawmsangi\r\nNl.K.Lalrinhlui\r\nNl.Rebeca Lalthanmawii\r\nNl.V.Lalhriatpuii\r\nNl.Miriam Lalrinawmi\r\nNl.Ethel C Lalengzuali\r\n\r\nOverall incharge : Tv Lalduhawma & Nl Lalrinengi\r\n\r\nChanvo changtu ten kan chanvo kan tihhlawhtlin theihloh tum a awm a nihchuan kan aiawh tur midang ruat mai a tha hle a, \r\nWorship Committee Secretary hrilh hriat mai pawh a theih ang.\r\nUshering bikah chuan Overall Incharge te kan hriattir thin dawn nia.', '2025-10-26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_cards`
--
ALTER TABLE `image_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pdfs`
--
ALTER TABLE `pdfs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `side_sections`
--
ALTER TABLE `side_sections`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `image_cards`
--
ALTER TABLE `image_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pdfs`
--
ALTER TABLE `pdfs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `side_sections`
--
ALTER TABLE `side_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
