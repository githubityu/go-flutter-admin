package authority

type RouterGroup struct {
	UserRouter
	RoleRouter
	MenuRouter
	ApiRouter
	DictionaryDetailRouter
	DictionaryRouter
}
