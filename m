Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 811003EAE14
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Aug 2021 03:14:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mELly-00030y-T4; Fri, 13 Aug 2021 01:14:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mELly-00030s-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 01:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+P6/trlOWU5ryqhN7JF4QIDd848+d7ClJoztRPmIhII=; b=BdyE49uLStB/hneQmxDGRlq9Xf
 QIcGttYH95KbVwQ/sb02E2MgslSnGPkptT7nOk1X2S5FioHMwkoBGyF/nJpd1c9cEfSOiiGQAWiFo
 jgzolZvxRd6vfZair4DzIi2OGedu2ccaXK0sVMKvjChbKs6gVBpWvOrzcSSBdk7NN/co=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+P6/trlOWU5ryqhN7JF4QIDd848+d7ClJoztRPmIhII=; b=P8XVxVgnYgYPJYP0ONM2RACz0m
 HH00hFi7QM0X6gJcatfqhnC0vejainnfZOvD/sFYwGLvU7TJu//x0px9xZHxUKsW1h3x8+PpFuSXH
 unsO2dXdA4vm//paViX+YMml3rK3UGesrRrU2JnirJE6Rrsf1YOA6wrHiMKBYwVSJ0vY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mELlw-004i0o-M1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 01:14:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3214160FBF;
 Fri, 13 Aug 2021 01:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628817242;
 bh=oqWfN9ilzD/7n0LwaQHtvqSaNRECuSXyIM9UHWrUZdc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CdBx6G47/FOs/EVueNi01CWLNDrJCZMOZc1oMJ+jKka9mFHYre9ZbZvsVStfllaea
 5DxHGLZI2jfRAxCwEP69l390e4MwmpbstP35UX4L0aLu2GTBgo52INEtOdXqBfldUe
 t6Sr/tkOiEuZTH5QBVgWaLJbTwYMvgoc2fGC0xtdgT3tUs4gmw/hGEZ+vyTlN4a7Nu
 Bqa/TNtW6GwK3d86QVipjnIQelUhdpgkXqcpWB04JMkYoKMqM0ZN5VhJZeukytCJK8
 u1Lff6+PY02eZyVwdTGcZ+FV1fT8AXId9LB7s6YEPgvrXy+RA8DQC7A/Z1h4iMMYkw
 uuW8LP8DPv9vg==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210803225542.3487172-1-daeho43@gmail.com>
 <2a79c1c5-366b-92d9-4025-dbda660b1178@kernel.org>
 <YRWKKQe0bcgjKIIA@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <b1a7b8a6-89dc-9076-2388-ced59aa8c47c@kernel.org>
Date: Fri, 13 Aug 2021 09:14:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRWKKQe0bcgjKIIA@google.com>
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
X-Headers-End: 1mELlw-004i0o-M1
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

On 2021/8/13 4:52, Jaegeuk Kim wrote:
> On 08/11, Chao Yu wrote:
>> Hi Daeho,
>>
>> On 2021/8/4 6:55, Daeho Jeong wrote:
>>> From: Daeho Jeong <daehojeong@google.com>
>>>
>>> Whenever we notice some sluggish issues on our machines, we are always
>>> curious about how well all types of I/O in the f2fs filesystem are
>>> handled. But, it's hard to get this kind of real data. First of all,
>>> we need to reproduce the issue while turning on the profiling tool like
>>> blktrace, but the issue doesn't happen again easily. Second, with the
>>> intervention of any tools, the overall timing of the issue will be
>>> slightly changed and it sometimes makes us hard to figure it out.
>>>
>>> So, I added F2FS_IOSTAT_IO_LATENCY config option to support printing out
>>> IO latency statistics tracepoint events which are minimal things to
>>> understand filesystem's I/O related behaviors. With "iostat_enable" sysfs
>>> node on, we can get this statistics info in a periodic way and it
>>> would cause the least overhead.
>>>
>>> [samples]
>>>    f2fs_ckpt-254:1-507     [003] ....  2842.439683: f2fs_iostat_latency:
>>> dev = (254,11), iotype [peak lat.(ms)/avg lat.(ms)/count],
>>> rd_data [136/1/801], rd_node [136/1/1704], rd_meta [4/2/4],
>>> wr_sync_data [164/16/3331], wr_sync_node [152/3/648],
>>> wr_sync_meta [160/2/4243], wr_async_data [24/13/15],
>>> wr_async_node [0/0/0], wr_async_meta [0/0/0]
>>>
>>>    f2fs_ckpt-254:1-507     [002] ....  2845.450514: f2fs_iostat_latency:
>>> dev = (254,11), iotype [peak lat.(ms)/avg lat.(ms)/count],
>>> rd_data [60/3/456], rd_node [60/3/1258], rd_meta [0/0/1],
>>> wr_sync_data [120/12/2285], wr_sync_node [88/5/428],
>>> wr_sync_meta [52/6/2990], wr_async_data [4/1/3],
>>> wr_async_node [0/0/0], wr_async_meta [0/0/0]
>>>
>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>>
>>> ---
>>> v2: clean up with wrappers and fix a build breakage reported by
>>>       kernel test robot <lkp@intel.com>
>>> ---
>>>    fs/f2fs/Kconfig             |   9 +++
>>
>> I try to apply this patch in my local dev branch, but it failed due to
>> conflicting with below commit, it needs to rebase this patch to last dev
>> branch.
> 
> I applied this in dev branch. Could you please check?

Yeah, I see.

>>> +config F2FS_IOSTAT_IO_LATENCY
>>> +	bool "F2FS IO statistics IO latency information"
>>> +	depends on F2FS_FS
>>> +	default n
>>> +	help
>>> +	  Support printing out periodic IO latency statistics tracepoint
>>> +	  events. With this, you have to turn on "iostat_enable" sysfs
>>> +	  node to print this out.
>>
>> This functionality looks independent, how about introuducing iostat.h
>> and iostat.c (not sure, maybe trace.[hc])to include newly added structure
>> and functions for dispersive codes cleanup.

Thoughts? this also can avoid using CONFIG_F2FS_IOSTAT_IO_LATENCY in many places.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
