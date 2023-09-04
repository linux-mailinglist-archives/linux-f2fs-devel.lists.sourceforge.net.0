Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DA2791C7B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Sep 2023 20:11:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdE2o-00077U-D5;
	Mon, 04 Sep 2023 18:11:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qdE2l-00076w-QT
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 18:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cs525KJaUGEpKmDAg63B82k12IN3kX3ELt+OF7NVZIY=; b=WHFMuTB7YOL8pJZ+2wO1ZLm/kM
 ewPJuU3e+tlOtLztI2L8EB5Pifrx+yr8jLwI3S11LFaVm1Eb7Yppi34WT6MbWc4z+soret81hxU++
 qDa3lqUo/KABJ2oSskgT+tXOe7Fcc/m35yMzA7ybB/d3+QvHTyB+WEKbk77ox+UEXfXM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cs525KJaUGEpKmDAg63B82k12IN3kX3ELt+OF7NVZIY=; b=f7FiQS03BKxx9n4GvP6OcTJRyG
 Yru1xRvooC7fhBd7heMlyKkZR9zuqol86joyAJeJMtQ6IbSfmQ3NSkVOqqqrWrxELnkVuQqmw/usJ
 Sz9X8rflvw3AR4IyspktIsx8p+TDDlSm8k4aWUpmg2DKe8yUcKCT4IhH59Nro+fRZCNc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdE2j-0007WZ-L8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 18:11:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 39194CE0FBC;
 Mon,  4 Sep 2023 18:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59525C116A6;
 Mon,  4 Sep 2023 18:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693851069;
 bh=9V05BJ+Zrz7p6pZ+b0iissf5Ol4gDyoeQK0k983jp/8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=q//cpDgINdSIlQFIs/BZqxxdsINFkxrc4Mu7UetIPc7BiMzw0uhEfroJJYNGh9Y/7
 mcKD20fU3Rg0ULNFUaFzGSTO/O9D6mpFmSlZrY6Ctgzwsoh5Z5pwuCl+wC3uPthmeP
 D/QeifcpwXU3D/ZU7TIO3dldJCslfK8p6OTbUXlyC/NqKvUCWSmvxZrbJI2HCsF9pp
 sqlPbcWpavpzVrBexl9HiVhvAgFLNI89jQuhlm3r2RUWQLYugwGmVaBWfUONhbqiH4
 YVBprbBK1yL+uyTmzhN5hdyR3iCLSBy7Vu1R3nwrj2DP1dzSYcc40YeMS2z68Wr2Bp
 btqg4yNrLqmwQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 29183C2BBF6; Mon,  4 Sep 2023 18:11:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169385106916.19669.6288590634358957039.git-patchwork-notify@kernel.org>
Date: Mon, 04 Sep 2023 18:11:09 +0000
References: <20230705190309.579783-41-jlayton@kernel.org>
In-Reply-To: <20230705190309.579783-41-jlayton@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Christian Brauner <brauner@kernel.org>: On Wed, 5 Jul 2023 15:01:08 -0400
 you wrote: > In later patches, we're going to change how the inode's ctime
 field is > used. Switch to using accessor functions instead of raw accesses
 of > inode->i_c [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdE2j-0007WZ-L8
Subject: Re: [f2fs-dev] [PATCH v2 43/92] f2fs: convert to ctime accessor
 functions
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
Cc: brauner@kernel.org, jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Christian Brauner <brauner@kernel.org>:

On Wed,  5 Jul 2023 15:01:08 -0400 you wrote:
> In later patches, we're going to change how the inode's ctime field is
> used. Switch to using accessor functions instead of raw accesses of
> inode->i_ctime.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/f2fs/dir.c      |  8 ++++----
>  fs/f2fs/f2fs.h     |  4 +++-
>  fs/f2fs/file.c     | 20 ++++++++++----------
>  fs/f2fs/inline.c   |  2 +-
>  fs/f2fs/inode.c    | 10 +++++-----
>  fs/f2fs/namei.c    | 12 ++++++------
>  fs/f2fs/recovery.c |  4 ++--
>  fs/f2fs/super.c    |  2 +-
>  fs/f2fs/xattr.c    |  2 +-
>  9 files changed, 33 insertions(+), 31 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v2,43/92] f2fs: convert to ctime accessor functions
    https://git.kernel.org/jaegeuk/f2fs/c/c62ebd3501cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
