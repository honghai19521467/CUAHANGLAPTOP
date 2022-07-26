/*create database LapTop;
use laptop;*/
------------- Table ---------------

use LapTop;

/*==============================================================*/
/* Table: TAIKHOAN                 		                        */
/*==============================================================*/
create table TAIKHOAN
(
   TENDANGNHAP          varchar(20) not null,
   MATKHAU              varchar(20),
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
   TENSP                varchar(100),
   SOLUONG              int,
   MAUSAC               varchar(20),
   OCUNG                varchar(200),
   CARDMANHINH          varchar(100),
   DACBIET              varchar(100),
   HDH                  varchar(100),
   THIETKE              varchar(50),
   KHICHTHUOC_TRONGLUONG varchar(100),
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
   BUSRAM               varchar(20),
   HOTROTOIDA           varchar(10),
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

INSERT INTO TAIKHOAN
VALUES
  ("Colby",6000),
  ("Octavia",5548),
  ("Allistair",7899),
  ("Rafael",8491),
  ("Cecilia",9981),
  ("Quinn",6781),
  ("Ivana",8985),
  ("Timothy",9990),
  ("Fallon",7910),
  ("Cora",5010);
INSERT INTO TAIKHOAN
VALUES
  ("Daryl",7978),
  ("Bianca",3010),
  ("Quentin",1606),
  ("Cyrus",7032),
  ("Castor",8016),
  ("Eliana",1617),
  ("Aurora",7762),
  ("Evangeline",2316),
  ("Malik",2035),
  ("Blake",2426);
INSERT INTO TAIKHOAN
VALUES
  ("Abdul",8813),
  ("Joy",7125),
  ("Hilda",3226),
  ("Alexa",2941),
  ("Priscilla",9562),
  ("Xandra",2637),
  ("Ronan",8686),
  ("Wesley",2042),
  ("Kathleen",3650),
  ("Brittany",4733);
INSERT INTO TAIKHOAN
VALUES
  ("Murphy",4511),
  ("Rhea",2830),
  ("Brendan",6759),
  ("Jack",5851),
  ("Yoko",8315),
  ("Winifred",4986),
  ("Candice",6682),
  ("Marvin",8240),
  ("Dexter",8675),
  ("Angelica",2792);
INSERT INTO TAIKHOAN
VALUES
  ("Vernon",7937),
  ("Maya",5139),
  ("Timon",8182),
  ("Kennan",5215),
  ("Jade",1999),
  ("Uriah",8954),
  ("Hadley",9714),
  ("Baxter",4673),
  ("Rahim",7399),
  ("Sade",9023);
INSERT INTO TAIKHOAN
VALUES
  ("Mallory",8265),
  ("Mannix",5906),
  ("Serena",5269),
  ("Aimee",1439),
  ("Carolyn",6765),
  ("Cooper",8571),
  ("Petra",4904),
  ("Judith",6169),
  ("Driscoll",6687),
  ("Shelly",3380),
  ("Elijah",1548),
  ("Merritt",7034),
  ("Drew",7636),
  ("Macon",7497);

INSERT INTO TAIKHOAN
VALUES
  ("Victor",8857),
  ("Gay",5785),
  ("Illana",6594),
  ("Avram",9782),
  ("Basil",1524),
  ("Uriak",2073),
  ("Noelle",4806),
  ("Deacon",3146),
  ("Conan",2562),
  ("Lilah",8847);
INSERT INTO TAIKHOAN
VALUES
  ("Gavin",7779),
  ("Felix",4789),
  ("Sydnee",9427),
  ("Shana",7435),
  ("Callie",3525),
  ("Deanna",2919),
  ("Rebekah",8938),
  ("Cara",5804),
  ("Ali",6494),
  ("William",1175);

INSERT INTO KHACHHANG
VALUES
  ("KH1","Colby","Colby Richmond","0766224933","dolor@odioaliquam.co.uk","NỮ"),
  ("KH2","Octavia","Octavia Todd","0059201876","vehicula@metusfacilisislorem.com","NAM"),
  ("KH3","Allistair","Allistair Harmon","0011551845","lacus.quisque@tristiquepellentesquetellus.co.uk","NAM"),
  ("KH4","Rafael","Rafael Sparks","0263354718","phasellus@purus.edu","NAM"),
  ("KH5","Cecilia","Cecilia Gilmore","0963623121","eu@eulacus.com","NỮ"),
  ("KH6","Quinn","Quinn Bass","0740151289","risus.duis.a@dictumsapien.co.uk","NỮ"),
  ("KH7","Ivana","Ivana Solomon","0277977066","curabitur.egestas@magnaet.edu","NAM"),
  ("KH8","Timothy","Timothy Hensley","0684630282","odio@urnajustofaucibus.ca","NỮ"),
  ("KH9","Fallon","Fallon Reid","0312580875","metus.sit.amet@vitaealiquet.com","NAM"),
  ("KH10","Cora","Cora Rosario","0083293345","elit.sed@vulputatelacuscras.co.uk","NAM");
  
  INSERT INTO KHACHHANG
VALUES
  ("KH11","Daryl","Daryl Hudson","0352615642","lacus@maurisrhoncusid.edu","NỮ"),
  ("KH12","Bianca","Bianca Robinson","0723773634","quisque.tincidunt.pede@conguein.co.uk","NỮ"),
  ("KH13","Quentin","Quentin Conner","0484274854","suspendisse.ac.metus@at.net","NAM"),
  ("KH14","Cyrus","Cyrus Carpenter","0543382327","egestas.aliquam@pellentesqueut.org","NAM"),
  ("KH15","Castor","Castor Nielsen","0616886120","duis.ac@utsagittislobortis.edu","NAM"),
  ("KH16","Eliana","Eliana Wiley","0915493221","nulla.eu.neque@ultriciessem.com","NỮ"),
  ("KH17","Aurora","Aurora Roach","0213391315","erat@cursusvestibulummauris.edu","NAM"),
  ("KH18","Evangeline","Evangeline Rich","0391568616","vestibulum.lorem@ipsumdolor.edu","NỮ"),
  ("KH19","Malik","Malik Espinoza","0718315362","egestas@mauriseuturpis.net","NAM"),
  ("KH20","Blake","Blake Snow","0415397463","faucibus.orci.luctus@cum.org","NAM");
  
  INSERT INTO KHACHHANG
VALUES
  ("KH21","Abdul","Abdul Leon","0432741325","eleifend@justo.co.uk","NỮ"),
  ("KH22","Joy","Joy Harris","0355561112","augue.ac@lobortisclassaptent.com","NAM"),
  ("KH23","Hilda","Hilda Cannon","0363130852","nulla@loremdonec.co.uk","NAM"),
  ("KH24","Alexa","Alexa Oneal","0427102366","in.faucibus@orci.ca","NỮ"),
  ("KH25","Priscilla","Priscilla Serrano","0326257961","nec.ligula.consectetuer@consequatlectussit.ca","NỮ"),
  ("KH26","Xandra","Xandra Case","0636670280","ut.pharetra@cursuspurusnullam.ca","NỮ"),
  ("KH27","Ronan","Ronan Davis","0143811292","sed.consequat@ut.ca","NAM"),
  ("KH28","Wesley","Wesley Donaldson","0925717252","libero.at.auctor@senectus.ca","NAM"),
  ("KH29","Kathleen","Kathleen Langley","0744381583","torquent@commodohendreritdonec.co.uk","NỮ"),
  ("KH30","Brittany","Brittany Blake","0077473938","et.rutrum.non@gravidanunc.org","NAM");

INSERT INTO KHACHHANG
VALUES
  ("KH31","Murphy","Murphy Mooney","0208622504","curae.phasellus@antebibendum.net","NỮ"),
  ("KH32","Rhea","Rhea Hanson","0418318753","suspendisse.non.leo@faucibusleo.com","NAM"),
  ("KH33","Brendan","Brendan Allison","0172110667","cras.eu@portaelit.com","NỮ"),
  ("KH34","Jack","Jack Kaufman","0226694447","orci@curae.edu","NỮ"),
  ("KH35","Yoko","Yoko Bradley","0412162635","semper@cursus.ca","NỮ"),
  ("KH36","Winifred","Winifred Wong","0676184391","laoreet.posuere@quamcurabiturvel.com","NỮ"),
  ("KH37","Candice","Candice Hyde","0951769321","et.ultrices.posuere@eteros.co.uk","NAM"),
  ("KH38","Marvin","Marvin Guerrero","0110235134","orci.lobortis@pharetra.com","NỮ"),
  ("KH39","Dexter","Dexter Franks","0332668966","ipsum.non@neque.net","NỮ"),
  ("KH40","Angelica","Angelica Guy","0432296247","non.lobortis@metus.ca","NAM");

INSERT INTO KHACHHANG
VALUES
  ("KH41","Vernon","Vernon Durham","0437111677","sed.auctor@erat.org","NỮ"),
  ("KH42","Maya","Maya Preston","0828464256","libero.integer.in@aeneanmassa.co.uk","NAM"),
  ("KH43","Timon","Timon Stuart","0188514707","pede@nequenullam.org","NỮ"),
  ("KH44","Kennan","Kennan Andrews","0107138647","quam.dignissim@nuncpulvinar.com","NAM"),
  ("KH45","Jade","Jade Knapp","0581302623","ipsum.sodales@curabiturutodio.com","NAM"),
  ("KH46","Uriah","Uriah Mosley","0231905497","magna.lorem.ipsum@ac.edu","NAM"),
  ("KH47","Hadley","Hadley Miller","0543131474","sed@felisdonec.co.uk","NAM"),
  ("KH48","Baxter","Baxter Gomez","0223859868","donec.est@suspendisse.edu","NỮ"),
  ("KH49","Rahim","Rahim Ramsey","0588568300","aenean.gravida@vel.ca","NỮ"),
  ("KH50","Sade","Sade Beasley","0658985496","amet.luctus.vulputate@proin.co.uk","NỮ");
  
  INSERT INTO KHACHHANG
VALUES
  ("KH51","Mallory","Mallory Case","0954851748","nulla@etrutrumeu.co.uk","NỮ"),
  ("KH52","Mannix","Mannix Hoffman","0933716910","ut.tincidunt@nascetur.org","NỮ"),
  ("KH53","Serena","Serena Howard","0217694121","integer.aliquam.adipiscing@nonleovivamus.edu","NỮ"),
  ("KH54","Aimee","Aimee Lester","0117344275","dapibus.quam@felisullamcorper.net","NỮ"),
  ("KH55","Carolyn","Carolyn Mclean","0225859520","lobortis.quam@quismassamauris.edu","NAM"),
  ("KH56","Cooper","Cooper Delgado","0857161821","adipiscing@ligulaaeneaneuismod.com","NỮ"),
  ("KH57","Petra","Petra Frazier","0618743178","rutrum@cursus.com","NAM"),
  ("KH58","Judith","Judith Jarvis","0688818155","tincidunt.aliquam@arcuvestibulum.com","NAM"),
  ("KH59","Driscoll","Driscoll Hester","0376660348","elit.fermentum.risus@ac.edu","NAM"),
  ("KH60","Shelly","Shelly Cooley","0285788837","ligula.consectetuer@pretiumaliquetmetus.org","NỮ");
  
INSERT INTO NHANVIEN
VALUES
  ("NV1","Victor","Victor Daniel","1981-02-10","NỮ","NV","Ap #960-1280 Molestie Road","2022-02-20","0037241169"),
  ("NV2","Gay","Gay Ramos","1978-06-30","NAM","NV","Ap #978-6680 Ligula. Ave","2021-04-06","0217157522"),
  ("NV3","Illana","Illana Keller","1988-04-09","NAM","NV","P.O. Box 542, 6803 Dui Ave","2020-10-03","0188404987"),
  ("NV4","Avram","Avram Brennan","1996-10-29","NỮ","NV","P.O. Box 848, 3714 Aliquet St.","2020-11-17","0316289453"),
  ("NV5","Basil","Basil Gomez","1998-04-14","NAM","QL","651-4022 Tristique Rd.","2020-09-16","0487099166"),
  ("NV6","Uriak","Uriak Garrison","1990-05-02","NAM","NV","P.O. Box 933, 5192 Amet Ave","2021-09-01","0268959029"),
  ("NV7","Noelle","Noelle Gomez","1992-08-24","NỮ","NV","Ap #205-753 Donec Av.","2021-08-30","0833656957"),
  ("NV8","Deacon","Deacon Emerson","1990-05-13","NỮ","NV","8967 Magna. Av.","2021-03-02","0424127914"),
  ("NV9","Conan","Conan Farley","1973-03-08","NAM","NV","624-1397 Donec Ave","2021-11-23","0712228906"),
  ("NV10","Lilah","Lilah Wheeler","1987-07-26","NỮ","NV","P.O. Box 397, 4875 Nulla Av.","2020-04-01","0852728837");

INSERT INTO NHANVIEN
VALUES
  ("NV11","Gavin","Gavin Wolfe","1983-12-01","NAM","NV","P.O. Box 121, 2976 Nunc St.","2020-06-06","0734158157"),
  ("NV12","Felix","Felix Houston","1987-05-30","NỮ","NV","Ap #914-8010 Lacus, St.","2019-06-30","0683289218"),
  ("NV13","Sydnee","Sydnee Bird","1991-07-15","NỮ","NV","897-5181 Lorem. Street","2020-05-27","0722776540"),
  ("NV14","Shana","Shana Rose","1989-05-13","NỮ","NV","Ap #515-8505 Eu Rd.","2022-05-23","0146881148"),
  ("NV15","Callie","Callie House","1984-06-06","NỮ","NV","Ap #590-7885 Id St.","2020-06-01","0466144184"),
  ("NV16","Deanna","Deanna Black","1975-05-25","NAM","NV","2585 Magna St.","2019-04-05","0993140653"),
  ("NV17","Rebekah","Rebekah Lott","1975-11-01","NỮ","NV","488-5782 Lorem Street","2020-11-29","0114256031"),
  ("NV18","Cara","Cara Short","1979-01-09","NỮ","QL","7009 Sem St.","2020-03-22","0607545085"),
  ("NV19","Ali","Ali Mercer","1990-02-09","NỮ","NV","477-848 Eget St.","2020-06-13","0632388282"),
  ("NV20","William","William Foley","1992-02-06","NỮ","NV","Ap #536-3711 Litora Ave","2020-06-21","0619414581");

INSERT INTO NHANVIEN
VALUES
("NV0","Drew","DEMO","2000-01-01","NAM","QL","DEMO","2022-02-02","0123456789");

INSERT INTO KHACHHANG
VALUES
("KH0","Macon","DEMO","0123456789","DEMO@GMAIL.COM","NAM");



