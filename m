Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 691D01FEF47
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 12:06:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlrRA-0003eS-Mq; Thu, 18 Jun 2020 10:06:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jlrR8-0003e4-KL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 10:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8GntDmKBr4FKlWMu7qCadQwvPjkigO5HpUYBfSfTRY4=; b=CKFxjWGv3ayfoBxWRmlvHoXBS3
 qTL5xcLDOR66TEssajqAe9l5JwGCdrCdrnoA8WlSfuEWaEX7PW49T0E5UF/2UzBk8ywmd4Ri5dwY9
 Ce123tWSieJjE0taboIf9Fazzq69MtrhsRhvDdEJWqvFeKAtfHDiWgsz8b3w4zWULrJY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8GntDmKBr4FKlWMu7qCadQwvPjkigO5HpUYBfSfTRY4=; b=Us1qYTep/SEt/qlcFiHfTnDhJj
 RiWEAcDgtpt7DApntfwK+FT6M+Gw8XdB8PpfD2oOsN5L0OUclCl8GnAhGYhd++du9OS444LWtgCl1
 535YD9n48sTYzmsJ0XrYyBS5ijnmdyU2ebf6YSG2UHmH2EIV1vyj0aGpi7MFDz2G048U=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlrR4-008Eiu-Lg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 10:06:22 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C94E18C9742A71BE527C;
 Thu, 18 Jun 2020 18:06:08 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 18 Jun
 2020 18:06:03 +0800
To: Satya Tangirala <satyat@google.com>, <linux-fscrypt@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>,
 <linux-ext4@vger.kernel.org>
References: <20200617075732.213198-1-satyat@google.com>
 <20200617075732.213198-4-satyat@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <5e78e1be-f948-d54c-d28e-50f1f0a92ab3@huawei.com>
