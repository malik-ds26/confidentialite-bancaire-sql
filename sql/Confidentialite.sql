--------------Creation des roles

Create role Directrice;
Create role Adjoint ;
Create role Employee;
Create role CLient;

---------- Affectation des accees 

Grant select,update ON client to directrice;
Grant select,update,delete,insert ON CompteBancaire to directrice;
Grant select,update,delete,insert ON Transaction_Bancaire to directrice;

Grant select,update ON client to Adjoint;
Grant select,update ON CompteBancaire to Adjoint;
Grant select,update ON Transaction_Bancaire to Adjoint;

Grant select on CompteBancaire to employee;
Grant select,update on Client to employee;
Grant select,update on Transaction_Bancaire to employee;

Grant select on Transaction_Bancaire to Client;
Grant select on CompteBancaire to CLient;
