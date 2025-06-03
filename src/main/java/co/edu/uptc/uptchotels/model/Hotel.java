package co.edu.uptc.uptchotels.model;

public class Hotel {
    private String name;
    private String city;
    private String address;
    private String phone;
    private String email;
    private int roomCapacity;
    private boolean status;

    public Hotel() {

    }

    public Hotel(String address, String city, String email, String name, String phone, int roomCapacity, boolean state) {
        this.address = address;
        this.city = city;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.roomCapacity = roomCapacity;
        this.status = state;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRoomCapacity() {
        return roomCapacity;
    }

    public void setRoomCapacity(int roomCapacity) {
        this.roomCapacity = roomCapacity;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean state) {
        this.status = state;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Hotel{");
        sb.append("name=").append(name);
        sb.append(", city=").append(city);
        sb.append(", address=").append(address);
        sb.append(", phone=").append(phone);
        sb.append(", email=").append(email);
        sb.append(", roomCapacity=").append(roomCapacity);
        sb.append(", state=").append(status);
        sb.append('}');
        return sb.toString();
    }

}
