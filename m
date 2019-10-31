Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B042EB5EA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2019 18:14:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQE1j-000287-0O; Thu, 31 Oct 2019 17:14:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iQE1h-00027w-Vs
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 17:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ku2g8tOntRVrfN8NfBqTsktAwmZUg4mlf1YjxhveBuM=; b=BEoTW6W3zUEoPWJF/B7klCHn8j
 g881ahQ2Js4Ds9M1rK6HtZhy03CCaknEdXWB/nPWrndt8nYkVvTVwctv7cPNENqpOvKyJWmk+y8+I
 KQheB4rzFyXISwECua2FMAhkJOq0Q4k44JbG4VvlDCGfT/NA7S+snvmWPcWFpzBcBJ5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ku2g8tOntRVrfN8NfBqTsktAwmZUg4mlf1YjxhveBuM=; b=IO0TF/QZt8SwmAsnjphp1LquRF
 94berLvbkKySSe/lai5SXUkglQufxzeKdw/8gSWoiIc4SZj0RN12qY6NuZlV16ieSJ8SI+KI68vaK
 mkW8b5K/3wHXWyXyv+ZObaTFcmaAwLsyvlfFSjSIW3m+bPrgoaHuWH2BARG5qye9/vtA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQE1g-00B6DJ-FJ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 17:14:25 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B5D0C2086D;
 Thu, 31 Oct 2019 17:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572542054;
 bh=PEB9Ow0unTlX+Iy+Y46X7+O4gU730py/Hl47a8PTj6E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pLJSFnpONcen1ZOH15eme18JjaT1607YEv2TPWv2ErAU9lLrH+tYigbuCkEXZPEwW
 Fk7Ujantfneb8vG4riBmi4RETie445fzuUmvMidaKivcGOGshzffZ2dZXqHeiD1yCk
 40XqQ4hWwpRi8wMPAwnUwV/4h24Iehe0UWkrpNls=
Date: Thu, 31 Oct 2019 10:14:13 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20191031171413.GA64819@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191028072032.6911-1-satyat@google.com>
 <20191028072032.6911-9-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191028072032.6911-9-satyat@google.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iQE1g-00B6DJ-FJ
Subject: Re: [f2fs-dev] [PATCH v5 8/9] f2fs: add inline encryption support
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
 Kuohong Wang <kuohong.wang@mediatek.com>, Eric Biggers <ebiggers@google.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/28, Satya Tangirala wrote:
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
> Co-developed-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>

Acked-by: Jaegeuk Kim <jaegeuk@google.com>

