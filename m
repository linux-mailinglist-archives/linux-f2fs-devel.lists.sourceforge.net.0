Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC2772FFA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 21:56:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qT6Kg-0005Xc-IO;
	Mon, 07 Aug 2023 19:56:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qT6Kf-0005XU-Ri
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jk3+SmPsiJD2eB0eA82VnXs3Y0+BTKunNGQl/WFxAQ0=; b=E7HEIBznsUEZ24uaBexr+xlo7O
 mVdDqL4X1kdyRFHlV+9lgF10aNSFqjCpC+6477p0ZHRazg39KSp3xKktkBzmmNM59mxKhbPaR+qeu
 FPB8UnYE+Ly/7AJqXsgZFZ1PvKLJIoN57PgNN+2ojkkiH3N7RaBpUuKNTWvOLppz+Uls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jk3+SmPsiJD2eB0eA82VnXs3Y0+BTKunNGQl/WFxAQ0=; b=YeM7z4ei1ao5g57jcim6pegY1p
 M3z8KWGSXjK3IYsbPFwSctTX3TVoUs26pR9b4zCWUHeau2JfiSKC92K3aQ3G6hdnmZmjLvOpmks+U
 6F3wL2MYwB8uZdTTy7nRvnXKxgxzRDlJuZ+cS7+06o3IkU64L+qAnSyfveiF5dK6hzF4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qT6Kf-00031j-43 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:56:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83A43621AE;
 Mon,  7 Aug 2023 19:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF749C433C8;
 Mon,  7 Aug 2023 19:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691438154;
 bh=FLpUoUU84HaNScz6NMB6ng+JKBq4Mbm3GQuEgZXmsjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fV3gVUGLXIRTvLORYRTNW3aOv4XrPqCslAQjeGgwBPl1NgR2yTTb0I+WksrZXheCT
 zO7w09X0E+WrMG+vJw0GDyfZyRZuoTAR0QLYK5dnMlCxaFWCOD431iPRX1nPP4paEE
 2t4OVADEWhqHXcf1IxRHlUZYNqeZkrdf8tgdPTCxlozTwuyLBcrq5anVtP3rtDgv0g
 /Y/Wm/b/wzbAE/2QRO1gs+G+5tUr2bCqxYxEwoXaFAFzrudvkFrfT4dkIqRxRFJZzL
 GU3NNckeOIGONWxzngMxqjkuavMRTIEVNSnLudWMtNuxQs5UudL30+nabeu3GtXtSZ
 vRXJHXW3SWC0w==
Date: Mon, 7 Aug 2023 12:55:53 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZNFMSde8S7ratVw6@google.com>
References: <20230523123521.67656-1-chao@kernel.org>
 <fafcfeosil5yqwn2wcdx33im2mq4xkejw6bx7h2in3ay5h6znj@facx4rrg4p65>
 <ZM1PwzoqSt05KqTp@google.com>
 <b3685d22-1be2-2376-5242-0e9a0f5471f8@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3685d22-1be2-2376-5242-0e9a0f5471f8@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/07, Chao Yu wrote: > On 2023/8/5 3:21,
 Jaegeuk Kim wrote:
 > > On 08/04, Shinichiro Kawasaki wrote: > > > On May 23, 2023 / 20:35, Chao
 Yu wrote: > > > > Use sbi->log_sectors_per_block to clean u [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qT6Kf-00031j-43
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up w/ sbi->log_sectors_per_block
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
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/07, Chao Yu wrote:
> On 2023/8/5 3:21, Jaegeuk Kim wrote:
> > On 08/04, Shinichiro Kawasaki wrote:
> > > On May 23, 2023 / 20:35, Chao Yu wrote:
> > > > Use sbi->log_sectors_per_block to clean up below calculated one:
> > > > 
> > > > unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> > > 
> > > Hello Chao,
> > > 
> > > When I ran workloads on f2fs using v6.5-rcX with fixes [1][2] and a zoned block
> > > devices with 4kb logical block size, I observe mount failure as follows. When
> > > I revert this commit, the failure goes away.
> > > 
> > > [  167.781975][ T1555] F2FS-fs (dm-0): IO Block Size:        4 KB
> > > [  167.890728][ T1555] F2FS-fs (dm-0): Found nat_bits in checkpoint
> > > [  171.482588][ T1555] F2FS-fs (dm-0): Zone without valid block has non-zero write pointer. Reset the write pointer: wp[0x1300,0x8]
> > > [  171.496000][ T1555] F2FS-fs (dm-0): (0) : Unaligned zone reset attempted (block 280000 + 80000)
> > > [  171.505037][ T1555] F2FS-fs (dm-0): Discard zone failed:  (errno=-5)
> > > 
> > > The patch replaced "sbi->log_blocksize - SECTOR_SHIFT" with
> > > "sbi->log_sectors_per_block". However, I think these two are not equal when the
> > > device has 4k logical block size. The former uses Linux kernel sector size 512
> > > byte. The latter use 512b sector size or 4kb sector size depending on the
> > > device. mkfs.f2fs obtains logical block size via BLKSSZGET ioctl from the device
> > > and reflects it to the value sbi->log_sector_size_per_block. This causes
> > > unexpected write pointer calculations in check_zone_write_pointer(). This
> > > resulted in unexpected zone reset and the mount failure.
> > > 
> > > I think this patch needs revert. What do you think?
> > 
> > Yeah, applied the revert.
> 
> Jaegeuk, could you please send the patch to mailing list?

I sent. Thanks.

> 
> Thanks,
> 
> > 
> > > 
> > > [1] https://lkml.kernel.org/linux-f2fs-devel/20230711050101.GA19128@lst.de/
> > > [2] https://lore.kernel.org/linux-f2fs-devel/20230804091556.2372567-1-shinichiro.kawasaki@wdc.com/


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
