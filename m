Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA9DB283BD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 18:20:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DE6ZwSAtZwzPcuot4Yb+O4EBQ/wF92C5TRn6BbnajEU=; b=jQhPY4gm7OoqRcoSBwO3xbEl1d
	373kYICeBK8gSnse+YWHPQodm4G63Zqff7Bhg25IgFJdPFlkiLeNvlXYoNs/Opyi4HRQNcMm0Z1FJ
	u2weQTXWQcZ+/VzzQRdpKQgaQNmmXGPXbCmFKcROAqhZPMLYBfAmkFnAomGdRP5RNRfE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umxAa-0000uS-CH;
	Fri, 15 Aug 2025 16:20:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1umxAY-0000uA-Cv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nYMony5sC8GAVbMQBrOINfD/pMK1q6qsHPU0yHRs9Jw=; b=GLqVMvc45wdmIQA7tjqpBHvs+f
 CN2u5Nnb09WGuYa5ItHfLhwg3MNCZzZqB0L3vmHh3oMOJGe0zlVfwcteToPj/JkSluGUeDkCbK1no
 4TEam/mmIVZTchjKhnhk8XazoNoXKpFsbuiT4s/nRWQBSOBoSoXJGUA55xrUOwTO+VPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nYMony5sC8GAVbMQBrOINfD/pMK1q6qsHPU0yHRs9Jw=; b=gP/P5MIew/KF+4LZmjD6nRx1ht
 AtCDWRwIsqi7man1pH3fovPvpnFK363eqzSuijv4bPGCIVuN4er4RzFPv02YAbrK3QXSBI6uhxoon
 iIFvxZ4TfedG1KPjfNj/Svz+kwA08AVa3VGzJcOkMeiSv/yNhU2BOs7mv1Mu8wqp3Q5I=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umxAY-0008PN-KN for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:20:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0CF4AA58309
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 16:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934CAC4CEEB;
 Fri, 15 Aug 2025 16:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755274831;
 bh=LiYEkGe4+vvYPDOoShkAaz5e8Puzmaj0zK3r3FwaX08=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=JOEkffsNYbw9wt45dnlbQnrTH4QXworbfNo7bhVRiOkP8BzbMfFBqRw81ApCIbWE9
 HvUfJU53KhVz0nIhe1PRmf5NbBTXuA2F1EHz3A+VEHYr99NPYjvoVWdhvLja2SE2rm
 GiR3xoY5y0bO8T0ICkz9fEVaD7o++QzRj/iIB9OY5daxn+nJvHfzetur3P8nUuDb2f
 tROUIhKpYgiXyJRKSRPCebrKJ4oKvjDvZXVB3uJzE1/AG0oK+Kyc3T6zCWPbMyuKGg
 yeM9OB7MZ+LkJqWi5CqsV2OaZTcboVMAoGMxNcqD7B8GOnykg56uQopapPi4tXQ6dK
 Yz5Z3dV3TlVuQ==
Date: Fri, 15 Aug 2025 16:20:29 +0000
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <aJ9eTaqNwkQZtA8E@google.com>
References: <20250812235814.960924-1-jaegeuk@kernel.org>
 <aJy8KS3fLQ452d2r@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aJy8KS3fLQ452d2r@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduces a proc entry to show the currently
 enrolled
 donation files. - "File path" indicates a file. - "Status" a. "Donated" means
 the file is registed in the donation list by fadvise(offset, length,
 POSIX_FADV_NOREUSE)
 b. "Evicted" means the donated pages were reclaim [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umxAY-0008PN-KN
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: show the list of donation files
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch introduces a proc entry to show the currently enrolled donation
files.

- "File path" indicates a file.
- "Status"
 a. "Donated" means the file is registed in the donation list by
    fadvise(offset, length, POSIX_FADV_NOREUSE)
 b. "Evicted" means the donated pages were reclaimed.
- "Offset (kb)" and "Length (kb) show the registered donation range.
- "Cached pages (kb)" shows the amount of cached pages in the inode page cache.

For example,

Donation List
 # of files  : 2
 File path                                              Status     Offset (kb)     Length (kb)    Cached pages (kb)
---
 /local/tmp/test2                                      Donated               0         1048576              2097152
 /local/tmp/test                                       Evicted               0         1048576              1048576

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 v3 - use loff_t

 fs/f2fs/sysfs.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 1ffaf9e74ce9..5d0f7364dbb8 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1769,6 +1769,68 @@ static int __maybe_unused disk_map_seq_show(struct seq_file *seq,
 	return 0;
 }
 
+static int __maybe_unused donation_list_seq_show(struct seq_file *seq,
+						void *offset)
+{
+	struct super_block *sb = seq->private;
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	struct inode *inode;
+	struct f2fs_inode_info *fi;
+	struct dentry *dentry;
+	char *buf, *path;
+	int i;
+
+	buf = f2fs_getname(sbi);
+	if (!buf)
+		return 0;
+
+	seq_printf(seq, "Donation List\n");
+	seq_printf(seq, " # of files  : %u\n", sbi->donate_files);
+	seq_printf(seq, " %-50s %10s %15s %15s %20s\n",
+			"File path", "Status", "Offset (kb)",
+			"Length (kb)", "Cached pages (kb)");
+	seq_printf(seq, "---\n");
+
+	for (i = 0; i < sbi->donate_files; i++) {
+		spin_lock(&sbi->inode_lock[DONATE_INODE]);
+		if (list_empty(&sbi->inode_list[DONATE_INODE])) {
+			spin_unlock(&sbi->inode_lock[DONATE_INODE]);
+			break;
+		}
+		fi = list_first_entry(&sbi->inode_list[DONATE_INODE],
+					struct f2fs_inode_info, gdonate_list);
+		list_move_tail(&fi->gdonate_list, &sbi->inode_list[DONATE_INODE]);
+		inode = igrab(&fi->vfs_inode);
+		spin_unlock(&sbi->inode_lock[DONATE_INODE]);
+
+		if (!inode)
+			continue;
+
+		inode_lock_shared(inode);
+
+		dentry = d_find_alias(inode);
+		if (!dentry) {
+			path = NULL;
+		} else {
+			path = dentry_path_raw(dentry, buf, PATH_MAX);
+			if (IS_ERR(path))
+				goto next;
+		}
+		seq_printf(seq, " %-50s %10s %15llu %15llu %20llu\n",
+				path ? path : "<unlinked>",
+				is_inode_flag_set(inode, FI_DONATE_FINISHED) ?
+				"Evicted" : "Donated",
+				(loff_t)fi->donate_start << (PAGE_SHIFT - 10),
+				(loff_t)(fi->donate_end + 1) << (PAGE_SHIFT - 10),
+				(loff_t)inode->i_mapping->nrpages << (PAGE_SHIFT - 10));
+next:
+		inode_unlock_shared(inode);
+		iput(inode);
+	}
+	f2fs_putname(buf);
+	return 0;
+}
+
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 static int __maybe_unused inject_stats_seq_show(struct seq_file *seq,
 						void *offset)
@@ -1878,6 +1940,8 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 				discard_plist_seq_show, sb);
 	proc_create_single_data("disk_map", 0444, sbi->s_proc,
 				disk_map_seq_show, sb);
+	proc_create_single_data("donation_list", 0444, sbi->s_proc,
+				donation_list_seq_show, sb);
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	proc_create_single_data("inject_stats", 0444, sbi->s_proc,
 				inject_stats_seq_show, sb);
-- 
2.51.0.rc1.163.g2494970778-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
