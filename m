Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9116B8298
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Mar 2023 21:20:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pboev-0008Vj-IA;
	Mon, 13 Mar 2023 20:20:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pboek-0008V9-UF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Mar 2023 20:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hLtKc3WRpQR+Rm6H6bdir1tNVGMPwwR8UM6A43F5A/w=; b=c81FoTvYk737ymgzMZPUT5uap4
 sn+0R9s1r7OyN3j6Pq/kx/2oPgV8w2gGlOH1Zmp2UDoplg0QFvI2MIVtvyQIh/bxPI/pBJJ3BAJO9
 lcIG/X0GIPuBi3Y71aKGmAGaYevvfbciAqIcd3ua8cNS2br/wip+nUXiRvE/wqxeyMn8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hLtKc3WRpQR+Rm6H6bdir1tNVGMPwwR8UM6A43F5A/w=; b=khaq36BThDDggIThv1styRrn9O
 FJXCyncYCp1Y7VeLD0prfl4+Rbt3WeQFyRlJZcJFFY+qsLQBseOSfm0lzRxKUbp9EKGHncNnYwcnD
 SUs/gejlBEgTMGM2gzDFisd9tZB6VfCWk9SB0vCUKrJxzedN9Cro2Bqy6gRtOMW8DwnA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pboee-0003cu-8n for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Mar 2023 20:20:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D962B614B9;
 Mon, 13 Mar 2023 20:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45CE9C433D2;
 Mon, 13 Mar 2023 20:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678738818;
 bh=elXHeg8+AQHHggRDBtDTTIbhG+p7aTNbqwRm6zAaP9s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=YuvOpqSS/Gel/YSDIJEDVtiuBv2BDVT2ixpm6vIGeNk3/IukRNDUmLLNJc8iKHuI2
 XEojSo+n2aEd1kXJ4rPxd7nbU6q9AFu8DZyrm2ulUJAYu3VSFb4r8XK3pFsn4bNr8S
 9uXucOpyrhO42RR6MVxUT4QltshHC8nLSAed4OXAUHpx2hjYKBEAcq9fXCytenm4I8
 eo3ctz6OLA0y1bpAxZhylhszgHNYZvG5+1G3n0gIw+RNJ9Ac+DYo6JEKpP8pHA+JoM
 361rkgtGy/740PMpBMVe0zPWjVEBv1e9eZxbo8laPsmaFgVqts9+jxiFgTg44BDhoI
 yhAuoSPIMFSng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 26DE3E66CBD; Mon, 13 Mar 2023 20:20:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167873881815.1608.4070724001980966812.git-patchwork-notify@kernel.org>
Date: Mon, 13 Mar 2023 20:20:18 +0000
References: <20230216074427epcms2p49a3d71b08d356530b40e34e750cc2366@epcms2p4>
In-Reply-To: <20230216074427epcms2p49a3d71b08d356530b40e34e750cc2366@epcms2p4>
To: Yonggil Song <yonggil.song@samsung.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 16 Feb 2023 16:44:27 +0900 you
 wrote: > When f2fs skipped a gc round during victim migration, there was a
 bug which > would skip all upcoming gc rounds unconditionally because
 skipped_gc_rwsem [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pboee-0003cu-8n
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix uninitialized skipped_gc_rwsem
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
Cc: daehojeong@google.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 16 Feb 2023 16:44:27 +0900 you wrote:
> When f2fs skipped a gc round during victim migration, there was a bug which
> would skip all upcoming gc rounds unconditionally because skipped_gc_rwsem
> was not initialized. It fixes the bug by correctly initializing the
> skipped_gc_rwsem inside the gc loop.
> 
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix uninitialized skipped_gc_rwsem
    https://git.kernel.org/jaegeuk/f2fs/c/196036c45f8c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
