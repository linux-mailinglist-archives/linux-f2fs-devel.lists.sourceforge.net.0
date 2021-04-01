Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9108A350B19
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Apr 2021 02:22:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lRl6p-0003z8-1L; Thu, 01 Apr 2021 00:22:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <me@beroal.in.ua>) id 1lRl6n-0003yt-Ix
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Apr 2021 00:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cPbjqZ4WqLL1tf27TLo/T2n6giqo6z7PvnxSnRj2zUU=; b=JBZHFjPRc+I9A0qrHPfeAvH1dH
 eeU30RKZTz9eLyDaUU/0pgFwwEhRwGE09tS7r+MM/X65MU4VR2svxXx4S6VYnKwKv3PZKl/bZvDxB
 L/teLqeOAjrhjPv05b85sKMpPrbSiCqGrDEh4q6M9/4J7cT96W2KpApNZY9KD6WHloi4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cPbjqZ4WqLL1tf27TLo/T2n6giqo6z7PvnxSnRj2zUU=; b=HOYH+h+Xt/HN0Py3Xygh692tW6
 oN2Y2v/pACj09YYLu5fmU74xPdghnihT/Qvic/XRUSqR2UgS2ExPHm/4enwMGXVUAnLq3QAbvlo6c
 mkLS7hqj1CYwsS8b2hNaLCJsqt9HOogrXBZsPAHw7QDuTlknbUwjt0dYkAuczOk6qY/Q=;
Received: from smtp-1.1gb.com.ua ([195.234.4.10] helo=u1.1gb.ua)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1lRl6e-001CTk-2h
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Apr 2021 00:22:49 +0000
Received: from Spooler by u1.1gb.ua (Mercury/32 v4.52) ID MO009B48;
 1 Apr 2021 03:22:42 +0300
Received: from spooler by mail-u1-robots.in-solve.hidden (Mercury/32 v4.52);
 1 Apr 2021 03:22:24 +0300
Received: from ul1.1gb.ua (195.234.4.24) by smtp-1.1gb.com.ua (Mercury/32
 v4.52) with ESMTP ID MG009B43; 1 Apr 2021 03:22:21 +0300
Received: from [192.162.141.53] ([192.162.141.53]) (authenticated bits=0)
 by ul1.1gb.ua (8.14.9/8.14.9) with ESMTP id 1310MJMW025539
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 1 Apr 2021 03:22:19 +0300
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <739ae455-07b4-7dc4-1789-5b162ed25ede@beroal.in.ua>
 <bc3759b9-c606-5e77-40f0-c590bbc53bfb@beroal.in.ua>
 <YGPTWqUtHqEyRLMv@google.com>
 <10ac38ce-4e76-4e12-2112-bd4cc10d1ab4@beroal.in.ua>
 <YGSZw6Azb8E43gOl@google.com>
From: beroal <me@beroal.in.ua>
Message-ID: <6c50097b-4666-6218-1c87-b4a494a239d4@beroal.in.ua>
Date: Thu, 1 Apr 2021 03:19:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGSZw6Azb8E43gOl@google.com>
Content-Language: en-US
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
 https://senderscore.org/blocklistlookup/
 [195.234.4.10 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_RP_RNBL        RCVD_IN_RP_RNBL renamed to RCVD_IN_VALIDITY_RPBL,
 please update local rules
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1lRl6e-001CTk-2h
Subject: Re: [f2fs-dev] `mount` reports an error, but `fsck.f2fs` does not
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 31.03.21 18:48, Jaegeuk Kim wrote:
> On 03/31, beroal wrote:
>> On 31.03.21 04:41, Jaegeuk Kim wrote:
>>> Hi,
>>>
>>> On 03/27, beroal wrote:
>>>> Ping.
>>>>
>>>> On 20.03.21 00:46, beroal wrote:
>>>>> Hi. After I extended a partition containing F2FS with a recent version
>>>>> of Gparted, the partition no longer mounts. `mount` reports an error,
>>>>> but `fsck.f2fs` does not see any problem (well, except for `Invalid CP
>>>>> CRC offset: 0`) and does not fix the file system.
>>>>>
>>>>> ```
>>>>> losetup /dev/loop0 arch-os.img
>>>>> mount -t f2fs -o ro /dev/loop0 /root/mnt/temp
>>>>> ```
>>>>>
>>>>> ```
>>>>> [ 6890.647749] F2FS-fs (loop0): Wrong valid_user_blocks: 16040048,
>>>>> user_block_count: 10016768
>>>>> [ 6890.647808] F2FS-fs (loop0): Failed to get valid F2FS checkpoint
>>>>> ```
>>>>>
>>>>> ```
>>>>> losetup -d /dev/loop0
>>>>> fsck.f2fs arch-os.img
>>> May I ask run this?
>>>
>>> # fsck.f2fs -d 3 arch-os.img?
>> The result is a log of size 270 MB. I'll send it privately to
>> jaegeuk@kernel.org if you don't mind. It contains directory and file names.
> Thanks.
>
> segment_count_main                      [0x    9a95 : 39573]
> -> 39573 * 2MB = 78GB as user space
>
> overprov_segment_count                  [0x    4e29 : 20009]
> -> 20009 * 2MB = 40GB as overprovisioned space which user can't see.
>
> But,
>
> [FSCK] valid_block_count matching with CP             [Ok..] [0xf4c070]
> -> 0xf4c070 = 16040048
>
> valid_block_count                       [0x  f4c070 : 16040048]
> -> So, this is correct.
>
> So, I suspect overprovisioned space is wrong and guess resize.f2fs assigned
> a wrong value. May I ask from and to which capacities you resized? I may
> need to reproduce it quickly.
Resizing was done by Gparted. I don't remember precisely, but the 
previous partition size was around 65536 MiB, and the F2FS used the 
whole partition. The new size most likely was the current size of the 
partition, 79549 MiB.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
