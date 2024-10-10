package cms

import "server/global"

// BannerModel represents the structure of the cms_banner table.
type BannerModel struct {
	global.TD27_MODEL
	Title    string `json:"title" gorm:"not null;comment:'标题'"`   // 标题
	Type     string `json:"type" gorm:"not null;comment:'类型'"`    // 类型
	FileName string `json:"file_name" gorm:"comment:'banner图id'"` // Banner图ID
	URL      string `json:"url" gorm:"comment:'点击banner跳转到url'"`  // 跳转URL
}

func (BannerModel) TableName() string {
	return "cms_banner"
}
