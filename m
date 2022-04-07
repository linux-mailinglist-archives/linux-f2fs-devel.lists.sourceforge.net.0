Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A434F78C7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Apr 2022 10:03:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ncN72-0004kH-Ck; Thu, 07 Apr 2022 08:03:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <colyli@suse.de>)
 id 1ncN70-0004k3-IE; Thu, 07 Apr 2022 08:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7k0z5t+RkWgzil40AtKwhJmpL0iBjAFtHXia6nIwjc8=; b=kGk9kJQMZyVuEKintxLCdR/FeB
 aC6Q+VebHLRq9OAkfQr4MKfzyyw79nEAwba+fUu2n6xirFIVcQ37YFWxDMsdnwoocEm9i/LypGZYB
 ByVKOQGnhjobQWKmW3XRrdSQKERDsMpO6Ws5HJlAlYu9X3hOZtniZm4O0xBYd6D+EW4Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7k0z5t+RkWgzil40AtKwhJmpL0iBjAFtHXia6nIwjc8=; b=dStfSyeMi4byf5tDOPvb7VdFw+
 YD7vIrSDxYQtS0D0bPWssYHHXD660fSG62DII7ft4rcHofEL+UoPZlgwA4eLfy65zVo342J42HaqC
 Qi9sUGbkVyfAyI3NzyWvE3eenm7v5l/Hrmy2Iajr4OMIcuOjC+luU5PVB8FltNc/i8l8=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1ncN6x-0005uq-RT; Thu, 07 Apr 2022 08:03:24 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BA7481F859;
 Thu,  7 Apr 2022 08:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649318596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7k0z5t+RkWgzil40AtKwhJmpL0iBjAFtHXia6nIwjc8=;
 b=BFj1weRWNO0gJwf1a0jytpVaNV2SIOQyml/DNHaVaAYv+GWtC9RRp3Nkr1QhUY/V7QdLG9
 baoJsXmF2FufEolsvsTPwbwZ3Or5/MyPwA8jPnqPoYDtXH5U9TjRT7F8cNWLR3Nqx6fvJv
 Ws2fOIHqbo98FqfWwnQjig+YJFloGxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649318596;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7k0z5t+RkWgzil40AtKwhJmpL0iBjAFtHXia6nIwjc8=;
 b=DjSOFiN41nmAx2XAVq/tnPaDKbkIhCw6FaIeWu9KyiZMi8ecy7DPyjacZPoBAIl6E7Jspy
 2pyi9oy0n8T7WCDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CF8613485;
 Thu,  7 Apr 2022 08:03:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id F2mtCL+aTmKlAgAAMHmgww
 (envelope-from <colyli@suse.de>); Thu, 07 Apr 2022 08:03:11 +0000
Message-ID: <9f91936a-7dd7-2ee6-3293-f199ada85210@suse.de>
Date: Thu, 7 Apr 2022 16:03:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-23-hch@lst.de>
From: Coly Li <colyli@suse.de>
In-Reply-To: <20220406060516.409838-23-hch@lst.de>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/6/22 2:05 PM, Christoph Hellwig wrote: > Move all the
 logic to limit the discard bio size into a common helper > so that it is
 better documented. > > Signed-off-by: Christoph Hellwig <hch@lst.de> 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.9 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1ncN6x-0005uq-RT
Subject: Re: [f2fs-dev] [PATCH 22/27] block: refactor discard bio size
 limiting
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
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/6/22 2:05 PM, Christoph Hellwig wrote:
> Move all the logic to limit the discard bio size into a common helper
> so that it is better documented.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Coly Li <colyli@suse.de>


Thanks for the change.

Coly Li


