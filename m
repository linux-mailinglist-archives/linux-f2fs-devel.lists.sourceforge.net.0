Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 390453FA28B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Aug 2021 02:43:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mJmRT-0003z4-I9; Sat, 28 Aug 2021 00:43:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mJmRR-0003ys-VR
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Aug 2021 00:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pjuAACCXhzKqhzu+HtoPQfcYfJJtKjJedQFvWo0kfYA=; b=nPfRz0TCxagD1K0dCrJGDxq29z
 FEcPr3BIMTmWNT7lydfBk47gFfh1AkvUwR6enw8ZTuYgeHAWtQAWsIkpP30uOV3zb6P/DZIRsuNE7
 c78sTvLS9POoeZ6TB+jYJuAsSlz/ZBVj6NjoYo8BQ5JoQuHKIGaIYtY5OnZIepuqIwUk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pjuAACCXhzKqhzu+HtoPQfcYfJJtKjJedQFvWo0kfYA=; b=iXB7WakuwDwK/TLBgceYc6Zdyx
 jhzl4llt5EjUKhJpKkaKielL48YV3lks2phnAYrT/e0Rt4lJXmOUz5dDrITK8PDjfwcU4Bu/sMD27
 yeiV2B4Tx7kMxAVgaP4nuPNKB/RJq7R9ki18AzDqHRYL55GG71Y6cN425EO38KGLzel0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mJmRP-0005rH-T3
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Aug 2021 00:43:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEF8860F14;
 Sat, 28 Aug 2021 00:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630111392;
 bh=jah1aaOllz3Ob5t19NZqX7ZjZZ2lH5n+1dapisCauwQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GJbKp4uSX/c1BFHuIEAXUZUN78tl/voUlAWWTZpgdsdcmu9+G7WKBORjJyQeVTXJl
 gGHmAUl7D1oFkAM+XI49Mf09mZX9fnJUOB+UUBpfJ9NF6SI0tbzHXMjw6UyW7vcoTS
 dk6vxdpV0arO/4o6p86qx+WDbf7jrd+WDvgGBAgVz/3eGzZpmvJGFfQo8AGeB28SxS
 g5shRAJjfioCS24ASPANj1dhEn4qfBvHcn6NbsjsFKsg1DJS8VIPIAFF5T3Y2VdKjD
 geOVLxVlj3nu/RVtB1XoskYu92u6Ze4Z0KAEMUljFPVSRdX/ND3YNUuZuemLNCw1yo
 TrUYHe9Ka861A==
To: Daeho Jeong <daeho43@gmail.com>
References: <20210825185747.1627497-1-daeho43@gmail.com>
 <1f1e6d38-6bd1-17ea-b8ca-a45d1244728f@kernel.org>
 <CACOAw_yhgo1_wrejKskSm=Rsw27ogx=TS_A=z=-NGLcecA-gYA@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <335d5bb5-7055-c934-33df-a03885382034@kernel.org>
Date: Sat, 28 Aug 2021 08:43:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CACOAw_yhgo1_wrejKskSm=Rsw27ogx=TS_A=z=-NGLcecA-gYA@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mJmRP-0005rH-T3
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce fragment allocation mode
 mount option
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

On 2021/8/27 23:22, Daeho Jeong wrote:
>> I'd like to add a fixed chunk/hole fragmentation mode in addition, then
>> userspace can control the fragmented chunk/hole with fixed size.
>>
>> How do you think of renaming "fragment:block" to "fragment:rand_block", and
>> then I can add "fragment:fixed_block" option and its logic in addition?
>>
> 
> The reason I added the randomness on these values is the segment
> selection in SSR mode.
> If all the segments have the same free block counts, f2fs will
> allocate a new segment sequentially in SSR.

I'm fine with this, since test program can customize different fragment
degree on segments by setting different chunk/hole size.

> This was what I didn't want. Plus, in the real world, the size of hole
> and chunk will be different in different segments.
> 
> But, if you think we need this "fragment:fixed_block" mode, I am happy
> to have it. :)

Thanks a lot. :)

As you said it needs to be aligned to real world fragmentation, I notice that:
with this way, we can't simulate similar fragment in FTL, due to its page
mapping architecture, all fragmented data/node in filesystem will be written
sequentially into its blocks.

In order to simulate fragment in FTL, we need to:
- write data (chunk size) with dummy pages (hole size) to devices
- issue discards on those holes

I guess fragmenting device (erase blocks) at the same time wouldn't be
original intention of this patch, right?

Thanks,

> 
>> Do we need to consider multiple thread scenario? in such case,
>> .fragment_remained_chunk may update randomly.
>>
>> In addition, multiple log headers share one .fragment_remained_chunk,
>> it may cause unexpected result, it means there may be continuous holes
>> or chunks in locality due to swithing between different log headers.
>>
>> Thanks,
>>
> 
> Oh, I overlooked that point. I am going to add the variable for each
> segment as you said before.
> 
> Thanks,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
