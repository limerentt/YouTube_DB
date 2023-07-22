-- User
INSERT INTO "User" (user_nm, email, password, registration_dt) 
VALUES 
    ('John Doe', 'johndoe@email.com', 'password123', NOW() - INTERVAL '23 days'),
    ('Jane Doe', 'janedoe@email.com', 'password456', NOW() - INTERVAL '75 days'),
    ('Alex Smith', 'alex.smith@email.com', 'password789', NOW() - INTERVAL '120 days'),
    ('Linda Brown', 'linda.brown@email.com', 'pass123', NOW() - INTERVAL '45 days'),
    ('Mark Johnson', 'mark.johnson@email.com', 'pass456', NOW() - INTERVAL '200 days'),
    ('Sarah Williams', 'sarah.williams@email.com', 'pass789', NOW() - INTERVAL '80 days'),
    ('James Jones', 'james.jones@email.com', 'pass1234', NOW() - INTERVAL '320 days'),
    ('Patricia White', 'patricia.white@email.com', 'pass5678', NOW() - INTERVAL '150 days'),
    ('Robert Martin', 'robert.martin@email.com', 'pass91011', NOW() - INTERVAL '95 days'),
    ('Laura Taylor', 'laura.taylor@email.com', 'pass121314', NOW() - INTERVAL '260 days'),
    ('Andrew Davis', 'andrew.davis@email.com', 'pass151617', NOW() - INTERVAL '30 days'),
    ('Susan Miller', 'susan.miller@email.com', 'pass181920', NOW() - INTERVAL '180 days'),
    ('Michael Wilson', 'michael.wilson@email.com', 'pass212223', NOW() - INTERVAL '210 days'),
    ('Emily Moore', 'emily.moore@email.com', 'pass242526', NOW() - INTERVAL '37 days'),
    ('William Thompson', 'william.thompson@email.com', 'pass272829', NOW() - INTERVAL '300 days');


-- Channel
INSERT INTO "Channel" (user_id, channel_nm, channel_desc, creation_dt, subscribers_count) 
VALUES 
    (1, 'Craft Mastery', 'Learn the art of crafting with John Doe', NOW() - INTERVAL '22 days', 100),
    (1, 'Outdoor Adventures', 'Exploring the wilderness with John Doe', NOW() - INTERVAL '18 days', 200),
    
    (2, 'Baking 101', 'Delicious baking recipes with Jane Doe', NOW() - INTERVAL '70 days', 300),
    
    (3, 'Fitness Journey', 'Join Alex Smith on his fitness journey', NOW() - INTERVAL '115 days', 500),
    (3, 'Healthy Eating', 'Cooking healthy meals with Alex Smith', NOW() - INTERVAL '110 days', 700),
    (3, 'Mindfulness and Meditation', 'Relax and unwind with mindfulness techniques from Alex Smith', NOW() - INTERVAL '105 days', 800),
    
    (4, 'Gardening Tips', 'Cultivate your green thumb with Linda Brown', NOW() - INTERVAL '40 days', 900),
    (4, 'Sustainable Living', 'Tips and tricks for a sustainable lifestyle with Linda Brown', NOW() - INTERVAL '35 days', 1000),
    
    (5, 'Tech Reviews', 'Latest tech reviews from Mark Johnson', NOW() - INTERVAL '195 days', 1100),
    
    (6, 'Fashion Trends', 'Stay trendy with fashion updates from Sarah Williams', NOW() - INTERVAL '75 days', 1200),
    (6, 'DIY Home Decor', 'Decorate your home with DIY projects by Sarah Williams', NOW() - INTERVAL '70 days', 1300),
    
    (7, 'Film Critiques', 'Deep dive into film analysis with James Jones', NOW() - INTERVAL '315 days', 1400),
    
    (8, 'Travel Vlogs', 'Travel around the world with Patricia White', NOW() - INTERVAL '145 days', 1500),
    (8, 'Book Club', 'Discuss and review books with Patricia White', NOW() - INTERVAL '140 days', 1600),
    
    (9, 'Coding Tutorials', 'Learn to code with Robert Martin', NOW() - INTERVAL '90 days', 1700),
    
    (10, 'Art Lessons', 'Express your creativity with art lessons from Laura Taylor', NOW() - INTERVAL '255 days', 1800),
    (10, 'Craft Corner', 'Easy crafting projects with Laura Taylor', NOW() - INTERVAL '250 days', 1900),
    
    (11, 'Photography Tips', 'Capture the perfect shot with Andrew Davis', NOW() - INTERVAL '25 days', 2000),
    
    (12, 'Gourmet Cooking', 'Master the kitchen with Susan Miller', NOW() - INTERVAL '175 days', 2100),
    (12, 'Nutrition Advice', 'Eat healthy with advice from Susan Miller', NOW() - INTERVAL '170 days', 2200),
    
    (13, 'Music Lessons', 'Learn to play instruments with Michael Wilson', NOW() - INTERVAL '205 days', 2300),
    
    (14, 'Space Exploration', 'Explore the universe with Emily Moore', NOW() - INTERVAL '27 days', 2500),
    
    (15, 'Financial Advice', 'Get financial tips and advice from William Thompson', NOW() - INTERVAL '295 days', 2600),
    (15, 'Investment Strategies', 'Learn about investment strategies with William Thompson', NOW() - INTERVAL '290 days', 2700),
    (15, 'Real Estate Tips', 'Understand the real estate market with William Thompson', NOW() - INTERVAL '285 days', 2800);


