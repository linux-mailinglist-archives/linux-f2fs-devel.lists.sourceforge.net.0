Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE9971218
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jul 2019 08:47:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hpoZl-0003VD-Iw; Tue, 23 Jul 2019 06:47:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hpoZj-0003V6-Tn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jul 2019 06:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nu57GhlQQ2nUGqsOU60xpotERbvCWFvWDGGMcpdteJs=; b=f2m43GMoAqfmkCyl3Jhbm7fq+T
 PhGmkMqY/c8Ahwa4plt2pbjHTdbfnb7/cesgPQt0AIu+6/7SS3nlk+F/AM1+sIaU99CF3zY54yhTt
 2H2m1yM+kz3LAzFOgEGDKcMk2aLBAJ6VFnA6UG9eiv4QwYXSn8H1cQ77CfGidf+0SsQI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nu57GhlQQ2nUGqsOU60xpotERbvCWFvWDGGMcpdteJs=; b=ML0Uk/P9fezKXn/heLpXh4bb5E
 O6k1wT6a4X+GnugqCW1Io1Dl9k94PXSlnpZBKeoqsDncSiiZ8JtgjVX/9D7SM1nxWrJNGtMxika0m
 +Ou9qFe9rZDWLx2gUwwrbzovlqqRjNj+BmmkMDF6viZ3EpGYMlVAJn7a0qRGFA+K2M3E=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hpoZh-00BiXy-E6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jul 2019 06:47:03 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id CD062DD72BF5750FBEDE;
 Tue, 23 Jul 2019 14:46:52 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 23 Jul
 2019 14:46:48 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190718013718.70335-1-jaegeuk@kernel.org>
 <20190718031214.GA78336@jaegeuk-macbookpro.roam.corp.google.com>
 <19a25101-da74-de98-6ca4-a9fd9fa09ef2@huawei.com>
 <20190718040005.GA81995@jaegeuk-macbookpro.roam.corp.google.com>
 <91dbfa33-cda0-e6e7-d62f-6604939142d4@huawei.com>
 <20190723012721.GA60134@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <45a9f47b-337c-527c-420d-b29e77a8ed22@huawei.com>
Date: Tue, 23 Jul 2019 14:46:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190723012721.GA60134@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hpoZh-00BiXy-E6
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to read source block before
 invalidating it
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

On 2019/7/23 9:27, Jaegeuk Kim wrote:
> On 07/18, Chao Yu wrote:
>> On 2019/7/18 12:00, Jaegeuk Kim wrote:
>>> On 07/18, Chao Yu wrote:
>>>> On 2019/7/18 11:12, Jaegeuk Kim wrote:
>>>>> f2fs_allocate_data_block() invalidates old block address and enable new block
>>>>> address. Then, if we try to read old block by f2fs_submit_page_bio(), it will
>>>>> give WARN due to reading invalid blocks.
>>>>>
>>>>> Let's make the order sanely back.
>>>>
>>>> Hmm.. to avoid WARM, we may suffer one more memcpy, I suspect this can reduce
>>>> online resize or foreground gc ioctl performance...
>>>
>>> I worried about performance tho, more concern came to me that there may exist a
>>> chance that other thread can allocate and write something in old block address.
>>
>> Me too, however, previous invalid block address should be reused after a
>> checkpoint, and checkpoint should have invalidated meta cache already, so there
>> shouldn't be any race here.
> 
> I think SSR can reuse that before checkpoint.

Yes, I should have considered that when I introduced readahead feature for
migration of block, we've kept invalidating meta page cache in old block address
whenever the block address is not valid.

quoted from ("f2fs: readahead encrypted block during GC")

"Note that for OPU, truncation, deletion, we need to invalid meta
page after we invalid old block address, to make sure we won't load
invalid data from target meta page during encrypted block migration."

But to avoid potential issue, how about just enable meta page cache during GC?
that is saying we should truncate all valid meta cache after one section has
been moved.


One more concern is whether below case exists during SSR?
- write 4k to fileA;
- fsync fileA, 4k data is writebacked to lbaA;
- write 4k to fileA;
- kworker flushs 4k to lbaB; dnode contain lbaB didn't be persisted yet;
- write 4k to fileB;
- kworker flush 4k to lbaA due to SSR;
- SPOR  -> dnode with lbaA will be recovered, however lbaA contains fileB's data..

Thanks,

