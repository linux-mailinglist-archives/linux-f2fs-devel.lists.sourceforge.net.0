Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA75931703
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jul 2024 16:40:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sTMsi-0003Oa-L8;
	Mon, 15 Jul 2024 14:40:48 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sTMsf-0003O6-Gd
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jul 2024 14:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UDzsSvrxHvbIzInVvlqHAuIciQF1X+r6fyG+IzCNbNw=; b=Fpab7IB2E11GeV72jAMt/Ahgw3
 rJXm0fgHARKxng29Bs/8uushJ9gP6YCXqtYzKK9KoqLuGYjtQ4d2sk8lnVBBGomq9Tbn9+zK8OuCN
 PdWGGLlC4+5Gcd/oBbGpnhc0xhDsT10jllG86kMYQJrQmmcQGS1JC9fa5YdQkbkheutg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UDzsSvrxHvbIzInVvlqHAuIciQF1X+r6fyG+IzCNbNw=; b=JhFh3gME4M3QYVfWjUwYb8wp4O
 Z09mi+Z5a6IcKCEItVYOM1Y3vTwCEBqjKACyXsIJp5c/uelOGNNtGwyRasy2SC5ikHT7dBcb4k+g8
 QNBRIt6Nm16CtEtP7Q9o+zelDspLueTKjjOz02CpzgHRgqmrHrqx8mOHwd4UVFUKYjwg=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sTMsf-0003EY-Fw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jul 2024 14:40:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EE44FCE106E;
 Mon, 15 Jul 2024 14:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3AFC9C4AF13;
 Mon, 15 Jul 2024 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721054432;
 bh=BnVs/O18sPiLhExl4iRwJP6nlsmDzLjC/aSeCHgvJ3s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Zk5ijtCZD77Z3qygvNZlYjYBuiA8yCh/pz3PVakM30LbtgZ88ETgDKtqFn6PzZa9u
 UWArK90g81xBPSUEV5nXJihnoWlllb6vcnkbkBoISizRK4xe1i48+vRO1u0miesGtS
 qpbmmZuGdISdRAbWGWFgZpDK3nyj+eLlqSq23IkF0IiZsgmNstkgxi//CU1dtAwJKq
 GQXpoz2xqjgPmaCoHmD/NrYjFXyJf7/oqJBGqW0r7vQ9gnyfZi+nSqcdGU64Vnj2/H
 WpQS/cpBnZKMJySBDXCZ397aixyZdSyW2iiMCAZaG4cCLbo5IZTJ3v0HvmT+z6YQfn
 E3c/+seprfemQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 30F0AC4332C; Mon, 15 Jul 2024 14:40:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172105443219.17443.436158424545334010.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jul 2024 14:40:32 +0000
References: <e7e1d63e-b6d2-495d-ac1f-28d87d56ca09@redhat.com>
In-Reply-To: <e7e1d63e-b6d2-495d-ac1f-28d87d56ca09@redhat.com>
To: Eric Sandeen <sandeen@redhat.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 28 Jun 2024 23:38:17 -0500 you
 wrote: > The lazytime/nolazytime options are now handled in the VFS, and are
 > never seen in filesystem parsers, so remove handling of these > options
 from f2fs. [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sTMsf-0003EY-Fw
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unreachable lazytime mount
 option parsing
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 28 Jun 2024 23:38:17 -0500 you wrote:
> The lazytime/nolazytime options are now handled in the VFS, and are
> never seen in filesystem parsers, so remove handling of these
> options from f2fs.
> 
> Note: when lazytime support was added in 6d94c74ab85f it made
> lazytime the default in default_options() - as a result, lazytime
> cannot be disabled (because Opt_nolazytime is never seen in f2fs
> parsing).
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: remove unreachable lazytime mount option parsing
    https://git.kernel.org/jaegeuk/f2fs/c/54f43a10fa25

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
