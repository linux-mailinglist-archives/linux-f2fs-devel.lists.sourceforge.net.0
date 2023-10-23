Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 099167D3AD2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Oct 2023 17:30:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1quwtC-0002hR-PW;
	Mon, 23 Oct 2023 15:30:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1quwt8-0002gm-LX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KAAZP8WGPzYOB07fplM8N1yvQKQX1BBcLj5UPnDjpoY=; b=YG+gsjhpeMvMTsCqiwCcsB/lDH
 aB4OkwpuBkEvD7Y4O9D/FQ24MuOOfvMXOjIferND4LLQQlZ0hRJQh0Wy+NEVWJhqsOsLs8xU/GHQw
 uKj60PXW5SAjnVY/0akdThkum/SXogZVec5OXMlDOCiP+5Gh363Ckpp7RWU/PkjQsnuk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KAAZP8WGPzYOB07fplM8N1yvQKQX1BBcLj5UPnDjpoY=; b=DpClUSIF2+AxZUub8fJaPkSP+n
 8RKzjqylaNo6E5N/JP/JLxFV1yygqSc+h6YLdhFDOKTvR1BMDhat0K/PUsCr6ZQd30+RDZg0jE852
 0cA3FxOVgMDRshg5S6N7B81+nUpesuRVTG0DHHCmFPy0r7uNhENqseGqvoEFDnAG5GTU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1quwt6-007FvV-Sh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 32A9ACE25F7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Oct 2023 15:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33185C433CC;
 Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698075025;
 bh=zRlv4DaNm0Gmd/x7Px1FxJGu+EjMhiDtFj9CBiNQvYA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=En6sdN510ga93u+uS376DZ79r78oh5cWCALnjZPiB90BZtofMSRxq5+v4YpXjfllF
 Iv4nuPsXh0h0bG0Zo+deriSy1/tID7lUvE0Fb087PM0ZuA46dfMJD3awvbR4IWJTc6
 kdELjI/sf5mSf2+1v9HBE+dXADmVHTqzjoY/LRnmTHlJNQR8RwHyTGWcOS1ds2dGDw
 yGChbPDOglaA8h5iKzF9R4tjyNC8MDJuHf0trB9ZTCX0mcyhShathrZJXLSED5zuQS
 QFGfc95GCNkGJFVGH/C+BrxMIXbFuUOdpTXemuu82R19Y2fPY3pvgB9a/N+kHQs6yw
 szQu3VuvHK28w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 11964E4CC1D; Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169807502505.26537.3887577445667105094.git-patchwork-notify@kernel.org>
Date: Mon, 23 Oct 2023 15:30:25 +0000
References: <20231010013459.115024-1-chao@kernel.org>
In-Reply-To: <20231010013459.115024-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 10 Oct 2023 09:34:59 +0800 you
 wrote: > Rather than in range of [0, max_file_blocks()), since data after
 EOF > is alwasy zero, it's unnecessary to preload mapping info of the data.
 > > Signed- [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1quwt6-007FvV-Sh
Subject: Re: [f2fs-dev] [PATCH] f2fs: let f2fs_precache_extents() traverses
 in file range
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

On Tue, 10 Oct 2023 09:34:59 +0800 you wrote:
> Rather than in range of [0, max_file_blocks()), since data after EOF
> is alwasy zero, it's unnecessary to preload mapping info of the data.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: let f2fs_precache_extents() traverses in file range
    https://git.kernel.org/jaegeuk/f2fs/c/6f560c0f2aa0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
