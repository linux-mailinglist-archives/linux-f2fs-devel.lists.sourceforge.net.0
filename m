Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9009C22CB5B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 18:46:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jz0q5-0006E7-FI; Fri, 24 Jul 2020 16:46:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jz0q3-0006Dg-Un
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 16:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=49GSEfr1Dt8ikKl2L+BBgiukMY2iKhrmAW6Z4CAWEX0=; b=AWFUnSoKp0l+XeJh+oE6Wvf41j
 lCNmyjI1ieKXQVirCv0VX/Y9H3JApV8c81IbBIGHZtm2Nf2HkyZstf4+MhsCddKnoyylo8vwi16CC
 RWKlocTXtAjWeRIUJ0QEKmW03bvpdKO0pzjc4nlhANWofE9JaU0N+AxGSb+XdzXGywso=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=49GSEfr1Dt8ikKl2L+BBgiukMY2iKhrmAW6Z4CAWEX0=; b=kalduN0aElR4Shg+xY6a/kml6J
 HyEnRtgWtdPST8oJL+ImGiLlsALt0ZER8NnkuUoDdtprjHstPttnQPE6/BuAr98VberhPmNDqKq8N
 G5qgcCmqWr8cG3kiWycOBY3HMlkIdr0waLvDTq2xoZsvbnv06pExn1xOxH8K8Eq6z3FE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jz0q1-007ktD-Sf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 16:46:27 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94EBB206F0;
 Fri, 24 Jul 2020 16:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595609178;
 bh=ronJJOZmDzLOufnZltpx4KGJDoNF7F4ILWGJHIg9sQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SzwpohwRf7jIyzTvokD9BSXkKYQWQ7SxhS9EMWW0EOIlQNKTkFWhUcj/g19PoZETD
 M6TozYZaIDRbeW/LB7hVnaqpti/XueLY/iFNzJ4OwqOJdQJQx5nMyiTDujtf80klZS
 NleNkGmecr8ac/3eThBusaaGEt7DTegp7JEdbLVE=
Date: Fri, 24 Jul 2020 09:46:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200724164617.GA819@sol.localdomain>
References: <20200724121143.1589121-1-satyat@google.com>
 <20200724121143.1589121-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724121143.1589121-2-satyat@google.com>
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jz0q1-007ktD-Sf
Subject: Re: [f2fs-dev] [PATCH v5 1/7] fscrypt: Add functions for direct I/O
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 24, 2020 at 12:11:37PM +0000, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Introduce fscrypt_dio_supported() to check whether a direct I/O request
> is unsupported due to encryption constraints.
> 
> Also introduce fscrypt_limit_io_blocks() to limit how many blocks can be
> added to a bio being prepared for direct I/O. This is needed for
> filesystems that use the iomap direct I/O implementation to avoid DUN
> wraparound in the middle of a bio (which is possible with the
> IV_INO_LBLK_32 IV generation method). Elsewhere fscrypt_mergeable_bio()
> is used for this, but iomap operates on logical ranges directly, so
> filesystems using iomap won't have a chance to call fscrypt_mergeable_bio()
> on every block added to a bio. So we need this function which limits a
> logical range in one go.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Co-developed-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>
> Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

Note, generally you should drop Reviewed-by tags if you make nontrivial changes.

> +/**
> + * fscrypt_limit_io_blocks() - limit I/O blocks to avoid discontiguous DUNs
> + * @inode: the file on which I/O is being done
> + * @pos: the file position (in bytes) at which the I/O is being done
> + * @nr_blocks: the number of blocks we want to submit starting at @pos
> + *
> + * Determine the limit to the number of blocks that can be submitted in the bio
> + * targeting @pos without causing a data unit number (DUN) discontinuity.
> + *
> + * This is normally just @nr_blocks, as normally the DUNs just increment along
> + * with the logical blocks.  (Or the file is not encrypted.)
> + *
> + * In rare cases, fscrypt can be using an IV generation method that allows the
> + * DUN to wrap around within logically continuous blocks, and that wraparound
> + * will occur.  If this happens, a value less than @nr_blocks will be returned
> + * so that the wraparound doesn't occur in the middle of the bio.
> + *
> + * Return: the actual number of blocks that can be submitted
> + */
> +int fscrypt_limit_io_blocks(const struct inode *inode, loff_t pos,
> +			    unsigned int nr_blocks)

ext4 actually passes a block number for the second argument, not a position.

Also, we should make this ready for 64-bit block numbers.  When it's trivial to
do, we keep fs/crypto/ ready for 64-bit block numbers, even though it's not
needed yet.  E.g. see fscrypt_crypt_block() and fscrypt_generate_iv().

It's true that currently this function is a no-op except for IV_INO_LBLK_32, but
that's more of an implementation detail.

So the prototype I recommend is:

u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk, u64 nr_blocks);

> +{
> +	const struct fscrypt_info *ci = inode->i_crypt_info;
> +	u32 dun;
> +
> +	if (!fscrypt_inode_uses_inline_crypto(inode))
> +		return nr_blocks;
> +
> +	if (nr_blocks <= 1)
> +		return nr_blocks;
> +
> +	if (!(fscrypt_policy_flags(&ci->ci_policy) &
> +	      FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32))
> +		return nr_blocks;
> +
> +	/* With IV_INO_LBLK_32, the DUN can wrap around from U32_MAX to 0. */
> +
> +	dun = ci->ci_hashed_ino + (pos >> inode->i_blkbits);
> +
> +	return min_t(u64, nr_blocks, (u64)U32_MAX + 1 - dun);
> +}
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index bb257411365f..241266cba21f 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -559,6 +559,11 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
>  bool fscrypt_mergeable_bio_bh(struct bio *bio,
>  			      const struct buffer_head *next_bh);
>  
> +bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter);
> +
> +int fscrypt_limit_io_blocks(const struct inode *inode, loff_t pos,
> +			    unsigned int nr_blocks);
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
> +static inline int fscrypt_limit_io_blocks(const struct inode *inode, loff_t pos,
> +					  unsigned int nr_blocks)
> +{
> +	return nr_blocks;
> +}
>  #endif /* !CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
>  
>  /**
> -- 
> 2.28.0.rc0.142.g3c755180ce-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
