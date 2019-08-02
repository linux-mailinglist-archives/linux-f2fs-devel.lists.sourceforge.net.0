Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 157D980221
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Aug 2019 23:11:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1htepy-0004W8-Ha; Fri, 02 Aug 2019 21:11:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <axboe@kernel.dk>) id 1htepw-0004Ul-QL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 21:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HNA1wKY9/Mn82gmfsmignc4EYFSIX+y0WoYEzAS9vsk=; b=NfIrQJs7Fo6uwJfEYM+a2g7NeM
 DXJVMlSow++evqELimVeH+2aQAWlxbmbu/lPP4hjnB7aHmqib4Oug5YbPP+phtxm8PzsHGkIz4qVB
 gOA0JeSp6dhKzGVOPUugUh/wf7JxrXXeoYdhUr3zchN2rG93whfmCQXFbeZz1T9St90w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HNA1wKY9/Mn82gmfsmignc4EYFSIX+y0WoYEzAS9vsk=; b=iOdjIGsWrB0Bcm3nCvB7qg2Gk7
 S3i6oDdy8a8rlPjlLVfRx663XsFD4HYTHaEBa6TVrIDc+oq7rJvWM5XJWdJA8SAHP9n88wgVBJZSd
 1pjnAAGPNLB9B9vJZg4+85tdpjkn9rWoK/F6bjDtizC/MWk3uyVNpiGSpt+aog/1TJ8E=;
