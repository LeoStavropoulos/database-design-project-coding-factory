USE Camping;
GO

ALTER TABLE Bookings
ADD Total_price AS dbo.ufn_BookingTotalPrice(Booking_num);