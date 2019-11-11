Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E78EBF6E89
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Nov 2019 07:29:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iU3CB-00088F-5Z; Mon, 11 Nov 2019 06:29:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iU3C9-000888-T8
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 06:29:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RGRFQDLXl7NBsHFwTo0QA/oVJF+GDY0FPuhXQteEURk=; b=aEOgWHPcQ+w9PGlsRs7onMEpLt
 nCqPAhphnXB187aSgQGmLKc66fBmFIVe7jjCKa12UL5G6ZQ4a+eTtyRNyVtPjaPO07XhEqmneenn6
 Hn0QbLez03mWnWuamGIkE+dr1dzX07gzp3zWBe6FTXd+HyhHlv1CBgbRs4VhNhBBsxxk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RGRFQDLXl7NBsHFwTo0QA/oVJF+GDY0FPuhXQteEURk=; b=hPmkltUxEp35LPUcsOTG7qYpyQ
 ECyKuRafdG7rm81CJIvpQWXcES0SJiKcPfSxUTWCdYTZYRLt8uzd7brbf3iI0h004ElZaWPqOGzt4
 AtmPHGtaApFOd+VnvCIEhMj0RF+VxcIgREZIihL9ROpr5qfSS/F5hzj2P/He1QQwUQHo=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iU3C6-00BXIY-0T
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 06:29:01 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A768F510A903BE8105D5;
 Mon, 11 Nov 2019 14:28:50 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 11 Nov
 2019 14:28:47 +0800
To: Sahitya Tummala <stummala@codeaurora.org>
References: <1573211027-30785-1-git-send-email-stummala@codeaurora.org>
 <5c491884-91d3-5b85-6d49-569a8d06f3a3@huawei.com>
 <20191111034026.GA15669@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9ece86fd-ff53-3a70-627e-c6acb03b9264@huawei.com>
Date: Mon, 11 Nov 2019 14:28:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191111034026.GA15669@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iU3C6-00BXIY-0T
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix deadlock under storage almost
 full/dirty condition
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Sahitya,

On 2019/11/11 11:40, Sahitya Tummala wrote:
> Hi Chao,
> 
> On Mon, Nov 11, 2019 at 10:51:10AM +0800, Chao Yu wrote:
>> On 2019/11/8 19:03, Sahitya Tummala wrote:
>>> There could be a potential deadlock when the storage capacity
>>> is almost full and theren't enough free segments available, due
>>> to which FG_GC is needed in the atomic commit ioctl as shown in
>>> the below callstack -
>>>
>>> schedule_timeout
>>> io_schedule_timeout
>>> congestion_wait
>>> f2fs_drop_inmem_pages_all
>>> f2fs_gc
>>> f2fs_balance_fs
>>> __write_node_page
>>> f2fs_fsync_node_pages
>>> f2fs_do_sync_file
>>> f2fs_ioctl
>>>
>>> If this inode doesn't have i_gc_failures[GC_FAILURE_ATOMIC] set,
>>> then it waits forever in f2fs_drop_inmem_pages_all(), for this
>>> atomic inode to be dropped. And the rest of the system is stuck
>>> waiting for sbi->gc_mutex lock, which is acquired by f2fs_balance_fs()
>>> in the stack above.
>>
>> I think the root cause of this issue is there is potential infinite loop in
>> f2fs_drop_inmem_pages_all() for the case of gc_failure is true, because once the
>> first inode in inode_list[ATOMIC_FILE] list didn't suffer gc failure, we will
>> skip dropping its in-memory cache and calling iput(), and traverse the list
>> again, most possibly there is the same inode in the head of that list.
>>
> 
> I thought we are expecting for those atomic updates (without any gc failures) to be
> committed by doing congestion_wait() and thus retrying again. Hence, I just

Nope, we only need to drop inode which encounter gc failures, and keep the rest
inodes.

> fixed only if we are ending up waiting for commit to happen in the atomic
> commit path itself, which will be a deadlock.

Look into call stack you provide, I don't think it's correct to drop such inode,
as its dirty pages should be committed before f2fs_fsync_node_pages(), so
calling f2fs_drop_inmem_pages won't release any inmem pages, and won't help
looped GC caused by skipping due to inmem pages.

And then I figure out below fix...

> 
>> Could you please check below fix:
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 7bf7b0194944..8a3a35b42a37 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -1395,6 +1395,7 @@ struct f2fs_sb_info {
>>  	unsigned int gc_mode;			/* current GC state */
>>  	unsigned int next_victim_seg[2];	/* next segment in victim section */
>>  	/* for skip statistic */
>> +	unsigned int atomic_files;		/* # of opened atomic file */
>>  	unsigned long long skipped_atomic_files[2];	/* FG_GC and BG_GC */
>>  	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index ecd063239642..79f4b348951a 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -2047,6 +2047,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>>  	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
>>  	if (list_empty(&fi->inmem_ilist))
>>  		list_add_tail(&fi->inmem_ilist, &sbi->inode_list[ATOMIC_FILE]);
>> +	sbi->atomic_files++;
>>  	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
>>
>>  	/* add inode in inmem_list first and set atomic_file */
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 8b977bbd6822..6aa0bb693697 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -288,6 +288,8 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi,
>> bool gc_failure)
>>  	struct list_head *head = &sbi->inode_list[ATOMIC_FILE];
>>  	struct inode *inode;
>>  	struct f2fs_inode_info *fi;
>> +	unsigned int count = sbi->atomic_files;
> 
> If the sbi->atomic_files decrements just after this, then the below exit condition
> may not work. In that case, looped will never be >= count.
> 
>> +	unsigned int looped = 0;
>>  next:
>>  	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
>>  	if (list_empty(head)) {
>> @@ -296,22 +298,29 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi,
>> bool gc_failure)
>>  	}
>>  	fi = list_first_entry(head, struct f2fs_inode_info, inmem_ilist);
>>  	inode = igrab(&fi->vfs_inode);
>> +	if (inode)
>> +		list_move_tail(&fi->inmem_ilist, head);
>>  	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
>>
>>  	if (inode) {
>>  		if (gc_failure) {
>> -			if (fi->i_gc_failures[GC_FAILURE_ATOMIC])
>> -				goto drop;
>> -			goto skip;
>> +			if (!fi->i_gc_failures[GC_FAILURE_ATOMIC])
>> +				goto skip;
>>  		}
>> -drop:
>>  		set_inode_flag(inode, FI_ATOMIC_REVOKE_REQUEST);
>>  		f2fs_drop_inmem_pages(inode);
>> +skip:
>>  		iput(inode);
> 
> Does this result into f2fs_evict_inode() in this context for this inode?

Yup, we need to call igrab/iput in pair in f2fs_drop_inmem_pages_all() anyway.

Previously, we may have .i_count leak...

Thanks,

> 
> thanks,
> 
>>  	}
>> -skip:
>> +
>>  	congestion_wait(BLK_RW_ASYNC, HZ/50);
>>  	cond_resched();
>> +
>> +	if (gc_failure) {
>> +		if (++looped >= count)
>> +			return;
>> +	}
>> +
>>  	goto next;
>>  }
>>
>> @@ -334,6 +343,7 @@ void f2fs_drop_inmem_pages(struct inode *inode)
>>  	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
>>  	if (!list_empty(&fi->inmem_ilist))
>>  		list_del_init(&fi->inmem_ilist);
>> +	sbi->atomic_files--;
>>  	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
>>  }
>>
>> Thanks,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
