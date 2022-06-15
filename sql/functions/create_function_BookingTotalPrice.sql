USE Camping;
GO

CREATE FUNCTION dbo.ufn_BookingTotalPrice (@BookingNum NUMERIC)
RETURNS MONEY
AS
BEGIN
    DECLARE @TotalPrice MONEY;

    SELECT @TotalPrice = SUM(Price)
    FROM Campsite_Bookings
    WHERE @BookingNum = Booking_num;

    RETURN @TotalPrice;
END;
GO

