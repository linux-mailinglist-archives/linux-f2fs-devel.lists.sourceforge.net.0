Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E1A6D8CF2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Apr 2023 03:50:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkElT-0003rC-6p;
	Thu, 06 Apr 2023 01:50:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pkElR-0003r6-LG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 01:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XmQvIiYi/4i07AFgDk5IgQ9ctrFqbVOjaV5M6jy/SzE=; b=SrE6P02SsUvrTYlhM6SLP8drGe
 e3bEgdLa7MOjPp5KZ1bL6RYDc9XlXQCHAu1NgFXAsf1HRsfFYEkiiqu4ODQvNIF1iRwVGemIGqDXH
 2zAX2UBegv9xnew/fIuXfJ9Hrm4Us5l/pEteGhyJkzE7CQZcjtY8RSEbztUN9x0wZJo8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XmQvIiYi/4i07AFgDk5IgQ9ctrFqbVOjaV5M6jy/SzE=; b=KXi3hzPffzAZtSewvS/sWVOp8+
 cNe5M/U/pyRrLhIUdK4VBnr6q1j430phaFIqTFfSEnVzgZpkH/uZhX3RgWhWmP1pfa9SdJC2YMOCZ
 m+1KR7h+mVTxrC4BcNpwoajqXmnWmlXvraMJNr0zN0phF0FMk+zM2ThX5uBkTl15QWgI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkElP-00GSC7-TW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 01:50:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B163464185;
 Thu,  6 Apr 2023 01:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A1FC433D2;
 Thu,  6 Apr 2023 01:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680745805;
 bh=xgpkfNiyM2OsqZ9AjY4VjyDtc1aONna/URR/VaLtHlg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aAton7TQlCgNxi38nrF0Di/+BG0JaOPRYgDRjd1hEVudb3rurcj+JPE0hrpS3vP5m
 kLdFzQLeoFO56ngekzX4tlDDvgneNXs2IdyLX8wM8TFOAwo+fbg0nBJL5GzOJutRQQ
 jR9xmxItGDDCvR+PCEOPfCVEIW7/CfpSfqQ5o5J/qsIjAvT1OJq14igoRsFBs4EOAV
 exhqmAZpsf8eXQXoSl2iwZxvW4CTjZ4TOYr4/soe3ULjuM2g70H68PflMyx4rqbtpr
 0LrcBmGc+VK7K+n3Zwr78O4tpUkonUXd8mhRnN/Dk4pOKux0Gu6DZ2FWpazv9NS2cW
 hg3kSO5Ef2qJQ==
Message-ID: <9dc4ba32-5be5-26d8-5dd2-9bd48d6b0af4@kernel.org>
Date: Thu, 6 Apr 2023 09:50:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Matthew Wilcox <willy@infradead.org>
References: <20230323213919.1876157-1-jaegeuk@kernel.org>
 <8aea02b0-86f9-539a-02e9-27b381e68b66@kernel.org>
 <ZCG2mfviZfY1dqb4@google.com> <ZCHCykI/BLcfDzt7@casper.infradead.org>
 <ZC2kSfNUXKK4PfpM@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZC2kSfNUXKK4PfpM@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/6 0:39, Jaegeuk Kim wrote: > On 03/27,
 Matthew Wilcox
 wrote: >> On Mon, Mar 27, 2023 at 08:30:33AM -0700, Jaegeuk Kim wrote: >>>
 On 03/26, Chao Yu wrote: >>>> On 2023/3/24 5:39, Jaegeuk Kim [...] 
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
X-Headers-End: 1pkElP-00GSC7-TW
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/6 0:39, Jaegeuk Kim wrote:
> On 03/27, Matthew Wilcox wrote:
>> On Mon, Mar 27, 2023 at 08:30:33AM -0700, Jaegeuk Kim wrote:
>>> On 03/26, Chao Yu wrote:
>>>> On 2023/3/24 5:39, Jaegeuk Kim wrote:
>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=216050
>>>>>
>>>>> Somehow we're getting a page which has a different mapping.
>>>>> Let's avoid the infinite loop.
>>>>>
>>>>> Cc: <stable@vger.kernel.org>
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>> ---
>>>>>    fs/f2fs/data.c | 8 ++------
>>>>>    1 file changed, 2 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>>> index bf51e6e4eb64..80702c93e885 100644
>>>>> --- a/fs/f2fs/data.c
>>>>> +++ b/fs/f2fs/data.c
>>>>> @@ -1329,18 +1329,14 @@ struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
>>>>>    {
>>>>>    	struct address_space *mapping = inode->i_mapping;
>>>>>    	struct page *page;
>>>>> -repeat:
>>>>> +
>>>>>    	page = f2fs_get_read_data_page(inode, index, 0, for_write, NULL);
>>>>>    	if (IS_ERR(page))
>>>>>    		return page;
>>>>>    	/* wait for read completion */
>>>>>    	lock_page(page);
>>>>> -	if (unlikely(page->mapping != mapping)) {
>>>>
>>>> How about using such logic only for move_data_page() to limit affect for
>>>> other paths?
>>>
>>> Why move_data_page() only? If this happens, we'll fall into a loop in anywhere?
>>>
>>>>
>>>> Jaegeuk, any thoughts about why mapping is mismatch in between page's one and
>>>> inode->i_mapping?
>>>
>>>>
>>>> After several times code review, I didn't get any clue about why f2fs always
>>>> get the different mapping in a loop.
>>>
>>> I couldn't find the path to happen this. So weird. Please check the history in the
>>> bug.
>>>
>>>>
>>>> Maybe we can loop MM guys to check whether below folio_file_page() may return
>>>> page which has different mapping?
>>>
>>> Matthew may have some idea on this?
>>
>> There's a lot of comments in the bug ... hard to come into this one
>> cold.
>>
>> I did notice this one (#119):
>> : Interestingly, ref count is 514, which looks suspiciously as a binary
>> : flag 1000000010. Is it possible that during 5.17/5.18 implementation
>> : of a "pin", somehow binary flag was written to ref count, or something
>> : like '1 << ...' happens?
>>
>> That indicates to me that somehow you've got hold of a THP that is in
>> the page cache.  Probably shmem/tmpfs.  That indicate to me a refcount
>> problem that looks something like this:
>>
>> f2fs allocates a page
>> f2fs adds the page to the page cache
>> f2fs puts the reference to the page without removing it from the
>> page cache (how?)
> 
> Is it somewhat related to setting a bit in private field?

IIUC, it looks the page reference is added/removed as pair.

> 
> When we migrate the blocks, we do:
> 1) get_lock_page()

- f2fs_grab_cache_page
  - pagecache_get_page
   - __filemap_get_folio
    - no_page  -> filemap_alloc_folio  page_ref = 1 (referenced by caller)
     - filemap_add_folio page_ref = 2 (referenced by radix tree)

> 2) submit read
> 3) lock_page()
> 3) set_page_dirty()
> 4) set_page_private_gcing(page)

