Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCE4BB5336
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Oct 2025 22:50:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+JE0YaeyvR5iAnYbvBI/ChNKHMUZbIONxgyL9ZZU74=; b=f9V0uaBK4JDb1NJCuH9gmGCtTE
	1jUA5GD7k+8KrhWGmAp28KZ4eylotRKEcVWFdvmpLQmNCdJ4SsN7hvfZlzGfte8DcMPuKfjsoifYP
	kW/y8QEiH+G6GGPf8dZth80NfO7pOJlqX4AX4mbeAUNFn15axF5qMskX+6F0lLFIJnGA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4QG1-0002pH-7o;
	Thu, 02 Oct 2025 20:50:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v4QFv-0002p5-SE
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Oct 2025 20:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rKDM34Xgle42j7CRHCEHvleWkLtA/uvFKmHh9gDL6W0=; b=moDuhTCSq5p4h6IMHpxbKml6v3
 M6KS7XXU7r9WnAxVH1GUdr+dAFIq8J0DuSsXBv0VHv83V5mB8Qmh992m0E1TavgB5ShLWQy92k9Uv
 HDEM7ZQPR3qaBsFi/GQZBJPU5tdijMtavjbkZHtYi3iG6BNGDTD8lXEiJwESlM+Mr9qI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rKDM34Xgle42j7CRHCEHvleWkLtA/uvFKmHh9gDL6W0=; b=CsWOwaKvLc7GAmgxcOGfEFdWq7
 2mgnO4lfvVBXSpeVj0nWMiOGd7ienp/YpCA5sRKXRs6e3V0TclZcDqiDpW5Rvn0SQ91Lsqoa0kfTf
 CCVNNGZdXkv+/nOAc5LNQKjxj8Usvk7S+rbm2NrkqZIQX2ZvKs1e+BYoIW6x31qD1oqU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v4QFv-0006ww-AS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Oct 2025 20:50:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B7B9063EE6;
 Thu,  2 Oct 2025 20:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682DCC4CEFA;
 Thu,  2 Oct 2025 20:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759438216;
 bh=EXhKnU3EDHpJYtT4b6I9iscaUcjmn1BwkTdxsF58duI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=lFwMJG3Ap/dfw78C5j55wWJzhX+v6JR0pMgVsu9zW59cVqn/ohJlWUo0AloogtP99
 BWTplnBM8DsaVZ17yveyb9Q1q6MQ7saVAVXyW80qy7DazRagQgUL6VXQQB3a3j5CW1
 hWYeAjkpozBHH4hr+g2pZEroVJYkGsf2ldfNOzeT/zcKbMSmz5d5cg3iY7tk6Aey6s
 syY9OgF1iGlY05jZ14SbjFnZowEsy9sloSURiEp6wugZyXuwZF8y3GIKzOLfOhM67n
 oGZQNSzF5nYylq5invIAx22r5oEfWMGJEaa+BVFFJpD8gy8tG6RDMvvniVCXhjDx+T
 FqBpJ5yFIQ/ig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7102039D0C1A; Thu,  2 Oct 2025 20:50:09 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175943820824.3449937.3681276954916769253.git-patchwork-notify@kernel.org>
Date: Thu, 02 Oct 2025 20:50:08 +0000
References: <tencent_3FA2C956B557ED4D050EB26922B50D3CF40A@qq.com>
In-Reply-To: <tencent_3FA2C956B557ED4D050EB26922B50D3CF40A@qq.com>
To: Haofeng Li <920484857@qq.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 30 Sep 2025 17:16:21 +0800 you
 wrote: > From: Haofeng Li <lihaofeng@kylinos.cn> > > Fixes a memory leak issue
 in f2fs_move_inline_dirents() where > the ifolio is not properly released
 in certa [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v4QFv-0006ww-AS
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix ifolio memory leak in
 f2fs_move_inline_dirents error path
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
Cc: 13266079573@163.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 lihaofeng@kylinos.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 30 Sep 2025 17:16:21 +0800 you wrote:
> From: Haofeng Li <lihaofeng@kylinos.cn>
> 
> Fixes a memory leak issue in f2fs_move_inline_dirents() where
> the ifolio is not properly released in certain error paths.
> 
> Problem Analysis:
> - In f2fs_try_convert_inline_dir(), ifolio is acquired via f2fs_get_inode_folio()
> - When do_convert_inline_dir() fails, the caller expects ifolio to be released
> - However, in f2fs_move_inline_dirents(), two specific error paths don't release ifolio
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix ifolio memory leak in f2fs_move_inline_dirents error path
    https://git.kernel.org/jaegeuk/f2fs/c/9fc1840e0217

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
