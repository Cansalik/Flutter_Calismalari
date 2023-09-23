import 'package:hastane_sistemi/classes/Patients.dart';

class Active_appointment {
  late int Appointment_ID;
  late String Appointment_Date;
  late String Appointment_Time;
  late String Appointment_Branch;
  late String Appointment_Doctor;
  late int Appointment_State;
  late String Patient_TC;
  late String Patient_Complaint;
  late Patients Patient;

  Active_appointment(
      this.Appointment_ID,
      this.Appointment_Date,
      this.Appointment_Time,
      this.Appointment_Branch,
      this.Appointment_Doctor,
      this.Appointment_State,
      this.Patient_TC,
      this.Patient_Complaint,
      this.Patient);
}