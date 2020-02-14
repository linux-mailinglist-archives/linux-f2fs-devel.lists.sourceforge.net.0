Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A20715D2E6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Feb 2020 08:35:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j2VVw-0007VC-Bg; Fri, 14 Feb 2020 07:35:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j2VVu-0007V5-65
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 07:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BsUzQSXJ7rRYipGkpwdy6oq2XZYl4F7XDIOcgVGfPTs=; b=DX2NkQXc+hiZSHDtzWFR+U0PoT
 mJoHjFkEA0x8jT/H8WbZ3QvXY4Lu/qfhrwXcHeEyZJHWDU4DGpJ8pjI3uywtrdrLSkVePY95vcQZ5
 slTXmE3Li5WzMzTybfpV0451G7PTbmA40xrRpBlOtHL8pztLRleBV1DYaHzCS1O+VstQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BsUzQSXJ7rRYipGkpwdy6oq2XZYl4F7XDIOcgVGfPTs=; b=GmDcKDfwQLSSvGeXpLuyIRkuq4
 /7tQlEBIb9OBftxRM1T6etQLwrrzbqb2dH9XnONW2R86HD6iBWlqMWbr6VDEkEIXRkTNTXo1vDJek
 1q5CMKtWrivJFt0P6ZXuL9cY6tucQBrWgDRGtXYnJxIj2mguemVZGqVkdXOZC+gfdJIY=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j2VVn-003az8-CK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 07:35:50 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B5065E5E1AC9CC34D098;
 Fri, 14 Feb 2020 15:35:20 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 14 Feb
 2020 15:35:18 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Sahitya Tummala <stummala@codeaurora.org>
References: <1581503665-19914-1-git-send-email-stummala@codeaurora.org>
 <5d5903e6-f089-7ecf-f1ff-ad341c4cef56@huawei.com>
 <20200214035425.GA20234@codeaurora.org>
 <7fb14366-0ae3-e2d9-49ff-b7257054002c@huawei.com>
Message-ID: <78d14656-360a-5a43-ee72-17d0ffb70a25@huawei.com>
Date: Fri, 14 Feb 2020 15:35:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7fb14366-0ae3-e2d9-49ff-b7257054002c@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j2VVn-003az8-CK
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix the panic in do_checkpoint()
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

On 2020/2/14 15:16, Chao Yu wrote:
> Hi Sahitya,
> 
> On 2020/2/14 11:54, Sahitya Tummala wrote:
>> Hi Chao,
>>
>> On Fri, Feb 14, 2020 at 10:26:18AM +0800, Chao Yu wrote:
>>> Hi Sahitya,
>>>
>>> On 2020/2/12 18:34, Sahitya Tummala wrote:
>>>> There could be a scenario where f2fs_sync_meta_pages() will not
>>>> ensure that all F2FS_DIRTY_META pages are submitted for IO. Thus,
>>>> resulting in the below panic in do_checkpoint() -
>>>>
>>>> f2fs_bug_on(sbi, get_pages(sbi, F2FS_DIRTY_META) &&
>>>> 				!f2fs_cp_error(sbi));
>>>>
>>>> This can happen in a low-memory condition, where shrinker could
>>>> also be doing the writepage operation (stack shown below)
>>>> at the same time when checkpoint is running on another core.
>>>>
>>>> schedule
>>>> down_write
>>>> f2fs_submit_page_write -> by this time, this page in page cache is tagged
>>>> 			as PAGECACHE_TAG_WRITEBACK and PAGECACHE_TAG_DIRTY
>>>> 			is cleared, due to which f2fs_sync_meta_pages()
>>>> 			cannot sync this page in do_checkpoint() path.
>>>> f2fs_do_write_meta_page
>>>> __f2fs_write_meta_page
>>>> f2fs_write_meta_page
>>>> shrink_page_list
>>>> shrink_inactive_list
>>>> shrink_node_memcg
>>>> shrink_node
>>>> kswapd
>>>
>>> IMO, there may be one more simple fix here:
>>>
>>> -	f2fs_do_write_meta_page(sbi, page, io_type);
>>> 	dec_page_count(sbi, F2FS_DIRTY_META);
>>>
>>> +	f2fs_do_write_meta_page(sbi, page, io_type);
>>>
>>> If we can remove F2FS_DIRTY_META reference count before we clear
>>> PAGECACHE_TAG_DIRTY, we can avoid this race condition.
>>>
>>> - dec_page_count(sbi, F2FS_DIRTY_META);
>>> - f2fs_do_write_meta_page
>>>  - set_page_writeback
>>>   - __test_set_page_writeback
>>>    - xas_clear_mark(&xas, PAGECACHE_TAG_DIRTY);
>>>
>>> Thoughts?
>>
>> I believe it will be a problem because let's say the shrinker path is 
>> still in the below stack -
>>
>> f2fs_submit_page_write();
>> ->down_write(&io->io_rwsem);
>>
>> Then, the current f2fs_wait_on_all_pages_writeback() will not wait for
>> that page as it is not yet tagged as F2FS_WB_CP_DATA. Hence, the checkpoint
>> may proceed without waiting for this meta page to be written to disk.
> 
> Oh, you're right.
> 
> It looks the race can happen for data/node pages? like in fsync() procedure.

I mean something like this:

