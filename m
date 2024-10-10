Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C0B999364
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Oct 2024 22:10:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1syzUc-0007dw-O2;
	Thu, 10 Oct 2024 20:10:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1syzUb-0007dn-FB
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 20:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fgzQYxtS7VFROVRIT9JpQFC6OJrN9CAoitElBkdhvVo=; b=QkJIZxJ6RJcUu+pINlKgUmaLq+
 OjVhowDi4MN1UEx1gaadDid9gOycXZGh+cHp21pI4D5YQIIklD1HwA7Wz3WZ4sIXU3agEzkkcJsOP
 qgx/cJ/Nk3UjfldNZF6bMdPzDK7YonR2eS8Kw7WE3sPRB7M4uhXccJScQ7yOVUlV/hLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fgzQYxtS7VFROVRIT9JpQFC6OJrN9CAoitElBkdhvVo=; b=g
 RBagdp6eXrzh4/QqMj8V9QcVSXwsq/bTG4JSJKqol+TqUUTFj9TEh8v03g9bw9/NbWDGwwJ8gNvIm
 BezWUu2PGC6FubVHEBuAdx7olRyGiAT986+QxW2Z0wDCjcAPHzKQeWYRdFLhZ/d/xV5mSbuL1/yA2
 +MTBuwlIuHQIJ4jk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1syzUa-000551-Sl for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 20:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 31CEA5C5F62
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Oct 2024 20:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26415C4CECC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Oct 2024 20:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728591026;
 bh=PjhaWbtHBRUeMZLBXnnlPolzy+1S8KpF3E3T0xqVStY=;
 h=Subject:From:Date:To:From;
 b=JpWaDJDmioaAylfC2UDxV5ZPzUXs4Wg34zKsWRNjfB+3QAnonQdgOIc8Gwvv95tm0
 LY7Kpx+bpHIGGkr+I167MfqQdGWnk/x1POOEf1nCqayKPziqiPiPyq/PFhDqHCTLnG
 X/OklNDhqdGYGWG796lNd55wRhoBGBNHFrk61cUOc0G1wbOEoCfnjvA3cC26W3Cp81
 hDxYL46+w998bwikjSoK1ysld1GRFN3SsE6sfhYNh61NTHgJ3qFZhfv8Um1+3a/Ewg
 5y6wHAbWv7DH4dNl9HfXBPhRPyRksZFaTfU/zdTWpzu9cXLcbcd45YQ2tlB1P9QEiD
 emU3VxK7BTzpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B32C03803263 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Oct 2024 20:10:31 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172859103023.2156650.7385411002828496836.git-patchwork-summary@kernel.org>
Date: Thu, 10 Oct 2024 20:10:30 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: allow
 parallel DIO reads Submitter: Jaegeuk Kim <jaegeuk@kernel.org> Committer:
 Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?seri [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1syzUa-000551-Sl
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

Patch: [f2fs-dev] f2fs: allow parallel DIO reads
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=897407
  Lore link: https://lore.kernel.org/r/20241010000923.1278817-1-jaegeuk@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
