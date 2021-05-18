CREATE DATABASE IF NOT EXISTS UNDERWATER;
USE UNDERWATER;

DROP TABLE IF EXISTS `News`;
DROP TABLE IF EXISTS `Manager`;
DROP TABLE IF EXISTS `QA`;

DROP TABLE IF EXISTS `ArticleTitleOpt`; -- NOT YET

DROP TABLE IF EXISTS `AdPic`;
DROP TABLE IF EXISTS `AdOrder`;
DROP TABLE IF EXISTS `AdMember`;

DROP TABLE IF EXISTS `Chat`;
DROP TABLE IF EXISTS `Follow`;
DROP TABLE IF EXISTS `CustomerReply`;

DROP TABLE IF EXISTS `ProductPhoto`;
DROP TABLE IF EXISTS `ShoppingCar`;
DROP TABLE IF EXISTS `OrderList`;
DROP TABLE IF EXISTS `OrderForProduct`;
DROP TABLE IF EXISTS `Product`;

DROP TABLE IF EXISTS `MemberRate`;
DROP TABLE IF EXISTS `PartyMember`;
DROP TABLE IF EXISTS `Party`;

DROP TABLE IF EXISTS `LocationRate`;
DROP TABLE IF EXISTS `Collections`;
DROP TABLE IF EXISTS `OderForGroup`;
DROP TABLE IF EXISTS `GroupTour`;

DROP TABLE IF EXISTS `Diveinfo`;
DROP TABLE IF EXISTS `Member`;


CREATE TABLE `Member` (
  `userID` int NOT NULL AUTO_INCREMENT COMMENT '�|���s��',
  `account` varchar(50) NOT NULL COMMENT '�b��',
  `pwd` varchar(20) NOT NULL COMMENT '�K�X',
  `nickName` varchar(30) NOT NULL COMMENT '�ʺ�',
  `userName` varchar(50) NOT NULL COMMENT '�m�W',
  `gender` varchar(1) DEFAULT NULL COMMENT '�ʧO',
  `birthDate` date DEFAULT NULL COMMENT '�|���ͤ�',
  `phone` varchar(10) DEFAULT NULL COMMENT '�p���q��',
  `certification` char(2) DEFAULT NULL COMMENT '�ҷ�',
  `certificationPic` blob COMMENT '�ҷӹϤ�',
  `personID` char(10) DEFAULT NULL COMMENT '�����Ҧr��',
  `address` varchar(100) DEFAULT NULL COMMENT '�a�}',
  `createTime` timestamp NOT NULL COMMENT '�b���إ߮ɶ�',
  `status` int NOT NULL COMMENT '�b�����A',
  `upDateTime` timestamp NOT NULL COMMENT '�b����s�ɶ�',
  `ratePeople` int NOT NULL COMMENT '�Q�����`�H��',
  `ratePoint` int NOT NULL COMMENT '�Q�����`��',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `UK_MEMBER_account` (`account`)
) COMMENT='�|��';



CREATE TABLE `Diveinfo` (
  `pointSN` int NOT NULL AUTO_INCREMENT COMMENT '���I�s��',
  `pointName` varchar(20) DEFAULT NULL,
  `latitude` double NOT NULL COMMENT '�n��',
  `longitude` double NOT NULL COMMENT '�g��',
  `view` varchar(20) DEFAULT NULL,
  `introduction` longtext NOT NULL COMMENT '���I�Ϥ�',
  `season` varchar(20) NOT NULL COMMENT '�u�`',
  `local` varchar(20) DEFAULT NULL,
  `pic` blob NOT NULL COMMENT '�w����',
  `ratePoint` int NOT NULL COMMENT '�����`��',
  `ratePeople` int NOT NULL COMMENT '�����H��',
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`pointSN`)
) COMMENT='���I��T' AUTO_INCREMENT = 200001;


