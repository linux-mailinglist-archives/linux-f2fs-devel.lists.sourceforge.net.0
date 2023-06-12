Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9438972C985
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 17:15:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8jFy-0004yN-96;
	Mon, 12 Jun 2023 15:14:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1q8jFw-0004yH-3f
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 15:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4muTChvfXbyFleywXuJztp663UoDJyd/b1njxzLhqy8=; b=X+EC/7dXp8R7ds2Rnhk+D3vS6A
 Fm1gD43g7pj2GtxReGoIX4Q+4U+PLVZB03+7Pu12OD+iNkfQWXbJFZuZMbPXOJG5FJeeyjtrTfjbY
 H7wlksooqJcZcbP6bedvX8fdUI++DaJnclppogKnsoskqgW4EOmsvaCmEd/vltmlLUD0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:
 Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4muTChvfXbyFleywXuJztp663UoDJyd/b1njxzLhqy8=; b=Bcw8rdLkOA+a7Z7F+h04mwsVjg
 wQGiQ+Q8ygZnNWTXUkfSSe2tieMoRUaGPVnMVJzU9AEq7ewkuTZhRVgZbLndwKSzTY9Ev+RXscHnZ
 ZK4q43DuQXNcSHgtopIGgFsM3FO2vY9hqXJXXoc8+WRB8PI7T6hwnR6toO9eFRZ8z630=;
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q8jFt-000pm1-PY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 15:14:56 +0000
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-39c40b94fedso286995b6e.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Jun 2023 08:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1686582888; x=1689174888;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4muTChvfXbyFleywXuJztp663UoDJyd/b1njxzLhqy8=;
 b=ngHTI4dqetCocXTjyMpDGPf4WRMmKhv2peYcEd3Es3u4pSnaJLLQHVkuLeco/scl2O
 TTtvNM/14fZTQh7pB4Fzpu1E1tDXgevgiV1AiS0qoYzFqvtAccrRWpHMM690Ld3uxijC
 3y1si+xVCg4g3S9u1sZHPykEyE8qcOIPTfbZNMg7+vdnfKivtScT8+ZXRDxaq6Au9tui
 2RPQ1hMoVPR6/W83Jf5+QG9jJWy6HJcC5tuJix22XrGF/LIyuHy8Gu7q9GpHoT/vPXQN
 W3J8PfXtMVAQh/Zm/YaTVJ3OuTTHD7xMiPt7RtH1Z/PAYCHB1jzVD1fGkK1GfAVzh5vm
 OS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686582888; x=1689174888;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4muTChvfXbyFleywXuJztp663UoDJyd/b1njxzLhqy8=;
 b=bJLU1Uv7HSFnUZwjR0k94ZAHzdqeCsx3pmHb+s03d5CHo0YDHxZ2bGW5lvVuB9I9M/
 tzdZLr1MCCHtza/Bzu1lDbQzGlsCNmsEVDtginCioQqVuVYKhiSoqIwh3NbzitG5f/2f
 h+EreEW1BsZV6eY2ufV7/C2btHGZMKWmwyU30yzgRcU4C58H0P5xZkPMj85GXgdCv1t+
 L+PDtGNKXBxwiez2VOQUaofwdA/2aaOmSBybc6iHbI3bXm37hOR+wcwR5ZrUQLV6yFgp
 BEnc4lnweUG76JvKLf4RmcvdDYaOxT0cEtEYfcEH7IRo6lC2A++87MTyRbo4RX/N8Wck
 Irog==
X-Gm-Message-State: AC+VfDw2dcq8PkLmNKuLWO2rbo9IY56VeY3T+wHRrcfpTn1/aHHH/rbW
 bvPfdCd/j6jgfEAMhxdJxtY6t1pIQtC8OLl+OUM=
X-Google-Smtp-Source: ACHHUZ7oss5Q4qEAESR1LIaLJkD7ZwONVfsRpFehVo9Ss1V9OTMOTrOh14yI7Krm7Ivy+/EbDcrm4g==
X-Received: by 2002:a6b:690a:0:b0:77a:ee79:652 with SMTP id
 e10-20020a6b690a000000b0077aee790652mr4231482ioc.1.1686579107952; 
 Mon, 12 Jun 2023 07:11:47 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
 i19-20020a02cc53000000b0041408b79f1esm2793007jaq.111.2023.06.12.07.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 07:11:47 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20230608110258.189493-1-hch@lst.de>
