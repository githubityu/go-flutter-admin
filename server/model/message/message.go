package message

import "server/global"

type MessageModel struct {
	global.TD27_MODEL
	Content  string `json:"content" gorm:"type:text;comment:'消息内容'"`
	Receiver string `json:"receiver" gorm:"type:varchar(64);comment:'接收者'"`
	State    string `json:"state" gorm:"type:varchar(32);comment:'消息类型,0:初始,1:成功,2:失败'"`
	TplCode  string `json:"tpl_code" gorm:"type:varchar(32);comment:'模板编码'"`
	Type     string `json:"type" gorm:"type:varchar(32);comment:'消息类型,0:短信,1:邮件'"`
}