- fsync()				- shrink
 - f2fs_do_sync_file
					 - __write_node_page
					  - set_page_writeback(page#0)
					  : remove DIRTY/TOWRITE flag
  - f2fs_fsync_node_pages
  : won't find page #0 as TOWRITE flag was removeD
  - f2fs_wait_on_node_pages_writeback
  : wont' wait page #0 writeback as it was not in fsync_node_list list.
					   - f2fs_add_fsync_node_entry

Thanks,

> 
>>
>>>
>>>>
>>>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
>>>> ---
>>>>  fs/f2fs/checkpoint.c | 16 ++++++++--------
>>>>  fs/f2fs/f2fs.h       |  2 +-
>>>>  fs/f2fs/super.c      |  2 +-
>>>>  3 files changed, 10 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>>> index ffdaba0..2b651a3 100644
>>>> --- a/fs/f2fs/checkpoint.c
>>>> +++ b/fs/f2fs/checkpoint.c
>>>> @@ -1250,14 +1250,14 @@ static void unblock_operations(struct f2fs_sb_info *sbi)
>>>>  	f2fs_unlock_all(sbi);
>>>>  }
>>>>  
>>>> -void f2fs_wait_on_all_pages_writeback(struct f2fs_sb_info *sbi)
>>>> +void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
>>>>  {
>>>>  	DEFINE_WAIT(wait);
>>>>  
>>>>  	for (;;) {
>>>>  		prepare_to_wait(&sbi->cp_wait, &wait, TASK_UNINTERRUPTIBLE);
>>>>  
>>>> -		if (!get_pages(sbi, F2FS_WB_CP_DATA))
>>>> +		if (!get_pages(sbi, type))
>>>>  			break;
>>>>  
>>>>  		if (unlikely(f2fs_cp_error(sbi)))
>>>> @@ -1384,8 +1384,8 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>>>  
>>>>  	/* Flush all the NAT/SIT pages */
>>>>  	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
>>>> -	f2fs_bug_on(sbi, get_pages(sbi, F2FS_DIRTY_META) &&
>>>> -					!f2fs_cp_error(sbi));
>>>> +	/* Wait for all dirty meta pages to be submitted for IO */
>>>> +	f2fs_wait_on_all_pages(sbi, F2FS_DIRTY_META);
>>>
>>> I'm afraid calling f2fs_wait_on_all_pages() after we call
>>> f2fs_sync_meta_pages() is low efficient, as we only want to write out
>>> dirty meta pages instead of wait for writebacking them to device cache.
>>>
>>
>> I have modified the existing function f2fs_wait_on_all_pages_writeback() to
>> a generic one f2fs_wait_on_all_pages(), where it will wait according to the
>> requested type. In this case, it will only wait for dirty F2FS_DIRTY_META pages
>> but not for the writeback to device cache.
> 
> Oh, I see, as last dirty reference count decreaser won't wake up waiter, we need
> to wait for timeout, right? Can we decrease timeout count, maybe HZ/50 as we did
> for congestion.
> 
> io_schedule_timeout(5*HZ);
> 
> Thanks,
> 
>>
>> Thanks,
>>
>>> Thanks,
>>>
>>>>  
>>>>  	/*
>>>>  	 * modify checkpoint
>>>> @@ -1493,11 +1493,11 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>>>  
>>>>  	/* Here, we have one bio having CP pack except cp pack 2 page */
>>>>  	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
>>>> -	f2fs_bug_on(sbi, get_pages(sbi, F2FS_DIRTY_META) &&
>>>> -					!f2fs_cp_error(sbi));
>>>> +	/* Wait for all dirty meta pages to be submitted for IO */
>>>> +	f2fs_wait_on_all_pages(sbi, F2FS_DIRTY_META);
>>>>  
>>>>  	/* wait for previous submitted meta pages writeback */
>>>> -	f2fs_wait_on_all_pages_writeback(sbi);
>>>> +	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
>>>>  
>>>>  	/* flush all device cache */
>>>>  	err = f2fs_flush_device_cache(sbi);
>>>> @@ -1506,7 +1506,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>>>  
>>>>  	/* barrier and flush checkpoint cp pack 2 page if it can */
>>>>  	commit_checkpoint(sbi, ckpt, start_blk);
>>>> -	f2fs_wait_on_all_pages_writeback(sbi);
>>>> +	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
>>>>  
>>>>  	/*
>>>>  	 * invalidate intermediate page cache borrowed from meta inode
>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>> index 5a888a0..b0e0535 100644
>>>> --- a/fs/f2fs/f2fs.h
>>>> +++ b/fs/f2fs/f2fs.h
>>>> @@ -3196,7 +3196,7 @@ bool f2fs_is_dirty_device(struct f2fs_sb_info *sbi, nid_t ino,
>>>>  void f2fs_update_dirty_page(struct inode *inode, struct page *page);
>>>>  void f2fs_remove_dirty_inode(struct inode *inode);
>>>>  int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type);
>>>> -void f2fs_wait_on_all_pages_writeback(struct f2fs_sb_info *sbi);
>>>> +void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type);
>>>>  int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc);
>>>>  void f2fs_init_ino_entry_info(struct f2fs_sb_info *sbi);
>>>>  int __init f2fs_create_checkpoint_caches(void);
>>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>>> index 5111e1f..084633b 100644
>>>> --- a/fs/f2fs/super.c
>>>> +++ b/fs/f2fs/super.c
>>>> @@ -1105,7 +1105,7 @@ static void f2fs_put_super(struct super_block *sb)
>>>>  	/* our cp_error case, we can wait for any writeback page */
>>>>  	f2fs_flush_merged_writes(sbi);
>>>>  
>>>> -	f2fs_wait_on_all_pages_writeback(sbi);
>>>> +	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
>>>>  
>>>>  	f2fs_bug_on(sbi, sbi->fsync_node_num);
>>>>  
>>>>
>>
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
