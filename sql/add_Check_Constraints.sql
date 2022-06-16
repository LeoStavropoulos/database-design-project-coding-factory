USE Camping;
GO

ALTER TABLE Campsites
ADD CONSTRAINT CK_Campsites_num CHECK (dbo.ufn_CheckCampsiteNum(Camping_id, Campsite_num) = 'True');

ALTER TABLE Campsite_Bookings
ADD CONSTRAINT CK_Start_Date CHECK (dbo.ufn_CheckBookingDate(Booking_num, Start_date) = 'True');

ALTER TABLE Campsite_Bookings
ADD CONSTRAINT CK_End_Date CHECK (dbo.ufn_CheckBookingDate(Booking_num, End_date) = 'True');