page_ref = 3 (reference by private data)

> 
> --- in fs/f2fs/f2fs.h
> 1409 #define PAGE_PRIVATE_SET_FUNC(name, flagname) \
> 1410 static inline void set_page_private_##name(struct page *page) \
> 1411 { \
> 1412         if (!PagePrivate(page)) { \
> 1413                 get_page(page); \
> 1414                 SetPagePrivate(page); \
> 1415                 set_page_private(page, 0); \
> 1416         } \
> 1417         set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
> 1418         set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
> 1419 }
> 
> 
> 5) set_page_writebac()
> 6) submit write
> 7) unlock_page()
> 8) put_page(page)

page_ref = 2 (ref by caller was removed)

> 
> Later, f2fs_invalidate_folio will do put_page again by:
> clear_page_private_gcing(&folio->page);

page_ref = 1 (ref by private was removed, and the last left ref is hold by radix tree)

> 
> --- in fs/f2fs/f2fs.h
> 1421 #define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
> 1422 static inline void clear_page_private_##name(struct page *page) \
> 1423 { \
> 1424         clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
> 1425         if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) { \
> 1426                 set_page_private(page, 0); \
> 1427                 if (PagePrivate(page)) { \
> 1428                         ClearPagePrivate(page); \

Since PagePrivate was cleared, so folio_detach_private in
f2fs_invalidate_folio()/f2fs_release_folio will just skip drop reference.

static inline void *folio_detach_private(struct folio *folio)
{
	void *data = folio_get_private(folio);

	if (!folio_test_private(folio))
		return NULL;
	folio_clear_private(folio);
	folio->private = NULL;
	folio_put(folio);

	return data;
}

Or am I missing something?

Thanks,

> 1429                         put_page(page); \
> 1430                 }\
> 1431         } \
> 1432 }
> 
>> page is now free, gets reallocated into a THP
>> lookup from the f2fs file finds the new THP
>> things explode messily
>>
>> Checking page->mapping is going to avoid the messy explosion, but
>> you'll still have a page in the page cache which doesn't actually
>> belong to you, and that's going to lead to subtle data corruption.
>>
>> This should be caught by page_expected_state(), called from
>> free_page_is_bad(), called from free_pages_prepare().  Do your testers
>> have CONFIG_DEBUG_VM enabled?  That might give you a fighting chance at
>> finding the last place which called put_page().  It won't necessarily be
>> the _wrong_ place to call put_page() (that may have happened earlier),
>> but it may give you a clue.
>>
>>>>
>>>> struct page *pagecache_get_page(struct address_space *mapping, pgoff_t index,
>>>> 		int fgp_flags, gfp_t gfp)
>>>> {
>>>> 	struct folio *folio;
>>>>
>>>> 	folio = __filemap_get_folio(mapping, index, fgp_flags, gfp);
>>>> 	if (IS_ERR(folio))
>>>> 		return NULL;
>>>> 	return folio_file_page(folio, index);
>>>> }
>>>>
>>>> Thanks,
>>>>
>>>>> -		f2fs_put_page(page, 1);
>>>>> -		goto repeat;
>>>>> -	}
>>>>> -	if (unlikely(!PageUptodate(page))) {
>>>>> +	if (unlikely(page->mapping != mapping || !PageUptodate(page))) {
>>>>>    		f2fs_put_page(page, 1);
>>>>>    		return ERR_PTR(-EIO);
>>>>>    	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
