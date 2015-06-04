package com.eol.web;
import com.eol.maintenance.domain.SoftwareVersion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/softwareversions")
@Controller
@RooWebScaffold(path = "softwareversions", formBackingObject = SoftwareVersion.class)
public class SoftwareVersionController {
}
