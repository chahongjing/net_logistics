INSERT INTO dbo.BusinessType(CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, TypeID, Code, ParentID, Name, Time)
SELECT A.CreatedBy, A.CreatedOn, A.ModifiedBy, A.ModifiedOn, NEWID() AS TypeId,
       A.Code + '.' + RIGHT('0000' + [流程表], 4) AS Code, A.TypeID AS ParentID, [F3] AS NAME, [间隔时间（天）] AS [time]
  FROM dbo.BusinessType AS A
  INNER JOIN [流程档案] AS B ON RTRIM(LTRIM(A.Name)) = RTRIM(LTRIM(SUBSTRING(B.[名称], 4, 100)))