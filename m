Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA8D1E8048
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2020 16:33:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jeg4l-00005I-Ha; Fri, 29 May 2020 14:33:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hch@lst.de>) id 1jeg4j-0008WO-Lz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 14:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pAFqDBl/8ke8NBa7VjWOkBDyD8eEitkoCLex2aL190E=; b=fb+IRRu/TufCY6mT1Hf54Gr0Ex
 PcXcMAua2wS1Zq2xWlpBEIz/n4b8hdCNAG6DvW/hsZJihK9X20oxOdSLcILFHVg0EgMHYHq4dqk1t
 tYyGLk9jXHA5H/S+mCVIQ87DsG15qqF4YyoQuHZgv9K0nPTQC/FCB3iHaUVDVal/JA+8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pAFqDBl/8ke8NBa7VjWOkBDyD8eEitkoCLex2aL190E=; b=XhI88ZEhxKMfgWthoJ7shjJqUU
 geToSQRR6qcwFjcAENotFg/4Ld8wPLIoQE0p1yq09EOIIH1Vy24+AHIX2mhIp7jk+tPmxllpLP6ye
 NWT/Sj8Uil2Nj7zBEFbBTom9paOkb3bnp5eU/gEzDPsAdwUO7iMce88OmC2vH0gWzLbk=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jeg4h-002n5R-GM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 14:33:33 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0963868B02; Fri, 29 May 2020 16:15:56 +0200 (CEST)
Date: Fri, 29 May 2020 16:15:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kaitao Cheng <pilgrimtao@gmail.com>
Message-ID: <20200529141555.GA3249@lst.de>
References: <20200529141100.37519-1-pilgrimtao@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200529141100.37519-1-pilgrimtao@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [213.95.11.211 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jeg4h-002n5R-GM
Subject: Re: [f2fs-dev] [PATCH v2] blkdev: Replace blksize_bits() with
 ilog2()
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
Cc: hoeppner@linux.ibm.com, heiko.carstens@de.ibm.com,
 linux-nvme@lists.infradead.org, dhowells@redhat.com, clm@fb.com,
 deepa.kernel@gmail.com, houtao1@huawei.com, hch@lst.de,
 linux-s390@vger.kernel.org, bvanassche@acm.org, darrick.wong@oracle.com,
 mark@fasheh.com, satyat@google.com, hch@infradead.org, borntraeger@de.ibm.com,
 gor@linux.ibm.com, chaitanya.kulkarni@wdc.com, josef@toxicpanda.com,
 ming.lei@redhat.com, viro@zeniv.linux.org.uk, songmuchun@bytedance.com,
 dsterba@suse.com, jaegeuk@kernel.org, jlbec@evilplan.org, sagi@grimberg.me,
 axboe@kernel.dk, balbi@kernel.org, damien.lemoal@wdc.com,
 martin.petersen@oracle.com, joseph.qi@linux.alibaba.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, asml.silence@gmail.com,
 linux-btrfs@vger.kernel.org, sth@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>  	ns->size = i_size_read(ns->bdev->bd_inode);
> -	ns->blksize_shift = blksize_bits(bdev_logical_block_size(ns->bdev));
> +	ns->blksize_shift = ilog2(bdev_logical_block_size(ns->bdev));

This should just be:

	ns->blksize_shift = ns->bdev->bd_inode->i_blkbits;

> diff --git a/drivers/s390/block/dasd_ioctl.c b/drivers/s390/block/dasd_ioctl.c
> index 777734d1b4e5..55adb134451b 100644
> --- a/drivers/s390/block/dasd_ioctl.c
> +++ b/drivers/s390/block/dasd_ioctl.c
> @@ -228,7 +228,7 @@ dasd_format(struct dasd_block *block, struct format_data_t *fdata)
>  	 */
>  	if (fdata->start_unit == 0) {
>  		struct block_device *bdev = bdget_disk(block->gdp, 0);
> -		bdev->bd_inode->i_blkbits = blksize_bits(fdata->blksize);
> +		bdev->bd_inode->i_blkbits = ilog2(fdata->blksize);

This also needs to set bdev->bd_block_size, so this probably warrants
a separate fix that be backported.  It might be nice to split out
a helper that sets bd_block_size and bd_inode->i_blkbits together
so that such a use is more obvious.

>  	} else if (inode->i_bdev) {
>  		blksize = bdev_logical_block_size(inode->i_bdev);
> -		blkbits = blksize_bits(blksize);
> +		blkbits = ilog2(blksize);

This can just use inode->i_bdev->bd_inode->i_blkbits.

> diff --git a/fs/buffer.c b/fs/buffer.c
> index fc8831c392d7..fa92e0afe349 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -907,7 +907,7 @@ static sector_t blkdev_max_block(struct block_device *bdev, unsigned int size)
>  	loff_t sz = i_size_read(bdev->bd_inode);
>  
>  	if (sz) {
> -		unsigned int sizebits = blksize_bits(size);
> +		unsigned int sizebits = ilog2(size);

bdev->bd_inode->i_blkbits.

> diff --git a/fs/direct-io.c b/fs/direct-io.c
> index 1543b5af400e..7ea2cd3effcc 100644
> --- a/fs/direct-io.c
> +++ b/fs/direct-io.c
> @@ -1148,7 +1148,7 @@ do_blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
>  
>  	if (align & blocksize_mask) {
>  		if (bdev)
> -			blkbits = blksize_bits(bdev_logical_block_size(bdev));
> +			blkbits = ilog2(bdev_logical_block_size(bdev));

bdev->bd_inode->i_blkbits.

> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index cb05f71cf850..b896da27942a 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3458,7 +3458,7 @@ static int check_direct_IO(struct inode *inode, struct iov_iter *iter,
>  
>  	if (align & blocksize_mask) {
>  		if (bdev)
> -			blkbits = blksize_bits(bdev_logical_block_size(bdev));
> +			blkbits = ilog2(bdev_logical_block_size(bdev));

bdev->bd_inode->i_blkbits.

>  		blocksize_mask = (1 << blkbits) - 1;
>  		if (align & blocksize_mask)
>  			return -EINVAL;
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index ec7b78e6feca..2a807657d544 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -203,7 +203,7 @@ static loff_t
>  iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
>  		struct iomap_dio *dio, struct iomap *iomap)
>  {
> -	unsigned int blkbits = blksize_bits(bdev_logical_block_size(iomap->bdev));
> +	unsigned int blkbits = ilog2(bdev_logical_block_size(iomap->bdev));

iomap->bdev->bd_inode->i_blkbits.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
