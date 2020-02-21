Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF38F1686D5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 19:40:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5DDs-0007pN-VV; Fri, 21 Feb 2020 18:40:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j5DDr-0007pA-AS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 18:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G+MomOU1TbmAxWE9wzxfDOXFuB6DjpEC8bY8Hv2jEXA=; b=m/3bdRxu6yK6bKYjhFOJTs9TWM
 Ym/DYXK8UuKA39Zr+QYOChCs6ZqySM4xAd8cOhlzUR9VQ0pi77Ydq2Rbr+LQMGixWlc0npknDkGcv
 1PNmFSOb5Zu+6i9Alm9IbPSiFfJh3nAvpnIfeW2aIvnU1E0wfOI7/Uk656MsmoNEcQdg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G+MomOU1TbmAxWE9wzxfDOXFuB6DjpEC8bY8Hv2jEXA=; b=i0pqxUqv6ohnBPr/a2HOUBtdil
 pnTG/Wo0KndKXwRZ6tw+4l8Wza4BRmwZwHL0mBrO/ytlEwwXv3v1VxTVZdvh3RrurP2RfyhQygMqO
 7Cbw7b+6wtZqaR/jc/2EyuypYCOYOVMar+qOxWK4D6fHEkHlObC7N8DRsRrWjL1eZmEU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5DDp-00BGth-QW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 18:40:23 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04462208E4;
 Fri, 21 Feb 2020 18:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582310411;
 bh=3YrQ2Cspduv8p1rKuaa41bpCFtQWvnwvF2Buv3BWSGE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UAEVGHH0S7mhCC+QS//PHH1fwrlrqpoUQbMfcOGAzku9VHK4DRtsBKSt+PxFmIBCf
 KMS80bOXgolqa1nlyFbwYcANnTzGrE/4USZOCmCppD6ZYYrSHA/Dbdy00MoaOi6Fl6
 sLYGJ/B6gcxiMLvXAT3ZDqwNJeO/ox8wMsKJBFp8=
Date: Fri, 21 Feb 2020 10:40:09 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200221184009.GD925@sol.localdomain>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-8-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221115050.238976-8-satyat@google.com>
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
X-Headers-End: 1j5DDp-00BGth-QW
Subject: Re: [f2fs-dev] [PATCH v7 7/9] fscrypt: add inline encryption support
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

On Fri, Feb 21, 2020 at 03:50:48AM -0800, Satya Tangirala wrote:
> diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
> index 4fa18fff9c4e..82d06cf4b94a 100644
> --- a/fs/crypto/bio.c
> +++ b/fs/crypto/bio.c
> @@ -24,6 +24,8 @@
>  #include <linux/module.h>
>  #include <linux/bio.h>
>  #include <linux/namei.h>
> +#include <linux/fscrypt.h>

No need to include <linux/fscrypt.h> explicitly here, since everything in
fs/crypto/ already gets it via "fscrypt_private.h".

> +static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
> +					      pgoff_t lblk, sector_t pblk,
> +					      unsigned int len)
> +{
> +	const unsigned int blockbits = inode->i_blkbits;
> +	const unsigned int blocks_per_page = 1 << (PAGE_SHIFT - blockbits);
> +	struct bio *bio;
> +	int ret, err = 0;
> +	int num_pages = 0;
> +
> +	/* This always succeeds since __GFP_DIRECT_RECLAIM is set. */
> +	bio = bio_alloc(GFP_NOFS, BIO_MAX_PAGES);
> +
> +	while (len) {
> +		unsigned int blocks_this_page = min(len, blocks_per_page);
> +		unsigned int bytes_this_page = blocks_this_page << blockbits;
> +
> +		if (num_pages == 0) {
> +			fscrypt_set_bio_crypt_ctx(bio, inode, lblk, GFP_NOIO);

This should use GFP_NOFS rather than the stricter GFP_NOIO.

> +			bio_set_dev(bio, inode->i_sb->s_bdev);
> +			bio->bi_iter.bi_sector =
> +					pblk << (blockbits - SECTOR_SHIFT);
> +			bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
> +		}
> +		ret = bio_add_page(bio, ZERO_PAGE(0), bytes_this_page, 0);
> +		if (WARN_ON(ret != bytes_this_page)) {
> +			err = -EIO;
> +			goto out;
> +		}
> +		num_pages++;
> +		len -= blocks_this_page;
> +		lblk += blocks_this_page;
> +		pblk += blocks_this_page;
> +		if (num_pages == BIO_MAX_PAGES || !len) {
> +			err = submit_bio_wait(bio);
> +			if (!err && bio->bi_status)
> +				err = -EIO;

submit_bio_wait() already checks bi_status and reflects it in the returned
error, so checking it again here is redundant.

> @@ -69,12 +119,17 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
>  	unsigned int nr_pages;
>  	unsigned int i;
>  	unsigned int offset;
> +	const bool inlinecrypt = fscrypt_inode_uses_inline_crypto(inode);
>  	struct bio *bio;
>  	int ret, err;
>  
>  	if (len == 0)
>  		return 0;
>  
> +	if (inlinecrypt)
> +		return fscrypt_zeroout_range_inline_crypt(inode, lblk, pblk,
> +							  len);
> +

No need for the 'inlinecrypt' bool variable.  Just do:

	if (fscrypt_inode_uses_inline_crypto(inode))

FYI, I had suggested a merge resolution to use here which didn't have the above
problems.  Looks like you missed it?
https://lkml.kernel.org/linux-block/20200114211243.GC41220@gmail.com/

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
