Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C68A10D69
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jan 2025 18:18:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tXkYx-0001yN-91;
	Tue, 14 Jan 2025 17:18:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tXkYw-0001yG-0h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jan 2025 17:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eDM+OJlD4w2185gbB2Dv4XHFjsyuxEOyIOEka/M58QQ=; b=lQB5vp6qVXuAfjQmZibQ556Cny
 iw7Af18sA9cNJ5/2Rh50bA3jgC302z5MDDeetKzgqHCGjv0ZAaFHmxGlWh+rlyVBFnjnBGQuVQEqY
 GjKppdzbFcXPXaEH6uZUodXAjUwnXlsSpDliZp0oI7ZuvW5b0GELnRzqhrTiUoXkfTFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eDM+OJlD4w2185gbB2Dv4XHFjsyuxEOyIOEka/M58QQ=; b=NFCp6wnu8TA88T3o8+8JIYW/Wj
 jvU+b/CfjI/kfTGOB6yuY8PormRZTZK4r0+rZ3XkVTB5H58e0ATiG0JjrdmOhf9IvxzG+69ZPKFwL
 qQwFscaSppqDRzUArzbBtVY5NPAA7qV7nS22GD7ifyqhmV2ia4elFxxd8mgXtZcVtqdE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXkYu-0002Xc-Kg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jan 2025 17:18:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6C01A5C595F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jan 2025 17:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97D2C4CEDD;
 Tue, 14 Jan 2025 17:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736875113;
 bh=SCQlxTugKFJRDrP5F7D/Itm+T5g05r3CM7PFczo9I7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qhHNvsKnUJ2qhc4zCfM0aRKB+6cXs9psVm7GCzTcNcYEnnu6hHKQvYK1cTJeEZRXX
 4GuGFYPM+oRlIvUguA9LRErZlgYFPzy5l6KeXJKQjg1vjdO7a5m1FsK2QbeqlWSCLL
 ZMZgLyGfmhV9KSVelCw0VbC2WJOUxYqtxdhB2kKxQPgDAHq0ZuEwLzgzfKnwelKPyx
 6LjlkgsVqrNu8B8Qn1+6VWmm7X+3TlhtsQjYl+GJvADLBkmldAAFkOVQWi0QPFzRYa
 75E9xbnap6ZOWmAHZt7jG3MfQiyPuXtxT2hkkeBiKOzLuVc+K9hl4+x75Jf+JMCXWZ
 JIM4N+BraxVWQ==
