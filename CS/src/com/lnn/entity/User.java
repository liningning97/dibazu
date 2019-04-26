package com.lnn.entity;
import java.util.Date;
public class User {
   private int uid;
   private String uname;
   private String upass;
   private int age;
   private Date birthday;
public int getUid() {
	return uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
public String getUpass() {
	return upass;
}
public void setUpass(String upass) {
	this.upass = upass;
}
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
public Date getBirthday() {
	return birthday;
}
public void setBirthday(Date birthday) {
	this.birthday = birthday;
}
@Override
public String toString() {
	return "User [uid=" + uid + ", uname=" + uname + ", upass=" + upass + ", age=" + age + ", birthday=" + birthday
			+ "]";
}
   

}

