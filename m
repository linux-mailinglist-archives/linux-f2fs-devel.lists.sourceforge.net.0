Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A03507D11
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 01:08:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngwwz-0002Fb-VS; Tue, 19 Apr 2022 23:08:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ngwwx-0002FU-UX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 23:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e7v4itdYqq7ZDXuf1DYRjOfIpMLK34v1wUFRmSNn9I4=; b=RId1d0QJuR0l8HQmIY6bFHHVRV
 qsuo6GFZ11CHS1snl8rAiJwKy3xexUK/PkbrSq0zbxTq3Uug4ezmwuZ6HAHOXlEnkJhKsgbFzQzf3
 zHKMDGumMoi3nphD9VGIVsa4AVxlSTCT2Y4/zjgub3sFgogdzf2zJN3p/vQHekQitLxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e7v4itdYqq7ZDXuf1DYRjOfIpMLK34v1wUFRmSNn9I4=; b=dhBSoqsSpXcQCv0VCcl93o/Qq1
 YJWTFLmEgcmArRIfRrOL6WTBGvlTCYTM8DFzODClWm3Bb5KIDlsOaMKnj6zW+i9r+TPwUhv8HBUDW
 4Ai9S9LDIOwEU6GKiX8Vj0ZFEKSyYfqYZKAkyJk/wTnSnkU4Rn9v/d61g2l+y+qwxptY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngwwu-0007w6-RT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 23:07:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87CA7B81CA3;
 Tue, 19 Apr 2022 23:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72ABC385A7;
 Tue, 19 Apr 2022 23:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650409669;
 bh=k8B9G9Sx9s37s7Rwc2iztvsuAaopTtv6sK48Xvqt2rM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vJaXgeJgvf0vaKEt+Czr7724FqGZ15C8uw/4EsfhVdzKbIDixfZ6BwKSB9Pu6845h
 82Yy1dn8hTTfGqdRxB8fCXtSQxRfRGoi1KrlQob5Uri0R9rylUl7leqbxXUWDE20CM
 VhMZ+4Jzdp+j2yP8RBvC6J4s4L9JzjY12pUJHRSlUeeWuArUFv71VR+UBKK6suDu/g
 3S8iwQsCnWnt0xQeAxZj7c/VxLt4HHlySH6MA5yVHX7/Ws1LCqObX9lJ36t5lR56Vc
 fZRzMk9UIXttKebCdZ6rSG4wf9u2H6tLiA1cH9gnGf7OnzQln2kMGaEynIATj+CT75
 zAq0KHRlN57mw==
Date: Tue, 19 Apr 2022 16:07:47 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Pankaj Raghav <p.raghav@samsung.com>
Message-ID: <Yl9Aw0vLdxM5Fexg@google.com>
References: <CGME20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35@eucas1p1.samsung.com>
 <20220413122940.133981-1-p.raghav@samsung.com>
 <YlcCSR2rTqOgOoxX@google.com>
 <6f508044-5329-f864-3879-c42a59d52366@samsung.com>
 <Ylcoc0mfEIUS0e5Q@google.com>
 <41ba478d-f32d-cf10-8096-43fb98dd3114@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41ba478d-f32d-cf10-8096-43fb98dd3114@samsung.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/19, Pankaj Raghav wrote: > On 2022-04-13 21:45, Jaegeuk
 Kim wrote:>> As I explained in the v1 > thread, zoned support for f2fs assumes
 po2 zone > >> sizes. For e.g., > >> static int __f2fs_issue [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngwwu-0007w6-RT
Subject: Re: [f2fs-dev] [PATCH v2] libf2fs: don't allow mkfs / fsck on non
 power-of-2 zoned devices
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
Cc: Damien.LeMoal@wdc.com, pankydev8@gmail.com,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org,
 Adam Manzanares <a.manzanares@samsung.com>, javier.gonz@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/19, Pankaj Raghav wrote:
> On 2022-04-13 21:45, Jaegeuk Kim wrote:>> As I explained in the v1
> thread, zoned support for f2fs assumes po2 zone
> >> sizes. For e.g.,
> >> static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
> >> 		struct block_device *bdev, block_t blkstart, block_t blklen)
> >> {
> >> 	sector_t sector, nr_sects;
> >> 	block_t lblkstart = blkstart;
> >> 	int devi = 0;
> >> ...
> >> ...
> >> 		// Assumes zone sectors to be po2
> s/Assumes zone sectors to be po2/Works correctly only if the base
> alignment is a power of 2 value./
> 
> Taken from align.h:
> /* @a is a power of 2 value */
> ...
> #define IS_ALIGNED(x, a)    (((x) & ((typeof(x))(a) - 1)) == 0)
> 
> > 
> > Well, I think this will be aligned to 2MB, if the device gives NPO2? IOWs, this
> Could you elaborate what you mean by `this will be aligned to 2MB`?
> > is just checking the granularity, not PO2.
> Yeah, so whenever we send a discard or a zone reset, the block zoned
> device expects the `sector` to be the start of a device zone. The check
> below essentially checks if the `sector` aligns with the `zone size
> sector` of the device. But to check for alignment using this `sector &
> (bdev_zone_sectors(bdev) - 1)` will only work if
> `bdev_zone_sectors(bdev)` is a power of 2.
> 
> Even if the device zone size is a multiple of 2MB, these checks will
> fail for a non power of 2 zone size device. The solution is simple, it
> is to make this alignment check generic but until this is done in the
> kernel, mkfs.f2fs should fail to mount for a non power of 2 device.
> > 
> >> 		if (sector & (bdev_zone_sectors(bdev) - 1) ||
> >> 				nr_sects != bdev_zone_sectors(bdev)) {
> >> 			f2fs_err(sbi, "(%d) %s: Unaligned zone reset attempted (block %x + %x)",
> >> 				 devi, sbi->s_ndevs ? FDEV(devi).path : "",
> >> 				 blkstart, blklen);
> I tried it locally in QEMU along with my local changes to remove power
> of 2 constraint in the block layer and zns device, and indeed the
> `Unaligned zone reset attempted` error popped up for a zns drive with a
> zone size 96MB.
> 
> When I changed the condition from `sector & (bdev_zone_sectors(bdev) -
> 1)` to `sector % bdev_zone_sectors(bdev)`, the error went away because
> the calculation doesn't depend on the alignment base to be a power of 2.
> 
> 
> TL;DR until we change some calculations in f2fs for zoned device to be
> generic, we need to bail out during mkfs time for non power of 2 zone
> size devices.

Ah, I see. Yeah, that in f2fs is actually PO2. Let me merge this patch to
force it before getting that relax. Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
