Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC0A82F4D4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jan 2024 20:02:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rPohg-00029q-Ho;
	Tue, 16 Jan 2024 19:02:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rPohe-00029k-Gx
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 19:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZPbvD5gqmxIhDUzL5oVBe10Xfc2ZMv5w413jEX9HUKQ=; b=VieIi5W/5ZP/9M6OYX0mWFJgRM
 3TDeJfe5JPkLMXqrr6KU66WbezlDKW/Ba3Zpt+NscfQm6mUFxHrLh3i9Q5THqqkVmUD+UNvzDH9ti
 84GGAHYJUTaX2FDIPs6f8D7LFa5cxcJ7fs6O7+F0BrR57l1spkrdVYawAeBA18c+idIE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZPbvD5gqmxIhDUzL5oVBe10Xfc2ZMv5w413jEX9HUKQ=; b=K
 2GOx+63sIOyYwhW00lPt5GlFV+qbC04BV57VtMmAM4hFHL/h6rFhJCDsu0KI3aTXUoBNv8vCJy7gz
 eGipBIC1ix55RM9pETWwdkKphkORFJ/n8VRrT8K2bxoSVrphRdcPYv+rj7Tx+IHKq4ekDx7rNHsBq
 WtdYPQw99FdDRYpk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rPohb-0000aY-Hy for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 19:02:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 331C1612FB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jan 2024 19:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D35C2C433C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jan 2024 19:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705431738;
 bh=cfp2y20D7h2gA39Ul+a6EjM+QwOPdk3VnMP/L7hqsmM=;
 h=Subject:From:Date:To:From;
 b=lDEHxXhecR6b+m9WEMzE7Lwg6uMPXIGccY0jxU/RvS5v+PCWHMt0A2982NU4LPPt6
 VNstJOS9osq5wmHhc3n6hQo/Ixj8WBRQRolnxA9IWiSncVtzDYpM/AXTq0Zn6pjHg4
 OZ/mPllFrcTXrJpKUoWc65VsML89vZiFNIW6eJYHLeW2JU9KhRfvmqELi4ucRcF6bf
 ZIy5+Snw9oABougCpJj63FyeQ0ebaxFX2+iEPo4u1Ii/LTIbRlAkysc9OiFuZVaR1E
 ou2QCDx08rPp3QT6JW8yN5QIzcjd2KRAyhze950IzPcXtb3GBnAZdf2orZHGtT5y74
 bap+5oEecpaIQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B903AD8C96D for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jan 2024 19:02:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170543173870.30188.15190170371921180837.git-patchwork-summary@kernel.org>
Date: Tue, 16 Jan 2024 19:02:18 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.0 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,
 1/5] virtio_blk:
 cleanup zoned device probing Submitter: Christoph Hellwig <hch@lst.de>
 Committer: Jens Axboe <axboe@kernel.dk> Patchwork:
 https://patchwork.kernel.org/project/f2fs/l [...] 
 Content analysis details:   (-7.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rPohb-0000aY-Hy
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

Series: [f2fs-dev,1/5] virtio_blk: cleanup zoned device probing
  Submitter: Christoph Hellwig <hch@lst.de>
  Committer: Jens Axboe <axboe@kernel.dk>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=810825
  Lore link: https://lore.kernel.org/r/20231217165359.604246-2-hch@lst.de
    Patches: [f2fs-dev,1/5] virtio_blk: cleanup zoned device probing
             [f2fs-dev,2/5] virtio_blk: remove the broken zone revalidation support
             [f2fs-dev,3/5] block: remove support for the host aware zone model
             [f2fs-dev,4/5] block: simplify disk_set_zoned
             [f2fs-dev,5/5] sd: only call disk_clear_zoned when needed

Series: Move fscrypt keyring destruction to after ->put_super
  Submitter: Eric Biggers <ebiggers@kernel.org>
  Committer: Eric Biggers <ebiggers@google.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=813073
  Lore link: https://lore.kernel.org/r/20231227171429.9223-1-ebiggers@kernel.org
    Patches: [f2fs-dev,v2,1/2] f2fs: move release of block devices to after kill_block_super()
             [f2fs-dev,v2,2/2] fs: move fscrypt keyring destruction to after ->put_super

Series: Support negative dentries on case-insensitive ext4 and f2fs
  Submitter: Gabriel Krisman Bertazi <krisman@suse.de>
  Committer: Gabriel Krisman Bertazi <krisman@suse.de>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=776490
  Lore link: https://lore.kernel.org/r/20230816050803.15660-1-krisman@suse.de
    Patches: [f2fs-dev,v6,1/9] ecryptfs: Reject casefold directory inodes

Patch: [f2fs-dev,GIT,PULL] f2fs update for 6.8-rc1
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=816271
  Lore link: https://lore.kernel.org/r/ZaAzOgd3iWL0feTU@google.com


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
