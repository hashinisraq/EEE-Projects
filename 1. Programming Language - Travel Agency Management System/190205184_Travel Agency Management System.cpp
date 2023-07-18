// Project: 19
// Project Name: Travel Agency Management System
// Name: Hashin Israq
// ID: 190105184, Lab Group: C2, Year: 2, Semester: 1.


#include<iostream>
#include<vector>
#include<fstream>
using namespace std;


class NewTravelTrip                // Create a Class named NewTravelTrip
{
public:                            // Access specifier
    NewTravelTrip();               // Default Constructor which is a type of Function
    NewTravelTrip(int m)           // Parameterized Constructor.
    {
    }
    void AddTrip();                // This Function is Add data to the previous recorded user
    string name;
    string date;
    string address;
    string phoneno;
    int invoice;
    string email;
    vector<string>tripdate;        // Format: vector<dataType>nameOfVector, Dynamic Array
    void EditTrip();               // This Function is Edit the Previous recorded Trip
    void DeleteTrip();             // This Function is Delete the Previous recorded Trip
    vector<string>startlocation;
    vector<string>finaldestination;

};

class ShowAllUser                  // Create a Class named ShowAllUser
{
public:
    void showUser();               // This Function is show the previous recorded user data
    int invoice;
    string name;
    string date;
    string address;
    string phoneno;
    string email;
    string tripdate;
    string triplocation;

    void DeleteUser();            // This Function is delete the previous recorded user data
    void EditUser();              // This Function is Edit the previous recorded user data


};




vector<NewTravelTrip>trips;       // Create a Global Vector
int inv;                          // Global Variable for auto invoice id



NewTravelTrip::NewTravelTrip()    // Default constructor called automatically
{
    string t_date, s_loc, f_des;
    invoice = inv;
    cout << "\n              Invoice ID: " << invoice ;    // Auto Generated Invoice ID
    getline(cin,date);                                     // getline string for get the full line
    cout << "\n              Enter Date: " ;
    getline(cin,date);
    cout << "\n         Enter User Name: " ;
    getline(cin, name);
    cout << "\n      Enter User Address: " ;
    getline(cin, address);
    cout << "\n    Enter User Phone No.: " ;
    cin >> phoneno;
    cout << "\nEnter User Email Address: " ;
    cin >> email;
    cout << "\n         Enter Trip Date: " ;
    cin >> t_date;
    cout << "\n     Enter Trip Location \n" ;
    getline(cin, s_loc);
    cout <<"\n           Start Location: ";
    getline(cin, s_loc);
    cout <<"\n        Final Destination: ";
    getline(cin, f_des);

    // Adds a new element at the end of the vector
    tripdate.push_back(t_date);
    startlocation.push_back(s_loc);
    finaldestination.push_back(f_des);
    inv++;                   // ++Invoice ID
}


void ShowAllUser::showUser()
{
    int sz, i, j;
    sz = trips.size();      // Vector.size() returns the number of elements in the vector
    for(i = 0; i < sz; i++)
    {

        cout << "\n            Invoice ID: " << trips[i].invoice << endl ;
        cout << "\n                  Date: " << trips[i].date << endl;
        cout << "\n             User Name: " << trips[i].name << endl;
        cout << "\n          User Address: " << trips[i].address << endl;
        cout << "\n         User Phone No: " << trips[i].phoneno << endl;
        cout << "\n    User Email Address: " << trips[i].email << endl;

        // j defines how many trips have an invoice id
        for(j = 0; j < trips[i].tripdate.size(); j++)
        {
            cout << "\n             Trip Date: " << trips[i].tripdate[j]<<endl;
            cout << "\n         Trip Location: " << endl;
            cout << "\n        Start Location: " << trips[i].startlocation[j] << endl;
            cout << "\n     Final Destination: " << trips[i].finaldestination[j] << endl << endl;
        }
        cout << endl;
    }
}



void ShowAllUser::EditUser()          // The Edit User Function
{
    int invc_id, i, j;
    string t_date, s_loc, f_des;
    cout<< "\n             Enter Invoice ID: ";
    cin>>invc_id;

    // To Find the User input Invoice ID
    for(i = 0; i < trips.size(); i++)
    {
        if(trips[i].invoice == invc_id)
            j = i;
    }
    getline(cin, trips[j].date);
    cout << "\n               Enter New Date: " ;
    getline(cin, trips[j].date);
    cout << "\n          Enter New User Name: " ;
    getline(cin, trips[j].name);
    cout << "\n       Enter New User Address: " ;
    getline(cin, trips[j].address);
    cout << "\n      Enter New User Phone No: " ;
    cin >> trips[j].phoneno;
    cout << "\n Enter User New Email Address: " ;
    cin >> trips[j].email;

    trips[j].tripdate.clear();         // It is used to remove all the elements of the vector container
    trips[j].finaldestination.clear();
    trips[j].startlocation.clear();

    getline(cin, t_date);
    cout << "\n         Enter New Trip Date: " ;
    getline(cin, t_date);
    cout << "\n     Enter New Trip Location: \n" ;
    cout << "\n     ------------------------ " << endl;
    cout <<"\n           New Start Location: ";
    getline(cin, s_loc);
    cout <<"\n        New Final Destination: ";
    getline(cin, f_des);

    // Adds a new element at the end of the vector
    trips[j].tripdate.push_back(t_date);
    trips[j].startlocation.push_back(s_loc);
    trips[j].finaldestination.push_back(f_des);
}




