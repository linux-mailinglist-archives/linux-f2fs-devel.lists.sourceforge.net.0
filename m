Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7361874927B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jul 2023 02:18:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHChc-0003Gx-8J;
	Thu, 06 Jul 2023 00:18:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qHChZ-0003EN-6s
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xZtZAAWxemwgQadW6/HD+DdfTNqGHXlMe1XYXmgdcQ8=; b=nKE9pHUvMriV5Cgrnl3tJ8SCR0
 Du61DFpbZgUexQcFEgVLcy1NkUiUUTvKY1ktTp2a/muTayvh+ROtuN9be2peYppRtaIY8sYgTMeih
 t5d9zv6AsxU1eiTJQOaOPKDO64/FThv9iCEC6Q3k5eqQJ4DzC684M+7B1yZifjqRnvrs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xZtZAAWxemwgQadW6/HD+DdfTNqGHXlMe1XYXmgdcQ8=; b=MivPf6lh4pBIkETP07oK+cW0My
 1PxnaQMDWbm144W6jnk+xjP+DkGl+LnU5ZxZI+0kNFRcO4I/Xj5hS1YxAO6X53y+ym0cbY4liD3nY
 IVWRGmVWIV+e9dkeSrHoHvoWDSmjksAXBLenVGFfgr2AkTkC7UJSCXcc57Py4P1N2T/8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHChY-007tJM-7m for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C59661804
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Jul 2023 00:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D9B4C433B6;
 Thu,  6 Jul 2023 00:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688602695;
 bh=QMrYJdg+aOWaiyZfZoVZY2OuILKdY/U5yz1KaTAkd7U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=vCD4uGNUUhLG/V6I5lQjxVsUYosjHRyPmUV7k4XnRL8wBajrzjoJeO3ghL7rZecnt
 6/J1ZVlHr8/XIGXsEx/6/TU/U2Vh5GTfECRxfk7mIF/ed1nnHkRC9hreSdE4aAribH
 qxebfqc1G6XMmOFK4Qa9+Cheaw2tte+FdMBTY+dLa3gcEQqlz8gsjKyxd1UgR4+5nB
 6xQvUwe2G2aQ4pZSQs3pfHnETzGrzgwRgqzJd1EeAFSBxDAkNsm85SCe4E5Ns/+Qcy
 63BVtANWNnsg+w2LcUqPs84jjE64U3dFxwnJOStzHgP5Dkb26lOzt20CgFACLVFjed
 cYz8f9mT0B0FQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E8DE5C40C5E; Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168860269495.29151.10455269448863933897.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jul 2023 00:18:14 +0000
References: <20230516052306.99600-1-ebiggers@kernel.org>
In-Reply-To: <20230516052306.99600-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Eric Biggers <ebiggers@google.com>: On Mon, 15 May 2023 22:23:06 -0700 you
 wrote: > From: Eric Biggers <ebiggers@google.com> > > The "ahash" API, like
 the other scatterlist-based crypto APIs such as > "skcipher", comes with
 some well-kn [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHChY-007tJM-7m
Subject: Re: [f2fs-dev] [PATCH v2] fsverity: use shash API instead of ahash
 API
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
Cc: fsverity@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Eric Biggers <ebiggers@google.com>:

On Mon, 15 May 2023 22:23:06 -0700 you wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The "ahash" API, like the other scatterlist-based crypto APIs such as
> "skcipher", comes with some well-known limitations.  First, it can't
> easily be used with vmalloc addresses.  Second, the request struct can't
> be allocated on the stack.  This adds complexity and a possible failure
> point that needs to be worked around, e.g. using a mempool.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] fsverity: use shash API instead of ahash API
    https://git.kernel.org/jaegeuk/f2fs/c/8fcd94add6c5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
