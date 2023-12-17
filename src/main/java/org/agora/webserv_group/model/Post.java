package org.agora.webserv_group.model;

import lombok.Data;

import java.sql.Date;
import java.util.ArrayList;

@Data
public class Post {
    private int pid;
    private String writer;
    private int capacity;
    private ArrayList<String> people;
    private String created_at;
    private String updated_at;
    private String category;
    private String title;
    private String introduction;
    private String content;
    private String location;
    private Boolean is_end;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public ArrayList<String> getPeople() {
		return people;
	}
	public void setPeople(ArrayList<String> people) {
		this.people = people;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Boolean getIs_end() {
		return is_end;
	}
	public void setIs_end(Boolean is_end) {
		this.is_end = is_end;
	}
}