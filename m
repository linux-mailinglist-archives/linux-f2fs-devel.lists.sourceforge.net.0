Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CDAA9FD28
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Apr 2025 00:40:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvxvkVZVxCczF8X6EVcI9N8hFYuI0PFfibQu2b+bmFc=; b=ixDWEjaWg9NjDjPbbCA4PpHYPV
	3llcRMH+0opPvdJ+4KHRRZHstAzLaqMhJTZ+b05J3MFv/0sxdYVZn+wkMb8wn3en2LWZ9kz8n3Ryz
	/v8GwvpYURvjX6l57q/MP4fDaAynXi/VJ3yd8fh2n0y9YA1qH6kHPch9CQsjRtvnkLjY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u9X9m-0003kN-Gx;
	Mon, 28 Apr 2025 22:40:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1u9X9c-0003jv-Ke
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 22:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wNi34zTbVbXPQmOfkkiUaRo/Bk5M8sYSOUmNZKBfYv8=; b=CquSgZaTxEhR7zTGHybhsnv14B
 fHPmxBl7xmFxRu8mwLa3hPb1A+cTcMOlpP1IMLuLr6ocSFAyBOys6j30TqU87OTSjbN1eWOSD/afM
 XFjC5j/sMwplxmrTD25eW75qPKpJM4RynUWhruonL/4y0/0Ni4UHVpeQNU20ciUvCS2s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wNi34zTbVbXPQmOfkkiUaRo/Bk5M8sYSOUmNZKBfYv8=; b=Wit6D8atjP1IXFoVB41LFSb5fh
 taIxQ5ilMZaTJd/CqbdxTcSj2/roy/GWUyhxiZPxJ7abEYe7JTsT6nRhW7H6/s2Yw4ZjOr2XkaK65
 M1DyJ+dtyXn67A8GqXB+uO4UAr/ySCyBiVg29HrPRgKVtd/n3Bm7CJwuwWYwyHsgXmAk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u9X9J-0002KU-Uh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 22:40:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 72D225C671E;
 Mon, 28 Apr 2025 22:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48802C4CEEE;
 Mon, 28 Apr 2025 22:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745880019;
 bh=hW8OBlEtNhGteY8BD89YhPa5txGl0BrBpZfLGBY/d7A=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=lIRmMbgH90LNqQELKn/Ngr6Upt/UUJxwIUtHrjqPgugfamIJF1AL5FQcF2d4HfhNe
 fW7k1ZyHFwE8dTAxXS0ppCdOwividCqjAm/4iPkGhO5Zjx2xLgHI/LJ/x591fpBaYQ
 7kN7zsScKHBsS2bRjU0vb2hsz/MlB2WN4nuUjL/lBiFz3kGQiGx+3/OrEAGUsBogY7
 dIxaEhnsjK5jaIDQz+sZoj1HYIiZ1Prs/3S1Je/qJl3RG+53tGU4JDVXJ2k/Sxrt3n
 fSdczVIUHpxQcB5Q4DjTC6IksugcdbNOdjaJgS1dU+hmYV47a3rm3skSqi7CCH0xoa
 WHicYTqlkTXPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70BFD3822D43; Mon, 28 Apr 2025 22:40:59 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174588005823.1067750.16743465439008922626.git-patchwork-notify@kernel.org>
Date: Mon, 28 Apr 2025 22:40:58 +0000
References: <20250423204935.2335000-1-daeho43@gmail.com>
In-Reply-To: <20250423204935.2335000-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 23 Apr 2025 13:49:34 -0700 you
 wrote: > From: Daeho Jeong <daehojeong@google.com> > > In cases of removing
 memory donation, we need to handle some error cases > like ENOENT and EACCES
 (indicat [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u9X9J-0002KU-Uh
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: handle error cases of memory
 donation
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
Cc: daehojeong@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 23 Apr 2025 13:49:34 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> In cases of removing memory donation, we need to handle some error cases
> like ENOENT and EACCES (indicating the range already has been donated).
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: handle error cases of memory donation
    https://git.kernel.org/jaegeuk/f2fs/c/ad5291e2c1e5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
