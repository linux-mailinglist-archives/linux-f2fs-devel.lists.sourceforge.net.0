Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F0E1CED3F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2020 08:50:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYOjv-00038j-41; Tue, 12 May 2020 06:50:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jYOju-00038X-4G
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 May 2020 06:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UbwUwr2Cz4X8LNdWPVUSto31mOou9+2c9E5rTCJXdsA=; b=XvfYncI2qnnv5lCjVjKLKlN4Hy
 6ROq8VCtrVj7nQmzNuzmP3F6hxqMBjIerPceXG4spBwKEe4JEd0BjiMJwZkr+fbFdSElwC0nTIpyg
 CwMeJmcMJSsuaVQCDQ8/0wLPkBAcwbD5EuVajZRNr1ShMdvTI7oKyZOlLeQ+cHxZaWKc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UbwUwr2Cz4X8LNdWPVUSto31mOou9+2c9E5rTCJXdsA=; b=HDlkAO7fVa1DGLVup0lmQ7ou7h
 2ZFC/JpF30rmliaKhtyDd/IOwCkJz+CSfw8OJ8N8l0l9qHsJdkXlvVFYc8SxSoWMHliWs1w4uzvW5
 bvs9AmlHAmOta6Jgzqem3FVTr78eUMM+9JOnsXpokQJ4yMJSj/Uz3amPd003GcMjmeps=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYOjr-005h4s-R7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 May 2020 06:50:06 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6C3242DC477C7304D743;
 Tue, 12 May 2020 14:49:54 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 12 May
 2020 14:49:50 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <1588244309-1468-1-git-send-email-sayalil@codeaurora.org>
 <20200508161052.GA49579@google.com>
 <0902037e-998d-812e-53e7-90ea7b9957eb@huawei.com>
 <20200509190342.GA11239@google.com>
 <fbb5ef1e-214d-f34a-e1a0-32534c765e56@huawei.com>
 <20200511221100.GA171700@google.com>
 <34a9cdcd-0e3d-8d2a-6b19-6fced3a3aa68@huawei.com>
 <20200512032439.GA216359@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <441dfeca-f30d-f6a1-faa6-0b7d9777f51c@huawei.com>
Date: Tue, 12 May 2020 14:49:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200512032439.GA216359@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYOjr-005h4s-R7
Subject: Re: [f2fs-dev] [PATCH V4] f2fs: Avoid double lock for cp_rwsem
 during checkpoint
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

