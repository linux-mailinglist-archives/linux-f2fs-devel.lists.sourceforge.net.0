Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC8651E1B4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 May 2022 01:20:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nn7Fk-0002pD-1x; Fri, 06 May 2022 23:20:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nn7Fi-0002p6-Vl
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 23:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QMwClOt53NT5HiqmGgjAygLMhnPG/2dnPVd76vGL7Gk=; b=V24di3R0ALDghTsoWzYTihJ+MS
 eAgkBhjvcpdUEEtGFG2tJ0352FUJaqu1iKu4kDU/zyu3Gm8YO1luSVw4CuSTMaFw5OKbh01vzfqZY
 HodaMnGJp5uMCfbbqhNbkPedImknnY51akwg52PgvfGXx6p5TN6130RjwRqQ1E4ClJBI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QMwClOt53NT5HiqmGgjAygLMhnPG/2dnPVd76vGL7Gk=; b=iT60uZkqlcJ6Y65BlU35Q3b9YU
 xmujQl21xZtXgdGBjyEA+ZMikGQ6kKBdu/W2phw7d5/T4nBnZx6pB0iYuS2lh5s0CIHI0RRxCJidj
 d4Oqr9oqsmwihQ8Osnub4sC5eyjOlth1Nd1Lx+bl6RuGQhuc7CdlgmoSlX4bgozJu/yc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nn7Fg-003dB0-OK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 23:20:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3DE66B83A44
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  6 May 2022 23:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81A3C385A8;
 Fri,  6 May 2022 23:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651879237;
 bh=paOGZ646ofsXxf6LRNQ+Cx4XSEFlOn+NkTo10rbSuNo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oNo2tIOdBhU/9g8+h80Zq5s9KEShdKn5Bl9IMIK9qsIT9dHOeLSb/TlDPm7wjBjIA
 QltafoQTL7yEUnlwSvg7AMnMwchRTiM9PSUFFaC+cls1dHpKOxUdvTHsX/BfKPYtUk
 ze4jmsp3wD03cIRtlRF1nTmzuE4KawT1LeYm0xgkqt9so7A9rTT9CPB9pAL7hmAujp
 nmbY+xEZzBQbY8MSENhlHeFdHXA4V8/MjvWhkFCqJITsfbhJL/tbgpDllGqz8NVO6Y
 L7wsE4rj4zNn1YY4gd75pvxg2KQqZ9eJc6DW+rp8kxjq9UTAYPhCCLv6LSHbesHckr
 R0xtRPnc6abxA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  6 May 2022 16:20:32 -0700
