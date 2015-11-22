CREATE DATABASE  IF NOT EXISTS `ats` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `ats`;
-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: ats
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jobpost_details`
--

DROP TABLE IF EXISTS `jobpost_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobpost_details` (
  `jobid` int(11) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `career_level` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `no_of_vacancies` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `job_location` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `position_type` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `job_description` text COLLATE latin1_spanish_ci,
  `desired_skills` varchar(500) COLLATE latin1_spanish_ci DEFAULT NULL,
  `required_exp` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `industry` varchar(500) COLLATE latin1_spanish_ci DEFAULT NULL,
  `function` varchar(500) COLLATE latin1_spanish_ci DEFAULT NULL,
  `education` text COLLATE latin1_spanish_ci,
  `sex` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `languages` varchar(500) COLLATE latin1_spanish_ci DEFAULT NULL,
  `receive_application` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `annual_salary` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `job_expiry_on` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `to_email` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `date_first_posted` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `job_posted_by` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `job_status` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`jobid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobpost_details`
--

LOCK TABLES `jobpost_details` WRITE;
/*!40000 ALTER TABLE `jobpost_details` DISABLE KEYS */;
INSERT INTO `jobpost_details` VALUES (6,'Java Programmer','Senior','2','Kochi','Full Time','<p><strong>Java Developer</strong></p>\n\n<p>Looking for good java programmers who having experience in spring , hibernate and apache solr. The candidate should be a team player.</p>\n\n<p>The interested candidates should sent their resume to the email id <a href=\"mailto:sajinvarughese@gmail.com\">sajinvarughese@gmail.com</a></p>\n','Java, Jsp, Spring, Hibernate','6-9','[\"Business Development\",\"Chef\",\"Management\"]','[\"Accounting\",\"Administration\",\"Consulting\"]','UG Qualifications : BTech\nPG Qualifications : Post-Graduation not required\nDoctorate : Doctorate not required','Any','[\"English\",\"Hindi\",\"Malayalam\"]','From anywhere','300000-350000','10/30/2015 - 11/30/2015','rickymathew@gmail.com','2015-10-30 23:39:58','sajinvarughese@gmail.com','Pending'),(13,'Dot Net Developer','Senior','1','Bangalore','Full Time','<p>Hands-on experience on developing enterprise grade Windows / Web applications using .NET framework.Sound knowledge in C# / VB.NET, Windows Forms, WPF, ASP.NET, MVC, HTML, JavaScript, CSS, AJAX, SQL, XML.Exposure in developing SOA based applications.</p>\n\n<p>Knowledge required VB.Net, ASP.NET,C#, SQL SERVER ,web development , good knowledge in database programming .Candidate should have 65% marks without arrears with good communications skills.Interested candidates can mail their resume to <a href=\"mailto:sajinvarughese@gmail.com\">hr@vyapin.com </a></p>\n\n<p><strong>Company Profile:</strong></p>\n\n<p><em>Vyapin Software Systems Pvt Ltd.</em></p>\n\n<p>Vyapin builds intelligent, cost-effective Systems Management solutions that bridge the gaps in Data, Information and Knowledge that exist across the enterprise. Our objective is to offer world-class products and solutions for the evolving Enterprise.</p>\n','JavaScript,  .Net,  SQL, LINQ, Ajax','2-6','[\"Consulting\",\"Customer Service\"]','[\"Administration\",\"Design/Creative\",\"Engineering\"]','UG Qualifications : BSc, BTech\nPG Qualifications : Post-Graduation not required\nDoctorate : Doctorate not required','Any','[\"English\",\"Hindi\"]','From anywhere','400000-500000','11/02/2015 - 11/30/2015','hr@vypin.com','2015-11-02 16:47:46','sajinvarughese@gmail.com','Pending'),(14,'Customer Care Executive','Entry Level','5','Trivandrum','Part Time','<h2>Customer Service Representative Job Duties:</h2>\n\n<ul>\n	<li>Attracts potential customers by answering product and service questions; suggesting information about other products and services.</li>\n	<li>Opens customer accounts by recording account information.</li>\n	<li>Maintains customer records by updating account information.</li>\n	<li>Resolves product or service problems by clarifying the customer&#39;s complaint; determining the cause of the problem; selecting and explaining the best solution to solve the problem; expediting correction or adjustment; following up to ensure resolution.</li>\n	<li>Maintains financial accounts by processing customer adjustments.</li>\n	<li>Recommends potential products or services to management by collecting customer information and analyzing customer needs.</li>\n	<li>Prepares product or service reports by collecting and analyzing customer information.</li>\n	<li>Contributes to team effort by accomplishing related results as needed.</li>\n</ul>\n','Data Entry, Communication','0-1','[\"Administration\",\"Business Development\"]','[\"Consulting\",\"Customer Service\",\"Human Resources\"]','UG Qualifications : Graduation not required\nPG Qualifications : Post-Graduation not required\nDoctorate : Doctorate not required','Any','[\"English\",\"Hindi\",\"Malayalam\",\"Tamil\"]','','150000-200000','11/02/2015 - 11/30/2015','','2015-11-02 17:04:06','sajinvarughese@gmail.com','Pending');
/*!40000 ALTER TABLE `jobpost_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `password` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `user_status` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `time` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES (1,'Hirrr Admin','admin@hirrr.com','0dc8661999fa48a6768e77d163cf135fd438de4b','1','03/11/2015 16:27:23'),(79,'sajinvarughese','sajinvarughese@gmail.com','a2cf434d9b46c7a988209da14d9f7ab3b1d993c7','1','25/10/2015 05:34:36');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogin`
--

DROP TABLE IF EXISTS `userlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlogin` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(30) NOT NULL,
  `emailid` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `register` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogin`
--

LOCK TABLES `userlogin` WRITE;
/*!40000 ALTER TABLE `userlogin` DISABLE KEYS */;
INSERT INTO `userlogin` VALUES (1,'Hirrr Admin','admin@hirrr.com','0dc8661999fa48a6768e77d163cf135fd438de4b','Admin'),(79,'sajinvarughese','sajinvarughese@gmail.com','a2cf434d9b46c7a988209da14d9f7ab3b1d993c7','Employer');
/*!40000 ALTER TABLE `userlogin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-03 22:41:59
