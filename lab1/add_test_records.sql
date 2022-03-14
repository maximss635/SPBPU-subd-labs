insert into Medicine(batch_number, code, serial_number,
                     pills_in_pack, manufacturer, expiry_date,
                     storage_temperature, drag_concentration) values
(1, 1, 1, 1, "test1", NOW(), 1, 1),
(2, 2, 2, 2, "test2", NOW(), 2, 2),
(3, 3, 3, 3, "test3", NOW(), 3, 3),
(4, 4, 4, 4, "test4", NOW() + interval 1 day , 4, 4),
(5, 5, 5, 5, "test5", NOW() + interval 2 day , 5, 5),
(6, 6, 6, 6, "test6", NOW() + interval 3 day , 6, 6);

insert into Appointments(doctor_firstname, doctor_lastname, doctor_patronymic, medicine_serial_number,
              appointment_date, patient_firstname, patient_lastname, patient_patronymic, count) values
    ('doctor_1', 'doctor_1', 'doctor_1', 1, NOW(), 'patient_1', 'patient_1', 'patient_1', 1),
    ('doctor_2', 'doctor_2', 'doctor_2', 2, NOW(), 'patient_2', 'patient_2', 'patient_2', 2),
    ('doctor_3', 'doctor_3', 'doctor_3', 3, NOW(), 'patient_3', 'patient_3', 'patient_3', 3),
    ('doctor_4', 'doctor_4', 'doctor_4', 4, NOW(), 'patient_4', 'patient_4', 'patient_4', 4);