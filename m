Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CF7E69F2
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Oct 2019 23:50:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOrMe-0005eB-Oz; Sun, 27 Oct 2019 22:50:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iOrMc-0005dv-TB
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 27 Oct 2019 22:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0qSd0y4BXQjOLM3dGSiphWUwLa3uRMSEfQf83c1X/IE=; b=P4/U2VmqZziSSZkf2qI3EfR+I/
 LTe38ifQkBnpV3VZ/ycQOetamKGLv3mrbNITyhq3CZM6pFgJ1E4Wx1st83cd8EgI954rC7dxL1Njw
 5r7yUbItgKGtZgS3lCq4R3NKQCyyqRHlFRgFfyNqHCu8a1hMsuoB5zTFx7l2SigMJKK4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0qSd0y4BXQjOLM3dGSiphWUwLa3uRMSEfQf83c1X/IE=; b=l826CfZzb7UC6Zw5g9QyK4B18j
 h5ez4sC2hlHSkqNvlV0mHRJHn47F2NgUt4dJiqiTovJCe/kd5WYRs2Ttp3rNYM6FmtIvPHGzFTYps
 ExSrL+ROrsLsAJbOUFIs44LpRiwky0db/AUyVKDGwTUgVb56kaq4qS1/lvr2Su3C5HEg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iOrMZ-005YvD-Lv
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 27 Oct 2019 22:50:22 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31C3A2070B;
 Sun, 27 Oct 2019 22:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572216608;
 bh=/TxaS2Bhne1i+w3r5XkjvJP663oZM1KCPUpkTfhjx/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YC9amfFU5noAATZn1q67O/DJYpJdAhyYevvjegFgPrv1jjrmxvJi3Q0IszOrb73jO
 YOOhjfgcrOQUPNEzGGaXNu55t43OyOkttafBo/PoVriRGp0lHGPtPbQOapizI3+KlA
 sKSuATLQ0rQEz/cq7n3NkBqgZXs9ePUf3WQ7OkTs=
Date: Sun, 27 Oct 2019 15:50:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20191027225006.GA321938@sol.localdomain>
Mail-Followup-To: Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20191022171602.93637-1-jaegeuk@kernel.org>
 <20191022171602.93637-2-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022171602.93637-2-jaegeuk@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iOrMZ-005YvD-Lv
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: support data compression
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

On Tue, Oct 22, 2019 at 10:16:02AM -0700, Jaegeuk Kim wrote:
> diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
> index 29020af0cff9..d1accf665c86 100644
> --- a/Documentation/filesystems/f2fs.txt
> +++ b/Documentation/filesystems/f2fs.txt
> @@ -235,6 +235,13 @@ checkpoint=%s[:%u[%]]     Set to "disable" to turn off checkpointing. Set to "en
>                         hide up to all remaining free space. The actual space that
>                         would be unusable can be viewed at /sys/fs/f2fs/<disk>/unusable
>                         This space is reclaimed once checkpoint=enable.
> +compress_algorithm=%s  Control compress algorithm, currently f2fs supports "lzo"
> +                       and "lz4" algorithm.
> +compress_log_size=%u   Support configuring compress cluster size, the size will
> +                       be 4kb * (1 << %u), 16kb is minimum size, also it's
> +                       default size.

kb means kilobits, not kilobytes.

> +compress_extension=%s  Support adding specified extension, so that f2fs can
> +                       enable compression on those corresponding file.

What does "Support adding specified extension" mean?  And does "so that f2fs can
enable compression on those corresponding file" mean that f2fs can't enable
compression on other files?  Please be clear about what this option does.

>  
>  ================================================================================
>  DEBUGFS ENTRIES
> @@ -837,3 +844,44 @@ zero or random data, which is useful to the below scenario where:
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
> +- In cluster metadata layout, one special flag is used to indicate cluster
> +is compressed one or normal one, for compressed cluster, following metadata
> +maps cluster to [1, 4 << n - 1] physical blocks, in where f2fs stores
> +data including compress header and compressed data.

In the code it's actually a special block address, not a "flag".

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
> index 652fd2e2b23d..c12854c3b1a1 100644
> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -6,6 +6,10 @@ config F2FS_FS
>  	select CRYPTO
>  	select CRYPTO_CRC32
>  	select F2FS_FS_XATTR if FS_ENCRYPTION
> +	select LZO_COMPRESS
> +	select LZO_DECOMPRESS
> +	select LZ4_COMPRESS
> +	select LZ4_DECOMPRESS

