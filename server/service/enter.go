package service

import (
	"server/service/authority"
	"server/service/base"
	"server/service/cms"
	"server/service/fileM"
	"server/service/monitor"
	"server/service/sysTool"
)

type ServiceGroup struct {
	Base      base.ServiceGroup
	Authority authority.ServiceGroup
	FileM     fileM.ServiceGroup
	Monitor   monitor.ServiceGroup
	SysTool   sysTool.ServiceGroup
	Cms       cms.ServiceGroup
}

var ServiceGroupApp = new(ServiceGroup)
