Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A283E9926
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2019 10:28:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPkH0-00040A-GI; Wed, 30 Oct 2019 09:28:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iPkGz-000404-N9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 09:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b+vutZohqDBEzYAoh9+PHfnIhbSKTtyiP7T2tHH+Mbw=; b=a604jBbpHNiftmQPP0HfvHY1b1
 njAOAbqRwOICWyNGZPPAXDEzVVOVd77B9dNOmPGBVZDDR655SFl/HNlCfD/Nb6qdP6d9ZbgzO1FVx
 AwCxK//tIITP9vCkY+gj/zQt7OITdH/9ZlZuyVFXgPSEtGA19WLneqriH825TSMueRKY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b+vutZohqDBEzYAoh9+PHfnIhbSKTtyiP7T2tHH+Mbw=; b=dHGW4j7/JWfr4lKPUZYwqFft6Z
 20NbZBWEe61LQ5lxbYf9knqrS97Lc7KcQtP/0i72eKfy8YnZ+In+GwlSeDoXp503vhJB4NAfRyCd+
 Vf6qAmTfOCIMqQxeGN2JBYLy2aMrXLEeF1yssYGHP8u61g1d79kAvneceyOAsIhTeipw=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPkGx-00AgqM-1b
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 09:28:13 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EDCB5622CAB3BB28B0F6;
 Wed, 30 Oct 2019 17:28:03 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 30 Oct
 2019 17:27:55 +0800
To: Gao Xiang <gaoxiang25@huawei.com>
References: <20191030035518.65477-1-gaoxiang25@huawei.com>
 <20aa40bd-280d-d223-9f73-d9ed7dbe4f29@huawei.com>
 <20191030091542.GA24976@architecture4>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <19a417e6-8f0e-564e-bc36-59bfc883ec16@huawei.com>
Date: Wed, 30 Oct 2019 17:27:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191030091542.GA24976@architecture4>
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
X-Headers-End: 1iPkGx-00AgqM-1b
Subject: Re: [f2fs-dev] [PATCH] f2fs: bio_alloc should never fail
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
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Xiang,

On 2019/10/30 17:15, Gao Xiang wrote:
> Hi Chao,
> 
> On Wed, Oct 30, 2019 at 04:56:17PM +0800, Chao Yu wrote:
>> On 2019/10/30 11:55, Gao Xiang wrote:
>>> remove such useless code and related fault injection.
>>
>> Hi Xiang,
>>
>> Although, there is so many 'nofail' allocation in f2fs, I think we'd better
>> avoid such allocation as much as possible (now for read path, we may allow to
>> fail to allocate bio), I suggest to keep the failure path and bio allocation
>> injection.
>>
>> It looks bio_alloc() will use its own mempool, which may suffer deadlock
>> potentially. So how about changing to use bio_alloc_bioset(, , NULL) instead of
>> bio_alloc()?
> 
> Yes, I noticed the original commit 740432f83560 ("f2fs: handle failed bio allocation"),
> yet I don't find any real call trace clue what happened before.
> 
> As my understanding, if we allocate bios without submit_bio (I mean write path) with
> default bs and gfp_flags GFP_NOIO or GFP_KERNEL, I think it will be slept inside
> mempool rather than return NULL to its caller... Please correct me if I'm wrong...

I'm curious too...

Jaegeuk may know the details.

> 
> I could send another patch with bio_alloc_bioset(, , NULL), I am curious to know the
> original issue and how it solved though...
> 
> For read or flush path, since it will submit_bio and bio_alloc one by one, I think
> mempool will get a page quicker (memory failure path could be longer). But I can
> send a patch just by using bio_alloc_bioset(, , NULL) instead as you suggested later.

You're right, in low memory scenario, allocation with bioset will be faster, as
you mentioned offline, maybe we can add/use a priviate bioset like btrfs did
rather than using global one, however, we'd better check how deadlock happen
with a bioset mempool first ...

Thanks,

