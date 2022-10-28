Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2FF6108AF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 05:23:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooFxd-0000Qi-Cb;
	Fri, 28 Oct 2022 03:23:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ooFxb-0000Qc-MH
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 03:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lVBbjuxjAFOZT9unWB1GY6CJWVvnQ6dsNSj6YboQTtk=; b=ABOw+in56fRhngUwFZcdH8ik+E
 UrVW2TIptkM1twh0dTzK9FTYG1RodiEctGNMCSznwn+1f+WouKpbufnqZmGH8I1FOoSw6BwZY2hH0
 IIBAcrcd0p8RLJESD05Y3v2RSyyC5tx20f76QTu52kRwep4pJvNvaYfZQFtXjCgFzLA0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lVBbjuxjAFOZT9unWB1GY6CJWVvnQ6dsNSj6YboQTtk=; b=R4zXt3r+rJKoL9fJQRhBqMOnVv
 WH68F8r7oYMPLORkEY5R5lznufbg1f0sae5DwgFOB6MkwJCi77FzI0eH4ypXIQ5i/E2+KDYXgwF0h
 t1JxSOq5/APWEYBiYsejmmVUShIwdTRaKzEtaS6yjyWJH6bky9V4+CIB6npmWeUc0kWc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooFxa-002xrG-Nw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 03:23:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 51A19B8280A;
 Fri, 28 Oct 2022 03:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90AEC433C1;
 Fri, 28 Oct 2022 03:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666927379;
 bh=4V73CUSd+nXaHDYvC206fkLxHVRkpC9uU3+rsmZJ+o0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BuZlQwaxZyGcOerqJ+DlveNRjyisJoiivS36Hk35iXhWEbuzJZrIZ928eydAWWBrF
 /u/CwgBiUHoS6jD0+PImqYGKnbkeUZFvdxdnPSGchjeN471dDPJiix5l4QujkdtFKw
 XXmFIv+imZxwZh0i3oSao+ER/0fJ/sB3HZAGeCTroUcGmaAdXarOUrX+I3fmkFek/i
 qhQnFcQnH7w5PwP+NPVz2ocmovhXFRiKSL2KqbwSAEFm4eUAqXdkYmrfsLthnVs6/g
 AbjPkOpndSz9/2Rs4FuAe8YfCuyvxwlweI/9Z5AMzHhnF291pLAaUKPViU+6UJwZnR
 6iblb0mzAPeXg==
