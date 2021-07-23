Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 011EE3D423C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 23:33:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m72nP-0004Ks-5x; Fri, 23 Jul 2021 21:33:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m72nM-0004KP-Kx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 21:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GKs5hxv+15JGZDCeLig3164Bf7nUnIfS7EU0GY9AYms=; b=IKFiX7utTdxIay3dYb4R7iU0d6
 imZs+JF62zPxvjG5gnULhpDFI25Lfyo4vfsN2rdHgrT+4+6ROtPupu6KAQYXX1FUUl1KSJCfaALFS
 P7CyDV33A3Va80J6HPg4zy92CdMhrXloZZHrlwLNrLW+4npyIhsfXltp7oyQZay/G/R4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GKs5hxv+15JGZDCeLig3164Bf7nUnIfS7EU0GY9AYms=; b=GvlbKQ1UOTQXe6OCL7VyPL0o0H
 xkYkPt5U+eZGJj1Yvksrujl337zgvvacpwTscOO3jYuuR/s3PQHOyQsB894QE6Nm0bt8+1+OQt6ZB
 XxlQxp6rphuCjVZtYUCnEA45s1E8y+4NT7fqqHEVNKTEwd0kjNWofCCUQAXkflhf9pWk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m72nG-000fJW-CH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 21:33:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2201D60E95;
 Fri, 23 Jul 2021 21:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627075984;
 bh=eDyfTJkhAEqBNLOKOQEdjUlMWFhdZsosN6wkEEjmDxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mpggqgv1U3DixYp5XcaYXBa21ZWRnY9mhiXBpGHEXXnlBVTVVQtjbI1XFIRjgq/3X
 J37lop3q4dq4yBeJl3GiuuL9Po+2k3Sx2yIeJo4NZYyXYTHCD2TDUXpjQCimJe1o2m
 vbSIQ4s1xdCv3hBTNP7vO567ZFhgjGqFzvDsaA6hXoTzqgsNFhunGUDTNb6mSWq/zM
 BaBteXbMxznNr0Csf/drNvX4o5A/KD24q8VrKeyH8fI/bOvZSsjnOPi2U0qCtu4npa
 aEtm+ZIU6GQ5sLA1JoXFE23vNBkLhgm5kgsKYESIMHpDDpfoljjoBM/GP18fSuicUF
 mN9xdY2W4of4A==
Date: Fri, 23 Jul 2021 14:33:02 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <YPs1jlAsvXLomSJJ@gmail.com>
References: <20210604210908.2105870-1-satyat@google.com>
 <20210604210908.2105870-6-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604210908.2105870-6-satyat@google.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m72nG-000fJW-CH
Subject: Re: [f2fs-dev] [PATCH v9 5/9] block: Make bio_iov_iter_get_pages()
 respect bio_required_sector_alignment()
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 04, 2021 at 09:09:04PM +0000, Satya Tangirala wrote:
> Previously, bio_iov_iter_get_pages() wasn't used with bios that could have
> an encryption context. However, direct I/O support using blk-crypto
> introduces this possibility, so this function must now respect
> bio_required_sector_alignment() (otherwise, xfstests like generic/465 with
> ext4 will fail).

Can you be more clear that the fscrypt direct I/O support only requires this in
order to support I/O segments that aren't fs-block aligned?

I do still wonder if we should just not support that...  Dave is the only person
who has asked for it, and it's a lot of trouble to support.

I also noticed that f2fs has always only supported direct I/O that is *fully*
fs-block aligned (including the I/O segments) anyway.  So presumably that
limitation is not really that important after all...

Does anyone else have thoughts on this?

One more comment on this patch below:

> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  block/bio.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/block/bio.c b/block/bio.c
> index 32f75f31bb5c..99c510f706e2 100644
> --- a/block/bio.c
> +++ b/block/bio.c
> @@ -1099,7 +1099,8 @@ static int __bio_iov_append_get_pages(struct bio *bio, struct iov_iter *iter)
>   * The function tries, but does not guarantee, to pin as many pages as
>   * fit into the bio, or are requested in @iter, whatever is smaller. If
>   * MM encounters an error pinning the requested pages, it stops. Error
> - * is returned only if 0 pages could be pinned.
> + * is returned only if 0 pages could be pinned. It also ensures that the number
> + * of sectors added to the bio is aligned to bio_required_sector_alignment().
>   *
>   * It's intended for direct IO, so doesn't do PSI tracking, the caller is
>   * responsible for setting BIO_WORKINGSET if necessary.
> @@ -1107,6 +1108,7 @@ static int __bio_iov_append_get_pages(struct bio *bio, struct iov_iter *iter)
>  int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter)
>  {
>  	int ret = 0;
> +	unsigned int aligned_sectors;
>  
>  	if (iov_iter_is_bvec(iter)) {
>  		if (bio_op(bio) == REQ_OP_ZONE_APPEND)
> @@ -1121,6 +1123,15 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter)
>  			ret = __bio_iov_iter_get_pages(bio, iter);
>  	} while (!ret && iov_iter_count(iter) && !bio_full(bio, 0));
>  
> +	/*
> +	 * Ensure that number of sectors in bio is aligned to
> +	 * bio_required_sector_align()
> +	 */
> +	aligned_sectors = round_down(bio_sectors(bio),
> +				     bio_required_sector_alignment(bio));
> +	iov_iter_revert(iter, (bio_sectors(bio) - aligned_sectors) << SECTOR_SHIFT);
> +	bio_truncate(bio, aligned_sectors << SECTOR_SHIFT);
> +
>  	/* don't account direct I/O as memory stall */
>  	bio_clear_flag(bio, BIO_WORKINGSET);
>  	return bio->bi_vcnt ? 0 : ret;

Doesn't this need to return an error if the bio's size gets rounded down to 0?
For example if logical_block_size=512 and data_unit_size=4096, and the iov_iter
points to 4096 bytes in 8 512-byte segments but the last one isn't mapped, then
7 pages would be pinned and the last one would fail.  This would then truncate
the bio's size to 0, but bio->bi_vcnt would be 7, so this would still return 0.
It would also be necessary to release the pages before returning an error.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
