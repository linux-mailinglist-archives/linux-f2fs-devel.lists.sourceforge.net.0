Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B1F125482
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 22:21:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihglI-0002TS-6m; Wed, 18 Dec 2019 21:21:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1ihglC-0002Sg-JU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 21:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1hFmoDCKBvtS/CDDG8hA5Gv5JzyuGhgWd82bIRRd7WE=; b=LrOh2TSCVMKOE9jFpve5aGfAGq
 1Rskw0sjUZMhI37BmXDlcZLaMGAHGQgJSlUtkhUWqrEr3JyEioXF95WVp1DWb+GOWM/8kekLkXldH
 tWy9w98EXhS8/Jw9S4xPcQNqP4T2S+XYVUGTKX8MklerPAEcYWo9f0pqbqayaOkGYJys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1hFmoDCKBvtS/CDDG8hA5Gv5JzyuGhgWd82bIRRd7WE=; b=NJp7NMIZbd5lnRg3njevHS3obw
 IwUFQ4HdrEPv7PYglUuIssn1TQfy0gird9BADfiUTgBY3HWWg4X3gxA+BYaZ3QFwgo+JK/WYmxEPk
 LU/nKTxWZ0MFAG6ra2bl2PbQISr2WCROIQjvwspKoJuw6nC14OFS32QKHG16NaKlzpJ8=;
Received: from aserp2120.oracle.com ([141.146.126.78])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ihgl8-0094c8-DR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 21:21:34 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBIL9tmi002046;
 Wed, 18 Dec 2019 21:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=1hFmoDCKBvtS/CDDG8hA5Gv5JzyuGhgWd82bIRRd7WE=;
 b=A8q7HVxNUsPIxLqqEjIf1s/VtaDBeCt7dhzEtghfVVrEpWzGFvuJLbf/MeWXLTp9oW+V
 IkSPzm8e8jOBGpRa7HNSPwa0w4+GdWJyaAiCIgwo2BgIK4qXjE7eQK93G8HIQzzXpm0T
 gBXU58ej917mvMzsvqUVg+Ycj6eTMbXgrsy/Lx+WWA4pBpq1HcjBrN9zrxKC3vRAGD+t
 hxmOW+NYs9I9fUHMn/bgNCn+32McH7M8Awi13cEq3D2h8xQ+Lm4+fFKijnAvJvpg3v0m
 KABh5BXbhmBBzKuuUfkyP7NRjbnbWfirEgFokzsVpb88wZ4W1iW+or2Jl0r6xcI5taSJ RA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2wvqpqg7tr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 21:21:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBILAoMM186550;
 Wed, 18 Dec 2019 21:21:22 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2wyut48a7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 21:21:22 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xBILLK79023501;
 Wed, 18 Dec 2019 21:21:21 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 18 Dec 2019 13:21:18 -0800
Date: Wed, 18 Dec 2019 13:21:16 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20191218212116.GA7476@magnolia>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-3-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218145136.172774-3-satyat@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9475
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912180163
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9475
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912180163
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ihgl8-0094c8-DR
Subject: Re: [f2fs-dev] [PATCH v6 2/9] block: Add encryption context to
 struct bio
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

