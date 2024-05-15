Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E59E8C5FB2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2024 06:20:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s768J-0000aL-OP;
	Wed, 15 May 2024 04:20:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s768B-0000a6-Pw
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 04:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9uansXsnQ0QZytJOrKMffrKk4hBDNu6haGOGg+526Hw=; b=giU3SaqSjkZ2lwsWEpSe+5/O+f
 KINeks1S3SbbYErnbcPs6MHqdl2k8YyPPg3lswJTRx8VKOsZEMK/CZpVuUCTGT5wKSBKD8ZHIcW6j
 cNrBXBHu2fTkke/6zv/sihBVS09zecKFtS3HSfIuAYLPWGLo0KZ35JYJsYMQwuCmkkdU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9uansXsnQ0QZytJOrKMffrKk4hBDNu6haGOGg+526Hw=; b=Z/1qfjsFkR97dolJshDgzwxvN0
 U9yg31Fhhv03QnWyNCFaHtZKNEn4HhT6o4zqLIc5y+gKtn3DTYsb5cNNkyaTxlm7kXR8I3SMslEm0
 eFLkUorFen2WQ3/gnt+Sujhwxqt6kFljrlOAfxIkrhhRhO7Z4lPVK19Pl0SwJSkaV6Zc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s768C-0000A1-7r for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 04:20:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AAC07CE1395
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 May 2024 04:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 158A3C4AF07;
 Wed, 15 May 2024 04:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715746830;
 bh=1ofwj436NrM34CmDoFPWr6B9luRSA0vYiPnU6O+IvR0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=slhaMT9U5YMhWbSV4GckC1qRJExaU2zxOEQNKR9hn/uCYRM/hHLiecfvi68CUT9Ij
 WY628LpcAEpydEm6eX9jMWsusEZRw+bzIOolJgSzLtgmG+QfQjIB3WW3au4PatxP8X
 kid41D7Tf4CY5CVVUMrFA/LiA1djzc2Q28oW0gonLIovExihIP9S7/8WtewByOy2/c
 posgsjqqWM8L51l7Z7lGe1av6n1J2VP/1Se8YoizXp/kushG6kSYTkOZ7aXFqX5Ptt
 GJl2e8/YgnWj/6UlMBrmSkLgPOwhQcONyQQYm5FHEDHXGzPTue1gabrRhy57awhT+O
 rm8xbULO1hBlg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 02D95C00446; Wed, 15 May 2024 04:20:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171574683000.29254.6275532589303918207.git-patchwork-notify@kernel.org>
Date: Wed, 15 May 2024 04:20:30 +0000
References: <20240513-f2fs-add-missing-inline-to-f2fs_build_fault_attr-v1-1-c3ce1c995fa2@kernel.org>
In-Reply-To: <20240513-f2fs-add-missing-inline-to-f2fs_build_fault_attr-v1-1-c3ce1c995fa2@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
X-Spam-Score: -3.5 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 13 May 2024 08:40:27 -0700 you
 wrote: > When building without CONFIG_F2FS_FAULT_INJECTION, there is a warning
 > from each file that includes f2fs.h because the stub for >
 f2fs_build_fault_attr [...] 
 Content analysis details:   (-3.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s768C-0000A1-7r
Subject: Re: [f2fs-dev] [PATCH] f2fs: Add inline to f2fs_build_fault_attr()
 stub
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
Cc: jaegeuk@kernel.org, patches@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 13 May 2024 08:40:27 -0700 you wrote:
> When building without CONFIG_F2FS_FAULT_INJECTION, there is a warning
> from each file that includes f2fs.h because the stub for
> f2fs_build_fault_attr() is missing inline:
> 
>   In file included from fs/f2fs/segment.c:21:
>   fs/f2fs/f2fs.h:4605:12: warning: 'f2fs_build_fault_attr' defined but not used [-Wunused-function]
>    4605 | static int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
>         |            ^~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: Add inline to f2fs_build_fault_attr() stub
    https://git.kernel.org/jaegeuk/f2fs/c/0d8968287a1c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
