Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C443EBFA0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Aug 2021 04:06:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEj43-0000KD-Bj; Sat, 14 Aug 2021 02:06:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mEj42-0000K7-4c
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Aug 2021 02:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JMlhkldRg+iQ6N9Hy6Owmj00mhk0Sqzz5Ek+fpXrdaI=; b=SzhplpgmTVveI90azG4Rl9kY5U
 9Co2Eybsf9mnCysRp2c5Oqsl1W9dK2zTaF8Hs/AAF+0O2bBBA/IYGv0nslyBWBSFA1yxxZDADU1/R
 GCp7/DOiXV0HBPs84ot7Kfk9bE4OdMVpyEECuQZqtU8Ohr3z3ca8BhSx8PU0sNhhzWrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JMlhkldRg+iQ6N9Hy6Owmj00mhk0Sqzz5Ek+fpXrdaI=; b=N4avQZNed/J3qGsKnoXTp/nDLW
 8yx8QmZivOXRn5jeihT0U2yYwsoaDZO/wrvSVgHzHx6U/it6mUIxPORHaKX2m/wZD08T91CeolxzX
 Nena74T9T4ot8HCK+/mPw442g01//zDVcnZO31qKjeloy9/HBidnRpm7p9FL3L1jeUbY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEj40-0001pr-Bl
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Aug 2021 02:06:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A48B6103A;
 Sat, 14 Aug 2021 02:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628906769;
 bh=AJyfRoBiN6vd4Qg70MgtNw0Vq/ShFqNrZMSRs0ia4OM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KXbOK6CmPDAZSIgOGq8qFrRCB/AqLpDaZmbm1i5bNjvQYzi8JrcOiaJ+Bg/nslpJb
 Rg9rL5U1pGBCggSaHbiKqe0wJLbFYBxhFecTmww8XKnp01ttJPyOhutU7ZtcPUV1OV
 zvi+mAFc2oNSlj6U7vPmb2yucVaD5k4YoXZF+FKAKSvl7cThTP/UO3SxML2IWX13jl
 6UnZ8l69Gv/IMFtEc64Q3ddUJfmAJDyPoso1TE5zWoHsYOjKIMWjoWI6/AYh76F7ZB
 X5IHHSFiWY4Pm8nCpzSTHN65qcie56Sl3eTPyW8LhH4CXixNB43ScV3Vbm3oUuNyTk
 luIx8b4+wl79Q==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210803225542.3487172-1-daeho43@gmail.com>
 <2a79c1c5-366b-92d9-4025-dbda660b1178@kernel.org>
 <YRWKKQe0bcgjKIIA@google.com>
 <b1a7b8a6-89dc-9076-2388-ced59aa8c47c@kernel.org>
 <YRbARsMfs2O2fz2s@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <b76b5b09-d806-992b-3256-fe7ebfc4a2df@kernel.org>
Date: Sat, 14 Aug 2021 10:06:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YRbARsMfs2O2fz2s@google.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mEj40-0001pr-Bl
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce periodic iostat io
 latency traces
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

On 2021/8/14 2:56, Jaegeuk Kim wrote:
> On 08/13, Chao Yu wrote:
>> On 2021/8/13 4:52, Jaegeuk Kim wrote:
>>> On 08/11, Chao Yu wrote:
>>>> Hi Daeho,
>>>>
>>>> On 2021/8/4 6:55, Daeho Jeong wrote:
>>>>> From: Daeho Jeong <daehojeong@google.com>
>>>>>
>>>>> Whenever we notice some sluggish issues on our machines, we are always
>>>>> curious about how well all types of I/O in the f2fs filesystem are
>>>>> handled. But, it's hard to get this kind of real data. First of all,
>>>>> we need to reproduce the issue while turning on the profiling tool like
>>>>> blktrace, but the issue doesn't happen again easily. Second, with the
>>>>> intervention of any tools, the overall timing of the issue will be
>>>>> slightly changed and it sometimes makes us hard to figure it out.
>>>>>
>>>>> So, I added F2FS_IOSTAT_IO_LATENCY config option to support printing out
>>>>> IO latency statistics tracepoint events which are minimal things to
>>>>> understand filesystem's I/O related behaviors. With "iostat_enable" sysfs
>>>>> node on, we can get this statistics info in a periodic way and it
>>>>> would cause the least overhead.
>>>>>
>>>>> [samples]
>>>>>     f2fs_ckpt-254:1-507     [003] ....  2842.439683: f2fs_iostat_latency:
>>>>> dev = (254,11), iotype [peak lat.(ms)/avg lat.(ms)/count],
>>>>> rd_data [136/1/801], rd_node [136/1/1704], rd_meta [4/2/4],
>>>>> wr_sync_data [164/16/3331], wr_sync_node [152/3/648],
>>>>> wr_sync_meta [160/2/4243], wr_async_data [24/13/15],
>>>>> wr_async_node [0/0/0], wr_async_meta [0/0/0]
>>>>>
>>>>>     f2fs_ckpt-254:1-507     [002] ....  2845.450514: f2fs_iostat_latency:
>>>>> dev = (254,11), iotype [peak lat.(ms)/avg lat.(ms)/count],
>>>>> rd_data [60/3/456], rd_node [60/3/1258], rd_meta [0/0/1],
>>>>> wr_sync_data [120/12/2285], wr_sync_node [88/5/428],
>>>>> wr_sync_meta [52/6/2990], wr_async_data [4/1/3],
>>>>> wr_async_node [0/0/0], wr_async_meta [0/0/0]
>>>>>
>>>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>>>>
>>>>> ---
>>>>> v2: clean up with wrappers and fix a build breakage reported by
>>>>>        kernel test robot <lkp@intel.com>
>>>>> ---
>>>>>     fs/f2fs/Kconfig             |   9 +++
>>>>
>>>> I try to apply this patch in my local dev branch, but it failed due to
>>>> conflicting with below commit, it needs to rebase this patch to last dev
>>>> branch.
>>>
>>> I applied this in dev branch. Could you please check?
>>
>> Yeah, I see.
>>
>>>>> +config F2FS_IOSTAT_IO_LATENCY
>>>>> +	bool "F2FS IO statistics IO latency information"
>>>>> +	depends on F2FS_FS
>>>>> +	default n
>>>>> +	help
>>>>> +	  Support printing out periodic IO latency statistics tracepoint
>>>>> +	  events. With this, you have to turn on "iostat_enable" sysfs
>>>>> +	  node to print this out.
>>>>
>>>> This functionality looks independent, how about introuducing iostat.h
>>>> and iostat.c (not sure, maybe trace.[hc])to include newly added structure
>>>> and functions for dispersive codes cleanup.
>>
>> Thoughts? this also can avoid using CONFIG_F2FS_IOSTAT_IO_LATENCY in many places.
> 
> It seems there's somewhat dependency with iostat which is done by default.
> How about adding this by default as well in the existing iostat, and then
> covering all together by F2FS_IOSTAT?

Agreed.

Any thoughts about using separated files to maintain these independent functionality
codes? like we did in trace.[hc] previously.

Thanks,

> 
>>
>> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
