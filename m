Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D26BD4F752E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Apr 2022 07:16:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ncKVY-0000C3-Ho; Thu, 07 Apr 2022 05:16:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <colyli@suse.de>)
 id 1ncKVW-0000Bo-Ir; Thu, 07 Apr 2022 05:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3mSljOe/NcqR0nJ5LYJS1IexMd+XWdNrUUnY7u8p4ss=; b=hbUK91ekvi9BJmCy9CI0ws/kZ+
 ap4RNMYQCAMMqInshDep4+OtLV9IsEOcULwjQpsFcsUhM+uFb+bfAY0XC/1Hdx4ms0UDWb1F9aG3R
 zmL6K+ompKferOHiT4C3UWwRabnpiB5K5pEoH3/HSeSNI0RDnX2I2cGRZg8qTyu5E0e8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3mSljOe/NcqR0nJ5LYJS1IexMd+XWdNrUUnY7u8p4ss=; b=TIR602P3YlPGAwTFCcp5i5krrD
 XfxIpq/rvTH0b+k18sSNfGcRMdFR8NfI4DU53h0NDKbSnga5PhNF1VCIXcSFPtab9f66L7ejAhm2M
 ZM4k9XTAvs8Bn/h/QqJgDX6biEPNe0ZTqtsGhumLq+9GoaefnvA2FD4Kd15igrKOcfZI=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1ncKVU-008MwZ-D8; Thu, 07 Apr 2022 05:16:35 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B76E021122;
 Thu,  7 Apr 2022 05:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649308580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3mSljOe/NcqR0nJ5LYJS1IexMd+XWdNrUUnY7u8p4ss=;
 b=S8u6tT4MOmjtYxCqeb3qmZNn/bHZfqArgo8fnUTx30csmaC8EzqkNzsFCobTftsYYuUnLo
 j2CEECTylf45En922p7zGMdDliHlOB0W/p8IrTqMAAnrwN0MZYWeSbIR9ZZAecmXn6aNZm
 pYWtnVOXe4neFTwM3RVsKoYuaP4pLxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649308580;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3mSljOe/NcqR0nJ5LYJS1IexMd+XWdNrUUnY7u8p4ss=;
 b=8wVCLmcmG2fqohkxPiOTT+zNzsZDHS4xqLNwNHKElc9o7Ynzusas5Vi1t3zyX0xdAJFT8y
 NypPr2uWld7TnxBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81FE713A66;
 Thu,  7 Apr 2022 05:16:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0FojFJ5zTmLoQAAAMHmgww
 (envelope-from <colyli@suse.de>); Thu, 07 Apr 2022 05:16:14 +0000
