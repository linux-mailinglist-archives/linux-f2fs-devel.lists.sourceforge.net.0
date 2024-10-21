Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A84019A6608
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Oct 2024 13:12:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t2qKY-0007xw-EH;
	Mon, 21 Oct 2024 11:12:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mpatocka@redhat.com>) id 1t2qKW-0007xn-44
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 11:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:Message-ID:
 In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yVOOQRTDPP9EQyCM0BO2Vz41MIi/v/BOtRJeWq4CdzI=; b=Ca0U23IDN5eCQFJJwJHP3m1cNM
 B/N89CBru2zDwCoeONAZKhkYx64pniMN+7Viqpvk/JX+329UUfQUygTJSicfB4g5Heb2OC8nbauhx
 BxvhJxOPY+FO62WXLCC8VrdQ++ShSSDTnVT1x5xOtgDlDVVO6Kk0hakuD3yAO5MlRhIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yVOOQRTDPP9EQyCM0BO2Vz41MIi/v/BOtRJeWq4CdzI=; b=B7cfNijjr0JTPDKGI41peKUJdI
 wKQGwenWm/A61QX/WJZQSuqyx4wyqLAZPLM7efgdp2lMbtG0qcBMAr4xH/Bxx1qwsfajByjmjhaYr
 gP1wU/9LcDZhu3MNOgHdsK65RiMhPHkTZEIJOR88YBzcI7jdOC3eyPk2rmOPj+Pt3sXA=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2qKQ-0002M1-On for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 11:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729509111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yVOOQRTDPP9EQyCM0BO2Vz41MIi/v/BOtRJeWq4CdzI=;
 b=bR7VNwFQJdcXD6cT7R2aCH/u2FbaqeAY6trslPYIwkHpdw4LCwqS5D9CsekXrvKTrXz1sk
 +b6/dsk9NerMAwLcEy3Q/R+X+S4X099DEt1vef7LC5nIfhity7GJW96pRV4JiSXALADP2Q
 RGboe6GPtXPSGS4PwK7e99Y97uwWw7s=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-121-0Db2WKbVPky42uFBgGVOxg-1; Mon,
 21 Oct 2024 07:11:46 -0400
X-MC-Unique: 0Db2WKbVPky42uFBgGVOxg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E90361955EA7; Mon, 21 Oct 2024 11:11:43 +0000 (UTC)
Received: from [10.45.226.64] (unknown [10.45.226.64])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B2A6019560AA; Mon, 21 Oct 2024 11:11:40 +0000 (UTC)
Date: Mon, 21 Oct 2024 13:11:36 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20241018184339.66601-3-ebiggers@kernel.org>
Message-ID: <2caf648d-73cf-9436-2af4-ad530a966592@redhat.com>
References: <20241018184339.66601-1-ebiggers@kernel.org>
 <20241018184339.66601-3-ebiggers@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hi What about using the REQ_META flag (it is set on metadata
 bios and cleared on data bios), instead of adding a new flag with the same
 meaning? Mikulas 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t2qKQ-0002M1-On
Subject: Re: [f2fs-dev] [RFC PATCH 2/4] block: add the
 bi_skip_dm_default_key flag
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
Cc: dm-devel@lists.linux.dev, Israel Rukshin <israelr@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Adrian Vovk <adrianvovk@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 linux-ext4@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi

What about using the REQ_META flag (it is set on metadata bios and cleared 
on data bios), instead of adding a new flag with the same meaning?

Mikulas


On Fri, 18 Oct 2024, Eric Biggers wrote:

