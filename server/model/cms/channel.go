package cms

import "server/global"

// ChannelModel represents the structure of the cms_channel table.
type ChannelModel struct {
	global.TD27_MODEL
	Code string `json:"code" gorm:"not null;comment:'编码'"` // 编码
	Name string `json:"name" gorm:"not null;comment:'名称'"` // 名称
}

func (ChannelModel) TableName() string {
	return "cms_channel"
}
