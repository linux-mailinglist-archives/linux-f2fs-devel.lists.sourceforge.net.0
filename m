Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B3464F68D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Dec 2022 01:50:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6LPO-0008Vv-7r;
	Sat, 17 Dec 2022 00:50:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p6LPN-0008Vp-Fj
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 00:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=onuR7wlwAiCxYhi2lJvZKoM5mp9cmUMmh05VwasN6TQ=; b=INlI02MGLEphE2z+kpAVrp3LCn
 w3M4QFsCeaXsCLg/Zo5aIwP4BE+JlJDToMHtxyND8a9HCARtBCDQFXhTsuaIVzL4J3Jt6vAlfAIwa
 mVDLrMKhI1+RhsYUjC9ADZ5381/CPqtAykwzheeG+t3c+5VvdEjEBdqhbiMVDT3ceOSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=onuR7wlwAiCxYhi2lJvZKoM5mp9cmUMmh05VwasN6TQ=; b=khkPcTvSz8LTL9P5YkC+hksir/
 pTMgnepEyjmbP6HegW94tbfWrM37U82rYuPhedMhUShkrEYJede59CE6fGi1zmmwhKy9kH2JHa34O
 eCyW4EbSlfCI4tqvSbjHagcOnE6kbkQirfJbQhXKw1zkJYrDREGs1qth+SpU7AWkthL4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p6LPL-0000wG-MM for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 00:50:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C2C7B81E2C;
 Sat, 17 Dec 2022 00:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52E5C433EF;
 Sat, 17 Dec 2022 00:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671238224;
 bh=pbWjGvDAPZkxcIU2Hd4rHx3BTv6+64sDTYrNVBeV9jM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YbO8+G0P/UNS1oc69zwvSh4EXphsQsMrZ1TMR+gVtxeEwxq7CMV5+n6BEIiGNNI3+
 SXYXQrTBC3uOaLeBn1lX6tmcnkyFgEbHt016OQGNYrQ0tUPAow6mew9z9LDJxedKLz
 9S8QmGBBFiTTsqGbyOoWDnZ+pzW12oqxIclWeSNGZIABjOiv6yPN7X/FQWlVei/WoO
 ZPWav1AICzi3dRHAiBBeCufyXoP4qBcgrosdCOQSr4rfDoaThtcHTWT1uBgTZQ66Ip
 P5AMKPB2UXPjtD+vlfvyd+iY4fenYDa2FUJfOk4H98J6+Xw9lVhUk0JrPeHHs3OcX8
 4Rk6k2VjaFnnQ==
