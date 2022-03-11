Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6BA4D5A67
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Mar 2022 06:22:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nSXjJ-0004c0-Cn; Fri, 11 Mar 2022 05:22:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nSXjH-0004bt-KG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Mar 2022 05:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ouuTSbGM1o4XFTUR1JzVJoe9bj3AgROI4L4dglfoBEA=; b=DOvpYNbSQqAOXRyF3WS9g5YlNc
 2GLO6ST8Vld9vPrlqkf2Ys+95zf6pyzFvpRV8J6hez61lYIrOjIf28cmFmdjpCq4InraC9FgWBQcP
 22AV1SPZmHW/dWzb/kAqKagpL7LtkJg/Jogp26hwM3PzimceWISSPtYf0YYirHJ3tT5s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ouuTSbGM1o4XFTUR1JzVJoe9bj3AgROI4L4dglfoBEA=; b=CdxJdhdZ97HAeI9YlkEgAAUW54
 jpvw7mh8Ov1nR+XUCqWiKa72XZg5+sgFex9YxXVxEA3CINX0R6CUDvqpMubGUJIoml0gz4nZSCAW4
 ah7Bst0m7rs6N1a0QSMAPrhUl875AacyEhkWgvM9N2zVqh//jfU63LaKIwTzZcexrcQc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nSXjF-00Bksw-BY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Mar 2022 05:22:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED369619BC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Mar 2022 05:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C949C340EC;
 Fri, 11 Mar 2022 05:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646976131;
 bh=8gqE6SNCXYrxBQ43gUi43oisXrMLQipGnGqrX9t1jAg=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=inNNV5r+0gxtvwo+9FvyS2LZxm1WpUr72oCgH87pOCQpqcSm5wZehU93QOG2Zfa0o
 TxHFZSqxo5HIg38GU+5pjWilylKLLgx0lDCAETphdnVFPRYAfZbPIBDSlqOJ3RVcEC
 NoRYTSkqf9aXephGUXBWSobaX+Tx23pyvwk6VvmhuTmGkef5AsfryR42WGPDuRS6vt
 mRKvS0GjvRi8En4Bvx6SUKA6Rh3wQSKtPKTpIGwTIJW8uWrcaILEvAIrQJMphCDSXt
 q0YsxCWHZ+HpwC3blY+kA5dPFHVgljXol5kGQ1LfGAg3uMaFRTnEnA4eTpVRLngih0
 FsBI6Q0smfrIw==
Date: Thu, 10 Mar 2022 21:22:09 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Yircgd9d773xnk3+@google.com>
References: <20220309214834.3408741-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220309214834.3408741-1-jaegeuk@kernel.org>
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
X-Headers-End: 1nSXjF-00Bksw-BY
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs: don't get FREEZE lock in
 f2fs_evict_inode in frozen fs
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

 Change log from v1:
  - add doc

 Documentation/ABI/testing/sysfs-fs-f2fs | 1 +
 fs/f2fs/debug.c                         | 1 +
 fs/f2fs/f2fs.h                          | 1 +
 fs/f2fs/inode.c                         | 6 ++++--
 fs/f2fs/super.c                         | 4 ++++
 5 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 58bf0dc83712..5a5f3c5445f6 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -458,6 +458,7 @@ Description:	Show status of f2fs superblock in real time.
 		0x800  SBI_QUOTA_SKIP_FLUSH  skip flushing quota in current CP
 		0x1000 SBI_QUOTA_NEED_REPAIR quota file may be corrupted
 		0x2000 SBI_IS_RESIZEFS       resizefs is in process
+		0x4000 SBI_IS_FREEZING       freefs is in process
 		====== ===================== =================================
 
 What:		/sys/fs/f2fs/<disk>/ckpt_thread_ioprio
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
2.35.1.723.g4982287a31-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