On Wed, Dec 18, 2019 at 06:51:29AM -0800, Satya Tangirala wrote:
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
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  block/Makefile                |   2 +-
>  block/bio-crypt-ctx.c         | 131 ++++++++++++++++++++++++++++++
>  block/bio.c                   |  16 ++--
>  block/blk-core.c              |   3 +
>  block/blk-merge.c             |  11 +++
>  block/bounce.c                |  12 ++-
>  drivers/md/dm.c               |   3 +-
>  include/linux/bio-crypt-ctx.h | 146 +++++++++++++++++++++++++++++++++-
>  include/linux/blk_types.h     |   6 ++
>  9 files changed, 312 insertions(+), 18 deletions(-)
>  create mode 100644 block/bio-crypt-ctx.c
> 
> diff --git a/block/Makefile b/block/Makefile
> index 7c603669f216..79f2b8b3fc5d 100644
> --- a/block/Makefile
> +++ b/block/Makefile
> @@ -37,4 +37,4 @@ obj-$(CONFIG_BLK_DEBUG_FS)	+= blk-mq-debugfs.o
>  obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
>  obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
>  obj-$(CONFIG_BLK_PM)		+= blk-pm.o
> -obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o
> \ No newline at end of file
> +obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o bio-crypt-ctx.o
> \ No newline at end of file
> diff --git a/block/bio-crypt-ctx.c b/block/bio-crypt-ctx.c
> new file mode 100644
> index 000000000000..dadf0da3c21b
> --- /dev/null
> +++ b/block/bio-crypt-ctx.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 Google LLC
> + */
> +
> +#include <linux/bio.h>
> +#include <linux/blkdev.h>
> +#include <linux/keyslot-manager.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +
> +static int num_prealloc_crypt_ctxs = 128;
> +
> +module_param(num_prealloc_crypt_ctxs, int, 0444);
> +MODULE_PARM_DESC(num_prealloc_crypt_ctxs,
> +		"Number of bio crypto contexts to preallocate");
> +
> +static struct kmem_cache *bio_crypt_ctx_cache;
> +static mempool_t *bio_crypt_ctx_pool;
> +
> +int __init bio_crypt_ctx_init(void)
> +{
> +	bio_crypt_ctx_cache = KMEM_CACHE(bio_crypt_ctx, 0);
> +	if (!bio_crypt_ctx_cache)
> +		return -ENOMEM;
> +
> +	bio_crypt_ctx_pool = mempool_create_slab_pool(num_prealloc_crypt_ctxs,
> +						      bio_crypt_ctx_cache);
> +	if (!bio_crypt_ctx_pool)
> +		return -ENOMEM;
> +
> +	/* This is assumed in various places. */
> +	BUILD_BUG_ON(BLK_ENCRYPTION_MODE_INVALID != 0);
> +
> +	return 0;
> +}
> +
> +struct bio_crypt_ctx *bio_crypt_alloc_ctx(gfp_t gfp_mask)
> +{
> +	return mempool_alloc(bio_crypt_ctx_pool, gfp_mask);
> +}
> +
> +void bio_crypt_free_ctx(struct bio *bio)
> +{
> +	mempool_free(bio->bi_crypt_context, bio_crypt_ctx_pool);
> +	bio->bi_crypt_context = NULL;
> +}
> +
> +void bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask)
> +{
> +	const struct bio_crypt_ctx *src_bc = src->bi_crypt_context;
> +
> +	/*
> +	 * If a bio is swhandled, then it will be decrypted when bio_endio
> +	 * is called. As we only want the data to be decrypted once, copies
> +	 * of the bio must not have have a crypt context.
> +	 */
> +	if (!src_bc)
> +		return;
> +
> +	dst->bi_crypt_context = bio_crypt_alloc_ctx(gfp_mask);
> +	*dst->bi_crypt_context = *src_bc;
> +
> +	if (src_bc->bc_keyslot >= 0)
> +		keyslot_manager_get_slot(src_bc->bc_ksm, src_bc->bc_keyslot);
> +}
> +EXPORT_SYMBOL_GPL(bio_crypt_clone);
> +
> +bool bio_crypt_should_process(struct request *rq)
> +{
> +	struct bio *bio = rq->bio;
> +
> +	if (!bio || !bio->bi_crypt_context)
> +		return false;
> +
> +	return rq->q->ksm == bio->bi_crypt_context->bc_ksm;
> +}
> +EXPORT_SYMBOL_GPL(bio_crypt_should_process);
> +
> +/*
> + * Checks that two bio crypt contexts are compatible - i.e. that
> + * they are mergeable except for data_unit_num continuity.
> + */
> +bool bio_crypt_ctx_compatible(struct bio *b_1, struct bio *b_2)
> +{
> +	struct bio_crypt_ctx *bc1 = b_1->bi_crypt_context;
> +	struct bio_crypt_ctx *bc2 = b_2->bi_crypt_context;
> +
> +	if (bc1 != bc2)
> +		return false;
> +
> +	return !bc1 || bc1->bc_key == bc2->bc_key;
> +}
> +
> +/*
> + * Checks that two bio crypt contexts are compatible, and also
> + * that their data_unit_nums are continuous (and can hence be merged)
> + * in the order b_1 followed by b_2.
> + */
> +bool bio_crypt_ctx_mergeable(struct bio *b_1, unsigned int b1_bytes,
> +			     struct bio *b_2)
> +{
> +	struct bio_crypt_ctx *bc1 = b_1->bi_crypt_context;
> +	struct bio_crypt_ctx *bc2 = b_2->bi_crypt_context;
> +
> +	if (!bio_crypt_ctx_compatible(b_1, b_2))
> +		return false;
> +
> +	return !bc1 || bio_crypt_dun_is_contiguous(bc1, b1_bytes, bc2->bc_dun);
> +}
> +
> +void bio_crypt_ctx_release_keyslot(struct bio_crypt_ctx *bc)
> +{
> +	keyslot_manager_put_slot(bc->bc_ksm, bc->bc_keyslot);
> +	bc->bc_ksm = NULL;
> +	bc->bc_keyslot = -1;
> +}
> +
> +int bio_crypt_ctx_acquire_keyslot(struct bio_crypt_ctx *bc,
> +				  struct keyslot_manager *ksm)
> +{
> +	int slot = keyslot_manager_get_slot_for_key(ksm, bc->bc_key);
> +
> +	if (slot < 0)
> +		return slot;
> +
> +	bc->bc_keyslot = slot;
> +	bc->bc_ksm = ksm;
> +	return 0;
> +}
> diff --git a/block/bio.c b/block/bio.c
> index a5d75f6bf4c7..c99e054d56ef 100644
> --- a/block/bio.c
> +++ b/block/bio.c
> @@ -236,6 +236,8 @@ void bio_uninit(struct bio *bio)
>  
>  	if (bio_integrity(bio))
>  		bio_integrity_free(bio);
> +
> +	bio_crypt_free_ctx(bio);
>  }
>  EXPORT_SYMBOL(bio_uninit);
>  
> @@ -615,15 +617,12 @@ struct bio *bio_clone_fast(struct bio *bio, gfp_t gfp_mask, struct bio_set *bs)
>  
>  	__bio_clone_fast(b, bio);
>  
> -	if (bio_integrity(bio)) {
> -		int ret;
> -
> -		ret = bio_integrity_clone(b, bio, gfp_mask);
> +	bio_crypt_clone(b, bio, gfp_mask);
>  
> -		if (ret < 0) {
> -			bio_put(b);
> -			return NULL;
> -		}
> +	if (bio_integrity(bio) &&
> +	    bio_integrity_clone(b, bio, gfp_mask) < 0) {
> +		bio_put(b);
> +		return NULL;
>  	}
>  
>  	return b;
> @@ -997,6 +996,7 @@ void bio_advance(struct bio *bio, unsigned bytes)
>  	if (bio_integrity(bio))
>  		bio_integrity_advance(bio, bytes);
>  
> +	bio_crypt_advance(bio, bytes);
>  	bio_advance_iter(bio, &bio->bi_iter, bytes);
>  }
>  EXPORT_SYMBOL(bio_advance);
> diff --git a/block/blk-core.c b/block/blk-core.c
> index e0a094fddee5..5200f4d1fed4 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -1810,5 +1810,8 @@ int __init blk_dev_init(void)
>  	blk_debugfs_root = debugfs_create_dir("block", NULL);
>  #endif
>  
> +	if (bio_crypt_ctx_init() < 0)
> +		panic("Failed to allocate mem for bio crypt ctxs\n");
> +
>  	return 0;
>  }
> diff --git a/block/blk-merge.c b/block/blk-merge.c
> index d783bdc4559b..5e53aad97da9 100644
> --- a/block/blk-merge.c
> +++ b/block/blk-merge.c
> @@ -596,6 +596,8 @@ int ll_back_merge_fn(struct request *req, struct bio *bio, unsigned int nr_segs)
>  		req_set_nomerge(req->q, req);
>  		return 0;
>  	}
> +	if (!bio_crypt_ctx_mergeable(req->bio, blk_rq_bytes(req), bio))
> +		return 0;
>  
>  	return ll_new_hw_segment(req, bio, nr_segs);
>  }
> @@ -612,6 +614,8 @@ int ll_front_merge_fn(struct request *req, struct bio *bio, unsigned int nr_segs
>  		req_set_nomerge(req->q, req);
>  		return 0;
>  	}
> +	if (!bio_crypt_ctx_mergeable(bio, bio->bi_iter.bi_size, req->bio))
> +		return 0;
>  
>  	return ll_new_hw_segment(req, bio, nr_segs);
>  }
> @@ -656,6 +660,9 @@ static int ll_merge_requests_fn(struct request_queue *q, struct request *req,
>  	if (blk_integrity_merge_rq(q, req, next) == false)
>  		return 0;
>  
> +	if (!bio_crypt_ctx_mergeable(req->bio, blk_rq_bytes(req), next->bio))
> +		return 0;
> +
>  	/* Merge is OK... */
>  	req->nr_phys_segments = total_phys_segments;
>  	return 1;
> @@ -895,6 +902,10 @@ bool blk_rq_merge_ok(struct request *rq, struct bio *bio)
>  	if (rq->ioprio != bio_prio(bio))
>  		return false;
>  
> +	/* Only merge if the crypt contexts are compatible */
> +	if (!bio_crypt_ctx_compatible(bio, rq->bio))
> +		return false;
> +
>  	return true;
>  }
>  
> diff --git a/block/bounce.c b/block/bounce.c
> index f8ed677a1bf7..aa57ccc6ced3 100644
> --- a/block/bounce.c
> +++ b/block/bounce.c
> @@ -267,14 +267,12 @@ static struct bio *bounce_clone_bio(struct bio *bio_src, gfp_t gfp_mask,
>  		break;
>  	}
>  
> -	if (bio_integrity(bio_src)) {
> -		int ret;
> +	bio_crypt_clone(bio, bio_src, gfp_mask);
>  
> -		ret = bio_integrity_clone(bio, bio_src, gfp_mask);
> -		if (ret < 0) {
> -			bio_put(bio);
> -			return NULL;
> -		}
> +	if (bio_integrity(bio_src) &&
> +	    bio_integrity_clone(bio, bio_src, gfp_mask) < 0) {
> +		bio_put(bio);
> +		return NULL;
>  	}
>  
>  	bio_clone_blkg_association(bio, bio_src);
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index e8f9661a10a1..783e0d5fd130 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1304,9 +1304,10 @@ static int clone_bio(struct dm_target_io *tio, struct bio *bio,
>  
>  	__bio_clone_fast(clone, bio);
>  
> +	bio_crypt_clone(clone, bio, GFP_NOIO);
> +
>  	if (bio_integrity(bio)) {
>  		int r;
> -
>  		if (unlikely(!dm_target_has_integrity(tio->ti->type) &&
>  			     !dm_target_passes_integrity(tio->ti->type))) {
>  			DMWARN("%s: the target %s doesn't support integrity data.",
> diff --git a/include/linux/bio-crypt-ctx.h b/include/linux/bio-crypt-ctx.h
> index dd4ac9d95428..4535df0a6349 100644
> --- a/include/linux/bio-crypt-ctx.h
> +++ b/include/linux/bio-crypt-ctx.h
> @@ -8,7 +8,7 @@
>  enum blk_crypto_mode_num {
>  	BLK_ENCRYPTION_MODE_INVALID,
>  	BLK_ENCRYPTION_MODE_AES_256_XTS,
> -	BLK_ENCRYPTION_MODE_AES_128_CBC,
> +	BLK_ENCRYPTION_MODE_AES_128_CBC_ESSIV,
>  	BLK_ENCRYPTION_MODE_ADIANTUM,
>  	BLK_ENCRYPTION_MODE_MAX,
>  };
> @@ -44,6 +44,150 @@ struct blk_crypto_key {
>  	u8 raw[BLK_CRYPTO_MAX_KEY_SIZE];
>  };
>  
> +#define BLK_CRYPTO_MAX_IV_SIZE		32
> +#define BLK_CRYPTO_DUN_ARRAY_SIZE	(BLK_CRYPTO_MAX_IV_SIZE/sizeof(u64))
> +
> +/**
> + * struct bio_crypt_ctx - an inline encryption context
> + * @bc_key: the key, algorithm, and data unit size to use
> + * @bc_keyslot: the keyslot that has been assigned for this key in @bc_ksm,
> + *		or -1 if no keyslot has been assigned yet.
> + * @bc_dun: the data unit number (starting IV) to use
> + * @bc_ksm: the keyslot manager into which the key has been programmed with
> + *	    @bc_keyslot, or NULL if this key hasn't yet been programmed.
> + *
> + * A bio_crypt_ctx specifies that the contents of the bio will be encrypted (for
> + * write requests) or decrypted (for read requests) inline by the storage device
> + * or controller, or by the crypto API fallback.
> + */
> +struct bio_crypt_ctx {
> +	const struct blk_crypto_key	*bc_key;
> +	int				bc_keyslot;
> +
> +	/* Data unit number */
> +	u64				bc_dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
> +
> +	/*
> +	 * The keyslot manager where the key has been programmed
> +	 * with keyslot.
> +	 */
> +	struct keyslot_manager		*bc_ksm;
> +};
> +
> +int bio_crypt_ctx_init(void);
> +
> +struct bio_crypt_ctx *bio_crypt_alloc_ctx(gfp_t gfp_mask);
> +
> +void bio_crypt_free_ctx(struct bio *bio);
> +
> +static inline bool bio_has_crypt_ctx(struct bio *bio)
> +{
> +	return bio->bi_crypt_context;
> +}
> +
> +void bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask);
> +
> +static inline void bio_crypt_set_ctx(struct bio *bio,
> +				     const struct blk_crypto_key *key,
> +				     u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
> +				     gfp_t gfp_mask)
> +{
> +	struct bio_crypt_ctx *bc = bio_crypt_alloc_ctx(gfp_mask);
> +
> +	bc->bc_key = key;
> +	memcpy(bc->bc_dun, dun, sizeof(bc->bc_dun));
> +	bc->bc_ksm = NULL;
> +	bc->bc_keyslot = -1;
> +
> +	bio->bi_crypt_context = bc;
> +}
> +
> +void bio_crypt_ctx_release_keyslot(struct bio_crypt_ctx *bc);
> +
> +int bio_crypt_ctx_acquire_keyslot(struct bio_crypt_ctx *bc,
> +				  struct keyslot_manager *ksm);
> +
> +struct request;
> +bool bio_crypt_should_process(struct request *rq);
> +
> +static inline bool bio_crypt_dun_is_contiguous(const struct bio_crypt_ctx *bc,
> +					       unsigned int bytes,
> +					u64 next_dun[BLK_CRYPTO_DUN_ARRAY_SIZE])
> +{
> +	int i = 0;
> +	unsigned int inc = bytes >> bc->bc_key->data_unit_size_bits;
> +
> +	while (inc && i < BLK_CRYPTO_DUN_ARRAY_SIZE) {
> +		if (bc->bc_dun[i] + inc != next_dun[i])
> +			return false;
> +		inc = ((bc->bc_dun[i] + inc)  < inc);
> +		i++;
> +	}
> +
> +	return true;
> +}
> +
> +
> +static inline void bio_crypt_dun_increment(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
> +					   unsigned int inc)
> +{
> +	int i = 0;
> +
> +	while (inc && i < BLK_CRYPTO_DUN_ARRAY_SIZE) {
> +		dun[i] += inc;
> +		inc = (dun[i] < inc);
> +		i++;
> +	}
> +}
> +
> +static inline void bio_crypt_advance(struct bio *bio, unsigned int bytes)
> +{
> +	struct bio_crypt_ctx *bc = bio->bi_crypt_context;
> +
> +	if (!bc)
> +		return;
> +
> +	bio_crypt_dun_increment(bc->bc_dun,
> +				bytes >> bc->bc_key->data_unit_size_bits);
> +}
> +
> +bool bio_crypt_ctx_compatible(struct bio *b_1, struct bio *b_2);
> +
> +bool bio_crypt_ctx_mergeable(struct bio *b_1, unsigned int b1_bytes,
> +			     struct bio *b_2);
> +
> +#else /* CONFIG_BLK_INLINE_ENCRYPTION */
> +static inline int bio_crypt_ctx_init(void)
> +{
> +	return 0;
> +}
> +
> +static inline bool bio_has_crypt_ctx(struct bio *bio)
> +{
> +	return false;
> +}
> +
> +static inline void bio_crypt_clone(struct bio *dst, struct bio *src,
> +				   gfp_t gfp_mask) { }
> +
> +static inline void bio_crypt_free_ctx(struct bio *bio) { }
> +
> +static inline void bio_crypt_advance(struct bio *bio, unsigned int bytes) { }
> +
> +static inline bool bio_crypt_ctx_compatible(struct bio *b_1, struct bio *b_2)
> +{
> +	return true;
> +}
> +
> +static inline bool bio_crypt_ctx_mergeable(struct bio *b_1,
> +					   unsigned int b1_bytes,
> +					   struct bio *b_2)
> +{
> +	return true;
> +}
> +
>  #endif /* CONFIG_BLK_INLINE_ENCRYPTION */
> +
>  #endif /* CONFIG_BLOCK */
> +
>  #endif /* __LINUX_BIO_CRYPT_CTX_H */
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index 70254ae11769..1996689c51d3 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -18,6 +18,7 @@ struct block_device;
>  struct io_context;
>  struct cgroup_subsys_state;
>  typedef void (bio_end_io_t) (struct bio *);
> +struct bio_crypt_ctx;
>  
>  /*
>   * Block error status values.  See block/blk-core:blk_errors for the details.
> @@ -173,6 +174,11 @@ struct bio {
>  	u64			bi_iocost_cost;
>  #endif
>  #endif
> +
> +#ifdef CONFIG_BLK_INLINE_ENCRYPTION
> +	struct bio_crypt_ctx	*bi_crypt_context;
> +#endif

This grows struct bio even if we aren't actively using bi_crypt_context,
and I thought Jens told us to stop making it bigger. :)

--D

> +
>  	union {
>  #if defined(CONFIG_BLK_DEV_INTEGRITY)
>  		struct bio_integrity_payload *bi_integrity; /* data integrity */
> -- 
> 2.24.1.735.g03f4e72817-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
