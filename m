Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAB68CA3BF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2024 23:17:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s9ANP-0002oB-VF;
	Mon, 20 May 2024 21:16:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s9ANO-0002o5-KH
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 May 2024 21:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zeGvEivXpiwy3no9CiNZ+Z5R059sR4N3G+zXea84v0E=; b=DHC/mz0NEBCOYKT3ufqC4s8vd+
 00IU7IUIQ+QnsLtdLNvxt/JAp7i6K4S77159HOxggGt+/l33l058gOT/2jGfymVuJ14PwA3Ft6iui
 8vFkHjlHUEn5RSEX/od0W6L9RYmARHdAkZ6BpRxpNET2Y9Jz7gcoJF/Auhv/2txgqbq8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zeGvEivXpiwy3no9CiNZ+Z5R059sR4N3G+zXea84v0E=; b=TEnuyLEs8qV0bzC6fUANCcJDik
 aaPQJLz2P8J34Y2V1xKefm/gO5/eSSOSyiqzX+wmOE3oZNAD7xC7pIVqGgoB9UebaU/tKNIlGLFVN
 KnPuoEW42PObLx+88tC8FvkbNvl5tUUamDLBpTlFz87HYFzbSdRMam4L4znPlgX4hT78=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s9ANO-0005wE-5i for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 May 2024 21:16:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F0D9461ED9;
 Mon, 20 May 2024 21:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F517C4AF07;
 Mon, 20 May 2024 21:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716239806;
 bh=i9sMlbAULR6WBF7z4CvLAk2CNyoAXyInKoTd0w7BUmk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=knDp39cvfVtNAXHezWhCM2eUf8BF+yeBlQ27p5MN1ouM25k8cRbl7CPtWowq3ww4X
 nCgtBThuJ6nsRcl7N/Ix0bgqZCNS5UB60rAb80aOlEiPV+hniLsvW1i2wkWH1XrWRx
 qaOYqcSczgiQHXJST7+YRg8FNDZY4fXKK5cSOuc/ZiRyyDf6MpkY88iGc9aWPGgS7C
 3HWgaB3ZkjK5H4K/QwUipmTgGdki2EV37S4vF9Gf2CmidKke/xAHViFsVm1Q6Ny5Wy
 FdPiRAyVvIWy6xOrDEM6n/GshsfyOAmdZPgnUT4pnAaV1UhLkYl7/XHeWb2Umnce6w
 q09zjmqukjnng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7750FC43332; Mon, 20 May 2024 21:16:46 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171623980648.27511.9576243592130521184.git-patchwork-notify@kernel.org>
Date: Mon, 20 May 2024 21:16:46 +0000
References: <20240423225552.4113447-1-willy@infradead.org>
In-Reply-To: <20240423225552.4113447-1-willy@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.2 (/)
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
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s9ANO-0005wE-5i
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
    https://git.kernel.org/jaegeuk/f2fs/c/262f014dd7de
  - [f2fs-dev,2/6] f2fs: Convert f2fs_clear_page_cache_dirty_tag to use a folio
    https://git.kernel.org/jaegeuk/f2fs/c/196ad49cd626
  - [f2fs-dev,3/6] memory-failure: Remove calls to page_mapping()
    https://git.kernel.org/jaegeuk/f2fs/c/89f5c54b2281
  - [f2fs-dev,4/6] migrate: Expand the use of folio in __migrate_device_pages()
    https://git.kernel.org/jaegeuk/f2fs/c/e18a9faf06c2
  - [f2fs-dev,5/6] userfault; Expand folio use in mfill_atomic_install_pte()
    https://git.kernel.org/jaegeuk/f2fs/c/a568b4126b20
  - [f2fs-dev,6/6] mm: Remove page_mapping()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
