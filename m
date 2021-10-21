Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF304360E4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Oct 2021 13:58:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mdWi2-0007ok-FU; Thu, 21 Oct 2021 11:58:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mdWi1-0007od-7I
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Oct 2021 11:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=De2aWUFGXfPgcW7Ks/Jqg3MyyzZpFKqOMDEmC4GVE8U=; b=kPWR/RupLIUVgZzDvjqMjhsu6F
 iZK9wVVkew9cI1IBwEXmc+2NUkdfYOir1cP4ZLle9Q33eaN8nNKODJcO/y0GtW6gPgVfpvjW8palj
 eSCZtiKLYtOcq7gJEDL/m1gXVQcXYZjEKr5wVSVfpnfqw1vSgodloYq8tYP1vu44o2CE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=De2aWUFGXfPgcW7Ks/Jqg3MyyzZpFKqOMDEmC4GVE8U=; b=VLRpfK83sYFDaejKkZUoT8UXKY
 skg7UpeD286O1CPSTuiJDnLnfE+NclISp+zzWxIAL3NHUiJ+dU0Ysdnr8daCbF7G15kc0hiPrN5kA
 xYhS18D19eYQuquVW8PjF2QCxCPVOmpCbliY/rXpnK1z3rAz12c90FcUFDDXta0VD40Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mdWhv-00A7y6-RF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Oct 2021 11:58:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC94660F22;
 Thu, 21 Oct 2021 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634817476;
 bh=FI5zjAvgpFtbujHaLjIRZZ9miEtCJgOm98z+ZpAbpFA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=koZ1TPZkogsxfLWQk7gj3QhKrMYcXgUes2yIutoCFQlcql72aGSZhEjSghWftLmKR
 hWLNyiaveBy4Eyej59LpdDqtLHqU8KHvmYrIuvaMZR0oxssLak0jxuTy91f514c9XF
 +vVtR3IetaUiEmicD8D/pUkko0PGJrmHmf+2DMB78KV7BAx9JPARWWqNjI2rmqA9rU
 vTvNgDrLRP96RIn/BehzqvGRVzuc8WStUL/CnVM8pg4DB79n6BjOz7DTd/0TdmwE5X
 5Gk9gLPK4ixoWrB/fc8Wi009cXwSPXgQbM/SgKZRh6oo+jl5U+XrUADXhkVVacM+Z8
 M+md8O2GeXTaQ==
Message-ID: <02abeeba-c359-cae3-4759-ee2087f21cc9@kernel.org>
Date: Thu, 21 Oct 2021 19:57:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>
References: <20211006174910.2964885-1-daeho43@gmail.com>
 <5743eeca-a6e8-87d4-5799-c622fbada429@kernel.org>
 <CACOAw_zfDZMB4pLEuHWU5YcKnAtfBBTSuXwXy+L2rNJxXC3ysg@mail.gmail.com>
 <16840026-35ba-cce6-4e0b-3332b0902d2a@kernel.org>
 <CACOAw_xW7MZi8BVi-2Zo-=LruZr6k7fC7huYiYuWyaDDDti6WA@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_xW7MZi8BVi-2Zo-=LruZr6k7fC7huYiYuWyaDDDti6WA@mail.gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/10/14 1:52, Daeho Jeong wrote: > Sorry, many parts
 of userspace already rely on these names. > I wrote that compr_written_blocks
 shows the block count written after > compression since mount. [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mdWhv-00A7y6-RF
Subject: Re: [f2fs-dev] [PATCH] f2fs: include non-compressed blocks in
 compr_written_block
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/10/14 1:52, Daeho Jeong wrote:
> Sorry, many parts of userspace already rely on these names.
> I wrote that compr_written_blocks shows the block count written after
> compression since mount.
> So, the count of blocks written as original data after compression
> because of no gain would not be an exception.

Okay, shouldn't we Cc stable mailing list for this patch? otherwise
userspace tool may get different stat number with the same compressed
file in different kernel?

Thanks,

> 
> Thanks,
> 
> 
> On Wed, Oct 13, 2021 at 7:17 AM Chao Yu <chao@kernel.org> wrote:
>>
>> On 2021/10/12 0:02, Daeho Jeong wrote:
>>>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>>>>> index c1bf9ad4c220..9b663eaf4805 100644
>>>>> --- a/fs/f2fs/compress.c
>>>>> +++ b/fs/f2fs/compress.c
>>>>> @@ -1530,6 +1530,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
>>>>>         if (cluster_may_compress(cc)) {
>>>>>                 err = f2fs_compress_pages(cc);
>>>>>                 if (err == -EAGAIN) {
>>>>> +                     add_compr_block_stat(cc->inode, cc->cluster_size);
>>>>
>>>> Shouldn't we relocate this after 'write' label?
>>>>
>>>> One more concern, it looks we've changed what compr_block stat indicated,
>>>> literally, the block we account should be compressed..., how about accounting
>>>> it by introducing .presist_blocks, used_blocks or occupied_blocks.... thoughts?
>>>>
>>>
>>> What I wanted to add here is just one case in which compression was
>>> tried, but couldn't save any block, so gave up.
>>> If we put this below the "write" label, we will count blocks, even if
>>> the file is turned off for compression in "user-controlled
>>> compression" mode.
>>> Like the commit comment says, I want to estimate the overall compression rate.
>>> But, if we include every other compression disabled condition, it
>>> won't work like that.
>>
>> Got it, thanks for the explanation.
>>
>> Any thoughts about renaming compr_block? since some blocks accounted in
>> .compr_block weren't compressed blocks.
>>
>> Thanks,
>>
>>>
>>> Thanks,
>>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