-- Video
INSERT INTO "Video" (channel_id, title, channel_desc, upload_dt, duration, category_nm)
VALUES 
    (1, 'Beginners Guide to Crafting', 'An introductory guide to crafting', NOW() - INTERVAL '20 days', '00:10:00', 'Crafting'),
    (1, 'Crafting with Paper', 'Fun paper crafting projects', NOW() - INTERVAL '18 days', '00:12:00', 'Crafting'),
    
    (2, 'Camping Essentials', 'What to pack for your next camping trip', NOW() - INTERVAL '16 days', '00:15:00', 'Travel'),
    
    (3, 'Bread Baking Basics', 'Learn the basics of bread baking', NOW() - INTERVAL '65 days', '00:20:00', 'Cooking'),
    (3, 'Perfect Pie Crust', 'How to make the perfect pie crust', NOW() - INTERVAL '60 days', '00:18:00', 'Cooking'),
    
    (4, 'Starting Your Fitness Journey', 'How to get started with your fitness journey', NOW() - INTERVAL '100 days', '00:22:00', 'Fitness'),
    (4, '10 Minute Workout', 'A quick 10 minute workout', NOW() - INTERVAL '95 days', '00:10:00', 'Fitness'),
    (4, 'Healthy Meal Prep', 'How to meal prep for the week', NOW() - INTERVAL '90 days', '00:25:00', 'Fitness'),
    
    (5, 'Gardening for Beginners', 'An introduction to gardening', NOW() - INTERVAL '33 days', '00:14:00', 'Gardening'),
    
    (6, 'Latest Tech Unboxing', 'Unboxing the latest tech gadget', NOW() - INTERVAL '180 days', '00:16:00', 'Technology'),
    (6, 'Tech Gadget Review', 'Reviewing a popular tech gadget', NOW() - INTERVAL '170 days', '00:20:00', 'Technology'),
    
    (7, 'Spring Fashion Trends', 'The latest fashion trends for spring', NOW() - INTERVAL '68 days', '00:13:00', 'Fashion'),
    
    (8, 'Film Analysis: Movie Title', 'A deep analysis of a popular film', NOW() - INTERVAL '300 days', '00:30:00', 'Film'),
    (8, 'Top 10 Films of the Year', 'Discussing the top 10 films of the year', NOW() - INTERVAL '295 days', '00:25:00', 'Film'),
    
    (9, 'Traveling to Country', 'Sharing my travel experiences in a specific country', NOW() - INTERVAL '135 days', '00:18:00', 'Travel'),
    (9, 'Top 5 Travel Destinations', 'My top 5 travel destinations', NOW() - INTERVAL '130 days', '00:15:00', 'Travel');


