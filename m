Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7138A436A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Apr 2024 17:33:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rw1qp-0005s8-Rq;
	Sun, 14 Apr 2024 15:33:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rw1qo-0005rp-O8
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oS8Jy0eMzKyQ/X6qQjsYWMc4katASZwEDa9h/OJO4NQ=; b=LFa8f1Mu16IsmiAOBiUueJoS5I
 oWftWR60b8VzvFIlnDIaZhACBQ0ge/krYtx0nJ+pBBh/o5IfoVjibIT+6Xt6HUCTWsOTZRYv1XGqj
 GjF8XqhWTELqQMeLqeM1U3VqCgH3O4GtFJ8jDXKOH5TwSGRbRP5FrQjOxyWBwNaKNTO0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oS8Jy0eMzKyQ/X6qQjsYWMc4katASZwEDa9h/OJO4NQ=; b=ELZQaS6RFEIdRyT7/hP6RIzQZD
 Ix9qLTF+KRiBoF85ooSU2LMOjqTBvHssTP2okeFjh25cuXuTBJoRVTUKfoDA4F6beOQLPOEMQZTAe
 f2AZ0g0riYxKFcHFRIN1fGC4xNlKHLzxz9o8jlWaCGASsg63k8+ZqnBjLqLFooHoWujg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rw1qo-0003XZ-98 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5C98960B8E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 14 Apr 2024 15:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68F84C4AF15;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713108765;
 bh=XP5r+tNZIfyjBLUcPRFNA+/n86YrbrAy+1USxl2Yb7M=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=b3U58jXbhiRcixO7SxrYeN3viaP5f1TiuTsO1SpmAJRY7JyWjROe4LWMxnzz29f6e
 MV6LOHdA5vX6GtCj2Gp6ec2vELA+yiWuqxZx9LTKecljVyl9UkfElo0VswXoIcLZLE
 7RisxD2V51dxzqBv3vZD5xM+cbg6zbd6MK/DlMjEbZz1iih20rEsZuCRaiSY/Euz11
 7Y+aZUjkW3IM9fg9ONQ6mhACjMSQd5zJO3zsRyNH+K5MLFxLULoY9i2x3kWQTvHAwY
 EupD+O4K5JYC96AwrG6UQshAtuaYIg8w84vI6Kk6/UreaZTbuLleS1tUAsSrRfK1SC
 Pm5F95OsA5n7Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5EBA5C54BD2; Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171310876538.3156.13252543010305378253.git-patchwork-notify@kernel.org>
Date: Sun, 14 Apr 2024 15:32:45 +0000
References: <20240409203411.1885121-1-jaegeuk@kernel.org>
In-Reply-To: <20240409203411.1885121-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 9 Apr 2024 20:34:09 +0000 you wrote:
 > Let's convert PageWriteback to folio_test_writeback. > > Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> > --- > fs/f2fs/compress.c | 2 +- >
 fs/f2fs/data [...] 
 Content analysis details:   (-7.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rw1qo-0003XZ-98
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
    https://git.kernel.org/jaegeuk/f2fs/c/16778aea9186
  - [f2fs-dev,2/3] f2fs: clear writeback when compression failed
    (no matching commit)
  - [f2fs-dev,3/3] f2fs: fix false alarm on invalid block address
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
