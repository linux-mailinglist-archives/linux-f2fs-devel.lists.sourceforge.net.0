Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A04C870465F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 May 2023 09:28:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pyp6d-0003U8-Ny;
	Tue, 16 May 2023 07:28:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pyp6c-0003U2-By
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 May 2023 07:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3oTgET3Xe21nAPBhzJMeJL+HhBYDpbTYheTExCTsSy0=; b=MpfY7E+1dokSZ/7Nn8bD1HAAyW
 FWoxcoRh8ElT/wPo4mzwcDsJ4LNHZD3sf5PtltPaKcQXEmtf00mnanepbbcntUAB0CyHMMnTQPA+O
 q1URnAsJIUxftrB160shlvswA1huyqt1sTMIfqtnODovHF4c/shwsXNZ9XCT+V2rFx6I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3oTgET3Xe21nAPBhzJMeJL+HhBYDpbTYheTExCTsSy0=; b=j
 dnlhplHQ2+pbwxZ59qFCIPfVeJSDBuvyJ0L7R3H69DPyxPsM0Qpy5pWFqT4Lx6jZHUH8ZEa4okztc
 ETAfm1wcdA68U9psgOIIxsg8Lju+zcdSPcdgo6Jmd+2v9QkVHkF0hokjG/niSJMb6hLsb5xUF0VKE
 hMraZGVgvLgrHUKE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pyp6b-009Gpe-ST for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 May 2023 07:28:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 80279617C4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 May 2023 07:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E48C433EF;
 Tue, 16 May 2023 07:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684222095;
 bh=dO2v/mmJtC/axl2ORnWKUJi1G18wwI+1u97V97R8n8g=;
 h=From:To:Cc:Subject:Date:From;
 b=tfW/RTU8jvHWg7nWGwWID3FXNbGCne06LTvXcfKMI2ES2ZzGDpfMfL9RTCAB4DKSt
 hI8K90R+8GhS0oGLqMyTZMsRombDbUd+pN/HMGdQ8LYdK5WhERQehcvIGVKCS3xCB4
 RGMrWXneMIUDNDmohGiWqh7LNjUgaTgPjmwPzONjxJr/RXgFsEEJE3x8PVo0gMTspC
 F0YsBygp5L3hTtA7fwBSo0equR5vbH5Q1QXcnAppaFUe/uXK4Fo6zGQ/ud/yfc8dUv
 1cKSazTq6NIMqTBVWsf0Bs99jnMIUPSYrI2iWjYm8jY9cJ2oyeFKfOJZsSuvOFZRgA
 b4Ize0reIW6vg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 16 May 2023 15:27:55 +0800
Message-Id: <20230516072755.3138097-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In IRQ context, it wakes up workqueue to record errors into
 on-disk superblock fields rather than in-memory fields. Signed-off-by: Chao
 Yu <chao@kernel.org> --- fs/f2fs/compress.c | 2 +- fs/f2fs/f2fs.h | 1 +
 fs/f2fs/super.c
 | 26 +++++++++++++++++++++++--- 3 files changed, 25 insertions(+),
 4 deletions(-)
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pyp6b-009Gpe-ST
Subject: [f2fs-dev] [PATCH] f2fs: flush error flags in workqueue
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In IRQ context, it wakes up workqueue to record errors into on-disk
superblock fields rather than in-memory fields.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c |  2 +-
 fs/f2fs/f2fs.h     |  1 +
 fs/f2fs/super.c    | 26 +++++++++++++++++++++++---
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d46e695d9666..60e3959a901e 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -744,7 +744,7 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
 
 		/* Avoid f2fs_commit_super in irq context */
 		if (!in_task)
-			f2fs_save_errors(sbi, ERROR_FAIL_DECOMPRESSION);
+			f2fs_handle_error_async(sbi, ERROR_FAIL_DECOMPRESSION);
 		else
 			f2fs_handle_error(sbi, ERROR_FAIL_DECOMPRESSION);
 		goto out_release;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1c7a12d4ba14..0c0929a0f891 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3563,6 +3563,7 @@ void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag);
 void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
 							bool irq_context);
 void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
+void f2fs_handle_error_async(struct f2fs_sb_info *sbi, unsigned char error);
 int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
 int f2fs_sync_fs(struct super_block *sb, int sync);
 int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 374c990810ea..a60267f7b073 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3989,6 +3989,11 @@ static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
 	f2fs_down_write(&sbi->sb_lock);
 
 	spin_lock_irqsave(&sbi->error_lock, flags);
+	if (sbi->error_dirty) {
+		memcpy(F2FS_RAW_SUPER(sbi)->s_errors, sbi->errors,
+							MAX_F2FS_ERRORS);
+		sbi->error_dirty = false;
+	}
 	memcpy(raw_super->s_stop_reason, sbi->stop_reason, MAX_STOP_REASON);
 	spin_unlock_irqrestore(&sbi->error_lock, flags);
 
@@ -4028,12 +4033,10 @@ static bool f2fs_update_errors(struct f2fs_sb_info *sbi)
 	return need_update;
 }
 
-void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
+void f2fs_record_errors(struct f2fs_sb_info *sbi, unsigned char error)
 {
 	int err;
 
-	f2fs_save_errors(sbi, error);
-
 	f2fs_down_write(&sbi->sb_lock);
 
 	if (!f2fs_update_errors(sbi))
@@ -4047,6 +4050,23 @@ void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
 	f2fs_up_write(&sbi->sb_lock);
 }
 
+void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
+{
+	f2fs_save_errors(sbi, error);
+	f2fs_record_errors(sbi, error);
+}
+
+void f2fs_handle_error_async(struct f2fs_sb_info *sbi, unsigned char error)
+{
+	f2fs_save_errors(sbi, error);
+
+	if (!sbi->error_dirty)
+		return;
+	if (!test_bit(error, (unsigned long *)sbi->errors))
+		return;
+	schedule_work(&sbi->s_error_work);
+}
+
 static bool system_going_down(void)
 {
 	return system_state == SYSTEM_HALT || system_state == SYSTEM_POWER_OFF
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
