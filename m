Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E889D16A5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2024 18:01:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tD57R-0003g9-Q5;
	Mon, 18 Nov 2024 17:00:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tD57L-0003fW-C9
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 17:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FDpI7TcRjqBvUbHPOpAejCasLszEdgLEnbBE3hpgLps=; b=IbVC/6eMHWwkmEHSmDGYwX7UGw
 ubbnmlOeKnYdRDO/61Xzy1oU2ihQictn0iwJkodDlh4csHpS1Roc5J+RafseVB5O+6iQUFvNFlj7C
 oU75gwmuTi+LPsAB9SJXwVx/7CwSgoeaqL7nFw0W5t5STD5b6BYPxUrDbq9aHXo0nnNQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FDpI7TcRjqBvUbHPOpAejCasLszEdgLEnbBE3hpgLps=; b=jRuzYVAyvkM7+OV0fMNwEAy+Vs
 niUAEpiePDEYB6niE7oug3L9tKxkVHwflmLZOGHpsRY3jbvPdxpJmLqSVAYKKjjbrYOH9ClOe7uw0
 7KbVCk8YZXT8SL3KVdd2ZcFg8EQCfMPr72PuQuKp9VPIpPnQMUiW0d5/2CJR+n/+KIb4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tD576-0000yI-CA for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 17:00:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 24215A416ED
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 Nov 2024 16:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64930C4CECC;
 Mon, 18 Nov 2024 17:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731949230;
 bh=qLWBUrU30pw/zPIYWpjpJqcg5yzpEUiM4v1tVieKRcY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tSZ5uyugusioRTS05iGs6lYpGWJ7be8GhhfPuvCNe1PQJyKl991NyGnoUQLwsQ56Q
 83oE+qob73r7zD/qGstBLDv0gdUClDYfv4/PkMT8T6LLJ9fjY5dHeGQFInzTYRbmOr
 7bt6+qFoiiiwxJRz7TU0zKMLpDDiTvo2NEy+4MyHQsSfJwUJwL+FE9gdFn0lMoMFLg
 Gd0QplpCtE9UfPSbhZvBgSykdEjXahaJSYUrvbxvlY6lNL0nbV1OXzIFbW4K99tPa1
 BKmR79nbcAx8jc7AVO/Weqhk2juc6hP+QMV8r+cvGL9vh6foji/kTgQ+z5j3U6BSk1
 TaSoms0smI5Hg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAD2C3809A80; Mon, 18 Nov 2024 17:00:42 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173194924173.4109060.6198520262725543063.git-patchwork-notify@kernel.org>
Date: Mon, 18 Nov 2024 17:00:41 +0000
References: <20241104015016.228963-1-chao@kernel.org>
In-Reply-To: <20241104015016.228963-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 4 Nov 2024 09:50:16 +0800 you wrote:
 > Jinsu Lee reported a performance regression issue,
 after commit > 5c8764f8679e
 ("f2fs: fix to force buffered IO on inline_data > inode"), we forced direc
 [...] Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tD576-0000yI-CA
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid forcing direct write to
 use buffered IO on inline_data inode
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  4 Nov 2024 09:50:16 +0800 you wrote:
> Jinsu Lee reported a performance regression issue, after commit
> 5c8764f8679e ("f2fs: fix to force buffered IO on inline_data
> inode"), we forced direct write to use buffered IO on inline_data
> inode, it will cause performace regression due to memory copy
> and data flush.
> 
> It's fine to not force direct write to use buffered IO, as it
> can convert inline inode before committing direct write IO.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid forcing direct write to use buffered IO on inline_data inode
    https://git.kernel.org/jaegeuk/f2fs/c/26e6f59d0bba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
