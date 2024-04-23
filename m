Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0DA8AF5BA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Apr 2024 19:40:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzK8V-0001Uy-BE;
	Tue, 23 Apr 2024 17:40:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rzK8T-0001Up-3K
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 17:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nOeRKVnnjWzLheXaHUADw5eFUMjYCjDV5FpcJZv24/g=; b=kqGPIUCJcWUwDXbu+N15VXAQKA
 gSYeeKYq/kMxKUUu7zjllKvSkOYk4ujEXgW0Ni3kjEfvSDuxf7P0uc8v10yczHDghaRdlNYV+TomE
 FzWgRMRRw6VmYfbCP14WsAH9YrazWTfxvF2+MVIST94N/GdsI4NTEW/gsQwybGDTyaB4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nOeRKVnnjWzLheXaHUADw5eFUMjYCjDV5FpcJZv24/g=; b=P8C9cYzsX9LNHRz60ad+tCF+3g
 6NwVJdNTLLibI1jS7RNYA2Tc2zFOFuvY/1Esdxro5wB700/YYD93sSs+L5aQ3MPAf02LfriOn1mMC
 Erwg6DGGY6NUWhrYcVXG5utZ9SMSegRnT7xFLNG9CYPYQy3K7Bg4n7O1Dx7t7mcz7zKM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzK8R-0004Vd-VT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 17:40:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C7260CE1294
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Apr 2024 17:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E87F4C2BD10;
 Tue, 23 Apr 2024 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713894029;
 bh=csQ305yttWc8121lQaZ0ps6dzuiXF2gemEPgqD1hBI8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=J3CPZkxgvYJkxkdETIbuD2lpbvjVFjTyLxO05W0GW+On+ng5WB4dlD4AxZw17EX6q
 NBAOY2sOOltomXyGX8JTIyWX28Ng/Bn6/KSYEz+S3ooNO5+ioMcl6637ipkubmOnwp
 OLe+KYcTqcE5Bld7OdjufgFYyWZf9AG6jqYSuMn9YMZsjaachTWwrdEnNmwHXkLJEr
 r1mLsggqOjEwdz9KlWYvNQo6a/WgZltM3N8wANhAgpALg+9YZbTwmSzQ9oQGMgl1aI
 e0tiqo1Xx5XiUyErT9JXT6zMT1McBcT05KMgqJt8RuatJHGp1tPD0l7PzrT7eNWKUq
 QwReLEte4nhHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C2B81C4339F; Tue, 23 Apr 2024 17:40:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171389402878.11756.2734701646922544905.git-patchwork-notify@kernel.org>
Date: Tue, 23 Apr 2024 17:40:28 +0000
References: <20240422062417.2421616-1-chao@kernel.org>
In-Reply-To: <20240422062417.2421616-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 22 Apr 2024 14:24:14 +0800 you
 wrote: > Convert f2fs_mpage_readpages() to use folio and related >
 functionality.
 > > Signed-off-by: Chao Yu <chao@kernel.org> > --- > v2: > - fix compile
 warnin [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rzK8R-0004Vd-VT
Subject: Re: [f2fs-dev] [PATCH v2 1/4] f2fs: convert f2fs_mpage_readpages()
 to use folio
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

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 22 Apr 2024 14:24:14 +0800 you wrote:
> Convert f2fs_mpage_readpages() to use folio and related
> functionality.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - fix compile warning w/o CONFIG_F2FS_FS_COMPRESSION reported by lkp
>  fs/f2fs/data.c | 81 +++++++++++++++++++++++++-------------------------
>  1 file changed, 40 insertions(+), 41 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v2,1/4] f2fs: convert f2fs_mpage_readpages() to use folio
    (no matching commit)
  - [f2fs-dev,v2,2/4] f2fs: convert f2fs_read_single_page() to use folio
    (no matching commit)
  - [f2fs-dev,v2,3/4] f2fs: convert f2fs_read_inline_data() to use folio
    https://git.kernel.org/jaegeuk/f2fs/c/96ea46f30b26
  - [f2fs-dev,v2,4/4] f2fs: convert f2fs__page tracepoint class to use folio
    https://git.kernel.org/jaegeuk/f2fs/c/92f750d847c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
