Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF217663458
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Jan 2023 23:51:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pF0zG-00046S-Jo;
	Mon, 09 Jan 2023 22:51:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pF0zF-00046L-5s
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 22:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gl2UFbg/ftVCIXQ7JSOB6JI9zBF5FhMw153QjRHSNVY=; b=Kvivvl+d/pDGjadKPefF7Z0RLi
 bPK7tLQyUHA1x/4FNcy80xHTt+9mlKEtj2FsPBmxBC3evdxaYDg8NAp1J9mOhJMqbwyyWuzKodljT
 851EmJlsbwhvL/Trh6hUmgloJMxE++gJLPeOp2DjlpfNpkHtNq1b3qyHSFZ8p9IlB2Y8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Gl2UFbg/ftVCIXQ7JSOB6JI9zBF5FhMw153QjRHSNVY=; b=K
 yi4nmFNC/8xBz2nqpmZW9lVbFAbmp2grCLZDLrWcw5gO1ZI12eljyQN0zbdgS/eu0UaD8eZg6v6Tc
 DO/Ie76eFPVdc2hHDXiMQ7L5o9JgWGUFybDYemT4y7fXuqN3zHTzeUdtEFdSQqew47eB8qYCtPkPQ
 2vK8XqyxdzcSeSTs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pF0zE-0005KY-Ja for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 22:51:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D357611C0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Jan 2023 22:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67CCCC433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Jan 2023 22:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673304674;
 bh=i5jgjc1Rob7+Go0a0lh7sNLECDwDGLOcl2uHWLC2wNM=;
 h=Subject:From:Date:To:From;
 b=S6mBaqI+/gFCDLIR6hx8FqjizSN2U3LzhVhOiulTlJMP+MKdbbFw8Vz9Tlw/9DpjT
 D6xqlEsYsm++uBTcYSfphBTDfuutpLl7HenuQCX3+kuNn6mfzztKK7PWN+Iu7kMIWQ
 dC4xRK3jCpkIlX5sK6zqm9V80DIjFpCaiVfY16rtIZxNiitwdKDO2JIzxQ+ISi0j0f
 8rXqM4KGXHMCIYykmdmSaBsZI/FPtRQ0rDyWskqNBtEh4t4P4tdJPhTA8zR23EnbZg
 uvxRORvvMyQHwmfhtrFQyWwZBCQurTP/2tGm+MsRJBnUvIMbvAn2pi7MSQHbUUtkyh
 ef82119m0TXww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 55FD4C395DF for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Jan 2023 22:51:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167330467434.13717.8625865752151779901.git-patchwork-summary@kernel.org>
Date: Mon, 09 Jan 2023 22:51:14 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,REPOST] f2fs:
 file: drop useless initializer in expand_inode_data() Submitter: Sergey
 Shtylyov
 <s.shtylyov@omp.ru> Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patch [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pF0zE-0005KY-Ja
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

Patch: [f2fs-dev,REPOST] f2fs: file: drop useless initializer in expand_inode_data()
  Submitter: Sergey Shtylyov <s.shtylyov@omp.ru>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=705991
  Lore link: https://lore.kernel.org/r/38010b42-afd3-5394-09df-2378b7b5d10f@omp.ru

Patch: [f2fs-dev] f2fs: fix to support .migrate_folio for compressed inode
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=706209
  Lore link: https://lore.kernel.org/r/20221221121445.14400-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix to call clear_page_private_reference in .{release, invalid}_folio
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=706208
  Lore link: https://lore.kernel.org/r/20221221121345.14353-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: remove unused PAGE_PRIVATE_ATOMIC_WRITE
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=705896
  Lore link: https://lore.kernel.org/r/20221220115602.6715-1-chao@kernel.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
