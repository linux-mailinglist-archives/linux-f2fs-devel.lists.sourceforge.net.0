Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78E9A0426
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Oct 2024 10:24:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0zKg-0003k0-Tm;
	Wed, 16 Oct 2024 08:24:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t0zKf-0003jr-KN
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Oct 2024 08:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PW2/ey1ivIRzs2HnQJ3ejykHS993h00N2n5Zwi1kKpg=; b=fINxHqNBGSgO19IUZ6JYNyxWBr
 2C1BK4Ta1c0VNJOJ5QSPeOqYxkIbVT9YC38EVEINJn0ug6j1Z6yZDA7s0pMhh8o/edwuY5yXaVN7x
 jqwbH/zHSu0D8pP/wto4W+ZB7jWiTccrVGpg/r7Ezf77XPsIb7lqencLRGplj9PDVmhc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PW2/ey1ivIRzs2HnQJ3ejykHS993h00N2n5Zwi1kKpg=; b=c
 +DKjpXaAnNJNWugxORnSHZRGnEDN4dsxGVj7blaaQvFlT4sjptJLmSrhw4o0ljkk0bSEK932dz6l5
 rST1Jt9OwM5acTKbTSainjtJV48k6F2lXM2njhHTaNVe7iO3qh55JWPKSMOu9gbIzIcewovPd/Bcs
 WTdGrio0+o19HiKc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0zKe-0004qc-4l for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Oct 2024 08:24:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 68E5EA43A32
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 16 Oct 2024 08:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB620C4CEC5;
 Wed, 16 Oct 2024 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729067065;
 bh=dIvzv7sd2ar5087L2o+rqiYca11YTybBulCn0tAdkJs=;
 h=From:To:Cc:Subject:Date:From;
 b=MjsFNHMpAfiHtronLrckEagIn8Ut39up/JE8bzHTXsv1hhYjZDzqBWUWizVFGF6z0
 CkHJ+fKtmLV1WNMs38G8pRS7IHr2hzuGO86u7b4YlxvpsyMQfCpY/mYb9R0H0ASgcz
 i8gg690SRrfGlspZU27AnPpDmGeOGtnAP/+J76KRk0UOVtutgr+fkc0bPH0bKg6nj/
 Fg4KyYmgI9+1HjBJXFKMFP9BYG/mwH/TZXvWo2YbzEgJFhK8/n6foBmyUtBQPDNA3+
 2gHDd3c08Ajo1Hv7zd3CxxZxzRjWVcS52TGEaYBsDtz7OoL3Bt0POPUM7TltbCqvtu
 MnpzfvuX/zZNA==
To: jaegeuk@kernel.org
Date: Wed, 16 Oct 2024 16:24:20 +0800
Message-Id: <20241016082420.610844-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch adds per-device stats in debugfs, the examples
 are as below: mkfs.f2fs -f -c /dev/vdc /dev/vdb mount /dev/vdb /mnt/f2fs/
 cat /sys/kernel/debug/f2fs/status Multidevice stats: [seg: inuse dirty full
 free prefree] #0 5 0 0 4007 0 #1 1 0 0 8191 0 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t0zKe-0004qc-4l
Subject: [f2fs-dev] [PATCH] f2fs: multidevice: add stats in debugfs
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds per-device stats in debugfs, the examples
are as below:

mkfs.f2fs -f -c /dev/vdc /dev/vdb
mount /dev/vdb /mnt/f2fs/
cat /sys/kernel/debug/f2fs/status

Multidevice stats:
  [seg:      inuse    dirty     full     free  prefree]
  #0             5        0        0     4007        0
  #1             1        0        0     8191        0

mkfs.f2fs -f -s 2 -c /dev/vdc /dev/vdb
mount /dev/vdb /mnt/f2fs
cat /sys/kernel/debug/f2fs/status

