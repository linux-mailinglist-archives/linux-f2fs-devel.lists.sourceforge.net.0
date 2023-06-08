Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40567727F40
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jun 2023 13:45:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q7E54-0008DL-LY;
	Thu, 08 Jun 2023 11:45:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1q7E53-0008DA-Tw
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=10U2dxlsrDtQforFcJEnGnhJNvhOT3kzByHKATLsPr8=; b=Q09Ss3XnF0ywDW9Rn8TQpMFllD
 ObAAWltPpxYJHh3SS8j1pi7r23/QzA4tbaJ3IsxliuLO3Q2QG/ZiyU9m3vCGvn3lMbzvc7ct7Q3xG
 hZ/CY1oQWoWRfAU8Y4mSu8EFOo2DslQwzyagAskvHpHB03WuyXITNjjYHLbtfTG/+Zr8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=10U2dxlsrDtQforFcJEnGnhJNvhOT3kzByHKATLsPr8=; b=OArt/eox4Rj8HD95I7Xwt6Wjz6
 59aESHvnJ1qKZkgNjl0OInz6CL4nnTp2rSuqyOWQk6imckBdN0gul8unGiIS5Oij843xlSctItLNa
 vgc+XuYiyJY5uy0c8WXrYlQD9RlT9/s4S/Xz5ULQ/0sStW59VlODGlvNFFiphinXUEQ4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q7E4z-0001mK-DK for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:45:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DA0A618B0;
 Thu,  8 Jun 2023 11:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42938C433EF;
 Thu,  8 Jun 2023 11:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686224713;
 bh=uhjIv5Sa1oi3FuSQdI7d6ZvfzvgjdYXIxWAZbYpUP+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hW7WCoZbzz2ToN5gO3aubtu8OixoLOMYnS592UnmFA3HEaXLdTSb0L27KfzRe7Zon
 7zwb7SysEuRLE1hxOnjGcCDx+dWQV90k1PcTLNLX8/PS3bn+NdIezX8n3TuEfdlJbK
 4NTg8eC487mfS9FkKKwNhhmQKs39j50Q9mzAYLfi+lAKXWuY3rKdBJSrWhyjBXRJ3U
 oQcGUh62Q2AtvaVel88eA63wLtYKvfEP1Vxh5fKDKxLRgpI6BdDfpeHB0Y1nf7WHzf
 HRjLKAvQ6f4kaaiOLsEXHfZtid/Pi/0Xqy2JA1bobmN9KvqEYZhFBTNZWj0x3E5bhS
 gIb8zc3dKkEww==