On 2020/5/12 11:24, Jaegeuk Kim wrote:
> On 05/12, Chao Yu wrote:
>> On 2020/5/12 6:11, Jaegeuk Kim wrote:
>>> On 05/11, Chao Yu wrote:
>>>> On 2020/5/10 3:03, Jaegeuk Kim wrote:
>>>>> On 05/09, Chao Yu wrote:
>>>>>> On 2020/5/9 0:10, Jaegeuk Kim wrote:
>>>>>>> Hi Sayali,
>>>>>>>
>>>>>>> In order to address the perf regression, how about this?
>>>>>>>
>>>>>>> >From 48418af635884803ffb35972df7958a2e6649322 Mon Sep 17 00:00:00 2001
>>>>>>> From: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>>>> Date: Fri, 8 May 2020 09:08:37 -0700
>>>>>>> Subject: [PATCH] f2fs: avoid double lock for cp_rwsem during checkpoint
>>>>>>>
>>>>>>> There could be a scenario where f2fs_sync_node_pages gets
>>>>>>> called during checkpoint, which in turn tries to flush
>>>>>>> inline data and calls iput(). This results in deadlock as
>>>>>>> iput() tries to hold cp_rwsem, which is already held at the
>>>>>>> beginning by checkpoint->block_operations().
>>>>>>>
>>>>>>> Call stack :
>>>>>>>
>>>>>>> Thread A		Thread B
>>>>>>> f2fs_write_checkpoint()
>>>>>>> - block_operations(sbi)
>>>>>>>  - f2fs_lock_all(sbi);
>>>>>>>   - down_write(&sbi->cp_rwsem);
>>>>>>>
>>>>>>>                         - open()
>>>>>>>                          - igrab()
>>>>>>>                         - write() write inline data
>>>>>>>                         - unlink()
>>>>>>> - f2fs_sync_node_pages()
>>>>>>>  - if (is_inline_node(page))
>>>>>>>   - flush_inline_data()
>>>>>>>    - ilookup()
>>>>>>>      page = f2fs_pagecache_get_page()
>>>>>>>      if (!page)
>>>>>>>       goto iput_out;
>>>>>>>      iput_out:
>>>>>>> 			-close()
>>>>>>> 			-iput()
>>>>>>>        iput(inode);
>>>>>>>        - f2fs_evict_inode()
>>>>>>>         - f2fs_truncate_blocks()
>>>>>>>          - f2fs_lock_op()
>>>>>>>            - down_read(&sbi->cp_rwsem);
>>>>>>>
>>>>>>> Fixes: 2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
>>>>>>> Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
>>>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>>>> ---
>>>>>>>  fs/f2fs/node.c | 4 ++--
>>>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>>>>>>> index 1db8cabf727ef..626d7daca09de 100644
>>>>>>> --- a/fs/f2fs/node.c
>>>>>>> +++ b/fs/f2fs/node.c
>>>>>>> @@ -1870,8 +1870,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>>>>>>>  				goto continue_unlock;
>>>>>>>  			}
>>>>>>>  
>>>>>>> -			/* flush inline_data */
>>>>>>> -			if (is_inline_node(page)) {
>>>>>>> +			/* flush inline_data, if it's not sync path. */
>>>>>>> +			if (do_balance && is_inline_node(page)) {
>>>>>>
>>>>>> IIRC, this flow was designed to avoid running out of free space issue
>>>>>> during checkpoint:
>>>>>>
>>>>>> 2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
>>>>>>
>>>>>> The sceanrio is:
>>>>>> 1. create fully node blocks
>>>>>> 2. flush node blocks
>>>>>> 3. write inline_data for all the node blocks again
>>>>>> 4. flush node blocks redundantly
>>>>>>
>>>>>> I guess this may cause failing one case of fstest.
>>>>>
>>>>> Yeah, actually I was hitting 204 failure, and thus, revised like this.
>>>>> Now, I don't see any regression in fstest.
>>>>>
>>>>> >From 8f1882acfb0a5fc43e5a2bbd576a8f3c681a7d2c Mon Sep 17 00:00:00 2001
>>>>> From: Sayali Lokhande <sayalil@codeaurora.org>
>>>>> Date: Thu, 30 Apr 2020 16:28:29 +0530
>>>>> Subject: [PATCH] f2fs: Avoid double lock for cp_rwsem during checkpoint
>>>>>
>>>>> There could be a scenario where f2fs_sync_node_pages gets
>>>>> called during checkpoint, which in turn tries to flush
>>>>> inline data and calls iput(). This results in deadlock as
>>>>> iput() tries to hold cp_rwsem, which is already held at the
>>>>> beginning by checkpoint->block_operations().
>>>>>
>>>>> Call stack :
>>>>>
>>>>> Thread A		Thread B
>>>>> f2fs_write_checkpoint()
>>>>> - block_operations(sbi)
>>>>>  - f2fs_lock_all(sbi);
>>>>>   - down_write(&sbi->cp_rwsem);
>>>>>
>>>>>                         - open()
>>>>>                          - igrab()
>>>>>                         - write() write inline data
>>>>>                         - unlink()
>>>>> - f2fs_sync_node_pages()
>>>>>  - if (is_inline_node(page))
>>>>>   - flush_inline_data()
>>>>>    - ilookup()
>>>>>      page = f2fs_pagecache_get_page()
>>>>>      if (!page)
>>>>>       goto iput_out;
>>>>>      iput_out:
>>>>> 			-close()
>>>>> 			-iput()
>>>>>        iput(inode);
>>>>>        - f2fs_evict_inode()
>>>>>         - f2fs_truncate_blocks()
>>>>>          - f2fs_lock_op()
>>>>>            - down_read(&sbi->cp_rwsem);
>>>>>
>>>>> Fixes: 2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
>>>>> Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>> ---
>>>>>  fs/f2fs/checkpoint.c |  9 ++++++++-
>>>>>  fs/f2fs/f2fs.h       |  4 ++--
>>>>>  fs/f2fs/node.c       | 10 +++++-----
>>>>>  3 files changed, 15 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>>>> index d49f7a01d8a26..928aea4ff663d 100644
>>>>> --- a/fs/f2fs/checkpoint.c
>>>>> +++ b/fs/f2fs/checkpoint.c
>>>>> @@ -1168,6 +1168,12 @@ static int block_operations(struct f2fs_sb_info *sbi)
>>>>>  	};
>>>>>  	int err = 0, cnt = 0;
>>>>>  
>>>>> +	/*
>>>>> +	 * Let's flush node pages first to flush inline_data.
>>>>> +	 * We'll actually guarantee everything below under f2fs_lock_all.
>>>>> +	 */
>>>>> +	f2fs_sync_node_pages(sbi, &wbc, false, false, FS_CP_NODE_IO);
>>>>
>>>> It is possible that user write a large number of inline data in between
>>>> f2fs_sync_node_pages() and f2fs_lock_all(), it will cause the no-space issue in
>>>> race condition.
>>>>
>>>> Also, if there is huge number of F2FS_DIRTY_IMETA, after this change, we will
>>>> flush inode page twice which is unneeded.
>>>>
>>>> f2fs_sync_node_pages() --- flush dirty inode page
>>>> f2fs_lock_all()
>>>> ...
>>>> f2fs_sync_inode_meta() --- update dirty inode page
>>>> f2fs_sync_node_pages() --- flush dirty inode page again.
>>>>
>>>
>>> Another version:
>>>
>>> >From 6b430b72af57c65c20dea7b87f7ba7e9df36be98 Mon Sep 17 00:00:00 2001
>>> From: Sayali Lokhande <sayalil@codeaurora.org>
>>> Date: Thu, 30 Apr 2020 16:28:29 +0530
>>> Subject: [PATCH] f2fs: Avoid double lock for cp_rwsem during checkpoint
>>>
>>> There could be a scenario where f2fs_sync_node_pages gets
>>> called during checkpoint, which in turn tries to flush
>>> inline data and calls iput(). This results in deadlock as
>>> iput() tries to hold cp_rwsem, which is already held at the
>>> beginning by checkpoint->block_operations().
>>>
>>> Call stack :
>>>
>>> Thread A		Thread B
>>> f2fs_write_checkpoint()
>>> - block_operations(sbi)
>>>  - f2fs_lock_all(sbi);
>>>   - down_write(&sbi->cp_rwsem);
>>>
>>>                         - open()
>>>                          - igrab()
>>>                         - write() write inline data
>>>                         - unlink()
>>> - f2fs_sync_node_pages()
>>>  - if (is_inline_node(page))
>>>   - flush_inline_data()
>>>    - ilookup()
>>>      page = f2fs_pagecache_get_page()
>>>      if (!page)
>>>       goto iput_out;
>>>      iput_out:
>>> 			-close()
>>> 			-iput()
>>>        iput(inode);
>>>        - f2fs_evict_inode()
>>>         - f2fs_truncate_blocks()
>>>          - f2fs_lock_op()
>>>            - down_read(&sbi->cp_rwsem);
>>>
>>> Fixes: 2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
>>> Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>  fs/f2fs/checkpoint.c |  5 +++++
>>>  fs/f2fs/f2fs.h       |  1 +
>>>  fs/f2fs/node.c       | 51 ++++++++++++++++++++++++++++++++++++++++++--
>>>  3 files changed, 55 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>> index d49f7a01d8a26..79e605f38f4fa 100644
>>> --- a/fs/f2fs/checkpoint.c
>>> +++ b/fs/f2fs/checkpoint.c
>>> @@ -1168,6 +1168,11 @@ static int block_operations(struct f2fs_sb_info *sbi)
>>>  	};
>>>  	int err = 0, cnt = 0;
>>>  
>>> +	/*
>>> +	 * Let's flush inline_data in dirty node pages.
>>> +	 */
>>> +	f2fs_flush_inline_data(sbi);
>>
>> Still there is a gap, user can write a large number of inline data here...
> 
> I think generic/204 is the case, and I don't hit a panic with this patch.

