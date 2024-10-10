package router

import (
	"server/router/authority"
	"server/router/base"
	"server/router/cms"
	"server/router/fileM"
	"server/router/monitor"
	"server/router/sysTool"
)

type RouterGroup struct {
	Base      base.RouterGroup
	Authority authority.RouterGroup
	FileM     fileM.RouterGroup
	Monitor   monitor.RouterGroup
	SysTool   sysTool.RouterGroup
	CMS       cms.RouterGroup
}

var RouterGroupApp = new(RouterGroup)
