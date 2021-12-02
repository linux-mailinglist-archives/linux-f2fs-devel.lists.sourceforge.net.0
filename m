Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E518466B96
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Dec 2021 22:20:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mstV5-0001vc-4p; Thu, 02 Dec 2021 21:20:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mstUw-0001vU-EM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 21:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JRnD1u9LUyhkHt9gGQRtsxFkBGwINyD+GF3H+bZY2rU=; b=VPQerLBnF4mhoA29J9BagZQwSf
 Bc50X7pIvTB2/CPfxD02oeJXHoN1rQYNX635MK7ZMGCqPo1MV6u31ooJ6r0EGDJMCrMNCP3ib6AP8
 OiA1/tMgQBq6D6qDILSerK3p5/np4TNlQqlPdkxw0Xv7yRqWS4e+ghnK0s+yTylL8m2o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JRnD1u9LUyhkHt9gGQRtsxFkBGwINyD+GF3H+bZY2rU=; b=YHGOsbHPj5VfRliQPt+pkUNRT2
 YhxraRMkqms1Ux0DZETwP39vTlbO30WQyvbaCTvpgsXKHARbMzdWcHY5Zqyr8YK8rxDpNEzap1jdQ
 ybGAGpw0MpBQ9X+6OEk0bpSn9Qdw8xlEzwrVHAG/epV5+QqVZfTj7tjvpL3I0hgXqOWA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mstUp-00024u-GA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 21:20:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 540C2CE23ED
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Dec 2021 21:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC8DC53FCD;
 Thu,  2 Dec 2021 21:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638479989;
 bh=U1g+cStoO0rqevxYYer5iTOqfPl9s10QknT3QGLAuPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VmRU1DGAQ529ISZd4lxOLmleIGmzmeB9II7sXSuzZ7BtI8F52SwYh1k5okUm5ocJl
 jFEW4V/rJELVgW/RD/CN7ySglqGJ4JvGApucOy5NX/Zcv0nREdcsCHqRvXCLv9vPNe
 +psBkwUa/mVt5UWIYPimK8H2E8DBfiEjJbr6vvxwZ9Xr9h88VimZjcXWvoQe9fJTyR
 ifkN80s56nd86ndNNVAONdAQ8u+o3hlC5NPv6iX4s27Yfq4V3Ut1TVSQolT4dxmepq
 XgAqj/O0w6UM9TdtKD61LzgSXP+AbQRFJmYwMbPZXy4m0crK/0Bf35i9sD8RpAL+zq
 y6bt9gXC0kCEQ==
Date: Thu, 2 Dec 2021 13:19:47 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Yak4cxU6htgQk7ck@google.com>
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
 <20211116214510.2934905-5-jaegeuk@kernel.org>
 <b36e2d44-4834-3931-6a32-4fa52d1d7785@kernel.org>
 <YahIf3UlhuxJT1O4@sol.localdomain>
 <1ba0f002-42c7-b085-0c54-6071664ba79b@kernel.org>
 <YakPrVPz5+qQm3kQ@sol.localdomain> <YakXMV0UvBV7TVwe@google.com>
 <YakX38onzsW5Ef8B@google.com> <YakzVAkHAVMueJwe@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YakzVAkHAVMueJwe@sol.localdomain>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/02, Eric Biggers wrote: > On Thu, Dec 02,
 2021 at 11:00:47AM
 -0800, Jaegeuk Kim wrote: > > On 12/02, Jaegeuk Kim wrote: > > > On 12/02,
 Eric Biggers wrote: > > > > On Thu, Dec 02, 2021 at 10:04: [...] 
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
X-Headers-End: 1mstUp-00024u-GA
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
> On Thu, Dec 02, 2021 at 11:00:47AM -0800, Jaegeuk Kim wrote:
> > On 12/02, Jaegeuk Kim wrote:
> > > On 12/02, Eric Biggers wrote:
> > > > On Thu, Dec 02, 2021 at 10:04:11PM +0800, Chao Yu wrote:
> > > > > On 2021/12/2 12:15, Eric Biggers wrote:
> > > > > > On Thu, Dec 02, 2021 at 11:10:41AM +0800, Chao Yu wrote:
> > > > > > > Why not relocating this check before f2fs_map_blocks()?
> > > > > 
> > > > > Wait, it supports DIO in multi-device image after commit 	71f2c8206202
> > > > > ("f2fs: multidevice: support direct IO"), how about
> > > > > checking with f2fs_allow_multi_device_dio()?
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > 
> > > > Okay, that was not the case when I sent this patch originally.  We'll need to
> > > > update this to support multiple devices.
> > > 
> > > Chao/Eric, does this make sense?
> > > 
> > > --- a/fs/f2fs/data.c
> > > +++ b/fs/f2fs/data.c
> > > @@ -4070,11 +4070,10 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
> > >                 }
> > >                 if (WARN_ON_ONCE(!__is_valid_data_blkaddr(map.m_pblk)))
> > >                         return -EINVAL;
> > > -               iomap->addr = blks_to_bytes(inode, map.m_pblk);
> > > 
> > > -               if (WARN_ON_ONCE(f2fs_is_multi_device(F2FS_I_SB(inode))))
> > > -                       return -EINVAL;
> > > -               iomap->bdev = inode->i_sb->s_bdev;
> > > +               iomap->bdev = map->m_multidev_dio ? map.m_bdev :
> > 
> > correction:			map.m_multidev_dio
> > 
> 
> I guess so, but why doesn't f2fs_map_blocks() just always set m_bdev to the
> correct block device?  What is the point of m_multidev_dio?

It seems we can simply assign iomap->bdev = map.m_bdev, and remove
map->m_multidev_dio.

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
