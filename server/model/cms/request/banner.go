package request

import "server/model/common/request"

type BannerParams struct {
	Title    string `json:"title"`     // 标题
	Type     string `json:"type"`      // 类型
	FileName string `json:"file_name"` // Banner图ID
	URL      string `json:"url"`       // 跳转URL
}

// BannerSearchParams banner搜索参数
type BannerSearchParams struct {
	request.PageInfo
	Title string `json:"title"`
}

// EditBannerParams banner编辑参数
type EditBannerParams struct {
	Id uint `json:"id"`
	BannerParams
}