Multidevice stats:
  [seg:      inuse    dirty     full     free  prefree] [sec:      inuse    dirty     full     free  prefree]
  #0             5        0        0     4005        0                 5        0        0     2000        0
  #1             1        0        0     8191        0                 1        0        0     4095        0

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/debug.c | 107 ++++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h  |  14 +++++++
 2 files changed, 121 insertions(+)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 546b8ba91261..278c8855ac0a 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -60,6 +60,70 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi)
 }
 
 #ifdef CONFIG_DEBUG_FS
+static void update_multidevice_stats(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_stat_info *si = F2FS_STAT(sbi);
+	struct f2fs_dev_stats *dev_stats = si->dev_stats;
+	int i, j;
+
+	if (!f2fs_is_multi_device(sbi))
+		return;
+
+	memset(dev_stats, 0, sizeof(struct f2fs_dev_stats) * sbi->s_ndevs);
+	for (i = 0; i < sbi->s_ndevs; i++) {
+		unsigned int start_segno, end_segno;
+		block_t start_blk, end_blk;
+
+		if (i == 0) {
+			start_blk = MAIN_BLKADDR(sbi);
+			end_blk = FDEV(i).end_blk + 1 - SEG0_BLKADDR(sbi);
+		} else {
+			start_blk = FDEV(i).start_blk;
+			end_blk = FDEV(i).end_blk + 1;
+		}
+
+		start_segno = GET_SEGNO(sbi, start_blk);
+		end_segno = GET_SEGNO(sbi, end_blk);
+
+		for (j = start_segno; j < end_segno; j++) {
+			unsigned int seg_blks, sec_blks;
+
+			seg_blks = get_seg_entry(sbi, j)->valid_blocks;
+
+			/* update segment stats */
+			if (IS_CURSEG(sbi, j))
+				dev_stats[i].devstats[0][DEVSTAT_INUSE]++;
+			else if (seg_blks == BLKS_PER_SEG(sbi))
+				dev_stats[i].devstats[0][DEVSTAT_FULL]++;
+			else if (seg_blks != 0)
+				dev_stats[i].devstats[0][DEVSTAT_DIRTY]++;
+			else if (!test_bit(j, FREE_I(sbi)->free_segmap))
+				dev_stats[i].devstats[0][DEVSTAT_FREE]++;
+			else
+				dev_stats[i].devstats[0][DEVSTAT_PREFREE]++;
+
+			if (!__is_large_section(sbi) ||
+				(j % SEGS_PER_SEC(sbi)) != 0)
+				continue;
+
+			sec_blks = get_sec_entry(sbi, j)->valid_blocks;
+
+			/* update section stats */
+			if (IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, j)))
+				dev_stats[i].devstats[1][DEVSTAT_INUSE]++;
+			else if (sec_blks == BLKS_PER_SEC(sbi))
+				dev_stats[i].devstats[1][DEVSTAT_FULL]++;
+			else if (sec_blks != 0)
+				dev_stats[i].devstats[1][DEVSTAT_DIRTY]++;
+			else if (!test_bit(GET_SEC_FROM_SEG(sbi, j),
+					FREE_I(sbi)->free_secmap))
+				dev_stats[i].devstats[1][DEVSTAT_FREE]++;
+			else
+				dev_stats[i].devstats[1][DEVSTAT_PREFREE]++;
+		}
+	}
+}
+
 static void update_general_status(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_stat_info *si = F2FS_STAT(sbi);
@@ -214,6 +278,8 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 		si->valid_blks[type] += blks;
 	}
 
+	update_multidevice_stats(sbi);
+
 	for (i = 0; i < MAX_CALL_TYPE; i++)
 		si->cp_call_count[i] = atomic_read(&sbi->cp_call_count[i]);
 
@@ -498,6 +564,36 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->dirty_count);
 		seq_printf(s, "  - Prefree: %d\n  - Free: %d (%d)\n\n",
 			   si->prefree_count, si->free_segs, si->free_secs);
