Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BAE2F73E7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Jan 2021 08:59:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l0K1I-00086G-HU; Fri, 15 Jan 2021 07:59:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l0K1E-000863-PA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 07:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GlxuiOISU+g5Ugg+4BmHL95EB3+vhi4+RGeFoT9waL8=; b=h39IIQzCylgZMS2cxp26CkwZIv
 4wHEeyArVlfiyPuNV5uSrdwryeboFEr+5bKOgSN2mHrPTB26SJ9vhLGXuT3pSSKpFv+MtzxpMC2F3
 t9ZZtXdsKsirxsyWX2zbUNpCev5KHL9+TthOzrlMsI6gP4UdXPz/YFjppznXCtuASB0o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GlxuiOISU+g5Ugg+4BmHL95EB3+vhi4+RGeFoT9waL8=; b=VPqkJ7r/Ly/zpLk/ALHa5WK5M9
 eaNthPsKiZ7oCbJSuJCaro0A/EVnKNnRwtOfUp4pUZzucWUStwsy/lXJ9w2E6MSMpEPDsaMwJwXSJ
 viOn/PCPvLJQHUCCa2rKqoYeyXLD1KFSvR+rmQIriOV55krUaEu/G3rbWhCgE0R20/IA=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l0K10-003r9w-Ph
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 07:59:40 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DHD7H0y3Nzl4xP;
 Fri, 15 Jan 2021 15:57:47 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 15 Jan
 2021 15:59:03 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20201230075557.108818-1-yuchao0@huawei.com>
 <YAC9a6quO2VOirLi@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <3923906d-f208-f6c2-f121-5e77e8fb6b28@huawei.com>
Date: Fri, 15 Jan 2021 15:59:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YAC9a6quO2VOirLi@google.com>
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
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l0K10-003r9w-Ph
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to keep isolation of atomic
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

On 2021/1/15 5:53, Jaegeuk Kim wrote:
> On 12/30, Chao Yu wrote:
>> ThreadA					ThreadB
>> - f2fs_ioc_start_atomic_write
>> - write
>> - f2fs_ioc_commit_atomic_write
>>   - f2fs_commit_inmem_pages
>>   - f2fs_drop_inmem_pages
>>   - f2fs_drop_inmem_pages
>>    - __revoke_inmem_pages
>> 					- f2fs_vm_page_mkwrite
>> 					 - set_page_dirty
>> 					  - tag ATOMIC_WRITTEN_PAGE and add page
>> 					    to inmem_pages list
>>    - clear_inode_flag(FI_ATOMIC_FILE)
>> 					- f2fs_vm_page_mkwrite
>> 					  - set_page_dirty
>> 					   - f2fs_update_dirty_page
>> 					    - f2fs_trace_pid
>> 					     - tag inmem page private to pid
> 
> Hmm, how about removing fs/f2fs/trace.c to make private more complicated
> like this? I think we can get IO traces from tracepoints.

Hmm, actually, there is are issues, one is the trace IO, the other is the
race issue (atomic_start,commit,drop vs mkwrite) which can make isolation
semantics of transaction be broken.

Or can we avoid atomic file racing with file mmap?

- atomic_start			- file_mmap
				 - inode_lock
				 - if (FI_ATOMIC_FILE) return
  - inode_lock
  - if (FI_MMAP_FILE) return

Thanks,

> 
>> 					- truncate
>> 					 - f2fs_invalidate_page
>> 					 - set page->mapping to NULL
>> 					  then it will cause panic once we
>> 					  access page->mapping
>>
>> The root cause is we missed to keep isolation of atomic write in the case
>> of commit_atomic_write vs mkwrite, let commit_atomic_write helds i_mmap_sem
>> lock to avoid this issue.
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>> v2:
>> - use i_mmap_sem to avoid mkwrite racing with below flows:
>>   * f2fs_ioc_start_atomic_write
>>   * f2fs_drop_inmem_pages
>>   * f2fs_commit_inmem_pages
>>
>>   fs/f2fs/file.c    | 3 +++
>>   fs/f2fs/segment.c | 7 +++++++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 4e6d4b9120a8..a48ec650d691 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -2050,6 +2050,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>>   		goto out;
>>   
>>   	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>> +	down_write(&F2FS_I(inode)->i_mmap_sem);
>>   
>>   	/*
>>   	 * Should wait end_io to count F2FS_WB_CP_DATA correctly by
>> @@ -2060,6 +2061,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>>   			  inode->i_ino, get_dirty_pages(inode));
>>   	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
>>   	if (ret) {
>> +		up_write(&F2FS_I(inode)->i_mmap_sem);
>>   		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>>   		goto out;
>>   	}
>> @@ -2073,6 +2075,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>>   	/* add inode in inmem_list first and set atomic_file */
>>   	set_inode_flag(inode, FI_ATOMIC_FILE);
>>   	clear_inode_flag(inode, FI_ATOMIC_REVOKE_REQUEST);
>> +	up_write(&F2FS_I(inode)->i_mmap_sem);
>>   	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>>   
>>   	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index d8570b0359f5..dab870d9faf6 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -327,6 +327,8 @@ void f2fs_drop_inmem_pages(struct inode *inode)
>>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>   	struct f2fs_inode_info *fi = F2FS_I(inode);
>>   
>> +	down_write(&F2FS_I(inode)->i_mmap_sem);
>> +
>>   	while (!list_empty(&fi->inmem_pages)) {
>>   		mutex_lock(&fi->inmem_lock);
>>   		__revoke_inmem_pages(inode, &fi->inmem_pages,
>> @@ -344,6 +346,8 @@ void f2fs_drop_inmem_pages(struct inode *inode)
>>   		sbi->atomic_files--;
>>   	}
>>   	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
>> +
>> +	up_write(&F2FS_I(inode)->i_mmap_sem);
>>   }
>>   
>>   void f2fs_drop_inmem_page(struct inode *inode, struct page *page)
>> @@ -467,6 +471,7 @@ int f2fs_commit_inmem_pages(struct inode *inode)
>>   	f2fs_balance_fs(sbi, true);
>>   
>>   	down_write(&fi->i_gc_rwsem[WRITE]);
>> +	down_write(&F2FS_I(inode)->i_mmap_sem);
>>   
>>   	f2fs_lock_op(sbi);
>>   	set_inode_flag(inode, FI_ATOMIC_COMMIT);
>> @@ -478,6 +483,8 @@ int f2fs_commit_inmem_pages(struct inode *inode)
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
