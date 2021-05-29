package dao;

import java.util.Date;

public class Board {
   
   private int b_idx;
   private int M_num;
   private int b_type;
   private String b_title;
   private String M_nickname;
   private Date b_regdate;
   private String b_content;
   private int b_count;
   private String b_img;
   private int b_notice;
   
   public int getB_idx() {
      return b_idx;
   }
   public void setB_idx(int b_idx) {
      this.b_idx = b_idx;
   }
   public int getM_num() {
      return M_num;
   }
   public void setM_num(int m_num) {
      M_num = m_num;
   }
   public int getB_type() {
      return b_type;
   }
   public void setB_type(int b_type) {
      this.b_type = b_type;
   }
   public String getB_title() {
      return b_title;
   }
   public void setB_title(String b_title) {
      this.b_title = b_title;
   }
   public String getM_nickname() {
      return M_nickname;
   }
   public void setM_nickname(String m_nickname) {
      M_nickname = m_nickname;
   }
   public Date getB_regdate() {
      return b_regdate;
   }
   public void setB_regdate(Date b_regdate) {
      this.b_regdate = b_regdate;
   }
   public String getB_content() {
      return b_content;
   }
   public void setB_content(String b_content) {
      this.b_content = b_content;
   }
   public int getB_count() {
      return b_count;
   }
   public void setB_count(int b_count) {
      this.b_count = b_count;
   }
   public String getB_img() {
      return b_img;
   }
   public void setB_img(String b_img) {
      this.b_img = b_img;
   }
   public int getB_notice() {
      return b_notice;
   }
   public void setB_notice(int b_notice) {
      this.b_notice = b_notice;
   }
   
   

}