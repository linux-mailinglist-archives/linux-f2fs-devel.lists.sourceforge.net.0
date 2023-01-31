Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25754683621
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 20:10:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMw1a-00035V-3f;
	Tue, 31 Jan 2023 19:10:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pMw1W-000357-Aw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 19:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+xtwxRbkpGTb3I/he3w3tkHtksjHS9rgt0DJtFW2MBI=; b=ieDB6NvcERlUDDYfRbmCQ/7oDj
 F7z2jkIKmaweRMCFXyybqRjAE28hGh6i4bvnCLtj3DaszCHGnIskbNlPJL/w7HnxO0mYxtG+x3RAr
 FPrn5x7DF8AQyvznmLTkzjiLLT5FJxPOUuWMjieRhGXCZ/I7tzoj+ZrV1Pi+vlrX/ctE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+xtwxRbkpGTb3I/he3w3tkHtksjHS9rgt0DJtFW2MBI=; b=bJ2tFhRWBcKNIQKBgGopsQ44zP
 w8nBpOb+1FlBmHPtPM4tq24tQZU4jIhSMpDmt+7g/u9iCAGv0eRc5dUz36lXkveIfQlqDeLP30OCp
 9wd7Ae3VnNpMEMwrPbBBpOVyOtRKIkgZmbsqHoSxPXmQEKWzP/59Ao368h2kIdLDK5kg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMw1S-005sYs-8P for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 19:10:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D385B616C4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 31 Jan 2023 19:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40AB7C4339C;
 Tue, 31 Jan 2023 19:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675192220;
 bh=5NLjWCifPKsQYHmWtcs0Dc3TPZQumXh9dKHEVGxZPRU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MDsfcKYIuZoY8ld3wB8Px3FT0Jrg1ZliYZ/XGhL0ZqH0vmue+4xOIr7zVR3NoaUAG
 TjkIlQmlgP1B4QiRIFDQCN3Y7unvvpLV7NjyvQDNcq8D9z2TfJaGmwr02qBtGFt9fF
 WoTg9rlZYfHxIzjPPK7/2aGVlOTsv0T4g/s5shDfnF/8V7Be5/A240c2h3fiDdZYp5
 MJX5AyXq2HD2aZkDWLZaHSiD2CSJJwyV5UyYBV+cbj5IuBiBZ6AemZ3tROjELkdl3w
 Rem1nQFch3t0UTX8t7tLJmyDIwlS1eUrGOLc+iI61U8aTJTnqcCzt0FxA/r+T0XkBc
 6j48/Z6ezlqyw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 14C76C0C40E; Tue, 31 Jan 2023 19:10:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167519222008.20142.15227307379912347562.git-patchwork-notify@kernel.org>
Date: Tue, 31 Jan 2023 19:10:20 +0000
References: <20230130012012.2078978-1-chao@kernel.org>
In-Reply-To: <20230130012012.2078978-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 30 Jan 2023 09:20:12 +0800 you
 wrote: > This patch tries to use bitfield in struct f2fs_io_info to improve
 > memory usage. > > struct f2fs_io_info { > ... > int need_lock:8; /* indicate
 we nee [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMw1S-005sYs-8P
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: reduce stack memory cost by using
 bitfield in struct f2fs_io_info
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

On Mon, 30 Jan 2023 09:20:12 +0800 you wrote:
> This patch tries to use bitfield in struct f2fs_io_info to improve
> memory usage.
> 
> struct f2fs_io_info {
> ...
> 	int need_lock:8;	/* indicate we need to lock cp_rwsem */
> 	int version:8;		/* version of the node */
> 	int submitted:1;	/* indicate IO submission */
> 	int in_list:1;		/* indicate fio is in io_list */
> 	int is_por:1;		/* indicate IO is from recovery or not */
> 	int retry:1;		/* need to reallocate block address */
> 	int encrypted:1;	/* indicate file is encrypted */
> 	int post_read:1;	/* require post read */
> ...
> };
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: reduce stack memory cost by using bitfield in struct f2fs_io_info
    https://git.kernel.org/jaegeuk/f2fs/c/998863dadd2c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
