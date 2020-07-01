Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE39210179
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 03:31:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqRb4-0005RQ-R2; Wed, 01 Jul 2020 01:31:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jqRb3-0005RJ-I9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 01:31:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5r2yh537/C2qVeLvX6Bv9mBMu3FXtvl7Db4N4+DhEkU=; b=Y0sXGGWxtggGaSX1Sb7oeUl2SR
 qSsV+sfR9jVyq1eJmbaqZZHH/9a0hWLsXb6PTqNqBstuoA0nmYhfPTC65ZvMfivoSDkhbLh76cp35
 ldey3IPRI0rbwgaEnFMUzfEf8mb9uvBDnH9lBfNnuI/Cos3b3X/RuwCkRuhtuOncE43Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5r2yh537/C2qVeLvX6Bv9mBMu3FXtvl7Db4N4+DhEkU=; b=YLbZPtrCv6P0pJxKOKeaUGOQFD
 aO6TBkD0XKFlgJvvweWmsQW22qxrQld4a6cnJwX8DHljyopujwbbQnSqaHxjT/BAHu0k6XUVsdn3X
 2U2A4ooupel/Jn2qF0kfDKh1qavJQ71jAztaIv6R9CPDWs4RyUJRcCD1bhC0mx/8eGhk=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqRb1-006bsN-EN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 01:31:33 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 54271B50266FCE1EE869;
 Wed,  1 Jul 2020 09:31:19 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 1 Jul 2020
 09:31:14 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200622093849.35684-1-yuchao0@huawei.com>
 <20200629201943.GB1117827@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0e3c7fe2-9cb8-c457-e251-eb0fb7c0760e@huawei.com>
Date: Wed, 1 Jul 2020 09:31:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200629201943.GB1117827@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
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
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jqRb1-006bsN-EN
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: split f2fs_allocate_new_segments()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk, could you please help to change __allocate_new_segment() to static
in your tree?

On 2020/6/30 4:19, Jaegeuk Kim wrote:
> On 06/22, Chao Yu wrote:
>> to two independent functions:
>> - f2fs_allocate_new_segment() for specified type segment allocation
>> - f2fs_allocate_new_segments() for all data type segments allocation
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/f2fs.h     |  3 ++-
>>  fs/f2fs/file.c     |  2 +-
>>  fs/f2fs/recovery.c |  2 +-
>>  fs/f2fs/segment.c  | 39 +++++++++++++++++++++++----------------
>>  4 files changed, 27 insertions(+), 19 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 70565d81320b..07290943e91d 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -3327,7 +3327,8 @@ void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
>>  int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
>>  void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
>>  					unsigned int start, unsigned int end);
>> -void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi, int type);
>> +void f2fs_allocate_new_segment(struct f2fs_sb_info *sbi, int type);
>> +void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi);
>>  int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range);
>>  bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
>>  					struct cp_control *cpc);
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index f196187159e9..67c65e40b22b 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -1659,7 +1659,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
>>  		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
>>  
>>  		f2fs_lock_op(sbi);
>> -		f2fs_allocate_new_segments(sbi, CURSEG_COLD_DATA);
>> +		f2fs_allocate_new_segment(sbi, CURSEG_COLD_DATA_PINNED);
> 
> This should be CURSEG_COLD_DATA. Otherwise it causes the below kernel panic.
> I fixed this in the -dev, so let me know, if you have other concern.
> 
>   259 Unable to handle kernel NULL pointer dereference at virtual address 00000008
>   259 task: 0000000082b4de99 task.stack: 00000000c6b39dbf
>   259 pc : f2fs_do_write_data_page+0x2b4/0x794
>   259 lr : f2fs_do_write_data_page+0x290/0x794
>   259 sp : ffffff800c83b5a0 pstate : 60c00145
>   259 Call trace:
>   259  f2fs_do_write_data_page+0x2b4/0x794
>   259  f2fs_write_single_data_page+0x4a4/0x764
>   259  f2fs_write_data_pages+0x4dc/0x968
>   259  do_writepages+0x60/0x124
>   259  __writeback_single_inode+0xd8/0x490
>   259  writeback_sb_inodes+0x3a8/0x6e4
>   259  __writeback_inodes_wb+0xa4/0x14c
>   259  wb_writeback+0x218/0x434
>   259  wb_workfn+0x2bc/0x57c
>   259  process_one_work+0x25c/0x440
>   259  worker_thread+0x24c/0x480
>   259  kthread+0x11c/0x12c
>   259  ret_from_fork+0x10/0x18
> 
>>  		f2fs_unlock_op(sbi);
>>  
>>  		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_DIO);
>> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
>> index ae5310f02e7f..af974ba273b3 100644
>> --- a/fs/f2fs/recovery.c
>> +++ b/fs/f2fs/recovery.c
>> @@ -742,7 +742,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
>>  		f2fs_put_page(page, 1);
>>  	}
>>  	if (!err)
>> -		f2fs_allocate_new_segments(sbi, NO_CHECK_TYPE);
>> +		f2fs_allocate_new_segments(sbi);
>>  	return err;
>>  }
>>  
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 113114f98087..f15711e8ee5b 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -2707,28 +2707,35 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
>>  	up_read(&SM_I(sbi)->curseg_lock);
>>  }
>>  
>> -void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi, int type)
>> +void __allocate_new_segment(struct f2fs_sb_info *sbi, int type)
>>  {
>> -	struct curseg_info *curseg;
>> +	struct curseg_info *curseg = CURSEG_I(sbi, type);
>>  	unsigned int old_segno;
>> -	int i;
>>  
>> -	down_write(&SIT_I(sbi)->sentry_lock);
>> +	if (!curseg->next_blkoff &&
>> +		!get_valid_blocks(sbi, curseg->segno, false) &&
>> +		!get_ckpt_valid_blocks(sbi, curseg->segno))
>> +		return;
>>  
>> -	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
>> -		if (type != NO_CHECK_TYPE && i != type)
>> -			continue;
>> +	old_segno = curseg->segno;
>> +	SIT_I(sbi)->s_ops->allocate_segment(sbi, type, true);
>> +	locate_dirty_segment(sbi, old_segno);
>> +}
>>  
>> -		curseg = CURSEG_I(sbi, i);
>> -		if (type == NO_CHECK_TYPE || curseg->next_blkoff ||
>> -				get_valid_blocks(sbi, curseg->segno, false) ||
>> -				get_ckpt_valid_blocks(sbi, curseg->segno)) {
>> -			old_segno = curseg->segno;
>> -			SIT_I(sbi)->s_ops->allocate_segment(sbi, i, true);
>> -			locate_dirty_segment(sbi, old_segno);
>> -		}
>> -	}
>> +void f2fs_allocate_new_segment(struct f2fs_sb_info *sbi, int type)
>> +{
>> +	down_write(&SIT_I(sbi)->sentry_lock);
>> +	__allocate_new_segment(sbi, type);
>> +	up_write(&SIT_I(sbi)->sentry_lock);
>> +}
>>  
>> +void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
>> +{
>> +	int i;
>> +
>> +	down_write(&SIT_I(sbi)->sentry_lock);
>> +	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++)
>> +		__allocate_new_segment(sbi, i);
>>  	up_write(&SIT_I(sbi)->sentry_lock);
>>  }
>>  
>> -- 
>> 2.26.2
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
