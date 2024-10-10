package cms

import "server/global"

type ContactsModel struct {
	global.TD27_MODEL
	Email    string `json:"email" gorm:"not null;comment:'电子邮箱'"`
	Mobile   string `json:"mobile" gorm:"not null;comment:'联系电话'"`
	Remark   string `json:"remark" gorm:"not null;comment:'备注'"`
	UserName string `json:"user_name" gorm:"comment:'邀约人名称'"`
}

func (ContactsModel) TableName() string {
	return "cms_contacts"
}
