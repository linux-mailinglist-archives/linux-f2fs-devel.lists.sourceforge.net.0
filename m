Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F144893AB16
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2024 04:17:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWRZ1-00046g-RJ;
	Wed, 24 Jul 2024 02:17:11 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sWRYu-000464-6F
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 02:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ndhWLv8RVwZxt26z8urWnqvUbVxUqPUCMSxKCrarUCU=; b=RGm6HMZkxLDJ6ARYxNyT8/menP
 fJ3yzN8tqgi6yq5NXF1xkJeei1G1GKG6faoJsGeuTVp25swL+hfa/6shR8cFAJi7eq2gqgE99/k7j
 ijqpW+Y4086Ze7aU4eGqGUCOKxWRt75S9gxWete76xmjoT4LlWeRHy4ehdMePBeMpdIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ndhWLv8RVwZxt26z8urWnqvUbVxUqPUCMSxKCrarUCU=; b=U+8tOuhJ+9V9ie8w1GTliG28tq
 KPQep+bJ2iKcNCyzI8BMQBPj5B4GQjLjW6lHmyNyDhOpWc1UZ2DK1GPGGzlqW3hN2RlwcolbZ2BeA
 Fin5oLJDe5wAc8Qdfws9IzmVn7FSX9M2JwtzeZerrnbhZ7ywKo+eJUtpvc1jmkSNyhS4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWRYo-0002IA-MW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 02:16:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 543D0611CD;
 Wed, 24 Jul 2024 02:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9EE8C4DDE0;
 Wed, 24 Jul 2024 02:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721787407;
 bh=2Qki7VFr+Qj7tXxTqGvLoGf+PC67LDKcpFGcJzAFu6Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ouhlBo12N68ilfm38ZrqoSUhIokoptwXvzvwluu497leeNds+QrltwVgSf+s9X+Nz
 KpQ/Nh3ZSnbL0/qi1IjJOGwvbdyY4X6FQqGSGCi72ks9O57hCpvVUq/iVbg2xREagb
 EeXXZS9A9ZMLP1HyhoOEL0bTNK7FRhLAX4XB3G27VmjjcenzJ63T5KN/aJcU2waJEm
 qgrZrigjnVDfYn6dOcL0XUmdRIGkfcvLGRYQY8Qf2X03ZfwcQxY8u0UHX7b+h0jUak
 6hwIPN+1lQSFHfX8+kBvvB/Fg2n9a1fpZne9+/mYqSaZabLwbKxjDdBiqkx2YO9LD0
 zNydIgD9W7mYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9D706C43140; Wed, 24 Jul 2024 02:16:46 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172178740664.17759.11130907548289451069.git-patchwork-notify@kernel.org>
Date: Wed, 24 Jul 2024 02:16:46 +0000
References: <20240207064302.221060-1-eugen.hristev@collabora.com>
In-Reply-To: <20240207064302.221060-1-eugen.hristev@collabora.com>
To: Eugen Hristev <eugen.hristev@collabora.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Christian Brauner <brauner@kernel.org>: On Wed, 7 Feb 2024 08:43:00 +0200
 you wrote: > Hello,
 > > I am trying to respin the series here : >
 https://www.spinics.net/lists/linux-ext4/msg85081.html
 > > To make it easier to apply I split it int [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: spinics.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sWRYo-0002IA-MW
Subject: Re: [f2fs-dev] [RESEND PATCH v9 0/2] Minor cleanup for case
 insensitive path
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
Cc: kernel@collabora.com, tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Christian Brauner <brauner@kernel.org>:

On Wed,  7 Feb 2024 08:43:00 +0200 you wrote:
> Hello,
> 
> I am trying to respin the series here :
> https://www.spinics.net/lists/linux-ext4/msg85081.html
> 
> To make it easier to apply I split it into smaller chunks which address
> one single thing.
> This series will just convert to qstr the storage of the filename
> currently using fscrypt_str .
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,RESEND,v9,1/2] ext4: Simplify the handling of cached insensitive names
    https://git.kernel.org/jaegeuk/f2fs/c/f776f02a2c96
  - [f2fs-dev,RESEND,v9,2/2] f2fs: Simplify the handling of cached insensitive names
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
