Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0399A229DC3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 19:05:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyIAt-0004C4-Ku; Wed, 22 Jul 2020 17:04:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jyIAs-0004Br-1x
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 17:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vBQtxuDIAFiFUBRb8kAjLyMbc7qChUswpY7CiKs/NMA=; b=A/UwWOxbVkX6xDuudS529U/Qri
 aIA5ak2ww6lIslAusfnUWHvp5B5tnQc+NWPyKfYsrqLrD+Dq6wtiSMNCfjwBjBhmH/iZHyGaNgVAR
 jD7oErga2Dx61KuJkmdsrJt6AlkxLiXxUAUSGHMrF744UBZFfmfjMrdYTodkXavSFB/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vBQtxuDIAFiFUBRb8kAjLyMbc7qChUswpY7CiKs/NMA=; b=cwkdWlfElctfXZtBIE/QRVmP4C
 GmJ9RwX7vGQ6iisYCtbJy6u4TKGyYHoIkDF5tn90wLrFUndUmfy6nmsW2f5YrzBBXhj2eTPBOmXHl
 iqSwQ+oM1BG1sM90y07HP1AuqSfY1gzYMQj3akim7xKTdkEWn9uuu+Q8HfWiIBtatido=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyIAq-00Dli9-GA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 17:04:57 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 16E18206F5;
 Wed, 22 Jul 2020 17:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595437490;
 bh=A6Jd4Cjj8c0g86XqWJrKT0fAAeTmScSyqf38YdNhjcU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e3EQYRL6Ci+f7UHqYc4tN9nFI+OtwsMDcOvs8kDdryl7Vlc5H+TGpBLaovGL2P3me
 mhbrpnrj0zUQxROoqAw0ujeO/PJ2cdNr1FU2NJNbjXk9X9a16k2SJBBvfQI+5Zfcif
 verquqt5Y1f1XAv/tlf9G1pX36AWK8lqnYg1SU44=
