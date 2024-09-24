Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A36AF983B2B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Sep 2024 04:25:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ssvFF-0002yf-AK;
	Tue, 24 Sep 2024 02:25:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ssvFD-0002yY-PB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 02:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ktuk2F7CT6BZdm8TvEIuOH7f7WuU1xkZvLjBsaWSI9Q=; b=lEaiKb14P4TLtvcDNR5czsxuSG
 gOWoAl3B3PlwD7jUjmrtN9AnM7KNKgr/OjxD/uMtPr+uP1Rf//AAMoEqJy3H4h30dMliuY82psTRj
 PZ2oTomTrnZ3dW+j50ng0LAeK7/cMvG1vDM6daV2noP9q+zNGz9KMVcT4aJ6l5s9KcrM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ktuk2F7CT6BZdm8TvEIuOH7f7WuU1xkZvLjBsaWSI9Q=; b=AEVvUh73VioFuXldlt92XdsfRy
 6MejZQd370NT4/zKXkAvuZ6GdnA1/PUF50M1iC5iCQQjbM7ujX0SCLrspCzDtzuzi8bMXehut2haq
 YP+obapawzebw8GprlTlLrdOMGU+pP2CS75xUjWIMvwstVd+Y70PPYD1RzL/hwRvE4XY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ssvFD-0004Y5-ES for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 02:25:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AE93EA429AE;
 Tue, 24 Sep 2024 02:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21239C4CEC4;
 Tue, 24 Sep 2024 02:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727144733;
 bh=j05pNEWsqu7/7Imhpv6SR6Py3R78sTJY6dwEU8/YxAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GZL94EHcBrI2d7HxaXz6oPKCzHsYZw8foRvjlqB1xCHs8RfeI1JZyIJKUJ4ol51rY
 I4RJuVusob8g6+BUARKTY+rTFnLcCq1AI3gRD05/tODcQMVKcVvVoMMudC8evEOHq3
 dC1iomaVKFdPZy8LHClTPwMfiHMrRRTOi2vzimbhR4+rM5KhV7ylvBzXfl7BY3CYr7
 3t7RC+/GPEUF21Oo8mJkPi67FWLPuMRbkhxeWm8H1NK9IWUSoDnBL3AlbIMHvnBVPo
 t401gBm091Qj3v41+PIXS9UUZQELtB6YcobKdJfSysh7ElSLlS24C4ApcDBZICWwH1
 JlNLn+Uc/dFlw==
