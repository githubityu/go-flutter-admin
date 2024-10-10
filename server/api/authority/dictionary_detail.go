package authority

import (
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
	"server/global"
	"server/model/authority"
	authorityReq "server/model/authority/request"
	"server/model/common/response"
	commonRes "server/model/common/response"
)

type DictionaryDetailApi struct{}

// CreateSysDictionaryDetail
// @Tags      SysDictionaryDetail
// @Summary   创建SysDictionaryDetail
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      authority.SysDictionaryDetail     true  "SysDictionaryDetail模型"
// @Success   200   {object}  response.Response{msg=string}  "创建SysDictionaryDetail"
// @Router    /sysDictionaryDetail/createSysDictionaryDetail [post]
func (s *DictionaryDetailApi) CreateSysDictionaryDetail(c *gin.Context) {
	var detail authority.SysDictionaryDetail
	err := c.ShouldBindJSON(&detail)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	err = dictionaryDetailService.CreateSysDictionaryDetail(detail)
	if err != nil {
		global.TD27_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
		return
	}
	response.OkWithMessage("创建成功", c)
}

// DeleteSysDictionaryDetail
// @Tags      SysDictionaryDetail
// @Summary   删除SysDictionaryDetail
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      authority.SysDictionaryDetail     true  "SysDictionaryDetail模型"
// @Success   200   {object}  response.Response{msg=string}  "删除SysDictionaryDetail"
// @Router    /sysDictionaryDetail/deleteSysDictionaryDetail [post]
func (s *DictionaryDetailApi) DeleteSysDictionaryDetail(c *gin.Context) {
	var detail authority.SysDictionaryDetail
	err := c.ShouldBindJSON(&detail)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	err = dictionaryDetailService.DeleteSysDictionaryDetail(detail)
	if err != nil {
		global.TD27_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
		return
	}
	response.OkWithMessage("删除成功", c)
}

// UpdateSysDictionaryDetail
// @Tags      SysDictionaryDetail
// @Summary   更新SysDictionaryDetail
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      authority.SysDictionaryDetail     true  "更新SysDictionaryDetail"
// @Success   200   {object}  response.Response{msg=string}  "更新SysDictionaryDetail"
// @Router    /sysDictionaryDetail/updateSysDictionaryDetail [post]
func (s *DictionaryDetailApi) UpdateSysDictionaryDetail(c *gin.Context) {
	var sysDictionaryDetailReq authorityReq.EditSysDictionaryDetailReq
	err := c.ShouldBindJSON(&sysDictionaryDetailReq)
	if err != nil {
		response.FailReq(err.Error(), c)
		return
	}
	if err = dictionaryDetailService.UpdateSysDictionaryDetail(sysDictionaryDetailReq); err != nil {
		commonRes.FailWithMessage(err.Error(), c)
	} else {
		commonRes.OkWithMessage("添加成功", c)
	}

}

// FindSysDictionaryDetail
// @Tags      SysDictionaryDetail
// @Summary   用id查询SysDictionaryDetail
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  query     authority.SysDictionaryDetail                                 true  "用id查询SysDictionaryDetail"
// @Success   200   {object}  response.Response{data=map[string]interface{},msg=string}  "用id查询SysDictionaryDetail"
// @Router    /sysDictionaryDetail/findSysDictionaryDetail [post]
func (s *DictionaryDetailApi) FindSysDictionaryDetail(c *gin.Context) {
	var detail authority.SysDictionaryDetail
	if err := c.ShouldBindJSON(&detail); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	reSysDictionaryDetail, err := dictionaryDetailService.GetSysDictionaryDetail(detail.ID)
	if err != nil {
		global.TD27_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
		return
	}
	response.OkWithDetailed(gin.H{"reSysDictionaryDetail": reSysDictionaryDetail}, "查询成功", c)
}

// GetSysDictionaryDetailList
// @Tags      SysDictionaryDetail
// @Summary   分页获取SysDictionaryDetail列表
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  query     request.SysDictionaryDetailSearch                       true  "页码, 每页大小, 搜索条件"
// @Success   200   {object}  response.Response{data=response.PageResult,msg=string}  "分页获取SysDictionaryDetail列表,返回包括列表,总数,页码,每页数量"
// @Router    /sysDictionaryDetail/getSysDictionaryDetailList [post]
func (s *DictionaryDetailApi) GetSysDictionaryDetailList(c *gin.Context) {
	var pageInfo authorityReq.SysDictionaryDetailSearch
	err := c.ShouldBindJSON(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	list, total, err := dictionaryDetailService.GetSysDictionaryDetailInfoList(pageInfo)
	if err != nil {
		global.TD27_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}
	response.OkWithDetailed(response.PageResult{
		List:     list,
		Total:    total,
		Page:     pageInfo.Page,
		PageSize: pageInfo.PageSize,
	}, "获取成功", c)
}