Date: Thu, 27 Oct 2022 20:22:57 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y1tLEVYQjj2qC3I7@google.com>
References: <20221025065025.35017-1-frank.li@vivo.com>
 <20221025065025.35017-2-frank.li@vivo.com>
 <cd6d15e3-b692-d3c1-0f01-33e632f5f94c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd6d15e3-b692-d3c1-0f01-33e632f5f94c@kernel.org>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/28, Chao Yu wrote: > On 2022/10/25 14:50, Yangtao Li
 wrote: > > Added a new sysfs node called gc_urgent_idle_remaining. > > The
 user can set the trial count limit for GC urgent and > > idle mode [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooFxa-002xrG-Nw
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: introducr
 gc_urgent_idle_remaining sysfs node and mark gc_urgent_high_remaining node
 deprecated
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/28, Chao Yu wrote:
> On 2022/10/25 14:50, Yangtao Li wrote:
> > Added a new sysfs node called gc_urgent_idle_remaining.
> > The user can set the trial count limit for GC urgent and
> > idle mode with this value. If GC thread gets to the limit,
> > the mode will turn back to GC normal mode finally.
> > 
> > This method is not only applicable to gc_urgent_high,
> > but applicable to all gc modes. Also mark
> > gc_urgent_high_remaining as deprecated, so that the node
> > can be removed in the future.
> > 
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > ---
> >   Documentation/ABI/testing/sysfs-fs-f2fs |  8 ++++++++
> >   fs/f2fs/f2fs.h                          |  6 ++++--
> >   fs/f2fs/gc.c                            | 12 ++++++------
> >   fs/f2fs/super.c                         |  2 +-
> >   fs/f2fs/sysfs.c                         | 14 ++++++++++----
> >   5 files changed, 29 insertions(+), 13 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> > index 483639fb727b..859c4e53a846 100644
> > --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> > +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> > @@ -598,6 +598,14 @@ Contact:	"Daeho Jeong" <daehojeong@google.com>
> >   Description:	You can set the trial count limit for GC urgent high mode with this value.
> >   		If GC thread gets to the limit, the mode will turn back to GC normal mode.
> >   		By default, the value is zero, which means there is no limit like before.
> > +		<deprecated>
> > +
> > +What:		/sys/fs/f2fs/<disk>/gc_urgent_idle_remaining
> > +Date:		October 2022
> > +Contact:	"Yangtao Li" <frank.li@vivo.com>
> > +Description:	You can set the trial count limit for GC urgent and idle mode with this value.
> > +		If GC thread gets to the limit, the mode will turn back to GC normal mode.
> > +		By default, the value is zero, which means there is no limit like before.
> >   What:		/sys/fs/f2fs/<disk>/max_roll_forward_node_blocks
> >   Date:		January 2022
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index e6355a5683b7..2bad69cf9fd9 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1734,8 +1734,10 @@ struct f2fs_sb_info {
> >   	unsigned int cur_victim_sec;		/* current victim section num */
> >   	unsigned int gc_mode;			/* current GC state */
> >   	unsigned int next_victim_seg[2];	/* next segment in victim section */
> > -	spinlock_t gc_urgent_high_lock;
> > -	unsigned int gc_urgent_high_remaining;	/* remaining trial count for GC_URGENT_HIGH */
> > +	spinlock_t gc_urgent_idle_lock;
> > +	/* remaining trial count for GC_URGENT_* and GC_IDLE_* */
> > +	unsigned int gc_urgent_idle_remaining;
> > +	unsigned int gc_urgent_high_remaining;	/* deprecated */
> >   	/* for skip statistic */
> >   	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index e0ff99c7e3f2..0ed5b3c5922c 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -152,14 +152,14 @@ static int gc_thread_func(void *data)
> >   		/* balancing f2fs's metadata periodically */
> >   		f2fs_balance_fs_bg(sbi, true);
> >   next:
> > -		if (sbi->gc_mode == GC_URGENT_HIGH) {
> > -			spin_lock(&sbi->gc_urgent_high_lock);
> > -			if (sbi->gc_urgent_high_remaining) {
> > -				sbi->gc_urgent_high_remaining--;
> > -				if (!sbi->gc_urgent_high_remaining)
> > +		if (sbi->gc_mode != GC_NORMAL) {
> > +			spin_lock(&sbi->gc_urgent_idle_lock);
> > +			if (sbi->gc_urgent_idle_remaining) {
> > +				sbi->gc_urgent_idle_remaining--;
> > +				if (!sbi->gc_urgent_idle_remaining)
> >   					sbi->gc_mode = GC_NORMAL;
> >   			}
> > -			spin_unlock(&sbi->gc_urgent_high_lock);
> > +			spin_unlock(&sbi->gc_urgent_idle_lock);
> >   		}
> >   		sb_end_write(sbi->sb);
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 3834ead04620..f90a8c0a53ec 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -3616,7 +3616,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
> >   	sbi->seq_file_ra_mul = MIN_RA_MUL;
> >   	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
> >   	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
> > -	spin_lock_init(&sbi->gc_urgent_high_lock);
> > +	spin_lock_init(&sbi->gc_urgent_idle_lock);
> >   	atomic64_set(&sbi->current_atomic_write, 0);
> >   	sbi->dir_level = DEF_DIR_LEVEL;
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index df27afd71ef4..2b1c653b37cf 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -531,10 +531,14 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
> >   		return count;
> >   	}
> > -	if (!strcmp(a->attr.name, "gc_urgent_high_remaining")) {
> > -		spin_lock(&sbi->gc_urgent_high_lock);
> > -		sbi->gc_urgent_high_remaining = t;
> > -		spin_unlock(&sbi->gc_urgent_high_lock);
> > +	/* deprecated */
> > +	if (!strcmp(a->attr.name, "gc_urgent_high_remaining"))
> > +		return -EINVAL;
> 
> How about those users who has already used these interface... it breaks
> the usage.
> 
> It needs to keep old interface and tag as deprecated, and recommend user
> to use new interface you introduced.

I feel that this is not a super critical node, so how about just removing it?

> 
> e.g.:
> 
> What:           /sys/fs/f2fs/<disk>/features
> Date:           July 2017
> Contact:        "Jaegeuk Kim" <jaegeuk@kernel.org>
> Description:    <deprecated: should use /sys/fs/f2fs/<disk>/feature_list/
>                 Shows all enabled features in current device.
>                 Supported features:
>                 encryption, blkzoned, extra_attr, projquota, inode_checksum,
>                 flexible_inline_xattr, quota_ino, inode_crtime, lost_found,
>                 verity, sb_checksum, casefold, readonly, compression, pin_file.
> 
> Thanks,
> 
> > +
> > +	if (!strcmp(a->attr.name, "gc_urgent_idle_remaining")) {
> > +		spin_lock(&sbi->gc_urgent_idle_lock);
> > +		sbi->gc_urgent_idle_remaining = t;
> > +		spin_unlock(&sbi->gc_urgent_idle_lock);
> >   		return count;
> >   	}
> > @@ -826,6 +830,7 @@ F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
> >   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
> >   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
> >   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_high_remaining, gc_urgent_high_remaining);
> > +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_idle_remaining, gc_urgent_idle_remaining);
> >   F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
> >   F2FS_GENERAL_RO_ATTR(dirty_segments);
> >   F2FS_GENERAL_RO_ATTR(free_segments);
> > @@ -953,6 +958,7 @@ static struct attribute *f2fs_attrs[] = {
> >   	ATTR_LIST(data_io_flag),
> >   	ATTR_LIST(node_io_flag),
> >   	ATTR_LIST(gc_urgent_high_remaining),
> > +	ATTR_LIST(gc_urgent_idle_remaining),
> >   	ATTR_LIST(ckpt_thread_ioprio),
> >   	ATTR_LIST(dirty_segments),
> >   	ATTR_LIST(free_segments),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