> ---
>  fs/f2fs/data.c  | 76 +++++++++++++++++++++++++++++++++++++++++++------
>  fs/f2fs/f2fs.h  |  3 ++
>  fs/f2fs/super.c | 20 +++++++++++++
>  3 files changed, 91 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 5755e897a5f0..b5a7b540e630 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -306,6 +306,35 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
>  	return bio;
>  }
>  
> +static int f2fs_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
> +				  pgoff_t first_idx,
> +				  const struct f2fs_io_info *fio,
> +				  gfp_t gfp_mask)
> +{
> +	/*
> +	 * The f2fs garbage collector sets ->encrypted_page when it wants to
> +	 * read/write raw data without encryption.
> +	 */
> +	if (fio && fio->encrypted_page)
> +		return 0;
> +
> +	return fscrypt_set_bio_crypt_ctx(bio, inode, first_idx, gfp_mask);
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
> +		return true;
> +
> +	return fscrypt_mergeable_bio(bio, inode, next_idx);
> +}
> +
>  static inline void __submit_bio(struct f2fs_sb_info *sbi,
>  				struct bio *bio, enum page_type type)
>  {
> @@ -477,6 +506,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
>  	struct bio *bio;
>  	struct page *page = fio->encrypted_page ?
>  			fio->encrypted_page : fio->page;
> +	int err;
>  
>  	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
>  			fio->is_por ? META_POR : (__is_meta_io(fio) ?
> @@ -489,6 +519,13 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
>  	/* Allocate a new bio */
>  	bio = __bio_alloc(fio, 1);
>  
> +	err = f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
> +				     fio->page->index, fio, GFP_NOIO);
> +	if (err) {
> +		bio_put(bio);
> +		return err;
> +	}
> +
>  	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
>  		bio_put(bio);
>  		return -EFAULT;
> @@ -556,14 +593,19 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>  	trace_f2fs_submit_page_bio(page, fio);
>  	f2fs_trace_ios(fio, 0);
>  
> -	if (bio && !page_is_mergeable(fio->sbi, bio, *fio->last_block,
> -						fio->new_blkaddr)) {
> +	if (bio && (!page_is_mergeable(fio->sbi, bio, *fio->last_block,
> +				       fio->new_blkaddr) ||
> +		    !f2fs_crypt_mergeable_bio(bio, fio->page->mapping->host,
> +					      fio->page->index, fio))) {
>  		__submit_bio(fio->sbi, bio, fio->type);
>  		bio = NULL;
>  	}
>  alloc_new:
>  	if (!bio) {
>  		bio = __bio_alloc(fio, BIO_MAX_PAGES);
> +		f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
> +				       fio->page->index, fio,
> +				       GFP_NOIO | __GFP_NOFAIL);
>  		bio_set_op_attrs(bio, fio->op, fio->op_flags);
>  	}
>  
> @@ -629,8 +671,11 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
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
>  		__submit_merged_bio(io);
>  alloc_new:
>  	if (io->bio == NULL) {
> @@ -642,6 +687,9 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  			goto skip;
>  		}
>  		io->bio = __bio_alloc(fio, BIO_MAX_PAGES);
> +		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
> +				       fio->page->index, fio,
> +				       GFP_NOIO | __GFP_NOFAIL);
>  		io->fio = *fio;
>  	}
>  
> @@ -681,15 +729,23 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>  	struct bio *bio;
>  	struct bio_post_read_ctx *ctx;
>  	unsigned int post_read_steps = 0;
> +	int err;
>  
>  	bio = f2fs_bio_alloc(sbi, min_t(int, nr_pages, BIO_MAX_PAGES), false);
>  	if (!bio)
>  		return ERR_PTR(-ENOMEM);
> +
> +	err = f2fs_set_bio_crypt_ctx(bio, inode, first_idx, NULL, GFP_NOFS);
> +	if (err) {
> +		bio_put(bio);
> +		return ERR_PTR(err);
> +	}
> +
>  	f2fs_target_device(sbi, blkaddr, bio);
>  	bio->bi_end_io = f2fs_read_end_io;
>  	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);
>  
> -	if (f2fs_encrypted_file(inode))
> +	if (fscrypt_inode_uses_fs_layer_crypto(inode))
>  		post_read_steps |= 1 << STEP_DECRYPT;
>  
>  	if (f2fs_need_verity(inode, first_idx))
> @@ -1726,8 +1782,9 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
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
> @@ -1867,6 +1924,9 @@ static int encrypt_one_page(struct f2fs_io_info *fio)
>  	/* wait for GCed page writeback via META_MAPPING */
>  	f2fs_wait_on_block_writeback(inode, fio->old_blkaddr);
>  
> +	if (fscrypt_inode_uses_inline_crypto(inode))
> +		return 0;
> +
>  retry_encrypt:
>  	fio->encrypted_page = fscrypt_encrypt_pagecache_blocks(fio->page,
>  							       PAGE_SIZE, 0,
> @@ -2041,7 +2101,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  			f2fs_unlock_op(fio->sbi);
>  		err = f2fs_inplace_write_data(fio);
>  		if (err) {
> -			if (f2fs_encrypted_file(inode))
> +			if (fscrypt_inode_uses_fs_layer_crypto(inode))
>  				fscrypt_finalize_bounce_page(&fio->encrypted_page);
>  			if (PageWriteback(page))
>  				end_page_writeback(page);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 4024790028aa..e04fda00b4ef 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -137,6 +137,9 @@ struct f2fs_mount_info {
>  	int alloc_mode;			/* segment allocation policy */
>  	int fsync_mode;			/* fsync policy */
>  	bool test_dummy_encryption;	/* test dummy encryption */
> +#ifdef CONFIG_FS_ENCRYPTION
> +	bool inlinecrypt;		/* inline encryption enabled */
> +#endif
>  	block_t unusable_cap;		/* Amount of space allowed to be
>  					 * unusable when disabling checkpoint
>  					 */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 851ac9522926..850a2a2394d8 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -137,6 +137,7 @@ enum {
>  	Opt_alloc,
>  	Opt_fsync,
>  	Opt_test_dummy_encryption,
> +	Opt_inlinecrypt,
>  	Opt_checkpoint_disable,
>  	Opt_checkpoint_disable_cap,
>  	Opt_checkpoint_disable_cap_perc,
> @@ -199,6 +200,7 @@ static match_table_t f2fs_tokens = {
>  	{Opt_alloc, "alloc_mode=%s"},
>  	{Opt_fsync, "fsync_mode=%s"},
>  	{Opt_test_dummy_encryption, "test_dummy_encryption"},
> +	{Opt_inlinecrypt, "inlinecrypt"},
>  	{Opt_checkpoint_disable, "checkpoint=disable"},
>  	{Opt_checkpoint_disable_cap, "checkpoint=disable:%u"},
>  	{Opt_checkpoint_disable_cap_perc, "checkpoint=disable:%u%%"},
> @@ -783,6 +785,13 @@ static int parse_options(struct super_block *sb, char *options)
>  			f2fs_info(sbi, "Test dummy encryption mode enabled");
>  #else
>  			f2fs_info(sbi, "Test dummy encryption mount option ignored");
> +#endif
> +			break;
> +		case Opt_inlinecrypt:
> +#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
> +			F2FS_OPTION(sbi).inlinecrypt = true;
> +#else
> +			f2fs_info(sbi, "inline encryption not supported");
>  #endif
>  			break;
>  		case Opt_checkpoint_disable_cap_perc:
> @@ -1438,6 +1447,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>  #ifdef CONFIG_FS_ENCRYPTION
>  	if (F2FS_OPTION(sbi).test_dummy_encryption)
>  		seq_puts(seq, ",test_dummy_encryption");
> +	if (F2FS_OPTION(sbi).inlinecrypt)
> +		seq_puts(seq, ",inlinecrypt");
>  #endif
>  
>  	if (F2FS_OPTION(sbi).alloc_mode == ALLOC_MODE_DEFAULT)
> @@ -1466,6 +1477,9 @@ static void default_options(struct f2fs_sb_info *sbi)
>  	F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
>  	F2FS_OPTION(sbi).fsync_mode = FSYNC_MODE_POSIX;
>  	F2FS_OPTION(sbi).test_dummy_encryption = false;
> +#ifdef CONFIG_FS_ENCRYPTION
> +	F2FS_OPTION(sbi).inlinecrypt = false;
> +#endif
>  	F2FS_OPTION(sbi).s_resuid = make_kuid(&init_user_ns, F2FS_DEF_RESUID);
>  	F2FS_OPTION(sbi).s_resgid = make_kgid(&init_user_ns, F2FS_DEF_RESGID);
>  
> @@ -2320,6 +2334,11 @@ static void f2fs_get_ino_and_lblk_bits(struct super_block *sb,
>  	*lblk_bits_ret = 8 * sizeof(block_t);
>  }
>  
> +static bool f2fs_inline_crypt_enabled(struct super_block *sb)
> +{
> +	return F2FS_OPTION(F2FS_SB(sb)).inlinecrypt;
> +}
> +
>  static const struct fscrypt_operations f2fs_cryptops = {
>  	.key_prefix		= "f2fs:",
>  	.get_context		= f2fs_get_context,
> @@ -2329,6 +2348,7 @@ static const struct fscrypt_operations f2fs_cryptops = {
>  	.max_namelen		= F2FS_NAME_LEN,
>  	.has_stable_inodes	= f2fs_has_stable_inodes,
>  	.get_ino_and_lblk_bits	= f2fs_get_ino_and_lblk_bits,
> +	.inline_crypt_enabled	= f2fs_inline_crypt_enabled,
>  };
>  #endif
>  
> -- 
> 2.24.0.rc0.303.g954a862665-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
