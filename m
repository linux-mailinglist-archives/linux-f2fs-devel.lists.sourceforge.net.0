Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 545D9EC6BC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2019 17:29:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQZnT-0003BN-Jt; Fri, 01 Nov 2019 16:29:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iQZnS-0003BG-PE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 16:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AFcw9DhRa1LfIIlaIcZmJ6ABYNrmG10ZdD0G/NMQGgM=; b=kMhaR5hG8PMUa9dhwWLsljpH8l
 KIN3wzU4/UgiOPKlRtfj0njjAcuE6orby4QWo00Iqd/UCfgAU0aek/VTL8wPVjd+diD1oL7NTO77b
 8zu1z/qMZmpFPhhS2iU5IEjNg+vObFVn6SAamFh5LKf2Pf1xRa50bzfN7rA3QT9V5png=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AFcw9DhRa1LfIIlaIcZmJ6ABYNrmG10ZdD0G/NMQGgM=; b=GSQzMRtJ0YAgQOfQN3+u6icMJT
 AO2rti2HK2wEXe6ILiM/W4fachW8DR29NXkx1cDoiuOkxo4wIvmOtjS5PqmZe5MXJYi64zoThWL/X
 o/iAROosxm5yjSjKu18jqt318B61usPzP9Z5ZFADi6RsJYLuOn30chUxmzXHCaDbguG4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQZnK-00E70b-HI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 16:29:10 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C254721835;
 Fri,  1 Nov 2019 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572625732;
 bh=+T99lhIrMxEYSSjxl5BDraIfNctcVhnqsCMH9Dngx+4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hrY8u7vEmcP4lmt+VvkGDtxsyalbyvctO91wpj+7YMZBDOIS40wvV4xBxFYbD0yHC
 S1H39cSdZRiaRfHC+3Toen4utJ7N7hSX6CQsvkr1Y20HMehUStC7cGCiroCFwhTH6B
 e562oe2w4T03enCqd6u0ZXcqekXO/7i7trdGCw0s=
Date: Fri, 1 Nov 2019 09:28:50 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191101162850.GA5193@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191101100714.11965-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191101100714.11965-1-yuchao0@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iQZnK-00E70b-HI
Subject: Re: [f2fs-dev] [RFC PATCH v3] f2fs: support data compression
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

