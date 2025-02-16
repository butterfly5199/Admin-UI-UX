/***** table 생성 - 최상위부터 최하위로 생성(1:n에서 1부터 / 아래 쿼리 순서대로 실행) *****/

# 최상위 테이블 
CREATE TABLE IF NOT EXISTS `lala`.`contact` ( 
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `profileFilename` VARCHAR(45) NULL,
  `favorite` TINYINT(1) NULL,
  `honorific` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `middleName` VARCHAR(45) NULL,
  `firstName` VARCHAR(45) NULL,
  `appellation` VARCHAR(45) NULL,
  `id` VARCHAR(45) NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `memo` VARCHAR(4000) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
; # 'mydb' 부분을 실제 db명인 'lala'로 변경하기

# 최상위 테이블
CREATE TABLE IF NOT EXISTS `lala`.`grouplist` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `groupName` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;

# 아래는 전부 하위 테이블
CREATE TABLE IF NOT EXISTS `lala`.`contact_grouplist` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `contact_seq` INT UNSIGNED NOT NULL,
  `grouplist_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_group_contact_member1_idx` (`contact_seq` ASC) VISIBLE,
  INDEX `fk_contact_group_group1_idx` (`grouplist_seq` ASC) VISIBLE,
  CONSTRAINT `fk_group_contact_member1`
    FOREIGN KEY (`contact_seq`)
    REFERENCES `lala`.`contact` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contact_group_group1`
    FOREIGN KEY (`grouplist_seq`)
    REFERENCES `lala`.`grouplist` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `lala`.`contact_phone` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `main` TINYINT(1) NULL,
  `type` VARCHAR(45) NULL,
  `number` VARCHAR(45) NULL,
  `contact_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_phone_contact_member_idx` (`contact_seq` ASC) VISIBLE,
  CONSTRAINT `fk_phone_contact_member`
    FOREIGN KEY (`contact_seq`)
    REFERENCES `lala`.`contact` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `lala`.`contact_email` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `main` TINYINT(1) NULL,
  `email` VARCHAR(45) NULL,
  `contact_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_email_contact_member1_idx` (`contact_seq` ASC) VISIBLE,
  CONSTRAINT `fk_email_contact_member1`
    FOREIGN KEY (`contact_seq`)
    REFERENCES `lala`.`contact` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `lala`.`contact_memoryday` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `main` TINYINT(1) NULL,
  `type` VARCHAR(45) NULL,
  `date` DATE NULL,
  `solar` TINYINT(1) NULL,
  `contact_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_memoryday_contact_member1_idx` (`contact_seq` ASC) VISIBLE,
  CONSTRAINT `fk_memoryday_contact_member1`
    FOREIGN KEY (`contact_seq`)
    REFERENCES `lala`.`contact` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `lala`.`contact_affiliation` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `main` TINYINT(1) NULL,
  `company` VARCHAR(45) NULL,
  `department` VARCHAR(45) NULL,
  `position` VARCHAR(45) NULL,
  `contact_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_affiliation_contact_member1_idx` (`contact_seq` ASC) VISIBLE,
  CONSTRAINT `fk_affiliation_contact_member1`
    FOREIGN KEY (`contact_seq`)
    REFERENCES `lala`.`contact` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `lala`.`contact_address` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `main` TINYINT(1) NULL,
  `type` VARCHAR(45) NULL,
  `zipcode` VARCHAR(45) NULL,
  `address` VARCHAR(150) NULL,
  `contact_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_address_contact_member1_idx` (`contact_seq` ASC) VISIBLE,
  CONSTRAINT `fk_address_contact_member1`
    FOREIGN KEY (`contact_seq`)
    REFERENCES `lala`.`contact` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `lala`.`contact_homepage` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `main` TINYINT(1) NULL,
  `url` VARCHAR(200) NULL,
  `contact_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_homepage_contact_member1_idx` (`contact_seq` ASC) VISIBLE,
  CONSTRAINT `fk_homepage_contact_member1`
    FOREIGN KEY (`contact_seq`)
    REFERENCES `lala`.`contact` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `lala`.`contact_msgsns` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `main` TINYINT(1) NULL,
  `type` VARCHAR(45) NULL,
  `address` VARCHAR(100) NULL,
  `contact_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_contact_msgsns_contact_member1_idx` (`contact_seq` ASC) VISIBLE,
  CONSTRAINT `fk_contact_msgsns_contact_member1`
    FOREIGN KEY (`contact_seq`)
    REFERENCES `lala`.`contact` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

/***** table 삭제 - 최하위부터 최상위로 삭제(1:n에서 n부터 / 아래 쿼리 순서대로 실행) *****/
/* 아래와 같이 하면 db명을 명시하지 않아도 된다.
use lala;
drop table contact_grouplist;
drop table grouplist; 
# 만약 table 이름을 group로 만들었다면 group은 예약어라서, 아를을 '' 로 감싸서 지워야 한다. drop table 'group';
drop table contact_phone;
drop table contact;
*/
drop table `lala`.`contact_grouplist`;
drop table `lala`.`grouplist`;
drop table `lala`.`contact_phone`;
drop table `lala`.`contact`;