+		if (f2fs_is_multi_device(sbi)) {
+			seq_puts(s, "Multidevice stats:\n");
+			seq_printf(s, "  [seg:   %8s %8s %8s %8s %8s]",
+					"inuse", "dirty", "full", "free", "prefree");
+			if (__is_large_section(sbi))
+				seq_printf(s, " [sec:   %8s %8s %8s %8s %8s]\n",
+					"inuse", "dirty", "full", "free", "prefree");
+			else
+				seq_puts(s, "\n");
+
+			for (i = 0; i < sbi->s_ndevs; i++) {
+				seq_printf(s, "  #%-2d     %8u %8u %8u %8u %8u", i,
+					si->dev_stats[i].devstats[0][DEVSTAT_INUSE],
+					si->dev_stats[i].devstats[0][DEVSTAT_DIRTY],
+					si->dev_stats[i].devstats[0][DEVSTAT_FULL],
+					si->dev_stats[i].devstats[0][DEVSTAT_FREE],
+					si->dev_stats[i].devstats[0][DEVSTAT_PREFREE]);
+				if (!__is_large_section(sbi)) {
+					seq_puts(s, "\n");
+					continue;
+				}
+				seq_printf(s, "          %8u %8u %8u %8u %8u\n",
+					si->dev_stats[i].devstats[1][DEVSTAT_INUSE],
+					si->dev_stats[i].devstats[1][DEVSTAT_DIRTY],
+					si->dev_stats[i].devstats[1][DEVSTAT_FULL],
+					si->dev_stats[i].devstats[1][DEVSTAT_FREE],
+					si->dev_stats[i].devstats[1][DEVSTAT_PREFREE]);
+			}
+			seq_puts(s, "\n");
+		}
 		seq_printf(s, "CP calls: %d (BG: %d)\n",
 			   si->cp_call_count[TOTAL_CALL],
 			   si->cp_call_count[BACKGROUND]);
@@ -665,6 +761,7 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
 	struct f2fs_stat_info *si;
+	struct f2fs_dev_stats *dev_stats;
 	unsigned long flags;
 	int i;
 
@@ -672,6 +769,15 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 	if (!si)
 		return -ENOMEM;
 
+	dev_stats = f2fs_kzalloc(sbi, sizeof(struct f2fs_dev_stats) *
+						sbi->s_ndevs, GFP_KERNEL);
+	if (!dev_stats) {
+		kfree(si);
+		return -ENOMEM;
+	}
+
+	si->dev_stats = dev_stats;
+
 	si->all_area_segs = le32_to_cpu(raw_super->segment_count);
 	si->sit_area_segs = le32_to_cpu(raw_super->segment_count_sit);
 	si->nat_area_segs = le32_to_cpu(raw_super->segment_count_nat);
@@ -724,6 +830,7 @@ void f2fs_destroy_stats(struct f2fs_sb_info *sbi)
 	list_del(&si->stat_list);
 	raw_spin_unlock_irqrestore(&f2fs_stat_lock, flags);
 
+	kfree(si->dev_stats);
 	kfree(si);
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bda61d7ca8dd..56797f8e6659 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3942,6 +3942,19 @@ void f2fs_destroy_recovery_cache(void);
  * debug.c
  */
 #ifdef CONFIG_F2FS_STAT_FS
+enum {
+	DEVSTAT_INUSE,
+	DEVSTAT_DIRTY,
+	DEVSTAT_FULL,
+	DEVSTAT_FREE,
+	DEVSTAT_PREFREE,
+	DEVSTAT_MAX,
+};
+
+struct f2fs_dev_stats {
+	unsigned int devstats[2][DEVSTAT_MAX];		/* 0: segs, 1: secs */
+};
+
 struct f2fs_stat_info {
 	struct list_head stat_list;
 	struct f2fs_sb_info *sbi;
@@ -4005,6 +4018,7 @@ struct f2fs_stat_info {
 	unsigned int block_count[2];
 	unsigned int inplace_count;
 	unsigned long long base_mem, cache_mem, page_mem;
+	struct f2fs_dev_stats *dev_stats;
 };
 
 static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
