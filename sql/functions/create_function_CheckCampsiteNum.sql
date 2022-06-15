USE Camping;
GO

CREATE FUNCTION dbo.ufn_CheckCampsiteNum(@CampID VARCHAR(3), @CampNum INT)
RETURNS VARCHAR(5)
AS
BEGIN
    DECLARE @MaxCampNum INT;

    SELECT @MaxCampNum = Total_Campsites
    FROM Campings
    WHERE Camping_id = @CampID

    IF (@MaxCampNum >= @CampNum) 
        RETURN 'True';
    RETURN 'False';
END;
GO