> 
> Thanks,
> Gao Xiang
> 
>>
>> Thanks,
>>
>>>
>>> Signed-off-by: Gao Xiang <gaoxiang25@huawei.com>
>>> ---
>>>  Documentation/filesystems/f2fs.txt |  1 -
>>>  fs/f2fs/data.c                     |  6 ++----
>>>  fs/f2fs/f2fs.h                     | 21 ---------------------
>>>  fs/f2fs/segment.c                  |  5 +----
>>>  fs/f2fs/super.c                    |  1 -
>>>  5 files changed, 3 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
>>> index 7e1991328473..3477c3e4c08b 100644
>>> --- a/Documentation/filesystems/f2fs.txt
>>> +++ b/Documentation/filesystems/f2fs.txt
>>> @@ -172,7 +172,6 @@ fault_type=%d          Support configuring fault injection type, should be
>>>                         FAULT_KVMALLOC		0x000000002
>>>                         FAULT_PAGE_ALLOC		0x000000004
>>>                         FAULT_PAGE_GET		0x000000008
>>> -                       FAULT_ALLOC_BIO		0x000000010
>>>                         FAULT_ALLOC_NID		0x000000020
>>>                         FAULT_ORPHAN		0x000000040
>>>                         FAULT_BLOCK		0x000000080
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index 5755e897a5f0..3b88dcb15de6 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -288,7 +288,7 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
>>>  	struct f2fs_sb_info *sbi = fio->sbi;
>>>  	struct bio *bio;
>>>  
>>> -	bio = f2fs_bio_alloc(sbi, npages, true);
>>> +	bio = bio_alloc(GFP_NOIO, npages);
>>>  
>>>  	f2fs_target_device(sbi, fio->new_blkaddr, bio);
>>>  	if (is_read_io(fio->op)) {
>>> @@ -682,9 +682,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>>>  	struct bio_post_read_ctx *ctx;
>>>  	unsigned int post_read_steps = 0;
>>>  
>>> -	bio = f2fs_bio_alloc(sbi, min_t(int, nr_pages, BIO_MAX_PAGES), false);
>>> -	if (!bio)
>>> -		return ERR_PTR(-ENOMEM);
>>> +	bio = bio_alloc(GFP_KERNEL, min_t(int, nr_pages, BIO_MAX_PAGES));
>>>  	f2fs_target_device(sbi, blkaddr, bio);
>>>  	bio->bi_end_io = f2fs_read_end_io;
>>>  	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index 4024790028aa..40012f874be0 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -44,7 +44,6 @@ enum {
>>>  	FAULT_KVMALLOC,
>>>  	FAULT_PAGE_ALLOC,
>>>  	FAULT_PAGE_GET,
>>> -	FAULT_ALLOC_BIO,
>>>  	FAULT_ALLOC_NID,
>>>  	FAULT_ORPHAN,
>>>  	FAULT_BLOCK,
>>> @@ -2210,26 +2209,6 @@ static inline void *f2fs_kmem_cache_alloc(struct kmem_cache *cachep,
>>>  	return entry;
>>>  }
>>>  
>>> -static inline struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi,
>>> -						int npages, bool no_fail)
>>> -{
>>> -	struct bio *bio;
>>> -
>>> -	if (no_fail) {
>>> -		/* No failure on bio allocation */
>>> -		bio = bio_alloc(GFP_NOIO, npages);
>>> -		if (!bio)
>>> -			bio = bio_alloc(GFP_NOIO | __GFP_NOFAIL, npages);
>>> -		return bio;
>>> -	}
>>> -	if (time_to_inject(sbi, FAULT_ALLOC_BIO)) {
>>> -		f2fs_show_injection_info(FAULT_ALLOC_BIO);
>>> -		return NULL;
>>> -	}
>>> -
>>> -	return bio_alloc(GFP_KERNEL, npages);
>>> -}
>>> -
>>>  static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
>>>  {
>>>  	if (sbi->gc_mode == GC_URGENT)
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index 808709581481..28457c878d0d 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -552,10 +552,7 @@ static int __submit_flush_wait(struct f2fs_sb_info *sbi,
>>>  	struct bio *bio;
>>>  	int ret;
>>>  
>>> -	bio = f2fs_bio_alloc(sbi, 0, false);
>>> -	if (!bio)
>>> -		return -ENOMEM;
>>> -
>>> +	bio = bio_alloc(GFP_KERNEL, 0);
>>>  	bio->bi_opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH;
>>>  	bio_set_dev(bio, bdev);
>>>  	ret = submit_bio_wait(bio);
>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>> index 1443cee15863..51945dd27f00 100644
>>> --- a/fs/f2fs/super.c
>>> +++ b/fs/f2fs/super.c
>>> @@ -44,7 +44,6 @@ const char *f2fs_fault_name[FAULT_MAX] = {
>>>  	[FAULT_KVMALLOC]	= "kvmalloc",
>>>  	[FAULT_PAGE_ALLOC]	= "page alloc",
>>>  	[FAULT_PAGE_GET]	= "page get",
>>> -	[FAULT_ALLOC_BIO]	= "alloc bio",
>>>  	[FAULT_ALLOC_NID]	= "alloc nid",
>>>  	[FAULT_ORPHAN]		= "orphan",
>>>  	[FAULT_BLOCK]		= "no more block",
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
