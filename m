Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1158B16845D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 18:04:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5BjI-000417-9b; Fri, 21 Feb 2020 17:04:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b8b070cac54c30a96dd5+6025+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j5BjG-00040u-Jh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 17:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r3W9uQBOJlV/Av1C4P5QJ8rWtko3f0+LGkNeNqVgIXE=; b=ddZeQ2fkmK+VAmFymYGbF3awCw
 9motXBRV7AXTVLrn5VnQ/zOkRGuntM5nQCuqTepgGNnvAyv1qHJ4d8UIIr/1NwDJjzzmimktSESHE
 7jxglG0SEwnuhHeoGCJvNG1PjtexZeZXwf5qLShKrPvSapjqUZEdp2kCo7SuylC/YYh4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r3W9uQBOJlV/Av1C4P5QJ8rWtko3f0+LGkNeNqVgIXE=; b=NnH0kg3nzCTXK7eksJl0zgggg+
 5IqBwE1H5IaYjC3YP0VggBeGdw8o67VFOfKUn0Ed8S1omt62eEztaNU7CJdpU+IaEEaNMt7NfC1By
 Dvc4WBy2bttWUw7V/5svdNxY9E6ht01lXL142L219GyZ5GIkfGOU3GgkD1mdulzOPZuw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5BjE-003Sf4-Th
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 17:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=r3W9uQBOJlV/Av1C4P5QJ8rWtko3f0+LGkNeNqVgIXE=; b=AV6Cw8ovuehrTohFGMfQ7n0kse
 bjrdnD9nESXI0I3PhTjjlM1TLq5ja8b35TsbwUSuOz6O3K1S8kAcssyZP1MCGHcG4kw/lfza5fkeb
 QOnZfCeaRELcgK09zo2800vd04X5tYSYTSi6pR24Pv7o7U2qmROm4epqCjmdubnrlnmVFNqKTUfNu
 87qqVl3NeMxxEMlK1BEUhoafXDd8nMTCXTvOtVD3ptQxLN36wRRJoYUQ/FDv2hQsUqZ5LFEcVCpUg
 Nt8pMcATyiWCCDn6xIrWVuAgQbk1q7RAv8dNR7WD1b0IYd/UQOWjvoWynx1dI6wC7JPPah9Nr35ng
 KSATh/Qw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j5Bj8-0004qU-9u; Fri, 21 Feb 2020 17:04:34 +0000
Date: Fri, 21 Feb 2020 09:04:34 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200221170434.GA438@infradead.org>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221115050.238976-2-satyat@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j5BjE-003Sf4-Th
Subject: Re: [f2fs-dev] [PATCH v7 1/9] block: Keyslot Manager for Inline
 Encryption
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

> +#ifdef CONFIG_PM
> +static inline void blk_ksm_set_dev(struct keyslot_manager *ksm,
> +				   struct device *dev)
> +{
> +	ksm->dev = dev;
> +}
> +
> +/* If there's an underlying device and it's suspended, resume it. */
> +static inline void blk_ksm_pm_get(struct keyslot_manager *ksm)
> +{
> +	if (ksm->dev)
> +		pm_runtime_get_sync(ksm->dev);
> +}
> +
> +static inline void blk_ksm_pm_put(struct keyslot_manager *ksm)
> +{
> +	if (ksm->dev)
> +		pm_runtime_put_sync(ksm->dev);
> +}
> +#else /* CONFIG_PM */
> +static inline void blk_ksm_set_dev(struct keyslot_manager *ksm,
> +				   struct device *dev)
> +{
> +}
> +
> +static inline void blk_ksm_pm_get(struct keyslot_manager *ksm)
> +{
> +}
> +
> +static inline void blk_ksm_pm_put(struct keyslot_manager *ksm)
> +{
> +}
> +#endif /* !CONFIG_PM */

I think no one is hurt by an unused dev field for the non-pm case.
I'd suggest to define the field unconditionally, and replace all
the above with direct calls below.

> +/**
> + * blk_ksm_get_slot() - Increment the refcount on the specified slot.
> + * @ksm: The keyslot manager that we want to modify.
> + * @slot: The slot to increment the refcount of.
> + *
> + * This function assumes that there is already an active reference to that slot
> + * and simply increments the refcount. This is useful when cloning a bio that
> + * already has a reference to a keyslot, and we want the cloned bio to also have
> + * its own reference.
> + *
> + * Context: Any context.
> + */
> +void blk_ksm_get_slot(struct keyslot_manager *ksm, unsigned int slot)

This function doesn't appear to be used at all in the whole series.

> +/**
> + * blk_ksm_put_slot() - Release a reference to a slot
> + * @ksm: The keyslot manager to release the reference from.
> + * @slot: The slot to release the reference from.
> + *
> + * Context: Any context.
> + */
> +void blk_ksm_put_slot(struct keyslot_manager *ksm, unsigned int slot)
> +{
> +	unsigned long flags;
> +
> +	if (WARN_ON(slot >= ksm->num_slots))
> +		return;
> +
> +	if (atomic_dec_and_lock_irqsave(&ksm->slots[slot].slot_refs,
> +					&ksm->idle_slots_lock, flags)) {
> +		list_add_tail(&ksm->slots[slot].idle_slot_node,
> +			      &ksm->idle_slots);
> +		spin_unlock_irqrestore(&ksm->idle_slots_lock, flags);
> +		wake_up(&ksm->idle_slots_wait_queue);
> +	}

Given that blk_ksm_get_slot_for_key returns a signed keyslot that
can return errors, and the only callers stores it in a signed variable
I think this function should take a signed slot as well, and the check
for a non-negative slot should be moved here from the only caller.

> diff --git a/include/linux/bio.h b/include/linux/bio.h
> index 853d92ceee64..b2103e207ed5 100644
> --- a/include/linux/bio.h
> +++ b/include/linux/bio.h
> @@ -8,6 +8,7 @@
>  #include <linux/highmem.h>
>  #include <linux/mempool.h>
>  #include <linux/ioprio.h>
> +#include <linux/blk-crypto.h>
>  
>  #ifdef CONFIG_BLOCK
>  /* struct bio, bio_vec and BIO_* flags are defined in blk_types.h */

This doesn't belong here, but into the patch that actually requires
crypto definitions in bio.h.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
