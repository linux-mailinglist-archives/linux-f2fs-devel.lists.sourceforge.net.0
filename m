Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F7C39EA81
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jun 2021 02:01:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqPBa-0004Ae-NN; Tue, 08 Jun 2021 00:01:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lqPBY-0004AX-V4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Jun 2021 00:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/YrS5FulmQlnK3WccZUeCNt1s4kIZwnqHs2xzAeUkn8=; b=anfeRCGqdMvf7Tjf1P3pEsZZJZ
 RnNeHbjyjVPdXufs+TzOLxOdmQpb8u3SmU51t2RVxmZBrgcDjEUZwF40pyA+tpVtYSx5ZeeUJkFFZ
 ccOAZjXrmsbtW5QjoGfT7aiLvi2oN5n7cI6cyf5TUGnVHlnvs/gAIqb6hRrnP2vBk/As=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/YrS5FulmQlnK3WccZUeCNt1s4kIZwnqHs2xzAeUkn8=; b=R9LLhliE2X6TE4CkhM6Rp+0J1v
 uGDca1MPY86YD2U/0YAyC12TEFplReLx77db/GQ7tvuNzatr5ALC4l1TZ22xrLDm0VFFudjjs+Z88
 CS4DGZiBgkeuA9gB99IocPTA19hJkUDHti1HEYrxhYf5AcwegpGbJ/b8OscDcARDD2to=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lqPBU-00GrGB-Rs
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Jun 2021 00:01:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 901F060FE9;
 Tue,  8 Jun 2021 00:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623110487;
 bh=Uqzz4vK6Dqa6fvMe03GrzcwVa585uYCfslJFoH1K9kU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ng6oleFIsLvrfs6YfQwha8/CA53vnsqyv5y92/jB7azYlLenvSU838go/DQ+BJkgE
 sz/i9qP+2Mpk7xOvehf9l00UNhVTMjAPnJty261JpM10jnNpeZGKNf9mzV6ouEdEhH
 M4ZmENCrIuGEPUXdzenQV2noqp4KPhShxLTZgh14AjFRAF6KjxVpjxcYQD7uYK+dnN
 w3UCYbCzbfHTD50tmxchk/9OedysaP+rMKC+SO1oDz5cmRWuMU5Xtds98H92eG2+hv
 V2wuNC5ignYxbfceNyNK2QibDfMOwkeRPmu90lgUejvPL5cmj2eYF7sctCkT6SzgFb
 8eyrkIE/t061g==
To: Eric Biggers <ebiggers@kernel.org>
References: <20210607232715.3669-1-chao@kernel.org>
 <YL6wHViJbCKVGx4K@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <60da30ab-cfec-2b97-554a-88706430ca18@kernel.org>
Date: Tue, 8 Jun 2021 08:01:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YL6wHViJbCKVGx4K@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.3 (/)
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lqPBU-00GrGB-Rs
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce cf_name_slab cache
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

On 2021/6/8 7:47, Eric Biggers wrote:
> On Tue, Jun 08, 2021 at 07:27:15AM +0800, Chao Yu wrote:
>> From: Chao Yu <yuchao0@huawei.com>
>>
>> Add a slab cache: "f2fs_casefold_name_entry" for memory allocation
>> of casefold name.
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>   fs/f2fs/dir.c      | 16 ++++++++++------
>>   fs/f2fs/recovery.c |  6 +++++-
>>   fs/f2fs/super.c    | 24 ++++++++++++++++++++++++
>>   3 files changed, 39 insertions(+), 7 deletions(-)
> 
> Looks good, but "f2fs_casefolded_name" would be a better name for this cache.
> 
> "f2fs_casefold_name_entry" makes it sounds like it contains some bookkeeping
> information and not the actual casefolded filenames.

Better, done.

> 
>>
>> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
>> index 96dcc4aca639..ee400562157d 100644
>> --- a/fs/f2fs/dir.c
>> +++ b/fs/f2fs/dir.c
>> @@ -16,6 +16,10 @@
>>   #include "xattr.h"
>>   #include <trace/events/f2fs.h>
>>   
>> +#ifdef CONFIG_UNICODE
>> +extern struct kmem_cache *cf_name_slab;
>> +#endif
> 
> Also this variable needs to be prefixed with "f2fs_".  Otherwise this will cause
> a build error if/when ext4 adds the same thing.

Correct, fixed in v2.

Thanks for the suggestion.

Thanks,

> 
> - Eric
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
