package osf.spring.dto;

public class OrderDTO {
   private int oseq;
   private String id;
   private int usepoint;
   private int amount;
   
   public OrderDTO() {}
   
   public OrderDTO(int oseq, String id, int usepoint, int amount) {
      super();
      this.oseq = oseq;
      this.id = id;
      this.usepoint = usepoint;
      this.amount = amount;
   }
   public int getOseq() {
      return oseq;
   }
   public void setOseq(int oseq) {
      this.oseq = oseq;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public int getUsepoint() {
      return usepoint;
   }
   public void setUsepoint(int usepoint) {
      this.usepoint = usepoint;
   }
   public int getAmount() {
      return amount;
   }
   public void setAmount(int amount) {
      this.amount = amount;
   }
   
   
}