Message-Id: <20220506232032.1264078-5-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
In-Reply-To: <20220506232032.1264078-1-jaegeuk@kernel.org>
References: <20220506232032.1264078-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's avoid false-alarmed lockdep warning. [ 58.914674]
 [T1501146]
 -> #2 (&sb->s_type->i_mutex_key#20){+.+.}-{3:3}: [ 58.915975] [T1501146]
 system_server: down_write+0x7c/0xe0 [ 58.916738] [T1501146] system_server:
 f2fs_quota_sync+0x60/0x1a8 [ [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nn7Fg-003dB0-OK
Subject: [f2fs-dev] [PATCH 5/5] f2fs: don't need inode lock for system
 hidden quota
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's avoid false-alarmed lockdep warning.

[   58.914674] [T1501146] -> #2 (&sb->s_type->i_mutex_key#20){+.+.}-{3:3}:
[   58.915975] [T1501146] system_server:        down_write+0x7c/0xe0
[   58.916738] [T1501146] system_server:        f2fs_quota_sync+0x60/0x1a8
[   58.917563] [T1501146] system_server:        block_operations+0x16c/0x43c
[   58.918410] [T1501146] system_server:        f2fs_write_checkpoint+0x114/0x318
[   58.919312] [T1501146] system_server:        f2fs_issue_checkpoint+0x178/0x21c
[   58.920214] [T1501146] system_server:        f2fs_sync_fs+0x48/0x6c
[   58.920999] [T1501146] system_server:        f2fs_do_sync_file+0x334/0x738
[   58.921862] [T1501146] system_server:        f2fs_sync_file+0x30/0x48
[   58.922667] [T1501146] system_server:        __arm64_sys_fsync+0x84/0xf8
[   58.923506] [T1501146] system_server:        el0_svc_common.llvm.12821150825140585682+0xd8/0x20c
[   58.924604] [T1501146] system_server:        do_el0_svc+0x28/0xa0
[   58.925366] [T1501146] system_server:        el0_svc+0x24/0x38
[   58.926094] [T1501146] system_server:        el0_sync_handler+0x88/0xec
[   58.926920] [T1501146] system_server:        el0_sync+0x1b4/0x1c0

[   58.927681] [T1501146] -> #1 (&sbi->cp_global_sem){+.+.}-{3:3}:
[   58.928889] [T1501146] system_server:        down_write+0x7c/0xe0
[   58.929650] [T1501146] system_server:        f2fs_write_checkpoint+0xbc/0x318
[   58.930541] [T1501146] system_server:        f2fs_issue_checkpoint+0x178/0x21c
[   58.931443] [T1501146] system_server:        f2fs_sync_fs+0x48/0x6c
[   58.932226] [T1501146] system_server:        sync_filesystem+0xac/0x130
[   58.933053] [T1501146] system_server:        generic_shutdown_super+0x38/0x150
[   58.933958] [T1501146] system_server:        kill_block_super+0x24/0x58
[   58.934791] [T1501146] system_server:        kill_f2fs_super+0xcc/0x124
[   58.935618] [T1501146] system_server:        deactivate_locked_super+0x90/0x120
[   58.936529] [T1501146] system_server:        deactivate_super+0x74/0xac
[   58.937356] [T1501146] system_server:        cleanup_mnt+0x128/0x168
[   58.938150] [T1501146] system_server:        __cleanup_mnt+0x18/0x28
[   58.938944] [T1501146] system_server:        task_work_run+0xb8/0x14c
[   58.939749] [T1501146] system_server:        do_notify_resume+0x114/0x1e8
[   58.940595] [T1501146] system_server:        work_pending+0xc/0x5f0

[   58.941375] [T1501146] -> #0 (&sbi->gc_lock){+.+.}-{3:3}:
[   58.942519] [T1501146] system_server:        __lock_acquire+0x1270/0x2868
[   58.943366] [T1501146] system_server:        lock_acquire+0x114/0x294
[   58.944169] [T1501146] system_server:        down_write+0x7c/0xe0
[   58.944930] [T1501146] system_server:        f2fs_issue_checkpoint+0x13c/0x21c
[   58.945831] [T1501146] system_server:        f2fs_sync_fs+0x48/0x6c
[   58.946614] [T1501146] system_server:        f2fs_do_sync_file+0x334/0x738
[   58.947472] [T1501146] system_server:        f2fs_ioc_commit_atomic_write+0xc8/0x14c
[   58.948439] [T1501146] system_server:        __f2fs_ioctl+0x674/0x154c
[   58.949253] [T1501146] system_server:        f2fs_ioctl+0x54/0x88
[   58.950018] [T1501146] system_server:        __arm64_sys_ioctl+0xa8/0x110
[   58.950865] [T1501146] system_server:        el0_svc_common.llvm.12821150825140585682+0xd8/0x20c
[   58.951965] [T1501146] system_server:        do_el0_svc+0x28/0xa0
[   58.952727] [T1501146] system_server:        el0_svc+0x24/0x38
[   58.953454] [T1501146] system_server:        el0_sync_handler+0x88/0xec
[   58.954279] [T1501146] system_server:        el0_sync+0x1b4/0x1c0

Cc: stable@vger.kernel.org
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/super.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5d5b35067c3d..09435280d856 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2700,7 +2700,8 @@ int f2fs_quota_sync(struct super_block *sb, int type)
 		if (!sb_has_quota_active(sb, cnt))
 			continue;
 
-		inode_lock(dqopt->files[cnt]);
+		if (!f2fs_sb_has_quota_ino(sbi))
+			inode_lock(dqopt->files[cnt]);
 
 		/*
 		 * do_quotactl
@@ -2719,7 +2720,8 @@ int f2fs_quota_sync(struct super_block *sb, int type)
 		f2fs_up_read(&sbi->quota_sem);
 		f2fs_unlock_op(sbi);
 
-		inode_unlock(dqopt->files[cnt]);
+		if (!f2fs_sb_has_quota_ino(sbi))
+			inode_unlock(dqopt->files[cnt]);
 
 		if (ret)
 			break;
-- 
2.36.0.512.ge40c2bad7a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
