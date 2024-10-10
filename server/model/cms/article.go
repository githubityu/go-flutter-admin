package cms

import "server/global"

// ArticleModel represents the structure of the cms_article table.
type ArticleModel struct {
	global.TD27_MODEL
	IDChannel uint64 `json:"id_channel" gorm:"not null;comment:栏目id"`
	Title     string `json:"title" gorm:"not null；comment:作者"`
	Content   string `json:"content" gorm:"not null;comment:内容"`
	Author    string `json:"author" gorm:"comment:作者"`
	Img       string `json:"img" gorm:"comment:文章题图ID"`
}

func (ArticleModel) TableName() string {
	return "cms_article"
}
