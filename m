Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ED1578E00
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Jul 2022 01:03:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oDZlX-0002bC-GK; Mon, 18 Jul 2022 23:03:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1oDZlW-0002az-AA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Jul 2022 23:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YhbyvF2560CrN/uHVk5GP1DJRcLB2iUBdTbsGNA6XJo=; b=Iqnu/BqlcRx9/WaAdvy0/rJAvp
 PWb9b/oTsEDF2biFpCJA5m0Wbr8SJBG8wMXa6dP03qqQmAAcELZBOPPHbtAR9kCIClqoLuwkbACqE
 zdiStqXhZHgNihCeA/pkA0yKvsBmUHKfhssfRXnU54gwdJ72AgOJWoev2qOJQppiOXTA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YhbyvF2560CrN/uHVk5GP1DJRcLB2iUBdTbsGNA6XJo=; b=F
 ihSZPzjOvB2Zvu47gRsL2IuEdnxnwhMP1ZK17sRDqgNmicdxlQ84jfUyQXb0sDAvY5A4iZm2Z0WPJ
 ldg4zuG0SwXqrYHBYaM42fAAVUa4BN0EW0oRkFK/ueyCGNTZwGiZcXmrTw2VO8FJoPGM8ZonTdQC7
 4cfpPuiwA3WCleeU=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oDZlS-00082G-HF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Jul 2022 23:03:02 +0000
Received: by mail-pl1-f174.google.com with SMTP id w7so10380622ply.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 Jul 2022 16:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YhbyvF2560CrN/uHVk5GP1DJRcLB2iUBdTbsGNA6XJo=;
 b=nFbyzfdTuOTDQrLak2iGUJB1tB0HESUtwy27GUd80D7xmaZ+R+aE/fVCmPgaoEsgJK
 7LIiZpeQhUZAHXAP3urmDRhqbjj/pfhpM12X96QI8vSpOYqD8lm8JzIw9fO/9QVbruof
 NPdPJXN1fWWuJksmZoQRrgh/Yl0u7YSqC8cidxjhJuonTU6yN50/XU8DIfwFCJmkBURQ
 iVuahQ2eepVbY0qTzOUiSlZmOoZv7mRyRDwvqTidOvlrO9v0ewasLMOergTKU/FqBMfk
 slnunM8CWKzqcg7R1Xla45F00ZztGrqXfPOPQEj/Q9Ndm8ZI1xQg+kPz1IBDV6wooyea
 oNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YhbyvF2560CrN/uHVk5GP1DJRcLB2iUBdTbsGNA6XJo=;
 b=t7qSTnzD/LaU8j2LiUH0UC3XiDpeQvDFzuBbIjRPJ43hKhxhyI432fl+ffzgR7Ktsn
 aaxTPbuMUqYBWKw9PGMsOUTt5VJQOzMivae5l5PGUBpfO3OdwL8iqtIalsVNfyK7WAae
 25cHafiAqj0S4vMmpqQr4YsxyHw10qzMfMw7MGBLuU0tcfzZMQ1dEIbj11oQplP5iWh2
 fIRk4+2v5jQ9r262T2TZTFcGfz/GXcZzosHNHnM4th1e0Hvd+bLauhklNXhc46sk8Rdu
 JaCwOEVD8/GLSCVfBM/MjKLrZUXTU3zdvnjktsJEngHZ63PzFb6u/2FAFD2VP4/K0QWq
 Yegg==
X-Gm-Message-State: AJIora9XC4/zQFzDk9NK92BVKCkmNVrGkibrehUbH45UEvIm7pkJIsYT
 AWv0cYxcdySkYQsjYyXEEic=
X-Google-Smtp-Source: AGRyM1v1la4KV7gGQYSHFEtqr12Po850VE+8GhhiZ60oO0virr++MzdE4J6KAWXcMgXfdjp23nv/8g==
X-Received: by 2002:a17:90a:590e:b0:1f1:afeb:996 with SMTP id
 k14-20020a17090a590e00b001f1afeb0996mr12474099pji.205.1658185372678; 
 Mon, 18 Jul 2022 16:02:52 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:d2fc:81d3:e812:8c86])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a170903110400b0016ce31d1d97sm5011590plh.114.2022.07.18.16.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 16:02:52 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 18 Jul 2022 16:02:48 -0700
