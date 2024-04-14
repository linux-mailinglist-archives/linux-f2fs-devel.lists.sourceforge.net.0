Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E13C18A435A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Apr 2024 17:33:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rw1qf-0000zG-Cb;
	Sun, 14 Apr 2024 15:32:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rw1qc-0000yv-Q1
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vnNshwKadsBgKH/U06mDaGoU7TiC73md76Q0U4k+GS8=; b=L5fD21iXjqE/4xfbErbmof71/2
 R2Hd7xwKE9HXVugv5TtOSpPccyh5U8oLZ8HDH4FAeJSCMB71WVTOhK0ZLZE8/KPlLd63GLzpCem8J
 q9cXEYvcAPW8jUq6jDKPIOxtaii4Rv/yfS+k+KLsAxWMCnuB0TFk5H751AQ4NtQImDm0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vnNshwKadsBgKH/U06mDaGoU7TiC73md76Q0U4k+GS8=; b=G7Ts7AWzPZbdnQgH6FYEypEGEa
 PnF15dnBW2aA8VbWm2bMupGOANdaNKo2cUQRJ3Wwhp08b8YhsxCf0SM34hk6d2kcTITGOrjmWndrs
 3OVVIgBoOLq1Inriqroic1BtEbKCMu/Z1GnvKWkB773umNZ0MYS9IHfFHxh3otjAmImo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rw1qc-0003Ve-L7 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:32:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8788E60AEA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3398BC32783;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713108765;
 bh=7UlnJ16rSnRhcFmtv0mafzMbnH+iolNByYGo2vrHRXw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jUQlcjqdenEzfnEvH4B4O//d4jBvlWHG8nRNQe8B9QzGJ3YU4L0qCecmHQDXWfT7A
 0YI9zvKDjUMsZ7duJ3NsVyp1fJYJlOjdjrFeDmoYpW4PoctA3lovvRbhXtfT/XAdoJ
 67KZ8xxzK4QTY7iwmILezNMuIkgsmq1iFqu8q+KNF3mPpXje+g/RDUjcUXgpFeoFo7
 flWFxPuWdfMH2ZNZEom6DfYLBwYhxP9B2WlUuiepxwVxWDlPmEiqnepgH1wQbCRmRn
 TFu5Fe+2737oc/Pl6yA0koqkPfYqmDOZ+KuZO7t/3vbkbsBZGdxn8kmXO7JO/TpB8e
 Z2keFJ4jw5rcQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 134D5DF7858; Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171310876507.3156.2662208686749241669.git-patchwork-notify@kernel.org>
Date: Sun, 14 Apr 2024 15:32:45 +0000
References: <20240326112845.1576111-1-chao@kernel.org>
In-Reply-To: <20240326112845.1576111-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 26 Mar 2024 19:28:45 +0800 you
 wrote: > In below race condition, dst page may become writeback status > in
 __clone_blkaddrs(), it needs to wait writeback before update, > fix it. >
 > Thread A [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rw1qc-0003Ve-L7
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to wait on page writeback in
 __clone_blkaddrs()
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

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 26 Mar 2024 19:28:45 +0800 you wrote:
> In below race condition, dst page may become writeback status
> in __clone_blkaddrs(), it needs to wait writeback before update,
> fix it.
> 
> Thread A				GC Thread
> - f2fs_move_file_range
>   - filemap_write_and_wait_range(dst)
> 					- gc_data_segment
> 					 - f2fs_down_write(dst)
> 					 - move_data_page
> 					  - set_page_writeback(dst_page)
> 					  - f2fs_submit_page_write
> 					 - f2fs_up_write(dst)
>   - f2fs_down_write(dst)
>   - __exchange_data_block
>    - __clone_blkaddrs
>     - f2fs_get_new_data_page
>     - memcpy_page
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to wait on page writeback in __clone_blkaddrs()
    https://git.kernel.org/jaegeuk/f2fs/c/d3876e34e7e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
