Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4836AEB23
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Mar 2023 18:40:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pZbIn-0001pr-Dl;
	Tue, 07 Mar 2023 17:40:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pZbIe-0001pZ-F1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Mar 2023 17:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=la0oZmNvKqweXnZHompTbFrlIOx3WBimWTrJsybpmSU=; b=ZlJ8TGS4zCekeFBZmdUP8129t5
 QAoRes9jpyJKGKkIRUVN2eV+JzlO4gABbpilY8qylxv9tGQp9Ws4J3xPRUdu/pEbwsOMre8CruFVd
 3Q1BhuyGByaunFcVKbrWw2hBn0FdD8lv5OBhYlhDWucwYfytcCl+8vXJFrGm04z2sxKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=la0oZmNvKqweXnZHompTbFrlIOx3WBimWTrJsybpmSU=; b=b
 XmjVjn+4rXjf+7OmvgdX48Z4+veT0T+AJhZ3Kluq4qWjnPr1KiniSXAS+TeI6QvPAMK4rwF5NLXhD
 r3v6EZmZagG1uNIKWsFGzUIVGLZXR+pVJj7vcVElxdN9MrG7NYGz/GYR9TpYPAl2iLk+jBlmbE9dK
 Vel7JxUmUfgBJ9XQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pZbIe-002P0G-Ck for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Mar 2023 17:40:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0C317B819C2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  7 Mar 2023 17:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C61B9C4339B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  7 Mar 2023 17:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678210824;
 bh=cy27ytGDxPvtamaUXVky4I/hY8OHhtNzX1EGU0VUb+E=;
 h=Subject:From:Date:To:From;
 b=QYH03ftspa2vfD73ZPqlh/AEce4H35i3Bp5SYEDA2riaFV9KK72/4DldwYbm1PU0S
 QgLcvG0NlRE6y9KLaaw+UPp3V+rYER8WgwNsrGrkp03eIr5aR/w4f4Sk4MdZz8wksp
 EiYeWqUuuIaKmXPThgAQmW0O4y3WWdj+8xZCo6u64kdp7ghnkpSqZzn/JJcPUr+HpJ
 pJqEKCMiKP+5GWrG4zb9UeND8zI9z+DkIBp92mEU78GEpcAHqI3qbdfReaRWbd5tmP
 kKhm+LMbxgGP7NrzvIzTcRm9ywni9BcSOA1yaDfO29hCde1bPPoK9uxgVmvLPRB1pt
 6k+pzxbuJLmEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B252CE61B62 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  7 Mar 2023 17:40:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167821082472.1693.445568578886405399.git-patchwork-summary@kernel.org>
Date: Tue, 07 Mar 2023 17:40:24 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,-next] f2fs:
 make f2fs_sync_inode_meta() static Submitter: Li Zetao <lizetao1@huawei.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pZbIe-002P0G-Ck
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev,-next] f2fs: make f2fs_sync_inode_meta() static
  Submitter: Li Zetao <lizetao1@huawei.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=724214
  Lore link: https://lore.kernel.org/r/20230223012513.1781735-1-lizetao1@huawei.com

Patch: [f2fs-dev] f2fs: Fix f2fs_truncate_partial_nodes ftrace event
  Submitter: Douglas RAILLARD <douglas.raillard@arm.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=726890
  Lore link: https://lore.kernel.org/r/20230306122549.236561-1-douglas.raillard@arm.com

Patch: [f2fs-dev,v2,RESEND] f2fs: export compress_percent and compress_watermark entries
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=722545
  Lore link: https://lore.kernel.org/r/20230216140935.20447-1-frank.li@vivo.com

Patch: [f2fs-dev] f2fs: fix unaligned field offset in 32-bits platform
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=727435
  Lore link: https://lore.kernel.org/r/20230307151408.58490-1-chao@kernel.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