Received: from mail-vk1-f195.google.com ([209.85.221.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1htept-008ZI0-7k
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 21:11:40 +0000
Received: by mail-vk1-f195.google.com with SMTP id 9so15626042vkw.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 02 Aug 2019 14:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HNA1wKY9/Mn82gmfsmignc4EYFSIX+y0WoYEzAS9vsk=;
 b=z1BbUSPqQeIP4j1ylb5FNEza/u/Elr5TYipD48b7gPyIoORGN5kGOTZvhyYLvqKxQ4
 1gnEEdBugmSIFlPDokypXhdpkA+EBsKJ9sPQTwDopNhqfVPsHuFmMIuOKVITheV+LCnV
 kRomyZIEfHFzphRddlDuKyDMI8FcGp6UZjVMsWe2b+rYPQZD0zP1qX/JS219S0wH83mV
 eJrf4MKhca133h3bX3GqsHjM7pthBIfBof4vB0C5EIgRoyBHzMwprqNRi1AsLAO+3jeP
 vUXTDt0hbiwTqaoLe7SpAqGyIVW92yPL/cJy8ia6TsCstlJcwZohalTIBoQBMcofNMXs
 xMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HNA1wKY9/Mn82gmfsmignc4EYFSIX+y0WoYEzAS9vsk=;
 b=LAgZY+yIPBercrI0nHQFMbItcinCkqcY6vXTasbJSkPO3QIJ1mDDHu6bMtdC7e+YCE
 THsQ3Nh6Em0hkZkonUs/DkSNjbTBibbGvJ/vdyeplhaeHf9Uzs0szTi3xZ31lcUkOu8q
 A4vH96gZkaVFt7LQ9jJZdv42qbld7dPf9Ym53tKRdX/BGZ0JvN3cR4aLxeX32p//DWGI
 ShiOdqq7N7xf74TKiqDbeAq7X+vTwSGvnEcoq/GYGAXaebdWBqNnCgwEMDESIWRDAc5b
 VAsFkQYqiodLyhXjCRPLSqmnKA1Z9aMpzCDiPeaLD0tE4+8JpxYGfO6AEj2T3zVGHWOX
 +9bw==
X-Gm-Message-State: APjAAAVizjyqipCF657TyOJ7YPRF8ZEEVGvYUkKWuon8rpJXExlUBBxq
 uvh0wW4kEiet5dvcHk2grA55v4fXLKM=
X-Google-Smtp-Source: APXvYqw0hd50NR9rV9r2f7ehdAQEXn2B7VK6zKAzwRLvRV/J1isfXtovJDQ1vxQjSN/6/UatSd2lfg==
X-Received: by 2002:a65:458d:: with SMTP id o13mr124087133pgq.34.1564778809374; 
 Fri, 02 Aug 2019 13:46:49 -0700 (PDT)
Received: from [172.31.98.58] (rrcs-76-79-101-187.west.biz.rr.com.
 [76.79.101.187])
 by smtp.gmail.com with ESMTPSA id 4sm88034288pfc.92.2019.08.02.13.46.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 13:46:48 -0700 (PDT)
To: Satya Tangirala <satyat@google.com>, linux-block@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20190710225609.192252-1-satyat@google.com>
 <20190710225609.192252-3-satyat@google.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <7856ad79-6224-532d-ff9f-50ffc00f7203@kernel.dk>
Date: Fri, 2 Aug 2019 13:46:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190710225609.192252-3-satyat@google.com>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1htept-008ZI0-7k
Subject: Re: [f2fs-dev] [PATCH 2/8] block: Add encryption context to struct
 bio
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
Cc: Kuohong Wang <kuohong.wang@mediatek.com>,
 Ladvine D Almeida <ladvine.dalmeida@synopsys.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Parshuram Raju Thombare <pthombar@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/10/19 4:56 PM, Satya Tangirala wrote:
> We must have some way of letting a storage device driver know what
> encryption context it should use for en/decrypting a request. However,
> it's the filesystem/fscrypt that knows about and manages encryption
> contexts. As such, when the filesystem layer submits a bio to the block
> layer, and this bio eventually reaches a device driver with support for
> inline encryption, the device driver will need to have been told the
> encryption context for that bio.
> 
> We want to communicate the encryption context from the filesystem layer
> to the storage device along with the bio, when the bio is submitted to the
> block layer. To do this, we add a struct bio_crypt_ctx to struct bio, which
> can represent an encryption context (note that we can't use the bi_private
> field in struct bio to do this because that field does not function to pass
> information across layers in the storage stack). We also introduce various
> functions to manipulate the bio_crypt_ctx and make the bio/request merging
> logic aware of the bio_crypt_ctx.

A few minor comments below. Don't see something totally horrible with
your approach.


> diff --git a/block/bio-crypt-ctx.c b/block/bio-crypt-ctx.c
> new file mode 100644
> index 000000000000..8b884ef32007
> --- /dev/null
> +++ b/block/bio-crypt-ctx.c
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 Google LLC
> + */
> +
> +#include <linux/bio.h>
> +#include <linux/blkdev.h>
> +#include <linux/slab.h>
> +#include <linux/keyslot-manager.h>
> +
> +struct bio_crypt_ctx *bio_crypt_alloc_ctx(gfp_t gfp_mask)
> +{
> +	return kzalloc(sizeof(struct bio_crypt_ctx), gfp_mask);
> +}

I think you'll want this to be mempool backed.

> +EXPORT_SYMBOL(bio_crypt_alloc_ctx);
> +
> +void bio_crypt_free_ctx(struct bio *bio)
> +{
> +	kzfree(bio->bi_crypt_context);
> +	bio->bi_crypt_context = NULL;
> +}
> +EXPORT_SYMBOL(bio_crypt_free_ctx);
> +
> +int bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask)
> +{
> +	if (!bio_is_encrypted(src))
> +		return 0;

Was going to suggest dumping this helper, but that won't work for the
case where inline encryption isn't enabled. How about renaming it so it
is easier to grok what it tests, bio_has_crypt_ctx() or something like
that.

> +	dst->bi_crypt_context = bio_crypt_alloc_ctx(gfp_mask);
> +	if (!dst->bi_crypt_context)
> +		return -ENOMEM;

That's why you need the mempool...

> diff --git a/block/blk-merge.c b/block/blk-merge.c
> index 17713d7d98d5..f416e7f38270 100644
> --- a/block/blk-merge.c
> +++ b/block/blk-merge.c
> @@ -531,6 +531,9 @@ static inline int ll_new_hw_segment(struct request_queue *q,
>   	if (blk_integrity_merge_bio(q, req, bio) == false)
>   		goto no_merge;
>   
> +	if (WARN_ON(!bio_crypt_ctx_compatible(bio, req->bio)))
> +		goto no_merge;

This is really a debug check, as that shouldn't happen unless you have a
bug in your merge helpers. I think we can do one of two things here:

1) Rely on this check only for merging, similarly to what the integrity
   code does. This means the WARN() goes away and (most of) the  other
   merge checks can go away.

2) Keep it, but change it to a WARN_ON_ONCE().

> @@ -696,8 +699,13 @@ static enum elv_merge blk_try_req_merge(struct request *req,
>   {
>   	if (blk_discard_mergable(req))
>   		return ELEVATOR_DISCARD_MERGE;
> -	else if (blk_rq_pos(req) + blk_rq_sectors(req) == blk_rq_pos(next))
> +	else if (blk_rq_pos(req) + blk_rq_sectors(req) == blk_rq_pos(next)) {
> +		if (!bio_crypt_ctx_back_mergeable(
> +			req->bio, blk_rq_sectors(req), next->bio)) {
> +			return ELEVATOR_NO_MERGE;
> +		}
>   		return ELEVATOR_BACK_MERGE;
> +	}

Weird line breaks aside, see above comment. More in this file.

> diff --git a/include/linux/bio.h b/include/linux/bio.h
> index ef9c6e2e92bc..4e664d6441d5 100644
> --- a/include/linux/bio.h
> +++ b/include/linux/bio.h
> @@ -572,6 +572,196 @@ enum blk_crypt_mode_num {
>   	 */
>   };
>   
> +#ifdef CONFIG_BLK_INLINE_ENCRYPTION
> +struct bio_crypt_ctx {
> +	int keyslot;
> +	u8 *raw_key;
> +	enum blk_crypt_mode_num crypt_mode;
> +	u64 data_unit_num;
> +	unsigned int data_unit_size_bits;
> +
> +	/*
> +	 * The keyslot manager where the key has been programmed
> +	 * with keyslot.
> +	 */
> +	struct keyslot_manager *processing_ksm;
> +
> +	/*
> +	 * Copy of the bvec_iter when this bio was submitted.
> +	 * We only want to en/decrypt the part of the bio
> +	 * as described by the bvec_iter upon submission because
> +	 * bio might be split before being resubmitted
> +	 */
> +	struct bvec_iter crypt_iter;
> +	u64 sw_data_unit_num;
> +};

[snip]

Let's move that to a separate file, with the other crypt specific bits.
Just include it from bio.h.


> +static inline u64 bio_crypt_data_unit_num(struct bio *bio)
> +{
> +	WARN_ON(!bio_is_encrypted(bio));
> +	return bio->bi_crypt_context->data_unit_num;
> +}
> +
> +static inline u64 bio_crypt_sw_data_unit_num(struct bio *bio)
> +{
> +	WARN_ON(!bio_is_encrypted(bio));
> +	return bio->bi_crypt_context->sw_data_unit_num;
> +}

These WARN()'s are a bit weird.

> +static inline u64 bio_crypt_data_unit_num(struct bio *bio)
> +{
> +	WARN_ON(1);
> +	return 0;
> +}

And this one definitely needs to go.

> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index 95202f80676c..0b794fe3530a 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -137,6 +137,8 @@ static inline void bio_issue_init(struct bio_issue *issue,
>   			((u64)size << BIO_ISSUE_SIZE_SHIFT));
>   }
>   
> +struct bio_crypt_ctx;

Place this with the other forward declarations.

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
