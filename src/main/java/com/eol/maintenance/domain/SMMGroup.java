package com.eol.maintenance.domain;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.TableGenerator;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import com.eol.maintenance.domain.IdGenerator;
import com.eol.maintenance.domain.SMMGroup;
import com.eol.maintenance.domain.SoftwareVersion;

@RooJpaActiveRecord(finders = { "findSMMGroupsByNameLike" })
public class SMMGroup {

	@Id
	@TableGenerator(name = "tg", table = "hibernate_sequences", pkColumnName = "sequence_name", pkColumnValue = "smmgroup", valueColumnName = "sequence_next_hi_value", allocationSize = 100)
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "tg")
	@Column(name = "id")
	private Long id;

	public SMMGroup() {
		this.uuid = IdGenerator.createUUID();
		// TODO Idx is generated at th emoment - how do we get it
		this.idx = 999L;
	}

	/**
     */
	// @OneToMany(cascade = CascadeType.ALL, mappedBy = "smmGroup")
	// @OrderColumn(name = "idx")
	// private List<SMMLine> smmLines = new ArrayList<SMMLine>();
	private Long idx;

	/**
     */
	@NotNull
	@Size(max = 255)
	private String name;

	/**
     */
	@ManyToOne
	@NotNull
	private SoftwareVersion softwareVersion;

	/**
     */
	@NotNull
	private Long uuid;

	/**
     */
	private Byte includeAsLumpSum;

	/**
     */
	private Double overhead;

	/**
     */
	private Double profit;

	/**
     */
	private Double labourTotal;

	/**
     */
	private Double materialTotal;

	/**
     */
	private Byte pcSum;
	
    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public Long getUuid() {
        return this.uuid;
    }
    
    public void setUuid(Long uuid) {
        this.uuid = uuid;
    } 
    
 
	
	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof SMMGroup)) {
			return false;
		}
		if (this.getId() == null) {
			return this == obj;
		} else {
			return this.getId() == ((SMMGroup) obj).getId();
		}
	}

	@Override
	public int hashCode() {
		return new HashCodeBuilder().append(this.getUuid()).toHashCode();
	}
}