> From: Eric Biggers <ebiggers@google.com>
> 
> Add a flag bi_skip_dm_default_key to struct bio.  This flag indicates
> that dm-default-key should not en/decrypt the bio, due to it targeting
> the contents of an encrypted file.
> 
> When a bio is cloned, copy the bi_skip_dm_default_key flag.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  block/bio.c                 |  3 +++
>  block/blk-crypto-fallback.c |  2 ++
>  include/linux/blk-crypto.h  | 36 ++++++++++++++++++++++++++++++++++++
>  include/linux/blk_types.h   |  3 +++
>  4 files changed, 44 insertions(+)
> 
> diff --git a/block/bio.c b/block/bio.c
> index ac4d77c889322..5ff0b66e47a42 100644
> --- a/block/bio.c
> +++ b/block/bio.c
> @@ -267,10 +267,13 @@ void bio_init(struct bio *bio, struct block_device *bdev, struct bio_vec *table,
>  	bio->bi_iocost_cost = 0;
>  #endif
>  #endif
>  #ifdef CONFIG_BLK_INLINE_ENCRYPTION
>  	bio->bi_crypt_context = NULL;
> +#if IS_ENABLED(CONFIG_DM_DEFAULT_KEY)
> +	bio->bi_skip_dm_default_key = false;
> +#endif
>  #endif
>  #ifdef CONFIG_BLK_DEV_INTEGRITY
>  	bio->bi_integrity = NULL;
>  #endif
>  	bio->bi_vcnt = 0;
> diff --git a/block/blk-crypto-fallback.c b/block/blk-crypto-fallback.c
> index b1e7415f8439c..dd5f1edcc44b3 100644
> --- a/block/blk-crypto-fallback.c
> +++ b/block/blk-crypto-fallback.c
> @@ -179,10 +179,12 @@ static struct bio *blk_crypto_fallback_clone_bio(struct bio *bio_src)
>  	bio_for_each_segment(bv, bio_src, iter)
>  		bio->bi_io_vec[bio->bi_vcnt++] = bv;
>  
>  	bio_clone_blkg_association(bio, bio_src);
>  
> +	bio_clone_skip_dm_default_key(bio, bio_src);
> +
>  	return bio;
>  }
>  
>  static bool
>  blk_crypto_fallback_alloc_cipher_req(struct blk_crypto_keyslot *slot,
> diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
> index 5e5822c18ee41..f1f3d546c53e5 100644
> --- a/include/linux/blk-crypto.h
> +++ b/include/linux/blk-crypto.h
> @@ -110,10 +110,13 @@ static inline bool bio_has_crypt_ctx(struct bio *bio)
>  	return false;
>  }
>  
>  #endif /* CONFIG_BLK_INLINE_ENCRYPTION */
>  
> +static inline void bio_clone_skip_dm_default_key(struct bio *dst,
> +						 const struct bio *src);
> +
>  int __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask);
>  /**
>   * bio_crypt_clone - clone bio encryption context
>   * @dst: destination bio
>   * @src: source bio
> @@ -125,11 +128,44 @@ int __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask);
>   *	   @gfp_mask doesn't include %__GFP_DIRECT_RECLAIM.
>   */
>  static inline int bio_crypt_clone(struct bio *dst, struct bio *src,
>  				  gfp_t gfp_mask)
>  {
> +	bio_clone_skip_dm_default_key(dst, src);
>  	if (bio_has_crypt_ctx(src))
>  		return __bio_crypt_clone(dst, src, gfp_mask);
>  	return 0;
>  }
>  
> +#if IS_ENABLED(CONFIG_DM_DEFAULT_KEY)
> +static inline void bio_set_skip_dm_default_key(struct bio *bio)
> +{
> +	bio->bi_skip_dm_default_key = true;
> +}
> +
> +static inline bool bio_should_skip_dm_default_key(const struct bio *bio)
> +{
> +	return bio->bi_skip_dm_default_key;
> +}
> +
> +static inline void bio_clone_skip_dm_default_key(struct bio *dst,
> +						 const struct bio *src)
> +{
> +	dst->bi_skip_dm_default_key = src->bi_skip_dm_default_key;
> +}
> +#else /* CONFIG_DM_DEFAULT_KEY */
> +static inline void bio_set_skip_dm_default_key(struct bio *bio)
> +{
> +}
> +
> +static inline bool bio_should_skip_dm_default_key(const struct bio *bio)
> +{
> +	return false;
> +}
> +
> +static inline void bio_clone_skip_dm_default_key(struct bio *dst,
> +						 const struct bio *src)
> +{
> +}
> +#endif /* !CONFIG_DM_DEFAULT_KEY */
> +
>  #endif /* __LINUX_BLK_CRYPTO_H */
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index dce7615c35e7e..2ee6a7e570796 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -247,10 +247,13 @@ struct bio {
>  #endif
>  #endif
>  
>  #ifdef CONFIG_BLK_INLINE_ENCRYPTION
>  	struct bio_crypt_ctx	*bi_crypt_context;
> +#if IS_ENABLED(CONFIG_DM_DEFAULT_KEY)
> +	bool			bi_skip_dm_default_key;
> +#endif
>  #endif
>  
>  #if defined(CONFIG_BLK_DEV_INTEGRITY)
>  	struct bio_integrity_payload *bi_integrity; /* data integrity */
>  #endif
> -- 
> 2.47.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
