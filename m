Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDD221E7B3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2020 07:54:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvDtQ-0000yG-3z; Tue, 14 Jul 2020 05:54:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jvDtO-0000xx-VK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jul 2020 05:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VppGfr4Ws/TxOtP2eQ5eNmARIaIMf0fUF1IklvXS70A=; b=fIgFuZvxyYiSwbyM/Qwf+9hHVb
 FKIUnIbCE0iWvZIE4+S1zDLjMpYi/0n6usxbqNkGX2hJTWe3huKF7zqXEARzx3lyfBt/Zgxwb8bnk
 YoE7JuBlJY8QhlKivwzsnb5S4uUtMeluqwU/3r79GSAO4NQIoAM8dD4tPPN2yoZEnHGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VppGfr4Ws/TxOtP2eQ5eNmARIaIMf0fUF1IklvXS70A=; b=JNEBF1TwmJD8z8x3n0XhlPFP28
 pQEfMRTs+WB6qAXu6Kkgxql2624ft3iBKgrg3RDJz3KlFEq22aa7gSy3WSdHJ14ghPmxdL2BKMcL5
 QBFXAGokW+IKBzNgjU07fnknSWIL8d7P1GkISTV5fWvSdop/s3zCCibOG0OxVFU6zvDA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvDtN-00H1to-IN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jul 2020 05:54:14 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 128C221D93;
 Tue, 14 Jul 2020 05:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594706048;
 bh=PGNl7z3XN8kXFxiyWD/XEmUz1dGjT5aK6XHKZlH/jxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GDLAC7iejZJYIToBQQk8NgXwr43j55sW04H3EcqRFhRLXMVLVAU/yqCFrGu/f7mLh
 xKdpTis1BPpszvfyYN0XrVfY/o266JbUcR04tteLejC3Duoxd71SA/cVltIuPdQyCZ
 00T6D3gzbRSaXiqBKxTVsQC+Be5PbiYjCQIt1rDU=
Date: Mon, 13 Jul 2020 22:54:07 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Nathan Royce <nroycea+kernel@gmail.com>
Message-ID: <20200714055407.GA94278@google.com>
References: <CALaQ_hosk7627nTx97+xSSsGiN-qt=pTGNW4DZn4TOcAeRSC8g@mail.gmail.com>
 <20200714000347.GA19314@google.com>
 <CALaQ_hriyvF8yaSihvGEN1U2jufCQ5sj=aknN+1xB=4EbkBWaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALaQ_hriyvF8yaSihvGEN1U2jufCQ5sj=aknN+1xB=4EbkBWaQ@mail.gmail.com>
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvDtN-00H1to-IN
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

On 07/13, Nathan Royce wrote:
> On Mon, Jul 13, 2020 at 7:03 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> >
> > Hi Nathan,
> >
> > Could you try to say "N" here to move forward to fix the corrupted metadata?
> >
> > Thanks,
> *****
> Do you want to restore lost files into ./lost_found/? [Y/N] N
> Info: Write valid nat_bits in checkpoint
> [FIX] (nullify_nat_entry:2273)  --> Remove nid [0x18eca] in NAT
> [FIX] (nullify_nat_entry:2273)  --> Remove nid [0x18ecb] in NAT
> [FIX] (nullify_nat_entry:2273)  --> Remove nid [0x18ecc] in NAT
> [FIX] (nullify_nat_entry:2273)  --> Remove nid [0x18ee3] in NAT
> [FIX] (nullify_nat_entry:2273)  --> Remove nid [0x18ee4] in NAT
> [FIX] (nullify_nat_entry:2273)  --> Remove nid [0x18ee5] in NAT
> [FIX] (nullify_nat_entry:2273)  --> Remove nid [0x18f78] in NAT
> [FIX] (nullify_nat_entry:2273)  --> Remove nid [0x18f79] in NAT
> [FIX] (nullify_nat_entry:2273)  --> Remove nid [0x18f7a] in NAT
> [FIX] (nullify_nat_entry:2273)  --> Remove nid [0x4d621] in NAT
> [FIX] (nullify_nat_entry:2273)  --> Remove nid [0x4d622] in NAT
> [FIX] (nullify_nat_entry:2273)  --> Remove nid [0x7fa32] in NAT
> [FIX] (nullify_nat_entry:2273)  --> Remove nid [0x7fa33] in NAT
> Info: Write valid nat_bits in checkpoint
> 
> Done.
> *****
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
>   from "Linux version 4.19.13-dirty (nater@devx64) (gcc version 8.2.1
> 20181127 (GCC)) #2 SMP PREEMPT Mon Dec 31 00:15:50 CST 2018"
>     to "Linux version 4.19.13-dirty (nater@devx64) (gcc version 8.2.1
> 20181127 (GCC)) #2 SMP PREEMPT Mon Dec 31 00:15:50 CST 2018"
> Info: superblock features = 0 :
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: total FS sectors = 124168152 (60628 MB)
> Info: CKPT version = 63f2b4a
> Info: checkpoint state = 281 :  allow_nocrc nat_bits unmount
> Info: No error was reported
> *****
> I'm now booted in from my SDHC card. So it "seems" I'm good to go.
> But with the actions taken and the files I've seen displayed during
> the fsck, I'm thinking I'm going to reinstall all packages.
> Assuming the issue was related to the power outage, I do wonder why
> there weren't any fsck issues at bootup at that time. I hadn't had any
> disk issues before with that card.
> At least now I know the issue would be resolved by not saving the lost
> files and I can continue on my merry way.

I suspect the last power outage caused the FTL in the card firmware to point
the f2fs NAT table area to somewhere wrong flash cells. It may be possible
that we can't see any filesystem corruption easily, since it can corrupt
data area in higher possibility; this doesn't lead filesystem inconsistency.

I guess you use "-a" for fsck at boot up, which means scanning the disk when
runtime f2fs detects any inconsistent data. But that is true, only when the disk
guarantees SYNC_CACHE at least. Unfortunately, IMHO, such the flash card doesn't
support it gracefully, and thus, we can't rely on SYNC_CACHE which should be the
baseline to guarantee filesystem consistency. I think it'd be good to run "-f",
if sudden power cut happens in this case.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