Message-Id: <20220718230248.3791635-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong introduce the below 4 new sysfs node for
 atomic write statistics. - current_atomic_write: the total current atomic
 write block count, which is not committed yet. - peak_atomic_write: the peak
 value of [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.174 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oDZlS-00082G-HF
Subject: [f2fs-dev] [PATCH] f2fs: introduce sysfs atomic write statistics
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

introduce the below 4 new sysfs node for atomic write statistics.
- current_atomic_write: the total current atomic write block count,
                        which is not committed yet.
- peak_atomic_write: the peak value of total current atomic write block
                     count after boot.
- committed_atomic_block: the accumulated total committed atomic write
                          block count after boot.
- revoked_atomic_block: the accumulated total revoked atomic write block
                        count after boot.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 25 ++++++++++++++
 fs/f2fs/data.c                          |  7 ++--
 fs/f2fs/f2fs.h                          | 30 ++++++++++++++++
 fs/f2fs/file.c                          |  1 +
 fs/f2fs/segment.c                       |  6 ++++
 fs/f2fs/super.c                         |  1 +
 fs/f2fs/sysfs.c                         | 46 +++++++++++++++++++++++++
 7 files changed, 113 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 22c1efd49773..ed43d589354d 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -586,3 +586,28 @@ Date:		June 2022
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
 Description:	Shows the number of unusable blocks in a section which was defined by
 		the zone capacity reported by underlying zoned device.
+
+What:		/sys/fs/f2fs/<disk>/current_atomic_write
+Date:		July 2022
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Show the total current atomic write block count, which is not committed yet.
+		This is a read-only entry.
+
+What:		/sys/fs/f2fs/<disk>/peak_atomic_write
+Date:		July 2022
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Show the peak value of total current atomic write block count after boot.
+		If you write "0" here, you can initialize to "0".
+
+What:		/sys/fs/f2fs/<disk>/committed_atomic_block
+Date:		July 2022
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Show the accumulated total committed atomic write block count after boot.
+		If you write "0" here, you can initialize to "0".
+
+What:		/sys/fs/f2fs/<disk>/revoked_atomic_block
+Date:		July 2022
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Show the accumulated total revoked atomic write block count after boot.
+		If you write "0" here, you can initialize to "0".
+
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c448c3ee7ac3..42eb694685cc 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3423,12 +3423,11 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
 	pgoff_t index = page->index;
 	int err = 0;
-	block_t ori_blk_addr;
+	block_t ori_blk_addr = NULL_ADDR;
 
 	/* If pos is beyond the end of file, reserve a new block in COW inode */
 	if ((pos & PAGE_MASK) >= i_size_read(inode))
-		return __reserve_data_block(cow_inode, index, blk_addr,
-					node_changed);
+		goto reserve_block;
 
 	/* Look for the block in COW inode first */
 	err = __find_data_block(cow_inode, index, blk_addr);
@@ -3442,10 +3441,12 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 	if (err)
 		return err;
 
+reserve_block:
 	/* Finally, we should reserve a new block in COW inode for the update */
 	err = __reserve_data_block(cow_inode, index, blk_addr, node_changed);
 	if (err)
 		return err;
+	inc_atomic_write_cnt(inode);
 
 	if (ori_blk_addr != NULL_ADDR)
 		*blk_addr = ori_blk_addr;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1d97d06e0d87..8e0f9e867e86 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -813,6 +813,8 @@ struct f2fs_inode_info {
 	unsigned char i_compress_level;		/* compress level (lz4hc,zstd) */
 	unsigned short i_compress_flag;		/* compress flag */
 	unsigned int i_cluster_size;		/* cluster size */
+
+	unsigned int atomic_write_cnt;
 };
 
 static inline void get_extent_info(struct extent_info *ext,
@@ -1813,6 +1815,12 @@ struct f2fs_sb_info {
 	int max_fragment_chunk;			/* max chunk size for block fragmentation mode */
 	int max_fragment_hole;			/* max hole size for block fragmentation mode */
 
+	/* For atomic write statistics */
+	atomic64_t current_atomic_write;
+	s64 peak_atomic_write;
+	u64 committed_atomic_block;
+	u64 revoked_atomic_block;
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
@@ -2427,6 +2435,28 @@ static inline void inode_dec_dirty_pages(struct inode *inode)
 		dec_page_count(F2FS_I_SB(inode), F2FS_DIRTY_QDATA);
 }
 
+static inline void inc_atomic_write_cnt(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	u64 current_write;
+
+	fi->atomic_write_cnt++;
+	atomic64_inc(&sbi->current_atomic_write);
+	current_write = atomic64_read(&sbi->current_atomic_write);
+	if (current_write > sbi->peak_atomic_write)
+		sbi->peak_atomic_write = current_write;
+}
+
+static inline void release_atomic_write_cnt(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+
+	atomic64_sub(fi->atomic_write_cnt, &sbi->current_atomic_write);
+	fi->atomic_write_cnt = 0;
+}
+
 static inline s64 get_pages(struct f2fs_sb_info *sbi, int count_type)
 {
 	return atomic_read(&sbi->nr_pages[count_type]);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 0f29af7876a6..49a62d134884 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2075,6 +2075,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 	f2fs_update_time(sbi, REQ_TIME);
 	fi->atomic_write_task = current;
 	stat_update_max_atomic_write(inode);
+	fi->atomic_write_cnt = 0;
 out:
 	inode_unlock(inode);
 	mnt_drop_write_file(filp);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ce571c0d7126..17cb518f88b3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -196,6 +196,7 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 		clear_inode_flag(fi->cow_inode, FI_ATOMIC_FILE);
 		iput(fi->cow_inode);
 		fi->cow_inode = NULL;
+		release_atomic_write_cnt(inode);
 		clear_inode_flag(inode, FI_ATOMIC_FILE);
 
 		spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
@@ -335,6 +336,11 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 	}
 
 out:
+	if (ret)
+		sbi->revoked_atomic_block += fi->atomic_write_cnt;
+	else
+		sbi->committed_atomic_block += fi->atomic_write_cnt;
+
 	__complete_revoke_list(inode, &revoke_list, ret ? true : false);
 
 	return ret;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index faf9a767d05a..1c6203798fb4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3615,6 +3615,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
 	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
 	spin_lock_init(&sbi->gc_urgent_high_lock);
+	atomic64_set(&sbi->current_atomic_write, 0);
 
 	sbi->dir_level = DEF_DIR_LEVEL;
 	sbi->interval_time[CP_TIME] = DEF_CP_INTERVAL;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 6eeefe60a7af..eba5fb1629d7 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -339,6 +339,21 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 			sbi->gc_reclaimed_segs[sbi->gc_segment_mode]);
 	}
 