On 11/01, Chao Yu wrote:
> This patch tries to support compression in f2fs.
> 
> - New term named cluster is defined as basic unit of compression, file can
> be divided into multiple clusters logically. One cluster includes 4 << n
> (n >= 0) logical pages, compression size is also cluster size, each of
> cluster can be compressed or not.
> 
> - In cluster metadata layout, one special flag is used to indicate cluster
> is compressed one or normal one, for compressed cluster, following metadata
> maps cluster to [1, 4 << n - 1] physical blocks, in where f2fs stores
> data including compress header and compressed data.
> 
> - In order to eliminate write amplification during overwrite, F2FS only
> support compression on write-once file, data can be compressed only when
> all logical blocks in file are valid and cluster compress ratio is lower
> than specified threshold.
> 
> - To enable compression on regular inode, there are three ways:
> * chattr +c file
> * chattr +c dir; touch dir/file
> * mount w/ -o compress_extension=ext; touch file.ext
> 
> Compress metadata layout:
>                              [Dnode Structure]
>              +-----------------------------------------------+
>              | cluster 1 | cluster 2 | ......... | cluster N |
>              +-----------------------------------------------+
>              .           .                       .           .
>        .                       .                .                      .
>   .         Compressed Cluster       .        .        Normal Cluster            .
> +----------+---------+---------+---------+  +---------+---------+---------+---------+
> |compr flag| block 1 | block 2 | block 3 |  | block 1 | block 2 | block 3 | block 4 |
> +----------+---------+---------+---------+  +---------+---------+---------+---------+
>            .                             .
>          .                                           .
>        .                                                           .
>       +-------------+-------------+----------+----------------------------+
>       | data length | data chksum | reserved |      compressed data       |
>       +-------------+-------------+----------+----------------------------+
> 
> Changelog:
> 
> 20190326:
> - fix error handling of read_end_io().
> - remove unneeded comments in f2fs_encrypt_one_page().
> 
> 20190327:
> - fix wrong use of f2fs_cluster_is_full() in f2fs_mpage_readpages().
> - don't jump into loop directly to avoid uninitialized variables.
> - add TODO tag in error path of f2fs_write_cache_pages().
> 
> 20190328:
> - fix wrong merge condition in f2fs_read_multi_pages().
> - check compressed file in f2fs_post_read_required().
> 
> 20190401
> - allow overwrite on non-compressed cluster.
> - check cluster meta before writing compressed data.
> 
> 20190402
> - don't preallocate blocks for compressed file.
> 
> - add lz4 compress algorithm
> - process multiple post read works in one workqueue
>   Now f2fs supports processing post read work in multiple workqueue,
>   it shows low performance due to schedule overhead of multiple
>   workqueue executing orderly.
> 
> 20190921
> - compress: support buffered overwrite
> C: compress cluster flag
> V: valid block address
> N: NEW_ADDR
> 
> One cluster contain 4 blocks
> 
>  before overwrite   after overwrite
> 
> - VVVV		->	CVNN
> - CVNN		->	VVVV
> 
> - CVNN		->	CVNN
> - CVNN		->	CVVV
> 
> - CVVV		->	CVNN
> - CVVV		->	CVVV
> 
> 20191029
> - add kconfig F2FS_FS_COMPRESSION to isolate compression related
> codes, add kconfig F2FS_FS_{LZO,LZ4} to cover backend algorithm.
> note that: will remove lzo backend if Jaegeuk agreed that too.
> - update codes according to Eric's comments.
> 
> 20191101
> - apply fixes from Jaegeuk
> 
> [Jaegeuk Kim]
> - add tracepoint for f2fs_{,de}compress_pages()
> - fix many bugs and add some compression stats
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  Documentation/filesystems/f2fs.txt |   52 ++
>  fs/f2fs/Kconfig                    |   23 +
>  fs/f2fs/Makefile                   |    1 +
>  fs/f2fs/compress.c                 | 1098 ++++++++++++++++++++++++++++
>  fs/f2fs/data.c                     |  549 ++++++++++++--
>  fs/f2fs/debug.c                    |    6 +
>  fs/f2fs/f2fs.h                     |  245 ++++++-
>  fs/f2fs/file.c                     |  191 ++++-
>  fs/f2fs/inode.c                    |   43 ++
>  fs/f2fs/namei.c                    |   59 ++
>  fs/f2fs/segment.c                  |    5 +-
>  fs/f2fs/segment.h                  |   12 -
>  fs/f2fs/super.c                    |  112 ++-
>  fs/f2fs/sysfs.c                    |    7 +
>  include/linux/f2fs_fs.h            |   11 +
>  include/trace/events/f2fs.h        |   99 +++
>  16 files changed, 2397 insertions(+), 116 deletions(-)
>  create mode 100644 fs/f2fs/compress.c
> 
> diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
> index 29020af0cff9..228af93f850b 100644
> --- a/Documentation/filesystems/f2fs.txt
> +++ b/Documentation/filesystems/f2fs.txt
> @@ -235,6 +235,17 @@ checkpoint=%s[:%u[%]]     Set to "disable" to turn off checkpointing. Set to "en
>                         hide up to all remaining free space. The actual space that
>                         would be unusable can be viewed at /sys/fs/f2fs/<disk>/unusable
>                         This space is reclaimed once checkpoint=enable.
> +compress_algorithm=%s  Control compress algorithm, currently f2fs supports "lzo"
> +                       and "lz4" algorithm.
> +compress_log_size=%u   Support configuring compress cluster size, the size will
> +                       be 4KB * (1 << %u), 16KB is minimum size, also it's
> +                       default size.
> +compress_extension=%s  Support adding specified extension, so that f2fs can enable
> +                       compression on those corresponding files, e.g. if all files
> +                       with '.ext' has high compression rate, we can set the '.ext'
> +                       on compression extension list and enable compression on
> +                       these file by default rather than to enable it via ioctl.
> +                       For other files, we can still enable compression via ioctl.
>  
>  ================================================================================
>  DEBUGFS ENTRIES
> @@ -837,3 +848,44 @@ zero or random data, which is useful to the below scenario where:
>   4. address = fibmap(fd, offset)
>   5. open(blkdev)
>   6. write(blkdev, address)
> +
> +Compression implementation
> +--------------------------
> +
> +- New term named cluster is defined as basic unit of compression, file can
> +be divided into multiple clusters logically. One cluster includes 4 << n
> +(n >= 0) logical pages, compression size is also cluster size, each of
> +cluster can be compressed or not.
> +
> +- In cluster metadata layout, one special block address is used to indicate
> +cluster is compressed one or normal one, for compressed cluster, following
> +metadata maps cluster to [1, 4 << n - 1] physical blocks, in where f2fs
> +stores data including compress header and compressed data.
> +
> +- In order to eliminate write amplification during overwrite, F2FS only
> +support compression on write-once file, data can be compressed only when
> +all logical blocks in file are valid and cluster compress ratio is lower
> +than specified threshold.
> +
> +- To enable compression on regular inode, there are three ways:
> +* chattr +c file
> +* chattr +c dir; touch dir/file
> +* mount w/ -o compress_extension=ext; touch file.ext
> +
> +Compress metadata layout:
> +                             [Dnode Structure]
> +             +-----------------------------------------------+
> +             | cluster 1 | cluster 2 | ......... | cluster N |
> +             +-----------------------------------------------+
> +             .           .                       .           .
> +       .                       .                .                      .
> +  .         Compressed Cluster       .        .        Normal Cluster            .
> ++----------+---------+---------+---------+  +---------+---------+---------+---------+
> +|compr flag| block 1 | block 2 | block 3 |  | block 1 | block 2 | block 3 | block 4 |
> ++----------+---------+---------+---------+  +---------+---------+---------+---------+
> +           .                             .
> +         .                                           .
> +       .                                                           .
> +      +-------------+-------------+----------+----------------------------+
> +      | data length | data chksum | reserved |      compressed data       |
> +      +-------------+-------------+----------+----------------------------+
> diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
> index 652fd2e2b23d..6087a5577613 100644
> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -92,3 +92,26 @@ config F2FS_FAULT_INJECTION
>  	  Test F2FS to inject faults such as ENOMEM, ENOSPC, and so on.
>  
>  	  If unsure, say N.
> +
> +config F2FS_FS_COMPRESSION
> +	bool "F2FS compression feature"
> +	depends on F2FS_FS
> +	help
> +	  Enable filesystem-level compression on f2fs regular files,
> +	  multiple back-end compression algorithms are supported.
> +
> +config F2FS_FS_LZO
> +	bool "LZO compression support" if F2FS_FS_COMPRESSION
> +	select LZO_COMPRESS
> +	select LZO_DECOMPRESS
> +	default y
> +	help
> +	  Support LZO compress algorithm, if unsure, say Y.
> +
> +config F2FS_FS_LZ4
> +	bool "LZ4 compression support" if F2FS_FS_COMPRESSION
> +	select LZ4_COMPRESS
> +	select LZ4_DECOMPRESS
> +	default y
> +	help
> +	  Support LZ4 compress algorithm, if unsure, say Y.
> diff --git a/fs/f2fs/Makefile b/fs/f2fs/Makefile
> index 2aaecc63834f..ee7316b42f69 100644
> --- a/fs/f2fs/Makefile
> +++ b/fs/f2fs/Makefile
> @@ -9,3 +9,4 @@ f2fs-$(CONFIG_F2FS_FS_XATTR) += xattr.o
>  f2fs-$(CONFIG_F2FS_FS_POSIX_ACL) += acl.o
>  f2fs-$(CONFIG_F2FS_IO_TRACE) += trace.o
>  f2fs-$(CONFIG_FS_VERITY) += verity.o
> +f2fs-$(CONFIG_F2FS_FS_COMPRESSION) += compress.o
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> new file mode 100644
> index 000000000000..5e65aef72c46
> --- /dev/null
> +++ b/fs/f2fs/compress.c
> @@ -0,0 +1,1098 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * f2fs compress support
> + *
> + * Copyright (c) 2019 Chao Yu <chao@kernel.org>
> + */
> +
> +#include <linux/fs.h>
> +#include <linux/f2fs_fs.h>
> +#include <linux/writeback.h>
> +#include <linux/lzo.h>
> +#include <linux/lz4.h>
> +
> +#include "f2fs.h"
> +#include "node.h"
> +#include <trace/events/f2fs.h>
> +
> +struct f2fs_compress_ops {
> +	int (*init_compress_ctx)(struct compress_ctx *cc);
> +	void (*destroy_compress_ctx)(struct compress_ctx *cc);
> +	int (*compress_pages)(struct compress_ctx *cc);
> +	int (*decompress_pages)(struct decompress_io_ctx *dic);
> +};
> +
> +static unsigned int offset_in_cluster(struct compress_ctx *cc, pgoff_t index)
> +{
> +	return index & (cc->cluster_size - 1);
> +}
> +
> +static unsigned int cluster_idx(struct compress_ctx *cc, pgoff_t index)
> +{
> +	return index >> cc->log_cluster_size;
> +}
> +
> +static unsigned int start_idx_of_cluster(struct compress_ctx *cc)
> +{
> +	return cc->cluster_idx << cc->log_cluster_size;
> +}
> +
> +bool f2fs_is_compressed_page(struct page *page)
> +{
> +	if (!PagePrivate(page))
> +		return false;
> +	if (!page_private(page))
> +		return false;
> +	if (IS_ATOMIC_WRITTEN_PAGE(page) || IS_DUMMY_WRITTEN_PAGE(page))
> +		return false;
> +	f2fs_bug_on(F2FS_M_SB(page->i_mapping),
> +		*((u32 *)page_private(page)) == F2FS_COMPRESSED_PAGE_MAGIC);
> +	return true;
> +}
> +
> +static void f2fs_set_compressed_page(struct page *page,
> +		struct inode *inode, pgoff_t index, void *data, refcount_t *r)
> +{
> +	SetPagePrivate(page);
> +	set_page_private(page, (unsigned long)data);
> +
> +	/* i_crypto_info and iv index */
> +	page->index = index;
> +	page->mapping = inode->i_mapping;
> +	if (r)
> +		refcount_inc(r);
> +}
> +
> +static void f2fs_put_compressed_page(struct page *page)
> +{
> +	set_page_private(page, (unsigned long)NULL);
> +	ClearPagePrivate(page);
> +	page->mapping = NULL;
> +	unlock_page(page);
> +	put_page(page);
> +}
> +
> +struct page *f2fs_compress_control_page(struct page *page)
> +{
> +	return ((struct compress_io_ctx *)page_private(page))->rpages[0];
> +}
> +
> +int f2fs_init_compress_ctx(struct compress_ctx *cc)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
> +
> +	if (cc->nr_rpages)
> +		return 0;
> +
> +	cc->rpages = f2fs_kzalloc(sbi, sizeof(struct page *) <<
> +					cc->log_cluster_size, GFP_NOFS);
> +	if (!cc->rpages)
> +		return -ENOMEM;
> +	return 0;
> +}
> +
> +void f2fs_destroy_compress_ctx(struct compress_ctx *cc)
> +{
> +	f2fs_reset_compress_ctx(cc);
> +	kfree(cc->rpages);
> +}
> +
> +void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page)
> +{
> +	unsigned int cluster_ofs;
> +
> +	if (!f2fs_cluster_can_merge_page(cc, page->index))
> +		f2fs_bug_on(F2FS_I(cc->inode), 1);
> +
> +	cluster_ofs = offset_in_cluster(cc, page->index);
> +	cc->rpages[cluster_ofs] = page;
> +	cc->nr_rpages++;
> +	cc->cluster_idx = cluster_idx(cc, page->index);
> +}
> +
> +#ifdef CONFIG_F2FS_FS_LZO
> +static int lzo_init_compress_ctx(struct compress_ctx *cc)
> +{
> +	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
> +				LZO1X_MEM_COMPRESS, GFP_NOFS);
> +	if (!cc->private)
> +		return -ENOMEM;
> +
> +	cc->clen = lzo1x_worst_compress(PAGE_SIZE << cc->log_cluster_size);
> +	return 0;
> +}
> +
> +static void lzo_destroy_compress_ctx(struct compress_ctx *cc)
> +{
> +	kvfree(cc->private);
> +	cc->private = NULL;
> +}
> +
> +static int lzo_compress_pages(struct compress_ctx *cc)
> +{
> +	int ret;
> +
> +	ret = lzo1x_1_compress(cc->rbuf, cc->rlen, cc->cbuf->cdata,
> +					&cc->clen, cc->private);
> +	if (ret != LZO_E_OK) {
> +		printk_ratelimited("%sF2FS-fs (%s): lzo compress failed, ret:%d\n",
> +				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id, ret);
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +static int lzo_decompress_pages(struct decompress_io_ctx *dic)
> +{
> +	int ret;
> +
> +	ret = lzo1x_decompress_safe(dic->cbuf->cdata, dic->clen,
> +						dic->rbuf, &dic->rlen);
> +	if (ret != LZO_E_OK) {
> +		printk_ratelimited("%sF2FS-fs (%s): lzo decompress failed, ret:%d\n",
> +				KERN_ERR, F2FS_I_SB(dic->inode)->sb->s_id, ret);
> +		return -EIO;
> +	}
> +
> +	if (dic->rlen != PAGE_SIZE << dic->log_cluster_size) {
> +		printk_ratelimited("%sF2FS-fs (%s): lzo invalid rlen:%zu, "
> +					"expected:%lu\n", KERN_ERR,
> +					F2FS_I_SB(dic->inode)->sb->s_id,
> +					dic->rlen,
> +					PAGE_SIZE << dic->log_cluster_size);
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +static const struct f2fs_compress_ops f2fs_lzo_ops = {
> +	.init_compress_ctx	= lzo_init_compress_ctx,
> +	.destroy_compress_ctx	= lzo_destroy_compress_ctx,
> +	.compress_pages		= lzo_compress_pages,
> +	.decompress_pages	= lzo_decompress_pages,
> +};
> +#endif
> +
> +#ifdef CONFIG_F2FS_FS_LZ4
> +static int lz4_init_compress_ctx(struct compress_ctx *cc)
> +{
> +	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
> +				LZ4_MEM_COMPRESS, GFP_NOFS);
> +	if (!cc->private)
> +		return -ENOMEM;
> +
> +	cc->clen = LZ4_compressBound(PAGE_SIZE << cc->log_cluster_size);
> +	return 0;
> +}
> +
> +static void lz4_destroy_compress_ctx(struct compress_ctx *cc)
> +{
> +	kvfree(cc->private);
> +	cc->private = NULL;
> +}
> +
> +static int lz4_compress_pages(struct compress_ctx *cc)
> +{
> +	int len;
> +
> +	len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
> +						cc->clen, cc->private);
> +	if (!len) {
> +		printk_ratelimited("%sF2FS-fs (%s): lz4 compress failed\n",
> +				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id);
> +		return -EIO;
> +	}
> +	cc->clen = len;
> +	return 0;
> +}
> +
> +static int lz4_decompress_pages(struct decompress_io_ctx *dic)
> +{
> +	int ret;
> +
> +	ret = LZ4_decompress_safe(dic->cbuf->cdata, dic->rbuf,
> +						dic->clen, dic->rlen);
> +	if (ret < 0) {
> +		printk_ratelimited("%sF2FS-fs (%s): lz4 decompress failed, ret:%d\n",
> +				KERN_ERR, F2FS_I_SB(dic->inode)->sb->s_id, ret);
> +		return -EIO;
> +	}
> +
> +	if (ret != PAGE_SIZE << dic->log_cluster_size) {
> +		printk_ratelimited("%sF2FS-fs (%s): lz4 invalid rlen:%zu, "
> +					"expected:%lu\n", KERN_ERR,
> +					F2FS_I_SB(dic->inode)->sb->s_id,
> +					dic->rlen,
> +					PAGE_SIZE << dic->log_cluster_size);
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +static const struct f2fs_compress_ops f2fs_lz4_ops = {
> +	.init_compress_ctx	= lz4_init_compress_ctx,
> +	.destroy_compress_ctx	= lz4_destroy_compress_ctx,
> +	.compress_pages		= lz4_compress_pages,
> +	.decompress_pages	= lz4_decompress_pages,
> +};
> +#endif
> +
> +static const struct f2fs_compress_ops *f2fs_cops[COMPRESS_MAX] = {
> +#ifdef CONFIG_F2FS_FS_LZO
> +	&f2fs_lzo_ops,
> +#else
> +	NULL,
> +#endif
> +#ifdef CONFIG_F2FS_FS_LZ4
> +	&f2fs_lz4_ops,
> +#else
> +	NULL,
> +#endif
> +};
> +
> +bool f2fs_is_compress_backend_ready(struct inode *inode)
> +{
> +	if (!f2fs_compressed_file(inode))
> +		return true;
> +	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
> +}
> +
> +static struct page *f2fs_grab_page(void)
> +{
> +	struct page *page;
> +
> +	page = alloc_page(GFP_NOFS);
> +	if (!page)
> +		return NULL;
> +	lock_page(page);
> +	return page;
> +}
> +
> +static int f2fs_compress_pages(struct compress_ctx *cc)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
> +	struct f2fs_inode_info *fi = F2FS_I(cc->inode);
> +	const struct f2fs_compress_ops *cops =
> +				f2fs_cops[fi->i_compress_algorithm];
> +	unsigned int max_len, nr_cpages;
> +	int i, ret;
> +
> +	trace_f2fs_compress_pages_start(cc->inode, cc->cluster_idx,
> +				cc->cluster_size, fi->i_compress_algorithm);
> +
> +	ret = cops->init_compress_ctx(cc);
> +	if (ret)
> +		goto out;
> +
> +	max_len = COMPRESS_HEADER_SIZE + cc->clen;
> +	cc->nr_cpages = DIV_ROUND_UP(max_len, PAGE_SIZE);
> +
> +	cc->cpages = f2fs_kzalloc(sbi, sizeof(struct page *) *
> +					cc->nr_cpages, GFP_NOFS);
> +	if (!cc->cpages) {
> +		ret = -ENOMEM;
> +		goto destroy_compress_ctx;
> +	}
> +
> +	for (i = 0; i < cc->nr_cpages; i++) {
> +		cc->cpages[i] = f2fs_grab_page();
> +		if (!cc->cpages[i]) {
> +			ret = -ENOMEM;
> +			goto out_free_cpages;
> +		}
> +	}
> +
> +	cc->rbuf = vmap(cc->rpages, cc->cluster_size, VM_MAP, PAGE_KERNEL_RO);
> +	if (!cc->rbuf) {
> +		ret = -ENOMEM;
> +		goto out_free_cpages;
> +	}
> +
> +	cc->cbuf = vmap(cc->cpages, cc->nr_cpages, VM_MAP, PAGE_KERNEL);
> +	if (!cc->cbuf) {
> +		ret = -ENOMEM;
> +		goto out_vunmap_rbuf;
> +	}
> +
> +	ret = cops->compress_pages(cc);
> +	if (ret)
> +		goto out_vunmap_cbuf;
> +
> +	max_len = PAGE_SIZE * (cc->cluster_size - 1) - COMPRESS_HEADER_SIZE;
> +
> +	if (cc->clen > max_len) {
> +		ret = -EAGAIN;
> +		goto out_vunmap_cbuf;
> +	}
> +
> +	cc->cbuf->clen = cpu_to_le32(cc->clen);
> +	cc->cbuf->chksum = cpu_to_le32(0);
> +
> +	for (i = 0; i < COMPRESS_DATA_RESERVED_SIZE; i++)
> +		cc->cbuf->reserved[i] = cpu_to_le32(0);
> +
> +	vunmap(cc->cbuf);
> +	vunmap(cc->rbuf);
> +
> +	nr_cpages = DIV_ROUND_UP(cc->clen + COMPRESS_HEADER_SIZE, PAGE_SIZE);
> +
> +	for (i = nr_cpages; i < cc->nr_cpages; i++) {
> +		f2fs_put_compressed_page(cc->cpages[i]);
> +		cc->cpages[i] = NULL;
> +	}
> +
> +	cc->nr_cpages = nr_cpages;
> +
> +	trace_f2fs_compress_pages_end(cc->inode, cc->cluster_idx,
> +							cc->clen, ret);
> +	return 0;
> +
> +out_vunmap_cbuf:
> +	vunmap(cc->cbuf);
> +out_vunmap_rbuf:
> +	vunmap(cc->rbuf);
> +out_free_cpages:
> +	for (i = 0; i < cc->nr_cpages; i++) {
> +		if (cc->cpages[i])
> +			f2fs_put_compressed_page(cc->cpages[i]);
> +	}
> +	kfree(cc->cpages);
> +	cc->cpages = NULL;
> +destroy_compress_ctx:
> +	cops->destroy_compress_ctx(cc);
> +out:
> +	trace_f2fs_compress_pages_end(cc->inode, cc->cluster_idx,
> +							cc->clen, ret);
> +	return ret;
> +}
> +
> +void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
> +{
> +	struct decompress_io_ctx *dic =
> +			(struct decompress_io_ctx *)page_private(page);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
> +	struct f2fs_inode_info *fi= F2FS_I(dic->inode);
> +	const struct f2fs_compress_ops *cops =
> +			f2fs_cops[fi->i_compress_algorithm];
> +	int ret;
> +
> +	dec_page_count(sbi, F2FS_RD_DATA);
> +
> +	if (bio->bi_status)
> +		dic->failed = true;
> +
> +	if (refcount_dec_not_one(&dic->ref))
> +		return;
> +
> +	trace_f2fs_decompress_pages_start(dic->inode, dic->cluster_idx,
> +				dic->cluster_size, fi->i_compress_algorithm);
> +
> +	/* submit partial compressed pages */
> +	if (dic->failed) {
> +		ret = -EIO;
> +		goto out_free_dic;
> +	}
> +
> +	dic->rbuf = vmap(dic->tpages, dic->cluster_size, VM_MAP, PAGE_KERNEL);
> +	if (!dic->rbuf) {
> +		ret = -ENOMEM;
> +		goto out_free_dic;
> +	}
> +
> +	dic->cbuf = vmap(dic->cpages, dic->nr_cpages, VM_MAP, PAGE_KERNEL_RO);
> +	if (!dic->cbuf) {
> +		ret = -ENOMEM;
> +		goto out_vunmap_rbuf;
> +	}
> +
> +	dic->clen = le32_to_cpu(dic->cbuf->clen);
> +	dic->rlen = PAGE_SIZE << dic->log_cluster_size;
> +
> +	if (dic->clen > PAGE_SIZE * dic->nr_cpages - COMPRESS_HEADER_SIZE) {
> +		ret = -EFSCORRUPTED;
> +		goto out_vunmap_cbuf;
> +	}
> +
> +	ret = cops->decompress_pages(dic);
> +
> +out_vunmap_cbuf:
> +	vunmap(dic->cbuf);
> +out_vunmap_rbuf:
> +	vunmap(dic->rbuf);
> +out_free_dic:
> +	f2fs_set_cluster_uptodate(dic->rpages, dic->cluster_size, ret, verity);
> +	trace_f2fs_decompress_pages_end(dic->inode, dic->cluster_idx,
> +								dic->clen, ret);
> +	f2fs_free_dic(dic);
> +}
> +
> +static bool is_page_in_cluster(struct compress_ctx *cc, pgoff_t index)
> +{
> +	if (cc->cluster_idx == NULL_CLUSTER)
> +		return true;
> +	return cc->cluster_idx == cluster_idx(cc, index);
> +}
> +
> +bool f2fs_cluster_is_empty(struct compress_ctx *cc)
> +{
> +	return cc->nr_rpages == 0;
> +}
> +
> +static bool f2fs_cluster_is_full(struct compress_ctx *cc)
> +{
> +	return cc->cluster_size == cc->nr_rpages;
> +}
> +
> +bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index)
> +{
> +	if (f2fs_cluster_is_empty(cc))
> +		return true;
> +	return is_page_in_cluster(cc, index);
> +}
> +
> +static bool __cluster_may_compress(struct compress_ctx *cc)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
> +	loff_t i_size = i_size_read(cc->inode);
> +	unsigned nr_pages = DIV_ROUND_UP(i_size, PAGE_SIZE);
> +	int i;
> +
> +	for (i = 0; i < cc->cluster_size; i++) {
> +		struct page *page = cc->rpages[i];
> +
> +		f2fs_bug_on(sbi, !page);
> +
> +		if (unlikely(f2fs_cp_error(sbi)))
> +			return false;
> +		if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> +			return false;
> +
> +		/* beyond EOF */
> +		if (page->index >= nr_pages)
> +			return false;
> +		if (page->index != start_idx_of_cluster(cc) + i)
> +			return false;
> +	}
> +	return true;
> +}
> +
> +int is_compressed_cluster(struct compress_ctx *cc, pgoff_t index)
> +{
> +	struct dnode_of_data dn;
> +	unsigned int start_idx = cluster_idx(cc, index) <<
> +					cc->log_cluster_size;
> +	int ret;
> +	int i;
> +
> +	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
> +	ret = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
> +	if (ret) {
> +		if (ret == -ENOENT)
> +			ret = 0;
> +		goto  fail;

Removed a space.

> +	}
> +
> +	if (dn.data_blkaddr == COMPRESS_ADDR) {
> +		ret = CLUSTER_IS_FULL;
> +		for (i = 1; i < cc->cluster_size; i++) {
> +			block_t blkaddr;
> +
> +			blkaddr = datablock_addr(dn.inode,
> +					dn.node_page, dn.ofs_in_node + i);
> +			if (blkaddr == NULL_ADDR) {
> +				ret = CLUSTER_HAS_SPACE;
> +				break;
> +			}
> +		}
> +	}
> +fail:
> +	f2fs_put_dnode(&dn);
> +	return ret;
> +}
> +
> +int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index)
> +{
> +	struct compress_ctx cc = {
> +		.inode = inode,
> +		.log_cluster_size = F2FS_I(inode)->i_log_cluster_size,
> +		.cluster_size = F2FS_I(inode)->i_cluster_size,
> +	};
> +
> +	return is_compressed_cluster(&cc, index);
> +}
> +
> +static bool cluster_may_compress(struct compress_ctx *cc)
> +{
> +	if (!f2fs_compressed_file(cc->inode))
> +		return false;
> +	if (f2fs_is_atomic_file(cc->inode))
> +		return false;
> +	if (f2fs_is_mmap_file(cc->inode))
> +		return false;
> +	if (!f2fs_cluster_is_full(cc))
> +		return false;
> +	return __cluster_may_compress(cc);
> +}
> +
> +void f2fs_reset_compress_ctx(struct compress_ctx *cc)
> +{
> +	cc->nr_rpages = 0;
> +	cc->nr_cpages = 0;
> +	cc->cluster_idx = NULL_CLUSTER;
> +}
> +
> +static void set_cluster_writeback(struct compress_ctx *cc)
> +{
> +	int i;
> +
> +	for (i = 0; i < cc->cluster_size; i++) {
> +		if (cc->rpages[i])
> +			set_page_writeback(cc->rpages[i]);
> +	}
> +}
> +
> +static void set_cluster_dirty(struct compress_ctx *cc)
> +{
> +	int i;
> +
> +	for (i = 0; i < cc->cluster_size; i++)
> +		if (cc->rpages[i])
> +			set_page_dirty(cc->rpages[i]);
> +}
> +
> +static int prepare_compress_overwrite(struct compress_ctx *cc,
> +		struct page **pagep, pgoff_t index, void **fsdata,
> +		bool prealloc)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
> +	struct bio *bio = NULL;
> +	struct address_space *mapping = cc->inode->i_mapping;
> +	struct page *page;
> +	struct dnode_of_data dn;
> +	sector_t last_block_in_bio;
> +	unsigned fgp_flag = FGP_LOCK | FGP_WRITE | FGP_CREAT;
> +	unsigned int start_idx = cluster_idx(cc, index) << cc->log_cluster_size;
> +	int i, idx;
> +	int ret;
> +
> +	ret = f2fs_init_compress_ctx(cc);
> +	if (ret)
> +		goto out;
> +retry:
> +	/* keep page reference to avoid page reclaim */
> +	for (i = 0; i < cc->cluster_size; i++) {
> +		page = f2fs_pagecache_get_page(mapping, start_idx + i,
> +							fgp_flag, GFP_NOFS);
> +		if (!page) {
> +			ret = -ENOMEM;
> +			goto unlock_pages;
> +		}
> +
> +		if (PageUptodate(page)) {
> +			unlock_page(page);
> +			continue;
> +		}
> +
> +		f2fs_compress_ctx_add_page(cc, page);
> +	}
> +
> +	if (!f2fs_cluster_is_empty(cc)) {
> +		ret = f2fs_read_multi_pages(cc, &bio, cc->cluster_size,
> +						&last_block_in_bio, false);
> +		if (ret)
> +			goto out;
> +
> +		if (bio)
> +			f2fs_submit_bio(sbi, bio, DATA);
> +
> +		ret = f2fs_init_compress_ctx(cc);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	for (i = 0; i < cc->cluster_size; i++) {
> +		page = find_lock_page(mapping, start_idx + i);
> +		f2fs_bug_on(sbi, !page);
> +
> +		f2fs_wait_on_page_writeback(page, DATA, true, true);
> +
> +		cc->rpages[i] = page;
> +		f2fs_put_page(page, 0);
> +
> +		if (!PageUptodate(page)) {
> +			for (idx = i; idx >= 0; idx--) {
> +				f2fs_put_page(cc->rpages[idx], 0);
> +				f2fs_put_page(cc->rpages[idx], 1);
> +			}
> +			goto retry;
> +		}
> +	}
> +
> +	if (prealloc) {
> +		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
> +
> +		set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
> +
> +		for (i = cc->cluster_size - 1; i > 0; i--) {
> +			ret = f2fs_get_block(&dn, start_idx + i);
> +			if (ret)
> +				/* TODO: release preallocate blocks */
> +				goto release_pages;
> +
> +			if (dn.data_blkaddr != NEW_ADDR)
> +				break;
> +		}
> +
> +		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
> +	}
> +
> +	*fsdata = cc->rpages;
> +	*pagep = cc->rpages[offset_in_cluster(cc, index)];
> +	return CLUSTER_IS_FULL;
> +
> +unlock_pages:
> +	for (idx = 0; idx < i; idx++) {
> +		if (cc->rpages[idx])
> +			unlock_page(cc->rpages[idx]);
> +	}
> +release_pages:
> +	for (idx = 0; idx < i; idx++) {
> +		page = find_lock_page(mapping, start_idx + idx);
> +		f2fs_put_page(page, 0);
> +		f2fs_put_page(page, 1);
> +	}
> +	f2fs_destroy_compress_ctx(cc);
> +out:
> +	return ret;
> +}
> +
> +int f2fs_prepare_compress_overwrite(struct inode *inode,
> +		struct page **pagep, pgoff_t index, void **fsdata)
> +{
> +	struct compress_ctx cc = {
> +		.inode = inode,
> +		.cluster_size = F2FS_I(inode)->i_cluster_size,
> +		.cluster_idx = NULL_CLUSTER,
> +		.rpages = NULL,
> +		.nr_rpages = 0,
> +	};
> +	int ret = is_compressed_cluster(&cc, index);
> +
> +	if (ret <= 0)
> +		return ret;
> +
> +	/* compressed case */
> +	return prepare_compress_overwrite(&cc, pagep, index,
> +			fsdata, ret == CLUSTER_HAS_SPACE);
> +}
> +
> +bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
> +					pgoff_t index, bool written)
> +
> +{
> +	struct compress_ctx cc = {
> +		.log_cluster_size = F2FS_I(inode)->i_log_cluster_size,
> +		.cluster_size = F2FS_I(inode)->i_cluster_size,
> +		.rpages = fsdata,
> +	};
> +	bool first_index = (index == cc.rpages[0]->index);
> +	int i;
> +
> +	if (written)
> +		set_cluster_dirty(&cc);
> +
> +	for (i = 0; i < cc.cluster_size; i++)
> +		f2fs_put_page(cc.rpages[i], 1);
> +
> +	f2fs_destroy_compress_ctx(&cc);
> +
> +	return first_index;
> +
> +}
> +
> +static int f2fs_write_compressed_pages(struct compress_ctx *cc,
> +					int *submitted,
> +					struct writeback_control *wbc,
> +					enum iostat_type io_type)
> +{
> +	struct inode *inode = cc->inode;
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	struct f2fs_io_info fio = {
> +		.sbi = sbi,
> +		.ino = cc->inode->i_ino,
> +		.type = DATA,
> +		.op = REQ_OP_WRITE,
> +		.op_flags = wbc_to_write_flags(wbc),
> +		.old_blkaddr = NEW_ADDR,
> +		.page = NULL,
> +		.encrypted_page = NULL,
> +		.compressed_page = NULL,
> +		.submitted = false,
> +		.need_lock = LOCK_RETRY,
> +		.io_type = io_type,
> +		.io_wbc = wbc,
> +		.compressed = true,
> +		.encrypted = f2fs_encrypted_file(cc->inode),
> +	};
> +	struct dnode_of_data dn;
> +	struct node_info ni;
> +	struct compress_io_ctx *cic;
> +	unsigned int start_idx = start_idx_of_cluster(cc);
> +	unsigned int last_index = cc->cluster_size - 1;
> +	loff_t psize;
> +	int pre_compressed_blocks = 0;
> +	int i, err;
> +
> +	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
> +
> +	f2fs_lock_op(sbi);
> +
> +	err = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
> +	if (err)
> +		goto out_unlock_op;
> +
> +	psize = (cc->rpages[last_index]->index + 1) << PAGE_SHIFT;
> +
> +	err = f2fs_get_node_info(fio.sbi, dn.nid, &ni);
> +	if (err)
> +		goto out_put_dnode;
> +
> +	fio.version = ni.version;
> +
> +	cic = f2fs_kzalloc(sbi, sizeof(struct compress_io_ctx), GFP_NOFS);
> +	if (!cic)
> +		goto out_put_dnode;
> +
> +	cic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
> +	cic->inode = inode;
> +	refcount_set(&cic->ref, 1);
> +	cic->rpages = cc->rpages;
> +	cic->nr_rpages = cc->cluster_size;
> +
> +	for (i = 0; i < cc->nr_cpages; i++) {
> +		f2fs_set_compressed_page(cc->cpages[i], inode,
> +					cc->rpages[i + 1]->index,
> +					cic, i ? &cic->ref : NULL);
> +		fio.compressed_page = cc->cpages[i];
> +		if (fio.encrypted) {
> +			fio.page = cc->rpages[i + 1];
> +			err = f2fs_encrypt_one_page(&fio);
> +			if (err)
> +				goto out_destroy_crypt;
> +			cc->cpages[i] = fio.encrypted_page;
> +		}
> +	}
> +
> +	set_cluster_writeback(cc);
> +
> +	for (i = 0; i < cc->cluster_size; i++, dn.ofs_in_node++) {
> +		block_t blkaddr;
> +
> +		blkaddr = datablock_addr(dn.inode, dn.node_page,
> +							dn.ofs_in_node);
> +		fio.page = cc->rpages[i];
> +		fio.old_blkaddr = blkaddr;
> +
> +		/* cluster header */
> +		if (i == 0) {
> +			if (blkaddr == COMPRESS_ADDR)
> +				pre_compressed_blocks++;
> +			if (__is_valid_data_blkaddr(blkaddr))
> +				f2fs_invalidate_blocks(sbi, blkaddr);
> +			f2fs_update_data_blkaddr(&dn, COMPRESS_ADDR);
> +			goto unlock_continue;
> +		}
> +
> +		if (pre_compressed_blocks && __is_valid_data_blkaddr(blkaddr))
> +			pre_compressed_blocks++;
> +
> +		if (i > cc->nr_cpages) {
> +			if (__is_valid_data_blkaddr(blkaddr)) {
> +				f2fs_invalidate_blocks(sbi, blkaddr);
> +				f2fs_update_data_blkaddr(&dn, NEW_ADDR);
> +			}
> +			goto unlock_continue;
> +		}
> +
> +		f2fs_bug_on(fio.sbi, blkaddr == NULL_ADDR);
> +
> +
> +		if (fio.encrypted)
> +			fio.encrypted_page = cc->cpages[i - 1];
> +		else if (fio.compressed)
> +			fio.compressed_page = cc->cpages[i - 1];
> +		else
> +			f2fs_bug_on(sbi, 1);
> +		cc->cpages[i - 1] = NULL;
> +		f2fs_outplace_write_data(&dn, &fio);
> +		(*submitted)++;
> +unlock_continue:
> +		inode_dec_dirty_pages(cc->inode);
> +		unlock_page(fio.page);
> +	}
> +
> +	if (pre_compressed_blocks) {
> +		stat_sub_compr_blocks(inode,
> +			cc->cluster_size - pre_compressed_blocks + 1);
> +		F2FS_I(inode)->i_compressed_blocks -=
> +			(cc->cluster_size - pre_compressed_blocks + 1);
> +	}
> +	stat_add_compr_blocks(inode, cc->cluster_size - cc->nr_cpages);
> +	F2FS_I(inode)->i_compressed_blocks += cc->cluster_size - cc->nr_cpages;
> +	f2fs_mark_inode_dirty_sync(inode, true);
> +
> +	set_inode_flag(cc->inode, FI_APPEND_WRITE);
> +	if (cc->cluster_idx == 0)
> +		set_inode_flag(inode, FI_FIRST_BLOCK_WRITTEN);
> +
> +	f2fs_put_dnode(&dn);
> +	f2fs_unlock_op(sbi);
> +
> +	if (err) {
> +		file_set_keep_isize(inode);
> +	} else {
> +		down_write(&fi->i_sem);
> +		if (fi->last_disk_size < psize)
> +			fi->last_disk_size = psize;
> +		up_write(&fi->i_sem);
> +	}
> +	return 0;
> +
> +out_destroy_crypt:
> +	for (i -= 1; i >= 0; i--)
> +		fscrypt_finalize_bounce_page(&cc->cpages[i]);
> +	for (i = 0; i < cc->nr_cpages; i++) {
> +		if (!cc->cpages[i])
> +			continue;
> +		f2fs_put_page(cc->cpages[i], 1);
> +	}
> +out_put_dnode:
> +	f2fs_put_dnode(&dn);
> +out_unlock_op:
> +	f2fs_unlock_op(sbi);
> +	return -EAGAIN;
> +}
> +
> +void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
> +{
> +	struct f2fs_sb_info *sbi = bio->bi_private;
> +	struct compress_io_ctx *cic =
> +			(struct compress_io_ctx *)page_private(page);
> +	int i;
> +
> +	if (unlikely(bio->bi_status))
> +		mapping_set_error(cic->inode->i_mapping, -EIO);
> +
> +	f2fs_put_compressed_page(page);
> +
> +	dec_page_count(sbi, F2FS_WB_DATA);
> +
> +	if (refcount_dec_not_one(&cic->ref))
> +		return;
> +
> +	for (i = 0; i < cic->nr_rpages; i++) {
> +		WARN_ON(!cic->rpages[i]);
> +		clear_cold_data(cic->rpages[i]);
> +		end_page_writeback(cic->rpages[i]);
> +	}
> +
> +	kfree(cic->rpages);
> +	kfree(cic);
> +}
> +
> +static int f2fs_write_raw_pages(struct compress_ctx *cc,
> +					int *submitted,
> +					struct writeback_control *wbc,
> +					enum iostat_type io_type)
> +{
> +	int i, _submitted;
> +	int ret, err = 0;
> +
> +	for (i = 0; i < cc->cluster_size; i++) {
> +		if (!cc->rpages[i])
> +			continue;
> +		BUG_ON(!PageLocked(cc->rpages[i]));
> +		ret = f2fs_write_single_data_page(cc->rpages[i], &_submitted,
> +						NULL, NULL, wbc, io_type);
> +		if (ret) {
> +			if (ret == AOP_WRITEPAGE_ACTIVATE)
> +				unlock_page(cc->rpages[i]);
> +			err = ret;
> +			goto out_fail;
> +		}
> +
> +		*submitted += _submitted;
> +	}
> +	return 0;
> +
> +out_fail:
> +	/* TODO: revoke partially updated block addresses */
> +	for (++i; i < cc->cluster_size; i++) {
> +		if (!cc->rpages[i])
> +			continue;
> +		redirty_page_for_writepage(wbc, cc->rpages[i]);
> +		unlock_page(cc->rpages[i]);
> +	}
> +	return err;
> +}
> +
> +int f2fs_write_multi_pages(struct compress_ctx *cc,
> +					int *submitted,
> +					struct writeback_control *wbc,
> +					enum iostat_type io_type)
> +{
> +	struct f2fs_inode_info *fi = F2FS_I(cc->inode);
> +	const struct f2fs_compress_ops *cops =
> +			f2fs_cops[fi->i_compress_algorithm];
> +	int err = -EAGAIN;
> +
> +	*submitted = 0;
> +
> +	if (cluster_may_compress(cc)) {
> +		err = f2fs_compress_pages(cc);
> +		if (err) {
> +			err = -EAGAIN;
> +			goto write;
> +		}
> +		err = f2fs_write_compressed_pages(cc, submitted,
> +							wbc, io_type);
> +		cops->destroy_compress_ctx(cc);
> +	}
> +write:
> +	if (err == -EAGAIN) {
> +		bool compressed = false;
> +
> +		f2fs_bug_on(F2FS_I_SB(cc->inode), *submitted);
> +		if (is_compressed_cluster(cc, start_idx_of_cluster(cc)))
> +			compressed = true;
> +
> +		err = f2fs_write_raw_pages(cc, submitted, wbc, io_type);
> +		if (compressed) {
> +			stat_sub_compr_blocks(cc->inode, *submitted);
> +			F2FS_I(cc->inode)->i_compressed_blocks -= *submitted;
> +			f2fs_mark_inode_dirty_sync(cc->inode, true);
> +		}
> +	}
> +
> +	f2fs_reset_compress_ctx(cc);
> +	return err;
> +}
> +
> +struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
> +	struct decompress_io_ctx *dic;
> +	unsigned int start_idx = start_idx_of_cluster(cc);
> +	int i;
> +
> +	dic = f2fs_kzalloc(sbi, sizeof(struct decompress_io_ctx), GFP_NOFS);
> +	if (!dic)
> +		goto out;
> +
> +	dic->inode = cc->inode;
> +	refcount_set(&dic->ref, 1);
> +	dic->cluster_idx = cc->cluster_idx;
> +	dic->cluster_size = cc->cluster_size;
> +	dic->log_cluster_size = cc->log_cluster_size;
> +	dic->nr_cpages = cc->nr_cpages;
> +	dic->failed = false;
> +
> +	dic->cpages = f2fs_kzalloc(sbi, sizeof(struct page *) *
> +					dic->nr_cpages, GFP_NOFS);
> +	if (!dic->cpages)
> +		goto out_free;
> +
> +	for (i = 0; i < dic->nr_cpages; i++) {
> +		struct page *page;
> +
> +		page = f2fs_grab_page();
> +		if (!page)
> +			goto out_free;
> +
> +		f2fs_set_compressed_page(page, cc->inode,
> +					start_idx + i + 1,
> +					dic, i ? &dic->ref : NULL);
> +		dic->cpages[i] = page;
> +	}
> +
> +	dic->tpages = f2fs_kzalloc(sbi, sizeof(struct page *) *
> +					dic->cluster_size, GFP_NOFS);
> +	if (!dic->tpages)
> +		goto out_free;
> +
> +	for (i = 0; i < dic->cluster_size; i++) {
> +		if (cc->rpages[i])
> +			continue;
> +
> +		dic->tpages[i] = f2fs_grab_page();
> +		if (!dic->tpages[i])
> +			goto out_free;
> +	}
> +
> +	for (i = 0; i < dic->cluster_size; i++) {
> +		if (dic->tpages[i])
> +			continue;
> +		dic->tpages[i] = cc->rpages[i];
> +	}
> +
> +	dic->rpages = cc->rpages;
> +	dic->nr_rpages = cc->cluster_size;
> +	return dic;
> +
> +out_free:
> +	f2fs_free_dic(dic);
> +out:
> +	return ERR_PTR(-ENOMEM);
> +}
> +
> +void f2fs_free_dic(struct decompress_io_ctx *dic)
> +{
> +	int i;
> +
> +	if (dic->tpages) {
> +		for (i = 0; i < dic->cluster_size; i++) {
> +			if (dic->rpages[i])
> +				continue;
> +			unlock_page(dic->tpages[i]);
> +			put_page(dic->tpages[i]);
> +		}
> +		kfree(dic->tpages);
> +	}
> +
> +	if (dic->cpages) {
> +		for (i = 0; i < dic->nr_cpages; i++) {
> +			if (!dic->cpages[i])
> +				continue;
> +			f2fs_put_compressed_page(dic->cpages[i]);
> +		}
> +		kfree(dic->cpages);
> +	}
> +
> +	kfree(dic->rpages);
> +	kfree(dic);
> +}
> +
> +void f2fs_set_cluster_uptodate(struct page **rpages,
> +			unsigned int cluster_size, bool err, bool verity)
> +{
> +	int i;
> +
> +	for (i = 0; i < cluster_size; i++) {
> +		struct page *rpage = rpages[i];
> +
> +		if (!rpage)
> +			continue;
> +
> +		if (err || PageError(rpage)) {
> +			ClearPageUptodate(rpage);
> +			ClearPageError(rpage);
> +		} else {
> +			if (!verity || fsverity_verify_page(rpage))
> +				SetPageUptodate(rpage);
> +			else
> +				SetPageError(rpage);
> +		}
> +		unlock_page(rpage);
> +	}
> +}
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 58f4bade6c2b..0bfd1b36141b 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -41,6 +41,9 @@ static bool __is_cp_guaranteed(struct page *page)
>  	if (!mapping)
>  		return false;
>  
> +	if (f2fs_is_compressed_page(page))
> +		return false;
> +
>  	inode = mapping->host;
>  	sbi = F2FS_I_SB(inode);
>  
> @@ -73,19 +76,19 @@ static enum count_type __read_io_type(struct page *page)
>  
>  /* postprocessing steps for read bios */
>  enum bio_post_read_step {
> -	STEP_INITIAL = 0,
>  	STEP_DECRYPT,
> +	STEP_DECOMPRESS,
>  	STEP_VERITY,
>  };
>  
>  struct bio_post_read_ctx {
>  	struct bio *bio;
> +	struct f2fs_sb_info *sbi;
>  	struct work_struct work;
> -	unsigned int cur_step;
>  	unsigned int enabled_steps;
>  };
>  
> -static void __read_end_io(struct bio *bio)
> +static void __read_end_io(struct bio *bio, bool compr, bool verity)
>  {
>  	struct page *page;
>  	struct bio_vec *bv;
> @@ -94,6 +97,13 @@ static void __read_end_io(struct bio *bio)
>  	bio_for_each_segment_all(bv, bio, iter_all) {
>  		page = bv->bv_page;
>  
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +		if (compr && PagePrivate(page)) {
> +			f2fs_decompress_pages(bio, page, verity);
> +			continue;
> +		}
> +#endif
> +
>  		/* PG_error was set if any post_read step failed */
>  		if (bio->bi_status || PageError(page)) {
>  			ClearPageUptodate(page);
> @@ -110,26 +120,52 @@ static void __read_end_io(struct bio *bio)
>  	bio_put(bio);
>  }
>  
> +static void f2fs_decompress_bio(struct bio *bio, bool verity)
> +{
> +	__read_end_io(bio, true, verity);
> +}
> +
>  static void bio_post_read_processing(struct bio_post_read_ctx *ctx);
>  
> -static void decrypt_work(struct work_struct *work)
> +static void decrypt_work(struct bio_post_read_ctx *ctx)
>  {
> -	struct bio_post_read_ctx *ctx =
> -		container_of(work, struct bio_post_read_ctx, work);
> -
>  	fscrypt_decrypt_bio(ctx->bio);
> +}
> +
> +static void decompress_work(struct bio_post_read_ctx *ctx, bool verity)
> +{
> +	f2fs_decompress_bio(ctx->bio, verity);
> +}
>  
> -	bio_post_read_processing(ctx);
> +static void verity_work(struct bio_post_read_ctx *ctx)
> +{
> +	fsverity_verify_bio(ctx->bio);
>  }
>  
> -static void verity_work(struct work_struct *work)
> +static void f2fs_post_read_work(struct work_struct *work)
>  {
>  	struct bio_post_read_ctx *ctx =
>  		container_of(work, struct bio_post_read_ctx, work);
>  
> -	fsverity_verify_bio(ctx->bio);
> +	if (ctx->enabled_steps & (1 << STEP_DECRYPT))
> +		decrypt_work(ctx);
> +
> +	if (ctx->enabled_steps & (1 << STEP_DECOMPRESS)) {
> +		decompress_work(ctx,
> +			ctx->enabled_steps & (1 << STEP_VERITY));
> +		return;
> +	}
> +
> +	if (ctx->enabled_steps & (1 << STEP_VERITY))
> +		verity_work(ctx);
>  
> -	bio_post_read_processing(ctx);
> +	__read_end_io(ctx->bio, false, false);
> +}
> +
> +static void f2fs_enqueue_post_read_work(struct f2fs_sb_info *sbi,
> +						struct work_struct *work)
> +{
> +	queue_work(sbi->post_read_wq, work);
>  }
>  
>  static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
> @@ -139,31 +175,18 @@ static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
>  	 * verity may require reading metadata pages that need decryption, and
>  	 * we shouldn't recurse to the same workqueue.
>  	 */
> -	switch (++ctx->cur_step) {
> -	case STEP_DECRYPT:
> -		if (ctx->enabled_steps & (1 << STEP_DECRYPT)) {
> -			INIT_WORK(&ctx->work, decrypt_work);
> -			fscrypt_enqueue_decrypt_work(&ctx->work);
> -			return;
> -		}
> -		ctx->cur_step++;
> -		/* fall-through */
> -	case STEP_VERITY:
> -		if (ctx->enabled_steps & (1 << STEP_VERITY)) {
> -			INIT_WORK(&ctx->work, verity_work);
> -			fsverity_enqueue_verify_work(&ctx->work);
> -			return;
> -		}
> -		ctx->cur_step++;
> -		/* fall-through */
> -	default:
> -		__read_end_io(ctx->bio);
> +
> +	if (ctx->enabled_steps) {
> +		INIT_WORK(&ctx->work, f2fs_post_read_work);
> +		f2fs_enqueue_post_read_work(ctx->sbi, &ctx->work);
> +		return;
>  	}
> +	__read_end_io(ctx->bio, false, false);
>  }
>  
>  static bool f2fs_bio_post_read_required(struct bio *bio)
>  {
> -	return bio->bi_private && !bio->bi_status;
> +	return bio->bi_private;
>  }
>  
>  static void f2fs_read_end_io(struct bio *bio)
> @@ -178,12 +201,11 @@ static void f2fs_read_end_io(struct bio *bio)
>  	if (f2fs_bio_post_read_required(bio)) {
>  		struct bio_post_read_ctx *ctx = bio->bi_private;
>  
> -		ctx->cur_step = STEP_INITIAL;
>  		bio_post_read_processing(ctx);
>  		return;
>  	}
>  
> -	__read_end_io(bio);
> +	__read_end_io(bio, false, false);
>  }
>  
>  static void f2fs_write_end_io(struct bio *bio)
> @@ -214,6 +236,13 @@ static void f2fs_write_end_io(struct bio *bio)
>  
>  		fscrypt_finalize_bounce_page(&page);
>  
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +		if (f2fs_is_compressed_page(page)) {
> +			f2fs_compress_write_end_io(bio, page);
> +			continue;
> +		}
> +#endif
> +
>  		if (unlikely(bio->bi_status)) {
>  			mapping_set_error(page->mapping, -EIO);
>  			if (type == F2FS_WB_CP_DATA)
> @@ -358,6 +387,12 @@ static inline void __submit_bio(struct f2fs_sb_info *sbi,
>  	submit_bio(bio);
>  }
>  
> +void f2fs_submit_bio(struct f2fs_sb_info *sbi,
> +				struct bio *bio, enum page_type type)
> +{
> +	__submit_bio(sbi, bio, type);
> +}
> +
>  static void __submit_merged_bio(struct f2fs_bio_info *io)
>  {
>  	struct f2fs_io_info *fio = &io->fio;
> @@ -380,7 +415,6 @@ static bool __has_merged_page(struct bio *bio, struct inode *inode,
>  						struct page *page, nid_t ino)
>  {
>  	struct bio_vec *bvec;
> -	struct page *target;
>  	struct bvec_iter_all iter_all;
>  
>  	if (!bio)
> @@ -390,10 +424,12 @@ static bool __has_merged_page(struct bio *bio, struct inode *inode,
>  		return true;
>  
>  	bio_for_each_segment_all(bvec, bio, iter_all) {
> +		struct page *target = bvec->bv_page;
>  
> -		target = bvec->bv_page;
>  		if (fscrypt_is_bounce_page(target))
>  			target = fscrypt_pagecache_page(target);
> +		if (f2fs_is_compressed_page(target))
> +			target = f2fs_compress_control_page(target);
>  
>  		if (inode && inode == target->mapping->host)
>  			return true;
> @@ -728,7 +764,12 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  
>  	verify_fio_blkaddr(fio);
>  
> -	bio_page = fio->encrypted_page ? fio->encrypted_page : fio->page;
> +	if (fio->encrypted_page)
> +		bio_page = fio->encrypted_page;
> +	else if (fio->compressed_page)
> +		bio_page = fio->compressed_page;
> +	else
> +		bio_page = fio->page;
>  
>  	/* set submitted = true as a return value */
>  	fio->submitted = true;
> @@ -797,7 +838,8 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>  
>  	if (f2fs_encrypted_file(inode))
>  		post_read_steps |= 1 << STEP_DECRYPT;
> -
> +	if (f2fs_compressed_file(inode))
> +		post_read_steps |= 1 << STEP_DECOMPRESS;
>  	if (f2fs_need_verity(inode, first_idx))
>  		post_read_steps |= 1 << STEP_VERITY;
>  
> @@ -808,6 +850,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>  			return ERR_PTR(-ENOMEM);
>  		}
>  		ctx->bio = bio;
> +		ctx->sbi = sbi;
>  		ctx->enabled_steps = post_read_steps;
>  		bio->bi_private = ctx;
>  	}
> @@ -1872,6 +1915,145 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>  	return ret;
>  }
>  
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> +				unsigned nr_pages, sector_t *last_block_in_bio,
> +				bool is_readahead)
> +{
> +	struct dnode_of_data dn;
> +	struct inode *inode = cc->inode;
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct bio *bio = *bio_ret;
> +	unsigned int start_idx = cc->cluster_idx << cc->log_cluster_size;
> +	sector_t last_block_in_file;
> +	const unsigned blkbits = inode->i_blkbits;
> +	const unsigned blocksize = 1 << blkbits;
> +	struct decompress_io_ctx *dic = NULL;
> +	int i;
> +	int ret = 0;
> +
> +	f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
> +
> +	last_block_in_file = (i_size_read(inode) + blocksize - 1) >> blkbits;
> +
> +	/* get rid of pages beyond EOF */
> +	for (i = 0; i < cc->cluster_size; i++) {
> +		struct page *page = cc->rpages[i];
> +
> +		if (!page)
> +			continue;
> +		if ((sector_t)page->index >= last_block_in_file) {
> +			zero_user_segment(page, 0, PAGE_SIZE);
> +			if (!PageUptodate(page))
> +				SetPageUptodate(page);
> +		} else if (!PageUptodate(page)) {
> +			continue;
> +		}
> +		unlock_page(page);
> +		cc->rpages[i] = NULL;
> +		cc->nr_rpages--;
> +	}
> +
> +	/* we are done since all pages are beyond EOF */
> +	if (f2fs_cluster_is_empty(cc))
> +		goto out;
> +
> +	set_new_dnode(&dn, inode, NULL, NULL, 0);
> +	ret = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
> +	if (ret)
> +		goto out;
> +
> +	f2fs_bug_on(sbi, dn.data_blkaddr != COMPRESS_ADDR);
> +
> +	for (i = 1; i < cc->cluster_size; i++) {
> +		block_t blkaddr;
> +
> +		blkaddr = datablock_addr(dn.inode, dn.node_page,
> +						dn.ofs_in_node + i);
> +
> +		if (!__is_valid_data_blkaddr(blkaddr))
> +			break;
> +
> +		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC)) {
> +			ret = -EFAULT;
> +			goto out_put_dnode;
> +		}
> +		cc->nr_cpages++;
> +	}
> +
> +	/* nothing to decompress */
> +	if (cc->nr_cpages == 0) {
> +		ret = 0;
> +		goto out_put_dnode;
> +	}
> +
> +	dic = f2fs_alloc_dic(cc);
> +	if (IS_ERR(dic)) {
> +		ret = PTR_ERR(dic);
> +		goto out_put_dnode;
> +	}
> +
> +	for (i = 0; i < dic->nr_cpages; i++) {
> +		struct page *page = dic->cpages[i];
> +		block_t blkaddr;
> +
> +		blkaddr = datablock_addr(dn.inode, dn.node_page,
> +						dn.ofs_in_node + i + 1);
> +
> +		if (bio && !page_is_mergeable(sbi, bio,
> +					*last_block_in_bio, blkaddr)) {
> +submit_and_realloc:
> +			__submit_bio(sbi, bio, DATA);
> +			bio = NULL;
> +		}
> +
> +		if (!bio) {
> +			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
> +					is_readahead ? REQ_RAHEAD : 0,
> +					page->index);
> +			if (IS_ERR(bio)) {
> +				ret = PTR_ERR(bio);
> +				bio = NULL;
> +				dic->failed = true;
> +				if (refcount_sub_and_test(dic->nr_cpages - i,
> +							&dic->ref))
> +					f2fs_set_cluster_uptodate(dic->rpages,
> +							cc->cluster_size, true,
> +							false);
> +				f2fs_free_dic(dic);
> +				f2fs_put_dnode(&dn);
> +				f2fs_reset_compress_ctx(cc);
> +				*bio_ret = bio;
> +				return ret;
> +			}
> +		}
> +
> +		f2fs_wait_on_block_writeback(inode, blkaddr);
> +
> +		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
> +			goto submit_and_realloc;
> +
> +		inc_page_count(sbi, F2FS_RD_DATA);
> +		ClearPageError(page);
> +		*last_block_in_bio = blkaddr;
> +	}
> +
> +	f2fs_put_dnode(&dn);
> +
> +	f2fs_reset_compress_ctx(cc);
> +	*bio_ret = bio;
> +	return 0;
> +
> +out_put_dnode:
> +	f2fs_put_dnode(&dn);
> +out:
> +	f2fs_set_cluster_uptodate(cc->rpages, cc->cluster_size, true, false);
> +	f2fs_reset_compress_ctx(cc);
> +	*bio_ret = bio;
> +	return ret;
> +}
> +#endif
> +
>  /*
>   * This function was originally taken from fs/mpage.c, and customized for f2fs.
>   * Major change was from block_size == page_size in f2fs by default.
> @@ -1881,7 +2063,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>   * use ->readpage() or do the necessary surgery to decouple ->readpages()
>   * from read-ahead.
>   */
> -static int f2fs_mpage_readpages(struct address_space *mapping,
> +int f2fs_mpage_readpages(struct address_space *mapping,
>  			struct list_head *pages, struct page *page,
>  			unsigned nr_pages, bool is_readahead)
>  {
> @@ -1889,6 +2071,19 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
>  	sector_t last_block_in_bio = 0;
>  	struct inode *inode = mapping->host;
>  	struct f2fs_map_blocks map;
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	struct compress_ctx cc = {
> +		.inode = inode,
> +		.log_cluster_size = F2FS_I(inode)->i_log_cluster_size,
> +		.cluster_size = F2FS_I(inode)->i_cluster_size,
> +		.cluster_idx = NULL_CLUSTER,
> +		.rpages = NULL,
> +		.cpages = NULL,
> +		.nr_rpages = 0,
> +		.nr_cpages = 0,
> +	};
> +#endif
> +	unsigned max_nr_pages = nr_pages;
>  	int ret = 0;
>  
>  	map.m_pblk = 0;
> @@ -1912,9 +2107,40 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
>  				goto next_page;
>  		}
>  
> -		ret = f2fs_read_single_page(inode, page, nr_pages, &map, &bio,
> -					&last_block_in_bio, is_readahead);
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +		if (f2fs_compressed_file(inode)) {
> +			/* there are remained comressed pages, submit them */
> +			if (!f2fs_cluster_can_merge_page(&cc, page->index)) {
> +				ret = f2fs_read_multi_pages(&cc, &bio,
> +							max_nr_pages,
> +							&last_block_in_bio,
> +							is_readahead);
> +				if (ret)
> +					goto set_error_page;
> +			}
> +			ret = f2fs_is_compressed_cluster(inode, page->index);
> +			if (ret < 0)
> +				goto set_error_page;
> +			else if (!ret)
> +				goto read_single_page;
> +
> +			ret = f2fs_init_compress_ctx(&cc);
> +			if (ret)
> +				goto set_error_page;
> +
> +			f2fs_compress_ctx_add_page(&cc, page);
> +
> +			goto next_page;
> +		}
> +read_single_page:
> +#endif
> +
> +		ret = f2fs_read_single_page(inode, page, max_nr_pages, &map,
> +					&bio, &last_block_in_bio, is_readahead);
>  		if (ret) {
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +set_error_page:
> +#endif
>  			SetPageError(page);
>  			zero_user_segment(page, 0, PAGE_SIZE);
>  			unlock_page(page);
> @@ -1922,6 +2148,17 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
>  next_page:
>  		if (pages)
>  			put_page(page);
> +
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +		if (f2fs_compressed_file(inode)) {
> +			/* last page */
> +			if (nr_pages == 1 && !f2fs_cluster_is_empty(&cc))
> +				ret = f2fs_read_multi_pages(&cc, &bio,
> +							max_nr_pages,
> +							&last_block_in_bio,
> +							is_readahead);
> +		}
> +#endif
>  	}
>  	BUG_ON(pages && !list_empty(pages));
>  	if (bio)
> @@ -1936,6 +2173,11 @@ static int f2fs_read_data_page(struct file *file, struct page *page)
>  
>  	trace_f2fs_readpage(page, DATA);
>  
> +	if (!f2fs_is_compress_backend_ready(inode)) {
> +		unlock_page(page);
> +		return -EOPNOTSUPP;
> +	}
> +
>  	/* If the file has inline data, try to read it directly */
>  	if (f2fs_has_inline_data(inode))
>  		ret = f2fs_read_inline_data(inode, page);
> @@ -1954,6 +2196,9 @@ static int f2fs_read_data_pages(struct file *file,
>  
>  	trace_f2fs_readpages(inode, page, nr_pages);
>  
> +	if (!f2fs_is_compress_backend_ready(inode))
> +		return 0;
> +
>  	/* If the file has inline data, skip readpages */
>  	if (f2fs_has_inline_data(inode))
>  		return 0;
> @@ -1961,22 +2206,23 @@ static int f2fs_read_data_pages(struct file *file,
>  	return f2fs_mpage_readpages(mapping, pages, NULL, nr_pages, true);
>  }
>  
> -static int encrypt_one_page(struct f2fs_io_info *fio)
> +int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
>  {
>  	struct inode *inode = fio->page->mapping->host;
> -	struct page *mpage;
> +	struct page *mpage, *page;
>  	gfp_t gfp_flags = GFP_NOFS;
>  
>  	if (!f2fs_encrypted_file(inode))
>  		return 0;
>  
> +	page = fio->compressed_page ? fio->compressed_page : fio->page;
> +
>  	/* wait for GCed page writeback via META_MAPPING */
>  	f2fs_wait_on_block_writeback(inode, fio->old_blkaddr);
>  
>  retry_encrypt:
> -	fio->encrypted_page = fscrypt_encrypt_pagecache_blocks(fio->page,
> -							       PAGE_SIZE, 0,
> -							       gfp_flags);
> +	fio->encrypted_page = fscrypt_encrypt_pagecache_blocks(page,
> +					PAGE_SIZE, 0, gfp_flags);
>  	if (IS_ERR(fio->encrypted_page)) {
>  		/* flush pending IOs and wait for a while in the ENOMEM case */
>  		if (PTR_ERR(fio->encrypted_page) == -ENOMEM) {
> @@ -2136,7 +2382,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  	if (ipu_force ||
>  		(__is_valid_data_blkaddr(fio->old_blkaddr) &&
>  					need_inplace_update(fio))) {
> -		err = encrypt_one_page(fio);
> +		err = f2fs_encrypt_one_page(fio);
>  		if (err)
>  			goto out_writepage;
>  
> @@ -2172,7 +2418,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  
>  	fio->version = ni.version;
>  
> -	err = encrypt_one_page(fio);
> +	err = f2fs_encrypt_one_page(fio);
>  	if (err)
>  		goto out_writepage;
>  
> @@ -2193,7 +2439,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  	return err;
>  }
>  
> -static int __write_data_page(struct page *page, bool *submitted,
> +int f2fs_write_single_data_page(struct page *page, int *submitted,
>  				struct bio **bio,
>  				sector_t *last_block,
>  				struct writeback_control *wbc,
> @@ -2202,7 +2448,7 @@ static int __write_data_page(struct page *page, bool *submitted,
>  	struct inode *inode = page->mapping->host;
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	loff_t i_size = i_size_read(inode);
> -	const pgoff_t end_index = ((unsigned long long) i_size)
> +	const pgoff_t end_index = ((unsigned long long)i_size)
>  							>> PAGE_SHIFT;
>  	loff_t psize = (page->index + 1) << PAGE_SHIFT;
>  	unsigned nr_pages = DIV_ROUND_UP(i_size, PAGE_SIZE);
> @@ -2243,7 +2489,8 @@ static int __write_data_page(struct page *page, bool *submitted,
>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>  		goto redirty_out;
>  
> -	if (page->index < end_index || f2fs_verity_in_progress(inode))
> +	if (f2fs_compressed_file(inode) ||
> +		page->index < end_index || f2fs_verity_in_progress(inode))
>  		goto write;
>  
>  	/*
> @@ -2318,7 +2565,6 @@ static int __write_data_page(struct page *page, bool *submitted,
>  		f2fs_remove_dirty_inode(inode);
>  		submitted = NULL;
>  	}
> -
>  	unlock_page(page);
>  	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode) &&
>  					!F2FS_I(inode)->cp_task)
> @@ -2331,7 +2577,7 @@ static int __write_data_page(struct page *page, bool *submitted,
>  	}
>  
>  	if (submitted)
> -		*submitted = fio.submitted;
> +		*submitted = fio.submitted ? 1 : 0;
>  
>  	return 0;
>  
> @@ -2352,7 +2598,19 @@ static int __write_data_page(struct page *page, bool *submitted,
>  static int f2fs_write_data_page(struct page *page,
>  					struct writeback_control *wbc)
>  {
> -	return __write_data_page(page, NULL, NULL, NULL, wbc, FS_DATA_IO);
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	struct inode *inode = page->mapping->host;
> +
> +	if (f2fs_compressed_file(inode)) {
> +		if (f2fs_is_compressed_cluster(inode, page->index)) {
> +			redirty_page_for_writepage(wbc, page);
> +			return AOP_WRITEPAGE_ACTIVATE;
> +		}
> +	}
> +#endif
> +
> +	return f2fs_write_single_data_page(page, NULL, NULL, NULL,
> +						wbc, FS_DATA_IO);
>  }
>  
>  /*
> @@ -2365,11 +2623,27 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  					enum iostat_type io_type)
>  {
>  	int ret = 0;
> -	int done = 0;
> +	int done = 0, retry = 0;
>  	struct pagevec pvec;
>  	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
>  	struct bio *bio = NULL;
>  	sector_t last_block;
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	struct inode *inode = mapping->host;
> +	struct compress_ctx cc = {
> +		.inode = inode,
> +		.log_cluster_size = F2FS_I(inode)->i_log_cluster_size,
> +		.cluster_size = F2FS_I(inode)->i_cluster_size,
> +		.cluster_idx = NULL_CLUSTER,
> +		.rpages = NULL,
> +		.nr_rpages = 0,
> +		.cpages = NULL,
> +		.rbuf = NULL,
> +		.cbuf = NULL,
> +		.rlen = PAGE_SIZE * F2FS_I(inode)->i_cluster_size,
> +		.private = NULL,
> +	};
> +#endif
>  	int nr_pages;
>  	pgoff_t uninitialized_var(writeback_index);
>  	pgoff_t index;
> @@ -2379,6 +2653,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  	int range_whole = 0;
>  	xa_mark_t tag;
>  	int nwritten = 0;
> +	int submitted = 0;
> +	int i;
>  
>  	pagevec_init(&pvec);
>  
> @@ -2408,12 +2684,11 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  	else
>  		tag = PAGECACHE_TAG_DIRTY;
>  retry:
> +	retry = 0;
>  	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
>  		tag_pages_for_writeback(mapping, index, end);
>  	done_index = index;
> -	while (!done && (index <= end)) {
> -		int i;
> -
> +	while (!done && !retry && (index <= end)) {
>  		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
>  				tag);
>  		if (nr_pages == 0)
> @@ -2421,7 +2696,51 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  
>  		for (i = 0; i < nr_pages; i++) {
>  			struct page *page = pvec.pages[i];
> -			bool submitted = false;
> +			bool need_readd = false;
> +
> +readd:
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +			need_readd = false;
> +
> +			if (f2fs_compressed_file(inode)) {
> +				void *fsdata = NULL;
> +				struct page *pagep;
> +				int ret2;
> +
> +				ret = f2fs_init_compress_ctx(&cc);
> +				if (ret) {
> +					done = 1;
> +					break;
> +				}
> +
> +				if (!f2fs_cluster_can_merge_page(&cc,
> +								page->index)) {
> +
> +					ret = f2fs_write_multi_pages(&cc,
> +						&submitted, wbc, io_type);
> +					if (!ret)
> +						need_readd = true;
> +					goto result;
> +				}
> +
> +				if (f2fs_cluster_is_empty(&cc)) {
> +					ret2 = f2fs_prepare_compress_overwrite(
> +							inode, &pagep,
> +							page->index, &fsdata);
> +					if (ret2 < 0) {
> +						ret = ret2;
> +						done = 1;
> +						break;
> +					} else if (ret2 &&
> +						!f2fs_compress_write_end(inode,
> +							fsdata, page->index,
> +							true)) {
> +						retry = 1;
> +						break;
> +					}
> +				}
> +			}
> +#endif
>  
>  			/* give a priority to WB_SYNC threads */
>  			if (atomic_read(&sbi->wb_sync_req[DATA]) &&
> @@ -2431,7 +2750,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  			}
>  
>  			done_index = page->index;
> -retry_write:
> +
>  			lock_page(page);
>  
>  			if (unlikely(page->mapping != mapping)) {
> @@ -2456,45 +2775,64 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  			if (!clear_page_dirty_for_io(page))
>  				goto continue_unlock;
>  
> -			ret = __write_data_page(page, &submitted, &bio,
> -					&last_block, wbc, io_type);
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +			if (f2fs_compressed_file(inode)) {
> +				f2fs_compress_ctx_add_page(&cc, page);
> +				continue;
> +			}
> +#endif
> +			ret = f2fs_write_single_data_page(page, &submitted,
> +					&bio, &last_block, wbc, io_type);
> +			if (ret == AOP_WRITEPAGE_ACTIVATE)
> +				unlock_page(page);
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +result:
> +#endif
> +			nwritten += submitted;
> +			wbc->nr_to_write -= submitted;
> +
>  			if (unlikely(ret)) {
>  				/*
>  				 * keep nr_to_write, since vfs uses this to
>  				 * get # of written pages.
>  				 */
>  				if (ret == AOP_WRITEPAGE_ACTIVATE) {
> -					unlock_page(page);
>  					ret = 0;
> -					continue;
> +					goto next;
>  				} else if (ret == -EAGAIN) {
>  					ret = 0;
> -					if (wbc->sync_mode == WB_SYNC_ALL) {
> -						cond_resched();
> -						congestion_wait(BLK_RW_ASYNC,
> -									HZ/50);
> -						goto retry_write;
> -					}
> -					continue;
> +					goto next;
>  				}
>  				done_index = page->index + 1;
>  				done = 1;
>  				break;
> -			} else if (submitted) {
> -				nwritten++;
>  			}
>  
> -			if (--wbc->nr_to_write <= 0 &&
> +			if (wbc->nr_to_write <= 0 &&
>  					wbc->sync_mode == WB_SYNC_NONE) {
>  				done = 1;
>  				break;
>  			}
> +next:
> +			if (need_readd)
> +				goto readd;
>  		}
> +
>  		pagevec_release(&pvec);
>  		cond_resched();
>  	}
>  
> -	if (!cycled && !done) {
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	/* flush remained pages in compress cluster */
> +	if (f2fs_compressed_file(inode) && !f2fs_cluster_is_empty(&cc)) {
> +		ret = f2fs_write_multi_pages(&cc, &submitted, wbc, io_type);
> +		nwritten += submitted;
> +		wbc->nr_to_write -= submitted;
> +		/* TODO: error handling */
> +	}
> +#endif
> +
> +	if ((!cycled && !done) || retry) {
>  		cycled = 1;
>  		index = 0;
>  		end = writeback_index - 1;
> @@ -2518,6 +2856,8 @@ static inline bool __should_serialize_io(struct inode *inode,
>  {
>  	if (!S_ISREG(inode->i_mode))
>  		return false;
> +	if (f2fs_compressed_file(inode))
> +		return true;
>  	if (IS_NOQUOTA(inode))
>  		return false;
>  	/* to avoid deadlock in path of data flush */
> @@ -2660,6 +3000,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
>  		__do_map_lock(sbi, flag, true);
>  		locked = true;
>  	}
> +
>  restart:
>  	/* check inline_data */
>  	ipage = f2fs_get_node_page(sbi, inode->i_ino);
> @@ -2750,6 +3091,24 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>  		if (err)
>  			goto fail;
>  	}
> +
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	if (f2fs_compressed_file(inode)) {
> +		int ret;
> +
> +		*fsdata = NULL;
> +
> +		ret = f2fs_prepare_compress_overwrite(inode, pagep,
> +							index, fsdata);
> +		if (ret < 0) {
> +			err = ret;
> +			goto fail;
> +		} else if (ret) {
> +			return 0;
> +		}
> +	}
> +#endif
> +
>  repeat:
>  	/*
>  	 * Do not use grab_cache_page_write_begin() to avoid deadlock due to
> @@ -2762,6 +3121,8 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>  		goto fail;
>  	}
>  
> +	/* TODO: cluster can be compressed due to race with .writepage */
> +
>  	*pagep = page;
>  
>  	err = prepare_write_begin(sbi, page, pos, len,
> @@ -2845,6 +3206,16 @@ static int f2fs_write_end(struct file *file,
>  		else
>  			SetPageUptodate(page);
>  	}
> +
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	/* overwrite compressed file */
> +	if (f2fs_compressed_file(inode) && fsdata) {
> +		f2fs_compress_write_end(inode, fsdata, page->index, copied);
> +		f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
> +		return copied;
> +	}
> +#endif
> +
>  	if (!copied)
>  		goto unlock_out;
>  
> @@ -3235,6 +3606,15 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
>  	if (ret)
>  		return ret;
>  
> +	if (f2fs_compressed_file(inode)) {
> +		if (F2FS_I(inode)->i_compressed_blocks)
> +			return -EINVAL;
> +
> +		F2FS_I(inode)->i_flags &= ~FS_COMPR_FL;
> +		clear_inode_flag(inode, FI_COMPRESSED_FILE);
> +		stat_dec_compr_inode(inode);
> +	}
> +
>  	ret = check_swap_activate(file, sis->max);
>  	if (ret)
>  		return ret;
> @@ -3319,6 +3699,27 @@ void f2fs_destroy_post_read_processing(void)
>  	kmem_cache_destroy(bio_post_read_ctx_cache);
>  }
>  
> +int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi)
> +{
> +	if (!f2fs_sb_has_encrypt(sbi) &&
> +		!f2fs_sb_has_verity(sbi) &&
> +		!f2fs_sb_has_compression(sbi))
> +		return 0;
> +
> +	sbi->post_read_wq = alloc_workqueue("f2fs_post_read_wq",
> +						 WQ_UNBOUND | WQ_HIGHPRI,
> +						 num_online_cpus());
> +	if (!sbi->post_read_wq)
> +		return -ENOMEM;
> +	return 0;
> +}
> +
> +void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi)
> +{
> +	if (sbi->post_read_wq)
> +		destroy_workqueue(sbi->post_read_wq);
> +}
> +
>  int __init f2fs_init_bio_entry_cache(void)
>  {
>  	bio_entry_slab = f2fs_kmem_cache_create("bio_entry_slab",
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 5abd1d67d8b2..4f3ef1a892f0 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -94,6 +94,8 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>  	si->inline_xattr = atomic_read(&sbi->inline_xattr);
>  	si->inline_inode = atomic_read(&sbi->inline_inode);
>  	si->inline_dir = atomic_read(&sbi->inline_dir);
> +	si->compr_inode = atomic_read(&sbi->compr_inode);
> +	si->compr_blocks = atomic_read(&sbi->compr_blocks);
>  	si->append = sbi->im[APPEND_INO].ino_num;
>  	si->update = sbi->im[UPDATE_INO].ino_num;
>  	si->orphans = sbi->im[ORPHAN_INO].ino_num;
> @@ -315,6 +317,8 @@ static int stat_show(struct seq_file *s, void *v)
>  			   si->inline_inode);
>  		seq_printf(s, "  - Inline_dentry Inode: %u\n",
>  			   si->inline_dir);
> +		seq_printf(s, "  - Compressed Inode: %u, Blocks: %u\n",
> +			   si->compr_inode, si->compr_blocks);
>  		seq_printf(s, "  - Orphan/Append/Update Inode: %u, %u, %u\n",
>  			   si->orphans, si->append, si->update);
>  		seq_printf(s, "\nMain area: %d segs, %d secs %d zones\n",
> @@ -491,6 +495,8 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
>  	atomic_set(&sbi->inline_xattr, 0);
>  	atomic_set(&sbi->inline_inode, 0);
>  	atomic_set(&sbi->inline_dir, 0);
> +	atomic_set(&sbi->compr_inode, 0);
> +	atomic_set(&sbi->compr_blocks, 0);
>  	atomic_set(&sbi->inplace_count, 0);
>  	for (i = META_CP; i < META_MAX; i++)
>  		atomic_set(&sbi->meta_count[i], 0);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 8833e9d32f9d..74250d9f5cef 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -116,6 +116,8 @@ typedef u32 block_t;	/*
>  			 */
>  typedef u32 nid_t;
>  
> +#define COMPRESS_EXT_NUM		16
> +
>  struct f2fs_mount_info {
>  	unsigned int opt;
>  	int write_io_size_bits;		/* Write IO size bits */
> @@ -140,6 +142,12 @@ struct f2fs_mount_info {
>  	block_t unusable_cap;		/* Amount of space allowed to be
>  					 * unusable when disabling checkpoint
>  					 */
> +
> +	/* For compression */
> +	unsigned char compress_algorithm;	/* algorithm type */
> +	unsigned compress_log_size;		/* cluster log size */
> +	unsigned char compress_ext_cnt;		/* extension count */
> +	unsigned char extensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN];	/* extensions */
>  };
>  
>  #define F2FS_FEATURE_ENCRYPT		0x0001
> @@ -155,6 +163,7 @@ struct f2fs_mount_info {
>  #define F2FS_FEATURE_VERITY		0x0400
>  #define F2FS_FEATURE_SB_CHKSUM		0x0800
>  #define F2FS_FEATURE_CASEFOLD		0x1000
> +#define F2FS_FEATURE_COMPRESSION	0x2000
>  
>  #define __F2FS_HAS_FEATURE(raw_super, mask)				\
>  	((raw_super->feature & cpu_to_le32(mask)) != 0)
> @@ -712,6 +721,12 @@ struct f2fs_inode_info {
>  	int i_inline_xattr_size;	/* inline xattr size */
>  	struct timespec64 i_crtime;	/* inode creation time */
>  	struct timespec64 i_disk_time[4];/* inode disk times */
> +
> +	/* for file compress */
> +	u64 i_compressed_blocks;		/* # of compressed blocks */
> +	unsigned char i_compress_algorithm;	/* algorithm type */
> +	unsigned char i_log_cluster_size;	/* log of cluster size */
> +	unsigned int i_cluster_size;		/* cluster size */
>  };
>  
>  static inline void get_extent_info(struct extent_info *ext,
> @@ -1056,12 +1071,15 @@ struct f2fs_io_info {
>  	block_t old_blkaddr;	/* old block address before Cow */
>  	struct page *page;	/* page to be written */
>  	struct page *encrypted_page;	/* encrypted page */
> +	struct page *compressed_page;	/* compressed page */
>  	struct list_head list;		/* serialize IOs */
>  	bool submitted;		/* indicate IO submission */
>  	int need_lock;		/* indicate we need to lock cp_rwsem */
>  	bool in_list;		/* indicate fio is in io_list */
>  	bool is_por;		/* indicate IO is from recovery or not */
>  	bool retry;		/* need to reallocate block address */
> +	bool compressed;	/* indicate cluster is compressed */
> +	bool encrypted;		/* indicate file is encrypted */
>  	enum iostat_type io_type;	/* io type */
>  	struct writeback_control *io_wbc; /* writeback control */
>  	struct bio **bio;		/* bio for ipu */
> @@ -1169,6 +1187,18 @@ enum fsync_mode {
>  	FSYNC_MODE_NOBARRIER,	/* fsync behaves nobarrier based on posix */
>  };
>  
> +/*
> + * this value is set in page as a private data which indicate that
> + * the page is atomically written, and it is in inmem_pages list.
> + */
> +#define ATOMIC_WRITTEN_PAGE		((unsigned long)-1)
> +#define DUMMY_WRITTEN_PAGE		((unsigned long)-2)
> +
> +#define IS_ATOMIC_WRITTEN_PAGE(page)			\
> +		(page_private(page) == (unsigned long)ATOMIC_WRITTEN_PAGE)
> +#define IS_DUMMY_WRITTEN_PAGE(page)			\
> +		(page_private(page) == (unsigned long)DUMMY_WRITTEN_PAGE)
> +
>  #ifdef CONFIG_FS_ENCRYPTION
>  #define DUMMY_ENCRYPTION_ENABLED(sbi) \
>  			(unlikely(F2FS_OPTION(sbi).test_dummy_encryption))
> @@ -1176,6 +1206,74 @@ enum fsync_mode {
>  #define DUMMY_ENCRYPTION_ENABLED(sbi) (0)
>  #endif
>  
> +/* For compression */
> +enum compress_algorithm_type {
> +	COMPRESS_LZO,
> +	COMPRESS_LZ4,
> +	COMPRESS_MAX,
> +};
> +
> +#define COMPRESS_DATA_RESERVED_SIZE		4
> +struct compress_data {
> +	__le32 clen;			/* compressed data size */
> +	__le32 chksum;			/* checksum of compressed data */
> +	__le32 reserved[COMPRESS_DATA_RESERVED_SIZE];	/* reserved */
> +	u8 cdata[];			/* compressed data */
> +};
> +
> +#define COMPRESS_HEADER_SIZE	(sizeof(struct compress_data))
> +
> +#define F2FS_COMPRESSED_PAGE_MAGIC	0xF5F2C000
> +
> +/* compress context */
> +struct compress_ctx {
> +	struct inode *inode;		/* inode the context belong to */
> +	unsigned int cluster_idx;	/* cluster index number */
> +	unsigned int cluster_size;	/* page count in cluster */
> +	unsigned int log_cluster_size;	/* log of cluster size */
> +	struct page **rpages;		/* pages store raw data in cluster */
> +	unsigned int nr_rpages;		/* total page number in rpages */
> +	struct page **cpages;		/* pages store compressed data in cluster */
> +	unsigned int nr_cpages;		/* total page number in cpages */
> +	void *rbuf;			/* virtual mapped address on rpages */
> +	struct compress_data *cbuf;	/* virtual mapped address on cpages */
> +	size_t rlen;			/* valid data length in rbuf */
> +	size_t clen;			/* valid data length in cbuf */
> +	void *private;			/* payload buffer for specified compression algorithm */
> +};
> +
> +/* compress context for write IO path */
> +struct compress_io_ctx {
> +	struct inode *inode;		/* inode the context belong to */
> +	struct page **rpages;		/* pages store raw data in cluster */
> +	unsigned int nr_rpages;		/* total page number in rpages */
> +	refcount_t ref;			/* referrence count of raw page */
> +	u32 magic;			/* magic number to indicate page is compressed */
> +};
> +
> +/* decompress io context for read IO path */
> +struct decompress_io_ctx {
> +	struct inode *inode;		/* inode the context belong to */
> +	unsigned int cluster_idx;	/* cluster index number */
> +	unsigned int cluster_size;	/* page count in cluster */
> +	unsigned int log_cluster_size;	/* log of cluster size */
> +	struct page **rpages;		/* pages store raw data in cluster */
> +	unsigned int nr_rpages;		/* total page number in rpages */
> +	struct page **cpages;		/* pages store compressed data in cluster */
> +	unsigned int nr_cpages;		/* total page number in cpages */
> +	struct page **tpages;		/* temp pages to pad holes in cluster */
> +	void *rbuf;			/* virtual mapped address on rpages */
> +	struct compress_data *cbuf;	/* virtual mapped address on cpages */
> +	size_t rlen;			/* valid data length in rbuf */
> +	size_t clen;			/* valid data length in cbuf */
> +	refcount_t ref;			/* referrence count of compressed page */
> +	bool failed;			/* indicate IO error during decompression */
> +};
> +
> +#define NULL_CLUSTER			((unsigned int)(~0))
> +#define MIN_COMPRESS_LOG_SIZE		2
> +#define MAX_COMPRESS_LOG_SIZE		8
> +
>  struct f2fs_sb_info {
>  	struct super_block *sb;			/* pointer to VFS super block */
>  	struct proc_dir_entry *s_proc;		/* proc entry */
> @@ -1326,6 +1424,8 @@ struct f2fs_sb_info {
>  	atomic_t inline_xattr;			/* # of inline_xattr inodes */
>  	atomic_t inline_inode;			/* # of inline_data inodes */
>  	atomic_t inline_dir;			/* # of inline_dentry inodes */
> +	atomic_t compr_inode;			/* # of compressed inodes */
> +	atomic_t compr_blocks;			/* # of compressed blocks */
>  	atomic_t aw_cnt;			/* # of atomic writes */
>  	atomic_t vw_cnt;			/* # of volatile writes */
>  	atomic_t max_aw_cnt;			/* max # of atomic writes */
> @@ -1364,6 +1464,8 @@ struct f2fs_sb_info {
>  
>  	/* Precomputed FS UUID checksum for seeding other checksums */
>  	__u32 s_chksum_seed;
> +
> +	struct workqueue_struct *post_read_wq;	/* post read workqueue */
>  };
>  
>  struct f2fs_private_dio {
> @@ -2377,11 +2479,13 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
>  /*
>   * On-disk inode flags (f2fs_inode::i_flags)
>   */
> +#define F2FS_COMPR_FL			0x00000004 /* Compress file */
>  #define F2FS_SYNC_FL			0x00000008 /* Synchronous updates */
>  #define F2FS_IMMUTABLE_FL		0x00000010 /* Immutable file */
>  #define F2FS_APPEND_FL			0x00000020 /* writes to file may only append */
>  #define F2FS_NODUMP_FL			0x00000040 /* do not dump file */
>  #define F2FS_NOATIME_FL			0x00000080 /* do not update atime */
> +#define F2FS_NOCOMP_FL			0x00000400 /* Don't compress */
>  #define F2FS_INDEX_FL			0x00001000 /* hash-indexed directory */
>  #define F2FS_DIRSYNC_FL			0x00010000 /* dirsync behaviour (directories only) */
>  #define F2FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
> @@ -2390,7 +2494,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
>  /* Flags that should be inherited by new inodes from their parent. */
>  #define F2FS_FL_INHERITED (F2FS_SYNC_FL | F2FS_NODUMP_FL | F2FS_NOATIME_FL | \
>  			   F2FS_DIRSYNC_FL | F2FS_PROJINHERIT_FL | \
> -			   F2FS_CASEFOLD_FL)
> +			   F2FS_CASEFOLD_FL | F2FS_COMPR_FL | F2FS_NOCOMP_FL)
>  
>  /* Flags that are appropriate for regular files (all but dir-specific ones). */
>  #define F2FS_REG_FLMASK		(~(F2FS_DIRSYNC_FL | F2FS_PROJINHERIT_FL | \
> @@ -2442,6 +2546,8 @@ enum {
>  	FI_PIN_FILE,		/* indicate file should not be gced */
>  	FI_ATOMIC_REVOKE_REQUEST, /* request to drop atomic data */
>  	FI_VERITY_IN_PROGRESS,	/* building fs-verity Merkle tree */
> +	FI_COMPRESSED_FILE,	/* indicate file's data can be compressed */
> +	FI_MMAP_FILE,		/* indicate file was mmapped */
>  };
>  
>  static inline void __mark_inode_dirty_flag(struct inode *inode,
> @@ -2458,6 +2564,7 @@ static inline void __mark_inode_dirty_flag(struct inode *inode,
>  	case FI_DATA_EXIST:
>  	case FI_INLINE_DOTS:
>  	case FI_PIN_FILE:
> +	case FI_COMPRESSED_FILE:
>  		f2fs_mark_inode_dirty_sync(inode, true);
>  	}
>  }
> @@ -2613,16 +2720,39 @@ static inline int f2fs_has_inline_xattr(struct inode *inode)
>  	return is_inode_flag_set(inode, FI_INLINE_XATTR);
>  }
>  
> +static inline int f2fs_compressed_file(struct inode *inode)
> +{
> +	return S_ISREG(inode->i_mode) &&
> +		is_inode_flag_set(inode, FI_COMPRESSED_FILE);
> +}
> +
> +static inline void set_compress_context(struct inode *inode)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +
> +	F2FS_I(inode)->i_compress_algorithm =
> +			F2FS_OPTION(sbi).compress_algorithm;
> +	F2FS_I(inode)->i_log_cluster_size =
> +			F2FS_OPTION(sbi).compress_log_size;
> +	F2FS_I(inode)->i_cluster_size =
> +			1 << F2FS_I(inode)->i_log_cluster_size;
> +}
> +
>  static inline unsigned int addrs_per_inode(struct inode *inode)
>  {
>  	unsigned int addrs = CUR_ADDRS_PER_INODE(inode) -
>  				get_inline_xattr_addrs(inode);
> -	return ALIGN_DOWN(addrs, 1);
> +
> +	if (!f2fs_compressed_file(inode))
> +		return addrs;
> +	return ALIGN_DOWN(addrs, F2FS_I(inode)->i_cluster_size);
>  }
>  
>  static inline unsigned int addrs_per_block(struct inode *inode)
>  {
> -	return ALIGN_DOWN(DEF_ADDRS_PER_BLOCK, 1);
> +	if (!f2fs_compressed_file(inode))
> +		return DEF_ADDRS_PER_BLOCK;
> +	return ALIGN_DOWN(DEF_ADDRS_PER_BLOCK, F2FS_I(inode)->i_cluster_size);
>  }
>  
>  static inline void *inline_xattr_addr(struct inode *inode, struct page *page)
> @@ -2655,6 +2785,11 @@ static inline int f2fs_has_inline_dots(struct inode *inode)
>  	return is_inode_flag_set(inode, FI_INLINE_DOTS);
>  }
>  
> +static inline int f2fs_is_mmap_file(struct inode *inode)
> +{
> +	return is_inode_flag_set(inode, FI_MMAP_FILE);
> +}
> +
>  static inline bool f2fs_is_pinned_file(struct inode *inode)
>  {
>  	return is_inode_flag_set(inode, FI_PIN_FILE);
> @@ -2782,7 +2917,8 @@ static inline bool f2fs_may_extent_tree(struct inode *inode)
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  
>  	if (!test_opt(sbi, EXTENT_CACHE) ||
> -			is_inode_flag_set(inode, FI_NO_EXTENT))
> +			is_inode_flag_set(inode, FI_NO_EXTENT) ||
> +			is_inode_flag_set(inode, FI_COMPRESSED_FILE))
>  		return false;
>  
>  	/*
> @@ -2896,7 +3032,8 @@ static inline void verify_blkaddr(struct f2fs_sb_info *sbi,
>  
>  static inline bool __is_valid_data_blkaddr(block_t blkaddr)
>  {
> -	if (blkaddr == NEW_ADDR || blkaddr == NULL_ADDR)
> +	if (blkaddr == NEW_ADDR || blkaddr == NULL_ADDR ||
> +			blkaddr == COMPRESS_ADDR)
>  		return false;
>  	return true;
>  }
> @@ -3198,10 +3335,10 @@ void f2fs_destroy_checkpoint_caches(void);
>  /*
>   * data.c
>   */
> -int f2fs_init_post_read_processing(void);
> -void f2fs_destroy_post_read_processing(void);
>  int f2fs_init_bio_entry_cache(void);
>  void f2fs_destroy_bio_entry_cache(void);
> +void f2fs_submit_bio(struct f2fs_sb_info *sbi,
> +				struct bio *bio, enum page_type type);
>  void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type);
>  void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
>  				struct inode *inode, struct page *page,
> @@ -3222,6 +3359,9 @@ int f2fs_reserve_new_block(struct dnode_of_data *dn);
>  int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index);
>  int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from);
>  int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index);
> +int f2fs_mpage_readpages(struct address_space *mapping,
> +			struct list_head *pages, struct page *page,
> +			unsigned nr_pages, bool is_readahead);
>  struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
>  			int op_flags, bool for_write);
>  struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index);
> @@ -3235,8 +3375,13 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>  			int create, int flag);
>  int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  			u64 start, u64 len);
> +int f2fs_encrypt_one_page(struct f2fs_io_info *fio);
>  bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio);
>  bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio);
> +int f2fs_write_single_data_page(struct page *page, int *submitted,
> +				struct bio **bio, sector_t *last_block,
> +				struct writeback_control *wbc,
> +				enum iostat_type io_type);
>  void f2fs_invalidate_page(struct page *page, unsigned int offset,
>  			unsigned int length);
>  int f2fs_release_page(struct page *page, gfp_t wait);
> @@ -3246,6 +3391,10 @@ int f2fs_migrate_page(struct address_space *mapping, struct page *newpage,
>  #endif
>  bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len);
>  void f2fs_clear_page_cache_dirty_tag(struct page *page);
> +int f2fs_init_post_read_processing(void);
> +void f2fs_destroy_post_read_processing(void);
> +int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
> +void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
>  
>  /*
>   * gc.c
> @@ -3292,6 +3441,7 @@ struct f2fs_stat_info {
>  	int nr_discard_cmd;
>  	unsigned int undiscard_blks;
>  	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
> +	int compr_inode, compr_blocks;
>  	int aw_cnt, max_aw_cnt, vw_cnt, max_vw_cnt;
>  	unsigned int valid_count, valid_node_count, valid_inode_count, discard_blks;
>  	unsigned int bimodal, avg_vblocks;
> @@ -3362,6 +3512,20 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
>  		if (f2fs_has_inline_dentry(inode))			\
>  			(atomic_dec(&F2FS_I_SB(inode)->inline_dir));	\
>  	} while (0)
> +#define stat_inc_compr_inode(inode)					\
> +	do {								\
> +		if (f2fs_compressed_file(inode))			\
> +			(atomic_inc(&F2FS_I_SB(inode)->compr_inode));	\
> +	} while (0)
> +#define stat_dec_compr_inode(inode)					\
> +	do {								\
> +		if (f2fs_compressed_file(inode))			\
> +			(atomic_dec(&F2FS_I_SB(inode)->compr_inode));	\
> +	} while (0)
> +#define stat_add_compr_blocks(inode, blocks)				\
> +		(atomic_add(blocks, &F2FS_I_SB(inode)->compr_blocks))
> +#define stat_sub_compr_blocks(inode, blocks)				\
> +		(atomic_sub(blocks, &F2FS_I_SB(inode)->compr_blocks))
>  #define stat_inc_meta_count(sbi, blkaddr)				\
>  	do {								\
>  		if (blkaddr < SIT_I(sbi)->sit_base_addr)		\
> @@ -3456,6 +3620,10 @@ void f2fs_destroy_root_stats(void);
>  #define stat_dec_inline_inode(inode)			do { } while (0)
>  #define stat_inc_inline_dir(inode)			do { } while (0)
>  #define stat_dec_inline_dir(inode)			do { } while (0)
> +#define stat_inc_compr_inode(inode)			do { } while (0)
> +#define stat_dec_compr_inode(inode)			do { } while (0)
> +#define stat_add_compr_blocks(inode)			do { } while (0)
> +#define stat_sub_compr_blocks(inode)			do { } while (0)
>  #define stat_inc_atomic_write(inode)			do { } while (0)
>  #define stat_dec_atomic_write(inode)			do { } while (0)
>  #define stat_update_max_atomic_write(inode)		do { } while (0)
> @@ -3595,8 +3763,57 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
>   */
>  static inline bool f2fs_post_read_required(struct inode *inode)
>  {
> -	return f2fs_encrypted_file(inode) || fsverity_active(inode);
> +	return f2fs_encrypted_file(inode) || fsverity_active(inode) ||
> +		f2fs_compressed_file(inode);
> +}
> +
> +/*
> + * compress.c
> + */
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +bool f2fs_is_compressed_page(struct page *page);
> +struct page *f2fs_compress_control_page(struct page *page);
> +void f2fs_reset_compress_ctx(struct compress_ctx *cc);
> +int f2fs_prepare_compress_overwrite(struct inode *inode,
> +			struct page **pagep, pgoff_t index, void **fsdata);
> +bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
> +					pgoff_t index, bool written);
> +void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
> +bool f2fs_is_compress_backend_ready(struct inode *inode);
> +void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity);
> +bool f2fs_cluster_is_empty(struct compress_ctx *cc);
> +bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
> +void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
> +int f2fs_write_multi_pages(struct compress_ctx *cc,
> +						int *submitted,
> +						struct writeback_control *wbc,
> +						enum iostat_type io_type);
> +int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index);
> +int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> +				unsigned nr_pages, sector_t *last_block_in_bio,
> +				bool is_readahead);
> +struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc);
> +void f2fs_free_dic(struct decompress_io_ctx *dic);
> +void f2fs_set_cluster_uptodate(struct page **rpages,
> +			unsigned int cluster_size, bool err, bool verity);
> +int f2fs_init_compress_ctx(struct compress_ctx *cc);
> +void f2fs_destroy_compress_ctx(struct compress_ctx *cc);
> +void f2fs_init_compress_info(struct f2fs_sb_info *sbi);
> +#else
> +static inline bool f2fs_is_compressed_page(struct page *page) { return false; }
> +static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
> +{
> +	if (!f2fs_compressed_file(inode))
> +		return true;
> +	/* not support compression */
> +	return false;
> +}
> +static inline struct page *f2fs_compress_control_page(struct page *page)
> +{
> +	WARN_ON_ONCE(1);
> +	return ERR_PTR(-EINVAL);
>  }
> +#endif
>  
>  #define F2FS_FEATURE_FUNCS(name, flagname) \
>  static inline int f2fs_sb_has_##name(struct f2fs_sb_info *sbi) \
> @@ -3616,6 +3833,7 @@ F2FS_FEATURE_FUNCS(lost_found, LOST_FOUND);
>  F2FS_FEATURE_FUNCS(verity, VERITY);
>  F2FS_FEATURE_FUNCS(sb_chksum, SB_CHKSUM);
>  F2FS_FEATURE_FUNCS(casefold, CASEFOLD);
> +F2FS_FEATURE_FUNCS(compression, COMPRESSION);
>  
>  #ifdef CONFIG_BLK_DEV_ZONED
>  static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
> @@ -3697,6 +3915,15 @@ static inline bool f2fs_may_encrypt(struct inode *inode)
>  #endif
>  }
>  
> +static inline bool f2fs_may_compress(struct inode *inode)
> +{
> +	if (IS_SWAPFILE(inode) || f2fs_is_pinned_file(inode) ||
> +				f2fs_is_atomic_file(inode) ||
> +				f2fs_is_volatile_file(inode))
> +		return false;
> +	return S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode);
> +}
> +
>  static inline int block_unaligned_IO(struct inode *inode,
>  				struct kiocb *iocb, struct iov_iter *iter)
>  {
> @@ -3728,6 +3955,8 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
>  		return true;
>  	if (f2fs_is_multi_device(sbi))
>  		return true;
> +	if (f2fs_compressed_file(inode))
> +		return true;
>  	/*
>  	 * for blkzoned device, fallback direct IO to buffered IO, so
>  	 * all IOs can be serialized by log-structured write.
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index a7d855efc294..15a7c5f1bc9f 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -51,7 +51,8 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  	struct inode *inode = file_inode(vmf->vma->vm_file);
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	struct dnode_of_data dn = { .node_changed = false };
> -	int err;
> +	bool need_alloc = true;
> +	int err = 0;
>  
>  	if (unlikely(f2fs_cp_error(sbi))) {
>  		err = -EIO;
> @@ -63,6 +64,20 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  		goto err;
>  	}
>  
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	if (f2fs_compressed_file(inode)) {
> +		int ret = f2fs_is_compressed_cluster(inode, page->index);
> +
> +		if (ret < 0) {
> +			err = ret;
> +			goto err;
> +		} else if (ret) {
> +			f2fs_bug_on(sbi, ret == CLUSTER_HAS_SPACE);
> +			need_alloc = false;
> +		}
> +	}
> +#endif
> +
>  	sb_start_pagefault(inode->i_sb);
>  
>  	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
> @@ -78,15 +93,17 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  		goto out_sem;
>  	}
>  
> -	/* block allocation */
> -	__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
> -	set_new_dnode(&dn, inode, NULL, NULL, 0);
> -	err = f2fs_get_block(&dn, page->index);
> -	f2fs_put_dnode(&dn);
> -	__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
> -	if (err) {
> -		unlock_page(page);
> -		goto out_sem;
> +	if (need_alloc) {
> +		/* block allocation */
> +		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
> +		set_new_dnode(&dn, inode, NULL, NULL, 0);
> +		err = f2fs_get_block(&dn, page->index);
> +		f2fs_put_dnode(&dn);
> +		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
> +		if (err) {
> +			unlock_page(page);
> +			goto out_sem;
> +		}
>  	}
>  
>  	/* fill the page */
> @@ -485,6 +502,9 @@ static int f2fs_file_mmap(struct file *file, struct vm_area_struct *vma)
>  	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
>  		return -EIO;
>  
> +	if (!f2fs_is_compress_backend_ready(inode))
> +		return -EOPNOTSUPP;
> +
>  	/* we don't need to use inline_data strictly */
>  	err = f2fs_convert_inline_inode(inode);
>  	if (err)
> @@ -492,6 +512,7 @@ static int f2fs_file_mmap(struct file *file, struct vm_area_struct *vma)
>  
>  	file_accessed(file);
>  	vma->vm_ops = &f2fs_file_vm_ops;
> +	set_inode_flag(inode, FI_MMAP_FILE);
>  	return 0;
>  }
>  
> @@ -518,6 +539,9 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>  	int nr_free = 0, ofs = dn->ofs_in_node, len = count;
>  	__le32 *addr;
>  	int base = 0;
> +	bool compressed_cluster = false;
> +	int cluster_index = 0, valid_blocks = 0;
> +	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
>  
>  	if (IS_INODE(dn->node_page) && f2fs_has_extra_attr(dn->inode))
>  		base = get_extra_isize(dn->inode);
> @@ -525,26 +549,51 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>  	raw_node = F2FS_NODE(dn->node_page);
>  	addr = blkaddr_in_node(raw_node) + base + ofs;
>  
> -	for (; count > 0; count--, addr++, dn->ofs_in_node++) {
> +	/* Assumption: truncateion starts with cluster */
> +	for (; count > 0; count--, addr++, dn->ofs_in_node++, cluster_index++) {
>  		block_t blkaddr = le32_to_cpu(*addr);
>  
> +		if (f2fs_compressed_file(dn->inode) &&
> +					!(cluster_index & (cluster_size - 1))) {
> +			if (compressed_cluster) {
> +				int compr_blocks = cluster_size - valid_blocks;
> +
> +				stat_sub_compr_blocks(dn->inode, compr_blocks);
> +				F2FS_I(dn->inode)->i_compressed_blocks -=
> +								compr_blocks;
> +			}
> +			compressed_cluster = (blkaddr == COMPRESS_ADDR);
> +			valid_blocks = 0;
> +		}
> +
>  		if (blkaddr == NULL_ADDR)
>  			continue;
>  
>  		dn->data_blkaddr = NULL_ADDR;
>  		f2fs_set_data_blkaddr(dn);
>  
> -		if (__is_valid_data_blkaddr(blkaddr) &&
> -			!f2fs_is_valid_blkaddr(sbi, blkaddr,
> +		if (__is_valid_data_blkaddr(blkaddr)) {
> +			if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
>  					DATA_GENERIC_ENHANCE))
> -			continue;
> +				continue;
> +			if (compressed_cluster)
> +				valid_blocks++;
> +		}
>  
> -		f2fs_invalidate_blocks(sbi, blkaddr);
>  		if (dn->ofs_in_node == 0 && IS_INODE(dn->node_page))
>  			clear_inode_flag(dn->inode, FI_FIRST_BLOCK_WRITTEN);
> +
> +		f2fs_invalidate_blocks(sbi, blkaddr);
>  		nr_free++;
>  	}
>  
> +	if (compressed_cluster) {
> +		int compr_blocks = cluster_size - valid_blocks;
> +
> +		stat_sub_compr_blocks(dn->inode, compr_blocks);
> +		F2FS_I(dn->inode)->i_compressed_blocks -= compr_blocks;
> +	}
> +
>  	if (nr_free) {
>  		pgoff_t fofs;
>  		/*
> @@ -587,6 +636,9 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
>  		return 0;
>  	}
>  
> +	if (f2fs_compressed_file(inode))
> +		return 0;
> +
>  	page = f2fs_get_lock_data_page(inode, index, true);
>  	if (IS_ERR(page))
>  		return PTR_ERR(page) == -ENOENT ? 0 : PTR_ERR(page);
> @@ -602,7 +654,7 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
>  	return 0;
>  }
>  
> -int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
> +static int do_truncate_blocks(struct inode *inode, u64 from, bool lock)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	struct dnode_of_data dn;
> @@ -667,6 +719,24 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
>  	return err;
>  }
>  
> +int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
> +{
> +	u64 free_from = from;
> +
> +	/*
> +	 * for compressed file, only support cluster size
> +	 * aligned truncation.
> +	 */
> +	if (f2fs_compressed_file(inode)) {
> +		size_t cluster_size = PAGE_SIZE <<
> +					F2FS_I(inode)->i_log_cluster_size;
> +
> +		free_from = roundup(from, cluster_size);
> +	}
> +
> +	return do_truncate_blocks(inode, free_from, lock);
> +}
> +
>  int f2fs_truncate(struct inode *inode)
>  {
>  	int err;
> @@ -783,6 +853,10 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
>  	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
>  		return -EIO;
>  
> +	if ((attr->ia_valid & ATTR_SIZE) &&
> +		!f2fs_is_compress_backend_ready(inode))
> +		return -EOPNOTSUPP;
> +
>  	err = setattr_prepare(dentry, attr);
>  	if (err)
>  		return err;
> @@ -1023,8 +1097,8 @@ static int __read_out_blkaddrs(struct inode *inode, block_t *blkaddr,
>  	} else if (ret == -ENOENT) {
>  		if (dn.max_level == 0)
>  			return -ENOENT;
> -		done = min((pgoff_t)ADDRS_PER_BLOCK(inode) - dn.ofs_in_node,
> -									len);
> +		done = min((pgoff_t)ADDRS_PER_BLOCK(inode) -
> +						dn.ofs_in_node, len);
>  		blkaddr += done;
>  		do_replace += done;
>  		goto next;
> @@ -1615,6 +1689,8 @@ static long f2fs_fallocate(struct file *file, int mode,
>  		return -EIO;
>  	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(inode)))
>  		return -ENOSPC;
> +	if (!f2fs_is_compress_backend_ready(inode))
> +		return -EOPNOTSUPP;
>  
>  	/* f2fs only support ->fallocate for regular file */
>  	if (!S_ISREG(inode->i_mode))
> @@ -1624,6 +1700,11 @@ static long f2fs_fallocate(struct file *file, int mode,
>  		(mode & (FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_INSERT_RANGE)))
>  		return -EOPNOTSUPP;
>  
> +	if (f2fs_compressed_file(inode) &&
> +		(mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_COLLAPSE_RANGE |
> +			FALLOC_FL_ZERO_RANGE | FALLOC_FL_INSERT_RANGE)))
> +		return -EOPNOTSUPP;
> +
>  	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE |
>  			FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_ZERO_RANGE |
>  			FALLOC_FL_INSERT_RANGE))
> @@ -1713,7 +1794,42 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>  			return -ENOTEMPTY;
>  	}
>  
> +	if (iflags & (F2FS_COMPR_FL | F2FS_NOCOMP_FL)) {
> +		if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
> +			return -EOPNOTSUPP;
> +		if ((iflags & F2FS_COMPR_FL) && (iflags & F2FS_NOCOMP_FL))
> +			return -EINVAL;
> +	}
> +
> +	if ((iflags ^ fi->i_flags) & F2FS_COMPR_FL) {
> +		if (S_ISREG(inode->i_mode) &&
> +			(fi->i_flags & F2FS_COMPR_FL || i_size_read(inode) ||
> +						F2FS_HAS_BLOCKS(inode)))
> +			return -EINVAL;
> +		if (iflags & F2FS_NOCOMP_FL)
> +			return -EINVAL;
> +		if (iflags & F2FS_COMPR_FL) {
> +			int err = f2fs_convert_inline_inode(inode);
> +
> +			if (err)
> +				return err;
> +
> +			if (!f2fs_may_compress(inode))
> +				return -EINVAL;
> +
> +			set_compress_context(inode);
> +			set_inode_flag(inode, FI_COMPRESSED_FILE);
> +			stat_inc_compr_inode(inode);
> +		}
> +	}
> +	if ((iflags ^ fi->i_flags) & F2FS_NOCOMP_FL) {
> +		if (fi->i_flags & F2FS_COMPR_FL)
> +			return -EINVAL;
> +	}
> +
>  	fi->i_flags = iflags | (fi->i_flags & ~mask);
> +	f2fs_bug_on(F2FS_I_SB(inode), (fi->i_flags & F2FS_COMPR_FL) &&
> +					(fi->i_flags & F2FS_NOCOMP_FL));
>  
>  	if (fi->i_flags & F2FS_PROJINHERIT_FL)
>  		set_inode_flag(inode, FI_PROJ_INHERIT);
> @@ -1739,11 +1855,13 @@ static const struct {
>  	u32 iflag;
>  	u32 fsflag;
>  } f2fs_fsflags_map[] = {
> +	{ F2FS_COMPR_FL,	FS_COMPR_FL },
>  	{ F2FS_SYNC_FL,		FS_SYNC_FL },
>  	{ F2FS_IMMUTABLE_FL,	FS_IMMUTABLE_FL },
>  	{ F2FS_APPEND_FL,	FS_APPEND_FL },
>  	{ F2FS_NODUMP_FL,	FS_NODUMP_FL },
>  	{ F2FS_NOATIME_FL,	FS_NOATIME_FL },
> +	{ F2FS_NOCOMP_FL,	FS_NOCOMP_FL },
>  	{ F2FS_INDEX_FL,	FS_INDEX_FL },
>  	{ F2FS_DIRSYNC_FL,	FS_DIRSYNC_FL },
>  	{ F2FS_PROJINHERIT_FL,	FS_PROJINHERIT_FL },
> @@ -1751,11 +1869,13 @@ static const struct {
>  };
>  
>  #define F2FS_GETTABLE_FS_FL (		\
> +		FS_COMPR_FL |		\
>  		FS_SYNC_FL |		\
>  		FS_IMMUTABLE_FL |	\
>  		FS_APPEND_FL |		\
>  		FS_NODUMP_FL |		\
>  		FS_NOATIME_FL |		\
> +		FS_NOCOMP_FL |		\
>  		FS_INDEX_FL |		\
>  		FS_DIRSYNC_FL |		\
>  		FS_PROJINHERIT_FL |	\
> @@ -1766,11 +1886,13 @@ static const struct {
>  		FS_CASEFOLD_FL)
>  
>  #define F2FS_SETTABLE_FS_FL (		\
> +		FS_COMPR_FL |		\
>  		FS_SYNC_FL |		\
>  		FS_IMMUTABLE_FL |	\
>  		FS_APPEND_FL |		\
>  		FS_NODUMP_FL |		\
>  		FS_NOATIME_FL |		\
> +		FS_NOCOMP_FL |		\
>  		FS_DIRSYNC_FL |		\
>  		FS_PROJINHERIT_FL |	\
>  		FS_CASEFOLD_FL)
> @@ -1891,6 +2013,12 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>  
>  	inode_lock(inode);
>  
> +	if (f2fs_compressed_file(inode) && !fi->i_compressed_blocks) {
> +		fi->i_flags &= ~F2FS_COMPR_FL;
> +		clear_inode_flag(inode, FI_COMPRESSED_FILE);
> +		stat_dec_compr_inode(inode);
> +	}
> +
>  	if (f2fs_is_atomic_file(inode)) {
>  		if (is_inode_flag_set(inode, FI_ATOMIC_REVOKE_REQUEST))
>  			ret = -EINVAL;
> @@ -3091,6 +3219,17 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>  		ret = -EAGAIN;
>  		goto out;
>  	}
> +
> +	if (f2fs_compressed_file(inode)) {
> +		if (F2FS_I(inode)->i_compressed_blocks) {
> +			ret = -EOPNOTSUPP;
> +			goto out;
> +		}
> +		F2FS_I(inode)->i_flags &= ~F2FS_COMPR_FL;
> +		clear_inode_flag(inode, FI_COMPRESSED_FILE);
> +		stat_dec_compr_inode(inode);
> +	}
> +
>  	ret = f2fs_convert_inline_inode(inode);
>  	if (ret)
>  		goto out;
> @@ -3343,6 +3482,17 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  	}
>  }
>  
> +static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
> +{
> +	struct file *file = iocb->ki_filp;
> +	struct inode *inode = file_inode(file);
> +
> +	if (!f2fs_is_compress_backend_ready(inode))
> +		return -EOPNOTSUPP;
> +
> +	return generic_file_read_iter(iocb, iter);
> +}
> +
>  static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  {
>  	struct file *file = iocb->ki_filp;
> @@ -3354,6 +3504,9 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		goto out;
>  	}
>  
> +	if (!f2fs_is_compress_backend_ready(inode))
> +		return -EOPNOTSUPP;
> +
>  	if (iocb->ki_flags & IOCB_NOWAIT) {
>  		if (!inode_trylock(inode)) {
>  			ret = -EAGAIN;
> @@ -3467,7 +3620,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  
>  const struct file_operations f2fs_file_operations = {
>  	.llseek		= f2fs_llseek,
> -	.read_iter	= generic_file_read_iter,
> +	.read_iter	= f2fs_file_read_iter,
>  	.write_iter	= f2fs_file_write_iter,
>  	.open		= f2fs_file_open,
>  	.release	= f2fs_release_file,
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 502bd491336a..7a85060adad5 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -200,6 +200,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	struct f2fs_inode *ri = F2FS_INODE(node_page);
>  	unsigned long long iblocks;
>  
>  	iblocks = le64_to_cpu(F2FS_INODE(node_page)->i_blocks);
> @@ -286,6 +287,19 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>  		return false;
>  	}
>  
> +	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
> +			fi->i_flags & F2FS_COMPR_FL &&
> +			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
> +						i_log_cluster_size)) {
> +		if (ri->i_compress_algorithm >= COMPRESS_MAX)
> +			return false;
> +		if (le64_to_cpu(ri->i_compressed_blocks) > inode->i_blocks)
> +			return false;
> +		if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
> +			ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE)
> +			return false;
> +	}
> +
>  	return true;
>  }
>  
> @@ -407,6 +421,20 @@ static int do_read_inode(struct inode *inode)
>  		fi->i_crtime.tv_nsec = le32_to_cpu(ri->i_crtime_nsec);
>  	}
>  
> +	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi)) {
> +		if (F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
> +					i_log_cluster_size)) {
> +			fi->i_compressed_blocks =
> +					le64_to_cpu(ri->i_compressed_blocks);
> +			fi->i_compress_algorithm = ri->i_compress_algorithm;
> +			fi->i_log_cluster_size = ri->i_log_cluster_size;
> +			fi->i_cluster_size = 1 << fi->i_log_cluster_size;
> +		}
> +
> +		if ((fi->i_flags & F2FS_COMPR_FL) && f2fs_may_compress(inode))
> +			set_inode_flag(inode, FI_COMPRESSED_FILE);
> +	}
> +
>  	F2FS_I(inode)->i_disk_time[0] = inode->i_atime;
>  	F2FS_I(inode)->i_disk_time[1] = inode->i_ctime;
>  	F2FS_I(inode)->i_disk_time[2] = inode->i_mtime;
> @@ -416,6 +444,8 @@ static int do_read_inode(struct inode *inode)
>  	stat_inc_inline_xattr(inode);
>  	stat_inc_inline_inode(inode);
>  	stat_inc_inline_dir(inode);
> +	stat_inc_compr_inode(inode);
> +	stat_add_compr_blocks(inode, F2FS_I(inode)->i_compressed_blocks);
>  
>  	return 0;
>  }
> @@ -569,6 +599,17 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
>  			ri->i_crtime_nsec =
>  				cpu_to_le32(F2FS_I(inode)->i_crtime.tv_nsec);
>  		}
> +
> +		if (f2fs_sb_has_compression(F2FS_I_SB(inode)) &&
> +			F2FS_FITS_IN_INODE(ri, F2FS_I(inode)->i_extra_isize,
> +							i_log_cluster_size)) {
> +			ri->i_compressed_blocks =
> +				cpu_to_le64(F2FS_I(inode)->i_compressed_blocks);
> +			ri->i_compress_algorithm =
> +				F2FS_I(inode)->i_compress_algorithm;
> +			ri->i_log_cluster_size =
> +				F2FS_I(inode)->i_log_cluster_size;
> +		}
>  	}
>  
>  	__set_inode_rdev(inode, ri);
> @@ -711,6 +752,8 @@ void f2fs_evict_inode(struct inode *inode)
>  	stat_dec_inline_xattr(inode);
>  	stat_dec_inline_dir(inode);
>  	stat_dec_inline_inode(inode);
> +	stat_dec_compr_inode(inode);
> +	stat_sub_compr_blocks(inode, F2FS_I(inode)->i_compressed_blocks);
>  
>  	if (likely(!f2fs_cp_error(sbi) &&
>  				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index d8ca896e109b..5490348bcc6a 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -119,6 +119,17 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
>  	if (F2FS_I(inode)->i_flags & F2FS_PROJINHERIT_FL)
>  		set_inode_flag(inode, FI_PROJ_INHERIT);
>  
> +	if (f2fs_sb_has_compression(sbi)) {
> +		/* Inherit the compression flag in directory */
> +		if ((F2FS_I(dir)->i_flags & F2FS_COMPR_FL) &&
> +					f2fs_may_compress(inode)) {
> +			set_compress_context(inode);
> +			F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
> +			set_inode_flag(inode, FI_COMPRESSED_FILE);
> +			stat_inc_compr_inode(inode);
> +		}
> +	}
> +
>  	f2fs_set_inode_flags(inode);
>  
>  	trace_f2fs_new_inode(inode, 0);
> @@ -149,6 +160,9 @@ static inline int is_extension_exist(const unsigned char *s, const char *sub)
>  	size_t sublen = strlen(sub);
>  	int i;
>  
> +	if (sublen == 1 && *sub == '*')
> +		return 1;
> +
>  	/*
>  	 * filename format of multimedia file should be defined as:
>  	 * "filename + '.' + extension + (optional: '.' + temp extension)".
> @@ -262,6 +276,48 @@ int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
>  	return 0;
>  }
>  
> +static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
> +						const unsigned char *name)
> +{
> +	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
> +	unsigned char (*ext)[F2FS_EXTENSION_LEN];
> +	unsigned int ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
> +	int i, cold_count, hot_count;
> +
> +	if (!f2fs_sb_has_compression(sbi) ||
> +			is_inode_flag_set(inode, FI_COMPRESSED_FILE) ||
> +			F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
> +			!f2fs_may_compress(inode))
> +		return;
> +
> +	down_read(&sbi->sb_lock);
> +
> +	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
> +	hot_count = sbi->raw_super->hot_ext_count;
> +
> +	for (i = cold_count; i < cold_count + hot_count; i++) {
> +		if (is_extension_exist(name, extlist[i])) {
> +			up_read(&sbi->sb_lock);
> +			return;
> +		}
> +	}
> +
> +	up_read(&sbi->sb_lock);
> +
> +	ext = F2FS_OPTION(sbi).extensions;
> +
> +	for (i = 0; i < ext_cnt; i++) {
> +		if (!is_extension_exist(name, ext[i]))
> +			continue;
> +
> +		F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
> +		set_compress_context(inode);
> +		set_inode_flag(inode, FI_COMPRESSED_FILE);
> +		stat_inc_compr_inode(inode);
> +		return;
> +	}
> +}
> +
>  static int f2fs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
>  						bool excl)
>  {
> @@ -286,6 +342,8 @@ static int f2fs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
>  	if (!test_opt(sbi, DISABLE_EXT_IDENTIFY))
>  		set_file_temperature(sbi, inode, dentry->d_name.name);
>  
> +	set_compress_inode(sbi, inode, dentry->d_name.name);
> +
>  	inode->i_op = &f2fs_file_inode_operations;
>  	inode->i_fop = &f2fs_file_operations;
>  	inode->i_mapping->a_ops = &f2fs_dblock_aops;
> @@ -297,6 +355,7 @@ static int f2fs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
>  		goto out;
>  	f2fs_unlock_op(sbi);
>  
> +	stat_inc_compr_inode(inode);
>  	f2fs_alloc_nid_done(sbi, ino);
>  
>  	d_instantiate_new(dentry, inode);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8c96d6008e20..8b977bbd6822 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2215,7 +2215,7 @@ void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr)
>  	struct sit_info *sit_i = SIT_I(sbi);
>  
>  	f2fs_bug_on(sbi, addr == NULL_ADDR);
> -	if (addr == NEW_ADDR)
> +	if (addr == NEW_ADDR || addr == COMPRESS_ADDR)
>  		return;
>  
>  	invalidate_mapping_pages(META_MAPPING(sbi), addr, addr);
> @@ -3022,7 +3022,8 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>  	if (fio->type == DATA) {
>  		struct inode *inode = fio->page->mapping->host;
>  
> -		if (is_cold_data(fio->page) || file_is_cold(inode))
> +		if (is_cold_data(fio->page) || file_is_cold(inode) ||
> +				f2fs_compressed_file(inode))
>  			return CURSEG_COLD_DATA;
>  		if (file_is_hot(inode) ||
>  				is_inode_flag_set(inode, FI_HOT_DATA) ||
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index a95467b202ea..a1b3951367cd 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -200,18 +200,6 @@ struct segment_allocation {
>  	void (*allocate_segment)(struct f2fs_sb_info *, int, bool);
>  };
>  
> -/*
> - * this value is set in page as a private data which indicate that
> - * the page is atomically written, and it is in inmem_pages list.
> - */
> -#define ATOMIC_WRITTEN_PAGE		((unsigned long)-1)
> -#define DUMMY_WRITTEN_PAGE		((unsigned long)-2)
> -
> -#define IS_ATOMIC_WRITTEN_PAGE(page)			\
> -		(page_private(page) == (unsigned long)ATOMIC_WRITTEN_PAGE)
> -#define IS_DUMMY_WRITTEN_PAGE(page)			\
> -		(page_private(page) == (unsigned long)DUMMY_WRITTEN_PAGE)
> -
>  #define MAX_SKIP_GC_COUNT			16
>  
>  struct inmem_pages {
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index b72d071aedd8..a543ee6b898c 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -141,6 +141,9 @@ enum {
>  	Opt_checkpoint_disable_cap,
>  	Opt_checkpoint_disable_cap_perc,
>  	Opt_checkpoint_enable,
> +	Opt_compress_algorithm,
> +	Opt_compress_log_size,
> +	Opt_compress_extension,
>  	Opt_err,
>  };
>  
> @@ -203,6 +206,9 @@ static match_table_t f2fs_tokens = {
>  	{Opt_checkpoint_disable_cap, "checkpoint=disable:%u"},
>  	{Opt_checkpoint_disable_cap_perc, "checkpoint=disable:%u%%"},
>  	{Opt_checkpoint_enable, "checkpoint=enable"},
> +	{Opt_compress_algorithm, "compress_algorithm=%s"},
> +	{Opt_compress_log_size, "compress_log_size=%u"},
> +	{Opt_compress_extension, "compress_extension=%s"},
>  	{Opt_err, NULL},
>  };
>  
> @@ -391,8 +397,9 @@ static int parse_options(struct super_block *sb, char *options)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>  	substring_t args[MAX_OPT_ARGS];
> +	unsigned char (*ext)[F2FS_EXTENSION_LEN];
>  	char *p, *name;
> -	int arg = 0;
> +	int arg = 0, ext_cnt;
>  	kuid_t uid;
>  	kgid_t gid;
>  #ifdef CONFIG_QUOTA
> @@ -810,6 +817,66 @@ static int parse_options(struct super_block *sb, char *options)
>  		case Opt_checkpoint_enable:
>  			clear_opt(sbi, DISABLE_CHECKPOINT);
>  			break;
> +		case Opt_compress_algorithm:
> +			if (!f2fs_sb_has_compression(sbi)) {
> +				f2fs_err(sbi, "Compression feature if off");
> +				return -EINVAL;
> +			}
> +			name = match_strdup(&args[0]);
> +			if (!name)
> +				return -ENOMEM;
> +			if (strlen(name) == 3 && !strcmp(name, "lzo")) {
> +				F2FS_OPTION(sbi).compress_algorithm =
> +								COMPRESS_LZO;
> +			} else if (strlen(name) == 3 &&
> +					!strcmp(name, "lz4")) {
> +				F2FS_OPTION(sbi).compress_algorithm =
> +								COMPRESS_LZ4;
> +			} else {
> +				kfree(name);
> +				return -EINVAL;
> +			}
> +			kfree(name);
> +			break;
> +		case Opt_compress_log_size:
> +			if (!f2fs_sb_has_compression(sbi)) {
> +				f2fs_err(sbi, "Compression feature is off");
> +				return -EINVAL;
> +			}
> +			if (args->from && match_int(args, &arg))
> +				return -EINVAL;
> +			if (arg < MIN_COMPRESS_LOG_SIZE ||
> +				arg > MAX_COMPRESS_LOG_SIZE) {
> +				f2fs_err(sbi,
> +					"Compress cluster log size is out of range");
> +				return -EINVAL;
> +			}
> +			F2FS_OPTION(sbi).compress_log_size = arg;
> +			break;
> +		case Opt_compress_extension:
> +			if (!f2fs_sb_has_compression(sbi)) {
> +				f2fs_err(sbi, "Compression feature is off");
> +				return -EINVAL;
> +			}
> +			name = match_strdup(&args[0]);
> +			if (!name)
> +				return -ENOMEM;
> +
> +			ext = F2FS_OPTION(sbi).extensions;
> +			ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
> +
> +			if (strlen(name) >= F2FS_EXTENSION_LEN ||
> +				ext_cnt >= COMPRESS_EXT_NUM) {
> +				f2fs_err(sbi,
> +					"invalid extension length/number");
> +				kfree(name);
> +				return -EINVAL;
> +			}
> +
> +			strcpy(ext[ext_cnt], name);
> +			F2FS_OPTION(sbi).compress_ext_cnt++;
> +			kfree(name);
> +			break;
>  		default:
>  			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
>  				 p);
> @@ -1125,6 +1192,8 @@ static void f2fs_put_super(struct super_block *sb)
>  	f2fs_destroy_node_manager(sbi);
>  	f2fs_destroy_segment_manager(sbi);
>  
> +	f2fs_destroy_post_read_wq(sbi);
> +
>  	kfree(sbi->ckpt);
>  
>  	f2fs_unregister_sysfs(sbi);
> @@ -1332,6 +1401,35 @@ static inline void f2fs_show_quota_options(struct seq_file *seq,
>  #endif
>  }
>  
> +static inline void f2fs_show_compress_options(struct seq_file *seq,
> +							struct super_block *sb)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> +	char *algtype = "";
> +	int i;
> +
> +	if (!f2fs_sb_has_compression(sbi))
> +		return;
> +
> +	switch (F2FS_OPTION(sbi).compress_algorithm) {
> +	case COMPRESS_LZO:
> +		algtype = "lzo";
> +		break;
> +	case COMPRESS_LZ4:
> +		algtype = "lz4";
> +		break;
> +	}
> +	seq_printf(seq, ",compress_algorithm=%s", algtype);
> +
> +	seq_printf(seq, ",compress_log_size=%u",
> +			F2FS_OPTION(sbi).compress_log_size);
> +
> +	for (i = 0; i < F2FS_OPTION(sbi).compress_ext_cnt; i++) {
> +		seq_printf(seq, ",compress_extension=%s",
> +			F2FS_OPTION(sbi).extensions[i]);
> +	}
> +}
> +
>  static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_SB(root->d_sb);
> @@ -1454,6 +1552,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>  		seq_printf(seq, ",fsync_mode=%s", "strict");
>  	else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_NOBARRIER)
>  		seq_printf(seq, ",fsync_mode=%s", "nobarrier");
> +
> +	f2fs_show_compress_options(seq, sbi->sb);
>  	return 0;
>  }
>  
> @@ -1468,6 +1568,9 @@ static void default_options(struct f2fs_sb_info *sbi)
>  	F2FS_OPTION(sbi).test_dummy_encryption = false;
>  	F2FS_OPTION(sbi).s_resuid = make_kuid(&init_user_ns, F2FS_DEF_RESUID);
>  	F2FS_OPTION(sbi).s_resgid = make_kgid(&init_user_ns, F2FS_DEF_RESGID);
> +	F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZO;
> +	F2FS_OPTION(sbi).compress_log_size = MIN_COMPRESS_LOG_SIZE;
> +	F2FS_OPTION(sbi).compress_ext_cnt = 0;
>  
>  	set_opt(sbi, BG_GC);
>  	set_opt(sbi, INLINE_XATTR);
> @@ -3397,6 +3500,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		goto free_devices;
>  	}
>  
> +	err = f2fs_init_post_read_wq(sbi);
> +	if (err) {
> +		f2fs_err(sbi, "Failed to initialize post read workqueue");
> +		goto free_devices;
> +	}
> +
>  	sbi->total_valid_node_count =
>  				le32_to_cpu(sbi->ckpt->valid_node_count);
>  	percpu_counter_set(&sbi->total_valid_inode_count,
> @@ -3618,6 +3727,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	f2fs_destroy_node_manager(sbi);
>  free_sm:
>  	f2fs_destroy_segment_manager(sbi);
> +	f2fs_destroy_post_read_wq(sbi);
>  free_devices:
>  	destroy_device_list(sbi);
>  	kfree(sbi->ckpt);
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index f164959e4224..612a2b16d55c 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -154,6 +154,9 @@ static ssize_t features_show(struct f2fs_attr *a,
>  	if (f2fs_sb_has_casefold(sbi))
>  		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
>  				len ? ", " : "", "casefold");
> +	if (f2fs_sb_has_compression(sbi))
> +		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
> +				len ? ", " : "", "compression");
>  	len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
>  				len ? ", " : "", "pin_file");
>  	len += snprintf(buf + len, PAGE_SIZE - len, "\n");
> @@ -389,6 +392,7 @@ enum feat_id {
>  	FEAT_VERITY,
>  	FEAT_SB_CHECKSUM,
>  	FEAT_CASEFOLD,
> +	FEAT_COMPRESSION,
>  };
>  
>  static ssize_t f2fs_feature_show(struct f2fs_attr *a,
> @@ -408,6 +412,7 @@ static ssize_t f2fs_feature_show(struct f2fs_attr *a,
>  	case FEAT_VERITY:
>  	case FEAT_SB_CHECKSUM:
>  	case FEAT_CASEFOLD:
> +	case FEAT_COMPRESSION:
>  		return snprintf(buf, PAGE_SIZE, "supported\n");
>  	}
>  	return 0;
> @@ -502,6 +507,7 @@ F2FS_FEATURE_RO_ATTR(verity, FEAT_VERITY);
>  #endif
>  F2FS_FEATURE_RO_ATTR(sb_checksum, FEAT_SB_CHECKSUM);
>  F2FS_FEATURE_RO_ATTR(casefold, FEAT_CASEFOLD);
> +F2FS_FEATURE_RO_ATTR(compression, FEAT_COMPRESSION);
>  
>  #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
>  static struct attribute *f2fs_attrs[] = {
> @@ -571,6 +577,7 @@ static struct attribute *f2fs_feat_attrs[] = {
>  #endif
>  	ATTR_LIST(sb_checksum),
>  	ATTR_LIST(casefold),
> +	ATTR_LIST(compression),
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(f2fs_feat);
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index 284738996028..cc203883b31d 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -21,8 +21,15 @@
>  #define F2FS_EXTENSION_LEN		8	/* max size of extension */
>  #define F2FS_BLK_ALIGN(x)	(((x) + F2FS_BLKSIZE - 1) >> F2FS_BLKSIZE_BITS)
>  
> +#define CLUSTER_IS_FULL			1
> +#define	CLUSTER_HAS_SPACE		2
> +
> +#define COMPRESSED_CLUSTER		1
> +#define NORMAL_CLUSTER			2

I removed the above defs.

> +
>  #define NULL_ADDR		((block_t)0)	/* used as block_t addresses */
>  #define NEW_ADDR		((block_t)-1)	/* used as block_t addresses */
> +#define COMPRESS_ADDR		((block_t)-2)	/* used as compressed data flag */
>  
>  #define F2FS_BYTES_TO_BLK(bytes)	((bytes) >> F2FS_BLKSIZE_BITS)
>  #define F2FS_BLK_TO_BYTES(blk)		((blk) << F2FS_BLKSIZE_BITS)
> @@ -271,6 +278,10 @@ struct f2fs_inode {
>  			__le32 i_inode_checksum;/* inode meta checksum */
>  			__le64 i_crtime;	/* creation time */
>  			__le32 i_crtime_nsec;	/* creation time in nano scale */
> +			__le64 i_compressed_blocks;	/* # of compressed blocks */
> +			__u8 i_compress_algorithm;	/* compress algorithm */
> +			__u8 i_log_cluster_size;	/* log of cluster size */
> +			__le16 i_padding;		/* padding */
>  			__le32 i_extra_end[0];	/* for attribute size calculation */
>  		} __packed;
>  		__le32 i_addr[DEF_ADDRS_PER_INODE];	/* Pointers to data blocks */
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 1796ff99c3e9..cb51ea00dbc7 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -148,6 +148,11 @@ TRACE_DEFINE_ENUM(CP_TRIMMED);
>  		{ F2FS_GOING_DOWN_METAFLUSH,	"meta flush" },		\
>  		{ F2FS_GOING_DOWN_NEED_FSCK,	"need fsck" })
>  
> +#define show_compress_algorithm(type)					\
> +	__print_symbolic(type,						\
> +		{ COMPRESS_LZO,		"LZO" },			\
> +		{ COMPRESS_LZ4,		"LZ4" })
> +
>  struct f2fs_sb_info;
>  struct f2fs_io_info;
>  struct extent_info;
> @@ -1710,6 +1715,100 @@ TRACE_EVENT(f2fs_shutdown,
>  		__entry->ret)
>  );
>  
> +DECLARE_EVENT_CLASS(f2fs_zip_start,
> +
> +	TP_PROTO(struct inode *inode, unsigned int cluster_idx,
> +			unsigned int cluster_size, unsigned char algtype),
> +
> +	TP_ARGS(inode, cluster_idx, cluster_size, algtype),
> +
> +	TP_STRUCT__entry(
> +		__field(dev_t,	dev)
> +		__field(ino_t,	ino)
> +		__field(unsigned int, idx)
> +		__field(unsigned int, size)
> +		__field(unsigned int, algtype)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->dev = inode->i_sb->s_dev;
> +		__entry->ino = inode->i_ino;
> +		__entry->idx = cluster_idx;
> +		__entry->size = cluster_size;
> +		__entry->algtype = algtype;
> +	),
> +
> +	TP_printk("dev = (%d,%d), ino = %lu, cluster_idx:%u, "
> +		"cluster_size = %u, algorithm = %s",
> +		show_dev_ino(__entry),
> +		__entry->idx,
> +		__entry->size,
> +		show_compress_algorithm(__entry->algtype))
> +);
> +
> +DECLARE_EVENT_CLASS(f2fs_zip_end,
> +
> +	TP_PROTO(struct inode *inode, unsigned int cluster_idx,
> +			unsigned int compressed_size, int ret),
> +
> +	TP_ARGS(inode, cluster_idx, compressed_size, ret),
> +
> +	TP_STRUCT__entry(
> +		__field(dev_t,	dev)
> +		__field(ino_t,	ino)
> +		__field(unsigned int, idx)
> +		__field(unsigned int, size)
> +		__field(unsigned int, ret)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->dev = inode->i_sb->s_dev;
> +		__entry->ino = inode->i_ino;
> +		__entry->idx = cluster_idx;
> +		__entry->size = compressed_size;
> +		__entry->ret = ret;
> +	),
> +
> +	TP_printk("dev = (%d,%d), ino = %lu, cluster_idx:%u, "
> +		"compressed_size = %u, ret = %d",
> +		show_dev_ino(__entry),
> +		__entry->idx,
> +		__entry->size,
> +		__entry->ret)
> +);
> +
> +DEFINE_EVENT(f2fs_zip_start, f2fs_compress_pages_start,
> +
> +	TP_PROTO(struct inode *inode, unsigned int cluster_idx,
> +		unsigned int cluster_size, unsigned char algtype),
> +
> +	TP_ARGS(inode, cluster_idx, cluster_size, algtype)
> +);
> +
> +DEFINE_EVENT(f2fs_zip_start, f2fs_decompress_pages_start,
> +
> +	TP_PROTO(struct inode *inode, unsigned int cluster_idx,
> +		unsigned int cluster_size, unsigned char algtype),
> +
> +	TP_ARGS(inode, cluster_idx, cluster_size, algtype)
> +);
> +
> +DEFINE_EVENT(f2fs_zip_end, f2fs_compress_pages_end,
> +
> +	TP_PROTO(struct inode *inode, unsigned int cluster_idx,
> +			unsigned int compressed_size, int ret),
> +
> +	TP_ARGS(inode, cluster_idx, compressed_size, ret)
> +);
> +
> +DEFINE_EVENT(f2fs_zip_end, f2fs_decompress_pages_end,
> +
> +	TP_PROTO(struct inode *inode, unsigned int cluster_idx,
> +			unsigned int compressed_size, int ret),
> +
> +	TP_ARGS(inode, cluster_idx, compressed_size, ret)
> +);
> +
>  #endif /* _TRACE_F2FS_H */
>  
>   /* This part must be outside protection */
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
