// Get a reference to the "users" collection

CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

// Listen for changes to the "users" collection
Stream<QuerySnapshot> usersStream = usersRef.snapshots();

// Build the widget tree
return StreamBuilder<QuerySnapshot>(
  stream: usersStream,
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return Text('Something went wrong');
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }

    return ListView(
      children: snapshot.data!.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        String email = data['email'];

        // Check if there is a "consultations" subcollection
        CollectionReference consultationsRef = usersRef.doc(document.id).collection('consultations');
        Stream<QuerySnapshot> consultationsStream = consultationsRef.snapshots();

        return StreamBuilder<QuerySnapshot>(
          stream: consultationsStream,
          builder: (context, consultationsSnapshot) {
            if (consultationsSnapshot.hasError) {
              return Text('Something went wrong');
            }

            if (consultationsSnapshot.connectionState == ConnectionState.waiting) {
              return Container();
            }

            return Column(
              children: consultationsSnapshot.data!.docs.map((DocumentSnapshot consultationDocument) {
                Map<String, dynamic> consultationData = consultationDocument.data() as Map<String, dynamic>;
                String doctorEmail = consultationData['doctor_email'];

                if (doctorEmail == FirebaseAuth.instance.currentUser!.email) {
                  return ListTile(
                    // Display the consultation data
                  );
                } else {
                  return Container();
                }
              }).toList(),
            );
          },
        );
      }).toList(),
    );
  },
);