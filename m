Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 366276E186F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Apr 2023 01:40:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pn6YL-0007md-Nx;
	Thu, 13 Apr 2023 23:40:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pn6YK-0007mM-76
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 23:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cjYCEXVfF/v6FY+9iZ0VU7bFgnNRemBCTGAbv8j0t24=; b=OAIvo3Ak1PRCLhcTHvwJwq/iii
 Y/9IJJd1dS1pj0/3kE8l8T1jdYQZgGjEoYdyK10VUmV4DIVvRF+zi0OgHsxTiV4M++ChYrisi+KIU
 +OMfSyMozVKildmVep+mitla6v3MZ1esU0JJItwwlbdnPpY1pAYKaP6qq/XVBk0EADik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cjYCEXVfF/v6FY+9iZ0VU7bFgnNRemBCTGAbv8j0t24=; b=dIgN+Retu/ZsrCke6J/dudqYou
 V8/gysLyNTioiy5xg+zE4/20MNsVBl5NjhSp1F0GFRv5y+9RTEgAIMN8Hu6He/VbM3k40BAjtKuQh
 zGHYZS6yPim5++hC0UvvPzopDZInZuSfGCaTiESL3lgwRQ/i+hlN3cXYVDGvjU5jp/8s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pn6YI-006zt7-OB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 23:40:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC47B64296;
 Thu, 13 Apr 2023 23:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD47AC4339E;
 Thu, 13 Apr 2023 23:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681429218;
 bh=mLppmDZWTkjo/jvIXTtESwl04zJe3TFM/Gu0KBcnsyg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kw36A7ZPnPaYaqCH1/go0ObWYcvaL0SazYqlfRkttlSN5TIUXjelC+EYXqbZ6848B
 KDoeuiDIPiIVI946fupYZPvxoLw/KSkwLZMQCjvyigxvFG8+LJsfXeQJ9CiBK3yg1u
 99XcVUSyv8/KRUewj8PnI5QMQEg9B717BglTZLem6pYpHxIjJ9rYnD7GfnPfUPpWK7
 8zTLvhIo7bLxkJsKPNVh7ZhgUbGmgrXCfMAuy/1YS9UH42P/o7t5D0B5+AV3EI1s1v
 hYOjex9/wLOtxhR0TEwmu0xqKPHYL+a6ed1n0bQUVs1ydJ6//h5ORXsriZNjY94Yyr
 l2r/X6uVTgoYw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C7060E4D003; Thu, 13 Apr 2023 23:40:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168142921881.31957.8288025446972589519.git-patchwork-notify@kernel.org>
Date: Thu, 13 Apr 2023 23:40:18 +0000
References: <20230405144453.930311-1-chao@kernel.org>
In-Reply-To: <20230405144453.930311-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 5 Apr 2023 22:44:53 +0800 you wrote:
 > Otherwise, if truncation on cow_inode failed, remained data may > pollute
 current transaction of atomic write. > > Cc: Daeho Jeong
 <daehojeong@google.com [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
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
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pn6YI-006zt7-OB
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check return value of
 f2fs_do_truncate_blocks()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 daehojeong@google.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  5 Apr 2023 22:44:53 +0800 you wrote:
> Otherwise, if truncation on cow_inode failed, remained data may
> pollute current transaction of atomic write.
> 
> Cc: Daeho Jeong <daehojeong@google.com>
> Fixes: a46bebd502fe ("f2fs: synchronize atomic write aborts")
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to check return value of f2fs_do_truncate_blocks()
    https://git.kernel.org/jaegeuk/f2fs/c/b851ee6ba3cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
