CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "image_url" varchar, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "caption" varchar, "avatar_file_name" varchar, "avatar_content_type" varchar, "avatar_file_size" integer, "avatar_updated_at" datetime, CONSTRAINT "fk_rails_5b5ddfd518"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
CREATE TABLE sqlite_sequence(name,seq);
CREATE INDEX "index_posts_on_user_id" ON "posts" ("user_id");
CREATE TABLE IF NOT EXISTS "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "avatar_file_name" varchar, "avatar_content_type" varchar, "avatar_file_size" integer, "avatar_updated_at" datetime);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE IF NOT EXISTS "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" varchar, "user_id" integer, "post_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, CONSTRAINT "fk_rails_03de2dc08c"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_2fd19c0db7"
FOREIGN KEY ("post_id")
  REFERENCES "posts" ("id")
);
CREATE INDEX "index_comments_on_user_id" ON "comments" ("user_id");
CREATE INDEX "index_comments_on_post_id" ON "comments" ("post_id");
INSERT INTO "schema_migrations" (version) VALUES
('20180327034651'),
('20180327035005'),
('20180327035838'),
('20180327045235'),
('20180327045246'),
('20180327052113'),
('20180327053449');


