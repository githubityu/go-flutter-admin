package request

import "server/model/common/request"

// Article  添加
type Article struct {
	IDChannel uint64 `json:"id_channel" binding:"required"`
	Title     string `json:"title" binding:"required"`
	Content   string `json:"content" binding:"required"`
	Author    string `json:"author" `
	Img       string `json:"img" `
}

// EditArticle  编辑
type EditArticle struct {
	ID uint `json:"id" binding:"required"` // 菜单ID
	Article
}

// ArticleSearchParams 标题 作者 发布开始时间 发布结束时间 搜索 参数可以为空
type ArticleSearchParams struct {
	Title  string `json:"title"`
	Author string `json:"author"`
	End    string `json:"end"`
	Start  string `json:"start"`
	request.PageInfo
}
