import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_utgulamasi_pattern/Cubit/HomePage_Cubit.dart';
import 'package:kisiler_utgulamasi_pattern/Entity/Contacts.dart';
import 'package:kisiler_utgulamasi_pattern/Views/ContactAdd_Page.dart';
import 'package:kisiler_utgulamasi_pattern/Views/ContactDetail_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    context.read<HomePage_Cubit>().contactsLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? TextField(
          style: TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: "Ara",
            hintStyle: TextStyle(color: Colors.white),
        ),
        autofocus: true,
        onChanged: (aramaSonucu)
        {
          context.read<HomePage_Cubit>().search(aramaSonucu);
        },
        ) : const Text("Kişiler"),
        actions: [
          _isSearching ?
          IconButton(onPressed: ()
            {
              setState(() {
                _isSearching = false;
                context.read<HomePage_Cubit>().contactsLoad();
              });
            }, icon: Icon(Icons.cancel),) :
          IconButton(onPressed: ()
          {
            setState(() {
              _isSearching = true;
            });
          }, icon: Icon(Icons.search),)
        ],
      ),
      body: BlocBuilder<HomePage_Cubit,List<Contacts>>(
        builder: (context, contactsList)
        {
          if(contactsList.isNotEmpty)
          {
            return ListView.builder(
              itemCount: contactsList.length,
              itemBuilder: (context, index)
              {
                var contact = contactsList[index];
                return GestureDetector(
                  onTap: ()
                  {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => ContactDetail_Page(contact: contact))).then((value) => {

                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          SizedBox(width: 50,height: 50,child: Image.asset("assets/images/people.png")),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(contact.contact_name,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text("${contact.contact_phone}",style: TextStyle(fontSize: 16,color: Colors.blue),),
                              ],
                            ),
                          ),
                          Spacer(),
                          IconButton(onPressed: ()
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${contact.contact_name} Silinsin mi ?"),
                                action: SnackBarAction(
                                  label: "EVET",
                                  onPressed: ()
                                  {
                                    context.read<HomePage_Cubit>().delete(contact.contact_id);
                                  },
                                ),
                              ),
                            );
                          }, icon: Icon(Icons.delete_outline),color: Colors.red[400],),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else
          {
            return const Center();
          }
        },

      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ContactAdd_Page())).then((value) =>
            {
              print("Anasayfaya Dönüldü"),
            });
          },
      ),
    );
  }
}
