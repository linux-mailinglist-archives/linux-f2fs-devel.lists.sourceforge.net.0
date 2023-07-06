Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 672BA749280
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jul 2023 02:18:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHChb-00061n-80;
	Thu, 06 Jul 2023 00:18:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qHChR-00061Z-So
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zb5s21dB0QeFvZQMKR9DULxDn5ejGuie8TXE9JmzICA=; b=Mb02ilDdAXCE2MMg3JcUpVWo0e
 gJ+D/nP6Pzdd/sGH3jIR7uO0Up+KqGns8Kck7KYgklx2Z6vI5QmTiZ51MiS2LwO5Os+klNcoTs0Ax
 x7P8m+OCkfC9mBa6Sd5KyLxA3bVH5Jd+okGLpT+GlPpkK/Ppytowl9osMwJKYEN4gjnk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zb5s21dB0QeFvZQMKR9DULxDn5ejGuie8TXE9JmzICA=; b=W2EBsE/aTqEPlHUDEpGWpNQ+Jh
 OcZGbZc6wItg+n/o4TwV8tv3mUFZZo5fvO1srVXQpbBA00oVXDRlgkdINtS0/2t45dUuW63y/PljS
 +94RGTtNZWwAwlrENs2jzFQBGjCwxQ6NH4U6FMjOrAd8nuws/f80NCD3OArxb5GyedjE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHChR-0006GH-Ps for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2134A61812;
 Thu,  6 Jul 2023 00:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3203C433D9;
 Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688602695;
 bh=Wq4Kf5jvhnktrqkplac3NbW2zj2tA4epX9jlz+qsmxU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=FqFLZi+08sYjnqaXYAl7RC8hWusLeRJdeJY3rxkQpMAg2656v3faM7lVBPC47eq9w
 Ye27mWuDhpMkkbOOWhIfBLD7GWqruxk/n/4E3YevhZscqfl1NYaHhydhD8Y1w7MhOi
 t72EFVvoOgabyvl1EvnEIHoGc9gW57dQGKiys/9Tt7JEjmdbNnvXszJOzgTHk0ZtGL
 x5tXDyb7XsDe0FZOuxbCSC80OgwapO1qbNtM21geupHJfgNFOygMaX5FugtGkwYFKR
 Wljo4GjMOilwWQ+w28lEf2vFPf8rU73LLcFJe/sDPVUCdXPSczpV+xwnaknMRFn8wz
 t1C0p5ZN3fGPw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C19C0C0C40E; Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168860269478.29151.608883953593901827.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jul 2023 00:18:14 +0000
References: <20230519093521.133226-2-hch@lst.de>
In-Reply-To: <20230519093521.133226-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Andrew Morton <akpm@linux-foundation.org>: On Fri, 19 May 2023 11:35:09 +0200
 you wrote: > Move the ki_pos update down a bit to prepare for a better common
 > helper that invalidates pages based of an iocb. > > Signed-off-by: Christoph
 Hellwig [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHChR-0006GH-Ps
Subject: Re: [f2fs-dev] [PATCH 01/13] iomap: update ki_pos a little later in
 iomap_dio_complete
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
Cc: djwong@kernel.org, linux-mm@kvack.org, agruenba@redhat.com,
 miklos@szeredi.hu, willy@infradead.org, cluster-devel@redhat.com,
 idryomov@gmail.com, linux-ext4@vger.kernel.org, brauner@kernel.org,
 linux-block@vger.kernel.org, dlemoal@kernel.org, viro@zeniv.linux.org.uk,
 jaegeuk@kernel.org, ceph-devel@vger.kernel.org, xiubli@redhat.com,
 trond.myklebust@hammerspace.com, axboe@kernel.dk, linux-nfs@vger.kernel.org,
 tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 19 May 2023 11:35:09 +0200 you wrote:
> Move the ki_pos update down a bit to prepare for a better common
> helper that invalidates pages based of an iocb.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/iomap/direct-io.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)

Here is the summary with links:
  - [f2fs-dev,01/13] iomap: update ki_pos a little later in iomap_dio_complete
    https://git.kernel.org/jaegeuk/f2fs/c/936e114a245b
  - [f2fs-dev,02/13] filemap: update ki_pos in generic_perform_write
    (no matching commit)
  - [f2fs-dev,03/13] filemap: assign current->backing_dev_info in generic_perform_write
    (no matching commit)
  - [f2fs-dev,04/13] filemap: add a kiocb_write_and_wait helper
    https://git.kernel.org/jaegeuk/f2fs/c/3c435a0fe35c
  - [f2fs-dev,05/13] filemap: add a kiocb_invalidate_pages helper
    https://git.kernel.org/jaegeuk/f2fs/c/e003f74afbd2
  - [f2fs-dev,06/13] filemap: add a kiocb_invalidate_post_write helper
    (no matching commit)
  - [f2fs-dev,07/13] iomap: update ki_pos in iomap_file_buffered_write
    (no matching commit)
  - [f2fs-dev,08/13] iomap: assign current->backing_dev_info in iomap_file_buffered_write
    (no matching commit)
  - [f2fs-dev,09/13] iomap: use kiocb_write_and_wait and kiocb_invalidate_pages
    https://git.kernel.org/jaegeuk/f2fs/c/8ee93b4bb626
  - [f2fs-dev,10/13] fs: factor out a direct_write_fallback helper
    (no matching commit)
  - [f2fs-dev,11/13] fuse: update ki_pos in fuse_perform_write
    (no matching commit)
  - [f2fs-dev,12/13] fuse: drop redundant arguments to fuse_perform_write
    (no matching commit)
  - [f2fs-dev,13/13] fuse: use direct_write_fallback
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
