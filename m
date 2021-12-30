Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D425481A07
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Dec 2021 07:43:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n2p9v-0004dM-3F; Thu, 30 Dec 2021 06:43:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1n2p9u-0004dG-5T
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Dec 2021 06:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eIgav/WNFmCkoysz4DjS54IIun+zbjAEmH4W5lxIc1U=; b=ct1vewiI9Gh/w9ySkvOG0yJNaT
 xVJasOa0zke2cWfFnma98sS+RR3KQgdWcdIinhLYB2mIAd0wXPr71cYCMDQXmZehdiJ/FkUjjrDbW
 aSkZbbJKoVw0xkdg9uUTSiLcKL+VmQTpWivTeDUTPy9WylIKMvTairNx1x5eNzhg6aoU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eIgav/WNFmCkoysz4DjS54IIun+zbjAEmH4W5lxIc1U=; b=IHB1lMSrGO9DJR8VmFwtioTrSa
 g2Na09dwXXk4wmt5Tg6zm71AxkdSRs9xojpG3bG2G1cRmlNGBXDlN6uhuAGVcaODbIW5kfbHKhD6w
 RKlfO7d1VuuV9oBKTc3R+y2i+H0b4xiMa3bGyz6oY4ZHfe+h8l5vX0FOWuAJEvmp7VIc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n2p9t-00080w-H4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Dec 2021 06:43:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 25DB36157C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Dec 2021 06:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696A2C36AEA;
 Thu, 30 Dec 2021 06:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640846603;
 bh=Y7MIC/xYNj2vm5NGLwlLkT0zp8qCJy3s2XKulDkACpg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z8Xqh78JTQp6jVO3NAkEcsB5frk7x+kGgJxt5knRMUlkVcGwSwq4rmoM1Fyy8npbQ
 VTwmWWucwzOKCzdp9U+oTF4izVKlFquQtoGUgGOn+C+ehsK3iP0/UxwMSsL0FJmX2p
 hSdjmNyy5RHxo0cdYLowthxTuUQV8tecPG/gBU2VtRYHiIrDO+K1RE2RUtGxvR4fiC
 8wzhsWHsEfrE3BcJXh+zfAtRCRt8yVS5o2/nkKlERBG0vGjt+ywUhqsct4mpp9TYOj
 jamG3QVfVgiNrXmpC3iTAd6YKigALIhjj9gz4WryKZ5tRfUyGXbzv/uTyDevjgjnaS
 8qyF3aIB8ZSvQ==
Message-ID: <ed10bb7a-af8c-d5a6-8bb1-a47559f78fbf@kernel.org>
Date: Thu, 30 Dec 2021 14:43:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
 <20211116214510.2934905-5-jaegeuk@kernel.org>
 <b36e2d44-4834-3931-6a32-4fa52d1d7785@kernel.org>
 <YahIf3UlhuxJT1O4@sol.localdomain>
 <1ba0f002-42c7-b085-0c54-6071664ba79b@kernel.org>
 <YakPrVPz5+qQm3kQ@sol.localdomain> <YakXMV0UvBV7TVwe@google.com>
 <YakX38onzsW5Ef8B@google.com> <YakzVAkHAVMueJwe@sol.localdomain>
 <Yak4cxU6htgQk7ck@google.com> <Yak6gtXthBRK3eeM@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Yak6gtXthBRK3eeM@google.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/12/3 5:28, Jaegeuk Kim wrote: > On 12/02, Jaegeuk
 Kim wrote: >> On 12/02, Eric Biggers wrote: >>> On Thu, Dec 02,
 2021 at 11:00:47AM
 -0800, Jaegeuk Kim wrote: >>>> On 12/02, Jaegeuk Kim wrote: [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n2p9t-00080w-H4
Subject: Re: [f2fs-dev] [PATCH 5/6] f2fs: implement iomap operations
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/12/3 5:28, Jaegeuk Kim wrote:
> On 12/02, Jaegeuk Kim wrote:
>> On 12/02, Eric Biggers wrote:
>>> On Thu, Dec 02, 2021 at 11:00:47AM -0800, Jaegeuk Kim wrote:
>>>> On 12/02, Jaegeuk Kim wrote:
>>>>> On 12/02, Eric Biggers wrote:
>>>>>> On Thu, Dec 02, 2021 at 10:04:11PM +0800, Chao Yu wrote:
>>>>>>> On 2021/12/2 12:15, Eric Biggers wrote:
>>>>>>>> On Thu, Dec 02, 2021 at 11:10:41AM +0800, Chao Yu wrote:
>>>>>>>>> Why not relocating this check before f2fs_map_blocks()?
>>>>>>>
>>>>>>> Wait, it supports DIO in multi-device image after commit 	71f2c8206202
>>>>>>> ("f2fs: multidevice: support direct IO"), how about
>>>>>>> checking with f2fs_allow_multi_device_dio()?
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>
>>>>>> Okay, that was not the case when I sent this patch originally.  We'll need to
>>>>>> update this to support multiple devices.
>>>>>
>>>>> Chao/Eric, does this make sense?
>>>>>
>>>>> --- a/fs/f2fs/data.c
>>>>> +++ b/fs/f2fs/data.c
>>>>> @@ -4070,11 +4070,10 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>>>>>                  }
>>>>>                  if (WARN_ON_ONCE(!__is_valid_data_blkaddr(map.m_pblk)))
>>>>>                          return -EINVAL;
>>>>> -               iomap->addr = blks_to_bytes(inode, map.m_pblk);
>>>>>
>>>>> -               if (WARN_ON_ONCE(f2fs_is_multi_device(F2FS_I_SB(inode))))
>>>>> -                       return -EINVAL;
>>>>> -               iomap->bdev = inode->i_sb->s_bdev;
>>>>> +               iomap->bdev = map->m_multidev_dio ? map.m_bdev :
>>>>
>>>> correction:			map.m_multidev_dio
>>>>
>>>
>>> I guess so, but why doesn't f2fs_map_blocks() just always set m_bdev to the
>>> correct block device?  What is the point of m_multidev_dio?
>>
>> It seems we can simply assign iomap->bdev = map.m_bdev, and remove
>> map->m_multidev_dio.
> 
> Ok, it was used in previous get_block flow, but I think it'd be worth to keep it
> to show by f2fs_map_blocks tracepoint.

The last version wasn't sent into mailing list?

Thanks,

> 
>>
>>>
>>> - Eric
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
