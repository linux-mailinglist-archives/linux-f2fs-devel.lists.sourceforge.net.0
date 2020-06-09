Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 110DC1F3240
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Jun 2020 04:20:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jiTsL-0002Hv-Sv; Tue, 09 Jun 2020 02:20:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jiTs9-0002GT-1k
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 02:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5oGRZ6FNMLX+AlcjM4RQ4FoQllQKJKBbTqVEhFchc2w=; b=JfZ1/wCT+c1Xd59X/Fq9D9KC6u
 p1Qz+8ZKSlsNNGl9dGZ25WhzeB40qGj4bUV2p4jBI1qSXgt02Fh2ROMxwn6fb+sbSExgJl6qldfuJ
 HJaEK44BX3BWd/9tgQwnNXyr7V1RzF8xA7xY0nGP3EnISGGKrsWgXRMX5jdoA8sCope8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5oGRZ6FNMLX+AlcjM4RQ4FoQllQKJKBbTqVEhFchc2w=; b=DPXL6VMHC1il3BaNSBF4unvS67
 LnpQnAcj1fYh5FxzV4yVIHu+5Z1gYBbr08TTqBuPDsTKkHDvknqpmmrWwMHDRliXMmvYEdM4Cf7dU
 xMnY7J4C57ZrAIV3oDst3kOuflQBPugbvYRMHhUW7eZFJiq4C5/wSGlasjUY+G+dweJ0=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jiTs7-00CCPy-3c
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 02:20:16 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B598DCF537F79E124808;
 Tue,  9 Jun 2020 10:20:07 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 9 Jun 2020
 10:20:01 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20200605045748.34018-1-ebiggers@kernel.org>
 <57c9bfa7-9b15-64e5-8b33-eb9829399f87@huawei.com>
 <20200609021121.GA43422@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0459e562-fcaf-ee2f-ad12-07aba11c5679@huawei.com>
Date: Tue, 9 Jun 2020 10:20:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200609021121.GA43422@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jiTs7-00CCPy-3c
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: don't return vmalloc() memory from
 f2fs_kmalloc()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/9 10:11, Eric Biggers wrote:
> On Tue, Jun 09, 2020 at 09:36:50AM +0800, Chao Yu wrote:
>> On 2020/6/5 12:57, Eric Biggers wrote:
>>> From: Eric Biggers <ebiggers@google.com>
>>>
>>> kmalloc() returns kmalloc'ed memory, and kvmalloc() returns either
>>> kmalloc'ed or vmalloc'ed memory.  But the f2fs wrappers, f2fs_kmalloc()
>>> and f2fs_kvmalloc(), both return both kinds of memory.
>>>
>>> It's redundant to have two functions that do the same thing, and also
>>> breaking the standard naming convention is causing bugs since people
>>> assume it's safe to kfree() memory allocated by f2fs_kmalloc().  See
>>> e.g. the various allocations in fs/f2fs/compress.c.
>>>
>>> Fix this by making f2fs_kmalloc() just use kmalloc().  And to avoid
>>> re-introducing the allocation failures that the vmalloc fallback was
>>> intended to fix, convert the largest allocations to use f2fs_kvmalloc().
>>>
>>> Signed-off-by: Eric Biggers <ebiggers@google.com>
>>> ---
>>>
>>> v2: also use f2fs_kvzalloc() in init_blkz_info()
>>>
>>>  fs/f2fs/checkpoint.c | 4 ++--
>>>  fs/f2fs/f2fs.h       | 8 +-------
>>>  fs/f2fs/node.c       | 8 ++++----
>>>  fs/f2fs/super.c      | 2 +-
>>>  4 files changed, 8 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>> index 3dc3ac6fe14324..23606493025165 100644
>>> --- a/fs/f2fs/checkpoint.c
>>> +++ b/fs/f2fs/checkpoint.c
>>> @@ -895,8 +895,8 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
>>>  	int i;
>>>  	int err;
>>>  
>>> -	sbi->ckpt = f2fs_kzalloc(sbi, array_size(blk_size, cp_blks),
>>> -				 GFP_KERNEL);
>>> +	sbi->ckpt = f2fs_kvzalloc(sbi, array_size(blk_size, cp_blks),
>>> +				  GFP_KERNEL);
>>>  	if (!sbi->ckpt)
>>>  		return -ENOMEM;
>>>  	/*
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index 50e6cdf20b7331..c812fb8e2d9c7a 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -2998,18 +2998,12 @@ static inline bool f2fs_may_extent_tree(struct inode *inode)
>>>  static inline void *f2fs_kmalloc(struct f2fs_sb_info *sbi,
>>>  					size_t size, gfp_t flags)
>>>  {
>>> -	void *ret;
>>> -
>>>  	if (time_to_inject(sbi, FAULT_KMALLOC)) {
>>>  		f2fs_show_injection_info(sbi, FAULT_KMALLOC);
>>>  		return NULL;
>>>  	}
>>>  
>>> -	ret = kmalloc(size, flags);
>>> -	if (ret)
>>> -		return ret;
>>> -
>>> -	return kvmalloc(size, flags);
>>> +	return kmalloc(size, flags);
>>
>> Then could we revert to use kfree instead of kvfree if memory was allocated
>> from f2fs_kmalloc()? though there is actual problem w/o reverting.
>>
> 
> Yes, I think we should prefer kfree() when the memory was allocated with
> f2fs_kmalloc().  It's not critical though, since kvfree() works on kmalloc'ed
> memory.  So it should be a separate patch later.

It's okay to me to clean up them later.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
