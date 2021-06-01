/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2021/6/1 9:12:33                             */
/*==============================================================*/


drop table if exists Address;

drop table if exists Customer;

drop table if exists bookstore;

drop table if exists buybook;

/*==============================================================*/
/* Table: Address                                               */
/*==============================================================*/
create table Address
(
   CustomerID           varchar(10),
   AddressType          char(2),
   Address1             varchar(50),
   Address2             varchar(50),
   City                 varchar(20),
   State                varchar(20),
   zipcode              char(6)
);

/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
create table Customer
(
   CustomerID           varchar(10) not null,
   AccountBlance        decimal(5,2),
   FirstName            varchar(10),
   LastName             varchar(20),
   CompanyName          varchar(40),
   primary key (CustomerID)
);

/*==============================================================*/
/* Table: bookstore                                             */
/*==============================================================*/
create table bookstore
(
   bookstoreNo          char(6) not null,
   bookstoreName        varchar(30),
   bookstoreAddress     varchar(60),
   bookstoreCity        varchar(20),
   bookstoreState       varchar(20),
   bookstoreZipcode     char(6),
   primary key (bookstoreNo)
);

/*==============================================================*/
/* Table: buybook                                               */
/*==============================================================*/
create table buybook
(
   CustomerID           varchar(10) not null,
   bookstoreNo          char(6) not null,
   primary key (CustomerID)
);

alter table Address add constraint FK_livein foreign key (CustomerID)
      references Customer (CustomerID) on delete restrict on update restrict;

alter table buybook add constraint FK_buybook foreign key (CustomerID)
      references Customer (CustomerID) on delete restrict on update restrict;

alter table buybook add constraint FK_buybook2 foreign key (bookstoreNo)
      references bookstore (bookstoreNo) on delete restrict on update restrict;

