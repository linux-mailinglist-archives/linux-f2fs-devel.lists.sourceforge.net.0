Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33982787DE4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 04:45:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZMpN-0005E4-Il;
	Fri, 25 Aug 2023 02:45:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1qZMpK-0005Dy-VH
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 02:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BAs3vHnqB82jyF9T0JKZy08jGuQDnnwXLjj44ySrvFg=; b=QbwWJMgt2B2WOAZTBkthdK1G5r
 wwcIsqoGAkI+TPQqhqy5UVhFaKUvF+mgQ0XUGR99ejDn3nnP3LIO8NdCZIhOqhMxKZB7GUHkTgIMZ
 L8HuYsAKHmfB0wh8ZR3Ww0VQ04UyYqyYeJYyCOAh8DglZvAteXvgeLk4W+ScDctAG3E4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BAs3vHnqB82jyF9T0JKZy08jGuQDnnwXLjj44ySrvFg=; b=LI1q3nnFSGttjg/LCm6cxCTH4h
 9kiJQrC8DCSbLpPy5Zhq8B1QbfgdsP0RZZwLpW9pwo1DYc0BTtskMPzXxs4bRZiFIdwNJzy7doGa0
 oPG6eAQ9f0/ZkaMzbzUBnUDy51GM/HhzFMHEB80ezNM9Q+G9FC8khqkUg+I6kOn6Duc8=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZMpF-00085B-Kh for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 02:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BAs3vHnqB82jyF9T0JKZy08jGuQDnnwXLjj44ySrvFg=; b=qG/yF0qNQFz1HErcIOwDpMsE95
 yvpWaJiccPJne5E6IKKdLk49il4mSFXaxO10+cPRq4RqC2mgW99o+1yf2c4bs81MOg47gz2QA9ZFT
 aLJydE8tWV8lzCMv2+NeX7mQCMknUB5EhVQiqQN5lBaCEsUTiWdC5wvrGaIvwhXVRrB8AFK90tiyv
 FLjfEbnlTWQpGxkRRGa9YbyGmW5wSGD0SSIG8KNS+lDxJs8er6W0jn8lCxtIFwizoom7apeGKhs9v
 c0WlIDcCZSTbrPU9y3Jy4WWr/hC4ZjXs2RvO1eOF4P2UntF/l1INZ+xsvc1Hck8kt4ukocelH0IdQ
 bSBNV7lw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qZMoj-000edp-26; Fri, 25 Aug 2023 02:44:57 +0000
Date: Fri, 25 Aug 2023 03:44:57 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230825024457.GD95084@ZenIV>
References: <20230608110258.189493-1-hch@lst.de>
 <20230608110258.189493-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230608110258.189493-2-hch@lst.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 08, 2023 at 01:02:29PM +0200, Christoph Hellwig
 wrote: > --- a/block/bdev.c > +++ b/block/bdev.c > @@ -683, 9 +683, 6 @@ static
 int blkdev_get_part(struct block_device *part, fmode_t mode) > struct gendisk
 *disk = part->bd_disk; > int ret; > > - if (atomic_ [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qZMpF-00085B-Kh
Subject: Re: [f2fs-dev] [PATCH 01/30] block: also call ->open for
 incremental partition opens
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
 Hannes Reinecke <hare@suse.de>, David Sterba <dsterba@suse.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 08, 2023 at 01:02:29PM +0200, Christoph Hellwig wrote:

> --- a/block/bdev.c
> +++ b/block/bdev.c
> @@ -683,9 +683,6 @@ static int blkdev_get_part(struct block_device *part, fmode_t mode)
>  	struct gendisk *disk = part->bd_disk;
>  	int ret;
>  
> -	if (atomic_read(&part->bd_openers))
> -		goto done;
> -
>  	ret = blkdev_get_whole(bdev_whole(part), mode);
>  	if (ret)
>  		return ret;
> @@ -694,9 +691,10 @@ static int blkdev_get_part(struct block_device *part, fmode_t mode)
>  	if (!bdev_nr_sectors(part))
>  		goto out_blkdev_put;
>  
> -	disk->open_partitions++;
> -	set_init_blocksize(part);
> -done:
> +	if (!atomic_read(&part->bd_openers)) {
> +		disk->open_partitions++;
> +		set_init_blocksize(part);
> +	}

[with apologies for very late (and tangential) reply]

That got me curious about the ->bd_openers - do we need it atomic?
Most of the users (and all places that do modifications) are
under ->open_mutex; the only exceptions are
	* early sync logics in blkdev_put(); it's explicitly racy -
see the comment there.
	* callers of disk_openers() in loop and nbd (the ones in
zram are under ->open_mutex).  There's driver-private exclusion
around those, but in any case - READ_ONCE() is no worse than
atomic_read() in those cases.

Is there something subtle I'm missing here?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
