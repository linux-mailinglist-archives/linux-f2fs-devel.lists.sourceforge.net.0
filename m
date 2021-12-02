Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A8F466A19
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Dec 2021 19:58:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1msrHS-000733-6x; Thu, 02 Dec 2021 18:58:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1msrHR-00072x-1F
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 18:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5uCVT2kfngdCidFDDGdXKLTY9k7BcfoEDg1wSRyxwik=; b=Hp/fdEC6GxQb64VTLFo1gtXpsW
 m7E2f/0M29UB8M2EBHc+mlcB6Vvi7JKzS0iERapdZsfohTgEhp7cfDPzf6099M/GhlHnuo9vOxs5C
 M0xOE85SWKWd5E4Zbe/oEABYEvirXrRQX7FeoWznTVWZXT1bvgaZG/ZPSpd1jqNMFAyE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5uCVT2kfngdCidFDDGdXKLTY9k7BcfoEDg1wSRyxwik=; b=V2JKV9n45NhYk67fL3HDSzksJp
 71HNTPgwmczpIvXlwgDZo/hwR+iMKdVTZB4nXHQAOBTEfhOd2fdgIXwmmY9sQBRk1GMluu6xJCW5b
 i2fqR3TdneJxtiLjV4KTBHfagOCa+Al5a7ouobBor8dBmSqCRYo7Oj5FQE9b4pQE4Bdo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1msrHQ-000164-AF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 18:58:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A37C062784
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Dec 2021 18:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACCBC00446;
 Thu,  2 Dec 2021 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638471475;
 bh=AKoMZEWUw2l+NUyq4IhxAlP69xn5eiC9se60LnLgJcc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KSnJ3FH3EelCO3S1mA6tODmxN6Rs7Cp89RUaLKCKoYYgosZ1A07oyPZPUEpNPKcEf
 HIf4SNC4AtmHOgKeNfCaqyh7x4YCHpT8b6oDECpeeRWYC30yBckPL1hUb1wqxnavsC
 ki6qJCG1oNkwonu0dKRrt4PVSfpT7vuiPcq71KuBsVWGnbbs4+TAZe1khz7htjvF9C
 Y4bmpf+hXnT85U4JeHyRkYsMfUCjmhLVw3GpF0PYjGUNAU5Dh8kjdl9cPvldgE7k0k
 yA+jey/41Ajms7pBimsBP02xprVbAaeVm9PIWn3Oey0lz1wOza3uv09JKDdsLn1sEl
 zwHdBkStMiXfQ==
Date: Thu, 2 Dec 2021 10:57:53 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YakXMV0UvBV7TVwe@google.com>
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
 <20211116214510.2934905-5-jaegeuk@kernel.org>
 <b36e2d44-4834-3931-6a32-4fa52d1d7785@kernel.org>
 <YahIf3UlhuxJT1O4@sol.localdomain>
 <1ba0f002-42c7-b085-0c54-6071664ba79b@kernel.org>
 <YakPrVPz5+qQm3kQ@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YakPrVPz5+qQm3kQ@sol.localdomain>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/02, Eric Biggers wrote: > On Thu, Dec 02,
 2021 at 10:04:11PM
 +0800, Chao Yu wrote: > > On 2021/12/2 12:15, Eric Biggers wrote: > > > On
 Thu, Dec 02, 2021 at 11:10:41AM +0800, Chao Yu wrote: > > [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
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
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1msrHQ-000164-AF
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/02, Eric Biggers wrote:
> On Thu, Dec 02, 2021 at 10:04:11PM +0800, Chao Yu wrote:
> > On 2021/12/2 12:15, Eric Biggers wrote:
> > > On Thu, Dec 02, 2021 at 11:10:41AM +0800, Chao Yu wrote:
> > > > Why not relocating this check before f2fs_map_blocks()?
> > 
> > Wait, it supports DIO in multi-device image after commit 	71f2c8206202
> > ("f2fs: multidevice: support direct IO"), how about
> > checking with f2fs_allow_multi_device_dio()?
> > 
> > Thanks,
> > 
> 
> Okay, that was not the case when I sent this patch originally.  We'll need to
> update this to support multiple devices.

Chao/Eric, does this make sense?

--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4070,11 +4070,10 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
                }
                if (WARN_ON_ONCE(!__is_valid_data_blkaddr(map.m_pblk)))
                        return -EINVAL;
-               iomap->addr = blks_to_bytes(inode, map.m_pblk);

-               if (WARN_ON_ONCE(f2fs_is_multi_device(F2FS_I_SB(inode))))
-                       return -EINVAL;
-               iomap->bdev = inode->i_sb->s_bdev;
+               iomap->bdev = map->m_multidev_dio ? map.m_bdev :
+                                               inode->i_sb->s_bdev;
+               iomap->addr = blks_to_bytes(inode, map.m_pblk);
        } else {
                iomap->length = blks_to_bytes(inode, next_pgofs) -
                                iomap->offset;

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
