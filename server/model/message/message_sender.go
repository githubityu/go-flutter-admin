package message

import "server/global"

type MessageSenderModel struct {
	global.TD27_MODEL
	ClassName string `json:"class_name" gorm:"type:varchar(64);comment:'发送类'"`
	Name      string `json:"name" gorm:"type:varchar(64);comment:'名称'"`
	TplCode   string `json:"tpl_code" gorm:"type:varchar(64);comment:'短信运营商模板编号'"`
}
