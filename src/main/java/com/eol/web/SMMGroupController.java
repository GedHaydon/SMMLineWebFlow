package com.eol.web;
import com.eol.maintenance.domain.SMMGroup;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/smmgroups")
@Controller
@RooWebScaffold(path = "smmgroups", formBackingObject = SMMGroup.class)
public class SMMGroupController {
}
