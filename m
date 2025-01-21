Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 042F5A18268
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jan 2025 18:00:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1taHc1-0005Bw-EC;
	Tue, 21 Jan 2025 17:00:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1taHc0-0005Bo-68
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Jan 2025 17:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tU68BosziqlsRNmnir16Gne8AwFU9S1Kjldcmemu4u0=; b=OfMHCV9V43LOCey6aS/DKYuDei
 EHnQ+qRY+0aOcSY0GVV3W3fEMDi6a8EAXHd70E3nrOlvVGlUdDiPFdLWgCybvXSM7euE90oNjv8k+
 73bukDOrddm9xdsYSe4h2GvMo4jnveTWYMbq8YLlQ9YeLhHGbgORWAdNCWkubFXfuMGc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tU68BosziqlsRNmnir16Gne8AwFU9S1Kjldcmemu4u0=; b=RXX9iRatf8SD196x3n5WPDaMJb
 AXvjVG7AQuV2osXqtPRY0b3szpskv2KxYyfIcmNodwmGcUaG+0CyiS57f6hOP29Gz/vJUr/NsS9xA
 aTnBkaSWl+OIwr3xshhq1EzmP4kao+0CON3e55RBunZyKnKpleoCbHK+a/KBrv5iDdaw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1taHby-0005k8-Vb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Jan 2025 17:00:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2F8E45C5AC8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Jan 2025 16:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517D7C4CEDF;
 Tue, 21 Jan 2025 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737478812;
 bh=Yrfr2RwBD67uJAD5IUrw6DIO25JQZMHl277q1iw0o4s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=dBGqWCDqx7LuP2dQlLLxMIqqsOOuD9IJJfLGB1+ubcIIdEh0FvEKnwfVxyYQ2xR9N
 UEMFHYC7NPqYvH0OmdOEshfMj+mPOH337OZL/nm57fh9GExYmGN2fdYNBJy9QQ/wgI
 KNdsKbZap4M7hzM30MUXE9q3jyTcWoDBJP9p4qmrad4MHm75rvNL49W0bPVGRrhVl5
 V2iNK4EQVsdmsLhvcI1VO01TFml/At5urb71KVB1FccOPMcPLfQ4bnZkqGt2cfev8P
 +cK5aBVx8c88KsXsSSHIIZzB8fAI57yCKPAlp5hOb1O8SsMsulb3T/S+6qUvDOnD7c
 TscyN8/gkS1zA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AEF93380AA75; Tue, 21 Jan 2025 17:00:37 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173747883624.55169.5980716764876460895.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jan 2025 17:00:36 +0000
References: <20250117220955.2482817-1-jaegeuk@kernel.org>
In-Reply-To: <20250117220955.2482817-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 17 Jan 2025 22:09:55 +0000 you
 wrote: > In f2fs_new_inode(), if we fail to get a new inode, we go iput(),
 followed by > f2fs_evict_inode(). If the inode is not marked as bad, it'll
 try to call [...] 
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1taHby-0005k8-Vb
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid trying to get invalid block
 address
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 17 Jan 2025 22:09:55 +0000 you wrote:
> In f2fs_new_inode(), if we fail to get a new inode, we go iput(), followed by
> f2fs_evict_inode(). If the inode is not marked as bad, it'll try to call
> f2fs_remove_inode_page() which tries to read the inode block given node id.
> But, there's no block address allocated yet, which gives a chance to access
> a wrong block address, if the block device has some garbage data in NAT table.
> 
> We need to make sure NAT table should have zero data for all the unallocated
> node ids, but also would be better to take this unnecessary path as well.
> Let's mark the faild inode as bad.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: avoid trying to get invalid block address
    https://git.kernel.org/jaegeuk/f2fs/c/e02938613eb2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
