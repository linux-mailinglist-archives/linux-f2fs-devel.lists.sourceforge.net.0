Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D186A62061
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Mar 2025 23:30:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ttDXf-0004Mj-9E;
	Fri, 14 Mar 2025 22:30:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1ttDXd-0004Ma-HR
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Mar 2025 22:30:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0LGGXe9J5FDTEKAzz4JE6ZtchzPqRTi34G6+zjtHCBc=; b=cQm3OSVsNbMlasSIhu7OiMd/zP
 qFDL/pn6FBRQp+4RLGUO0ufVP36vSBGP6CA9UVXtXiVcY9nqMSbfo8QCBSWEt6b5yKoSEFG1SYwAh
 wftj+zv0CccOP4FIfpkYdRKhYMnSwRPWN//BPbMo8LuBbMrGk0zaqL8+Ngfsj039lJRQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0LGGXe9J5FDTEKAzz4JE6ZtchzPqRTi34G6+zjtHCBc=; b=A
 qQcIWCzQD/U7KHo8B6pdS4vPXpMo1UkbYzGFoLLitZndXuidYEX9br3+O9cRuCRPeGq9wnMpmv9aM
 YXQ6DORhlaINRCpoBB17RwgomrnbVkCpVv8kucgBVWo7za9n89sf9mClt+HsPfR8LfvaRfsDitmDd
 sbJYWnvrYQuGB7Gs=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ttDXX-0007iN-99 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Mar 2025 22:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D025BA48939
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 14 Mar 2025 22:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D0C7C4CEE3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 14 Mar 2025 22:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741991397;
 bh=EFDVYyDgEQesBVh7LtOLuEKLcxG0TJsTZtGfuVdMZuc=;
 h=Subject:From:Date:To:From;
 b=DA6E/0rqERWIqhYNw7MFjkJI7RM3duo11uDHtBxiemWbFVtC2pGTa0jZxsXC5qXJ5
 8J7Y+c3ebpF7jqXx3uCXsC+7mDou2APHhzWUV4JvfOs7FlHJICZGUGvKsq5Zc11s+4
 QAnCVSVJP0JxI9STGKUBCzwWusBL0wNvTGu57ZFj3ACR/gys9VSyxkykZESnh1oHvN
 ycndW1cj3vYEsnMokDw1uwI0G2VOpfqks+NzlVaL6k3EYGL+1A3x7zorAPmncTrj1f
 5djfLWdqmXsK2XacGqz3n1WWPJDrshl9hiFwmFZSlzOYzI+svUW5UJZOgnfZdh4ezd
 JCe/VwmeU7tFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3747E380CFE7 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 14 Mar 2025 22:30:33 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174199143189.2405968.13205296260052227378.git-patchwork-summary@kernel.org>
Date: Fri, 14 Mar 2025 22:30:31 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: fix
 to avoid atomicity corruption of atomic file Submitter: Yeongjin Gil
 <youngjin.gil@samsung.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork: https://patchwork.ker
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ttDXX-0007iN-99
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

Patch: [f2fs-dev] f2fs: fix to avoid atomicity corruption of atomic file
  Submitter: Yeongjin Gil <youngjin.gil@samsung.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=943954
  Lore link: https://lore.kernel.org/r/20250314120651.443184-1-youngjin.gil@samsung.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
