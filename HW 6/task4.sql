-- 1
SELECT DISTINCT B.cust_name
FROM restBill B
WHERE B.bill_total > 450.00
AND B.waiter_no IN (
    SELECT S.staff_no
    FROM restStaff S
    JOIN restRoom_management RM ON S.staff_no = RM.headwaiter
    WHERE S.first_name = 'Charles'
    AND RM.room_date = B.bill_date
);

-- 2
SELECT S.first_name, S.surname
FROM restStaff S
WHERE S.staff_no = (
    SELECT RM.headwaiter
    FROM restRoom_management RM
    JOIN restBill B ON RM.room_name = (SELECT room_name FROM restRest_table WHERE table_no = B.table_no)
    WHERE B.cust_name = 'Nerida Smith' AND B.bill_date = 160111 AND RM.room_date = 160111
);

-- 3
SELECT B.cust_name
FROM restBill B
WHERE B.bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

-- 4
SELECT S.first_name, S.surname
FROM restStaff S
WHERE S.staff_no NOT IN (
    SELECT DISTINCT waiter_no
    FROM restBill
);

-- 5
SELECT B.cust_name, HW.first_name AS headwaiter_first_name, HW.surname AS headwaiter_surname, RM.room_name
FROM restBill B
JOIN restRoom_management RM ON B.table_no = (SELECT table_no FROM restRest_table WHERE room_name = RM.room_name)
JOIN restStaff HW ON RM.headwaiter = HW.staff_no
WHERE B.bill_total = (
    SELECT MAX(bill_total)
    FROM restBill
);
