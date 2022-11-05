import 'package:flutter_atividade2/model/contato.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_state.dart';
import 'contact_event.dart';
import '../Dados/contactList.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  List<Contato> currentList =[];

  ContactBloc(ContactState initialState) : super(initialState) {
    on<ContactFetchEvent>((event, emit) async {
      currentList = await ContactDataProvider.helper.getContacts();
      if (currentList.isNotEmpty)
      {
        emit(ContactLoaded(currentList));
      }
      else
      {
        emit(ContactEmpty());
      }
      
    });

    on<ContactAddEvent>((event, emit) async {
      int res = await ContactDataProvider.helper.addContato(event.cont);
      if (res ==1)
      {
        //currentList.add(event.cont);
      }
      
      if (currentList.isNotEmpty)
      {
        emit(ContactLoaded(currentList));
      }
      else
      {
        emit(ContactEmpty());
      }
    },);
  }
}