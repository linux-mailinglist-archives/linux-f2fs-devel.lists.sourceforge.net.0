Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3664D3C5A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Mar 2022 22:48:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nS4At-00046H-JB; Wed, 09 Mar 2022 21:48:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nS4As-000462-4e
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 21:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3exBjVHMEKXnlGSCE7JpGba28krUWdHAP1uw8iDzqRs=; b=hsB9OEzjEtCa+vBNPe/Tgs4BMS
 Tkqf7hyqE9sLC0oPy+69gW3n4wDnO4K2ug+O4cCqBwqzUjjT8JP/1/vXi6GkryhktSzkdM11x2B5/
 K0zYyqe/GWFXucrvXQGJUS2TykWC2ju57NMHVaEH9s+Z83E3g8kwXQlw6kuzHEqsBTto=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3exBjVHMEKXnlGSCE7JpGba28krUWdHAP1uw8iDzqRs=; b=k
 5ucNIo+tu4DTD4H3d7YXya+eKTved6em9mIyPF/yRzWoy4GI0QU+OAH/Xhncc5hdZjcYwWU4eb/tX
 ofbdn45P0uq4sX7KMjup0JPV41HAITZxQGdFuk3jlmvtbPNna9p0of7GUqTmuFrWkp3SGo2KKlorP
 CskXeu0JYJnACnAo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nS4Ak-0001oc-A5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 21:48:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E065B61995
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  9 Mar 2022 21:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48706C340EE;
 Wed,  9 Mar 2022 21:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646862516;
 bh=JG1VmYVLKB8YkFi9TpzVjvEM9eVANxrBU35l07oWWWU=;
 h=From:To:Cc:Subject:Date:From;
 b=mSGMX9y9zsbr0yFRYmEmhJRRyeKQU3BlErfS7erzYwLvQ2G99Zs9pjyskin8Bhkza
 aPjWW6DuU3toquxj6Nj+HPtmhyHB+U5zzOMxHYgBrfPjsgQjqQDxyO6KuIwqdkTj+l
 vz7JQpa/ohSmRdHDD5Fl7ODE4suA+pDYOstMOeGHCScrYslY2LxsOgbIq5qvzQc07n
 gWaEITB/vJnQ0TFnGm2Ojbzx/C+68eDgW9XubpW27AF4K38cwDIqazjF6Kc9bD4NKw
 lSGzgr0OqqGDmS5fVJ9jtZZLGMkMgM3FchHZR9URFqRwiZ9IbmsSgoW99eTpCC6oYa
 DOEyvkFZe7Exw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  9 Mar 2022 13:48:33 -0800
Message-Id: <20220309214834.3408741-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's purge inode cache in order to avoid the below deadlock.
 [freeze test] shrinkder freeze_super - pwercpu_down_write(SB_FREEZE_FS) -
 super_cache_scan - down_read(&sb->s_umount) - prune_icache_sb - dispose_list
 - evict - f2fs_evict_inode thaw_super - down_writ [...] 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nS4Ak-0001oc-A5
Subject: [f2fs-dev] [PATCH 1/2] f2fs: evict inode cache for frozen fs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's purge inode cache in order to avoid the below deadlock.

[freeze test]                         shrinkder
freeze_super
 - pwercpu_down_write(SB_FREEZE_FS)
                                       - super_cache_scan
                                         - down_read(&sb->s_umount)
                                           - prune_icache_sb
                                            - dispose_list
                                             - evict
                                              - f2fs_evict_inode
thaw_super
 - down_write(&sb->s_umount);
                                              - __percpu_down_read(SB_FREEZE_FS)

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/debug.c | 1 +
 fs/f2fs/f2fs.h  | 1 +
 fs/f2fs/inode.c | 6 ++++--
 fs/f2fs/super.c | 4 ++++
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 9a13902c7702..cba5eab24595 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -338,6 +338,7 @@ static char *s_flag[] = {
 	[SBI_QUOTA_SKIP_FLUSH]	= " quota_skip_flush",
 	[SBI_QUOTA_NEED_REPAIR]	= " quota_need_repair",
 	[SBI_IS_RESIZEFS]	= " resizefs",
+	[SBI_IS_FREEZING]	= " freezefs",
 };
 
 static int stat_show(struct seq_file *s, void *v)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 68d791ec8b27..da729f53daa8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1293,6 +1293,7 @@ enum {
 	SBI_QUOTA_SKIP_FLUSH,			/* skip flushing quota in current CP */
 	SBI_QUOTA_NEED_REPAIR,			/* quota file may be corrupted */
 	SBI_IS_RESIZEFS,			/* resizefs is in process */
+	SBI_IS_FREEZING,			/* freezefs is in process */
 };
 
 enum {
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index ab8e0c06c78c..71f232dcf3c2 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -778,7 +778,8 @@ void f2fs_evict_inode(struct inode *inode)
 	f2fs_remove_ino_entry(sbi, inode->i_ino, UPDATE_INO);
 	f2fs_remove_ino_entry(sbi, inode->i_ino, FLUSH_INO);
 
-	sb_start_intwrite(inode->i_sb);
+	if (!is_sbi_flag_set(sbi, SBI_IS_FREEZING))
+		sb_start_intwrite(inode->i_sb);
 	set_inode_flag(inode, FI_NO_ALLOC);
 	i_size_write(inode, 0);
 retry:
@@ -809,7 +810,8 @@ void f2fs_evict_inode(struct inode *inode)
 		if (dquot_initialize_needed(inode))
 			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
 	}
-	sb_end_intwrite(inode->i_sb);
+	if (!is_sbi_flag_set(sbi, SBI_IS_FREEZING))
+		sb_end_intwrite(inode->i_sb);
 no_delete:
 	dquot_drop(inode);
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8e3840973077..4b570b5c2674 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1663,11 +1663,15 @@ static int f2fs_freeze(struct super_block *sb)
 	/* ensure no checkpoint required */
 	if (!llist_empty(&F2FS_SB(sb)->cprc_info.issue_list))
 		return -EINVAL;
+
+	/* to avoid deadlock on f2fs_evict_inode->SB_FREEZE_FS */
+	set_sbi_flag(F2FS_SB(sb), SBI_IS_FREEZING);
 	return 0;
 }
 
 static int f2fs_unfreeze(struct super_block *sb)
 {
+	clear_sbi_flag(F2FS_SB(sb), SBI_IS_FREEZING);
 	return 0;
 }
 
-- 
2.35.1.616.g0bdcbb4464-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
