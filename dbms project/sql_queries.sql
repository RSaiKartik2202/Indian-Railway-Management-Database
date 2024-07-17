CREATE TABLE Passenger_personal_info(
    mobile INT,
    name VARCHAR(25),
    email VARCHAR(25),
    age INT,
    sex VARCHAR(10),
    PRIMARY KEY (mobile)
);
DESC Passenger_personal_info;
CREATE TABLE Station(
    station_code VARCHAR(6),
    station_name VARCHAR(40),
    state VARCHAR(25),
    city VARCHAR(35),
    no_of_platforms INT,
    PRIMARY KEY (station_code)
);
DESC Station;
CREATE TABLE Train(
    train_no INT,
    train_name VARCHAR(40),
    start_station_code VARCHAR(6),
    last_station_code VARCHAR(6),
    departure_time TIME,
    reaching_time TIME,
    PRIMARY KEY (train_no),
    FOREIGN KEY (start_station_code) references Station(station_code),
    FOREIGN KEY (last_station_code) references Station(station_code)
);
DESC Train;
CREATE TABLE Train_stops_at_stations(
    train_no INT,
    stop_station_code VARCHAR(6),
    distance_travelled INT,
    arrival_time TIME,
    PRIMARY KEY (train_no,stop_station_code),
    FOREIGN KEY (train_no) references Train(train_no),
    FOREIGN KEY (stop_station_code) references Station(station_code)
);
DESC Train_stops_at_stations;
CREATE TABLE Train_working_days(
    train_no INT,
    working_days VARCHAR(10),
    PRIMARY KEY (train_no,working_days),
    FOREIGN KEY (train_no) references Train(train_no)
);
DESC Train_working_days;
CREATE TABLE Coach_class(
    coach_id VARCHAR(5),
    class VARCHAR(25),
    PRIMARY KEY (coach_id)
);
DESC Coach_class;
CREATE TABLE Coach_map(
    train_no INT,
    coach_id VARCHAR(5),
    no_of_seats INT,
    PRIMARY KEY (train_no,coach_id),
    FOREIGN KEY (train_no) references Train(train_no),
    FOREIGN KEY (coach_id) references Coach_class(coach_id)
);
DESC Coach_map;
CREATE TABLE Passenger_journey_details(
    PNR INT,
    mobile INT,
    journey_date DATE,
    ticket_fare FLOAT,
    booked_train_no INT,
    boarding_station_code VARCHAR(6),
    destination_station_code VARCHAR(6),
    allotted_coach_id VARCHAR(5),
    allotted_seat_no INT,
    PRIMARY KEY (PNR),
    FOREIGN KEY (booked_train_no) references Train(train_no),
    FOREIGN KEY (boarding_station_code) references Station(station_code),
    FOREIGN KEY (destination_station_code) references Station(station_code),
    FOREIGN KEY (booked_train_no,allotted_coach_id) references Coach_map(train_no,coach_id),
    FOREIGN KEY (mobile) references Passenger_personal_info(mobile)
);
DESC Passenger_journey_details;
--insertion
INSERT INTO Station VALUES(
    'SC','Secunderabad Junction','Telangana','Secunderabad',10
);
INSERT INTO Station VALUES(
    'KZJ','Kazipet Junction','Telangana','Kazipet',6
);
INSERT INTO Station VALUES(
    'KMT','Khammam Railway Station','Telangana','Khammam',3
);
INSERT INTO Station VALUES(
    'BZA','Vijayawada Junction','Andhra Pradesh','Vijayawada',10
);
INSERT INTO Station VALUES(
    'OGL','Ongole Railway Station','Andhra Pradesh','Ongole',3
);
INSERT INTO Station VALUES(
    'GDR','Gudur Junction','Andhra Pradesh','Gudur',4
);
INSERT INTO Station VALUES(
    'RU','Renigunta Junction','Andhra Pradesh','Renigunta',8
);
INSERT INTO Station VALUES(
    'TPTY','Tirupati Railway Station','Andhra Pradesh','Tirupati',5
);
INSERT INTO Station VALUES(
    'SKZR','Sirpur Kaghaznagar Railway Station','Telangana','Sirpur Kaghaznagar',3
);
INSERT INTO Station VALUES(
    'PDPL','Peddapalli Junction','Telangana','Peddapalli',3
);
INSERT INTO Station VALUES(
    'ALER','Aler Railway Station','Telangana','Aler',2
);
INSERT INTO Station VALUES(
    'VKB','Vikarabad Junction','Telangana','Vikarabad',3
);
INSERT INTO Station VALUES(
    'BIDR','Bidar Railway Station','Karnataka','Bidar',3
);
INSERT INTO Station VALUES(
    'NLR','Nellore Railway Station','Andhra Pradesh','Nellore',4
);
INSERT INTO Station VALUES(
    'GNT','Guntur Junction','Andhra Pradesh','Guntur',9
);
INSERT INTO Station VALUES(
    'MRGA','Miryalaguda Railway Station','Telangana','Miryalaguda',3
);
INSERT INTO Station VALUES(
    'NLDA','Nalgonda Railway Station','Telangana','Nalgonda',3
);
SELECT * FROM Station;
INSERT INTO Train VALUES(
    12764,'Padmavathi SF Express','SC','TPTY','18:40','7:15'
);
INSERT INTO Train VALUES(
    12763,'Padmavathi SF Express','TPTY','SC','16:55','5:55'
);
DELETE FROM Train where train_no=12763;
INSERT INTO Train VALUES(
    12758,'Kaghaznagar SF Express','SKZR','SC','14:50','20:20'
);
INSERT INTO Train VALUES(
    12757,'Kaghaznagar SF Express','SC','SKZR','8:20','13:40'
);
INSERT INTO Train VALUES(
    17012,'Bidar Express','SKZR','BIDR','11:55','22:15'
);
INSERT INTO Train VALUES(
    20702,'Secunderabad Vande Bharat Express','TPTY','SC','15:15','23:30'
);
INSERT INTO Train VALUES(
    20701,'Tirupati Vande Bharat Express','SC','TPTY','6:15','14:34'
);
SELECT * FROM Train;
INSERT INTO Train_stops_at_stations VALUES(
    12764,'SC',0,'18:40'
);
INSERT INTO Train_stops_at_stations VALUES(
    12764,'KZJ',131,'20:28'
);
INSERT INTO Train_stops_at_stations VALUES(
    12764,'KMT',249,'22:19'
);
INSERT INTO Train_stops_at_stations VALUES(
    12764,'BZA',348,'00:15'
);
INSERT INTO Train_stops_at_stations VALUES(
    12764,'OGL',486,'2:38'
);
INSERT INTO Train_stops_at_stations VALUES(
    12764,'GDR',642,'4:45'
);
INSERT INTO Train_stops_at_stations VALUES(
    12764,'RU',725,'6:23'
);
INSERT INTO Train_stops_at_stations VALUES(
    12764,'TPTY',735,'7:15'
);
INSERT INTO Train_stops_at_stations VALUES(
    12763,'TPTY',0,'16:55'
);
INSERT INTO Train_stops_at_stations VALUES(
    12763,'GDR',93,'18:43'
);
INSERT INTO Train_stops_at_stations VALUES(
    12763,'OGL',248,'20:58'
);
INSERT INTO Train_stops_at_stations VALUES(
    12763,'BZA',386,'23:15'
);
INSERT INTO Train_stops_at_stations VALUES(
    12763,'KMT',485,'00:44'
);
INSERT INTO Train_stops_at_stations VALUES(
    12763,'KZJ',603,'2:43'
);
INSERT INTO Train_stops_at_stations VALUES(
    12763,'SC',735,'5:55'
);
INSERT INTO Train_stops_at_stations VALUES(
    12758,'SKZR',0,'14:50'
);
INSERT INTO Train_stops_at_stations VALUES(
    12758,'PDPL',89,'15:58'
);
INSERT INTO Train_stops_at_stations VALUES(
    12758,'KZJ',165,'17:04'
);
INSERT INTO Train_stops_at_stations VALUES(
    12758,'ALER',227,'18:03'
);
INSERT INTO Train_stops_at_stations VALUES(
    12758,'SC',296,'20:20'
);
INSERT INTO Train_stops_at_stations VALUES(
    12757,'SC',0,'8:20'
);
INSERT INTO Train_stops_at_stations VALUES(
    12757,'ALER',69,'9:04'
);
INSERT INTO Train_stops_at_stations VALUES(
    12757,'KZJ',131,'10:08'
);
INSERT INTO Train_stops_at_stations VALUES(
    12757,'PDPL',207,'11:29'
);
INSERT INTO Train_stops_at_stations VALUES(
    12757,'SKZR',296,'13:40'
);
INSERT INTO Train_stops_at_stations VALUES(
    17012,'SKZR',0,'11:55'
);
INSERT INTO Train_stops_at_stations VALUES(
    17012,'PDPL',89,'13:11'
);
INSERT INTO Train_stops_at_stations VALUES(
    17012,'KZJ',165,'14:58'
);
INSERT INTO Train_stops_at_stations VALUES(
    17012,'SC',296,'18:05'
);
INSERT INTO Train_stops_at_stations VALUES(
    17012,'VKB',368,'19:44'
);
INSERT INTO Train_stops_at_stations VALUES(
    17012,'BIDR',460,'22:15'
);
INSERT INTO Train_stops_at_stations VALUES(
    20701,'SC',0,'6:15'
);
INSERT INTO Train_stops_at_stations VALUES(
    20701,'NLDA',109,'7:29'
);
INSERT INTO Train_stops_at_stations VALUES(
    20701,'MRGA',147,'7:49'
);
INSERT INTO Train_stops_at_stations VALUES(
    20701,'GNT',281,'9:35'
);
INSERT INTO Train_stops_at_stations VALUES(
    20701,'OGL',413,'11:13'
);
INSERT INTO Train_stops_at_stations VALUES(
    20701,'NLR',530,'12:34'
);
INSERT INTO Train_stops_at_stations VALUES(
    20701,'TPTY',662,'14:34'
);
INSERT INTO Train_stops_at_stations VALUES(
    20702,'TPTY',0,'15:15'
);
INSERT INTO Train_stops_at_stations VALUES(
    20702,'NLR',131,'16:44'
);
INSERT INTO Train_stops_at_stations VALUES(
    20702,'OGL',248,'17:58'
);
INSERT INTO Train_stops_at_stations VALUES(
    20702,'GNT',380,'19:45'
);
INSERT INTO Train_stops_at_stations VALUES(
    20702,'MRGA',514,'21:17'
);
INSERT INTO Train_stops_at_stations VALUES(
    20702,'NLDA',552,'21:49'
);
INSERT INTO Train_stops_at_stations VALUES(
    20702,'SC',662,'23:30'
);
SELECT * FROM Train_stops_at_stations;

