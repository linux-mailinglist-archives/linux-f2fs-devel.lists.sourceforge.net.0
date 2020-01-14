Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 302DC13B41C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jan 2020 22:13:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irTUg-0004ry-GI; Tue, 14 Jan 2020 21:12:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1irTUf-0004rr-7U
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 21:12:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ybNZ8wKgI8L3tBF7nQ3GQQ6ChJg3kSEldpJ/J9fEtGU=; b=SMz/s7WK+0mD1MQwkGLyHBEZx9
 nsniZcpaWcsy9C9GO+e+FMFuTohK7U82gtpFw4RYtwO84rBTrQCFf1JFy3/bp+lEItYY5BwHxXzNi
 BL/fipDvnQYDhfFTAfdqLKTuxcQmy4dOjvEz1g+2yQbqb4M/bDjSx2CF7ExAk8DHqqf4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ybNZ8wKgI8L3tBF7nQ3GQQ6ChJg3kSEldpJ/J9fEtGU=; b=jLP84CgGCPuOzGVtbgN2UwO5hi
 /w8AZE79gEBEB85DbCNN1sJCmBhSnJg18TOhs+C6D/GagYXmKBv24N/PUkwHfHrBka5lHIQlhaI6y
 /kzpuIIKHbQK5ZD2Na0HCdq6N4jqaKj6TtequUIc3+Hi9M1W/vJzcbJtawVv5jiO5Ats=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irTUd-003Vl2-TD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 21:12:57 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2244124658;
 Tue, 14 Jan 2020 21:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579036365;
 bh=J3OsxJ0QF2e1qLWbeTaDEKd7v4FiOXvliReYz6wlurA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YSpaSCiNWpxz/Hp2I+ocHoWQz+de0pi1yKaVA0WbbtASy9uM/orM1gSNArzG1gjKk
 xZOGhpvoB7cWI1MxLIjy5b+npg8ynLKCAHAJVmhzVpuVGbrMBK5UchQD+tdNUNiIPB
 iaXoDigsthokLSovxzjetaBBqV1oyWdI7noUMCyA=
Date: Tue, 14 Jan 2020 13:12:43 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200114211243.GC41220@gmail.com>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-8-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218145136.172774-8-satyat@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.6 (/)
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
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1irTUd-003Vl2-TD
Subject: Re: [f2fs-dev] [PATCH v6 7/9] fscrypt: add inline encryption support
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
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 18, 2019 at 06:51:34AM -0800, Satya Tangirala wrote:
> diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
> index 1f4b8a277060..d28d8e803554 100644
> --- a/fs/crypto/bio.c
> +++ b/fs/crypto/bio.c
> @@ -46,26 +46,35 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
>  {
>  	const unsigned int blockbits = inode->i_blkbits;
>  	const unsigned int blocksize = 1 << blockbits;
> +	const bool inlinecrypt = fscrypt_inode_uses_inline_crypto(inode);
>  	struct page *ciphertext_page;
>  	struct bio *bio;
>  	int ret, err = 0;
>  
> -	ciphertext_page = fscrypt_alloc_bounce_page(GFP_NOWAIT);
> -	if (!ciphertext_page)
> -		return -ENOMEM;
> +	if (inlinecrypt) {
> +		ciphertext_page = ZERO_PAGE(0);
> +	} else {
> +		ciphertext_page = fscrypt_alloc_bounce_page(GFP_NOWAIT);
> +		if (!ciphertext_page)
> +			return -ENOMEM;
> +	}
>  
>  	while (len--) {
> -		err = fscrypt_crypt_block(inode, FS_ENCRYPT, lblk,
> -					  ZERO_PAGE(0), ciphertext_page,
> -					  blocksize, 0, GFP_NOFS);
> -		if (err)
> -			goto errout;
> +		if (!inlinecrypt) {
> +			err = fscrypt_crypt_block(inode, FS_ENCRYPT, lblk,
> +						  ZERO_PAGE(0), ciphertext_page,
> +						  blocksize, 0, GFP_NOFS);
> +			if (err)
> +				goto errout;
> +		}
>  
>  		bio = bio_alloc(GFP_NOWAIT, 1);
>  		if (!bio) {
>  			err = -ENOMEM;
>  			goto errout;
>  		}
> +		fscrypt_set_bio_crypt_ctx(bio, inode, lblk, GFP_NOIO);
> +
>  		bio_set_dev(bio, inode->i_sb->s_bdev);
>  		bio->bi_iter.bi_sector = pblk << (blockbits - 9);
>  		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
> @@ -87,7 +96,8 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
>  	}
>  	err = 0;
>  errout:
> -	fscrypt_free_bounce_page(ciphertext_page);
> +	if (!inlinecrypt)
> +		fscrypt_free_bounce_page(ciphertext_page);
>  	return err;
>  }
>  EXPORT_SYMBOL(fscrypt_zeroout_range);

FYI, I've just applied a patch
(https://lore.kernel.org/r/20191226160813.53182-1-ebiggers@kernel.org/)
to fscrypt.git#master that optimizes this function to write multiple pages at a
time.  So this part of this patch will need to be reworked.  I suggest just
handling the inline and fs-layer encryption cases separately.

I maintain a testing branch that has all the pending patches I'm interested in
applied, so I actually already hacked together the following to resolve the
conflict.  Please double check it carefully before using it in v7 though:

static int fscrypt_zeroout_range_inlinecrypt(const struct inode *inode,
					     pgoff_t lblk,
					     sector_t pblk, unsigned int len)
{
	const unsigned int blockbits = inode->i_blkbits;
	const unsigned int blocks_per_page_bits = PAGE_SHIFT - blockbits;
	const unsigned int blocks_per_page = 1 << blocks_per_page_bits;
	unsigned int i;
	struct bio *bio;
	int ret, err;

	/* This always succeeds since __GFP_DIRECT_RECLAIM is set. */
	bio = bio_alloc(GFP_NOFS, BIO_MAX_PAGES);

	do {
		bio_set_dev(bio, inode->i_sb->s_bdev);
		bio->bi_iter.bi_sector = pblk << (blockbits - 9);
		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
		fscrypt_set_bio_crypt_ctx(bio, inode, lblk, GFP_NOFS);

		i = 0;
		do {
			unsigned int blocks_this_page =
				min(len, blocks_per_page);
			unsigned int bytes_this_page =
				blocks_this_page << blockbits;

			ret = bio_add_page(bio, ZERO_PAGE(0),
					   bytes_this_page, 0);
			if (WARN_ON(ret != bytes_this_page)) {
				err = -EIO;
				goto out;
			}
			lblk += blocks_this_page;
			pblk += blocks_this_page;
			len -= blocks_this_page;
		} while (++i != BIO_MAX_PAGES && len != 0);

		err = submit_bio_wait(bio);
		if (err)
			goto out;
		bio_reset(bio);
	} while (len != 0);
	err = 0;
out:
	bio_put(bio);
	return err;
}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
