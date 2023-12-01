package org.agora.webserv_group.model;

import lombok.Data;

import java.sql.Date;
import java.util.ArrayList;

@Data
public class Review {
    private int rid;
    private String title;
    private String content;
    private int score;  //별점

    private int pid;  //모임
    private int uid;  //작성자
}