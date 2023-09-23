import 'package:hastane_sistemi/DAO/databaseAssistant.dart';
import 'package:hastane_sistemi/classes/Active_appointment.dart';
import 'package:hastane_sistemi/classes/Branches.dart';
import 'package:hastane_sistemi/classes/Doctors.dart';
import 'package:hastane_sistemi/classes/Patients.dart';
import 'package:hastane_sistemi/classes/deneme.dart';


class patientAppointmentDAO
{
  Future<List<Branches>> branchList() async
  {
    var db = await databaseAssistant.databaseAccess();

    List<Map<String,dynamic>> Maps = await db.rawQuery("SELECT * FROM tbl_Branches");

    return List.generate(Maps.length, (index)
    {
      var satir = Maps[index];

      var B = Branches(satir["Branch_ID"], satir["Branch_Name"]);
      return B;
    });
  }

  Future<List<Doctors>> doctorList(int Branch_ID) async
  {
    var db = await databaseAssistant.databaseAccess();

    List<Map<String,dynamic>> Maps = await db.rawQuery("SELECT * FROM tbl_Doctors WHERE Doctor_BranchID = $Branch_ID");

    return List.generate(Maps.length, (index)
    {
      var satir = Maps[index];
      return Doctors(satir["Doctor_ID"], satir["Doctor_TC"], satir["Doctor_Name"], satir["Doctor_Surname"], satir["Doctor_Password"], satir["Doctor_BranchID"]);
    });
  }

  Future<List<Active_appointment>> dateList(String Doctor_Name) async
  {
    var db = await databaseAssistant.databaseAccess();

    List<Map<String,dynamic>> Maps = await db.rawQuery("SELECT * FROM tbl_Appointment,tbl_Patient WHERE tbl_Appointment.Patient_TC = tbl_Patient.Patient_TC AND tbl_Appointment.Appointment_Doctor = '$Doctor_Name'");

    return List.generate(Maps.length, (index)
    {
      var satir = Maps[index];
      var P = Patients(satir["Patient_ID"], satir["Patient_TC"], satir["Patient_Name"], satir["Patient_Surname"], satir["Patient_Password"], satir["Patient_Gender"]);
      var Ap = Active_appointment(satir["Appointment_ID"], satir["Appointment_Date"], satir["Appointment_Time"], satir["Appointment_Branch"], satir["Appointment_Doctor"], satir["Appointment_State"], satir["Patient_TC"], satir["Patient_Complaint"], P);
      return Ap;
    });
  }

  Future<List<Active_appointment>> timeList(String Doctor_Name,String Date) async
  {
    var db = await databaseAssistant.databaseAccess();

    List<Map<String,dynamic>> Maps = await db.rawQuery("SELECT * FROM tbl_Appointment WHERE tbl_Appointment.Appointment_Doctor = '$Doctor_Name' AND tbl_Appointment.Appointment_Date = '$Date' AND tbl_Appointment.Appointment_State = 0");
    return List.generate(Maps.length, (index)
    {
      var satir = Maps[index];
      var P = Patients(satir["Patient_ID"], satir["Patient_TC"], satir["Patient_Name"], satir["Patient_Surname"], satir["Patient_Password"], satir["Patient_Gender"]);
      var Ap = Active_appointment(satir["Appointment_ID"], satir["Appointment_Date"], satir["Appointment_Time"], satir["Appointment_Branch"], satir["Appointment_Doctor"], satir["Appointment_State"], satir["Patient_TC"], satir["Patient_Complaint"], P);
      return Ap;
    });
  }

  Future<void> appointmentUpdate(String Patient_TC,int Appointmnet_State,String Patient_Complaint,String Appointment_Branch, String Appointment_Doctor, String Appointmnet_Date, String Appointment_Time) async
  {
    var db = await databaseAssistant.databaseAccess();

    var bilgiler = Map<String,dynamic>();
    bilgiler["Patient_TC"] = Patient_TC;
    bilgiler["Appointment_State"] = Appointmnet_State;
    bilgiler["Patient_Complaint"] = Patient_Complaint;

    await db.update("tbl_Appointment", bilgiler,where: "Appointment_Branch = ?  AND Appointment_Doctor = ? AND Appointment_Date = ? AND Appointment_Time = ?",whereArgs: [Appointment_Branch,Appointment_Doctor,Appointmnet_Date,Appointment_Time]);
  }




  Future<List<deneme>> timeListt(String Doctor_Name,String Date) async
  {
    var db = await databaseAssistant.databaseAccess();

    List<Map<String,dynamic>> Maps = await db.rawQuery("SELECT * FROM tbl_Appointment WHERE tbl_Appointment.Appointment_Doctor = '$Doctor_Name' AND tbl_Appointment.Appointment_Date = '$Date' AND tbl_Appointment.Appointment_State = 1");
    return List.generate(Maps.length, (index)
    {
      var satir = Maps[index];
      return deneme(satir["Appointment_ID"], satir["Appointment_Date"], satir["Appointment_Time"], satir["Appointment_Branch"], satir["Appointment_Doctor"], satir["Appointment_State"], satir["Patient_TC"], satir["Patient_Complaint"]);
    });
  }
  
  
  
  
  
  
  
}