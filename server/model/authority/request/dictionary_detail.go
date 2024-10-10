package request

import (
	"server/model/authority"
	"server/model/common/request"
)

type SysDictionaryDetailSearch struct {
	authority.SysDictionaryDetail
	request.PageInfo
}

// SysDictionaryDetail  更新字典项的数据
type SysDictionaryDetail struct {
	Label           string `json:"label" form:"label"`   // 展示值
	Value           string `json:"value" form:"value"`   // 字典值
	Extend          string `json:"extend" form:"extend"` // 扩展值
	Status          *bool  `json:"status" form:"status"` // 启用状态
	Sort            int    `json:"sort" form:"sort"`     // 排序标记
	SysDictionaryID int    `json:"sysDictionaryID"`      // 关联标记
}

type EditSysDictionaryDetailReq struct {
	ID uint `json:"id" binding:"required"` // 菜单ID
	SysDictionaryDetail
}
