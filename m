Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5481057F5C4
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Jul 2022 17:26:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oFdUt-0001oN-EM; Sun, 24 Jul 2022 15:26:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oFdUs-0001oH-V2
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 15:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9lw3PpiOsCRg32X6kt6iZokfKL3oYBtxYXcHL5zpW0Y=; b=XU2sxm8PSzNmpfbSWxOY2m4TF0
 yvJuJgtab21Oatdj4vfwJZbi3rMwYAdnm601pb71rJEIpqnYT48whWHmaxMLViUVS3F0Po5zsbADn
 0DFd7fsZZgYGSko28P3lntCqRj/guUA7VYs1N6qC6q8PbgdX4OwoISaCl5X4vUx4VMX4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9lw3PpiOsCRg32X6kt6iZokfKL3oYBtxYXcHL5zpW0Y=; b=gilhtFWM7LqPnClI9gb71DVUvn
 NkpsbncGEEswI3g/0SeTI3UnsFgy398RSBiycRPCDS/Y9JO9ogitvdBwRtuRTqMu2wbLHPQPKU6FM
 j0ARD2EyYt35W+34XC+ZDMMMvBMtOHZkrrN3AJljaBrlwUrD8tKI0aFmBK9mgaH0rer0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oFdUp-0003DO-RT
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 15:26:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A78F46112A;
 Sun, 24 Jul 2022 15:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE021C3411E;
 Sun, 24 Jul 2022 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658676369;
 bh=XawCLPtmZ4fqG7HmHG8DgJxtknVXOhtaMBHOKKVA+a4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TDphJYBgBVXs11PiEkP7SR+Eg8zcMq7InckjTEKmMzSLYPAp3El/IssQZyFeBDrX4
 NpCdJR6xquDs9+vRBQ0W6xo/MaBgSu6m/B7F1LRJCgMVLhqIV+X8Ta52Rtss5dB7Yt
 jeR97CMISQVZF4BkYl0fWZ8+B4PpM/6AmFpyD5It62fklcrTdeiL3y74Mpv+QudklR
 HWzdfaSgl/8sFcANuprXTZBYiX56Jxp5NjjzBmAAAHwoy2YDqCYkyrVZcFtEq3otOy
 Pa9aE8DL/hI6FakHLFPOgb1EVh9lwyJPucxYmKLEZNjSwU69J4lSSBHZv5g1Cpwzi+
 9gfXIYBisGy8g==
Message-ID: <8eaad9d0-1d59-3ecb-bab4-904ed22385f4@kernel.org>
Date: Sun, 24 Jul 2022 23:26:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Guowei Du <duguoweisz@gmail.com>
References: <20220718081038.2279-1-duguoweisz@gmail.com>
 <YtoOxTyWPFUpw/Y0@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YtoOxTyWPFUpw/Y0@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/7/22 10:43, Jaegeuk Kim wrote: > On 07/18, Guowei
 Du wrote: >> From: duguowei <duguowei@xiaomi.com> >> >> If there are more
 than one f2fs sbi, there will be more >> discard threads. But the co [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oFdUp-0003DO-RT
Subject: Re: [f2fs-dev] [PATCH] f2fs: modify task name prefix
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
Cc: linux-kernel@vger.kernel.org, duguowei <duguowei@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/7/22 10:43, Jaegeuk Kim wrote:
> On 07/18, Guowei Du wrote:
>> From: duguowei <duguowei@xiaomi.com>
>>
>> If there are more than one f2fs sbi, there will be more
>> discard threads. But the comm is too long to show dev
>> minor. So, change the default prefix of thread from
>> "f2fs_discard" to "f2fs_dcd".
> 
> That looks quite unreadable. What about unmap?

FYI,

With commit d6986ce24fc0 ("kthread: dynamically allocate memory to store
kthread's full name"), it has chance to show full name of kthread when
it's not in low memory scenario.

Thanks,

> 
>>
>> Before:
>> $ ps -e | grep f2fs
>> 1628 ?        00:00:00 f2fs_ckpt-7:10
>> 1629 ?        00:00:00 f2fs_flush-7:10
>> 1630 ?        00:00:00 f2fs_discard-7:
>> 1631 ?        00:00:00 f2fs_gc-7:10
>> 2030 ?        00:00:00 f2fs_ckpt-7:27
>> 2031 ?        00:00:00 f2fs_flush-7:27
>> 2032 ?        00:00:00 f2fs_discard-7:
>> 2033 ?        00:00:00 f2fs_gc-7:27
>>
>> After:
>> $ ps -e | grep f2fs
>> 1628 ?        00:00:00 f2fs_ckpt-7:10
>> 1629 ?        00:00:00 f2fs_flush-7:10
>> 1630 ?        00:00:00 f2fs_dcd-7:10
>> 1631 ?        00:00:00 f2fs_gc-7:10
>> 2030 ?        00:00:00 f2fs_ckpt-7:27
>> 2031 ?        00:00:00 f2fs_flush-7:27
>> 2032 ?        00:00:00 f2fs_dcd-7:27
>> 2033 ?        00:00:00 f2fs_gc-7:27
>>
>> Signed-off-by: duguowei <duguowei@xiaomi.com>
>> ---
>>   fs/f2fs/segment.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 874c1b9c41a2..2eeefcbe62db 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -2018,7 +2018,7 @@ int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
>>   		return 0;
>>   
>>   	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
>> -				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
>> +				"f2fs_dcd-%u:%u", MAJOR(dev), MINOR(dev));
>>   	if (IS_ERR(dcc->f2fs_issue_discard))
>>   		err = PTR_ERR(dcc->f2fs_issue_discard);
>>   
>> -- 
>> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
