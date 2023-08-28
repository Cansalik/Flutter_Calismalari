import 'package:hastane_sistemi/DAO/databaseAssistant.dart';
import 'package:hastane_sistemi/classes/Active_appointment.dart';
import 'package:hastane_sistemi/classes/Patients.dart';

class PatientDAO
{

  Future<List<Active_appointment>> patientList() async
  {
    var db = await databaseAssistant.databaseAccess();

    List<Map<String,dynamic>> Maps = await db.rawQuery("SELECT * FROM tbl_Appointment,tbl_Patient WHERE tbl_Appointment.Patient_TC = tbl_Patient.Patient_TC  AND tbl_Appointment.Appointment_Doctor = 'Müzeyen Oğurlu'");

    return List.generate(Maps.length, (index)
    {
      var satir = Maps[index];

      var P = Patients(satir["Patient_ID"], satir["Patient_TC"], satir["Patient_Name"], satir["Patient_Surname"], satir["Patient_Password"], satir["Patient_Gender"]);
      var Ap = Active_appointment(satir["Appointment_ID"], satir["Appointment_Date"], satir["Appointment_Time"], satir["Appointment_Branch"], satir["Appointment_Doctor"], satir["Appointment_State"], satir["Patient_TC"], satir["Patient_Complaint"], P);
      return Ap;
    });
  }
}