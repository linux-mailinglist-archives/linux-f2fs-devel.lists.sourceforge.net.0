Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28211A2F478
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Feb 2025 18:00:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thX8q-0008Bs-1R;
	Mon, 10 Feb 2025 17:00:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1thX8o-0008Bf-JA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 17:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1CeBLaqY7GjbY8mm1Bb237I3ubSAxD7lr/D/rbEHowY=; b=K2ssu38hlfw/VhyjegdGrzs/I/
 P423enzzkYOJ7iDHqwMdf5fXOMC3+JzUts7eJCENzuamdfTXYn2OhwzcnoJbtfSCc6bNTT5MHWa46
 SsIayr92TzcjliYgaYTj8UIJH9u4D1z28NFaROy7X0tmD87LBGx3AXTZ2MhsiW7txP+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1CeBLaqY7GjbY8mm1Bb237I3ubSAxD7lr/D/rbEHowY=; b=g
 7YqTTof9WzhhaR2h8lluCZzbtJmTqOOLFj1d/gllpv4KOlJ1JPRo/R1DrSjiqtwUvpLjh7TUSWUj1
 Ilr4bnSx0qQD9vnp1FsomDCFVVQrfaKgPgCN35wH8yIO3tzkJVJh1qERStIoXVZU0eql4T2UnIGeb
 4sTrlF54hGYEhuGo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1thX8o-0002xi-OY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 17:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C60F95C5BBC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Feb 2025 16:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A937C4CED1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Feb 2025 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739206804;
 bh=hcancuMIdT4NleXr3eTwNyem8jfBtjm3hlqQsXqurL8=;
 h=Subject:From:Date:To:From;
 b=ly33ovdcCg0j5+Lf3rrNGRlxEzxai+UObwc2AAcMkJ/ckGM1K1pCcjtJpTDSwTAre
 IDMjJgv0sT2Obm2paWrMlHV8d78x5T63ivMxNTd5w4Cj12cwE1OYbL7h8EY3eDvLCH
 d0DEh0d7jQe1aOGobmC7aSrmv9/Y8YZ+tnsR3kVYSMm7p6Ab81frkpbKIcyEMRtrDf
 78tb22hNsr88AMsOXVwQSuEL0nKWXinCws3rTK1Bq43PTH2FVkKXdMGnYNFw9+fVTl
 eYdwNQhjoS2yzBmmuO5++eHjMpcbOFIxvb0h8sW74hqbaY9wytRGHhRB9DjmLtsmTR
 GW0cS+qB0ap+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B734B380AA66 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Feb 2025 17:00:33 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173920683220.3829927.14423237113550834155.git-patchwork-summary@kernel.org>
Date: Mon, 10 Feb 2025 17:00:32 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev, v3] f2fs: quota:
 fix to avoid warning in dquot_writeback_dquots() Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel. [...] 
 Content analysis details:   (-6.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1thX8o-0002xi-OY
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

Patch: [f2fs-dev,v3] f2fs: quota: fix to avoid warning in dquot_writeback_dquots()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=931830
  Lore link: https://lore.kernel.org/r/20250208023321.3736348-1-chao@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