void ShowAllUser::DeleteUser()        // The Delete User Function
{
    int invc_id, i, j;
    string t_date, s_loc, f_des;
    cout << "\n            Enter Invoice ID: ";
    cin >> invc_id;

    // To Find the User input Invoice ID.
    for(i = 0; i < trips.size(); i++)
    {
        if(trips[i].invoice == invc_id)
            j = i;
    }
    vector<NewTravelTrip>::iterator it;    // iterator is use like pointer
    it = trips.begin();                    // Reads Vector from the first element
    for(i = 0; i < j; i++)
        it++;
    trips.erase(it);                       // It is used to remove elements from a container
    // from the specified position or range
}



void NewTravelTrip::AddTrip()              // This Function Add data to the Previous record
{
    int invc_id, i, j;
    cout << "\n        Enter Invoice ID: ";
    cin >> invc_id;

    // To Find the User input Invoice ID.
    for(i = 0; i < trips.size(); i++)
    {
        if(trips[i].invoice == invc_id)
            j = i;
    }
    string t_date, s_loc, f_des;
    cout << "\n         Enter Trip Date: " ;
    cin >> t_date;
    cout << "\n     Enter Trip Location: \n" ;
    cout << "\n     -------------------- " << endl;
    getline(cin, s_loc);
    cout <<"\n           Start Location: ";
    getline(cin, s_loc);
    cout <<"\n        Final Destination: ";
    getline(cin, f_des);

    // Adds a new element at the end of the vector
    trips[j].tripdate.push_back(t_date);
    trips[j].startlocation.push_back(s_loc);
    trips[j].finaldestination.push_back(f_des);

}

void NewTravelTrip::EditTrip()             // This Function Edit the Previous recorded Trip
{
    int invc_id, i, j, x;
    cout << "\n           Enter Invoice ID: ";
    cin >> invc_id;

    // To Find the User input Invoice ID.
    for(i = 0; i < trips.size(); i++)     // size() Returns the number of elements in the vector
    {
        if(trips[i].invoice == invc_id)
            j = i;
    }
    for(x = 0; x < trips[j].tripdate.size(); x++)   // x defines num of trip
    {
        cout << endl;
        cout << "Do you want to edit this Trip? Enter 'Y/y' for yes, 'N/n' for no."<<endl;
        cout << endl;
        cout << "\n              Trip Date: " << trips[j].tripdate[x]<<endl;
        cout << "\n          Trip Location: " << endl;
        cout << "\n          -------------- " << endl;
        cout << "\n         Start Location: "<< trips[j].startlocation[x]<<endl;
        cout << "\n      Final Destination: "<< trips[j].finaldestination[x]<<endl<<endl;
        string inp;
        cin >> inp;
        if(inp == "Y" || inp == "y")
        {
            string t_date, s_loc, f_des;
            cout << "\n         Enter Trip Date: " ;
            cin >> t_date;
            cout << "\n     Enter Trip Location: \n" ;
            cout << "\n     -------------------- " << endl;
            getline(cin, s_loc);
            cout <<"\n           Start Location: ";
            getline(cin, s_loc);
            cout <<"\n        Final Destination: ";
            getline(cin, f_des);

            trips[j].tripdate[x] = t_date;
            trips[j].startlocation[x] = s_loc;
            trips[j].finaldestination[x] = f_des;
            cout << "\t\tYour Trip is Edited. "<< endl;
            break;
        }
    }
}

