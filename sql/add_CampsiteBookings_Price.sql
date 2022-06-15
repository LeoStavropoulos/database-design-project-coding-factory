USE Camping;
GO

ALTER TABLE Campsite_Bookings
ADD Price AS dbo.ufn_CampsiteBookingPrice(Persons_number, Camping_id, Campsite_num);