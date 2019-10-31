Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF3FEB69A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2019 19:05:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQEoZ-0004lC-1h; Thu, 31 Oct 2019 18:04:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+4fa4615b85c97fbb822c+5912+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iQEoY-0004ks-4S
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 18:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6HWF9R69q+bGarY+/HC5Lk584D+wVdNWtJtDctzB8q0=; b=a/9/7MXdUKUSKI7whyj29R5qbO
 ovMvf1PyYXCSoghbhbdE0gLK7xgP0y7Ks21J3icdYn3xnrLSjfZtL2cC2Q7U+Oaf0tql/Q7aZFqZh
 H9/sR1Clx6bodHlDqJUvJHiHZkxQlPdjjFR18y/KJRD1Ypp9eInpm5EISSeeYSu6ggAY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6HWF9R69q+bGarY+/HC5Lk584D+wVdNWtJtDctzB8q0=; b=mzC8RNbfhsOi4J/DbM8usZsUy+
 5xLKii76+4RMPAEdAgKvU4J2HBV3XScIY95YyrdcvspAUwFCWy9a8ge8PbEWjyopWk+dQqrDbY/kD
 GUk3Ro8jW0QHiOBN73VrZ0EDxjwpBSV/khGBEYuIyqUo2GKntEbFI6BKWPJB3Xby2k2Q=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQEoW-00Crcj-UC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 18:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6HWF9R69q+bGarY+/HC5Lk584D+wVdNWtJtDctzB8q0=; b=TEtnKh13JEKKq4wRkVL86Y5w9
 7iVHzu0iuZ8ezJjv4H2UHAd/n8maPHxbW9eNwbD3a+c8QX0cc802D/vBn56B4x+imP3oyyFtqjKVj
 Ckrdpp7SVuZB2MLxrI/Z7q5xtnE3d4u11miv9lJWYYSzLivn0UwC9OJs8lp7paRuSjSFjrymTx0Ms
 5CyATrnj8v+A7R2PZQc7NNbrt0xiC0nDud9k3oxZzdCYk/z7nfxj3h4qQrxgfYVg6WfFRW2fnAxQ2
 aPJawWzu6LUD3GXu/R4R0U4WhklGsjzJhO84sNvZNHGFs03d2qkFtH8dsmv2I9szMN5q10ogDI/ZD
 IZYtgPl0A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iQEoI-0002h1-Te; Thu, 31 Oct 2019 18:04:38 +0000
Date: Thu, 31 Oct 2019 11:04:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20191031180438.GB23601@infradead.org>
References: <20191028072032.6911-1-satyat@google.com>
 <20191028072032.6911-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191028072032.6911-2-satyat@google.com>
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
X-Headers-End: 1iQEoW-00Crcj-UC
Subject: Re: [f2fs-dev] [PATCH v5 1/9] block: Keyslot Manager for Inline
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
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 28, 2019 at 12:20:24AM -0700, Satya Tangirala wrote:
> +/*
> + * keyslot-manager.c

Never mention the file name in top of the file comments, it is going
to be out of data sooner than you'll get the series merged..

> +EXPORT_SYMBOL(keyslot_manager_create);

please use EXPORT_SYMBOL_GPL like all new low-level block layer exports.

> +EXPORT_SYMBOL(keyslot_manager_get_slot_for_key);

This is only used in block/bio-crypt-ctx.c, no need for an export.

> +void keyslot_manager_get_slot(struct keyslot_manager *ksm, unsigned int slot)
> +{
> +	if (WARN_ON(slot >= ksm->num_slots))
> +		return;
> +
> +	WARN_ON(atomic_inc_return(&ksm->slots[slot].slot_refs) < 2);
> +}
> +EXPORT_SYMBOL(keyslot_manager_get_slot);

Same here.

> +EXPORT_SYMBOL(keyslot_manager_put_slot);

And here.

> +bool keyslot_manager_crypto_mode_supported(struct keyslot_manager *ksm,
> +					   enum blk_crypto_mode_num crypto_mode,
> +					   unsigned int data_unit_size)
> +{
> +	if (!ksm)
> +		return false;
> +	return ksm->ksm_ll_ops.crypto_mode_supported(ksm->ll_priv_data,
> +						     crypto_mode,
> +						     data_unit_size);
> +}
> +EXPORT_SYMBOL(keyslot_manager_crypto_mode_supported);

And here as well.  In fact this one is so trivial that it is better
open coded into the two callers.

> +bool keyslot_manager_rq_crypto_mode_supported(struct request_queue *q,
> +					enum blk_crypto_mode_num crypto_mode,
> +					unsigned int data_unit_size)
> +{
> +	return keyslot_manager_crypto_mode_supported(q->ksm, crypto_mode,
> +						     data_unit_size);
> +}
> +EXPORT_SYMBOL(keyslot_manager_rq_crypto_mode_supported);

And this one is entirely unused.

> +EXPORT_SYMBOL(keyslot_manager_evict_key);

No used outside blk-crypto.c either.

In fact given how small block/blk-crypto.c and block/keyslot-manager.c
are, and given that all but two functions in the latter are only called
from the former you should seriously consider merging the two files.

> diff --git a/include/linux/bio.h b/include/linux/bio.h
> index 3cdb84cdc488..d0cb7c350cdc 100644
> --- a/include/linux/bio.h
> +++ b/include/linux/bio.h
> @@ -564,6 +564,11 @@ static inline void bvec_kunmap_irq(char *buffer, unsigned long *flags)
>  }
>  #endif
>  
> +enum blk_crypto_mode_num {
> +	BLK_ENCRYPTION_MODE_INVALID	= 0,
> +	BLK_ENCRYPTION_MODE_AES_256_XTS	= 1,
> +};

This one moves to include/linux/bio-crypt-ctx.h later in the series,
please introduce it in the right place from the start.  Also is there
a need to explicitly assign code points here?

> +extern struct keyslot_manager *keyslot_manager_create(unsigned int num_slots,
> +				const struct keyslot_mgmt_ll_ops *ksm_ops,
> +				void *ll_priv_data);

There is no nee for externs on function declarations in headers.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