As someone else suggested, there's not much need to support LZO, since LZ4 is
usually better.  Also, compression support should be behind a kconfig option, so
it doesn't cause bloat or extra attack surface for people who don't want it.

> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> new file mode 100644
> index 000000000000..f276d82a67aa
> --- /dev/null
> +++ b/fs/f2fs/compress.c
> @@ -0,0 +1,1066 @@
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
> +	return index % cc->cluster_size;
> +}
> +
> +static unsigned int cluster_idx(struct compress_ctx *cc, pgoff_t index)
> +{
> +	return index / cc->cluster_size;
> +}

% and / are slow on values that aren't power-of-2 constants.  Since cluster_size
is always a power of 2, how about also keeping cluster_size_bits and doing:

	index & (cc->cluster_size - 1)

and
	index >> cc->cluster_size_bits

> +
> +static unsigned int start_idx_of_cluster(struct compress_ctx *cc)
> +{
> +	return cc->cluster_idx * cc->cluster_size;
> +}

and here:

	cc->cluster_idx << cc->cluster_size_bits

> +bool f2fs_is_compressed_page(struct page *page)
> +{
> +	if (!page_private(page))
> +		return false;
> +	if (IS_ATOMIC_WRITTEN_PAGE(page) || IS_DUMMY_WRITTEN_PAGE(page))
> +		return false;
> +	return *((u32 *)page_private(page)) == F2FS_COMPRESSED_PAGE_MAGIC;
> +}

This code implies that there can be multiple page private structures each of
which has a different magic number.  But I only see F2FS_COMPRESSED_PAGE_MAGIC.
Where in the code is the other one(s)?

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

It isn't really appropriate to create fake pagecache pages like this.  Did you
consider changing f2fs to use fscrypt_decrypt_block_inplace() instead?

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
> +	if (cc->rpages)
> +		return 0;
> +	cc->rpages = f2fs_kzalloc(sbi, sizeof(struct page *) * cc->cluster_size,
> +								GFP_KERNEL);
> +	if (!cc->rpages)
> +		return -ENOMEM;
> +	return 0;
> +}

Is it really okay to be using GFP_KERNEL from ->writepages()?

> +
> +void f2fs_destroy_compress_ctx(struct compress_ctx *cc)
> +{
> +	kvfree(cc->rpages);
> +}

The memory is allocated with kzalloc(), so why is it freed with kvfree() and not
just kfree()?

> +
> +int f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page)
> +{
> +	unsigned int cluster_ofs;
> +
> +	if (!f2fs_cluster_can_merge_page(cc, page->index))
> +		return -EAGAIN;

All callers do f2fs_bug_on() if this error is hit, so why not do the
f2fs_bug_on() here instead?

> +
> +	cluster_ofs = offset_in_cluster(cc, page->index);
> +	cc->rpages[cluster_ofs] = page;
> +	cc->nr_rpages++;
> +	cc->cluster_idx = cluster_idx(cc, page->index);
> +	return 0;
> +}
> +
> +static int lzo_init_compress_ctx(struct compress_ctx *cc)
> +{
> +	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
> +				LZO1X_MEM_COMPRESS, GFP_KERNEL);
> +	if (!cc->private)
> +		return -ENOMEM;
> +
> +	cc->clen = lzo1x_worst_compress(PAGE_SIZE * cc->cluster_size);
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
> +		printk_ratelimited("%sF2FS-fs: lzo compress failed, ret:%d\n",
> +								KERN_ERR, ret);
> +		return -EIO;
> +	}
> +	return 0;
> +}

Why not using f2fs_err()?  Same in lots of other places.