Date: Thu, 18 Jun 2020 18:06:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200617075732.213198-4-satyat@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jlrR4-008Eiu-Lg
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: add inline encryption support
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
Cc: Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/17 15:57, Satya Tangirala wrote:
> Wire up f2fs to support inline encryption via the helper functions which
> fs/crypto/ now provides.  This includes:
> 
> - Adding a mount option 'inlinecrypt' which enables inline encryption
>   on encrypted files where it can be used.
> 
> - Setting the bio_crypt_ctx on bios that will be submitted to an
>   inline-encrypted file.
> 
> - Not adding logically discontiguous data to bios that will be submitted
>   to an inline-encrypted file.
> 
> - Not doing filesystem-layer crypto on inline-encrypted files.
> 
> This patch includes a fix for a race during IPU by
> Sahitya Tummala <stummala@codeaurora.org>
> 
> Co-developed-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  Documentation/filesystems/f2fs.rst |  7 ++-
>  fs/f2fs/compress.c                 |  2 +-
>  fs/f2fs/data.c                     | 81 ++++++++++++++++++++++++------
>  fs/f2fs/super.c                    | 32 ++++++++++++
>  4 files changed, 104 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 099d45ac8d8f..4dc36143ff82 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -258,7 +258,12 @@ compress_extension=%s  Support adding specified extension, so that f2fs can enab
>                         on compression extension list and enable compression on
>                         these file by default rather than to enable it via ioctl.
>                         For other files, we can still enable compression via ioctl.
> -====================== ============================================================
> +inlinecrypt
> +                       Encrypt/decrypt the contents of encrypted files using the
> +                       blk-crypto framework rather than filesystem-layer encryption.
> +                       This allows the use of inline encryption hardware. The on-disk
> +                       format is unaffected. For more details, see
> +                       Documentation/block/inline-encryption.rst.
>  
>  Debugfs Entries
>  ===============
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 1e02a8c106b0..29e50fbe7eca 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1086,7 +1086,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  		.submitted = false,
>  		.io_type = io_type,
>  		.io_wbc = wbc,
> -		.encrypted = f2fs_encrypted_file(cc->inode),
> +		.encrypted = fscrypt_inode_uses_fs_layer_crypto(cc->inode),
>  	};
>  	struct dnode_of_data dn;
>  	struct node_info ni;
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 326c63879ddc..6955ea6fa1b6 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -14,6 +14,7 @@
>  #include <linux/pagevec.h>
>  #include <linux/blkdev.h>
>  #include <linux/bio.h>
> +#include <linux/blk-crypto.h>
>  #include <linux/swap.h>
>  #include <linux/prefetch.h>
>  #include <linux/uio.h>
> @@ -459,6 +460,33 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
>  	return bio;
>  }
>  
> +static void f2fs_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
> +				  pgoff_t first_idx,
> +				  const struct f2fs_io_info *fio,
> +				  gfp_t gfp_mask)
> +{
> +	/*
> +	 * The f2fs garbage collector sets ->encrypted_page when it wants to
> +	 * read/write raw data without encryption.
> +	 */
> +	if (!fio || !fio->encrypted_page)
> +		fscrypt_set_bio_crypt_ctx(bio, inode, first_idx, gfp_mask);
> +}
> +
> +static bool f2fs_crypt_mergeable_bio(struct bio *bio, const struct inode *inode,
> +				     pgoff_t next_idx,
> +				     const struct f2fs_io_info *fio)
> +{
> +	/*
> +	 * The f2fs garbage collector sets ->encrypted_page when it wants to
> +	 * read/write raw data without encryption.
> +	 */
> +	if (fio && fio->encrypted_page)
> +		return !bio_has_crypt_ctx(bio);
> +
> +	return fscrypt_mergeable_bio(bio, inode, next_idx);
> +}
> +
>  static inline void __submit_bio(struct f2fs_sb_info *sbi,
>  				struct bio *bio, enum page_type type)
>  {
> @@ -684,6 +712,9 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
>  	/* Allocate a new bio */
>  	bio = __bio_alloc(fio, 1);
>  
> +	f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
> +			       fio->page->index, fio, GFP_NOIO);
> +
>  	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
>  		bio_put(bio);
>  		return -EFAULT;
> @@ -763,9 +794,10 @@ static void del_bio_entry(struct bio_entry *be)
>  	kmem_cache_free(bio_entry_slab, be);
>  }
>  
> -static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
> +static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
>  							struct page *page)
>  {
> +	struct f2fs_sb_info *sbi = fio->sbi;
>  	enum temp_type temp;
>  	bool found = false;
>  	int ret = -EAGAIN;
> @@ -782,13 +814,18 @@ static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
>  
>  			found = true;
>  
> -			if (bio_add_page(*bio, page, PAGE_SIZE, 0) ==
> -							PAGE_SIZE) {
> +			if (page_is_mergeable(sbi, *bio, *fio->last_block,
> +					fio->new_blkaddr) &&
> +			    f2fs_crypt_mergeable_bio(*bio,
> +					fio->page->mapping->host,
> +					fio->page->index, fio) &&
> +			    bio_add_page(*bio, page, PAGE_SIZE, 0) ==
> +					PAGE_SIZE) {
>  				ret = 0;
>  				break;
>  			}
>  
> -			/* bio is full */
> +			 /* page can't be merged into bio; submit the bio */

One more unneeded space before '/'.

>  			del_bio_entry(be);
>  			__submit_bio(sbi, *bio, DATA);
>  			break;
> @@ -873,18 +910,17 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>  	trace_f2fs_submit_page_bio(page, fio);
>  	f2fs_trace_ios(fio, 0);
>  
> -	if (bio && !page_is_mergeable(fio->sbi, bio, *fio->last_block,
> -						fio->new_blkaddr))
> -		f2fs_submit_merged_ipu_write(fio->sbi, &bio, NULL);

I prefer to keep this condition for non-inlinecrypt case to avoid unneeded lock
contention in add_ipu_page().

>  alloc_new:
>  	if (!bio) {
>  		bio = __bio_alloc(fio, BIO_MAX_PAGES);
>  		__attach_io_flag(fio);
> +		f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
> +				       fio->page->index, fio, GFP_NOIO);
>  		bio_set_op_attrs(bio, fio->op, fio->op_flags);
>  
>  		add_bio_entry(fio->sbi, bio, page, fio->temp);
>  	} else {
> -		if (add_ipu_page(fio->sbi, &bio, page))
> +		if (add_ipu_page(fio, &bio, page))
>  			goto alloc_new;
>  	}
>  
> @@ -936,8 +972,11 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  
>  	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
>  
> -	if (io->bio && !io_is_mergeable(sbi, io->bio, io, fio,
> -			io->last_block_in_bio, fio->new_blkaddr))
> +	if (io->bio &&
> +	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
> +			      fio->new_blkaddr) ||
> +	     !f2fs_crypt_mergeable_bio(io->bio, fio->page->mapping->host,
> +				       fio->page->index, fio)))

