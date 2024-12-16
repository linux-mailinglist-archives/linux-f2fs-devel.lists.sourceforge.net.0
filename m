Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C274A9F3641
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Dec 2024 17:40:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tNE9A-0008Bw-Gu;
	Mon, 16 Dec 2024 16:40:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tNE93-0008BQ-BN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Dec 2024 16:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jzz1zdeF9yNJNBX8H4bhmYZxCnQWt6ZyKvwJsAQU5Nc=; b=f2wmFHfuZorOOFbnm6MLUw3Q8g
 f/8uhUT8LBJDBIemv7dhzMl9FtjbnnNvbgDo7nDHMbe/9tyBptpDJKnsAEmtGb03A9GVWq13ubzDQ
 KT1hcs33df3kymAlK/+M7MderNzMtXfOEEanEF3JigmvkNXM2vd1ak2b8yG9HakAqY48=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jzz1zdeF9yNJNBX8H4bhmYZxCnQWt6ZyKvwJsAQU5Nc=; b=Thhr5vt50Nf5TcCfR8iTMn10iI
 mu7HO9JxZbRBAvUST50PQtRausmcEhBB+PJcV6EG2fkiOzM4QCqqS5pjJEAnJpi24LNciKRWKnxwc
 3CubfzO6hn6h6ZS8r5JdoDnMJaDMphgErG8mMgxefQxT8ZNkpNKytZI4U5pyFvAem/l8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tNE92-0000sd-Ne for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Dec 2024 16:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3B375A417FA;
 Mon, 16 Dec 2024 16:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD3EC4CED0;
 Mon, 16 Dec 2024 16:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734367221;
 bh=XSMGgsdv+y5WcMVcf7eiqLkRr4rAybqXS0N+f/k9ZnI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XS4uG8O4s7IJHqrXwK3nBROBYJYA/lWrjwx7LQWsg/zzqywMOAv+r7hlY8mbbAg5T
 pUi8G5yOywY1jft5pk9eCEAAtDx8BdF9HC/97dMoXdmPUysBTTVr+6k94fTS3RQd3J
 QBfWR34eV0fRbb0I1NLrChtnFuh8fALAbgCVDGkn8f4P5U3c2fS/6zONd/6ajvaWCx
 afwMj5zl5MhrU4QxYe9hboFPA0ADUicT5tQA/idrZ8/lMb+F9TzlvNCjVoTT01MaE1
 l4iKulblNyzKz9n3APrJ4S9dUsj54UsOwWxtsteNeMA8Gma0XmYR4sr+BI+ly9gBjn
 B0B/h/JF39xiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB6D93806656; Mon, 16 Dec 2024 16:40:39 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173436723874.272389.6295491443575015321.git-patchwork-notify@kernel.org>
Date: Mon, 16 Dec 2024 16:40:38 +0000
References: <20241212175748.1750854-1-dmantipov@yandex.ru>
In-Reply-To: <20241212175748.1750854-1-dmantipov@yandex.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 12 Dec 2024 20:57:48 +0300 you
 wrote: > Syzbot has reported the following KMSAN splat: > > BUG: KMSAN:
 uninit-value
 in f2fs_new_node_page+0x1494/0x1630 > f2fs_new_node_page+0x1494/0x1630 >
 f2f [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tNE92-0000sd-Ne
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: ensure that node info flags are
 always initialized
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: lvc-project@linuxtesting.org, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org, linux-fsdevel@vger.kernel.org,
 syzbot+5141f6db57a2f7614352@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 12 Dec 2024 20:57:48 +0300 you wrote:
> Syzbot has reported the following KMSAN splat:
> 
> BUG: KMSAN: uninit-value in f2fs_new_node_page+0x1494/0x1630
>  f2fs_new_node_page+0x1494/0x1630
>  f2fs_new_inode_page+0xb9/0x100
>  f2fs_init_inode_metadata+0x176/0x1e90
>  f2fs_add_inline_entry+0x723/0xc90
>  f2fs_do_add_link+0x48f/0xa70
>  f2fs_symlink+0x6af/0xfc0
>  vfs_symlink+0x1f1/0x470
>  do_symlinkat+0x471/0xbc0
>  __x64_sys_symlink+0xcf/0x140
>  x64_sys_call+0x2fcc/0x3d90
>  do_syscall_64+0xd9/0x1b0
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: ensure that node info flags are always initialized
    https://git.kernel.org/jaegeuk/f2fs/c/76f01376df39

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
