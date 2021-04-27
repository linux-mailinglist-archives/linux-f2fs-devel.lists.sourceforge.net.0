Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3599F36BD59
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Apr 2021 04:33:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbDWu-0005wu-3F; Tue, 27 Apr 2021 02:32:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lbDWs-0005wf-CV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 02:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N3rDbe2A5LZ4LqLa/foCu4JyC/xnnguWf7UJZJi3lQ0=; b=O7NUYR9apwIBh2t6kOPzvx4d59
 fZLvIMa63/6u00tA4nFordA4l31N/6hZVE2zadbDGYo7hIskKsxT4SQPwYwbY02/Hv8I9vlnSW/M9
 Zv3/4Obu9Ch4oWUFtXdufpxcE+Um+7hAdPB2EXj3zMZlogH9iguzFmjw1hdIbqS5Zxt8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N3rDbe2A5LZ4LqLa/foCu4JyC/xnnguWf7UJZJi3lQ0=; b=kEhRbG/8jYo1KUrXXeW7lKu9Bp
 4b+VkZLx6xUwyXJ4XxzaR5n0YnMMQe9u5Lt0X0TPzKu5K9qrTvCZlreM1M6pr1oUg1QUQnBnomcdP
 ywCq83S1+TvHp+zyBmyVOzgmnNwZhXGVmn7W6XglHR40VLDPO275zWvSEhpxQov9W4Lw=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lbDWo-00EyRW-NY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 02:32:50 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FTm276dwwz7vsT;
 Tue, 27 Apr 2021 10:30:07 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 27 Apr
 2021 10:32:30 +0800
To: Matthew Wilcox <willy@infradead.org>
References: <20210426100908.109435-1-yuchao0@huawei.com>
 <20210426154021.GN235567@casper.infradead.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <498cdef5-a528-1b65-4af8-906ae2ac3cac@huawei.com>
Date: Tue, 27 Apr 2021 10:32:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210426154021.GN235567@casper.infradead.org>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: bootlin.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lbDWo-00EyRW-NY
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: restructure f2fs page.private
 layout
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/4/26 23:40, Matthew Wilcox wrote:
> On Mon, Apr 26, 2021 at 06:09:08PM +0800, Chao Yu wrote:
>> Restruct f2fs page private layout for below reasons:
>>
>> There are some cases that f2fs wants to set a flag in a page to
>> indicate a specified status of page:
>> a) page is in transaction list for atomic write
>> b) page contains dummy data for aligned write
>> c) page is migrating for GC
>> d) page contains inline data for inline inode flush
>> e) page is verified in merkle tree for fsverity
> 
> hm, why do you need to record that?  I would have thought that if a file
> is marked as being protected by the merkle tree then any pages read in
> would be !uptodate until the merkle tree verification had happened.

I should describe more clearly about the page, the page is belong to merkle
tree, rather than the one contains user data, for more details:

https://elixir.bootlin.com/linux/latest/source/fs/verity/verify.c#L69

> 
>> f) page is dirty and has filesystem/inode reference count for writeback
>> g) page is temporary and has decompress io context reference for compression
>>
>> There are existed places in page structure we can use to store
>> f2fs private status/data:
>> - page.flags: PG_checked, PG_private
>> - page.private
>>
>> However it was a mess when we using them, which may cause potential
>> confliction:
>> 		page.private	PG_private	PG_checked
>> a)		-1		set
>> b)		-2

Sorry,

b) should have set PG_private.

>> c), d), e)					set
>> f)		0		set
>> g)		pointer		set
>>
>> The other problem is page.flags has no free slot, if we can avoid set
>> zero to page.private and set PG_private flag, then we use non-zero value
>> to indicate PG_private status, so that we may have chance to reclaim
>> PG_private slot for other usage. [1]
>>
>> So in this patch let's restructure f2fs' page.private as below:
>>
>> Layout A: lowest bit should be 1
>> | bit0 = 1 | bit1 | bit2 | ... | bit MAX | private data .... |
>>   bit 0	PAGE_PRIVATE_NOT_POINTER
>>   bit 1	PAGE_PRIVATE_ATOMIC_WRITE
>>   bit 2	PAGE_PRIVATE_DUMMY_WRITE
>>   bit 3	PAGE_PRIVATE_ONGOING_MIGRATION
>>   bit 4	PAGE_PRIVATE_INLINE_INODE
>>   bit 5	PAGE_PRIVATE_REF_RESOURCE
>>   bit 6-	f2fs private data
>>
>> Layout B: lowest bit should be 0
>>   page.private is a wrapped pointer.
>>
>> After the change:
>> 		page.private	PG_private	PG_checked
>> a)		11		set
>> b)		101

ditto,

>> c)		1001
>> d)		10001
>> e)						set
>> f)		100001		set
>> g)		pointer		set
> 
> Mmm ... this isn't enough to let us remove PG_private.  We'd need PG_private
> to be set for b,c,d as well.

I can try to add PG_private for c) and d).

> 
>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>> index 817d0bcb5c67..e393a67a023c 100644
>> --- a/fs/f2fs/checkpoint.c
>> +++ b/fs/f2fs/checkpoint.c
>> @@ -444,7 +444,11 @@ static int f2fs_set_meta_page_dirty(struct page *page)
>>   	if (!PageDirty(page)) {
>>   		__set_page_dirty_nobuffers(page);
>>   		inc_page_count(F2FS_P_SB(page), F2FS_DIRTY_META);
>> -		f2fs_set_page_private(page, 0);
>> +		set_page_private_reference(page);
>> +		if (!PagePrivate(page)) {
>> +			SetPagePrivate(page);
>> +			get_page(page);
>> +		}
> 
> I'm not a big fan of this pattern (which seems to be repeated quite often)
> I think it should be buried within set_page_private_reference().  Also,

Let me check how to avoid duplicated codes.

> are the states abcdf all mutually exclusive, or can a page be in states
> (eg) b and d at the same time?

Not all states are mutually exclusive, e.g a) and f) are mutually exclusive.

> 
>> -		if (IS_DUMMY_WRITTEN_PAGE(page)) {
>> -			set_page_private(page, (unsigned long)NULL);
>> +		if (page_private_dummy(page)) {
>> +			clear_page_private_dummy(page);
>>   			ClearPagePrivate(page);
> 
> I think the ClearPagePrivate should be buried in the page_private_dummy()
> macro too ... and shouldn't there be a put_page() for this too?

b) and g) are allocated from mempool, should we add one extra reference
count for them after set PG_private?

Thanks,

> 
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
