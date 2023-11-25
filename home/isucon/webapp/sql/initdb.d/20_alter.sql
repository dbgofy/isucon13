-- isudns
use isudns;
ALTER TABLE `records` ADD INDEX `IX_records_domain_id_name_disabled` (`domain_id`, `name`, `disabled`);
ALTER TABLE `records` ADD INDEX `IX_records_name_type_disabled` (`name`, `type`, `disabled`);

-- isupipe
use isupipe;
ALTER TABLE `livestream_tags` ADD INDEX `IX_livestream_tags_livestream_id` (`livestream_id`);
ALTER TABLE `livestreams` ADD INDEX `IX_livestreams_user_id` (`user_id`);
ALTER TABLE `livecomments` ADD INDEX `IX_livecomments_livestream_id` (`livestream_id`);
ALTER TABLE `reactions` ADD INDEX `IX_reactions_livestream_id` (`livestream_id`);
ALTER TABLE `themes` ADD INDEX `IX_themes_user_id` (`user_id`);
ALTER TABLE `reservation_slots` ADD INDEX `IX_reservation_slots_start_at_end_at` (`start_at`, `end_at`);

ALTER TABLE `ng_words` ADD INDEX `IX_ng_words_user_id_livestream_id` (`user_id`, `livestream_id`);

ALTER TABLE `icons` ADD COLUMN `hash` VARCHAR(255) NOT NULL AFTER `id`;