Date: Fri, 16 Dec 2022 16:50:22 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: qixiaoyu <qxy65535@gmail.com>
Message-ID: <Y50STj+VwgLs6AMi@google.com>
References: <20221205185433.3479699-1-jaegeuk@kernel.org>
 <20221205185433.3479699-6-jaegeuk@kernel.org>
 <20221216121313.GA1903@mi-HP-ProDesk-680-G4-MT>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221216121313.GA1903@mi-HP-ProDesk-680-G4-MT>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/16, qixiaoyu wrote: > On Mon, Dec 05,
 2022 at 10:54:33AM
 -0800, Jaegeuk Kim wrote: > > Hi Jaegeuk, > > Thank you for your patchset!
 > > > > > static bool __lookup_extent_tree(struct inode *inode [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p6LPL-0000wG-MM
Subject: Re: [f2fs-dev] [PATCH 6/6] f2fs: add block_age-based extent cache
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
Cc: xiongping1 <xiongping1@xiaomi.com>, qixiaoyu1 <qixiaoyu1@xiaomi.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/16, qixiaoyu wrote:
> On Mon, Dec 05, 2022 at 10:54:33AM -0800, Jaegeuk Kim wrote:
> 
> Hi Jaegeuk,
> 
> Thank you for your patchset!
> 
> >  
> >  static bool __lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
> > @@ -544,6 +585,8 @@ static bool __lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
> >  
> >  	if (type == EX_READ)
> >  		trace_f2fs_lookup_read_extent_tree_end(inode, pgofs, ei);
> > +	else if (type == EX_BLOCK_AGE)
> > +		trace_f2fs_lookup_age_extent_tree_end(inode, pgofs, ei);
> >  	return ret;
> >  }
> >  
> 
> If (!en), ei->age may be uninitialized, which makes the trace output confused.
> 
> > +/* This returns a new age and allocated blocks in ei */
> > +static int __get_new_block_age(struct inode *inode, struct extent_info *ei)
> > +{
> > +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> > +	loff_t f_size = i_size_read(inode);
> > +	unsigned long long cur_blocks =
> > +				atomic64_read(&sbi->allocated_data_blocks);
> > +
> > +	/*
> > +	 * When I/O is not aligned to a PAGE_SIZE, update will happen to the last
> > +	 * file block even in seq write. So don't record age for newly last file
> > +	 * block here.
> > +	 */
> > +	if ((f_size >> PAGE_SHIFT) == ei->fofs && f_size & (PAGE_SIZE - 1) &&
> > +			ei->blk == NEW_ADDR)
> > +		return -EINVAL;
> > +
> > +	if (__lookup_extent_tree(inode, ei->fofs, ei, EX_BLOCK_AGE)) {
> > +		unsigned long long cur_age;
> > +
> > +		if (cur_blocks >= ei->last_blocks)
> > +			cur_age = cur_blocks - ei->last_blocks;
> > +		else
> > +			/* allocated_data_blocks overflow */
> > +			cur_age = ULLONG_MAX - ei->last_blocks + cur_blocks;
> > +
> > +		if (ei->age)
> > +			ei->age = __calculate_block_age(cur_age, ei->age);
> > +		else
> > +			ei->age = cur_age;
> > +		ei->last_blocks = cur_blocks;
> > +		WARN_ON(ei->age > cur_blocks);
> > +		return 0;
> > +	}
> > +
> > +	f2fs_bug_on(sbi, ei->blk == NULL_ADDR);
> > +
> > +	/* the data block was allocated for the first time */
> > +	if (ei->blk == NEW_ADDR)
> > +		goto out;
> > +
> > +	if (__is_valid_data_blkaddr(ei->blk) &&
> > +			!f2fs_is_valid_blkaddr(sbi, ei->blk, DATA_GENERIC_ENHANCE)) {
> > +		f2fs_bug_on(sbi, 1);
> > +		return -EINVAL;
> > +	}
> > +out:
> > +	/*
> > +	 * init block age with zero, this can happen when the block age extent
> > +	 * was reclaimed due to memory constraint or system reboot
> > +	 */
> > +	ei->age = 0;
> > +	ei->last_blocks = cur_blocks;
> > +	return 0;
> > +}
> > +
> >  static void __update_extent_cache(struct dnode_of_data *dn, enum extent_type type)
> >  {
> >  	struct extent_info ei;
> > @@ -823,6 +951,10 @@ static void __update_extent_cache(struct dnode_of_data *dn, enum extent_type typ
> >  			ei.blk = NULL_ADDR;
> >  		else
> >  			ei.blk = dn->data_blkaddr;
> > +	} else if (type == EX_BLOCK_AGE) {
> > +		ei.blk = dn->data_blkaddr;
> > +		if (__get_new_block_age(dn->inode, &ei))
> > +			return;
> >  	}
> >  	__update_extent_tree_range(dn->inode, &ei, type);
> >  }
> 
> Here, the whole extent will be updated to the same new age in __get_new_block_age
> and __update_extent_tree_range.
> 
> For example, if we create a new file with 10 blocks and then update fofs=3, we
> will get:
>   fofs: 0, len: 10, age: 1000
> But in our design, we expect to split the large age extent cache to record the
> updated block:
>   fofs: 0, len: 3, age: 0
>   fofs: 3, len: 1, age: 1000
>   fofs: 4, len: 6, age: 0
> 
> Some blocks in the file can be updated more frequently than others and we want
> distinguish them by the block age extent cache, currently the code breaks it.

Could you please check this patch series?

https://lore.kernel.org/linux-f2fs-devel/20221217004659.2092427-1-jaegeuk@kernel.org/T/#t

> 
> Moreover, in the current code, if we update more than one block of the file at
> once, the age of all extent will soon be close to 0, which is not expected.
> 
> f2fs_lookup_age_extent_tree_end: dev = (254,7), ino = 34547, pgofs = 2, age_ext_info(fofs: 0, len: 325, age: 172156, blocks: 861203)
> f2fs_update_age_extent_tree_range: dev = (254,7), ino = 34547, pgofs = 0, len = 325, age = 51647, blocks = 861204
> f2fs_lookup_age_extent_tree_end: dev = (254,7), ino = 34547, pgofs = 4, age_ext_info(fofs: 0, len: 325, age: 51647, blocks: 861204)
> f2fs_update_age_extent_tree_range: dev = (254,7), ino = 34547, pgofs = 0, len = 325, age = 15494, blocks = 861205
> f2fs_lookup_age_extent_tree_end: dev = (254,7), ino = 34547, pgofs = 6, age_ext_info(fofs: 0, len: 325, age: 15494, blocks: 861205)
> f2fs_update_age_extent_tree_range: dev = (254,7), ino = 34547, pgofs = 0, len = 325, age = 4648, blocks = 861206
> f2fs_lookup_age_extent_tree_end: dev = (254,7), ino = 34547, pgofs = 8, age_ext_info(fofs: 0, len: 325, age: 4648, blocks: 861206)
> f2fs_update_age_extent_tree_range: dev = (254,7), ino = 34547, pgofs = 0, len = 325, age = 1395, blocks = 861207
> 
> > @@ -940,6 +1072,43 @@ unsigned int f2fs_shrink_read_extent_tree(struct f2fs_sb_info *sbi, int nr_shrin
> >  	return __shrink_extent_tree(sbi, nr_shrink, EX_READ);
> >  }
> >  
> > +/* block age extent cache operations */
> > +bool f2fs_lookup_age_extent_cache(struct inode *inode, pgoff_t pgofs,
> > +				struct extent_info *ei)
> > +{
> > +	if (!__may_extent_tree(inode, EX_BLOCK_AGE))
> > +		return false;
> > +
> > +	return __lookup_extent_tree(inode, pgofs, ei, EX_BLOCK_AGE);
> > +}
> > +
> > +void f2fs_update_age_extent_cache(struct dnode_of_data *dn)
> > +{
> > +	return __update_extent_cache(dn, EX_BLOCK_AGE);
> > +}
> > +
> > +void f2fs_update_age_extent_cache_range(struct dnode_of_data *dn,
> > +				pgoff_t fofs, unsigned int len)
> > +{
> > +	struct extent_info ei = {
> > +		.fofs = fofs,
> > +		.len = len,
> > +	};
> > +
> > +	if (!__may_extent_tree(dn->inode, EX_BLOCK_AGE))
> > +		return;
> > +
> > +	__update_extent_tree_range(dn->inode, &ei, EX_BLOCK_AGE);
> > +}
> > +
> > +unsigned int f2fs_shrink_age_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink)
> > +{
> > +	if (!test_opt(sbi, AGE_EXTENT_CACHE))
> > +		return 0;
> > +
> > +	return __shrink_extent_tree(sbi, nr_shrink, EX_BLOCK_AGE);
> > +}
> > +
> >  static unsigned int __destroy_extent_node(struct inode *inode,
> >  					enum extent_type type)
> >  {
> > @@ -960,6 +1129,7 @@ static unsigned int __destroy_extent_node(struct inode *inode,
> >  void f2fs_destroy_extent_node(struct inode *inode)
> >  {
> >  	__destroy_extent_node(inode, EX_READ);
> > +	__destroy_extent_node(inode, EX_BLOCK_AGE);
> >  }
> >  
> >  static void __drop_extent_tree(struct inode *inode, enum extent_type type)
> > @@ -988,6 +1158,7 @@ static void __drop_extent_tree(struct inode *inode, enum extent_type type)
> >  void f2fs_drop_extent_tree(struct inode *inode)
> >  {
> >  	__drop_extent_tree(inode, EX_READ);
> > +	__drop_extent_tree(inode, EX_BLOCK_AGE);
> >  }
> >  
> >  static void __destroy_extent_tree(struct inode *inode, enum extent_type type)
> > @@ -1028,6 +1199,7 @@ static void __destroy_extent_tree(struct inode *inode, enum extent_type type)
> >  void f2fs_destroy_extent_tree(struct inode *inode)
> >  {
> >  	__destroy_extent_tree(inode, EX_READ);
> > +	__destroy_extent_tree(inode, EX_BLOCK_AGE);
> >  }
> >  
> >  static void __init_extent_tree_info(struct extent_tree_info *eti)
> > @@ -1045,6 +1217,12 @@ static void __init_extent_tree_info(struct extent_tree_info *eti)
> >  void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi)
> >  {
> >  	__init_extent_tree_info(&sbi->extent_tree[EX_READ]);
> > +	__init_extent_tree_info(&sbi->extent_tree[EX_BLOCK_AGE]);
> > +
> > +	/* initialize for block age extents */
> > +	atomic64_set(&sbi->allocated_data_blocks, 0);
> > +	sbi->hot_data_age_threshold = DEF_HOT_DATA_AGE_THRESHOLD;
> > +	sbi->warm_data_age_threshold = DEF_WARM_DATA_AGE_THRESHOLD;
> >  }
> >  
> >  int __init f2fs_create_extent_cache(void)
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index ff940cba4600..eb71edcf70de 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -107,6 +107,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
> >  #define F2FS_MOUNT_MERGE_CHECKPOINT	0x10000000
> >  #define	F2FS_MOUNT_GC_MERGE		0x20000000
> >  #define F2FS_MOUNT_COMPRESS_CACHE	0x40000000
> > +#define F2FS_MOUNT_AGE_EXTENT_CACHE	0x80000000
> >  
> >  #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
> >  #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
> > @@ -607,9 +608,22 @@ enum {
> >  /* number of extent info in extent cache we try to shrink */
> >  #define READ_EXTENT_CACHE_SHRINK_NUMBER	128
> >  
> > +/* number of age extent info in extent cache we try to shrink */
> > +#define AGE_EXTENT_CACHE_SHRINK_NUMBER	128
> > +#define LAST_AGE_WEIGHT			30
> > +#define SAME_AGE_REGION			1024
> > +
> > +/*
> > + * Define data block with age less than 1GB as hot data
> > + * define data block with age less than 10GB but more than 1GB as warm data
> > + */
> > +#define DEF_HOT_DATA_AGE_THRESHOLD	262144
> > +#define DEF_WARM_DATA_AGE_THRESHOLD	2621440
> > +
> >  /* extent cache type */
> >  enum extent_type {
> >  	EX_READ,
> > +	EX_BLOCK_AGE,
> >  	NR_EXTENT_CACHES,
> >  };
> >  
> > @@ -637,6 +651,13 @@ struct extent_info {
> >  			unsigned int c_len;
> >  #endif
> >  		};
> > +		/* block age extent_cache */
> > +		struct {
> > +			/* block age of the extent */
> > +			unsigned long long age;
> > +			/* last total blocks allocated */
> > +			unsigned long long last_blocks;
> > +		};
> >  	};
> >  };
> >  
> > @@ -1653,6 +1674,11 @@ struct f2fs_sb_info {
> >  
> >  	/* for extent tree cache */
> >  	struct extent_tree_info extent_tree[NR_EXTENT_CACHES];
> > +	atomic64_t allocated_data_blocks;	/* for block age extent_cache */
> > +
> > +	/* The threshold used for hot and warm data seperation*/
> > +	unsigned int hot_data_age_threshold;
> > +	unsigned int warm_data_age_threshold;
> >  
> >  	/* basic filesystem units */
> >  	unsigned int log_sectors_per_block;	/* log2 sectors per block */
> > @@ -3857,6 +3883,8 @@ struct f2fs_stat_info {
> >  	unsigned long long ext_mem[NR_EXTENT_CACHES];
> >  	/* for read extent cache */
> >  	unsigned long long hit_largest;
> > +	/* for block age extent cache */
> > +	unsigned long long allocated_data_blocks;
> >  	int ndirty_node, ndirty_dent, ndirty_meta, ndirty_imeta;
> >  	int ndirty_data, ndirty_qdata;
> >  	unsigned int ndirty_dirs, ndirty_files, nquota_files, ndirty_all;
> > @@ -4168,6 +4196,16 @@ void f2fs_update_read_extent_cache_range(struct dnode_of_data *dn,
> >  unsigned int f2fs_shrink_read_extent_tree(struct f2fs_sb_info *sbi,
> >  			int nr_shrink);
> >  
> > +/* block age extent cache ops */
> > +void f2fs_init_age_extent_tree(struct inode *inode);
> > +bool f2fs_lookup_age_extent_cache(struct inode *inode, pgoff_t pgofs,
> > +			struct extent_info *ei);
> > +void f2fs_update_age_extent_cache(struct dnode_of_data *dn);
> > +void f2fs_update_age_extent_cache_range(struct dnode_of_data *dn,
> > +			pgoff_t fofs, unsigned int len);
> > +unsigned int f2fs_shrink_age_extent_tree(struct f2fs_sb_info *sbi,
> > +			int nr_shrink);
> > +
> >  /*
> >   * sysfs.c
> >   */
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index cbe7c24065c7..56c23b5e9d65 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -619,6 +619,7 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
> >  		fofs = f2fs_start_bidx_of_node(ofs_of_node(dn->node_page),
> >  							dn->inode) + ofs;
> >  		f2fs_update_read_extent_cache_range(dn, fofs, 0, len);
> > +		f2fs_update_age_extent_cache_range(dn, fofs, nr_free);
> >  		dec_valid_block_count(sbi, dn->inode, nr_free);
> >  	}
> >  	dn->ofs_in_node = ofs;
> > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > index c845c16f97d0..ff6cf66ed46b 100644
> > --- a/fs/f2fs/inode.c
> > +++ b/fs/f2fs/inode.c
> > @@ -480,6 +480,7 @@ static int do_read_inode(struct inode *inode)
> >  
> >  	/* Need all the flag bits */
> >  	f2fs_init_read_extent_tree(inode, node_page);
> > +	f2fs_init_age_extent_tree(inode);
> >  
> >  	f2fs_put_page(node_page, 1);
> >  
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index 07419c3e42a5..dde4c0458704 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -60,7 +60,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
> >  	avail_ram = val.totalram - val.totalhigh;
> >  
> >  	/*
> > -	 * give 25%, 25%, 50%, 50%, 50% memory for each components respectively
> > +	 * give 25%, 25%, 50%, 50%, 25%, 25% memory for each components respectively
> >  	 */
> >  	if (type == FREE_NIDS) {
> >  		mem_size = (nm_i->nid_cnt[FREE_NID] *
> > @@ -85,14 +85,16 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
> >  						sizeof(struct ino_entry);
> >  		mem_size >>= PAGE_SHIFT;
> >  		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
> > -	} else if (type == READ_EXTENT_CACHE) {
> > -		struct extent_tree_info *eti = &sbi->extent_tree[EX_READ];
> > +	} else if (type == READ_EXTENT_CACHE || type == AGE_EXTENT_CACHE) {
> > +		enum extent_type etype = type == READ_EXTENT_CACHE ?
> > +						EX_READ : EX_BLOCK_AGE;
> > +		struct extent_tree_info *eti = &sbi->extent_tree[etype];
> >  
> >  		mem_size = (atomic_read(&eti->total_ext_tree) *
> >  				sizeof(struct extent_tree) +
> >  				atomic_read(&eti->total_ext_node) *
> >  				sizeof(struct extent_node)) >> PAGE_SHIFT;
> > -		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
> > +		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 2);
> >  	} else if (type == DISCARD_CACHE) {
> >  		mem_size = (atomic_read(&dcc->discard_cmd_cnt) *
> >  				sizeof(struct discard_cmd)) >> PAGE_SHIFT;
> > diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
> > index 0aa48704c77a..99454d46a939 100644
> > --- a/fs/f2fs/node.h
> > +++ b/fs/f2fs/node.h
> > @@ -147,6 +147,7 @@ enum mem_type {
> >  	DIRTY_DENTS,	/* indicates dirty dentry pages */
> >  	INO_ENTRIES,	/* indicates inode entries */
> >  	READ_EXTENT_CACHE,	/* indicates read extent cache */
> > +	AGE_EXTENT_CACHE,	/* indicates age extent cache */
> >  	DISCARD_CACHE,	/* indicates memory of cached discard cmds */
> >  	COMPRESS_PAGE,	/* indicates memory of cached compressed pages */
> >  	BASE_CHECK,	/* check kernel status */
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 8722d1a13c17..dee712f7225f 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -453,6 +453,11 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
> >  		f2fs_shrink_read_extent_tree(sbi,
> >  				READ_EXTENT_CACHE_SHRINK_NUMBER);
> >  
> > +	/* try to shrink age extent cache when there is no enough memory */
> > +	if (!f2fs_available_free_memory(sbi, AGE_EXTENT_CACHE))
> > +		f2fs_shrink_age_extent_tree(sbi,
> > +				AGE_EXTENT_CACHE_SHRINK_NUMBER);
> > +
> >  	/* check the # of cached NAT entries */
> >  	if (!f2fs_available_free_memory(sbi, NAT_ENTRIES))
> >  		f2fs_try_to_free_nats(sbi, NAT_ENTRY_PER_BLOCK);
> > @@ -3151,10 +3156,28 @@ static int __get_segment_type_4(struct f2fs_io_info *fio)
> >  	}
> >  }
> >  
> > +static int __get_age_segment_type(struct inode *inode, pgoff_t pgofs)
> > +{
> > +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> > +	struct extent_info ei;
> > +
> > +	if (f2fs_lookup_age_extent_cache(inode, pgofs, &ei)) {
> > +		if (!ei.age)
> > +			return NO_CHECK_TYPE;
> > +		if (ei.age <= sbi->hot_data_age_threshold)
> > +			return CURSEG_HOT_DATA;
> > +		if (ei.age <= sbi->warm_data_age_threshold)
> > +			return CURSEG_WARM_DATA;
> > +		return CURSEG_COLD_DATA;
> > +	}
> > +	return NO_CHECK_TYPE;
> > +}
> > +
> >  static int __get_segment_type_6(struct f2fs_io_info *fio)
> >  {
> >  	if (fio->type == DATA) {
> >  		struct inode *inode = fio->page->mapping->host;
> > +		int type;
> >  
> >  		if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
> >  			return CURSEG_COLD_DATA_PINNED;
> > @@ -3169,6 +3192,11 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
> >  		}
> >  		if (file_is_cold(inode) || f2fs_need_compress_data(inode))
> >  			return CURSEG_COLD_DATA;
> > +
> > +		type = __get_age_segment_type(inode, fio->page->index);
> > +		if (type != NO_CHECK_TYPE)
> > +			return type;
> > +
> >  		if (file_is_hot(inode) ||
> >  				is_inode_flag_set(inode, FI_HOT_DATA) ||
> >  				f2fs_is_cow_file(inode))
> > @@ -3287,6 +3315,9 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
> >  	locate_dirty_segment(sbi, GET_SEGNO(sbi, old_blkaddr));
> >  	locate_dirty_segment(sbi, GET_SEGNO(sbi, *new_blkaddr));
> >  
> > +	if (IS_DATASEG(type))
> > +		atomic64_inc(&sbi->allocated_data_blocks);
> > +
> >  	up_write(&sit_i->sentry_lock);
> >  
> >  	if (page && IS_NODESEG(type)) {
> > @@ -3414,6 +3445,8 @@ void f2fs_outplace_write_data(struct dnode_of_data *dn,
> >  	struct f2fs_summary sum;
> >  
> >  	f2fs_bug_on(sbi, dn->data_blkaddr == NULL_ADDR);
> > +	if (fio->io_type == FS_DATA_IO || fio->io_type == FS_CP_DATA_IO)
> > +		f2fs_update_age_extent_cache(dn);
> >  	set_summary(&sum, dn->nid, dn->ofs_in_node, fio->version);
> >  	do_write_page(&sum, fio);
> >  	f2fs_update_data_blkaddr(dn, fio->new_blkaddr);
> > diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> > index 33c490e69ae3..83d6fb97dcae 100644
> > --- a/fs/f2fs/shrinker.c
> > +++ b/fs/f2fs/shrinker.c
> > @@ -59,6 +59,9 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
> >  		/* count read extent cache entries */
> >  		count += __count_extent_cache(sbi, EX_READ);
> >  
> > +		/* count block age extent cache entries */
> > +		count += __count_extent_cache(sbi, EX_BLOCK_AGE);
> > +
> >  		/* count clean nat cache entries */
> >  		count += __count_nat_entries(sbi);
> >  
> > @@ -102,8 +105,11 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
> >  
> >  		sbi->shrinker_run_no = run_no;
> >  
> > +		/* shrink extent cache entries */
> > +		freed += f2fs_shrink_age_extent_tree(sbi, nr >> 2);
> > +
> >  		/* shrink read extent cache entries */
> > -		freed += f2fs_shrink_read_extent_tree(sbi, nr >> 1);
> > +		freed += f2fs_shrink_read_extent_tree(sbi, nr >> 2);
> >  
> >  		/* shrink clean nat cache entries */
> >  		if (freed < nr)
> > @@ -134,6 +140,8 @@ void f2fs_join_shrinker(struct f2fs_sb_info *sbi)
> >  void f2fs_leave_shrinker(struct f2fs_sb_info *sbi)
> >  {
> >  	f2fs_shrink_read_extent_tree(sbi, __count_extent_cache(sbi, EX_READ));
> > +	f2fs_shrink_age_extent_tree(sbi,
> > +				__count_extent_cache(sbi, EX_BLOCK_AGE));
> >  
> >  	spin_lock(&f2fs_list_lock);
> >  	list_del_init(&sbi->s_list);
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 10bd03bbefec..5bdab376b852 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -163,6 +163,7 @@ enum {
> >  	Opt_nogc_merge,
> >  	Opt_discard_unit,
> >  	Opt_memory_mode,
> > +	Opt_age_extent_cache,
> >  	Opt_err,
> >  };
> >  
> > @@ -241,6 +242,7 @@ static match_table_t f2fs_tokens = {
> >  	{Opt_nogc_merge, "nogc_merge"},
> >  	{Opt_discard_unit, "discard_unit=%s"},
> >  	{Opt_memory_mode, "memory=%s"},
> > +	{Opt_age_extent_cache, "age_extent_cache"},
> >  	{Opt_err, NULL},
> >  };
> >  
> > @@ -1257,6 +1259,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
> >  			}
> >  			kfree(name);
> >  			break;
> > +		case Opt_age_extent_cache:
> > +			set_opt(sbi, AGE_EXTENT_CACHE);
> > +			break;
> >  		default:
> >  			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
> >  				 p);
> > @@ -1958,6 +1963,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
> >  		seq_puts(seq, ",read_extent_cache");
> >  	else
> >  		seq_puts(seq, ",no_read_extent_cache");
> > +	if (test_opt(sbi, AGE_EXTENT_CACHE))
> > +		seq_puts(seq, ",age_extent_cache");
> >  	if (test_opt(sbi, DATA_FLUSH))
> >  		seq_puts(seq, ",data_flush");
> >  
> > @@ -2219,6 +2226,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
> >  	bool need_restart_flush = false, need_stop_flush = false;
> >  	bool need_restart_discard = false, need_stop_discard = false;
> >  	bool no_read_extent_cache = !test_opt(sbi, READ_EXTENT_CACHE);
> > +	bool no_age_extent_cache = !test_opt(sbi, AGE_EXTENT_CACHE);
> >  	bool enable_checkpoint = !test_opt(sbi, DISABLE_CHECKPOINT);
> >  	bool no_io_align = !F2FS_IO_ALIGNED(sbi);
> >  	bool no_atgc = !test_opt(sbi, ATGC);
> > @@ -2313,6 +2321,12 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
> >  		f2fs_warn(sbi, "switch extent_cache option is not allowed");
> >  		goto restore_opts;
> >  	}
> > +	/* disallow enable/disable age extent_cache dynamically */
> > +	if (no_age_extent_cache == !!test_opt(sbi, AGE_EXTENT_CACHE)) {
> > +		err = -EINVAL;
> > +		f2fs_warn(sbi, "switch age_extent_cache option is not allowed");
> > +		goto restore_opts;
> > +	}
> >  
> >  	if (no_io_align == !!F2FS_IO_ALIGNED(sbi)) {
> >  		err = -EINVAL;
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index a4745d596310..2ab215110596 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -668,6 +668,24 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
> >  		return count;
> >  	}
> >  
> > +	if (!strcmp(a->attr.name, "hot_data_age_threshold")) {
> > +		if (t == 0 || t >= sbi->warm_data_age_threshold)
> > +			return -EINVAL;
> > +		if (t == *ui)
> > +			return count;
> > +		*ui = (unsigned int)t;
> > +		return count;
> > +	}
> > +
> > +	if (!strcmp(a->attr.name, "warm_data_age_threshold")) {
> > +		if (t == 0 || t <= sbi->hot_data_age_threshold)
> > +			return -EINVAL;
> > +		if (t == *ui)
> > +			return count;
> > +		*ui = (unsigned int)t;
> > +		return count;
> > +	}
> > +
> >  	*ui = (unsigned int)t;
> >  
> >  	return count;
> > @@ -923,6 +941,10 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, peak_atomic_write, peak_atomic_write);
> >  F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, committed_atomic_block, committed_atomic_block);
> >  F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, revoked_atomic_block, revoked_atomic_block);
> >  
> > +/* For block age extent cache */
> > +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, hot_data_age_threshold, hot_data_age_threshold);
> > +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, warm_data_age_threshold, warm_data_age_threshold);
> > +
> >  #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
> >  static struct attribute *f2fs_attrs[] = {
> >  	ATTR_LIST(gc_urgent_sleep_time),
> > @@ -1018,6 +1040,8 @@ static struct attribute *f2fs_attrs[] = {
> >  	ATTR_LIST(peak_atomic_write),
> >  	ATTR_LIST(committed_atomic_block),
> >  	ATTR_LIST(revoked_atomic_block),
> > +	ATTR_LIST(hot_data_age_threshold),
> > +	ATTR_LIST(warm_data_age_threshold),
> >  	NULL,
> >  };
> >  ATTRIBUTE_GROUPS(f2fs);
> > diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> > index 2bb37892d2ba..31d994e6b4ca 100644
> > --- a/include/trace/events/f2fs.h
> > +++ b/include/trace/events/f2fs.h
> > @@ -49,6 +49,7 @@ TRACE_DEFINE_ENUM(CP_TRIMMED);
> >  TRACE_DEFINE_ENUM(CP_PAUSE);
> >  TRACE_DEFINE_ENUM(CP_RESIZE);
> >  TRACE_DEFINE_ENUM(EX_READ);
> > +TRACE_DEFINE_ENUM(EX_BLOCK_AGE);
> >  
> >  #define show_block_type(type)						\
> >  	__print_symbolic(type,						\
> > @@ -155,6 +156,11 @@ TRACE_DEFINE_ENUM(EX_READ);
> >  		{ COMPRESS_ZSTD,	"ZSTD" },			\
> >  		{ COMPRESS_LZORLE,	"LZO-RLE" })
> >  
> > +#define show_extent_type(type)						\
> > +	__print_symbolic(type,						\
> > +		{ EX_READ,	"Read" },				\
> > +		{ EX_BLOCK_AGE,	"Block Age" })
> > +
> >  struct f2fs_sb_info;
> >  struct f2fs_io_info;
> >  struct extent_info;
> > @@ -1544,7 +1550,7 @@ TRACE_EVENT(f2fs_lookup_extent_tree_start,
> >  	TP_printk("dev = (%d,%d), ino = %lu, pgofs = %u, type = %s",
> >  		show_dev_ino(__entry),
> >  		__entry->pgofs,
> > -		__entry->type == EX_READ ? "Read" : "N/A")
> > +		show_extent_type(__entry->type))
> >  );
> >  
> >  TRACE_EVENT_CONDITION(f2fs_lookup_read_extent_tree_end,
> > @@ -1583,6 +1589,45 @@ TRACE_EVENT_CONDITION(f2fs_lookup_read_extent_tree_end,
> >  		__entry->blk)
> >  );
> >  
> > +TRACE_EVENT_CONDITION(f2fs_lookup_age_extent_tree_end,
> > +
> > +	TP_PROTO(struct inode *inode, unsigned int pgofs,
> > +						struct extent_info *ei),
> > +
> > +	TP_ARGS(inode, pgofs, ei),
> > +
> > +	TP_CONDITION(ei),
> > +
> > +	TP_STRUCT__entry(
> > +		__field(dev_t,	dev)
> > +		__field(ino_t,	ino)
> > +		__field(unsigned int, pgofs)
> > +		__field(unsigned int, fofs)
> > +		__field(unsigned int, len)
> > +		__field(unsigned long long, age)
> > +		__field(unsigned long long, blocks)
> > +	),
> > +
> > +	TP_fast_assign(
> > +		__entry->dev = inode->i_sb->s_dev;
> > +		__entry->ino = inode->i_ino;
> > +		__entry->pgofs = pgofs;
> > +		__entry->fofs = ei->fofs;
> > +		__entry->len = ei->len;
> > +		__entry->age = ei->age;
> > +		__entry->blocks = ei->last_blocks;
> > +	),
> > +
> > +	TP_printk("dev = (%d,%d), ino = %lu, pgofs = %u, "
> > +		"age_ext_info(fofs: %u, len: %u, age: %llu, blocks: %llu)",
> > +		show_dev_ino(__entry),
> > +		__entry->pgofs,
> > +		__entry->fofs,
> > +		__entry->len,
> > +		__entry->age,
> > +		__entry->blocks)
> > +);
> > +
> >  TRACE_EVENT(f2fs_update_read_extent_tree_range,
> >  
> >  	TP_PROTO(struct inode *inode, unsigned int pgofs, unsigned int len,
> > @@ -1618,6 +1663,41 @@ TRACE_EVENT(f2fs_update_read_extent_tree_range,
> >  		__entry->c_len)
> >  );
> >  
> > +TRACE_EVENT(f2fs_update_age_extent_tree_range,
> > +
> > +	TP_PROTO(struct inode *inode, unsigned int pgofs, unsigned int len,
> > +					unsigned long long age,
> > +					unsigned long long last_blks),
> > +
> > +	TP_ARGS(inode, pgofs, len, age, last_blks),
> > +
> > +	TP_STRUCT__entry(
> > +		__field(dev_t,	dev)
> > +		__field(ino_t,	ino)
> > +		__field(unsigned int, pgofs)
> > +		__field(unsigned int, len)
> > +		__field(unsigned long long, age)
> > +		__field(unsigned long long, blocks)
> > +	),
> > +
> > +	TP_fast_assign(
> > +		__entry->dev = inode->i_sb->s_dev;
> > +		__entry->ino = inode->i_ino;
> > +		__entry->pgofs = pgofs;
> > +		__entry->len = len;
> > +		__entry->age = age;
> > +		__entry->blocks = last_blks;
> > +	),
> > +
> > +	TP_printk("dev = (%d,%d), ino = %lu, pgofs = %u, "
> > +				"len = %u, age = %llu, blocks = %llu",
> > +		show_dev_ino(__entry),
> > +		__entry->pgofs,
> > +		__entry->len,
> > +		__entry->age,
> > +		__entry->blocks)
> > +);
> > +
> >  TRACE_EVENT(f2fs_shrink_extent_tree,
> >  
> >  	TP_PROTO(struct f2fs_sb_info *sbi, unsigned int node_cnt,
> > @@ -1643,7 +1723,7 @@ TRACE_EVENT(f2fs_shrink_extent_tree,
> >  		show_dev(__entry->dev),
> >  		__entry->node_cnt,
> >  		__entry->tree_cnt,
> > -		__entry->type == EX_READ ? "Read" : "N/A")
> > +		show_extent_type(__entry->type))
> >  );
> >  
> >  TRACE_EVENT(f2fs_destroy_extent_tree,
> > @@ -1670,7 +1750,7 @@ TRACE_EVENT(f2fs_destroy_extent_tree,
> >  	TP_printk("dev = (%d,%d), ino = %lu, destroyed: node_cnt = %u, type = %s",
> >  		show_dev_ino(__entry),
> >  		__entry->node_cnt,
> > -		__entry->type == EX_READ ? "Read" : "N/A")
> > +		show_extent_type(__entry->type))
> >  );
> >  
> >  DECLARE_EVENT_CLASS(f2fs_sync_dirty_inodes,
> > -- 
> > 2.39.0.rc0.267.gcb52ba06e7-goog
> > 
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
