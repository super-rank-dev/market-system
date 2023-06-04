/*
 Navicat Premium Data Transfer

 Source Server         : New Connection
 Source Server Type    : PostgreSQL
 Source Server Version : 150002 (150002)
 Source Host           : localhost:5432
 Source Catalog        : marketdb
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 150002 (150002)
 File Encoding         : 65001

 Date: 04/06/2023 14:10:13
*/


-- ----------------------------
-- Sequence structure for failed_jobs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "failed_jobs_id_seq";
CREATE SEQUENCE "failed_jobs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "migrations_id_seq";
CREATE SEQUENCE "migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for personal_access_tokens_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "personal_access_tokens_id_seq";
CREATE SEQUENCE "personal_access_tokens_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for product_types_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "product_types_id_seq";
CREATE SEQUENCE "product_types_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for products_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "products_id_seq";
CREATE SEQUENCE "products_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sales_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "sales_id_seq";
CREATE SEQUENCE "sales_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "users_id_seq";
CREATE SEQUENCE "users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS "failed_jobs";
CREATE TABLE "failed_jobs" (
  "id" int8 NOT NULL DEFAULT nextval('failed_jobs_id_seq'::regclass),
  "uuid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "connection" text COLLATE "pg_catalog"."default" NOT NULL,
  "queue" text COLLATE "pg_catalog"."default" NOT NULL,
  "payload" text COLLATE "pg_catalog"."default" NOT NULL,
  "exception" text COLLATE "pg_catalog"."default" NOT NULL,
  "failed_at" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS "migrations";
CREATE TABLE "migrations" (
  "id" int4 NOT NULL DEFAULT nextval('migrations_id_seq'::regclass),
  "migration" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "batch" int4 NOT NULL
)
;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (5, '2023_06_01_222951_create_product_types_table', 1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (6, '2023_06_01_222951_create_products_table', 1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (7, '2023_06_01_222956_create_sales_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS "password_reset_tokens";
CREATE TABLE "password_reset_tokens" (
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0)
)
;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS "personal_access_tokens";
CREATE TABLE "personal_access_tokens" (
  "id" int8 NOT NULL DEFAULT nextval('personal_access_tokens_id_seq'::regclass),
  "tokenable_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tokenable_id" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "abilities" text COLLATE "pg_catalog"."default",
  "last_used_at" timestamp(0),
  "expires_at" timestamp(0),
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_types
-- ----------------------------
DROP TABLE IF EXISTS "product_types";
CREATE TABLE "product_types" (
  "id" int8 NOT NULL DEFAULT nextval('product_types_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tax_percentage" numeric(5,2) NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of product_types
-- ----------------------------
BEGIN;
INSERT INTO "product_types" ("id", "name", "tax_percentage", "created_at", "updated_at") VALUES (2, 'Food', 20.00, '2023-06-04 15:19:19', '2023-06-04 15:19:19');
INSERT INTO "product_types" ("id", "name", "tax_percentage", "created_at", "updated_at") VALUES (1, 'Electronic', 15.00, '2023-06-04 15:19:03', '2023-06-04 17:23:45');
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS "products";
CREATE TABLE "products" (
  "id" int8 NOT NULL DEFAULT nextval('products_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "type_id" int8 NOT NULL,
  "price" numeric(10,2) NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO "products" ("id", "name", "type_id", "price", "created_at", "updated_at") VALUES (1, 'Smartphone', 1, 30.00, '2023-06-04 15:45:14', '2023-06-04 15:45:14');
INSERT INTO "products" ("id", "name", "type_id", "price", "created_at", "updated_at") VALUES (2, 'Laptop', 1, 100.00, '2023-06-04 15:45:28', '2023-06-04 15:45:28');
INSERT INTO "products" ("id", "name", "type_id", "price", "created_at", "updated_at") VALUES (3, 'Apple Pie', 2, 20.00, '2023-06-04 17:29:07', '2023-06-04 17:29:07');
INSERT INTO "products" ("id", "name", "type_id", "price", "created_at", "updated_at") VALUES (4, 'ChessBurger', 2, 300.50, '2023-06-04 17:29:22', '2023-06-04 17:29:22');
INSERT INTO "products" ("id", "name", "type_id", "price", "created_at", "updated_at") VALUES (5, 'Pizza', 2, 20.45, '2023-06-04 17:29:41', '2023-06-04 17:29:41');
COMMIT;

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS "sales";
CREATE TABLE "sales" (
  "id" int8 NOT NULL DEFAULT nextval('sales_id_seq'::regclass),
  "product_id" int8 NOT NULL,
  "sale_price" numeric(10,2) NOT NULL,
  "tax_amount" numeric(5,2) NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of sales
-- ----------------------------
BEGIN;
INSERT INTO "sales" ("id", "product_id", "sale_price", "tax_amount", "created_at", "updated_at") VALUES (1, 1, 30.00, 15.00, '2023-06-04 17:23:52', '2023-06-04 17:23:52');
INSERT INTO "sales" ("id", "product_id", "sale_price", "tax_amount", "created_at", "updated_at") VALUES (2, 2, 100.00, 15.00, '2023-06-04 17:23:54', '2023-06-04 17:23:54');
INSERT INTO "sales" ("id", "product_id", "sale_price", "tax_amount", "created_at", "updated_at") VALUES (3, 3, 20.00, 20.00, '2023-06-04 17:29:46', '2023-06-04 17:29:46');
INSERT INTO "sales" ("id", "product_id", "sale_price", "tax_amount", "created_at", "updated_at") VALUES (4, 4, 300.50, 20.00, '2023-06-04 17:29:48', '2023-06-04 17:29:48');
INSERT INTO "sales" ("id", "product_id", "sale_price", "tax_amount", "created_at", "updated_at") VALUES (5, 5, 20.45, 20.00, '2023-06-04 17:29:49', '2023-06-04 17:29:49');
INSERT INTO "sales" ("id", "product_id", "sale_price", "tax_amount", "created_at", "updated_at") VALUES (6, 3, 20.00, 20.00, '2023-06-04 17:29:50', '2023-06-04 17:29:50');
INSERT INTO "sales" ("id", "product_id", "sale_price", "tax_amount", "created_at", "updated_at") VALUES (7, 2, 100.00, 15.00, '2023-06-04 17:29:52', '2023-06-04 17:29:52');
INSERT INTO "sales" ("id", "product_id", "sale_price", "tax_amount", "created_at", "updated_at") VALUES (8, 1, 30.00, 15.00, '2023-06-04 17:29:53', '2023-06-04 17:29:53');
INSERT INTO "sales" ("id", "product_id", "sale_price", "tax_amount", "created_at", "updated_at") VALUES (9, 4, 300.50, 20.00, '2023-06-04 17:29:55', '2023-06-04 17:29:55');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
  "id" int8 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email_verified_at" timestamp(0),
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "remember_token" varchar(100) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "failed_jobs_id_seq"
OWNED BY "failed_jobs"."id";
SELECT setval('"failed_jobs_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "migrations_id_seq"
OWNED BY "migrations"."id";
SELECT setval('"migrations_id_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "personal_access_tokens_id_seq"
OWNED BY "personal_access_tokens"."id";
SELECT setval('"personal_access_tokens_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "product_types_id_seq"
OWNED BY "product_types"."id";
SELECT setval('"product_types_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "products_id_seq"
OWNED BY "products"."id";
SELECT setval('"products_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "sales_id_seq"
OWNED BY "sales"."id";
SELECT setval('"sales_id_seq"', 9, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "users_id_seq"
OWNED BY "users"."id";
SELECT setval('"users_id_seq"', 1, false);

-- ----------------------------
-- Uniques structure for table failed_jobs
-- ----------------------------
ALTER TABLE "failed_jobs" ADD CONSTRAINT "failed_jobs_uuid_unique" UNIQUE ("uuid");

-- ----------------------------
-- Primary Key structure for table failed_jobs
-- ----------------------------
ALTER TABLE "failed_jobs" ADD CONSTRAINT "failed_jobs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table migrations
-- ----------------------------
ALTER TABLE "migrations" ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table password_reset_tokens
-- ----------------------------
ALTER TABLE "password_reset_tokens" ADD CONSTRAINT "password_reset_tokens_pkey" PRIMARY KEY ("email");

-- ----------------------------
-- Indexes structure for table personal_access_tokens
-- ----------------------------
CREATE INDEX "personal_access_tokens_tokenable_type_tokenable_id_index" ON "personal_access_tokens" USING btree (
  "tokenable_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "tokenable_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table personal_access_tokens
-- ----------------------------
ALTER TABLE "personal_access_tokens" ADD CONSTRAINT "personal_access_tokens_token_unique" UNIQUE ("token");

-- ----------------------------
-- Primary Key structure for table personal_access_tokens
-- ----------------------------
ALTER TABLE "personal_access_tokens" ADD CONSTRAINT "personal_access_tokens_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table product_types
-- ----------------------------
ALTER TABLE "product_types" ADD CONSTRAINT "product_types_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table products
-- ----------------------------
ALTER TABLE "products" ADD CONSTRAINT "products_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sales
-- ----------------------------
ALTER TABLE "sales" ADD CONSTRAINT "sales_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table users
-- ----------------------------
ALTER TABLE "users" ADD CONSTRAINT "users_email_unique" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table products
-- ----------------------------
ALTER TABLE "products" ADD CONSTRAINT "products_type_id_foreign" FOREIGN KEY ("type_id") REFERENCES "product_types" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sales
-- ----------------------------
ALTER TABLE "sales" ADD CONSTRAINT "sales_product_id_foreign" FOREIGN KEY ("product_id") REFERENCES "products" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
