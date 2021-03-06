


账号   销售员Id    销售团队ID      分成比例    


账号   销售员Id    销售团队ID      分成比例     年份   月份


账号消费表
saleId  teamId   消费记录   账号   时间


业绩统计表(每月) :　表示的是每个销售每月的业绩
saleId  teamId   业绩  时间(月份)


返佣规则 : 
账号id,产品id, 返佣金额(业绩*返佣比列),时间(精确到月份)


思考 : 统计型数据 ,实时性要求不高,可以设置计划任务,同时还需设置手动触发,用于核算
	   常用的搜索条件,设置索引,提高查询效率(注意索引不生效bug)


业绩计算 :

账号业绩归属 : 
	(暂定每月生效一次,按月确定账号归属)
	
	1. 根据月份,和账号ID,找到该账号的归属配置
	2. 如果团队ID为-1,则表示业绩归属个人,直接的得出个人业绩
	3. 如果团队ID不为-1 ,则表示业绩归属团队,按分成比例计算个人的业绩
	
	
	
每天业绩计算 : 
	(参数 : saleId, TeamId, date  账号  输出 : ..........    )
	(可以是计划性任务,比如每天导入消费数据后,自动计算,看数据库中有没有每天业绩表,有的话可以计划))
	1.在账号消费表中
	  统计个人当天业绩情况 ------------->根据saleId分组统计汇总
	  统计团队当天业绩情况 -------------> 根据TeamId分组统计汇总
	  统计当天总业绩 ----------> 求和汇总
	  统计某个产品产生的业绩(产品竞争力,行情分析)-------->根据产品分组统计
	  统计某个账号/某家公司产生的业绩(方便回访,加强合作,发展对象等等)---------> 根据账号/公司名分组统计(不是ID的话,匹配可能对不上,造成数据不正确)

	  
	  
月份业绩计算 :  
	(参数 : saleId , TeamId, date  输出 : ...........   )
	(可以是计划性任务,比如每月最后一天12点,自动计算这些数据,而不是前端发出某个请求时去计算)
    (一个阿里云账号,每个月一个账号的业务只属于一个人吗?  是的)
	
	
	1.在账号消费表中,
	  根据月份统计每一个账号的消费记录  ------------>分组统计,得到每个账号的消费汇总数据(账号ID , 消费)
	  
	2.在账号业绩归属配置生效表中
	  根据月份,账号ID ,找到账号归属---->saleId  teamId
	  如果团队ID为-1,则表示业绩归属个人,直接的得出个人业绩----------->业绩表对应saleId  业绩增加
	  如果团队ID不为-1 ,则表示业绩归属团队,按分成比例计算个人的业绩 ------->业绩表对应团队所有saleId  ,业绩增加
	  
	3.在月度业绩表中
	  统计每个人的总业绩---------->根据saleId分组统计汇总
	  统计团队业绩--------->根据TeamId 分组统计
	  统计总业绩----------> 直接求和
	  统计某个产品产生的业绩(产品竞争力,行情分析)-------->根据产品分组统计
	  统计某个账号/某家公司产生的业绩(方便回访等等)---------> 根据账号/公司名分组统计


	  
季度业绩计算 : 
	(看数据库是否有相应的记录表,有的话就计划性任务,没有就请求时计算)
	(参数 : saleId , TeamId, date  输出 : ...........)
	应该建立在月份业绩计算基础上
	1.在月度业绩表中
	  统计每个人的总业绩---------->根据saleId,date分组统计汇总
	  统计团队业绩--------->根据TeamId,date分组统计
	  统计总业绩----------> 根据date 直接求和
	  统计某个产品产生的业绩(产品竞争力,行情分析)-------->根据产品分组统计
	  统计某个账号/某家公司产生的业绩(方便回访等等)---------> 根据账号/公司名分组统计
	  
	  
年度业绩计算 :
	(看数据库是否有相应的记录表,有的话就计划性任务,没有就请求时计算)
	(参数 : saleId , TeamId, date  输出 : ...........)
	(应该建立在月份业绩计算基础上)
	1.在月度业绩表中
	  统计每个人的总业绩---------->根据saleId,date分组统计汇总
	  统计团队业绩--------->根据TeamId,date分组统计
	  统计总业绩----------> 根据date 直接求和
	  统计某个产品产生的业绩(产品竞争力,行情分析)-------->根据产品分组统计
	  统计某个账号/某家公司产生的业绩(方便回访等等)---------> 根据账号/公司名分组统计
	  
业绩核算 :
	1.重新计算业绩数据,意思除了计划任务外,还需设置手动触发
	2.与实际业绩进行核算,分析
	  
	  
业绩计算存在的问题 :
	1.账号业绩归属生效的确定? 
		是每月月初设置好,还是可以随时改动?
		每月月初设置好账号归属,允许管理员进行账号归属修改,以防止突发情况
	2.预付费和后付费(按量收费)不同情况下如何计算?
		首先,它们采用不同的excel表,分别导入,或者一起导入,解析后存在不同的数据库?
		预付费 :
		按量收费 :  计算规则应该是一样的
	
	  
	  
	  
	  
返佣 : 
	主要依据是返佣规则,不同的产品具有不同的返佣规则
	主要任务:
		1.根据沙盘数据,匹配返佣规则,计算返佣预算
		2.实际返佣数据的统计分析
		3.返佣预算和实际返佣的核算

	注意 : 实际返佣数据 是按月统计汇总后的金额，没有具体的消费时间
	
	
	
一 .返佣预算
	沙盘数据+返佣规则
	
		
	
	
	1.月度返佣预估 :
	
	  在账号消费表中 :
	  
	  账号消费表:账号------->查找账号详情表获取到账号的类型(新建,关联,项目报备)-------->
	  账号消费表:消费类型-------------------------------------------------------------->  查找返佣规则表------->获取到月度返佣,季度返佣--------->
	  账号消费表:产品------->查找产品表,是否返佣--------------------------------------->
	  
	  账号消费表:消费金额*月度返佣比例-------------------------------------------------> 每个账号每月返佣金额---------->月度账号返佣预估表
	   
	  个人月度返佣预算----->将消费记录表中的业绩额换成返佣额--->分组统计账号的返佣额---->匹配账号业绩归属---->每个销售每月的返佣总额------>产生月度返佣预算表
	  
	  
	  在业绩归属配置生效表中 :
	  根据时间,账号查出账号业归属 : 
	  	归属个人 :  返佣表中 对应的sale 个人增加返佣金额
		归属团队 :  返佣金额*分成比例   个人增加返佣金额
	 

	  团队月度返佣预算---------->以团队分组统计
	  月度总返佣数据------------>求和
	
	3.年度返佣预算
	   在月度返佣预算表中
	   个人
	   团队
	   总返佣额(利润,准确的说应该是营收)
	   某个公司产生的返佣额
	   
	   
	   
二 .实际返佣统计分析
	
	实际返佣表(月度)  账号,产品,返佣金额  
	
	核对过程 :
	 1.每个订单的预估返佣金额 和 每个订单实际返佣的金额  核算
	 
	
	 2.月度实际返佣金额
	   个人月度实际返佣金额-------------->分组统计账号的返佣金额---------->匹配账号业绩归属--------->每个销售每月实际返佣金额------>核对
	   团队月度返佣预算---------->没有表就SQL,再teamID
	   产品月度返佣预算----------->再产品ID
	   月度总返佣数据------------>统计总数
	
	 3.季度实际返佣金额
	 ......................
	 
	 
	
	
	
	
	
	
	
	
	