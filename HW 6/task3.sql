-- 1
SELECT DISTINCT S.first_name, S.surname
FROM restStaff S
JOIN restBill B ON S.staff_no = B.waiter_no
WHERE B.cust_name = 'Tanya Singh';

-- 2
SELECT RM.room_date
FROM restRoom_management RM
JOIN restStaff HW ON RM.headwaiter = HW.staff_no
WHERE HW.first_name = 'Charles' AND RM.room_name = 'Green' AND RM.room_date BETWEEN 160201 AND 160229;

-- 3
SELECT S.first_name, S.surname
FROM restStaff S
JOIN restStaff HW ON S.headwaiter = HW.staff_no
WHERE HW.first_name = 'Zoe' AND HW.surname = 'Ball';

-- 4
SELECT B.cust_name, B.bill_total, W.first_name AS waiter_first_name, W.surname AS waiter_surname
FROM restBill B
JOIN restStaff W ON B.waiter_no = W.staff_no
ORDER BY B.bill_total DESC;

-- 5
SELECT DISTINCT S.first_name, S.surname
FROM restStaff S
JOIN restBill B ON S.staff_no = B.waiter_no
WHERE B.table_no IN (
    SELECT table_no
    FROM restBill
    WHERE bill_no IN (00014, 00017)
);

-- 6
SELECT HW.first_name AS headwaiter_first_name, HW.surname AS headwaiter_surname, W.first_name AS waiter_first_name, W.surname AS waiter_surname
FROM restRoom_management RM
JOIN restStaff HW ON RM.headwaiter = HW.staff_no
JOIN restBill B ON RM.room_name = B.table_no
JOIN restStaff W ON B.waiter_no = W.staff_no
WHERE RM.room_name = 'Blue' AND RM.room_date = 160312;
