package osf.spring.dto;

public class OptionDTO {
   private int parent_seq;
   private String color;
   private String psize;
   private int item_count;
   
   public OptionDTO() {}

   public OptionDTO(int parent_seq, String color, String psize, int item_count) {
      super();
      this.parent_seq = parent_seq;
      this.color = color;
      this.psize = psize;
      this.item_count = item_count;
   }

   public int getParent_seq() {
      return parent_seq;
   }

   public void setParent_seq(int parent_seq) {
      this.parent_seq = parent_seq;
   }

   public String getColor() {
      return color;
   }

   public void setColor(String color) {
      this.color = color;
   }

   public String getPsize() {
      return psize;
   }

   public void setPsize(String psize) {
      this.psize = psize;
   }

   public int getItem_count() {
      return item_count;
   }

   public void setItem_count(int item_count) {
      this.item_count = item_count;
   }
   
   
}