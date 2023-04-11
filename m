Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E206DD5E2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 10:49:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pm9gk-00018M-0d;
	Tue, 11 Apr 2023 08:49:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pm9gf-00018F-8s
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 08:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9NJFCVDm0rEmVy8SI/wechGUzvsxYlrutik2bjVkgWo=; b=cP/TsmpeLzQFFdKknsvO1p2Ftl
 igsBe0m1sSeypJcC54RpGiLbitTTN3lMgyl4O324kKR3W8bULAveEycmFj1wEWYH01L6IDxrym51F
 FZdN/cxAIVnT/vQlxLalbXVOnv4FewqqaY142Tdu6+zU7I7dWfbWVwQ2h5VaBv4dsIwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9NJFCVDm0rEmVy8SI/wechGUzvsxYlrutik2bjVkgWo=; b=J2QaYOdDqymDWCrXUSbW2gGBjs
 N1QdklHfd+F+rhXl68/SrzZkb2pbxKcV60BcGQI6SaxEpIsg5VqwQCN7Wcntn0Mas9/UszuUCcm3/
 vJrP9sKgx9AIHqWvN+79Mud7zTHbmiakUKd33JfipFlFalR1xo7uVZF69j8OlNYSU1ho=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pm9gd-0003MT-DB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 08:49:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E952661A24;
 Tue, 11 Apr 2023 08:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93AFC433EF;
 Tue, 11 Apr 2023 08:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681202945;
 bh=7yfrR6dmJx+qORzGn2QhK/+A8If/IB+/5XHfyvlZS+Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h+N9ImHa+vGsvDlOJ17F6cSCk/Xp21smuB3ZL9I4rL6w80NUxg6BtXXMnS1Jsjb2F
 +2r8qG23l4tWVf4PimsynV4NpOb4kNNFOR8v43/uMCVXMQ0tcwzRKfT5MYvr6ggYW/
 zn08yaDY0DMgwVlmMLlj6iDNYK0otq9BjZpcU56IaU1JcSYbs3j6sBHNOFyu6jxSKx
 IKMvZUDgAHD34Y/jWY2xFna+zjmM5zAufs5cn2ktJAOLMr9nYYHL9Cb93zYjLJVmaQ
 Bm47SGXTTO7BxplzjCwlf0JGCYCVVlsnEBFTJtSkztXsDxk6jpRUB0T/ezTTOj2zI5
 AWatxIOWX0QEw==
