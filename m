Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 952C1870969
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Mar 2024 19:20:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhCva-0001EH-PZ;
	Mon, 04 Mar 2024 18:20:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rhCvZ-0001E3-8Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 18:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3VWsP2P5ihneu4uK2dHvTJHVz/anRtuMqIV8yUOajrE=; b=NqIIi7oN+GXJcqFhfJbcwDfQY/
 n6BD9WykEtZ4Gf7tRmeIOQfmQvFNuhCo6NV3vSjZoLYXz3lRzJULj3JVzq41AZD1ZdNZNcrXpxGbV
 5QwINnEbt5VyVoVc3khor6mAvwtYuz6hnOZsRTynA/tmFV4cj0ZlHq+9JScamE9VNkP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3VWsP2P5ihneu4uK2dHvTJHVz/anRtuMqIV8yUOajrE=; b=VafqeenGnbtv63KgPZYhMvECVH
 NXEuLGLpXypAa17lQstea8nhE/EMCfqi4stxWy6elzlZlkkaOUhhNk2iejSVan/tPP8rsbATyexYd
 4OJMMcag9xRA+QCEdgyL0dyZxkJQ/Tc3xycXcE4NF/k6n3RFdEqLqhOt/nqKj49DRtX8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhCvS-0002fx-Hc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 18:20:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3B0E3611BE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Mar 2024 18:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 190E2C43601;
 Mon,  4 Mar 2024 18:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709576429;
 bh=69mV4fEoSJENCUX2KVzifrbfBfaxcvgV4NzLALj2hic=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=dN1kw/RRAyYO4dUEkEZjbGz56AayoVvYiZ2ZJ8ZyjbHBfiGhSUMlsobyk/yvh+gSS
 /ZugPENub+hlOW7MTpv0uPiXzWPaLXqmHNlWaBMzQRMVydl6BSldlLH0c5og5FuwDp
 lvWpBGkKk468EPvtHNP91NMgPDBKK/yQtStCZ9sGWRQjYIW97PDteCp9sBaxsPkxrN
 L9nMQgUWFHLVfMN0FCKtZZ6bW+egEJgeOiDb8VZsHAa3UIaD6vzBHl/pTNyafskmJX
 1UtYgObNmpz5M8/9lfKTrUC7zRm2XTBMRERqjVuVqkCNqx/9Q4O7L2VBd5fmcb47+S
 Q5nen5lJRnxfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EA229D88F8B; Mon,  4 Mar 2024 18:20:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170957642895.16816.4057582792017070117.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 18:20:28 +0000
References: <20240226073539.2509926-1-chao@kernel.org>
In-Reply-To: <20240226073539.2509926-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 26 Feb 2024 15:35:38 +0800 you
 wrote: > Mapping info from dump.f2fs: > i_addr[0x2d] cluster flag [0xfffffffe
 : 4294967294] > i_addr[0x2e] [0x 10428 : 66600] > i_addr[0x2f] [0x 10429
 : 66601] > [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhCvS-0002fx-Hc
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: ro: compress: fix to avoid caching
 unaligned extent
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

On Mon, 26 Feb 2024 15:35:38 +0800 you wrote:
> Mapping info from dump.f2fs:
> i_addr[0x2d] cluster flag    		[0xfffffffe : 4294967294]
> i_addr[0x2e]                 		[0x   10428 : 66600]
> i_addr[0x2f]                 		[0x   10429 : 66601]
> i_addr[0x30]                 		[0x   1042a : 66602]
> 
> f2fs_io fiemap 37 1 /mnt/f2fs/disk-58390c8c.raw
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: ro: compress: fix to avoid caching unaligned extent
    https://git.kernel.org/jaegeuk/f2fs/c/4b99ecd30429
  - [f2fs-dev,2/2] f2fs: ro: don't start discard thread for readonly image
    https://git.kernel.org/jaegeuk/f2fs/c/a217f1873ab9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