-- Comment
INSERT INTO "Comment" (video_id, user_id, parent_comment_id, content, upload_dt)
VALUES 
    (1, 2, NULL, 'Great video, very helpful!', NOW() - INTERVAL '19 days'),
    (1, 3, NULL, 'Really enjoyed this, thanks for sharing!', NOW() - INTERVAL '18 days'),
    (1, 4, 1, 'I agree, this was really well explained.', NOW() - INTERVAL '18 days'),
    (1, 5, NULL, 'Looking forward to the next video!', NOW() - INTERVAL '17 days'),
    
    (2, 6, NULL, 'Amazing content as always!', NOW() - INTERVAL '15 days'),
    (2, 7, NULL, 'I learned so much from this video!', NOW() - INTERVAL '14 days'),
    (2, 8, NULL, 'Keep up the good work!', NOW() - INTERVAL '13 days'),
    (2, 9, NULL, 'Cannot wait to try this!', NOW() - INTERVAL '12 days'),
    
    (3, 10, NULL, 'I love your videos!', NOW() - INTERVAL '60 days'),
    (3, 11, NULL, 'This was so informative, thank you!', NOW() - INTERVAL '59 days'),
    (3, 12, NULL, 'Always looking forward to your uploads.', NOW() - INTERVAL '58 days'),
    
    (4, 13, NULL, 'This was very motivating!', NOW() - INTERVAL '90 days'),
    (4, 14, NULL, 'Really enjoyed this workout.', NOW() - INTERVAL '85 days'),
    
    (5, 15, NULL, 'I learned a lot from this video.', NOW() - INTERVAL '30 days'),
    (5, 1, NULL, 'Thanks for the tips!', NOW() - INTERVAL '28 days'),
	 (6, 2, NULL, 'Super informative, thanks!', NOW() - INTERVAL '120 days'),
    (6, 3, NULL, 'Fantastic video!', NOW() - INTERVAL '118 days'),
    (6, 4, NULL, 'This video helped me a lot!', NOW() - INTERVAL '116 days'),
    
    (7, 5, NULL, 'Awesome video!', NOW() - INTERVAL '65 days'),
    (7, 6, NULL, 'This was very insightful.', NOW() - INTERVAL '62 days'),
    (7, 7, 5, 'I agree, this was a great watch!', NOW() - INTERVAL '60 days'),
    
    (8, 8, NULL, 'I love your analysis!', NOW() - INTERVAL '280 days'),
    (8, 9, NULL, 'Very well explained.', NOW() - INTERVAL '275 days'),
    (8, 10, 8, 'Yes, this was a great breakdown.', NOW() - INTERVAL '270 days'),
    
    (9, 11, NULL, 'Cannot wait for the next video!', NOW() - INTERVAL '120 days'),
    (9, 12, NULL, 'Great job on this one!', NOW() - INTERVAL '115 days'),
    
    (10, 13, NULL, 'Keep up the good work!', NOW() - INTERVAL '110 days'),
    (10, 14, NULL, 'I love your content!', NOW() - INTERVAL '105 days'),
    (10, 15, NULL, 'This was very helpful!', NOW() - INTERVAL '100 days'),
    (10, 1, 13, 'Agreed, this was a great video!', NOW() - INTERVAL '98 days');
	

-- Playlist
INSERT INTO "Playlist" (user_id, title, creation_dt)
VALUES 
    (1, 'Crafting Tutorials', NOW() - INTERVAL '15 days'),
    (1, 'Outdoor Adventures', NOW() - INTERVAL '10 days'),
    
    (2, 'Baking Basics', NOW() - INTERVAL '50 days'),
    (2, 'Fitness Journey', NOW() - INTERVAL '45 days'),
    (2, 'Gardening Tips', NOW() - INTERVAL '40 days'),
    
    (3, 'Tech Reviews', NOW() - INTERVAL '150 days'),
    (3, 'Fashion Trends', NOW() - INTERVAL '140 days'),
    
    (4, 'Film Analysis', NOW() - INTERVAL '250 days'),
    (4, 'Travel Diaries', NOW() - INTERVAL '240 days'),
    (4, 'Crafting Tutorials', NOW() - INTERVAL '230 days'),
    
    (5, 'Outdoor Adventures', NOW() - INTERVAL '30 days'),
    
    (6, 'Baking Basics', NOW() - INTERVAL '110 days'),
    (6, 'Fitness Journey', NOW() - INTERVAL '100 days'),
    
    (7, 'Gardening Tips', NOW() - INTERVAL '70 days'),
    (7, 'Tech Reviews', NOW() - INTERVAL '60 days');


-- Playlist_Video
INSERT INTO "Playlist_Video" (playlist_id, video_id)
VALUES 
    (1, 1),
    (1, 2),
    
    (2, 2),
    
    (3, 3),
    (3, 4),
    
    (4, 4),
    (4, 5),
    (4, 6),
    
    (5, 5),
    
    (6, 6),
    (6, 7),
    
    (7, 7),
    
    (8, 8),
    (8, 9),
    
    (9, 9),
    (9, 10),
    
    (10, 10),
    (10, 1),
    
    (11, 1),
    (11, 2),
    
    (12, 3),
    (12, 4),
    
    (13, 5),
    (13, 6),
    
    (14, 6),
    (14, 7),
    
    (15, 7),
    (15, 8);


