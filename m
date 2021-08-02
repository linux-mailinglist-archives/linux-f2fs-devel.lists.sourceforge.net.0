Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 786023DD27C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Aug 2021 11:00:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mAToN-0003CC-1P; Mon, 02 Aug 2021 09:00:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mAToL-0003BP-6j
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Aug 2021 09:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J3FBLLb4BbWbdc2wnMLOgBCam6BTXPUvTyz8DrBg4Uo=; b=Jpm5LMop0bmZP+QkHEFfe0G3Q/
 R39tsCk491Y2HF+ONB3QP4JDzOkOejbgaJ9vDoOOowABFJeRyCodCKoH6dSa0lrU7X93XPYrqv5vc
 AfJsxN2YPmzXnT1YHEQXHWlu78UgvaQ/bCJxMnQWclK6DonJZ/FyzHm42Zxhp7kg6kbg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J3FBLLb4BbWbdc2wnMLOgBCam6BTXPUvTyz8DrBg4Uo=; b=fv1gr/E76aW4Jl6wRDKsTFVp+e
 ylaivPPdl+6z9OlJuL8ETdahfIeg0AFizyVVosscU+OGIKAR1R/LuYXW8ooYqpEuom0aI6k8qYs/8
 ElZ+KJ59uo85/pxvmJDgW0Iy0jQlxjEtX5Wmz/9+VL0yBSbznGAI1Pz0clB+Vtf+rFGg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mAToC-0003ag-JW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Aug 2021 09:00:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6832860EBD;
 Mon,  2 Aug 2021 09:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627894817;
 bh=NpGYxMxPtr0QSqg+p3P23qf5aNI0HOKU5NMbrglC06Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RdoQGF598VsHZscJC5HMR3we486QnR63NlWZ5ruA3kXqcyZu1Xq5eGtri+xlTiPFZ
 z+Pzx3D4O+YR5+qVkKcRl9Lp7NtBn4jBuNi2KOmY5qq3fzArDmV432u2NUXjwtpPDB
 vX/7/MQbJnNmRXLtumUOdf5EHFZHfKUr96PqD1Yn5PclZQvXQYNketFumi4dcgsI0k
 X7RImEgtiF1tVMlS0ImsrsZ37cnFyq/Aoh533Cjzq/3VH2BABrTQAe4ZoQeEke4/rW
 I6YZb1I5/DL/NEarggj7M4msoiSivQpXYNOVBih4zMEloTJF2bhwC2SSRvDJA9srnB
 q8sIRtOirdNMw==
To: Eric Biggers <ebiggers@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>
References: <20210728015154.171507-1-ebiggers@kernel.org>
 <YQRQRh1zUHSIzcC/@gmail.com> <YQS5eBljtztWwOFE@mit.edu>
 <YQd3Hbid/mFm0o24@sol.localdomain>
From: Chao Yu <chao@kernel.org>
Message-ID: <a3cdd7cb-50a7-1b37-fe58-dced586712a2@kernel.org>
Date: Mon, 2 Aug 2021 17:00:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQd3Hbid/mFm0o24@sol.localdomain>
Content-Language: en-US
X-Spam-Score: -0.9 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mAToC-0003ag-JW
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
Cc: linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/2 12:39, Eric Biggers wrote:
> On Fri, Jul 30, 2021 at 10:46:16PM -0400, Theodore Ts'o wrote:
>> On Fri, Jul 30, 2021 at 12:17:26PM -0700, Eric Biggers wrote:
>>>> Currently, non-overwrite DIO writes are fundamentally unsafe on f2fs as
>>>> they require preallocating blocks, but f2fs doesn't support unwritten
>>>> blocks and therefore has to preallocate the blocks as regular blocks.
>>>> f2fs has no way to reliably roll back such preallocations, so as a
>>>> result, f2fs will leak uninitialized blocks to users if a DIO write
>>>> doesn't fully complete.
>>
>> There's another way of solving this problem which doesn't require
>> supporting unwritten blocks.  What a file system *could* do is to
>> allocate the blocks, but *not* update the on-disk data structures ---
>> so the allocation happens in memory only, so you know that the
>> physical blocks won't get used for another files, and then issue the
>> data block writes.  On the block I/O completion, trigger a workqueue
>> function which updates the on-disk metadata to assign physical blocks
>> to the inode.
>>
>> That way if you crash before the data I/O has a chance to complete,
>> the on-disk logical block -> physical block map hasn't been updated
>> yet, and so you don't need to worry about leaking uninitialized blocks.

Thanks for your suggestion, I think it makes sense.

>>
>> Cheers,
>>
>> 					- Ted
> 
> Jaegeuk and Chao, any idea how feasible it would be for f2fs to do this?

Firstly, let's notice that below metadata will be touched during DIO
preallocation flow:
- log header
- sit bitmap/count
- free seg/sec bitmap/count
- dirty seg/sec bitmap/count

And there is one case we need to concern about is: checkpoint() can be
triggered randomly in between dio_preallocate() and dio_end_io(), we should
not persist any DIO preallocation related metadata during checkpoint(),
otherwise, sudden power-cut after the checkpoint will corrupt filesytem.

So it needs to well separate two kinds of metadata update:
a) belong to dio preallocation
b) the left one

After that, it will simply checkpoint() flow to just flush metadata b), for
other flow, like GC, data/node allocation, it needs to query/update metadata
after we combine metadata a) and b).

In addition, there is an existing in-memory log header framework in f2fs,
based on this fwk, it's very easy for us to add a new in-memory log header
for DIO preallocation.

So it seems feasible for me until now...

Jaegeuk, any other concerns about the implementation details?

Thanks,

> 
> - Eric
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
