SELECT
  OBJECT_NAME(OBJECT_ID) AS gaa.dev_ws1_scroll_tracking_channel,
  name AS colName,
  TYPE_NAME(system_type_id),
  CASE
    WHEN TYPE_NAME(system_type_id) IN ('NCHAR','NVARCHAR')
    THEN max_length / 2
    ELSE max_length
  END AS MaxColLength
FROM sys.columns
 WHERE TYPE_NAME(system_type_id) IN ('NCHAR','NVARCHAR','CHAR','VARCHAR')
