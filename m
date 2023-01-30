Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B39681F39
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 00:00:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMd8W-0004yX-7u;
	Mon, 30 Jan 2023 23:00:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pMd8U-0004yD-6S
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m5IFwKYcaHBrBwlibMVCCcCm49P936/GpLQEVV4pJQ8=; b=lIIn5V4mFzgovIpjogJYR2GWwL
 cs5+0i1eQfhOY/ucXHpqKrqkn+e1BYFOxd5TsbFKTmXautjbfPBHkNd9crQJ7KfT+cCIFBcfU/tNM
 IHi99I1PU6tQ9OE087++56aYLuPAdLjjCt5TPRuuX91thYxeM2b/ihMpfka8DjIpZDko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m5IFwKYcaHBrBwlibMVCCcCm49P936/GpLQEVV4pJQ8=; b=cRizaX/41nL77hY6Xe7Z5j8utk
 xasaBVZLBwK0dhLhM8kROPk/fNfUw+PFJbO6H4MimwOD8V0t8anBaOKwWatyWy51zo3CwpzyWsfeL
 u6j+jd9crrAskm/P7PuO6sbu5f4rSAEPRKnwah1ohWEybZa6lsm89pwWYFypQJlFPppc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMd8S-0002fT-3B for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:00:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9A78DB80E78;
 Mon, 30 Jan 2023 23:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09E99C433A0;
 Mon, 30 Jan 2023 23:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675119618;
 bh=mm+Hb+et6414G2nBmTQgnn6P2DF44wq1TLfITcp8GUs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=S+mO+DaQb28EkVhH3xbJdk4WcVS65gbBZajh62Xve5s9YtSr7oY6i1jKcTAF6m3pn
 X/O4Md0+6I/c3u/IzlSXuU9n5A5AOzOLhqC6q325PAFspFi7bxtAnYZFKKYOw+uZVK
 M457n+3YDLCmKpSSy/ElUD9NR2cD6HCo0sIB93YHURuJcm0YCVbG/MHQ6ggNKpIsoo
 xK6+XQ5Ew/X85kIvVQWBQyIZfaYvJz/rQUDNOMh6W5tN2gK8Pe3QnPPq3+oh2co+qI
 hUQOaPiWQqeJnSBOlxYrNHNy2AxLlNzdW9k5qwYNVz5uGA9UgQAUV6UXRYgdAiDXF5
 R37SWA7cTiWQQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D3778E52559; Mon, 30 Jan 2023 23:00:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167511961786.12751.10866509734206630885.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 23:00:17 +0000
References: <20230123070414.138052-1-ebiggers@kernel.org>
In-Reply-To: <20230123070414.138052-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 22 Jan 2023 23:04:14 -0800 you
 wrote: > From: Eric Biggers <ebiggers@google.com> > > When converting an
 inline
 directory to a regular one, f2fs is leaking > uninitialized memory to disk
 becaus [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMd8S-0002fT-3B
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix information leak in
 f2fs_move_inline_dirents()
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
Cc: jaegeuk@kernel.org, glider@google.com, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun, 22 Jan 2023 23:04:14 -0800 you wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When converting an inline directory to a regular one, f2fs is leaking
> uninitialized memory to disk because it doesn't initialize the entire
> directory block.  Fix this by zero-initializing the block.
> 
> This bug was introduced by commit 4ec17d688d74 ("f2fs: avoid unneeded
> initializing when converting inline dentry"), which didn't consider the
> security implications of leaking uninitialized memory to disk.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix information leak in f2fs_move_inline_dirents()
    https://git.kernel.org/jaegeuk/f2fs/c/638ce5437867

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
