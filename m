Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77149725F68
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 14:29:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6sHs-0008Cu-UO;
	Wed, 07 Jun 2023 12:29:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hare@suse.de>) id 1q6sHq-0008Cn-II
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 12:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+NXFD7tK19U/km1dvM1TqrNDaxi8TnBZKN3pwKYh7bg=; b=YoFc9LOEyZ7HU5e7+yKEasM5a/
 a6F5hV5zlf0KnyRmQNKqC+q3PVosnbeuUD+GvD4JP8K9cF7Ah/ZUdLBqlMdOHUk5Y5Sa9sZXO4koq
 puI6YLimaChF5eqLAp/jejlY5GOBddR/6EJAXGdnZujASXk4/AfWLiXuu1hrU+0HsdCM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+NXFD7tK19U/km1dvM1TqrNDaxi8TnBZKN3pwKYh7bg=; b=EuNskoUAcdKXHGjqUdEXSDMKaC
 OIPGN4ZGTOiOFS1xFAbLd4V0IZf2/uRJ7iFLhF8r8p52BdruOkbFBpBlEAjU2i2Vk8jAoCgjfrR++
 guPnyOZZmSIg2vam/EblK7rIm3tMcpsgHu2CkCz83RF68wbk0ZtZHG4mEzPGIVfdqv2U=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6sHp-0003gO-ST for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 12:29:14 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9B91C219E0;
 Wed,  7 Jun 2023 12:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686140947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NXFD7tK19U/km1dvM1TqrNDaxi8TnBZKN3pwKYh7bg=;
 b=D+bVusfixROdFRhZj7Gm32vf6nTWDMSSzJfTRi50B/2LNNRitehn0JGhZsGotTAyYt87Bx
 NWYyvr9Ov4qnxE9QA80piLbIwqsP6xLCWfFFOEfdtYTV7w8CCMXeEmox8sfL1yHMjHzwBw
 89mLO0+2N8iDZa/tZ7q2dCVCM1RS6Qs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686140947;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NXFD7tK19U/km1dvM1TqrNDaxi8TnBZKN3pwKYh7bg=;
 b=kIiNhRufIqKqREi/FFsC6HuCVpqDds10Ql5+QSsqZIqvjGBGRBJM3qVyYeDSJ+qeyfv1Ec
 jELBtRQvTWOS0fCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 520DB13776;
 Wed,  7 Jun 2023 12:29:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cBHGEhN4gGTwRQAAMHmgww
 (envelope-from <hare@suse.de>); Wed, 07 Jun 2023 12:29:07 +0000
Message-ID: <a17bacdb-3fa2-3b81-8852-efc06f788885@suse.de>
Date: Wed, 7 Jun 2023 14:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-17-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230606073950.225178-17-hch@lst.de>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/6/23 09:39,
 Christoph Hellwig wrote: > The current interface
 for exclusive opens is rather confusing as it > requires both the FMODE_EXCL
 flag and a holder. Remove the need to pass > FMODE_EXCL a [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q6sHp-0003gO-ST
Subject: Re: [f2fs-dev] [PATCH 16/31] block: use the holder as indication
 for exclusive opens
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
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/6/23 09:39, Christoph Hellwig wrote:
> The current interface for exclusive opens is rather confusing as it
> requires both the FMODE_EXCL flag and a holder.  Remove the need to pass
> FMODE_EXCL and just key off the exclusive open off a non-NULL holder.
> 
> For blkdev_put this requires adding the holder argument, which provides
> better debug checking that only the holder actually releases the hold,
> but at the same time allows removing the now superfluous mode argument.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/bdev.c                        | 37 ++++++++++++++++------------
>   block/fops.c                        |  6 +++--
>   block/genhd.c                       |  5 ++--
>   block/ioctl.c                       |  5 ++--
>   drivers/block/drbd/drbd_nl.c        | 23 ++++++++++-------
>   drivers/block/pktcdvd.c             | 13 +++++-----
>   drivers/block/rnbd/rnbd-srv.c       |  4 +--
>   drivers/block/xen-blkback/xenbus.c  |  2 +-
>   drivers/block/zram/zram_drv.c       |  8 +++---
>   drivers/md/bcache/super.c           | 15 ++++++------
>   drivers/md/dm.c                     |  6 ++---
>   drivers/md/md.c                     | 38 +++++++++++++++--------------
>   drivers/mtd/devices/block2mtd.c     |  4 +--
>   drivers/nvme/target/io-cmd-bdev.c   |  2 +-
>   drivers/s390/block/dasd_genhd.c     |  2 +-
>   drivers/target/target_core_iblock.c |  6 ++---
>   drivers/target/target_core_pscsi.c  |  8 +++---
>   fs/btrfs/dev-replace.c              |  6 ++---
>   fs/btrfs/ioctl.c                    | 12 ++++-----
>   fs/btrfs/volumes.c                  | 28 ++++++++++-----------
>   fs/btrfs/volumes.h                  |  6 ++---
>   fs/erofs/super.c                    |  7 +++---
>   fs/ext4/super.c                     | 11 +++------
>   fs/f2fs/super.c                     |  2 +-
>   fs/jfs/jfs_logmgr.c                 |  6 ++---
>   fs/nfs/blocklayout/dev.c            |  4 +--
>   fs/nilfs2/super.c                   |  6 ++---
>   fs/ocfs2/cluster/heartbeat.c        |  4 +--
>   fs/reiserfs/journal.c               | 19 +++++++--------
>   fs/reiserfs/reiserfs.h              |  1 -
>   fs/super.c                          | 20 +++++++--------
>   fs/xfs/xfs_super.c                  | 15 ++++++------
>   include/linux/blkdev.h              |  2 +-
>   kernel/power/hibernate.c            | 12 +++------
>   kernel/power/power.h                |  2 +-
>   kernel/power/swap.c                 | 21 +++++++---------
>   mm/swapfile.c                       |  7 +++---
>   37 files changed, 183 insertions(+), 192 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