-- Subscription
INSERT INTO "Subscription" (user_id, channel_id)
VALUES 
    (1, 3),
    (1, 4),
    (1, 5),
    
    (2, 1),
    (2, 2),
    (2, 5),
    
    (3, 2),
    (3, 3),
    (3, 5),
    
    (4, 1),
    (4, 2),
    (4, 3),
    
    (5, 1),
    (5, 3),
    (5, 4),
    
    (6, 2),
    (6, 3),
    (6, 4),
    
    (7, 1),
    (7, 2),
    (7, 4),
    
    (8, 3),
    (8, 4),
    (8, 5),
    
    (9, 1),
    (9, 2),
    (9, 3),
    
    (10, 1),
    (10, 2),
    (10, 5),
    
    (11, 1),
    (11, 3),
    (11, 4),
    
    (12, 2),
    (12, 3),
    (12, 5),
    
    (13, 1),
    (13, 4),
    (13, 5),
    
    (14, 2),
    (14, 3),
    (14, 4),
    
    (15, 1),
    (15, 2),
    (15, 5);


-- Video_Reaction
INSERT INTO "Video_Reaction" (user_id, video_id, like_flg)
VALUES 
    (1, 1, TRUE),
    (1, 2, TRUE),
    (1, 3, FALSE),
    
    (2, 4, TRUE),
    (2, 5, FALSE),
    (2, 6, TRUE),
    
    (3, 7, TRUE),
    (3, 8, TRUE),
    (3, 9, FALSE),
    
    (4, 10, TRUE),
    (4, 1, TRUE),
    (4, 2, FALSE),
    
    (5, 3, TRUE),
    (5, 4, FALSE),
    (5, 5, TRUE),
    
    (6, 6, TRUE),
    (6, 7, TRUE),
    (6, 8, FALSE),
    
    (7, 9, TRUE),
    (7, 10, TRUE),
    (7, 1, FALSE),
    
    (8, 2, TRUE),
    (8, 3, FALSE),
    (8, 4, TRUE),
    
    (9, 5, TRUE),
    (9, 6, TRUE),
    (9, 7, FALSE),
    
    (10, 8, TRUE),
    (10, 9, TRUE),
    (10, 10, FALSE),
    
    (11, 1, TRUE),
    (11, 2, FALSE),
    (11, 3, TRUE),
    
    (12, 4, TRUE),
    (12, 5, TRUE),
    (12, 6, FALSE),
    
    (13, 7, TRUE),
    (13, 8, TRUE),
    (13, 9, FALSE),
    
    (14, 10, TRUE),
    (14, 1, TRUE),
    (14, 2, FALSE),
    
    (15, 3, TRUE),
    (15, 4, FALSE),
    (15, 5, TRUE);


-- Ads_Partnership
INSERT INTO "Ads_Partnership" (user_id, channel_id, start_dt, end_dt)
VALUES 
    (1, 1, NOW() - INTERVAL '20 days', NOW() - INTERVAL '10 days'),
    (2, 2, NOW() - INTERVAL '40 days', NOW() - INTERVAL '30 days'),
    (3, 3, NOW() - INTERVAL '60 days', NOW() - INTERVAL '50 days'),
    
    (4, 4, NOW() - INTERVAL '80 days', NOW() - INTERVAL '70 days'),
    (5, 5, NOW() - INTERVAL '100 days', NOW() - INTERVAL '90 days'),
    (6, 6, NOW() - INTERVAL '120 days', NOW() - INTERVAL '110 days'),
    
    (7, 7, NOW() - INTERVAL '140 days', NOW() - INTERVAL '130 days'),
    (8, 8, NOW() - INTERVAL '160 days', NOW() - INTERVAL '150 days'),
    (9, 9, NOW() - INTERVAL '180 days', NOW() - INTERVAL '170 days'),
    
    (10, 10, NOW() - INTERVAL '200 days', NOW() - INTERVAL '190 days'),
    (11, 11, NOW() - INTERVAL '220 days', NOW() - INTERVAL '210 days'),
    (12, 12, NOW() - INTERVAL '240 days', NOW() - INTERVAL '230 days'),
    
    (13, 13, NOW() - INTERVAL '260 days', NOW() - INTERVAL '250 days'),
    (14, 14, NOW() - INTERVAL '280 days', NOW() - INTERVAL '270 days'),
    (15, 15, NOW() - INTERVAL '300 days', NOW() - INTERVAL '290 days');
