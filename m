Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A3C8AF5BC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Apr 2024 19:40:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzK8S-0005gI-S4;
	Tue, 23 Apr 2024 17:40:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rzK8G-0005g1-LM
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 17:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TC1yl0D80I4+qfJCcxvXo3avYPhk/C4Y0EbUYEObPLg=; b=htm06mM4wJdbavqi/v4L8Op0J8
 XCfCJEXhLXLGs1F7GLvyxM6ShNMGr1PdJMJKShsxPcd9zl+2NAyk/KhXgvAkthMQscp69YqETlERN
 vIHlzamdbZTWS95Mc2aF2YPyiUaTjiwV5e0rQde26xI1T8glMlMnHFZRmYHSQHMx01DA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TC1yl0D80I4+qfJCcxvXo3avYPhk/C4Y0EbUYEObPLg=; b=j2hfgj7ozS80YvjkHjZRa2jq3B
 M2bUMZeOM2v3hj3v2eKvs3bZpcxG4qaw28oDsBKfrHEm/oM8LIwSDIGlH4OtXe1iabTFga7O4itp5
 sHcpS09WYCl+RbKZ1BghJxGjxK5lRNicfp7HfrhJ+Ktg4JzV9lZLh964/z9ikwgmJZrs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzK8F-0004VY-K6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 17:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4F350616BE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Apr 2024 17:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC7A7C2BD11;
 Tue, 23 Apr 2024 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713894029;
 bh=ZGVdiXH50qmWUKxvs/Sh72iae0mXIJYxi+k9XKbTZTE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Km8eWQMmdI+N9W5/tFoMg2J/NS4lZLmsFHRpRevL0nL//3/qMUcjuFVb9D2cxUB8e
 hgzY8hNFPGgORiBG68c19AGvA06Y6+8AAjYLWD14fUbigh4JQxFI9Z3ab945JlpLYm
 8FKX3YKavNqvLzdGzDTMmdttclR8NIynini5/KVHIZrHf+1DOTd8kLW9TuxhQy2b6k
 FQ/ETqiW4S2YrdolJeNmFSblx/bLyC2RBigojgIxFJtbC5LD74py7dVl7O6xAA6aMP
 I6oJMUr7NXV2VlbKzkaV9pjnRjw9lnRM7ioNSQbZyEafK//xFeDmxbDN3AKlyfJZ79
 MSG4QuxXfFSbw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CE48DDEC7E1; Tue, 23 Apr 2024 17:40:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171389402884.11756.5936531495937723538.git-patchwork-notify@kernel.org>
Date: Tue, 23 Apr 2024 17:40:28 +0000
References: <20240416072108.5819-1-chao@kernel.org>
In-Reply-To: <20240416072108.5819-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 16 Apr 2024 15:21:07 +0800 you
 wrote: > Commit d7e9a9037de2 ("f2fs: Support Block Size == Page Size") missed
 to > adjust comment in sanity_check_raw_super(), fix it. > > Signed-off-by:
 Chao Yu [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rzK8F-0004VY-K6
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix comment in
 sanity_check_raw_super()
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

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 16 Apr 2024 15:21:07 +0800 you wrote:
> Commit d7e9a9037de2 ("f2fs: Support Block Size == Page Size") missed to
> adjust comment in sanity_check_raw_super(), fix it.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: fix comment in sanity_check_raw_super()
    https://git.kernel.org/jaegeuk/f2fs/c/5bf624c01229
  - [f2fs-dev,2/2] f2fs: remove unnecessary block size check in init_f2fs_fs()
    https://git.kernel.org/jaegeuk/f2fs/c/06b206d9e2b4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
