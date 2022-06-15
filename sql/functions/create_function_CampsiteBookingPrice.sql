USE Camping;
GO

CREATE FUNCTION dbo.ufn_CampsiteBookingPrice (@Persons INT, @CampID VARCHAR(3), @SiteNum INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @PricePerPerson MONEY;
    DECLARE @TotalPrice MONEY;
    
    SELECT @PricePerPerson = Price
    FROM Campsite_Categories
    INNER JOIN Campsites
    ON Campsite_Categories.Category_id = Campsites.Category_id
    AND Camping_id = @CampID
    AND Campsite_num = @SiteNum;

    SELECT @TotalPrice = @PricePerPerson * @Persons;
    RETURN @TotalPrice; 
END;
GO