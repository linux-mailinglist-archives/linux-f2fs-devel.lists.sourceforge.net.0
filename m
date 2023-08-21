Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1182A783110
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Aug 2023 21:50:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qYAv3-0001Ez-5d;
	Mon, 21 Aug 2023 19:50:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qYAv1-0001Er-V5
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 19:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IdvB5BNjDpkkkqmu/IeXk+vbjw8utJ44qOCK+yxtbU4=; b=GV5obA2VL3/wDB4dV8FXulG9go
 n77sCoIwQJC9LMDWG+rvNUdYSHTeNmR5ZPHcq+ZHSYv2QvjZ5+r09Z9PmVOJLvURS51jt2+3yZIsg
 mFDuiOj5oC1weWHQao/uK1rbmuWtBCxnDiYbByCfusC6rXsELBH4tOgLlmfy1Dy0RrBc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IdvB5BNjDpkkkqmu/IeXk+vbjw8utJ44qOCK+yxtbU4=; b=QcIt4hNuS9EEKKAaODLZLx4G6s
 DrDTJ3DqYRdp5UpqUy+ET9QTv5SCVDVBc3AGAyQMGD7MWIvGL2X4gpALHqx6ODBVRnxP6od1o39gM
 TVW2YqjujQSuzoa7wpsjva8UyL2UZnMFzCXSna91wqYk/zDL9GCuYSMSBD0WMP1ngU8U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qYAv0-00BgtA-8z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 19:50:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7100617F1;
 Mon, 21 Aug 2023 19:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A03CC433CC;
 Mon, 21 Aug 2023 19:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692647424;
 bh=es0bzIgys24sNzS+9pgWgwW0Yx6y8DpEGYMD/Xo+ZHg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LOI9JU2kyMrnVX4aIdjDHRNagfNKznt/O/b/bAGE1UpixxCC8rn3yvkJZr/bCRQ0C
 UppzrTyhF/caPtr900gtOWxMKp2v9Iw8Brzgddq5lKj/MdS8HCxhK1sSwMWvq8OcMW
 oXLgrrWRdgxSA7YvtV58PEQOzs7QFyCokuyZjpVpAZtawDdD9H5H0y6PTR52pq6hft
 pUu05VJt/M/+IVWUGYnsm9mjIwjCzX2wwtS1c9S4NmBhRn7ZClg/ggKs/BRMbVpS4E
 YnLtKvm8XLNjeVmHV5QnyZv6GzqrDa5GwWqqSg9ITN6PBVdp9KuIjPzD8Vg8Av7Dlz
 9wKut4UL9vyLw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D6E90E21EE9; Mon, 21 Aug 2023 19:50:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169264742387.19522.17629491887216526280.git-patchwork-notify@kernel.org>
Date: Mon, 21 Aug 2023 19:50:23 +0000
References: <20230819003012.3473675-1-jaegeuk@kernel.org>
In-Reply-To: <20230819003012.3473675-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 18 Aug 2023 17:30:12 -0700 you
 wrote: > ====================================================== > WARNING:
 possible circular locking dependency detected >
 6.5.0-rc5-syzkaller-00353-gae545c3283d [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qYAv0-00BgtA-8z
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid false alarm of circular locking
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
Cc: syzbot+e5600587fa9cbf8e3826@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 18 Aug 2023 17:30:12 -0700 you wrote:
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.5.0-rc5-syzkaller-00353-gae545c3283dc #0 Not tainted
> ------------------------------------------------------
> syz-executor273/5027 is trying to acquire lock:
> ffff888077fe1fb0 (&fi->i_sem){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2133 [inline]
> ffff888077fe1fb0 (&fi->i_sem){+.+.}-{3:3}, at: f2fs_add_inline_entry+0x300/0x6f0 fs/f2fs/inline.c:644
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: avoid false alarm of circular locking
    https://git.kernel.org/jaegeuk/f2fs/c/5c13e2388bf3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
