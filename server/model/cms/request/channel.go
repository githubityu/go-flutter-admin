package request

import "server/model/common/request"

type ChannelParams struct {
	Name string `json:"name" binding:"required"`
	Code string `json:"code"  binding:"required"`
}

type EditChannel struct {
	ChannelParams
	ID uint `json:"id" binding:"required"`
}

type ChannelSearchParams struct {
	request.PageInfo
	Code string `json:"code"`
}
