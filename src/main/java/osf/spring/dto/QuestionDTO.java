package osf.spring.dto;

import java.sql.Timestamp;

public class QuestionDTO {
   private int bno;
   private int pseq;
   private String title;
   private String content;
   private String writer;
   private Timestamp write_date;
   private String answer_yn;
   
   public QuestionDTO() {}
   public QuestionDTO(int bno, int pseq, String title, String content, String writer, Timestamp write_date,
         String answer_yn) {
      super();
      this.bno = bno;
      this.pseq = pseq;
      this.title = title;
      this.content = content;
      this.writer = writer;
      this.write_date = write_date;
      this.answer_yn = answer_yn;
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
   public String getAnswer_yn() {
      return answer_yn;
   }
   public void setAnswer_yn(String answer_yn) {
      this.answer_yn = answer_yn;
   }
   
   
   
   
}