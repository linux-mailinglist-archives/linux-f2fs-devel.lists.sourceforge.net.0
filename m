Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4358820F364
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2020 13:08:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqE88-00079Y-O1; Tue, 30 Jun 2020 11:08:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jiayang5@huawei.com>) id 1jqE88-00079M-0O
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 11:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fse4k+/fs2blFM1/fZA3xPiGtCIKWPHJSlPv89M6u+I=; b=KLHUaMppYyGe7QUBLPk7JRXjf2
 LvX5KlwdTJzLVmbP8Q4B4tqMs6Tn/OqvKDbWtnHujIEWt5h9A1Gnm9Zo5n2Eq2I/mLiewKBiiNlAZ
 3wITtkEztKmcvZl9qzSk2TaclidkgT3xcBp+JQ1mYzRW0kfVzyaSOl8VgYdXazEBTZ7U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fse4k+/fs2blFM1/fZA3xPiGtCIKWPHJSlPv89M6u+I=; b=fC0G7hBMoLS+nWMp5/LVMOkgIq
 ldRRzf5MWZWmiO3nXFw4vSDj0azKl92/YR+b0riZvmFcFFAlK1xiWuMKjJSd/U/YCWEql4D6X56vy
 HyHi4kwcts+AXj2KfcTMG/bWjD+sH0KchLbJKcdHMyKYz3cJEtdt32DHvnVcG8qkIgu8=;
Received: from szxga01-in.huawei.com ([45.249.212.187] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqE85-007E0r-MQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 11:08:47 +0000
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 5D464BA4A7C100DB7472;
 Tue, 30 Jun 2020 19:08:36 +0800 (CST)
Received: from dggeme719-chm.china.huawei.com (10.1.199.115) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Tue, 30 Jun 2020 19:08:36 +0800
Received: from [10.174.177.240] (10.174.177.240) by
 dggeme719-chm.china.huawei.com (10.1.199.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Tue, 30 Jun 2020 19:08:35 +0800
To: Chao Yu <yuchao0@huawei.com>, <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20200630044504.24148-1-jiayang5@huawei.com>
 <53ec5160-3d0f-970c-f146-d36a957f599e@huawei.com>
From: Jia Yang <jiayang5@huawei.com>
Message-ID: <9d19b1eb-de98-b75b-b36d-33b225581eba@huawei.com>
Date: Tue, 30 Jun 2020 19:07:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <53ec5160-3d0f-970c-f146-d36a957f599e@huawei.com>
X-Originating-IP: [10.174.177.240]
X-ClientProxiedBy: dggeme708-chm.china.huawei.com (10.1.199.104) To
 dggeme719-chm.china.huawei.com (10.1.199.115)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqE85-007E0r-MQ
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unused parameter in
 f2fs_get_read_data_page()
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



> On 2020/6/30 12:45, Jia Yang wrote:
>> The parameter "op_flags" is not used in f2fs_get_read_data_page(),
>> so it can be removed.
> 
> I don't think so, there is one missing case as below, in where op_flag
> was set incorrectly in f2fs_grab_read_bio(), we need to add one more
> parameter to pass op_flag value.
> 
> - gc_data_segment
>  - f2fs_get_read_data_page(.., op_flag = REQ_RAHEAD,..)
>   - f2fs_submit_page_read
>    - f2fs_grab_read_bio(.., op_flag = 0, ..)
> 

Thanks for your suggestion, I will submit a new patch later
as you suggested.

>>
>> Signed-off-by: Jia Yang <jiayang5@huawei.com>
>> ---
>>  fs/f2fs/data.c | 6 +++---
>>  fs/f2fs/f2fs.h | 2 +-
>>  fs/f2fs/gc.c   | 2 +-
>>  3 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 326c63879ddc..f1b85185e9df 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -1157,7 +1157,7 @@ int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index)
>>  }
>>  
>>  struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
>> -						int op_flags, bool for_write)
>> +						bool for_write)
>>  {
>>  	struct address_space *mapping = inode->i_mapping;
>>  	struct dnode_of_data dn;
>> @@ -1237,7 +1237,7 @@ struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index)
>>  		return page;
>>  	f2fs_put_page(page, 0);
>>  
>> -	page = f2fs_get_read_data_page(inode, index, 0, false);
>> +	page = f2fs_get_read_data_page(inode, index, false);
>>  	if (IS_ERR(page))
>>  		return page;
>>  
>> @@ -1263,7 +1263,7 @@ struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
>>  	struct address_space *mapping = inode->i_mapping;
>>  	struct page *page;
>>  repeat:
>> -	page = f2fs_get_read_data_page(inode, index, 0, for_write);
>> +	page = f2fs_get_read_data_page(inode, index, for_write);
>>  	if (IS_ERR(page))
>>  		return page;
>>  
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index b35a50f4953c..41ef50714a39 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -3441,7 +3441,7 @@ int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index);
>>  int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from);
>>  int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index);
>>  struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
>> -			int op_flags, bool for_write);
>> +			bool for_write);
>>  struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index);
>>  struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
>>  			bool for_write);
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> index 5b95d5a146eb..487f75d9136c 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -1094,7 +1094,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>>  			}
>>  
>>  			data_page = f2fs_get_read_data_page(inode,
>> -						start_bidx, REQ_RAHEAD, true);
>> +						start_bidx, true);
>>  			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>>  			if (IS_ERR(data_page)) {
>>  				iput(inode);
>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