-- --------------------------------------�M�˦�{----------------------------------------


create table `GroupTour` (
	`groupTourSN` int NOT NULL AUTO_INCREMENT COMMENT '�M�˦�{�s��',
    `tourName` varchar(30) not null comment '��{�W��',
    `startTime` date not null comment '��{�_�l���',
    `endTime` date not null comment '��{�������',
    `regTime` date not null comment '���W�}�l���',
    `closeTime` date not null comment '���W�������',
    `createTime` TIMESTAMP NOT NULL comment '��{�إߤ��',
    `pointSN` int not null comment '���I�s��',
    `price` int not null comment '��{����',
    `attendNumber` int not null comment '�ѥ[�H��',
    `limitNumder` int not null comment '����H��',
    `certificationLimit` char(2) comment '��歭��',
    `status` char(1) not null comment '�X�Ϊ��A',
    `content` longtext not null comment '��{�Ϥ�',
	CONSTRAINT GroupTour_pontSN_FK FOREIGN KEY (pointSN) REFERENCES DiveInfo (pointSN),
	PRIMARY KEY (`groupTourSN`)
) COMMENT='�M�˦�{' AUTO_INCREMENT=6001;


create table `Collections` (
	`userID` int not null comment '�|���s��',
    `groupTourSN` int not null comment '�M�˦�{�s��',
    CONSTRAINT Collections_userID_FK FOREIGN KEY (userID) REFERENCES Member (userID),
    CONSTRAINT Collections_groupTourSN_FK FOREIGN KEY (groupTourSN) REFERENCES GroupTour (groupTourSN)
) COMMENT='�M�˦�{����';


create table `OderForGroup` (
	`orderSN` int NOT NULL AUTO_INCREMENT COMMENT '�M�˦�{�q��s��',
	`userID` int not null comment '�|���s��',
    `groupTourSN` int not null comment '�M�˦�{�s��',
    `totalPrice` int not null comment '�q���`�B',
	`purchaseDate`  date not null comment '�ʶR���',
    `phone` varchar(10) not null comment '���',
    `personID` char(10) not null comment '�����Ҹ�',
    `birthdate` date not null comment '�|���ͤ�',
     CONSTRAINT OderForGroup_userID_FK FOREIGN KEY (userID) REFERENCES Member (userID),
     CONSTRAINT OderForGroup_groupTourSN_FK FOREIGN KEY (groupTourSN) REFERENCES GroupTour (groupTourSN),
	  PRIMARY KEY (`orderSN`)
) COMMENT='�M�˦�{�q��' AUTO_INCREMENT=6001;


create table `LocationRate` (
	`SN` int NOT NULL AUTO_INCREMENT COMMENT '���I�����s��',
    `pointSN` int not null comment '���I�s��',
	`userID` int not null comment '������',
    `rate` int comment '����',
    `rateDetail` varchar(1000) comment '�����ԲӤ��e',
    `createTime` timestamp not null comment '�����ɶ�',
	CONSTRAINT LocationRate_pontSN_FK FOREIGN KEY (pointSN) REFERENCES DiveInfo (pointSN),
	CONSTRAINT LocationRate_userID_FK FOREIGN KEY (userID) REFERENCES Member (userID),
	  PRIMARY KEY (`SN`)
) COMMENT='�a�I�������' AUTO_INCREMENT=6001;


-- --------------------------------------����----------------------------------------

CREATE TABLE `Party` (
  `partySN` int NOT NULL AUTO_INCREMENT COMMENT '���νs��',
  `partyHost` int NOT NULL COMMENT '�D���|���s��',
  `partyTitle` varchar(100) NOT NULL COMMENT '���ΥD��',
  `regDate` date NOT NULL COMMENT '���W�}�l�ɶ�',
  `closeDate` date NOT NULL COMMENT '���W�����ɶ�',
  `startDate` date NOT NULL COMMENT '���ζ}�l�ɶ�',
  `endDate` date NOT NULL COMMENT '���ε����ɶ�',
  `partyMinSize` int NOT NULL COMMENT '���γ̧C�H��',
  `partyLocation` int NOT NULL COMMENT '���Φa�I',
  `partyDetail` longtext NOT NULL COMMENT '���θԲӤ��e',
  `createTime` timestamp NOT NULL COMMENT '���εo��ɶ�',
  `status` char(1) NOT NULL COMMENT '���Ϊ��A',
  PRIMARY KEY (`partySN`),
  KEY `FK_Party_partyHost` (`partyHost`),
  KEY `FK_Party_partyLocation` (`partyLocation`),
  CONSTRAINT `FK_Party_partyHost` FOREIGN KEY (`partyHost`) REFERENCES `Member` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Party_partyLocation` FOREIGN KEY (`partyLocation`) REFERENCES `DiveInfo` (`pointSN`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='���ΦC��';


CREATE TABLE `PartyMember` (
  `partyMemberSN` int NOT NULL AUTO_INCREMENT COMMENT '���ιέ��W��y����',
  `partySN` int NOT NULL COMMENT '���νs��',
  `partyMember` int NOT NULL COMMENT '�έ��|���s��',
  `gender` varchar(1) NOT NULL COMMENT '�ʧO 0:�k 1:�k',
  `email` varchar(50) NOT NULL COMMENT 'Email',
  `phone` varchar(10) NOT NULL COMMENT '���',
  `birthDate` date NOT NULL COMMENT '�ͤ�',
  `personID` char(10) NOT NULL COMMENT '�����Ҧr��',
  `certificationPic` longblob COMMENT '�ҷӹϤ�',
  `appliedDate` timestamp NOT NULL COMMENT '���W���',
  `comment` varchar(1000) DEFAULT NULL COMMENT '�Ƶ�',
  `status` int NOT NULL COMMENT '���W���A 0:�ݼf�� 1:�f�ֳq�L 2:�f�֥��q�L',
  PRIMARY KEY (`partyMemberSN`),
  UNIQUE KEY `UK_PartyMember_partySN_partyMember` (`partySN`,`partyMember`),
  KEY `FK_PartyMember_partyMember` (`partyMember`),
  CONSTRAINT `FK_PartyMember_partyMember` FOREIGN KEY (`partyMember`) REFERENCES `Member` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PartyMember_partySN` FOREIGN KEY (`partySN`) REFERENCES `Party` (`partySN`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='���ιέ��W��';


CREATE TABLE `MemberRate` (
  `SN` int NOT NULL AUTO_INCREMENT COMMENT '�|�������y���s��',
  `partySN` int DEFAULT NULL COMMENT '���νs��',
  `orderSN` int DEFAULT NULL COMMENT '�M�˦�{�q��s��',
  `rateMaker` int NOT NULL COMMENT '���פ�',
  `rateRecipiant` int NOT NULL COMMENT '�Q���פ�',
  `rate` int NOT NULL COMMENT '����',
  `rateDetail` varchar(3000) DEFAULT NULL COMMENT '�����ԲӤ��e',
  `createTime` timestamp NOT NULL COMMENT '�����ɶ�',
  PRIMARY KEY (`SN`),
  KEY `FK_MemberRate_partySN` (`partySN`),
  KEY `FK_MemberRate_orderSN` (`orderSN`),
  KEY `FK_rateMaker` (`rateMaker`),
  KEY `FK_rateRecipiant` (`rateRecipiant`),
  CONSTRAINT `FK_MemberRate_orderSN` FOREIGN KEY (`orderSN`) REFERENCES `GroupTour` (`groupTourSN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MemberRate_partySN` FOREIGN KEY (`partySN`) REFERENCES `Party` (`partySN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_rateMaker` FOREIGN KEY (`rateMaker`) REFERENCES `Member` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_rateRecipiant` FOREIGN KEY (`rateRecipiant`) REFERENCES `Member` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='�|������';


-- --------------------------------------�ӫ��������----------------------------------------


CREATE TABLE `Product` (
  `productSN` int NOT NULL AUTO_INCREMENT COMMENT '�ӫ~�s��',
  `productClass` varchar(2) NOT NULL COMMENT '�ӫ~���O',
  `productName` varchar(50) NOT NULL COMMENT '�ӫ~�W��',
  `productPrice` int NOT NULL COMMENT '�ӫ~���',
  `productQuantity` int NOT NULL COMMENT '�ӫ~�ƶq',
  `productStatus` char(1) NOT NULL COMMENT '�ӫ~���A',
  `productDetail` longtext NOT NULL COMMENT '�ӫ~����',
  `productCreateTime` timestamp NOT NULL COMMENT '�W�[�ɶ�',
  `productDiscount` tinyint(1) NOT NULL COMMENT '�u�f�~',
  `productPrime` tinyint(1) NOT NULL COMMENT '���~',
  `ratingPoint` int NOT NULL COMMENT '�����`����',
  `ratingNumber` int NOT NULL COMMENT '�����`�H��',
  PRIMARY KEY (`productSN`),
  CONSTRAINT `product_chk_1` CHECK ((`productPrice` > 0))
) COMMENT='�ӫ~';


CREATE TABLE `OrderForProduct` (
  `orderSN` int NOT NULL AUTO_INCREMENT COMMENT '�q��s��',
  `userID` int NOT NULL COMMENT '�|���s��',
  `purchaseDate` timestamp NOT NULL COMMENT '�ʶR�ɶ�',
  `totalPrice` int NOT NULL COMMENT '���b�`���B',
  `orderStatus` char(1) NOT NULL COMMENT '�q�檬�A',
  `clearDate` timestamp NULL DEFAULT NULL COMMENT '�����ɶ�',
  PRIMARY KEY (`orderSN`),
  KEY `FK_OrderForProduct_userID` (`userID`),
  CONSTRAINT `FK_OrderForProduct_userID` FOREIGN KEY (`userID`) REFERENCES `Member` (`userID`),
  CONSTRAINT `orderforproduct_chk_1` CHECK ((`totalPrice` > 0))
) COMMENT='�ӫ~�q��';


CREATE TABLE `OrderList` (
  `orderListSN` int NOT NULL AUTO_INCREMENT COMMENT '���Ӭy����',
  `productSN` int NOT NULL COMMENT '�ӫ~�s��',
  `orderSN` int NOT NULL COMMENT '�q��s��',
  `purchaseQuantity` int NOT NULL COMMENT '�ʶR�ƶq',
  `productPrice` int NOT NULL COMMENT '�ӫ~���',
  `rating` int NOT NULL COMMENT '�ӫ~����',
  PRIMARY KEY (`orderListSN`),
  KEY `FK_OrderList_productSN` (`productSN`),
  KEY `FK_OrderList_OrderSN` (`orderSN`),
  CONSTRAINT `FK_OrderList_OrderSN` FOREIGN KEY (`orderSN`) REFERENCES `OrderForProduct` (`orderSN`),
  CONSTRAINT `FK_OrderList_productSN` FOREIGN KEY (`productSN`) REFERENCES `Product` (`productSN`),
  CONSTRAINT `orderlist_chk_1` CHECK ((`productPrice` > 0))
) COMMENT='�ӫ~�q�����';


CREATE TABLE `ShoppingCar` (
  `shoppingCarSN` int NOT NULL AUTO_INCREMENT COMMENT '�ʪ����s��',
  `userID` int NOT NULL COMMENT '�|���s��',
  `productSN` int NOT NULL COMMENT '�ӫ~�s��',
  `purchaseQuantity` int NOT NULL COMMENT '�ʶR�ƶq',
  `productPrice` int NOT NULL COMMENT '�ӫ~���',
  `totalPrice` int NOT NULL COMMENT '���b�`���B',
  PRIMARY KEY (`shoppingCarSN`),
  KEY `FK_ShoppingCar_userID` (`userID`),
  KEY `FK_ShoppingCar_productSN` (`productSN`),
  CONSTRAINT `FK_ShoppingCar_productSN` FOREIGN KEY (`productSN`) REFERENCES `Product` (`productSN`),
  CONSTRAINT `FK_ShoppingCar_userID` FOREIGN KEY (`userID`) REFERENCES `Member` (`userID`),
  CONSTRAINT `shoppingcar_chk_1` CHECK ((`productPrice` > 0)),
  CONSTRAINT `shoppingcar_chk_2` CHECK ((`totalPrice` > 0))
) COMMENT='�ʪ���';


CREATE TABLE `ProductPhoto` (
  `photoSN` int NOT NULL AUTO_INCREMENT COMMENT '�Ϥ��y����',
  `productSN` int NOT NULL COMMENT '�ӫ~�s��',
  `productImages` longblob NOT NULL COMMENT '�ӫ~�Ϥ�',
  PRIMARY KEY (`photoSN`),
  KEY `FK_ProductPhoto_productSN` (`productSN`),
  CONSTRAINT `FK_ProductPhoto_productSN` FOREIGN KEY (`productSN`) REFERENCES `Product` (`productSN`)
) COMMENT='�ӫ~�Ϥ�';


-- --------------------------------------�|��������� CustomerReply Follow Chat----------------------------------------


create table `CustomerReply` (
	`customerReplySN` int not null AUTO_INCREMENT comment '�T���^�нs��',
	`userID` int not null comment '�|���s��',
    `type` char(1) not null comment '����',
    `content` varchar(500) not null comment '�^�����e',
    `sendTime` timestamp not null comment '�T���ǰe�ɶ�',
     CONSTRAINT CustomerReply_userID_FK FOREIGN KEY (userID) REFERENCES Member (userID),
	  PRIMARY KEY (`customerReplySN`)
) COMMENT='�Y�ɫȪA�^��' AUTO_INCREMENT=60001;


CREATE TABLE `Follow` (
  `follower` int NOT NULL COMMENT '�l�ܪ̽s��',
  `followed` int NOT NULL COMMENT '�Q�l�ܪ̽s��',
  PRIMARY KEY (`follower`,`followed`),
  KEY `FK_Follow_followed` (`followed`),
  CONSTRAINT `FK_Follow_followed` FOREIGN KEY (`followed`) REFERENCES `member` (`userID`),
  CONSTRAINT `FK_Follow_follower` FOREIGN KEY (`follower`) REFERENCES `member` (`userID`)
) COMMENT='�l��';


CREATE TABLE `Chat` (
  `chatSN` int NOT NULL AUTO_INCREMENT COMMENT '��Ѭ����s��',
  `fromAccount` int NOT NULL COMMENT ' �o�e�s��',
  `toAccount` int NOT NULL COMMENT '�����s��',
  `content` varchar(256) NOT NULL COMMENT '���e',
  `dateTime` timestamp NOT NULL COMMENT '�ɶ�',
  PRIMARY KEY (`chatSN`),
  KEY `FK_Chat_fromAccount` (`fromAccount`),
  KEY `FK_Chat_toAccount` (`toAccount`),
  CONSTRAINT `FK_Chat_fromAccount` FOREIGN KEY (`fromAccount`) REFERENCES `member` (`userID`),
  CONSTRAINT `FK_Chat_toAccount` FOREIGN KEY (`toAccount`) REFERENCES `member` (`userID`)
) COMMENT='��Ѭ���' AUTO_INCREMENT=900001;


-- --------------------------------------AD----------------------------------------


CREATE TABLE `AdMember` (
  `adUserID` int NOT NULL AUTO_INCREMENT COMMENT '�|���y���s��',
  `account` varchar(50) NOT NULL COMMENT '�b��',
  `pwd` varchar(20) NOT NULL COMMENT '�K�X',
  `createTime` timestamp NOT NULL COMMENT '�b���إ߮ɶ�',
  PRIMARY KEY (`adUserID`),
  UNIQUE KEY `UK_AdMember_account` (`account`)
) COMMENT='�s�i�|��';


CREATE TABLE `AdOrder` (
  `orderSN` int NOT NULL AUTO_INCREMENT COMMENT '�q��y���s��',
  `adUserID` int NOT NULL COMMENT '�|���y���s��',
  `block` int NOT NULL COMMENT '����',
  `time` timestamp NOT NULL COMMENT '���߮ɶ�',
  `showTime` timestamp NOT NULL COMMENT '�}�l�ɶ�',
  `expiredTime` timestamp NOT NULL COMMENT '�����ɶ�',
  PRIMARY KEY (`orderSN`),
  KEY `AdOrder_adUerID_FK` (`adUserID`),
  CONSTRAINT `AdOrder_adUerID_FK` FOREIGN KEY (`adUserID`) REFERENCES `admember` (`adUserID`)
) COMMENT='�s�i�q��';


CREATE TABLE `AdPic` (
  `adPicSN` int NOT NULL AUTO_INCREMENT COMMENT '�Ϥ��y���s��',
  `orderSN` int NOT NULL COMMENT '�q��y���s��',
  `pic` blob NOT NULL COMMENT '�s�i�Ϥ�',
  PRIMARY KEY (`adPicSN`),
  CONSTRAINT `AdPic_adPicSN_FK` FOREIGN KEY (`adPicSN`) REFERENCES `AdOrder` (`orderSN`)
) COMMENT='�s�i�Ϥ�';

-- --------------------------------------FORUM(���I���D�٦�4�i)----------------------------------------


CREATE TABLE `ArticleTitleOpt` (
  `articleTitleOptSN` int NOT NULL AUTO_INCREMENT COMMENT '�o��ﶵ�s��',
  `articleTitleOptText` char(12) NOT NULL COMMENT '�ﶵ���e',
  PRIMARY KEY (`articleTitleOptSN`)
) COMMENT='�o����D�ﶵ';



-- --------------------------------------�t��� QA MANAGER NEWS----------------------------------------

CREATE TABLE `QA` (
  `questionSN` int NOT NULL AUTO_INCREMENT COMMENT 'QA�Ǹ�',
  `menu` char(1) NOT NULL COMMENT '������',
  `submenu` char(2) NOT NULL COMMENT '���l����',
  `system` char(1) NOT NULL COMMENT '�t�νs��',
  `question` varchar(300) NOT NULL COMMENT '���D���e',
  `answer` varchar(300) NOT NULL COMMENT '�^�����e',
  `clicks` int NOT NULL COMMENT '�I������',
  `popularQuestion` tinyint NOT NULL COMMENT '����',
  `popularQuestionSort` int DEFAULT NULL COMMENT '�������D�Ƨ�',
  PRIMARY KEY (`questionSN`)
) COMMENT='Q&A' AUTO_INCREMENT=6001;


CREATE TABLE `Manager` (
  `account` varchar(50) NOT NULL COMMENT '�b��',
  `pwd` varchar(20) NOT NULL COMMENT '�K�X',
  PRIMARY KEY (`account`)
) COMMENT='�޲z��';


CREATE TABLE `News` (
  `newsSN` int NOT NULL AUTO_INCREMENT COMMENT '�s�D�s��',
  `title` varchar(20) NOT NULL COMMENT '���D',
  `content` text NOT NULL COMMENT '����',
  `image` longblob NOT NULL COMMENT '�Ӥ�',
  `newsDate` date NOT NULL COMMENT '�s�D���',
  `newsFrom` varchar(20) NOT NULL COMMENT '�s�D�ӷ�',
  `newsType` char(1) NOT NULL COMMENT '�s�D����',
  PRIMARY KEY (`newsSN`)
) COMMENT='�̷s����' AUTO_INCREMENT = 500001;