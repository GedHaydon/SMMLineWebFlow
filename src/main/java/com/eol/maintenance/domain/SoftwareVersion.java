package com.eol.maintenance.domain;
import java.util.ArrayList;
import java.util.List;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.OrderColumn;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class SoftwareVersion {

    /**
     */
    @Size(max = 31)
    private String dtype;

    private Integer majorVersion;

    private Integer minorVersion;

    private Boolean currentVersion;

    private Boolean incompleteVersion;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "softwareVersion")
    @OrderColumn(name = "idx")
    //	@BatchSize(size = 200)
    //	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    private List<SMMGroup> smmGroups = new ArrayList<SMMGroup>();

    @NotNull
    private Long uuid;

   
}
