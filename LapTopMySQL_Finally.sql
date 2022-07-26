drop database LapTop;
create database LapTop;
use LapTop;
------------- Table ---------------
/*==============================================================*/
/* Table: TAIKHOAN                 		                        */
/*==============================================================*/
create table TAIKHOAN
(
   TENDANGNHAP          varchar(20) not null,
   MATKHAU              varchar(20) not null,
   QUYEN                varchar(20) not null,
   primary key (TENDANGNHAP)
) default charset = utf8mb4;

/*==============================================================*/
/* Table: NHANVIEN                                        */
/*==============================================================*/
create table NHANVIEN
(
   MANV                 char(6) not null,
   TENDANGNHAP          varchar(20) not null,
   TENNV                varchar(50),
   NGAYSINH             date,
   GIOITINH             char(5),
   CHUCVU               varchar(10),
   DIACHI               varchar(100),
   NGAYVL               date,
   SODT                 char(12),
   primary key (MANV)
) default charset = utf8mb4;

/*==============================================================*/
/* Table: KHACHHANG                                       */
/*==============================================================*/
create table KHACHHANG
(
   MAKH                 char(6) not null,
   TENDANGNHAP          varchar(10) not null,
   TENKH                varchar(50),
   SODT                 char(12),
   EMAIL                varchar(50),
   GIOITINH             char(5),
   primary key (MAKH)
) default charset = utf8mb4;

/*==============================================================*/
/* Table: SANPHAM                                         */
/*==============================================================*/
create table SANPHAM
(
   MASP                 char(6) not null,
   MANHINH              char(5) not null,
   BOXULY               char(5) not null,
   RAM                  char(5) not null,
   CONGKETNOI           char(5) not null,
   DANHMUC              char(6) not null,
   TENSP                varchar(1000),
   SOLUONG              int,
   MAUSAC               varchar(20),
   OCUNG                varchar(200),
   CARDMANHINH          varchar(100),
   DACBIET              varchar(100),
   HDH                  varchar(100),
   THIETKE              varchar(50),
   KICHTHUOC_TRONGLUONG varchar(100),
   WEBCAM               varchar(50),
   PIN                  varchar(50),
   RAMAT                int,
   MOTA                 varchar(200),
   DONGIA               bigint,
   HINHANH              varchar(200),
   primary key (MASP)
)DEFAULT CHARSET=utf8mb4;

/*==============================================================*/
/* Table: BONHORAM                                        */
/*==============================================================*/
create table BONHORAM
(
   MARAM                char(5) not null,
   DUNGLUONGRAM         varchar(50),
   LOAIRAM              varchar(100),
   BUSRAM               varchar(50),
   HOTROTOIDA           varchar(50),
   primary key (MARAM)
) DEFAULT CHARSET=utf8mb4 ;

/*==============================================================*/
/* Table: BOXULY                                          */
/*==============================================================*/
create table BOXULY
(
   MABXL                char(5) not null,
   CONGNGHECPU          varchar(50),
   SONHAN               int,
   SOLUONG              int,
   TOCDOCPU             varchar(20),
   TOCDOTOIDA           varchar(50),
   BONHODEM             varchar(10),
   primary key (MABXL)
) DEFAULT CHARSET=utf8mb4;

/*==============================================================*/
/* Table: CONGKETNOI                                      */
/*==============================================================*/
create table CONGKETNOI
(
   MACKN                char(5) not null,
   CONGGIAOTIEP         varchar(200),
   KETNOIKHONGDAY       varchar(100),
   KHEDOCTHENHO         varchar(20),
   WEBCAM               varchar(50),
   TINHNANGKHAC         varchar(200),
   DENBANPHIM           varchar(10),
   primary key (MACKN)
) DEFAULT CHARSET=utf8mb4;

/*==============================================================*/
/* Table: MANHINH                                         */
/*==============================================================*/
create table MANHINH
(
   MAMH                 char(5) not null,
   KICHTHUOC            varchar(20),
   DOPHANGIAI           varchar(50),
   TANSOQUET            varchar(10),
   CONGNGHEMH           varchar(100),
   CAMUNG               varchar(10),
   primary key (MAMH)
)DEFAULT CHARSET=utf8mb4;

/*==============================================================*/
/* Table: SUKIEN                                          */
/*==============================================================*/
create table SUKIEN
(
   MASK                 char(6) not null,
   TENSK                varchar(50),
   PHANTRAMGIAMGIA      int,
   NGAYBD               date,
   NGAYKT               date,
   primary key (MASK)
) default charset = utf8mb4;


/*==============================================================*/
/* Table: DANHMUCSANPHAM                                  */
/*==============================================================*/
create table DANHMUCSANPHAM
(
   MADM                 char(6) not null,
   TENDM                varchar(50),
   primary key (MADM)
) default charset = utf8mb4;

/*==============================================================*/
/* Table:HOADON                                          */
/*==============================================================*/
create table HOADON
(
   MAHD                 char(6) not null,
   MAKH                 char(6) not null,
   MANV                 char(6) not null,
   MASK                 char(6),
   NGAYHD               date,
   DIACHIGIAOHANG       varchar(100),
   TONGTIEN             int,
   THANHTIEN            int,
   primary key (MAHD)
) default charset = utf8mb4;

/*==============================================================*/
/* Table: CTHD                                            */
/*==============================================================*/
create table CTHD
(
   MAHD                 char(6) not null,
   MASP                 char(6) not null,
   SOLUONG              int,
   primary key (MAHD, MASP)
) default charset = utf8mb4;


/*==============================================================*/
/* KHOA NGOAI                                                   */
/*==============================================================*/

alter table CTHD add constraint FK_CTHD foreign key (MAHD)
      references HOADON (MAHD) on delete restrict on update restrict;

alter table CTHD add constraint FK_CTHD2 foreign key (MASP)
      references SANPHAM (MASP) on delete restrict on update restrict;

alter table HOADON add constraint FK_HD_SK foreign key (MASK)
      references SUKIEN (MASK) on delete restrict on update restrict;

alter table HOADON add constraint FK_LAP foreign key (MANV)
      references NHANVIEN (MANV) on delete restrict on update restrict;

alter table HOADON add constraint FK_THUOC foreign key (MAKH)
      references KHACHHANG (MAKH) on delete restrict on update restrict;

alter table KHACHHANG add constraint FK_CO2 foreign key (TENDANGNHAP)
      references TAIKHOAN (TENDANGNHAP) on delete restrict on update restrict;

alter table NHANVIEN add constraint FK_CO1 foreign key (TENDANGNHAP)
      references TAIKHOAN (TENDANGNHAP) on delete restrict on update restrict;

alter table SANPHAM add constraint FK_THUOC1 foreign key (DANHMUC)
      references DANHMUCSANPHAM (MADM) on delete restrict on update restrict;

alter table SANPHAM add constraint FK_THUOC3 foreign key (RAM)
      references BONHORAM (MARAM) on delete restrict on update restrict;

alter table SANPHAM add constraint FK_THUOC4 foreign key (MANHINH)
      references MANHINH (MAMH) on delete restrict on update restrict;

alter table SANPHAM add constraint FK_THUOC5 foreign key (BOXULY)
      references BOXULY (MABXL) on delete restrict on update restrict;

alter table SANPHAM add constraint FK_THUOC6 foreign key (CONGKETNOI)
      references CONGKETNOI (MACKN) on delete restrict on update restrict;

commit;

/*------------------- AUTO ID --------------------------*/

/*----- AUTOID_KHACHHANG ----*/

