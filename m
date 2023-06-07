Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1717257C9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 10:34:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6ocW-0005KZ-Hu;
	Wed, 07 Jun 2023 08:34:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1q6ocU-0005JY-KX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 08:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jdBm5kt01ClfCkksSpKK2gFmzKFcQxazpE+ysPIWBGc=; b=WPdaOJ1EVhJr5IcxwBJ2/HAa4I
 izaihrEROo/i+omJHlU+8FYIH9u1yMI6AKGV92noJZDhvRhjyt4CtT8vA6s2IlUrBGmZV5R+46T+s
 8MVN5um67rkxm3nTRj6MuGJlEfungZgRizRuYwOTcG05bwSBJErWmUo7eo8snLPdiHV8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jdBm5kt01ClfCkksSpKK2gFmzKFcQxazpE+ysPIWBGc=; b=Bmw0/69b2zVxZD46gNUHxYBmOL
 ed7OLPc2qa3Ar/CcdVt2KZAMn4ffSfsSuAJmoB/QR/MQQKRmASkpS+irIYgxDYfjb3d0ZWpELTDNA
 itIXpBetPOFyEbh8RQexnXpHlPo1WMYH/jAUbNI3VxNRWZR/u/PqBKv9s0YhPMoNvl6Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6ocU-00DVpN-Oc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 08:34:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FAAE63818;
 Wed,  7 Jun 2023 08:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A10C433D2;
 Wed,  7 Jun 2023 08:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686126852;
 bh=WLIiOy1LVRNyW0WZKHMIEfuQqspHlo5YhO+pF9gbKTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DOuWu1dlGBSnRsTIERY3XMHE9OvetSc+XVDTNH9LUt5Ur7MEzWHQldJkC0OjFF39K
 8gGF0zsP8mAReVRRLxbA3ZDMv8aReZJfLmnxqg2TjHMWlP4lcMK9VVsvtBUjxWcffe
 iriT6wbTkvybZ5ExwZT785rTN0BZKNtthQHc5REmf28J1I7IlqVDJgibRROBA8W6ym
 o7kZewH3FWNgkyfATBHcyXzIU6aVOCyONuL3m8m1iO12qt2laJZWwD1ve/kVe3HC7N
 SAc45LJ2WAm7wX6H10W0XR8XlHHzXCy54pHlLC7qCDuxE5H2tx4uNHCy0AYTeLwOxb
 XjEhfMSt+EF+Q==
Date: Wed, 7 Jun 2023 10:34:04 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230607-einlieferung-beantragen-062729bc8f6c@brauner>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-10-hch@lst.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 06, 2023 at 09:39:28AM +0200, Christoph Hellwig
 wrote: > ->open is only called on the whole device. Make that explicit by
 Ok, that answers my question in
 https://lore.kernel.org/all/20230607-chefsessel-angeordnet-269f0596f9b3@brauner
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
X-Headers-End: 1q6ocU-00DVpN-Oc
Subject: Re: [f2fs-dev] [PATCH 09/31] block: pass a gendisk to ->open
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

On Tue, Jun 06, 2023 at 09:39:28AM +0200, Christoph Hellwig wrote:
> ->open is only called on the whole device.  Make that explicit by

Ok, that answers my question in
https://lore.kernel.org/all/20230607-chefsessel-angeordnet-269f0596f9b3@brauner

> passing a gendisk instead of the block_device.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index a1688eba7e5e9a..1366eea881860e 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1386,7 +1386,7 @@ struct block_device_operations {
>  	void (*submit_bio)(struct bio *bio);
>  	int (*poll_bio)(struct bio *bio, struct io_comp_batch *iob,
>  			unsigned int flags);
> -	int (*open) (struct block_device *, fmode_t);
> +	int (*open)(struct gendisk *disk, fmode_t mode);
>  	void (*release) (struct gendisk *, fmode_t);
>  	int (*ioctl) (struct block_device *, fmode_t, unsigned, unsigned long);
>  	int (*compat_ioctl) (struct block_device *, fmode_t, unsigned, unsigned long);

Looks good to me,
Acked-by: Christian Brauner <brauner@kernel.org>

(I didn't bother going through all the individual conversions.)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
