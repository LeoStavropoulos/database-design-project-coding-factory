USE Camping;
GO

ALTER TABLE Campsites
ADD CONSTRAINT CK_Campsites_num CHECK (dbo.ufn_CheckCampsiteNum(Camping_id, Campsite_num) = 'True');