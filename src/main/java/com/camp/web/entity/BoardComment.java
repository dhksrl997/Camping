package com.camp.web.entity;

import java.util.Date;

public class BoardComment {
   
   private int id;
   private int boardId;
   private String writer;
   private String content;
   private Date regDate;
   private String pub;
   
   
   public BoardComment() {
      // TODO Auto-generated constructor stub
   }


   public BoardComment(int id, int boardId, String writer, String content, Date regDate, String pub) {
      super();
      this.id = id;
      this.boardId = boardId;
      this.writer = writer;
      this.content = content;
      this.regDate = regDate;
      this.pub = pub;
   }


   public int getId() {
      return id;
   }


   public void setId(int id) {
      this.id = id;
   }


   public int getBoardId() {
      return boardId;
   }


   public void setBoardId(int boardId) {
      this.boardId = boardId;
   }


   public String getWriter() {
      return writer;
   }


   public void setWriter(String writer) {
      this.writer = writer;
   }


   public String getContent() {
      return content;
   }


   public void setContent(String content) {
      this.content = content;
   }


   public Date getRegDate() {
      return regDate;
   }


   public void setRegDate(Date regDate) {
      this.regDate = regDate;
   }


   public String getPub() {
      return pub;
   }


   public void setPub(String pub) {
      this.pub = pub;
   }


   @Override
   public String toString() {
      return "BoardComment [id=" + id + ", boardId=" + boardId + ", writer=" + writer + ", content=" + content
            + ", regDate=" + regDate + ", pub=" + pub + "]";
   }
   
   
   
   
   
}