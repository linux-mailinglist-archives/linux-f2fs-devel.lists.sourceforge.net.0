Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B13643101
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Dec 2022 20:04:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p2GlT-0007T4-5B;
	Mon, 05 Dec 2022 19:04:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p2GlD-0007So-0T
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Dec 2022 19:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1+MTdh3AQKJ6u7+A2M9JFaWqMkMAQDHK6BllsVOk0m8=; b=ZmcMDAP3CAhACHxdFxMZeHWpvX
 TIB0/3cSMM8/36YijqZIU28+hY9Wi0H1Wpq4j31JkfLBG2J3kWTu5EBHYpD5xclhNJi1MSsn1xAZB
 Rg1YK7H+45MVEmc+2sQxScEGet+3/G1IsNUz6j5MqHPyYGthL/ie9M/fU6vkt/JH1Rik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1+MTdh3AQKJ6u7+A2M9JFaWqMkMAQDHK6BllsVOk0m8=; b=CMTNjCMCpI2jsI+ONl6btQFK02
 2bwCvce2tY3JdsKy1XLlmJ2mHa9US4P20pvA2QjoD9TsZPW2KyD4SmrPo7M1L8++7KptVSuET2NUG
 L2XmO6E0iCkPQN47KvBZ9T3EGO4ONH1h6YIHxWUEK2rDSWU0qPKty5tDTD0ykPKT5WjM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p2GlC-00728l-5i for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Dec 2022 19:04:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B442061300;
 Mon,  5 Dec 2022 19:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A66C433D6;
 Mon,  5 Dec 2022 19:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670267048;
 bh=Yb0dClbFV8k9lVOuLWFdRLqaOmW9bC5EhWjjokQe8Fs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Us2EILCevfFxMVwmhFzbrtHf/fSeKlO6QmazjpUAvGcgVJ8otip6DVtOZDthkMayu
 MBvMwjWVzM3Fw0ivm78UFH6Cy9+fD1H5usMVI9/vdJ78cagpK2AN63Wmh8TDVddp+2
 EcMw8XoUBFf1L367xWWBMHSsT4oXNe9p1DQ55thMk3JuJ7OSjl8nSzwifDvEIRUddl
 57Pr4JpvLfIosYhJgiCr8redeqbYovhKH4E0kyybkpkkJkvJ1yRp3WxQPRNT8nRboC
 DJ1JVeSd2OBAdksImkla1IOyC3VbZjedwawN6Nrl6aSrie30EGqJpUX8dtuoUqZQNb
 VVeTNjFqnXoQA==
