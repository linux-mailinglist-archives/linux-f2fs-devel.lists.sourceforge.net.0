Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2350AA0C0B6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jan 2025 19:50:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tXPWU-0003G8-3B;
	Mon, 13 Jan 2025 18:50:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tXPWS-0003Fw-Sb
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jan 2025 18:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bk7Earg3tji80VPO1fV4hwILZfhwfmTt0tUXwUD8DMI=; b=DEeNj1Slkn+Llw2OVk7TEj0poU
 3+DbbzgUipAcK8ARlGjirv+NlD9R92Dceu2WU2K3M1ZvybdblO9LxbdIfBTpzH+cvnMYmPOQfzJdo
 Q3F3mA8DZMKNAARJTKx7n/I8Y44zrsVB8B+X8k8ekRxnIKrggwKGvHmiu/8ZlyA9Zk0E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bk7Earg3tji80VPO1fV4hwILZfhwfmTt0tUXwUD8DMI=; b=k
 lzGn7aO01Nq2n8xtrxG9L87HAPIWyGGZk31tyTWyu2dWGvH9z6/BpMFxnBDxsbWoNTN92nH8pX+9I
 5DkuvUomdMLjzBybMe+muSJR4qiB6V4VSu0VInuidJtdiENJLSTV7VkcaUwsygc3RR3RWjJAdwyTk
 mIU1gnCGUu78YT8o=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXPWS-0006HF-7J for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jan 2025 18:50:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4D377A40BA4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Jan 2025 18:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D30C4CEE1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Jan 2025 18:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736794242;
 bh=HXDFNbiZLAs0oWgO8GPCa2XREJ8frzd6hOuLqY5bkuQ=;
 h=Subject:From:Date:To:From;
 b=GjhaPx8hfCld6rcWS0gqZxrMbOVzuLjGm8thPlDSrAAlLvHJP2IgG4SU12hvli4Up
 yviWZfhGNlOxF03h5+xsstk502d0Fvl+TSoyMi/BqTa/xvY7IyG5Dq6aRg5Wyqd6Ks
 1jgaYmVauUOttB4NzpuCOsKfIJSNnu5E9TaTRtCGfyoM9gini/Kz62u0DeW+/Slvf4
 sH5lYXpiWpnl0qZv5S2HK0i8q+im9/jnqwf+zbR5FpNVl+ZyBPCaMwjDb/aSkOoQ98
 qsQUFrRQj49pxQXecxeWM/6mSAgglpDAEj6s7Nrcrea3HwpdPjD/c5tUl3jMn2ydCQ
 Yzw9+XvkBb9jQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B418C380AA5F for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Jan 2025 18:51:05 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173679426417.3595970.10042540418777694410.git-patchwork-summary@kernel.org>
Date: Mon, 13 Jan 2025 18:51:04 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,v4] f2fs: fix
 using wrong 'submitted' value in f2fs_write_cache_pages Submitter: YangYang
 Zang <zangyangyang66@gmail.com> Committer: Jaegeuk Kim <jaegeuk@kernel.org>
 Patchwork: https: [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tXPWS-0006HF-7J
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

Patch: [f2fs-dev,v4] f2fs: fix using wrong 'submitted' value in f2fs_write_cache_pages
  Submitter: YangYang Zang <zangyangyang66@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=924714
  Lore link: https://lore.kernel.org/r/20250113030518.3639169-1-zangyangyang1@xiaomi.com

Series: Speed up f2fs truncate
  Submitter: Yi Sun <yi.sun@unisoc.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=920345
  Lore link: https://lore.kernel.org/r/20241223081044.1126291-1-yi.sun@unisoc.com
    Patches: [f2fs-dev,v4,1/4] f2fs: introduce update_sit_entry_for_release/alloc()
             [f2fs-dev,v4,3/4] f2fs: add parameter @len to f2fs_invalidate_blocks()


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
