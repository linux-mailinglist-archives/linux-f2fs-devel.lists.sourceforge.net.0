Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75416A452E9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Feb 2025 03:14:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tn6vp-0003wB-WB;
	Wed, 26 Feb 2025 02:13:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tn6vm-0003w3-J3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Feb 2025 02:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fJyYoMLJ2ZpLYSLKjQAd/SHkBwXYijcVGHc0YhQcEQk=; b=Cj6zb+BBByDGuZXJLf7q+3qZ0K
 7MuDyIIR7q3naBHL9FQEzHicjxlGtqtawpA6emVTYygINj8vl7xHyLrB7OOJmTNrZQZWlqslGd6nS
 a1RKRlo7zYa0yNbe6bzS2jg6lP3M0gZ0u2J8UNWyVeVIz+TzcAZij6F6X2gimp03OsBY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fJyYoMLJ2ZpLYSLKjQAd/SHkBwXYijcVGHc0YhQcEQk=; b=TrVXBGeiKhcgzN89wuf4BuqdF4
 7wp5KmfPgttKvjzLTP31VYb7qW4yb+WqD0ruEDFzUehZAKOZasT8gahbdQQ23SyywmQZiCTLcQnmM
 m0sI4lmXJqDbRVISuYiC0Cv/lHrfVUwwtiThP6/dOr7npufMrZVH+5hWggY09eLjTWFs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tn6vl-0002hK-NC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Feb 2025 02:13:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B736461205;
 Wed, 26 Feb 2025 02:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E171C4CEE6;
 Wed, 26 Feb 2025 02:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740536023;
 bh=OyjV96AUwXrteFLxY3N9fXfHXVnALSLioT3sBfWehFg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=gv7EBa/VoBy3MfNwWBevyb/gzVzrjM9ylO6CA3FElUJi+lYbP5e8ix30cMTlfpCIJ
 Kc3AyCy3gA6ER7VFux5s7m4f/Eso0StUTDJNPGIIi4WFy3TtWmEvfu9h5zhG8dweMz
 e3XfwEcySNjles1+m9AMAFNuO7RgG4h9YSNKXVLZqVhV9XgDZl2Uo+oIbyjWzUoDBV
 L49UrbupNEdRt5r+osK5/YQ/S6it5j45uOgrXGUGTEIbJcMh2MsaV4VwR2mRVclFZl
 Bt1eZkf6F0vOfoe4l+DRZZoqs1NyLRG+UqD5aL626eLbg9m9+0dzDPua3sc3AzOg4Y
 i0GpQImZVVQuA==
Message-ID: <035589e7-aaf1-46f6-b259-9bdc4004af54@kernel.org>
Date: Wed, 26 Feb 2025 10:13:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Salvatore Bonaccorso <carnil@debian.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <b022c507-9bfe-b080-4247-2cb5b76a181d@arcor.de>
 <584c3164-0ebc-4402-bc84-6fcb8fc9aa80@arcor.de>
 <b022c507-9bfe-b080-4247-2cb5b76a181d@arcor.de>
 <Z7oW1khuNTx-jIw-@eldamar.lan> <Z74EbpqwFwwelUi7@eldamar.lan>
Content-Language: en-US
In-Reply-To: <Z74EbpqwFwwelUi7@eldamar.lan>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/26/25 01:57, Salvatore Bonaccorso wrote: > Hi > > I do
 realize the subject was badly choosed so replying again with a > better
 subject.
 The downstream Debian report can be found at > https://bugs [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tn6vl-0002hK-NC
Subject: Re: [f2fs-dev] >= Kernel 5.19 reports corrupted f2fs without
 apparent actual corruption
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Heinz Repp <heinz.repp@arcor.de>, 1021927@bugs.debian.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/26/25 01:57, Salvatore Bonaccorso wrote:
> Hi
> 
> I do realize the subject was badly choosed so replying again with a
> better subject. The downstream Debian report can be found at
> https://bugs.debian.org/1021927

Hi Salvatore,

Please don't worry, fsck has checked your device and reported that "Info: No
error was reported", it means there is no inconsistent problem in your image.

Eric has uploaded a patch to replace the unclear message "Info: Fix the reported
corruption." w/ "Info: Automatic fix mode enabled." [1], I guess we will see
the change in f2fs-tools 1.17.0+.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev-test&id=84a218572118382f73997c6411ff80c98d3f6f94

Thanks,

> 
> On Sat, Feb 22, 2025 at 07:26:30PM +0100, Salvatore Bonaccorso wrote:
>> Hi Jaegeuk, hi Chao
>>
>> We got the following report in Debian (cf.
>> https://bugs.debian.org/1021927) and quoted in the following:
>>
>> On Sat, Feb 22, 2025 at 02:44:07PM +0100, Heinz Repp wrote:
>>> Since kernel 5.19.x this bug is present in all newer kernels, up to 6.12.12.
>>> On every boot, it prints:
>>>
>>>> Info: Fix the reported corruption.
>>>> Info: [/dev/sdb4] SanDisk SDSSDHTI
>>>> Info: MKFS Version
>>>>   "Linux version 4.3.0-1-amd64 (debian-kernel@lists.debian.org) (gcc version 5.3.1 20160101 (Debian 5.3.1-5) ) #1 SMP Debian 4.3.3-5 (2016-01-04)"
>>>> Info: FSCK Version
>>>>   from "Linux version 4.3.0-1-amd64 (debian-kernel@lists.debian.org) (gcc version 5.3.1 20160121 (Debian 5.3.1-7) ) #1 SMP Debian 4.3.5-1 (2016-02-06)"
>>>>     to "Linux version 6.12.12-amd64 (debian-kernel@lists.debian.org) (x86_64-linux-gnu-gcc 14 (Debian 14.2.0-16) 14.2.0, GNU ld (GNU Binutils for Debian) 2.43.90.20250127) #1 SMP PREEMPT_DYNAMIC Debian 6.12.12-
>>>> 1 (2025-02-02)"
>>>> Info: superblock features = 0 :
>>>> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
>>>> Info: Segments per section = 1
>>>> Info: Sections per zone = 1
>>>> Info: Total FS sectors = 233906176 (114212 MB)
>>>> Info: CKPT version = 4b0b40
>>>> Info: checkpoint state = 42 :   crc orphan_inodes sudden-power-off
>>>> Info: No error was reported
>>>> [   10,619367]
>>>
>>> First, there is a reported corruption. But then, it says "No error was
>>> reported". That's a little bit crazy. This came up with kernel 5.19, without
>>> changing f2fs, but maybe this bug lives in f2fs?
>>>
>>> Greetings
>>>
>>> Heinz Repp
>>
>> Does this ring some bells to you?
>>
> 
> Does this ring some bell?
> 
> Regards,
> Salvatore



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
