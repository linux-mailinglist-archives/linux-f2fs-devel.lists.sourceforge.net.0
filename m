Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 613561258ED
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Dec 2019 01:56:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IguPUTMpQdf0TOr9z/9bPIWYjtoI1vFzqW8R6MgQRSM=; b=cVlCFVybv8C9Tp5PDaKg1Rq3K
	QaEIHMlTsO8tZwHBkOIRjWry75oBqVfcmzcr0nbHoVoPabgtOUxne3/uM7s2B7r3d3upJU5EhUomu
	2/0qtvYTbkqr8SjzWWauMPnwWH6CdKAZw3KRMzWfZCTCTU/Q4cwR8ufamsIOhAIO39vnw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihk7N-0002dU-5P; Thu, 19 Dec 2019 00:56:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1ihk7L-0002dK-9C
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Dec 2019 00:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xyBVEYkzY9GbJqdrcpd7/z5zSijkLJgqnvmaBURJfhE=; b=I85EjdEVjvfvNKyCKjJGuKEP88
 h9sUiweHmaE4kYnoml65mlc3YjoyhzSqCI3OXh2MYjdWVlyJu1tmN7/NeecJMFtALxajHSR55R4kW
 i0nDmC4x2v+YnNDyEZnlGZPB36B1fDe+BqIBPki7u4/Y7OqIR3onWoDpJq7M+dJ9swLs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xyBVEYkzY9GbJqdrcpd7/z5zSijkLJgqnvmaBURJfhE=; b=BRXli2cW2saYAQkxLrb14lZbzO
 zDqLJK+TsLkgCFq/LI46fwWHmZZZsDZqbc4kCOCwxTZrow+0lMiNdKdXr8sLNRJpceQt7kLWH99cy
 8JycpsK5/aewmnxeh1joQgWYs5ubP+qL8kJeBUjNFOkO2jgQTNgroOCzvf7h+fN8JYxA=;
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ihk7J-006NFo-6C
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Dec 2019 00:56:39 +0000
Received: by mail-pj1-f65.google.com with SMTP id t101so1675212pjb.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Dec 2019 16:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xyBVEYkzY9GbJqdrcpd7/z5zSijkLJgqnvmaBURJfhE=;
 b=KAQu8lWERy1KOc9Ud0UlTkJ2GAPgGMLJmfGGUv4bnrOUk4vJxXAC0AY1xNcvkISpeI
 uIsQDjPd3msGpm/7zUGCPL0YtOjZavh2xy3umNez3OlvRajMUOAwhQh0B3yFgftoucAg
 IyWelZPCQjQuZfk526krewBwae4ivldt7xFNjJx2T/ifoiJO0h/uglfGxHzSxWttw1nI
 RfZ0qM9HF0NZAde13/wA1BG3bxkdzGfP7d/tzTl5WxNvhtuILSnJ8ZGQWRnapp6id0a9
 wTouE5yi3zHXY4U97cSq9LaO0oO5YghMW9q9w+uC2nyjTwMS0vglF966saeN1kTeT5Fs
 fyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xyBVEYkzY9GbJqdrcpd7/z5zSijkLJgqnvmaBURJfhE=;
 b=oXzAkTuJdzX12HuqpFboeCXATttFDeYxbul/c8/HCveSkMA/vTrpkQfFsqgO7VpTFP
 ph1yt/hatR53yDDYqnkEVjj0HcJplT8vGMtn1w0WZyNMpHPvv3+8/IoDib1j5suKEhxt
 /qOJ645Xv4eLwtdqF3GISr5AdddCDIW9tAPT9HKx3HsDB4qMEOd8wFitYQrcbe1kHgsB
 S9Y3K8VFnDUK9x6JzcyDu7PE6aUzbnUrXAek9R+/fMr+3pYpmK06jag34XTMn7rO9wR8
 gUo/T2ap4r1amkKUswFaRibem3CqTaR+fS9vmEX/shKiMTJIuRz+PxjJy6pLNnlFQpIB
 AhAA==
X-Gm-Message-State: APjAAAVa8M0FQRfdRI1j6QmsQEicRizhiFx+I3ZMemN3/q/74Ed1rq4N
 vcTokyuUYkFIBTfOtOWfSvb2ZNUB240=
X-Google-Smtp-Source: APXvYqzizqlaykbVmos6h8bpIEJ1Pw90IdGHpoC0aid9Ibyt71vL3V4ttZZfSQYuPn6uyDDX+71A4Q==
X-Received: by 2002:a17:90a:8043:: with SMTP id
 e3mr6037146pjw.24.1576715522475; 
 Wed, 18 Dec 2019 16:32:02 -0800 (PST)
