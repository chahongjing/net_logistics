INSERT INTO dbo.BusinessType(CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, TypeID, Code, ParentID, Name, Time)
SELECT A.CreatedBy, A.CreatedOn, A.ModifiedBy, A.ModifiedOn, NEWID() AS TypeId,
       A.Code + '.' + RIGHT('0000' + LiuChengBiao, 4) AS Code, A.TypeID AS ParentID, [F3] AS NAME, ShiJianJianGe AS [time]
  FROM dbo.BusinessType AS A
  INNER JOIN LiuChengDanAn AS B ON RTRIM(LTRIM(A.Name)) = RTRIM(LTRIM(SUBSTRING(B.MingCheng, 4, 100)))