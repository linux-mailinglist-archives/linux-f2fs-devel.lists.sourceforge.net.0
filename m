Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB108B1154
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 19:40:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzgbs-0004Po-55;
	Wed, 24 Apr 2024 17:40:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rzgbr-0004Pg-3O
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 17:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KPSLr68nVDIAGiO1qAkR0a7Xuwion50hBrWWXH46Yzg=; b=gHgRJNnWq+O9hCjuiY+QfllW0D
 7/Ox2FORiKK1m10darwRXf8ygw0BI1VQew5k9ua77oCjbnKMc0ItG8NHKSbi5ExAAIOHJ2F/hjcF4
 D7kSCFeGNHryejfUI7UTHHpaP712GahdeV42cMejQ9Cbn1hWjnIcZW+hP9YM7SjGLLMQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KPSLr68nVDIAGiO1qAkR0a7Xuwion50hBrWWXH46Yzg=; b=d7aVIbJFXmrTZeZ01dEoZmA1k+
 FHgvsaERBP/hQKPjENnmIVgvqBJdWK2n9pGSjt7OsZUgGc9WWakl89f9DdBtKJm7bs974RsSJeKAt
 3Ob0skZjaQ4l7cDSMYqYXwGNLZ1jvBHSZXZic9lyfiKF0mf2/jyoI8B8o/6a5S5Y2upQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzgbp-0004lk-O2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 17:40:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 84D6CCE1814
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Apr 2024 17:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A99A1C2BD11;
 Wed, 24 Apr 2024 17:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713980429;
 bh=cnMh4lZ8/DF2nts885keD3oVXLmD1/qliCT2gQ+qeR8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MJhb4G212OVVVFLWHMt8RXJ9Y735f1eTRks8+loZ8XR2iJGoHvjNweOgmLCk+VVvT
 2mxreSsKbVbzop6g+K7+LLHIcShmtQuzBQ+cLd3EPekMc37Cmj2NgfjUJ/ETD/NdZA
 cfeih1xiGj3OZsQAdV8CuGUgBIeoallpp3Ax2pnt2lqXOZbdIhLXipKlXJKHRx82jG
 hW8LzOn7TRUiIgm9p9/v6ckSAfk9vnErUrcUGJVe4DtbqTNqWeNvVSA+Vo8FNpzXcF
 37Vc1URkXcgmJHPJ6dRZjEgbTeelrISV4JAvAQlBOTmjt0uL263/X+2MwuSA3XCvbv
 xJafJ6eKK6j+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 91EF2C00448; Wed, 24 Apr 2024 17:40:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171398042958.20673.10102364996945847109.git-patchwork-notify@kernel.org>
Date: Wed, 24 Apr 2024 17:40:29 +0000
References: <20240409203411.1885121-1-jaegeuk@kernel.org>
In-Reply-To: <20240409203411.1885121-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 9 Apr 2024 20:34:09 +0000 you wrote:
 > Let's convert PageWriteback to folio_test_writeback. > > Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> > --- > fs/f2fs/compress.c | 2 +- >
 fs/f2fs/data [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rzgbp-0004lk-O2
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: use folio_test_writeback
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue,  9 Apr 2024 20:34:09 +0000 you wrote:
> Let's convert PageWriteback to folio_test_writeback.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/compress.c |  2 +-
>  fs/f2fs/data.c     |  3 +--
>  fs/f2fs/f2fs.h     |  2 +-
>  fs/f2fs/gc.c       |  2 +-
>  fs/f2fs/inline.c   |  2 +-
>  fs/f2fs/inode.c    |  3 ++-
>  fs/f2fs/node.c     |  2 +-
>  fs/f2fs/segment.c  | 10 +++++-----
>  8 files changed, 13 insertions(+), 13 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/3] f2fs: use folio_test_writeback
    (no matching commit)
  - [f2fs-dev,2/3] f2fs: clear writeback when compression failed
    (no matching commit)
  - [f2fs-dev,3/3] f2fs: fix false alarm on invalid block address
    https://git.kernel.org/jaegeuk/f2fs/c/04890641bf1f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
