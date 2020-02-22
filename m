Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78087168C7F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Feb 2020 06:21:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5NEH-00074m-9c; Sat, 22 Feb 2020 05:21:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j5NEG-00074c-Fh
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 05:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qqNWu0ujbM5AIoIYNJKJ3mmQfi9XHjT5zmiHHblhv4M=; b=HrDQP3WONORDnKjvLiZNZ2HFOS
 JFznYQYsG+go/6s+89s7yK5eRHwioUpK3X8fJBebtN/Ez+VdVnp3adGQj7BwBnPpLUU+BkG1TcQHO
 3TJss4sSavOGXhpt79x6RAfk/gLt9eg2Ho9Yz27hqihTZ9DKZN8uJiQmC6rjZsX21vfk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qqNWu0ujbM5AIoIYNJKJ3mmQfi9XHjT5zmiHHblhv4M=; b=m9Gw3DjbBHpIwemHIz6hHMuI6i
 PxXq08mnHBbPl3tB1Luc13VsaBNyL89B2PP6VfJYPHb9uL7I+p0wQSceScxcpdtzFyFdh7w5mWncB
 Lejr2Tr6IWQuz4ezjUjtTQje0QLUO+OdlrYt/YjChDdy4EAPzgLM71iA8P4x16uC2Qf0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5NEE-004NGr-79
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 05:21:28 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F468208C4;
 Sat, 22 Feb 2020 05:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582348880;
 bh=CKEy+JhJVARCaMSdCKiuME4Pahrij1Z9ZIcgnHWJDXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J3cDufaVIsyI7CTORlG3Xj59jx5J12tQimfHpcNbRY3wKM1iwGEGLzuDwufueKojX
 +BglW4Qe5y5tazQEgldIVp5jxcYrLeiR3Dk54LWfhwPCmhpwGCvIX3sQ5yiZnwhR0X
 RrUKYQuz6dfImW2CMklDLAgnClmYCqWLqRzAsm6E=
Date: Fri, 21 Feb 2020 21:21:18 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200222052118.GB848@sol.localdomain>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-10-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221115050.238976-10-satyat@google.com>
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
X-Headers-End: 1j5NEE-004NGr-79
Subject: Re: [f2fs-dev] [PATCH v7 9/9] ext4: add inline encryption support
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 03:50:50AM -0800, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Wire up ext4 to support inline encryption via the helper functions which
> fs/crypto/ now provides.  This includes:
> 
> - Adding a mount option 'inlinecrypt' which enables inline encryption
>   on encrypted files where it can be used.
> 
> - Setting the bio_crypt_ctx on bios that will be submitted to an
>   inline-encrypted file.
> 
>   Note: submit_bh_wbc() in fs/buffer.c also needed to be patched for
>   this part, since ext4 sometimes uses ll_rw_block() on file data.
> 
> - Not adding logically discontiguous data to bios that will be submitted
>   to an inline-encrypted file.
> 
> - Not doing filesystem-layer crypto on inline-encrypted files.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>

You've changed enough in this patch that you should probably should add your
Co-developed-by, or at least summarize your changes in between the Signed-off-by
(e.g. "[satyat: use SB_INLINECRYPT and update docs]")

> ---
>  Documentation/admin-guide/ext4.rst |  4 ++++
>  fs/buffer.c                        |  7 ++++---
>  fs/ext4/ext4.h                     |  1 +
>  fs/ext4/inode.c                    |  4 ++--
>  fs/ext4/page-io.c                  |  6 ++++--
>  fs/ext4/readpage.c                 | 11 ++++++++---
>  fs/ext4/super.c                    | 19 +++++++++++++++++++
>  7 files changed, 42 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/admin-guide/ext4.rst b/Documentation/admin-guide/ext4.rst
> index 9443fcef1876..b7cd3bdf827e 100644
> --- a/Documentation/admin-guide/ext4.rst
> +++ b/Documentation/admin-guide/ext4.rst
> @@ -395,6 +395,10 @@ When mounting an ext4 filesystem, the following option are accepted:
>          Documentation/filesystems/dax.txt.  Note that this option is
>          incompatible with data=journal.
>  
> +  inlinecrypt
> +        Use blk-crypto, rather than fscrypt, for file content en/decryption.
> +        See Documentation/block/inline-encryption.rst.

"fscrypt" refers to the ext4 encryption feature itself.  I.e., when inline
encryption is enabled, fscrypt is still being used.  Instead you probably want
to write something like:

	Encrypt/decrypt the contents of encrypted files using the blk-crypto
	framework rather than filesystem-layer encryption.  This allows the use
	of inline encryption hardware.  The on-disk format is unaffected.  For
	more details, see Documentation/block/inline-encryption.rst.

> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index 4441331d06cc..3917f4b3ec30 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -1151,6 +1151,7 @@ struct ext4_inode_info {
>  #define EXT4_MOUNT_JOURNAL_CHECKSUM	0x800000 /* Journal checksums */
>  #define EXT4_MOUNT_JOURNAL_ASYNC_COMMIT	0x1000000 /* Journal Async Commit */
>  #define EXT4_MOUNT_WARN_ON_ERROR	0x2000000 /* Trigger WARN_ON on error */
> +#define EXT4_MOUNT_INLINECRYPT		0x4000000 /* Inline encryption support */
>  #define EXT4_MOUNT_DELALLOC		0x8000000 /* Delalloc support */
>  #define EXT4_MOUNT_DATA_ERR_ABORT	0x10000000 /* Abort on file data write */
>  #define EXT4_MOUNT_BLOCK_VALIDITY	0x20000000 /* Block validity checking */

Isn't this ext4-specific flag unused now that you switched to SB_INLINECRYPT
instead?

> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index e60aca791d3f..9ac1dd131586 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -1089,7 +1089,7 @@ static int ext4_block_write_begin(struct page *page, loff_t pos, unsigned len,
>  	}
>  	if (unlikely(err)) {
>  		page_zero_new_buffers(page, from, to);
> -	} else if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode)) {
> +	} else if (fscrypt_inode_uses_fs_layer_crypto(inode)) {
>  		for (i = 0; i < nr_wait; i++) {
>  			int err2;
>  
> @@ -3720,7 +3720,7 @@ static int __ext4_block_zero_page_range(handle_t *handle,
>  		/* Uhhuh. Read error. Complain and punt. */
>  		if (!buffer_uptodate(bh))
>  			goto unlock;
> -		if (S_ISREG(inode->i_mode) && IS_ENCRYPTED(inode)) {
> +		if (fscrypt_inode_uses_fs_layer_crypto(inode)) {
>  			/* We expect the key to be set. */
>  			BUG_ON(!fscrypt_has_encryption_key(inode));
>  			err = fscrypt_decrypt_pagecache_blocks(page, blocksize,
> diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
> index 68b39e75446a..0757145a31b2 100644
> --- a/fs/ext4/page-io.c
> +++ b/fs/ext4/page-io.c
> @@ -404,6 +404,7 @@ static void io_submit_init_bio(struct ext4_io_submit *io,
>  	 * __GFP_DIRECT_RECLAIM is set, see comments for bio_alloc_bioset().
>  	 */
>  	bio = bio_alloc(GFP_NOIO, BIO_MAX_PAGES);
> +	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
>  	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
>  	bio_set_dev(bio, bh->b_bdev);
>  	bio->bi_end_io = ext4_end_bio;
> @@ -420,7 +421,8 @@ static void io_submit_add_bh(struct ext4_io_submit *io,
>  {
>  	int ret;
>  
> -	if (io->io_bio && bh->b_blocknr != io->io_next_block) {
> +	if (io->io_bio && (bh->b_blocknr != io->io_next_block ||
> +			   !fscrypt_mergeable_bio_bh(io->io_bio, bh))) {
>  submit_and_retry:
>  		ext4_io_submit(io);
>  	}
> @@ -508,7 +510,7 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
>  	 * (e.g. holes) to be unnecessarily encrypted, but this is rare and
>  	 * can't happen in the common case of blocksize == PAGE_SIZE.
>  	 */
> -	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) && nr_to_submit) {
> +	if (fscrypt_inode_uses_fs_layer_crypto(inode) && nr_to_submit) {
>  		gfp_t gfp_flags = GFP_NOFS;
>  		unsigned int enc_bytes = round_up(len, i_blocksize(inode));
>  
> diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
> index c1769afbf799..68eac0aeffad 100644
> --- a/fs/ext4/readpage.c
> +++ b/fs/ext4/readpage.c
> @@ -195,7 +195,7 @@ static void ext4_set_bio_post_read_ctx(struct bio *bio,
>  {
>  	unsigned int post_read_steps = 0;
>  
> -	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
> +	if (fscrypt_inode_uses_fs_layer_crypto(inode))
>  		post_read_steps |= 1 << STEP_DECRYPT;
>  
>  	if (ext4_need_verity(inode, first_idx))
> @@ -232,6 +232,7 @@ int ext4_mpage_readpages(struct address_space *mapping,
>  	const unsigned blkbits = inode->i_blkbits;
>  	const unsigned blocks_per_page = PAGE_SIZE >> blkbits;
>  	const unsigned blocksize = 1 << blkbits;
> +	sector_t next_block;
>  	sector_t block_in_file;
>  	sector_t last_block;
>  	sector_t last_block_in_file;
> @@ -264,7 +265,8 @@ int ext4_mpage_readpages(struct address_space *mapping,
>  		if (page_has_buffers(page))
>  			goto confused;
>  
> -		block_in_file = (sector_t)page->index << (PAGE_SHIFT - blkbits);
> +		block_in_file = next_block =
> +			(sector_t)page->index << (PAGE_SHIFT - blkbits);
>  		last_block = block_in_file + nr_pages * blocks_per_page;
>  		last_block_in_file = (ext4_readpage_limit(inode) +
>  				      blocksize - 1) >> blkbits;
> @@ -364,7 +366,8 @@ int ext4_mpage_readpages(struct address_space *mapping,
>  		 * This page will go to BIO.  Do we need to send this
>  		 * BIO off first?
>  		 */
> -		if (bio && (last_block_in_bio != blocks[0] - 1)) {
> +		if (bio && (last_block_in_bio != blocks[0] - 1 ||
> +			    !fscrypt_mergeable_bio(bio, inode, next_block))) {
>  		submit_and_realloc:
>  			submit_bio(bio);
>  			bio = NULL;
> @@ -376,6 +379,8 @@ int ext4_mpage_readpages(struct address_space *mapping,
>  			 */
>  			bio = bio_alloc(GFP_KERNEL,
>  				min_t(int, nr_pages, BIO_MAX_PAGES));
> +			fscrypt_set_bio_crypt_ctx(bio, inode, next_block,
> +						  GFP_KERNEL);
>  			ext4_set_bio_post_read_ctx(bio, inode, page->index);
>  			bio_set_dev(bio, bdev);
>  			bio->bi_iter.bi_sector = blocks[0] << (blkbits - 9);
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index f464dff09774..490e748b048c 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -1504,6 +1504,7 @@ enum {
>  	Opt_journal_path, Opt_journal_checksum, Opt_journal_async_commit,
>  	Opt_abort, Opt_data_journal, Opt_data_ordered, Opt_data_writeback,
>  	Opt_data_err_abort, Opt_data_err_ignore, Opt_test_dummy_encryption,
> +	Opt_inlinecrypt,
>  	Opt_usrjquota, Opt_grpjquota, Opt_offusrjquota, Opt_offgrpjquota,
>  	Opt_jqfmt_vfsold, Opt_jqfmt_vfsv0, Opt_jqfmt_vfsv1, Opt_quota,
>  	Opt_noquota, Opt_barrier, Opt_nobarrier, Opt_err,
> @@ -1601,6 +1602,7 @@ static const match_table_t tokens = {
>  	{Opt_noinit_itable, "noinit_itable"},
>  	{Opt_max_dir_size_kb, "max_dir_size_kb=%u"},
>  	{Opt_test_dummy_encryption, "test_dummy_encryption"},
> +	{Opt_inlinecrypt, "inlinecrypt"},
>  	{Opt_nombcache, "nombcache"},
>  	{Opt_nombcache, "no_mbcache"},	/* for backward compatibility */
>  	{Opt_removed, "check=none"},	/* mount option from ext2/3 */
> @@ -1812,6 +1814,11 @@ static const struct mount_opts {
>  	{Opt_jqfmt_vfsv1, QFMT_VFS_V1, MOPT_QFMT},
>  	{Opt_max_dir_size_kb, 0, MOPT_GTE0},
>  	{Opt_test_dummy_encryption, 0, MOPT_GTE0},
> +#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
> +	{Opt_inlinecrypt, EXT4_MOUNT_INLINECRYPT, MOPT_SET},
> +#else
> +	{Opt_inlinecrypt, EXT4_MOUNT_INLINECRYPT, MOPT_NOSUPPORT},
> +#endif
>  	{Opt_nombcache, EXT4_MOUNT_NO_MBCACHE, MOPT_SET},
>  	{Opt_err, 0, 0}
>  };
> @@ -1888,6 +1895,13 @@ static int handle_mount_opt(struct super_block *sb, char *opt, int token,
>  	case Opt_nolazytime:
>  		sb->s_flags &= ~SB_LAZYTIME;
>  		return 1;
> +	case Opt_inlinecrypt:
> +#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
> +		sb->s_flags |= SB_INLINE_CRYPT;
> +#else
> +		ext4_msg(sb, KERN_ERR, "inline encryption not supported");
> +#endif
> +		return 1;
>  	}
>  
>  	for (m = ext4_mount_opts; m->token != Opt_err; m++)
> @@ -2300,6 +2314,8 @@ static int _ext4_show_options(struct seq_file *seq, struct super_block *sb,
>  		SEQ_OPTS_PUTS("data_err=abort");
>  	if (DUMMY_ENCRYPTION_ENABLED(sbi))
>  		SEQ_OPTS_PUTS("test_dummy_encryption");
> +	if (sb->s_flags & SB_INLINE_CRYPT)
> +		SEQ_OPTS_PUTS("inlinecrypt");

If we're going with the VFS-level mount option flag, it looks like the code to
show it should go in show_sb_opts() in fs/proc_namespace.c instead of here.

> @@ -3808,6 +3824,9 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
>  	 */
>  	sbi->s_li_wait_mult = EXT4_DEF_LI_WAIT_MULT;
>  
> +	/* disable blk-crypto file content encryption by default */
> +	sb->s_flags &= ~SB_INLINE_CRYPT;
> +

Don't the flags default to 0?  If they do, this part is unnecessary.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