Date: Thu, 8 Jun 2023 13:45:05 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230608-lokal-abrechnen-3f0861c62bf1@brauner>
References: <20230608110258.189493-1-hch@lst.de>
 <20230608110258.189493-28-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230608110258.189493-28-hch@lst.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 08, 2023 at 01:02:55PM +0200, Christoph Hellwig
 wrote: > The only overlap between the block open flags mapped into the fmode_t
 and > other uses of fmode_t are FMODE_READ and FMODE_WRITE. D [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q7E4z-0001mK-DK
Subject: Re: [f2fs-dev] [PATCH 27/30] block: replace fmode_t with a
 block-specific type for block open flags
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 08, 2023 at 01:02:55PM +0200, Christoph Hellwig wrote:
> The only overlap between the block open flags mapped into the fmode_t and
> other uses of fmode_t are FMODE_READ and FMODE_WRITE.  Define a new
> blk_mode_t instead for use in blkdev_get_by_{dev,path}, ->open and
> ->ioctl and stop abusing fmode_t.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Jack Wang <jinpu.wang@ionos.com>		[rnbd]
> ---
>  arch/um/drivers/ubd_kern.c          |  8 +++---
>  arch/xtensa/platforms/iss/simdisk.c |  2 +-
>  block/bdev.c                        | 32 +++++++++++-----------
>  block/blk-zoned.c                   |  8 +++---
>  block/blk.h                         | 11 ++++----
>  block/fops.c                        | 32 +++++++++++++++++-----
>  block/genhd.c                       |  8 +++---
>  block/ioctl.c                       | 42 +++++++++--------------------
>  drivers/block/amiflop.c             | 12 ++++-----
>  drivers/block/aoe/aoeblk.c          |  4 +--
>  drivers/block/ataflop.c             | 25 +++++++++--------
>  drivers/block/drbd/drbd_main.c      |  7 ++---
>  drivers/block/drbd/drbd_nl.c        |  2 +-
>  drivers/block/floppy.c              | 28 +++++++++----------
>  drivers/block/loop.c                | 22 +++++++--------
>  drivers/block/mtip32xx/mtip32xx.c   |  4 +--
>  drivers/block/nbd.c                 |  4 +--
>  drivers/block/pktcdvd.c             | 17 ++++++------
>  drivers/block/rbd.c                 |  2 +-
>  drivers/block/rnbd/rnbd-clt.c       |  4 +--
>  drivers/block/rnbd/rnbd-srv.c       |  4 +--
>  drivers/block/sunvdc.c              |  2 +-
>  drivers/block/swim.c                | 16 +++++------
>  drivers/block/swim3.c               | 24 ++++++++---------
>  drivers/block/ublk_drv.c            |  2 +-
>  drivers/block/xen-blkback/xenbus.c  |  2 +-
>  drivers/block/xen-blkfront.c        |  2 +-
>  drivers/block/z2ram.c               |  2 +-
>  drivers/block/zram/zram_drv.c       |  6 ++---
>  drivers/cdrom/cdrom.c               |  6 ++---
>  drivers/cdrom/gdrom.c               |  4 +--
>  drivers/md/bcache/bcache.h          |  2 +-
>  drivers/md/bcache/request.c         |  4 +--
>  drivers/md/bcache/super.c           |  6 ++---
>  drivers/md/dm-cache-target.c        | 12 ++++-----
>  drivers/md/dm-clone-target.c        | 10 +++----
>  drivers/md/dm-core.h                |  7 +++--
>  drivers/md/dm-era-target.c          |  6 +++--
>  drivers/md/dm-ioctl.c               | 10 +++----
>  drivers/md/dm-snap.c                |  4 +--
>  drivers/md/dm-table.c               | 11 ++++----
>  drivers/md/dm-thin.c                |  9 ++++---
>  drivers/md/dm-verity-fec.c          |  2 +-
>  drivers/md/dm-verity-target.c       |  6 ++---
>  drivers/md/dm.c                     | 10 +++----
>  drivers/md/dm.h                     |  2 +-
>  drivers/md/md.c                     |  8 +++---
>  drivers/mmc/core/block.c            |  8 +++---
>  drivers/mtd/devices/block2mtd.c     |  4 +--
>  drivers/mtd/mtd_blkdevs.c           |  4 +--
>  drivers/mtd/ubi/block.c             |  5 ++--
>  drivers/nvme/host/core.c            |  2 +-
>  drivers/nvme/host/ioctl.c           |  8 +++---
>  drivers/nvme/host/multipath.c       |  2 +-
>  drivers/nvme/host/nvme.h            |  4 +--
>  drivers/nvme/target/io-cmd-bdev.c   |  2 +-
>  drivers/s390/block/dasd.c           |  6 ++---
>  drivers/s390/block/dasd_genhd.c     |  3 ++-
>  drivers/s390/block/dasd_int.h       |  3 ++-
>  drivers/s390/block/dasd_ioctl.c     |  2 +-
>  drivers/s390/block/dcssblk.c        |  4 +--
>  drivers/scsi/sd.c                   | 19 ++++++-------
>  drivers/scsi/sr.c                   | 10 +++----
>  drivers/target/target_core_iblock.c |  5 ++--
>  drivers/target/target_core_pscsi.c  |  4 +--
>  fs/btrfs/dev-replace.c              |  2 +-
>  fs/btrfs/super.c                    |  8 +++---
>  fs/btrfs/volumes.c                  | 16 +++++------
>  fs/btrfs/volumes.h                  |  4 +--
>  fs/erofs/super.c                    |  2 +-
>  fs/ext4/super.c                     |  2 +-
>  fs/f2fs/super.c                     |  2 +-
>  fs/jfs/jfs_logmgr.c                 |  2 +-
>  fs/nfs/blocklayout/dev.c            |  5 ++--
>  fs/ocfs2/cluster/heartbeat.c        |  3 ++-
>  fs/reiserfs/journal.c               |  4 +--
>  fs/xfs/xfs_super.c                  |  2 +-
>  include/linux/blkdev.h              | 30 ++++++++++++++++-----
>  include/linux/cdrom.h               |  3 ++-
>  include/linux/device-mapper.h       |  8 +++---
>  kernel/power/swap.c                 |  6 ++---
>  mm/swapfile.c                       |  2 +-
>  82 files changed, 334 insertions(+), 315 deletions(-)
> 
> diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
> index 20c1a16199c503..50206feac577d5 100644
> --- a/arch/um/drivers/ubd_kern.c
> +++ b/arch/um/drivers/ubd_kern.c
> @@ -108,9 +108,9 @@ static inline void ubd_set_bit(__u64 bit, unsigned char *data)
>  static DEFINE_MUTEX(ubd_lock);
>  static DEFINE_MUTEX(ubd_mutex); /* replaces BKL, might not be needed */
>  
> -static int ubd_open(struct gendisk *disk, fmode_t mode);
> +static int ubd_open(struct gendisk *disk, blk_mode_t mode);
>  static void ubd_release(struct gendisk *disk);
> -static int ubd_ioctl(struct block_device *bdev, fmode_t mode,
> +static int ubd_ioctl(struct block_device *bdev, blk_mode_t mode,
>  		     unsigned int cmd, unsigned long arg);
>  static int ubd_getgeo(struct block_device *bdev, struct hd_geometry *geo);
>  
> @@ -1154,7 +1154,7 @@ static int __init ubd_driver_init(void){
>  
>  device_initcall(ubd_driver_init);
>  
> -static int ubd_open(struct gendisk *disk, fmode_t mode)
> +static int ubd_open(struct gendisk *disk, blk_mode_t mode)
>  {
>  	struct ubd *ubd_dev = disk->private_data;
>  	int err = 0;
> @@ -1389,7 +1389,7 @@ static int ubd_getgeo(struct block_device *bdev, struct hd_geometry *geo)
>  	return 0;
>  }
>  
> -static int ubd_ioctl(struct block_device *bdev, fmode_t mode,
> +static int ubd_ioctl(struct block_device *bdev, blk_mode_t mode,
>  		     unsigned int cmd, unsigned long arg)
>  {
>  	struct ubd *ubd_dev = bdev->bd_disk->private_data;
> diff --git a/arch/xtensa/platforms/iss/simdisk.c b/arch/xtensa/platforms/iss/simdisk.c
> index 2ad9da3de0d90f..178cf96ca10acb 100644
> --- a/arch/xtensa/platforms/iss/simdisk.c
> +++ b/arch/xtensa/platforms/iss/simdisk.c
> @@ -120,7 +120,7 @@ static void simdisk_submit_bio(struct bio *bio)
>  	bio_endio(bio);
>  }
>  
> -static int simdisk_open(struct gendisk *disk, fmode_t mode)
> +static int simdisk_open(struct gendisk *disk, blk_mode_t mode)
>  {
>  	struct simdisk *dev = disk->private_data;
>  
> diff --git a/block/bdev.c b/block/bdev.c
> index db63e5bcc46ffa..bd558a9ba3cd97 100644
> --- a/block/bdev.c
> +++ b/block/bdev.c
> @@ -93,7 +93,7 @@ EXPORT_SYMBOL(invalidate_bdev);
>   * Drop all buffers & page cache for given bdev range. This function bails
>   * with error if bdev has other exclusive owner (such as filesystem).
>   */
> -int truncate_bdev_range(struct block_device *bdev, fmode_t mode,
> +int truncate_bdev_range(struct block_device *bdev, blk_mode_t mode,
>  			loff_t lstart, loff_t lend)
>  {
>  	/*
> @@ -101,14 +101,14 @@ int truncate_bdev_range(struct block_device *bdev, fmode_t mode,
>  	 * while we discard the buffer cache to avoid discarding buffers
>  	 * under live filesystem.
>  	 */
> -	if (!(mode & FMODE_EXCL)) {
> +	if (!(mode & BLK_OPEN_EXCL)) {
>  		int err = bd_prepare_to_claim(bdev, truncate_bdev_range, NULL);
>  		if (err)
>  			goto invalidate;
>  	}
>  
>  	truncate_inode_pages_range(bdev->bd_inode->i_mapping, lstart, lend);
> -	if (!(mode & FMODE_EXCL))
> +	if (!(mode & BLK_OPEN_EXCL))
>  		bd_abort_claiming(bdev, truncate_bdev_range);
>  	return 0;
>  
> @@ -647,7 +647,7 @@ static void blkdev_flush_mapping(struct block_device *bdev)
>  	bdev_write_inode(bdev);
>  }
>  
> -static int blkdev_get_whole(struct block_device *bdev, fmode_t mode)
> +static int blkdev_get_whole(struct block_device *bdev, blk_mode_t mode)
>  {
>  	struct gendisk *disk = bdev->bd_disk;
>  	int ret;
> @@ -679,7 +679,7 @@ static void blkdev_put_whole(struct block_device *bdev)
>  		bdev->bd_disk->fops->release(bdev->bd_disk);
>  }
>  
> -static int blkdev_get_part(struct block_device *part, fmode_t mode)
> +static int blkdev_get_part(struct block_device *part, blk_mode_t mode)
>  {
>  	struct gendisk *disk = part->bd_disk;
>  	int ret;
> @@ -743,11 +743,11 @@ void blkdev_put_no_open(struct block_device *bdev)
>  {
>  	put_device(&bdev->bd_device);
>  }
> -
> +	
>  /**
>   * blkdev_get_by_dev - open a block device by device number
>   * @dev: device number of block device to open
> - * @mode: FMODE_* mask
> + * @mode: open mode (BLK_OPEN_*)
>   * @holder: exclusive holder identifier
>   * @hops: holder operations
>   *
> @@ -765,7 +765,7 @@ void blkdev_put_no_open(struct block_device *bdev)
>   * RETURNS:
>   * Reference to the block_device on success, ERR_PTR(-errno) on failure.
>   */
> -struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder,
> +struct block_device *blkdev_get_by_dev(dev_t dev, blk_mode_t mode, void *holder,
>  		const struct blk_holder_ops *hops)
>  {
>  	bool unblock_events = true;
> @@ -775,8 +775,8 @@ struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder,
>  
>  	ret = devcgroup_check_permission(DEVCG_DEV_BLOCK,
>  			MAJOR(dev), MINOR(dev),
> -			((mode & FMODE_READ) ? DEVCG_ACC_READ : 0) |
> -			((mode & FMODE_WRITE) ? DEVCG_ACC_WRITE : 0));
> +			((mode & BLK_OPEN_READ) ? DEVCG_ACC_READ : 0) |
> +			((mode & BLK_OPEN_WRITE) ? DEVCG_ACC_WRITE : 0));
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> @@ -786,12 +786,12 @@ struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder,
>  	disk = bdev->bd_disk;
>  
>  	if (holder) {
> -		mode |= FMODE_EXCL;
> +		mode |= BLK_OPEN_EXCL;
>  		ret = bd_prepare_to_claim(bdev, holder, hops);
>  		if (ret)
>  			goto put_blkdev;
>  	} else {
> -		if (WARN_ON_ONCE(mode & FMODE_EXCL)) {
> +		if (WARN_ON_ONCE(mode & BLK_OPEN_EXCL)) {
>  			ret = -EIO;
>  			goto put_blkdev;
>  		}
> @@ -821,7 +821,7 @@ struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder,
>  		 * writeable reference is too fragile given the way @mode is
>  		 * used in blkdev_get/put().
>  		 */
> -		if ((mode & FMODE_WRITE) && !bdev->bd_write_holder &&
> +		if ((mode & BLK_OPEN_WRITE) && !bdev->bd_write_holder &&
>  		    (disk->event_flags & DISK_EVENT_FLAG_BLOCK_ON_EXCL_WRITE)) {
>  			bdev->bd_write_holder = true;
>  			unblock_events = false;
> @@ -848,7 +848,7 @@ EXPORT_SYMBOL(blkdev_get_by_dev);
>  /**
>   * blkdev_get_by_path - open a block device by name
>   * @path: path to the block device to open
> - * @mode: FMODE_* mask
> + * @mode: open mode (BLK_OPEN_*)
>   * @holder: exclusive holder identifier
>   *
>   * Open the block device described by the device file at @path.  If @holder is
> @@ -861,7 +861,7 @@ EXPORT_SYMBOL(blkdev_get_by_dev);
>   * RETURNS:
>   * Reference to the block_device on success, ERR_PTR(-errno) on failure.
>   */
> -struct block_device *blkdev_get_by_path(const char *path, fmode_t mode,
> +struct block_device *blkdev_get_by_path(const char *path, blk_mode_t mode,
>  		void *holder, const struct blk_holder_ops *hops)
>  {
>  	struct block_device *bdev;
> @@ -873,7 +873,7 @@ struct block_device *blkdev_get_by_path(const char *path, fmode_t mode,
>  		return ERR_PTR(error);
>  
>  	bdev = blkdev_get_by_dev(dev, mode, holder, hops);
> -	if (!IS_ERR(bdev) && (mode & FMODE_WRITE) && bdev_read_only(bdev)) {
> +	if (!IS_ERR(bdev) && (mode & BLK_OPEN_WRITE) && bdev_read_only(bdev)) {
>  		blkdev_put(bdev, holder);
>  		return ERR_PTR(-EACCES);
>  	}
> diff --git a/block/blk-zoned.c b/block/blk-zoned.c
> index 02cc2c629ac9be..0f9f97cdddd99c 100644
> --- a/block/blk-zoned.c
> +++ b/block/blk-zoned.c
> @@ -356,8 +356,8 @@ int blkdev_report_zones_ioctl(struct block_device *bdev, unsigned int cmd,
>  	return 0;
>  }
>  
> -static int blkdev_truncate_zone_range(struct block_device *bdev, fmode_t mode,
> -				      const struct blk_zone_range *zrange)
> +static int blkdev_truncate_zone_range(struct block_device *bdev,
> +		blk_mode_t mode, const struct blk_zone_range *zrange)
>  {
>  	loff_t start, end;
>  
> @@ -376,7 +376,7 @@ static int blkdev_truncate_zone_range(struct block_device *bdev, fmode_t mode,
>   * BLKRESETZONE, BLKOPENZONE, BLKCLOSEZONE and BLKFINISHZONE ioctl processing.
>   * Called from blkdev_ioctl.
>   */
> -int blkdev_zone_mgmt_ioctl(struct block_device *bdev, fmode_t mode,
> +int blkdev_zone_mgmt_ioctl(struct block_device *bdev, blk_mode_t mode,
>  			   unsigned int cmd, unsigned long arg)
>  {
>  	void __user *argp = (void __user *)arg;
> @@ -390,7 +390,7 @@ int blkdev_zone_mgmt_ioctl(struct block_device *bdev, fmode_t mode,
>  	if (!bdev_is_zoned(bdev))
>  		return -ENOTTY;
>  
> -	if (!(mode & FMODE_WRITE))
> +	if (!(mode & BLK_OPEN_WRITE))
>  		return -EBADF;
>  
>  	if (copy_from_user(&zrange, argp, sizeof(struct blk_zone_range)))
> diff --git a/block/blk.h b/block/blk.h
> index e28d5d67d31a28..768852a84fefb3 100644
> --- a/block/blk.h
> +++ b/block/blk.h
> @@ -396,7 +396,7 @@ void disk_free_zone_bitmaps(struct gendisk *disk);
>  void disk_clear_zone_settings(struct gendisk *disk);
>  int blkdev_report_zones_ioctl(struct block_device *bdev, unsigned int cmd,
>  		unsigned long arg);
> -int blkdev_zone_mgmt_ioctl(struct block_device *bdev, fmode_t mode,
> +int blkdev_zone_mgmt_ioctl(struct block_device *bdev, blk_mode_t mode,
>  		unsigned int cmd, unsigned long arg);
>  #else /* CONFIG_BLK_DEV_ZONED */
>  static inline void disk_free_zone_bitmaps(struct gendisk *disk) {}
> @@ -407,7 +407,7 @@ static inline int blkdev_report_zones_ioctl(struct block_device *bdev,
>  	return -ENOTTY;
>  }
>  static inline int blkdev_zone_mgmt_ioctl(struct block_device *bdev,
> -		fmode_t mode, unsigned int cmd, unsigned long arg)
> +		blk_mode_t mode, unsigned int cmd, unsigned long arg)
>  {
>  	return -ENOTTY;
>  }
> @@ -451,7 +451,7 @@ static inline void bio_release_page(struct bio *bio, struct page *page)
>  
>  struct request_queue *blk_alloc_queue(int node_id);
>  
> -int disk_scan_partitions(struct gendisk *disk, fmode_t mode);
> +int disk_scan_partitions(struct gendisk *disk, blk_mode_t mode);
>  
>  int disk_alloc_events(struct gendisk *disk);
>  void disk_add_events(struct gendisk *disk);
> @@ -466,8 +466,9 @@ extern struct device_attribute dev_attr_events_poll_msecs;
>  
>  extern struct attribute_group blk_trace_attr_group;
>  
> -int truncate_bdev_range(struct block_device *bdev, fmode_t mode, loff_t lstart,
> -		loff_t lend);
> +blk_mode_t file_to_blk_mode(struct file *file);
> +int truncate_bdev_range(struct block_device *bdev, blk_mode_t mode,
> +		loff_t lstart, loff_t lend);
>  long blkdev_ioctl(struct file *file, unsigned cmd, unsigned long arg);
>  long compat_blkdev_ioctl(struct file *file, unsigned cmd, unsigned long arg);
>  
> diff --git a/block/fops.c b/block/fops.c
> index 9f26e25bafa172..086612103b9dd9 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -470,6 +470,30 @@ static int blkdev_fsync(struct file *filp, loff_t start, loff_t end,
>  	return error;
>  }
>  
> +blk_mode_t file_to_blk_mode(struct file *file)
> +{
> +	blk_mode_t mode = 0;
> +
> +	if (file->f_mode & FMODE_READ)
> +		mode |= BLK_OPEN_READ;
> +	if (file->f_mode & FMODE_WRITE)
> +		mode |= BLK_OPEN_WRITE;
> +	if (file->f_mode & FMODE_EXCL)
> +		mode |= BLK_OPEN_EXCL;
> +	if (file->f_flags & O_NDELAY)
> +		mode |= BLK_OPEN_NDELAY;
> +
> +	/*
> +	 * If all bits in O_ACCMODE set (aka O_RDWR | O_WRONLY), the floppy
> +	 * driver has historically allowed ioctls as if the file was opened for
> +	 * writing, but does not allow and actual reads or writes.
> +	 */
> +	if ((file->f_flags & O_ACCMODE) == (O_RDWR | O_WRONLY))
> +		mode |= BLK_OPEN_WRITE_IOCTL;

Thanks for that!
Reviewed-by: Christian Brauner <brauner@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
