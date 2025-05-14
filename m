Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42564AB7015
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 May 2025 17:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WN6bQ83n0fkVui5lBn7FEX68kINJRGd/aHF16Rh6yfw=; b=gdBdBAarX000H3F7Cjhj5nYtec
	Nb5o2v0Nl9PSBCmyObnER/pqAnTOsSYY1VrBNPueDl1hC43Hg+k/hmqn/n0RvvgGM5zJkVY6b8PcC
	C7NIc4/nsLesM4w3zq3kkDQ5BCzKm6lflTNsdXS9Tn554tZ9ddusYg/2DCLfZASV6e90=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uFEDF-0004la-9D;
	Wed, 14 May 2025 15:40:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uFEDD-0004lT-5Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 15:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pK71X4qPczVqhJo2y3oBwyVRfuJVBWs0SW7bcYIZJB8=; b=G8lL15vLBbrWmPt4PwxdcRHZtd
 vlAHEpbOornfppUd7JZRwOSPZo7vPPDGmqahFTJHHYE26VXEQ1WuIvSCOnpIWXM33EeXjcBflOYtj
 P8GTFPgBb7czD2IuI0ADgsyGHMmsAQKQpEVfc9kaaWzRo78SwwaiwtwUbuGTlinxqea4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pK71X4qPczVqhJo2y3oBwyVRfuJVBWs0SW7bcYIZJB8=; b=lQzB494tggphQeurQ+1eHTaaGQ
 oA0WshODMzA6Xu12Qkj84VZ4R4aQb8Tqy3LONYnHI4DtnSkDhgrpnwrSdWPPIx+ZtOhAQX8WIYYUR
 OeLCPA3bNxTJ6odwkzaDkxVWMPw+ejvt6rTEv8AWjiIdPwpJ/MwFz0hE3RTgw7OnWTDE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uFEDC-0002D9-EL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 15:40:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B5AC661166
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 May 2025 15:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B842C4CEED;
 Wed, 14 May 2025 15:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747237196;
 bh=T40BRXA/ZUYBrn3MFNaEz9UTnOwLgkq194IcQ+iSgsg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XmYCnQiljW9ebjAlX02k8VKDfBqhBBnAaMVLGLWYQ+3E62Z01dmfnjYJppweUS3n0
 4340zbrXuT27K+Kf2yU5Xat0w308tywhYj7S8fvArmEo5u8aR8oldSSPJ7leuDBAvB
 Iu211ptItxRuCECrB+epqfGRNybqJsz6BwJ1XIEcffPeyKscP/dLKTyuRF3IYMFgxf
 iIkpFkhcIpVmvKRCL+5/2tsvxh4PHjgJYEr0jSZCkLG0NI8diPj5W2l5AmD3dZnGcg
 mq2d/0gJvrylT5IRqIqRB0bEv58vm3yWXDwHLpBQJreGSR4dtHSalAjyr93zhb7vL8
 VjkAfSl2icoAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB33F380AA66; Wed, 14 May 2025 15:40:34 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174723723350.2412407.17903225728405091835.git-patchwork-notify@kernel.org>
Date: Wed, 14 May 2025 15:40:33 +0000
References: <20250512115442.2640895-1-chao@kernel.org>
In-Reply-To: <20250512115442.2640895-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 12 May 2025 19:54:41 +0800 you
 wrote: > Add f2fs_bug_on() to check whether memory preallocation will fail
 or > not after radix_tree_preload(GFP_NOFS | __GFP_NOFAIL). > > Signed-off-by:
 Chao Yu [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uFEDC-0002D9-EL
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add f2fs_bug_on() to detect
 potential bug
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

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 12 May 2025 19:54:41 +0800 you wrote:
> Add f2fs_bug_on() to check whether memory preallocation will fail or
> not after radix_tree_preload(GFP_NOFS | __GFP_NOFAIL).
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 4 +++-
>  fs/f2fs/node.c       | 7 +++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: add f2fs_bug_on() to detect potential bug
    https://git.kernel.org/jaegeuk/f2fs/c/0e799933a4e8
  - [f2fs-dev,2/2] f2fs: add f2fs_bug_on() in f2fs_quota_read()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