Message-ID: <2aee78dd-d5b6-5444-da28-34ab2631b264@suse.de>
Date: Thu, 7 Apr 2022 13:16:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-24-hch@lst.de>
From: Coly Li <colyli@suse.de>
In-Reply-To: <20220406060516.409838-24-hch@lst.de>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/6/22 2:05 PM, Christoph Hellwig wrote: > Add a helper
 to query the number of sectors support per each discard bio > based on the
 block device and use this helper to stop various places from > pok [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1ncKVU-008MwZ-D8
Subject: Re: [f2fs-dev] [PATCH 23/27] block: add a bdev_max_discard_sectors
 helper
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
> Add a helper to query the number of sectors support per each discard bio
> based on the block device and use this helper to stop various places from
> poking into the request_queue to see if discard is supported and if so how
> much.  This mirrors what is done e.g. for write zeroes as well.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>


For the bcache part,

Acked-by: Coly Li <colyli@suse.de>


Thanks.


Coly Li



> ---
>   block/blk-core.c                    |  2 +-
>   block/blk-lib.c                     |  2 +-
>   block/ioctl.c                       |  3 +--
>   drivers/block/drbd/drbd_main.c      |  2 +-
>   drivers/block/drbd/drbd_nl.c        | 12 +++++++-----
>   drivers/block/drbd/drbd_receiver.c  |  5 ++---
>   drivers/block/loop.c                |  9 +++------
>   drivers/block/rnbd/rnbd-srv-dev.h   |  6 +-----
>   drivers/block/xen-blkback/xenbus.c  |  2 +-
>   drivers/md/bcache/request.c         |  4 ++--
>   drivers/md/bcache/super.c           |  2 +-
>   drivers/md/bcache/sysfs.c           |  2 +-
>   drivers/md/dm-cache-target.c        |  9 +--------
>   drivers/md/dm-clone-target.c        |  9 +--------
>   drivers/md/dm-io.c                  |  2 +-
>   drivers/md/dm-log-writes.c          |  3 +--
>   drivers/md/dm-raid.c                |  9 ++-------
>   drivers/md/dm-table.c               |  4 +---
>   drivers/md/dm-thin.c                |  9 +--------
>   drivers/md/dm.c                     |  2 +-
>   drivers/md/md-linear.c              |  4 ++--
>   drivers/md/raid0.c                  |  2 +-
>   drivers/md/raid1.c                  |  6 +++---
>   drivers/md/raid10.c                 |  8 ++++----
>   drivers/md/raid5-cache.c            |  2 +-
>   drivers/target/target_core_device.c |  8 +++-----
>   fs/btrfs/extent-tree.c              |  4 ++--
>   fs/btrfs/ioctl.c                    |  2 +-
>   fs/exfat/file.c                     |  2 +-
>   fs/exfat/super.c                    | 10 +++-------
>   fs/ext4/ioctl.c                     | 10 +++-------
>   fs/ext4/super.c                     | 10 +++-------
>   fs/f2fs/f2fs.h                      |  3 +--
>   fs/f2fs/segment.c                   |  6 ++----
>   fs/fat/file.c                       |  2 +-
>   fs/fat/inode.c                      | 10 +++-------
>   fs/gfs2/rgrp.c                      |  2 +-
>   fs/jbd2/journal.c                   |  7 ++-----
>   fs/jfs/ioctl.c                      |  2 +-
>   fs/jfs/super.c                      |  8 ++------
>   fs/nilfs2/ioctl.c                   |  2 +-
>   fs/ntfs3/file.c                     |  2 +-
>   fs/ntfs3/super.c                    |  2 +-
>   fs/ocfs2/ioctl.c                    |  2 +-
>   fs/xfs/xfs_discard.c                |  2 +-
>   fs/xfs/xfs_super.c                  | 12 ++++--------
>   include/linux/blkdev.h              |  5 +++++
>   mm/swapfile.c                       | 17 ++---------------
>   48 files changed, 87 insertions(+), 163 deletions(-)

[snipped]


> diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
> index fdd0194f84dd0..e27f67f06a428 100644
> --- a/drivers/md/bcache/request.c
> +++ b/drivers/md/bcache/request.c
> @@ -1005,7 +1005,7 @@ static void cached_dev_write(struct cached_dev *dc, struct search *s)
>   		bio_get(s->iop.bio);
>   
>   		if (bio_op(bio) == REQ_OP_DISCARD &&
> -		    !blk_queue_discard(bdev_get_queue(dc->bdev)))
> +		    !bdev_max_discard_sectors(dc->bdev))
>   			goto insert_data;
>   
>   		/* I/O request sent to backing device */
> @@ -1115,7 +1115,7 @@ static void detached_dev_do_request(struct bcache_device *d, struct bio *bio,
>   	bio->bi_private = ddip;
>   
>   	if ((bio_op(bio) == REQ_OP_DISCARD) &&
> -	    !blk_queue_discard(bdev_get_queue(dc->bdev)))
> +	    !bdev_max_discard_sectors(dc->bdev))
>   		bio->bi_end_io(bio);
>   	else
>   		submit_bio_noacct(bio);
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index bf3de149d3c9f..296f200b2e208 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -2350,7 +2350,7 @@ static int register_cache(struct cache_sb *sb, struct cache_sb_disk *sb_disk,
>   	ca->bdev->bd_holder = ca;
>   	ca->sb_disk = sb_disk;
>   
> -	if (blk_queue_discard(bdev_get_queue(bdev)))
> +	if (bdev_max_discard_sectors((bdev)))
>   		ca->discard = CACHE_DISCARD(&ca->sb);
>   
>   	ret = cache_alloc(ca);
> diff --git a/drivers/md/bcache/sysfs.c b/drivers/md/bcache/sysfs.c
> index d1029d71ff3bc..c6f677059214d 100644
> --- a/drivers/md/bcache/sysfs.c
> +++ b/drivers/md/bcache/sysfs.c
> @@ -1151,7 +1151,7 @@ STORE(__bch_cache)
>   	if (attr == &sysfs_discard) {
>   		bool v = strtoul_or_return(buf);
>   
> -		if (blk_queue_discard(bdev_get_queue(ca->bdev)))
> +		if (bdev_max_discard_sectors(ca->bdev))
>   			ca->discard = v;
>   
>   		if (v != CACHE_DISCARD(&ca->sb)) {


[snipped]



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