> +
> +static int lzo_decompress_pages(struct decompress_io_ctx *dic)
> +{
> +	int ret;
> +
> +	ret = lzo1x_decompress_safe(dic->cbuf->cdata, dic->clen,
> +						dic->rbuf, &dic->rlen);
> +	if (ret != LZO_E_OK) {
> +		printk_ratelimited("%sF2FS-fs: lzo decompress failed, ret:%d\n",
> +								KERN_ERR, ret);
> +		return -EIO;
> +	}
> +
> +	if (dic->rlen != PAGE_SIZE * dic->cluster_size) {
> +		printk_ratelimited("%sF2FS-fs: lzo invalid rlen:%zu, "
> +					"expected:%lu\n", KERN_ERR, dic->rlen,
> +					PAGE_SIZE * dic->cluster_size);
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
> +
> +static int lz4_init_compress_ctx(struct compress_ctx *cc)
> +{
> +	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
> +				LZO1X_MEM_COMPRESS, GFP_KERNEL);

Why is it using LZO1X_MEM_COMPRESS for LZ4?

> +	if (!cc->private)
> +		return -ENOMEM;
> +
> +	cc->clen = LZ4_compressBound(PAGE_SIZE * cc->cluster_size);
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
> +		printk_ratelimited("%sF2FS-fs: lz4 compress failed\n",
> +								KERN_ERR);
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
> +		printk_ratelimited("%sF2FS-fs: lz4 decompress failed, ret:%d\n",
> +								KERN_ERR, ret);
> +		return -EIO;
> +	}
> +
> +	if (ret != PAGE_SIZE * dic->cluster_size) {
> +		printk_ratelimited("%sF2FS-fs: lz4 invalid rlen:%zu, "
> +					"expected:%lu\n", KERN_ERR, dic->rlen,
> +					PAGE_SIZE * dic->cluster_size);
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
> +
> +static void f2fs_release_cluster_pages(struct compress_ctx *cc)
> +{
> +	int i;
> +
> +	for (i = 0; i < cc->nr_rpages; i++) {
> +		inode_dec_dirty_pages(cc->inode);
> +		unlock_page(cc->rpages[i]);
> +	}
> +}
> +
> +static struct page *f2fs_grab_page(void)
> +{
> +	struct page *page;
> +
> +	page = alloc_pages(GFP_KERNEL, 0);

This should use alloc_page(), not alloc_pages().

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
> +				sbi->cops[fi->i_compress_algorithm];
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
> +	cc->nr_cpages = roundup(max_len, PAGE_SIZE) / PAGE_SIZE;
> +
> +	cc->cpages = f2fs_kzalloc(sbi, sizeof(struct page *) *
> +					cc->nr_cpages, GFP_KERNEL);
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

If this fails, then at out_free_cpages it will dereference a NULL pointer in
cc->cpages[i].

> +	}
> +
> +	cc->rbuf = vmap(cc->rpages, cc->cluster_size, VM_MAP, PAGE_KERNEL);
> +	if (!cc->rbuf) {
> +		ret = -ENOMEM;
> +		goto destroy_compress_ctx;
> +	}

Wrong error label.  Should be out_free_cpages.

> +
> +	cc->cbuf = vmap(cc->cpages, cc->nr_cpages, VM_MAP, PAGE_KERNEL);
> +	if (!cc->cbuf) {
> +		ret = -ENOMEM;
> +		goto out_vunmap_rbuf;
> +	}

It would be sufficient to map these pages read-only, i.e. use PAGE_KERNEL_RO.

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

Since we already know the max length we're willing to compress to (the max
length for any space to be saved), why is more space than that being allocated?
LZ4_compress_default() will return an error if there isn't enough space, so that
error could just be used as the indication to store the data uncompressed.

> +
> +	cc->cbuf->clen = cpu_to_le32(cc->clen);
> +	cc->cbuf->chksum = 0;

What is the point of the chksum field?  It's always set to 0 and never checked.

> +
> +	vunmap(cc->cbuf);
> +	vunmap(cc->rbuf);
> +
> +	nr_cpages = roundup(cc->clen + COMPRESS_HEADER_SIZE, PAGE_SIZE) /
> +								PAGE_SIZE;
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
> +out_vunmap_cbuf:
> +	vunmap(cc->cbuf);
> +out_vunmap_rbuf:
> +	vunmap(cc->rbuf);
> +out_free_cpages:
> +	for (i = 0; i < cc->nr_cpages; i++)
> +		f2fs_put_compressed_page(cc->cpages[i]);
> +	kvfree(cc->cpages);
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
> +			sbi->cops[fi->i_compress_algorithm];

Where is it checked that i_compress_algorithm is a valid compression algorithm?

> +	int ret;
> +
> +	dec_page_count(sbi, F2FS_RD_DATA);
> +
> +	if (bio->bi_status)
> +		dic->err = true;
> +
> +	if (refcount_dec_not_one(&dic->ref))
> +		return;
> +
> +	trace_f2fs_decompress_pages_start(dic->inode, dic->cluster_idx,
> +				dic->cluster_size, fi->i_compress_algorithm);
> +
> +	/* submit partial compressed pages */
> +	if (dic->err) {
> +		ret = dic->err;

This sets 'ret' to a bool, whereas elsewhere it's set to a negative error value.
Which one is it?

> +		goto out_free_dic;
> +	}
> +
> +	dic->rbuf = vmap(dic->tpages, dic->cluster_size, VM_MAP, PAGE_KERNEL);
> +	if (!dic->rbuf) {
> +		ret = -ENOMEM;
> +		goto out_free_dic;
> +	}
> +
> +	dic->cbuf = vmap(dic->cpages, dic->nr_cpages, VM_MAP, PAGE_KERNEL);
> +	if (!dic->cbuf) {
> +		ret = -ENOMEM;
> +		goto out_vunmap_rbuf;
> +	}

It would be sufficient to map the source pages read-only.

> +
> +	dic->clen = le32_to_cpu(dic->cbuf->clen);
> +	dic->rlen = PAGE_SIZE * dic->cluster_size;

Shouldn't it also be verified that the reserved header fields are 0?
Otherwise, it may be difficult to use them for anything in the future.

> +
> +	if (dic->clen > PAGE_SIZE * dic->nr_cpages - COMPRESS_HEADER_SIZE) {
> +		ret = -EFAULT;
> +		goto out_vunmap_cbuf;
> +	}

EFAULT isn't an appropriate error code for corrupt on-disk data.  It should be
EFSCORRUPTED.

> +
> +	ret = cops->decompress_pages(dic);
> +
> +out_vunmap_cbuf:
> +	vunmap(dic->cbuf);
> +out_vunmap_rbuf:
> +	vunmap(dic->rbuf);
> +out_free_dic:
> +	f2fs_set_cluster_uptodate(dic->rpages, dic->cluster_size, ret, verity);

This is passing a -errno value to a function that takes a bool.

> +	f2fs_free_dic(dic);
> +
> +	trace_f2fs_decompress_pages_end(dic->inode, dic->cluster_idx,
> +							dic->clen, ret);

This is freeing 'dic' and then immediately using it again...

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
> +	if (f2fs_cluster_is_full(cc))
> +		return false;
> +	return is_page_in_cluster(cc, index);
> +}

