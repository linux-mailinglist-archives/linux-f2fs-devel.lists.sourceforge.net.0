Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27888EB6F9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2019 19:32:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQFFC-00020U-Bp; Thu, 31 Oct 2019 18:32:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+4fa4615b85c97fbb822c+5912+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iQFFB-00020O-66
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 18:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YIQLgr0QUAjT6Vgld7VuI1RjHuqXoPLbB+Fldq3S0no=; b=cNTpF9G0qDj3KS5q9IjaLYTNpc
 9EE56bwy77bcoDRLwqn8hNKMIpHTgBKQzM5L5wUZflRDwAIT3XswlzY0KGjdZKo8IHpfLc2sCl5OC
 nMJItMW69aW23EBImnXkgQp1Y/j/vGsJVUdEGUzLdlKHSBkUe2BvmB5spR4rzeAGBva0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YIQLgr0QUAjT6Vgld7VuI1RjHuqXoPLbB+Fldq3S0no=; b=BlaZVHxC/cXJrkSw9PD2PdpixN
 k9NfS0LALahUWmS63/eB5He7aIPcQPQOUKacPTkpoWYMWkWx+DnMYOQJ4YfPV/SRjwh8XAtFA3s1S
 Kkst1qvAyBtYCxTG2PfxQSOmE0ZErZOJeME1ZfEFJ0vCL7fKie782aNUX8f9Bj9VlSaY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQFFA-00BC3G-5y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 18:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YIQLgr0QUAjT6Vgld7VuI1RjHuqXoPLbB+Fldq3S0no=; b=G8td/5PdYCmMPCVqretMWZK8u
 +NOlob8H3V+ZEijNBXQr15G3BinlVG62wuWilKFiioqO4lLBa7NxGPDGRfdST3yi7vuy7InWswN/f
 Gy6LNoT1HE9+mMpMOOJZ7bik4frb9b4B5Okmrx3VzrgOscl6IYSNhluH68VOVm4PLKMstAXRFzRfi
 K9+dPh8sBiCN6Nm/Gx62HkvJk96cBW5HfE8LIUKYlnsms3rpdldOYhwRpEOWU67rnfIKXb5qdHTeH
 7wi1VrrfIT2yYUT2pUVCiSFZq4BhuZl0KVHWrsMubjDVyuqUNE7fua2xqjCUMq1CsSqzZaAxwvYxM
 sbAMZAXuw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iQFF3-0004yA-S3; Thu, 31 Oct 2019 18:32:17 +0000
Date: Thu, 31 Oct 2019 11:32:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20191031183217.GF23601@infradead.org>
References: <20191028072032.6911-1-satyat@google.com>
 <20191028072032.6911-8-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191028072032.6911-8-satyat@google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iQFFA-00BC3G-5y
Subject: Re: [f2fs-dev] [PATCH v5 7/9] fscrypt: add inline encryption support
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

> diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
> index 1f4b8a277060..956798debf71 100644
> --- a/fs/crypto/bio.c
> +++ b/fs/crypto/bio.c
> @@ -46,26 +46,38 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
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

I think you just want to split this into two functions for the
inline crypto vs not cases.

> @@ -391,6 +450,16 @@ struct fscrypt_master_key {
>  	 */
>  	struct crypto_skcipher	*mk_iv_ino_lblk_64_tfms[__FSCRYPT_MODE_MAX + 1];
>  
> +#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
> +	/* Raw keys for IV_INO_LBLK_64 policies, allocated on-demand */
> +	u8			*mk_iv_ino_lblk_64_raw_keys[__FSCRYPT_MODE_MAX + 1];
> +
> +	/* The data unit size being used for inline encryption */
> +	unsigned int		mk_data_unit_size;
> +
> +	/* The filesystem's block device */
> +	struct block_device	*mk_bdev;

File systems (including f2fs) can have multiple underlying block
devices.  

> +{
> +	const struct inode *inode = ci->ci_inode;
> +	struct super_block *sb = inode->i_sb;
> +
> +	/* The file must need contents encryption, not filenames encryption */
> +	if (!S_ISREG(inode->i_mode))
> +		return false;

But that isn't really what the check checks for..

> +	/* The filesystem must be mounted with -o inlinecrypt */
> +	if (!sb->s_cop->inline_crypt_enabled ||
> +	    !sb->s_cop->inline_crypt_enabled(sb))
> +		return false;

So please add a SB_* flag for that option instead of the weird
indirection.

> +/**
> + * fscrypt_inode_uses_inline_crypto - test whether an inode uses inline encryption

This adds an overly long line.  This happens many more times in the
patch.

Btw, I'm not happy about the 8-byte IV assumptions everywhere here.
That really should be a parameter, not hardcoded.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
