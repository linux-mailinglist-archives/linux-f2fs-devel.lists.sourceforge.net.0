Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 411A2681F3B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 00:00:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMd8b-0003di-Et;
	Mon, 30 Jan 2023 23:00:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pMd8V-0003d7-Ez
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RmE0k29mybQY5WLzLH0l0NYCVkCyWR5tTi5g8vamnlk=; b=jK/ee0WFTAuzOBuDKNjhwmBfF8
 r8/guAefBPT/2JG2ennThYadi6gVjUw1ctRFLdUqVpZjPjLzcI1wsVoZAIE0AoxDzjfgpWqp8RYHH
 /VIzhk/RZ3wHD8AdtFMliKakfbqvm9URGA1c1dWr38Ck6/RzbUmijfHNbuMdQ1C19VtE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RmE0k29mybQY5WLzLH0l0NYCVkCyWR5tTi5g8vamnlk=; b=La2HEDJe3eSa1mKPCDQy2gvJHW
 w7yDFaa4G+Uow1GaN5f/EiijyMuBZGRtBKwSuP4j56R1nuPSUgneh3MTqsCGw4XZAEHgVUL/NHGtQ
 ML9xG2XBDIwnkoWWkivBJPi+dxUAsDTbO1RR/UBoNKsl2Tz/xfH8lv7RSuLzComV5AfM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMd8S-004OGU-8z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:00:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DEF8E612FB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 Jan 2023 23:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27A72C433AA;
 Mon, 30 Jan 2023 23:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675119618;
 bh=umkF9ddrYQfLVnvHs4hapm7fWtMrN53sEfGlRBENlWs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OG8Hu/poBUEyWHtprU2VhELWPuJdYJRclmxs49CSlj/YQZvLie05PO4Y2LTSImOGo
 iAyJ/hGhrmhDusgGiP7ghXVN6g00A4/bLYJCy9tAer93TSmnmMCEDAgtz73k6vl4Mi
 bOPk/jFmiptSdfofSDWEHnrO1t4+bpuY1UZHK1oMhffaCOdIh+jIL2ORu2idZnpgEE
 k6lvi+VcXrIUJSPyI3HiiCtditcXttHV/RcYIVZ9Wf/ZVQ6nP5DtiQO3ORnfvz3lN+
 aEJryQ1CsB45vmkEmRa9BO1YfPQHhk0wPqlkDeC83DUa4MV6wX9uQUvaeXW7f5EIFu
 f/updMwlvaZcA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E9368E5255C; Mon, 30 Jan 2023 23:00:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167511961795.12751.16077999668439439794.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 23:00:17 +0000
References: <20230109034734.491518-1-chao@kernel.org>
In-Reply-To: <20230109034734.491518-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 9 Jan 2023 11:47:34 +0800 you wrote:
 > f2fs_rename() has checked CP_ERROR_FLAG, so remove redundant check > in
 f2fs_create_whiteout(). > > Signed-off-by: Chao Yu <chao@kernel.org> > ---
 > fs/f [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMd8S-004OGU-8z
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unneeded f2fs_cp_error() in
 f2fs_create_whiteout()
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

On Mon,  9 Jan 2023 11:47:34 +0800 you wrote:
> f2fs_rename() has checked CP_ERROR_FLAG, so remove redundant check
> in f2fs_create_whiteout().
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/namei.c | 3 ---
>  1 file changed, 3 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: remove unneeded f2fs_cp_error() in f2fs_create_whiteout()
    https://git.kernel.org/jaegeuk/f2fs/c/8abe4be45132

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