References: <20230608110258.189493-1-hch@lst.de>
Message-Id: <168657910650.933808.4041515037046679285.b4-ty@kernel.dk>
Date: Mon, 12 Jun 2023 08:11:46 -0600
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-c6835
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 08 Jun 2023 13:02:28 +0200, Christoph Hellwig wrote:
 > this series adds a new blk_mode_t for block open flags instead of abusing
 > fmode_t. The block open flags work very different from the no [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.176 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q8jFt-000pm1-PY
Subject: Re: [f2fs-dev] decouple block open flags from fmode_t v2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On Thu, 08 Jun 2023 13:02:28 +0200, Christoph Hellwig wrote:
> this series adds a new blk_mode_t for block open flags instead of abusing
> fmode_t.  The block open flags work very different from the normal use of
> fmode_t and only share the basic READ/WRITE flags with it.  None of the
> other normal FMODE_* flags is used, but instead there are three
> block-specific ones not used by anyone else, which can now be removed.
> 
> Note that I've only CCed maintainers and lists for drivers and file systems
> that have non-trivial changes, as otherwise the series would spam literally
> everyone in the block and file system world.
> 
> [...]

Applied, thanks!

[01/30] block: also call ->open for incremental partition opens
        commit: 9d1c92872e7082f100f629a58b32fa0214aa1aec
[02/30] cdrom: remove the unused bdev argument to cdrom_open
        commit: 764b83100b9aff52f950e408539c22a37cdedae8
[03/30] cdrom: remove the unused mode argument to cdrom_ioctl
        commit: 473399b50de1fdc12606254351273c71d1786251
[04/30] cdrom: remove the unused cdrom_close_write release code
        commit: a4cec8bc14c02e15006a71f02b0e1bbc72b9f796
[05/30] cdrom: track if a cdrom_device_info was opened for data
        commit: 8cdf433e2b8e4fc6c7b4393deb93fb258175d537
[06/30] cdrom: remove the unused mode argument to cdrom_release
        commit: 7ae24fcee9929f9002b84d8121144b2b3590b58c
[07/30] block: pass a gendisk on bdev_check_media_change
        commit: 444aa2c58cb3b6cfe3b7cc7db6c294d73393a894
[08/30] block: pass a gendisk to ->open
        commit: d32e2bf83791727a84ad5d3e3d713e82f9adbe30
[09/30] block: remove the unused mode argument to ->release
        commit: ae220766d87cd6799dbf918fea10613ae14c0654
[10/30] block: rename blkdev_close to blkdev_release
        commit: 7ee34cbc291a28134b60683b246ba58b4b676ec3
[11/30] swsusp: don't pass a stack address to blkdev_get_by_path
        commit: c889d0793d9dc07e94a5fddcc05356157fab00b7
[12/30] bcache: don't pass a stack address to blkdev_get_by_path
        commit: 29499ab060fec044161be73fb0e448eab97b4813
[13/30] rnbd-srv: don't pass a holder for non-exclusive blkdev_get_by_path
        commit: 5ee607675debef509946f8a251d4c30a21493ec2
[14/30] btrfs: don't pass a holder for non-exclusive blkdev_get_by_path
        commit: 2ef789288afd365f4245ba97e56189062de5148e
[15/30] block: use the holder as indication for exclusive opens
        commit: 2736e8eeb0ccdc71d1f4256c9c9a28f58cc43307
[16/30] block: add a sb_open_mode helper
        commit: 3f0b3e785e8b54a40c530fa77b7ab37bec925c57
[17/30] fs: remove sb->s_mode
        commit: 81b1fb7d17c0110df839e13468ada9e99bb6e5f4
[18/30] scsi: replace the fmode_t argument to scsi_cmd_allowed with a simple bool
        commit: 5f4eb9d5413fdfc779c099fdaf0ff417eb163145
[19/30] scsi: replace the fmode_t argument to scsi_ioctl with a simple bool
        commit: 2e80089c18241699c41d0af0669cb93844ff0dc1
[20/30] scsi: replace the fmode_t argument to ->sg_io_fn with a simple bool
        commit: 1991299e49fa58c3ba7e91599932f84bf537d592
[21/30] nvme: replace the fmode_t argument to the nvme ioctl handlers with a simple bool
        commit: 7d9d7d59d44b7e9236d168472aa222b6543fae25
[22/30] mtd: block: use a simple bool to track open for write
        commit: 658afed19ceed54a52b9e9e69c0791c8868ff55d
[23/30] rnbd-srv: replace sess->open_flags with a "bool readonly"
        commit: 99b07780814e89f16bec2773c237eb25121f8502
[24/30] ubd: remove commented out code in ubd_open
        commit: bd6abfc8e7898ce2163a1ffdbb9ec71a0a081267
[25/30] block: move a few internal definitions out of blkdev.h
        commit: cfb425761c79b6056ae5bb73f8d400f03b513959
[26/30] block: remove unused fmode_t arguments from ioctl handlers
        commit: 5e4ea834676e3b8965344ca61d36e1ae236249eb
[27/30] block: replace fmode_t with a block-specific type for block open flags
        commit: 05bdb9965305bbfdae79b31d22df03d1e2cfcb22
[28/30] block: always use I_BDEV on file->f_mapping->host to find the bdev
        commit: 4e762d8623448bb9d32711832ce977a65ff7636a
[29/30] block: store the holder in file->private_data
        commit: ee3249a8ce78ef014a71b05157a43fba8dc764e3
[30/30] fs: remove the now unused FMODE_* flags
        commit: 0733ad8002916b9dbbbcfe6e92ad44d2657de1c1

Best regards,
-- 
Jens Axboe





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
