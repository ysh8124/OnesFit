package osf.spring.dto;

import java.sql.Timestamp;

public class ReviewDTO {
   private int bno;
   private int pseq;
   private String img;
   private String title;
   private String content;
   private String writer;
   private Timestamp write_date;
   
   public ReviewDTO() {}
   public ReviewDTO(int bno, int pseq, String img, String title, String content, String writer, Timestamp write_date) {
      super();
      this.bno = bno;
      this.pseq = pseq;
      this.img = img;
      this.title = title;
      this.content = content;
      this.writer = writer;
      this.write_date = write_date;
   }


   public int getBno() {
      return bno;
   }

   public void setBno(int bno) {
      this.bno = bno;
   }

   public int getPseq() {
      return pseq;
   }

   public void setPseq(int pseq) {
      this.pseq = pseq;
   }

   public String getImg() {
      return img;
   }

   public void setImg(String img) {
      this.img = img;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public String getWriter() {
      return writer;
   }

   public void setWriter(String writer) {
      this.writer = writer;
   }

   public Timestamp getWrite_date() {
      return write_date;
   }

   public void setWrite_date(Timestamp write_date) {
      this.write_date = write_date;
   }  
}