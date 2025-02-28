# ************************************************************
# Sequel Ace SQL dump
# Version 20075
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 8.0.19)
# Database: raksoct
# Generation Time: 2025-02-28 14:27:28 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cache_locks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_locks`;

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;

INSERT INTO `comments` (`id`, `task_id`, `user_id`, `body`, `created_at`, `updated_at`)
VALUES
	(1,45,1,'Moving this task to in-progress.','2025-02-28 21:50:49','2025-02-28 21:50:49'),
	(2,45,1,'Need to discuss the AC of the ticket.','2025-02-28 22:02:15','2025-02-28 22:02:15'),
	(3,44,1,'Just added a comment.','2025-02-28 22:05:34','2025-02-28 22:05:34');

/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table job_batches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_batches`;

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'0001_01_01_000000_create_users_table',1),
	(2,'0001_01_01_000001_create_cache_table',1),
	(3,'0001_01_01_000002_create_jobs_table',1),
	(7,'2025_02_28_064217_create_tasks_table',2),
	(8,'2025_02_28_173835_create_task_files_table',3),
	(15,'2025_02_28_184519_create_roles_table',4),
	(16,'2025_02_28_184531_create_permissions_table',4),
	(17,'2025_02_28_184627_create_role_user_table',4),
	(18,'2025_02_28_213041_create_comments_table',5);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_reset_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table role_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'2025-02-28 19:07:56','2025-02-28 19:07:56'),
	(3,1,3,NULL,NULL),
	(4,1,2,NULL,NULL),
	(5,2,2,NULL,NULL);

/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `label`, `created_at`, `updated_at`)
VALUES
	(1,'admin','Admin',NULL,NULL),
	(2,'manager','Manager',NULL,NULL),
	(3,'user','User',NULL,NULL);

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`)
VALUES
	('iC9b9fcytqB8nlwfLH553duemaETY42jDMVzL1pn',1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQTJBbjlGeFNQM2RSVXFXZXY3NXB1UUdhRmVZZTRveFprZmwwY1RRMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNToiaHR0cDovL3Jha3NvY3QudGVzdC90YXNrcyI7fX0=',1740752623);

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table task_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task_files`;

CREATE TABLE `task_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `task_files` WRITE;
/*!40000 ALTER TABLE `task_files` DISABLE KEYS */;

INSERT INTO `task_files` (`id`, `task_id`, `path`, `created_at`, `updated_at`)
VALUES
	(1,25,'Wol5vBrTgw.pdf','2025-02-28 18:04:15','2025-02-28 18:04:15'),
	(2,25,'SKMTEow7cE.pdf','2025-02-28 18:04:15','2025-02-28 18:04:15'),
	(3,26,'d3y7nFKj4d.pdf','2025-02-28 18:07:32','2025-02-28 18:07:32'),
	(4,26,'tY5WVd6Owo.pdf','2025-02-28 18:07:32','2025-02-28 18:07:32'),
	(5,27,'zlgv4510v1_1740737306.jpg','2025-02-28 18:08:26','2025-02-28 18:08:26'),
	(6,27,'KEz1f4oo6U_1740737306.png','2025-02-28 18:08:26','2025-02-28 18:08:26'),
	(7,27,'5HSdlF72Mg_1740737306.jpg','2025-02-28 18:08:26','2025-02-28 18:08:26'),
	(8,27,'wMQh0gJyG3_1740737306.png','2025-02-28 18:08:26','2025-02-28 18:08:26');

/*!40000 ALTER TABLE `task_files` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tasks`;

CREATE TABLE `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by` bigint unsigned NOT NULL,
  `assigned_to` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('todo','in-progress','done') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'todo',
  `priority_level` enum('high','medium','low') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'high',
  `due_date` date DEFAULT NULL,
  `archived_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;

INSERT INTO `tasks` (`id`, `created_by`, `assigned_to`, `title`, `description`, `status`, `priority_level`, `due_date`, `archived_at`, `created_at`, `updated_at`)
VALUES
	(1,1,10,'neque quaerat consequatur','Dormouse.','in-progress','high','2025-05-03',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(2,1,11,'rerum repellendus enim','As there.','done','low','2025-09-29',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(3,1,12,'et facere minima','Cat in a.','in-progress','medium','2025-08-22',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(4,13,1,'et corporis adipisci','March, I.','todo','low','2025-07-20',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(5,14,1,'exercitationem exercitationem quas','Dinah: I.','done','medium','2025-10-26',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(6,15,1,'suscipit quo ut','Alice to.','in-progress','medium','2025-08-10',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(7,16,1,'necessitatibus earum voluptas','I\'d only.','done','low','2026-01-04',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(8,17,1,'vel qui suscipit','I should.','in-progress','medium','2025-09-27',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(9,1,1,'minus nulla nihil','Queen of.','in-progress','high','2025-07-06',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(10,1,1,'quis voluptas tempora','When the.','in-progress','low','2025-11-26',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(11,1,1,'corporis voluptatum ut','I almost.','todo','medium','2025-07-30',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(12,1,1,'enim iste enim','Dinah my.','done','high','2025-10-21',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(13,1,1,'voluptatem autem magni','Duck and.','todo','low','2025-08-24',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(14,1,1,'dolorem debitis beatae','I hadn\'t.','in-progress','high','2025-11-01',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(15,1,1,'unde aliquam natus','Lory and.','todo','high','2025-12-20',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(16,1,1,'ut sunt laborum','Queen in.','todo','high','2025-11-10',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(17,1,1,'ab architecto consequuntur','ME\' were.','done','medium','2026-02-21',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(18,1,1,'saepe cupiditate suscipit','For this.','done','medium','2025-04-16',NULL,'2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(21,1,1,'Task 3','task 3','todo','medium','2001-01-01',NULL,'2025-02-28 17:07:01','2025-02-28 17:07:01'),
	(23,1,1,'Task 55','Task 55','todo','high','2025-03-17',NULL,'2025-02-28 17:15:54','2025-02-28 17:19:36'),
	(24,1,1,'with files','with files','todo','high',NULL,NULL,'2025-02-28 18:03:22','2025-02-28 18:03:22'),
	(25,1,1,'with files','with files','todo','high',NULL,NULL,'2025-02-28 18:04:15','2025-02-28 18:04:15'),
	(26,1,1,'with files 2','with files 2','todo','high',NULL,'2025-02-28 18:27:37','2025-02-28 18:07:32','2025-02-28 18:27:37'),
	(27,1,1,'with files 3','with files 3','todo','high',NULL,'2025-02-28 18:27:33','2025-02-28 18:08:26','2025-02-28 18:27:33'),
	(28,1,18,'sed molestias nam','I was a dead silence. \'It\'s a Cheshire cat,\' said the Gryphon: and Alice called out in a low, trembling voice. \'There\'s more evidence to come before that!\' \'Call the first to break the silence. \'What day of the table. \'Have some wine,\' the March Hare was said to herself; \'the March Hare said to herself; \'I should have liked teaching it tricks very much, if--if I\'d only been the whiting,\' said the Gryphon, \'she wants for to know your history, you know,\' the Hatter said, tossing his head off.','done','low','2025-06-29',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(29,1,19,'iure perspiciatis qui','Alice very humbly: \'you had got burnt, and eaten up by a row of lamps hanging from the Gryphon, and the baby with some severity; \'it\'s very interesting. I never was so much frightened that she had hoped) a fan and a great thistle, to keep back the wandering hair that curled all over with diamonds, and walked off; the Dormouse say?\' one of the court and got behind him, and very angrily. \'A knot!\' said Alice, and her eyes immediately met those of a well--\' \'What did they draw?\' said Alice.','in-progress','high','2025-09-26',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(30,1,20,'sit quaerat quis','So they went up to her usual height. It was the Duchess\'s voice died away, even in the sea, though you mayn\'t believe it--\' \'I never saw one, or heard of \"Uglification,\"\' Alice ventured to ask. \'Suppose we change the subject,\' the March Hare said to herself \'That\'s quite enough--I hope I shan\'t grow any more--As it is, I suppose?\' \'Yes,\' said Alice, seriously, \'I\'ll have nothing more to be an advantage,\' said Alice, looking down at her as she came suddenly upon an open place, with a lobster as.','todo','high','2025-11-17',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(31,21,1,'illum deserunt quas','I didn\'t know that you\'re mad?\' \'To begin with,\' the Mock Turtle yet?\' \'No,\' said the Hatter, \'when the Queen had never been in a voice of thunder, and people began running when they liked, and left foot, so as to prevent its undoing itself,) she carried it out to be afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe you do either!\' And the Gryphon added \'Come, let\'s hear some of the jurymen. \'No, they\'re not,\' said the Hatter. \'It isn\'t directed at all,\' said the cook.','done','high','2026-01-06',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(32,22,1,'harum vitae dignissimos','Alice, a little way forwards each time and a scroll of parchment in the long hall, and wander about among those beds of bright flowers and the jury wrote it down into a tidy little room with a lobster as a last resource, she put them into a cucumber-frame, or something of the house, and found quite a crowd of little animals and birds waiting outside. The poor little thing was waving its right paw round, \'lives a March Hare. \'He denies it,\' said Alice. \'Nothing WHATEVER?\' persisted the King. \'I.','todo','low','2025-06-09',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(33,23,1,'ad corrupti deserunt','Then followed the Knave of Hearts, he stole those tarts, And took them quite away!\' \'Consider your verdict,\' the King hastily said, and went stamping about, and make out what it meant till now.\' \'If that\'s all you know I\'m mad?\' said Alice. \'Exactly so,\' said Alice. \'I wonder what Latitude or Longitude either, but thought they were getting so thin--and the twinkling of the moment they saw Alice coming. \'There\'s PLENTY of room!\' said Alice in a languid, sleepy voice. \'Who are YOU?\' said the.','done','medium','2026-02-02',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(34,24,1,'non et ullam','I hadn\'t mentioned Dinah!\' she said to herself, for this curious child was very likely true.) Down, down, down. Would the fall was over. However, when they had settled down again very sadly and quietly, and looked at the thought that SOMEBODY ought to be said. At last the Dodo solemnly, rising to its children, \'Come away, my dears! It\'s high time you were down here with me! There are no mice in the lap of her head made her feel very sleepy and stupid), whether the blows hurt it or not. \'Oh.','in-progress','medium','2025-04-15',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(35,25,1,'consequuntur nihil vero','King, \'unless it was only a mouse that had made the whole head appeared, and then raised himself upon tiptoe, put his mouth close to her, one on each side to guard him; and near the door, and the Panther received knife and fork with a trumpet in one hand and a Canary called out to sea!\" But the snail replied \"Too far, too far!\" and gave a little way forwards each time and a Canary called out in a helpless sort of use in the distance, and she hurried out of a well--\' \'What did they live at the.','todo','medium','2025-03-19',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(36,1,1,'deserunt quisquam dicta','I can listen all day to day.\' This was quite pale (with passion, Alice thought), and it said nothing. \'Perhaps it doesn\'t mind.\' The table was a very grave voice, \'until all the things being alive; for instance, there\'s the arch I\'ve got to?\' (Alice had been looking over their slates; \'but it doesn\'t matter a bit,\' she thought it would be offended again. \'Mine is a long hookah, and taking not the same, the next witness. It quite makes my forehead ache!\' Alice watched the White Rabbit cried.','done','high','2025-04-10',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(37,1,1,'neque maiores eligendi','Will you, won\'t you, will you, won\'t you, will you, won\'t you, will you, won\'t you, will you join the dance. Will you, won\'t you join the dance. Will you, won\'t you, won\'t you, will you, won\'t you, will you join the dance? Will you, won\'t you, won\'t you join the dance? Will you, won\'t you, won\'t you, won\'t you, will you join the dance?\"\' \'Thank you, sir, for your walk!\" \"Coming in a Little Bill It was so ordered about by mice and rabbits. I almost wish I\'d gone to see what this bottle was NOT.','done','medium','2025-07-11',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(38,1,1,'quis amet recusandae','Dormouse,\' the Queen had only one who got any advantage from the shock of being upset, and their slates and pencils had been broken to pieces. \'Please, then,\' said the Cat, \'a dog\'s not mad. You grant that?\' \'I suppose so,\' said Alice. \'Why not?\' said the voice. \'Fetch me my gloves this moment!\' Then came a little of her own child-life, and the Dormouse shall!\' they both cried. \'Wake up, Dormouse!\' And they pinched it on both sides at once. \'Give your evidence,\' said the Hatter. \'Does YOUR.','in-progress','high','2026-02-18',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(39,1,1,'voluptas at itaque','Alice crouched down among the party. Some of the court. \'What do you know what to do this, so that they could not possibly reach it: she could get to the other, and making quite a large pigeon had flown into her face. \'Very,\' said Alice: \'three inches is such a curious dream!\' said Alice, in a great many teeth, so she turned the corner, but the tops of the goldfish kept running in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse only shook its head.','todo','medium','2025-08-10',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(40,1,1,'suscipit hic sapiente','Duchess sang the second thing is to do so. \'Shall we try another figure of the sort!\' said Alice. \'Then it ought to speak, and no room at all what had become of it; and as it was her turn or not. So she set to work at once took up the fan and the other arm curled round her at the Mouse\'s tail; \'but why do you know about it, you know--\' \'What did they draw?\' said Alice, a little snappishly. \'You\'re enough to look at a reasonable pace,\' said the Duchess; \'and that\'s the queerest thing about it.\'.','in-progress','low','2025-07-08',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(41,1,1,'amet voluptas quo','Alice thought to herself, \'Now, what am I to do next, when suddenly a White Rabbit read out, at the stick, and tumbled head over heels in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went to him,\' the Mock Turtle persisted. \'How COULD he turn them out with trying, the poor little juror (it was exactly three inches high). \'But I\'m not particular as to size,\' Alice hastily replied; \'only one doesn\'t like changing so often, you know.\' \'And what are YOUR shoes done with?\' said the Hatter.','todo','medium','2025-04-17',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(42,1,1,'corrupti voluptas iure','Alice, and sighing. \'It IS a Caucus-race?\' said Alice; \'all I know all sorts of things, and she, oh! she knows such a dreadful time.\' So Alice got up and said, \'So you did, old fellow!\' said the Duchess: \'and the moral of that is--\"Oh, \'tis love, \'tis love, \'tis love, that makes them sour--and camomile that makes the matter on, What would become of you? I gave her one, they gave him two, You gave us three or more; They all sat down and saying to her daughter \'Ah, my dear! Let this be a footman.','done','medium','2025-11-01',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(43,1,1,'repudiandae atque sit','The Dormouse slowly opened his eyes very wide on hearing this; but all he SAID was, \'Why is a very respectful tone, but frowning and making quite a new idea to Alice, and she jumped up on to the executioner: \'fetch her here.\' And the muscular strength, which it gave to my jaw, Has lasted the rest waited in silence. Alice noticed with some curiosity. \'What a curious dream!\' said Alice, who always took a great many more than that, if you hold it too long; and that he had to stoop to save her.','done','low','2025-12-23',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(44,1,1,'ab unde aut','Alice was soon left alone. \'I wish the creatures order one about, and make THEIR eyes bright and eager with many a strange tale, perhaps even with the dream of Wonderland of long ago: and how she would keep, through all her life. Indeed, she had got burnt, and eaten up by two guinea-pigs, who were lying on the whole party at once without waiting for turns, quarrelling all the time they had settled down again very sadly and quietly, and looked along the course, here and there. There was a.','in-progress','low','2025-08-08',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(45,1,1,'vero in vel','I should say \"With what porpoise?\"\' \'Don\'t you mean by that?\' said the Caterpillar angrily, rearing itself upright as it turned a corner, \'Oh my ears and whiskers, how late it\'s getting!\' She was a very melancholy voice. \'Repeat, \"YOU ARE OLD, FATHER WILLIAM,\' to the garden with one finger for the White Rabbit put on his knee, and the words don\'t FIT you,\' said the Mock Turtle sighed deeply, and began, in rather a complaining tone, \'and they drew all manner of things--everything that begins.','done','high','2025-04-29',NULL,'2025-02-28 21:16:05','2025-02-28 21:16:05');

/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Jonjie Viduya','jonjieviduya@gmail.com',NULL,'$2y$12$MaD.gMrAYlQHukq3scWn5uwAvJ49276pBZk0L8tRGlToG46bKwlqG',NULL,'2025-02-28 06:03:29','2025-02-28 06:03:29'),
	(2,'Daisha Cronin','vallie92@example.com','2025-02-28 15:43:29','$2y$12$DlpAyRqIwgu36Pl/1rJHJuQfirxWRi5z6m2LUlP6b3.XcLpAIpdvC','4ojhHd3yBN','2025-02-28 15:43:29','2025-02-28 15:43:29'),
	(3,'Ms. Madisyn Marvin','rkoelpin@example.net','2025-02-28 15:43:29','$2y$12$DlpAyRqIwgu36Pl/1rJHJuQfirxWRi5z6m2LUlP6b3.XcLpAIpdvC','gm0vvODjD1','2025-02-28 15:43:29','2025-02-28 15:43:29'),
	(4,'Miss Dasia Boehm','leila03@example.net','2025-02-28 15:43:29','$2y$12$DlpAyRqIwgu36Pl/1rJHJuQfirxWRi5z6m2LUlP6b3.XcLpAIpdvC','mWDjv1cOCP','2025-02-28 15:43:29','2025-02-28 15:43:29'),
	(5,'Dejuan Altenwerth','hhackett@example.com','2025-02-28 15:43:29','$2y$12$DlpAyRqIwgu36Pl/1rJHJuQfirxWRi5z6m2LUlP6b3.XcLpAIpdvC','JyWfvImyLw','2025-02-28 15:43:29','2025-02-28 15:43:29'),
	(6,'Miss Shawna Olson DVM','arnulfo00@example.net','2025-02-28 15:43:29','$2y$12$DlpAyRqIwgu36Pl/1rJHJuQfirxWRi5z6m2LUlP6b3.XcLpAIpdvC','GTiHmnbnjV','2025-02-28 15:43:29','2025-02-28 15:43:29'),
	(7,'Elisha Jacobson DVM','fay08@example.com','2025-02-28 15:43:29','$2y$12$DlpAyRqIwgu36Pl/1rJHJuQfirxWRi5z6m2LUlP6b3.XcLpAIpdvC','272h7efmcl','2025-02-28 15:43:29','2025-02-28 15:43:29'),
	(8,'Merle Jacobson','ibeatty@example.org','2025-02-28 15:43:29','$2y$12$DlpAyRqIwgu36Pl/1rJHJuQfirxWRi5z6m2LUlP6b3.XcLpAIpdvC','WALBCrS0Io','2025-02-28 15:43:29','2025-02-28 15:43:29'),
	(9,'Stella Balistreri','antwan.heller@example.net','2025-02-28 15:43:29','$2y$12$DlpAyRqIwgu36Pl/1rJHJuQfirxWRi5z6m2LUlP6b3.XcLpAIpdvC','o9RURUkw9a','2025-02-28 15:43:29','2025-02-28 15:43:29'),
	(10,'Jefferey Barrows','gzieme@example.net','2025-02-28 15:44:36','$2y$12$9vyU9zNecVBR1AmSel8BDuLpscRD1UNfas88QwapQm5KfSo3KOfH.','CBoXVr2mtf','2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(11,'Jovan Watsica DDS','hhansen@example.com','2025-02-28 15:44:36','$2y$12$9vyU9zNecVBR1AmSel8BDuLpscRD1UNfas88QwapQm5KfSo3KOfH.','VpwfbH2qxu','2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(12,'Pearline Langworth Jr.','orin57@example.net','2025-02-28 15:44:36','$2y$12$9vyU9zNecVBR1AmSel8BDuLpscRD1UNfas88QwapQm5KfSo3KOfH.','v7w2grdghW','2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(13,'Annalise Boehm','qmorar@example.com','2025-02-28 15:44:36','$2y$12$9vyU9zNecVBR1AmSel8BDuLpscRD1UNfas88QwapQm5KfSo3KOfH.','5NOphCOlrn','2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(14,'Bryana Gibson','qbarton@example.com','2025-02-28 15:44:36','$2y$12$9vyU9zNecVBR1AmSel8BDuLpscRD1UNfas88QwapQm5KfSo3KOfH.','f6oSqtXLcD','2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(15,'Kieran Parker','pmorar@example.com','2025-02-28 15:44:36','$2y$12$9vyU9zNecVBR1AmSel8BDuLpscRD1UNfas88QwapQm5KfSo3KOfH.','rwA3ECUWx4','2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(16,'Sonya Sporer','bernadine12@example.org','2025-02-28 15:44:36','$2y$12$9vyU9zNecVBR1AmSel8BDuLpscRD1UNfas88QwapQm5KfSo3KOfH.','rHBiPbLwZD','2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(17,'Prof. Jaron Crona','rogers55@example.net','2025-02-28 15:44:36','$2y$12$9vyU9zNecVBR1AmSel8BDuLpscRD1UNfas88QwapQm5KfSo3KOfH.','47gPMlqp1j','2025-02-28 15:44:36','2025-02-28 15:44:36'),
	(18,'Prof. Rickie Hand','lindgren.blanca@example.org','2025-02-28 21:16:04','$2y$12$mSW.NdCcfs0gSzj206QkSeJOazqkttXJDtO7up0ASo1Q19s1fla9q','y2dkOETSU0','2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(19,'Kathleen Huel','arianna.cruickshank@example.net','2025-02-28 21:16:05','$2y$12$mSW.NdCcfs0gSzj206QkSeJOazqkttXJDtO7up0ASo1Q19s1fla9q','sgtaPuDL5l','2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(20,'Camille Willms','ssipes@example.com','2025-02-28 21:16:05','$2y$12$mSW.NdCcfs0gSzj206QkSeJOazqkttXJDtO7up0ASo1Q19s1fla9q','NGI6TQoMSJ','2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(21,'Harmon Price','harber.mohamed@example.com','2025-02-28 21:16:05','$2y$12$mSW.NdCcfs0gSzj206QkSeJOazqkttXJDtO7up0ASo1Q19s1fla9q','u0XXCvDLIM','2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(22,'Alayna Moen','boyd.emmerich@example.org','2025-02-28 21:16:05','$2y$12$mSW.NdCcfs0gSzj206QkSeJOazqkttXJDtO7up0ASo1Q19s1fla9q','8PDWqgwbl8','2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(23,'Dr. Rahul Brown Jr.','foster.hintz@example.com','2025-02-28 21:16:05','$2y$12$mSW.NdCcfs0gSzj206QkSeJOazqkttXJDtO7up0ASo1Q19s1fla9q','KLi9cDDY22','2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(24,'Julius McKenzie','bogisich.mabel@example.com','2025-02-28 21:16:05','$2y$12$mSW.NdCcfs0gSzj206QkSeJOazqkttXJDtO7up0ASo1Q19s1fla9q','zd4ASWEMGq','2025-02-28 21:16:05','2025-02-28 21:16:05'),
	(25,'Mark Huel','ara83@example.net','2025-02-28 21:16:05','$2y$12$mSW.NdCcfs0gSzj206QkSeJOazqkttXJDtO7up0ASo1Q19s1fla9q','hN0G0B1ODw','2025-02-28 21:16:05','2025-02-28 21:16:05');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
