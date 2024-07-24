Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C3693AB0B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2024 04:17:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWRYl-0002JM-3H;
	Wed, 24 Jul 2024 02:16:54 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sWRYk-0002JG-4x
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 02:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fqri+GEb10ias8Z/aba1zke+gbUr/+EbocTNeb8nOaA=; b=VyUZ+JeNwy3tBvWAn42cyt9Iuz
 p9IHPxFUtIDyydyiWbnGfO/E4bgdqpBt6k+PCX2flIugw+rW0q0X+OuTS+Ll6OIquBh9L1bnizf06
 ITiG2P5NK+UysphXuNBs0tbsbJIaU0VuJskv5hVWDXrf8VlbeX0NvCYXEZV2Zcr71GN8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fqri+GEb10ias8Z/aba1zke+gbUr/+EbocTNeb8nOaA=; b=DkF5LYv4tPWVp8UnqURe0r1IRq
 ZdHCkf+VJAmv5IolXYhO5Gp17QM/LB8lCxLGxIBWzsc245RistVVyn4C+GTGNWPqia5b5FTw4m0Ou
 zDub1Np2YpMg17Agtsxh2Yqm1tktM5TMHIIZbsyuUltO1a5UjH6s94M0h1ZEyrY6ZAko=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWRYi-0002Ho-Uq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 02:16:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9A80060E04;
 Wed, 24 Jul 2024 02:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B947BC4AF12;
 Wed, 24 Jul 2024 02:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721787406;
 bh=YAphdt5cvZkMjOJF6eiFICf+SX4Aidz7t2RyuBYQf+w=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ejlJSw/BBlOT3plFizhSVD/QfSEYIOxm+xA20yjVToNpelN3ccHDJiFjjsvw660u9
 hgUb3cqTdwNzn3jDVXwIPA1TJz0lV3bWJZqU6E1ly7Ff2VtWzFsrovmJLBNmXixz51
 TPgZe9En+N9k7oFkEOoVFpbOIrCYfxeIs//V6iO9iJPZYzt5bRr4Oycx6OJNCP+RB4
 zEL9kjHdGwvhNfuzwbBTQeELhw4VYjAoEcO0kqYxdAxSS+5DCCGKiEVupplMaEnmcP
 548Vg/no29ytGYnXy0FfD23HAo9g3p39vaDDvwYIYg0/aJLoOJ4372O7ffu6FTXFdM
 kEksppGOPM+Xg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 ADF8AC54BB5; Wed, 24 Jul 2024 02:16:46 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172178740670.17759.14780959274097594461.git-patchwork-notify@kernel.org>
Date: Wed, 24 Jul 2024 02:16:46 +0000
References: <20240423225552.4113447-1-willy@infradead.org>
In-Reply-To: <20240423225552.4113447-1-willy@infradead.org>
To: Matthew Wilcox (Oracle) <willy@infradead.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Andrew Morton <akpm@linux-foundation.org>: On Tue, 23 Apr 2024 23:55:31 +0100
 you wrote: > There are only a few users left. Convert them all to either
 call > folio_mapping() or just use folio->mapping directly. > > Matthew Wilcox
 (Oracle) (6): [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sWRYi-0002Ho-Uq
Subject: Re: [f2fs-dev] [PATCH 0/6] Remove page_mapping()
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 akpm@linux-foundation.org, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Andrew Morton <akpm@linux-foundation.org>:

On Tue, 23 Apr 2024 23:55:31 +0100 you wrote:
> There are only a few users left.  Convert them all to either call
> folio_mapping() or just use folio->mapping directly.
> 
> Matthew Wilcox (Oracle) (6):
>   fscrypt: Convert bh_get_inode_and_lblk_num to use a folio
>   f2fs: Convert f2fs_clear_page_cache_dirty_tag to use a folio
>   memory-failure: Remove calls to page_mapping()
>   migrate: Expand the use of folio in __migrate_device_pages()
>   userfault; Expand folio use in mfill_atomic_install_pte()
>   mm: Remove page_mapping()
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/6] fscrypt: Convert bh_get_inode_and_lblk_num to use a folio
    (no matching commit)
  - [f2fs-dev,2/6] f2fs: Convert f2fs_clear_page_cache_dirty_tag to use a folio
    (no matching commit)
  - [f2fs-dev,3/6] memory-failure: Remove calls to page_mapping()
    (no matching commit)
  - [f2fs-dev,4/6] migrate: Expand the use of folio in __migrate_device_pages()
    (no matching commit)
  - [f2fs-dev,5/6] userfault; Expand folio use in mfill_atomic_install_pte()
    (no matching commit)
  - [f2fs-dev,6/6] mm: Remove page_mapping()
    https://git.kernel.org/jaegeuk/f2fs/c/06668257a355

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