> 
>>
>> 	/*
>> 	 * invalidate intermediate page cache borrowed from meta inode
>> 	 * which are used for migration of encrypted inode's blocks.
>> 	 */
>> 	if (f2fs_sb_has_encrypt(sbi))
>> 		invalidate_mapping_pages(META_MAPPING(sbi),
>> 				MAIN_BLKADDR(sbi), MAX_BLKADDR(sbi) - 1);
>>
>> Thanks,
>>
>>>
>>>>
>>>> Can we just relief to use DATA_GENERIC_ENHANCE_READ for this case...?
>>>
>>> We need to keep consistency for this api.
>>>
>>> Thanks,
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>
>>>> Except performance, I'm okay with this change.
>>>>
>>>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
>>>>
>>>> Thanks,
>>>>
>>>>> ---
>>>>> v2:
>>>>> I was fixing the comments. :)
>>>>>
>>>>>  fs/f2fs/gc.c | 70 +++++++++++++++++++++++++---------------------------
>>>>>  1 file changed, 34 insertions(+), 36 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>>>> index 6691f526fa40..8974672db78f 100644
>>>>> --- a/fs/f2fs/gc.c
>>>>> +++ b/fs/f2fs/gc.c
>>>>> @@ -796,6 +796,29 @@ static int move_data_block(struct inode *inode, block_t bidx,
>>>>>  	if (lfs_mode)
>>>>>  		down_write(&fio.sbi->io_order_lock);
>>>>>  
>>>>> +	mpage = f2fs_grab_cache_page(META_MAPPING(fio.sbi),
>>>>> +					fio.old_blkaddr, false);
>>>>> +	if (!mpage)
>>>>> +		goto up_out;
>>>>> +
>>>>> +	fio.encrypted_page = mpage;
>>>>> +
>>>>> +	/* read source block in mpage */
>>>>> +	if (!PageUptodate(mpage)) {
>>>>> +		err = f2fs_submit_page_bio(&fio);
>>>>> +		if (err) {
>>>>> +			f2fs_put_page(mpage, 1);
>>>>> +			goto up_out;
>>>>> +		}
>>>>> +		lock_page(mpage);
>>>>> +		if (unlikely(mpage->mapping != META_MAPPING(fio.sbi) ||
>>>>> +						!PageUptodate(mpage))) {
>>>>> +			err = -EIO;
>>>>> +			f2fs_put_page(mpage, 1);
>>>>> +			goto up_out;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>>  	f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
>>>>>  					&sum, CURSEG_COLD_DATA, NULL, false);
>>>>>  
>>>>> @@ -803,44 +826,18 @@ static int move_data_block(struct inode *inode, block_t bidx,
>>>>>  				newaddr, FGP_LOCK | FGP_CREAT, GFP_NOFS);
>>>>>  	if (!fio.encrypted_page) {
>>>>>  		err = -ENOMEM;
>>>>> -		goto recover_block;
>>>>> -	}
>>>>> -
>>>>> -	mpage = f2fs_pagecache_get_page(META_MAPPING(fio.sbi),
>>>>> -					fio.old_blkaddr, FGP_LOCK, GFP_NOFS);
>>>>> -	if (mpage) {
>>>>> -		bool updated = false;
>>>>> -
>>>>> -		if (PageUptodate(mpage)) {
>>>>> -			memcpy(page_address(fio.encrypted_page),
>>>>> -					page_address(mpage), PAGE_SIZE);
>>>>> -			updated = true;
>>>>> -		}
>>>>>  		f2fs_put_page(mpage, 1);
>>>>> -		invalidate_mapping_pages(META_MAPPING(fio.sbi),
>>>>> -					fio.old_blkaddr, fio.old_blkaddr);
>>>>> -		if (updated)
>>>>> -			goto write_page;
>>>>> -	}
>>>>> -
>>>>> -	err = f2fs_submit_page_bio(&fio);
>>>>> -	if (err)
>>>>> -		goto put_page_out;
>>>>> -
>>>>> -	/* write page */
>>>>> -	lock_page(fio.encrypted_page);
>>>>> -
>>>>> -	if (unlikely(fio.encrypted_page->mapping != META_MAPPING(fio.sbi))) {
>>>>> -		err = -EIO;
>>>>> -		goto put_page_out;
>>>>> -	}
>>>>> -	if (unlikely(!PageUptodate(fio.encrypted_page))) {
>>>>> -		err = -EIO;
>>>>> -		goto put_page_out;
>>>>> +		goto recover_block;
>>>>>  	}
>>>>>  
>>>>> -write_page:
>>>>> +	/* write target block */
>>>>>  	f2fs_wait_on_page_writeback(fio.encrypted_page, DATA, true, true);
>>>>> +	memcpy(page_address(fio.encrypted_page),
>>>>> +				page_address(mpage), PAGE_SIZE);
>>>>> +	f2fs_put_page(mpage, 1);
>>>>> +	invalidate_mapping_pages(META_MAPPING(fio.sbi),
>>>>> +				fio.old_blkaddr, fio.old_blkaddr);
>>>>> +
>>>>>  	set_page_dirty(fio.encrypted_page);
>>>>>  	if (clear_page_dirty_for_io(fio.encrypted_page))
>>>>>  		dec_page_count(fio.sbi, F2FS_DIRTY_META);
>>>>> @@ -871,11 +868,12 @@ static int move_data_block(struct inode *inode, block_t bidx,
>>>>>  put_page_out:
>>>>>  	f2fs_put_page(fio.encrypted_page, 1);
>>>>>  recover_block:
>>>>> -	if (lfs_mode)
>>>>> -		up_write(&fio.sbi->io_order_lock);
>>>>>  	if (err)
>>>>>  		f2fs_do_replace_block(fio.sbi, &sum, newaddr, fio.old_blkaddr,
>>>>>  								true, true);
>>>>> +up_out:
>>>>> +	if (lfs_mode)
>>>>> +		up_write(&fio.sbi->io_order_lock);
>>>>>  put_out:
>>>>>  	f2fs_put_dnode(&dn);
>>>>>  out:
>>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> Linux-f2fs-devel mailing list
>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