+	if (!strcmp(a->attr.name, "current_atomic_write")) {
+		s64 current_write = atomic64_read(&sbi->current_atomic_write);
+
+		return sysfs_emit(buf, "%lld\n", current_write);
+	}
+
+	if (!strcmp(a->attr.name, "peak_atomic_write"))
+		return sysfs_emit(buf, "%lld\n", sbi->peak_atomic_write);
+
+	if (!strcmp(a->attr.name, "committed_atomic_block"))
+		return sysfs_emit(buf, "%llu\n", sbi->committed_atomic_block);
+
+	if (!strcmp(a->attr.name, "revoked_atomic_block"))
+		return sysfs_emit(buf, "%llu\n", sbi->revoked_atomic_block);
+
 	ui = (unsigned int *)(ptr + a->offset);
 
 	return sprintf(buf, "%u\n", *ui);
@@ -608,6 +623,27 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "peak_atomic_write")) {
+		if (t != 0)
+			return -EINVAL;
+		sbi->peak_atomic_write = 0;
+		return count;
+	}
+
+	if (!strcmp(a->attr.name, "committed_atomic_block")) {
+		if (t != 0)
+			return -EINVAL;
+		sbi->committed_atomic_block = 0;
+		return count;
+	}
+
+	if (!strcmp(a->attr.name, "revoked_atomic_block")) {
+		if (t != 0)
+			return -EINVAL;
+		sbi->revoked_atomic_block = 0;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -855,6 +891,12 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_reclaimed_segments, gc_reclaimed_segs);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_fragment_chunk, max_fragment_chunk);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_fragment_hole, max_fragment_hole);
 
+/* For atomic write */
+F2FS_RO_ATTR(F2FS_SBI, f2fs_sb_info, current_atomic_write, current_atomic_write);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, peak_atomic_write, peak_atomic_write);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, committed_atomic_block, committed_atomic_block);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, revoked_atomic_block, revoked_atomic_block);
+
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_urgent_sleep_time),
@@ -944,6 +986,10 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_reclaimed_segments),
 	ATTR_LIST(max_fragment_chunk),
 	ATTR_LIST(max_fragment_hole),
+	ATTR_LIST(current_atomic_write),
+	ATTR_LIST(peak_atomic_write),
+	ATTR_LIST(committed_atomic_block),
+	ATTR_LIST(revoked_atomic_block),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.37.0.170.g444d1eabd0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
