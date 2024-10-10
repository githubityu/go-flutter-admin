package cms

import (
	"github.com/gin-gonic/gin"
	"server/model/cms/request"
	commonReq "server/model/common/request"
	"server/model/common/response"
)

type ChannelApi struct {
}

// AddChannel 新增栏目
// @Tags      ChannelApi
// @Summary   创建
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.ChannelParams true "请求参数"
// @Success   200   {object}  response.Response{msg=string}
// @Router    /channel/addChannel [post]
func (ca *ChannelApi) AddChannel(ctx *gin.Context) {
	var model request.ChannelParams
	if err := ctx.ShouldBindJSON(&model); err != nil {
		response.FailReq(err.Error(), ctx)
		return
	}
	if ok := channelService.AddChannel(model); !ok {
		response.Fail(ctx)
	} else {
		response.Ok(ctx)
	}
}

// EditChannel 编辑栏目
// @Tags      ChannelApi
// @Summary   创建
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.EditChannel true "请求参数"
// @Success   200   {object}  response.Response{msg=string}
// @Router    /channel/editChannel [post]
func (ca *ChannelApi) EditChannel(ctx *gin.Context) {
	var model request.EditChannel
	if err := ctx.ShouldBindJSON(&model); err != nil {
		response.FailReq(err.Error(), ctx)
		return
	}
	if err := channelService.EditChannel(model); err != nil {
		response.Fail(ctx)
	} else {
		response.Ok(ctx)
	}
}

// GetChannelList 获取列表
// @Tags      ChannelApi
// @Summary   创建
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.ChannelSearchParams true "请求参数"
// @Success   200   {object}  response.Response{msg=string}
// @Router    /channel/getChannelList [post]
func (ca *ChannelApi) GetChannelList(ctx *gin.Context) {
	var params request.ChannelSearchParams
	if err := ctx.ShouldBindQuery(&params); err != nil {
		response.FailReq(err.Error(), ctx)
		return
	}
	if list, total, err := channelService.GetChannelList(params); err != nil {
		response.FailReq(err.Error(), ctx)
	} else {
		response.OkWithDetailed(response.PageResult{
			List:     list,
			Total:    total,
			Page:     params.Page,
			PageSize: params.PageSize,
		}, "获取成功", ctx)
	}
}

// DeleteById 删除栏目
// @Tags      ChannelApi
// @Summary   创建
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      commonReq.CId true "请求参数"
// @Success   200   {object}  response.Response{msg=string}
// @Router    /channel/deleteById [post]
func (ca *ChannelApi) DeleteById(ctx *gin.Context) {
	var model commonReq.CId
	if err := ctx.ShouldBindJSON(&model); err != nil {
		response.FailReq(err.Error(), ctx)
		return
	}
	if err := channelService.DeleteByeId(model.ID); err != nil {
		response.Fail(ctx)
	} else {
		response.Ok(ctx)
	}
}