Date: Wed, 22 Jul 2020 10:04:49 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200722170449.GD3912099@google.com>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720233739.824943-2-satyat@google.com>
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyIAq-00Dli9-GA
Subject: Re: [f2fs-dev] [PATCH v4 1/7] fscrypt: Add functions for direct I/O
 support
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
Cc: Eric Biggers <ebiggers@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/20, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Introduce fscrypt_dio_supported() to check whether a direct I/O request
> is unsupported due to encryption constraints.
> 
> Also introduce fscrypt_limit_io_pages() to limit how many pages can be
> added to a bio being prepared for direct I/O. This is needed for the
> iomap direct I/O implementation to avoid DUN wraparound in the middle of
> a bio (which is possible with the IV_INO_LBLK_32 IV generation method).
> Elsewhere fscrypt_mergeable_bio() is used for this, but iomap operates
> on logical ranges directly and doesn't have a chance to call
> fscrypt_mergeable_bio() on every block or page. So we need this function
> which limits a logical range in one go.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Co-developed-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/crypto/crypto.c       |  8 ++++
>  fs/crypto/inline_crypt.c | 82 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/fscrypt.h  | 19 ++++++++++
>  3 files changed, 109 insertions(+)
> 
> diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
> index a52cf32733ab..fb34364360b3 100644
> --- a/fs/crypto/crypto.c
> +++ b/fs/crypto/crypto.c
> @@ -69,6 +69,14 @@ void fscrypt_free_bounce_page(struct page *bounce_page)
>  }
>  EXPORT_SYMBOL(fscrypt_free_bounce_page);
>  
> +/*
> + * Generate the IV for the given logical block number within the given file.
> + * For filenames encryption, lblk_num == 0.
> + *
> + * Keep this in sync with fscrypt_limit_io_pages().  fscrypt_limit_io_pages()
> + * needs to know about any IV generation methods where the low bits of IV don't
> + * simply contain the lblk_num (e.g., IV_INO_LBLK_32).
> + */
>  void fscrypt_generate_iv(union fscrypt_iv *iv, u64 lblk_num,
>  			 const struct fscrypt_info *ci)
>  {
> diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
> index d7aecadf33c1..578739712e00 100644
> --- a/fs/crypto/inline_crypt.c
> +++ b/fs/crypto/inline_crypt.c
> @@ -16,6 +16,7 @@
>  #include <linux/blkdev.h>
>  #include <linux/buffer_head.h>
>  #include <linux/sched/mm.h>
> +#include <linux/uio.h>
>  
>  #include "fscrypt_private.h"
>  
> @@ -362,3 +363,84 @@ bool fscrypt_mergeable_bio_bh(struct bio *bio,
>  	return fscrypt_mergeable_bio(bio, inode, next_lblk);
>  }
>  EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio_bh);
> +
> +/**
> + * fscrypt_dio_supported() - check whether a direct I/O request is unsupported
> + *			     due to encryption constraints
> + * @iocb: the file and position the I/O is targeting
> + * @iter: the I/O data segment(s)
> + *
> + * Return: true if direct I/O is supported
> + */
> +bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter)
> +{
> +	const struct inode *inode = file_inode(iocb->ki_filp);
> +	const unsigned int blocksize = i_blocksize(inode);
> +
> +	/* If the file is unencrypted, no veto from us. */
> +	if (!fscrypt_needs_contents_encryption(inode))
> +		return true;
> +
> +	/* We only support direct I/O with inline crypto, not fs-layer crypto */
> +	if (!fscrypt_inode_uses_inline_crypto(inode))
> +		return false;
> +
> +	/*
> +	 * Since the granularity of encryption is filesystem blocks, the I/O
> +	 * must be block aligned -- not just disk sector aligned.
> +	 */
> +	if (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(iter), blocksize))
> +		return false;
> +
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(fscrypt_dio_supported);
> +
> +/**
> + * fscrypt_limit_io_pages() - limit I/O pages to avoid discontiguous DUNs
> + * @inode: the file on which I/O is being done
> + * @pos: the file position (in bytes) at which the I/O is being done
> + * @nr_pages: the number of pages we want to submit starting at @pos
> + *
> + * Determine the limit to the number of pages that can be submitted in the bio
> + * targeting @pos without causing a data unit number (DUN) discontinuity.
> + *
> + * This is normally just @nr_pages, as normally the DUNs just increment along
> + * with the logical blocks.  (Or the file is not encrypted.)
> + *
> + * In rare cases, fscrypt can be using an IV generation method that allows the
> + * DUN to wrap around within logically continuous blocks, and that wraparound
> + * will occur.  If this happens, a value less than @nr_pages will be returned so
> + * that the wraparound doesn't occur in the middle of the bio.  Note that we
> + * only support block_size == PAGE_SIZE (and page-aligned DIO) in such cases.
> + *
> + * Return: the actual number of pages that can be submitted
> + */
> +int fscrypt_limit_io_pages(const struct inode *inode, loff_t pos, int nr_pages)
> +{
> +	const struct fscrypt_info *ci = inode->i_crypt_info;
> +	u32 dun;
> +
> +	if (!fscrypt_inode_uses_inline_crypto(inode))
> +		return nr_pages;
> +
> +	if (nr_pages <= 1)
> +		return nr_pages;
> +
> +	if (!(fscrypt_policy_flags(&ci->ci_policy) &
> +	      FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32))
> +		return nr_pages;
> +
> +	/*
> +	 * fscrypt_select_encryption_impl() ensures that block_size == PAGE_SIZE
> +	 * when using FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32.
> +	 */
> +	if (WARN_ON_ONCE(i_blocksize(inode) != PAGE_SIZE))
> +		return 1;
> +
> +	/* With IV_INO_LBLK_32, the DUN can wrap around from U32_MAX to 0. */
> +
> +	dun = ci->ci_hashed_ino + (pos >> inode->i_blkbits);
> +
> +	return min_t(u64, nr_pages, (u64)U32_MAX + 1 - dun);
> +}
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index bb257411365f..c205c214b35e 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -559,6 +559,11 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
>  bool fscrypt_mergeable_bio_bh(struct bio *bio,
>  			      const struct buffer_head *next_bh);
>  
> +bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter);
> +
> +int fscrypt_limit_io_pages(const struct inode *inode, loff_t pos,
> +			   int nr_pages);
> +
>  #else /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
>  
>  static inline bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
> @@ -587,6 +592,20 @@ static inline bool fscrypt_mergeable_bio_bh(struct bio *bio,
>  {
>  	return true;
>  }
> +
> +static inline bool fscrypt_dio_supported(struct kiocb *iocb,
> +					 struct iov_iter *iter)
> +{
> +	const struct inode *inode = file_inode(iocb->ki_filp);
> +
> +	return !fscrypt_needs_contents_encryption(inode);
> +}
> +
> +static inline int fscrypt_limit_io_pages(const struct inode *inode, loff_t pos,
> +					 int nr_pages)
> +{
> +	return nr_pages;
> +}
>  #endif /* !CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
>  
>  /**
> -- 
> 2.28.0.rc0.105.gf9edc3c819-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
