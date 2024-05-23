package com.green.jobhunter.entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CoverLetter{
   @Id
   @GeneratedValue(strategy=GenerationType.IDENTITY)
   private Long clcode;
   
   @ManyToOne(cascade = CascadeType.ALL)
   @JoinColumn(name="resumecode")
   @ToString.Exclude
   private Resume resumecode;


   @Column(length = 1000)
   private String growth;
   
   @Column(length = 1000)
   private String motive;

   
   @Column(length = 1000)
   private String prosAndCons;
   
}