Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2956FB283FA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 18:40:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Po7ppZAOgLLn45I+JJMJVNmBxU0BurFceTJU7bpEHlg=; b=UE4muc0zBn18X0ESWOHheAJbiv
	257R7fSHlO8ppMuvHRzlJDk5hEoYNUoKvZGEr1yNrGIaSY9c07gbFus+IRBOWHN0ird/CpYaHj5g7
	+xYjVNTmFlOCtHuxRTZhNJqeiymOzgEJ9bVpILMklixYZ7hPjAHe2qMzkt2cdkX07RVc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umxTU-0008Ap-Vz;
	Fri, 15 Aug 2025 16:40:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1umxTT-0008Ad-U8
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y/m9DYNjim2QeH2i2TOKvCMG0OrCgbGK0DHjCl+90Eg=; b=A+iBSZ7tdDI8ltvkSTHbyTtaL3
 y7FIuTXZO4I8r6R9WADuSWnqKbhKrfV70XcJ2u06vWS7A3tt0rE4afmyoNBK8ON6FbFl5uZFqW0az
 2ZB6x9uBgPWknJpdOmo/XmM2lLr5c/lzz52toPLIgE71qmJFgvC1HszBKzaXZevkNK1g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y/m9DYNjim2QeH2i2TOKvCMG0OrCgbGK0DHjCl+90Eg=; b=K8tq1JsZp8hSCiYBJtGXeIuDAM
 gAtzhRivak3NQElz08m9NCXLPt/W5elLLV6v8ymrMt+VDSzMBZ/sURVfP/G9221Z1K2lofCNTzzF6
 AHMsQTAScV4yrCCtygEmHFU/Cjaoq9gK6+op+6AParERzqXNWAgjqQAbUH/cNNgM4N7E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umxTT-00018a-DC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0E8C55C54B1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 16:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2BA4C4CEF4;
 Fri, 15 Aug 2025 16:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755276009;
 bh=xtXYrwV7vztFKIXogJ7dxVkOMx90AXRfJ7vPLXPkc2E=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XSTS0VFpWVumB4m/cJJao0CYY/Y34vVayul4C6zrdmtyEej4C3Aelk9yefBRPGyu3
 xAqFzk0TuSzMPX1r9yKgH6WBvUCJXIMNqzY89PxqJmW7b7QDaw8rT/dsn0Y3ckBLR6
 q1iGzlBmmTnlx0LB7Iv8+Xd430VpyNBZwMg8HAeBsO0srgVmusqrmVK5L+L/Deap8h
 FkXFmElpnYrLNoz4FNHnhJEcslwK+/k/V+t7d786VppvNjWBeTnud+9hwnI2VbvNUb
 Bl7NY1JbwH8kWNCqxU6LPx1cvtmjlEe3yG9eTc4XRiQDhTk76SEmL+imURbqK7bSvx
 1aMil/Eit0tVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33BDD39D0C3D; Fri, 15 Aug 2025 16:40:22 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175527602073.1161945.5338356216953620697.git-patchwork-notify@kernel.org>
Date: Fri, 15 Aug 2025 16:40:20 +0000
References: <20250811114123.1085143-1-chao@kernel.org>
In-Reply-To: <20250811114123.1085143-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 11 Aug 2025 19:41:23 +0800 you
 wrote: > Introduce get_left_section_blocks() for cleanup, no logic changes.
 > > Signed-off-by: Chao Yu <chao@kernel.org> > --- > fs/f2fs/segment.h |
 28 +++++++++ [...] 
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
X-Headers-End: 1umxTT-00018a-DC
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up w/ get_left_section_blocks()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 11 Aug 2025 19:41:23 +0800 you wrote:
> Introduce get_left_section_blocks() for cleanup, no logic changes.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/segment.h | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: clean up w/ get_left_section_blocks()
    https://git.kernel.org/jaegeuk/f2fs/c/3ea4ad0a1df0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