Yes, may be triggered by a variant of generic/204 which is not exist yet, and
it's a rare corner case.

> 
>>
>> Would that be enough? I doubt we can suffer this issue in below pathes
>> as well:
> 
> I don't think so, since iput is called after f2fs_unlock_all().

That's correct.

Thanks,

> 
>>
>> - block_operations
>>  - f2fs_sync_dirty_inodes
>>   - iput
>>  - f2fs_sync_inode_meta
>>   - iput
>>
>> Thanks,
>>
>>> +
>>>  retry_flush_quotas:
>>>  	f2fs_lock_all(sbi);
>>>  	if (__need_flush_quota(sbi)) {
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index 2a8ea81c52a15..7f3d259e7e376 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -3282,6 +3282,7 @@ void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid);
>>>  struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid);
>>>  struct page *f2fs_get_node_page_ra(struct page *parent, int start);
>>>  int f2fs_move_node_page(struct page *node_page, int gc_type);
>>> +int f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
>>>  int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>>>  			struct writeback_control *wbc, bool atomic,
>>>  			unsigned int *seq_id);
>>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>>> index 1db8cabf727ef..e632de10aedab 100644
>>> --- a/fs/f2fs/node.c
>>> +++ b/fs/f2fs/node.c
>>> @@ -1807,6 +1807,53 @@ static bool flush_dirty_inode(struct page *page)
>>>  	return true;
>>>  }
>>>  
>>> +int f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
>>> +{
>>> +	pgoff_t index = 0;
>>> +	struct pagevec pvec;
>>> +	int nr_pages;
>>> +	int ret = 0;
>>> +
>>> +	pagevec_init(&pvec);
>>> +
>>> +	while ((nr_pages = pagevec_lookup_tag(&pvec,
>>> +			NODE_MAPPING(sbi), &index, PAGECACHE_TAG_DIRTY))) {
>>> +		int i;
>>> +
>>> +		for (i = 0; i < nr_pages; i++) {
>>> +			struct page *page = pvec.pages[i];
>>> +
>>> +			if (!IS_DNODE(page))
>>> +				continue;
>>> +
>>> +			lock_page(page);
>>> +
>>> +			if (unlikely(page->mapping != NODE_MAPPING(sbi))) {
>>> +continue_unlock:
>>> +				unlock_page(page);
>>> +				continue;
>>> +			}
>>> +
>>> +			if (!PageDirty(page)) {
>>> +				/* someone wrote it for us */
>>> +				goto continue_unlock;
>>> +			}
>>> +
>>> +			/* flush inline_data, if it's async context. */
>>> +			if (is_inline_node(page)) {
>>> +				clear_inline_node(page);
>>> +				unlock_page(page);
>>> +				flush_inline_data(sbi, ino_of_node(page));
>>> +				continue;
>>> +			}
>>> +			unlock_page(page);
>>> +		}
>>> +		pagevec_release(&pvec);
>>> +		cond_resched();
>>> +	}
>>> +	return ret;
>>> +}
>>> +
>>>  int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>>>  				struct writeback_control *wbc,
>>>  				bool do_balance, enum iostat_type io_type)
>>> @@ -1870,8 +1917,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>>>  				goto continue_unlock;
>>>  			}
>>>  
>>> -			/* flush inline_data */
>>> -			if (is_inline_node(page)) {
>>> +			/* flush inline_data, if it's async context. */
>>> +			if (do_balance && is_inline_node(page)) {
>>>  				clear_inline_node(page);
>>>  				unlock_page(page);
>>>  				flush_inline_data(sbi, ino_of_node(page));
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
