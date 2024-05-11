Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 915B08C2E0D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 May 2024 02:50:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5awl-0002Mz-An;
	Sat, 11 May 2024 00:50:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s5awi-0002Mq-SZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eehYArYRA06juKvxIpqpzB7nhzmGJ8o5JcdNEwrn/uw=; b=kJLMl/oINj1TDNP21fG9uTJg/Q
 NFLDVwpsP2wKafxfORaWwAzCqW+OGXXc6jU4UulFNaivG17N8PxUSul/6IT5Mj2C+ZcTXFBTNYe/6
 yBibmEYpurEAXJQg2I+O8KrKME34i59yUu9is+9/sickXQK+zr1vSeX5beHo8wSGu5pA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eehYArYRA06juKvxIpqpzB7nhzmGJ8o5JcdNEwrn/uw=; b=Du7Dkq/GjN/KfjckFPjzblBRPu
 6ZrY1bDXDOwhDjAuKPavhxb/d5PkNNS4rQd4p0b3sFOIZfepENdGzxmVXsSEzsFsk1Y6QF/h+MdKL
 4IB/jJkWoTw6QoI9xv0qP6bE1VGWxA/w4+Fs5NOKpLpHi85WpHiX1cdQouwqVnt320fM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5awk-0004yl-20 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 85490CE1EC0;
 Sat, 11 May 2024 00:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C473AC32781;
 Sat, 11 May 2024 00:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715388633;
 bh=UKEe94oVWtgpVuykgNAFFHHsNeG3y+btMC3fbZTqcSE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kgQp9IR+Juw1eQWt1C2pVudkxlg2safWvJve6KWaG4JbnOc/ZcpnYik10EJfTXZJv
 EMdZOxIvNN9kUPJFlUwwus83Cwh3nu+zOC+nUTISVuvfBdVuLR78f3MkiqQ91qD8ZS
 CmCfhCULoVGJOuNLtTmZVadiaj1g1j6mjZ3W5J1wGMU9A1xZ4UVA9qbRWYFZ3mZ9bX
 v+IaEWYPko8jhOUDteuXagZgf6D2oSiN8bWuVU9oc7IMDRJpCO0Tnwt8P7aSkmA66Z
 ajcd2oW3ZSQi/3+xlIaQurGTIc54SJQQkS6aJIorjDkS/xyFGM85fz4eSTgC907I4s
 HxxpLFJLmwuag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AB1B1C32759; Sat, 11 May 2024 00:50:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171538863369.11229.7576182573841260398.git-patchwork-notify@kernel.org>
Date: Sat, 11 May 2024 00:50:33 +0000
References: <20240425085838.4032657-1-chao@kernel.org>
In-Reply-To: <20240425085838.4032657-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 25 Apr 2024 16:58:38 +0800 you
 wrote: > syzbot reports a kernel bug as below: > > F2FS-fs (loop0): Mounted
 with checkpoint version = 48b305e4 >
 ================================================ [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5awk-0004yl-20
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on i_xattr_nid
 in sanity_check_inode()
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
Cc: jaegeuk@kernel.org, syzbot+3694e283cf5c40df6d14@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 25 Apr 2024 16:58:38 +0800 you wrote:
> syzbot reports a kernel bug as below:
> 
> F2FS-fs (loop0): Mounted with checkpoint version = 48b305e4
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in f2fs_test_bit fs/f2fs/f2fs.h:2933 [inline]
> BUG: KASAN: slab-out-of-bounds in current_nat_addr fs/f2fs/node.h:213 [inline]
> BUG: KASAN: slab-out-of-bounds in f2fs_get_node_info+0xece/0x1200 fs/f2fs/node.c:600
> Read of size 1 at addr ffff88807a58c76c by task syz-executor280/5076
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to do sanity check on i_xattr_nid in sanity_check_inode()
    https://git.kernel.org/jaegeuk/f2fs/c/20faaf30e555

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
