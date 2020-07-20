Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1247C226F09
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jul 2020 21:30:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxbU3-0005Fq-Iq; Mon, 20 Jul 2020 19:29:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jxbU2-0005Fg-1u
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 19:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ceFxWKprInT2ffWy+a5aJtDQ4iA/hjMFFfr0EhJgYXE=; b=nFfVMcgawAY4bWi5sQXbYkpVAH
 clonKABEsnu2csd1daM7+i5rLDLFTn5Y5szg/JqqKKaHCiqBFGeOtsmeU08nBZqh3jcQIl6XMjoaV
 FJ7oeX91co0ek9PNYwYuP9LHWmMLudeYsCp58M/3T5suogm8XwqRP2XaIbtSsrt/tWtw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ceFxWKprInT2ffWy+a5aJtDQ4iA/hjMFFfr0EhJgYXE=; b=Dadmow6hftxlWKbhWMvD2i5g0s
 Ojh8tjA06HKDKsRk/9TwBM1NoePJGMhUIqNKe0t7C4R3ndkbmv54c3TvJl+OURXMyqjMhklWZ57f1
 rWyE4sd4iP5X1xh10WydNE6rj1vxOkN0t3I3Utwrb2IJ2pR5cy3l3mffueR0Lo+5xI/k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxbU0-001zD0-Ro
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 19:29:54 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A1E620773;
 Mon, 20 Jul 2020 19:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595273387;
 bh=p9MSRNwJssID8LsizQqfdqvIlunqUMeWXc/JgkGaXi0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GquwQiP/sRX76vVq9CjrWtrz91gsYU5skbVXwteYGpXuvF418/XjmOcLHqQld9G4K
 3lrNMhrkXTB+kT0/xVAH8alRXHtdekNe4EKq+z+QZWLPKSTLoxRZA4ah54G8TlsWnh
 O+8/ei1YQ2RJZjTF7+98Xty5tQ+lTjHyqb+CbM1Y=
Date: Mon, 20 Jul 2020 12:29:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200720192945.GG1292162@gmail.com>
References: <20200717014540.71515-1-satyat@google.com>
 <20200717014540.71515-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717014540.71515-4-satyat@google.com>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -1.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxbU0-001zD0-Ro
Subject: Re: [f2fs-dev] [PATCH v3 3/7] iomap: support direct I/O with
 fscrypt using blk-crypto
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 17, 2020 at 01:45:36AM +0000, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Wire up iomap direct I/O with the fscrypt additions for direct I/O,
> and set bio crypt contexts on bios when appropriate.
> 
> Make iomap_dio_bio_actor() call fscrypt_limit_io_pages() to ensure that
> DUNs remain contiguous within a bio, since it works directly with logical
> ranges and can't call fscrypt_mergeable_bio() on each page.

This commit message is still confusing.

How about the following:

"Wire up iomap direct I/O with the fscrypt additions for direct I/O.
This allows ext4 to support direct I/O on encrypted files when inline
encryption is enabled.

This change consists of two parts:

- Set a bio_crypt_ctx on bios for encrypted files, so that the file
  contents get encrypted (or decrypted).

- Ensure that encryption data unit numbers (DUNs) are contiguous within
  each bio.  Use the new function fscrypt_limit_io_pages() for this,
  since the iomap code works directly with logical ranges and thus
  doesn't have a chance to call fscrypt_mergeable_bio() on each page.

Note that fscrypt_limit_io_pages() is normally a no-op, as normally the
DUNs simply increment along with the logical blocks.  But it's needed to
handle an edge case in one of the fscrypt IV generation methods."

> @@ -183,11 +184,14 @@ static void
>  iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
>  		unsigned len)
>  {
> +	struct inode *inode = file_inode(dio->iocb->ki_filp);
>  	struct page *page = ZERO_PAGE(0);
>  	int flags = REQ_SYNC | REQ_IDLE;
>  	struct bio *bio;
>  
>  	bio = bio_alloc(GFP_KERNEL, 1);
> +	fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
> +				  GFP_KERNEL);
>  	bio_set_dev(bio, iomap->bdev);
>  	bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
>  	bio->bi_private = dio;

iomap_dio_zero() is only used on partial filesystem blocks.  But, we
only allow direct I/O on encrypted files when the I/O is
filesystem-block-aligned.

So this part appears to be unnecessary.

How about replacing it with:

	/* encrypted direct I/O is guaranteed to be fs-block aligned */
	WARN_ON_ONCE(fscrypt_needs_contents_encryption(inode));

> @@ -253,6 +257,7 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
>  		ret = nr_pages;
>  		goto out;
>  	}
> +	nr_pages = fscrypt_limit_io_pages(inode, pos, nr_pages);
>  
>  	if (need_zeroout) {
>  		/* zero out from the start of the block to the write offset */
> @@ -270,6 +275,8 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
>  		}
>  
>  		bio = bio_alloc(GFP_KERNEL, nr_pages);
> +		fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
> +					  GFP_KERNEL);
>  		bio_set_dev(bio, iomap->bdev);
>  		bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
>  		bio->bi_write_hint = dio->iocb->ki_hint;
> @@ -307,6 +314,7 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
>  		copied += n;
>  
>  		nr_pages = iov_iter_npages(dio->submit.iter, BIO_MAX_PAGES);
> +		nr_pages = fscrypt_limit_io_pages(inode, pos, nr_pages);
>  		iomap_dio_submit_bio(dio, iomap, bio, pos);
>  		pos += n;
>  	} while (nr_pages);

I think the part at the end is wrong.

We want to limit the *next* bio, not the current one.

So 'pos' needs to be updated first.

I think it should be:

                iomap_dio_submit_bio(dio, iomap, bio, pos);
                pos += n;
                nr_pages = iov_iter_npages(dio->submit.iter, BIO_MAX_PAGES);
                nr_pages = fscrypt_limit_io_pages(inode, pos, nr_pages);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
