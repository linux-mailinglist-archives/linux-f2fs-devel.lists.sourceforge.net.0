Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E929871182
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Mar 2024 01:17:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhIUq-0004oR-0m;
	Tue, 05 Mar 2024 00:17:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rhIUo-0004oL-Ku
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 00:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NhO0ah6evZRsr0YnpDXSEyEnLVE/wbRhRvpPufHg7Es=; b=lRpq1+WLNmDdXMP+V4ku9MVvX6
 CrUjgkWn1LIaBO1/6ma4jUT1gFEgCJJnBTx4AhlfZKKYucJg0fq3SkTEBrADxiguo7QipfztludPI
 JJ+8Axx1awS4f9l8NqpihpIipoF8MmzuFHssKzpB7cIk8TcEquHB9eGj2xEaBGo7rJRg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NhO0ah6evZRsr0YnpDXSEyEnLVE/wbRhRvpPufHg7Es=; b=g
 UTvgJpWQEpJ2sG9d168C0hBwzSONOvMGPtPd9RDcSMi28i4BbqsoB3aJt3UzkUz1fjX1ZKrvmSTil
 aMKMSr9s7XEe85uBPlxOjOwaXqZRTt6vhJke5P3o8rwQRGwlMLHQkXSYWmyAnLHMZtWG+pcm3wZpt
 IEH0nLRRQmPzlCTI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhIUh-0001BN-7r for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 00:17:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A6120CE16FA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 Mar 2024 00:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B3AC433C7;
 Tue,  5 Mar 2024 00:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709597832;
 bh=X24FBJ7XKj3QZoWahGRowLBOY8gsvUFkYviO7f+NmHI=;
 h=From:To:Cc:Subject:Date:From;
 b=Rh16Qq+QpyKJbfey5Su2Sp04RYCIIfFAzU9qcg7OcmOtsMQlXIYp4+bCZcghLTvo4
 NSC9pvM1mWWGLX3fHP0wojBk/mDWI75mgUuuUliUSTpmKKdteUqaoxPeQRq1lhPA5t
 AortwTaUJrHTrX61rm/yIYsKytn+RZrg/7dYGSWfzOyxdmTirsI0gZtb/wf4Yn3mME
 s+haz5gntfbcqfebHLHDOLWE9jsHh3HkOyW4RulZNmD4K60obOP4/bwp2uKGgg7PWS
 3V6h8DWWeXDBltPErP/DXxT19tDfZH20XpHustHpT+atpmcJaaImKIOT9apFC9PhB8
 IpQT1MIEMD/QQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  4 Mar 2024 16:17:08 -0800
Message-ID: <20240305001709.637722-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
MIME-Version: 1.0
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds the disk map of block address ranges
 configured
 by multiple partitions. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 fs/f2fs/sysfs.c | 23 +++++++++++++++++++++++ 1 file changed, 23 insertions(+)
 Content analysis details:   (-3.1 points, 6.0 required)
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
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhIUh-0001BN-7r
Subject: [f2fs-dev] [PATCH] f2fs: add a proc entry show disk map
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

This patch adds the disk map of block address ranges configured by multiple
partitions.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/sysfs.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 10f308b3128f..e81af6adb85b 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1492,6 +1492,27 @@ static int __maybe_unused discard_plist_seq_show(struct seq_file *seq,
 	return 0;
 }
 
+static int __maybe_unused disk_map_seq_show(struct seq_file *seq,
+						void *offset)
+{
+	struct super_block *sb = seq->private;
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	int i;
+
+	seq_puts(seq, "Disk Map for multi devices:\n");
+	if (!f2fs_is_multi_device(sbi))
+		return 0;
+
+	for (i = 0; i < sbi->s_ndevs; i++) {
+		seq_printf(seq, "%2d (zoned=%d): %20x - %20x",
+			i, bdev_is_zoned(FDEV(i).bdev),
+			FDEV(i).start_blk, FDEV(i).end_blk);
+		seq_putc(seq, '\n');
+	}
+	return 0;
+}
+
+
 int __init f2fs_init_sysfs(void)
 {
 	int ret;
@@ -1573,6 +1594,8 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 				victim_bits_seq_show, sb);
 	proc_create_single_data("discard_plist_info", 0444, sbi->s_proc,
 				discard_plist_seq_show, sb);
+	proc_create_single_data("disk_map", 0444, sbi->s_proc,
+				disk_map_seq_show, sb);
 	return 0;
 put_feature_list_kobj:
 	kobject_put(&sbi->s_feature_list_kobj);
-- 
2.44.0.278.ge034bb2e1d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