Received: from google.com ([2620:15c:201:0:7f8c:9d6e:20b8:e324])
 by smtp.gmail.com with ESMTPSA id z130sm4664074pgz.6.2019.12.18.16.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 16:32:02 -0800 (PST)
Date: Wed, 18 Dec 2019 16:31:57 -0800
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20191219003157.GA178424@google.com>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-10-satyat@google.com>
 <20191219001240.GD47399@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191219001240.GD47399@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -14.2 (--------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.65 listed in list.dnswl.org]
 1.8 FSL_HELO_FAKE          No description available.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ihk7J-006NFo-6C
Subject: Re: [f2fs-dev] [PATCH v6 9/9] ext4: add inline encryption support
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I messed up while using git and managed to overwrite the author field in
the patch - it should read "Eric Biggers <ebiggers@google.com>" instead.
I'll fix that in the next patch version, sorry.

On Wed, Dec 18, 2019 at 04:12:41PM -0800, Eric Biggers wrote:

> [+Cc linux-ext4]
> 
> On Wed, Dec 18, 2019 at 06:51:36AM -0800, Satya Tangirala wrote:
> > Wire up ext4 to support inline encryption via the helper functions which
> > fs/crypto/ now provides.  This includes:
> > 
> > - Adding a mount option 'inlinecrypt' which enables inline encryption
> >   on encrypted files where it can be used.
> > 
> > - Setting the bio_crypt_ctx on bios that will be submitted to an
> >   inline-encrypted file.
> > 
> >   Note: submit_bh_wbc() in fs/buffer.c also needed to be patched for
> >   this part, since ext4 sometimes uses ll_rw_block() on file data.
> > 
> > - Not adding logically discontiguous data to bios that will be submitted
> >   to an inline-encrypted file.
> > 
> > - Not doing filesystem-layer crypto on inline-encrypted files.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > Signed-off-by: Satya Tangirala <satyat@google.com>
> 
> In the next version can you please add linux-ext4 to Cc for the series?
> 
Ok, I will.
> > ---
> >  fs/buffer.c        |  2 ++
> >  fs/ext4/ext4.h     |  1 +
> >  fs/ext4/inode.c    |  4 ++--
> >  fs/ext4/page-io.c  |  6 ++++--
> >  fs/ext4/readpage.c | 11 ++++++++---
> >  fs/ext4/super.c    | 13 +++++++++++++
> >  6 files changed, 30 insertions(+), 7 deletions(-)
> > 
> > diff --git a/fs/buffer.c b/fs/buffer.c
> > index d8c7242426bb..3ad000db4a19 100644
> > --- a/fs/buffer.c
> > +++ b/fs/buffer.c
> > @@ -3108,6 +3108,8 @@ static int submit_bh_wbc(int op, int op_flags, struct buffer_head *bh,
> >  	 */
> >  	bio = bio_alloc(GFP_NOIO, 1);
> >  
> > +	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
> > +
> >  	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
> >  	bio_set_dev(bio, bh->b_bdev);
> >  	bio->bi_write_hint = write_hint;
> 
> In 5.5, there was some decryption code added to fs/buffer.c in order to support
> ext4 encryption with blocksize < PAGE_SIZE:
> 
> static void end_buffer_async_read_io(struct buffer_head *bh, int uptodate)
> {
>         /* Decrypt if needed */
>         if (uptodate && IS_ENABLED(CONFIG_FS_ENCRYPTION) &&
>             IS_ENCRYPTED(bh->b_page->mapping->host) &&
>             S_ISREG(bh->b_page->mapping->host->i_mode)) {
> 	...
> 
> 
> This needs to be updated to use fscrypt_inode_uses_fs_layer_crypto() instead, so
> that the filesystem-layer decryption is not done when the file is already using
> inline decryption.
> 
Will fix in the next version.
> > diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> > index f8578caba40d..aeaa01724d7c 100644
> > --- a/fs/ext4/ext4.h
> > +++ b/fs/ext4/ext4.h
> > @@ -1153,6 +1153,7 @@ struct ext4_inode_info {
> >  #define EXT4_MOUNT_JOURNAL_CHECKSUM	0x800000 /* Journal checksums */
> >  #define EXT4_MOUNT_JOURNAL_ASYNC_COMMIT	0x1000000 /* Journal Async Commit */
> >  #define EXT4_MOUNT_WARN_ON_ERROR	0x2000000 /* Trigger WARN_ON on error */
> > +#define EXT4_MOUNT_INLINECRYPT		0x4000000 /* Inline encryption support */
> >  #define EXT4_MOUNT_DELALLOC		0x8000000 /* Delalloc support */
> >  #define EXT4_MOUNT_DATA_ERR_ABORT	0x10000000 /* Abort on file data write */
> >  #define EXT4_MOUNT_BLOCK_VALIDITY	0x20000000 /* Block validity checking */
> > diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> > index 28f28de0c1b6..44d9651b8638 100644
> > --- a/fs/ext4/inode.c
> > +++ b/fs/ext4/inode.c
> > @@ -1090,7 +1090,7 @@ static int ext4_block_write_begin(struct page *page, loff_t pos, unsigned len,
> >  	}
> >  	if (unlikely(err)) {
> >  		page_zero_new_buffers(page, from, to);
> > -	} else if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode)) {
> > +	} else if (fscrypt_inode_uses_fs_layer_crypto(inode)) {
> >  		for (i = 0; i < nr_wait; i++) {
> >  			int err2;
> >  
> > @@ -3698,7 +3698,7 @@ static int __ext4_block_zero_page_range(handle_t *handle,
> >  		/* Uhhuh. Read error. Complain and punt. */
> >  		if (!buffer_uptodate(bh))
> >  			goto unlock;
> > -		if (S_ISREG(inode->i_mode) && IS_ENCRYPTED(inode)) {
> > +		if (fscrypt_inode_uses_fs_layer_crypto(inode)) {
> >  			/* We expect the key to be set. */
> >  			BUG_ON(!fscrypt_has_encryption_key(inode));
> >  			WARN_ON_ONCE(fscrypt_decrypt_pagecache_blocks(
> > diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
> > index 24aeedb8fc75..acde754cc5ca 100644
> > --- a/fs/ext4/page-io.c
> > +++ b/fs/ext4/page-io.c
> > @@ -404,6 +404,7 @@ static void io_submit_init_bio(struct ext4_io_submit *io,
> >  	 * __GFP_DIRECT_RECLAIM is set, see comments for bio_alloc_bioset().
> >  	 */
> >  	bio = bio_alloc(GFP_NOIO, BIO_MAX_PAGES);
> > +	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
> >  	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
> >  	bio_set_dev(bio, bh->b_bdev);
> >  	bio->bi_end_io = ext4_end_bio;
> > @@ -420,7 +421,8 @@ static void io_submit_add_bh(struct ext4_io_submit *io,
> >  {
> >  	int ret;
> >  
> > -	if (io->io_bio && bh->b_blocknr != io->io_next_block) {
> > +	if (io->io_bio && (bh->b_blocknr != io->io_next_block ||
> > +			   !fscrypt_mergeable_bio_bh(io->io_bio, bh))) {
> >  submit_and_retry:
> >  		ext4_io_submit(io);
> >  	}
> > @@ -508,7 +510,7 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
> >  	 * (e.g. holes) to be unnecessarily encrypted, but this is rare and
> >  	 * can't happen in the common case of blocksize == PAGE_SIZE.
> >  	 */
> > -	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) && nr_to_submit) {
> > +	if (fscrypt_inode_uses_fs_layer_crypto(inode) && nr_to_submit) {
> >  		gfp_t gfp_flags = GFP_NOFS;
> >  		unsigned int enc_bytes = round_up(len, i_blocksize(inode));
> >  
> > diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
> > index fef7755300c3..7844e27518b4 100644
> > --- a/fs/ext4/readpage.c
> > +++ b/fs/ext4/readpage.c
> > @@ -183,7 +183,7 @@ static struct bio_post_read_ctx *get_bio_post_read_ctx(struct inode *inode,
> >  	unsigned int post_read_steps = 0;
> >  	struct bio_post_read_ctx *ctx = NULL;
> >  
> > -	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
> > +	if (fscrypt_inode_uses_fs_layer_crypto(inode))
> >  		post_read_steps |= 1 << STEP_DECRYPT;
> >  
> >  	if (ext4_need_verity(inode, first_idx))
> > @@ -220,6 +220,7 @@ int ext4_mpage_readpages(struct address_space *mapping,
> >  	const unsigned blkbits = inode->i_blkbits;
> >  	const unsigned blocks_per_page = PAGE_SIZE >> blkbits;
> >  	const unsigned blocksize = 1 << blkbits;
> > +	sector_t next_block;
> >  	sector_t block_in_file;
> >  	sector_t last_block;
> >  	sector_t last_block_in_file;
> > @@ -252,7 +253,8 @@ int ext4_mpage_readpages(struct address_space *mapping,
> >  		if (page_has_buffers(page))
> >  			goto confused;
> >  
> > -		block_in_file = (sector_t)page->index << (PAGE_SHIFT - blkbits);
> > +		block_in_file = next_block =
> > +			(sector_t)page->index << (PAGE_SHIFT - blkbits);
> >  		last_block = block_in_file + nr_pages * blocks_per_page;
> >  		last_block_in_file = (ext4_readpage_limit(inode) +
> >  				      blocksize - 1) >> blkbits;
> > @@ -352,7 +354,8 @@ int ext4_mpage_readpages(struct address_space *mapping,
> >  		 * This page will go to BIO.  Do we need to send this
> >  		 * BIO off first?
> >  		 */
> > -		if (bio && (last_block_in_bio != blocks[0] - 1)) {
> > +		if (bio && (last_block_in_bio != blocks[0] - 1 ||
> > +			    !fscrypt_mergeable_bio(bio, inode, next_block))) {
> >  		submit_and_realloc:
> >  			submit_bio(bio);
> >  			bio = NULL;
> > @@ -366,6 +369,8 @@ int ext4_mpage_readpages(struct address_space *mapping,
> >  			 */
> >  			bio = bio_alloc(GFP_KERNEL,
> >  				min_t(int, nr_pages, BIO_MAX_PAGES));
> > +			fscrypt_set_bio_crypt_ctx(bio, inode, next_block,
> > +						  GFP_KERNEL);
> >  			ctx = get_bio_post_read_ctx(inode, bio, page->index);
> >  			if (IS_ERR(ctx)) {
> >  				bio_put(bio);
> > diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> > index 1d82b56d9b11..0a6b60620942 100644
> > --- a/fs/ext4/super.c
> > +++ b/fs/ext4/super.c
> > @@ -1357,6 +1357,11 @@ static void ext4_get_ino_and_lblk_bits(struct super_block *sb,
> >  	*lblk_bits_ret = 8 * sizeof(ext4_lblk_t);
> >  }
> >  
> > +static bool ext4_inline_crypt_enabled(struct super_block *sb)
> > +{
> > +	return test_opt(sb, INLINECRYPT);
> > +}
> > +
> >  static const struct fscrypt_operations ext4_cryptops = {
> >  	.key_prefix		= "ext4:",
> >  	.get_context		= ext4_get_context,
> > @@ -1366,6 +1371,7 @@ static const struct fscrypt_operations ext4_cryptops = {
> >  	.max_namelen		= EXT4_NAME_LEN,
> >  	.has_stable_inodes	= ext4_has_stable_inodes,
> >  	.get_ino_and_lblk_bits	= ext4_get_ino_and_lblk_bits,
> > +	.inline_crypt_enabled	= ext4_inline_crypt_enabled,
> >  };
> >  #endif
> >  
> > @@ -1460,6 +1466,7 @@ enum {
> >  	Opt_journal_path, Opt_journal_checksum, Opt_journal_async_commit,
> >  	Opt_abort, Opt_data_journal, Opt_data_ordered, Opt_data_writeback,
> >  	Opt_data_err_abort, Opt_data_err_ignore, Opt_test_dummy_encryption,
> > +	Opt_inlinecrypt,
> >  	Opt_usrjquota, Opt_grpjquota, Opt_offusrjquota, Opt_offgrpjquota,
> >  	Opt_jqfmt_vfsold, Opt_jqfmt_vfsv0, Opt_jqfmt_vfsv1, Opt_quota,
> >  	Opt_noquota, Opt_barrier, Opt_nobarrier, Opt_err,
> > @@ -1556,6 +1563,7 @@ static const match_table_t tokens = {
> >  	{Opt_noinit_itable, "noinit_itable"},
> >  	{Opt_max_dir_size_kb, "max_dir_size_kb=%u"},
> >  	{Opt_test_dummy_encryption, "test_dummy_encryption"},
> > +	{Opt_inlinecrypt, "inlinecrypt"},
> >  	{Opt_nombcache, "nombcache"},
> >  	{Opt_nombcache, "no_mbcache"},	/* for backward compatibility */
> >  	{Opt_removed, "check=none"},	/* mount option from ext2/3 */
> > @@ -1767,6 +1775,11 @@ static const struct mount_opts {
> >  	{Opt_jqfmt_vfsv1, QFMT_VFS_V1, MOPT_QFMT},
> >  	{Opt_max_dir_size_kb, 0, MOPT_GTE0},
> >  	{Opt_test_dummy_encryption, 0, MOPT_GTE0},
> > +#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
> > +	{Opt_inlinecrypt, EXT4_MOUNT_INLINECRYPT, MOPT_SET},
> > +#else
> > +	{Opt_inlinecrypt, EXT4_MOUNT_INLINECRYPT, MOPT_NOSUPPORT},
> > +#endif
> >  	{Opt_nombcache, EXT4_MOUNT_NO_MBCACHE, MOPT_SET},
> >  	{Opt_err, 0, 0}
> >  };
> 
> On v5 there was a discussion about using a flag like SB_INLINECRYPT to replace
> the ->inline_crypt_enabled() function.  Was this considered?
> 
Right, I'll add this change to the next version too.
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
