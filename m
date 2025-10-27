Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C93CBC0BF7D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 07:36:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O+wUjtaQIamSNNz6P8eqPCa/83j5GD3jemLDNjfRaAQ=; b=WOTzj5FHV8ymVnCOvA5hV7V+/3
	3hnkcEAhfWc8etN7PtyKfzI+iiHlQdn6Teqoo/ooHILAUNRDorzyqN/fMd71ycsOJD5mLXLO1FZsG
	jhtf7FlYz/KanzHOmnNfG3aJptPVGeCQx5MzE2EtaONozn92SW8UPpxJdn4gII5cfGBo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDGpy-00059h-94;
	Mon, 27 Oct 2025 06:36:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vDGpc-00057P-VM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 06:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=35QzzXroFb3YJDQucwBsUqRZI8s6sIAjc5bWG5CG1X4=; b=KG1i3paLkP8QA++QbSkK20S0iZ
 fTWp15EAq3nyzOcHztKN1andAe1Rzsjqvi/vIVntGcsDOrMCiVVUGU+66N+e3YvIuavPpPCIfYOb5
 2t6iRAE3QGxB7rupNwO8yhUCDCyo6rwfUfLYJFBOSFElGDr+hoKoBSKbhwFJPjk0e5zU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=35QzzXroFb3YJDQucwBsUqRZI8s6sIAjc5bWG5CG1X4=; b=d
 MEnR8bH7AANuCbC9K1Et+ipiiaLCshWIqFdvSevAm7phLTwYvT8W3kUPFTslOAwwCyTqQzB8BAq/i
 Ep7HACNo1EpI7+p6yZseeMrC9f3j9tCWXQCPZq1asUt04Sl0q+asmWknTZRw24+NGMjlSMdnO4BTi
 1+HfuU20WCXBG0+c=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDGpc-00063e-Df for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 06:35:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C5BE760231
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Oct 2025 06:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8DFC4CEF1;
 Mon, 27 Oct 2025 06:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761546941;
 bh=cnBqocTIBv8pGbbaja/xhKcMkS3FBNsTkcmNkQBJ9wo=;
 h=From:To:Cc:Subject:Date:From;
 b=qSk+gYhFG82ig+uHN6equxn0vON1oq5UwEol69lKu85esFFMCbEPfaGf8bK/uL68h
 /5R23loauus+AfHU/d8aNaUGl/nQ/W2OoQioWCrpqsE0K7RLPaLebjhSgV36J0L27C
 EjOBO6ivOiI1q0hrD7n6Zy22pIJ1gtJZdoujtlpQuvO1+fWyfPtaVDLIzx+6fZ/7+m
 FVmcgnYeBpsadN057saAUWyf7KVQZgw6JjWuPFLzO95h8gJO7Yc0OpJzmnc8p4ZCVA
 alm3vRVwLvsAU69N3wZqUdW3U+6lM6H7oNdUgr/XCQ0vogUYMdMa0hoAbsm/w3hC60
 UQD1xwjTI/XKA==
To: jaegeuk@kernel.org
Date: Mon, 27 Oct 2025 14:35:33 +0800
Message-ID: <20251027063534.103963-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In order to let userspace detect such error rather than
 suffering
 silent failure. Fixes: 4354994f097d ("f2fs: checkpoint disabling") Cc:
 stable@kernel.org
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/super.c | 26
 ++++++++++++++++ 1 file changed, 16 insertions(+), [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDGpc-00063e-Df
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix to propagate error from
 f2fs_enable_checkpoint()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In order to let userspace detect such error rather than suffering
silent failure.

Fixes: 4354994f097d ("f2fs: checkpoint disabling")
Cc: stable@kernel.org
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6e52e36c1f1a..65b6269ca1dc 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2633,10 +2633,11 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 	return err;
 }
 
-static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
+static int f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 {
 	unsigned int nr_pages = get_pages(sbi, F2FS_DIRTY_DATA) / 16;
 	long long start, writeback, end;
+	int ret;
 
 	f2fs_info(sbi, "f2fs_enable_checkpoint() starts, meta: %lld, node: %lld, data: %lld",
 					get_pages(sbi, F2FS_DIRTY_META),
@@ -2670,7 +2671,9 @@ static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 	set_sbi_flag(sbi, SBI_IS_DIRTY);
 	f2fs_up_write(&sbi->gc_lock);
 
-	f2fs_sync_fs(sbi->sb, 1);
+	ret = f2fs_sync_fs(sbi->sb, 1);
+	if (ret)
+		f2fs_err(sbi, "%s sync_fs failed, ret: %d", __func__, ret);
 
 	/* Let's ensure there's no pending checkpoint anymore */
 	f2fs_flush_ckpt_thread(sbi);
@@ -2680,6 +2683,7 @@ static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 	f2fs_info(sbi, "f2fs_enable_checkpoint() finishes, writeback:%llu, sync:%llu",
 					ktime_ms_delta(writeback, start),
 					ktime_ms_delta(end, writeback));
+	return ret;
 }
 
 static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
@@ -2893,7 +2897,9 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 				goto restore_discard;
 			need_enable_checkpoint = true;
 		} else {
-			f2fs_enable_checkpoint(sbi);
+			err = f2fs_enable_checkpoint(sbi);
+			if (err)
+				goto restore_discard;
 			need_disable_checkpoint = true;
 		}
 	}
@@ -2936,7 +2942,8 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 	return 0;
 restore_checkpoint:
 	if (need_enable_checkpoint) {
-		f2fs_enable_checkpoint(sbi);
+		if (f2fs_enable_checkpoint(sbi))
+			f2fs_warn(sbi, "checkpoint has not been enabled");
 	} else if (need_disable_checkpoint) {
 		if (f2fs_disable_checkpoint(sbi))
 			f2fs_warn(sbi, "checkpoint has not been disabled");
@@ -5258,13 +5265,12 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (err)
 		goto sync_free_meta;
 
-	if (test_opt(sbi, DISABLE_CHECKPOINT)) {
+	if (test_opt(sbi, DISABLE_CHECKPOINT))
 		err = f2fs_disable_checkpoint(sbi);
-		if (err)
-			goto sync_free_meta;
-	} else if (is_set_ckpt_flags(sbi, CP_DISABLED_FLAG)) {
-		f2fs_enable_checkpoint(sbi);
-	}
+	else if (is_set_ckpt_flags(sbi, CP_DISABLED_FLAG))
+		err = f2fs_enable_checkpoint(sbi);
+	if (err)
+		goto sync_free_meta;
 
 	/*
 	 * If filesystem is not mounted as read-only then
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
