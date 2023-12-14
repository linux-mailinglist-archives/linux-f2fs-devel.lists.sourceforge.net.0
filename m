Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2515813C00
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Dec 2023 21:50:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDsfS-0001BI-Sa;
	Thu, 14 Dec 2023 20:50:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rDsfQ-0001B9-K0
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 20:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jHSdetz3KwFu4juyQ4ywCIX/LfNjOceMdact3lr9Tr0=; b=Hvfp38tJtAuJ0kCFdON8ilGImT
 8WxpI3G5EI938SLgl5fJd4FJXb3dOyloU9G6POj+ELNE4Kb1wese+m9M5+immhWlZ3ueyJNXrRuKQ
 5+8R5F+4jfeiPkyWLFdVh52WlJ9EJD/eBHWrGCKFv8fBHbNtt/WhCvh08VDPZtk4thRI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jHSdetz3KwFu4juyQ4ywCIX/LfNjOceMdact3lr9Tr0=; b=asSPwXBTumI/U4BISE0GKTJcj/
 AkqbyhP+bQgriQMFYQebQ4EJyJ2cr+po7py8TU1gPRdbzdneAsK1Lu9RqIDsf45CIhbxE3JkC8zcs
 EO8edILoBJ0Rfi53E1RTsz1gs15EvaGIIl7sK+j6GO+23iFcTEBypZ74w+lKtgJQlyyQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rDsfN-0000kL-88 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 20:50:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E31E8CE2585
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Dec 2023 20:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2717FC433CA;
 Thu, 14 Dec 2023 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702587032;
 bh=kpVZaBnbBVpU9K7kulvZHkmJ7TFYh37EGAdPJUXKfUA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kwHntRQY97j/6XZiGfcDYn9fvWBA7Sp7zR8jFozYv9cLbq9R8y4ktt17M948Y08Wv
 XJNSTImWvL1rIpFOGFEtTIqul6AJuNECLQ9YSxUuu0hEYucw15X/m4GSz8n8h6wWKz
 YXg5OqQmE7AcWO7Hz0WCrBx6RigzAvmajP8DS+qKNSZu2bu5RYhzSkqBdx92+k7eGm
 knbWXJMGgjLAIM1ykLGq5IuJ3ZaZ1VszsJUpAsGJiw7HgFX6TJiaJ3jYOZc40mtHB9
 7Q9z0KHayydFUI0Q9BIfwpV0gv87RnJt+PN30ThFRrxDjIzCxt5BzWd1GieRxKrz97
 cAM7B5Ycdh9ng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 F20EDDD4EF9; Thu, 14 Dec 2023 20:50:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170258703198.30587.14823724778977847015.git-patchwork-notify@kernel.org>
Date: Thu, 14 Dec 2023 20:50:31 +0000
References: <20231210092040.3374741-1-chao@kernel.org>
In-Reply-To: <20231210092040.3374741-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 10 Dec 2023 17:20:35 +0800 you
 wrote: > Commit 3c6c2bebef79 ("f2fs: avoid punch_hole overhead when releasing
 > volatile data") introduced FI_FIRST_BLOCK_WRITTEN as below reason: > >
 This patch [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rDsfN-0000kL-88
Subject: Re: [f2fs-dev] [PATCH 1/6] f2fs: delete obsolete
 FI_FIRST_BLOCK_WRITTEN
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

On Sun, 10 Dec 2023 17:20:35 +0800 you wrote:
> Commit 3c6c2bebef79 ("f2fs: avoid punch_hole overhead when releasing
> volatile data") introduced FI_FIRST_BLOCK_WRITTEN as below reason:
> 
> This patch is to avoid some punch_hole overhead when releasing volatile
> data. If volatile data was not written yet, we just can make the first
> page as zero.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/6] f2fs: delete obsolete FI_FIRST_BLOCK_WRITTEN
    https://git.kernel.org/jaegeuk/f2fs/c/a53936361330
  - [f2fs-dev,2/6] f2fs: delete obsolete FI_DROP_CACHE
    https://git.kernel.org/jaegeuk/f2fs/c/bb6e1c8fa5b9
  - [f2fs-dev,3/6] f2fs: introduce get_dnode_addr() to clean up codes
    https://git.kernel.org/jaegeuk/f2fs/c/2020cd48e41c
  - [f2fs-dev,4/6] f2fs: update blkaddr in __set_data_blkaddr() for cleanup
    https://git.kernel.org/jaegeuk/f2fs/c/59d0d4c3eae0
  - [f2fs-dev,5/6] f2fs: introduce f2fs_invalidate_internal_cache() for cleanup
    https://git.kernel.org/jaegeuk/f2fs/c/4e4f1eb9949b
  - [f2fs-dev,6/6] f2fs: add tracepoint for f2fs_vm_page_mkwrite()
    https://git.kernel.org/jaegeuk/f2fs/c/87f3afd366f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
