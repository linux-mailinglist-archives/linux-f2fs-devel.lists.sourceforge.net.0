Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7BE87F16D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Mar 2024 21:45:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rmJrk-0004Y1-87;
	Mon, 18 Mar 2024 20:45:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rmJri-0004Xp-G7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Mar 2024 20:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PHHwxOvGzjN8Db7TMoDPg/CYGskfnbTT4ie0xz5+DbQ=; b=Rzt5VxvS4+eLoeNOti+QnvLlW5
 vqkBhHYlVjFLOnBqvbwVFOO/kkJzsWNFsYJbw851wyquVtnFa0+hZJKQ4yVwwbTIYO54drFqFycW9
 IH1obTVuPJZg7kGWgQVSHXojeaLGq/Nor4ZEMaWcHV5fP4XTOQd/FaeBwQqdunfY2AYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PHHwxOvGzjN8Db7TMoDPg/CYGskfnbTT4ie0xz5+DbQ=; b=aMBaOChX6zm6zewOeR4Vi3yuG8
 sGef3rE+IXcs3h+0eQ0m/HKkuCIMpHWv515pPloxt+HnHTGYhr1tiVsMjSr1L1qToxArYduPZVFCT
 WKkNTUcHbMVdZgg74Q+bvwCN3Pmho5wrH+C3krGQFXv8B2nq12QloDGq+Tqm7C8YOZ7s=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rmJrW-0002Jj-S8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Mar 2024 20:45:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 73B00CE0B62;
 Mon, 18 Mar 2024 20:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44582C433B1;
 Mon, 18 Mar 2024 20:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710794733;
 bh=bXj+2bey1JiPSRUaDSpuXTcSqhoJrwse8pezMzX/3gg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Cfu+kooNHzOc1lNH+Rcnj80CoPHosepEM3gStSIAr2M9EhZ7EX/ecdSQNpE7b8WkC
 7mC/VlFf1yKgsuYcZdTeVIBGYs3Gv4LIl5G9QntKQNmWnxGqa18oyQX21dgPcd2q1u
 Or0qOMRIehhparWC8j4jKCUu0z14KHeXlcAYGquu7Lm2LshxtFaJBdpZ4igdPP/3AB
 8cffZy583pdgl9Z6nSIbVQP9vYJEBJGai9CtNtT0Gfj/X3jcLqiore3WFGhV6vUQlt
 qo2MA+DxlUM5FQYXUHS3huMbYcleP4vPuIWxRiavwRe4XKplI5n4SfpcI4zki6ilxe
 hQ71cuo3OC20w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3293517B6479; Mon, 18 Mar 2024 20:45:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171079473320.25373.14169884985890692398.git-patchwork-notify@kernel.org>
Date: Mon, 18 Mar 2024 20:45:33 +0000
References: <20240221171412.10710-1-krisman@suse.de>
In-Reply-To: <20240221171412.10710-1-krisman@suse.de>
To: Gabriel Krisman Bertazi <krisman@suse.de>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Gabriel Krisman Bertazi <krisman@suse.de>: On Wed, 21 Feb 2024 12:14:02 -0500
 you wrote: > Hi, > > v7 of this patchset applying the comments from Eric.
 Thank you for your > feedback. Details in changelog of individual patches.
 > > As usual, th [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
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
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rmJrW-0002Jj-S8
Subject: Re: [f2fs-dev] [PATCH v7 00/10] Set casefold/fscrypt dentry
 operations through sb->s_d_op
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
Cc: brauner@kernel.org, tytso@mit.edu, amir73il@gmail.com,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Gabriel Krisman Bertazi <krisman@suse.de>:

On Wed, 21 Feb 2024 12:14:02 -0500 you wrote:
> Hi,
> 
> v7 of this patchset applying the comments from Eric. Thank you for your
> feedback.  Details in changelog of individual patches.
> 
> As usual, this survived fstests on ext4 and f2fs.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v7,01/10] ovl: Always reject mounting over case-insensitive directories
    https://git.kernel.org/jaegeuk/f2fs/c/2824083db76c
  - [f2fs-dev,v7,02/10] fscrypt: Factor out a helper to configure the lookup dentry
    https://git.kernel.org/jaegeuk/f2fs/c/8b6bb995d381
  - [f2fs-dev,v7,03/10] fscrypt: Drop d_revalidate for valid dentries during lookup
    https://git.kernel.org/jaegeuk/f2fs/c/e86e6638d117
  - [f2fs-dev,v7,04/10] fscrypt: Drop d_revalidate once the key is added
    https://git.kernel.org/jaegeuk/f2fs/c/e9b10713e82c
  - [f2fs-dev,v7,05/10] libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
    https://git.kernel.org/jaegeuk/f2fs/c/e6ca2883d987
  - [f2fs-dev,v7,06/10] libfs: Add helper to choose dentry operations at mount-time
    https://git.kernel.org/jaegeuk/f2fs/c/70dfe3f0d239
  - [f2fs-dev,v7,07/10] ext4: Configure dentry operations at dentry-creation time
    https://git.kernel.org/jaegeuk/f2fs/c/04aa5f4eba49
  - [f2fs-dev,v7,08/10] f2fs: Configure dentry operations at dentry-creation time
    https://git.kernel.org/jaegeuk/f2fs/c/be2760a703e6
  - [f2fs-dev,v7,09/10] ubifs: Configure dentry operations at dentry-creation time
    https://git.kernel.org/jaegeuk/f2fs/c/bc401c2900c1
  - [f2fs-dev,v7,10/10] libfs: Drop generic_set_encrypted_ci_d_ops
    https://git.kernel.org/jaegeuk/f2fs/c/101c3fad29d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
