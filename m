Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F32D7B2CDE1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Aug 2025 22:31:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9HUOpge0jDQalHDhNpjGyqRrYfPvBj7bnySDg3MIpA=; b=kJWkvXVnYyGngXlVHyCMeLQJri
	k73CqfKFekkQUieQXEqBSHoJehRt8aZiABMoZsgiojbE7gfTD9m18Gn6DkF2R1Dn8jY3LePfHfNIj
	7bgdNtXiQb6s5bme62E2E2hDaFW8Q47Noib8gv6a8weu1cUc2JdZ2t4sovc8leJVYGCw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoSyw-0003Ri-53;
	Tue, 19 Aug 2025 20:30:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uoSyt-0003RX-W7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Aug 2025 20:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GSv05L8Lw44JXaTEeqyEEHhy4wS3K6Dr9KlYz/jEtoM=; b=OhrSWdmQArVRJsetkWOlOdpow3
 TtmSaZgWM4IFQWTBHaZVDIKTYgFHcwdJMwrknJ/OX2yWWjoLSZljRXjAExNmxkWLzOs5u5488/Ne2
 9rJhK0prLeZbTVWiL1aktVOJL8OdOiUhdVI4jrxHoeEl0Ig/r/+fBXgAdMHgszopXRK8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GSv05L8Lw44JXaTEeqyEEHhy4wS3K6Dr9KlYz/jEtoM=; b=eRMU/QAvz35OqbND5R0aXLP3aa
 14zyEtlDpfz6bYct3XXuE1wLnQQq/ld4hfV54Xlw/Sd0ps2GiSql36AyrxL66f2hAuRT9Ldmu5G15
 xRwvelCE6XIdpe7hmosSWIgzwyXLRyhvFZwdJjSlvrMzIGL0/Gj8tVSAyg1U2YokUqAE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uoSyt-0003zC-E0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Aug 2025 20:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B9740613EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Aug 2025 20:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58525C4CEF1;
 Tue, 19 Aug 2025 20:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755635449;
 bh=h1YbTQt6HVs1TaYX60E9hKi0mAlx5C9IOGf1jGLtX/0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=ipH53ll4bEMEQKfg77op231qTnwVvsfuMiAuah0lWFe9zVrJihsOxx+rgkBX0lgiV
 7vJ/zXzeaRVmbNo7LfI10tykZ6lHgYIUICVxffkUZS6N1Vs1nE9nwaQ8HzoXD0YIZT
 iBeJjl8juCO/knIsui7x5JFPigIbPDecHbeWtXwwc4DnmVPUxB8TtmMWb+st4Th1wy
 +Nu3AadxbXX7os0evHLxC8PTHexlfq1qMpn7j7XSBu0qqCKpqleQQghC/aCTCXrZ6p
 uqzuAMFh/1uttZK1hF0f8tRABcm04yaI0TA7ZYNd/Mpqed9ChBRek08/tR7vZTimwj
 c6IjUtxzYFqjQ==
Date: Tue, 19 Aug 2025 20:30:47 +0000
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <aKTe9xi8rv1VUSIj@google.com>
References: <20250812235814.960924-1-jaegeuk@kernel.org>
 <aJy8KS3fLQ452d2r@google.com> <aJ9eTaqNwkQZtA8E@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aJ9eTaqNwkQZtA8E@google.com>
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
X-Headers-End: 1uoSyt-0003zC-E0
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: show the list of donation files
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

 # of files  : 2
 File path                                              Status Donation offset (kb)   Donation size (kb)  File cached size (kb)
---
 /local/test2                                          Donated                    0              1048576                2097152
 /local/test                                           Evicted                    0              1048576                1048576

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 v4:
  - change the entry names clearly

 fs/f2fs/sysfs.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 1ffaf9e74ce9..86ebe97c256d 100644
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
+	seq_printf(seq, " %-50s %10s %20s %20s %22s\n",
+			"File path", "Status", "Donation offset (kb)",
+			"Donation size (kb)", "File cached size (kb)");
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
+		seq_printf(seq, " %-50s %10s %20llu %20llu %22llu\n",
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
2.51.0.rc2.233.g662b1ed5c5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
