Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A52DC905785
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 17:56:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHQKV-0005Rx-9S;
	Wed, 12 Jun 2024 15:56:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sHQKT-0005Rq-Mg
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5qNqdh4CqnCJNJkgSu+zktYCxDoRTKuKxTz1pf9DKtU=; b=UYjz6x8V8AzQdOCUP6C2iKLB0Z
 ov4V/FXutwg07YF878VpncAesTH3tnfJya75FTIZ+b4A5yuriLH+NdaATYDYmM8BuPyXgp29+y3HB
 rKjbMmPQiTv3YGYrI/UX4O8LN8dHZ18eUdHsr+5QNYvquCkB802Nn43tgZRLfVSUtf/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5qNqdh4CqnCJNJkgSu+zktYCxDoRTKuKxTz1pf9DKtU=; b=I
 kJctX6NuGxj+t72iR0JMHG81v2517EAIDp6Lwx6mlfAX+q3RFYH7sxF99USQ6s62h2PiNvBNb0yYw
 ywfB/5CnF/6dfF5NSYZO1y7HUlX6V0Tq4t6k+Q0ZMKJKgNnfvrSHWMPRX7y4aUBcFQ9wigtrfWinK
 t4r6852/CrkXAlU0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHQKT-0007Rr-N1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C8CAFCE21CC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02B82C116B1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718207757;
 bh=vzQlWgvG0C+uDo3jQYbMxOs9gfU+hl7DBCcRpMNLcfw=;
 h=Subject:From:Date:To:From;
 b=oWfP7Sq45VAx13AzPgj0C8CR8wQGzwKvjMfwxI44c5KzqgM0MLEJr9VPV7fRETGSj
 yz1cCBvcYABeotzwCo+YpQlXZlNmlmuZOq4fECsg35fNs5GVZCO5UQk+PL5WCjY6mK
 S5ZpXC0RItHUvL14SbqV5OUQUP+RqudeKR61PwgJq1mWaLMOHbVBXiLFUzcx1uFlYh
 QCzqAZ5DwEJYBoGIEq5TEd7E0x+NeKkMM29YEuif28yoid37kwBmgRPd4heuqqDohz
 VSJXxtUuSn4KwN6RRUNo+rQiAqinyzP/A4jDYWfA3mDYHsorHiNjcbp3GW+2olvqcd
 oGWWvAlCFYQpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EC558C43618 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Jun 2024 15:55:56 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171820775696.32393.10423758186289765370.git-patchwork-summary@kernel.org>
Date: Wed, 12 Jun 2024 15:55:56 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: avoid
 resetting non empty zone Submitter: Sheng Yong <shengyong@oppo.com> Committer:
 Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/ [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sHQKT-0007Rr-N1
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

Patch: [f2fs-dev] f2fs: avoid resetting non empty zone
  Submitter: Sheng Yong <shengyong@oppo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=856958
  Lore link: https://lore.kernel.org/r/20240529112411.380453-1-shengyong@oppo.com

Patch: [f2fs-dev,v2] f2fs: alloc new section if curseg is not the first seg in its zone
  Submitter: Sheng Yong <shengyong@oppo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=857301
  Lore link: https://lore.kernel.org/r/20240530100158.762954-1-shengyong@oppo.com

Series: [f2fs-dev,1/2] f2fs: fix to do sanity check on F2FS_INLINE_DATA flag in inode during GC
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=854618
  Lore link: https://lore.kernel.org/r/20240521062318.976239-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: fix to do sanity check on F2FS_INLINE_DATA flag in inode during GC
             [f2fs-dev,2/2] f2fs: fix to do sanity check on blocks for inline_data inode

Patch: [f2fs-dev] f2fs: fix to don't dirty inode for readonly filesystem
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=858561
  Lore link: https://lore.kernel.org/r/20240604075636.3126389-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: fix to avoid use SSR allocate when do defragment
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=856914
  Lore link: https://lore.kernel.org/r/1716976020-28757-1-git-send-email-zhiguo.niu@unisoc.com

Patch: [f2fs-dev,v2] f2fs: fix to cover read extent cache access with lock
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=857528
  Lore link: https://lore.kernel.org/r/20240531020032.1019991-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix return value of f2fs_convert_inline_inode()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=858127
  Lore link: https://lore.kernel.org/r/20240603010745.2246488-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix to force buffered IO on inline_data inode
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=855364
  Lore link: https://lore.kernel.org/r/20240523132948.2250254-1-chao@kernel.org

Patch: [f2fs-dev,V2] f2fs: use new ioprio Macro to get ckpt thread ioprio level
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=858260
  Lore link: https://lore.kernel.org/r/1717414526-19658-1-git-send-email-zhiguo.niu@unisoc.com

Patch: [f2fs-dev] tracing/treewide: Remove second parameter of __assign_str()
  Submitter: Steven Rostedt <rostedt@goodmis.org>
  Committer: Steven Rostedt (Google) <rostedt@goodmis.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=853779
  Lore link: https://lore.kernel.org/r/20240516133454.681ba6a0@rorschach.local.home

Patch: [f2fs-dev,v2] f2fs: fix to truncate preallocated blocks in f2fs_file_open()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=856923
  Lore link: https://lore.kernel.org/r/20240529100103.329778-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: add support for FS_IOC_GETFSSYSFSPATH
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=853330
  Lore link: https://lore.kernel.org/r/20240515081233.2463848-1-chao@kernel.org


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
