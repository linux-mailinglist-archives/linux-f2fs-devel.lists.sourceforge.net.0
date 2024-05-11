Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F18C2E12
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 May 2024 02:50:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5awr-000594-IC;
	Sat, 11 May 2024 00:50:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s5awn-00058d-QK
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+X7gndQ0uKhai4/OnkY+AB0x6Spzs9DlkeebRZD5eJs=; b=S1334IKZ7dOdAsJGjJbjoZlgOt
 w8yVeg4vnavYQ+jC2rH9TScHSZjEuuJgT5gZsG9stV+qty3TRkXyUawCtf5tZwi2vi7tluvSmU5Mn
 AT5yqZiRVidGnaXZuJQegH6VXe5T3FHXSGXRIZDwoB012mSoLumF7BHefRITg9XXaXHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+X7gndQ0uKhai4/OnkY+AB0x6Spzs9DlkeebRZD5eJs=; b=cXLggmaN/j72XNL8kZ7YSDtPop
 RC5byOTXCBucLhpDpUhwz/i5ZuKJyiJFgCIk0/xk8B8SJTHllBVIBcDZelz4cplp8Ij8r2jl9ZCpw
 SRzgGDUkRyFW/MxP5qoUcyIgXmSprsmFoBEXxbiovav/r9hkruAM0qrxeyJnjrak7Fuo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5awo-0004zK-Ap for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 256FD62043
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 May 2024 00:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18849C4AF18;
 Sat, 11 May 2024 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715388634;
 bh=XfqFDi5MeOcdt7/akiT9d2506BZ52NdNgmwK4rVVh38=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hiRuI7/QSR8GUi2SkeNi2OCMUVNWkE4vIV+8u2fRpcmIXOstrKvpMWUCrUVdiEI/1
 NrXQ8h0wlaDc7DL5bZAt4+gEuO8VKKPjKVqDxwBt/b5JoIj66Nd1lc0fuAxSR8JxTT
 xxzZ4vjilu/q1KHPQYay4kNpB6pVd+yOAvUBQMHcpASeUJabDTpEBaph2rNhAumoxX
 mb6K3udAB2cnpP5kbsBJr3P26krV53O1P/hUuWBcBhf49sUjEcTO99riShIGTieNe+
 VKVUZsGq5WDx376vtecw/bxLvWFviI7yH/hLiD1fk57nWvD9JrRQINVb4hTVh7fFcM
 E73d6jELr1caQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0D89FC54BA1; Sat, 11 May 2024 00:50:34 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171538863404.11229.12387715734074959132.git-patchwork-notify@kernel.org>
Date: Sat, 11 May 2024 00:50:34 +0000
References: <20240507033100.1044884-1-chao@kernel.org>
In-Reply-To: <20240507033100.1044884-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 7 May 2024 11:31:00 +0800 you wrote:
 > It missed to call dec_valid_node_count() to release node block count >
 in error path,
 fix it. > > Fixes: 141170b759e0 ("f2fs: fix to avoid use f2fs_bug_o
 [...] Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5awo-0004zK-Ap
Subject: Re: [f2fs-dev] [PATCH v2 1/3] f2fs: fix to release node block count
 in error path of f2fs_new_node_page()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue,  7 May 2024 11:31:00 +0800 you wrote:
> It missed to call dec_valid_node_count() to release node block count
> in error path, fix it.
> 
> Fixes: 141170b759e0 ("f2fs: fix to avoid use f2fs_bug_on() in f2fs_new_node_page()")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - avoid comppile warning if CONFIG_F2FS_CHECK_FS is off.
>  fs/f2fs/node.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,v2,1/3] f2fs: fix to release node block count in error path of f2fs_new_node_page()
    https://git.kernel.org/jaegeuk/f2fs/c/0fa4e57c1db2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
