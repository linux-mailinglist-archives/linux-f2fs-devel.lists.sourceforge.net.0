Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD74B21E44A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2020 02:04:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jv8QW-0000JC-80; Tue, 14 Jul 2020 00:04:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jv8QN-0000Hg-54
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jul 2020 00:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zbkJWcUrb/KeV8NEO0TcqUfFK5HuB155WmUmAKKjfz0=; b=W8RP0PP1SjL354tgz+al1QOClM
 zq6xQFdfI8SuoOhlOgXhHPz1hS7Mf1IGC5bPuUPRUnAclIpnjRckyub2MePfPcXzDpomY8PNbpg/k
 TmKpBILFPknLCGhzjEhDbE4YVQ9AaDK9WkgPvl7v/uD/OOpuVV029/itEnzRfEuNgDm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zbkJWcUrb/KeV8NEO0TcqUfFK5HuB155WmUmAKKjfz0=; b=XXN3p5G7qfIlXzpUSb5A5CofcZ
 mqxqdDJRGSB/tj4xDxTrPaRW7lumHFcWTdFRJNSwmUnZNZopFxJXOEsB2vZrKgYU4urlT4l0G2mKe
 o3IlKZ4+F6iC/0euJGLsg4qVxDoJYehTwTZuKWCsJVu5N7IIpw83xa4SgoMet6let9us=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jv8QL-0028xS-80
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jul 2020 00:03:55 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A928C21883;
 Tue, 14 Jul 2020 00:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594685027;
 bh=4pPr2/y8YAMk6RVGxMO6eEw96Gv8CjodrwPyWqn/7iY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VnfHrFUdNDRkhM/bWkMZb6NLfKjAuXUOxdkLzyGc0rwLDnBxDWUj2C0W/wTtvCHbt
 tlVR6rmLf0hIhla/vgYrSIrtfKQBhDgFB5kL8wRS16bqr0Nvfu98uYErrtB7QWlXrV
 QD5gvSB62063agESki3dhmqpi41MZKnqNm5fj3tw=
Date: Mon, 13 Jul 2020 17:03:47 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Nathan Royce <nroycea+kernel@gmail.com>
Message-ID: <20200714000347.GA19314@google.com>
References: <CALaQ_hosk7627nTx97+xSSsGiN-qt=pTGNW4DZn4TOcAeRSC8g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALaQ_hosk7627nTx97+xSSsGiN-qt=pTGNW4DZn4TOcAeRSC8g@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jv8QL-0028xS-80
Subject: Re: [f2fs-dev] F2FS Segmentation Fault
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Nathan,

On 07/13, Nathan Royce wrote:
> I won't re-format unless I hear something within a few days in case
> you want me to try something.
> 
> Preface: There was a notable power outage a couple of nights ago.
> When the power returned, everything seemed fine. No issues during
> bootup or anything.
> Then today, I went to open an application and my system started
> schitzing out with programs suddenly closing(/crashing?).
> I switched tty and tried to log in but was unable to even be allowed
> to enter in my password.
> I switched to another and tried logging in as root which succeeded (somehow).
> I looked at the journal and saw an entry saying something about
> /bin/login not being a valid exec format.
> I went to reboot and when it got to fsck part of initramfs, it failed
> and I was kicked to root.
> I ran fsck and saw a bunch of issues, but I guess nothing could get
> resolved enough to let me reboot.
> Oh, in case you're wondering, my / (system) is on a 64GB SDHC card.
> I just happened to also have an older / system on my mechanical drive
> using BTRFS which I could boot to (which I'm on now).
> I ran fsck from this older system and it seems I got the same results:
> 
> *****
> Info: Fix the reported corruption.
> Info: Force to fix corruption
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: sector size = 512
> Info: total sectors = 124168159 (60628 MB)
> Info: MKFS version
>   "Linux version 5.1.15.a-1-hardened (builduser@slave-1) (gcc version
> 9.1.0 (GCC)) #1 SMP PREEMPT Thu Jun 27 11:33:04 CEST 2019"
> Info: FSCK version
>   from "Linux version 4.19.13-dirty (userName@computerName) (gcc
> version 8.2.1 20181127 (GCC)) #2 SMP PREEMPT Mon Dec 31 00:15:50 CST
> 2018"
>     to "Linux version 4.19.13-dirty (userName@computerName) (gcc
> version 8.2.1 20181127 (GCC)) #2 SMP PREEMPT Mon Dec 31 00:15:50 CST
> 2018"
> Info: superblock features = 0 :
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: total FS sectors = 124168152 (60628 MB)
> Info: CKPT version = 63f2b4a
> Info: checkpoint state = 55 :  crc fsck compacted_summary unmount
> 
> NID[0x18eca] is unreachable, blkaddr:0xcf1d9d3c
> NID[0x18ecb] is unreachable, blkaddr:0x5db5f91f
> NID[0x18ecc] is unreachable, blkaddr:0x4653d
> NID[0x18ee3] is unreachable, blkaddr:0x144dc401
> NID[0x18ee4] is unreachable, blkaddr:0x558cfba9
> NID[0x18ee5] is unreachable, blkaddr:0x45553
> NID[0x18f78] is unreachable, blkaddr:0x560555ac
> NID[0x18f79] is unreachable, blkaddr:0x58cccb0d
> NID[0x18f7a] is unreachable, blkaddr:0x53d84
> NID[0x4d621] is unreachable, blkaddr:0x4fc1d
> NID[0x4d622] is unreachable, blkaddr:0x4fc1e
> NID[0x7fa32] is unreachable, blkaddr:0x20b0ca3a
> NID[0x7fa33] is unreachable, blkaddr:0xf71b60
> [FSCK] Unreachable nat entries                        [Fail] [0xd]
> [FSCK] SIT valid block bitmap checking                [Fail]
> [FSCK] Hard link checking for regular file            [Ok..] [0x4f6]
> [FSCK] valid_block_count matching with CP             [Fail] [0x736fcb]
> [FSCK] valid_node_count matcing with CP (de lookup)   [Fail] [0x70327]
> [FSCK] valid_node_count matcing with CP (nat lookup)  [Ok..] [0x70334]
> [FSCK] valid_inode_count matched with CP              [Fail] [0x6f09e]
> [FSCK] free segment_count matched with CP             [Ok..] [0x3bfc]
> [FSCK] next block offset is free                      [Ok..]
> [FSCK] fixing SIT types
> [FSCK] other corrupted bugs                           [Fail]
> 
> Do you want to restore lost files into ./lost_found/? [Y/N] Y

Could you try to say "N" here to move forward to fix the corrupted metadata?

Thanks,

> Segmentation fault
> *****
> 
> *****
>        Message: Process 3425 (fsck.f2fs) of user 0 dumped core.
> 
>                 Stack trace of thread 3425:
>                 #0  0x000055f8515739c8 n/a (fsck.f2fs)
>                 #1  0x000055f851575261 n/a (fsck.f2fs)
>                 #2  0x000055f851572c56 n/a (fsck.f2fs)
>                 #3  0x000055f85156a3f0 n/a (fsck.f2fs)
>                 #4  0x00007f51420feee3 __libc_start_main (libc.so.6)
>                 #5  0x000055f85156a95e n/a (fsck.f2fs)
> *****
> 
> So if you want more information or need me to try something, let me
> know soon if you would. Otherwise, I'll just be reformatting my card
> in a few days.
> It just could've been a fluke occurred because of the power outage but
> didn't manifest itself until today.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
