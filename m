Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D042D749283
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jul 2023 02:18:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHChf-0005Jy-KO;
	Thu, 06 Jul 2023 00:18:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qHChS-0005Jk-3b
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=alYDHXe2e+k/tojQ7MHzrdHcD4NmnEyGxU58Ive1vpM=; b=bQmhQld0OV7SRyxpN6LzFKaoTf
 1i9uoANs7X3uN0WyUkneyPpOJy+1m+Eo6pJXRCbAG4lz0GyRtzgfO8mApUDf0NE4KaxbH5LQ7ZGU8
 8RyKva+mVi9G7kTtewR82yLWREuQd/wziF2Vi1b8sunkKQcgysBcHwjzo3o6sGJMh6tY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=alYDHXe2e+k/tojQ7MHzrdHcD4NmnEyGxU58Ive1vpM=; b=E4ErJGzdgFZnH8r3x/BIA4yah0
 N83EonohL2l9jv91WqD1IJ2rZ927fqYRPgbMl5KJv+YlFTO0DbegfsHUej2aNzwm9jqi/mXXvpOYB
 Lio78Q/nZeGDq+ppbuuadOr02M+HP2Q1uR7QJLf8KmHeZlcWqKHMQoHLBOhC/eVKcxP4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHChR-0006GD-NK for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 797AE617AA;
 Thu,  6 Jul 2023 00:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C33B1C433C8;
 Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688602694;
 bh=UCIqkh07H9RodI2FiYHSloPcTyNTNSp1TtLBvzeAlzY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XD5s9qgQk+bezWq3JBvoy9wmXJ5ZRyDVTHkpXWgLVO3OxVcBH0YyZg8Gz6rb+KfwN
 /A+CNNvgWQMrDzOs56n2cEhwU0PkBRXiccPcVu64Aq1yBYBPWYZC4FuTB8N5QK1KQ+
 MdmDcn18RW7d50qJnG0uAgWsSoPksgnrlWtl7DDURyh0pmkik5uADq73uLJFx1EI+5
 TxJjuarqz28vf+B0YnRKEqs2EnBb9P4N1MwtPeCMbPEFDapDEj1dai8Lh/Uv6asayt
 1cEnsHDnrwJGGhdMLNNVih3y+j4HdKbkLcado1IWcst06dccj5qYciZqXhBkSg0rUM
 /tfAjpbujjdzA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A1405C64459; Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168860269464.29151.2364164271547941172.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jul 2023 00:18:14 +0000
