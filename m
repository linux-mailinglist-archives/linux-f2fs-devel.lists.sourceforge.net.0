Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5792B72A9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 00:51:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfAlJ-0002MJ-Jy; Tue, 17 Nov 2020 23:51:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kfAlI-0002MC-S9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 23:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FGLb0A7TbMQRwWn5wGBx+weLlxuExDVDMmAfauy/Bsk=; b=HxqAppirabR3ptO2BYNOgtT+5w
 VG2J06bnWOCspyS/SzBFpEuv6GTOmgB45xXbcBbR4vstD+uUrv6DLdJUc4u8kvmf27NCg08zPYAR5
 P+MQ8+cLapXks83Pr7dL4IMZRyK7vfvdKJebDZ5ZFWK2dbbEKGJenkd9SKbN6Pk4SlxM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FGLb0A7TbMQRwWn5wGBx+weLlxuExDVDMmAfauy/Bsk=; b=Wba6+wJsN80gwkDr3Ld/cHniak
 p0FMCsCtGisMKpSUFRgBiMA2blXsmuSepJgVNWRsw5R3BsUn8MC8veMghUDD65tX4iT1TMrcVQIIP
 oOPNqc1c20a6B0ACwS+u1cN+N4WRaqEb27NGq7JVshMkgsbSD+49Ep4HH796NBAgS8JE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kfAlH-00BijN-1G
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 23:51:48 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1656520707;
 Tue, 17 Nov 2020 23:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605657089;
 bh=6oD4Vlgq7Wd1NXyfD+kSPMdBxHmOX6ZkXGlIFmIH4BQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gly9nQ6TM/lHuVl02OETZV37z3djuNsAQ3+chLTTbWFUAzmh4Hz9hSSVpcnUuaPCI
 ypbLiCuYb2OCXHUVPGvHX18xS7udPgpuSaV6/QyWWkm34z8GatbTe5xDcnoNiZkSOi
 MUgjwIhBjNgFypCqtT9ZM10BsoC8acFL07TG4DAc=
Date: Tue, 17 Nov 2020 15:51:27 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <X7Rh/5ADHVywDtpq@sol.localdomain>
References: <20201117140708.1068688-1-satyat@google.com>
 <20201117140708.1068688-3-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117140708.1068688-3-satyat@google.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kfAlH-00BijN-1G
Subject: Re: [f2fs-dev] [PATCH v7 2/8] blk-crypto: don't require user buffer
 alignment
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

On Tue, Nov 17, 2020 at 02:07:02PM +0000, Satya Tangirala wrote:
> Previously, blk-crypto-fallback required the offset and length of each bvec
> in a bio to be aligned to the crypto data unit size. This patch enables
> blk-crypto-fallback to work even if that's not the case - the requirement
> now is only that the total length of the data in the bio is aligned to
> the crypto data unit size.
> 
> Now that blk-crypto-fallback can handle bvecs not aligned to crypto data
> units, and we've ensured that bios are not split in the middle of a
> crypto data unit, we can relax the alignment check done by blk-crypto.

I think the blk-crypto.c and blk-crypto-fallback.c changes belong in different
patches.

There should also be a brief explanation of why this is needed (make the
alignment requirements on direct I/O to encrypted files somewhat more similar to
standard unencrypted files, right)?.

Also, how were the blk-crypto-fallback changes tested?

> @@ -305,45 +374,57 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
>  	}
>  
>  	memcpy(curr_dun, bc->bc_dun, sizeof(curr_dun));
> -	sg_init_table(&src, 1);
> -	sg_init_table(&dst, 1);
>  
> -	skcipher_request_set_crypt(ciph_req, &src, &dst, data_unit_size,
> +	skcipher_request_set_crypt(ciph_req, src, dst, data_unit_size,
>  				   iv.bytes);
>  
> -	/* Encrypt each page in the bounce bio */
> +	/*
> +	 * Encrypt each data unit in the bounce bio.
> +	 *
> +	 * Take care to handle the case where a data unit spans bio segments.
> +	 * This can happen when data_unit_size > logical_block_size.
> +	 */
>  	for (i = 0; i < enc_bio->bi_vcnt; i++) {
> -		struct bio_vec *enc_bvec = &enc_bio->bi_io_vec[i];
> -		struct page *plaintext_page = enc_bvec->bv_page;
> +		struct bio_vec *bv = &enc_bio->bi_io_vec[i];
> +		struct page *plaintext_page = bv->bv_page;
>  		struct page *ciphertext_page =
>  			mempool_alloc(blk_crypto_bounce_page_pool, GFP_NOIO);
> +		unsigned int offset_in_bv = 0;
>  
> -		enc_bvec->bv_page = ciphertext_page;
> +		bv->bv_page = ciphertext_page;
>  
>  		if (!ciphertext_page) {
>  			src_bio->bi_status = BLK_STS_RESOURCE;
>  			goto out_free_bounce_pages;
>  		}
>  
> -		sg_set_page(&src, plaintext_page, data_unit_size,
> -			    enc_bvec->bv_offset);
> -		sg_set_page(&dst, ciphertext_page, data_unit_size,
> -			    enc_bvec->bv_offset);
> -
> -		/* Encrypt each data unit in this page */
> -		for (j = 0; j < enc_bvec->bv_len; j += data_unit_size) {
> -			blk_crypto_dun_to_iv(curr_dun, &iv);
> -			if (crypto_wait_req(crypto_skcipher_encrypt(ciph_req),
> -					    &wait)) {
> -				i++;
> -				src_bio->bi_status = BLK_STS_IOERR;
> -				goto out_free_bounce_pages;
> +		while (offset_in_bv < bv->bv_len) {
> +			unsigned int n = min(bv->bv_len - offset_in_bv,
> +					     data_unit_size - du_filled);
> +			sg_set_page(&src[sg_idx], plaintext_page, n,
> +				    bv->bv_offset + offset_in_bv);
> +			sg_set_page(&dst[sg_idx], ciphertext_page, n,
> +				    bv->bv_offset + offset_in_bv);
> +			sg_idx++;
> +			offset_in_bv += n;
> +			du_filled += n;
> +			if (du_filled == data_unit_size) {
> +				blk_crypto_dun_to_iv(curr_dun, &iv);
> +				if (crypto_wait_req(crypto_skcipher_encrypt(ciph_req),
> +						    &wait)) {
> +					src_bio->bi_status = BLK_STS_IOERR;
> +					goto out_free_bounce_pages;
> +				}
> +				bio_crypt_dun_increment(curr_dun, 1);
> +				sg_idx = 0;
> +				du_filled = 0;

This is leaking a bounce page if crypto_skcipher_encrypt() fails.  This can be
fixed either by keeping the 'i++' that was on the error path before, or by
moving the i++ in the for statement to just below to where the bounce page was
successfully allocated.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