Message-ID: <3b98678e-70e9-4af9-3067-bcb2820364bc@kernel.org>
Date: Tue, 11 Apr 2023 16:49:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230323213919.1876157-1-jaegeuk@kernel.org>
 <8aea02b0-86f9-539a-02e9-27b381e68b66@kernel.org>
 <ZCG2mfviZfY1dqb4@google.com> <ZCHCykI/BLcfDzt7@casper.infradead.org>
 <ZC2kSfNUXKK4PfpM@google.com>
 <9dc4ba32-5be5-26d8-5dd2-9bd48d6b0af4@kernel.org>
 <ZC46Ccm8xTT4OlE3@google.com>
 <c07853c1-6512-6539-a9dd-d9681dd51727@kernel.org>
 <ZDSaoHnlZbYMfbV7@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZDSaoHnlZbYMfbV7@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/11 7:24, Jaegeuk Kim wrote: > On 04/10, Chao Yu
 wrote: >> On 2023/4/6 11:18, Jaegeuk Kim wrote: >>> On 04/06, Chao Yu wrote:
 >>>> On 2023/4/6 0:39, Jaegeuk Kim wrote: >>>>> On 03/27, Matthew [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pm9gd-0003MT-DB
Subject: Re: [f2fs-dev] [PATCH] f2fs: get out of a repeat loop when getting
 a locked data page
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/11 7:24, Jaegeuk Kim wrote:
> On 04/10, Chao Yu wrote:
>> On 2023/4/6 11:18, Jaegeuk Kim wrote:
>>> On 04/06, Chao Yu wrote:
>>>> On 2023/4/6 0:39, Jaegeuk Kim wrote:
>>>>> On 03/27, Matthew Wilcox wrote:
>>>>>> On Mon, Mar 27, 2023 at 08:30:33AM -0700, Jaegeuk Kim wrote:
>>>>>>> On 03/26, Chao Yu wrote:
>>>>>>>> On 2023/3/24 5:39, Jaegeuk Kim wrote:
>>>>>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=216050
>>>>>>>>>
>>>>>>>>> Somehow we're getting a page which has a different mapping.
>>>>>>>>> Let's avoid the infinite loop.
>>>>>>>>>
>>>>>>>>> Cc: <stable@vger.kernel.org>
>>>>>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>>>>>> ---
>>>>>>>>>      fs/f2fs/data.c | 8 ++------
>>>>>>>>>      1 file changed, 2 insertions(+), 6 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>>>>>>> index bf51e6e4eb64..80702c93e885 100644
>>>>>>>>> --- a/fs/f2fs/data.c
>>>>>>>>> +++ b/fs/f2fs/data.c
>>>>>>>>> @@ -1329,18 +1329,14 @@ struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
>>>>>>>>>      {
>>>>>>>>>      	struct address_space *mapping = inode->i_mapping;
>>>>>>>>>      	struct page *page;
>>>>>>>>> -repeat:
>>>>>>>>> +
>>>>>>>>>      	page = f2fs_get_read_data_page(inode, index, 0, for_write, NULL);
>>>>>>>>>      	if (IS_ERR(page))
>>>>>>>>>      		return page;
>>>>>>>>>      	/* wait for read completion */
>>>>>>>>>      	lock_page(page);
>>>>>>>>> -	if (unlikely(page->mapping != mapping)) {
>>>>>>>>
>>>>>>>> How about using such logic only for move_data_page() to limit affect for
>>>>>>>> other paths?
>>>>>>>
>>>>>>> Why move_data_page() only? If this happens, we'll fall into a loop in anywhere?
>>>>>>>
>>>>>>>>
>>>>>>>> Jaegeuk, any thoughts about why mapping is mismatch in between page's one and
>>>>>>>> inode->i_mapping?
>>>>>>>
>>>>>>>>
>>>>>>>> After several times code review, I didn't get any clue about why f2fs always
>>>>>>>> get the different mapping in a loop.
>>>>>>>
>>>>>>> I couldn't find the path to happen this. So weird. Please check the history in the
>>>>>>> bug.
>>>>>>>
>>>>>>>>
>>>>>>>> Maybe we can loop MM guys to check whether below folio_file_page() may return
>>>>>>>> page which has different mapping?
>>>>>>>
>>>>>>> Matthew may have some idea on this?
>>>>>>
>>>>>> There's a lot of comments in the bug ... hard to come into this one
>>>>>> cold.
>>>>>>
>>>>>> I did notice this one (#119):
>>>>>> : Interestingly, ref count is 514, which looks suspiciously as a binary
>>>>>> : flag 1000000010. Is it possible that during 5.17/5.18 implementation
>>>>>> : of a "pin", somehow binary flag was written to ref count, or something
>>>>>> : like '1 << ...' happens?
>>>>>>
>>>>>> That indicates to me that somehow you've got hold of a THP that is in
>>>>>> the page cache.  Probably shmem/tmpfs.  That indicate to me a refcount
>>>>>> problem that looks something like this:
>>>>>>
>>>>>> f2fs allocates a page
>>>>>> f2fs adds the page to the page cache
>>>>>> f2fs puts the reference to the page without removing it from the
>>>>>> page cache (how?)
>>>>>
>>>>> Is it somewhat related to setting a bit in private field?
>>>>
>>>> IIUC, it looks the page reference is added/removed as pair.
>>>>
>>>>>
>>>>> When we migrate the blocks, we do:
>>>>> 1) get_lock_page()
>>>>
>>>> - f2fs_grab_cache_page
>>>>    - pagecache_get_page
>>>>     - __filemap_get_folio
>>>>      - no_page  -> filemap_alloc_folio  page_ref = 1 (referenced by caller)
>>>>       - filemap_add_folio page_ref = 2 (referenced by radix tree)
>>>>
>>>>> 2) submit read
>>>>> 3) lock_page()
>>>>> 3) set_page_dirty()
>>>>> 4) set_page_private_gcing(page)
>>>>
>>>> page_ref = 3 (reference by private data)
>>>>
>>>>>
>>>>> --- in fs/f2fs/f2fs.h
>>>>> 1409 #define PAGE_PRIVATE_SET_FUNC(name, flagname) \
>>>>> 1410 static inline void set_page_private_##name(struct page *page) \
>>>>> 1411 { \
>>>>> 1412         if (!PagePrivate(page)) { \
>>>>> 1413                 get_page(page); \
>>>>> 1414                 SetPagePrivate(page); \
>>>>> 1415                 set_page_private(page, 0); \
>>>>> 1416         } \
>>>>> 1417         set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
>>>>> 1418         set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>>>>> 1419 }
>>>>>
>>>>>
>>>>> 5) set_page_writebac()
>>>>> 6) submit write
>>>>> 7) unlock_page()
>>>>> 8) put_page(page)
>>>>
>>>> page_ref = 2 (ref by caller was removed)
>>>>
>>>>>
>>>>> Later, f2fs_invalidate_folio will do put_page again by:
>>>>> clear_page_private_gcing(&folio->page);
>>>>
>>>> page_ref = 1 (ref by private was removed, and the last left ref is hold by radix tree)
>>>>
>>>>>
>>>>> --- in fs/f2fs/f2fs.h
>>>>> 1421 #define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
>>>>> 1422 static inline void clear_page_private_##name(struct page *page) \
>>>>> 1423 { \
>>>>> 1424         clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>>>>> 1425         if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) { \
>>>>> 1426                 set_page_private(page, 0); \
>>>>> 1427                 if (PagePrivate(page)) { \
>>>>> 1428                         ClearPagePrivate(page); \
>>>>
>>>> Since PagePrivate was cleared, so folio_detach_private in
>>>> f2fs_invalidate_folio()/f2fs_release_folio will just skip drop reference.
>>>>
>>>> static inline void *folio_detach_private(struct folio *folio)
>>>> {
>>>> 	void *data = folio_get_private(folio);
>>>>
>>>> 	if (!folio_test_private(folio))
>>>> 		return NULL;
>>>> 	folio_clear_private(folio);
>>>> 	folio->private = NULL;
>>>> 	folio_put(folio);
>>>>
>>>> 	return data;
>>>> }
>>>>
>>>> Or am I missing something?
>>>
>>> Ah, I missed folio_test_private() tho, can we really expect get_page(),
>>> SetPagePrivate(), and set_page_private() is in pair with folio_detach_private()?
>>
>> I guess we are trying to maintain PagePrivate and page_private w/
>> inner {set,clear}_page_private_* functions, if they are called in paired correctly,
>> we don't need to call folio_detach_private() additionally in .release_folio and
>> .invalid_folio, right? Otherwise there must be a bug.
> 
> Agreed.
> 
>>
>> In this patch, I use bug_on to instead folio_detach_private().
>> https://lore.kernel.org/linux-f2fs-devel/20230410022418.1843178-1-chao@kernel.org/
>>
>> In this patch, I use {attach,detach}_page_private() to clean up openned codes.
>> https://lore.kernel.org/linux-f2fs-devel/20230410022418.1843178-2-chao@kernel.org/
> 
> Looks like it doesn't need to apply two patches, 

Agreed,

> and missed f2fs_delete_entry case as well.

Good catch, I have another patch that only clean up set_page_private(),
but I guess your below implementation covers all cases, thanks! :)

Thanks,

> 
>  From 3fb0f570681dcd1c6c2f3e18ee7ff41428820b35 Mon Sep 17 00:00:00 2001
> From: Chao Yu <chao@kernel.org>
> Date: Mon, 10 Apr 2023 10:24:17 +0800
> Subject: [PATCH] f2fs: remove folio_detach_private() in .invalidate_folio and
>   .release_folio
> 
> We have maintain PagePrivate and page_private and page reference
> w/ {set,clear}_page_private_*, it doesn't need to call
> folio_detach_private() in the end of .invalidate_folio and
> .release_folio, remove it and use f2fs_bug_on instead.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> [Jaegeuk Kim: cover f2fs_delete_entry case]
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/data.c |  4 ++--
>   fs/f2fs/dir.c  |  5 ++---
>   fs/f2fs/f2fs.h | 32 ++++++++------------------------
>   3 files changed, 12 insertions(+), 29 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 5a3636b70f48..8870ff630409 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3734,7 +3734,7 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
>   			inode->i_ino == F2FS_COMPRESS_INO(sbi))
>   		clear_page_private_data(&folio->page);
>   
> -	folio_detach_private(folio);
> +	f2fs_bug_on(sbi, page_private(&folio->page));
>   }
>   
>   bool f2fs_release_folio(struct folio *folio, gfp_t wait)
> @@ -3756,7 +3756,7 @@ bool f2fs_release_folio(struct folio *folio, gfp_t wait)
>   	clear_page_private_reference(&folio->page);
>   	clear_page_private_gcing(&folio->page);
>   
> -	folio_detach_private(folio);
> +	f2fs_bug_on(sbi, page_private(&folio->page));
>   	return true;
>   }
>   
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index d6dd8327e82d..cea179dec3b6 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -906,13 +906,12 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
>   		clear_page_dirty_for_io(page);
>   		ClearPageUptodate(page);
>   
> +		clear_page_private_reference(page);
>   		clear_page_private_gcing(page);
> +		f2fs_bug_on(F2FS_I_SB(dir), page_private(page));
>   
>   		inode_dec_dirty_pages(dir);
>   		f2fs_remove_dirty_inode(dir);
> -
> -		detach_page_private(page);
> -		set_page_private(page, 0);
>   	}
>   	f2fs_put_page(page, 1);
>   
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 68eadc1ac130..1b1df9e33028 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1408,11 +1408,8 @@ static inline bool page_private_##name(struct page *page) \
>   #define PAGE_PRIVATE_SET_FUNC(name, flagname) \
>   static inline void set_page_private_##name(struct page *page) \
>   { \
> -	if (!PagePrivate(page)) { \
> -		get_page(page); \
> -		SetPagePrivate(page); \
> -		set_page_private(page, 0); \
> -	} \
> +	if (!PagePrivate(page)) \
> +		attach_page_private(page, (void *)0); \
>   	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
>   	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>   }
> @@ -1421,13 +1418,8 @@ static inline void set_page_private_##name(struct page *page) \
>   static inline void clear_page_private_##name(struct page *page) \
>   { \
>   	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
> -	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) { \
> -		set_page_private(page, 0); \
> -		if (PagePrivate(page)) { \
> -			ClearPagePrivate(page); \
> -			put_page(page); \
> -		}\
> -	} \
> +	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) \
> +		detach_page_private(page); \
>   }
>   
>   PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
> @@ -1456,11 +1448,8 @@ static inline unsigned long get_page_private_data(struct page *page)
>   
>   static inline void set_page_private_data(struct page *page, unsigned long data)
>   {
> -	if (!PagePrivate(page)) {
> -		get_page(page);
> -		SetPagePrivate(page);
> -		set_page_private(page, 0);
> -	}
> +	if (!PagePrivate(page))
> +		attach_page_private(page, (void *)0);
>   	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page));
>   	page_private(page) |= data << PAGE_PRIVATE_MAX;
>   }
> @@ -1468,13 +1457,8 @@ static inline void set_page_private_data(struct page *page, unsigned long data)
>   static inline void clear_page_private_data(struct page *page)
>   {
>   	page_private(page) &= GENMASK(PAGE_PRIVATE_MAX - 1, 0);
> -	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) {
> -		set_page_private(page, 0);
> -		if (PagePrivate(page)) {
> -			ClearPagePrivate(page);
> -			put_page(page);
> -		}
> -	}
> +	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER))
> +		detach_page_private(page);
>   }
>   
>   /* For compression */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