Date: Tue, 24 Sep 2024 02:25:31 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <ZvIjG8NQlwSI1GLX@google.com>
References: <20240923155356.2313669-1-daeho43@gmail.com>
 <1fc86d4e-ce1e-45f5-a2d4-14d9e61b7503@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1fc86d4e-ce1e-45f5-a2d4-14d9e61b7503@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/24, Chao Yu wrote: > On 2024/9/23 23:53, Daeho Jeong
 wrote: > > From: Daeho Jeong <daehojeong@google.com> > > > > F2FS should
 understand how the device aliasing file works and support > > deleti [...]
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ssvFD-0004Y5-ES
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce device aliasing file
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/24, Chao Yu wrote:
> On 2024/9/23 23:53, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> > 
> > F2FS should understand how the device aliasing file works and support
> > deleting the file after use. A device aliasing file can be created by
> > mkfs.f2fs tool and it can map the whole device with an extrent, not
> > using node blocks. The file space should be pinned and normally used for
> > read-only usages.
> > 
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> > v2: changed the position of f2fs_destroy_extent_tree() only for device
> >      aliasing files
> > ---
> >   fs/f2fs/data.c         |  5 +++++
> >   fs/f2fs/extent_cache.c | 10 ++++++++++
> >   fs/f2fs/f2fs.h         |  5 +++++
> >   fs/f2fs/file.c         | 36 ++++++++++++++++++++++++++++++++----
> >   fs/f2fs/inode.c        | 12 +++++++++++-
> >   fs/f2fs/sysfs.c        |  2 ++
> >   6 files changed, 65 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index b94cf6eea2f9..385b46e62ede 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -3441,6 +3441,11 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
> >   	if (!f2fs_lookup_read_extent_cache_block(inode, index,
> >   						 &dn.data_blkaddr)) {
> > +		if (IS_DEVICE_ALIASING(inode)) {
> > +			err = -ENODATA;
> > +			goto out;
> > +		}
> > +
> >   		if (locked) {
> >   			err = f2fs_reserve_block(&dn, index);
> >   			goto out;
> > diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> > index 62ac440d9416..0c8a705faa8b 100644
> > --- a/fs/f2fs/extent_cache.c
> > +++ b/fs/f2fs/extent_cache.c
> > @@ -401,6 +401,11 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct page *ipage)
> >   	if (atomic_read(&et->node_cnt) || !ei.len)
> >   		goto skip;
> > +	if (IS_DEVICE_ALIASING(inode)) {
> > +		et->largest = ei;
> > +		goto skip;
> > +	}
> 
> device alias feature replies on extent cache mount option, right? do
> we need to check noextent_cache option during parse_options()?

Oh, if we hit !__may_extent_tree() above, we'll break the layout. I now feel
I need to stop rushing this in this merge window. Daeho, could you please
check these corner cases?

 385         if (!__may_extent_tree(inode, EX_READ)) {
 386                 /* drop largest read extent */
 387                 if (i_ext->len) {
 388                         f2fs_wait_on_page_writeback(ipage, NODE, true, true);
 389                         i_ext->len = 0;
 390                         set_page_dirty(ipage);
 391                 }
 392                 set_inode_flag(inode, FI_NO_EXTENT);
 393                 return;
 394         }


> 
> Thanks,
> 
> > +
> >   	en = __attach_extent_node(sbi, et, &ei, NULL,
> >   				&et->root.rb_root.rb_node, true);
> >   	if (en) {
> > @@ -463,6 +468,11 @@ static bool __lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
> >   		goto out;
> >   	}
> > +	if (IS_DEVICE_ALIASING(inode)) {
> > +		ret = false;
> > +		goto out;
> > +	}
> > +
> >   	en = __lookup_extent_node(&et->root, et->cached_en, pgofs);
> >   	if (!en)
> >   		goto out;
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 33f5449dc22d..b6ba22a1da47 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -213,6 +213,7 @@ struct f2fs_mount_info {
> >   #define F2FS_FEATURE_CASEFOLD			0x00001000
> >   #define F2FS_FEATURE_COMPRESSION		0x00002000
> >   #define F2FS_FEATURE_RO				0x00004000
> > +#define F2FS_FEATURE_DEVICE_ALIAS		0x00008000
> >   #define __F2FS_HAS_FEATURE(raw_super, mask)				\
> >   	((raw_super->feature & cpu_to_le32(mask)) != 0)
> > @@ -3046,6 +3047,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
> >   #define F2FS_DIRSYNC_FL			0x00010000 /* dirsync behaviour (directories only) */
> >   #define F2FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
> >   #define F2FS_CASEFOLD_FL		0x40000000 /* Casefolded file */
> > +#define F2FS_DEVICE_ALIAS_FL		0x80000000 /* File for aliasing a device */
> >   #define F2FS_QUOTA_DEFAULT_FL		(F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL)
> > @@ -3061,6 +3063,8 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
> >   /* Flags that are appropriate for non-directories/regular files. */
> >   #define F2FS_OTHER_FLMASK	(F2FS_NODUMP_FL | F2FS_NOATIME_FL)
> > +#define IS_DEVICE_ALIASING(inode)	(F2FS_I(inode)->i_flags & F2FS_DEVICE_ALIAS_FL)
> > +
> >   static inline __u32 f2fs_mask_flags(umode_t mode, __u32 flags)
> >   {
> >   	if (S_ISDIR(mode))
> > @@ -4510,6 +4514,7 @@ F2FS_FEATURE_FUNCS(sb_chksum, SB_CHKSUM);
> >   F2FS_FEATURE_FUNCS(casefold, CASEFOLD);
> >   F2FS_FEATURE_FUNCS(compression, COMPRESSION);
> >   F2FS_FEATURE_FUNCS(readonly, RO);
> > +F2FS_FEATURE_FUNCS(device_alias, DEVICE_ALIAS);
> >   #ifdef CONFIG_BLK_DEV_ZONED
> >   static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 99903eafa7fe..f2d2d84d025b 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -725,6 +725,11 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
> >   	trace_f2fs_truncate_blocks_enter(inode, from);
> > +	if (IS_DEVICE_ALIASING(inode) && from) {
> > +		err = -EINVAL;
> > +		goto out_err;
> > +	}
> > +
> >   	free_from = (pgoff_t)F2FS_BLK_ALIGN(from);
> >   	if (free_from >= max_file_blocks(inode))
> > @@ -739,6 +744,21 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
> >   		goto out;
> >   	}
> > +	if (IS_DEVICE_ALIASING(inode)) {
> > +		struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
> > +		struct extent_info ei = et->largest;
> > +		unsigned int i;
> > +
> > +		for (i = 0; i < ei.len; i++)
> > +			f2fs_invalidate_blocks(sbi, ei.blk + i);
> > +
> > +		dec_valid_block_count(sbi, inode, ei.len);
> > +		f2fs_update_time(sbi, REQ_TIME);
> > +
> > +		f2fs_put_page(ipage, 1);
> > +		goto out;
> > +	}
> > +
> >   	if (f2fs_has_inline_data(inode)) {
> >   		f2fs_truncate_inline_inode(inode, ipage, from);
> >   		f2fs_put_page(ipage, 1);
> > @@ -774,7 +794,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
> >   	/* lastly zero out the first data page */
> >   	if (!err)
> >   		err = truncate_partial_data_page(inode, from, truncate_page);
> > -
> > +out_err:
> >   	trace_f2fs_truncate_blocks_exit(inode, err);
> >   	return err;
> >   }
> > @@ -992,7 +1012,8 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
> >   		return -EPERM;
> >   	if ((attr->ia_valid & ATTR_SIZE)) {
> > -		if (!f2fs_is_compress_backend_ready(inode))
> > +		if (!f2fs_is_compress_backend_ready(inode) ||
> > +				IS_DEVICE_ALIASING(inode))
> >   			return -EOPNOTSUPP;
> >   		if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED) &&
> >   			!IS_ALIGNED(attr->ia_size,
> > @@ -1860,7 +1881,7 @@ static long f2fs_fallocate(struct file *file, int mode,
> >   		return -EIO;
> >   	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(inode)))
> >   		return -ENOSPC;
> > -	if (!f2fs_is_compress_backend_ready(inode))
> > +	if (!f2fs_is_compress_backend_ready(inode) || IS_DEVICE_ALIASING(inode))
> >   		return -EOPNOTSUPP;
> >   	/* f2fs only support ->fallocate for regular file */
> > @@ -3296,6 +3317,9 @@ int f2fs_pin_file_control(struct inode *inode, bool inc)
> >   	struct f2fs_inode_info *fi = F2FS_I(inode);
> >   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> > +	if (IS_DEVICE_ALIASING(inode))
> > +		return -EINVAL;
> > +
> >   	if (fi->i_gc_failures >= sbi->gc_pin_file_threshold) {
> >   		f2fs_warn(sbi, "%s: Enable GC = ino %lx after %x GC trials",
> >   			  __func__, inode->i_ino, fi->i_gc_failures);
> > @@ -3326,6 +3350,9 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
> >   	if (f2fs_readonly(sbi->sb))
> >   		return -EROFS;
> > +	if (!pin && IS_DEVICE_ALIASING(inode))
> > +		return -EOPNOTSUPP;
> > +
> >   	ret = mnt_want_write_file(filp);
> >   	if (ret)
> >   		return ret;
> > @@ -4764,7 +4791,8 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
> >   	else
> >   		return 0;
> > -	map.m_may_create = true;
> > +	if (!IS_DEVICE_ALIASING(inode))
> > +		map.m_may_create = true;
> >   	if (dio) {
> >   		map.m_seg_type = f2fs_rw_hint_to_seg_type(sbi,
> >   						inode->i_write_hint);
> > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > index 1ed86df343a5..25f66a0ed831 100644
> > --- a/fs/f2fs/inode.c
> > +++ b/fs/f2fs/inode.c
> > @@ -372,6 +372,12 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
> >   		return false;
> >   	}
> > +	if ((fi->i_flags & F2FS_DEVICE_ALIAS_FL) && !f2fs_sb_has_device_alias(sbi)) {
> > +		f2fs_warn(sbi, "%s: inode (ino=%lx) has device alias flag, but the feature is off",
> > +			  __func__, inode->i_ino);
> > +		return false;
> > +	}
> > +
> >   	return true;
> >   }
> > @@ -823,7 +829,8 @@ void f2fs_evict_inode(struct inode *inode)
> >   	f2fs_bug_on(sbi, get_dirty_pages(inode));
> >   	f2fs_remove_dirty_inode(inode);
> > -	f2fs_destroy_extent_tree(inode);
> > +	if (!IS_DEVICE_ALIASING(inode))
> > +		f2fs_destroy_extent_tree(inode);
> >   	if (inode->i_nlink || is_bad_inode(inode))
> >   		goto no_delete;
> > @@ -879,6 +886,9 @@ void f2fs_evict_inode(struct inode *inode)
> >   		goto retry;
> >   	}
> > +	if (IS_DEVICE_ALIASING(inode))
> > +		f2fs_destroy_extent_tree(inode);
> > +
> >   	if (err) {
> >   		f2fs_update_inode_page(inode);
> >   		if (dquot_initialize_needed(inode))
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index c56e8c873935..e51304bc65ea 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -1313,6 +1313,7 @@ F2FS_SB_FEATURE_RO_ATTR(sb_checksum, SB_CHKSUM);
> >   F2FS_SB_FEATURE_RO_ATTR(casefold, CASEFOLD);
> >   F2FS_SB_FEATURE_RO_ATTR(compression, COMPRESSION);
> >   F2FS_SB_FEATURE_RO_ATTR(readonly, RO);
> > +F2FS_SB_FEATURE_RO_ATTR(device_alias, DEVICE_ALIAS);
> >   static struct attribute *f2fs_sb_feat_attrs[] = {
> >   	ATTR_LIST(sb_encryption),
> > @@ -1329,6 +1330,7 @@ static struct attribute *f2fs_sb_feat_attrs[] = {
> >   	ATTR_LIST(sb_casefold),
> >   	ATTR_LIST(sb_compression),
> >   	ATTR_LIST(sb_readonly),
> > +	ATTR_LIST(sb_device_alias),
> >   	NULL,
> >   };
> >   ATTRIBUTE_GROUPS(f2fs_sb_feat);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
