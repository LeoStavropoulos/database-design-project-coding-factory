USE Camping;
GO

CREATE FUNCTION dbo.ufn_CheckBookingDate(@BookingNum NUMERIC, @Date DATE)
RETURNS VARCHAR(5)
AS
BEGIN
    DECLARE @BookingDate DATE;

    SELECT @BookingDate = Booking_date
    FROM Bookings
    WHERE Booking_num = @BookingNum

    IF (@Date >= @BookingDate) 
        RETURN 'True';
    RETURN 'False';
END;
GO