References: <20230608110258.189493-2-hch@lst.de>
In-Reply-To: <20230608110258.189493-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jens Axboe <axboe@kernel.dk>: On Thu, 8 Jun 2023 13:02:29 +0200 you wrote:
 > For whole devices ->open is called for each open, but for partitions it
 > is only called on the first open of a partition, e.g.: > > open("/dev/vdb", 
 ... [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHChR-0006GD-NK
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
Cc: vigneshr@ti.com, rafael@kernel.org, linux-nvme@lists.infradead.org,
 phil@philpotter.co.uk, clm@fb.com, dm-devel@redhat.com, haris.iqbal@ionos.com,
 pavel@ucw.cz, miquel.raynal@bootlin.com, jinpu.wang@ionos.com,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org, richard@nod.at,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org, josef@toxicpanda.com,
 colyli@suse.de, linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 viro@zeniv.linux.org.uk, dsterba@suse.com, axboe@kernel.dk, brauner@kernel.org,
 martin.petersen@oracle.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-btrfs@vger.kernel.org, hare@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jens Axboe <axboe@kernel.dk>:

On Thu,  8 Jun 2023 13:02:29 +0200 you wrote:
> For whole devices ->open is called for each open, but for partitions it
> is only called on the first open of a partition, e.g.:
> 
>   open("/dev/vdb", ...)
>   open("/dev/vdb", ...)
>     - 2 call to ->open
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,01/30] block: also call ->open for incremental partition opens
    https://git.kernel.org/jaegeuk/f2fs/c/9d1c92872e70
  - [f2fs-dev,02/30] cdrom: remove the unused bdev argument to cdrom_open
    https://git.kernel.org/jaegeuk/f2fs/c/764b83100b9a
  - [f2fs-dev,03/30] cdrom: remove the unused mode argument to cdrom_ioctl
    https://git.kernel.org/jaegeuk/f2fs/c/473399b50de1
  - [f2fs-dev,04/30] cdrom: remove the unused cdrom_close_write release code
    https://git.kernel.org/jaegeuk/f2fs/c/a4cec8bc14c0
  - [f2fs-dev,05/30] cdrom: track if a cdrom_device_info was opened for data
    https://git.kernel.org/jaegeuk/f2fs/c/8cdf433e2b8e
  - [f2fs-dev,06/30] cdrom: remove the unused mode argument to cdrom_release
    https://git.kernel.org/jaegeuk/f2fs/c/7ae24fcee992
  - [f2fs-dev,07/30] block: pass a gendisk on bdev_check_media_change
    https://git.kernel.org/jaegeuk/f2fs/c/444aa2c58cb3
  - [f2fs-dev,08/30] block: pass a gendisk to ->open
    https://git.kernel.org/jaegeuk/f2fs/c/d32e2bf83791
  - [f2fs-dev,09/30] block: remove the unused mode argument to ->release
    https://git.kernel.org/jaegeuk/f2fs/c/ae220766d87c
  - [f2fs-dev,10/30] block: rename blkdev_close to blkdev_release
    https://git.kernel.org/jaegeuk/f2fs/c/7ee34cbc291a
  - [f2fs-dev,11/30] swsusp: don't pass a stack address to blkdev_get_by_path
    https://git.kernel.org/jaegeuk/f2fs/c/c889d0793d9d
  - [f2fs-dev,12/30] bcache: don't pass a stack address to blkdev_get_by_path
    https://git.kernel.org/jaegeuk/f2fs/c/29499ab060fe
  - [f2fs-dev,13/30] rnbd-srv: don't pass a holder for non-exclusive blkdev_get_by_path
    https://git.kernel.org/jaegeuk/f2fs/c/5ee607675deb
  - [f2fs-dev,14/30] btrfs: don't pass a holder for non-exclusive blkdev_get_by_path
    https://git.kernel.org/jaegeuk/f2fs/c/2ef789288afd
  - [f2fs-dev,15/30] block: use the holder as indication for exclusive opens
    https://git.kernel.org/jaegeuk/f2fs/c/2736e8eeb0cc
  - [f2fs-dev,16/30] block: add a sb_open_mode helper
    https://git.kernel.org/jaegeuk/f2fs/c/3f0b3e785e8b
  - [f2fs-dev,17/30] fs: remove sb->s_mode
    https://git.kernel.org/jaegeuk/f2fs/c/81b1fb7d17c0
  - [f2fs-dev,18/30] scsi: replace the fmode_t argument to scsi_cmd_allowed with a simple bool
    https://git.kernel.org/jaegeuk/f2fs/c/5f4eb9d5413f
  - [f2fs-dev,19/30] scsi: replace the fmode_t argument to scsi_ioctl with a simple bool
    https://git.kernel.org/jaegeuk/f2fs/c/2e80089c1824
  - [f2fs-dev,20/30] scsi: replace the fmode_t argument to ->sg_io_fn with a simple bool
    https://git.kernel.org/jaegeuk/f2fs/c/1991299e49fa
  - [f2fs-dev,21/30] nvme: replace the fmode_t argument to the nvme ioctl handlers with a simple bool
    https://git.kernel.org/jaegeuk/f2fs/c/7d9d7d59d44b
  - [f2fs-dev,22/30] mtd: block: use a simple bool to track open for write
    https://git.kernel.org/jaegeuk/f2fs/c/658afed19cee
  - [f2fs-dev,23/30] rnbd-srv: replace sess->open_flags with a "bool readonly"
    https://git.kernel.org/jaegeuk/f2fs/c/99b07780814e
  - [f2fs-dev,24/30] ubd: remove commented out code in ubd_open
    https://git.kernel.org/jaegeuk/f2fs/c/bd6abfc8e789
  - [f2fs-dev,25/30] block: move a few internal definitions out of blkdev.h
    https://git.kernel.org/jaegeuk/f2fs/c/cfb425761c79
  - [f2fs-dev,26/30] block: remove unused fmode_t arguments from ioctl handlers
    https://git.kernel.org/jaegeuk/f2fs/c/5e4ea834676e
  - [f2fs-dev,27/30] block: replace fmode_t with a block-specific type for block open flags
    https://git.kernel.org/jaegeuk/f2fs/c/05bdb9965305
  - [f2fs-dev,28/30] block: always use I_BDEV on file->f_mapping->host to find the bdev
    https://git.kernel.org/jaegeuk/f2fs/c/4e762d862344
  - [f2fs-dev,29/30] block: store the holder in file->private_data
    https://git.kernel.org/jaegeuk/f2fs/c/ee3249a8ce78
  - [f2fs-dev,30/30] fs: remove the now unused FMODE_* flags
    https://git.kernel.org/jaegeuk/f2fs/c/0733ad800291

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
