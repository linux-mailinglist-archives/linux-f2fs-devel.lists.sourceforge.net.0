Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EB44849BD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Jan 2022 22:15:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n4r9U-0007UX-A2; Tue, 04 Jan 2022 21:15:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1n4r9T-0007UR-8t
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Jan 2022 21:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=psC4H3oa5ayoSvwaJLuDe8l0ZAZFRtyWUVB2hVqESes=; b=UiYEE5oQ+aN+prbKSfUUZ/UX99
 TdQ8a8WxGRlA4MWYGM6KoN1sIj28RVArgj3q0vCMa6r7xCd+fgBIJi8NqejleXTrRpC5psFIgDaPJ
 J8aNXFYu5pm6DB1mAa8KioRTPuNPW4aXCvtfoJhOjSqADdvHqofQYwujrXuTgkj45QsQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=psC4H3oa5ayoSvwaJLuDe8l0ZAZFRtyWUVB2hVqESes=; b=EkesZJjrUqx6zBu9VxhfhfLZcr
 Sm+ya7RoBDZJ2r6v8obETrVeupdBhqvUhJXNheJn22OJCoyI6/HHT1wuJ4d5prRrLVjj/sxYBzlNQ
 XQjKWrCezkaMZhYqjewiJuf7j1pKxHjoEKAlJMorLyPF699KvD/063iAfpxiVHddtARA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n4r9R-002FwG-14
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Jan 2022 21:15:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C17C6144A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  4 Jan 2022 21:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86CEC36AEB;
 Tue,  4 Jan 2022 21:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641330911;
 bh=aGwL1KfIyrbAmcd342EY4+l8L/kbbRvuvCn21vJF5Xg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lhJpT4pWc2lq1KVuyf1JbpIH1IdewsJ55pRrICra7G69/ucvcTFRcdSkyVPrUVtTE
 jeBG22FtZ8tbuUz6il0e9qM7SnGrK/gMnmbvmpTfkrg6xsxh718jRORTd7YxOTQ/OU
 snskQpQcuAYp2rLGmHwl2a7R4Pi8sNWv5tQ1AjNjsoAg2XBxUudZnOaDMTdT69KUvK
 RuGMEA4oMKouMcPS1wNef6w5zFqX33MQdp+aGCIeoCVrqcrI6HMo9smwK73zBqYeR8
 6aRN6KBFuCRVz8K6l1IIdbCP6ZDTJbWzpfb0yXeeS2OUJilAQNNpCdcYkzpa66Rj1u
 XPT7zkHtwIeAg==
Date: Tue, 4 Jan 2022 13:15:09 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YdS43f15g1enklVX@google.com>
References: <b36e2d44-4834-3931-6a32-4fa52d1d7785@kernel.org>
 <YahIf3UlhuxJT1O4@sol.localdomain>
 <1ba0f002-42c7-b085-0c54-6071664ba79b@kernel.org>
 <YakPrVPz5+qQm3kQ@sol.localdomain> <YakXMV0UvBV7TVwe@google.com>
 <YakX38onzsW5Ef8B@google.com> <YakzVAkHAVMueJwe@sol.localdomain>
 <Yak4cxU6htgQk7ck@google.com> <Yak6gtXthBRK3eeM@google.com>
 <ed10bb7a-af8c-d5a6-8bb1-a47559f78fbf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed10bb7a-af8c-d5a6-8bb1-a47559f78fbf@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/30, Chao Yu wrote: > On 2021/12/3 5:28, Jaegeuk Kim
 wrote: > > On 12/02, Jaegeuk Kim wrote: > > > On 12/02, Eric Biggers wrote:
 > > > > On Thu, Dec 02, 2021 at 11:00:47AM -0800, Jaegeuk Kim wrot [...] 
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
X-Headers-End: 1n4r9R-002FwG-14
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/30, Chao Yu wrote:
> On 2021/12/3 5:28, Jaegeuk Kim wrote:
> > On 12/02, Jaegeuk Kim wrote:
> > > On 12/02, Eric Biggers wrote:
> > > > On Thu, Dec 02, 2021 at 11:00:47AM -0800, Jaegeuk Kim wrote:
> > > > > On 12/02, Jaegeuk Kim wrote:
> > > > > > On 12/02, Eric Biggers wrote:
> > > > > > > On Thu, Dec 02, 2021 at 10:04:11PM +0800, Chao Yu wrote:
> > > > > > > > On 2021/12/2 12:15, Eric Biggers wrote:
> > > > > > > > > On Thu, Dec 02, 2021 at 11:10:41AM +0800, Chao Yu wrote:
> > > > > > > > > > Why not relocating this check before f2fs_map_blocks()?
> > > > > > > > 
> > > > > > > > Wait, it supports DIO in multi-device image after commit 	71f2c8206202
> > > > > > > > ("f2fs: multidevice: support direct IO"), how about
> > > > > > > > checking with f2fs_allow_multi_device_dio()?
> > > > > > > > 
> > > > > > > > Thanks,
> > > > > > > > 
> > > > > > > 
> > > > > > > Okay, that was not the case when I sent this patch originally.  We'll need to
> > > > > > > update this to support multiple devices.
> > > > > > 
> > > > > > Chao/Eric, does this make sense?
> > > > > > 
> > > > > > --- a/fs/f2fs/data.c
> > > > > > +++ b/fs/f2fs/data.c
> > > > > > @@ -4070,11 +4070,10 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
> > > > > >                  }
> > > > > >                  if (WARN_ON_ONCE(!__is_valid_data_blkaddr(map.m_pblk)))
> > > > > >                          return -EINVAL;
> > > > > > -               iomap->addr = blks_to_bytes(inode, map.m_pblk);
> > > > > > 
> > > > > > -               if (WARN_ON_ONCE(f2fs_is_multi_device(F2FS_I_SB(inode))))
> > > > > > -                       return -EINVAL;
> > > > > > -               iomap->bdev = inode->i_sb->s_bdev;
> > > > > > +               iomap->bdev = map->m_multidev_dio ? map.m_bdev :
> > > > > 
> > > > > correction:			map.m_multidev_dio
> > > > > 
> > > > 
> > > > I guess so, but why doesn't f2fs_map_blocks() just always set m_bdev to the
> > > > correct block device?  What is the point of m_multidev_dio?
> > > 
> > > It seems we can simply assign iomap->bdev = map.m_bdev, and remove
> > > map->m_multidev_dio.
> > 
> > Ok, it was used in previous get_block flow, but I think it'd be worth to keep it
> > to show by f2fs_map_blocks tracepoint.
> 
> The last version wasn't sent into mailing list?

No, will post it again soon.

> 
> Thanks,
> 
> > 
> > > 
> > > > 
> > > > - Eric
> > > 
> > > 
> > > _______________________________________________
> > > Linux-f2fs-devel mailing list
> > > Linux-f2fs-devel@lists.sourceforge.net
> > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > 
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
