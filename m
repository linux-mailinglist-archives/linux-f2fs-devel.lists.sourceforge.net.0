Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B4893DD17
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jul 2024 05:26:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sXY4C-00088J-9d;
	Sat, 27 Jul 2024 03:25:57 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sXY4B-00088B-JJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jul 2024 03:25:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DXCWiVdNZAwnHnkGcJCSpF5wib8TLr/CME4SSeql6HE=; b=WlKMSgkDvCS6Qd5AQ+6Q5vh01T
 B2PclEZAiJcHntXl1R1/RuuJjzpFXLmXG9qkOSfNTEwNOP0drIZhXmNIDfYu2UK5vnm8ebD2YOGlp
 OQgUvrzJt/9cKM3zckDFvfNxwuSB6vNrqS7kWE6ynGanG/b154f19RPAsOMJxQ88rqqY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DXCWiVdNZAwnHnkGcJCSpF5wib8TLr/CME4SSeql6HE=; b=CzRITgJkTP2COHIG2kOipu9oHn
 P4tP4rBHliwzHOmGJfkrHfJ5cRAbVSN7JTB8tgcfv6ShIl+SXbsB7mPg7yqgOKivRW/+9nRr5TRVy
 T1S5OUnr+1eR4Bm136mG1SRjcNgfF3ywzjJS5kIGmWSsmGBSUA0m5xU6oe6D4/UpfLpM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sXY4B-0008G7-IS for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jul 2024 03:25:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 29E8D60DF5;
 Sat, 27 Jul 2024 03:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65736C32781;
 Sat, 27 Jul 2024 03:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722050744;
 bh=w91TPZxrPsLeGlqQhW0PLg/jt9TLaAwIo3cgRjJDId0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nXnJmNVUzTa2/THaMDB+O+XHDPW1Uvfrm9w3kiaRn6s6vnvRCz8jNH0JG/8R3g8KK
 uKqaClfuehITn6N9CSomcqqWgWbT12iDvXj3syrhTlUNbrj5e4KNJLtqnh8Ajo9Tez
 5jmB0MPP0W+NZt67aaNKKuR0mXvzb2+90/XHC7kgk/e41+r4V73u1IN5tucMLSyfLw
 er9q14gjURPO8rL+gQRGAS5F123pHWaWDJgxBMy+hG3u0gZO7LAY6EjHEFnhvX3M07
 PXGKXWlsQvyXIt1a2Tag9f1MUJeJMh9PxOxRQwrw9wIe03X1PXEiuKr0R/6dax+sFV
 xrLGPVyYHJTQQ==
Date: Sat, 27 Jul 2024 03:25:42 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZqRotoF2iDcx2MZF@google.com>
References: <20240221073249.1710026-1-jinbaoliu365@gmail.com>
 <a2bf5d3e-6727-44d7-b1a0-3b1bcc7edad1@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2bf5d3e-6727-44d7-b1a0-3b1bcc7edad1@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/26, Chao Yu wrote: > On 2024/2/21 15:32, liujinbao1
 wrote: > > From: liujinbao1 <liujinbao1@xiaomi.com> > > > > When we add "atgc"
 to the fstab table, ATGC is not immediately enabled. > > There [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sXY4B-0008G7-IS
Subject: Re: [f2fs-dev] [PATCH] f2fs: sysfs: support atgc_enabled
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
Cc: liujinbao1 <jinbaoliu365@gmail.com>, liujinbao1 <liujinbao1@xiaomi.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/26, Chao Yu wrote:
> On 2024/2/21 15:32, liujinbao1 wrote:
> > From: liujinbao1 <liujinbao1@xiaomi.com>
> > 
> > When we add "atgc" to the fstab table, ATGC is not immediately enabled.
> > There is a 7-day time threshold, and we can use "atgc_enabled" to
> > show whether ATGC is enabled.
> 
> Oh, I missed to reply on this patch, what about adding this readonly
> atgc_enabled sysfs entry into /sys/fs/f2fs/<dev>/stat/ directory?

It looks like not stat.

> 
> Thanks,
> 
> > 
> > Signed-off-by: liujinbao1 <liujinbao1@xiaomi.com>
> > ---
> >   Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
> >   fs/f2fs/sysfs.c                         | 8 ++++++++
> >   2 files changed, 14 insertions(+)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> > index 36c3cb547901..8597dfaef700 100644
> > --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> > +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> > @@ -564,6 +564,12 @@ Description:	When ATGC is on, it controls age threshold to bypass GCing young
> >   		candidates whose age is not beyond the threshold, by default it was
> >   		initialized as 604800 seconds (equals to 7 days).
> > +What:		/sys/fs/f2fs/<disk>/atgc_enabled
> > +Date:		Feb 2024
> > +Contact:	"Jinbao Liu" <liujinbao1@xiaomi.com>
> > +Description:	It represents whether ATGC is on or off. The value is 1 which
> > +               indicates that ATGC is on, and 0 indicates that it is off.
> > +
> >   What:		/sys/fs/f2fs/<disk>/gc_reclaimed_segments
> >   Date:		July 2021
> >   Contact:	"Daeho Jeong" <daehojeong@google.com>
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index 417fae96890f..0915872abd97 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -143,6 +143,12 @@ static ssize_t pending_discard_show(struct f2fs_attr *a,
> >   				&SM_I(sbi)->dcc_info->discard_cmd_cnt));
> >   }
> > +static ssize_t atgc_enabled_show(struct f2fs_attr *a,
> > +		struct f2fs_sb_info *sbi, char *buf)
> > +{
> > +	return sysfs_emit(buf, "%d\n", sbi->am.atgc_enabled ? 1 : 0);
> > +}
> > +
> >   static ssize_t gc_mode_show(struct f2fs_attr *a,
> >   		struct f2fs_sb_info *sbi, char *buf)
> >   {
> > @@ -1017,6 +1023,7 @@ F2FS_GENERAL_RO_ATTR(encoding);
> >   F2FS_GENERAL_RO_ATTR(mounted_time_sec);
> >   F2FS_GENERAL_RO_ATTR(main_blkaddr);
> >   F2FS_GENERAL_RO_ATTR(pending_discard);
> > +F2FS_GENERAL_RO_ATTR(atgc_enabled);
> >   F2FS_GENERAL_RO_ATTR(gc_mode);
> >   #ifdef CONFIG_F2FS_STAT_FS
> >   F2FS_GENERAL_RO_ATTR(moved_blocks_background);
> > @@ -1144,6 +1151,7 @@ static struct attribute *f2fs_attrs[] = {
> >   	ATTR_LIST(atgc_candidate_count),
> >   	ATTR_LIST(atgc_age_weight),
> >   	ATTR_LIST(atgc_age_threshold),
> > +	ATTR_LIST(atgc_enabled),
> >   	ATTR_LIST(seq_file_ra_mul),
> >   	ATTR_LIST(gc_segment_mode),
> >   	ATTR_LIST(gc_reclaimed_segments),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
