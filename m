Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 253CE985193
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Sep 2024 05:41:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1stIuJ-0001GH-HW;
	Wed, 25 Sep 2024 03:41:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1stIuH-0001GA-B5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Sep 2024 03:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/fIoUYue/haymbfC+ui814EgRmcVfMAWjLe8OPyQY18=; b=F3wDkeWh0zkrmIw8m83/jY+/Ra
 tl33sQ1VQ2b1OnzHwLOPC+rZ6v9dVTYBoySedoIvR5hgYPySWkypXDrcmMnPIDi/AOeusQQp8+sOn
 qbaRlk34wPgRXRljfSrguj/0qEIfuCBMnWX+uShXHb+oOmanmTtR0t15eHA9pupW97NA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/fIoUYue/haymbfC+ui814EgRmcVfMAWjLe8OPyQY18=; b=N
 pTnhJURW8G9MDBGBmZVha0caTz9oZe8Uu5jkpoGk9aKuTaUwjJ2nTuNYYZU9zA5DZjalnLL0Fd6ea
 0NGlqUmzwl94GF2eqagLVF6fskkDCVTvi7MjHSZjcvY/d0RfO4bT0b9AErogS35f/7FToqJ+2S4D6
 JVnUJno22FqMKDog=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1stIuG-0003B1-2C for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Sep 2024 03:41:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 49A01A40172
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Sep 2024 03:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089FEC4CECD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Sep 2024 03:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727235685;
 bh=dd7cEB+4+LoUA9Z1c0z9I9fW3AbpuGEFoqPiSm+yVEU=;
 h=Subject:From:Date:To:From;
 b=QASyKcW6U4nDap3+0v+0JPpzEEdYfhJ9Irn6RyCQrnKmBkyqjWZq5QUy20T0TGSsI
 n5Q0Y7KMqtU0hLIO6mC2qMdqjNe+MjxdSxO7o58P13ky4x4f9dQS3uaTwdF5vjYc/u
 Gq9xY5sQRYeoAmufW0Nbn3CRou1NNW9oUwoBgDolPQ50EhX4qOxufxZMjScomW6f0t
 ci1J5nrXuf0lJSl/eDtvBDcpjoO6w8aOxgAqE+5maO9xEVuI8S5j6TiUF6oDGSu2zp
 Q8iFGqXZpmAy6NksS85KFq2Rn+BGOSakzet+kXhWmZk9DL0X3fd1WiyPSmtJx9YuG7
 XN+ILWQidx5Ng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 77BEA380DBF5 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Sep 2024 03:41:28 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172723568708.97387.10248082796978711156.git-patchwork-summary@kernel.org>
Date: Wed, 25 Sep 2024 03:41:27 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: btrfs: Cleaned up
 folio->page
 conversion Submitter: Li Zetao <lizetao1@huawei.com> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?series=881941
 Lore link: https://lore.kernel.org/r [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1stIuG-0003B1-2C
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: btrfs: Cleaned up folio->page conversion
  Submitter: Li Zetao <lizetao1@huawei.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=881941
  Lore link: https://lore.kernel.org/r/20240822013714.3278193-1-lizetao1@huawei.com
    Patches: [f2fs-dev,01/14] btrfs: convert clear_page_extent_mapped() to take a folio
             [f2fs-dev,02/14] btrfs: convert get_next_extent_buffer() to take a folio
             [f2fs-dev,03/14] btrfs: convert try_release_subpage_extent_buffer() to take a folio
             [f2fs-dev,04/14] btrfs: convert try_release_extent_buffer() to take a folio
             [f2fs-dev,05/14] btrfs: convert read_key_bytes() to take a folio
             [f2fs-dev,07/14] btrfs: convert submit_eb_page() to take a folio
             [f2fs-dev,08/14] btrfs: convert try_release_extent_state() to take a folio
             [f2fs-dev,10/14] btrfs: convert zlib_decompress() to take a folio
             [f2fs-dev,11/14] btrfs: convert lzo_decompress() to take a folio
             [f2fs-dev,12/14] btrfs: convert zstd_decompress() to take a folio
             [f2fs-dev,13/14] btrfs: convert btrfs_decompress() to take a folio

Patch: [f2fs-dev,GIT,PULL] f2fs for 6.12-rc1
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=892264
  Lore link: https://lore.kernel.org/r/ZvInHczHWvWeXEoF@google.com


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
