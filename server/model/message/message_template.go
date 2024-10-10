package message

import "server/global"

type MessageTemplateModel struct {
	global.TD27_MODEL
	Code            string `json:"code" gorm:"type:varchar(32);comment:'编号'"`
	Cond            string `json:"cond" gorm:"type:varchar(32);comment:'发送条件'"`
	Content         string `json:"content" gorm:"type:text;comment:'内容'"`
	IDMessageSender int64  `json:"id_message_sender" gorm:"type:bigint(20);not null;comment:'发送者id'"`
	Title           string `json:"title" gorm:"type:varchar(64);comment:'标题'"`
	Type            string `json:"type" gorm:"type:varchar(32);comment:'消息类型,0:短信,1:邮件'"`
}
