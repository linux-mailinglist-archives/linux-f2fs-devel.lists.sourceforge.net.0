Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F6DB23CD1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Aug 2025 01:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xdambBUeIoH509I9GAdbKgr/up5T7JkVnhcaVRgG1AQ=; b=boczqeyIO+B5VFMSqfz4dG4v2A
	78zhG6wx5Ht5SwcOhMR+lDV/8Vf2j5XBDaEgD8Q0JkUeKpsREaVLqT0k8SG+pnZN1SXgbwnDJTJnr
	Gvz47En/l2EGpBPlLvIbJ9YdQuMKrKnKbTH6qbm7G7mAchS36/jS3Y6/nnAQkd1GLGIQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulysx-0005S5-QS;
	Tue, 12 Aug 2025 23:58:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ulysw-0005Rx-FX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 23:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+JIZ+DHGfGOA0XkJHHR+ywHE5BmA1SwxSK6ydNy2z30=; b=G9XSWJQN3MUYTxwN5xaA+6sH9t
 HQQoL64HUng025UhOGTqshz9ZdRKG9ZgZlWNXo8luNpqHjwHJ9kS6We2VjrUIixX1cJz9A8/HqDwX
 ym/rJph6fZc2ZD8InjeRf7OwiCXOGYe5h6LdQwV35crwza8iGKl5Sp4TgY0SKWgtOvds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+JIZ+DHGfGOA0XkJHHR+ywHE5BmA1SwxSK6ydNy2z30=; b=E
 RVvz7Oz5eM5p/dxdnOJqZq5sb5dke3cB6xE/pofCHEcFzWWvBBcL97GCsdACl1TRxCKWy9891lu/I
 hxyaFA2d4lfLug4CvjaSqs4xD4/k6T/bGuKnWW8NXuPbf54/o0XjMCvBgoyUW8cHLaImiII6O72dc
 CO3+FbiRCO5YeKBE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ulysw-0000GY-0r for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 23:58:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 94DBA43C8B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Aug 2025 23:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667E6C4CEF0;
 Tue, 12 Aug 2025 23:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755043099;
 bh=ReDrEs2QM9oVpwT4Ru+LnnZtyb0Z4Ptf81izg5DGuRY=;
 h=From:To:Cc:Subject:Date:From;
 b=pV92m+vBu4kzIOVpP84WGa0oclITdbAC+ipi4TGoQUOmbDmabbdhwnZSmvJ7CO3Zw
 xeSf17QC/poNSvKv1MZmKFhZ6K8wIOBRXeeklSxt0dukgETcCZnE8PSZoyEEw8rXa2
 5E9EYvpvten4nYWEJYk9b+sfm+F/soID+DA9A6iOxMZ9/8iaRClckAk21WH8BIV2TE
 wnznxjJnqC6h0jA6q3cF6BJfmK++jbtBDf7i/jN7kOyweM5eDXghkBtsvv8U6Gu28U
 rIHHDWha1nEfCd0SAu1ONV06cK9wBsJUSrh/Qg/3CDb/lUyM2LCAbZWw7+rksgp/fi
 ebf4iMA57qzdA==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 12 Aug 2025 23:58:14 +0000
Message-ID: <20250812235814.960924-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ulysw-0000GY-0r
Subject: [f2fs-dev] [PATCH] f2fs: show the list of donation files
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
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
 fs/f2fs/sysfs.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 1ffaf9e74ce9..2de7557bfebf 100644
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
+		inode_lock(inode);
+
+		dentry = d_find_alias(inode);
+		if (!dentry) {
+			path = NULL;
+		} else {
+			path = dentry_path_raw(dentry, buf, PATH_MAX);
+			if (IS_ERR(path))
+				goto next;
+		}
+		seq_printf(seq, " %-50s %10s %15lu %15lu %20lu\n",
+				path ? path : "<unlinked>",
+				is_inode_flag_set(inode, FI_DONATE_FINISHED) ?
+				"Evicted" : "Donated",
+				fi->donate_start << (PAGE_SHIFT - 10),
+				(fi->donate_end + 1) << (PAGE_SHIFT - 10),
+				inode->i_mapping->nrpages << (PAGE_SHIFT - 10));
+next:
+		inode_unlock(inode);
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