Date: Tue, 14 Jan 2025 17:18:32 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <Z4acaJzWmtEZQ-UH@google.com>
References: <20250113183933.1268282-1-jaegeuk@kernel.org>
 <20250113183933.1268282-2-jaegeuk@kernel.org>
 <26a1b409-11a1-48d8-9c2e-4213218baf15@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26a1b409-11a1-48d8-9c2e-4213218baf15@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/14, Chao Yu wrote: > On 1/14/25 02:39, Jaegeuk Kim via
 Linux-f2fs-devel wrote: > > 1. ioctl(fd1, F2FS_IOC_DONATE_RANGE, {0,3});
 > > 2. ioctl(fd2, F2FS_IOC_DONATE_RANGE, {1,2}); > > 3. ioctl(fd3, [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tXkYu-0002Xc-Kg
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add a sysfs entry to request
 donate file-backed pages
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/14, Chao Yu wrote:
> On 1/14/25 02:39, Jaegeuk Kim via Linux-f2fs-devel wrote:
> > 1. ioctl(fd1, F2FS_IOC_DONATE_RANGE, {0,3});
> > 2. ioctl(fd2, F2FS_IOC_DONATE_RANGE, {1,2});
> > 3. ioctl(fd3, F2FS_IOC_DONATE_RANGE, {3,1});
> > 4. echo 3 > /sys/fs/f2fs/blk/donate_caches
> > 
> > will reclaim 3 page cache ranges, registered by #1, #2, and #3.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   Documentation/ABI/testing/sysfs-fs-f2fs |  7 +++++++
> >   fs/f2fs/f2fs.h                          |  4 ++++
> >   fs/f2fs/shrinker.c                      | 27 +++++++++++++++++++++++++
> >   fs/f2fs/sysfs.c                         |  8 ++++++++
> >   4 files changed, 46 insertions(+)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> > index 3e1630c70d8a..6f9d8b8889fd 100644
> > --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> > +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> > @@ -828,3 +828,10 @@ Date:		November 2024
> >   Contact:	"Chao Yu" <chao@kernel.org>
> >   Description:	It controls max read extent count for per-inode, the value of threshold
> >   		is 10240 by default.
> > +
> > +What:		/sys/fs/f2fs/<disk>/donate_caches
> > +Date:		December 2024
> > +Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
> > +Description:	It reclaims the certian file-backed pages registered by
> > +		ioctl(F2FS_IOC_DONATE_RANGE).
> > +		For example, writing N tries to drop N address spaces in LRU.
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 7ce3e3eab17a..6c434ae94cb1 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1635,6 +1635,9 @@ struct f2fs_sb_info {
> >   	unsigned int warm_data_age_threshold;
> >   	unsigned int last_age_weight;
> > +	/* control donate caches */
> > +	unsigned int donate_caches;
> > +
> >   	/* basic filesystem units */
> >   	unsigned int log_sectors_per_block;	/* log2 sectors per block */
> >   	unsigned int log_blocksize;		/* log2 block size */
> > @@ -4256,6 +4259,7 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
> >   			struct shrink_control *sc);
> >   unsigned long f2fs_shrink_scan(struct shrinker *shrink,
> >   			struct shrink_control *sc);
> > +void f2fs_donate_caches(struct f2fs_sb_info *sbi);
> >   void f2fs_join_shrinker(struct f2fs_sb_info *sbi);
> >   void f2fs_leave_shrinker(struct f2fs_sb_info *sbi);
> > diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> > index 83d6fb97dcae..a3e2063392a7 100644
> > --- a/fs/f2fs/shrinker.c
> > +++ b/fs/f2fs/shrinker.c
> > @@ -130,6 +130,33 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
> >   	return freed;
> >   }
> > +void f2fs_donate_caches(struct f2fs_sb_info *sbi)
> > +{
> > +	struct inode *inode = NULL;
> > +	struct f2fs_inode_info *fi;
> > +	int nfiles = sbi->donate_caches;
> > +next:
> > +	spin_lock(&sbi->inode_lock[DONATE_INODE]);
> > +	if (list_empty(&sbi->inode_list[DONATE_INODE]) || !nfiles) {
> > +		spin_unlock(&sbi->inode_lock[DONATE_INODE]);
> > +		return;
> > +	}
> > +
> > +	fi = list_first_entry(&sbi->inode_list[DONATE_INODE],
> > +				struct f2fs_inode_info, gdonate_list);
> > +	list_move_tail(&fi->gdonate_list, &sbi->inode_list[DONATE_INODE]);
> 
> Not needed to drop it from the global list, right?

Yea, there're two paths to drop: 1) waiting for evict_inode, 2) setting a new
range having len=0.

> 
> Thanks,
> 
> > +	inode = igrab(&fi->vfs_inode);
> > +	spin_unlock(&sbi->inode_lock[DONATE_INODE]);
> > +
> > +	if (inode) {
> > +		invalidate_inode_pages2_range(inode->i_mapping,
> > +			fi->donate_start, fi->donate_end);
> > +		iput(inode);
> > +	}
> > +	if (nfiles--)
> > +		goto next;
> > +}
> > +
> >   void f2fs_join_shrinker(struct f2fs_sb_info *sbi)
> >   {
> >   	spin_lock(&f2fs_list_lock);
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index 6b99dc49f776..7570580ec3c0 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -811,6 +811,12 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
> >   		return count;
> >   	}
> > +	if (!strcmp(a->attr.name, "donate_caches")) {
> > +		sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
> > +		f2fs_donate_caches(sbi);
> > +		return count;
> > +	}
> > +
> >   	*ui = (unsigned int)t;
> >   	return count;
> > @@ -1030,6 +1036,7 @@ F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
> >   F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
> >   F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
> >   F2FS_SBI_GENERAL_RW_ATTR(dir_level);
> > +F2FS_SBI_GENERAL_RW_ATTR(donate_caches);
> >   #ifdef CONFIG_F2FS_IOSTAT
> >   F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
> >   F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
> > @@ -1178,6 +1185,7 @@ static struct attribute *f2fs_attrs[] = {
> >   	ATTR_LIST(migration_granularity),
> >   	ATTR_LIST(migration_window_granularity),
> >   	ATTR_LIST(dir_level),
> > +	ATTR_LIST(donate_caches),
> >   	ATTR_LIST(ram_thresh),
> >   	ATTR_LIST(ra_nid_pages),
> >   	ATTR_LIST(dirty_nats_ratio),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
