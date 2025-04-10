Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB5DA837AE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Apr 2025 06:10:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u2jFG-0006gx-2D;
	Thu, 10 Apr 2025 04:10:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1u2jFD-0006gb-9M
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 04:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PJQqeRXoWhCcPlzzD2+eAp2sFZbrOtN3HatOhmFsw3M=; b=Dw4T1c7LxhUSIzYaNdDl3/8oIl
 lhZG67srgn62UkScC4Jg1oWmxkkoSuB0fa+oWGxRNiGAtUyavSoJHkwvE0ePmtrdJRE2nNDU8buXd
 0vaN1gkrWNcXLw9/UsCApYLzmLv1QWk43YKsFeHL+VxE3EX1iBEpc+9usJ08BQA2kP/o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PJQqeRXoWhCcPlzzD2+eAp2sFZbrOtN3HatOhmFsw3M=; b=Y4k4f5u9FuRZX5sCMTMTVt38iv
 nQYXxcMxgT45wS2KBKEQ1+RPWquDgZgInPMuxeX5BU30LN8AMLiJc/xCnCnXKVweXhxYtEYZsVwkA
 znChnOb/Yw76Nw0pqaeO9xh8o4NucyMr+Lnlwt+GDhv5AakA31ZrI5ynLejFNGVWjvzg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u2jEy-0001Ar-7h for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 04:10:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B2A256116A;
 Thu, 10 Apr 2025 04:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE83C4CEE7;
 Thu, 10 Apr 2025 04:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744258201;
 bh=3D0KxFdT7AaX3IlEJQU4ODQ06zsDhm92FFBCaoIfeG0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pQdToegWpr7tOtIQL8BNqnnlcFNI0/LV5zIcgRxVR9lXOGZGg+TMU1ubuAP+W4q7e
 8Mc2A22Mj5yRHzL7UoCf3UNadtD1zkg2Opk5shiKTZEtUb43oSzPCVPO1cbljPTC2O
 yRkpcTMAJPNV/vxVM2PTwv0KMb9/X6gFJO39F1d/fmNz/WpMzaOD3z+/2pXYeoZ0+i
 amepeZETQBKkorGzKzptELKeIV8U3ns2DciOFHd6NsIFe9tJya47egOsuEQoyiwowE
 X9crj2mIXV/BGsXikaFOutpes7tLaseAnxJ/TTS9MUqXu890e121y6bWP4FbDzWzme
 EohSGnfnw8MRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33D61380CEF9; Thu, 10 Apr 2025 04:10:40 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174425823876.3146257.767452728339565870.git-patchwork-notify@kernel.org>
Date: Thu, 10 Apr 2025 04:10:38 +0000
References: <20250327055607.3829954-1-chao@kernel.org>
In-Reply-To: <20250327055607.3829954-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 27 Mar 2025 13:56:06 +0800 you
 wrote: > 1. After we start atomic write in a database file, before committing
 > all data, we'd better not set inode w/ vfs dirty status to avoid > redundant
 upda [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u2jEy-0001Ar-7h
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to set atomic write status more
 clear
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
Cc: jaegeuk@kernel.org, zhiguo.niu@unisoc.com,
 linux-f2fs-devel@lists.sourceforge.net, daehojeong@google.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 27 Mar 2025 13:56:06 +0800 you wrote:
> 1. After we start atomic write in a database file, before committing
> all data, we'd better not set inode w/ vfs dirty status to avoid
> redundant updates, instead, we only set inode w/ atomic dirty status.
> 
> 2. After we commit all data, before committing metadata, we need to
> clear atomic dirty status, and set vfs dirty status to allow vfs flush
> dirty inode.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to set atomic write status more clear
    https://git.kernel.org/jaegeuk/f2fs/c/db03c20c0850

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