void NewTravelTrip::DeleteTrip()                      // This Function is Delete the Previous recorded Trip
{
    int invc_id, i, j, x, y;
    cout << "\n       Enter Invoice ID: ";
    cin >> invc_id;

    // To Find the User input Invoice ID.
    for(i = 0; i < trips.size(); i++)
    {
        if(trips[i].invoice == invc_id)
            j = i;
    }

    for(x = 0; x < trips[j].tripdate.size(); x++)
    {
        cout << endl;
        cout << "\nDo you want to delete this Trip? Enter 'Y/y' for yes, 'N/n' for no." << endl;
        cout << endl;
        cout << "\t        Trip Date: " << trips[j].tripdate[x] << endl;
        cout << "\t    Trip Location: " << endl;
        cout << "\t    -------------- " << endl;
        cout << "\t   Start Location: " << trips[j].startlocation[x] << endl;
        cout << "\tFinal Destination: " << trips[j].finaldestination[x] << endl << endl;
        string inp;
        cin >> inp;
        if(inp == "Y" || inp == "y")
        {
            vector<string>::iterator it;             // Iterators are used to point at the memory addresses

            it = trips[j].tripdate.begin();          // Reads Vector from the first element
            for(y = 0; y < x; y++)
                it++;
            trips[j].tripdate.erase(it);             // It is used to remove elements from a container
            // from the specified position or range
            it = trips[j].startlocation.begin();
            for(y = 0; y < x; y++)
                it++;
            trips[j].startlocation.erase(it);

            it = trips[j].finaldestination.begin();
            for(y = 0; y < x; y++)
                it++;
            trips[j].finaldestination.erase(it);

            cout << "\t\tYour Trip is Deleted. "<<endl;
            break;
        }
    }
}



int main()
{
    int choice;
    inv = 1;
    while(1)
    {
        cout << "--------------------------------------------------------------------------" << endl;
        cout << "\t\tWelcome To Travel Agency Management System"<<endl;
        cout << "--------------------------------------------------------------------------" << endl;
        cout << endl;
        cout << "\t1. New Travel Trip "<<endl;
        cout << "\t2. Show All Users "<<endl;
        cout << "\t3. Edit User "<<endl;
        cout << "\t4. Delete User "<<endl;
        cout << "\t5. Add Trip "<<endl;
        cout << "\t6. Edit Trip "<<endl;
        cout << "\t7. Delete Trip "<<endl;
        cout << "\t8. Exit "<<endl;
        cout << endl;
        cout << "\tEnter Your Choice: ";
        cin >> choice;
        switch(choice)
        {
        case 1:
        {
            cout << endl;
            cout << "\t\tYou Have New Travel Trip"<< endl;
            NewTravelTrip ad;                        // Create an object of NewTravelTrip.

            trips.push_back(ad);
            cout << endl;
            cout << "\t\tYour Data is Recorded. "<<endl;
            cout << endl;
            break;
        }
        case 2:
        {
            cout << "\t\tYou have chosen Show All Users"<<endl;
            cout << "\tYour Previously recorded Data is showing Below." << endl;
            cout << endl;
            ShowAllUser show;                        // Create an object of show.
            show.showUser();                         // Function Calling.
            cout << endl;
            break;
        }
        case 3:
        {
            cout << "\t\tYou have chosen Edit User"<< endl;
            cout << endl;
            ShowAllUser edit;
            edit.EditUser();
            cout << endl;
            break;
        }
        case 4:
        {
            cout << "\t\tYou have chosen Delete User"<< endl;
            cout << endl;
            ShowAllUser del;
            del.DeleteUser();
            cout << "\t\tYour Data is Deleted. "<< endl;
            cout << endl;

            break;
        }
        case 5:
        {
            cout << "\t\tYou have chosen Add Trip"<< endl;
            cout << endl;
            NewTravelTrip tp(0);
            tp.AddTrip();
            cout << "\t\tYour Trip is Added. "<< endl;
            cout << endl;

            break;
        }
        case 6:
        {
            cout << "\t\tYou have chosen Edit Trip"<<endl;
            cout << endl;
            NewTravelTrip tp(0);
            tp.EditTrip();
            cout << endl;

            break;
        }
        case 7:
        {
            cout << "\t\tYou have chosen Delete Trip" << endl;
            cout << endl;
            NewTravelTrip tp(0);
            tp.DeleteTrip();
            cout <<  endl;

            break;
        }
        case 8:
        {
            cout << endl;
            cout << "\t\tActive trips have been added to the file" << endl;
            cout << "\n\t\tThank you for using the system."<< endl;
            cout << endl;

            // saving active trips into file
            ofstream MyFile("/home/israq/Desktop/TAMS/travel.txt");
            MyFile << "Inv_No\t" <<"Name\t\t" << "Address\t\t" << "\tPhone No\t" << " " << "Email Address\t\t" << "\tTrip Date\t" << "Start Location\t\t" << "Final Location" << endl;;
            for(int i = 0; i < trips.size(); i++)
            {
                MyFile << trips[i].invoice <<"\t\t" << trips[i].name << "\t\t" << trips[i].address << "\t\t" << trips[i].phoneno << "\t" << " " << trips[i].email << "\t\t" << trips[i].date << "\t\t" << trips[i].startlocation[i] << "\t\t" << trips[i].finaldestination[i] << endl;
            }
            MyFile.close();

            exit(0);
            break;
        }
        default:
        {
            cout <<  endl;
            cout << "\tIncorrect Option! Press enter the right choice " << endl;
            cout << endl;
            break;
        }
        }

    }
    return 0;
}




