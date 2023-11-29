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
}