Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 762F36B8299
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Mar 2023 21:20:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pbof0-0000QX-7x;
	Mon, 13 Mar 2023 20:20:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pboef-0000Pr-VR
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Mar 2023 20:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+8IVIVByNwKb8enLYWGG+g2IJw84mq0q95EF4iuBrM4=; b=ingCv3mmP9PcSBcOOVKtgRGpAg
 VT8h+jARjt72ereMY7i79bp+qZH//dg9FVoAhH58yyDyl3mLt1hpKh/3TFGTEms0GA1MtavfU1VtY
 BJgXMDefp5myb2jgrwRKHo5xXxAv5lJHFkwtNIIVPFICtv1lX/ZxkQ4fwcf/nL1fUdtI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+8IVIVByNwKb8enLYWGG+g2IJw84mq0q95EF4iuBrM4=; b=jyrPr73qGeTguLqQ/fOKgJWcf8
 cvKTNt4IpWcDK8M/SiAWs+LQGRNgn+wjLJBfOBN/tk3bAf2VSK12L0NAPPo/Y5HRouADSJSGjIWzg
 pQKFrLhxIT0BM4h15rNBwMz1uRSYS2HlyWZaqXe9eZuCDtVBmQgpFxoHa1HF+LKsKtrQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pboef-006lUY-Rf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Mar 2023 20:20:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8B7AEB8159F;
 Mon, 13 Mar 2023 20:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C9A4C4339B;
 Mon, 13 Mar 2023 20:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678738818;
 bh=Y4wPcrymXNrQrkkYvhAdqewMm31tr/Sxwu2eRCOWOo8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=akkoJfuD5BzfmGhKKC0eNqDxtfRKqR/mbs3VRmPsbzG/JP4rpOiqUylUnoA0bEEBd
 H9rEj51s9oIsp2yseeAWhOvZH0hUMlQWpkHD0gGO0z05EF6x4HeYDmjIs1LZkB3c7W
 Y/cwcLiAADBF6VW2XShs76T2rzr5uS4cdEa+w4ICcEIaRWFCxURsnrn0T6NfEvTT/1
 DsMWocc+nxoMLnG0GAyN4LPxcTe84f/YxRh258aR6q2hFeXokJKm9Uva/zm5tDEKAr
 eh2tIJtgAgay79BHzIM1P6wGBT53zX/V6OrXwfhS+k9oljP7GftolThJN8tmkAxwfX
 hdn4fSZcJ6cpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 301A5E66CB9; Mon, 13 Mar 2023 20:20:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167873881819.1608.4579777650655781388.git-patchwork-notify@kernel.org>
Date: Mon, 13 Mar 2023 20:20:18 +0000
References: <20230221144550.46557-1-frank.li@vivo.com>
In-Reply-To: <20230221144550.46557-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 21 Feb 2023 22:45:50 +0800 you
 wrote: > We should set the error code when dqget() failed. > > Fixes:
 2c1d03056991
 ("f2fs: support F2FS_IOC_FS{GET, SET}XATTR") > Signed-off-by: Yangtao Li <frank
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pboef-006lUY-Rf
Subject: Re: [f2fs-dev] [PATCH] f2fs: handle dqget error in
 f2fs_transfer_project_quota()
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

On Tue, 21 Feb 2023 22:45:50 +0800 you wrote:
> We should set the error code when dqget() failed.
> 
> Fixes: 2c1d03056991 ("f2fs: support F2FS_IOC_FS{GET,SET}XATTR")
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/file.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: handle dqget error in f2fs_transfer_project_quota()
    https://git.kernel.org/jaegeuk/f2fs/c/03ae2bf52a75

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