> ---
>   block/blk-lib.c | 59 ++++++++++++++++++++++++-------------------------
>   block/blk.h     | 14 ------------
>   2 files changed, 29 insertions(+), 44 deletions(-)
>
> diff --git a/block/blk-lib.c b/block/blk-lib.c
> index 237d60d8b5857..2ae32a722851c 100644
> --- a/block/blk-lib.c
> +++ b/block/blk-lib.c
> @@ -10,6 +10,32 @@
>   
>   #include "blk.h"
>   
> +static sector_t bio_discard_limit(struct block_device *bdev, sector_t sector)
> +{
> +	unsigned int discard_granularity =
> +		bdev_get_queue(bdev)->limits.discard_granularity;
> +	sector_t granularity_aligned_sector;
> +
> +	if (bdev_is_partition(bdev))
> +		sector += bdev->bd_start_sect;
> +
> +	granularity_aligned_sector =
> +		round_up(sector, discard_granularity >> SECTOR_SHIFT);
> +
> +	/*
> +	 * Make sure subsequent bios start aligned to the discard granularity if
> +	 * it needs to be split.
> +	 */
> +	if (granularity_aligned_sector != sector)
> +		return granularity_aligned_sector - sector;
> +
> +	/*
> +	 * Align the bio size to the discard granularity to make splitting the bio
> +	 * at discard granularity boundaries easier in the driver if needed.
> +	 */
> +	return round_down(UINT_MAX, discard_granularity) >> SECTOR_SHIFT;
> +}
> +
>   int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
>   		sector_t nr_sects, gfp_t gfp_mask, int flags,
>   		struct bio **biop)
> @@ -17,7 +43,7 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
>   	struct request_queue *q = bdev_get_queue(bdev);
>   	struct bio *bio = *biop;
>   	unsigned int op;
> -	sector_t bs_mask, part_offset = 0;
> +	sector_t bs_mask;
>   
>   	if (bdev_read_only(bdev))
>   		return -EPERM;
> @@ -48,36 +74,9 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
>   	if (!nr_sects)
>   		return -EINVAL;
>   
> -	/* In case the discard request is in a partition */
> -	if (bdev_is_partition(bdev))
> -		part_offset = bdev->bd_start_sect;
> -
>   	while (nr_sects) {
> -		sector_t granularity_aligned_lba, req_sects;
> -		sector_t sector_mapped = sector + part_offset;
> -
> -		granularity_aligned_lba = round_up(sector_mapped,
> -				q->limits.discard_granularity >> SECTOR_SHIFT);
> -
> -		/*
> -		 * Check whether the discard bio starts at a discard_granularity
> -		 * aligned LBA,
> -		 * - If no: set (granularity_aligned_lba - sector_mapped) to
> -		 *   bi_size of the first split bio, then the second bio will
> -		 *   start at a discard_granularity aligned LBA on the device.
> -		 * - If yes: use bio_aligned_discard_max_sectors() as the max
> -		 *   possible bi_size of the first split bio. Then when this bio
> -		 *   is split in device drive, the split ones are very probably
> -		 *   to be aligned to discard_granularity of the device's queue.
> -		 */
> -		if (granularity_aligned_lba == sector_mapped)
> -			req_sects = min_t(sector_t, nr_sects,
> -					  bio_aligned_discard_max_sectors(q));
> -		else
> -			req_sects = min_t(sector_t, nr_sects,
> -					  granularity_aligned_lba - sector_mapped);
> -
> -		WARN_ON_ONCE((req_sects << 9) > UINT_MAX);
> +		sector_t req_sects =
> +			min(nr_sects, bio_discard_limit(bdev, sector));
>   
>   		bio = blk_next_bio(bio, bdev, 0, op, gfp_mask);
>   		bio->bi_iter.bi_sector = sector;
> diff --git a/block/blk.h b/block/blk.h
> index 8ccbc6e076369..1fdc1d28e6d60 100644
> --- a/block/blk.h
> +++ b/block/blk.h
> @@ -346,20 +346,6 @@ static inline unsigned int bio_allowed_max_sectors(struct request_queue *q)
>   	return round_down(UINT_MAX, queue_logical_block_size(q)) >> 9;
>   }
>   
> -/*
> - * The max bio size which is aligned to q->limits.discard_granularity. This
> - * is a hint to split large discard bio in generic block layer, then if device
> - * driver needs to split the discard bio into smaller ones, their bi_size can
> - * be very probably and easily aligned to discard_granularity of the device's
> - * queue.
> - */
> -static inline unsigned int bio_aligned_discard_max_sectors(
> -					struct request_queue *q)
> -{
> -	return round_down(UINT_MAX, q->limits.discard_granularity) >>
> -			SECTOR_SHIFT;
> -}
> -
>   /*
>    * Internal io_context interface
>    */




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