DROP FUNCTION IF EXISTS AUTO_IDKH;
DELIMITER $$
CREATE FUNCTION AUTO_IDKH()
RETURNS VARCHAR(6)
DETERMINISTIC
BEGIN
	DECLARE MAKHNEW VARCHAR(6);
    declare ID VARCHAR(4);
	IF (SELECT COUNT(MAKH) FROM KHACHHANG) = 0 THEN
		SET MAKHNEW = 'KH0001';
	ELSE
		SELECT MAX(RIGHT(MAKH, 4)) INTO ID from khachhang;
			if ID >= 0 and ID < 9 THEN 
				set MAKHNEW = CONCAT('KH000',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
			IF ID >= 9 and ID < 99 THEN
				SET MAKHNEW = CONCAT('KH00',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
            IF ID >= 99 and ID < 999 THEN
				SET MAKHNEW = CONCAT('KH0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
            IF ID >= 999 THEN
				SET MAKHNEW = CONCAT('KH',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));     
			end if;
	end if;
	RETURN (MAKHNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_KH;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_KH
    BEFORE INSERT
    ON KHACHHANG FOR EACH ROW
BEGIN
	SET NEW.MAKH = AUTO_IDKH();
END$$    
DELIMITER ;

/*----- AUTOID_NHANVIEN ----*/

DROP FUNCTION IF EXISTS AUTO_IDNV;
DELIMITER $$
CREATE FUNCTION AUTO_IDNV()
RETURNS VARCHAR(6)
DETERMINISTIC
BEGIN
	DECLARE MANVNEW VARCHAR(6);
    declare ID VARCHAR(4);
	IF (SELECT COUNT(MANV) FROM NHANVIEN) = 0 THEN
		SET MANVNEW = 'NV0001';
	ELSE
		SELECT MAX(RIGHT(MANV, 4)) INTO ID from NHANVIEN;
			if ID >= 0 and ID < 9 THEN 
				set MANVNEW = CONCAT('NV000',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
			IF ID >= 9 and ID < 99 THEN
				SET MANVNEW = CONCAT('NV00',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			END IF;
            IF ID >= 99 and ID < 999 THEN
				SET MANVNEW = CONCAT('NV0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
				END IF;
			IF ID >= 999 THEN
				SET MANVNEW = CONCAT('NV',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
				END IF;
			
	end if;
	RETURN (MANVNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_NV;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_NV
    BEFORE INSERT
    ON NHANVIEN FOR EACH ROW
BEGIN
	SET NEW.MANV = AUTO_IDNV();
END$$    
DELIMITER ;

/*----- AUTOID_BONHORAM ----*/

DROP FUNCTION IF EXISTS AUTO_IDRAM;
DELIMITER $$
CREATE FUNCTION AUTO_IDRAM()
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
	DECLARE MARAMNEW VARCHAR(5);
    declare ID VARCHAR(2);
	IF (SELECT COUNT(MARAM) FROM BONHORAM) = 0 THEN
		SET MARAMNEW = 'RAM01';
	ELSE
		SELECT MAX(RIGHT(MARAM, 2)) INTO ID from BONHORAM;
			if ID >= 0 and ID < 9 THEN 
				set MARAMNEW = CONCAT('RAM0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			ELSE IF ID >= 9 THEN
					SET MARAMNEW = CONCAT('RAM',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
				 END IF;
            end if;
	end if;
	RETURN (MARAMNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_RAM;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_RAM
    BEFORE INSERT
    ON BONHORAM FOR EACH ROW
BEGIN
	SET NEW.MARAM = AUTO_IDRAM();
END$$    
DELIMITER ;

/*----- AUTOID_BOXULY ----*/

DROP FUNCTION IF EXISTS AUTO_IDBXL;
DELIMITER $$
CREATE FUNCTION AUTO_IDBXL()
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
	DECLARE MABXLNEW VARCHAR(5);
    declare ID VARCHAR(2);
	IF (SELECT COUNT(MABXL) FROM BOXULY) = 0 THEN
		SET MABXLNEW = 'BXL01';
	ELSE
		SELECT MAX(RIGHT(MABXL, 2)) INTO ID from BOXULY;
			if ID >= 0 and ID < 9 THEN 
				set MABXLNEW = CONCAT('BXL0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			ELSE IF ID >= 9 THEN
					SET MABXLNEW = CONCAT('BXL',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
				 END IF;
            end if;
	end if;
	RETURN (MABXLNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_BXL;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_BXL
    BEFORE INSERT
    ON BOXULY FOR EACH ROW
BEGIN
	SET NEW.MABXL = AUTO_IDBXL();
END$$    
DELIMITER ;

/*----- AUTOID_CONGKETNOI ----*/

DROP FUNCTION IF EXISTS AUTO_IDCKN;
DELIMITER $$
CREATE FUNCTION AUTO_IDCKN()
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
	DECLARE MACKNNEW VARCHAR(5);
    declare ID VARCHAR(2);
	IF (SELECT COUNT(MACKN) FROM CONGKETNOI) = 0 THEN
		SET MACKNNEW = 'CKN01';
	ELSE
		SELECT MAX(RIGHT(MACKN, 2)) INTO ID from CONGKETNOI;
			if ID >= 0 and ID < 9 THEN 
				set MACKNNEW = CONCAT('CKN0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			ELSE IF ID >= 9 THEN
					SET MACKNNEW = CONCAT('CKN',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
				 END IF;
            end if;
	end if;
	RETURN (MACKNNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_CKN;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_CKN
    BEFORE INSERT
    ON CONGKETNOI FOR EACH ROW
BEGIN
	SET NEW.MACKN = AUTO_IDCKN();
END$$    
DELIMITER ;

/*----- AUTOID_MANHINH ----*/

DROP FUNCTION IF EXISTS AUTO_IDMH;
DELIMITER $$
CREATE FUNCTION AUTO_IDMH()
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
	DECLARE MAMHNEW VARCHAR(5);
    declare ID VARCHAR(3);
	IF (SELECT COUNT(MAMH) FROM MANHINH) = 0 THEN
		SET MAMHNEW = 'MH001';
	ELSE
		SELECT MAX(RIGHT(MAMH, 3)) INTO ID from MANHINH;
			if ID >= 0 and ID < 9 THEN 
				set MAMHNEW = CONCAT('MH00',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			 END IF;
			IF ID >= 9 and ID < 99 THEN
					SET MAMHNEW = CONCAT('MH0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			END IF;
			IF ID >= 99 THEN
					SET MAMHNEW = CONCAT('MH',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			END IF;
	end if;
	RETURN (MAMHNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_MH;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_MH
    BEFORE INSERT
    ON MANHINH FOR EACH ROW
BEGIN
	SET NEW.MAMH = AUTO_IDMH();
END$$    
DELIMITER ;sanpham

/*----- AUTOID_DANHMUCSANPHAM ----*/

DROP FUNCTION IF EXISTS AUTO_IDDMSP;
DELIMITER $$
CREATE FUNCTION AUTO_IDDMSP()
RETURNS VARCHAR(6)
DETERMINISTIC
BEGIN
	DECLARE MADMNEW VARCHAR(6);
    declare ID VARCHAR(4);
	IF (SELECT COUNT(MADM) FROM DANHMUCSANPHAM) = 0 THEN
		SET MADMNEW = 'DM0001';
	ELSE
		SELECT MAX(RIGHT(MADM, 4)) INTO ID from DANHMUCSANPHAM;
			if ID >= 0 and ID < 9 THEN 
				set MADMNEW = CONCAT('DM000',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
            if ID >= 9 and ID < 99 THEN 
				set MADMNEW = CONCAT('DM00',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
            if ID >= 99 and ID < 999 THEN 
				set MADMNEW = CONCAT('DM0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
			IF ID >= 999 THEN
					SET MADMNEW = CONCAT('DM',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			END IF;
           
	end if;
	RETURN (MADMNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_DMSP;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_DMSP
    BEFORE INSERT
    ON DANHMUCSANPHAM FOR EACH ROW
BEGIN
	SET NEW.MADM = AUTO_IDDMSP();
END$$    
DELIMITER ;

/*----- AUTOID_SANPHAM ----*/

DROP FUNCTION IF EXISTS AUTO_IDSP;
DELIMITER $$
CREATE FUNCTION AUTO_IDSP()
RETURNS VARCHAR(6)
DETERMINISTIC
BEGIN
	DECLARE MASPNEW VARCHAR(6);
    declare ID VARCHAR(4);
	IF (SELECT COUNT(MASP) FROM SANPHAM) = 0 THEN
		SET MASPNEW = 'SP0001';
	ELSE
		SELECT MAX(RIGHT(MASP, 4)) INTO ID from SANPHAM;
			If ID >= 0 and ID < 9 THEN 
				set MASPNEW = CONCAT('SP000',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
            if ID >= 9 and ID < 99 THEN 
				set MASPNEW = CONCAT('SP00',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
            if ID >= 99 and ID < 999 THEN 
				set MASPNEW = CONCAT('SP0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
			IF ID >= 999 THEN
					SET MASPNEW = CONCAT('SP',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			END IF;
	end if;
	RETURN (MASPNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_SP;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_SP
    BEFORE INSERT
    ON SANPHAM FOR EACH ROW
BEGIN
	SET NEW.MASP = AUTO_IDSP();
END$$    
DELIMITER ;

/*----- AUTOID_HOADON ----*/
DROP FUNCTION IF EXISTS AUTO_IDHD;
DELIMITER $$
CREATE FUNCTION AUTO_IDHD()
RETURNS VARCHAR(6)
DETERMINISTIC
BEGIN
	DECLARE MAHDNEW VARCHAR(6);
    declare ID VARCHAR(4);
	IF (SELECT COUNT(MAHD) FROM HOADON) = 0 THEN
		SET MAHDNEW = 'HD0001';
	ELSE
		SELECT MAX(RIGHT(MAHD, 4)) INTO ID from HOADON;
			if ID >= 0 and ID < 9 THEN 
				set MAHDNEW = CONCAT('HD000',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			ELSE IF ID >= 9 and ID < 99 THEN
				SET MAHDNEW = CONCAT('HD00',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			ELSE IF ID >= 99 and ID < 999 THEN
				SET MAHDNEW = CONCAT('HD0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
            ELSE IF ID >= 999 and ID < 9999 THEN
				SET MAHDNEW = CONCAT('HD',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
				end if;
				end if;
				end if;
			end if;
	end if;
	RETURN (MAHDNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_HD;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_HD
    BEFORE INSERT
    ON HOADON FOR EACH ROW
BEGIN
	SET NEW.MAHD = AUTO_IDHD();
END$$    
DELIMITER ;

/*----- AUTOID_SUKIEN ----*/
DROP FUNCTION IF EXISTS AUTO_IDSK;
DELIMITER $$
CREATE FUNCTION AUTO_IDSK()
RETURNS VARCHAR(6)
DETERMINISTIC
BEGIN
	DECLARE MASKNEW VARCHAR(6);
    declare ID VARCHAR(4);
	IF (SELECT COUNT(MASK) FROM SUKIEN) = 0 THEN
		SET MASKNEW = 'SK0001';
	ELSE
		SELECT MAX(RIGHT(MASK, 4)) INTO ID from SUKIEN;
			if ID >= 0 and ID < 9 THEN 
				set MASKNEW = CONCAT('SK000',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			ELSE IF ID >= 9 and ID < 99 THEN
				SET MASKNEW = CONCAT('SK00',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			ELSE IF ID >= 99 and ID < 999 THEN
				SET MASKNEW = CONCAT('SK0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
            ELSE IF ID >= 999 and ID < 9999 THEN
				SET MASKNEW = CONCAT('SK',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
				end if;
				end if;
				end if;
			end if;
	end if;
	RETURN (MASKNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_SK;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_SK
    BEFORE INSERT
    ON SUKIEN FOR EACH ROW
BEGIN
	SET NEW.MASK = AUTO_IDSK();
END$$    
DELIMITER ;

/*------------------- TINH TIEN HOA DON ----------------------------*/

DROP TRIGGER IF EXISTS TRG_INSERT_CTHD;
DELIMITER $$
CREATE TRIGGER TRG_INSERT_CTHD
    BEFORE INSERT
    ON CTHD FOR EACH ROW
BEGIN
	SET @TONGTIEN = NEW.SOLUONG * (SELECT DONGIA FROM SANPHAM WHERE MASP = NEW.MASP);
    update HOADON
    SET TONGTIEN = TONGTIEN + @TONGTIEN
	WHERE MAHD = NEW.MAHD;
    update SANPHAM
    SET SOLUONG = SOLUONG - NEW.SOLUONG
	WHERE MASP = NEW.MASP;
END$$    
DELIMITER ;

DROP TRIGGER IF EXISTS TRG_UPDATE_CTHD;
DELIMITER $$
CREATE TRIGGER TRG_UPDATE_CTHD
    BEFORE UPDATE
    ON CTHD FOR EACH ROW
BEGIN
	IF(NEW.SOLUONG > OLD.SOLUONG) THEN
		SET @TONGTIEN = (NEW.SOLUONG - OLD.SOLUONG) * (SELECT DONGIA FROM SANPHAM WHERE MASP = OLD.MASP);
		UPDATE HOADON
		SET TONGTIEN = TONGTIEN + @TONGTIEN
		WHERE MAHD = OLD.MAHD;
        UPDATE SANPHAM
		SET SOLUONG = SOLUONG - (NEW.SOLUONG - OLD.SOLUONG)
		WHERE MASP = NEW.MASP;
	ELSE IF(NEW.SOLUONG < OLD.SOLUONG) THEN
		SET @TONGTIEN = (OLD.SOLUONG - NEW.SOLUONG) * (SELECT DONGIA FROM SANPHAM WHERE MASP = OLD.MASP);
		UPDATE HOADON
		SET TONGTIEN = TONGTIEN - @TONGTIEN
		WHERE MAHD = OLD.MAHD;
        UPDATE SANPHAM
		SET SOLUONG = SOLUONG + (OLD.SOLUONG - NEW.SOLUONG)
		WHERE MASP = NEW.MASP;
        END IF;
        END IF;
END$$    
DELIMITER ;

DROP TRIGGER IF EXISTS TRG_DELETE_CTHD;
DELIMITER $$
CREATE TRIGGER TRG_DELETE_CTHD
    BEFORE DELETE
    ON CTHD FOR EACH ROW
BEGIN
		SET @TONGTIEN = OLD.SOLUONG * (SELECT DONGIA FROM SANPHAM WHERE MASP = OLD.MASP);
		UPDATE HOADON
		SET TONGTIEN = TONGTIEN - @TONGTIEN	
		WHERE MAHD = OLD.MAHD;
        UPDATE SANPHAM
		SET SOLUONG = SOLUONG + OLD.SOLUONG
		WHERE MASP = OLD.MASP;
END$$    
DELIMITER ;

DROP TRIGGER IF EXISTS TRG_UPDATE_HD;
DELIMITER $$
CREATE TRIGGER TRG_UPDATE_HD
    BEFORE UPDATE
    ON HOADON FOR EACH ROW
BEGIN
	SET @GIAMGIA = (SELECT PHANTRAMGIAMGIA FROM SUKIEN WHERE MASK = NEW.MASK);
        SET NEW.THANHTIEN = NEW.TONGTIEN * (100 - @GIAMGIA) / 100 ;
	
END$$    
DELIMITER ;

/*------------------- INSERT ----------------------------*/

INSERT INTO TAIKHOAN
VALUES
  ("Colby",6000,"user"),
  ("Octavia",5548,"user"),
  ("Allistair",7899,"user"),
  ("Rafael",8491,"user"),
  ("Cecilia",9981,"user"),
  ("Quinn",6781,"user"),
  ("Ivana",8985,"user"),
  ("Timothy",9990,"user"),
  ("Fallon",7910,"user"),
  ("Cora",5010,"user");
INSERT INTO TAIKHOAN
VALUES
  ("Daryl",7978,"user"),
  ("Bianca",3010,"user"),
  ("Quentin",1606,"user"),
  ("Cyrus",7032,"user"),
  ("Castor",8016,"user"),
  ("Eliana",1617,"user"),
  ("Aurora",7762,"user"),
  ("Evangeline",2316,"user"),
  ("Malik",2035,"user"),
  ("Blake",2426,"user");
INSERT INTO TAIKHOAN
VALUES
  ("Abdul",8813,"user"),
  ("Joy",7125,"user"),
  ("Hilda",3226,"user"),
  ("Alexa",2941,"user"),
  ("Priscilla",9562,"user"),
  ("Xandra",2637,"user"),
  ("Ronan",8686,"user"),
  ("Wesley",2042,"user"),
  ("Kathleen",3650,"user"),
  ("Brittany",4733,"user");
INSERT INTO TAIKHOAN
VALUES
  ("Murphy",4511,"user"),
  ("Rhea",2830,"user"),
  ("Brendan",6759,"user"),
  ("Jack",5851,"user"),
  ("Yoko",8315,"user"),
  ("Winifred",4986,"user"),
  ("Candice",6682,"user"),
  ("Marvin",8240,"user"),
  ("Dexter",8675,"user"),
  ("Angelica",2792,"user");
INSERT INTO TAIKHOAN
VALUES
  ("Vernon",7937,"user"),
  ("Maya",5139,"user"),
  ("Timon",8182,"user"),
  ("Kennan",5215,"user"),
  ("Jade",1999,"user"),
  ("Uriah",8954,"user"),
  ("Hadley",9714,"user"),
  ("Baxter",4673,"user"),
  ("Rahim",7399,"user"),
  ("Sade",9023,"user");
INSERT INTO TAIKHOAN
VALUES
  ("Mallory",8265,"user"),
  ("Mannix",5906,"user"),
  ("Serena",5269,"user"),
  ("Aimee",1439,"user"),
  ("Carolyn",6765,"user"),
  ("Cooper",8571,"user"),
  ("Petra",4904,"user"),
  ("Judith",6169,"user"),
  ("Driscoll",6687,"user"),
  ("Shelly",3380,"user"),
  ("Elijah",1548,"user"),
  ("Merritt",7034,"user"),
  ("Drew",7636,"user"),
  ("Macon",7497,"user");

INSERT INTO TAIKHOAN
VALUES
  ("Victor",8857,"admin"),
  ("Gay",5785,"admin"),
  ("Illana",6594,"admin"),
  ("Avram",9782,"admin"),
  ("Basil",1524,"admin"),
  ("Uriak",2073,"admin"),
  ("Noelle",4806,"admin"),
  ("Deacon",3146,"admin"),
  ("Conan",2562,"admin"),
  ("Lilah",8847,"admin");
INSERT INTO TAIKHOAN
VALUES
  ("Gavin",7779,"admin"),
  ("Felix",4789,"admin"),
  ("Sydnee",9427,"admin"),
  ("Shana",7435,"admin"),
  ("Callie",3525,"admin"),
  ("Deanna",2919,"admin"),
  ("Rebekah",8938,"admin"),
  ("Cara",5804,"admin"),
  ("Ali",6494,"admin"),
  ("William",1175,"admin");

INSERT INTO KHACHHANG
VALUES
  ("","Colby","Colby Richmond","0766224933","dolor@odioaliquam.co.uk","NỮ"),
  ("","Octavia","Octavia Todd","0059201876","vehicula@metusfacilisislorem.com","NAM"),
  ("","Allistair","Allistair Harmon","0011551845","lacus.quisque@tristiquepellentesquetellus.co.uk","NAM"),
  ("","Rafael","Rafael Sparks","0263354718","phasellus@purus.edu","NAM"),
  ("","Cecilia","Cecilia Gilmore","0963623121","eu@eulacus.com","NỮ"),
  ("","Quinn","Quinn Bass","0740151289","risus.duis.a@dictumsapien.co.uk","NỮ"),
  ("","Ivana","Ivana Solomon","0277977066","curabitur.egestas@magnaet.edu","NAM"),
  ("","Timothy","Timothy Hensley","0684630282","odio@urnajustofaucibus.ca","NỮ"),
  ("","Fallon","Fallon Reid","0312580875","metus.sit.amet@vitaealiquet.com","NAM"),
  ("","Cora","Cora Rosario","0083293345","elit.sed@vulputatelacuscras.co.uk","NAM");
  
  INSERT INTO KHACHHANG
VALUES
  ("","Daryl","Daryl Hudson","0352615642","lacus@maurisrhoncusid.edu","NỮ"),
  ("","Bianca","Bianca Robinson","0723773634","quisque.tincidunt.pede@conguein.co.uk","NỮ"),
  ("","Quentin","Quentin Conner","0484274854","suspendisse.ac.metus@at.net","NAM"),
  ("","Cyrus","Cyrus Carpenter","0543382327","egestas.aliquam@pellentesqueut.org","NAM"),
  ("","Castor","Castor Nielsen","0616886120","duis.ac@utsagittislobortis.edu","NAM"),
  ("","Eliana","Eliana Wiley","0915493221","nulla.eu.neque@ultriciessem.com","NỮ"),
  ("","Aurora","Aurora Roach","0213391315","erat@cursusvestibulummauris.edu","NAM"),
  ("","Evangeline","Evangeline Rich","0391568616","vestibulum.lorem@ipsumdolor.edu","NỮ"),
  ("","Malik","Malik Espinoza","0718315362","egestas@mauriseuturpis.net","NAM"),
  ("","Blake","Blake Snow","0415397463","faucibus.orci.luctus@cum.org","NAM");
  
  INSERT INTO KHACHHANG
VALUES
  ("","Abdul","Abdul Leon","0432741325","eleifend@justo.co.uk","NỮ"),
  ("","Joy","Joy Harris","0355561112","augue.ac@lobortisclassaptent.com","NAM"),
  ("","Hilda","Hilda Cannon","0363130852","nulla@loremdonec.co.uk","NAM"),
  ("","Alexa","Alexa Oneal","0427102366","in.faucibus@orci.ca","NỮ"),
  ("","Priscilla","Priscilla Serrano","0326257961","nec.ligula.consectetuer@consequatlectussit.ca","NỮ"),
  ("","Xandra","Xandra Case","0636670280","ut.pharetra@cursuspurusnullam.ca","NỮ"),
  ("","Ronan","Ronan Davis","0143811292","sed.consequat@ut.ca","NAM"),
  ("","Wesley","Wesley Donaldson","0925717252","libero.at.auctor@senectus.ca","NAM"),
  ("","Kathleen","Kathleen Langley","0744381583","torquent@commodohendreritdonec.co.uk","NỮ"),
  ("","Brittany","Brittany Blake","0077473938","et.rutrum.non@gravidanunc.org","NAM");

INSERT INTO KHACHHANG
VALUES
  ("","Murphy","Murphy Mooney","0208622504","curae.phasellus@antebibendum.net","NỮ"),
  ("","Rhea","Rhea Hanson","0418318753","suspendisse.non.leo@faucibusleo.com","NAM"),
  ("","Brendan","Brendan Allison","0172110667","cras.eu@portaelit.com","NỮ"),
  ("","Jack","Jack Kaufman","0226694447","orci@curae.edu","NỮ"),
  ("","Yoko","Yoko Bradley","0412162635","semper@cursus.ca","NỮ"),
  ("","Winifred","Winifred Wong","0676184391","laoreet.posuere@quamcurabiturvel.com","NỮ"),
  ("","Candice","Candice Hyde","0951769321","et.ultrices.posuere@eteros.co.uk","NAM"),
  ("","Marvin","Marvin Guerrero","0110235134","orci.lobortis@pharetra.com","NỮ"),
  ("","Dexter","Dexter Franks","0332668966","ipsum.non@neque.net","NỮ"),
  ("","Angelica","Angelica Guy","0432296247","non.lobortis@metus.ca","NAM");

INSERT INTO KHACHHANG
VALUES
  ("","Vernon","Vernon Durham","0437111677","sed.auctor@erat.org","NỮ"),
  ("","Maya","Maya Preston","0828464256","libero.integer.in@aeneanmassa.co.uk","NAM"),
  ("","Timon","Timon Stuart","0188514707","pede@nequenullam.org","NỮ"),
  ("","Kennan","Kennan Andrews","0107138647","quam.dignissim@nuncpulvinar.com","NAM"),
  ("","Jade","Jade Knapp","0581302623","ipsum.sodales@curabiturutodio.com","NAM"),
  ("","Uriah","Uriah Mosley","0231905497","magna.lorem.ipsum@ac.edu","NAM"),
  ("","Hadley","Hadley Miller","0543131474","sed@felisdonec.co.uk","NAM"),
  ("","Baxter","Baxter Gomez","0223859868","donec.est@suspendisse.edu","NỮ"),
  ("","Rahim","Rahim Ramsey","0588568300","aenean.gravida@vel.ca","NỮ"),
  ("","Sade","Sade Beasley","0658985496","amet.luctus.vulputate@proin.co.uk","NỮ");
  
  INSERT INTO KHACHHANG
VALUES
  ("","Mallory","Mallory Case","0954851748","nulla@etrutrumeu.co.uk","NỮ"),
  ("","Mannix","Mannix Hoffman","0933716910","ut.tincidunt@nascetur.org","NỮ"),
  ("","Serena","Serena Howard","0217694121","integer.aliquam.adipiscing@nonleovivamus.edu","NỮ"),
  ("","Aimee","Aimee Lester","0117344275","dapibus.quam@felisullamcorper.net","NỮ"),
  ("","Carolyn","Carolyn Mclean","0225859520","lobortis.quam@quismassamauris.edu","NAM"),
  ("","Cooper","Cooper Delgado","0857161821","adipiscing@ligulaaeneaneuismod.com","NỮ"),
  ("","Petra","Petra Frazier","0618743178","rutrum@cursus.com","NAM"),
  ("","Judith","Judith Jarvis","0688818155","tincidunt.aliquam@arcuvestibulum.com","NAM"),
  ("","Driscoll","Driscoll Hester","0376660348","elit.fermentum.risus@ac.edu","NAM"),
  ("","Shelly","Shelly Cooley","0285788837","ligula.consectetuer@pretiumaliquetmetus.org","NỮ");
  
INSERT INTO NHANVIEN
VALUES
  ("","Victor","Victor Daniel","1981-02-10","NỮ","NV","Ap #960-1280 Molestie Road","2022-02-20","0037241169"),
  ("","Gay","Gay Ramos","1978-06-30","NAM","NV","Ap #978-6680 Ligula. Ave","2021-04-06","0217157522"),
  ("","Illana","Illana Keller","1988-04-09","NAM","NV","P.O. Box 542, 6803 Dui Ave","2020-10-03","0188404987"),
  ("","Avram","Avram Brennan","1996-10-29","NỮ","NV","P.O. Box 848, 3714 Aliquet St.","2020-11-17","0316289453"),
  ("","Basil","Basil Gomez","1998-04-14","NAM","QL","651-4022 Tristique Rd.","2020-09-16","0487099166"),
  ("","Uriak","Uriak Garrison","1990-05-02","NAM","NV","P.O. Box 933, 5192 Amet Ave","2021-09-01","0268959029"),
  ("","Noelle","Noelle Gomez","1992-08-24","NỮ","NV","Ap #205-753 Donec Av.","2021-08-30","0833656957"),
  ("","Deacon","Deacon Emerson","1990-05-13","NỮ","NV","8967 Magna. Av.","2021-03-02","0424127914"),
  ("","Conan","Conan Farley","1973-03-08","NAM","NV","624-1397 Donec Ave","2021-11-23","0712228906"),
  ("","Lilah","Lilah Wheeler","1987-07-26","NỮ","NV","P.O. Box 397, 4875 Nulla Av.","2020-04-01","0852728837");

INSERT INTO NHANVIEN
VALUES
  ("","Gavin","Gavin Wolfe","1983-12-01","NAM","NV","P.O. Box 121, 2976 Nunc St.","2020-06-06","0734158157"),
  ("","Felix","Felix Houston","1987-05-30","NỮ","NV","Ap #914-8010 Lacus, St.","2019-06-30","0683289218"),
  ("","Sydnee","Sydnee Bird","1991-07-15","NỮ","NV","897-5181 Lorem. Street","2020-05-27","0722776540"),
  ("","Shana","Shana Rose","1989-05-13","NỮ","NV","Ap #515-8505 Eu Rd.","2022-05-23","0146881148"),
  ("","Callie","Callie House","1984-06-06","NỮ","NV","Ap #590-7885 Id St.","2020-06-01","0466144184"),
  ("","Deanna","Deanna Black","1975-05-25","NAM","NV","2585 Magna St.","2019-04-05","0993140653"),
  ("","Rebekah","Rebekah Lott","1975-11-01","NỮ","NV","488-5782 Lorem Street","2020-11-29","0114256031"),
  ("","Cara","Cara Short","1979-01-09","NỮ","QL","7009 Sem St.","2020-03-22","0607545085"),
  ("","Ali","Ali Mercer","1990-02-09","NỮ","NV","477-848 Eget St.","2020-06-13","0632388282"),
  ("","William","William Foley","1992-02-06","NỮ","NV","Ap #536-3711 Litora Ave","2020-06-21","0619414581");

INSERT INTO `laptop`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'MacBook');
INSERT INTO `laptop`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'Asus');
INSERT INTO `laptop`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'HP');
INSERT INTO `laptop`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'Lenovo');
INSERT INTO `laptop`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'Acer');
INSERT INTO `laptop`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'Dell');
INSERT INTO `laptop`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'Msi');
INSERT INTO `laptop`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'LG');
INSERT INTO `laptop`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'GIGABYTE');

insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','144Hz','Chống chói Anti Glare, Tấm nền IPS','Không');
insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','60Hz','Công nghệ IPSLED','Không');
insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','240Hz','100% DCI-P3, Tấm nền IPS, Chống chói Anti Glare','Không');
insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','360Hz','100% sRGB, Chống chói Anti Glare, Tấm nền IPS','Không');
insert into manhinh values ('','17.3 inch','Full HD (1920x1080)','240Hz','Tấm nền IPS','Không');
insert into manhinh values ('','16 inch','QHD+ (2560 x 1600)','120Hz','100% DCI-P3, Tấm nền IPS','Có');
insert into manhinh values ('','13.4 inch','Full HD+ (1920 x 1200)','60Hz','100% sRGB, 500 nits Glossy, Tấm nền IPS','Có');
insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','144Hz','Tấm nền IPS','Không');
insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','144Hz','LED Tấm nền IPS','Không');
insert into manhinh values ('','17 inch','WQXGA (2560 x 1600)','60 Hz','Chống chói Anti Glare, Tấm nền IPS','Không');
insert into manhinh values ('','16 inch','WQXGA (2560 x 1600)','60 Hz','Chống chói Anti Glare, Tấm nền IPS','Không');
insert into manhinh values ('','14 inch','WUXGA (1920 x 1200)','60 Hz','Chống chói Anti Glare, Tấm nền IPS','Không');
insert into manhinh values ('','14 inch','4K/UHD(3840x21600)','60Hz','500 nits Glossy,  90% DCI-P3, HDR Ves400, Tấm nền IPS','có');
insert into manhinh values ('','13 inch','WQHD (2160x1350)','60Hz','Tấm nền IPS, 450 nits Glossy, Dolby Vision','Có');
insert into manhinh values ('','13.3 inch','QHD (2560 x 1600)','60Hz','300 nits Glossy, Chống chói Anti Glarem, Dolby Vision, Tấm nền IPS','Không');
insert into manhinh values ('','14 inch','Full HD (1920 x 1080)','60Hz','300 nits Glossy, Tấm nền IPS','Không');
insert into manhinh values ('','15.6 inch','Full HD (1920 x 1080)','120Hz','Tấm nền IPS, Chống chói Anti-Glare, 250 nits','có');
insert into manhinh values ('','15.6 inch','Full HD (1920 x 1080)','60 Hz','TFT, AcerComfyview, LED backlit','Không');
insert into manhinh values ('','14 inch','Full HD (1920x1080)','144Hz','Chống chói Anti Glare, Tấm nền IPS','Không');
insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','144Hz','Tấm nền IPS, AcerComfyview, LED backlit','Không');
insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','120Hz','LED, WVA','không');
insert into manhinh values ('','15.6 inch','QHD (2560 x 1600)','165Hz','Tấm nền IPS, AcerComfyview, LED backlit, TFT','Không');

        insert into congketnoi values ('','2 x USB 3.2, 2 x USB Type-C, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45)','Bluetooth 5.1, Wi-Fi 6 (802.11ax)','','HD webcam','','Có');
        insert into congketnoi values ('','2 x USB 3.2, HDMI, USB 2.0, USB Type-C','Bluetooth 5.1, Wi-Fi 6 (802.11ax)','Micro SD','HD webcam','Bản lề mở 180 độ','Có');
        insert into congketnoi values ('','Jack tai nghe 3.5 mm, Thunderbolt 4 USB-C, 3 x USB 3.2, HDMI, LAN (RJ45), Mini DisplayPort, USB Type-C','Bluetooth 5.2Wi-Fi 6E (802.11ax)','SD','FHD (30fps@1080p)','Đèn bàn phím chuyển màu RGB','Có');
        insert into congketnoi values ('','3 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), Thunderbolt 4 USB-C, USB Type-C','Bluetooth 5.2Wi-Fi 6E (802.11ax)','','Camera IR','Mở khóa khuôn mặtĐèn bàn phím chuyển màu RGB','Có');
        insert into congketnoi values ('','3 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), Thunderbolt 4 USB-C, USB Type-C','Bluetooth 5.2Wi-Fi 6E (802.11ax)','SD','FHD (30fps@1080p)','Đèn bàn phím chuyển màu RGB','Có');
        insert into congketnoi values ('','Jack tai nghe 3.5 mm, 3 x USB 3.2, HDMI, LAN (RJ45), Mini DisplayPort','Bluetooth 5.2Wi-Fi 6 (802.11ax)','SD','HD webcam','Đèn bàn phím chuyển màu RGB','Có');
        insert into congketnoi values ('','2 x Thunderbolt 4 USB-C, 2 x USB 3.2, HDMI,Jack tai nghe 3.5 mm','Bluetooth 5.2Wi-Fi 6E (802.11ax)','Micro SD','Camera IR, HD webcam','Bảo mật vân tay, Công tắc khóa camera, Mở khóa khuôn mặt','Có');
        insert into congketnoi values ('','1 x USB 3.2, 2 x Thunderbolt 4 USB-C, Jack tai nghe 3.5 mmUSB Type-C','Bluetooth 5.2Wi-Fi 6E (802.11ax)','Micro SD','Camera IRHD webcam','Bảo mật vân tay, Công tắc khóa camera, Mở khóa khuôn mặt, Tiêu chuẩn Nền Intel Evo','Có');
        insert into congketnoi values ('','Jack tai nghe 3.5 mm, 3 x USB 3.2, HDMI, LAN (RJ45), Mini DisplayPort, USB Type-C','Wi-Fi 6 (802.11ax)Bluetooth 5.1','SD','HD webcam','Đèn bàn phím chuyển màu RGB','Có');
        insert into congketnoi values ('','2 x Thunderbolt 4 USB-C, 2 x USB 3.2, HDMI, Jack tai nghe 3.5 mm','Bluetooth 5.1Wi-Fi 6 (802.11ax)','Micro SD','HD webcam','Bảo mật vân tayTiêu chuẩn Nền Intel Evo','Có');
        insert into congketnoi values ('','2 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), Mini DisplayPort, USB 2.0, USB Type-C','Bluetooth 5.2Wi-Fi 6 (802.11ax)','SD','HD webcam','','Có');
        insert into congketnoi values ('','1 x USB 3.2, 2 x Thunderbolt 4 USB-C, Jack tai nghe 3.5 mm','Bluetooth 5.1, Wi-Fi 6 (802.11ax)','','HD webcam','Bảo mật vân tay, Công tắc khóa camera, Tiêu chuẩn Nền Intel Evo','Có');
        insert into congketnoi values ('','2 x USB Type-C (Power Delivery and DisplayPort), USB Type-C, Jack tai nghe 3.5 mm','Bluetooth 5.0 Wi-Fi 6 (802.11ax)','Micro SD','Sau 5 MP, trước 5 MPCamera IR','Digital Pen, Mở khóa khuôn mặt','có');
        insert into congketnoi values ('','2 x Thunderbolt 4 USB-C, Jack tai nghe 3.5 mm, USB Type-C','Bluetooth 5.0 Wi-Fi 6 (802.11ax)','','Camera IR , HD webcam','Bản lề mở 180 độ, Mở khóa khuôn mặt, Tiêu chuẩn Nền Intel Evo, Độ bền chuẩn quân đội MLT STD 810G','Có');
        insert into congketnoi values ('','1 x USB 3.2 (Always on), 2 x Thunderbolt 4 USB-C, Jack tai nghe 3.5 mm','Bluetooth 5.0 Wi-Fi 6 (802.11ax)','','HD webcam','Bảo mật vân tay, Công tắc khóa camera, Tiêu chuẩn Nền Intel Evo, TPM 2.0','Có');
        insert into congketnoi values ('','1 x USB 3.2, 1 x USB 3.2 (Always on), HDMI, Jack tai nghe 3.5 mm, Thunderbolt 4 USB-C, USB Type-C (support data transfer, Power Delivery 3.0 and DisplayPort 1.4)','Bluetooth 5.0 Wi-Fi 6 (802.11ax)','Micro SD ','HD webcam','Bút cảm ứng, Bảo mật vân tay, Công tắc khóa camera','Có');
        insert into congketnoi values ('','2 x USB 3.2, 2 x USB Type-C, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45)','Bluetooth 5.0 Wi-Fi 6 (802.11ax)','','HD webcam','Công tắc khóa camera','Có');
        insert into congketnoi values ('','1 x USB 3.2, 1 x USB 3.2 (Always on), HDMI, Jack tai nghe 3.5 mm, Thunderbolt 4 USB-C, USB Type-C (support data transfer, Power Delivery 3.0 and DisplayPort 1.4)','Bluetooth 5.1Wi-Fi 6 (802.11ax)','Micro SD','HD webcam','Bút cảm ứng, Bảo mật vân tay, Công tắc khóa camera','có');
        insert into congketnoi values ('','2 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), Thunderbolt 4 USB-C, USB Type-C','Bluetooth 5.1Wi-Fi 6 (802.11ax)','Micro SD','HD webcam','Bản lề mở 180 độ, Bảo mật vân tay, Công tắc khóa camera, Độ bền chuẩn quân đội MLT STD 810H','Không');
        insert into congketnoi values ('','3 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), USB Type-C','Bluetooth 5.1 Wi-Fi 6 (802.11ax)','','HD webcam','Đèn bàn phím chuyển màu RGB','Có');
        insert into congketnoi values ('','HDMIUSB 3.12 x USB 2.0LAN (RJ45)Jack tai nghe 3.5 mm','Bluetooth 5.0Wi-Fi 802.11 a/b/g/n/ac','','VGA webcam ','Bản lề mở 180 độ','Không');
        insert into congketnoi values ('','2 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), USB 2.0','BluetoothWi-Fi 802.11 a/b/g/n/ac','SD','HD webcam','','không');
        insert into congketnoi values ('','Jack tai nghe 3.5 mm, 1 x USB 3.2, HDMI, LAN (RJ45), Thunderbolt 3, 2 x USB 2.0, Mini DisplayPort','Bluetooth 5.0 Wi-Fi 6 (802.11ax)','SD','HD webcam','Bảo mật vân tay','có');
        insert into congketnoi values ('','3 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), Mini DisplayPort, Thunderbolt 4 USB-C','Bluetooth 5.1Wi-Fi 6 (802.11ax)','','HD webcam','Công nghệ quạt AeroBlade 3D thế hệ 5 2 quạt tản nhiệtĐèn bàn phím chuyển màu RGB','Có');
        insert into congketnoi values ('','1 x USB 3.2 2 x USB 2.0 HDMI Jack tai nghe 3.5 mm USB Type-C','Bluetooth 4.1Wi-Fi 802.11 a/b/g/n/ac','',' VGA Webcam',' Bảo mật vân tay','Không');
        insert into congketnoi values ('','2 x Thunderbolt 3 (USB-C)Jack tai nghe 3.5 mm','Bluetooth 5.0Wi-Fi 6 (802.11ax)','','720p FaceTime Camera',' Bảo mật vân tay',' Có');
        
       
        
        insert into BONHORAM values ('','16 GB','DDR4 2 khe (1 khe 8GB + 1 khe 8GB)','3200MHz','64 GB');
        insert into BONHORAM values ('','8 GB','DDR4 2 khe (1 khe 8GB + 1 khe rời)','3200MHz','64 GB');
        insert into BONHORAM values ('','32 GB','DDR4 2 khe (1 khe 16GB + 1 khe 16GB)','3200MHz','64 GB');
        insert into BONHORAM values ('','16 GB','LPDDR4X (8GB On board + 8GB On board)','2133 MHz (Hãng công bố)','Không hỗ trợ nâng cấp');
        insert into BONHORAM values ('','16 GB','LPDDR4 (On board)','2133 MHz (Hãng công bố)','Không hỗ trợ nâng cấp');
        insert into BONHORAM values ('','16 GB','DDR4 (2 khe)','2666 MHz','32 GB');
        insert into BONHORAM values ('','16 GB','LPDDR4X (On board)','4266 MHz','Không hỗ trợ nâng cấp');
        insert into BONHORAM values ('','8 GB','DDR4 2 khe (1 khe 8GB + 1 khe rời)','4266 MHz','');
        insert into BONHORAM values ('','16GB','LPDDR4 (On board)','4266 MHz','Không hỗ trợ nâng cấp');
        insert into BONHORAM values ('','8GB','DDR4 (On board)','2666 MHz','Không hỗ trợ nâng cấp');
        insert into BONHORAM values ('','8GB','DDR4 (On board)','3200 MHz','Không hỗ trợ nâng cấp');
		insert into BONHORAM values ('','8GB','DDR4 2 khe (1 khe 8GB onboard + 1 khe trống)','3200MHz','40GB');
        insert into BONHORAM values ('','8GB','DDR4 (2 khe)','2933 MHz','16GB');
        insert into BONHORAM values ('','16GB','DDR4 2 khe (8GB onboard+ 1 khe 8GB)','3200 MHz','40 GB');
        insert into BONHORAM values ('','8 GB','DDR4 2 khe (1 khe 8GB + 1 khe rời)','3200 MHz','32 GB');
        insert into BONHORAM values ('','4 GB','DDR4 2 khe (1 khe 4GB + 1 khe rời)','2400 MHz','12 GB');
        insert into BONHORAM values ('','8 GB','DDR4 2 khe (1 khe 8GB + 1 khe rời)','2666 MHz','16 GB');
        insert into BONHORAM values ('','8 GB','DDR4 2 khe (1 khe 8GB + 1 khe rời)','2666 MHz','32GB');
        insert into BONHORAM values ('','16GB','DDR4 2 khe (1 khe 8GB + 1 khe 8GB)','2933 MHz','16GB');
        insert into BONHORAM values ('','16 GB','DDR4 2 khe (1 khe 8GB + 1 khe 8GB)','2700 MHz','32 GB');
        insert into BONHORAM values ('','16 GB','DDR4 2 khe (1 khe 8GB + 1 khe 8GB)','3200 MHz','32 GB');
        insert into BONHORAM values ('','8GB','','','');
        insert into BONHORAM values ('','16GB','','','');
        insert into BONHORAM values ('','32GB','','','');
        insert into BONHORAM values ('','8 GB','LPDDR4X (On board)','4267 MHz','Không hỗ trợ nâng cấp');
        insert into BONHORAM values ('','4GB','LPDDR4X (On board)','3200 MHz','20GB');
        insert into BONHORAM values ('','8 GB','DDR4 2 khe (1 khe 4GB + 1 khe 4GB)','3200 MHz','32 GB');
        
        insert into BOXULY values ('','Intel Core i5 Comet Lake - 10500H',6,12,'2.50 GHz','Turbo Boost 4,5GHZ','12MB');
        insert into BOXULY values ('','Intel Core i5 Tiger Lake - 1155G7',4,8,'2.50 GHz','Turbo Boost 4,5GHZ','8MB');
        insert into BOXULY values ('','Intel Core i7 Tiger Lake - 11800H',8,16,'2.30 GHz','Turbo Boost 4.6 GHz','24MB');
        insert into BOXULY values ('','Intel Core i7 Tiger Lake - 1195G7',4,8,'2.90 GHz','Turbo Boost 5.0 GHz','12MB');
        insert into BOXULY values ('','Intel Core i7 Tiger Lake - 1185G7',4,8,'3.00 GHz','Turbo Boost 4.8 GHz','12MB');
        insert into BOXULY values ('','Intel Core i7 Comet Lake - 10750H',6,12,'2.60 GHz','Turbo Boost 5.0 GHz','12MB');
        insert into BOXULY values ('','Intel Core i7 Tiger Lake - 1165G7',4,8,'2.80 GHz','Turbo Boost 4.7 GHz','12MB');
        insert into BOXULY values ('','Intel Core i5 Tiger Lake - 11400H',6,12,'2.70 GHz','Turbo Boost 4,5 GHZ','12MB');
        insert into BOXULY values ('','Intel Core i5 Comet Lake - 10500H',6,12,'2.50 GHz','Turbo Boost 4,5 GHZ','12MB');
        insert into BOXULY values ('','Intel Core i7 Comet Lake - 10510U',4,8,'1.80 GHz','Turbo Boost 4.9 GHz','8MB');
        insert into BOXULY values ('','Intel Core i5 Tiger Lake - 1135G7',4,8,'2.40 GHz','Turbo Boost 4.2 GHz','8 MB');
        insert into BOXULY values ('','Intel Core i5 Comet Lake - 10210U',4,8,'1.6GHz','Turbo Boost 4.2 GHz','6 MB');
        insert into BOXULY values ('','Intel Core i3 Ice Lake - 1005G1',2,4,'1.2 GHz','Turbo Boost 3.4 GHz','4 MB');
        insert into BOXULY(MABXL,CONGNGHECPU) values ('','Apple M1');
        insert into BOXULY values ('','Intel Core i5 Tiger Lake - 1135G7',4,8,'2.40 GHz','Turbo Boost 4.2 GHz','8 MB');
        insert into BOXULY values ('','Intel Core i3 Tiger Lake - 1115G4',2,4,'3 GHz','Turbo Boost 4.1 GHz','6 MB');
        insert into BOXULY values ('','Intel Core i5 Tiger Lake - 1135G7',4,8,'2.40 GHz','Turbo Boost 4.2 GHz','8MB');
        insert into BOXULY values ('','AMD Ryzen 5 - 5600H',6,12,'3.30 GHz','Turbo Boost 4.2 GHz','16 MB');
        
insert into sanpham values ('','MH010','BXL14','RAM22','CKN26','DM0001','Laptop Apple MacBook Air M1 2020 8GB/256GB/7-core GPU (MGN63SA/A)',3,'Trắng','256 GB SSD','Card tích hợp7 nhân GPU','','Mac OS','Vỏ kim loại nguyên khối','Dài 304.1 mm - Rộng 212.4 mm - Dày 4.1 mm đến 16.1 mm - Nặng 1.29 kg','','Khoảng 10 tiếng',2020,'','27490000','/HinhAnh/SP001.jpg');
insert into sanpham values ('','MH010','BXL14','RAM23','CKN26','DM0001','Laptop Apple MacBook Pro M1 2020 16GB/512GB (Z11C)',5,'Xám','512 GB SSD','Card tích hợp8 nhân GPU','','Mac OS','Vỏ kim loại nguyên khối','Dài 304.1 mm - Rộng 212.4 mm - Dày 15.6 mm - Nặng 1.4 kg','','Khoảng 10 tiếng',2020,'','44990000','/HinhAnh/SP002.jpg');
insert into sanpham values ('','MH010','BXL14','RAM23','CKN26','DM0001','Laptop Apple MacBook Pro M1 2020 16GB/512GB (Z11A)',5,'Đen','512 GB SSD','Card tích hợp8 nhân GPU','','Mac OS','Vỏ kim loại nguyên khối','Dài 304.1 mm - Rộng 212.4 mm - Dày 15.6 mm - Nặng 1.4 kg','','Khoảng 10 tiếng',2020,'','44990001','/HinhAnh/SP003.jpg');
insert into sanpham values ('','MH012','BXL14','RAM24','CKN26','DM0001','Laptop Apple MacBook Pro 16 M1 Max 2021 10 core-CPU/32GB/1TB SSD/32 core-GPU (MK1A3SA/A)',4,'Đen','1 TB SSD','Card tích hợp32 core-GPU','','Mac OS','Vỏ kim loại nguyên khối','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.2 kg','','Khoảng 10 tiếng',2021,'','90990000','/HinhAnh/SP004.jpg');
insert into sanpham values ('','MH011','BXL14','RAM24','CKN26','DM0001','Laptop Apple MacBook Pro 16 M1 Max 2021 10 core-CPU/32GB/1TB SSD/32 core-GPU (MK1A3SA/A)',3,'Xám','1 TB SSD','Card tích hợp32 core-GPU','','Mac OS','Vỏ kim loại nguyên khối','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.2 kg','','Khoảng 10 tiếng',2021,'','88990000','/HinhAnh/SP005.jpg');
insert into sanpham values ('','MH012','BXL14','RAM24','CKN26','DM0001','Laptop Apple MacBook Pro 16 M1 Pro 2021 10 core-CPU/16GB/1TB SSD/16 core-GPU (MK193SA/A)',4,'Đen','1 TB SSD','Card tích hợp32 core-GPU','','Mac OS','Vỏ kim loại nguyên khối','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.2 kg','','Khoảng 10 tiếng',2020,'','45112000','/HinhAnh/SP006.jpg');
insert into sanpham values ('','MH010','BXL14','RAM23','CKN26','DM0001','Laptop Apple MacBook Pro M1 2020 16GB/1TB SSD (Z11C000CJ)',2,'Đen','1 TB SSD','Card tích hợp32 core-GPU','','Mac OS','Vỏ kim loại nguyên khối','Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.2 kg','','Khoảng 10 tiếng',2020,'','50990000','/HinhAnh/SP007.jpg');
insert into sanpham values ('','MH015','BXL15','RAM25','CKN01','DM0002','Laptop Asus ZenBook UX325EA i5 1135G7/8GB/512GB/OLED/Cáp/Túi/Win10 (KG363T)',5,'Đen','512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)','Card tích hợpIntel Iris Xe','','Windows 10 Home SL','Vỏ kim loại nguyên khối','Dài 304.2 mm - Rộng 203 mm - Dày 13.9 mm - Nặng 1.14 kg','','4-cell Li-ion, 67 Wh',2021,'','23790000','/HinhAnh/SP008.jpg');
insert into sanpham values ('','MH015','BXL15','RAM25','CKN02','DM0002','Laptop Asus ZenBook UX325EA i5 1135G7/8GB/512GB/OLED/Cáp/Túi/Win10 (KG363A)',10,'Xám','512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)','Card tích hợpIntel Iris Xe','','Windows 10 Home SL','Vỏ kim loại nguyên khối','Dài 304.2 mm - Rộng 203 mm - Dày 13.9 mm - Nặng 1.14 kg','','4-cell Li-ion, 67 Wh',2021,'','23790000','/HinhAnh/SP009.jpg');
insert into sanpham values ('','MH020','BXL07','RAM25','CKN07','DM0002','Laptop Asus TUF Gaming FX516PC i7 11370H/8GB/512GB/4GB RTX3050/144Hz/Win10 (HN001T)',10,'Đen','513 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)','Card tích hợpIntel Iris Xe','','Windows 10 Home SL','Vỏ kim loại nguyên khối','Dài 305 mm - Rộng 211 mm - Dày 11.9 mm - Nặng 1.3 kg','','4-cell Li-ion, 67 Wh',2020,'','23790000','/HinhAnh/SP010.jpg');
insert into sanpham values ('','MH020','BXL07','RAM04','CKN08','DM0002','Laptop Asus ZenBook Flip UX363EA i7 1165G7/16GB/512GB/OLED/Touch/Pen/Cáp/Túi/Win10 (HP548T) ',12,'Đen','SSD 512 GB NVMe PCIe','Card tích hợpIntel Iris Xe','','Windows 10 Home SL','Vỏ kim loại nguyên khối','Dài 305 mm - Rộng 211 mm - Dày 11.9 mm - Nặng 1.3 kg','','4-cell Li-ion, 67 Wh',2020,'','24020000','/HinhAnh/SP011.jpg');
insert into sanpham values ('','MH018','BXL06','RAM02','CKN15','DM0002','Laptop Asus TUF Gaming FX506HC i5 11400H/8GB/512GB/4GB RTX3050/144Hz/Win10 (HN002T)',10,'Đen','SSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng','Card rờiRTX 3050 4GB','','Windows 10 Home SL','Vỏ kim loại nguyên khối','Dài 305 mm - Rộng 211 mm - Dày 11.9 mm - Nặng 1.3 kg','','4-cell Li-ion, 67 Wh',2021,'','33490000','/HinhAnh/SP012.jpg');
insert into sanpham values ('','MH019','BXL09','RAM02','CKN15','DM0002','Laptop Asus VivoBook X415EA i5 1135G7/8GB/512GB/Win10 (EB637T)',10,'Đen','Hỗ trợ khe cắm HDD SATASSD 512 GB NVMe PCIe','Card tích hợpIntel Iris Xe','','Windows 10 Home SL + Office H&S 2019 vĩnh viễn','Vỏ nhựa','Dài 325.4 mm - Rộng 216 mm - Dày 19.9 mm - Nặng 1.55 kg','','2-cell Li-ion, 37 Wh',2020,'','45020000','/HinhAnh/SP013.jpg');
insert into sanpham values ('','MH002','BXL16','RAM26','CKN17','DM0002','Laptop Asus VivoBook X515EA i3 1115G4/4GB/256GB/Win10 (BQ994T) ',10,'Đen','Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB)256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)','Card tích hợpIntel UHD','','Windows 10 Home SL','Vỏ nhựa','Dài 360.2 mm - Rộng 234.9 mm - Dày 19.9 mm - Nặng 1.8 kg','','2-cell Li-ion, 37 Wh',2020,'','49000000','/HinhAnh/SP014.jpg');
insert into sanpham values ('','MH015','BXL10','RAM12','CKN18','DM0003','Laptop HP Envy 13 ba1030TU i7 1165G7/8GB/512GB/Office H&S2019/Win10 (2K0B6PA)',10,'Xám','SSD 512 GB NVMe PCIe','Card tích hợpIntel Iris Xe','','Windows 10 Home SL + Office H&S 2019 vĩnh viễn','Vỏ kim loại nguyên khối','Dài 306.5 mm - Rộng 194.6 mm - Dày 16.9 mm - Nặng 1.236 kg','','3 cell Lion',2020,'','30490000','/HinhAnh/SP015.jpg');
insert into sanpham values ('','MH010','BXL18','RAM14','CKN13','DM0003','Laptop HP Gaming VICTUS 16 e0175AX R5 5600H/8GB/512GB/4GB RTX3050/144Hz/Win10 (4R0U8PA)',10,'Xám','512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)Không hỗ trợ khe cắm HDD','Card rờiRTX 3050 4GB','','Windows 10 Home SL','Vỏ nhựa','Dài 370 mm - Rộng 260 mm - Dày 23.5 mm - Nặng 2.46 kg','','2-cell Li-ion, 37 Wh',2020,'','24290000','/HinhAnh/SP016.jpg');
insert into sanpham values ('','MH017','BXL10','RAM18','CKN25','DM0003','Laptop HP Omen 15 ek0078TX i7 10750H/16GB/1TB SSD/8GB RTX2070 Max-Q/300Hz/Office H&S2019/Win10 (26Y68PA)',10,'Đen','1 TB SSD M.2 PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng','Card rờiRTX 2070 Max-Q 8GB','','Windows 10 Home SL + Office H&S 2019 vĩnh viễn','Kim loại và polycarbonate','Dài 357.9 mm - Rộng 239.7 mm - Dày 22.5 mm - Nặng 2.36 kg','','6-cell Li-ion, 70.9 Wh',2021,'','50490000','/HinhAnh/SP017.jpg');
insert into sanpham values ('','MH017','BXL10','RAM19','CKN25','DM0003','Laptop HP EliteBook X360 1030 G8 i7 1165G7/16GB/512GB/Touch/Pen/Win10 Pro (3G1C4PA)',3,'Đen','SSD 512 GB NVMe PCIe','Card tích hợpIntel Iris Xe','','Windows 10 Pro','Vỏ kim loại nguyên khối','Dài 303.7 mm - Rộng 193.9 mm - Dày 16.1 mm - Nặng 1.25 kg','','4-cell Li-ion, 54 Wh',2021,'','49090000','/HinhAnh/SP018.jpg');
insert into sanpham values ('','MH018','BXL17','RAM27','CKN25','DM0003','Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10 (46M02PA)',5,'Đen','SSD 512 GB NVMe PCIe','Card tích hợpIntel Iris Xe','','Windows 10 Home SL','Nắp lưng và chiếu nghỉ tay bằng kim loại','Dài 360.2 mm - Rộng 234 mm - Dày 17.9 mm - Nặng 1.677 kg','','2-cell Li-ion, 37 Wh',2020,'','18790000','/HinhAnh/SP019.jpg');
insert into sanpham values ('','MH017','BXL17','RAM27','CKN25','DM0003','Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10 (46M02PB)',3,'Xám','SSD 512 GB NVMe PCIe','Card tích hợpIntel Iris Xe','','Windows 10 Home SL','Nắp lưng và chiếu nghỉ tay bằng kim loại','Dài 360.2 mm - Rộng 234 mm - Dày 17.9 mm - Nặng 1.677 kg','','2-cell Li-ion, 37 Wh',2020,'','18790000','/HinhAnh/SP020.jpg');
insert into sanpham values ('','MH013','BXL05','RAM09','CKN12','DM0004','Laptop Lenovo Yoga 9 14ITL5 i7/1185G7/16GB/1TB SSD/Touch/Pen/Win10 (82BG006EVN)',5,'xám','1 TB SSD M.2 PCIe','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home SL','Vỏ kim loại','Dài 319.4 mm - Rộng 216.4 mm - Dày 15.7 mm - Nặng 1.37 kg',' ','Li-Polymer, 60 Wh',2021,'','29990000','/HinhAnh/SP021.jpg');
insert into sanpham values ('','MH014','BXL10','RAM10','CKN13','DM0004','Laptop Lenovo Yoga Duet 7 13IML05 i7 10510U/8GB/512GB/Touch/Pen/Win10 (82AS007CVN)',4,'đen','SSD 512 GB NVMe PCIe','Card tích hợp - Intel UHD Graphics','','Windows 10 Home SL','Vỏ kim loại','Dài 297.4 mm - Rộng 207.4 mm - Dày 9.19 mm - Nặng 1.1683 kg',' ','Li-Polymer, 42 Wh',2020,'','29990000','/HinhAnh/SP022.jpg');
insert into sanpham values ('','MH015','BXL11','RAM07','CKN14','DM0004','Laptop Lenovo YOGA Slim 7 Carbon 13ITL5 i5 1135G7/16GB/512GB/Win10 (82EV0016VN)',4,'trắng','SSD 512 GB NVMe PCIe','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home SL','Mặt lưng Carbon - Chiếu nghỉ tay bằng Nhôm Magie','Dài 295.88 mm - Rộng 208.85 mm - Dày 15 mm - Nặng 0.966 kg',' ','Li-Polymer, 50 Wh',2020,'','28990000','/HinhAnh/SP023.jpg');
insert into sanpham values ('','MH016','BXL07','RAM11','CKN15','DM0004','Laptop Lenovo Yoga 7 14ITL5 i7 1165G7/8GB/512GB/Touch/Pen/Win10 (82BH00CKVN)',4,'đen','512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home SL','Vỏ kim loại','Dài 320.4 mm - Rộng 214.6 mm - Dày 17.7 mm - Nặng 1.43 kg',' ','71 Wh',2020,'','28990000','/HinhAnh/SP024.jpg');
insert into sanpham values ('','MH016','BXL07','RAM12','CKN16','DM0004','Laptop Lenovo ThinkBook 14s Yoga ITL i7 1165G7/8GB/512GB/Touch/Pen/Win10 (20WE004EVN)',5,'xám','Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home SL','Vỏ kim loại','Dài 320 mm - Rộng 216 mm - Dày 16.9 mm - Nặng 1.5 kg',' ','60 Wh',2021,'','27890000','/HinhAnh/SP025.jpg');
insert into sanpham values ('','MH014','BXL12','RAM10','CKN13','DM0004','Laptop Lenovo Yoga Duet 7 13IML05 i5 10210U/8GB/512GB/Touch/Pen/Win10 (82AS007BVN)',5,'đen','SSD 512 GB NVMe PCIe','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home SL','Vỏ kim loại','Dài 297.4 mm - Rộng 207.4 mm - Dày 9.19 mm - Nặng 1.1683 kg',' ','Li-Polymer, 42 Wh',2020,'','26990000','/HinhAnh/SP026.jpg');
insert into sanpham values ('','MH017','BXL06','RAM13','CKN17','DM0004','Laptop Lenovo Ideapad Gaming 3 15IMH005 i7 10750H/8GB/512GB/4GB GTX1650Ti/120Hz/Win10 (81Y4013UVN)',3,'xanh đen','SSD 512 GB NVMe PCIe, Hỗ trợ khe cắm HDD SATA','Card rời - NVIDIA GeForce GTX 1650Ti 4 GB','','Windows 10 Home SL','Vỏ nhựa','Dài 359 mm - Rộng 249.6 mm - Dày 24.9 mm - Nặng 2.2 kg',' ','45 Wh',2020,'','26990000','/HinhAnh/SP027.jpg');
insert into sanpham values ('','MH016','BXL11','RAM14','CKN18','DM0004','Laptop Lenovo ThinkBook 14s Yoga ITL i5 1135G7/16GB/512GB/Touch/Pen/Win10 (20WE004DVN)',3,'xám','Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB) 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home SL','Vỏ kim loại','Dài 320 mm - Rộng 216 mm - Dày 16.9 mm - Nặng 1.5 kg',' ','60 Wh',2021,'','25890000','/HinhAnh/SP028.jpg');
insert into sanpham values ('','MH016','BXL11','RAM12','CKN18','DM0004','Laptop Lenovo ThinkBook 14s Yoga ITL i5 1135G7/8GB/512GB/Touch/Pen/Win10 (20WE004CVN)',3,'xám','Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home SL','Vỏ kim loại','Dài 320 mm - Rộng 216 mm - Dày 16.9 mm - Nặng 1.5 kg','  ','60 Wh',2021,'','24790000','/HinhAnh/SP029.jpg');
insert into sanpham values ('','MH016','BXL07','RAM12','CKN19','DM0004','Laptop Lenovo ThinkBook 14 G2 ITL i7 1165G7/8GB/512GB/Win10 (20VD003LVN)',4,'xám','Hỗ trợ khe cắm HDD SATA SSD 512 GB NVMe PCIe','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home SL','Vỏ kim loại','Dài 323 mm - Rộng 218 mm - Dày 17.9 mm - Nặng 1.4 kg',' ','45 Wh',2020,'','21990000','/HinhAnh/SP030.jpg');
insert into sanpham values ('','MH020','BXL08','RAM20','CKN20','DM0005','Laptop Acer Nitro 5 Gaming AN515 57 54AF i5 11400H/16GB/512GB/4GB RTX3050/144Hz/Win11 (NH.QENSV.004)',4,'đen','512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)','Card rời - NVIDIA GeForce RTX3050, 4 GB','','Windows 10 Home SL','Vỏ nhựa','Dài 363.4 mm - Rộng 255 mm - Dày 23.9 mm - Nặng 2.2 kg',' ','4-cell Li-ion, 57 Wh',2021,'','28990000','/HinhAnh/SP031.jpg');
insert into sanpham values ('','MH018','BXL13','RAM16','CKN21','DM0005','Laptop Acer Aspire A315 56 308N i3 1005G1/4GB/256GB/Win10 (NX.HS5SV.00C)',4,'đen','SSD 256 GB NVMe PCIeHỗ trợ khe cắm HDD SATA','Card tích hợp - Intel UHD Graphics','','Windows 10 Home SL','Vỏ nhựa','Dài 363.4 mm - Rộng 247.5 mm - Dày 19.9 mm - Nặng 1.7 kg                        ',' ','2-Cell Li-ion',2020,'','11790000','/HinhAnh/SP032.jpg');
insert into sanpham values ('','MH020','BXL03','RAM15','CKN09','DM0005','Laptop Acer Predator Helios PH315 54 78W5 i7 11800H/8GB/512GB/4GB RTX3050Ti/144Hz/Balo/Win10 (NH.QC5SV.001)',4,'đen','512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB), Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)','Card rời - NVIDIA GeForce RTX3050Ti, 4 GB','','Windows 10 Home SL','Vỏ nhựa','Dài 363 mm - Rộng 255 mm - Dày 22.9 mm - Nặng 2.3 kg',' ','4-cell Li-ion, 57 Wh',2021,'','32990000','/HinhAnh/SP033.jpg');
insert into sanpham values ('','MH020','BXL03','RAM15','CKN20','DM0005','Laptop Acer Nitro 5 Gaming AN515 57 727J i7 11800H/8GB/512GB/4GB RTX3050Ti/144Hz/Win10 (NH.QD9SV.005.)',4,'đen','Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)','Card rời - NVIDIA GeForce RTX3050Ti, 4 GB','','Windows 10 Home SL','Vỏ nhựa','Dài 363.4 mm - Rộng 255 mm - Dày 23.9 mm - Nặng 2.2 kg',' ','4-cell Li-ion, 57 Wh',2021,'','29990000','/HinhAnh/SP034.jpg');
insert into sanpham values ('','MH022','BXL03','RAM20','CKN24','DM0005','Laptop Acer Predator Triton 300 PT315 53 71DJ i7 11800H/16GB/512GB/8GB RTX3070/165Hz/Win10 (NH.QDSSV.001)',4,'đen','Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)','Card rời - NVIDIA GeForce RTX 3070, 8 GB','','Windows 10 Home SL','Vỏ kim loại','Dài 353 mm - Rộng 255 mm - Dày 19.9 mm - Nặng 2 kg',' ','4-cell Li-ion, 59 Wh',2021,'','44990000','/HinhAnh/SP035.jpg');
insert into sanpham values ('','MH019','BXL11','RAM17 ','CKN22','DM0006','Laptop Dell Vostro 3400 i5 1135G7/8GB/256GB//OfficeH&S 2019/Win10 (70253900)',4,'đen','SSD 256 GB NVMe PCIe, Hỗ trợ khe cắm HDD SATA','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home SL + Office Home & Student 2019 vĩnh viễn','Vỏ nhựa','Dài 328.7 mm - Rộng 239.5 mm - Dày 19.9 mm - Nặng 1.64 kg',' ','3-cell Li-ion, 42 Wh',2021,'','18890000','/HinhAnh/SP036.jpg');
insert into sanpham values ('','MH018','BXL11','RAM18','CKN22','DM0006','Laptop Dell Vostro 3500 i5 1135G7/8GB/512GB/Office H&S2019/Win10 (7G3983)',5,'đen','SSD 512 GB NVMe PCIeHỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB)','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home SL + Office Home & Student 2019 vĩnh viễn','Vỏ nhựa','Dài 364 mm - Rộng 249 mm - Dày 19.9 mm - Nặng 1.98 kg',' ','3-cell Li-ion, 42 Wh',2021,'','20990000','/HinhAnh/SP037.jpg');
insert into sanpham values ('','MH021','BXL06','RAM19','CKN23','DM0006','Laptop Dell Gaming G3 15 i7 10750H/16GB/512GB/6GB GTX1660Ti/120Hz/Win10 (P89F002BWH)',3,'trắng','SSD 512 GB NVMe PCIe Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng','Card rời - NVIDIA GeForce GTX 1660Ti, 6 GB','','windowns 10 Home SL','Vỏ nhựa','Dài 364.46 mm - Rộng 254 mm - Dày 30.96 mm - Nặng 2.58 kg',' ','4-cell Li-ion, 68 Wh',2020,'','31990000','/HinhAnh/SP038.jpg');
insert into sanpham values ('','MH021','BXL06','RAM19','CKN23','DM0006','Laptop Dell Gaming G3 i7 10750H/16GB/512GB/6GB GTX1660Ti/120Hz/Win10 (P89F002G3500B)',6,'đen','Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộngSSD 512 GB NVMe PCIe','Card rời - NVIDIA GeForce GTX 1660Ti, 6 GB','','Windows 10 Home SL','Vỏ nhựa','Dài 364.46 mm - Rộng 254 mm - Dày 30.96 mm - Nặng 2.58 kg',' ','4-cell Li-ion, 68 Wh',2020,'','31990000','/HinhAnh/SP039.jpg');
insert into sanpham values ('','MH021','BXL06','RAM19','CKN23','DM0006','Laptop Dell Gaming G3 15 i7 10750H/16GB/512GB/4GB GTX1650Ti/120Hz/Win10 (P89F002DBL)',5,'đen','Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB) SSD 512 GB NVMe PCIe','Card rời - NVIDIA GeForce GTX 1650Ti 4 GB','','Windows 10 Home SL','Vỏ nhựa','Dài 364.46 mm - Rộng 254 mm - Dày 30.96 mm - Nặng 2.58 kg',' ','3-cell Li-ion, 51 Wh',2020,'','29990000','/HinhAnh/SP040.jpg');
insert into sanpham values ('','MH001','BXL01','RAM01','CKN01','DM0007','Laptop MSI Gaming GF65 Thin 10UE i5 10500H/16GB/512GB/6GB RTX3060 Max-Q/144Hz/Balo/Win10 (286VN)',5,'Đen','512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)','Card rời - NVIDIA GeForce RTX 3060 Max-Q, 6 GB','','Windows 10 Home SL','Vỏ nhựa','Dài 359 mm - Rộng 254 mm - Dày 21.7 mm - Nặng 1.86 kg','','3-cell, 52 Wh',2021,'','18990000','/HinhAnh/SP041.png');
insert into sanpham values ('','MH002','BXL02','RAM02','CKN02','DM0007','Laptop MSI Modern 15 A11MU i5 1155G7/8GB/512GB/Túi/Chuột/Win10 (680VN)',5,'Xám','Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home SL','Vỏ kim loại','Dài 356.8 mm - Rộng 233.75 mm - Dày 16.9 mm - Nặng 1.6 kg','','4-cell, 99.9 Wh',2021,'','79990000','/HinhAnh/SP042.png');
insert into sanpham values ('','MH003','BXL03','RAM03','CKN03','DM0007','Laptop MSI Gaming GE66 Raider 11UH i7 11800H/32GB/2TB SSD/16GB RTX3080/240Hz/Balo/Chuột/Win10 (259VN)',4,'Xám','2 TB SSD NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)','Card rời - NVIDIA GeForce RTX 3080, 16 GB','','Windows 10 Home SL','Vỏ kim loại','Dài 358 mm - Rộng 267 mm - Dày 23.4 mm - Nặng 2.38 Kg','','4-cell, 99.9 Wh',2021,'','64990000','/HinhAnh/SP043.png');
insert into sanpham values ('','MH004','BXL03','RAM03','CKN04','DM0007','Laptop MSI Gaming GS66 Stealth 11UG i7 11800H/32GB/2TB SSD/8GB RTX3070 Max-Q/360Hz/Balo/Chuột/Win10 (219VN)',3,'Đen','Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)2 TB SSD NVMe PCIe','Card rời - NVIDIA GeForce RTX 3070 Max-Q, 8 GB','','Windows 10 Home SL','Vỏ kim loại','Dài 358.3 mm - Rộng 248 mm - Dày 19.8 mm - Nặng 2.1 Kg','','4-cell, 99.9 Wh',2021,'','59990000','/HinhAnh/SP044.png');
insert into sanpham values ('','MH004','BXL03','RAM01','CKN05','DM0007','Laptop MSI Gaming GE66 Raider 11UG i7 11800H/16GB/2TB SSD/8GB RTX3070/360Hz/Balo/Chuột/Win10 (258VN) ',3,'Đen','Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)2 TB SSD NVMe PCIe','Card rời - NVIDIA GeForce RTX 3070, 8 GB','','Windows 10 Home SL','Vỏ kim loại','Dài 358 mm - Rộng 267 mm - Dày 23.4 mm - Nặng 2.38 Kg','','4-cell Li-ion, 65 Wh',2021,'','52990000','/HinhAnh/SP045.png');
insert into sanpham values ('','MH005','BXL03','RAM01','CKN06','DM0007','Laptop MSI Gaming GP76 11UG i7 11800H/16GB/1TB SSD/8GB RTX3070/240Hz/Balo/Chuột/Win10 (435VN)',2,'Đen','1 TB SSD M.2 PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng','Card rời - NVIDIA GeForce RTX 3070, 8 GB','','Windows 10 Home SL','Vỏ kim loại','Dài 397 mm - Rộng 284 mm - Dày 25.9 mm - Nặng 2.9 kg','','4-cell, 82Wh',2021,'','46490000','/HinhAnh/SP046.png');
insert into sanpham values ('','MH006','BXL04','RAM04','CKN07','DM0007','Laptop MSI Summit E16 Flip i7 1195G7/16GB/1TB SSD/4GB RTX3050/120Hz/Touch/Pen/Túi/Office365F/Win10 (082VN) ',3,'Đen','1 TB SSD M.2 PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)','Card rời - NVIDIA GeForce RTX3050, 4 GB','','Windows 10 Home SL + Office 365 Family 1 năm','Vỏ kim loại','Dài 358.2 mm - Rộng 258.5 mm - Dày 16.9 mm - Nặng 1.9 kg','','4-cell Li-ion, 70 Wh',2021,'','39990000','/HinhAnh/SP047.png');
insert into sanpham values ('','MH007','BXL05','RAM05','CKN08','DM0007','Laptop MSI Summit E13 Flip i7 1185G7/16GB/1TB SSD/Touch/Túi/Pen/Win10 (211VN)',3,'Đen','SSD 1 TB NVMe PCIe Gen4x4','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home SL','Vỏ kim loại nguyên khối','Dài 300.2 mm - Rộng 222.25 mm - Dày 14.9 mm - Nặng 1.35 kg','','6-cell Li-ion',2020,'','32490000','/HinhAnh/SP048.png');
insert into sanpham values ('','MH008','BXL06','RAM06','CKN09','DM0007','Laptop MSI Gaming Leopard 10SDK GL65 i7 10750H/16GB/512GB/144Hz/6GB GTX1660Ti/Balo/Win10 (242VN)',3,'Đen','SSD 512 GB NVMe PCIeHỗ trợ khe cắm HDD SATA','Card rời - NVIDIA GeForce GTX 1660Ti, 6 GB','','Windows 10 Home SL','Vỏ nhựa','Dài 359 mm - Rộng 254 mm - Dày 21.7 mm - Nặng 2.3 kg','','3-cell Li-ion, 51 Wh',2021,'','31990000','/HinhAnh/SP049.png');
insert into sanpham values ('','MH009','BXL06','RAM01','CKN01','DM0007','Laptop MSI Gaming GF65 10UE i7 10750H/16GB/512GB/6GB RTX3060 Max-Q/Balo/Win10 (228VN) ',3,'Đen','SSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng','Card rời - NVIDIA GeForce RTX 3060 Max-Q, 6 GB','','Windows 10 Home SL','Vỏ nhựa - nắp lưng bằng kim loại','Dài 359 mm - Rộng 254 mm - Dày 21.7 mm - Nặng 1.86 kg','','2-cell Li-ion, 80 Wh',2020,'','54890000','/HinhAnh/SP050.png');
insert into sanpham values ('','MH010','BXL07','RAM07','CKN10','DM0008','Laptop LG Gram 17 2021 i7 1165G7/16GB/1TB SSD/Win10 (17Z90P-G.AH78A5) ',3,'Đen','1 TB SSD M.2 PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home Standard','Hợp kim Nano Carbon - Magie','Dài 380.2 mm - Rộng 260.1 mm - Dày 17.8 mm - Nặng 1.35 kg','','2-cell Li-ion, 80 Wh',2020,'','52890000','/HinhAnh/SP051.png');
insert into sanpham values ('','MH010','BXL07','RAM07','CKN10','DM0008','Laptop LG Gram 17 2021 i7 1165G7/16GB/512GB/Win10 (17Z90P-G.AH76A5) ',3,'Bạc','Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộngSSD 512 GB NVMe PCIe','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home Standard','Hợp kim Nano Carbon - Magie','Dài 380.2 mm - Rộng 260.1 mm - Dày 17.8 mm - Nặng 1.35 kg','','2-cell Li-ion, 80 Wh',2020,'','50890000','/HinhAnh/SP052.png');
insert into sanpham values ('','MH011','BXL07','RAM07','CKN10','DM0008','Laptop LG Gram 16 2021 i7 1165G7/16GB/512GB/Win10 (16Z90P-G.AH75A5)',3,'Đen','Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộngSSD 512 GB NVMe PCIe','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home Standard','Hợp kim Nano Carbon - Magie','Dài 355.9 mm - Rộng 243.4 mm - Dày 16.8 mm - Nặng 1.19 kg','','2-cell Li-ion, 80 Wh',2020,'','48890000','/HinhAnh/SP053.png');
insert into sanpham values ('','MH011','BXL07','RAM07','CKN10','DM0008','Laptop LG Gram 16 2021 i7 1165G7/16GB/256GB/Win10 (16Z90P-G.AH73A5) ',3,'Bạc','Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộngSSD 256 GB NVMe PCIe','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home Standard','Hợp kim Nano Carbon - Magie','Dài 355.9 mm - Rộng 243.4 mm - Dày 16.8 mm - Nặng 1.19 kg','','4-cell Li-ion, 72 Wh',2021,'','47890000','/HinhAnh/SP054.png');
insert into sanpham values ('','MH012','BXL07','RAM07','CKN10','DM0008','Laptop LG Gram 14 2021 i7 1165G7/16GB/512GB/Win 10 (14Z90P-G.AH75A5)',3,'Đen','Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộngSSD 512 GB NVMe PCIe','Card tích hợp - Intel Iris Xe Graphics','','Windows 10 Home Standard','Hợp kim Nano Carbon - Magie','Dài 313.4 mm - Rộng 215.2 mm - Dày 16.8 mm - Nặng 0.999 kg','','4-cell Li-ion, 41 Wh',2021,'','29990000','/HinhAnh/SP055.png');
insert into sanpham values ('','MH001','BXL08','RAM01','CKN11','DM0009','Laptop GIGABYTE Gaming G5 i5 11400H/16GB/512GB/4GB RTX3050Ti/144Hz/Win10 (51S1123SH) ',4,'Đen','Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB), 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)','Card rời - NVIDIA GeForce RTX3050Ti, 4 GB','','Windows 10 Home SL','Vỏ nhựa','Dài 361 mm - Rộng 258 mm - Dày 24.9 mm - Nặng 2.2 kg','','4-cell Li-ion, 41 Wh',2021,'','29990000','/HinhAnh/SP056.png');
insert into sanpham values ('','MH001','BXL09','RAM01','CKN11','DM0009','Laptop GIGABYTE Gaming G5 i5 10500H/16GB/512GB/6GB RTX3060/144Hz/Win10 (5S11130SH)',3,'Đen','Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB), 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)','Card rời - NVIDIA GeForce RTX 3060, 6 GB','','Windows 10 Home SL','Vỏ nhựa','Dài 361 mm - Rộng 258 mm - Dày 24.9 mm - Nặng 2.2 kg','','4-cell Li-ion, 41 Wh',2021,'','26990000','/HinhAnh/SP057.png');
insert into sanpham values ('','MH001','BXL08','RAM01','CKN11','DM0009','Laptop Gigabyte G5 i5 11400H/16GB/512GB/4GB RTX3050/144Hz/Win10 (51S1121SH)',3,'Đen','512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB), Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)','Card rời - NVIDIA GeForce RTX3050, 4 GB','','Windows 10 Home SL','Vỏ nhựa','Dài 361 mm - Rộng 258 mm - Dày 24.9 mm - Nặng 2.2 kg','','4-cell Li-ion, 41 Wh',2021,'','26990000','/HinhAnh/SP058.png');


