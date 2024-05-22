package com.green.jobhunter.entity;

import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
public class Csreply{
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long csr_code;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="cscode")
    @ToString.Exclude
    private Cs cscode;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="writermanager")
    @ToString.Exclude
    private Member writermanager;

    @Column(length = 500)
    private String comment;
	@Column(columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP", nullable = false)
    private LocalDate localdate;

}