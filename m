Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B76C2D3849
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 02:34:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmoNE-0004H4-NJ; Wed, 09 Dec 2020 01:34:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmoND-0004Gx-HA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 01:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BNzy3mPSEsWf2padmVwfMzST40N8of74D5wBwR4sa9I=; b=aqB4xr8G86t5yyC7eNG1RjwSsv
 WX7Ns5LIXGrpWHUYmcH+9I4Nf8ugIxE/GuA8dKIEQrmQSQ02sxU9O6Wrg4FGe8tCfUbbjSQwuBP0H
 dz8VBlzqTM2yvSAa3Bsq1F3JcHUOYyUVH/eGZFi4SqsaGhcd1xeEPA/j68quZz6CRK2s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BNzy3mPSEsWf2padmVwfMzST40N8of74D5wBwR4sa9I=; b=mLJJ0IfXScGoCBsWfmQvPgFacO
 r3bZ2hbiuQl6V7HHycmo6pH9kj72anmnX1nyW9tdQ3mVU0ybs9EJezDzHBpc99IpCx5M3zP8xFAsy
 p9P8yrz/eWwDVq0lbLCQQGQME1ygdQJN03xvtlBZO0Gxt4xaPwXAqDpzFIyPe1WikrJU=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmoMz-004J1D-50
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 01:34:31 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CrKLx3kDKzM22W;
 Wed,  9 Dec 2020 09:33:29 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 9 Dec 2020
 09:34:07 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>
References: <20201205042626.1113600-1-daeho43@gmail.com>
 <X86RJdLhOVRm28Eu@gmail.com>
 <CACOAw_yp0LU-vcT2+NTF3ipibF6GvqfaQ4V=957CDPQLbes92Q@mail.gmail.com>
 <X88ZC4f2hZxAU3C0@gmail.com> <X9ASZV4ZBBPxCpU/@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <55db08c3-6b3f-a78b-c40d-7f61cd7693b7@huawei.com>
Date: Wed, 9 Dec 2020 09:34:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X9ASZV4ZBBPxCpU/@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kmoMz-004J1D-50
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix race of pending_pages in
 decompression
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
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/9 7:55, Jaegeuk Kim wrote:
> On 12/07, Eric Biggers wrote:
>> On Tue, Dec 08, 2020 at 08:51:45AM +0900, Daeho Jeong wrote:
>>>> I am trying to review this but it is very hard, as the f2fs compression code is
>>>> very hard to understand.
>>>>
>>>> It looks like a 'struct decompress_io_ctx' represents the work to decompress a
>>>> particular cluster.  Since the compressed data of the cluster can be read using
>>>> multiple bios, there is a reference count of how many pages are remaining to be
>>>> read before all the cluster's pages have been read and decompression can start.
>>>>
>>>> What I don't understand is why that reference counting needs to work differently
>>>> depending on whether verity is enabled or not.  Shouldn't it be exactly the
>>>> same?
>>>>
>>>> There also seems to be some confusion about the scope of STEP_VERITY.  Before
>>>> f2fs compression was added, it was a per-bio thing.  But now in a compressed
>>>> file, it's really a per-cluster thing, since all decompressed pages in a
>>>> compressed cluster are verified (or not verified) at once.
>>>>
>>>> Wouldn't it make a lot more sense to, when a cluster needs both compression and
>>>> verity, *not* set STEP_VERITY on the bios, but rather set a similar flag in the
>>>> decompress_io_ctx?
>>>>
>>>
>>> Eric,
>>>
>>> Decompression and verity can be executed in different thread contexts
>>> in different timing, so we need separate counts for each.
>>>
>>> We already use STEP_VERITY for non-compression case, so I think using
>>> this flag in here looks more making sense.
>>>
>>> Thanks,
>>
>> That didn't really answer my questions.
>>
>> I gave up trying to review this patch as the compression post-read handling is
>> just way too weird and hard to understand.  I wrote a patch to clean it all up
>> instead, please take a look:
>> https://lkml.kernel.org/r/20201208060328.2237091-1-ebiggers@kernel.org
> 
> Eric,
> I also tried to review your patch, but it's quite hard to follow quickly and

Me too, it needs more time to check whether the cleanup doesn't miss any cases.

Thanks,

> requires stress tests for a while. Given upcoming merge window and urgency of
> the bug, let me apply Daeho's fix first. By any chance, may I ask revisiting
> your clean-up on top of the fix in the next cycle?
> 
> Thanks,
> 
>>
>> - Eric
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
