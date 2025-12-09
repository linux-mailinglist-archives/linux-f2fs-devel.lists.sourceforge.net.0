Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B344FCB0B5D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 09 Dec 2025 18:22:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=93DYJAubcK6bYrRSbxKvSCOuWPeC/khpCtFnhBEJckM=; b=UdLKyvWymoyYqge99UQ9A0p6Bf
	Etbghe7VEz9Nk+R7LNIvG7YC4CTkrNZmQOiA8/cULdTrY/U0Mf2s2QfkH1n3HqnvQjLjqpyXYxQ1j
	vuBnl9riZk1TgsGKR1zFHIQodOqY8jt1jagewsD79F3JEm4sW4CH6MrARnsxmbtZljVY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vT1Pk-0006Rs-SX;
	Tue, 09 Dec 2025 17:22:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vT1PU-0006RV-7R
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 17:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fDFxXmT7RDYM9n6rmUL9CluDLTcwRRODqXE4Bq0vJp8=; b=C55c5THEKRKVU2M6IiVuRMENl9
 GVteQ9LbUosOvezxL5c0K1MDLjfBICh8CO9R5JUrcHvDTh2uTNyxcXNJMECwFXmXCGDyDbeqCAN/W
 4MKXnMZPydQkKQQH+AffyVHyRAK/5UmrLGXKxMZcXit3lGm/DvU6iaCHEMpQgGgt4Um8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fDFxXmT7RDYM9n6rmUL9CluDLTcwRRODqXE4Bq0vJp8=; b=M
 jako0+xdc3cvCv2Lv15uag8s584YfGAWFMGaTH8zY0ykxas3M+sRlCZuzgM1NUsgdtAdd6oT+xbrf
 ZMYJpF9podaNbu8L9gccBnHiSE9JCLh2On/oHIxsz1e6zKfabf79x9CSOJmAMQ/DYFjkuvLAjtPL5
 CfG02qPBZoBXW+YQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vT1PT-0000zu-Iz for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 17:22:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2D7DF401D1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 Dec 2025 17:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3CCC4CEF5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 Dec 2025 17:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765300909;
 bh=F2v1oS+kj6Z/qGAOMNDKCeL60WHMDCyrqXruzR48/Dk=;
 h=Subject:From:Date:To:From;
 b=oU16ZoKJZHUIICV4wvoeDaTJHdb+0snXrHPXcY+KLyE4tAcY9TQRx0wkKhawtN9Wm
 3vlAKxl68c4cbuTjgStdyrg0Nf3HiTQyyFxsrqJB1h1EpCulkmJCrR9qWuoDOuA6Ej
 e0BGS8Egj255roNFpyPI+cCk8Nah2YWvcL/yK92PbQ1+vshPEm7tdWqF+FyTU4v7O6
 W0ay/02aHr3TnX9qP6ifQQITI7rV9z7HP5vf6vIFTbtW2H6ApBEpnWbJvxhgwLTWvT
 gFBDCYzZnQnuGgQnJy4hk0gTqmApGwoTp6wSJYFvNBSxjjoV6Cj8dtSukGax6nLWCR
 uu7ZpdDSYDXHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 404CE3808200 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 Dec 2025 17:18:45 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176530072378.4018985.7627178490171733265.git-patchwork-summary@kernel.org>
Date: Tue, 09 Dec 2025 17:18:43 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,GIT,PULL] f2fs
 for 6.19-rc1 Submitter: Jaegeuk Kim <jaegeuk@kernel.org> Committer: Linus
 Torvalds <torvalds@linux-foundation.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vT1PT-0000zu-Iz
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

Patch: [f2fs-dev,GIT,PULL] f2fs for 6.19-rc1
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1031487
  Lore link: https://lore.kernel.org/r/aTc4QJ9A-0qKfBzM@google.com

Series: Add NUMA mempolicy support for KVM guest-memfd
  Submitter: Garg, Shivank <shivankg@amd.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=996176
  Lore link: https://lore.kernel.org/r/20250827175247.83322-2-shivankg@amd.com
    Patches: [f2fs-dev,kvm-next,V11,1/7] mm/filemap: Add NUMA mempolicy support to filemap_alloc_folio()
             [f2fs-dev,kvm-next,V11,2/7] mm/filemap: Extend __filemap_get_folio() to support NUMA memory policies
             [f2fs-dev,kvm-next,V11,3/7] mm/mempolicy: Export memory policy symbols

Series: block: ignore __blkdev_issue_discard() ret value
  Submitter: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
  Committer: Jens Axboe <axboe@kernel.dk>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1027128
  Lore link: https://lore.kernel.org/r/20251124234806.75216-1-ckulkarnilinux@gmail.com
    Patches: [f2fs-dev,V3,1/6] block: ignore discard return value

Patch: None
  Submitter: Matthew Wilcox <willy@infradead.org>
  Committer: Christian Brauner <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1015564
  Lore link: https://lore.kernel.org/r/20251024170822.1427218-6-willy@infradead.org

Series: printk_ringbuffer: Fix regression in get_data() and clean up data size checks
  Submitter: Petr Mladek <pmladek@suse.com>
  Committer: Petr Mladek <pmladek@suse.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1021063
  Lore link: https://lore.kernel.org/r/20251107194720.1231457-1-pmladek@suse.com
    Patches: [f2fs-dev,1/2] printk_ringbuffer: Fix check of valid data size when blk_lpos overflows
             [f2fs-dev,2/2] printk_ringbuffer: Create a helper function to decide whether a more space is needed


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
