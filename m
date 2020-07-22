Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6AE229DDB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 19:07:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyICt-0008Fx-Pu; Wed, 22 Jul 2020 17:07:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jyICt-0008Fq-4j
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 17:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iyvsIQRGs3nal7rbTA6MwraqyOjKkcsVXw/JihpvAuo=; b=aQo6YcWbqbdznK3juwTCgnS/Ji
 Db8bhWLJ8rMYQ4Ih9Bl6JkRAva+rmMDB0VNW+Qkm7J+hF/yBa2dzqITMJk0YKVo21qGtmpHsSTQwm
 P8235OdnxjNkKzYP+JcUvTXT7VLmH9g959457W/aFyv9iOU//dAJsBK0q6aARAV8EUmI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iyvsIQRGs3nal7rbTA6MwraqyOjKkcsVXw/JihpvAuo=; b=Jgs5epj2j6qeBxTF9Mn/FBrBNW
 1GR+oUg6CgXf4casrp121d4G5Im9KRVGMGagkL6eI/m5s8IpoEbpOGvW+1F13ey3vMbxBGHuo0I1B
 KLoaE7BcMCrf3V9xPK1tnRFTSD9rceKIzNVrMElltFzhCEYSyF5OzPxSgEQiuoMEBFi0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyICr-0051Q4-Ts
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 17:07:03 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 716B32065F;
 Wed, 22 Jul 2020 17:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595437616;
 bh=J9bE9IOReg39TnqW7rQqgVX/bLpQnJgtze/XCWHrEi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SLvlcAXPykYlMlmVanzKn3R31qhYknX1uon6FWXrRV0UQOMps3FOBazrA/ELlo+uv
 MNqN9Ht4B0YtczHGivnbHHdEPndGHM5XTTPdEXCeiRe3J1AosGDJNHFuh9g5rvKbHU
 0q60IWW69l0+aw4fVpq7A8zP3s6fMj8Ao8qr1f9s=
Date: Wed, 22 Jul 2020 10:06:56 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200722170656.GF3912099@google.com>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720233739.824943-4-satyat@google.com>
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
X-Headers-End: 1jyICr-0051Q4-Ts
Subject: Re: [f2fs-dev] [PATCH v4 3/7] iomap: support direct I/O with
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
Cc: Eric Biggers <ebiggers@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/20, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Wire up iomap direct I/O with the fscrypt additions for direct I/O.
> This allows ext4 to support direct I/O on encrypted files when inline
> encryption is enabled.
> 
> This change consists of two parts:
> 
> - Set a bio_crypt_ctx on bios for encrypted files, so that the file
>   contents get encrypted (or decrypted).
> 
> - Ensure that encryption data unit numbers (DUNs) are contiguous within
>   each bio.  Use the new function fscrypt_limit_io_pages() for this,
>   since the iomap code works directly with logical ranges and thus
>   doesn't have a chance to call fscrypt_mergeable_bio() on each page.
> 
> Note that fscrypt_limit_io_pages() is normally a no-op, as normally the
> DUNs simply increment along with the logical blocks.  But it's needed to
> handle an edge case in one of the fscrypt IV generation methods.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Co-developed-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/iomap/direct-io.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index ec7b78e6feca..12064daa3e3d 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -6,6 +6,7 @@
>  #include <linux/module.h>
>  #include <linux/compiler.h>
>  #include <linux/fs.h>
> +#include <linux/fscrypt.h>
>  #include <linux/iomap.h>
>  #include <linux/backing-dev.h>
>  #include <linux/uio.h>
> @@ -183,11 +184,16 @@ static void
>  iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
>  		unsigned len)
>  {
> +	struct inode *inode = file_inode(dio->iocb->ki_filp);
>  	struct page *page = ZERO_PAGE(0);
>  	int flags = REQ_SYNC | REQ_IDLE;
>  	struct bio *bio;
>  
>  	bio = bio_alloc(GFP_KERNEL, 1);
> +
> +	/* encrypted direct I/O is guaranteed to be fs-block aligned */
> +	WARN_ON_ONCE(fscrypt_needs_contents_encryption(inode));
> +
>  	bio_set_dev(bio, iomap->bdev);
>  	bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
>  	bio->bi_private = dio;
> @@ -253,6 +259,7 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
>  		ret = nr_pages;
>  		goto out;
>  	}
> +	nr_pages = fscrypt_limit_io_pages(inode, pos, nr_pages);
>  
>  	if (need_zeroout) {
>  		/* zero out from the start of the block to the write offset */
> @@ -270,6 +277,8 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
>  		}
>  
>  		bio = bio_alloc(GFP_KERNEL, nr_pages);
> +		fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
> +					  GFP_KERNEL);
>  		bio_set_dev(bio, iomap->bdev);
>  		bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
>  		bio->bi_write_hint = dio->iocb->ki_hint;
> @@ -306,9 +315,10 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
>  		dio->size += n;
>  		copied += n;
>  
> -		nr_pages = iov_iter_npages(dio->submit.iter, BIO_MAX_PAGES);
>  		iomap_dio_submit_bio(dio, iomap, bio, pos);
>  		pos += n;
> +		nr_pages = iov_iter_npages(dio->submit.iter, BIO_MAX_PAGES);
> +		nr_pages = fscrypt_limit_io_pages(inode, pos, nr_pages);
>  	} while (nr_pages);
>  
>  	/*
> -- 
> 2.28.0.rc0.105.gf9edc3c819-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
