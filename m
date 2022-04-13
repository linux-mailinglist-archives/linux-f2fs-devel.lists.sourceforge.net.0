Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A4D4FFF94
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Apr 2022 21:46:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neiwR-0008Hi-WE; Wed, 13 Apr 2022 19:46:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1neiwQ-0008HX-04
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 19:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vLnR8t9pedLmEVywtEVW94hqkyP3878IsTZH4V/dd1E=; b=f9Rn9ewKJgswOfrtBgPzQKxH0o
 4Sk2KT7BuWqL9O8BkJT7T8C1r3owiB5i998qqGUO4mt9mct4PmD6uk0p1jrK/IRlIVJ/7JFfqIH2j
 becMFj7CyawdehdyBsYbRBIPBN/5zC5O9hHtKWbwPmqbRhxOCoQAtsR+N23BZX5RpsnI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vLnR8t9pedLmEVywtEVW94hqkyP3878IsTZH4V/dd1E=; b=Tq+vZkT+rK4doBPVBPJzkBLcgE
 jEOXS856fILmBkK+ANxX+tz9i8gEb8ktbF+zlP6bnv22RyR/DkQOZt7mG+m795ulgHLHdqA2E3gtb
 JhWE6HI9Xf+Zg7udfi9W6OAZa/5fFJQKbWHin5FOHFeBEN9ExC8SSV0IppnFFBCTlyeo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neiwL-00FVQn-Ee
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 19:46:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 59DE3B82661;
 Wed, 13 Apr 2022 19:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB80C385A3;
 Wed, 13 Apr 2022 19:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649879157;
 bh=XPD98dk234eV6p6Go3o9O0FpNfiVDiM2DhOhF0k9vNE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ovKETz+nLxn/hz0nmetVnPIfFJNEDzapDp1eu/i2RSojdHDudU9X8CQEDvksTQ8fA
 lAaIe1X6hXFFjnzrz/jJDVnAQf9tVvhTsJ23fvLIfFdr9ik4biILKjiVGcbxMM9JBT
 xtIW3sYIrWUmkyQgjQ4T2o7LfYt3YT+yBm6m5mCqQ6rJrHpY2qdAW6TFdgSKzDrG1f
 USn+wssNofczXEHqaMIg3FI0CDR/6vuskHHSjpSGB2M2SEKrGEX99C/uDyZyXaOEj6
 zFLUIJcBM691ceGHhR19hE9gf2on1Cy8WAxyj6u24xE2uLzbZCuE0fEzABu1+KE6Rc
 E2v/F/fuaWnSw==
Date: Wed, 13 Apr 2022 12:45:55 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Pankaj Raghav <p.raghav@samsung.com>
Message-ID: <Ylcoc0mfEIUS0e5Q@google.com>
References: <CGME20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35@eucas1p1.samsung.com>
 <20220413122940.133981-1-p.raghav@samsung.com>
 <YlcCSR2rTqOgOoxX@google.com>
 <6f508044-5329-f864-3879-c42a59d52366@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f508044-5329-f864-3879-c42a59d52366@samsung.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/13, Pankaj Raghav wrote: > Hi Jaegeuk,
 > > On 2022-04-13 19:03, Jaegeuk Kim wrote > >> @@ -882, 6 +882,
 11 @@ static int open_check_fs(char
 *path, int flag) > >> return open(path, O_RDONLY | flag) [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1neiwL-00FVQn-Ee
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
Cc: javier.gonz@samsung.com, Damien.LeMoal@wdc.com, mcgrof@kernel.org,
 pankydev8@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/13, Pankaj Raghav wrote:
> Hi Jaegeuk,
> 
> On 2022-04-13 19:03, Jaegeuk Kim wrote
> >> @@ -882,6 +882,11 @@ static int open_check_fs(char *path, int flag)
> >>  	return open(path, O_RDONLY | flag);
> >>  }
> >>  
> >> +static int is_power_of_2(unsigned long n)
> > 
> > So, this needs to check 2MB alignment only?
> > 
> As I explained in the v1 thread, zoned support for f2fs assumes po2 zone
> sizes. For e.g.,
> static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
> 		struct block_device *bdev, block_t blkstart, block_t blklen)
> {
> 	sector_t sector, nr_sects;
> 	block_t lblkstart = blkstart;
> 	int devi = 0;
> ...
> ...
> 		// Assumes zone sectors to be po2

Well, I think this will be aligned to 2MB, if the device gives NPO2? IOWs, this
is just checking the granularity, not PO2.

> 		if (sector & (bdev_zone_sectors(bdev) - 1) ||
> 				nr_sects != bdev_zone_sectors(bdev)) {
> 			f2fs_err(sbi, "(%d) %s: Unaligned zone reset attempted (block %x + %x)",
> 				 devi, sbi->s_ndevs ? FDEV(devi).path : "",
> 				 blkstart, blklen);
> 			return -EIO;
> 		}
> 
> ...
> }
> 
> So until non power of 2 zoned devices are supported in block layer and
> f2fs, it is safer to reject non power of 2 devices during mkfs time. I
> hope it clarifies.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
