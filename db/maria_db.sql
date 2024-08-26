-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.4.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- sola 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `sola` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `sola`;

-- 테이블 sola.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_board_user_id` (`user_id`),
  CONSTRAINT `fk_board_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='게시판';

-- 테이블 데이터 sola.board:~13 rows (대략적) 내보내기
INSERT IGNORE INTO `board` (`id`, `user_id`, `title`, `content`) VALUES
	(1, 1, '제목1', '내용1'),
	(2, 1, '헬로', '월드'),
	(3, 1, '안녕', '안녕'),
	(4, 1, '안녕', '안녕'),
	(5, 1, '안녕하세요', '안녕하세요'),
	(6, 1, '하이', '하이'),
	(7, 1, '반가워용', '반가워용'),
	(8, 1, '제목3', '내용3'),
	(9, 1, '제목4', '제목4'),
	(10, 1, '제목5', '제목5'),
	(11, 1, '제목7', '내용7'),
	(13, 2, 'bbb의 제목', 'bbb의 내용'),
	(14, 3, 'ccc 제목', 'ccc 내용');

-- 테이블 sola.role 구조 내보내기
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='관리자, 사용자';

-- 테이블 데이터 sola.role:~1 rows (대략적) 내보내기
INSERT IGNORE INTO `role` (`id`, `name`) VALUES
	(1, 'ROLE_USER');

-- 테이블 sola.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='사용자';

-- 테이블 데이터 sola.user:~6 rows (대략적) 내보내기
INSERT IGNORE INTO `user` (`id`, `username`, `password`, `enabled`) VALUES
	(1, 'aaa', '$2a$10$Vrr0rQ5QBX2HhiXI0iw5JezBxOHUELKKFfSDNtMN12.SWvs/6v4iK', b'1'),
	(2, 'bbb', '$2a$10$UvmzhJL9m9nF2i0BEiQnKuk8RlVzAygrHsr.pHKBmsPFslFrA0jAe', b'1'),
	(3, 'ccc', '$2a$10$ODZJTGS7n.s1sqJ9wURjTup74puCo8MRd.KITMo.ueuBiBHbdEyMO', b'1'),
	(4, 'ddd', '$2a$10$S1MT.UjKbv9aBGz.UjwMj.cO5x4T/NQkbeuhJeBsdCQzhnXmwnn.e', b'1'),
	(5, 'zzz', '$2a$10$ec9IZv6ZUVGkcco/qlDN4.3q/M/0ikwHj/tLenxUcGpj.UTPAlE0e', b'1'),
	(6, 'xxx', '$2a$10$aLl4sWLa3w1e5cV9voUiHeKQDdCIsZUHstGuJL21uS02CQ/f7O6Te', b'1');

-- 테이블 sola.user_role 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_role_role_id` (`role_id`),
  CONSTRAINT `fk_user_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_role_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='사용자 역할';

-- 테이블 데이터 sola.user_role:~6 rows (대략적) 내보내기
INSERT IGNORE INTO `user_role` (`user_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
