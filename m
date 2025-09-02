Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FB4B40E7C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Sep 2025 22:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38bRkEjEkvhnSGwQmmJRWNV1c3+5tpi+hhFOCfcWfFo=; b=gJHjNkE2tY3NEn9bkaslbULgTs
	jmbh19wqnxE3OTw74C85XCCyJg2K424XltoBrlY5qrYH/I3x/JTk9QhQy5UzUXKSuQ5Bh2kAt0FzU
	Xgt9CJ+3MZfR5o4onJzf+CMeqhcxpiX+UXtnXBBKiSWlz/HYE1XvDmLEQI57fB5E8Sf0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1utXUC-0004au-6F;
	Tue, 02 Sep 2025 20:20:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1utXUA-0004aX-5L
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 20:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p3fKOXHD0RaNAZtnh8JdlGGLIwWw356p3KVvC1iW498=; b=QnyyEKXVHbyR0c8wvbBZ5t6haT
 txmFgca64e7yuBWIrV5AnUOfJVQEwojnOxuwxtOh4aScA9bMFDRTdlUWSVgDE2Gh3NCDBds3pYLSa
 v7ULhCBJ2MmEnEHnz+bmwToQjI943v+SfT1j8jRPQbaSdaPW4ub/MovNEyM7qfgFYL+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p3fKOXHD0RaNAZtnh8JdlGGLIwWw356p3KVvC1iW498=; b=XSTtzBKlnyLy31oiQBMebOK+Lj
 WuWqA5vGU4mK1OqA4KHC8tvqQ6vuBqZwUP3CgwarJKwPbhXCzcrlcwAW1RN+Vl0Ow1XxlQVRO53FD
 NSeQTiZ2dql2MIKcwCvBXvjxOXPH6dmRv7i4lyDYqXrozUMZPSLWErLes7MkXj1wmLtE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1utXUA-0004AZ-D5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 20:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 998F46021E;
 Tue,  2 Sep 2025 20:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F533C4CEED;
 Tue,  2 Sep 2025 20:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756844404;
 bh=/2xcc73R0U3F3FIIaEW1j/nAoP7L3W6KZtpLsQtN7tE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bll0bQunktnTELmr+IHgr+TumYgTNAD3AgcaMY8TfTlX87L5Tcq5vQ3rByUv4asc9
 KTiL8tglu58p5LWHJdV72m29ti6rd6sgqTlGHTqdKE2/e4guQb93KtGtCZodPZ+Gtp
 Ab+cqt24GGMCSU5sjkvkTH/0DadTltSSiE0JvQXR+UJ/AgqZDC6fvkduBk4I0OSpND
 iToKZPNI1TkBasZotg/KmiaXR8JjLyFZC6i2MhjujLUOGAOHm4pxcg5Fm+vzlI0FD0
 k1Wwwm/+pqN1KuzDEFdDTeuSV/8ByrlAKqsjuHrwjXt0ZZEu9ga3yr4GnWXpakflr1
 H27ZcrDSmfYVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EBAB7383BF64; Tue,  2 Sep 2025 20:20:10 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175684440975.425353.8499498509115681029.git-patchwork-notify@kernel.org>
Date: Tue, 02 Sep 2025 20:20:09 +0000
References: <20250820043432.22509-1-bagasdotme@gmail.com>
In-Reply-To: <20250820043432.22509-1-bagasdotme@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 20 Aug 2025 11:34:26 +0700 you
 wrote: > Hi, > > Here are documentation formatting cleanup for f2fs. This
 also includes > docs retitle at the end of series ([6/6]) as a bonus. > >
 This series i [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1utXUA-0004AZ-D5
Subject: Re: [f2fs-dev] [PATCH 0/6] f2fs: documentation formatting cleanup
 and improvements
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
Cc: daehojeong@google.com, corbet@lwn.net, frank.li@vivo.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 yuanye.ma20@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 20 Aug 2025 11:34:26 +0700 you wrote:
> Hi,
> 
> Here are documentation formatting cleanup for f2fs. This also includes
> docs retitle at the end of series ([6/6]) as a bonus.
> 
> This series is based on docs-next tree.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/6] Documentation: f2fs: Separate errors mode subtable
    https://git.kernel.org/jaegeuk/f2fs/c/4bc6bf7b8830
  - [f2fs-dev,2/6] Documentation: f2fs: Format compression level subtable
    https://git.kernel.org/jaegeuk/f2fs/c/f23044152af2
  - [f2fs-dev,3/6] Documentation: f2fs: Span write hint table section rows
    https://git.kernel.org/jaegeuk/f2fs/c/f9c97e496293
  - [f2fs-dev,4/6] Documentation: f2fs: Wrap snippets in literal code blocks
    https://git.kernel.org/jaegeuk/f2fs/c/f4f36fffd872
  - [f2fs-dev,5/6] Documentation: f2fs: Indent compression_mode option list
    https://git.kernel.org/jaegeuk/f2fs/c/e78223268878
  - [f2fs-dev,6/6] Documentation: f2fs: Reword title
    https://git.kernel.org/jaegeuk/f2fs/c/62242ac51061

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
