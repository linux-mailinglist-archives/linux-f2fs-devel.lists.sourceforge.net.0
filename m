Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F0A185FBB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Mar 2020 21:16:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jDZgX-0002pK-Ci; Sun, 15 Mar 2020 20:16:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jDZgW-0002pC-1P
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 15 Mar 2020 20:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gpGo81BCJYvZ8yssCETvJT94D0auTLliWXJOXdn9/gc=; b=TPnl99Nw0IZRSrN6VSoFb6EP94
 NoW+BzRF8+fMLo49yAPDgcD+zLoxgn5qCqT0/xZ0vWvz5BMDXI/hB62IXlwPb03pRM2axro46qU3W
 x1uVGRk77Im2FEjvaHOysHDyJkScIdNnwuZmxxQuFkaJCzU2tDXAhOqFcohl9tPym3Ww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gpGo81BCJYvZ8yssCETvJT94D0auTLliWXJOXdn9/gc=; b=eX/lXk3C8nLwPZetPsuCCznWJF
 W6dRhnEAikKNmBjS1EYqq/3qlQ0mNaemlL/ESK5jL/gkqoYgbM0WPjWzydi73WZ71VzWQIV+xvao3
 q/bSwqe8O1ekzxYkhtd0PjTBxqHZbBrrgrVDH6KIysiVQ9N3kZk4F/Wybn7c8UzVT3Q0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jDZgQ-00Bz2m-62
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 15 Mar 2020 20:16:32 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4834A205C9;
 Sun, 15 Mar 2020 20:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584303380;
 bh=5VqbqRCMOuCKrwhIgRoKM6xoalmVSXXR/W2soqbZ1L0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EcUzhGIuXaHU9vfOPWYtMg5tNxsoTitGkBlfvXySVUWt6Iu1NQNDAB8LCd1+0Nvyt
 4XcWpBlIK/3A1T+NUUSkZwIzsU4SL3OLRuehrOjZp/6w9mEHq4mVL63J3TZCxfZEB0
 4hZ1adM0h2K2JuNo4FFTY29yf4DUchHuTWpNOS4I=
Date: Sun, 15 Mar 2020 13:16:18 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200315201618.GH1055@sol.localdomain>
References: <20200312080253.3667-1-satyat@google.com>
 <20200312080253.3667-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312080253.3667-4-satyat@google.com>
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jDZgQ-00Bz2m-62
Subject: Re: [f2fs-dev] [PATCH v8 03/11] block: Make blk-integrity preclude
 hardware inline encryption
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

On Thu, Mar 12, 2020 at 01:02:45AM -0700, Satya Tangirala wrote:
> diff --git a/block/blk-integrity.c b/block/blk-integrity.c
> index ff1070edbb40..793ba23e8688 100644
> --- a/block/blk-integrity.c
> +++ b/block/blk-integrity.c
> @@ -409,6 +409,13 @@ void blk_integrity_register(struct gendisk *disk, struct blk_integrity *template
>  	bi->tag_size = template->tag_size;
>  
>  	disk->queue->backing_dev_info->capabilities |= BDI_CAP_STABLE_WRITES;
> +
> +#ifdef BLK_INLINE_ENCRYPTION
> +	if (disk->queue->ksm) {
> +		pr_warn("blk-integrity: Integrity and hardware inline encryption are not supported together. Unregistering keyslot manager from request queue, to disable hardware inline encryption.");
> +		blk_ksm_unregister(disk->queue);
> +	}
> +#endif
>  }
>  EXPORT_SYMBOL(blk_integrity_register);

This ifdef is wrong, it should be CONFIG_BLK_INLINE_ENCRYPTION.

Also the log message is missing a trailing newline.

>  
> diff --git a/block/keyslot-manager.c b/block/keyslot-manager.c
> index 38df0652df80..a7970e18a122 100644
> --- a/block/keyslot-manager.c
> +++ b/block/keyslot-manager.c
> @@ -25,6 +25,9 @@
>   * Upper layers will call blk_ksm_get_slot_for_key() to program a
>   * key into some slot in the inline encryption hardware.
>   */
> +
> +#define pr_fmt(fmt) "blk_ksm: " fmt

People aren't going to know what "blk_ksm" means in the logs.
I think just use "blk-crypto" instead.

> +
>  #include <crypto/algapi.h>
>  #include <linux/keyslot-manager.h>
>  #include <linux/atomic.h>
> @@ -375,3 +378,20 @@ void blk_ksm_destroy(struct keyslot_manager *ksm)
>  	memzero_explicit(ksm, sizeof(*ksm));
>  }
>  EXPORT_SYMBOL_GPL(blk_ksm_destroy);
> +
> +bool blk_ksm_register(struct keyslot_manager *ksm, struct request_queue *q)
> +{
> +	if (blk_integrity_queue_supports_integrity(q)) {
> +		pr_warn("Integrity and hardware inline encryption are not supported together. Won't register keyslot manager with request queue.");
> +		return false;
> +	}
> +	q->ksm = ksm;
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(blk_ksm_register);


People reading the logs won't know what a keyslot manager is and why they should
care that one wasn't registered.  It would be better to say that hardware inline
encryption is being disabled.

Ideally the device name would be included in the message too.

> +
> +void blk_ksm_unregister(struct request_queue *q)
> +{
> +	q->ksm = NULL;
> +}
> +EXPORT_SYMBOL_GPL(blk_ksm_unregister);

blk_ksm_unregister() doesn't need to be exported.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
