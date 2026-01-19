Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFB2D3AAC7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 14:54:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AHDGTy4yKJ6hr+BYlvstwbDlM4pZdvoVl1VkCXnnk/U=; b=W/KPny0/HGhtwij8TIRgLQ6zGr
	by5woNj6NJ93PYEJho7+NaeGXpp6Wka0f0LB9XLkusj00os8eE+DzQcC+gfQ2H9RiiWneIhFWlGio
	S6EOnTK/n1isLDlrnJudAYzDzqcA2OyVqtQcI1yDcecrGcWTOgu4+4zJSTUFSHB83bnQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhpi6-0002pl-3b;
	Mon, 19 Jan 2026 13:54:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vhpi4-0002pf-Eu
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w3bCAIndO/OtQq/MTEICMJLuegVK/4pYAHzDKvn1byg=; b=C1TWhYMXxxKizRMAvJVn6MZrrG
 m4cjVCQYlLrp5r7cqttKuvP12b9+A6zKm/e/g/Heif+ifUw6vh1uejzoMQ/Qfv37LEo5bGiOFGIYj
 YHRUtnhlhghYz/HgqwB1qdlpJSUU9u1fegOOL/NSjGBn25H4+ryYaelL/DmZKMXr6Y0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=w3bCAIndO/OtQq/MTEICMJLuegVK/4pYAHzDKvn1byg=; b=i
 d1eJc+QlMfuozyMMXzgiCMTk2l2ll7bW24VlrWAP0lctz3A1xmnFElbsvK7XS6WfBn4Va9v+8ThUr
 20vYkoPcS8ZQYBS9asfYauiOPclY78eMZYSq4c6BEG3dq8l4ch9nERVqviFXfZINJcKZCB+C/iHAp
 8Q9015iU9GJaMcPY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhpi3-0005qx-TG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:54:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7FD39418D0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Jan 2026 13:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E56CC116C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Jan 2026 13:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768830853;
 bh=JUWUkD9m4vYZQT187QNtWzr8LGT+pGij6q7TM7FdiCo=;
 h=Subject:From:Date:To:From;
 b=NkO30DvWvUFvx+EHgcp9DdVzYISiMk9eK1eSuUHV6TIQKTtCox1ANV1+VNGRmJK2E
 zAs/Na6XWv9Ue9MclbTCMrkR8yKLK+0jqAfDXLzdK4bo1GGCotYijymVj/O84sR5/X
 oXhfGMJXQ4V0hQUHtbgsKQGG74vZfLG8j2zsM8t2jeuGx/GxHJjXveIcf4oqKdbQYl
 L8sxLHDPXRyAdI0BPSPDU0zD5zxwNbdGuCt3nxtROkQL+b4cR4ALe2YwVdfex55UBZ
 eFhx8exFKFr5e/+TMaKmbFvRp4ryueqdXSha/HPjMEmZtl7lJV1Psf10vsnyfjDLft
 nS+mP1SAkj1/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 444D43A54A38 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Jan 2026 13:50:44 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176883064269.1419958.4874514165959493612.git-patchwork-summary@kernel.org>
Date: Mon, 19 Jan 2026 13:50:42 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: clean
 up the type parameter in f2fs_sync_meta_pages() Submitter: Yangyang Zang
 <zangyangyang66@gmail.com> Committer: Jaegeuk Kim <jaegeuk@kernel.org>
 Patchwork: https://patchwo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhpi3-0005qx-TG
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

Patch: [f2fs-dev] f2fs: clean up the type parameter in f2fs_sync_meta_pages()
  Submitter: Yangyang Zang <zangyangyang66@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1041032
  Lore link: https://lore.kernel.org/r/20260112074635.3405176-1-zangyangyang1@xiaomi.com

Patch: [f2fs-dev] f2fs: fix to avoid mapping wrong physical block for swapfile
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1041574
  Lore link: https://lore.kernel.org/r/20260113062229.4062-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix to avoid UAF in f2fs_write_end_io()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1039352
  Lore link: https://lore.kernel.org/r/20260107112218.1789-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: make FAULT_DISCARD obsolete
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1033226
  Lore link: https://lore.kernel.org/r/20251215122803.3495320-1-chao@kernel.org

Series: [f2fs-dev,v5,1/3] f2fs: fix to do sanity check on node footer in __write_node_folio()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1041037
  Lore link: https://lore.kernel.org/r/20260112074917.40107-1-chao@kernel.org
    Patches: [f2fs-dev,v5,1/3] f2fs: fix to do sanity check on node footer in __write_node_folio()
             [f2fs-dev,v5,3/3] f2fs: detect more inconsistent cases in sanity_check_node_footer()

Patch: [f2fs-dev,1/1] f2fs: avoid unnecessary block mapping lookups in f2fs_read_data_large_folio
  Submitter: Yongpeng Yang <monty_pavel@sina.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1040499
  Lore link: https://lore.kernel.org/r/20260109144617.3282553-2-monty_pavel@sina.com

Patch: [f2fs-dev] f2fs: use folio_end_read
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1043122
  Lore link: https://lore.kernel.org/r/20260116043203.2313943-1-jaegeuk@kernel.org

Patch: [f2fs-dev] f2fs: avoid f2fs_map_blocks() for consecutive holes in readpages
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1040964
  Lore link: https://lore.kernel.org/r/20260112013320.8028-1-chao@kernel.org


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
