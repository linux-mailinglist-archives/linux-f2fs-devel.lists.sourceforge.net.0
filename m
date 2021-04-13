Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F78B35D60B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Apr 2021 05:42:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lW9w9-000584-OB; Tue, 13 Apr 2021 03:42:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lW9w7-00057p-Hu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Apr 2021 03:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1NsroNjFhU/EHgqd07PyJ6jygOH9ZDh2QhLRfs7gY10=; b=M8tXaA6Vpt2HGlIPbXMrfVmKb0
 LDU6PNn+KcHYX5uvTnY1PCVPylHaiOzl3ZLyYoK4FZLaO9CzXT3w1x+lLA/6S5lXseBt8Uv68Vs/4
 pW5WxS6PlC9fkoU1IQSelZGRTTgYHPgA8t4c1PKwv4LmN0aGB1vH2Fq/yy5CnHcnejgc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1NsroNjFhU/EHgqd07PyJ6jygOH9ZDh2QhLRfs7gY10=; b=aj1qpMadF6+eB2N1CDU5a7jxq2
 ZynoeKKdpgk8rO967wPBy1qwfY58bSiM+dQCpiU6Zkv9WSR7ld/O8kVuQXWGi2LYj4/DK1Atdo25L
 LHXFbEZzRMWeqMftBjeBB1E9iOXkjCqngcnB07J7+OmKIHZjLU584RVVTibZf5F84vJI=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lW9vx-00DWma-Ih
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Apr 2021 03:42:00 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FKBF05FMCzlXVc;
 Tue, 13 Apr 2021 11:39:48 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 13 Apr
 2021 11:41:32 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210412081512.103592-1-yuchao0@huawei.com>
 <YHUPjDY9ifsffk4z@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <1171d722-8810-998c-e4b3-0845dbbdea19@huawei.com>
Date: Tue, 13 Apr 2021 11:41:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YHUPjDY9ifsffk4z@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lW9vx-00DWma-Ih
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to keep isolation of atomic
 write
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/4/13 11:27, Jaegeuk Kim wrote:
> On 04/12, Chao Yu wrote:
>> As Yi Chen reported, there is a potential race case described as below:
>>
>> Thread A			Thread B
>> - f2fs_ioc_start_atomic_write
>> 				- mkwrite
>> 				 - set_page_dirty
>> 				  - f2fs_set_page_private(page, 0)
>>   - set_inode_flag(FI_ATOMIC_FILE)
>> 				- mkwrite same page
>> 				 - set_page_dirty
>> 				  - f2fs_register_inmem_page
>> 				   - f2fs_set_page_private(ATOMIC_WRITTEN_PAGE)
>> 				     failed due to PagePrivate flag has been set
>> 				   - list_add_tail
>> 				- truncate_inode_pages
>> 				 - f2fs_invalidate_page
>> 				  - clear page private but w/o remove it from
>> 				    inmem_list
>> 				 - set page->mapping to NULL
>> - f2fs_ioc_commit_atomic_write
>>   - __f2fs_commit_inmem_pages
>>     - __revoke_inmem_pages
>>      - f2fs_put_page panic as page->mapping is NULL
>>
>> The root cause is we missed to keep isolation of atomic write in the case
>> of start_atomic_write vs mkwrite, let start_atomic_write helds i_mmap_sem
>> lock to avoid this issue.
> 
> My only concern is performance regression. Could you please verify the numbers?

Do you have specific test script?

IIRC, the scenario you mean is multi-threads write/mmap the same db, right?

Thanks,

> 
>>
>> Reported-by: Yi Chen <chenyi77@huawei.com>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>> v3:
>> - rebase to last dev branch
>> - update commit message because this patch fixes a different racing issue
>> of atomic write
>>   fs/f2fs/file.c    | 3 +++
>>   fs/f2fs/segment.c | 6 ++++++
>>   2 files changed, 9 insertions(+)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index d697c8900fa7..6284b2f4a60b 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -2054,6 +2054,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>>   		goto out;
>>   
>>   	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>> +	down_write(&F2FS_I(inode)->i_mmap_sem);
>>   
>>   	/*
>>   	 * Should wait end_io to count F2FS_WB_CP_DATA correctly by
>> @@ -2064,6 +2065,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>>   			  inode->i_ino, get_dirty_pages(inode));
>>   	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
>>   	if (ret) {
>> +		up_write(&F2FS_I(inode)->i_mmap_sem);
>>   		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>>   		goto out;
>>   	}
>> @@ -2077,6 +2079,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>>   	/* add inode in inmem_list first and set atomic_file */
>>   	set_inode_flag(inode, FI_ATOMIC_FILE);
>>   	clear_inode_flag(inode, FI_ATOMIC_REVOKE_REQUEST);
>> +	up_write(&F2FS_I(inode)->i_mmap_sem);
>>   	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>>   
>>   	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 0cb1ca88d4aa..78c8342f52fd 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -325,6 +325,7 @@ void f2fs_drop_inmem_pages(struct inode *inode)
>>   	struct f2fs_inode_info *fi = F2FS_I(inode);
>>   
>>   	do {
>> +		down_write(&F2FS_I(inode)->i_mmap_sem);
>>   		mutex_lock(&fi->inmem_lock);
>>   		if (list_empty(&fi->inmem_pages)) {
>>   			fi->i_gc_failures[GC_FAILURE_ATOMIC] = 0;
>> @@ -339,11 +340,13 @@ void f2fs_drop_inmem_pages(struct inode *inode)
>>   			spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
>>   
>>   			mutex_unlock(&fi->inmem_lock);
>> +			up_write(&F2FS_I(inode)->i_mmap_sem);
>>   			break;
>>   		}
>>   		__revoke_inmem_pages(inode, &fi->inmem_pages,
>>   						true, false, true);
>>   		mutex_unlock(&fi->inmem_lock);
>> +		up_write(&F2FS_I(inode)->i_mmap_sem);
>>   	} while (1);
>>   }
>>   
>> @@ -468,6 +471,7 @@ int f2fs_commit_inmem_pages(struct inode *inode)
>>   	f2fs_balance_fs(sbi, true);
>>   
>>   	down_write(&fi->i_gc_rwsem[WRITE]);
>> +	down_write(&F2FS_I(inode)->i_mmap_sem);
>>   
>>   	f2fs_lock_op(sbi);
>>   	set_inode_flag(inode, FI_ATOMIC_COMMIT);
>> @@ -479,6 +483,8 @@ int f2fs_commit_inmem_pages(struct inode *inode)
>>   	clear_inode_flag(inode, FI_ATOMIC_COMMIT);
>>   
>>   	f2fs_unlock_op(sbi);
>> +
>> +	up_write(&F2FS_I(inode)->i_mmap_sem);
>>   	up_write(&fi->i_gc_rwsem[WRITE]);
>>   
>>   	return err;
>> -- 
>> 2.29.2
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
