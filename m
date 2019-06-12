Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E6542EA6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2019 20:27:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hb7xZ-0002VK-SY; Wed, 12 Jun 2019 18:26:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hb7xY-0002VA-IF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Jun 2019 18:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HUAgexCvWG7Cyayrhln4neEGisCYLp8Mbq9577WQtRQ=; b=gjJSfWjCyabShVxikqXQdWgDR2
 2RX32LCP86+IYfdn0bbPMdi52A5NchYhZvT+b4Pz0KIZaUZ87WmYchga3QdUZ3fgMYHacxVg6H0ea
 ynfL04ix98h5eEFswgi4LOcq0Jx+WJz++gDljg+5MwMWIQhxiqPA02jFxtRK8QJzVydo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HUAgexCvWG7Cyayrhln4neEGisCYLp8Mbq9577WQtRQ=; b=WU9xPaZW82QOMT4Gv6DKrO/9Dd
 fJuUqDHPlzlr5OriJ/cMmfGleEmWfyO0UrPzo+neNrHEFxLaQ4hH6uQK8A0Q51Hwl2oH0NisD8ZuI
 WjRfPDT8fISqNuU6ORlPxqFiJWVsByCh1foL1i7BLFBTnCQR757H7sZvoyzuwBKDIxgc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hb7xW-00AmXd-LZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Jun 2019 18:26:56 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5852020B7C;
 Wed, 12 Jun 2019 18:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560364006;
 bh=8Xu/4/Hr77YJPOZLyjCSny/gZK/+Yxj5+W0FLM3fw9E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l7jI7F37dU7e+wWSQlP3Hr6YH0EpM0maaHmJ6ps96WG1LHHakgejJshKzKB1rBP5T
 kbLnI7ecNThT0nvN0VMlHB+D8xM89bFHbICIFgIcyRMPBrcs8pvUmbcnqFRFQc0q+i
 4yQ9AckVz9WZBTSVpQimMv/tMS5ljsEZ53OPYHjs=
Date: Wed, 12 Jun 2019 11:26:44 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20190612182642.GB18795@gmail.com>
References: <20190605232837.31545-1-satyat@google.com>
 <20190605232837.31545-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605232837.31545-2-satyat@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 3.6 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.7 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hb7xW-00AmXd-LZ
Subject: Re: [f2fs-dev] [RFC PATCH v2 1/8] block: Keyslot Manager for Inline
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
Cc: Ladvine D Almeida <ladvine.dalmeida@synopsys.com>,
 linux-scsi@vger.kernel.org, Parshuram Raju Thombare <pthombar@cadence.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 05, 2019 at 04:28:30PM -0700, Satya Tangirala wrote:
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 592669bcc536..f76d5dff27fe 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -385,6 +385,10 @@ static inline int blkdev_reset_zones_ioctl(struct block_device *bdev,
>  
>  #endif /* CONFIG_BLK_DEV_ZONED */
>  
> +#ifdef CONFIG_BLK_INLINE_ENCRYPTION
> +struct keyslot_manager;
> +#endif
> +

This should be placed with the other forward declarations at the beginning of
the file.  It also doesn't need to be behind an #ifdef.  See e.g. struct
blkcg_gq which is another conditional field in struct request_queue.

> diff --git a/include/linux/keyslot-manager.h b/include/linux/keyslot-manager.h
> new file mode 100644
> index 000000000000..76a9c255cb7e
> --- /dev/null
> +++ b/include/linux/keyslot-manager.h
[...]
> +#ifdef CONFIG_BLK_INLINE_ENCRYPTION
> +struct keyslot_manager;
> +
> +extern struct keyslot_manager *keyslot_manager_create(unsigned int num_slots,
> +				const struct keyslot_mgmt_ll_ops *ksm_ops,
> +				void *ll_priv_data);
> +
> +extern int
> +keyslot_manager_get_slot_for_key(struct keyslot_manager *ksm,
> +				 const u8 *key,
> +				 enum blk_crypt_mode_num crypt_mode,
> +				 unsigned int data_unit_size);
> +
> +extern void keyslot_manager_get_slot(struct keyslot_manager *ksm,
> +				     unsigned int slot);
> +
> +extern void keyslot_manager_put_slot(struct keyslot_manager *ksm,
> +				     unsigned int slot);
> +
> +extern int keyslot_manager_evict_key(struct keyslot_manager *ksm,
> +				     const u8 *key,
> +				     enum blk_crypt_mode_num crypt_mode,
> +				     unsigned int data_unit_size);
> +
> +extern void keyslot_manager_destroy(struct keyslot_manager *ksm);
> +
> +#else /* CONFIG_BLK_INLINE_ENCRYPTION */
> +struct keyslot_manager {};

This is actually a struct definition, not a declaration.  This doesn't make
sense, since the CONFIG_BLK_INLINE_ENCRYPTION case only needs a forward
declaration here.  Both cases should just use a forward declaration.

> +
> +static inline struct keyslot_manager *
> +keyslot_manager_create(unsigned int num_slots,
> +		       const struct keyslot_mgmt_ll_ops *ksm_ops,
> +		       void *ll_priv_data)
> +{
> +	return NULL;
> +}
> +
> +static inline int
> +keyslot_manager_get_slot_for_key(struct keyslot_manager *ksm,
> +				 const u8 *key,
> +				 enum blk_crypt_mode_num crypt_mode,
> +				 unsigned int data_unit_size)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline void keyslot_manager_get_slot(struct keyslot_manager *ksm,
> +					    unsigned int slot) { }
> +
> +static inline int keyslot_manager_put_slot(struct keyslot_manager *ksm,
> +					   unsigned int slot)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int keyslot_manager_evict_key(struct keyslot_manager *ksm,
> +				     const u8 *key,
> +				     enum blk_crypt_mode_num crypt_mode,
> +				     unsigned int data_unit_size)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline void keyslot_manager_destroy(struct keyslot_manager *ksm)
> +{ }
> +
> +#endif /* CONFIG_BLK_INLINE_ENCRYPTION */

However, it seems we don't actually need these stub functions, since the
keyslot_manager_ functions are only called from .c files that are only compiled
when CONFIG_BLK_INLINE_ENCRYPTION, except for the call to
keyslot_manager_evict_key() in fscrypt_evict_crypt_key().  But it would make
more sense to stub out fscrypt_evict_crypt_key() instead.

So I suggest removing the keyslot_manager_* stubs for now.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
