class Fleet_Owner
{
  String ownerName;
  String contactNumber;
  String email;
  String password;
  String companyName;
  String address;
  String city;
  String pin;
  String state;
  String phone;
  String pan;
  String gst;

   Fleet_Owner.withoutCompanyName(String ownerName,String contactNumber, String email, String password)
  {
    this.ownerName = ownerName;
    this.contactNumber = contactNumber;
    this.email = email;
    this.password = password;
  }

   Fleet_Owner.withoutOwnerName(String companyName, String address, String city, String pin, String state, String phone, String pan, String gst)
  {
    this.companyName = companyName;
    this.address = address;
    this.city = city;
    this.pin = pin;
    this.state = state;
    this.phone = phone;
    this.pan = pan;
    this.gst = gst;
  }




}
