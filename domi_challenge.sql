CREATE TABLE `domi_challenge` (
`user_id` int(255) NOT NULL,
`number` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `domi_challenge`
ADD PRIMARY KEY (`user_id`);