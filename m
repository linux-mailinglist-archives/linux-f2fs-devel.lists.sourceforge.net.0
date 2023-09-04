Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E35CE791C74
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Sep 2023 20:11:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdE2l-0007qO-P1;
	Mon, 04 Sep 2023 18:11:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qdE2i-0007q5-Uv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 18:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l6ySz8Xdl/lofCA0CUuBs5db3qwNK8caYs/39D/l/gY=; b=VQQEyWedZV1VwQhk9aZBLgBxMU
 wUoPIIBjMXkSQhkuIsd+dd3hN7jqeax4QrEkaxaJuXeRcOM084F8Xajd8IvGnV5a6TPw56yDDcOe9
 ZJDUrL8D2vYTlg9srMoKkQlun4ml9IKnJsN5PHWEc8wysIQyDCqQe67NRH8Pl5p1R63s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=l6ySz8Xdl/lofCA0CUuBs5db3qwNK8caYs/39D/l/gY=; b=h
 tXMLV7i4CCxXJtHhtZ/VIr4QqdMJrEkwT0psnivlk/yBL4W82jWahHmWAwjmErgK7Xj2srbjURHMz
 Dlt9Iw6U8I2e0J0OieFCuCDw02hhgs9deizMS776Po2WoS3ZJ3bcTH5LApkldTeb4pGPf3uvZbK5V
 UcEQjB3UOf8C6FPs=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdE2i-009VKp-BG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 18:11:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7AC2CCE0F94
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Sep 2023 18:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9A1EC433C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Sep 2023 18:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693851068;
 bh=GED/wRfWdIURO4Ujkrb/S7pFUcCgkSWFjwOUOxFnUoI=;
 h=Subject:From:Date:To:From;
 b=M8ceyUvnyu6pjkNBhBwqWob5+oGqWnmp7wDPZ6H+Sbwr9bbovAvalYNvHM+R+t0BM
 Cg1cfEo31AqrzMBeanvoLyWDOC9aI0xbohYuP8tj5xQs6GiUZASafCHy9Dyi/iKLDW
 Aqd8AdiIiL+ynEt27gSe08ibxNUvdC2tJaaINX7YRKYYkgf7pW+NP+vjONmKAznUef
 UbSLN3xJEJ6fSQt7xQtWqSqHls6m/EdzGdNS9AHPUnJiiIY9Bgb92rahy9yPPvjy9t
 ajrGPH4Yiijmi8ZShb6pWy62NOQgJYjYiVds3HLdQQQpsE/U8waaX1xeeGoCpP+VCT
 9MZ9wAD77lUEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9838EC04DD9 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Sep 2023 18:11:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169385106853.19669.2971263993020474852.git-patchwork-summary@kernel.org>
Date: Mon, 04 Sep 2023 18:11:08 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: fs: implement multigrain
 timestamps Submitter: Jeff Layton <jlayton@kernel.org> Committer: Christian
 Brauner <brauner@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?ser [...] 
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
X-Headers-End: 1qdE2i-009VKp-BG
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: fs: implement multigrain timestamps
  Submitter: Jeff Layton <jlayton@kernel.org>
  Committer: Christian Brauner <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=773825
  Lore link: https://lore.kernel.org/r/20230807-mgctime-v7-0-d1dec143a704@kernel.org
    Patches: [f2fs-dev,v7,01/13] fs: remove silly warning from current_time
             [f2fs-dev,v7,02/13] fs: pass the request_mask to generic_fillattr
             [f2fs-dev,v7,03/13] fs: drop the timespec64 arg from generic_update_time
             [f2fs-dev,v7,04/13] btrfs: have it use inode_update_timestamps
             [f2fs-dev,v7,09/13] fs: add infrastructure for multigrain timestamps
             [f2fs-dev,v7,10/13] tmpfs: add support for multigrain timestamps
             [f2fs-dev,v7,12/13] ext4: switch to multigrain timestamps
             [f2fs-dev,v7,13/13] btrfs: convert to multigrain timestamps

Series: [f2fs-dev,01/17] fs: unexport buffer_check_dirty_writeback
  Submitter: Christoph Hellwig <hch@lst.de>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=742589
  Lore link: https://lore.kernel.org/r/20230424054926.26927-2-hch@lst.de
    Patches: [f2fs-dev,01/17] fs: unexport buffer_check_dirty_writeback
             [f2fs-dev,04/17] fs: remove emergency_thaw_bdev

Series: fs: new accessors for inode->i_ctime
  Submitter: Jeff Layton <jlayton@kernel.org>
  Committer: Christian Brauner <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=762813
  Lore link: https://lore.kernel.org/r/20230705185812.579118-1-jlayton@kernel.org
    Patches: [f2fs-dev,v2,07/92] fs: add ctime accessors infrastructure
             [f2fs-dev,v2,08/92] fs: new helper: simple_rename_timestamp
             [f2fs-dev,v2,92/92] fs: rename i_ctime field to __i_ctime

Series: Simplify rejection of unexpected casefold inode flag
  Submitter: Eric Biggers <ebiggers@kernel.org>
  Committer: Theodore Ts'o <tytso@mit.edu>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=776070
  Lore link: https://lore.kernel.org/r/20230814182903.37267-1-ebiggers@kernel.org
    Patches: [f2fs-dev,1/3] ext4: reject casefold inode flag without casefold feature
             [f2fs-dev,2/3] ext4: remove redundant checks of s_encoding
             [f2fs-dev,3/3] libfs: remove redundant checks of s_encoding

Series: [f2fs-dev,01/12] fs: export setup_bdev_super
  Submitter: Christoph Hellwig <hch@lst.de>
  Committer: Christian Brauner <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=772239
  Lore link: https://lore.kernel.org/r/20230802154131.2221419-2-hch@lst.de
    Patches: [f2fs-dev,01/12] fs: export setup_bdev_super
             [f2fs-dev,02/12] nilfs2: use setup_bdev_super to de-duplicate the mount code
             [f2fs-dev,05/12] ext4: make the IS_EXT2_SB/IS_EXT3_SB checks more robust
             [f2fs-dev,07/12] fs: stop using get_super in fs_mark_dead
             [f2fs-dev,08/12] fs: export fs_holder_ops
             [f2fs-dev,09/12] ext4: drop s_umount over opening the log device
             [f2fs-dev,10/12] ext4: use fs_holder_ops for the log device

Series: fsverity: simplify initcall and move sysctl registration
  Submitter: Eric Biggers <ebiggers@kernel.org>
  Committer: Eric Biggers <ebiggers@google.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=762871
  Lore link: https://lore.kernel.org/r/20230705212743.42180-1-ebiggers@kernel.org
    Patches: [f2fs-dev,1/2] fsverity: simplify handling of errors during initcall
             [f2fs-dev,2/2] fsverity: move sysctl registration out of signature.c

Patch: None
  Submitter: Jeff Layton <jlayton@kernel.org>
  Committer: Christian Brauner <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=762831
  Lore link: https://lore.kernel.org/r/20230705190309.579783-41-jlayton@kernel.org

Patch: [f2fs-dev,GIT,PULL] f2fs update for 6.6
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=781273
  Lore link: https://lore.kernel.org/r/ZPJ7P1J+jbyL6Mve@google.com


Total patches: 27

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