Why is the f2fs_cluster_is_full() check needed in f2fs_cluster_can_merge_page()?
If all pages of the cluster have already been added, then the next one can't be
in the same cluster.

> +
> +static bool __cluster_may_compress(struct compress_ctx *cc)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
> +	loff_t i_size = i_size_read(cc->inode);
> +	const pgoff_t end_index = ((unsigned long long)i_size)
> +					>> PAGE_SHIFT;
> +	unsigned offset;
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
> +		if (f2fs_is_drop_cache(cc->inode))
> +			return false;
> +		if (f2fs_is_volatile_file(cc->inode))
> +			return false;
> +
> +		offset = i_size & (PAGE_SIZE - 1);
> +		if ((page->index > end_index) ||
> +			(page->index == end_index && !offset))
> +			return false;

No need to have a special case for when i_size is a multiple of the page size.
Just replace end_index with 'nr_pages = DIV_ROUND_UP(i_size, PAGE_SIZE)' and
check for page->index >= nr_pages.

> +	}
> +	return true;
> +}
> +
> +int f2fs_is_cluster_existed(struct compress_ctx *cc)
> +{

This function name doesn't make sense.  "is" is present tense whereas "existed"
is past tense.  Also, the name implies it returns a bool, whereas actually it
returns a negative errno value, 1, or 2.

> +out_fail:
> +	/* TODO: revoke partially updated block addresses */
> +	for (i += 1; i < cc->cluster_size; i++) {
> +		if (!cc->rpages[i])
> +			continue;
> +		redirty_page_for_writepage(wbc, cc->rpages[i]);
> +		unlock_page(cc->rpages[i]);
> +	}
> +	return err;

Un-addressed TODO.

> +static void f2fs_init_compress_ops(struct f2fs_sb_info *sbi)
> +{
> +	sbi->cops[COMPRESS_LZO] = &f2fs_lzo_ops;
> +	sbi->cops[COMPRESS_LZ4] = &f2fs_lz4_ops;
> +}

Why are the compression operations a per-superblock thing?  Seems this should be
a global table.

> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index ba3bcf4c7889..bac96c3a8bc9 100644
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
> @@ -94,6 +97,11 @@ static void __read_end_io(struct bio *bio)
>  	bio_for_each_segment_all(bv, bio, iter_all) {
>  		page = bv->bv_page;
>  
> +		if (compr && PagePrivate(page)) {
> +			f2fs_decompress_pages(bio, page, verity);
> +			continue;
> +		}
> +
>  		/* PG_error was set if any post_read step failed */
>  		if (bio->bi_status || PageError(page)) {
>  			ClearPageUptodate(page);
> @@ -110,60 +118,67 @@ static void __read_end_io(struct bio *bio)
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
>  
> -	bio_post_read_processing(ctx);
> +	if (ctx->enabled_steps & (1 << STEP_DECOMPRESS)) {
> +		decompress_work(ctx,
> +			ctx->enabled_steps & (1 << STEP_VERITY));
> +		return;
> +	}
> +
> +	if (ctx->enabled_steps & (1 << STEP_VERITY))
> +		verity_work(ctx);
> +
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
>  {
> -	/*
> -	 * We use different work queues for decryption and for verity because
> -	 * verity may require reading metadata pages that need decryption, and
> -	 * we shouldn't recurse to the same workqueue.
> -	 */

Why is it okay (i.e., no deadlocks) to no longer use different work queues for
decryption and for verity?  See the comment above which is being deleted.

> +			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
> +					is_readahead ? REQ_RAHEAD : 0,
> +					page->index);
> +			if (IS_ERR(bio)) {
> +				ret = PTR_ERR(bio);
> +				bio = NULL;
> +				dic->err = true;

'err' conventionally means a -errno value.  Please call this 'failed' instead.

> +	/* TODO: cluster can be compressed due to race with .writepage */
> +

Another un-addressed TODO.

> +int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi)
> +{
> +	if (!f2fs_sb_has_encrypt(sbi) &&
> +		!f2fs_sb_has_compression(sbi))
> +		return 0;
> +
> +	sbi->post_read_wq = alloc_workqueue("f2fs_post_read_wq",
> +						 WQ_UNBOUND | WQ_HIGHPRI,
> +						 num_online_cpus());

post_read_wq is also needed if verity is enabled.

> +/* For compression */
> +enum compress_algrithm_type {
> +	COMPRESS_LZO,
> +	COMPRESS_LZ4,
> +	COMPRESS_MAX,
> +};

"algorithm" is misspelled.

> +
> +struct compress_data {
> +	__le32 clen;
> +	__le32 chksum;
> +	__le32 reserved[4];
> +	char cdata[];
> +};

cdata is binary, not a string.  So it should be 'u8', not 'char'.

> +
> +struct compress_ctx {
> +	struct inode *inode;
> +	unsigned int cluster_size;
> +	unsigned int cluster_idx;
> +	struct page **rpages;
> +	unsigned int nr_rpages;
> +	struct page **cpages;
> +	unsigned int nr_cpages;
> +	void *rbuf;
> +	struct compress_data *cbuf;
> +	size_t rlen;
> +	size_t clen;
> +	void *private;
> +};
> +
> +#define F2FS_COMPRESSED_PAGE_MAGIC	0xF5F2C000
> +struct compress_io_ctx {
> +	u32 magic;
> +	struct inode *inode;
> +	refcount_t ref;
> +	struct page **rpages;
> +	unsigned int nr_rpages;
> +};
> +
> +struct decompress_io_ctx {
> +	struct inode *inode;
> +	refcount_t ref;
> +	struct page **rpages;		/* raw pages from page cache */
> +	unsigned int nr_rpages;
> +	struct page **cpages;		/* pages contain compressed data */
> +	unsigned int nr_cpages;
> +	struct page **tpages;		/* temp pages to pad hole in cluster */
> +	void *rbuf;
> +	struct compress_data *cbuf;
> +	size_t rlen;
> +	size_t clen;
> +	unsigned int cluster_idx;
> +	unsigned int cluster_size;
> +	bool err;
> +};

Please add comments properly documenting these structures.

>  struct f2fs_private_dio {
> @@ -2375,6 +2473,8 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
>  /*
>   * On-disk inode flags (f2fs_inode::i_flags)
>   */
> +#define F2FS_COMPR_FL			0x00000004 /* Compress file */
> +#define F2FS_NOCOMP_FL			0x00000400 /* Don't compress */
>  #define F2FS_SYNC_FL			0x00000008 /* Synchronous updates */
>  #define F2FS_IMMUTABLE_FL		0x00000010 /* Immutable file */
>  #define F2FS_APPEND_FL			0x00000020 /* writes to file may only append */

Please keep these in numerical order.

> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 386ad54c13c3..e84ef90ffdee 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -407,6 +407,20 @@ static int do_read_inode(struct inode *inode)
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
> +		if ((fi->i_flags & FS_COMPR_FL) && f2fs_may_compress(inode))
> +			set_inode_flag(inode, FI_COMPRESSED_FILE);
> +	}

Need to validate that these fields are valid.

> @@ -119,6 +119,20 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
>  	if (F2FS_I(inode)->i_flags & F2FS_PROJINHERIT_FL)
>  		set_inode_flag(inode, FI_PROJ_INHERIT);
>  
> +	if (f2fs_sb_has_compression(sbi)) {
> +		F2FS_I(inode)->i_compress_algorithm =
> +				F2FS_OPTION(sbi).compress_algorithm;
> +		F2FS_I(inode)->i_log_cluster_size =
> +				F2FS_OPTION(sbi).compress_log_size;
> +		F2FS_I(inode)->i_cluster_size =
> +				1 << F2FS_I(inode)->i_log_cluster_size;
> +

Why are these compression fields being set on uncompressed files?

> @@ -810,6 +817,66 @@ static int parse_options(struct super_block *sb, char *options)
>  		case Opt_checkpoint_enable:
>  			clear_opt(sbi, DISABLE_CHECKPOINT);
>  			break;
> +		case Opt_compress_algorithm:
> +			if (!f2fs_sb_has_compression(sbi)) {
> +				f2fs_err(sbi, "Compression feature if off");
> +				return -EINVAL;

"if off" => "is off"

> +			}
> +			name = match_strdup(&args[0]);
> +			if (!name)
> +				return -ENOMEM;
> +			if (strlen(name) == 3 && !strncmp(name, "lzo", 3)) {

!strcmp(name, "lzo")

> +				F2FS_OPTION(sbi).compress_algorithm =
> +								COMPRESS_LZO;
> +			} else if (strlen(name) == 3 &&
> +					!strncmp(name, "lz4", 3)) {

!strcmp(name, "lz4")

> +				F2FS_OPTION(sbi).compress_algorithm =
> +								COMPRESS_LZ4;
> +			} else {
> +				kvfree(name);

Why not kfree()?

> +				return -EINVAL;
> +			}
> +			kvfree(name);
> +		case Opt_compress_log_size:
> +			if (!f2fs_sb_has_compression(sbi)) {
> +				f2fs_err(sbi, "Compression feature if off");
> +				return -EINVAL;
> +			}

"if off" => "is off"

> +			if (args->from && match_int(args, &arg))
> +				return -EINVAL;
> +			if (arg < MIN_COMPRESS_LOG_SIZE ||
> +				arg > MAX_COMPRESS_LOG_SIZE) {
> +				f2fs_err(sbi,
> +					"Compress cluster log size if out of range");

"if out of range" => "is out of range"

> +				return -EINVAL;
> +			}
> +			F2FS_OPTION(sbi).compress_log_size = arg;
> +			break;
> +		case Opt_compress_extension:
> +			if (!f2fs_sb_has_compression(sbi)) {
> +				f2fs_err(sbi, "Compression feature if off");

"if off" => "is off"

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
> +				kvfree(name);
> +				return -EINVAL;
> +			}
> +
> +			strcpy(ext[ext_cnt], name);
> +			F2FS_OPTION(sbi).compress_ext_cnt++;
> +			kvfree(name);

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
