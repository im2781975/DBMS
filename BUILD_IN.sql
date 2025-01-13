"""					DATETIME						"""
https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html
SELECT DAYOFWEEK('2023-03-11');
SELECT DAYOFMONTH('2001-11-02');
SELECT MONTH('2005-10-05');
SELECT ADDDATE('2008-01-02', 31);
SELECT ADDTIME('2007-12-31 23:59:59.999999', '1 1:1:1.000002');
SELECT CONVERT_TZ('2004-01-01 12:00:00','GMT','MET');
SELECT CONVERT_TZ('2004-01-01 12:00:00','+00:00','+10:00');
SELECT CURDATE();
SELECT CURTIME(4);
SELECT DATE('2003-12-31 01:02:03');
SELECT DATEDIFF('2007-12-31 23:59:59','2007-12-30');
SELECT DATEDIFF('2010-11-30 23:59:59','2010-12-31');
SELECT DATE_ADD('2018-05-01',INTERVAL 1 DAY);
SELECT DATE_SUB('2018-05-01',INTERVAL 1 YEAR);
SELECT DATE_FORMAT('2090-10-04 22:23:00', '%W %M %Y');

SELECT DATE_FORMAT('2007-10-04 22:23:00', '%H:%i:%s');
SELECT DATE_FORMAT('1900-10-04 22:23:00','%D %y %a %d %m %b %j');
SELECT DATE_FORMAT('2003-10-03',GET_FORMAT(DATE,'EUR'));
