Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD838B255F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Apr 2024 17:40:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s01DJ-0004To-VD;
	Thu, 25 Apr 2024 15:40:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s01DI-0004Ti-B5
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Apr 2024 15:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zKUTzvpjubnR5UNAlacLam6n6a/ONEj4Y3dNC9yDy6c=; b=G1xyAXRZX52yUK44LHsnGs+TBS
 8Oy7GPUz6EtZ0JUlg/hkkozCuqq/A5zkFnqzhpfBUUV8Q3e5TnoXBJ0b5YhZIRqScWjA3ngf5vZjZ
 mc6ryMIh64mASiBIctqz/uPBDpXsAOJr9DmebGPt1qQdYJOV0HrsGCGW674UVDQjX3RY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zKUTzvpjubnR5UNAlacLam6n6a/ONEj4Y3dNC9yDy6c=; b=cTp/Ul/O6i0+71Ez1aegL9hbVF
 Q6QGHLs+WdVrB3um6jjVUwMV9xUSJuvVukLL2/dNzZnqSIb2VcjcAOfBBS2J9fW4bLeGVRfHz/SA2
 iSH3ySsyT1CqPU5DQOHm7I8+EG6eG5aAycRZmJ004ag78kMN7eoDrfh0nqCnSp9HLeeI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s01DH-0005h3-6z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Apr 2024 15:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A7781CE1ADF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Apr 2024 15:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC548C3277B;
 Thu, 25 Apr 2024 15:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714059630;
 bh=bGIBA6DPr0bJFT701J0z+3vINk9dWTIDvIiKasrikLA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uiGYOPlohvijFtjLNvRWpfmRaIeGzwkPccqaeDuTE7OQngrm5I9pZT2fcsBSV6aJg
 j95LtJT/CkYKbK5ZT3Cfz8gQTtXc9ZU8UBaQIzIytkwayRIGVvPATeto4qtpsSxuNM
 a2vX86aSirnCcz+Sq699X4Tez+20NTpF2QgJSVelPWcUQRR6/ocZr7jG67eeFGFCtG
 iVY1ILgMnCN+EdeR2dld7NtBEpWpn4r2vWn1XCatkAn+gDnqwWYf29oXRXOoH6lC1A
 exEhBQT4bRDLiX4GnXfSNhu3PqCu77i+TrNuBDJrIh5XTWGpql+reqq9eVp55wTr/y
 qIqARoRpIogFg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C2AD6C595C5; Thu, 25 Apr 2024 15:40:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171405963079.10966.9092542666312689265.git-patchwork-notify@kernel.org>
Date: Thu, 25 Apr 2024 15:40:30 +0000
References: <20240424173548.1515606-1-jaegeuk@kernel.org>
In-Reply-To: <20240424173548.1515606-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 24 Apr 2024 17:35:48 +0000 you
 wrote: > f2fs_ra_meta_pages can try to read ahead on invalid block address
 which is > not the corruption case. > > Cc: <stable@kernel.org> # v6.9+ >
 Bugzilla: ht [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s01DH-0005h3-6z
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix false alarm on invalid block
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
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 24 Apr 2024 17:35:48 +0000 you wrote:
> f2fs_ra_meta_pages can try to read ahead on invalid block address which is
> not the corruption case.
> 
> Cc: <stable@kernel.org> # v6.9+
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=218770
> Fixes: 31f85ccc84b8 ("f2fs: unify the error handling of f2fs_is_valid_blkaddr")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix false alarm on invalid block address
    https://git.kernel.org/jaegeuk/f2fs/c/b864ddb57eb0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
