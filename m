Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B46685E541
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Feb 2024 19:10:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcr3N-0002Qz-WA;
	Wed, 21 Feb 2024 18:10:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rcr3M-0002Qc-FX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 18:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=238pMWPChrlDSdz6q4jawt1pIw/aZQuswc01cPLpISg=; b=i8YbWd3AFARyY6GO3+OAKI5+pJ
 W8oRA6JP9pBH66aZjLS1uxGqEentsDoHSr4v7j0/YQUr8BwBIxOmOrLmRCxD2WXqcHGTd71l3VNtM
 vJveVT5BopuZ5oHsw/UylRX8qjL0H2OElmhTKxpl0IYUBJ4mZaZWh68WZoy+6yqMP6J4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=238pMWPChrlDSdz6q4jawt1pIw/aZQuswc01cPLpISg=; b=JStp2XnlhvJz3QqSwUiCYJBriO
 wB2dJgd9dOBUrx1klnXAdeRDNMCJyt2JNT7J8kDprR+cbAqjV6qHuO68B8TiMrGU6ipmpITDNqsVi
 W/JtykFUR5skuXr7WG/soP5bFnt21g1S0iJhkRRj+t2KqVUHNcbiF6M6OTlOGbKg1XKo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcr3L-0001Ss-As for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 18:10:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DDF94CE1E67
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Feb 2024 18:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31AD3C43142;
 Wed, 21 Feb 2024 18:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708539031;
 bh=Eiv/YLnfASz+VNUWTijOLpOzpUDiDbtt+b2dmVCeOvM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hYth7c4vF1UPaQ/l41N8pJ+nNr7wDyHwM0Xecblvj7Ian91PAzjFyCoIlPRsLyvap
 JaBmOmZ6ClvhEkuVI0v2ra+f/3ZPe7fFQX6YEWX4K614qlNbW0nKzk8E4CIt4j5pIa
 S8FNn/A6+aYiwP/LFQ0T5hfiIVNfzHk8ylD7dl25qc5WosINLAyPzzzuqdmjLEZtZh
 R/Mw2e/Y52pFheHvpSnrnPFRBWgQ+4yi2W2Zhr5SjJJdyMATJ/0Kje2F+0NIHnAK7U
 OUTaOseRBFR6INjnEXj7AA7A2RGeC+u9WawQb+altx1oa5jDBriH7S6FtoTkVweLIQ
 jMiaon8Bb3U2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 186D0C00446; Wed, 21 Feb 2024 18:10:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170853903109.7043.1946520344945151246.git-patchwork-notify@kernel.org>
Date: Wed, 21 Feb 2024 18:10:31 +0000
References: <20240207005105.3744811-1-jaegeuk@kernel.org>
In-Reply-To: <20240207005105.3744811-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 6 Feb 2024 16:51:03 -0800 you wrote:
 > Let's deprecate an unused io_bits feature to save CPU cycles and memory.
 > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> > --- >
 Documentation/filesy [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcr3L-0001Ss-As
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: deprecate io_bits
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

On Tue,  6 Feb 2024 16:51:03 -0800 you wrote:
> Let's deprecate an unused io_bits feature to save CPU cycles and memory.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  Documentation/filesystems/f2fs.rst |  2 -
>  fs/f2fs/data.c                     | 73 +------------------------
>  fs/f2fs/f2fs.h                     | 25 ++-------
>  fs/f2fs/file.c                     |  2 -
>  fs/f2fs/gc.c                       | 10 +---
>  fs/f2fs/segment.c                  |  9 +--
>  fs/f2fs/super.c                    | 88 +-----------------------------
>  include/linux/f2fs_fs.h            |  6 --
>  8 files changed, 10 insertions(+), 205 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/3] f2fs: deprecate io_bits
    https://git.kernel.org/jaegeuk/f2fs/c/87161a2b0aed
  - [f2fs-dev,2/3] f2fs: use BLKS_PER_SEG, BLKS_PER_SEC, and SEGS_PER_SEC
    (no matching commit)
  - [f2fs-dev,3/3] f2fs: kill zone-capacity support
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
