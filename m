Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5558788DD7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 19:30:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZadj-0007Op-OF;
	Fri, 25 Aug 2023 17:30:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qZadh-0007Oi-V2
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 17:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B4xJE4LCyVtyW0T9xK0HVhuAHA5po8eJw1RW08ssPSc=; b=SVrs0o3RLA845iOlyiR67AS+NN
 dw2XxzX57IoIyYvXn3ABWOY1Ljs/vRlpObyq35AClf0q11PchT9SszcZxOCAoTXu7B2aAixsMD+dt
 mhsc+pfyx1z8BcbGd19R+Cc/+uDEqO7xCmIyWK2WcNHYdMu5rG6XpZAuYOIbPKew0KXw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B4xJE4LCyVtyW0T9xK0HVhuAHA5po8eJw1RW08ssPSc=; b=A/X5qwK+yqSfUXd+nzPbeoyjFD
 jVM0Y7mPG6ofUoFvywSstud4clCGL4x41hB9sC7bB5Kq+qNf32XHLYB613tsVNg0cjTS1ZYIUlKiq
 WzXSRJIDpCr+45iQodiCMMLI+R7CkCgUsezr+H1CvJcs2ihtgjk0iI6UjZvocs6px4rY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZadh-00FQUE-K8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 17:30:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB28361AC6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 17:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F643C433C8;
 Fri, 25 Aug 2023 17:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692984623;
 bh=NlWpnNVhfRA0pr9OI8zi0gQ3AyEhIqlbLJ1wMzpB2Sg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oxA1YDKhvxvw4v/ezGGdBZGZTjNOsDVddc/YsybZ6kfNlq0opoWqvPGVF5fS0K91U
 gtcQqOmseY1l0+3qJEKPGB/lk7Y9N9OfR/nqtGwWFJlLgtp16L+tnA9FXPfVACKeyA
 dWSt7nKXknNKFVU0Wd6cjMtjo5Es9v/3wc33zAbL7/JvLwsZbSGSrshZyhi1gvMWLC
 nE8f25yrToQKzWyut8Dfv+bt+2n7RCzcrNXpekADk3QmFb7/M5I0WHbX84sAwswViO
 hXj4lms0tDZC/gnmisq7q6XH0hEDp1uzVGmxn6x3JQAdilxHjOkm2ezZ2sPwM0Speq
 N9nHi9Y9MbZpg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 37E43C64457; Fri, 25 Aug 2023 17:30:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169298462322.1914.15893111292733724963.git-patchwork-notify@kernel.org>
Date: Fri, 25 Aug 2023 17:30:23 +0000
References: <20230821152225.4086924-1-chao@kernel.org>
In-Reply-To: <20230821152225.4086924-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 21 Aug 2023 23:22:23 +0800 you
 wrote: > In sanity_check_{compress_, }inode(),
 it doesn't need to set SBI_NEED_FSCK
 > in each error case, instead, we can set the flag in do_read_inode() only
 > o [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZadh-00FQUE-K8
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: clean up error handling in
 sanity_check_{compress_, }inode()
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

On Mon, 21 Aug 2023 23:22:23 +0800 you wrote:
> In sanity_check_{compress_,}inode(), it doesn't need to set SBI_NEED_FSCK
> in each error case, instead, we can set the flag in do_read_inode() only
> once when sanity_check_inode() fails.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/inode.c | 23 ++++-------------------
>  1 file changed, 4 insertions(+), 19 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/3] f2fs: clean up error handling in sanity_check_{compress_, }inode()
    https://git.kernel.org/jaegeuk/f2fs/c/c98879498413
  - [f2fs-dev,2/3] f2fs: fix error path of f2fs_submit_page_read()
    https://git.kernel.org/jaegeuk/f2fs/c/5118697f7215
  - [f2fs-dev,3/3] f2fs: compress: fix to assign compress_level for lz4 correctly
    https://git.kernel.org/jaegeuk/f2fs/c/091a4dfbb1d3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