bio_page->index, fio)))

>  		__submit_merged_bio(io);
>  alloc_new:
>  	if (io->bio == NULL) {
> @@ -949,6 +988,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  			goto skip;
>  		}
>  		io->bio = __bio_alloc(fio, BIO_MAX_PAGES);
> +		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
> +				       fio->page->index, fio, GFP_NOIO);

bio_page->index, fio, GFP_NOIO);

Thanks,

>  		io->fio = *fio;
>  	}
>  
> @@ -993,11 +1034,14 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>  								for_write);
>  	if (!bio)
>  		return ERR_PTR(-ENOMEM);
> +
> +	f2fs_set_bio_crypt_ctx(bio, inode, first_idx, NULL, GFP_NOFS);
> +
>  	f2fs_target_device(sbi, blkaddr, bio);
>  	bio->bi_end_io = f2fs_read_end_io;
>  	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);
>  
> -	if (f2fs_encrypted_file(inode))
> +	if (fscrypt_inode_uses_fs_layer_crypto(inode))
>  		post_read_steps |= 1 << STEP_DECRYPT;
>  	if (f2fs_compressed_file(inode))
>  		post_read_steps |= 1 << STEP_DECOMPRESS_NOWQ;
> @@ -2073,8 +2117,9 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>  	 * This page will go to BIO.  Do we need to send this
>  	 * BIO off first?
>  	 */
> -	if (bio && !page_is_mergeable(F2FS_I_SB(inode), bio,
> -				*last_block_in_bio, block_nr)) {
> +	if (bio && (!page_is_mergeable(F2FS_I_SB(inode), bio,
> +				       *last_block_in_bio, block_nr) ||
> +		    !f2fs_crypt_mergeable_bio(bio, inode, page->index, NULL))) {
>  submit_and_realloc:
>  		__submit_bio(F2FS_I_SB(inode), bio, DATA);
>  		bio = NULL;
> @@ -2204,8 +2249,9 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  		blkaddr = data_blkaddr(dn.inode, dn.node_page,
>  						dn.ofs_in_node + i + 1);
>  
> -		if (bio && !page_is_mergeable(sbi, bio,
> -					*last_block_in_bio, blkaddr)) {
> +		if (bio && (!page_is_mergeable(sbi, bio,
> +					*last_block_in_bio, blkaddr) ||
> +		    !f2fs_crypt_mergeable_bio(bio, inode, page->index, NULL))) {
>  submit_and_realloc:
>  			__submit_bio(sbi, bio, DATA);
>  			bio = NULL;
> @@ -2421,6 +2467,9 @@ int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
>  	/* wait for GCed page writeback via META_MAPPING */
>  	f2fs_wait_on_block_writeback(inode, fio->old_blkaddr);
>  
> +	if (fscrypt_inode_uses_inline_crypto(inode))
> +		return 0;
> +
>  retry_encrypt:
>  	fio->encrypted_page = fscrypt_encrypt_pagecache_blocks(page,
>  					PAGE_SIZE, 0, gfp_flags);
> @@ -2594,7 +2643,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  			f2fs_unlock_op(fio->sbi);
>  		err = f2fs_inplace_write_data(fio);
>  		if (err) {
> -			if (f2fs_encrypted_file(inode))
> +			if (fscrypt_inode_uses_fs_layer_crypto(inode))
>  				fscrypt_finalize_bounce_page(&fio->encrypted_page);
>  			if (PageWriteback(page))
>  				end_page_writeback(page);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 20e56b0fa46a..3621969b2665 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -138,6 +138,7 @@ enum {
>  	Opt_alloc,
>  	Opt_fsync,
>  	Opt_test_dummy_encryption,
> +	Opt_inlinecrypt,
>  	Opt_checkpoint_disable,
>  	Opt_checkpoint_disable_cap,
>  	Opt_checkpoint_disable_cap_perc,
> @@ -204,6 +205,7 @@ static match_table_t f2fs_tokens = {
>  	{Opt_fsync, "fsync_mode=%s"},
>  	{Opt_test_dummy_encryption, "test_dummy_encryption=%s"},
>  	{Opt_test_dummy_encryption, "test_dummy_encryption"},
> +	{Opt_inlinecrypt, "inlinecrypt"},
>  	{Opt_checkpoint_disable, "checkpoint=disable"},
>  	{Opt_checkpoint_disable_cap, "checkpoint=disable:%u"},
>  	{Opt_checkpoint_disable_cap_perc, "checkpoint=disable:%u%%"},
> @@ -833,6 +835,13 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  			if (ret)
>  				return ret;
>  			break;
> +		case Opt_inlinecrypt:
> +#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
> +			sb->s_flags |= SB_INLINECRYPT;
> +#else
> +			f2fs_info(sbi, "inline encryption not supported");
> +#endif
> +			break;
>  		case Opt_checkpoint_disable_cap_perc:
>  			if (args->from && match_int(args, &arg))
>  				return -EINVAL;
> @@ -1624,6 +1633,8 @@ static void default_options(struct f2fs_sb_info *sbi)
>  	F2FS_OPTION(sbi).compress_ext_cnt = 0;
>  	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
>  
> +	sbi->sb->s_flags &= ~SB_INLINECRYPT;
> +
>  	set_opt(sbi, INLINE_XATTR);
>  	set_opt(sbi, INLINE_DATA);
>  	set_opt(sbi, INLINE_DENTRY);
> @@ -2470,6 +2481,25 @@ static void f2fs_get_ino_and_lblk_bits(struct super_block *sb,
>  	*lblk_bits_ret = 8 * sizeof(block_t);
>  }
>  
> +static int f2fs_get_num_devices(struct super_block *sb)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> +
> +	if (f2fs_is_multi_device(sbi))
> +		return sbi->s_ndevs;
> +	return 1;
> +}
> +
> +static void f2fs_get_devices(struct super_block *sb,
> +			     struct request_queue **devs)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> +	int i;
> +
> +	for (i = 0; i < sbi->s_ndevs; i++)
> +		devs[i] = bdev_get_queue(FDEV(i).bdev);
> +}
> +
>  static const struct fscrypt_operations f2fs_cryptops = {
>  	.key_prefix		= "f2fs:",
>  	.get_context		= f2fs_get_context,
> @@ -2479,6 +2509,8 @@ static const struct fscrypt_operations f2fs_cryptops = {
>  	.max_namelen		= F2FS_NAME_LEN,
>  	.has_stable_inodes	= f2fs_has_stable_inodes,
>  	.get_ino_and_lblk_bits	= f2fs_get_ino_and_lblk_bits,
> +	.get_num_devices	= f2fs_get_num_devices,
> +	.get_devices		= f2fs_get_devices,
>  };
>  #endif
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
