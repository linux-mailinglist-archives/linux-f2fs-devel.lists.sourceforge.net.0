Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7770A3DE3EA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Aug 2021 03:19:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mAj5a-0002eT-1F; Tue, 03 Aug 2021 01:19:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mAj5Z-0002eM-3h
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Aug 2021 01:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jtqpCoq6H9fJ8FARxL9O9hresNR9/wCHaOc/1ymBQUw=; b=Q1DsIMq52AxGj1WnowTS6ThGOK
 q/Ds7V7xYprB5TWxRq/k8BCU4Hcp4LEaenqJvu25I8/cnISGdgpErBSa0fW6MArLKwiXAYGOVBWoD
 Z4IWiOA6LunQdTRBIHds3Qe7b7ADyFNHTyIHzorNxpeAigtjmTpFMjmztX2W9nnU/1gc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jtqpCoq6H9fJ8FARxL9O9hresNR9/wCHaOc/1ymBQUw=; b=UFcnb0dA4p7NNymm+Aw2EKcjBw
 163FKGYf2+EWzlbTRN3XrIoFEetygrByvnFoP6+5v6afCGK+DauflCsp1IZFOpBzeCzSx4tLU+MCo
 +/VS0MjzVHJSGbcpQ6C9ggnn//RebcmyV1hivqTwZqKjqbtq9pIbfu5frKTLRKgNJsHg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mAj5X-00Ah0L-Sv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Aug 2021 01:19:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6B6160EFF;
 Tue,  3 Aug 2021 01:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627953553;
 bh=MHctK3vcMIjG05hTw3nq1KHBUvlKG/a6cUvMRnmiMgo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=otLihmXIjm3Jzy/9vU4q9nxn0/nRX7PKb+ZudFug5dZkAcF5YJ1hEkacyu+pCUwyl
 kM6F9L9UtbV+xwka6uICieOxPxzHcnb5pdvLS4W9cg7qlxkid1m0wM53FChBbyDc0+
 d49OmCuBKHGpculT+u4t9wZTV/OTQeC+NfTOnvvBoSYGTG/M4TTwbMHK7F5FYA2z3Z
 +V6D/flUop3Dr8KWHGC75G3rsKtO+r04100yeVIRSTUKeCevJJnJIJ4D4JMbIxByyR
 E36MPG7BgCJ0bHaT5d0GcPBd+rUjRa4ZrxvTu+FGH45MZHVhlxmDdZTnAK/eMRlQMy
 4ueBpUe894USg==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210728015154.171507-1-ebiggers@kernel.org>
 <YQRQRh1zUHSIzcC/@gmail.com> <YQS5eBljtztWwOFE@mit.edu>
 <YQd3Hbid/mFm0o24@sol.localdomain>
 <a3cdd7cb-50a7-1b37-fe58-dced586712a2@kernel.org>
 <YQg4Lukc2dXX3aJc@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <b88328b4-db3e-0097-d8cc-f250ee678e5b@kernel.org>
Date: Tue, 3 Aug 2021 09:19:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQg4Lukc2dXX3aJc@google.com>
Content-Language: en-US
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mAj5X-00Ah0L-Sv
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove broken support for allocating
 DIO writes
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/3 2:23, Jaegeuk Kim wrote:
> On 08/02, Chao Yu wrote:
>> On 2021/8/2 12:39, Eric Biggers wrote:
>>> On Fri, Jul 30, 2021 at 10:46:16PM -0400, Theodore Ts'o wrote:
>>>> On Fri, Jul 30, 2021 at 12:17:26PM -0700, Eric Biggers wrote:
>>>>>> Currently, non-overwrite DIO writes are fundamentally unsafe on f2fs as
>>>>>> they require preallocating blocks, but f2fs doesn't support unwritten
>>>>>> blocks and therefore has to preallocate the blocks as regular blocks.
>>>>>> f2fs has no way to reliably roll back such preallocations, so as a
>>>>>> result, f2fs will leak uninitialized blocks to users if a DIO write
>>>>>> doesn't fully complete.
>>>>
>>>> There's another way of solving this problem which doesn't require
>>>> supporting unwritten blocks.  What a file system *could* do is to
>>>> allocate the blocks, but *not* update the on-disk data structures ---
>>>> so the allocation happens in memory only, so you know that the
>>>> physical blocks won't get used for another files, and then issue the
>>>> data block writes.  On the block I/O completion, trigger a workqueue
>>>> function which updates the on-disk metadata to assign physical blocks
>>>> to the inode.
>>>>
>>>> That way if you crash before the data I/O has a chance to complete,
>>>> the on-disk logical block -> physical block map hasn't been updated
>>>> yet, and so you don't need to worry about leaking uninitialized blocks.
>>
>> Thanks for your suggestion, I think it makes sense.
>>
>>>>
>>>> Cheers,
>>>>
>>>> 					- Ted
>>>
>>> Jaegeuk and Chao, any idea how feasible it would be for f2fs to do this?
>>
>> Firstly, let's notice that below metadata will be touched during DIO
>> preallocation flow:
>> - log header
>> - sit bitmap/count
>> - free seg/sec bitmap/count
>> - dirty seg/sec bitmap/count
>>
>> And there is one case we need to concern about is: checkpoint() can be
>> triggered randomly in between dio_preallocate() and dio_end_io(), we should
>> not persist any DIO preallocation related metadata during checkpoint(),
>> otherwise, sudden power-cut after the checkpoint will corrupt filesytem.
>>
>> So it needs to well separate two kinds of metadata update:
>> a) belong to dio preallocation
>> b) the left one
>>
>> After that, it will simply checkpoint() flow to just flush metadata b), for
>> other flow, like GC, data/node allocation, it needs to query/update metadata
>> after we combine metadata a) and b).
>>
>> In addition, there is an existing in-memory log header framework in f2fs,
>> based on this fwk, it's very easy for us to add a new in-memory log header
>> for DIO preallocation.
>>
>> So it seems feasible for me until now...
>>
>> Jaegeuk, any other concerns about the implementation details?
> 
> Hmm, I'm still trying to deal with this as a corner case where the writes
> haven't completed due to an error. How about keeping the preallocated block
> offsets and releasing them if we get an error? Do we need to handle EIO right?

What about the case that CP + SPO following DIO preallocation? User will
encounter uninitialized block after recovery.

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>> - Eric
>>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