Date: Mon, 5 Dec 2022 11:04:06 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: qixiaoyu1 <qxy65535@gmail.com>
Message-ID: <Y45ApqnHXf1ierdg@google.com>
References: <20221128085859.5295-1-qixiaoyu1@xiaomi.com>
 <20221128085859.5295-2-qixiaoyu1@xiaomi.com>
 <Y4VzmiShMvp87z3p@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4VzmiShMvp87z3p@google.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/28, Jaegeuk Kim wrote: > On 11/28, qixiaoyu1 wrote:
 > > From: xiongping1 <xiongping1@xiaomi.com> > > > > Signed-off-by: xiongping1
 <xiongping1@xiaomi.com> > > Signed-off-by: qixiaoyu1 <qixiaoyu1 [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1p2GlC-00728l-5i
Subject: Re: [f2fs-dev] [PATCH 1/5] f2fs: record total data blocks allocated
 since mount
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

On 11/28, Jaegeuk Kim wrote:
> On 11/28, qixiaoyu1 wrote:
> > From: xiongping1 <xiongping1@xiaomi.com>
> > 
> > Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
> > Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
> > ---
> >  fs/f2fs/Kconfig     |  7 +++++++
> >  fs/f2fs/Makefile    |  1 +
> >  fs/f2fs/block_age.c | 28 ++++++++++++++++++++++++++++
> >  fs/f2fs/debug.c     |  7 +++++++
> >  fs/f2fs/f2fs.h      | 15 +++++++++++++++
> >  fs/f2fs/segment.c   |  4 ++++
> >  fs/f2fs/super.c     |  4 ++++
> >  7 files changed, 66 insertions(+)
> >  create mode 100644 fs/f2fs/block_age.c
> > 
> > diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
> > index 03ef087537c7..84915f9c6bc8 100644
> > --- a/fs/f2fs/Kconfig
> > +++ b/fs/f2fs/Kconfig
> > @@ -150,3 +150,10 @@ config F2FS_UNFAIR_RWSEM
> >  	help
> >  	  Use unfair rw_semaphore, if system configured IO priority by block
> >  	  cgroup.
> > +
> > +config F2FS_FS_DATA_SEPARATION
> > +	bool "F2FS hot/cold data separation feature"
> > +	depends on F2FS_FS
> > +	help
> > +	  Enable data blocks separation according to block update frequency.
> > +
> > diff --git a/fs/f2fs/Makefile b/fs/f2fs/Makefile
> > index 8a7322d229e4..70d8f0e23b46 100644
> > --- a/fs/f2fs/Makefile
> > +++ b/fs/f2fs/Makefile
> > @@ -10,3 +10,4 @@ f2fs-$(CONFIG_F2FS_FS_POSIX_ACL) += acl.o
> >  f2fs-$(CONFIG_FS_VERITY) += verity.o
> >  f2fs-$(CONFIG_F2FS_FS_COMPRESSION) += compress.o
> >  f2fs-$(CONFIG_F2FS_IOSTAT) += iostat.o
> > +f2fs-$(CONFIG_F2FS_FS_DATA_SEPARATION) += block_age.o
> > diff --git a/fs/f2fs/block_age.c b/fs/f2fs/block_age.c
> > new file mode 100644
> > index 000000000000..1e8711a03959
> > --- /dev/null
> > +++ b/fs/f2fs/block_age.c
> > @@ -0,0 +1,28 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * fs/f2fs/block_age.c
> > + *
> > + * Copyright (c) 2022 xiaomi Co., Ltd.
> > + *             http://www.xiaomi.com/
> 
> I don't think this is a right way, since it seems you copied lots of codes
> from extent_cache.c which has another copyrights.
> 
> I'm thinking to integrate your extent_cache code into the original path in
> order to keep the single code path for easy debugging. Stay tuned.

Hi,

Could you please check this patch series?

https://lore.kernel.org/linux-f2fs-devel/20221205185433.3479699-1-jaegeuk@kernel.org/T/#t


Thanks,

> 
> > + */
> > +#include <linux/fs.h>
> > +#include <linux/f2fs_fs.h>
> > +
> > +#include "f2fs.h"
> > +#include "segment.h"
> > +
> > +static inline void f2fs_inc_data_block_alloc(struct f2fs_sb_info *sbi)
> > +{
> > +	atomic64_inc(&sbi->total_data_alloc);
> > +}
> > +
> > +void f2fs_init_block_age_info(struct f2fs_sb_info *sbi)
> > +{
> > +	atomic64_set(&sbi->total_data_alloc, 0);
> > +}
> > +
> > +void f2fs_inc_block_alloc_count(struct f2fs_sb_info *sbi, int type)
> > +{
> > +	if (IS_DATASEG(type))
> > +		f2fs_inc_data_block_alloc(sbi);
> > +}
> > diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> > index a216dcdf6941..d24abdac20bb 100644
> > --- a/fs/f2fs/debug.c
> > +++ b/fs/f2fs/debug.c
> > @@ -81,6 +81,9 @@ static void update_general_status(struct f2fs_sb_info *sbi)
> >  	si->ext_tree = atomic_read(&sbi->total_ext_tree);
> >  	si->zombie_tree = atomic_read(&sbi->total_zombie_tree);
> >  	si->ext_node = atomic_read(&sbi->total_ext_node);
> > +#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
> > +	si->total_data_blocks_alloc = atomic64_read(&sbi->total_data_alloc);
> > +#endif
> >  	si->ndirty_node = get_pages(sbi, F2FS_DIRTY_NODES);
> >  	si->ndirty_dent = get_pages(sbi, F2FS_DIRTY_DENTS);
> >  	si->ndirty_meta = get_pages(sbi, F2FS_DIRTY_META);
> > @@ -373,6 +376,10 @@ static int stat_show(struct seq_file *s, void *v)
> >  			seq_printf(s, "Utilization: %u%% (%u valid blocks)\n",
> >  				si->utilization, si->valid_count);
> >  
> > +#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
> > +		seq_printf(s, "  - Data Block Allocated: %llu\n",
> > +			   si->total_data_blocks_alloc);
> > +#endif
> >  		seq_printf(s, "  - Node: %u (Inode: %u, ",
> >  			   si->valid_node_count, si->valid_inode_count);
> >  		seq_printf(s, "Other: %u)\n  - Data: %u\n",
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index e6355a5683b7..686f09846de4 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1807,6 +1807,10 @@ struct f2fs_sb_info {
> >  	u64 sectors_written_start;
> >  	u64 kbytes_written;
> >  
> > +#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
> > +	atomic64_t total_data_alloc;
> > +#endif
> > +
> >  	/* Reference to checksum algorithm driver via cryptoapi */
> >  	struct crypto_shash *s_chksum_driver;
> >  
> > @@ -3858,6 +3862,9 @@ struct f2fs_stat_info {
> >  	int main_area_segs, main_area_sections, main_area_zones;
> >  	unsigned long long hit_largest, hit_cached, hit_rbtree;
> >  	unsigned long long hit_total, total_ext;
> > +#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
> > +	unsigned long long total_data_blocks_alloc;
> > +#endif
> >  	int ext_tree, zombie_tree, ext_node;
> >  	int ndirty_node, ndirty_dent, ndirty_meta, ndirty_imeta;
> >  	int ndirty_data, ndirty_qdata;
> > @@ -4166,6 +4173,14 @@ void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi);
> >  int __init f2fs_create_extent_cache(void);
> >  void f2fs_destroy_extent_cache(void);
> >  
> > +#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
> > +/*
> > + * block_age.c
> > + */
> > +void f2fs_init_block_age_info(struct f2fs_sb_info *sbi);
> > +void f2fs_inc_block_alloc_count(struct f2fs_sb_info *sbi, int type);
> > +#endif
> > +
> >  /*
> >   * sysfs.c
> >   */
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index acf3d3fa4363..0cf022fd3560 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -3280,6 +3280,10 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
> >  	locate_dirty_segment(sbi, GET_SEGNO(sbi, old_blkaddr));
> >  	locate_dirty_segment(sbi, GET_SEGNO(sbi, *new_blkaddr));
> >  
> > +#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
> > +	f2fs_inc_block_alloc_count(sbi, type);
> > +#endif
> > +
> >  	up_write(&sit_i->sentry_lock);
> >  
> >  	if (page && IS_NODESEG(type)) {
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 3834ead04620..bf799d92282a 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -4475,6 +4475,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> >  
> >  	f2fs_join_shrinker(sbi);
> >  
> > +#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
> > +	f2fs_init_block_age_info(sbi);
> > +#endif
> > +
> >  	f2fs_tuning_parameters(sbi);
> >  
> >  	f2fs_notice(sbi, "Mounted with checkpoint version = %llx",
> > -- 
> > 2.36.1
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
