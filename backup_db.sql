/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: account
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_code` varchar(20) NOT NULL,
  `account_description` text NOT NULL,
  `account_type` int(11) NOT NULL DEFAULT 0,
  `account_note` int(11) NOT NULL,
  `account_category` int(11) NOT NULL,
  `account_majors_id` int(11) NOT NULL DEFAULT 0,
  `unit_unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 34 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: bebas
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `bebas` (
  `bebas_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_student_id` int(11) DEFAULT NULL,
  `payment_payment_id` int(11) DEFAULT NULL,
  `bebas_bill` decimal(10, 0) DEFAULT NULL,
  `bebas_diskon` decimal(10, 0) NOT NULL DEFAULT 0,
  `bebas_total_pay` decimal(10, 0) DEFAULT 0,
  `bebas_input_date` timestamp NULL DEFAULT NULL,
  `bebas_last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bebas_id`),
  KEY `fk_bebas_payment1_idx` (`payment_payment_id`),
  KEY `fk_bebas_student1_idx` (`student_student_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 668 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: bebas_pay
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `bebas_pay` (
  `bebas_pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `bebas_bebas_id` int(11) DEFAULT NULL,
  `bebas_pay_number` varchar(100) DEFAULT NULL,
  `bebas_pay_bill` decimal(10, 0) DEFAULT NULL,
  `bebas_pay_desc` varchar(100) DEFAULT NULL,
  `user_user_id` int(11) DEFAULT NULL,
  `bebas_pay_input_date` date DEFAULT NULL,
  `bebas_pay_last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bebas_pay_id`),
  KEY `fk_bebas_pay_bebas1_idx` (`bebas_bebas_id`),
  KEY `fk_bebas_pay_users1_idx` (`user_user_id`),
  CONSTRAINT `fk_bebas_pay_bebas1` FOREIGN KEY (`bebas_bebas_id`) REFERENCES `bebas` (`bebas_id`) ON DELETE
  SET
  NULL ON UPDATE
  SET
  NULL,
  CONSTRAINT `fk_bebas_pay_users1` FOREIGN KEY (`user_user_id`) REFERENCES `users` (`user_id`) ON DELETE
  SET
  NULL ON UPDATE
  SET
  NULL
) ENGINE = InnoDB AUTO_INCREMENT = 807 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: bulan
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `bulan` (
  `bulan_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_student_id` int(11) DEFAULT NULL,
  `payment_payment_id` int(11) DEFAULT NULL,
  `month_month_id` int(11) DEFAULT NULL,
  `bulan_bill` decimal(10, 0) DEFAULT NULL,
  `bulan_status` tinyint(1) DEFAULT 0,
  `bulan_number_pay` varchar(100) DEFAULT NULL,
  `bulan_date_pay` date DEFAULT NULL,
  `user_user_id` int(11) DEFAULT NULL,
  `bulan_input_date` timestamp NULL DEFAULT NULL,
  `bulan_last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bulan_id`),
  KEY `fk_bulan_payment1_idx` (`payment_payment_id`),
  KEY `fk_bulan_month1_idx` (`month_month_id`),
  KEY `fk_bulan_student1_idx` (`student_student_id`),
  KEY `fk_bulan_users1_idx` (`user_user_id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cash_account
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cash_account` (
  `cash_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_account_id` int(11) NOT NULL,
  `cash_account_debit` int(11) NOT NULL DEFAULT 0,
  `cash_account_kredit` int(11) NOT NULL DEFAULT 0,
  `unit_unit_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`cash_account_id`),
  KEY `account_account_id` (`account_account_id`),
  KEY `unit_unit_id` (`unit_unit_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 32 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: ci_sessions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: class
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(45) DEFAULT NULL,
  `unit_unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 45 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: debit
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `debit` (
  `debit_id` int(11) NOT NULL AUTO_INCREMENT,
  `debit_date` date DEFAULT NULL,
  `debit_no_ref` varchar(50) DEFAULT NULL,
  `debit_desc` varchar(100) DEFAULT NULL,
  `debit_value` decimal(10, 0) DEFAULT NULL,
  `user_user_id` int(11) DEFAULT NULL,
  `account_cash_account` int(11) NOT NULL,
  `account_cost_account` int(11) NOT NULL,
  `debit_tax` decimal(10, 0) NOT NULL DEFAULT 0,
  `debit_information` text NOT NULL,
  `pos_pos_pay_id` int(11) DEFAULT NULL,
  `debit_total` decimal(10, 0) NOT NULL DEFAULT 0,
  `unit_unit_id` int(11) NOT NULL,
  `is_submit` varchar(2) NOT NULL DEFAULT '0',
  `debit_created_at` timestamp NULL DEFAULT current_timestamp(),
  `debit_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`debit_id`),
  KEY `fk_jurnal_debit_users1_idx` (`user_user_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: detail_payment_rate_bebas
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `detail_payment_rate_bebas` (
  `detail_payment_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_rate_id` int(11) NOT NULL,
  `payment_rate_bill` decimal(10, 0) NOT NULL,
  `payment_rate_discount` decimal(10, 0) NOT NULL DEFAULT 0,
  `payment_rate_total_pay` decimal(10, 0) NOT NULL DEFAULT 0,
  `payment_rate_date_pay` date DEFAULT NULL,
  `payment_rate_status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`detail_payment_rate_id`),
  KEY `payment_rate_id` (`payment_rate_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3319 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: detail_payment_rate_bebas_pay
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `detail_payment_rate_bebas_pay` (
  `payment_rate_bebas_pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_payment_rate_id` int(11) NOT NULL,
  `payment_rate_bebas_pay_number` varchar(100) NOT NULL,
  `payment_rate_bebas_pay_bill` double NOT NULL,
  `payment_rate_bebas_pay_remaining` double DEFAULT NULL,
  `payment_rate_bebas_pay_desc` varchar(100) NOT NULL,
  `payment_rate_via` int(11) DEFAULT NULL,
  `payment_rate_date_pay` date DEFAULT NULL,
  `is_submit_payment` varchar(2) NOT NULL DEFAULT '0',
  `payment_rate_bebas_pay_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_rate_bebas_pay_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`payment_rate_bebas_pay_id`),
  KEY `detail_payment_rate_id` (`detail_payment_rate_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 40 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: detail_payment_rate_bulan
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `detail_payment_rate_bulan` (
  `detail_payment_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_rate_id` int(11) NOT NULL,
  `month_month_id` int(11) NOT NULL,
  `payment_rate_bill` decimal(10, 0) NOT NULL,
  `payment_rate_number_pay` varchar(100) DEFAULT NULL,
  `payment_rate_via` int(11) DEFAULT NULL,
  `payment_rate_date_pay` date DEFAULT NULL,
  `payment_rate_status` int(11) NOT NULL DEFAULT 0,
  `is_submit_payment` varchar(2) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`detail_payment_rate_id`),
  KEY `month_month_id` (`month_month_id`),
  KEY `payment_rate_id` (`payment_rate_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4631 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: holiday
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `holiday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` year(4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: information
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `information_title` varchar(100) DEFAULT NULL,
  `information_desc` text DEFAULT NULL,
  `information_img` varchar(255) DEFAULT NULL,
  `information_publish` tinyint(1) DEFAULT 0,
  `user_user_id` int(11) DEFAULT NULL,
  `information_input_date` timestamp NULL DEFAULT NULL,
  `information_last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`information_id`),
  KEY `fk_information_users1_idx` (`user_user_id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: kredit
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `kredit` (
  `kredit_id` int(11) NOT NULL AUTO_INCREMENT,
  `kredit_date` date NOT NULL,
  `kredit_no_ref` varchar(50) DEFAULT NULL,
  `kredit_desc` varchar(100) DEFAULT NULL,
  `kredit_value` decimal(10, 0) NOT NULL,
  `user_user_id` int(11) NOT NULL,
  `account_cash_account` int(11) NOT NULL,
  `account_cost_account` int(11) NOT NULL,
  `pos_pos_pay_id` int(11) DEFAULT NULL,
  `kredit_tax` decimal(10, 0) NOT NULL DEFAULT 0,
  `kredit_information` text NOT NULL,
  `kredit_total` int(10) NOT NULL DEFAULT 0,
  `unit_unit_id` int(11) NOT NULL,
  `is_submit` varchar(2) NOT NULL DEFAULT '0',
  `kredit_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `kredit_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`kredit_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 20 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: letter
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `letter` (
  `letter_id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_number` varchar(100) DEFAULT NULL,
  `letter_month` int(11) DEFAULT NULL,
  `letter_year` year(4) DEFAULT NULL,
  PRIMARY KEY (`letter_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 809 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: log
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `user_user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_user_id` (`user_user_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 163 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: majors
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `majors` (
  `majors_id` int(11) NOT NULL AUTO_INCREMENT,
  `majors_name` varchar(100) DEFAULT NULL,
  `majors_short_name` varchar(45) DEFAULT NULL,
  `unit_unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`majors_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: month
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `month` (
  `month_id` int(11) NOT NULL AUTO_INCREMENT,
  `month_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`month_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: payment
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` enum('BEBAS', 'BULANAN') DEFAULT NULL,
  `payment_mode` enum('TETAP', 'TIDAK TETAP') NOT NULL,
  `period_period_id` int(11) DEFAULT NULL,
  `pos_pos_id` int(11) DEFAULT NULL,
  `unit_unit_id` char(100) NOT NULL,
  `payment_input_date` timestamp NULL DEFAULT NULL,
  `payment_last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_payment_pos1_idx` (`pos_pos_id`),
  KEY `fk_payment_period1_idx` (`period_period_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 99 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: payment_rate
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `payment_rate` (
  `payment_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_payment_id` int(11) NOT NULL,
  `student_student_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`payment_rate_id`),
  KEY `student_id` (`student_student_id`),
  KEY `payment_payment_id` (`payment_payment_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 309 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: period
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `period` (
  `period_id` int(11) NOT NULL AUTO_INCREMENT,
  `period_start` year(4) DEFAULT NULL,
  `period_end` year(4) DEFAULT NULL,
  `period_status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`period_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: pos(deleted)
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `pos(deleted)` (
  `pos_id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(100) DEFAULT NULL,
  `pos_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 25 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: pos_pay
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `pos_pay` (
  `pos_pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_account_code` varchar(20) NOT NULL,
  `account_account_credit` varchar(20) NOT NULL,
  `pos_pay_name` varchar(100) NOT NULL,
  `pos_pay_description` text NOT NULL,
  PRIMARY KEY (`pos_pay_id`),
  KEY `account_account_code` (`account_account_code`),
  KEY `account_account_credit` (`account_account_credit`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: sekolah
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `sekolah` (
  `sekolah_id` int(11) NOT NULL AUTO_INCREMENT,
  `sekolah_nama` varchar(225) NOT NULL,
  `sekolah_logo` text NOT NULL,
  `sekolah_alamat` text NOT NULL,
  PRIMARY KEY (`sekolah_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: setting
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(255) DEFAULT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: student
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_nis` varchar(45) DEFAULT NULL,
  `student_nisn` varchar(45) DEFAULT NULL,
  `student_password` varchar(100) DEFAULT NULL,
  `student_full_name` varchar(255) DEFAULT NULL,
  `student_gender` enum('L', 'P') DEFAULT NULL,
  `student_born_place` varchar(45) DEFAULT NULL,
  `student_born_date` date DEFAULT NULL,
  `student_img` varchar(255) DEFAULT NULL,
  `student_phone` varchar(45) DEFAULT NULL,
  `student_hobby` varchar(100) DEFAULT NULL,
  `student_address` text DEFAULT NULL,
  `student_name_of_mother` varchar(255) DEFAULT NULL,
  `student_name_of_father` varchar(255) DEFAULT NULL,
  `student_parent_phone` varchar(45) DEFAULT NULL,
  `class_class_id` int(11) DEFAULT NULL,
  `majors_majors_id` int(11) DEFAULT NULL,
  `student_status` tinyint(1) DEFAULT 1,
  `unit_unit_id` int(11) DEFAULT NULL,
  `student_input_date` timestamp NULL DEFAULT NULL,
  `student_last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `fk_student_class1_idx` (`class_class_id`),
  KEY `fk_student_majors1_idx` (`majors_majors_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 169 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: unit
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(200) NOT NULL,
  `users_users_id` int(11) NOT NULL,
  PRIMARY KEY (`unit_id`),
  KEY `users_users_id` (`users_users_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_roles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(45) DEFAULT NULL,
  `user_password` text DEFAULT NULL,
  `user_full_name` varchar(255) DEFAULT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  `user_description` text DEFAULT NULL,
  `user_role_role_id` int(11) DEFAULT NULL,
  `user_is_deleted` tinyint(1) DEFAULT 0,
  `user_input_date` timestamp NULL DEFAULT NULL,
  `user_last_update` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user_id`),
  KEY `fk_user_user_role1_idx` (`user_role_role_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view_cash_account
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view_cash_account` AS
select
  `cash_account`.`cash_account_id` AS `cash_account_id`,
  `cash_account`.`account_account_id` AS `account_account_id`,
  `cash_account`.`cash_account_debit` AS `cash_account_debit`,
  `cash_account`.`cash_account_kredit` AS `cash_account_kredit`,
  `cash_account`.`unit_unit_id` AS `unit_unit_id`,
  `cash_account`.`created_at` AS `created_at`,
  `cash_account`.`updated_at` AS `updated_at`,
  `account`.`account_code` AS `account_code`,
  `account`.`account_description` AS `account_description`,
  `unit`.`unit_name` AS `unit_name`
from
  (
  (
    `cash_account`
    join `account` on(
    `account`.`account_id` = `cash_account`.`account_account_id`
    )
  )
  join `unit` on(`unit`.`unit_id` = `cash_account`.`unit_unit_id`)
  );

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view_payment
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view_payment` AS
select
  `payment`.`payment_id` AS `payment_id`,
  `payment`.`payment_type` AS `payment_type`,
  `payment`.`payment_mode` AS `payment_mode`,
  `payment`.`period_period_id` AS `period_period_id`,
  `payment`.`pos_pos_id` AS `pos_pos_id`,
  `payment`.`unit_unit_id` AS `unit_unit_id`,
  `payment`.`payment_input_date` AS `payment_input_date`,
  `payment`.`payment_last_update` AS `payment_last_update`,
  `period`.`period_start` AS `period_start`,
  `period`.`period_end` AS `period_end`,
  `pos_pay`.`pos_pay_name` AS `pos_pay_name`,
  `pos_pay`.`pos_pay_description` AS `pos_pay_description`
from
  (
  (
    `payment`
    join `period` on(
    `period`.`period_id` = `payment`.`period_period_id`
    )
  )
  join `pos_pay` on(`pos_pay`.`pos_pay_id` = `payment`.`pos_pos_id`)
  );

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view_payment_rate
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view_payment_rate` AS
select
  `payment_rate`.`payment_rate_id` AS `payment_rate_id`,
  `payment_rate`.`payment_payment_id` AS `payment_payment_id`,
  `payment_rate`.`student_student_id` AS `student_student_id`,
  `class`.`class_id` AS `class_class_id`,
  `payment_rate`.`created_at` AS `created_at`,
  `payment_rate`.`updated_at` AS `updated_at`,
  `class`.`class_name` AS `class_name`,
  `student`.`student_full_name` AS `student_full_name`,
  `student`.`student_nis` AS `student_nis`,
  `period`.`period_start` AS `period_start`,
  `period`.`period_end` AS `period_end`,
  `payment`.`payment_type` AS `payment_type`,
  `pos_pay`.`pos_pay_name` AS `pos_pay_name`,
  `payment`.`unit_unit_id` AS `unit_unit_id`
from
  (
  (
    (
    (
      (
      `payment_rate`
      join `student` on(
        `student`.`student_id` = `payment_rate`.`student_student_id`
      )
      )
      join `class` on(`class`.`class_id` = `student`.`class_class_id`)
    )
    join `payment` on(
      `payment`.`payment_id` = `payment_rate`.`payment_payment_id`
    )
    )
    join `period` on(
    `period`.`period_id` = `payment`.`period_period_id`
    )
  )
  join `pos_pay` on(`pos_pay`.`pos_pay_id` = `payment`.`pos_pos_id`)
  );

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view_payment_type
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view_payment_type` AS
select
  `payment_rate`.`payment_rate_id` AS `payment_rate_id`,
  `payment_rate`.`payment_payment_id` AS `payment_payment_id`,
  `payment_rate`.`student_student_id` AS `student_student_id`,
  `payment_rate`.`created_at` AS `created_at`,
  `payment_rate`.`updated_at` AS `updated_at`,
  `payment`.`payment_type` AS `payment_type`,
  `payment`.`payment_mode` AS `payment_mode`,
  `pos_pay`.`pos_pay_id` AS `pos_pay_id`,
  `pos_pay`.`account_account_code` AS `account_account_code`,
  `pos_pay`.`account_account_credit` AS `account_account_credit`,
  `pos_pay`.`pos_pay_name` AS `pos_pay_name`,
  `pos_pay`.`pos_pay_description` AS `pos_pay_description`,
  `period`.`period_id` AS `period_id`,
  `period`.`period_start` AS `period_start`,
  `period`.`period_end` AS `period_end`,
  `period`.`period_status` AS `period_status`
from
  (
  (
    (
    `payment_rate`
    join `payment` on(
      `payment_rate`.`payment_payment_id` = `payment`.`payment_id`
    )
    )
    join `pos_pay` on(`pos_pay`.`pos_pay_id` = `payment`.`pos_pos_id`)
  )
  join `period` on(
    `period`.`period_id` = `payment`.`period_period_id`
  )
  );

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view_student
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view_student` AS
select
  `student`.`student_id` AS `student_id`,
  `student`.`student_nis` AS `student_nis`,
  `student`.`student_nisn` AS `student_nisn`,
  `student`.`student_password` AS `student_password`,
  `student`.`student_full_name` AS `student_full_name`,
  `student`.`student_gender` AS `student_gender`,
  `student`.`student_born_place` AS `student_born_place`,
  `student`.`student_born_date` AS `student_born_date`,
  `student`.`student_img` AS `student_img`,
  `student`.`student_phone` AS `student_phone`,
  `student`.`student_hobby` AS `student_hobby`,
  `student`.`student_address` AS `student_address`,
  `student`.`student_name_of_mother` AS `student_name_of_mother`,
  `student`.`student_name_of_father` AS `student_name_of_father`,
  `student`.`student_parent_phone` AS `student_parent_phone`,
  `student`.`class_class_id` AS `class_class_id`,
  `student`.`majors_majors_id` AS `majors_majors_id`,
  `student`.`student_status` AS `student_status`,
  `student`.`student_input_date` AS `student_input_date`,
  `student`.`student_last_update` AS `student_last_update`,
  `majors`.`majors_name` AS `majors_majors_name`,
  `class`.`class_name` AS `class_class_name`,
  `student`.`unit_unit_id` AS `unit_unit_id`,
  `unit`.`unit_name` AS `unit_unit_name`
from
  (
  (
    (
    `student`
    left join `majors` on(
      `majors`.`majors_id` = `student`.`majors_majors_id`
    )
    )
    left join `class` on(`class`.`class_id` = `student`.`class_class_id`)
  )
  join `unit` on(`unit`.`unit_id` = `student`.`unit_unit_id`)
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: account
# ------------------------------------------------------------

INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (1, '1-10000', 'AKTIVA', 0, 0, 0, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (2, '2-20000', 'PASIVA', 0, 0, 0, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (3, '3-30000', 'MODAL', 0, 0, 0, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (4, '4-40000', 'PENDAPATAN', 0, 0, 0, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (5, '5-50000', 'BEBAN', 0, 0, 0, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (6, '1-10100', 'Aktiva SMK  SMK', 1, 1, 0, 5, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (7, '1-10101', 'KAS TUNAI SMK', 2, 6, 2, 5, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (8, '1-10200', 'Piutang SMK', 1, 0, 0, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (9, '1-10300', 'Kas', 1, 0, 0, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (17, '4-40100', 'Pendapatan Siswa SMK', 1, 0, 0, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (19, '1-10102', 'Bank', 2, 0, 2, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (20, '4-40102', 'KEGIATAN', 2, 0, 1, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (21, '1-10400', 'safsf', 1, 0, 0, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (22, '1-10500', 'asdsad', 1, 0, 0, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (23, '4-40103', 'coba', 2, 0, 2, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (26, '1-10103', 'KAS KECIL', 2, 0, 2, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (27, '5-50100', 'ddd', 1, 0, 0, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (28, '5-50101', 'listri SMK', 2, 0, 2, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (29, '1-10201', 'PIUTANG SMK', 2, 0, 2, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (30, '4-40101', 'SPP. SMK', 2, 0, 1, 0, 1);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (32, '1-10000', 'AKTIVA', 0, 0, 0, 0, 2);
INSERT INTO
  `account` (
    `account_id`,
    `account_code`,
    `account_description`,
    `account_type`,
    `account_note`,
    `account_category`,
    `account_majors_id`,
    `unit_unit_id`
  )
VALUES
  (33, '1-10100', 'AKTIVA SMP', 1, 0, 0, 0, 2);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: bebas
# ------------------------------------------------------------

INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    1,
    1,
    2,
    6250000,
    0,
    0,
    '2022-06-11 07:49:19',
    '2022-06-11 07:52:54'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    2,
    6,
    2,
    6250000,
    0,
    0,
    '2022-06-12 17:46:49',
    '2022-06-12 17:46:49'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    3,
    5,
    2,
    6250000,
    0,
    250000,
    '2022-06-12 17:47:05',
    '2022-06-12 17:59:35'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    4,
    4,
    2,
    6250000,
    0,
    0,
    '2022-06-12 17:47:20',
    '2022-06-12 17:47:20'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    5,
    3,
    2,
    6250000,
    0,
    0,
    '2022-06-12 17:47:39',
    '2022-06-12 17:47:39'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    6,
    2,
    2,
    6250000,
    0,
    0,
    '2022-06-12 17:47:56',
    '2022-06-12 17:47:56'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    7,
    1,
    3,
    6250000,
    0,
    0,
    '2022-06-12 17:51:03',
    '2022-06-12 17:51:03'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    8,
    6,
    3,
    6250000,
    0,
    6250000,
    '2022-06-12 17:51:03',
    '2022-06-21 08:53:09'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    9,
    5,
    3,
    6250000,
    0,
    6250000,
    '2022-06-12 17:51:03',
    '2022-06-12 17:59:50'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    10,
    4,
    3,
    6250000,
    0,
    3250000,
    '2022-06-12 17:51:03',
    '2022-06-12 17:58:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    11,
    3,
    3,
    6250000,
    0,
    3250000,
    '2022-06-12 17:51:03',
    '2022-06-12 17:55:22'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    12,
    2,
    3,
    6250000,
    0,
    4250000,
    '2022-06-12 17:51:03',
    '2022-07-07 12:56:11'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    13,
    7,
    4,
    9000000,
    0,
    9000000,
    '2022-06-16 10:40:05',
    '2022-07-29 10:00:11'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    14,
    8,
    4,
    9000000,
    0,
    9000000,
    '2022-06-18 17:08:27',
    '2023-01-09 12:07:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    15,
    5,
    5,
    700000,
    0,
    700000,
    '2022-06-20 09:03:27',
    '2022-06-20 09:03:45'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    16,
    9,
    5,
    700000,
    0,
    700000,
    '2022-06-20 09:12:24',
    '2022-06-20 09:13:44'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    17,
    12,
    5,
    700000,
    0,
    700000,
    '2022-06-20 09:20:35',
    '2022-06-20 09:29:20'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    18,
    11,
    5,
    700000,
    0,
    700000,
    '2022-06-20 09:20:50',
    '2022-06-20 09:28:19'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    19,
    3,
    5,
    700000,
    0,
    700000,
    '2022-06-20 09:21:02',
    '2022-06-20 09:26:48'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    20,
    10,
    5,
    700000,
    0,
    700000,
    '2022-06-20 09:21:19',
    '2022-06-20 09:25:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    21,
    1,
    5,
    700000,
    0,
    700000,
    '2022-06-20 09:22:18',
    '2022-06-20 09:24:58'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    22,
    4,
    5,
    700000,
    0,
    700000,
    '2022-06-20 09:22:33',
    '2022-06-20 09:24:13'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    23,
    6,
    5,
    700000,
    0,
    700000,
    '2022-06-20 09:22:48',
    '2022-06-20 09:23:15'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    24,
    13,
    4,
    9000000,
    0,
    3000000,
    '2022-06-20 14:00:31',
    '2022-06-20 14:00:49'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    25,
    14,
    4,
    7500000,
    0,
    6000000,
    '2022-06-25 13:20:31',
    '2023-01-09 11:45:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    26,
    15,
    3,
    3450000,
    0,
    1000000,
    '2022-06-27 09:48:28',
    '2022-06-27 09:49:43'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    27,
    15,
    5,
    700000,
    0,
    700000,
    '2022-06-27 09:49:02',
    '2022-06-27 09:50:00'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    28,
    16,
    5,
    700000,
    0,
    700000,
    '2022-06-27 15:10:58',
    '2022-06-27 15:11:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    29,
    10,
    6,
    1100000,
    0,
    1100000,
    '2022-07-01 09:38:47',
    '2022-07-01 09:39:28'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    30,
    4,
    6,
    1100000,
    0,
    1100000,
    '2022-07-01 09:39:00',
    '2022-07-01 09:40:10'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    31,
    3,
    6,
    1100000,
    0,
    1100000,
    '2022-07-04 10:15:41',
    '2022-07-04 10:17:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    32,
    12,
    6,
    1100000,
    0,
    1100000,
    '2022-07-04 10:15:54',
    '2022-07-04 10:17:13'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    33,
    15,
    6,
    1100000,
    0,
    1100000,
    '2022-07-04 13:37:54',
    '2022-07-04 13:38:27'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    34,
    17,
    4,
    9000000,
    0,
    9000000,
    '2022-07-06 13:47:10',
    '2022-12-12 12:52:55'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    35,
    2,
    6,
    1100000,
    0,
    1100000,
    '2022-07-07 12:56:55',
    '2022-07-07 12:57:19'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    36,
    18,
    4,
    6750000,
    0,
    6750000,
    '2022-07-08 11:09:52',
    '2023-01-10 09:21:15'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    37,
    5,
    6,
    1100000,
    0,
    1100000,
    '2022-07-12 13:20:41',
    '2022-07-12 13:21:32'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    38,
    11,
    6,
    1100000,
    0,
    1100000,
    '2022-07-12 15:19:04',
    '2022-07-12 15:27:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    39,
    6,
    6,
    1100000,
    0,
    1100000,
    '2022-07-12 15:19:27',
    '2022-07-12 15:27:11'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    40,
    19,
    6,
    1100000,
    0,
    1100000,
    '2022-07-12 15:22:07',
    '2022-07-12 15:26:15'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    41,
    20,
    4,
    8100000,
    0,
    8100000,
    '2022-07-18 11:11:26',
    '2022-07-18 11:12:21'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    42,
    20,
    7,
    2000000,
    0,
    2000000,
    '2022-07-18 11:17:26',
    '2022-07-18 11:17:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    43,
    17,
    7,
    2000000,
    0,
    2000000,
    '2022-07-18 11:17:26',
    '2022-10-05 08:23:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    44,
    7,
    7,
    2000000,
    0,
    2000000,
    '2022-07-18 11:17:26',
    '2022-07-29 10:00:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    45,
    8,
    7,
    2000000,
    0,
    2000000,
    '2022-07-18 11:17:26',
    '2022-10-05 08:05:42'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    46,
    13,
    7,
    2000000,
    0,
    0,
    '2022-07-18 11:17:26',
    '2022-07-18 11:17:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    47,
    21,
    4,
    9000000,
    0,
    9000000,
    '2022-07-19 14:30:39',
    '2022-10-20 11:12:16'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    48,
    22,
    4,
    9000000,
    0,
    6500000,
    '2022-07-20 15:05:17',
    '2023-01-10 10:01:29'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    49,
    9,
    6,
    1100000,
    0,
    1100000,
    '2022-07-20 15:10:41',
    '2022-07-20 15:11:34'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    50,
    23,
    4,
    9000000,
    0,
    6000000,
    '2022-08-02 09:15:07',
    '2023-01-09 08:49:49'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    51,
    1,
    6,
    1100000,
    0,
    1100000,
    '2022-08-02 10:28:26',
    '2022-08-02 10:28:56'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    52,
    24,
    4,
    7500000,
    0,
    6000000,
    '2022-08-02 10:32:03',
    '2023-01-09 12:28:36'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    53,
    25,
    4,
    7500000,
    0,
    7500000,
    '2022-08-09 13:18:26',
    '2023-01-09 12:11:30'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    54,
    26,
    8,
    6000000,
    0,
    6000000,
    '2022-08-10 15:02:28',
    '2022-08-10 15:03:07'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    55,
    27,
    9,
    620000,
    0,
    620000,
    '2022-08-10 15:09:18',
    '2022-08-10 15:09:50'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    56,
    28,
    8,
    250000,
    0,
    250000,
    '2022-08-11 12:04:54',
    '2022-08-11 12:05:40'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    57,
    29,
    4,
    9000000,
    0,
    6500000,
    '2022-08-15 10:29:50',
    '2022-11-23 11:43:57'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    58,
    36,
    4,
    9000000,
    0,
    3000000,
    '2022-08-24 12:10:14',
    '2022-08-24 12:10:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    59,
    37,
    4,
    9000000,
    0,
    9000000,
    '2022-08-25 10:18:40',
    '2022-11-03 09:24:39'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    60,
    38,
    10,
    6250000,
    0,
    6250000,
    '2022-08-29 12:22:05',
    '2022-08-29 12:23:21'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    61,
    39,
    4,
    9000000,
    0,
    9000000,
    '2022-09-01 15:09:24',
    '2023-01-07 09:43:56'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    62,
    40,
    4,
    9000000,
    0,
    3000000,
    '2022-09-03 12:45:19',
    '2022-12-19 13:28:40'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    63,
    40,
    7,
    2000000,
    0,
    2000000,
    '2022-09-03 12:45:56',
    '2022-09-03 12:46:17'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    64,
    41,
    4,
    9000000,
    0,
    9000000,
    '2022-09-03 12:57:26',
    '2023-02-13 09:57:28'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    65,
    42,
    4,
    9000000,
    0,
    6000000,
    '2022-09-03 14:36:21',
    '2022-09-03 14:38:18'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    66,
    42,
    7,
    2000000,
    0,
    2000000,
    '2022-09-03 14:37:13',
    '2022-09-03 14:38:34'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    67,
    14,
    7,
    2000000,
    0,
    2000000,
    '2022-09-03 14:59:30',
    '2022-10-05 08:14:17'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    68,
    10,
    11,
    6250000,
    0,
    6250000,
    '2022-09-06 12:06:14',
    '2022-09-06 12:06:52'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    69,
    41,
    7,
    2000000,
    0,
    2000000,
    '2022-09-12 11:28:56',
    '2022-09-12 11:29:29'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    70,
    1,
    11,
    6250000,
    0,
    5000000,
    '2022-09-13 14:59:13',
    '2022-09-19 12:46:05'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    71,
    9,
    11,
    6500000,
    0,
    6500000,
    '2022-09-13 15:00:40',
    '2022-09-21 11:06:17'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    72,
    9,
    12,
    6250000,
    0,
    0,
    '2022-09-13 15:07:10',
    '2022-09-13 15:07:10'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    73,
    5,
    11,
    6250000,
    0,
    6250000,
    '2022-09-13 15:18:29',
    '2023-01-10 09:06:24'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    74,
    15,
    12,
    6250000,
    0,
    2450000,
    '2022-09-13 15:23:50',
    '2022-09-13 15:27:09'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    75,
    15,
    11,
    6250000,
    0,
    4250000,
    '2022-09-13 15:27:41',
    '2023-01-10 09:13:34'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    76,
    36,
    7,
    2000000,
    0,
    2000000,
    '2022-09-13 15:34:19',
    '2022-09-13 15:34:44'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    77,
    4,
    11,
    6250000,
    0,
    6250000,
    '2022-09-15 12:37:49',
    '2023-03-04 12:35:57'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    78,
    29,
    13,
    320000,
    0,
    320000,
    '2022-09-17 09:45:34',
    '2022-09-27 09:49:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    79,
    22,
    13,
    320000,
    0,
    0,
    '2022-09-17 09:45:34',
    '2022-09-17 09:45:34'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    80,
    18,
    13,
    320000,
    0,
    320000,
    '2022-09-17 09:45:34',
    '2022-09-21 13:57:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    81,
    14,
    13,
    320000,
    0,
    0,
    '2022-09-17 09:45:59',
    '2022-09-17 09:45:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    82,
    42,
    13,
    320000,
    0,
    320000,
    '2022-09-17 09:45:59',
    '2022-09-27 11:00:44'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    83,
    41,
    13,
    320000,
    0,
    320000,
    '2022-09-17 09:45:59',
    '2022-09-27 11:53:44'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    84,
    40,
    13,
    320000,
    0,
    0,
    '2022-09-17 09:45:59',
    '2022-09-17 09:45:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    85,
    39,
    13,
    320000,
    0,
    0,
    '2022-09-17 09:45:59',
    '2022-09-17 09:45:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    86,
    37,
    13,
    320000,
    0,
    0,
    '2022-09-17 09:45:59',
    '2022-09-17 09:45:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    87,
    36,
    13,
    320000,
    0,
    0,
    '2022-09-17 09:45:59',
    '2022-09-17 09:45:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    88,
    35,
    13,
    320000,
    0,
    320000,
    '2022-09-17 09:45:59',
    '2022-09-27 11:07:45'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    89,
    34,
    13,
    320000,
    0,
    320000,
    '2022-09-17 09:45:59',
    '2022-09-24 12:03:52'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    90,
    33,
    13,
    320000,
    0,
    0,
    '2022-09-17 09:45:59',
    '2022-09-17 09:45:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    91,
    32,
    13,
    320000,
    0,
    0,
    '2022-09-17 09:45:59',
    '2022-09-17 09:45:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    92,
    31,
    13,
    320000,
    0,
    0,
    '2022-09-17 09:45:59',
    '2022-09-17 09:45:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    93,
    30,
    13,
    320000,
    0,
    320000,
    '2022-09-17 09:45:59',
    '2022-09-20 15:18:45'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    94,
    23,
    13,
    320000,
    0,
    320000,
    '2022-09-17 09:45:59',
    '2022-09-19 12:16:24'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    95,
    21,
    13,
    320000,
    0,
    320000,
    '2022-09-17 09:45:59',
    '2022-09-27 11:50:46'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    96,
    20,
    13,
    320000,
    0,
    320000,
    '2022-09-17 09:45:59',
    '2022-09-17 09:48:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    97,
    17,
    13,
    320000,
    0,
    0,
    '2022-09-17 09:45:59',
    '2022-09-17 09:45:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    98,
    7,
    13,
    320000,
    0,
    320000,
    '2022-09-17 09:45:59',
    '2022-09-17 10:34:10'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    99,
    8,
    13,
    320000,
    0,
    320000,
    '2022-09-17 09:45:59',
    '2022-09-27 11:32:23'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    100,
    13,
    13,
    320000,
    0,
    0,
    '2022-09-17 09:45:59',
    '2022-09-17 09:45:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    101,
    31,
    7,
    2000000,
    0,
    1700000,
    '2022-09-17 09:50:41',
    '2022-11-21 11:00:22'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    102,
    43,
    7,
    2000000,
    0,
    2000000,
    '2022-09-17 09:53:46',
    '2022-09-17 09:56:33'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    103,
    43,
    13,
    320000,
    0,
    320000,
    '2022-09-17 09:54:04',
    '2022-09-17 09:56:44'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    104,
    44,
    7,
    2000000,
    0,
    2000000,
    '2022-09-17 10:13:57',
    '2022-09-17 10:14:24'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    105,
    23,
    7,
    2000000,
    0,
    2000000,
    '2022-09-17 10:17:44',
    '2022-09-17 10:18:09'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    106,
    45,
    7,
    2000000,
    0,
    2000000,
    '2022-09-17 10:20:30',
    '2022-09-17 10:20:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    107,
    46,
    7,
    2000000,
    0,
    2000000,
    '2022-09-17 10:24:08',
    '2022-09-17 10:24:45'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    108,
    21,
    7,
    2000000,
    0,
    2000000,
    '2022-09-17 10:29:32',
    '2022-09-17 10:30:03'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    109,
    30,
    7,
    2000000,
    0,
    2000000,
    '2022-09-17 10:31:55',
    '2022-09-17 10:32:14'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    110,
    34,
    7,
    2000000,
    0,
    2000000,
    '2022-09-17 10:37:09',
    '2022-09-17 10:37:29'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    111,
    47,
    7,
    500000,
    0,
    500000,
    '2022-09-17 10:41:41',
    '2023-05-10 11:09:14'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    112,
    12,
    12,
    6250000,
    0,
    750000,
    '2022-09-17 13:43:30',
    '2022-09-17 13:44:29'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    113,
    12,
    11,
    6250000,
    0,
    750000,
    '2022-09-17 13:43:55',
    '2022-09-17 13:44:58'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    114,
    48,
    11,
    7500000,
    0,
    7500000,
    '2022-09-17 14:42:29',
    '2023-01-09 11:43:49'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    115,
    44,
    13,
    320000,
    0,
    320000,
    '2022-09-19 12:14:18',
    '2022-09-19 12:14:41'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    116,
    46,
    13,
    320000,
    0,
    320000,
    '2022-09-19 12:17:29',
    '2022-09-19 12:17:42'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    117,
    49,
    7,
    2000000,
    0,
    500000,
    '2022-09-19 12:20:39',
    '2022-09-19 12:21:09'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    118,
    50,
    7,
    2000000,
    0,
    2000000,
    '2022-09-19 12:26:38',
    '2022-09-19 12:26:56'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    119,
    39,
    7,
    2000000,
    0,
    2000000,
    '2022-09-19 14:04:24',
    '2022-09-19 14:04:39'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    120,
    35,
    7,
    2000000,
    0,
    300000,
    '2022-09-19 14:06:51',
    '2022-09-19 14:07:13'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    121,
    51,
    13,
    320000,
    0,
    320000,
    '2022-09-20 11:37:33',
    '2022-09-20 11:38:13'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    122,
    48,
    7,
    500000,
    0,
    500000,
    '2022-09-20 12:06:33',
    '2022-09-20 12:06:52'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    123,
    52,
    7,
    500000,
    0,
    500000,
    '2022-09-20 12:13:04',
    '2022-09-20 12:13:25'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    124,
    24,
    7,
    500000,
    0,
    500000,
    '2022-09-20 14:51:17',
    '2022-09-20 14:51:31'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    125,
    9,
    14,
    6250000,
    0,
    6250000,
    '2022-09-21 11:08:03',
    '2022-12-19 11:08:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    126,
    18,
    7,
    500000,
    0,
    500000,
    '2022-09-21 13:56:38',
    '2022-09-21 13:56:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    127,
    2,
    14,
    6250000,
    0,
    6250000,
    '2022-09-23 11:48:30',
    '2023-02-23 11:32:54'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    128,
    24,
    13,
    320000,
    0,
    320000,
    '2022-09-24 12:05:50',
    '2022-09-24 12:06:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    129,
    48,
    13,
    320000,
    0,
    320000,
    '2022-09-24 12:07:12',
    '2022-09-24 12:07:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    130,
    47,
    13,
    320000,
    0,
    320000,
    '2022-09-26 13:28:18',
    '2022-09-26 13:28:33'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    131,
    3,
    14,
    6250000,
    0,
    5750000,
    '2022-09-26 13:45:18',
    '2023-01-04 12:05:54'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    132,
    49,
    13,
    320000,
    0,
    320000,
    '2022-09-26 13:50:24',
    '2022-09-26 13:50:41'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    133,
    27,
    15,
    4540000,
    0,
    4540000,
    '2022-09-26 15:39:57',
    '2022-09-26 15:44:07'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    134,
    53,
    16,
    6250000,
    0,
    4250000,
    '2022-10-05 07:56:41',
    '2023-04-11 13:22:57'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    135,
    54,
    7,
    2000000,
    0,
    2000000,
    '2022-10-05 08:18:34',
    '2022-10-05 08:19:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    136,
    55,
    7,
    2000000,
    0,
    2000000,
    '2022-10-05 08:21:48',
    '2022-10-05 08:22:24'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    137,
    56,
    7,
    2000000,
    0,
    2000000,
    '2022-10-05 08:25:59',
    '2022-10-05 08:26:31'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    138,
    22,
    7,
    2000000,
    0,
    2000000,
    '2022-10-05 08:28:18',
    '2022-10-05 08:28:36'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    139,
    57,
    7,
    2000000,
    0,
    2000000,
    '2022-10-05 08:30:42',
    '2022-10-05 08:31:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    140,
    51,
    7,
    2000000,
    0,
    2000000,
    '2022-10-05 08:33:00',
    '2022-10-05 08:33:23'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    141,
    26,
    15,
    4540000,
    0,
    4540000,
    '2022-10-05 08:36:05',
    '2022-10-05 08:36:37'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    142,
    58,
    15,
    4540000,
    0,
    4540000,
    '2022-10-05 08:38:54',
    '2022-10-05 08:39:16'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    143,
    53,
    15,
    4540000,
    0,
    4540000,
    '2022-10-05 08:40:27',
    '2022-10-05 08:41:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    144,
    59,
    15,
    4540000,
    0,
    4540000,
    '2022-10-05 08:45:07',
    '2022-10-05 08:45:36'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    145,
    60,
    15,
    4540000,
    0,
    4540000,
    '2022-10-05 08:46:56',
    '2022-10-05 08:47:20'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    146,
    25,
    13,
    320000,
    0,
    300000,
    '2022-10-07 10:45:13',
    '2022-10-07 10:45:35'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    147,
    56,
    4,
    9000000,
    0,
    6000000,
    '2022-10-07 13:03:05',
    '2022-12-13 12:22:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    148,
    46,
    4,
    9000000,
    0,
    6000000,
    '2022-10-07 13:07:28',
    '2023-01-07 14:12:11'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    149,
    61,
    10,
    6250000,
    0,
    4250000,
    '2022-10-11 09:54:53',
    '2022-11-07 10:55:07'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    150,
    11,
    4,
    2250000,
    0,
    2250000,
    '2022-10-11 10:56:07',
    '2022-12-19 11:13:05'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    151,
    12,
    14,
    6250000,
    0,
    5500000,
    '2022-10-11 11:09:56',
    '2023-03-02 13:41:07'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    152,
    16,
    14,
    6250000,
    0,
    1500000,
    '2022-10-11 11:13:03',
    '2022-10-11 11:13:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    153,
    19,
    2,
    1250000,
    0,
    1250000,
    '2022-10-11 11:17:04',
    '2022-10-11 11:17:52'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    154,
    30,
    4,
    9000000,
    0,
    6000000,
    '2022-10-22 12:25:48',
    '2023-01-07 13:56:46'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    155,
    37,
    17,
    9000000,
    0,
    8850000,
    '2022-11-03 09:25:44',
    '2023-06-23 10:13:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    156,
    61,
    18,
    500000,
    0,
    500000,
    '2022-11-14 09:36:26',
    '2022-11-14 09:36:53'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    157,
    31,
    4,
    9000000,
    0,
    6500000,
    '2022-11-21 13:58:16',
    '2022-11-21 14:07:37'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    158,
    1,
    14,
    3500000,
    0,
    3500000,
    '2022-12-15 12:31:27',
    '2023-01-10 09:10:30'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    159,
    11,
    14,
    6250000,
    0,
    6250000,
    '2022-12-19 11:12:27',
    '2023-05-22 09:28:17'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    160,
    11,
    17,
    6250000,
    0,
    6250000,
    '2022-12-19 11:14:23',
    '2023-02-14 14:58:42'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    161,
    45,
    4,
    9000000,
    0,
    1500000,
    '2022-12-19 13:32:05',
    '2022-12-19 13:34:02'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    162,
    19,
    19,
    700000,
    0,
    0,
    '2023-01-04 12:01:24',
    '2023-01-04 12:01:24'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    163,
    16,
    19,
    700000,
    0,
    0,
    '2023-01-04 12:01:24',
    '2023-01-04 12:01:24'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    164,
    15,
    19,
    700000,
    0,
    700000,
    '2023-01-04 12:01:24',
    '2023-01-09 08:34:31'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    165,
    12,
    19,
    700000,
    0,
    700000,
    '2023-01-04 12:01:24',
    '2023-01-09 08:36:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    166,
    11,
    19,
    700000,
    0,
    700000,
    '2023-01-04 12:01:24',
    '2023-01-09 08:10:25'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    167,
    10,
    19,
    700000,
    0,
    700000,
    '2023-01-04 12:01:24',
    '2023-01-09 08:33:28'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    168,
    9,
    19,
    700000,
    0,
    700000,
    '2023-01-04 12:01:24',
    '2023-01-05 10:20:50'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    169,
    1,
    19,
    700000,
    0,
    700000,
    '2023-01-04 12:01:24',
    '2023-01-10 09:10:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    170,
    6,
    19,
    700000,
    0,
    0,
    '2023-01-04 12:01:24',
    '2023-01-04 12:01:24'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    171,
    5,
    19,
    700000,
    0,
    700000,
    '2023-01-04 12:01:24',
    '2023-01-09 08:32:12'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    172,
    4,
    19,
    700000,
    0,
    700000,
    '2023-01-04 12:01:24',
    '2023-01-09 08:35:41'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    173,
    3,
    19,
    700000,
    0,
    700000,
    '2023-01-04 12:01:24',
    '2023-01-10 09:12:06'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    174,
    2,
    19,
    700000,
    0,
    700000,
    '2023-01-04 12:01:24',
    '2023-01-04 12:02:24'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    175,
    18,
    20,
    150000,
    0,
    150000,
    '2023-01-06 09:37:41',
    '2023-01-06 09:38:36'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    176,
    48,
    20,
    150000,
    0,
    150000,
    '2023-01-06 09:37:41',
    '2023-01-09 11:44:05'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    177,
    47,
    20,
    150000,
    0,
    0,
    '2023-01-06 09:37:41',
    '2023-01-06 09:37:41'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    178,
    24,
    20,
    150000,
    0,
    150000,
    '2023-01-06 09:37:41',
    '2023-01-09 08:41:22'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    179,
    25,
    20,
    150000,
    0,
    150000,
    '2023-01-06 09:37:41',
    '2023-01-09 12:11:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    180,
    57,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-07 13:51:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    181,
    22,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-09 11:40:21'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    182,
    56,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-07 14:13:24'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    183,
    17,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-09 08:15:18'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    184,
    55,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-09 11:55:30'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    185,
    54,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-09 08:39:02'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    186,
    51,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-09 10:19:14'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    187,
    50,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-09 09:08:54'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    188,
    49,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-07 14:06:31'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    189,
    34,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-09 08:12:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    190,
    7,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-07 13:59:58'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    191,
    30,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-07 13:56:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    192,
    21,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-07 14:15:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    193,
    46,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-07 14:11:23'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    194,
    45,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-07 14:17:36'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    195,
    44,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-07 09:47:01'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    196,
    43,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-09 08:44:42'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    197,
    20,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-09 08:13:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    198,
    14,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-07 14:18:40'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    199,
    42,
    20,
    150000,
    0,
    0,
    '2023-01-07 09:44:43',
    '2023-01-07 09:44:43'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    200,
    41,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-09 09:04:37'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    201,
    40,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-07 09:52:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    202,
    39,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-07 09:45:05'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    203,
    37,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-09 09:12:41'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    204,
    36,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-07 14:14:27'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    205,
    35,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-09 08:47:55'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    206,
    33,
    20,
    150000,
    0,
    0,
    '2023-01-07 09:44:43',
    '2023-01-07 09:44:43'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    207,
    32,
    20,
    150000,
    0,
    0,
    '2023-01-07 09:44:43',
    '2023-01-07 09:44:43'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    208,
    31,
    20,
    150000,
    0,
    0,
    '2023-01-07 09:44:43',
    '2023-01-07 09:44:43'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    209,
    23,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-09 08:50:00'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    210,
    8,
    20,
    150000,
    0,
    150000,
    '2023-01-07 09:44:43',
    '2023-01-09 10:26:52'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    211,
    13,
    20,
    150000,
    0,
    0,
    '2023-01-07 09:44:43',
    '2023-01-07 09:44:43'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    212,
    44,
    2,
    6000000,
    0,
    0,
    '2023-01-07 09:48:27',
    '2023-01-07 09:48:27'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    213,
    44,
    4,
    6000000,
    0,
    6000000,
    '2023-01-07 09:50:04',
    '2023-01-07 09:50:31'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    214,
    57,
    4,
    9000000,
    0,
    4000000,
    '2023-01-07 13:50:45',
    '2023-01-07 13:51:09'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    215,
    62,
    20,
    150000,
    0,
    150000,
    '2023-01-07 14:03:27',
    '2023-01-07 14:03:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    216,
    49,
    4,
    9000000,
    0,
    6000000,
    '2023-01-07 14:05:51',
    '2023-01-07 14:06:18'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    217,
    29,
    20,
    150000,
    0,
    150000,
    '2023-01-07 14:27:18',
    '2023-01-07 14:27:33'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    218,
    63,
    4,
    9000000,
    0,
    6000000,
    '2023-01-07 14:42:26',
    '2023-01-07 14:43:23'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    219,
    63,
    20,
    150000,
    0,
    150000,
    '2023-01-07 14:42:50',
    '2023-01-07 14:43:34'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    220,
    54,
    4,
    9000000,
    0,
    3000000,
    '2023-01-09 08:38:45',
    '2023-01-09 08:39:21'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    221,
    43,
    4,
    9000000,
    0,
    6000000,
    '2023-01-09 08:44:14',
    '2023-01-09 08:44:56'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    222,
    51,
    4,
    9000000,
    0,
    9000000,
    '2023-01-09 10:20:11',
    '2023-01-09 10:25:05'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    223,
    35,
    4,
    9000000,
    0,
    6000000,
    '2023-01-09 11:48:43',
    '2023-04-10 11:48:45'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    224,
    55,
    4,
    9000000,
    0,
    6000000,
    '2023-01-09 11:54:42',
    '2023-01-09 11:55:13'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    225,
    64,
    4,
    7500000,
    0,
    5000000,
    '2023-01-09 11:59:38',
    '2023-01-09 12:00:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    226,
    64,
    20,
    150000,
    0,
    150000,
    '2023-01-09 12:00:02',
    '2023-01-09 12:00:30'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    227,
    25,
    7,
    500000,
    0,
    350000,
    '2023-01-09 12:46:09',
    '2023-01-09 12:46:35'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    228,
    61,
    21,
    2885000,
    0,
    2885000,
    '2023-01-10 08:33:44',
    '2023-01-13 13:12:30'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    229,
    38,
    21,
    2885000,
    0,
    2885000,
    '2023-01-10 08:33:44',
    '2023-01-10 11:47:50'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    230,
    65,
    21,
    2885000,
    0,
    2885000,
    '2023-01-10 08:37:24',
    '2023-01-10 08:37:46'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    231,
    64,
    17,
    7500000,
    0,
    0,
    '2023-01-10 09:21:57',
    '2023-01-10 09:21:57'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    232,
    18,
    17,
    6750000,
    0,
    6750000,
    '2023-01-10 09:21:57',
    '2023-08-04 14:05:03'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    233,
    48,
    17,
    7500000,
    0,
    5000000,
    '2023-01-10 09:21:57',
    '2023-06-13 15:02:28'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    234,
    47,
    17,
    7500000,
    0,
    0,
    '2023-01-10 09:21:57',
    '2023-01-10 09:21:57'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    235,
    24,
    17,
    7500000,
    0,
    7500000,
    '2023-01-10 09:21:57',
    '2023-09-13 11:11:30'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    236,
    25,
    17,
    7500000,
    0,
    4000000,
    '2023-01-10 09:21:57',
    '2023-07-28 13:06:22'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    237,
    66,
    21,
    2885000,
    0,
    2885000,
    '2023-01-10 11:53:01',
    '2023-01-10 11:53:20'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    238,
    67,
    21,
    2885000,
    0,
    2885000,
    '2023-01-13 13:19:59',
    '2023-01-13 13:20:20'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    239,
    68,
    21,
    2885000,
    0,
    2885000,
    '2023-01-14 07:21:04',
    '2023-01-14 07:22:40'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    240,
    68,
    22,
    2000000,
    0,
    1615000,
    '2023-01-14 07:22:04',
    '2023-01-14 07:23:37'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    241,
    69,
    21,
    2885000,
    0,
    2885000,
    '2023-01-14 12:51:48',
    '2023-01-14 12:52:05'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    242,
    22,
    17,
    9000000,
    0,
    9000000,
    '2023-01-25 09:16:48',
    '2023-06-23 10:08:29'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    243,
    70,
    23,
    9000000,
    0,
    2000000,
    '2023-01-26 20:31:10',
    '2023-01-26 20:31:46'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    244,
    71,
    23,
    9000000,
    0,
    8100000,
    '2023-01-31 10:49:36',
    '2023-05-18 17:28:43'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    245,
    38,
    24,
    700000,
    0,
    700000,
    '2023-02-01 10:39:48',
    '2023-02-01 10:40:56'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    246,
    38,
    25,
    2250000,
    0,
    2250000,
    '2023-02-01 10:40:34',
    '2023-02-01 10:41:08'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    247,
    72,
    23,
    9000000,
    0,
    2300000,
    '2023-02-01 11:21:53',
    '2023-02-01 11:22:12'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    248,
    73,
    23,
    9000000,
    0,
    3000000,
    '2023-02-01 14:35:39',
    '2023-02-01 14:36:01'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    249,
    66,
    24,
    700000,
    0,
    700000,
    '2023-02-02 11:36:16',
    '2023-02-02 11:36:52'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    250,
    66,
    25,
    2250000,
    0,
    2250000,
    '2023-02-02 11:36:35',
    '2023-02-02 11:37:03'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    251,
    30,
    17,
    9000000,
    0,
    9000000,
    '2023-02-09 12:51:29',
    '2023-06-19 10:22:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    252,
    45,
    17,
    9000000,
    0,
    9000000,
    '2023-02-09 12:54:05',
    '2023-06-23 10:15:08'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    253,
    68,
    24,
    700000,
    0,
    700000,
    '2023-02-10 10:07:17',
    '2023-02-10 10:07:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    254,
    68,
    25,
    2250000,
    0,
    2250000,
    '2023-02-10 10:07:37',
    '2023-02-10 10:08:14'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    255,
    74,
    23,
    9000000,
    0,
    0,
    '2023-02-10 11:06:34',
    '2023-02-10 11:07:41'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    256,
    75,
    23,
    8100000,
    0,
    8100000,
    '2023-02-10 11:06:45',
    '2023-05-24 13:43:01'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    257,
    56,
    17,
    9000000,
    0,
    9000000,
    '2023-02-10 13:30:12',
    '2023-06-22 09:32:17'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    258,
    34,
    17,
    8100000,
    0,
    8100000,
    '2023-02-13 09:24:54',
    '2023-06-24 08:32:41'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    259,
    20,
    17,
    8100000,
    0,
    8100000,
    '2023-02-13 09:25:22',
    '2023-05-18 17:42:57'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    260,
    49,
    17,
    9000000,
    0,
    6000000,
    '2023-02-13 09:25:50',
    '2023-06-24 10:31:32'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    261,
    36,
    17,
    9000000,
    0,
    9000000,
    '2023-02-13 09:26:05',
    '2023-06-22 09:30:29'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    262,
    8,
    17,
    9000000,
    0,
    9000000,
    '2023-02-13 09:51:17',
    '2023-06-24 08:29:02'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    263,
    57,
    17,
    9000000,
    0,
    7000000,
    '2023-02-13 09:53:38',
    '2023-06-23 10:50:06'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    264,
    14,
    17,
    9000000,
    0,
    9000000,
    '2023-02-13 10:01:53',
    '2023-06-24 08:47:08'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    265,
    44,
    17,
    9000000,
    0,
    8350000,
    '2023-02-13 10:05:26',
    '2023-07-11 09:54:18'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    266,
    55,
    17,
    9000000,
    0,
    3000000,
    '2023-02-13 10:14:31',
    '2023-02-13 10:16:08'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    267,
    46,
    17,
    9000000,
    0,
    9000000,
    '2023-02-13 10:47:31',
    '2023-06-24 10:52:33'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    268,
    43,
    17,
    9000000,
    0,
    9000000,
    '2023-02-13 11:39:01',
    '2023-05-02 10:30:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    269,
    63,
    17,
    9000000,
    0,
    9000000,
    '2023-02-13 11:45:09',
    '2023-06-23 15:24:54'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    270,
    29,
    17,
    9000000,
    0,
    9000000,
    '2023-02-13 11:48:48',
    '2023-02-13 11:49:14'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    271,
    51,
    17,
    9000000,
    0,
    9000000,
    '2023-02-15 10:05:44',
    '2023-06-26 08:51:35'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    272,
    50,
    17,
    9000000,
    0,
    9000000,
    '2023-02-15 10:06:00',
    '2023-06-23 10:10:35'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    273,
    21,
    17,
    9000000,
    0,
    9000000,
    '2023-02-15 12:38:29',
    '2023-05-12 10:45:21'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    274,
    41,
    17,
    9000000,
    0,
    4000000,
    '2023-02-15 13:07:01',
    '2023-06-19 11:28:48'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    275,
    31,
    17,
    9000000,
    0,
    9000000,
    '2023-02-15 14:09:49',
    '2023-06-19 14:48:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    276,
    54,
    17,
    9000000,
    0,
    9000000,
    '2023-02-16 08:45:03',
    '2023-06-23 10:06:06'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    277,
    17,
    17,
    9000000,
    0,
    9000000,
    '2023-02-20 09:52:16',
    '2023-05-08 09:28:27'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    278,
    76,
    23,
    8100000,
    0,
    5100000,
    '2023-02-20 11:08:54',
    '2023-02-20 11:13:14'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    279,
    77,
    23,
    8100000,
    0,
    8100000,
    '2023-02-20 13:51:36',
    '2023-02-20 13:52:13'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    280,
    79,
    23,
    9000000,
    0,
    9000000,
    '2023-02-23 13:04:25',
    '2023-05-25 16:30:20'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    281,
    78,
    23,
    9000000,
    0,
    6000000,
    '2023-02-23 13:04:37',
    '2023-02-23 13:07:31'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    282,
    80,
    23,
    9000000,
    0,
    5000000,
    '2023-02-24 15:58:03',
    '2023-09-11 13:30:00'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    283,
    81,
    23,
    8100000,
    0,
    3000000,
    '2023-02-24 16:01:59',
    '2023-02-24 16:02:25'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    284,
    82,
    26,
    5000000,
    0,
    5000000,
    '2023-02-24 16:09:43',
    '2023-03-30 12:50:54'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    285,
    83,
    26,
    5000000,
    0,
    5000000,
    '2023-02-24 16:09:54',
    '2023-04-11 09:32:54'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    286,
    84,
    23,
    9000000,
    0,
    3000000,
    '2023-02-24 16:14:03',
    '2023-02-24 16:14:23'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    287,
    85,
    26,
    5000000,
    0,
    5000000,
    '2023-02-24 16:18:37',
    '2023-05-12 13:09:02'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    288,
    86,
    23,
    9000000,
    0,
    9000000,
    '2023-02-24 16:23:06',
    '2023-05-30 13:29:12'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    289,
    87,
    23,
    9000000,
    0,
    9000000,
    '2023-02-24 16:25:55',
    '2023-08-18 14:28:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    290,
    88,
    23,
    9000000,
    0,
    3000000,
    '2023-02-25 10:21:27',
    '2023-02-25 10:21:49'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    291,
    89,
    23,
    9000000,
    0,
    500000,
    '2023-02-25 10:26:19',
    '2023-02-25 10:26:35'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    292,
    90,
    26,
    5000000,
    0,
    4000000,
    '2023-02-28 12:43:36',
    '2023-02-28 12:43:57'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    293,
    91,
    23,
    9000000,
    0,
    3000000,
    '2023-02-28 14:13:58',
    '2023-02-28 14:14:15'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    294,
    92,
    23,
    9000000,
    0,
    9000000,
    '2023-03-03 09:51:34',
    '2023-05-31 11:05:12'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    295,
    4,
    27,
    6250000,
    0,
    5750000,
    '2023-03-04 12:37:22',
    '2023-07-17 09:36:09'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    296,
    10,
    27,
    6250000,
    0,
    6250000,
    '2023-03-06 11:41:33',
    '2023-03-06 11:42:21'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    297,
    93,
    23,
    9000000,
    0,
    4000000,
    '2023-03-13 12:40:59',
    '2023-05-17 12:48:35'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    298,
    94,
    23,
    9000000,
    0,
    0,
    '2023-03-13 12:41:11',
    '2023-03-13 12:41:11'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    299,
    93,
    4,
    9000000,
    0,
    3000000,
    '2023-03-13 12:42:16',
    '2023-03-13 12:43:12'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    300,
    94,
    4,
    9000000,
    0,
    1000000,
    '2023-03-13 12:42:26',
    '2023-03-13 12:43:33'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    301,
    95,
    4,
    9000000,
    0,
    9000000,
    '2023-03-14 14:22:04',
    '2023-05-29 11:30:48'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    302,
    3,
    27,
    6250000,
    0,
    6250000,
    '2023-03-16 09:01:22',
    '2023-05-18 15:53:34'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    303,
    9,
    27,
    6250000,
    0,
    6250000,
    '2023-03-16 09:04:15',
    '2023-05-19 10:05:06'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    304,
    2,
    27,
    6250000,
    0,
    6250000,
    '2023-03-16 09:48:47',
    '2023-03-16 09:49:22'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    305,
    1,
    27,
    6250000,
    0,
    6250000,
    '2023-03-17 08:18:37',
    '2023-07-17 09:41:55'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    306,
    96,
    23,
    9000000,
    0,
    3000000,
    '2023-03-17 14:12:56',
    '2023-03-17 14:13:30'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    307,
    97,
    17,
    9000000,
    0,
    500000,
    '2023-03-17 21:54:33',
    '2023-03-17 21:55:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    308,
    15,
    27,
    6250000,
    0,
    5250000,
    '2023-03-18 11:09:46',
    '2023-05-31 10:42:02'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    309,
    98,
    26,
    5000000,
    0,
    2000000,
    '2023-03-30 12:47:12',
    '2023-03-30 12:53:02'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    310,
    62,
    23,
    9000000,
    0,
    0,
    '2023-04-10 11:51:37',
    '2023-04-10 11:51:37'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    311,
    62,
    4,
    9000000,
    0,
    5915000,
    '2023-04-10 11:52:54',
    '2023-07-13 11:32:31'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    312,
    23,
    17,
    9000000,
    0,
    6000000,
    '2023-04-10 11:56:32',
    '2023-07-06 10:50:13'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    313,
    73,
    7,
    500000,
    0,
    500000,
    '2023-04-11 11:58:16',
    '2023-04-11 11:58:45'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    314,
    69,
    25,
    2250000,
    0,
    2250000,
    '2023-04-11 13:18:10',
    '2023-04-11 13:20:05'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    315,
    99,
    4,
    8100000,
    0,
    8100000,
    '2023-04-14 10:33:58',
    '2023-08-16 08:38:31'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    316,
    69,
    28,
    6250000,
    0,
    5250000,
    '2023-05-08 15:47:12',
    '2023-06-20 12:16:06'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    317,
    67,
    28,
    6250000,
    0,
    4750000,
    '2023-05-08 15:47:12',
    '2023-07-21 13:42:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    318,
    66,
    28,
    6250000,
    0,
    0,
    '2023-05-08 15:47:12',
    '2023-05-08 15:47:12'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    319,
    65,
    28,
    6250000,
    0,
    0,
    '2023-05-08 15:47:12',
    '2023-05-08 15:47:12'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    320,
    61,
    28,
    6250000,
    0,
    4250000,
    '2023-05-08 15:47:12',
    '2023-05-08 15:47:44'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    321,
    38,
    28,
    6250000,
    0,
    0,
    '2023-05-08 15:47:12',
    '2023-05-08 15:47:12'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    322,
    100,
    23,
    9000000,
    0,
    9000000,
    '2023-05-12 09:34:37',
    '2023-05-31 15:23:48'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    323,
    100,
    29,
    500000,
    0,
    500000,
    '2023-05-12 09:36:20',
    '2023-05-12 09:36:48'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    324,
    85,
    29,
    500000,
    0,
    500000,
    '2023-05-12 13:07:37',
    '2023-05-12 13:09:13'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    325,
    83,
    29,
    500000,
    0,
    500000,
    '2023-05-12 14:00:13',
    '2023-05-12 14:00:32'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    326,
    90,
    29,
    500000,
    0,
    500000,
    '2023-05-12 14:02:12',
    '2023-05-12 14:02:52'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    327,
    101,
    29,
    500000,
    0,
    500000,
    '2023-05-12 15:33:37',
    '2023-05-12 15:33:50'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    328,
    5,
    27,
    6250000,
    0,
    6250000,
    '2023-05-17 13:10:01',
    '2023-07-17 09:26:09'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    329,
    71,
    29,
    500000,
    0,
    500000,
    '2023-05-18 17:28:24',
    '2023-05-18 17:28:54'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    330,
    12,
    27,
    6250000,
    0,
    5500000,
    '2023-05-18 17:40:56',
    '2023-07-22 15:30:12'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    331,
    69,
    30,
    3170000,
    0,
    0,
    '2023-05-19 10:39:17',
    '2023-05-19 10:39:17'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    332,
    67,
    30,
    3170000,
    0,
    3170000,
    '2023-05-19 10:39:17',
    '2023-07-21 13:40:45'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    333,
    66,
    30,
    3170000,
    0,
    3170000,
    '2023-05-19 10:39:17',
    '2023-05-19 10:40:09'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    334,
    65,
    30,
    3170000,
    0,
    0,
    '2023-05-19 10:39:17',
    '2023-05-19 10:39:17'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    335,
    61,
    30,
    3170000,
    0,
    3170000,
    '2023-05-19 10:39:17',
    '2023-05-24 15:34:13'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    336,
    38,
    30,
    3170000,
    0,
    3170000,
    '2023-05-19 10:39:17',
    '2023-05-19 13:14:34'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    337,
    19,
    27,
    6250000,
    0,
    5250000,
    '2023-05-22 09:24:06',
    '2023-07-17 09:14:14'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    338,
    86,
    29,
    500000,
    0,
    500000,
    '2023-05-24 13:46:09',
    '2023-05-24 13:46:24'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    339,
    102,
    30,
    3170000,
    0,
    3170000,
    '2023-05-24 13:55:04',
    '2023-05-24 13:55:40'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    340,
    75,
    29,
    500000,
    0,
    500000,
    '2023-05-24 13:59:20',
    '2023-05-24 14:00:12'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    341,
    79,
    29,
    500000,
    0,
    500000,
    '2023-05-25 16:29:57',
    '2023-05-25 16:30:33'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    342,
    103,
    23,
    7500000,
    0,
    5000000,
    '2023-05-29 11:14:09',
    '2023-09-04 11:45:55'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    343,
    95,
    29,
    500000,
    0,
    500000,
    '2023-05-29 11:34:13',
    '2023-05-29 11:34:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    344,
    16,
    2,
    6250000,
    0,
    5750000,
    '2023-05-29 14:12:25',
    '2023-05-29 14:20:19'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    345,
    16,
    3,
    6250000,
    0,
    2250000,
    '2023-05-29 14:20:40',
    '2023-05-29 14:25:02'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    346,
    67,
    25,
    2250000,
    0,
    2250000,
    '2023-05-30 09:42:54',
    '2023-05-30 09:44:03'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    347,
    67,
    24,
    700000,
    0,
    700000,
    '2023-05-30 09:43:13',
    '2023-05-30 09:44:15'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    348,
    72,
    29,
    500000,
    0,
    500000,
    '2023-05-30 11:47:11',
    '2023-05-30 11:47:29'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    349,
    7,
    17,
    9000000,
    0,
    4500000,
    '2023-05-31 09:00:17',
    '2023-05-31 09:01:02'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    350,
    82,
    4,
    12000000,
    0,
    12000000,
    '2023-05-31 10:44:19',
    '2023-07-21 11:43:06'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    351,
    104,
    4,
    9000000,
    0,
    6000000,
    '2023-05-31 10:52:03',
    '2023-05-31 10:52:58'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    352,
    92,
    29,
    500000,
    0,
    500000,
    '2023-05-31 11:05:48',
    '2023-05-31 11:06:03'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    353,
    99,
    29,
    500000,
    0,
    500000,
    '2023-05-31 12:26:41',
    '2023-05-31 12:26:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    354,
    105,
    4,
    9000000,
    0,
    9000000,
    '2023-05-31 12:30:12',
    '2023-05-31 12:32:31'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    355,
    105,
    7,
    500000,
    0,
    500000,
    '2023-05-31 12:30:35',
    '2023-05-31 12:32:43'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    356,
    39,
    17,
    9000000,
    0,
    6000000,
    '2023-06-05 12:57:57',
    '2023-10-04 15:53:44'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    357,
    106,
    23,
    8550000,
    0,
    6000000,
    '2023-06-08 09:30:33',
    '2023-09-23 11:39:16'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    358,
    15,
    10,
    6250000,
    0,
    2750000,
    '2023-06-08 10:50:03',
    '2023-06-08 10:50:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    359,
    107,
    23,
    9000000,
    0,
    6000000,
    '2023-06-19 18:48:47',
    '2023-06-19 18:49:10'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    360,
    108,
    31,
    720000,
    0,
    720000,
    '2023-06-21 09:40:30',
    '2023-06-21 09:40:55'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    361,
    41,
    32,
    500000,
    0,
    0,
    '2023-06-22 09:41:22',
    '2023-06-22 09:41:22'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    362,
    63,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-23 15:25:14'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    363,
    29,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-26 08:49:34'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    364,
    62,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-07-13 11:29:33'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    365,
    7,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-23 09:53:08'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    366,
    57,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-26 09:52:21'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    367,
    22,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-23 10:08:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    368,
    56,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-26 08:54:10'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    369,
    17,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-22 09:41:56'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    370,
    55,
    32,
    500000,
    0,
    0,
    '2023-06-22 09:41:22',
    '2023-06-22 09:41:22'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    371,
    54,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-24 08:45:21'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    372,
    51,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-24 08:23:32'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    373,
    50,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-23 10:10:44'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    374,
    49,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-24 10:31:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    375,
    34,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-24 08:32:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    376,
    30,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-23 10:04:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    377,
    21,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-07-06 16:05:28'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    378,
    46,
    32,
    500000,
    0,
    0,
    '2023-06-22 09:41:22',
    '2023-06-22 09:41:22'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    379,
    45,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-23 10:15:18'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    380,
    44,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-26 08:55:13'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    381,
    43,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-24 08:33:56'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    382,
    20,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-24 08:20:19'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    383,
    14,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-24 08:47:17'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    384,
    42,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-24 12:11:39'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    385,
    40,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-24 10:33:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    386,
    39,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-24 08:25:02'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    387,
    37,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-23 10:14:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    388,
    36,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-27 09:02:45'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    389,
    35,
    32,
    500000,
    0,
    0,
    '2023-06-22 09:41:22',
    '2023-06-22 09:41:22'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    390,
    33,
    32,
    500000,
    0,
    0,
    '2023-06-22 09:41:22',
    '2023-06-22 09:41:22'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    391,
    32,
    32,
    500000,
    0,
    0,
    '2023-06-22 09:41:22',
    '2023-06-22 09:41:22'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    392,
    31,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-07-10 13:57:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    393,
    23,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-07-06 10:50:27'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    394,
    8,
    32,
    500000,
    0,
    500000,
    '2023-06-22 09:41:22',
    '2023-06-24 08:29:12'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    395,
    13,
    32,
    500000,
    0,
    0,
    '2023-06-22 09:41:22',
    '2023-06-22 09:41:22'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    396,
    7,
    33,
    1285000,
    0,
    1285000,
    '2023-06-23 09:52:03',
    '2023-06-23 09:53:35'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    397,
    109,
    23,
    9000000,
    0,
    3000000,
    '2023-06-23 11:00:08',
    '2023-06-23 11:08:17'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    398,
    63,
    33,
    1285000,
    0,
    1285000,
    '2023-06-23 15:23:38',
    '2023-06-23 15:27:01'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    399,
    20,
    33,
    1285000,
    0,
    1285000,
    '2023-06-24 08:20:49',
    '2023-06-24 08:21:06'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    400,
    51,
    33,
    1285000,
    0,
    1285000,
    '2023-06-24 08:23:15',
    '2023-06-26 08:52:03'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    401,
    42,
    33,
    1285000,
    0,
    1285000,
    '2023-06-24 12:11:12',
    '2023-06-24 12:12:12'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    402,
    84,
    17,
    9000000,
    0,
    9000000,
    '2023-06-26 09:20:40',
    '2023-06-26 09:23:08'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    403,
    110,
    23,
    8550000,
    0,
    6000000,
    '2023-06-26 10:56:26',
    '2023-07-10 10:29:49'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    404,
    38,
    31,
    720000,
    0,
    720000,
    '2023-06-26 11:59:38',
    '2023-06-26 12:01:15'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    405,
    111,
    31,
    720000,
    0,
    720000,
    '2023-06-26 12:00:51',
    '2023-06-26 12:02:10'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    406,
    112,
    23,
    9000000,
    0,
    3000000,
    '2023-06-26 12:50:23',
    '2023-06-26 12:50:49'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    407,
    113,
    33,
    1285000,
    0,
    1285000,
    '2023-06-27 09:40:21',
    '2023-06-27 09:42:23'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    408,
    113,
    32,
    500000,
    0,
    500000,
    '2023-06-27 09:40:44',
    '2023-06-27 09:41:19'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    409,
    93,
    17,
    9000000,
    0,
    7000000,
    '2023-07-05 14:26:43',
    '2023-07-05 14:27:35'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    410,
    78,
    17,
    9000000,
    0,
    9000000,
    '2023-07-05 14:33:38',
    '2023-07-05 14:36:33'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    411,
    14,
    33,
    1285000,
    0,
    1285000,
    '2023-07-05 15:34:41',
    '2023-07-05 15:36:30'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    412,
    77,
    34,
    1500000,
    0,
    1500000,
    '2023-07-05 16:10:02',
    '2023-07-05 16:11:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    413,
    77,
    17,
    9000000,
    0,
    9000000,
    '2023-07-05 16:11:06',
    '2023-09-06 13:52:03'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    414,
    73,
    17,
    9000000,
    0,
    9000000,
    '2023-07-06 07:18:17',
    '2023-08-04 15:03:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    415,
    114,
    23,
    9000000,
    0,
    5000000,
    '2023-07-06 07:55:20',
    '2023-07-06 07:55:39'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    416,
    79,
    17,
    9000000,
    0,
    9000000,
    '2023-07-06 07:58:21',
    '2023-08-02 09:24:43'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    417,
    71,
    17,
    9000000,
    0,
    9000000,
    '2023-07-06 08:00:53',
    '2023-08-04 08:56:32'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    418,
    92,
    17,
    9000000,
    0,
    3400000,
    '2023-07-06 08:02:53',
    '2023-08-02 09:52:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    419,
    115,
    7,
    500000,
    0,
    500000,
    '2023-07-06 08:06:14',
    '2023-07-06 08:06:31'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    420,
    17,
    33,
    1285000,
    0,
    1285000,
    '2023-07-10 10:53:55',
    '2023-07-10 11:00:19'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    421,
    71,
    34,
    1500000,
    0,
    1500000,
    '2023-07-10 11:04:38',
    '2023-07-10 11:05:01'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    422,
    40,
    33,
    1285000,
    0,
    1285000,
    '2023-07-10 13:12:21',
    '2023-07-10 13:13:01'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    423,
    54,
    33,
    1285000,
    0,
    1285000,
    '2023-07-10 13:12:43',
    '2023-07-10 13:14:29'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    424,
    31,
    33,
    1285000,
    0,
    1285000,
    '2023-07-10 13:56:56',
    '2023-07-10 13:57:13'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    425,
    50,
    33,
    1285000,
    0,
    1285000,
    '2023-07-10 15:08:08',
    '2023-07-10 15:09:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    426,
    37,
    33,
    1285000,
    0,
    1285000,
    '2023-07-10 15:08:25',
    '2023-07-10 15:12:50'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    427,
    45,
    33,
    1285000,
    0,
    1285000,
    '2023-07-10 15:08:42',
    '2023-07-10 15:15:54'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    428,
    30,
    33,
    1285000,
    0,
    1285000,
    '2023-07-10 15:09:02',
    '2023-07-10 15:17:08'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    429,
    56,
    33,
    1285000,
    0,
    1285000,
    '2023-07-10 15:18:30',
    '2023-07-10 15:19:58'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    430,
    36,
    33,
    1285000,
    0,
    1285000,
    '2023-07-10 15:18:47',
    '2023-07-10 15:21:43'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    431,
    57,
    33,
    1285000,
    0,
    1285000,
    '2023-07-10 15:19:00',
    '2023-07-10 15:22:37'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    432,
    43,
    33,
    1285000,
    0,
    1285000,
    '2023-07-10 15:19:27',
    '2023-07-10 15:23:41'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    433,
    46,
    33,
    1285000,
    0,
    1285000,
    '2023-07-10 15:19:41',
    '2023-07-10 15:25:06'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    434,
    73,
    34,
    1500000,
    0,
    1500000,
    '2023-07-10 15:28:59',
    '2023-07-10 15:29:13'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    435,
    29,
    33,
    1285000,
    0,
    1285000,
    '2023-07-11 09:20:20',
    '2023-07-11 09:20:49'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    436,
    44,
    33,
    1285000,
    0,
    1285000,
    '2023-07-11 09:52:02',
    '2023-07-11 09:52:17'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    437,
    117,
    23,
    9000000,
    0,
    4500000,
    '2023-07-11 12:29:46',
    '2023-10-04 15:46:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    438,
    34,
    33,
    1285000,
    0,
    1285000,
    '2023-07-12 09:08:15',
    '2023-07-12 09:09:00'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    439,
    22,
    33,
    1285000,
    0,
    1285000,
    '2023-07-12 09:08:41',
    '2023-07-12 09:10:12'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    440,
    19,
    35,
    485000,
    0,
    485000,
    '2023-07-12 11:20:20',
    '2023-07-17 09:14:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    441,
    16,
    35,
    485000,
    0,
    0,
    '2023-07-12 11:20:20',
    '2023-07-12 11:20:20'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    442,
    15,
    35,
    485000,
    0,
    485000,
    '2023-07-12 11:20:20',
    '2023-07-12 11:21:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    443,
    12,
    35,
    485000,
    0,
    485000,
    '2023-07-12 11:20:20',
    '2023-07-17 09:39:07'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    444,
    11,
    35,
    485000,
    0,
    485000,
    '2023-07-12 11:20:20',
    '2023-07-17 09:40:24'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    445,
    10,
    35,
    485000,
    0,
    485000,
    '2023-07-12 11:20:20',
    '2023-07-17 08:32:15'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    446,
    9,
    35,
    485000,
    0,
    485000,
    '2023-07-12 11:20:20',
    '2023-07-17 09:38:02'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    447,
    1,
    35,
    485000,
    0,
    485000,
    '2023-07-12 11:20:20',
    '2023-07-17 08:55:14'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    448,
    6,
    35,
    485000,
    0,
    0,
    '2023-07-12 11:20:20',
    '2023-07-12 11:20:20'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    449,
    5,
    35,
    485000,
    0,
    485000,
    '2023-07-12 11:20:20',
    '2023-07-17 09:18:18'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    450,
    4,
    35,
    485000,
    0,
    485000,
    '2023-07-12 11:20:20',
    '2023-07-17 09:35:33'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    451,
    3,
    35,
    485000,
    0,
    485000,
    '2023-07-12 11:20:20',
    '2023-07-17 08:56:11'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    452,
    2,
    35,
    485000,
    0,
    485000,
    '2023-07-12 11:20:20',
    '2023-07-17 09:17:20'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    453,
    61,
    31,
    720000,
    0,
    720000,
    '2023-07-12 12:08:45',
    '2023-07-12 12:12:55'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    454,
    118,
    31,
    720000,
    0,
    720000,
    '2023-07-12 12:11:41',
    '2023-07-12 12:12:08'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    455,
    84,
    34,
    1500000,
    0,
    1500000,
    '2023-07-12 12:37:30',
    '2023-07-12 12:37:45'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    456,
    8,
    33,
    1285000,
    0,
    1285000,
    '2023-07-13 09:18:44',
    '2023-07-13 09:19:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    457,
    41,
    33,
    1285000,
    0,
    1285000,
    '2023-07-13 11:21:11',
    '2023-07-13 11:21:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    458,
    21,
    33,
    1285000,
    0,
    1285000,
    '2023-07-13 11:24:08',
    '2023-07-13 11:24:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    459,
    62,
    33,
    1285000,
    0,
    1285000,
    '2023-07-13 11:30:25',
    '2023-07-13 11:31:22'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    460,
    39,
    33,
    1285000,
    0,
    1285000,
    '2023-07-13 11:38:13',
    '2023-07-13 11:38:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    461,
    72,
    17,
    9000000,
    0,
    9000000,
    '2023-07-13 13:29:40',
    '2023-08-19 12:12:48'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    462,
    115,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    463,
    113,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    464,
    41,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    465,
    63,
    36,
    9000000,
    0,
    1500000,
    '2023-07-14 10:57:38',
    '2023-09-13 09:29:01'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    466,
    29,
    36,
    9000000,
    0,
    9000000,
    '2023-07-14 10:57:38',
    '2023-09-20 15:47:32'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    467,
    62,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    468,
    7,
    36,
    9000000,
    0,
    4000000,
    '2023-07-14 10:57:38',
    '2023-09-13 10:09:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    469,
    57,
    36,
    9000000,
    0,
    2000000,
    '2023-07-14 10:57:38',
    '2023-10-09 11:45:14'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    470,
    22,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    471,
    56,
    36,
    9000000,
    0,
    3000000,
    '2023-07-14 10:57:38',
    '2023-09-23 10:25:37'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    472,
    17,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    473,
    55,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    474,
    54,
    36,
    9000000,
    0,
    1000000,
    '2023-07-14 10:57:38',
    '2023-10-02 11:16:32'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    475,
    51,
    36,
    9000000,
    0,
    3000000,
    '2023-07-14 10:57:38',
    '2023-10-06 13:24:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    476,
    50,
    36,
    9000000,
    0,
    2000000,
    '2023-07-14 10:57:38',
    '2023-09-15 13:08:32'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    477,
    49,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    478,
    34,
    36,
    9000000,
    0,
    2500000,
    '2023-07-14 10:57:38',
    '2023-09-11 09:19:40'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    479,
    30,
    36,
    9000000,
    0,
    3000000,
    '2023-07-14 10:57:38',
    '2023-09-11 09:16:33'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    480,
    21,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    481,
    46,
    36,
    9000000,
    0,
    2500000,
    '2023-07-14 10:57:38',
    '2023-10-04 12:58:35'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    482,
    45,
    36,
    9000000,
    0,
    3000000,
    '2023-07-14 10:57:38',
    '2023-09-13 14:19:02'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    483,
    44,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    484,
    43,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    485,
    20,
    36,
    8100000,
    0,
    8100000,
    '2023-07-14 10:57:38',
    '2023-07-14 11:00:06'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    486,
    14,
    36,
    9000000,
    0,
    3500000,
    '2023-07-14 10:57:38',
    '2023-10-04 15:34:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    487,
    42,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    488,
    40,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    489,
    39,
    36,
    9000000,
    0,
    1500000,
    '2023-07-14 10:57:38',
    '2023-10-04 15:54:02'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    490,
    37,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    491,
    36,
    36,
    9000000,
    0,
    3000000,
    '2023-07-14 10:57:38',
    '2023-09-29 10:12:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    492,
    35,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    493,
    33,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    494,
    32,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    495,
    31,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    496,
    23,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    497,
    8,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    498,
    13,
    36,
    9000000,
    0,
    0,
    '2023-07-14 10:57:38',
    '2023-07-14 10:57:38'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    499,
    115,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    500,
    113,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    501,
    41,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    502,
    63,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    503,
    29,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    504,
    62,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    505,
    7,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    506,
    57,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    507,
    22,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    508,
    56,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    509,
    17,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    510,
    55,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    511,
    54,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    512,
    51,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    513,
    50,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    514,
    49,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    515,
    34,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    516,
    30,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    517,
    21,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    518,
    46,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    519,
    45,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    520,
    44,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    521,
    43,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    522,
    20,
    37,
    8100000,
    0,
    8100000,
    '2023-07-14 10:58:04',
    '2023-07-14 11:00:18'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    523,
    14,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    524,
    42,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    525,
    40,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    526,
    39,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    527,
    37,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    528,
    36,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    529,
    35,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    530,
    33,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    531,
    32,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    532,
    31,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    533,
    23,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    534,
    8,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    535,
    13,
    37,
    9000000,
    0,
    0,
    '2023-07-14 10:58:04',
    '2023-07-14 10:58:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    536,
    100,
    34,
    1500000,
    0,
    1500000,
    '2023-07-15 09:10:16',
    '2023-07-15 09:10:34'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    538,
    5,
    39,
    6250000,
    0,
    456500,
    '2023-07-17 09:28:09',
    '2023-07-17 09:29:14'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    539,
    119,
    34,
    1500000,
    0,
    1500000,
    '2023-07-17 12:59:49',
    '2023-07-17 13:00:17'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    540,
    92,
    34,
    1500000,
    0,
    1500000,
    '2023-07-17 13:31:09',
    '2023-07-17 13:31:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    541,
    79,
    34,
    1500000,
    0,
    1500000,
    '2023-07-18 10:07:43',
    '2023-07-18 10:08:43'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    542,
    99,
    34,
    1500000,
    0,
    1500000,
    '2023-07-20 11:54:47',
    '2023-07-20 11:55:10'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    543,
    72,
    34,
    1500000,
    0,
    1500000,
    '2023-07-20 12:23:11',
    '2023-07-20 12:23:39'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    544,
    120,
    23,
    9000000,
    0,
    3000000,
    '2023-07-20 12:38:15',
    '2023-07-20 12:40:27'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    545,
    75,
    17,
    9000000,
    0,
    9000000,
    '2023-07-21 09:17:18',
    '2023-08-19 11:58:14'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    546,
    121,
    17,
    12000000,
    0,
    12000000,
    '2023-07-21 10:29:18',
    '2023-07-21 10:36:27'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    547,
    121,
    4,
    12000000,
    0,
    12000000,
    '2023-07-21 10:37:00',
    '2023-07-21 10:39:12'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    549,
    121,
    40,
    5000000,
    0,
    5000000,
    '2023-07-21 10:41:39',
    '2023-07-21 10:43:08'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    550,
    82,
    17,
    12000000,
    0,
    12000000,
    '2023-07-21 11:41:45',
    '2023-08-05 09:48:39'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    551,
    122,
    34,
    1500000,
    0,
    1500000,
    '2023-07-21 13:31:02',
    '2023-07-21 13:31:21'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    552,
    67,
    31,
    720000,
    0,
    720000,
    '2023-07-21 13:41:18',
    '2023-07-21 13:41:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    553,
    69,
    24,
    700000,
    0,
    700000,
    '2023-07-21 13:46:54',
    '2023-07-21 13:47:34'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    554,
    69,
    31,
    720000,
    0,
    720000,
    '2023-07-21 13:47:18',
    '2023-07-21 13:47:46'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    555,
    85,
    4,
    10800000,
    0,
    10800000,
    '2023-07-21 14:57:09',
    '2023-07-21 14:58:56'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    556,
    83,
    4,
    12000000,
    0,
    2000000,
    '2023-07-21 15:08:34',
    '2023-07-21 15:09:23'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    557,
    83,
    17,
    12000000,
    0,
    12000000,
    '2023-07-21 15:08:54',
    '2023-08-05 09:35:02'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    558,
    123,
    7,
    500000,
    0,
    0,
    '2023-07-21 16:56:48',
    '2023-07-21 16:56:48'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    559,
    124,
    34,
    1500000,
    0,
    1500000,
    '2023-07-22 11:31:04',
    '2023-07-22 11:31:22'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    560,
    66,
    31,
    720000,
    0,
    720000,
    '2023-07-26 09:17:23',
    '2023-07-26 09:17:42'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    561,
    93,
    34,
    1500000,
    0,
    1500000,
    '2023-07-26 10:08:07',
    '2023-07-26 10:08:30'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    562,
    125,
    23,
    9000000,
    0,
    3000000,
    '2023-07-31 08:37:35',
    '2023-07-31 08:38:36'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    563,
    126,
    23,
    9000000,
    0,
    3000000,
    '2023-07-31 12:41:34',
    '2023-07-31 12:42:05'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    564,
    127,
    23,
    8100000,
    0,
    3500000,
    '2023-07-31 12:46:41',
    '2023-07-31 12:47:03'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    565,
    86,
    17,
    9000000,
    0,
    9000000,
    '2023-08-01 10:44:29',
    '2023-08-04 15:01:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    566,
    86,
    34,
    1500000,
    0,
    1500000,
    '2023-08-01 10:44:56',
    '2023-08-01 10:45:37'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    567,
    128,
    23,
    9000000,
    0,
    6000000,
    '2023-08-02 15:32:26',
    '2023-10-02 14:15:45'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    568,
    95,
    17,
    9000000,
    0,
    5000000,
    '2023-08-03 09:58:24',
    '2023-08-03 09:58:56'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    569,
    129,
    17,
    9000000,
    0,
    7000000,
    '2023-08-04 15:11:32',
    '2023-08-25 10:59:30'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    570,
    85,
    17,
    12000000,
    0,
    10800000,
    '2023-08-05 09:37:34',
    '2023-08-16 13:05:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    571,
    130,
    17,
    9000000,
    0,
    9000000,
    '2023-08-05 12:23:50',
    '2023-08-05 12:27:01'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    572,
    131,
    23,
    9000000,
    0,
    3000000,
    '2023-08-08 14:21:46',
    '2023-08-08 14:22:18'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    573,
    99,
    17,
    9000000,
    0,
    2400000,
    '2023-08-16 08:41:16',
    '2023-09-09 10:56:49'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    574,
    87,
    17,
    9000000,
    0,
    8000000,
    '2023-08-18 14:30:02',
    '2023-08-18 14:31:15'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    575,
    91,
    17,
    9000000,
    0,
    9000000,
    '2023-08-19 11:39:18',
    '2023-08-19 11:39:46'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    576,
    91,
    34,
    1500000,
    0,
    1500000,
    '2023-08-19 11:40:11',
    '2023-08-19 11:40:48'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    577,
    119,
    17,
    9000000,
    0,
    3000000,
    '2023-08-22 11:44:58',
    '2023-08-22 11:45:21'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    578,
    132,
    23,
    7500000,
    0,
    2500000,
    '2023-08-22 13:54:59',
    '2023-08-22 13:55:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    579,
    133,
    23,
    9000000,
    0,
    3000000,
    '2023-08-23 09:24:11',
    '2023-08-23 09:25:03'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    580,
    76,
    17,
    9000000,
    0,
    4000000,
    '2023-08-23 14:04:23',
    '2023-08-23 14:05:05'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    581,
    81,
    17,
    9000000,
    0,
    9000000,
    '2023-08-23 15:59:30',
    '2023-08-23 16:00:46'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    582,
    81,
    34,
    1500000,
    0,
    1500000,
    '2023-08-23 16:01:15',
    '2023-08-23 16:01:42'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    583,
    3,
    39,
    6250000,
    0,
    2500000,
    '2023-08-24 09:03:04',
    '2023-08-24 09:03:29'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    584,
    100,
    17,
    9000000,
    0,
    4000000,
    '2023-08-24 09:52:10',
    '2023-08-24 09:52:29'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    585,
    115,
    17,
    9000000,
    0,
    6500000,
    '2023-08-24 09:57:49',
    '2023-08-24 09:58:10'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    586,
    134,
    17,
    9000000,
    0,
    4500000,
    '2023-08-25 10:04:14',
    '2023-08-25 10:05:00'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    587,
    134,
    34,
    1500000,
    0,
    1500000,
    '2023-08-25 10:04:36',
    '2023-08-25 10:05:13'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    588,
    135,
    34,
    1500000,
    0,
    500000,
    '2023-08-25 14:53:02',
    '2023-08-25 14:53:21'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    589,
    136,
    34,
    1500000,
    0,
    1500000,
    '2023-08-25 14:57:18',
    '2023-08-25 14:57:40'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    590,
    116,
    17,
    9000000,
    0,
    7000000,
    '2023-08-26 12:37:41',
    '2023-10-09 15:15:01'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    591,
    124,
    17,
    9000000,
    0,
    4000000,
    '2023-08-26 14:31:57',
    '2023-08-26 14:32:16'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    592,
    123,
    17,
    9000000,
    0,
    4500000,
    '2023-08-26 16:40:36',
    '2023-08-26 16:41:54'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    593,
    137,
    23,
    9000000,
    0,
    3000000,
    '2023-08-26 17:59:27',
    '2023-08-26 18:00:19'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    594,
    138,
    31,
    720000,
    0,
    720000,
    '2023-09-04 11:48:11',
    '2023-09-04 11:48:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    595,
    139,
    23,
    9000000,
    0,
    3000000,
    '2023-09-05 09:05:51',
    '2023-09-22 21:22:07'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    596,
    87,
    34,
    1500000,
    0,
    1500000,
    '2023-09-05 13:17:15',
    '2023-09-05 13:17:39'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    597,
    140,
    23,
    9000000,
    0,
    8000000,
    '2023-09-06 11:55:16',
    '2023-09-25 08:54:57'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    598,
    141,
    23,
    9000000,
    0,
    1500000,
    '2023-09-06 11:59:12',
    '2023-09-06 11:59:36'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    599,
    142,
    23,
    8100000,
    0,
    6000000,
    '2023-09-07 13:32:36',
    '2023-09-07 13:33:01'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    600,
    2,
    39,
    6250000,
    0,
    6250000,
    '2023-09-11 11:49:01',
    '2023-09-11 11:49:37'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    601,
    71,
    41,
    3000000,
    0,
    3000000,
    '2023-09-11 13:03:04',
    '2023-09-11 13:03:28'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    602,
    80,
    17,
    9000000,
    0,
    9000000,
    '2023-09-13 09:55:32',
    '2023-09-13 09:56:14'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    603,
    80,
    41,
    3000000,
    0,
    3000000,
    '2023-09-13 09:55:51',
    '2023-09-13 09:56:29'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    604,
    73,
    41,
    3000000,
    0,
    3000000,
    '2023-09-13 15:39:06',
    '2023-09-13 15:39:31'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    605,
    143,
    23,
    9000000,
    0,
    3000000,
    '2023-09-16 10:09:01',
    '2023-09-16 10:09:17'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    606,
    75,
    41,
    3000000,
    0,
    3000000,
    '2023-09-18 12:33:24',
    '2023-09-18 12:33:47'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    607,
    84,
    41,
    3000000,
    0,
    3000000,
    '2023-09-18 13:25:52',
    '2023-09-18 13:26:36'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    608,
    83,
    41,
    3000000,
    0,
    3000000,
    '2023-09-18 13:39:09',
    '2023-09-18 13:39:32'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    609,
    85,
    41,
    3000000,
    0,
    3000000,
    '2023-09-18 13:44:28',
    '2023-09-18 13:44:52'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    610,
    134,
    41,
    3000000,
    0,
    3000000,
    '2023-09-18 14:42:47',
    '2023-09-23 09:10:16'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    611,
    144,
    23,
    8100000,
    0,
    5000000,
    '2023-09-18 15:17:46',
    '2023-09-18 15:18:18'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    612,
    66,
    41,
    3000000,
    0,
    3000000,
    '2023-09-20 15:34:17',
    '2023-09-20 15:34:40'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    613,
    124,
    41,
    3000000,
    0,
    3000000,
    '2023-09-23 09:06:58',
    '2023-09-23 09:07:29'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    614,
    145,
    23,
    9000000,
    0,
    3000000,
    '2023-09-23 11:21:51',
    '2023-09-23 11:22:39'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    615,
    146,
    23,
    9000000,
    0,
    3000000,
    '2023-09-23 11:27:47',
    '2023-09-23 11:28:39'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    616,
    146,
    29,
    500000,
    0,
    500000,
    '2023-09-23 11:28:14',
    '2023-09-23 11:28:30'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    617,
    147,
    23,
    9000000,
    0,
    3000000,
    '2023-09-23 11:34:52',
    '2023-09-23 11:35:08'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    618,
    97,
    41,
    3000000,
    0,
    3000000,
    '2023-09-23 14:10:25',
    '2023-09-23 14:10:46'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    619,
    140,
    29,
    500000,
    0,
    500000,
    '2023-09-25 08:55:24',
    '2023-09-25 08:55:46'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    620,
    148,
    41,
    3000000,
    0,
    3000000,
    '2023-09-29 13:27:44',
    '2023-09-29 13:29:10'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    621,
    149,
    23,
    9000000,
    0,
    3000000,
    '2023-09-29 14:36:26',
    '2023-09-29 14:36:51'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    622,
    86,
    41,
    3000000,
    0,
    3000000,
    '2023-09-29 15:04:42',
    '2023-09-29 15:08:18'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    623,
    121,
    41,
    3000000,
    0,
    3000000,
    '2023-09-29 15:09:41',
    '2023-09-29 15:10:05'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    624,
    90,
    41,
    3000000,
    0,
    3000000,
    '2023-09-29 15:14:31',
    '2023-10-04 10:54:52'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    625,
    150,
    23,
    8100000,
    0,
    3000000,
    '2023-10-02 10:11:16',
    '2023-10-02 10:11:34'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    626,
    150,
    29,
    500000,
    0,
    500000,
    '2023-10-02 10:12:45',
    '2023-10-02 10:13:02'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    627,
    76,
    41,
    3000000,
    0,
    3000000,
    '2023-10-03 09:20:45',
    '2023-10-03 09:22:06'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    629,
    151,
    23,
    10000000,
    0,
    3000000,
    '2023-10-03 09:41:26',
    '2023-10-03 09:42:25'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    630,
    105,
    17,
    9000000,
    0,
    400000,
    '2023-10-04 08:38:19',
    '2023-10-04 08:38:59'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    631,
    82,
    41,
    3000000,
    0,
    1800000,
    '2023-10-04 08:40:48',
    '2023-10-04 08:46:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    632,
    79,
    41,
    3000000,
    0,
    3000000,
    '2023-10-04 08:49:19',
    '2023-10-04 08:49:42'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    633,
    92,
    41,
    3000000,
    0,
    3000000,
    '2023-10-04 08:52:29',
    '2023-10-04 08:52:56'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    634,
    152,
    23,
    9000000,
    0,
    0,
    '2023-10-04 10:30:34',
    '2023-10-04 10:30:34'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    635,
    152,
    29,
    2000000,
    0,
    2000000,
    '2023-10-04 10:30:53',
    '2023-10-04 10:31:13'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    636,
    143,
    29,
    2000000,
    0,
    500000,
    '2023-10-04 10:34:42',
    '2023-10-04 10:35:10'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    637,
    153,
    41,
    3000000,
    0,
    3000000,
    '2023-10-04 10:38:04',
    '2023-10-04 10:38:32'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    638,
    130,
    41,
    3000000,
    0,
    3000000,
    '2023-10-04 10:39:38',
    '2023-10-04 10:39:53'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    639,
    122,
    41,
    3000000,
    0,
    3000000,
    '2023-10-04 10:41:25',
    '2023-10-04 10:41:52'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    640,
    77,
    41,
    3000000,
    0,
    3000000,
    '2023-10-04 10:43:21',
    '2023-10-04 10:43:37'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    641,
    100,
    41,
    3000000,
    0,
    3000000,
    '2023-10-04 10:48:59',
    '2023-10-04 10:49:18'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    642,
    129,
    41,
    3000000,
    0,
    3000000,
    '2023-10-04 10:52:22',
    '2023-10-04 10:52:45'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    643,
    81,
    41,
    3000000,
    0,
    3000000,
    '2023-10-04 10:58:47',
    '2023-10-04 10:59:07'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    644,
    93,
    41,
    3000000,
    0,
    3000000,
    '2023-10-04 11:00:16',
    '2023-10-04 11:00:36'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    645,
    111,
    41,
    3000000,
    0,
    3000000,
    '2023-10-04 11:03:52',
    '2023-10-04 11:05:41'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    646,
    108,
    41,
    3000000,
    0,
    3000000,
    '2023-10-04 11:04:04',
    '2023-10-04 11:04:21'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    647,
    109,
    41,
    2000000,
    0,
    0,
    '2023-10-04 11:07:27',
    '2023-10-04 11:07:27'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    648,
    109,
    29,
    2000000,
    0,
    2000000,
    '2023-10-04 11:08:14',
    '2023-10-04 11:08:54'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    649,
    110,
    29,
    2000000,
    0,
    2000000,
    '2023-10-04 11:11:11',
    '2023-10-04 11:11:35'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    650,
    106,
    29,
    2000000,
    0,
    1000000,
    '2023-10-04 11:13:14',
    '2023-10-04 11:13:30'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    651,
    89,
    29,
    2000000,
    0,
    2000000,
    '2023-10-04 11:15:08',
    '2023-10-04 11:15:24'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    652,
    69,
    41,
    3000000,
    0,
    3000000,
    '2023-10-04 12:52:50',
    '2023-10-04 12:53:09'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    653,
    117,
    29,
    2000000,
    0,
    2000000,
    '2023-10-04 15:45:23',
    '2023-10-04 15:46:04'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    654,
    139,
    29,
    2000000,
    0,
    1000000,
    '2023-10-05 10:46:21',
    '2023-10-05 10:46:42'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    655,
    154,
    29,
    2000000,
    0,
    2000000,
    '2023-10-05 10:58:26',
    '2023-10-05 10:58:48'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    656,
    112,
    29,
    2000000,
    0,
    2000000,
    '2023-10-05 11:04:12',
    '2023-10-05 11:04:26'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    657,
    155,
    29,
    2000000,
    0,
    2000000,
    '2023-10-05 11:07:44',
    '2023-10-05 11:08:00'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    658,
    67,
    41,
    3000000,
    0,
    3000000,
    '2023-10-05 11:23:26',
    '2023-10-05 11:23:41'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    659,
    118,
    41,
    3000000,
    0,
    600000,
    '2023-10-05 11:31:54',
    '2023-10-05 11:32:21'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    660,
    136,
    41,
    3000000,
    0,
    3000000,
    '2023-10-05 15:21:46',
    '2023-10-05 15:22:02'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    661,
    95,
    41,
    3000000,
    0,
    3000000,
    '2023-10-06 09:21:35',
    '2023-10-06 09:21:57'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    662,
    156,
    29,
    500000,
    0,
    500000,
    '2023-10-09 09:50:08',
    '2023-10-09 09:50:31'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    663,
    103,
    29,
    500000,
    0,
    500000,
    '2023-10-09 09:52:54',
    '2023-10-09 09:53:17'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    664,
    157,
    29,
    2000000,
    0,
    1000000,
    '2023-10-09 10:22:55',
    '2023-10-09 10:26:25'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    665,
    138,
    41,
    3000000,
    0,
    3000000,
    '2023-10-09 11:25:48',
    '2023-10-09 11:26:09'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    666,
    11,
    27,
    6250000,
    0,
    5000000,
    '2023-10-09 14:50:19',
    '2023-10-09 14:50:37'
  );
INSERT INTO
  `bebas` (
    `bebas_id`,
    `student_student_id`,
    `payment_payment_id`,
    `bebas_bill`,
    `bebas_diskon`,
    `bebas_total_pay`,
    `bebas_input_date`,
    `bebas_last_update`
  )
VALUES
  (
    667,
    116,
    41,
    3000000,
    0,
    3000000,
    '2023-10-09 15:14:13',
    '2023-10-09 15:15:38'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: bebas_pay
# ------------------------------------------------------------

INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    2,
    12,
    '20220600002',
    4000000,
    '1',
    1,
    '2022-06-12',
    '2022-06-12 17:51:53'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    3,
    11,
    '20220600003',
    3250000,
    NULL,
    1,
    '2022-06-12',
    '2022-06-12 17:55:22'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    4,
    10,
    '20220600004',
    3250000,
    NULL,
    1,
    '2022-06-12',
    '2022-06-12 17:58:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    5,
    3,
    '20220600005',
    250000,
    NULL,
    1,
    '2022-06-12',
    '2022-06-12 17:59:35'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    6,
    9,
    '20220600006',
    6250000,
    NULL,
    1,
    '2022-06-12',
    '2022-06-12 17:59:50'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    7,
    8,
    '20220600007',
    5500000,
    NULL,
    1,
    '2022-06-12',
    '2022-06-12 18:00:53'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    8,
    13,
    '20220600008',
    5000000,
    'SMT 1',
    1,
    '2022-06-16',
    '2022-06-16 10:40:53'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    9,
    14,
    '20220600009',
    3000000,
    '1',
    1,
    '2022-06-18',
    '2022-06-18 17:08:57'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    10,
    15,
    '20220600010',
    700000,
    '1',
    1,
    '2022-06-20',
    '2022-06-20 09:03:45'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    11,
    16,
    '20220600012',
    700000,
    'uas smt 2',
    1,
    '2022-06-20',
    '2022-06-20 09:13:44'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    12,
    23,
    '20220600013',
    700000,
    NULL,
    1,
    '2022-06-20',
    '2022-06-20 09:23:15'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    13,
    22,
    '20220600014',
    700000,
    NULL,
    1,
    '2022-06-20',
    '2022-06-20 09:24:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    14,
    21,
    '20220600015',
    700000,
    NULL,
    1,
    '2022-06-20',
    '2022-06-20 09:24:58'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    15,
    20,
    '20220600016',
    700000,
    NULL,
    1,
    '2022-06-20',
    '2022-06-20 09:25:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    16,
    19,
    '20220600017',
    700000,
    NULL,
    1,
    '2022-06-20',
    '2022-06-20 09:26:48'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    17,
    18,
    '20220600018',
    700000,
    NULL,
    1,
    '2022-06-20',
    '2022-06-20 09:28:19'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    18,
    17,
    '20220600019',
    700000,
    NULL,
    1,
    '2022-06-20',
    '2022-06-20 09:29:20'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    19,
    24,
    '20220600020',
    3000000,
    '1',
    1,
    '2022-06-20',
    '2022-06-20 14:00:49'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    20,
    8,
    '20220600021',
    750000,
    'smt 2',
    1,
    '2022-06-21',
    '2022-06-21 08:53:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    21,
    25,
    '20220600022',
    1000000,
    '2',
    1,
    '2022-06-25',
    '2022-06-25 13:21:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    22,
    26,
    '20220600023',
    1000000,
    'SMT 2',
    1,
    '2022-06-27',
    '2022-06-27 09:49:43'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    23,
    27,
    '20220600024',
    700000,
    NULL,
    1,
    '2022-06-27',
    '2022-06-27 09:50:00'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    24,
    28,
    '20220600025',
    700000,
    NULL,
    1,
    '2022-06-27',
    '2022-06-27 15:11:38'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    25,
    29,
    '20220700026',
    1100000,
    NULL,
    1,
    '2022-07-01',
    '2022-07-01 09:39:28'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    26,
    30,
    '20220700027',
    1100000,
    NULL,
    1,
    '2022-07-01',
    '2022-07-01 09:40:10'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    27,
    32,
    '20220700028',
    1100000,
    NULL,
    1,
    '2022-07-04',
    '2022-07-04 10:17:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    28,
    31,
    '20220700029',
    1100000,
    NULL,
    1,
    '2022-07-04',
    '2022-07-04 10:17:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    29,
    33,
    '20220700030',
    1100000,
    NULL,
    1,
    '2022-07-04',
    '2022-07-04 13:38:27'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    30,
    34,
    '20220700031',
    6000000,
    '1',
    1,
    '2022-07-06',
    '2022-07-06 13:47:44'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    31,
    12,
    '20220700032',
    250000,
    NULL,
    1,
    '2022-07-07',
    '2022-07-07 12:56:11'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    32,
    35,
    '20220700033',
    1100000,
    NULL,
    1,
    '2022-07-07',
    '2022-07-07 12:57:19'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    33,
    36,
    '20220700034',
    1000000,
    '1',
    1,
    '2022-07-08',
    '2022-07-08 11:10:38'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    34,
    37,
    '20220700035',
    1100000,
    NULL,
    1,
    '2022-07-12',
    '2022-07-12 13:21:32'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    35,
    40,
    '20220700036',
    1100000,
    NULL,
    1,
    '2022-07-12',
    '2022-07-12 15:26:15'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    36,
    39,
    '20220700037',
    1100000,
    NULL,
    1,
    '2022-07-12',
    '2022-07-12 15:27:11'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    37,
    38,
    '20220700038',
    1100000,
    NULL,
    1,
    '2022-07-12',
    '2022-07-12 15:27:59'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    38,
    41,
    '20220700039',
    8100000,
    'SMT 1',
    1,
    '2022-07-18',
    '2022-07-18 11:12:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    39,
    42,
    '20220700040',
    2000000,
    NULL,
    1,
    '2022-07-18',
    '2022-07-18 11:17:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    41,
    48,
    '20220700042',
    3000000,
    'MERI- 1',
    1,
    '2022-07-20',
    '2022-07-20 15:06:23'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    42,
    49,
    '20220700043',
    1100000,
    'MERI- 1',
    1,
    '2022-07-20',
    '2022-07-20 15:11:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    43,
    13,
    '20220700044',
    4000000,
    'smt 1 - pembayaran 2',
    1,
    '2022-07-29',
    '2022-07-29 10:00:11'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    44,
    44,
    '20220700045',
    2000000,
    NULL,
    1,
    '2022-07-29',
    '2022-07-29 10:00:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    45,
    50,
    '20220800046',
    3000000,
    'cicil 1',
    1,
    '2022-08-02',
    '2022-08-02 09:24:58'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    46,
    51,
    '20220800047',
    1100000,
    NULL,
    1,
    '2022-08-02',
    '2022-08-02 10:28:56'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    47,
    52,
    '20220800048',
    3000000,
    'smt 1 -1',
    1,
    '2022-08-02',
    '2022-08-02 10:32:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    48,
    53,
    '20220800049',
    3000000,
    'SMT 1 - 1',
    1,
    '2022-08-09',
    '2022-08-09 13:19:06'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    49,
    54,
    '20220800050',
    6000000,
    'SMT 6',
    1,
    '2022-08-10',
    '2022-08-10 15:03:07'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    50,
    55,
    '20220800051',
    620000,
    'lunas',
    1,
    '2022-08-10',
    '2022-08-10 15:09:50'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    51,
    56,
    '20220800052',
    250000,
    'smt 6',
    1,
    '2022-08-11',
    '2022-08-11 12:05:40'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    52,
    57,
    '20220800053',
    5000000,
    'smt 1 - 2',
    1,
    '2022-08-15',
    '2022-08-15 10:30:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    53,
    58,
    '20220800054',
    3000000,
    '1',
    1,
    '2022-08-24',
    '2022-08-24 12:10:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    54,
    59,
    '20220800055',
    500000,
    'SMT 1-1',
    1,
    '2022-08-25',
    '2022-08-25 10:21:27'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    55,
    60,
    '20220800056',
    6250000,
    'SMT 5',
    1,
    '2022-08-29',
    '2022-08-29 12:23:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    56,
    61,
    '20220900057',
    3000000,
    'PEMBAYARAN 1',
    1,
    '2022-09-01',
    '2022-09-01 15:10:11'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    57,
    63,
    '20220900058',
    2000000,
    'LUNAS',
    1,
    '2022-09-03',
    '2022-09-03 12:46:17'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    58,
    62,
    '20220900059',
    1000000,
    'PEMBAYARAN 3',
    1,
    '2022-09-03',
    '2022-09-03 12:46:33'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    62,
    64,
    '20220900063',
    800000,
    'PEMBAYARAN 1',
    1,
    '2022-09-03',
    '2022-09-03 13:20:22'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    63,
    64,
    '20220900064',
    2200000,
    'TRANSFER VA',
    1,
    '2022-09-03',
    '2022-09-03 13:22:36'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    64,
    65,
    '20220900065',
    6000000,
    'PEMBAYARAN 1 - TRANSFER VA',
    1,
    '2022-09-03',
    '2022-09-03 14:38:18'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    65,
    66,
    '20220900066',
    2000000,
    'TRANSFER VA',
    1,
    '2022-09-03',
    '2022-09-03 14:38:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    66,
    67,
    '20220900067',
    1000000,
    'PEMBAYARAN 1',
    1,
    '2022-09-03',
    '2022-09-03 14:59:56'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    67,
    68,
    '20220900068',
    6250000,
    'SPP SMT 3',
    1,
    '2022-09-06',
    '2022-09-06 12:06:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    68,
    69,
    '20220900069',
    2000000,
    'TRANSFER VA',
    1,
    '2022-09-12',
    '2022-09-12 11:29:29'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    69,
    70,
    '20220900070',
    2250000,
    'SMT 2-PELUNASAN',
    1,
    '2022-09-13',
    '2022-09-13 15:01:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    70,
    70,
    '20220900071',
    750000,
    'SMT 3 - PEMBAYARAN 1',
    1,
    '2022-09-13',
    '2022-09-13 15:04:32'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    71,
    71,
    '20220900072',
    250000,
    'smt 1-pelunasan',
    1,
    '2022-09-13',
    '2022-09-13 15:13:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    72,
    71,
    '20220900073',
    5000000,
    'smt 2 - pembayaran 1',
    1,
    '2022-09-13',
    '2022-09-13 15:14:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    73,
    73,
    '20220900074',
    4500000,
    'SMT 3 - PEMBAYARAN 1',
    1,
    '2022-09-13',
    '2022-09-13 15:18:59'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    74,
    74,
    '20220900076',
    2450000,
    'SMT 2-PELUNASAN',
    1,
    '2022-09-13',
    '2022-09-13 15:27:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    75,
    75,
    '20220900077',
    600000,
    'SMT 3 - PEMBAYARAN 1',
    1,
    '2022-09-13',
    '2022-09-13 15:28:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    76,
    76,
    '20220900078',
    2000000,
    'SERAGAM',
    1,
    '2022-09-13',
    '2022-09-13 15:34:44'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    77,
    77,
    '20220900079',
    1000000,
    'PEMBAYARAN 1',
    1,
    '2022-09-15',
    '2022-09-15 12:38:08'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    78,
    96,
    '20220900080',
    320000,
    '-',
    1,
    '2022-09-17',
    '2022-09-17 09:48:04'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    79,
    101,
    '20220900081',
    500000,
    'PEMBAYARAN 1',
    1,
    '2022-09-17',
    '2022-09-17 09:51:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    80,
    102,
    '20220900082',
    2000000,
    '-',
    1,
    '2022-09-17',
    '2022-09-17 09:56:33'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    81,
    103,
    '20220900083',
    320000,
    '-',
    1,
    '2022-09-17',
    '2022-09-17 09:56:44'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    82,
    104,
    '20220900084',
    2000000,
    '-',
    1,
    '2022-09-17',
    '2022-09-17 10:14:24'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    83,
    105,
    '20220900085',
    2000000,
    '-',
    1,
    '2022-09-17',
    '2022-09-17 10:18:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    84,
    106,
    '20220900086',
    2000000,
    '-',
    1,
    '2022-09-17',
    '2022-09-17 10:20:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    85,
    107,
    '20220900087',
    2000000,
    'TRANSFER VA',
    1,
    '2022-09-17',
    '2022-09-17 10:24:45'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    87,
    47,
    '20220900089',
    3000000,
    'PEMBAYARAN 1- TGL 19 JULI 2022',
    1,
    '2022-09-17',
    '2022-09-17 10:29:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    88,
    108,
    '20220900090',
    2000000,
    'BAYAR TGL 19 JULI 2022',
    1,
    '2022-09-17',
    '2022-09-17 10:30:03'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    89,
    109,
    '20220900091',
    2000000,
    '-',
    1,
    '2022-09-17',
    '2022-09-17 10:32:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    90,
    98,
    '20220900092',
    320000,
    '-',
    1,
    '2022-09-17',
    '2022-09-17 10:34:10'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    91,
    110,
    '20220900093',
    2000000,
    '-',
    1,
    '2022-09-17',
    '2022-09-17 10:37:29'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    92,
    111,
    '20220900094',
    250000,
    'PEMBAYARAN 1',
    1,
    '2022-09-17',
    '2022-09-17 10:42:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    93,
    112,
    '20220900095',
    750000,
    'PELUNASAN SMT 2',
    1,
    '2022-09-17',
    '2022-09-17 13:44:29'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    94,
    113,
    '20220900096',
    750000,
    'SMT 3 - PEMBAYARAN 1',
    1,
    '2022-09-17',
    '2022-09-17 13:44:58'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    95,
    114,
    '20220900097',
    3000000,
    'semester 1 - pembayaran 1',
    1,
    '2022-09-17',
    '2022-09-17 14:43:42'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    96,
    115,
    '20220900098',
    320000,
    '-',
    1,
    '2022-09-19',
    '2022-09-19 12:14:41'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    97,
    94,
    '20220900099',
    320000,
    '-',
    1,
    '2022-09-19',
    '2022-09-19 12:16:24'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    98,
    116,
    '20220900100',
    320000,
    '-',
    1,
    '2022-09-19',
    '2022-09-19 12:17:42'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    99,
    117,
    '20220900101',
    500000,
    'pembayaran 2',
    1,
    '2022-09-19',
    '2022-09-19 12:21:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    100,
    118,
    '20220900102',
    2000000,
    '-',
    1,
    '2022-09-19',
    '2022-09-19 12:26:56'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    101,
    70,
    '20220900103',
    2000000,
    'SEMESTER 3- PEMBAYARAN 2',
    1,
    '2022-09-19',
    '2022-09-19 12:46:05'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    102,
    119,
    '20220900104',
    2000000,
    '-',
    1,
    '2022-09-19',
    '2022-09-19 14:04:39'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    103,
    120,
    '20220900105',
    300000,
    'pembayaran 1',
    1,
    '2022-09-19',
    '2022-09-19 14:07:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    104,
    121,
    '20220900106',
    320000,
    '-',
    1,
    '2022-09-20',
    '2022-09-20 11:38:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    105,
    122,
    '20220900107',
    500000,
    'lunas',
    1,
    '2022-09-20',
    '2022-09-20 12:06:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    106,
    123,
    '20220900108',
    500000,
    'LUNAS',
    1,
    '2022-09-20',
    '2022-09-20 12:13:25'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    107,
    124,
    '20220900109',
    500000,
    'lunas',
    1,
    '2022-09-20',
    '2022-09-20 14:51:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    108,
    93,
    '20220900110',
    320000,
    '-',
    1,
    '2022-09-20',
    '2022-09-20 15:18:45'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    109,
    71,
    '20220900111',
    1250000,
    'PELUNASAN SMT 2',
    1,
    '2022-09-21',
    '2022-09-21 11:06:17'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    110,
    125,
    '20220900112',
    2000000,
    'PEMBAYARAN 1 - SMT 3',
    1,
    '2022-09-21',
    '2022-09-21 11:08:37'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    111,
    126,
    '20220900113',
    500000,
    '-',
    1,
    '2022-09-21',
    '2022-09-21 13:56:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    112,
    80,
    '20220900114',
    320000,
    '-',
    1,
    '2022-09-21',
    '2022-09-21 13:57:04'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    113,
    25,
    '20220900115',
    1000000,
    '3',
    1,
    '2022-09-22',
    '2022-09-22 11:31:08'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    114,
    127,
    '20220900116',
    1500000,
    'pembayaran 1',
    1,
    '2022-09-23',
    '2022-09-23 11:49:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    115,
    47,
    '20220900117',
    3000000,
    'VA TGL 21 SEP 22',
    1,
    '2022-09-23',
    '2022-09-23 11:53:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    116,
    89,
    '20220900118',
    320000,
    '-',
    1,
    '2022-09-24',
    '2022-09-24 12:03:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    117,
    128,
    '20220900119',
    320000,
    '-',
    1,
    '2022-09-24',
    '2022-09-24 12:06:04'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    118,
    129,
    '20220900120',
    320000,
    '-',
    1,
    '2022-09-24',
    '2022-09-24 12:07:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    119,
    130,
    '20220900121',
    320000,
    '-',
    1,
    '2022-09-26',
    '2022-09-26 13:28:33'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    120,
    131,
    '20220900122',
    1000000,
    'pembayaran 1',
    1,
    '2022-09-26',
    '2022-09-26 13:45:39'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    121,
    132,
    '20220900123',
    320000,
    '-',
    1,
    '2022-09-26',
    '2022-09-26 13:50:41'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    122,
    133,
    '20220900124',
    4540000,
    'LUNAS',
    1,
    '2022-09-26',
    '2022-09-26 15:44:07'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    123,
    78,
    '20220900125',
    320000,
    '-',
    1,
    '2022-09-27',
    '2022-09-27 09:49:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    124,
    82,
    '20220900126',
    320000,
    '-',
    1,
    '2022-09-27',
    '2022-09-27 11:00:44'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    125,
    88,
    '20220900127',
    320000,
    '-',
    1,
    '2022-09-27',
    '2022-09-27 11:07:45'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    126,
    99,
    '20220900128',
    320000,
    '-',
    1,
    '2022-09-27',
    '2022-09-27 11:32:23'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    127,
    95,
    '20220900129',
    320000,
    '-',
    1,
    '2022-09-27',
    '2022-09-27 11:50:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    128,
    83,
    '20220900130',
    320000,
    '-',
    1,
    '2022-09-27',
    '2022-09-27 11:53:44'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    129,
    131,
    '20221000131',
    1500000,
    'pembayaran 2',
    1,
    '2022-10-03',
    '2022-10-03 12:01:23'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    130,
    77,
    '20221000132',
    1000000,
    'pembayaran 2',
    1,
    '2022-10-03',
    '2022-10-03 12:03:53'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    131,
    134,
    '20221000133',
    3500000,
    'KAS TGL 26 SEP 22',
    1,
    '2022-10-05',
    '2022-10-05 07:57:18'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    132,
    45,
    '20221000134',
    2000000,
    'KAS TGL 13 SEP 22',
    1,
    '2022-10-05',
    '2022-10-05 08:05:42'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    133,
    67,
    '20221000135',
    1000000,
    'KAS TGL 19 SEP 22',
    1,
    '2022-10-05',
    '2022-10-05 08:14:17'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    134,
    135,
    '20221000136',
    2000000,
    'KAS TGL 16 SEP 22',
    1,
    '2022-10-05',
    '2022-10-05 08:19:04'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    135,
    136,
    '20221000137',
    2000000,
    'KAS TGL 16 SEP 22',
    1,
    '2022-10-05',
    '2022-10-05 08:22:24'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    136,
    43,
    '20221000138',
    2000000,
    'KAS TGL 16 SEP 22',
    1,
    '2022-10-05',
    '2022-10-05 08:23:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    137,
    137,
    '20221000139',
    2000000,
    'KAS TGL 16 SEP 22',
    1,
    '2022-10-05',
    '2022-10-05 08:26:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    138,
    138,
    '20221000140',
    2000000,
    'KAS TGL 19 SEP 22',
    1,
    '2022-10-05',
    '2022-10-05 08:31:04'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    139,
    139,
    '20221000141',
    2000000,
    'KAS TGL 19 SEP 22',
    1,
    '2022-10-05',
    '2022-10-05 08:31:04'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    140,
    140,
    '20221000142',
    2000000,
    'KAS TGL 16 SEP 22',
    1,
    '2022-10-05',
    '2022-10-05 08:33:23'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    141,
    141,
    '20221000143',
    4540000,
    'KAS TGL 23 SEP 22',
    1,
    '2022-10-05',
    '2022-10-05 08:36:37'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    142,
    142,
    '20221000144',
    4540000,
    'KAS TGL 23 SEP 22',
    1,
    '2022-10-05',
    '2022-10-05 08:39:16'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    143,
    143,
    '20221000145',
    4540000,
    'KAS TGL 23 SEP 22',
    1,
    '2022-10-05',
    '2022-10-05 08:41:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    144,
    144,
    '20221000146',
    4540000,
    'KAS TGL 26 SEP 22',
    1,
    '2022-10-05',
    '2022-10-05 08:45:36'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    145,
    145,
    '20221000147',
    4540000,
    'KAS TGL 23 SEP 22',
    1,
    '2022-10-05',
    '2022-10-05 08:47:20'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    146,
    75,
    '20221000148',
    1400000,
    'SMT 3 - PEMBAYARAN 2',
    1,
    '2022-10-06',
    '2022-10-06 12:23:59'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    147,
    53,
    '20221000149',
    2500000,
    'pembayaran 2',
    1,
    '2022-10-07',
    '2022-10-07 10:40:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    148,
    146,
    '20221000150',
    300000,
    '1',
    1,
    '2022-10-07',
    '2022-10-07 10:45:35'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    149,
    147,
    '20221000151',
    3000000,
    'pembayaran 2',
    1,
    '2022-10-07',
    '2022-10-07 13:03:29'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    151,
    148,
    '20221000153',
    3000000,
    'pembayaran 2-transfer VA',
    1,
    '2022-10-07',
    '2022-10-07 13:08:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    152,
    149,
    '20221000154',
    2000000,
    'pembayaran 2',
    1,
    '2022-10-11',
    '2022-10-11 09:55:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    153,
    150,
    '20221000155',
    1000000,
    'SMT 1 - PEMBAYARAN 4',
    1,
    '2022-10-11',
    '2022-10-11 10:57:08'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    154,
    151,
    '20221000156',
    1250000,
    'pembayaran 2',
    1,
    '2022-10-11',
    '2022-10-11 11:10:29'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    155,
    152,
    '20221000157',
    1500000,
    'PEMBAYARAN 1',
    1,
    '2022-10-11',
    '2022-10-11 11:13:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    156,
    153,
    '20221000158',
    1250000,
    'SMT 1 - TRANSFER VA TGL 10 OKT 22',
    1,
    '2022-10-11',
    '2022-10-11 11:17:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    157,
    47,
    '20221000159',
    3000000,
    '3',
    1,
    '2022-10-20',
    '2022-10-20 11:12:16'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    158,
    154,
    '20221000160',
    3000000,
    '2',
    1,
    '2022-10-22',
    '2022-10-22 12:26:15'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    159,
    101,
    '20221000161',
    500000,
    '2',
    1,
    '2022-10-24',
    '2022-10-24 09:34:39'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    160,
    114,
    '20221100162',
    3000000,
    'semester 1 - pembayaran 2',
    1,
    '2022-11-01',
    '2022-11-01 10:11:20'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    161,
    59,
    '20221100163',
    2500000,
    'transfer VA tgl 25 agus 22',
    1,
    '2022-11-03',
    '2022-11-03 09:23:56'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    162,
    59,
    '20221100164',
    6000000,
    'transfer VA tgl 29 okt 22',
    1,
    '2022-11-03',
    '2022-11-03 09:24:39'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    165,
    61,
    '20221100167',
    1500000,
    '2',
    1,
    '2022-11-03',
    '2022-11-03 11:20:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    166,
    149,
    '20221100168',
    2250000,
    '3',
    1,
    '2022-11-07',
    '2022-11-07 10:55:07'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    167,
    156,
    '20221100169',
    500000,
    '-',
    1,
    '2022-11-14',
    '2022-11-14 09:36:53'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    168,
    125,
    '20221100170',
    2250000,
    '2',
    1,
    '2022-11-14',
    '2022-11-14 09:53:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    169,
    101,
    '20221100171',
    700000,
    '4',
    1,
    '2022-11-21',
    '2022-11-21 11:00:22'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    171,
    157,
    '20221100173',
    6500000,
    'TRANSVER VA tgl 21 nov 22 - 2',
    1,
    '2022-11-21',
    '2022-11-21 14:07:37'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    172,
    57,
    '20221100174',
    1500000,
    'LUNAS-3',
    1,
    '2022-11-23',
    '2022-11-23 11:43:57'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    173,
    61,
    '20221200175',
    2000000,
    '3',
    1,
    '2022-12-05',
    '2022-12-05 11:58:17'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    174,
    131,
    '20221200176',
    1000000,
    'PEMBAYARAN 3',
    1,
    '2022-12-07',
    '2022-12-07 15:14:23'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    175,
    151,
    '20221200177',
    1000000,
    'pembayaran 3',
    1,
    '2022-12-09',
    '2022-12-09 13:28:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    176,
    34,
    '20221200178',
    3000000,
    'pembayaran 2',
    1,
    '2022-12-12',
    '2022-12-12 12:52:55'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    177,
    147,
    '20221200179',
    3000000,
    'pembayaran 3',
    1,
    '2022-12-13',
    '2022-12-13 12:22:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    178,
    25,
    '20221200180',
    1000000,
    'pembayaran 4',
    1,
    '2022-12-14',
    '2022-12-14 11:48:18'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    179,
    158,
    '20221200181',
    3000000,
    'smt 3 - pembayaran 3',
    1,
    '2022-12-15',
    '2022-12-15 12:32:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    180,
    75,
    '20221200182',
    1250000,
    'smt 3 - pembayaran 3',
    1,
    '2022-12-15',
    '2022-12-15 12:36:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    181,
    127,
    '20221200183',
    2000000,
    'pembayaran 2',
    1,
    '2022-12-19',
    '2022-12-19 11:06:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    182,
    125,
    '20221200184',
    2000000,
    'pembayaran 3',
    1,
    '2022-12-19',
    '2022-12-19 11:08:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    183,
    150,
    '20221200185',
    1250000,
    'PEMBAYARAN 5',
    1,
    '2022-12-19',
    '2022-12-19 11:13:05'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    185,
    160,
    '20221200187',
    4450000,
    'PEMBAYARAN 1',
    1,
    '2022-12-19',
    '2022-12-19 11:14:50'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    186,
    62,
    '20221200188',
    2000000,
    'pembayaran 4',
    1,
    '2022-12-19',
    '2022-12-19 13:28:40'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    187,
    161,
    '20221200189',
    1500000,
    'pembayaran 4',
    1,
    '2022-12-19',
    '2022-12-19 13:34:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    188,
    174,
    '20230100001',
    700000,
    'LUNAS',
    1,
    '2023-01-04',
    '2023-01-04 12:02:24'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    189,
    131,
    '20230100002',
    2250000,
    'PEMBAYARAN 5 LUNAS',
    1,
    '2023-01-04',
    '2023-01-04 12:05:54'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    190,
    77,
    '20230100003',
    800000,
    'pembayaran 3',
    1,
    '2023-01-04',
    '2023-01-04 12:08:10'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    191,
    168,
    '20230100004',
    700000,
    '-',
    1,
    '2023-01-05',
    '2023-01-05 10:20:50'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    192,
    175,
    '20230100005',
    150000,
    '-',
    1,
    '2023-01-06',
    '2023-01-06 09:38:36'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    193,
    61,
    '20230100006',
    2500000,
    'pembayaran 4',
    1,
    '2023-01-07',
    '2023-01-07 09:43:55'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    194,
    202,
    '20230100007',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 09:45:05'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    195,
    195,
    '20230100008',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 09:47:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    196,
    213,
    '20230100009',
    6000000,
    'pembayaran 2',
    1,
    '2023-01-07',
    '2023-01-07 09:50:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    197,
    201,
    '20230100010',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 09:52:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    198,
    214,
    '20230100011',
    4000000,
    'pembayaran 2-lunas',
    1,
    '2023-01-07',
    '2023-01-07 13:51:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    199,
    180,
    '20230100012',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 13:51:38'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    200,
    154,
    '20230100013',
    3000000,
    'pembayaran 3-lunas',
    1,
    '2023-01-07',
    '2023-01-07 13:56:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    201,
    191,
    '20230100014',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 13:56:59'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    202,
    190,
    '20230100015',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 13:59:58'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    203,
    215,
    '20230100016',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 14:03:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    204,
    216,
    '20230100017',
    6000000,
    'pembayaran 2-lunas',
    1,
    '2023-01-07',
    '2023-01-07 14:06:18'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    205,
    188,
    '20230100018',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 14:06:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    206,
    193,
    '20230100019',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 14:11:23'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    207,
    148,
    '20230100020',
    3000000,
    'pembayaran 3-lunas-VA 7/1/23',
    1,
    '2023-01-07',
    '2023-01-07 14:12:11'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    208,
    182,
    '20230100021',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 14:13:24'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    209,
    204,
    '20230100022',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 14:14:27'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    210,
    192,
    '20230100023',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 14:15:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    212,
    194,
    '20230100025',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 14:17:36'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    213,
    198,
    '20230100026',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 14:18:40'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    214,
    217,
    '20230100027',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 14:27:33'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    215,
    218,
    '20230100028',
    6000000,
    'VA 7/1/23',
    1,
    '2023-01-07',
    '2023-01-07 14:43:23'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    216,
    219,
    '20230100029',
    150000,
    '-',
    1,
    '2023-01-07',
    '2023-01-07 14:43:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    217,
    166,
    '20230100030',
    700000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 08:10:25'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    218,
    189,
    '20230100031',
    150000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 08:12:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    219,
    197,
    '20230100032',
    150000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 08:13:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    220,
    183,
    '20230100033',
    150000,
    'VA 7/1/23',
    1,
    '2023-01-09',
    '2023-01-09 08:15:18'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    221,
    171,
    '20230100034',
    700000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 08:32:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    222,
    167,
    '20230100035',
    700000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 08:33:28'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    223,
    164,
    '20230100036',
    700000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 08:34:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    224,
    172,
    '20230100037',
    700000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 08:35:41'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    225,
    165,
    '20230100038',
    700000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 08:36:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    226,
    185,
    '20230100039',
    150000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 08:39:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    227,
    220,
    '20230100040',
    3000000,
    'pembayaran 3',
    1,
    '2023-01-09',
    '2023-01-09 08:39:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    228,
    178,
    '20230100041',
    150000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 08:41:22'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    229,
    196,
    '20230100042',
    150000,
    'VA 7/1/23',
    1,
    '2023-01-09',
    '2023-01-09 08:44:42'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    230,
    221,
    '20230100043',
    6000000,
    'VA 7/1/23',
    1,
    '2023-01-09',
    '2023-01-09 08:44:56'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    231,
    205,
    '20230100044',
    150000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 08:47:55'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    232,
    50,
    '20230100045',
    3000000,
    'pembayaran 3',
    1,
    '2023-01-09',
    '2023-01-09 08:49:49'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    233,
    209,
    '20230100046',
    150000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 08:50:00'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    234,
    200,
    '20230100047',
    150000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 09:04:37'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    235,
    187,
    '20230100048',
    150000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 09:08:54'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    236,
    203,
    '20230100049',
    150000,
    'VA dr SPP tgl 29 okt 22',
    1,
    '2023-01-09',
    '2023-01-09 09:12:41'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    237,
    186,
    '20230100050',
    150000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 10:19:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    238,
    222,
    '20230100051',
    3000000,
    'pembayaran 2',
    1,
    '2023-01-09',
    '2023-01-09 10:21:03'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    239,
    222,
    '20230100052',
    3000000,
    'VA 9/1/23',
    1,
    '2023-01-09',
    '2023-01-09 10:24:32'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    240,
    222,
    '20230100053',
    3000000,
    'VA 29/8/22',
    1,
    '2023-01-09',
    '2023-01-09 10:25:05'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    241,
    210,
    '20230100054',
    150000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 10:26:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    242,
    48,
    '20230100055',
    2000000,
    'pembayaran 3',
    1,
    '2023-01-09',
    '2023-01-09 11:40:06'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    243,
    181,
    '20230100056',
    150000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 11:40:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    244,
    114,
    '20230100057',
    1500000,
    'VA 7/1/23',
    1,
    '2023-01-09',
    '2023-01-09 11:43:49'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    245,
    176,
    '20230100058',
    150000,
    'VA 7/1/23',
    1,
    '2023-01-09',
    '2023-01-09 11:44:05'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    246,
    25,
    '20230100059',
    3000000,
    'PEMBAYARAN 5',
    1,
    '2023-01-09',
    '2023-01-09 11:45:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    247,
    223,
    '20230100060',
    500000,
    'pembayaran 2',
    1,
    '2023-01-09',
    '2023-01-09 11:49:03'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    248,
    224,
    '20230100061',
    6000000,
    'VA 9/1/23',
    1,
    '2023-01-09',
    '2023-01-09 11:55:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    249,
    184,
    '20230100062',
    150000,
    'VA 9/1/23',
    1,
    '2023-01-09',
    '2023-01-09 11:55:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    250,
    226,
    '20230100063',
    150000,
    'VA 9/1/23',
    1,
    '2023-01-09',
    '2023-01-09 12:00:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    251,
    225,
    '20230100064',
    5000000,
    'VA 9/1/23',
    1,
    '2023-01-09',
    '2023-01-09 12:00:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    253,
    64,
    '20230100066',
    2000000,
    'VA 9/1/23',
    1,
    '2023-01-09',
    '2023-01-09 12:06:03'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    254,
    14,
    '20230100067',
    6000000,
    'pembayaran 2',
    1,
    '2023-01-09',
    '2023-01-09 12:07:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    255,
    53,
    '20230100068',
    2000000,
    'pembayaran 3',
    1,
    '2023-01-09',
    '2023-01-09 12:11:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    256,
    179,
    '20230100069',
    150000,
    '-',
    1,
    '2023-01-09',
    '2023-01-09 12:11:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    257,
    52,
    '20230100070',
    3000000,
    'VA 9/1/23',
    1,
    '2023-01-09',
    '2023-01-09 12:28:36'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    258,
    227,
    '20230100071',
    350000,
    'PEMBAYARAN 1',
    1,
    '2023-01-09',
    '2023-01-09 12:46:35'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    259,
    230,
    '20230100072',
    2885000,
    '-',
    1,
    '2023-01-10',
    '2023-01-10 08:37:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    260,
    73,
    '20230100073',
    1750000,
    'pembayaran 4',
    1,
    '2023-01-10',
    '2023-01-10 09:06:24'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    261,
    77,
    '20230100074',
    3250000,
    'pembayaran 4',
    1,
    '2023-01-10',
    '2023-01-10 09:08:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    262,
    158,
    '20230100075',
    500000,
    'pembayaran 4',
    1,
    '2023-01-10',
    '2023-01-10 09:10:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    263,
    169,
    '20230100076',
    700000,
    '-',
    1,
    '2023-01-10',
    '2023-01-10 09:10:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    264,
    173,
    '20230100077',
    700000,
    '-',
    1,
    '2023-01-10',
    '2023-01-10 09:12:06'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    265,
    75,
    '20230100078',
    1000000,
    'pembayaran 4',
    1,
    '2023-01-10',
    '2023-01-10 09:13:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    266,
    36,
    '20230100079',
    5750000,
    'pembayaran 2',
    1,
    '2023-01-10',
    '2023-01-10 09:21:15'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    267,
    232,
    '20230100080',
    4250000,
    'PEMBAYARAN 1',
    1,
    '2023-01-10',
    '2023-01-10 09:22:45'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    268,
    48,
    '20230100081',
    1500000,
    'pembayaran 4',
    1,
    '2023-01-10',
    '2023-01-10 10:01:29'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    269,
    223,
    '20230100082',
    1000000,
    'pembayaran 3',
    1,
    '2023-01-10',
    '2023-01-10 10:03:27'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    270,
    229,
    '20230100083',
    2885000,
    '-',
    1,
    '2023-01-10',
    '2023-01-10 11:47:50'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    271,
    237,
    '20230100084',
    2885000,
    '-',
    1,
    '2023-01-10',
    '2023-01-10 11:53:20'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    272,
    151,
    '20230100085',
    2000000,
    'pembayaran 4',
    1,
    '2023-01-11',
    '2023-01-11 08:41:54'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    273,
    127,
    '20230100086',
    1500000,
    'pembayaran 3',
    1,
    '2023-01-11',
    '2023-01-11 08:49:15'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    274,
    228,
    '20230100087',
    2885000,
    '-',
    1,
    '2023-01-13',
    '2023-01-13 13:12:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    275,
    238,
    '20230100088',
    2885000,
    '-',
    1,
    '2023-01-13',
    '2023-01-13 13:20:20'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    276,
    160,
    '20230100089',
    1000000,
    'pembayaran 2',
    1,
    '2023-01-13',
    '2023-01-13 14:14:55'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    277,
    239,
    '20230100090',
    2885000,
    'VA 10/1/23',
    1,
    '2023-01-14',
    '2023-01-14 07:22:40'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    278,
    240,
    '20230100091',
    1615000,
    'VA 10/1/23',
    1,
    '2023-01-14',
    '2023-01-14 07:23:37'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    279,
    241,
    '20230100092',
    2885000,
    '-',
    1,
    '2023-01-14',
    '2023-01-14 12:52:05'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    280,
    242,
    '20230100093',
    3000000,
    'pembayaran 1',
    1,
    '2023-01-25',
    '2023-01-25 09:17:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    282,
    64,
    '20230100095',
    3000000,
    'pembayaran 4-VA 25/1/23',
    1,
    '2023-01-25',
    '2023-01-25 10:00:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    283,
    243,
    '20230100096',
    2000000,
    '1',
    1,
    '2023-01-26',
    '2023-01-26 20:31:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    284,
    244,
    '20230100097',
    4000000,
    '1',
    1,
    '2023-01-31',
    '2023-01-31 10:50:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    285,
    245,
    '20230200098',
    700000,
    '-',
    1,
    '2023-02-01',
    '2023-02-01 10:40:56'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    286,
    246,
    '20230200099',
    2250000,
    '-',
    1,
    '2023-02-01',
    '2023-02-01 10:41:08'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    287,
    247,
    '20230200100',
    2300000,
    '1',
    1,
    '2023-02-01',
    '2023-02-01 11:22:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    288,
    248,
    '20230200101',
    3000000,
    '-',
    1,
    '2023-02-01',
    '2023-02-01 14:36:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    289,
    249,
    '20230200102',
    700000,
    '-',
    1,
    '2023-02-02',
    '2023-02-02 11:36:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    290,
    250,
    '20230200103',
    2250000,
    '-',
    1,
    '2023-02-02',
    '2023-02-02 11:37:03'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    291,
    251,
    '20230200104',
    3000000,
    '1',
    1,
    '2023-02-09',
    '2023-02-09 12:51:56'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    292,
    252,
    '20230200105',
    3000000,
    '1',
    1,
    '2023-02-09',
    '2023-02-09 12:56:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    293,
    253,
    '20230200106',
    700000,
    'VA 10/2/23',
    1,
    '2023-02-10',
    '2023-02-10 10:07:59'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    294,
    254,
    '20230200107',
    2250000,
    'VA 10/2/23',
    1,
    '2023-02-10',
    '2023-02-10 10:08:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    296,
    257,
    '20230200109',
    3000000,
    'pembayaran 1',
    1,
    '2023-02-10',
    '2023-02-10 13:30:48'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    297,
    261,
    '20230200110',
    3000000,
    '1',
    1,
    '2023-02-13',
    '2023-02-13 09:26:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    298,
    260,
    '20230200111',
    3000000,
    '1',
    1,
    '2023-02-13',
    '2023-02-13 09:28:44'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    299,
    259,
    '20230200112',
    3000000,
    '1',
    1,
    '2023-02-13',
    '2023-02-13 09:30:05'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    300,
    258,
    '20230200113',
    1500000,
    '1',
    1,
    '2023-02-13',
    '2023-02-13 09:31:44'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    301,
    262,
    '20230200114',
    3000000,
    '1',
    1,
    '2023-02-13',
    '2023-02-13 09:51:41'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    302,
    263,
    '20230200115',
    3000000,
    '1',
    1,
    '2023-02-13',
    '2023-02-13 09:53:55'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    303,
    64,
    '20230200116',
    1000000,
    '5 - VA 13 Feb 23',
    1,
    '2023-02-13',
    '2023-02-13 09:57:28'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    305,
    264,
    '20230200118',
    500000,
    '1 - VA 10 Feb 23',
    1,
    '2023-02-13',
    '2023-02-13 10:02:43'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    306,
    265,
    '20230200119',
    3000000,
    '1',
    1,
    '2023-02-13',
    '2023-02-13 10:06:28'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    307,
    223,
    '20230200120',
    3000000,
    '5',
    1,
    '2023-02-13',
    '2023-02-13 10:08:42'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    308,
    223,
    '20230200121',
    1000000,
    '4 - VA 13 Jan 23',
    1,
    '2023-02-13',
    '2023-02-13 10:10:18'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    309,
    266,
    '20230200122',
    3000000,
    '1 - VA 13 Feb 23',
    1,
    '2023-02-13',
    '2023-02-13 10:16:08'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    310,
    267,
    '20230200123',
    3000000,
    '1 - VA 11 Feb 23',
    1,
    '2023-02-13',
    '2023-02-13 10:48:15'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    311,
    268,
    '20230200124',
    3000000,
    '1 - VA 13 Feb 23',
    1,
    '2023-02-13',
    '2023-02-13 11:40:10'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    312,
    269,
    '20230200125',
    3000000,
    '1',
    1,
    '2023-02-13',
    '2023-02-13 11:45:33'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    313,
    270,
    '20230200126',
    9000000,
    'VA 8 Feb 23',
    1,
    '2023-02-13',
    '2023-02-13 11:49:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    314,
    160,
    '20230200127',
    800000,
    '3',
    1,
    '2023-02-14',
    '2023-02-14 14:58:42'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    315,
    159,
    '20230200128',
    5600000,
    '1',
    1,
    '2023-02-14',
    '2023-02-14 15:00:20'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    316,
    271,
    '20230200129',
    1000000,
    '1',
    1,
    '2023-02-15',
    '2023-02-15 10:06:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    317,
    272,
    '20230200130',
    3000000,
    '1',
    1,
    '2023-02-15',
    '2023-02-15 10:08:06'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    318,
    273,
    '20230200131',
    2000000,
    '1 - VA 13 Feb 23',
    1,
    '2023-02-15',
    '2023-02-15 12:38:57'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    319,
    274,
    '20230200132',
    2000000,
    '1 - VA 15 Feb 23',
    1,
    '2023-02-15',
    '2023-02-15 13:07:28'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    320,
    275,
    '20230200133',
    2000000,
    '1',
    1,
    '2023-02-15',
    '2023-02-15 14:10:07'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    321,
    155,
    '20230200134',
    2850000,
    '1',
    1,
    '2023-02-16',
    '2023-02-16 08:40:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    322,
    276,
    '20230200135',
    500000,
    '1',
    1,
    '2023-02-16',
    '2023-02-16 08:45:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    323,
    233,
    '20230200136',
    3000000,
    '1',
    1,
    '2023-02-16',
    '2023-02-16 13:07:22'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    324,
    277,
    '20230200137',
    5000000,
    '1 - VA 2 Feb 23',
    1,
    '2023-02-20',
    '2023-02-20 09:52:41'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    325,
    278,
    '20230200138',
    5000000,
    '1',
    1,
    '2023-02-20',
    '2023-02-20 11:09:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    326,
    278,
    '20230200139',
    100000,
    '1',
    1,
    '2023-02-20',
    '2023-02-20 11:13:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    327,
    279,
    '20230200140',
    8100000,
    '-',
    1,
    '2023-02-20',
    '2023-02-20 13:52:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    328,
    127,
    '20230200141',
    1250000,
    '4',
    1,
    '2023-02-23',
    '2023-02-23 11:32:54'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    329,
    280,
    '20230200142',
    3400000,
    '1',
    1,
    '2023-02-23',
    '2023-02-23 13:06:20'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    330,
    281,
    '20230200143',
    6000000,
    '1',
    1,
    '2023-02-23',
    '2023-02-23 13:07:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    331,
    282,
    '20230200144',
    3000000,
    'VA-24 FEB 23',
    1,
    '2023-02-24',
    '2023-02-24 15:59:29'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    332,
    283,
    '20230200145',
    3000000,
    '1',
    1,
    '2023-02-24',
    '2023-02-24 16:02:25'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    333,
    284,
    '20230200146',
    3000000,
    '1',
    1,
    '2023-02-24',
    '2023-02-24 16:10:19'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    334,
    285,
    '20230200147',
    3000000,
    '1',
    1,
    '2023-02-24',
    '2023-02-24 16:11:48'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    335,
    286,
    '20230200148',
    3000000,
    '1',
    1,
    '2023-02-24',
    '2023-02-24 16:14:23'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    336,
    287,
    '20230200149',
    3000000,
    '1',
    1,
    '2023-02-24',
    '2023-02-24 16:19:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    337,
    288,
    '20230200150',
    3000000,
    '1',
    1,
    '2023-02-24',
    '2023-02-24 16:23:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    338,
    289,
    '20230200151',
    3000000,
    '1',
    1,
    '2023-02-24',
    '2023-02-24 16:26:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    339,
    290,
    '20230200152',
    3000000,
    '1',
    1,
    '2023-02-25',
    '2023-02-25 10:21:49'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    340,
    291,
    '20230200153',
    500000,
    '1',
    1,
    '2023-02-25',
    '2023-02-25 10:26:35'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    341,
    292,
    '20230200154',
    4000000,
    '1',
    1,
    '2023-02-28',
    '2023-02-28 12:43:57'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    342,
    293,
    '20230200155',
    3000000,
    '1',
    1,
    '2023-02-28',
    '2023-02-28 14:14:15'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    343,
    151,
    '20230300156',
    1250000,
    '5',
    1,
    '2023-03-02',
    '2023-03-02 13:41:07'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    344,
    294,
    '20230300157',
    3000000,
    '1',
    1,
    '2023-03-03',
    '2023-03-03 09:51:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    345,
    235,
    '20230300158',
    3000000,
    '1 - VA 14 FEB 23',
    1,
    '2023-03-04',
    '2023-03-04 09:48:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    346,
    77,
    '20230300159',
    200000,
    'SMT 3',
    1,
    '2023-03-04',
    '2023-03-04 12:35:57'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    347,
    295,
    '20230300160',
    2000000,
    '1',
    1,
    '2023-03-04',
    '2023-03-04 12:37:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    348,
    296,
    '20230300161',
    6250000,
    '-',
    1,
    '2023-03-06',
    '2023-03-06 11:42:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    349,
    264,
    '20230300162',
    1000000,
    '2 - VA 2 MARET 23',
    1,
    '2023-03-07',
    '2023-03-07 12:35:40'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    350,
    271,
    '20230300163',
    2000000,
    '2',
    1,
    '2023-03-11',
    '2023-03-11 12:30:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    351,
    299,
    '20230300164',
    3000000,
    '1',
    1,
    '2023-03-13',
    '2023-03-13 12:43:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    352,
    300,
    '20230300165',
    1000000,
    '1',
    1,
    '2023-03-13',
    '2023-03-13 12:43:33'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    353,
    301,
    '20230300166',
    3000000,
    '1',
    1,
    '2023-03-14',
    '2023-03-14 14:22:35'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    354,
    302,
    '20230300167',
    5000000,
    '1',
    1,
    '2023-03-16',
    '2023-03-16 09:02:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    355,
    303,
    '20230300168',
    3250000,
    '1',
    1,
    '2023-03-16',
    '2023-03-16 09:04:44'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    356,
    304,
    '20230300169',
    6250000,
    'mery',
    1,
    '2023-03-16',
    '2023-03-16 09:49:22'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    357,
    305,
    '20230300170',
    2000000,
    'mery',
    1,
    '2023-03-17',
    '2023-03-17 08:19:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    358,
    306,
    '20230300171',
    3000000,
    '1',
    1,
    '2023-03-17',
    '2023-03-17 14:13:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    359,
    307,
    '20230300172',
    500000,
    'VA-23 Feb 23',
    1,
    '2023-03-17',
    '2023-03-17 21:55:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    360,
    308,
    '20230300173',
    1000000,
    '1',
    1,
    '2023-03-18',
    '2023-03-18 11:10:24'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    362,
    284,
    '20230300175',
    2000000,
    '2-va 29 mar 23',
    1,
    '2023-03-30',
    '2023-03-30 12:50:54'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    363,
    309,
    '20230300176',
    2000000,
    '1-va 28 mar 23',
    1,
    '2023-03-30',
    '2023-03-30 12:53:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    364,
    264,
    '20230300177',
    500000,
    '3-va 28 mar 23',
    1,
    '2023-03-30',
    '2023-03-30 13:17:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    365,
    252,
    '20230400178',
    3000000,
    '2',
    1,
    '2023-04-10',
    '2023-04-10 11:00:50'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    366,
    264,
    '20230400179',
    500000,
    '5- va 10 april 23',
    1,
    '2023-04-10',
    '2023-04-10 11:03:06'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    367,
    223,
    '20230400180',
    500000,
    '6',
    1,
    '2023-04-10',
    '2023-04-10 11:48:45'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    368,
    311,
    '20230400181',
    200000,
    '2 - Va 17 feb 23',
    1,
    '2023-04-10',
    '2023-04-10 11:53:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    369,
    311,
    '20230400182',
    5000000,
    '3 - va 10 april 23',
    1,
    '2023-04-10',
    '2023-04-10 11:53:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    370,
    312,
    '20230400183',
    3000000,
    '2',
    1,
    '2023-04-10',
    '2023-04-10 11:57:39'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    372,
    277,
    '20230400185',
    2000000,
    '2 - va 10 april 23',
    1,
    '2023-04-10',
    '2023-04-10 12:00:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    373,
    269,
    '20230400186',
    500000,
    '2 - va 10 april 23',
    1,
    '2023-04-10',
    '2023-04-10 12:02:40'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    374,
    258,
    '20230400187',
    6000000,
    '2',
    1,
    '2023-04-11',
    '2023-04-11 08:59:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    375,
    251,
    '20230400188',
    3000000,
    '2',
    1,
    '2023-04-11',
    '2023-04-11 09:04:10'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    376,
    285,
    '20230400189',
    2000000,
    '2',
    1,
    '2023-04-11',
    '2023-04-11 09:32:54'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    377,
    261,
    '20230400190',
    3000000,
    '2',
    1,
    '2023-04-11',
    '2023-04-11 09:38:08'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    378,
    272,
    '20230400191',
    3000000,
    '2',
    1,
    '2023-04-11',
    '2023-04-11 10:05:41'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    379,
    313,
    '20230400192',
    500000,
    '-',
    1,
    '2023-04-11',
    '2023-04-11 11:58:45'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    381,
    264,
    '20230400194',
    700000,
    '5 - va 11 april 23',
    1,
    '2023-04-11',
    '2023-04-11 13:07:28'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    382,
    314,
    '20230400195',
    1800000,
    '1',
    1,
    '2023-04-11',
    '2023-04-11 13:18:37'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    383,
    314,
    '20230400196',
    450000,
    '2 - VA 11 APRIL 23',
    1,
    '2023-04-11',
    '2023-04-11 13:20:05'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    384,
    134,
    '20230400197',
    750000,
    '3',
    1,
    '2023-04-11',
    '2023-04-11 13:22:57'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    385,
    257,
    '20230400198',
    3000000,
    '2',
    1,
    '2023-04-14',
    '2023-04-14 10:23:48'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    386,
    315,
    '20230400199',
    3000000,
    '1',
    1,
    '2023-04-14',
    '2023-04-14 10:34:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    387,
    280,
    '20230500200',
    1500000,
    '2',
    1,
    '2023-05-02',
    '2023-05-02 09:09:41'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    388,
    294,
    '20230500201',
    1500000,
    '2',
    1,
    '2023-05-02',
    '2023-05-02 09:11:10'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    389,
    268,
    '20230500202',
    6000000,
    '2',
    1,
    '2023-05-02',
    '2023-05-02 10:30:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    390,
    301,
    '20230500203',
    2000000,
    '2',
    1,
    '2023-05-03',
    '2023-05-03 12:04:55'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    391,
    276,
    '20230500204',
    5500000,
    '2',
    1,
    '2023-05-03',
    '2023-05-03 13:04:50'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    392,
    275,
    '20230500205',
    5000000,
    '2 - va 3 mei 2023',
    1,
    '2023-05-03',
    '2023-05-03 14:52:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    393,
    277,
    '20230500206',
    2000000,
    '3',
    1,
    '2023-05-08',
    '2023-05-08 09:28:27'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    394,
    155,
    '20230500207',
    2000000,
    '2 - va 4 mei 23',
    1,
    '2023-05-08',
    '2023-05-08 09:33:19'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    395,
    269,
    '20230500208',
    2500000,
    '3',
    1,
    '2023-05-08',
    '2023-05-08 09:41:43'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    396,
    271,
    '20230500209',
    2000000,
    '3',
    1,
    '2023-05-08',
    '2023-05-08 09:43:45'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    397,
    320,
    '20230500210',
    4250000,
    '2',
    1,
    '2023-05-08',
    '2023-05-08 15:47:44'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    398,
    264,
    '20230500211',
    1000000,
    '6',
    1,
    '2023-05-09',
    '2023-05-09 08:39:57'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    399,
    232,
    '20230500212',
    450000,
    '2',
    1,
    '2023-05-09',
    '2023-05-09 11:58:39'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    400,
    111,
    '20230500213',
    250000,
    '2',
    1,
    '2023-05-10',
    '2023-05-10 11:09:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    401,
    322,
    '20230500214',
    4000000,
    '1',
    1,
    '2023-05-12',
    '2023-05-12 09:36:36'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    402,
    323,
    '20230500215',
    500000,
    NULL,
    1,
    '2023-05-12',
    '2023-05-12 09:36:48'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    403,
    273,
    '20230500216',
    7000000,
    'va 10 mei 23',
    1,
    '2023-05-12',
    '2023-05-12 10:45:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    404,
    287,
    '20230500217',
    2000000,
    'VA 4 APRIL 23',
    1,
    '2023-05-12',
    '2023-05-12 13:09:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    405,
    324,
    '20230500218',
    500000,
    NULL,
    1,
    '2023-05-12',
    '2023-05-12 13:09:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    406,
    325,
    '20230500219',
    500000,
    NULL,
    1,
    '2023-05-12',
    '2023-05-12 14:00:32'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    407,
    326,
    '20230500220',
    500000,
    NULL,
    1,
    '2023-05-12',
    '2023-05-12 14:02:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    408,
    327,
    '20230500221',
    500000,
    NULL,
    1,
    '2023-05-12',
    '2023-05-12 15:33:50'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    409,
    297,
    '20230500222',
    4000000,
    '2',
    1,
    '2023-05-17',
    '2023-05-17 12:48:35'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    410,
    328,
    '20230500223',
    2600000,
    '1',
    1,
    '2023-05-17',
    '2023-05-17 13:10:25'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    411,
    302,
    '20230500224',
    1250000,
    '2',
    1,
    '2023-05-18',
    '2023-05-18 15:53:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    412,
    244,
    '20230500225',
    4100000,
    '2',
    1,
    '2023-05-18',
    '2023-05-18 17:28:43'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    413,
    329,
    '20230500226',
    500000,
    NULL,
    1,
    '2023-05-18',
    '2023-05-18 17:28:54'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    414,
    330,
    '20230500227',
    3000000,
    NULL,
    1,
    '2023-05-18',
    '2023-05-18 17:41:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    415,
    259,
    '20230500228',
    5100000,
    '2',
    1,
    '2023-05-18',
    '2023-05-18 17:42:57'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    416,
    303,
    '20230500229',
    3000000,
    '2',
    1,
    '2023-05-19',
    '2023-05-19 10:05:06'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    417,
    333,
    '20230500230',
    3170000,
    NULL,
    1,
    '2023-05-19',
    '2023-05-19 10:40:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    418,
    336,
    '20230500231',
    3170000,
    NULL,
    1,
    '2023-05-19',
    '2023-05-19 13:14:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    419,
    337,
    '20230500232',
    2000000,
    '2 - VA 21 MEI 23',
    1,
    '2023-05-22',
    '2023-05-22 09:24:55'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    420,
    305,
    '20230500233',
    1000000,
    '2',
    1,
    '2023-05-22',
    '2023-05-22 09:26:32'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    421,
    159,
    '20230500234',
    650000,
    '2',
    1,
    '2023-05-22',
    '2023-05-22 09:28:17'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    422,
    264,
    '20230500235',
    1300000,
    '7',
    1,
    '2023-05-24',
    '2023-05-24 08:14:06'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    423,
    256,
    '20230500236',
    3000000,
    '1 va 10 feb 23',
    1,
    '2023-05-24',
    '2023-05-24 13:42:50'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    424,
    256,
    '20230500237',
    5100000,
    '2',
    1,
    '2023-05-24',
    '2023-05-24 13:43:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    425,
    338,
    '20230500238',
    500000,
    NULL,
    1,
    '2023-05-24',
    '2023-05-24 13:46:24'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    426,
    288,
    '20230500239',
    3000000,
    '2',
    1,
    '2023-05-24',
    '2023-05-24 13:50:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    427,
    339,
    '20230500240',
    3170000,
    NULL,
    1,
    '2023-05-24',
    '2023-05-24 13:55:40'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    428,
    340,
    '20230500241',
    500000,
    NULL,
    1,
    '2023-05-24',
    '2023-05-24 14:00:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    429,
    335,
    '20230500242',
    3170000,
    NULL,
    1,
    '2023-05-24',
    '2023-05-24 15:34:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    430,
    280,
    '20230500243',
    4100000,
    '3',
    1,
    '2023-05-25',
    '2023-05-25 16:30:20'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    441,
    332,
    '20230500254',
    2920000,
    '1',
    1,
    '2023-05-30',
    '2023-05-30 09:46:05'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    442,
    264,
    '20230500255',
    2000000,
    '8',
    1,
    '2023-05-30',
    '2023-05-30 09:49:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    443,
    348,
    '20230500256',
    500000,
    '-',
    1,
    '2023-05-30',
    '2023-05-30 11:47:29'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    444,
    288,
    '20230500257',
    3000000,
    '3',
    1,
    '2023-05-30',
    '2023-05-30 13:29:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    445,
    349,
    '20230500258',
    4500000,
    '2',
    1,
    '2023-05-31',
    '2023-05-31 09:01:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    446,
    265,
    '20230500259',
    2050000,
    '2',
    1,
    '2023-05-31',
    '2023-05-31 09:03:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    447,
    308,
    '20230500260',
    4250000,
    '3',
    1,
    '2023-05-31',
    '2023-05-31 10:42:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    448,
    350,
    '20230500261',
    6000000,
    '1',
    1,
    '2023-05-31',
    '2023-05-31 10:44:43'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    449,
    351,
    '20230500262',
    6000000,
    '2',
    1,
    '2023-05-31',
    '2023-05-31 10:52:58'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    450,
    294,
    '20230500263',
    4500000,
    '3',
    1,
    '2023-05-31',
    '2023-05-31 11:05:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    451,
    352,
    '20230500264',
    500000,
    '-',
    1,
    '2023-05-31',
    '2023-05-31 11:06:03'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    452,
    315,
    '20230500265',
    4000000,
    '2',
    1,
    '2023-05-31',
    '2023-05-31 12:24:59'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    453,
    353,
    '20230500266',
    500000,
    '-',
    1,
    '2023-05-31',
    '2023-05-31 12:26:59'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    454,
    354,
    '20230500267',
    500000,
    'va 8 maret 23',
    1,
    '2023-05-31',
    '2023-05-31 12:31:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    455,
    354,
    '20230500268',
    1000000,
    'va 5 mei 23',
    1,
    '2023-05-31',
    '2023-05-31 12:31:50'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    456,
    354,
    '20230500269',
    4000000,
    'va 17 mei 23',
    1,
    '2023-05-31',
    '2023-05-31 12:32:11'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    457,
    354,
    '20230500270',
    3500000,
    'va 22 mei 23',
    1,
    '2023-05-31',
    '2023-05-31 12:32:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    458,
    355,
    '20230500271',
    500000,
    'va 22 mei 23',
    1,
    '2023-05-31',
    '2023-05-31 12:32:43'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    459,
    322,
    '20230500272',
    5000000,
    '2',
    1,
    '2023-05-31',
    '2023-05-31 15:23:48'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    460,
    356,
    '20230600273',
    2500000,
    '1',
    1,
    '2023-06-05',
    '2023-06-05 12:58:22'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    461,
    357,
    '20230600274',
    3000000,
    '1',
    1,
    '2023-06-08',
    '2023-06-08 09:31:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    462,
    305,
    '20230600275',
    3050000,
    '2',
    1,
    '2023-06-08',
    '2023-06-08 10:22:49'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    464,
    358,
    '20230600277',
    2750000,
    '1 - va 7 juni 23',
    1,
    '2023-06-08',
    '2023-06-08 10:50:59'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    465,
    233,
    '20230600278',
    2000000,
    '2',
    1,
    '2023-06-13',
    '2023-06-13 15:02:28'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    466,
    267,
    '20230600279',
    3000000,
    '2- va 15 juni 23',
    1,
    '2023-06-15',
    '2023-06-15 12:21:59'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    467,
    251,
    '20230600280',
    3000000,
    '3',
    1,
    '2023-06-19',
    '2023-06-19 10:22:38'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    468,
    274,
    '20230600281',
    2000000,
    '2 - VA 10 JUNI 23',
    1,
    '2023-06-19',
    '2023-06-19 11:28:48'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    469,
    275,
    '20230600282',
    2000000,
    '3-va 19 juni 23',
    1,
    '2023-06-19',
    '2023-06-19 14:48:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    470,
    359,
    '20230600283',
    6000000,
    '1- MERI',
    1,
    '2023-06-19',
    '2023-06-19 18:49:10'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    471,
    316,
    '20230600284',
    5250000,
    'CICIL',
    1,
    '2023-06-20',
    '2023-06-20 12:16:06'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    472,
    360,
    '20230600285',
    720000,
    '-',
    1,
    '2023-06-21',
    '2023-06-21 09:40:55'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    473,
    261,
    '20230600286',
    3000000,
    '3',
    1,
    '2023-06-22',
    '2023-06-22 09:30:29'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    474,
    257,
    '20230600287',
    3000000,
    '3',
    1,
    '2023-06-22',
    '2023-06-22 09:32:17'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    475,
    369,
    '20230600288',
    500000,
    'va 22 juni 23',
    1,
    '2023-06-22',
    '2023-06-22 09:41:56'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    476,
    365,
    '20230600289',
    500000,
    '-',
    1,
    '2023-06-23',
    '2023-06-23 09:53:08'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    477,
    396,
    '20230600290',
    1285000,
    '-',
    1,
    '2023-06-23',
    '2023-06-23 09:53:35'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    478,
    376,
    '20230600291',
    500000,
    '-',
    1,
    '2023-06-23',
    '2023-06-23 10:04:04'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    479,
    276,
    '20230600292',
    3000000,
    '3',
    1,
    '2023-06-23',
    '2023-06-23 10:06:06'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    480,
    242,
    '20230600293',
    6000000,
    '2',
    1,
    '2023-06-23',
    '2023-06-23 10:08:29'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    481,
    367,
    '20230600294',
    500000,
    '-',
    1,
    '2023-06-23',
    '2023-06-23 10:08:38'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    482,
    272,
    '20230600295',
    3000000,
    '3',
    1,
    '2023-06-23',
    '2023-06-23 10:10:35'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    483,
    373,
    '20230600296',
    500000,
    '-',
    1,
    '2023-06-23',
    '2023-06-23 10:10:44'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    484,
    155,
    '20230600297',
    4000000,
    '3- VA 23 JUNI 23',
    1,
    '2023-06-23',
    '2023-06-23 10:13:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    485,
    387,
    '20230600298',
    500000,
    'VA 23 JUNI 23',
    1,
    '2023-06-23',
    '2023-06-23 10:14:04'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    486,
    252,
    '20230600299',
    3000000,
    '3',
    1,
    '2023-06-23',
    '2023-06-23 10:15:08'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    487,
    379,
    '20230600300',
    500000,
    '-',
    1,
    '2023-06-23',
    '2023-06-23 10:15:18'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    488,
    263,
    '20230600301',
    4000000,
    '2',
    1,
    '2023-06-23',
    '2023-06-23 10:50:06'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    490,
    397,
    '20230600303',
    3000000,
    '1-VA 23 JUNI 23',
    1,
    '2023-06-23',
    '2023-06-23 11:08:17'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    491,
    269,
    '20230600304',
    3000000,
    '4',
    1,
    '2023-06-23',
    '2023-06-23 15:24:54'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    492,
    362,
    '20230600305',
    500000,
    '-',
    1,
    '2023-06-23',
    '2023-06-23 15:25:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    493,
    398,
    '20230600306',
    885000,
    '1',
    1,
    '2023-06-23',
    '2023-06-23 15:26:17'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    494,
    398,
    '20230600307',
    400000,
    '2 - va 23 juni 23',
    1,
    '2023-06-23',
    '2023-06-23 15:27:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    495,
    382,
    '20230600308',
    500000,
    '-',
    1,
    '2023-06-24',
    '2023-06-24 08:20:19'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    496,
    399,
    '20230600309',
    1285000,
    '-',
    1,
    '2023-06-24',
    '2023-06-24 08:21:06'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    497,
    372,
    '20230600310',
    500000,
    '-',
    1,
    '2023-06-24',
    '2023-06-24 08:23:32'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    498,
    356,
    '20230600311',
    2000000,
    '2',
    1,
    '2023-06-24',
    '2023-06-24 08:24:50'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    499,
    386,
    '20230600312',
    500000,
    '-',
    1,
    '2023-06-24',
    '2023-06-24 08:25:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    500,
    262,
    '20230600313',
    6000000,
    '2',
    1,
    '2023-06-24',
    '2023-06-24 08:29:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    501,
    394,
    '20230600314',
    500000,
    '-',
    1,
    '2023-06-24',
    '2023-06-24 08:29:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    502,
    258,
    '20230600315',
    600000,
    '3',
    1,
    '2023-06-24',
    '2023-06-24 08:32:41'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    503,
    375,
    '20230600316',
    500000,
    '-',
    1,
    '2023-06-24',
    '2023-06-24 08:32:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    504,
    381,
    '20230600317',
    500000,
    '-',
    1,
    '2023-06-24',
    '2023-06-24 08:33:56'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    505,
    371,
    '20230600318',
    500000,
    '-',
    1,
    '2023-06-24',
    '2023-06-24 08:45:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    506,
    264,
    '20230600319',
    1500000,
    '9',
    1,
    '2023-06-24',
    '2023-06-24 08:47:08'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    507,
    383,
    '20230600320',
    500000,
    '-',
    1,
    '2023-06-24',
    '2023-06-24 08:47:17'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    508,
    260,
    '20230600321',
    3000000,
    '3- VA 24 JUNI 23',
    1,
    '2023-06-24',
    '2023-06-24 10:31:32'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    509,
    374,
    '20230600322',
    500000,
    'VA 24 JUNI 23',
    1,
    '2023-06-24',
    '2023-06-24 10:31:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    510,
    385,
    '20230600323',
    500000,
    '-',
    1,
    '2023-06-24',
    '2023-06-24 10:33:04'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    512,
    265,
    '20230600325',
    1000000,
    '3',
    1,
    '2023-06-24',
    '2023-06-24 10:36:59'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    513,
    267,
    '20230600326',
    3000000,
    '3-VA 24 JUNI 23',
    1,
    '2023-06-24',
    '2023-06-24 10:52:33'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    514,
    384,
    '20230600327',
    500000,
    '-',
    1,
    '2023-06-24',
    '2023-06-24 12:11:39'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    515,
    401,
    '20230600328',
    1285000,
    '-',
    1,
    '2023-06-24',
    '2023-06-24 12:12:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    516,
    363,
    '20230600329',
    500000,
    '-',
    1,
    '2023-06-26',
    '2023-06-26 08:49:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    517,
    271,
    '20230600330',
    2000000,
    '5',
    1,
    '2023-06-26',
    '2023-06-26 08:51:35'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    518,
    400,
    '20230600331',
    1285000,
    '-',
    1,
    '2023-06-26',
    '2023-06-26 08:52:03'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    519,
    368,
    '20230600332',
    500000,
    '-',
    1,
    '2023-06-26',
    '2023-06-26 08:54:10'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    520,
    380,
    '20230600333',
    500000,
    '-',
    1,
    '2023-06-26',
    '2023-06-26 08:55:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    521,
    265,
    '20230600334',
    1000000,
    '4',
    1,
    '2023-06-26',
    '2023-06-26 08:55:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    522,
    402,
    '20230600335',
    9000000,
    '-',
    1,
    '2023-06-26',
    '2023-06-26 09:23:08'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    523,
    366,
    '20230600336',
    500000,
    '-',
    1,
    '2023-06-26',
    '2023-06-26 09:52:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    524,
    403,
    '20230600337',
    3000000,
    '1',
    1,
    '2023-06-26',
    '2023-06-26 10:57:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    525,
    404,
    '20230600338',
    720000,
    '-',
    1,
    '2023-06-26',
    '2023-06-26 12:01:15'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    526,
    405,
    '20230600339',
    720000,
    '-',
    1,
    '2023-06-26',
    '2023-06-26 12:02:10'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    527,
    406,
    '20230600340',
    3000000,
    '1',
    1,
    '2023-06-26',
    '2023-06-26 12:50:49'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    528,
    388,
    '20230600341',
    500000,
    'va 27 juni 23',
    1,
    '2023-06-27',
    '2023-06-27 09:02:45'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    529,
    408,
    '20230600342',
    500000,
    'va 26 juni 23',
    1,
    '2023-06-27',
    '2023-06-27 09:41:19'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    539,
    416,
    '20230700352',
    3000000,
    'MERI',
    1,
    '2023-07-06',
    '2023-07-06 07:58:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    540,
    417,
    '20230700353',
    4000000,
    'MERI',
    1,
    '2023-07-06',
    '2023-07-06 08:01:15'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    541,
    418,
    '20230700354',
    2000000,
    'MERI',
    1,
    '2023-07-06',
    '2023-07-06 08:03:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    542,
    419,
    '20230700355',
    500000,
    'MERI',
    1,
    '2023-07-06',
    '2023-07-06 08:06:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    543,
    356,
    '20230700356',
    1000000,
    '3',
    1,
    '2023-07-06',
    '2023-07-06 10:47:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    544,
    312,
    '20230700357',
    3000000,
    '3- VA 24 JUNI 23',
    1,
    '2023-07-06',
    '2023-07-06 10:50:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    545,
    393,
    '20230700358',
    500000,
    'VA 24 JUNI 23',
    1,
    '2023-07-06',
    '2023-07-06 10:50:27'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    546,
    377,
    '20230700359',
    500000,
    'VA 5 JULI 23',
    1,
    '2023-07-06',
    '2023-07-06 16:05:28'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    547,
    403,
    '20230700360',
    3000000,
    '2',
    1,
    '2023-07-10',
    '2023-07-10 10:29:49'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    548,
    420,
    '20230700361',
    1285000,
    'va 10 juli 23',
    1,
    '2023-07-10',
    '2023-07-10 11:00:19'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    549,
    421,
    '20230700362',
    1500000,
    '-',
    1,
    '2023-07-10',
    '2023-07-10 11:05:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    550,
    422,
    '20230700363',
    1285000,
    '-',
    1,
    '2023-07-10',
    '2023-07-10 13:13:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    551,
    423,
    '20230700364',
    1285000,
    '-',
    1,
    '2023-07-10',
    '2023-07-10 13:14:29'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    552,
    232,
    '20230700365',
    850000,
    '3',
    1,
    '2023-07-10',
    '2023-07-10 13:34:44'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    553,
    424,
    '20230700366',
    1285000,
    '-',
    1,
    '2023-07-10',
    '2023-07-10 13:57:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    554,
    392,
    '20230700367',
    500000,
    '-',
    1,
    '2023-07-10',
    '2023-07-10 13:57:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    555,
    425,
    '20230700368',
    1285000,
    '-',
    1,
    '2023-07-10',
    '2023-07-10 15:09:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    556,
    426,
    '20230700369',
    1285000,
    'va 10 juli 23',
    1,
    '2023-07-10',
    '2023-07-10 15:12:50'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    557,
    427,
    '20230700370',
    1285000,
    '-',
    1,
    '2023-07-10',
    '2023-07-10 15:15:54'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    558,
    428,
    '20230700371',
    1285000,
    '-',
    1,
    '2023-07-10',
    '2023-07-10 15:17:08'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    559,
    429,
    '20230700372',
    1285000,
    '-',
    1,
    '2023-07-10',
    '2023-07-10 15:19:58'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    560,
    430,
    '20230700373',
    1285000,
    'va 10 juli 23',
    1,
    '2023-07-10',
    '2023-07-10 15:21:43'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    561,
    431,
    '20230700374',
    1285000,
    '-',
    1,
    '2023-07-10',
    '2023-07-10 15:22:37'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    562,
    432,
    '20230700375',
    1285000,
    '-',
    1,
    '2023-07-10',
    '2023-07-10 15:23:41'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    563,
    433,
    '20230700376',
    1285000,
    'va 10 juli 23',
    1,
    '2023-07-10',
    '2023-07-10 15:25:06'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    564,
    434,
    '20230700377',
    1500000,
    '-',
    1,
    '2023-07-10',
    '2023-07-10 15:29:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    565,
    350,
    '20230700378',
    5000000,
    '2',
    1,
    '2023-07-11',
    '2023-07-11 09:09:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    566,
    435,
    '20230700379',
    1285000,
    '-',
    1,
    '2023-07-11',
    '2023-07-11 09:20:49'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    567,
    436,
    '20230700380',
    1285000,
    '-',
    1,
    '2023-07-11',
    '2023-07-11 09:52:17'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    568,
    265,
    '20230700381',
    1300000,
    '5',
    1,
    '2023-07-11',
    '2023-07-11 09:54:18'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    569,
    437,
    '20230700382',
    3000000,
    '1',
    1,
    '2023-07-11',
    '2023-07-11 12:30:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    570,
    438,
    '20230700383',
    1285000,
    '-',
    1,
    '2023-07-12',
    '2023-07-12 09:09:00'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    571,
    439,
    '20230700384',
    1285000,
    '-',
    1,
    '2023-07-12',
    '2023-07-12 09:10:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    573,
    442,
    '20230700386',
    485000,
    'VA 12 JULI 23',
    1,
    '2023-07-12',
    '2023-07-12 11:21:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    574,
    454,
    '20230700387',
    720000,
    'VA 12 JULI 23',
    1,
    '2023-07-12',
    '2023-07-12 12:12:08'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    575,
    453,
    '20230700388',
    720000,
    '-',
    1,
    '2023-07-12',
    '2023-07-12 12:12:55'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    576,
    455,
    '20230700389',
    1500000,
    '-',
    1,
    '2023-07-12',
    '2023-07-12 12:37:45'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    577,
    456,
    '20230700390',
    1285000,
    '-',
    1,
    '2023-07-13',
    '2023-07-13 09:19:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    578,
    457,
    '20230700391',
    1285000,
    'va 13 juli 23',
    1,
    '2023-07-13',
    '2023-07-13 11:21:38'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    579,
    458,
    '20230700392',
    1285000,
    'VA 12 JULI 23',
    1,
    '2023-07-13',
    '2023-07-13 11:24:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    580,
    364,
    '20230700393',
    500000,
    'va 7 juli 23',
    1,
    '2023-07-13',
    '2023-07-13 11:29:33'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    581,
    459,
    '20230700394',
    1000000,
    'VA 12 JULI 23',
    1,
    '2023-07-13',
    '2023-07-13 11:30:49'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    582,
    459,
    '20230700395',
    285000,
    '2',
    1,
    '2023-07-13',
    '2023-07-13 11:31:22'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    583,
    311,
    '20230700396',
    715000,
    '4',
    1,
    '2023-07-13',
    '2023-07-13 11:32:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    584,
    460,
    '20230700397',
    1285000,
    '-',
    1,
    '2023-07-13',
    '2023-07-13 11:38:38'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    585,
    461,
    '20230700398',
    3000000,
    '1',
    1,
    '2023-07-13',
    '2023-07-13 13:30:05'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    586,
    485,
    '20230700399',
    8100000,
    'lunas',
    1,
    '2023-07-14',
    '2023-07-14 11:00:06'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    587,
    522,
    '20230700400',
    8100000,
    'lunas',
    1,
    '2023-07-14',
    '2023-07-14 11:00:18'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    588,
    536,
    '20230700401',
    1500000,
    '-',
    1,
    '2023-07-15',
    '2023-07-15 09:10:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    589,
    445,
    '20230700402',
    485000,
    '-',
    1,
    '2023-07-17',
    '2023-07-17 08:32:15'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    590,
    447,
    '20230700403',
    485000,
    '-',
    1,
    '2023-07-17',
    '2023-07-17 08:55:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    591,
    451,
    '20230700404',
    485000,
    '-',
    1,
    '2023-07-17',
    '2023-07-17 08:56:11'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    594,
    337,
    '20230700407',
    3250000,
    'VA 14 JULI 23',
    1,
    '2023-07-17',
    '2023-07-17 09:14:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    595,
    440,
    '20230700408',
    485000,
    'VA 14 JULI 23',
    1,
    '2023-07-17',
    '2023-07-17 09:14:38'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    596,
    452,
    '20230700409',
    485000,
    '-',
    1,
    '2023-07-17',
    '2023-07-17 09:17:20'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    597,
    449,
    '20230700410',
    485000,
    '-',
    1,
    '2023-07-17',
    '2023-07-17 09:18:18'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    598,
    328,
    '20230700411',
    3500000,
    '2',
    1,
    '2023-07-17',
    '2023-07-17 09:23:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    599,
    328,
    '20230700412',
    150000,
    'VA 17 JULI 23',
    1,
    '2023-07-17',
    '2023-07-17 09:26:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    601,
    538,
    '20230700414',
    456500,
    '1 - VA 17 JULI 23',
    1,
    '2023-07-17',
    '2023-07-17 09:29:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    602,
    450,
    '20230700415',
    485000,
    '-',
    1,
    '2023-07-17',
    '2023-07-17 09:35:33'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    603,
    295,
    '20230700416',
    3750000,
    '2',
    1,
    '2023-07-17',
    '2023-07-17 09:36:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    604,
    446,
    '20230700417',
    485000,
    '-',
    1,
    '2023-07-17',
    '2023-07-17 09:38:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    605,
    443,
    '20230700418',
    485000,
    '-',
    1,
    '2023-07-17',
    '2023-07-17 09:39:07'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    606,
    444,
    '20230700419',
    485000,
    '-',
    1,
    '2023-07-17',
    '2023-07-17 09:40:24'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    607,
    305,
    '20230700420',
    200000,
    '4',
    1,
    '2023-07-17',
    '2023-07-17 09:41:55'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    608,
    539,
    '20230700421',
    1500000,
    'lunas',
    1,
    '2023-07-17',
    '2023-07-17 13:00:17'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    609,
    540,
    '20230700422',
    1500000,
    '-',
    1,
    '2023-07-17',
    '2023-07-17 13:31:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    610,
    541,
    '20230700423',
    1500000,
    '-',
    1,
    '2023-07-18',
    '2023-07-18 10:08:43'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    611,
    416,
    '20230700424',
    2000000,
    '2',
    1,
    '2023-07-18',
    '2023-07-18 10:08:59'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    612,
    330,
    '20230700425',
    2000000,
    '2',
    1,
    '2023-07-18',
    '2023-07-18 10:24:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    613,
    542,
    '20230700426',
    1500000,
    '-',
    1,
    '2023-07-20',
    '2023-07-20 11:55:10'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    614,
    543,
    '20230700427',
    1500000,
    '-',
    1,
    '2023-07-20',
    '2023-07-20 12:23:39'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    615,
    544,
    '20230700428',
    3000000,
    '1',
    1,
    '2023-07-20',
    '2023-07-20 12:40:27'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    616,
    545,
    '20230700429',
    3000000,
    '1',
    1,
    '2023-07-21',
    '2023-07-21 09:17:57'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    617,
    546,
    '20230700430',
    4000000,
    '3-lunas',
    1,
    '2023-07-21',
    '2023-07-21 10:29:57'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    618,
    546,
    '20230700431',
    5000000,
    '1 - va 7 juni 23',
    1,
    '2023-07-21',
    '2023-07-21 10:35:20'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    619,
    546,
    '20230700432',
    5000000,
    '2-va 4 juli 23',
    1,
    '2023-07-21',
    '2023-07-21 10:36:27'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    620,
    547,
    '20230700433',
    3000000,
    '1-va 4 maret 23',
    1,
    '2023-07-21',
    '2023-07-21 10:37:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    621,
    547,
    '20230700434',
    8000000,
    '2 - va 20 mei 23',
    1,
    '2023-07-21',
    '2023-07-21 10:38:49'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    622,
    547,
    '20230700435',
    1000000,
    '3 - va 7 juni 23',
    1,
    '2023-07-21',
    '2023-07-21 10:39:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    623,
    549,
    '20230700436',
    3000000,
    'meri; 16 des 22',
    1,
    '2023-07-21',
    '2023-07-21 10:42:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    624,
    549,
    '20230700437',
    2000000,
    '2- va 4 maret 23',
    1,
    '2023-07-21',
    '2023-07-21 10:43:08'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    625,
    350,
    '20230700438',
    1000000,
    '3',
    1,
    '2023-07-21',
    '2023-07-21 11:43:06'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    626,
    550,
    '20230700439',
    4000000,
    '1',
    1,
    '2023-07-21',
    '2023-07-21 11:43:17'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    627,
    551,
    '20230700440',
    1500000,
    '-',
    1,
    '2023-07-21',
    '2023-07-21 13:31:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    628,
    332,
    '20230700441',
    250000,
    '2',
    1,
    '2023-07-21',
    '2023-07-21 13:40:45'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    629,
    552,
    '20230700442',
    720000,
    '-',
    1,
    '2023-07-21',
    '2023-07-21 13:41:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    630,
    317,
    '20230700443',
    4750000,
    '1',
    1,
    '2023-07-21',
    '2023-07-21 13:42:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    631,
    553,
    '20230700444',
    700000,
    '-',
    1,
    '2023-07-21',
    '2023-07-21 13:47:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    632,
    554,
    '20230700445',
    720000,
    '-',
    1,
    '2023-07-21',
    '2023-07-21 13:47:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    633,
    555,
    '20230700446',
    10800000,
    'lunas',
    1,
    '2023-07-21',
    '2023-07-21 14:58:56'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    634,
    556,
    '20230700447',
    2000000,
    '2',
    1,
    '2023-07-21',
    '2023-07-21 15:09:23'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    635,
    557,
    '20230700448',
    3000000,
    '1',
    1,
    '2023-07-21',
    '2023-07-21 15:09:35'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    636,
    559,
    '20230700449',
    1500000,
    '-',
    1,
    '2023-07-22',
    '2023-07-22 11:31:22'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    637,
    330,
    '20230700450',
    500000,
    '3',
    1,
    '2023-07-22',
    '2023-07-22 15:30:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    638,
    560,
    '20230700451',
    720000,
    'lunas',
    1,
    '2023-07-26',
    '2023-07-26 09:17:42'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    639,
    561,
    '20230700452',
    1500000,
    'LUNAS',
    1,
    '2023-07-26',
    '2023-07-26 10:08:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    640,
    236,
    '20230700453',
    4000000,
    '1',
    1,
    '2023-07-28',
    '2023-07-28 13:06:22'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    641,
    562,
    '20230700454',
    3000000,
    '1- SMT 1',
    1,
    '2023-07-31',
    '2023-07-31 08:38:36'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    642,
    563,
    '20230700455',
    3000000,
    '1- VA 31 JULI 23',
    1,
    '2023-07-31',
    '2023-07-31 12:42:05'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    643,
    564,
    '20230700456',
    3500000,
    '1',
    1,
    '2023-07-31',
    '2023-07-31 12:47:03'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    644,
    565,
    '20230800457',
    3500000,
    '1',
    1,
    '2023-08-01',
    '2023-08-01 10:45:22'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    645,
    566,
    '20230800458',
    1500000,
    '-',
    1,
    '2023-08-01',
    '2023-08-01 10:45:37'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    646,
    416,
    '20230800459',
    4000000,
    'lunas',
    1,
    '2023-08-02',
    '2023-08-02 09:24:43'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    647,
    418,
    '20230800460',
    1400000,
    '2',
    1,
    '2023-08-02',
    '2023-08-02 09:52:38'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    648,
    567,
    '20230800461',
    3000000,
    '1-va 2 agustus 23',
    1,
    '2023-08-02',
    '2023-08-02 15:33:12'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    649,
    568,
    '20230800462',
    5000000,
    '1',
    1,
    '2023-08-03',
    '2023-08-03 09:58:56'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    650,
    417,
    '20230800463',
    5000000,
    '2',
    1,
    '2023-08-04',
    '2023-08-04 08:56:32'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    651,
    232,
    '20230800464',
    1200000,
    '4',
    1,
    '2023-08-04',
    '2023-08-04 14:05:03'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    652,
    565,
    '20230800465',
    5500000,
    '2',
    1,
    '2023-08-04',
    '2023-08-04 15:01:04'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    653,
    414,
    '20230800466',
    5500000,
    '2',
    1,
    '2023-08-04',
    '2023-08-04 15:03:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    654,
    569,
    '20230800467',
    5000000,
    '1-va 4 AGUSTUS 23',
    1,
    '2023-08-04',
    '2023-08-04 15:12:19'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    655,
    557,
    '20230800468',
    9000000,
    '2',
    1,
    '2023-08-05',
    '2023-08-05 09:35:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    656,
    570,
    '20230800469',
    9000000,
    '1',
    1,
    '2023-08-05',
    '2023-08-05 09:38:23'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    657,
    550,
    '20230800470',
    1200000,
    'DARI SMT 1-DISKON ALUMNI',
    1,
    '2023-08-05',
    '2023-08-05 09:47:56'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    658,
    550,
    '20230800471',
    6800000,
    '3',
    1,
    '2023-08-05',
    '2023-08-05 09:48:39'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    659,
    571,
    '20230800472',
    9000000,
    'lunas',
    1,
    '2023-08-05',
    '2023-08-05 12:27:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    660,
    572,
    '20230800473',
    3000000,
    'va - 6 Agus 23',
    1,
    '2023-08-08',
    '2023-08-08 14:22:18'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    661,
    315,
    '20230800474',
    1100000,
    'fee',
    1,
    '2023-08-16',
    '2023-08-16 08:38:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    662,
    573,
    '20230800475',
    400000,
    'fee',
    1,
    '2023-08-16',
    '2023-08-16 08:41:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    664,
    573,
    '20230800477',
    1000000,
    '2- meri',
    1,
    '2023-08-16',
    '2023-08-16 08:44:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    665,
    570,
    '20230800478',
    1800000,
    '2',
    1,
    '2023-08-16',
    '2023-08-16 13:05:59'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    666,
    289,
    '20230800479',
    6000000,
    '2',
    1,
    '2023-08-18',
    '2023-08-18 14:28:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    667,
    574,
    '20230800480',
    8000000,
    '1',
    1,
    '2023-08-18',
    '2023-08-18 14:31:15'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    668,
    575,
    '20230800481',
    9000000,
    'va 19 agus 23',
    1,
    '2023-08-19',
    '2023-08-19 11:39:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    669,
    576,
    '20230800482',
    1500000,
    'va 20 juli 23',
    1,
    '2023-08-19',
    '2023-08-19 11:40:48'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    670,
    545,
    '20230800483',
    3500000,
    '2',
    1,
    '2023-08-19',
    '2023-08-19 11:57:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    671,
    545,
    '20230800484',
    2500000,
    '3-va 19 agus 23',
    1,
    '2023-08-19',
    '2023-08-19 11:58:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    672,
    461,
    '20230800485',
    6000000,
    '2',
    1,
    '2023-08-19',
    '2023-08-19 12:12:48'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    673,
    577,
    '20230800486',
    3000000,
    '1',
    1,
    '2023-08-22',
    '2023-08-22 11:45:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    674,
    578,
    '20230800487',
    2500000,
    '1',
    1,
    '2023-08-22',
    '2023-08-22 13:55:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    675,
    579,
    '20230800488',
    3000000,
    '1',
    1,
    '2023-08-23',
    '2023-08-23 09:25:03'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    676,
    580,
    '20230800489',
    4000000,
    '2',
    1,
    '2023-08-23',
    '2023-08-23 14:05:05'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    677,
    581,
    '20230800490',
    7000000,
    'VA 23 AGUS 23',
    1,
    '2023-08-23',
    '2023-08-23 16:00:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    678,
    581,
    '20230800491',
    2000000,
    '2',
    1,
    '2023-08-23',
    '2023-08-23 16:00:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    679,
    582,
    '20230800492',
    1500000,
    'va 20 juli 23',
    1,
    '2023-08-23',
    '2023-08-23 16:01:42'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    680,
    583,
    '20230800493',
    2500000,
    '1',
    1,
    '2023-08-24',
    '2023-08-24 09:03:29'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    681,
    584,
    '20230800494',
    4000000,
    '2',
    1,
    '2023-08-24',
    '2023-08-24 09:52:29'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    682,
    585,
    '20230800495',
    6500000,
    'meri',
    1,
    '2023-08-24',
    '2023-08-24 09:58:10'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    683,
    586,
    '20230800496',
    4500000,
    '2-LUNAS',
    1,
    '2023-08-25',
    '2023-08-25 10:05:00'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    684,
    587,
    '20230800497',
    1500000,
    'lunas',
    1,
    '2023-08-25',
    '2023-08-25 10:05:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    685,
    569,
    '20230800498',
    700000,
    '2',
    1,
    '2023-08-25',
    '2023-08-25 10:56:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    686,
    569,
    '20230800499',
    1300000,
    'va 25 agust 23',
    1,
    '2023-08-25',
    '2023-08-25 10:59:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    687,
    588,
    '20230800500',
    500000,
    '2',
    1,
    '2023-08-25',
    '2023-08-25 14:53:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    688,
    589,
    '20230800501',
    1500000,
    'lunas',
    1,
    '2023-08-25',
    '2023-08-25 14:57:40'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    690,
    590,
    '20230800503',
    4000000,
    '2- VA 26 AGUS 23',
    1,
    '2023-08-26',
    '2023-08-26 12:42:22'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    691,
    591,
    '20230800504',
    4000000,
    '2',
    1,
    '2023-08-26',
    '2023-08-26 14:32:16'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    692,
    592,
    '20230800505',
    2500000,
    '2',
    1,
    '2023-08-26',
    '2023-08-26 16:41:36'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    693,
    592,
    '20230800506',
    2000000,
    '3-va 26 agus 23',
    1,
    '2023-08-26',
    '2023-08-26 16:41:54'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    694,
    593,
    '20230800507',
    3000000,
    'va 26 agus 23',
    1,
    '2023-08-26',
    '2023-08-26 18:00:19'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    696,
    342,
    '20230900509',
    2500000,
    '2 - VA 4 SEP 23',
    1,
    '2023-09-04',
    '2023-09-04 11:45:55'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    697,
    594,
    '20230900510',
    720000,
    'MERI',
    1,
    '2023-09-04',
    '2023-09-04 11:48:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    699,
    595,
    '20230900512',
    3000000,
    '1- va 5 sept 23',
    1,
    '2023-09-05',
    '2023-09-05 09:07:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    700,
    596,
    '20230900513',
    1500000,
    '-',
    1,
    '2023-09-05',
    '2023-09-05 13:17:39'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    701,
    597,
    '20230900514',
    3000000,
    'VA 6 SEP 23',
    1,
    '2023-09-06',
    '2023-09-06 11:55:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    702,
    598,
    '20230900515',
    1500000,
    'VA 6 SEP 23',
    1,
    '2023-09-06',
    '2023-09-06 11:59:36'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    703,
    413,
    '20230900516',
    3500000,
    '2',
    1,
    '2023-09-06',
    '2023-09-06 13:52:03'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    704,
    599,
    '20230900517',
    6000000,
    '1',
    1,
    '2023-09-07',
    '2023-09-07 13:33:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    705,
    573,
    '20230900518',
    1000000,
    '4',
    1,
    '2023-09-09',
    '2023-09-09 10:56:49'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    706,
    479,
    '20230900519',
    3000000,
    '1',
    1,
    '2023-09-11',
    '2023-09-11 09:16:33'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    707,
    478,
    '20230900520',
    2500000,
    '1',
    1,
    '2023-09-11',
    '2023-09-11 09:19:40'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    708,
    600,
    '20230900521',
    6250000,
    'smt 5',
    1,
    '2023-09-11',
    '2023-09-11 11:49:37'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    709,
    601,
    '20230900522',
    3000000,
    '-',
    1,
    '2023-09-11',
    '2023-09-11 13:03:28'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    710,
    282,
    '20230900523',
    2000000,
    'lunas',
    1,
    '2023-09-11',
    '2023-09-11 13:30:00'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    711,
    465,
    '20230900524',
    1500000,
    '1',
    1,
    '2023-09-13',
    '2023-09-13 09:29:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    712,
    602,
    '20230900525',
    9000000,
    'VA 13 sep 23',
    1,
    '2023-09-13',
    '2023-09-13 09:56:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    713,
    603,
    '20230900526',
    3000000,
    'VA 13 sep 23',
    1,
    '2023-09-13',
    '2023-09-13 09:56:29'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    714,
    468,
    '20230900527',
    4000000,
    '1',
    1,
    '2023-09-13',
    '2023-09-13 10:09:38'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    716,
    235,
    '20230900529',
    4500000,
    '2 - VA 13 sep 23',
    1,
    '2023-09-13',
    '2023-09-13 11:11:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    717,
    482,
    '20230900530',
    3000000,
    '1',
    1,
    '2023-09-13',
    '2023-09-13 14:19:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    718,
    604,
    '20230900531',
    3000000,
    '-',
    1,
    '2023-09-13',
    '2023-09-13 15:39:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    719,
    476,
    '20230900532',
    2000000,
    '1',
    1,
    '2023-09-15',
    '2023-09-15 13:08:32'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    720,
    605,
    '20230900533',
    3000000,
    '1',
    1,
    '2023-09-16',
    '2023-09-16 10:09:17'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    721,
    606,
    '20230900534',
    3000000,
    'va 18 sep 23',
    1,
    '2023-09-18',
    '2023-09-18 12:33:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    722,
    607,
    '20230900535',
    3000000,
    '-',
    1,
    '2023-09-18',
    '2023-09-18 13:26:36'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    723,
    608,
    '20230900536',
    3000000,
    '-',
    1,
    '2023-09-18',
    '2023-09-18 13:39:32'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    724,
    609,
    '20230900537',
    3000000,
    'va 18 sep 23',
    1,
    '2023-09-18',
    '2023-09-18 13:44:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    725,
    610,
    '20230900538',
    1500000,
    '1',
    1,
    '2023-09-18',
    '2023-09-18 14:43:11'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    726,
    610,
    '20230900539',
    1000000,
    'va 18 sep 23',
    1,
    '2023-09-18',
    '2023-09-18 14:44:39'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    727,
    611,
    '20230900540',
    5000000,
    '1',
    1,
    '2023-09-18',
    '2023-09-18 15:18:18'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    728,
    612,
    '20230900541',
    3000000,
    '-',
    1,
    '2023-09-20',
    '2023-09-20 15:34:40'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    729,
    486,
    '20230900542',
    500000,
    '1',
    1,
    '2023-09-20',
    '2023-09-20 15:45:48'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    730,
    466,
    '20230900543',
    9000000,
    '-',
    1,
    '2023-09-20',
    '2023-09-20 15:47:32'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    732,
    613,
    '20230900545',
    3000000,
    '-',
    1,
    '2023-09-23',
    '2023-09-23 09:07:29'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    733,
    610,
    '20230900546',
    500000,
    '3',
    1,
    '2023-09-23',
    '2023-09-23 09:10:16'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    734,
    471,
    '20230900547',
    3000000,
    '1',
    1,
    '2023-09-23',
    '2023-09-23 10:25:37'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    735,
    475,
    '20230900548',
    1000000,
    '1',
    1,
    '2023-09-23',
    '2023-09-23 10:27:08'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    736,
    614,
    '20230900549',
    3000000,
    '1- VA 18 SEP 23',
    1,
    '2023-09-23',
    '2023-09-23 11:22:39'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    737,
    616,
    '20230900550',
    500000,
    '-',
    1,
    '2023-09-23',
    '2023-09-23 11:28:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    738,
    615,
    '20230900551',
    3000000,
    '1',
    1,
    '2023-09-23',
    '2023-09-23 11:28:39'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    739,
    617,
    '20230900552',
    3000000,
    '1',
    1,
    '2023-09-23',
    '2023-09-23 11:35:08'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    740,
    357,
    '20230900553',
    3000000,
    '2',
    1,
    '2023-09-23',
    '2023-09-23 11:39:16'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    741,
    618,
    '20230900554',
    3000000,
    '-',
    1,
    '2023-09-23',
    '2023-09-23 14:10:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    742,
    597,
    '20230900555',
    5000000,
    '2-VA 25 SEP 23',
    1,
    '2023-09-25',
    '2023-09-25 08:54:57'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    743,
    619,
    '20230900556',
    500000,
    'VA 25 SEP 23',
    1,
    '2023-09-25',
    '2023-09-25 08:55:46'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    744,
    491,
    '20230900557',
    3000000,
    '1 va 24 sep 23',
    1,
    '2023-09-29',
    '2023-09-29 10:12:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    745,
    620,
    '20230900558',
    1000000,
    '1- VA 13 SEP 23',
    1,
    '2023-09-29',
    '2023-09-29 13:28:32'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    746,
    620,
    '20230900559',
    500000,
    '2- 15 SEP 23',
    1,
    '2023-09-29',
    '2023-09-29 13:28:50'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    747,
    620,
    '20230900560',
    1500000,
    '3-VA 29 SEP 23',
    1,
    '2023-09-29',
    '2023-09-29 13:29:10'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    748,
    621,
    '20230900561',
    3000000,
    '1',
    1,
    '2023-09-29',
    '2023-09-29 14:36:51'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    749,
    622,
    '20230900562',
    3000000,
    '-',
    1,
    '2023-09-29',
    '2023-09-29 15:08:18'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    750,
    623,
    '20230900563',
    3000000,
    '-',
    1,
    '2023-09-29',
    '2023-09-29 15:10:05'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    751,
    624,
    '20230900564',
    1200000,
    'va 16 agus 23',
    1,
    '2023-09-29',
    '2023-09-29 15:15:18'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    752,
    625,
    '20231000565',
    3000000,
    '1',
    1,
    '2023-10-02',
    '2023-10-02 10:11:34'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    753,
    626,
    '20231000566',
    500000,
    '-',
    1,
    '2023-10-02',
    '2023-10-02 10:13:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    754,
    474,
    '20231000567',
    1000000,
    '1',
    1,
    '2023-10-02',
    '2023-10-02 11:16:32'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    755,
    567,
    '20231000568',
    3000000,
    '2-va 2 okt 23',
    1,
    '2023-10-02',
    '2023-10-02 14:15:45'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    756,
    627,
    '20231000569',
    3000000,
    '-',
    1,
    '2023-10-03',
    '2023-10-03 09:22:06'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    758,
    629,
    '20231000571',
    3000000,
    '1',
    1,
    '2023-10-03',
    '2023-10-03 09:42:25'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    759,
    630,
    '20231000572',
    400000,
    '7',
    1,
    '2023-10-04',
    '2023-10-04 08:38:59'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    761,
    631,
    '20231000574',
    1800000,
    '2',
    1,
    '2023-10-04',
    '2023-10-04 08:46:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    762,
    632,
    '20231000575',
    3000000,
    '-',
    1,
    '2023-10-04',
    '2023-10-04 08:49:42'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    763,
    633,
    '20231000576',
    3000000,
    'VA 3 OKT 23',
    1,
    '2023-10-04',
    '2023-10-04 08:52:56'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    764,
    635,
    '20231000577',
    2000000,
    '-',
    1,
    '2023-10-04',
    '2023-10-04 10:31:13'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    765,
    636,
    '20231000578',
    500000,
    '1',
    1,
    '2023-10-04',
    '2023-10-04 10:35:10'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    766,
    637,
    '20231000579',
    3000000,
    'VA 4 OKT 23',
    1,
    '2023-10-04',
    '2023-10-04 10:38:32'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    767,
    638,
    '20231000580',
    3000000,
    '-',
    1,
    '2023-10-04',
    '2023-10-04 10:39:53'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    768,
    639,
    '20231000581',
    3000000,
    '-',
    1,
    '2023-10-04',
    '2023-10-04 10:41:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    769,
    640,
    '20231000582',
    3000000,
    '-',
    1,
    '2023-10-04',
    '2023-10-04 10:43:37'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    770,
    641,
    '20231000583',
    3000000,
    '-',
    1,
    '2023-10-04',
    '2023-10-04 10:49:18'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    771,
    642,
    '20231000584',
    3000000,
    'VA 4 OKT 23',
    1,
    '2023-10-04',
    '2023-10-04 10:52:45'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    772,
    624,
    '20231000585',
    1800000,
    '2',
    1,
    '2023-10-04',
    '2023-10-04 10:54:52'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    773,
    643,
    '20231000586',
    3000000,
    'VA 4 OKT 23',
    1,
    '2023-10-04',
    '2023-10-04 10:59:07'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    774,
    644,
    '20231000587',
    3000000,
    'VA 4 OKT 23',
    1,
    '2023-10-04',
    '2023-10-04 11:00:36'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    775,
    646,
    '20231000588',
    3000000,
    '-',
    1,
    '2023-10-04',
    '2023-10-04 11:04:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    776,
    645,
    '20231000589',
    3000000,
    '-',
    1,
    '2023-10-04',
    '2023-10-04 11:05:41'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    777,
    648,
    '20231000590',
    2000000,
    '-',
    1,
    '2023-10-04',
    '2023-10-04 11:08:54'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    778,
    649,
    '20231000591',
    2000000,
    '-',
    1,
    '2023-10-04',
    '2023-10-04 11:11:35'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    779,
    650,
    '20231000592',
    1000000,
    '1',
    1,
    '2023-10-04',
    '2023-10-04 11:13:30'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    780,
    651,
    '20231000593',
    2000000,
    '-',
    1,
    '2023-10-04',
    '2023-10-04 11:15:24'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    781,
    652,
    '20231000594',
    3000000,
    '-',
    1,
    '2023-10-04',
    '2023-10-04 12:53:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    783,
    481,
    '20231000596',
    2500000,
    '1 - VA 4 OKT 23',
    1,
    '2023-10-04',
    '2023-10-04 12:58:35'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    784,
    486,
    '20231000597',
    3000000,
    '2',
    1,
    '2023-10-04',
    '2023-10-04 15:34:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    785,
    653,
    '20231000598',
    2000000,
    '-',
    1,
    '2023-10-04',
    '2023-10-04 15:46:04'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    786,
    437,
    '20231000599',
    1500000,
    '2',
    1,
    '2023-10-04',
    '2023-10-04 15:46:47'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    787,
    356,
    '20231000600',
    500000,
    '6',
    1,
    '2023-10-04',
    '2023-10-04 15:53:44'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    788,
    489,
    '20231000601',
    1500000,
    '1',
    1,
    '2023-10-04',
    '2023-10-04 15:54:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    789,
    654,
    '20231000602',
    1000000,
    '1',
    1,
    '2023-10-05',
    '2023-10-05 10:46:42'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    790,
    655,
    '20231000603',
    2000000,
    'VA 5 OKT 23',
    1,
    '2023-10-05',
    '2023-10-05 10:58:48'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    791,
    656,
    '20231000604',
    2000000,
    '1',
    1,
    '2023-10-05',
    '2023-10-05 11:04:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    792,
    657,
    '20231000605',
    2000000,
    'VA 5 OKT 23',
    1,
    '2023-10-05',
    '2023-10-05 11:08:00'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    793,
    658,
    '20231000606',
    3000000,
    '-',
    1,
    '2023-10-05',
    '2023-10-05 11:23:41'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    794,
    659,
    '20231000607',
    600000,
    '1- VA 5 OKT 23',
    1,
    '2023-10-05',
    '2023-10-05 11:32:21'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    795,
    660,
    '20231000608',
    3000000,
    '-',
    1,
    '2023-10-05',
    '2023-10-05 15:22:02'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    796,
    661,
    '20231000609',
    3000000,
    '-',
    1,
    '2023-10-06',
    '2023-10-06 09:21:57'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    797,
    475,
    '20231000610',
    2000000,
    '2',
    1,
    '2023-10-06',
    '2023-10-06 13:24:26'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    798,
    662,
    '20231000611',
    500000,
    '-',
    1,
    '2023-10-09',
    '2023-10-09 09:50:31'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    799,
    663,
    '20231000612',
    500000,
    'VA 9 OKT 23',
    1,
    '2023-10-09',
    '2023-10-09 09:53:17'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    801,
    664,
    '20231000614',
    1000000,
    '1- VA 9 OKT 23',
    1,
    '2023-10-09',
    '2023-10-09 10:26:25'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    802,
    665,
    '20231000615',
    3000000,
    '-',
    1,
    '2023-10-09',
    '2023-10-09 11:26:09'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    803,
    469,
    '20231000616',
    2000000,
    '1',
    1,
    '2023-10-09',
    '2023-10-09 11:45:14'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    804,
    666,
    '20231000617',
    5000000,
    '1',
    1,
    '2023-10-09',
    '2023-10-09 14:50:37'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    805,
    590,
    '20231000618',
    3000000,
    'lunas-va 9 okt 23',
    1,
    '2023-10-09',
    '2023-10-09 15:15:01'
  );
INSERT INTO
  `bebas_pay` (
    `bebas_pay_id`,
    `bebas_bebas_id`,
    `bebas_pay_number`,
    `bebas_pay_bill`,
    `bebas_pay_desc`,
    `user_user_id`,
    `bebas_pay_input_date`,
    `bebas_pay_last_update`
  )
VALUES
  (
    806,
    667,
    '20231000619',
    3000000,
    'va 30 sept 23',
    1,
    '2023-10-09',
    '2023-10-09 15:15:38'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: bulan
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cash_account
# ------------------------------------------------------------

INSERT INTO
  `cash_account` (
    `cash_account_id`,
    `account_account_id`,
    `cash_account_debit`,
    `cash_account_kredit`,
    `unit_unit_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    26,
    26,
    0,
    0,
    1,
    '2024-03-20 13:29:54',
    '2024-03-20 13:29:54'
  );
INSERT INTO
  `cash_account` (
    `cash_account_id`,
    `account_account_id`,
    `cash_account_debit`,
    `cash_account_kredit`,
    `unit_unit_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    27,
    27,
    0,
    0,
    1,
    '2024-03-29 21:09:19',
    '2024-04-27 16:55:47'
  );
INSERT INTO
  `cash_account` (
    `cash_account_id`,
    `account_account_id`,
    `cash_account_debit`,
    `cash_account_kredit`,
    `unit_unit_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    28,
    28,
    500,
    500,
    1,
    '2024-03-29 21:12:05',
    '2024-04-21 15:55:08'
  );
INSERT INTO
  `cash_account` (
    `cash_account_id`,
    `account_account_id`,
    `cash_account_debit`,
    `cash_account_kredit`,
    `unit_unit_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    29,
    29,
    0,
    0,
    1,
    '2024-07-13 19:00:37',
    '2024-07-13 19:00:37'
  );
INSERT INTO
  `cash_account` (
    `cash_account_id`,
    `account_account_id`,
    `cash_account_debit`,
    `cash_account_kredit`,
    `unit_unit_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    30,
    30,
    0,
    0,
    1,
    '2024-07-13 19:01:27',
    '2024-07-13 19:01:27'
  );
INSERT INTO
  `cash_account` (
    `cash_account_id`,
    `account_account_id`,
    `cash_account_debit`,
    `cash_account_kredit`,
    `unit_unit_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    31,
    33,
    0,
    0,
    2,
    '2024-07-20 15:46:46',
    '2024-07-20 15:46:46'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: ci_sessions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: class
# ------------------------------------------------------------

INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (1, '2021', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (2, '2022', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (3, 'S1 BIDAN 22', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (4, 'd3 bidan', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (5, 'S1 ADM RS 22', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (6, 'D3 BIDAN 2019', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (7, 'D3 BIDAN 2020', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (8, 'ADM RS 20', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (9, 'D3 BIDAN 2018', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (10, 'S1 BIDAN 23', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (11, 'Profesi 22', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (12, 'D3 BIDAN TK 1', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (13, 'D3 BIDAN TK 2', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (14, 'D3 BIDAN TK 3', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (15, 'S1 BIDAN TK 1', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (16, 'S1 BIDAN TK 2', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (17, ' S1 BIDAN TK 3', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (18, 'S1 BIDAN TK  4', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (19, 'S1 ADM TK 1', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (20, 'S1 ADM TK 2', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (21, 'S1 ADM TK 3', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (22, 'S1 ADM TK 4', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (23, 'RPL S1 BIDAN 23', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (24, 'ADMRS 23', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (25, 'PROFESI 23', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (26, 'aa', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (27, 'aaaa', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (28, 'sss', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (29, 'aa', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (30, 'aa', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (31, 'aaa', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (32, 'aaa', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (33, 'aa', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (34, 'aa', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (35, 'aa', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (36, 'aa', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (37, 'aa', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (38, 'aaa', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (39, 'fff', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (40, 'aaaa', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (41, 'ddd', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (42, 'ssss', 1);
INSERT INTO
  `class` (`class_id`, `class_name`, `unit_unit_id`)
VALUES
  (43, 'gggg', 1);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: debit
# ------------------------------------------------------------

INSERT INTO
  `debit` (
    `debit_id`,
    `debit_date`,
    `debit_no_ref`,
    `debit_desc`,
    `debit_value`,
    `user_user_id`,
    `account_cash_account`,
    `account_cost_account`,
    `debit_tax`,
    `debit_information`,
    `pos_pos_pay_id`,
    `debit_total`,
    `unit_unit_id`,
    `is_submit`,
    `debit_created_at`,
    `debit_updated_at`
  )
VALUES
  (
    1,
    '2024-04-18',
    'Dsadasdas',
    'asdasdsa',
    3,
    2,
    1,
    1,
    0,
    'asdasd',
    0,
    0,
    1,
    '0',
    '2024-04-05 16:23:59',
    '2024-04-05 16:23:59'
  );
INSERT INTO
  `debit` (
    `debit_id`,
    `debit_date`,
    `debit_no_ref`,
    `debit_desc`,
    `debit_value`,
    `user_user_id`,
    `account_cash_account`,
    `account_cost_account`,
    `debit_tax`,
    `debit_information`,
    `pos_pos_pay_id`,
    `debit_total`,
    `unit_unit_id`,
    `is_submit`,
    `debit_created_at`,
    `debit_updated_at`
  )
VALUES
  (
    2,
    '2024-04-21',
    'Dsadasdas',
    'adasdsa',
    3,
    2,
    1,
    1,
    0,
    'asdsdd',
    NULL,
    0,
    1,
    '1',
    '2024-04-05 16:25:10',
    '2024-06-28 08:27:18'
  );
INSERT INTO
  `debit` (
    `debit_id`,
    `debit_date`,
    `debit_no_ref`,
    `debit_desc`,
    `debit_value`,
    `user_user_id`,
    `account_cash_account`,
    `account_cost_account`,
    `debit_tax`,
    `debit_information`,
    `pos_pos_pay_id`,
    `debit_total`,
    `unit_unit_id`,
    `is_submit`,
    `debit_created_at`,
    `debit_updated_at`
  )
VALUES
  (
    3,
    '2024-04-05',
    '',
    'dd',
    2,
    2,
    7,
    28,
    0,
    'dd',
    NULL,
    0,
    1,
    '0',
    '2024-04-05 20:06:18',
    '2024-04-05 20:06:18'
  );
INSERT INTO
  `debit` (
    `debit_id`,
    `debit_date`,
    `debit_no_ref`,
    `debit_desc`,
    `debit_value`,
    `user_user_id`,
    `account_cash_account`,
    `account_cost_account`,
    `debit_tax`,
    `debit_information`,
    `pos_pos_pay_id`,
    `debit_total`,
    `unit_unit_id`,
    `is_submit`,
    `debit_created_at`,
    `debit_updated_at`
  )
VALUES
  (
    6,
    '2024-04-04',
    'JMSMK0504240001',
    'ddd',
    2,
    2,
    7,
    28,
    0,
    'ddfff',
    NULL,
    0,
    1,
    '1',
    '2024-04-05 20:22:32',
    '2024-04-05 20:35:45'
  );
INSERT INTO
  `debit` (
    `debit_id`,
    `debit_date`,
    `debit_no_ref`,
    `debit_desc`,
    `debit_value`,
    `user_user_id`,
    `account_cash_account`,
    `account_cost_account`,
    `debit_tax`,
    `debit_information`,
    `pos_pos_pay_id`,
    `debit_total`,
    `unit_unit_id`,
    `is_submit`,
    `debit_created_at`,
    `debit_updated_at`
  )
VALUES
  (
    7,
    '2024-07-20',
    'JMSMK2007240001',
    'ddd',
    23,
    2,
    7,
    30,
    0,
    'ddd',
    NULL,
    230,
    1,
    '1',
    '2024-07-20 13:45:28',
    '2024-07-20 13:48:20'
  );
INSERT INTO
  `debit` (
    `debit_id`,
    `debit_date`,
    `debit_no_ref`,
    `debit_desc`,
    `debit_value`,
    `user_user_id`,
    `account_cash_account`,
    `account_cost_account`,
    `debit_tax`,
    `debit_information`,
    `pos_pos_pay_id`,
    `debit_total`,
    `unit_unit_id`,
    `is_submit`,
    `debit_created_at`,
    `debit_updated_at`
  )
VALUES
  (
    8,
    '2024-07-10',
    'JMSMK2007240002',
    'ddd',
    22,
    2,
    7,
    30,
    0,
    'ddd',
    NULL,
    22,
    1,
    '0',
    '2024-07-20 13:50:48',
    '2024-07-20 13:50:48'
  );
INSERT INTO
  `debit` (
    `debit_id`,
    `debit_date`,
    `debit_no_ref`,
    `debit_desc`,
    `debit_value`,
    `user_user_id`,
    `account_cash_account`,
    `account_cost_account`,
    `debit_tax`,
    `debit_information`,
    `pos_pos_pay_id`,
    `debit_total`,
    `unit_unit_id`,
    `is_submit`,
    `debit_created_at`,
    `debit_updated_at`
  )
VALUES
  (
    9,
    '2024-07-20',
    'JMSMK2007240002',
    'dd',
    22,
    2,
    19,
    30,
    0,
    'ddd',
    NULL,
    22,
    1,
    '0',
    '2024-07-20 13:54:17',
    '2024-07-20 13:54:17'
  );
INSERT INTO
  `debit` (
    `debit_id`,
    `debit_date`,
    `debit_no_ref`,
    `debit_desc`,
    `debit_value`,
    `user_user_id`,
    `account_cash_account`,
    `account_cost_account`,
    `debit_tax`,
    `debit_information`,
    `pos_pos_pay_id`,
    `debit_total`,
    `unit_unit_id`,
    `is_submit`,
    `debit_created_at`,
    `debit_updated_at`
  )
VALUES
  (
    10,
    '2024-07-20',
    'JMSMK2007240002',
    'ddd',
    22,
    2,
    7,
    30,
    0,
    'ddd',
    NULL,
    22,
    1,
    '0',
    '2024-07-20 13:54:34',
    '2024-07-20 13:54:34'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: detail_payment_rate_bebas
# ------------------------------------------------------------

INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2663, 117, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2664, 117, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2665, 117, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2666, 117, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2667, 117, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2668, 117, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2669, 117, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2670, 117, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2671, 117, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2672, 117, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2673, 117, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2674, 117, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2675, 118, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2676, 118, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2677, 118, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2678, 118, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2679, 118, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2680, 118, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2681, 118, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2682, 118, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2683, 118, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2684, 118, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2685, 118, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2686, 118, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2687, 119, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2688, 119, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2689, 119, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2690, 119, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2691, 119, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2692, 119, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2693, 119, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2694, 119, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2695, 119, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2696, 119, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2697, 119, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2698, 119, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2699, 120, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2700, 120, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2701, 120, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2702, 120, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2703, 120, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2704, 120, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2705, 120, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2706, 120, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2707, 120, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2708, 120, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2709, 120, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2710, 120, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2711, 121, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2712, 121, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2713, 121, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2714, 121, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2715, 121, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2716, 121, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2717, 121, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2718, 121, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2719, 121, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2720, 121, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2721, 121, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2722, 121, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2723, 122, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2724, 122, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2725, 122, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2726, 122, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2727, 122, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2728, 122, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2729, 122, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2730, 122, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2731, 122, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2732, 122, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2733, 122, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2734, 122, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2735, 123, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2736, 123, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2737, 123, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2738, 123, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2739, 123, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2740, 123, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2741, 123, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2742, 123, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2743, 123, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2744, 123, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2745, 123, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2746, 123, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2759, 125, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2760, 125, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2761, 125, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2762, 125, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2763, 125, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2764, 125, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2765, 125, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2766, 125, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2767, 125, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2768, 125, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2769, 125, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2770, 125, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2771, 126, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2772, 126, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2773, 126, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2774, 126, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2775, 126, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2776, 126, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2777, 126, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2778, 126, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2779, 126, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2780, 126, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2781, 126, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2782, 126, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2783, 127, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2784, 127, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2785, 127, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2786, 127, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2787, 127, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2788, 127, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2789, 127, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2790, 127, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2791, 127, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2792, 127, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2793, 127, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2794, 127, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2795, 128, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2796, 128, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2797, 128, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2798, 128, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2799, 128, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2800, 128, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2801, 128, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2802, 128, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2803, 128, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2804, 128, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2805, 128, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2806, 128, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2807, 129, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2808, 129, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2809, 129, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2810, 129, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2811, 129, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2812, 129, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2813, 129, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2814, 129, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2815, 129, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2816, 129, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2817, 129, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2818, 129, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2819, 130, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2820, 130, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2821, 130, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2822, 130, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2823, 130, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2824, 130, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2825, 130, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2826, 130, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2827, 130, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2828, 130, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2829, 130, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2830, 130, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2831, 131, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2832, 131, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2833, 131, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2834, 131, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2835, 131, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2836, 131, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2837, 131, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2838, 131, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2839, 131, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2840, 131, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2841, 131, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2842, 131, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2843, 132, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2844, 132, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2845, 132, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2846, 132, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2847, 132, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2848, 132, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2849, 132, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2850, 132, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2851, 132, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2852, 132, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2853, 132, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2854, 132, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2855, 133, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2856, 133, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2857, 133, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2858, 133, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2859, 133, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2860, 133, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2861, 133, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2862, 133, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2863, 133, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2864, 133, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2865, 133, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2866, 133, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2867, 134, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2868, 134, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2869, 134, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2870, 134, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2871, 134, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2872, 134, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2873, 134, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2874, 134, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2875, 134, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2876, 134, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2877, 134, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2878, 134, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2879, 135, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2880, 135, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2881, 135, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2882, 135, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2883, 135, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2884, 135, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2885, 135, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2886, 135, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2887, 135, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2888, 135, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2889, 135, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2890, 135, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2891, 136, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2892, 136, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2893, 136, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2894, 136, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2895, 136, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2896, 136, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2897, 136, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2898, 136, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2899, 136, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2900, 136, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2901, 136, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2902, 136, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2903, 137, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2904, 137, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2905, 137, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2906, 137, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2907, 137, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2908, 137, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2909, 137, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2910, 137, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2911, 137, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2912, 137, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2913, 137, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2914, 137, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2915, 138, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2916, 138, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2917, 138, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2918, 138, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2919, 138, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2920, 138, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2921, 138, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2922, 138, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2923, 138, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2924, 138, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2925, 138, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2926, 138, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2927, 139, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2928, 139, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2929, 139, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2930, 139, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2931, 139, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2932, 139, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2933, 139, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2934, 139, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2935, 139, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2936, 139, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2937, 139, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2938, 139, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2939, 140, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2940, 140, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2941, 140, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2942, 140, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2943, 140, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2944, 140, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2945, 140, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2946, 140, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2947, 140, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2948, 140, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2949, 140, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2950, 140, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2951, 141, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2952, 141, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2953, 141, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2954, 141, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2955, 141, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2956, 141, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2957, 141, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2958, 141, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2959, 141, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2960, 141, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2961, 141, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2962, 141, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2963, 142, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2964, 142, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2965, 142, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2966, 142, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2967, 142, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2968, 142, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2969, 142, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2970, 142, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2971, 142, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2972, 142, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2973, 142, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2974, 142, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2975, 143, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2976, 143, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2977, 143, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2978, 143, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2979, 143, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2980, 143, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2981, 143, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2982, 143, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2983, 143, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2984, 143, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2985, 143, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2986, 143, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2987, 144, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2988, 144, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2989, 144, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2990, 144, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2991, 144, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2992, 144, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2993, 144, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2994, 144, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2995, 144, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2996, 144, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2997, 144, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2998, 144, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (2999, 145, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3000, 145, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3001, 145, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3002, 145, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3003, 145, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3004, 145, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3005, 145, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3006, 145, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3007, 145, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3008, 145, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3009, 145, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3010, 145, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3011, 146, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3012, 146, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3013, 146, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3014, 146, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3015, 146, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3016, 146, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3017, 146, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3018, 146, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3019, 146, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3020, 146, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3021, 146, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3022, 146, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3023, 147, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3024, 147, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3025, 147, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3026, 147, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3027, 147, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3028, 147, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3029, 147, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3030, 147, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3031, 147, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3032, 147, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3033, 147, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3034, 147, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3035, 148, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3036, 148, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3037, 148, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3038, 148, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3039, 148, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3040, 148, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3041, 148, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3042, 148, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3043, 148, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3044, 148, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3045, 148, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3046, 148, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3047, 149, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3048, 149, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3049, 149, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3050, 149, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3051, 149, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3052, 149, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3053, 149, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3054, 149, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3055, 149, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3056, 149, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3057, 149, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3058, 149, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3059, 150, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3060, 150, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3061, 150, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3062, 150, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3063, 150, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3064, 150, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3065, 150, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3066, 150, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3067, 150, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3068, 150, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3069, 150, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3070, 150, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3071, 151, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3072, 151, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3073, 151, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3074, 151, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3075, 151, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3076, 151, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3077, 151, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3078, 151, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3079, 151, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3080, 151, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3081, 151, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3082, 151, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3083, 152, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3084, 152, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3085, 152, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3086, 152, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3087, 152, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3088, 152, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3089, 152, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3090, 152, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3091, 152, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3092, 152, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3093, 152, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3094, 152, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3095, 153, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3096, 153, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3097, 153, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3098, 153, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3099, 153, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3100, 153, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3101, 153, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3102, 153, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3103, 153, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3104, 153, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3105, 153, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3106, 153, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3107, 154, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3108, 154, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3109, 154, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3110, 154, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3111, 154, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3112, 154, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3113, 154, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3114, 154, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3115, 154, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3116, 154, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3117, 154, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3118, 154, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3119, 155, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3120, 155, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3121, 155, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3122, 155, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3123, 155, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3124, 155, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3125, 155, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3126, 155, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3127, 155, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3128, 155, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3129, 155, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3130, 155, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3131, 156, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3132, 156, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3133, 156, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3134, 156, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3135, 156, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3136, 156, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3137, 156, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3138, 156, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3139, 156, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3140, 156, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3141, 156, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3142, 156, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3143, 157, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3144, 157, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3145, 157, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3146, 157, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3147, 157, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3148, 157, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3149, 157, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3150, 157, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3151, 157, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3152, 157, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3153, 157, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3154, 157, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3155, 158, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3156, 158, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3157, 158, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3158, 158, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3159, 158, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3160, 158, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3161, 158, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3162, 158, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3163, 158, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3164, 158, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3165, 158, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3166, 158, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3167, 159, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3168, 159, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3169, 159, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3170, 159, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3171, 159, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3172, 159, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3173, 159, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3174, 159, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3175, 159, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3176, 159, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3177, 159, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3178, 159, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3179, 160, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3180, 160, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3181, 160, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3182, 160, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3183, 160, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3184, 160, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3185, 160, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3186, 160, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3187, 160, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3188, 160, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3189, 160, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3190, 160, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3191, 161, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3192, 161, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3193, 161, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3194, 161, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3195, 161, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3196, 161, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3197, 161, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3198, 161, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3199, 161, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3200, 161, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3201, 161, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3202, 161, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3203, 162, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3204, 162, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3205, 162, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3206, 162, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3207, 162, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3208, 162, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3209, 162, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3210, 162, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3211, 162, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3212, 162, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3213, 162, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3214, 162, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3215, 163, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3216, 163, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3217, 163, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3218, 163, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3219, 163, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3220, 163, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3221, 163, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3222, 163, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3223, 163, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3224, 163, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3225, 163, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3226, 163, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3227, 164, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3228, 164, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3229, 164, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3230, 164, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3231, 164, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3232, 164, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3233, 164, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3234, 164, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3235, 164, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3236, 164, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3237, 164, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3238, 164, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3239, 165, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3240, 165, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3241, 165, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3242, 165, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3243, 165, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3244, 165, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3245, 165, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3246, 165, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3247, 165, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3248, 165, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3249, 165, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3250, 165, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3251, 166, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3252, 166, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3253, 166, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3254, 166, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3255, 166, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3256, 166, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3257, 166, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3258, 166, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3259, 166, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3260, 166, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3261, 166, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3262, 166, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3263, 167, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3264, 167, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3265, 167, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3266, 167, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3267, 167, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3268, 167, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3269, 167, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3270, 167, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3271, 167, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3272, 167, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3273, 167, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3274, 167, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3275, 168, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3276, 168, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3277, 168, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3278, 168, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3279, 168, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3280, 168, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3281, 168, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3282, 168, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3283, 168, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3284, 168, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3285, 168, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3286, 168, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3287, 169, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3288, 169, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3289, 169, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3290, 169, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3291, 169, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3292, 169, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3293, 169, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3294, 169, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3295, 169, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3296, 169, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3297, 169, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3298, 169, 3000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3299, 179, 2000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3300, 180, 4141441, 0, 10000, '2024-06-07', 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3301, 181, 450000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3302, 182, 450000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3303, 183, 450000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3304, 184, 450000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3305, 185, 450000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3306, 186, 450000, 3000, 41000, '2024-04-28', 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3307, 187, 450000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3308, 188, 450000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3309, 189, 450000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3310, 190, 450000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3311, 191, 450000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3312, 192, 450000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3313, 193, 450000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3314, 194, 450000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3315, 195, 450000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3316, 197, 44444, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3317, 214, 2000, 0, 0, NULL, 0);
INSERT INTO
  `detail_payment_rate_bebas` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `payment_rate_bill`,
    `payment_rate_discount`,
    `payment_rate_total_pay`,
    `payment_rate_date_pay`,
    `payment_rate_status`
  )
VALUES
  (3318, 289, 22222, 0, 0, NULL, 0);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: detail_payment_rate_bebas_pay
# ------------------------------------------------------------

INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    7,
    3306,
    'SPSMK202111003011022402',
    2000,
    NULL,
    'cicilan1',
    0,
    NULL,
    '1',
    '2024-02-04 16:51:19',
    '2024-02-28 20:59:06'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    17,
    3306,
    'SPundefined202111003023022402',
    2000,
    NULL,
    'ffff',
    0,
    NULL,
    '1',
    '2024-02-09 09:31:39',
    '2024-02-28 20:59:06'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    20,
    3306,
    'SPSMK202111003011022401',
    2000,
    NULL,
    'fff',
    0,
    NULL,
    '1',
    '2024-02-10 19:49:32',
    '2024-02-28 20:59:06'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    21,
    3306,
    'SPSMK202111003011022401',
    2000,
    NULL,
    'www',
    0,
    NULL,
    '1',
    '2024-02-10 19:52:45',
    '2024-02-28 20:59:06'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    22,
    3306,
    'SPSMK202111003011022401',
    2000,
    NULL,
    '444',
    22,
    NULL,
    '1',
    '2024-02-10 19:54:40',
    '2024-02-28 20:59:06'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    23,
    3306,
    'SPSMK202111003011022401',
    2000,
    NULL,
    '123',
    NULL,
    NULL,
    '1',
    '2024-02-10 19:55:44',
    '2024-02-28 20:59:06'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    24,
    3306,
    'SPSMK202111003011022401',
    2000,
    NULL,
    '123233',
    7,
    NULL,
    '1',
    '2024-02-10 19:56:08',
    '2024-02-28 20:59:06'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    25,
    3306,
    'SPSMK202111003011022401',
    3000,
    NULL,
    'ggg',
    NULL,
    NULL,
    '1',
    '2024-02-11 17:11:12',
    '2024-02-28 20:59:06'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    28,
    3306,
    'KWTSMK202111003025022401',
    3000,
    NULL,
    'coba',
    NULL,
    NULL,
    '1',
    '2024-02-25 19:06:01',
    '2024-02-28 20:59:06'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    29,
    3306,
    'KWTSMK202111003010032401',
    2000,
    NULL,
    'ss',
    NULL,
    NULL,
    '1',
    '2024-03-10 19:33:38',
    '2024-03-10 19:57:48'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    30,
    3306,
    'KWTSMK202111003010032401',
    2000,
    NULL,
    'sdd',
    NULL,
    NULL,
    '1',
    '2024-03-10 20:03:56',
    '2024-03-10 20:04:00'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    31,
    3306,
    'KWTSMK202111003018032401',
    2000,
    NULL,
    'aaa',
    NULL,
    NULL,
    '1',
    '2024-03-18 14:33:52',
    '2024-03-18 15:30:21'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    32,
    3306,
    'KWTSMK202111003018032402',
    2000,
    NULL,
    'dddd',
    7,
    NULL,
    '1',
    '2024-03-18 16:06:30',
    '2024-03-18 16:06:35'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    33,
    3306,
    'KWTSMK202111003028042401',
    2000,
    NULL,
    'ddd',
    NULL,
    NULL,
    '1',
    '2024-04-28 12:52:56',
    '2024-04-28 12:53:04'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    34,
    3306,
    'KWTSMK202111003029042401',
    4000,
    NULL,
    'ff',
    NULL,
    NULL,
    '1',
    '2024-04-29 09:40:57',
    '2024-04-29 10:22:20'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    35,
    3306,
    'KWTSMK202111003029042402',
    5000,
    400222,
    'ff',
    NULL,
    NULL,
    '1',
    '2024-04-29 10:24:02',
    '2024-04-29 10:49:44'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    36,
    3306,
    'KWTSMK202111003029042403',
    2000,
    398222,
    'aa',
    NULL,
    NULL,
    '1',
    '2024-04-29 10:50:05',
    '2024-04-29 10:50:13'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    37,
    3300,
    'KWTSMK157116210129062401',
    2000,
    4139441,
    'ddd',
    NULL,
    NULL,
    '1',
    '2024-06-29 12:35:53',
    '2024-06-29 12:36:00'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    38,
    3300,
    'KWTSMK157116210129062402',
    3000,
    4136441,
    'ddd',
    NULL,
    NULL,
    '1',
    '2024-06-29 12:38:15',
    '2024-06-29 13:02:51'
  );
INSERT INTO
  `detail_payment_rate_bebas_pay` (
    `payment_rate_bebas_pay_id`,
    `detail_payment_rate_id`,
    `payment_rate_bebas_pay_number`,
    `payment_rate_bebas_pay_bill`,
    `payment_rate_bebas_pay_remaining`,
    `payment_rate_bebas_pay_desc`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `is_submit_payment`,
    `payment_rate_bebas_pay_created_at`,
    `payment_rate_bebas_pay_updated_at`
  )
VALUES
  (
    39,
    3300,
    'KWTSMK157116210129062402',
    5000,
    4131441,
    'fff',
    19,
    '2024-06-07',
    '1',
    '2024-06-29 12:45:18',
    '2024-07-16 10:31:44'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: detail_payment_rate_bulan
# ------------------------------------------------------------

INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2663,
    117,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2664,
    117,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2665,
    117,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2666,
    117,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2667,
    117,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2668,
    117,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2669,
    117,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2670,
    117,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2671,
    117,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2672,
    117,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2673,
    117,
    5,
    7000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-06-29 16:10:06'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2674,
    117,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2675,
    118,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2676,
    118,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2677,
    118,
    9,
    20000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-06-29 15:38:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2678,
    118,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2679,
    118,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2680,
    118,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2681,
    118,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2682,
    118,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2683,
    118,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2684,
    118,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2685,
    118,
    5,
    7000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-06-29 16:09:53'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2686,
    118,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2687,
    119,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2688,
    119,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2689,
    119,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2690,
    119,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2691,
    119,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2692,
    119,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2693,
    119,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2694,
    119,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2695,
    119,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2696,
    119,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2697,
    119,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2698,
    119,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2699,
    120,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2700,
    120,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2701,
    120,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2702,
    120,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2703,
    120,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2704,
    120,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2705,
    120,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2706,
    120,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2707,
    120,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2708,
    120,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2709,
    120,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2710,
    120,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2711,
    121,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2712,
    121,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2713,
    121,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2714,
    121,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2715,
    121,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2716,
    121,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2717,
    121,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2718,
    121,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2719,
    121,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2720,
    121,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2721,
    121,
    5,
    20000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2722,
    121,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2723,
    122,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2724,
    122,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2725,
    122,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2726,
    122,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2727,
    122,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2728,
    122,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2729,
    122,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2730,
    122,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2731,
    122,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2732,
    122,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2733,
    122,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2734,
    122,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2735,
    123,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2736,
    123,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2737,
    123,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2738,
    123,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2739,
    123,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2740,
    123,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2741,
    123,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2742,
    123,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2743,
    123,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2744,
    123,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2745,
    123,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2746,
    123,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2759,
    125,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2760,
    125,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2761,
    125,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2762,
    125,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2763,
    125,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2764,
    125,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2765,
    125,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2766,
    125,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2767,
    125,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2768,
    125,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2769,
    125,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2770,
    125,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2771,
    126,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2772,
    126,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2773,
    126,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2774,
    126,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2775,
    126,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2776,
    126,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2777,
    126,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2778,
    126,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2779,
    126,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2780,
    126,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2781,
    126,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2782,
    126,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2783,
    127,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2784,
    127,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2785,
    127,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2786,
    127,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2787,
    127,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2788,
    127,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2789,
    127,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2790,
    127,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2791,
    127,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2792,
    127,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2793,
    127,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2794,
    127,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2795,
    128,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2796,
    128,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2797,
    128,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2798,
    128,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2799,
    128,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2800,
    128,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2801,
    128,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2802,
    128,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2803,
    128,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2804,
    128,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2805,
    128,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2806,
    128,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2807,
    129,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2808,
    129,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2809,
    129,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2810,
    129,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2811,
    129,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2812,
    129,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2813,
    129,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2814,
    129,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2815,
    129,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2816,
    129,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2817,
    129,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2818,
    129,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2819,
    130,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2820,
    130,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2821,
    130,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2822,
    130,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2823,
    130,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2824,
    130,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2825,
    130,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2826,
    130,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2827,
    130,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2828,
    130,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2829,
    130,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2830,
    130,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2831,
    131,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2832,
    131,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2833,
    131,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2834,
    131,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2835,
    131,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2836,
    131,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2837,
    131,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2838,
    131,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2839,
    131,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2840,
    131,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2841,
    131,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2842,
    131,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2843,
    132,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2844,
    132,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2845,
    132,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2846,
    132,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2847,
    132,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2848,
    132,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2849,
    132,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2850,
    132,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2851,
    132,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2852,
    132,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2853,
    132,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2854,
    132,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2855,
    133,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2856,
    133,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2857,
    133,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2858,
    133,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2859,
    133,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2860,
    133,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2861,
    133,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2862,
    133,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2863,
    133,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2864,
    133,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2865,
    133,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2866,
    133,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2867,
    134,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2868,
    134,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2869,
    134,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2870,
    134,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2871,
    134,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2872,
    134,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2873,
    134,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2874,
    134,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2875,
    134,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2876,
    134,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2877,
    134,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2878,
    134,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2879,
    135,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2880,
    135,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2881,
    135,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2882,
    135,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2883,
    135,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2884,
    135,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2885,
    135,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2886,
    135,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2887,
    135,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2888,
    135,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2889,
    135,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2890,
    135,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2891,
    136,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2892,
    136,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2893,
    136,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2894,
    136,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2895,
    136,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2896,
    136,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2897,
    136,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2898,
    136,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2899,
    136,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2900,
    136,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2901,
    136,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2902,
    136,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2903,
    137,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2904,
    137,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2905,
    137,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2906,
    137,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2907,
    137,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2908,
    137,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2909,
    137,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2910,
    137,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2911,
    137,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2912,
    137,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2913,
    137,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2914,
    137,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2915,
    138,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2916,
    138,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2917,
    138,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2918,
    138,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2919,
    138,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2920,
    138,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2921,
    138,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2922,
    138,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2923,
    138,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2924,
    138,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2925,
    138,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2926,
    138,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2927,
    139,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2928,
    139,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2929,
    139,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2930,
    139,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2931,
    139,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2932,
    139,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2933,
    139,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2934,
    139,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2935,
    139,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2936,
    139,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2937,
    139,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2938,
    139,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2939,
    140,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2940,
    140,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2941,
    140,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2942,
    140,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2943,
    140,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2944,
    140,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2945,
    140,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2946,
    140,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2947,
    140,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2948,
    140,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2949,
    140,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2950,
    140,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2951,
    141,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2952,
    141,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2953,
    141,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2954,
    141,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2955,
    141,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2956,
    141,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2957,
    141,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2958,
    141,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2959,
    141,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2960,
    141,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2961,
    141,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2962,
    141,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2963,
    142,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2964,
    142,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2965,
    142,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2966,
    142,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2967,
    142,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2968,
    142,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2969,
    142,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2970,
    142,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2971,
    142,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2972,
    142,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2973,
    142,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2974,
    142,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2975,
    143,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2976,
    143,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2977,
    143,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2978,
    143,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2979,
    143,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2980,
    143,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2981,
    143,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2982,
    143,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2983,
    143,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2984,
    143,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2985,
    143,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2986,
    143,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2987,
    144,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2988,
    144,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2989,
    144,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2990,
    144,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2991,
    144,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2992,
    144,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2993,
    144,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2994,
    144,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2995,
    144,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2996,
    144,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2997,
    144,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2998,
    144,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2999,
    145,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3000,
    145,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3001,
    145,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3002,
    145,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3003,
    145,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3004,
    145,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3005,
    145,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3006,
    145,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3007,
    145,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3008,
    145,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3009,
    145,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3010,
    145,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3011,
    146,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3012,
    146,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3013,
    146,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3014,
    146,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3015,
    146,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3016,
    146,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3017,
    146,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3018,
    146,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3019,
    146,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3020,
    146,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3021,
    146,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3022,
    146,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3023,
    147,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3024,
    147,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3025,
    147,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3026,
    147,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3027,
    147,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3028,
    147,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3029,
    147,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3030,
    147,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3031,
    147,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3032,
    147,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3033,
    147,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3034,
    147,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3035,
    148,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3036,
    148,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3037,
    148,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3038,
    148,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3039,
    148,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3040,
    148,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3041,
    148,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3042,
    148,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3043,
    148,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3044,
    148,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3045,
    148,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3046,
    148,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3047,
    149,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3048,
    149,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3049,
    149,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3050,
    149,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3051,
    149,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3052,
    149,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3053,
    149,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3054,
    149,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3055,
    149,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3056,
    149,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3057,
    149,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3058,
    149,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3059,
    150,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3060,
    150,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3061,
    150,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3062,
    150,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3063,
    150,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3064,
    150,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3065,
    150,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3066,
    150,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3067,
    150,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3068,
    150,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3069,
    150,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3070,
    150,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3071,
    151,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3072,
    151,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3073,
    151,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3074,
    151,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3075,
    151,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3076,
    151,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3077,
    151,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3078,
    151,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3079,
    151,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3080,
    151,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3081,
    151,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3082,
    151,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3083,
    152,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3084,
    152,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3085,
    152,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3086,
    152,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3087,
    152,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3088,
    152,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3089,
    152,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3090,
    152,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3091,
    152,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3092,
    152,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3093,
    152,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3094,
    152,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3095,
    153,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3096,
    153,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3097,
    153,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3098,
    153,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3099,
    153,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3100,
    153,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3101,
    153,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3102,
    153,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3103,
    153,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3104,
    153,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3105,
    153,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3106,
    153,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3107,
    154,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3108,
    154,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3109,
    154,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3110,
    154,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3111,
    154,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3112,
    154,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3113,
    154,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3114,
    154,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3115,
    154,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3116,
    154,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3117,
    154,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3118,
    154,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3119,
    155,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3120,
    155,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3121,
    155,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3122,
    155,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3123,
    155,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3124,
    155,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3125,
    155,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3126,
    155,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3127,
    155,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3128,
    155,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3129,
    155,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3130,
    155,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3131,
    156,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3132,
    156,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3133,
    156,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3134,
    156,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3135,
    156,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3136,
    156,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3137,
    156,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3138,
    156,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3139,
    156,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3140,
    156,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3141,
    156,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3142,
    156,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3143,
    157,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3144,
    157,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3145,
    157,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3146,
    157,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3147,
    157,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3148,
    157,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3149,
    157,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3150,
    157,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3151,
    157,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3152,
    157,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3153,
    157,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3154,
    157,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3155,
    158,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3156,
    158,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3157,
    158,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3158,
    158,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3159,
    158,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3160,
    158,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3161,
    158,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3162,
    158,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3163,
    158,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3164,
    158,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3165,
    158,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3166,
    158,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3167,
    159,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3168,
    159,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3169,
    159,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3170,
    159,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3171,
    159,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3172,
    159,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3173,
    159,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3174,
    159,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3175,
    159,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3176,
    159,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3177,
    159,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3178,
    159,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3179,
    160,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3180,
    160,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3181,
    160,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3182,
    160,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3183,
    160,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3184,
    160,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3185,
    160,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3186,
    160,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3187,
    160,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3188,
    160,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3189,
    160,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3190,
    160,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3191,
    161,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3192,
    161,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3193,
    161,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3194,
    161,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3195,
    161,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3196,
    161,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3197,
    161,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3198,
    161,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3199,
    161,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3200,
    161,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3201,
    161,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3202,
    161,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3203,
    162,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3204,
    162,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3205,
    162,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3206,
    162,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3207,
    162,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3208,
    162,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3209,
    162,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3210,
    162,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3211,
    162,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3212,
    162,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3213,
    162,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3214,
    162,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3215,
    163,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3216,
    163,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3217,
    163,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3218,
    163,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3219,
    163,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3220,
    163,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3221,
    163,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3222,
    163,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3223,
    163,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3224,
    163,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3225,
    163,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3226,
    163,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3227,
    164,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3228,
    164,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3229,
    164,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3230,
    164,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3231,
    164,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3232,
    164,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3233,
    164,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3234,
    164,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3235,
    164,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3236,
    164,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3237,
    164,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3238,
    164,
    6,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3239,
    165,
    7,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3240,
    165,
    8,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3241,
    165,
    9,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3242,
    165,
    10,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3243,
    165,
    11,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3244,
    165,
    12,
    2000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3245,
    165,
    1,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3246,
    165,
    2,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3247,
    165,
    3,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3248,
    165,
    4,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3249,
    165,
    5,
    5000,
    NULL,
    NULL,
    NULL,
    0,
    '0',
    '2024-02-24 20:14:19',
    '2024-02-24 20:14:19'
  );
INSERT INTO
  `detail_payment_rate_bulan` (
    `detail_payment_rate_id`,
    `payment_rate_id`,
    `month_month_id`,
    `payment_rate_bill`,
    `payment_rate_number_pay`,
    `payment_rate_via`,
    `payment_rate_date_pay`,
    `payment_rate_status`,
    `is_submit_payment`,
    `created_at`,
    `updated_at`
  )
  (