INSERT INTO Train_working_days VALUES(
   12764,'MON'
);
INSERT INTO Train_working_days VALUES(
   12764,'TUE'
);
INSERT INTO Train_working_days VALUES(
   12764,'THU'
);
INSERT INTO Train_working_days VALUES(
   12764,'FRI'
);
INSERT INTO Train_working_days VALUES(
   12764,'SUN'
);
INSERT INTO Train_working_days VALUES(
   12763,'MON'
);
INSERT INTO Train_working_days VALUES(
   12763,'TUE'
);
INSERT INTO Train_working_days VALUES(
   12763,'WED'
);
INSERT INTO Train_working_days VALUES(
   12763,'FRI'
);
INSERT INTO Train_working_days VALUES(
   12763,'SAT'
);
INSERT INTO Train_working_days VALUES(
   12758,'MON'
);
INSERT INTO Train_working_days VALUES(
   12758,'TUE'
);
INSERT INTO Train_working_days VALUES(
   12758,'WED'
);
INSERT INTO Train_working_days VALUES(
   12758,'THU'
);
INSERT INTO Train_working_days VALUES(
   12758,'FRI'
);
INSERT INTO Train_working_days VALUES(
   12758,'SAT'
);
INSERT INTO Train_working_days VALUES(
   12758,'SUN'
);
INSERT INTO Train_working_days VALUES(
   12757,'MON'
);
INSERT INTO Train_working_days VALUES(
   12757,'TUE'
);
INSERT INTO Train_working_days VALUES(
   12757,'WED'
);
INSERT INTO Train_working_days VALUES(
   12757,'THU'
);
INSERT INTO Train_working_days VALUES(
   12757,'FRI'
);
INSERT INTO Train_working_days VALUES(
   12757,'SAT'
);
INSERT INTO Train_working_days VALUES(
   12757,'SUN'
);
INSERT INTO Train_working_days VALUES(
   17012,'MON'
);
INSERT INTO Train_working_days VALUES(
   17012,'TUE'
);
INSERT INTO Train_working_days VALUES(
   17012,'WED'
);
INSERT INTO Train_working_days VALUES(
   17012,'THU'
);
INSERT INTO Train_working_days VALUES(
   17012,'FRI'
);
INSERT INTO Train_working_days VALUES(
   17012,'SAT'
);
INSERT INTO Train_working_days VALUES(
   17012,'SUN'
);
INSERT INTO Train_working_days VALUES(
   20701,'MON'
);
INSERT INTO Train_working_days VALUES(
   20701,'WED'
);
INSERT INTO Train_working_days VALUES(
   20701,'THU'
);
INSERT INTO Train_working_days VALUES(
   20701,'FRI'
);
INSERT INTO Train_working_days VALUES(
   20701,'SAT'
);
INSERT INTO Train_working_days VALUES(
   20701,'SUN'
);
INSERT INTO Train_working_days VALUES(
   20702,'MON'
);
INSERT INTO Train_working_days VALUES(
   20702,'WED'
);
INSERT INTO Train_working_days VALUES(
   20702,'THU'
);
INSERT INTO Train_working_days VALUES(
   20702,'FRI'
);
INSERT INTO Train_working_days VALUES(
   20702,'SAT'
);
INSERT INTO Train_working_days VALUES(
   20702,'SUN'
);
SELECT * FROM Train_working_days;
INSERT INTO Coach_class VALUES(
   'H1','First Class AC'
);
INSERT INTO Coach_class VALUES(
   'A1','AC 2-Tier'
);
INSERT INTO Coach_class VALUES(
   'B1','AC 3-Tier'
);
INSERT INTO Coach_class VALUES(
   'B2','AC 3-Tier'
);
INSERT INTO Coach_class VALUES(
   'B3','AC 3-Tier'
);
INSERT INTO Coach_class VALUES(
   'B4','AC 3-Tier'
);
INSERT INTO Coach_class VALUES(
   'S1','Sleeper'
);
INSERT INTO Coach_class VALUES(
   'S2','Sleeper'
);
INSERT INTO Coach_class VALUES(
   'S3','Sleeper'
);
INSERT INTO Coach_class VALUES(
   'S4','Sleeper'
);
INSERT INTO Coach_class VALUES(
   'S5','Sleeper'
);
INSERT INTO Coach_class VALUES(
   'S6','Sleeper'
);
INSERT INTO Coach_class VALUES(
   'C1','AC Chair Car'
);
INSERT INTO Coach_class VALUES(
   'C2','AC Chair Car'
);
INSERT INTO Coach_class VALUES(
   'C3','AC Chair Car'
);
INSERT INTO Coach_class VALUES(
   'C4','AC Chair Car'
);
INSERT INTO Coach_class VALUES(
   'C5','AC Chair Car'
);
INSERT INTO Coach_class VALUES(
   'C6','AC Chair Car'
);
INSERT INTO Coach_class VALUES(
   'D1','Second Sitting'
);
INSERT INTO Coach_class VALUES(
   'D2','Second Sitting'
);
INSERT INTO Coach_class VALUES(
   'D3','Second Sitting'
);
INSERT INTO Coach_class VALUES(
   'E1','Executive Chair Car'
);
INSERT INTO Coach_class VALUES(
   'E2','Executive Chair Car'
);
SELECT * FROM Coach_class;
INSERT INTO Coach_map VALUES(
   12764,'H1',24
);
INSERT INTO Coach_map VALUES(
   12764,'A1',48
);
INSERT INTO Coach_map VALUES(
   12764,'B1',64
);
INSERT INTO Coach_map VALUES(
   12764,'B2',64
);
INSERT INTO Coach_map VALUES(
   12764,'B3',64
);
INSERT INTO Coach_map VALUES(
   12764,'S1',72
);
INSERT INTO Coach_map VALUES(
   12764,'S2',72
);
INSERT INTO Coach_map VALUES(
   12764,'S3',72
);
INSERT INTO Coach_map VALUES(
   12764,'S4',72
);
INSERT INTO Coach_map VALUES(
   12764,'S5',72
);
INSERT INTO Coach_map VALUES(
   12763,'H1',24
);
INSERT INTO Coach_map VALUES(
   12763,'A1',48
);
INSERT INTO Coach_map VALUES(
   12763,'B1',64
);
INSERT INTO Coach_map VALUES(
   12763,'B2',64
);
INSERT INTO Coach_map VALUES(
   12763,'B3',64
);
INSERT INTO Coach_map VALUES(
   12763,'S1',72
);
INSERT INTO Coach_map VALUES(
   12763,'S2',72
);
INSERT INTO Coach_map VALUES(
   12763,'S3',72
);
INSERT INTO Coach_map VALUES(
   12763,'S4',72
);
INSERT INTO Coach_map VALUES(
   12763,'S5',72
);
INSERT INTO Coach_map VALUES(
   12763,'S5',72
);
INSERT INTO Coach_map VALUES(
   12758,'C1',73
);
INSERT INTO Coach_map VALUES(
   12758,'D1',108
);
INSERT INTO Coach_map VALUES(
   12758,'D2',108
);
INSERT INTO Coach_map VALUES(
   12757,'C1',73
);
INSERT INTO Coach_map VALUES(
   12757,'D1',108
);
INSERT INTO Coach_map VALUES(
   12757,'D2',108
);
INSERT INTO Coach_map VALUES(
   17012,'C1',73
);
INSERT INTO Coach_map VALUES(
   17012,'D1',108
);
INSERT INTO Coach_map VALUES(
   17012,'D2',108
);
INSERT INTO Coach_map VALUES(
   17012,'D3',108
);
INSERT INTO Coach_map VALUES(
   20701,'C1',78
);
INSERT INTO Coach_map VALUES(
   20701,'C2',78
);
INSERT INTO Coach_map VALUES(
   20701,'C3',78
);
INSERT INTO Coach_map VALUES(
   20701,'C4',78
);
INSERT INTO Coach_map VALUES(
   20701,'C5',78
);
INSERT INTO Coach_map VALUES(
   20701,'E1',56
);
INSERT INTO Coach_map VALUES(
   20701,'E2',56
);
INSERT INTO Coach_map VALUES(
   20702,'C1',78
);
INSERT INTO Coach_map VALUES(
   20702,'C2',78
);
INSERT INTO Coach_map VALUES(
   20702,'C3',78
);
INSERT INTO Coach_map VALUES(
   20702,'C4',78
);
INSERT INTO Coach_map VALUES(
   20702,'C5',78
);
INSERT INTO Coach_map VALUES(
   20702,'E1',56
);
INSERT INTO Coach_map VALUES(
   20702,'E2',56
);
SELECT * FROM Coach_map;
INSERT INTO Passenger_personal_info VALUES(
    1234567890,'R.Sai Kartik','rsk@gmail.com',19,'Male'
);
INSERT INTO Passenger_personal_info VALUES(
    1203456789,'K.Manideep','km@gmail.com',19,'Male'
);
INSERT INTO Passenger_personal_info VALUES(
    1023456789,'R.Divija','rd@gmail.com',20,'Female'
);
INSERT INTO Passenger_personal_info VALUES(
    1234506789,'R.Manohar','rmn@gmail.com',54,'Male'
);
INSERT INTO Passenger_personal_info VALUES(
    1267890345,'R.Gaja Lakshmi','rg@gmail.com',50,'Female'
);
INSERT INTO Passenger_personal_info VALUES(
    1234890567,'R.Hemanth','rh@gmail.com',40,'Male'
);
INSERT INTO Passenger_personal_info VALUES(
    1672348905,'K.Manasa','km@gmail.com',22,'Female'
);
SELECT * FROM Passenger_personal_info;
INSERT INTO Passenger_journey_details VALUES(
   '876543210',1234567890,'2024-03-31',187.25,12764,'SC','KZJ','S2',70
);
INSERT INTO Passenger_journey_details VALUES(
   '876543211',1203456789,'2024-03-31',187.25,12764,'SC','KZJ','S2',69
);
INSERT INTO Passenger_journey_details VALUES(
   '876543212',1023456789,'2024-03-31',187.25,12764,'SC','KZJ','S2',68
);
INSERT INTO Passenger_journey_details VALUES(
   '876543213',1234567890,'2024-04-05',87.25,17012,'KZJ','SC','D2',103
);
INSERT INTO Passenger_journey_details VALUES(
   '876543214',1234506789,'2024-04-05',1375.85,20701,'SC','TPTY','C3',75
);
INSERT INTO Passenger_journey_details VALUES(
   '876543215',1267890345,'2024-04-03',3315.85,20702,'TPTY','SC','E1',47
);
INSERT INTO Passenger_journey_details VALUES(
   '876543216',1234890567,'2024-04-14',102.25,17012,'KZJ','SC','D1',17
);
INSERT INTO Passenger_journey_details VALUES(
   '876543217',1672348905,'2024-04-14',312.25,12757,'SC','KZJ','C1',32
);
SELECT * FROM Passenger_journey_details;

