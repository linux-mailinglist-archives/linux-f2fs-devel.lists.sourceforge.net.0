Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5262A4A7AE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Mar 2025 02:50:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1toBzc-0000wV-D4;
	Sat, 01 Mar 2025 01:50:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1toBzR-0000wF-Bf
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Mar 2025 01:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RLwIU1mZ7vSAgU5GnZRo2jFJVKeWoM9Yvw00cnb3DBw=; b=nUesnYrG7tBzIKO28uHJAYnaga
 1y3N39bo/ZyTqqZY0Rb9Fy1S+V6yCxMLZNu9921SSB35cIelJJ2BYmX0ysWndJfHPa2QvCgiNVbz9
 +zo1uCyA+Uk27j8N9fr2Z+/4pwurF0+nrbCcRmVM45Omumw7LGovda5U8LTc6MjZKnkA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RLwIU1mZ7vSAgU5GnZRo2jFJVKeWoM9Yvw00cnb3DBw=; b=G
 wwMYsamZpts94ZakS6Kk7NYNpG9ea3GxPBOBMDy+koprA3AWOHwI0DTNThNzR7eiVKH5QH2de0Uvg
 kuxBaHe3QolnyY1vQVe0AfqPzS1yyRDEp485tTt+iHkv6qx/hJY1gTj6CDtxbd/B942fSehCVh8xL
 8peReQqtqOspdf+c=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1toBzQ-00089o-3b for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Mar 2025 01:50:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C72DB61160
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  1 Mar 2025 01:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECCFC4CED6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  1 Mar 2025 01:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740793798;
 bh=vo4YWEJzTDy2P80rFoYubBTOnQgC/P74tylJVnjJMTc=;
 h=Subject:From:Date:To:From;
 b=hh7vjb3Tx+2lG5X0Vnumm7gRxQ7QHWCIR52X+SCmg52/UVt4IciVe6bl9TiJ0XXA7
 UwUwcADfjtDquytA3ZLRGLB43leyujQsDFPnKJYcG+91WXVmXN6oryahG5NKCqN6MB
 kI6z8iq01UCwe5kUhIj0YI0Hnr0O1eCG9xkLVSQIfHeQc6+sxdomp02HBU5UuDzyng
 y3v3b2tjdFCLioi8nHSbLnO51JQv3xNj97mKxm1MJImOs7FTrH2LmnY5vcPI5qvOGy
 ypZ3FSNomRsXKbPR99jMJ0XBLkbNlW82p/Pp4dZ8V9cEOKIdvXps3Ung0rKua7uzvQ
 eAQeLzIrzA9Xg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 74C12380CFF1 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  1 Mar 2025 01:50:31 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174079383002.2336000.11311890388442061724.git-patchwork-summary@kernel.org>
Date: Sat, 01 Mar 2025 01:50:30 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,v5] f2fs: add
 check for deleted inode Submitter: Chao Yu <chao@kernel.org> Committer:
 Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?serie [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1toBzQ-00089o-3b
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

Patch: [f2fs-dev,v5] f2fs: add check for deleted inode
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=938764
  Lore link: https://lore.kernel.org/r/20250227155420.48885-1-chao@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
