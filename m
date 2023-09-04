Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD395791C7A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Sep 2023 20:11:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdE2l-0003Gc-8I;
	Mon, 04 Sep 2023 18:11:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qdE2j-0003GO-C0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 18:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zVK0uJHHpaYRIVjBMKczPSTC7C31plai6U72TKQyXoo=; b=ZvgYf2gdfyn+m31G89VkSmT6tO
 TXwgUIGiCEWIpKUnE3MqJSYK47TMVcjV+hhwOCSlMHB3+4VuehiUnECh8wrXIpaD7wq8Qa0f/d4F7
 8U7TdxYIPEbGskB0+QdEiGJPwtBZkIyktZ1vljQFgSYY4uakrHjcm7jNF+7PD3vwKisw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zVK0uJHHpaYRIVjBMKczPSTC7C31plai6U72TKQyXoo=; b=YaAE1li8QcxJLFSolffsvDq4hi
 qxVQThboruDBIQ49fGU2q2kIji/EFxEK55DRTKUclaNL81w/HCITpaw7Ly5beJ/h4XU4seZqQ8Cv3
 lQiw2QnklPCNQV6BxTCyRcn4nnzniLlxM/ui3MOixbRhNPhReheuR0XyF+woTqhMBCbo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdE2i-009VL7-DD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 18:11:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B5B2CCE0E24;
 Mon,  4 Sep 2023 18:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33EE4C433BC;
 Mon,  4 Sep 2023 18:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693851069;
 bh=IbVZF2DzXUAo2USMUCstH3jPxauU/LW0IcO2K6LFI4c=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ia58bjh4p1fO0/CGw8J5Rs1Vo1j5XfRVWItHIwgeFn8rfWurveiBV3yEbnmuuMJ6P
 0dX1mVg7Y6gTEzMa5Whxk59KrCLCTfB/PrZ0B0WolmEq4yaon1/tV+WLLLtJWG/xY0
 dy6lOtzzaLf+Z8WVNjmVninPcHYRo12hw6zL2O/c4cmCpp6u16HlD9D5vcqdrB2v+e
 G6QjlvbFoe94sLMMbEFQYkCueLzwZr9JAP+5uBddOS46Vz5NEj71bugNLgoSMI1ZvJ
 oNh6Ld267EMxOtUHbtgOPq4KvFjwoTafZWVGD0Gm74c6TV4c+RltqlDafHZDDmUn00
 hWR7BwYjNDGYg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1461BC04E26; Mon,  4 Sep 2023 18:11:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169385106908.19669.10487789391922478483.git-patchwork-notify@kernel.org>
Date: Mon, 04 Sep 2023 18:11:09 +0000
References: <20230802154131.2221419-2-hch@lst.de>
In-Reply-To: <20230802154131.2221419-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Christian Brauner <brauner@kernel.org>: On Wed, 2 Aug 2023 17:41:20 +0200
 you wrote: > We'll want to use setup_bdev_super instead of duplicating it
 in nilfs2. > > Signed-off-by: Christoph Hellwig <hch@lst.de> > --- >
 fs/super.c | 3 ++- > in [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdE2i-009VL7-DD
Subject: Re: [f2fs-dev] [PATCH 01/12] fs: export setup_bdev_super
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
Cc: axboe@kernel.dk, linux-xfs@vger.kernel.org, brauner@kernel.org,
 linux-nilfs@vger.kernel.org, jack@suse.cz, djwong@kernel.org, tytso@mit.edu,
 josef@toxicpanda.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, clm@fb.com, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 dsterba@suse.com, linux-ext4@vger.kernel.org, konishi.ryusuke@gmail.com,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Christian Brauner <brauner@kernel.org>:

On Wed,  2 Aug 2023 17:41:20 +0200 you wrote:
> We'll want to use setup_bdev_super instead of duplicating it in nilfs2.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/super.c                 | 3 ++-
>  include/linux/fs_context.h | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,01/12] fs: export setup_bdev_super
    https://git.kernel.org/jaegeuk/f2fs/c/cf6da236c27a
  - [f2fs-dev,02/12] nilfs2: use setup_bdev_super to de-duplicate the mount code
    https://git.kernel.org/jaegeuk/f2fs/c/c1e012ea9e83
  - [f2fs-dev,03/12] btrfs: always open the device read-only in btrfs_scan_one_device
    (no matching commit)
  - [f2fs-dev,04/12] btrfs: open block devices after superblock creation
    (no matching commit)
  - [f2fs-dev,05/12] ext4: make the IS_EXT2_SB/IS_EXT3_SB checks more robust
    https://git.kernel.org/jaegeuk/f2fs/c/4b41828be268
  - [f2fs-dev,06/12] fs: use the super_block as holder when mounting file systems
    (no matching commit)
  - [f2fs-dev,07/12] fs: stop using get_super in fs_mark_dead
    https://git.kernel.org/jaegeuk/f2fs/c/9c09a7cf6220
  - [f2fs-dev,08/12] fs: export fs_holder_ops
    https://git.kernel.org/jaegeuk/f2fs/c/7ecd0b6f5100
  - [f2fs-dev,09/12] ext4: drop s_umount over opening the log device
    https://git.kernel.org/jaegeuk/f2fs/c/6f5fc7de9885
  - [f2fs-dev,10/12] ext4: use fs_holder_ops for the log device
    https://git.kernel.org/jaegeuk/f2fs/c/8bed1783751f
  - [f2fs-dev,11/12] xfs: drop s_umount over opening the log and RT devices
    (no matching commit)
  - [f2fs-dev,12/12] xfs use fs_holder_ops for the log and RT devices
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
