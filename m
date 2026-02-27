Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id scvTJPkJoWmJpwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 04:05:29 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEBB1B22D4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 04:05:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HxLEeOsUuj2afpxiHUypH1WnKs+gF+uTsxdht3VT59M=; b=jKs0Pyw1teRuMD2G7jwKP4HYB+
	pgwYXySN1WTpviYApRhA+EdIIhxqUCu8MLDe5pnx6aOrBiWfdUB61gPwahjjozq60f49KzfJdpKRT
	ectPhARS+6yMREH2y10A/AdvTN6fu8ngYw//bthBMx2yMS+VbthJpb6oEhC4p1PrxBWQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvoAK-0000U3-Vl;
	Fri, 27 Feb 2026 03:05:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1vvoA8-0000To-K7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 03:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jq18IXbAB97kgSWlEnqzxj9rB0v4G74hCUBEo9g6j2U=; b=LmxZiDkZxexUwhovZd5x0/8sJG
 Cta9l1ovoG+CY2RLdMQ4+q4TS++9O8ymvvigNq2HUp8Q1aXQyd0IFwtEry7xFcOK8oil2PZybV8KV
 XPKRaN0aOdLGFsKpDg/DnVZfZ2gKL/fKKVS48P7uZrMPUs9YQLkRbLFzaUkBbwjro+co=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Jq18IXbAB97kgSWlEnqzxj9rB0v4G74hCUBEo9g6j2U=; b=X
 9EAdO4ADukr0TUtjJUeU9b2K09gjS/RJEkO7UTOt9bVi7M6p7yqxRdh02+oMF9wKU/82KkeGTtq5d
 KaG2gs1pegWhq6otnB0TVQOKDcThbmZuHCuTNU7ePDhuTE671NLH6rKY32mSAxQJIWEpeB2DehxOA
 SDFHD1tPQ3kekrpM=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vvoA7-0001WA-Dx for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 03:05:08 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3590c295150so585174a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 26 Feb 2026 19:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772161502; x=1772766302; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jq18IXbAB97kgSWlEnqzxj9rB0v4G74hCUBEo9g6j2U=;
 b=iERRtlqfeNoNXv5oi2XOks71C8299TVeJUtzS+ckGnP2Cx73hTtfJ+bIFINirsoQvt
 aAxV/03j4pp+aJdA/IUECpemyGLo8jcLQ15Atx0QGKxpgfzYk3DUeCpf7TBBygxmGt5U
 PiVQuyZMElensM5vDIg68WfGDk+LBDqs1Whav4aXpEviUSqEgHFB8MWV5oemaa4kJeU/
 u27P0JUHZ/6pqDgb/m1Mc25lIAzuToOoN2FV8NfL7yud1M4jqh9Puhc9z040STQ39guS
 sVTN8MJeIW9rVW5eQVkndSSSkdJGPIebgQdFv7df6dQiIvHmKikTWoIF6Ax9Muof8CO6
 C8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772161502; x=1772766302;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jq18IXbAB97kgSWlEnqzxj9rB0v4G74hCUBEo9g6j2U=;
 b=wOxUnpqnaqLdc2MC21t2Q8fulXoRWHYLVIxSOCRkl6DEtMle+ib9P+IGBTaur+YV+5
 QdOoyPiw5TS15aT44hgCY4fsNodWuwtt+ZSSn/acpK50p9X9PKuEUZUJ5P2/ZrlbdZAV
 DTQFASyW4A1dxY8KghvL/1ecpthH+aZZhR0OOCVdaSH39qtFfRHbc+FPsfca2EA97shV
 HrbwSjPqmoiICU2HI7JILVaHCG+CnMtqNOJautIHUJV84ior9IT5IgB5zITEiITezeRR
 SaqgpUeDNBSOgxi4YKcOZVtOgPa+wEgG+m6OFwlEuXON6ubpNT36cTz7mtfYpEO40GG8
 rT4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+U/AAPDfl9XTLvxlubaMkLChOnyW+k8y8Ww/GHqMH8TAyS3qsO2Opyfb28jHHTpm9g/zpu/8X75Z16Ut6RVVB@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzZYGBlELP60jH1CTLx0pzSDPR1/vl4PQVnJeZVwih7dxzN2GJg
 1369VkE45RRG0UIeUoLIgR1PXhSkn4OI+bqkbA72qkRthgDrd8sXXTFs
X-Gm-Gg: ATEYQzzVtwgwHX/0Zb8p4EvUwYbE6LG6A0mTTKME/kmxgg4U3FG/fcaKsaWy0W1WJFQ
 qgVokPbFYcw+srfSPyRYdCI9LWg2K8+7HUFaagUMBrMHjp1X48gqRFmAKlqoVcE98Q5Nl2NGLWY
 eWiiMai46n/CD0ODvd8ezn8X4YU/jJPKZmsEZItRl+UA3ADjP7CxojsJ5LVJeiNlbupUSrO69xc
 MfLsbbyodxfuHdJOKGzYpJ/FgfjHExPdXYYBF3I3sW0hdsZW6B+w1P+4+DKelcBg8vi4YgiIvGo
 p7kEb2yRxq7b7T7ohNn6LvipFQ+nzb5AUI8hIFz+/gY2BxK++hvTKhJtMink5RV8wjQ3ztPvlWi
 KtiRshpXPVr5vzPOnjWjm7PYtnWPRvTYO9Jcq0v1OW48w8nM4mLRoDjWWG/wcp4Sw0/6WcnS5lx
 EFvLjACXecST4piqgkrloMz2kz3ZuiLw==
X-Received: by 2002:a17:90b:544b:b0:354:bd08:480c with SMTP id
 98e67ed59e1d1-35965d029fcmr1153382a91.30.1772161501650; 
 Thu, 26 Feb 2026 19:05:01 -0800 (PST)
Received: from mi.mioffice.cn ([43.224.245.243])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35912e1137csm2523491a91.0.2026.02.26.19.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 19:05:01 -0800 (PST)
From: liujinbao1 <jinbaoliu365@gmail.com>
To: jaegeuk@kernel.org
Date: Fri, 27 Feb 2026 11:02:54 +0800
Message-Id: <20260227030254.270068-1-jinbaoliu365@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: liujinbao1 Add the defrag_blocks sysfs node to track
 the amount of data blocks moved during filesystem defragmentation.
 Signed-off-by: Sheng Yong Signed-off-by: liujinbao1 ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 6 ++++++ fs/f2fs/debug.c | 1 + fs/f2fs/f2fs.h | 5 +++++ fs/f2fs/file.c
 | 4 +++- fs/f2fs/sysfs.c | [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [jinbaoliu365(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [jinbaoliu365(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vvoA7-0001WA-Dx
Subject: [f2fs-dev] [PATCH] f2fs: Add defrag_blocks sysfs node
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
Cc: jinbaoliu365@gmail.com, Sheng Yong <shengyong1@xiaomi.com>,
 liujinbao1 <liujinbao1@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:jinbaoliu365@gmail.com,m:shengyong1@xiaomi.com,m:liujinbao1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: DCEBB1B22D4
X-Rspamd-Action: no action

From: liujinbao1 <liujinbao1@xiaomi.com>

Add the defrag_blocks sysfs node to track
the amount of data blocks moved during filesystem
defragmentation.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Signed-off-by: liujinbao1 <liujinbao1@xiaomi.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
 fs/f2fs/debug.c                         |  1 +
 fs/f2fs/f2fs.h                          |  5 +++++
 fs/f2fs/file.c                          |  4 +++-
 fs/f2fs/sysfs.c                         | 10 ++++++++++
 5 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index c1d2b3fd9c65..423ec40e2e4e 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -407,6 +407,12 @@ Contact:	"Hridya Valsaraju" <hridya@google.com>
 Description:	Average number of valid blocks.
 		Available when CONFIG_F2FS_STAT_FS=y.
 
+What:		/sys/fs/f2fs/<disk>/defrag_blocks
+Date:		February 2026
+Contact:	"Jinbao Liu" <liujinbao1@xiaomi.com>
+Description:	Number of blocks moved by defragment.
+		Available when CONFIG_F2FS_STAT_FS=y.
+
 What:		/sys/fs/f2fs/<disk>/mounted_time_sec
 Date:		February 2020
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 8e1040e375a7..af88db8fdb71 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -659,6 +659,7 @@ static int stat_show(struct seq_file *s, void *v)
 				si->bg_node_blks);
 		seq_printf(s, "BG skip : IO: %u, Other: %u\n",
 				si->io_skip_bggc, si->other_skip_bggc);
+		seq_printf(s, "defrag blocks : %u\n", si->defrag_blks);
 		seq_puts(s, "\nExtent Cache (Read):\n");
 		seq_printf(s, "  - Hit Count: L1-1:%llu L1-2:%llu L2:%llu\n",
 				si->hit_largest, si->hit_cached[EX_READ],
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bb34e864d0ef..dbf23cb2c501 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4288,6 +4288,7 @@ struct f2fs_stat_info {
 	int gc_secs[2][2];
 	int tot_blks, data_blks, node_blks;
 	int bg_data_blks, bg_node_blks;
+	unsigned int defrag_blks;
 	int blkoff[NR_CURSEG_TYPE];
 	int curseg[NR_CURSEG_TYPE];
 	int cursec[NR_CURSEG_TYPE];
@@ -4422,6 +4423,9 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 		si->bg_node_blks += ((gc_type) == BG_GC) ? (blks) : 0;	\
 	} while (0)
 
+#define stat_inc_defrag_blk_count(sbi, blks)				\
+	(F2FS_STAT(sbi)->defrag_blks += (blks))
+
 int f2fs_build_stats(struct f2fs_sb_info *sbi);
 void f2fs_destroy_stats(struct f2fs_sb_info *sbi);
 void __init f2fs_create_root_stats(void);
@@ -4463,6 +4467,7 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #define stat_inc_tot_blk_count(si, blks)		do { } while (0)
 #define stat_inc_data_blk_count(sbi, blks, gc_type)	do { } while (0)
 #define stat_inc_node_blk_count(sbi, blks, gc_type)	do { } while (0)
+#define stat_inc_defrag_blk_count(sbi, blks)		do { } while (0)
 
 static inline int f2fs_build_stats(struct f2fs_sb_info *sbi) { return 0; }
 static inline void f2fs_destroy_stats(struct f2fs_sb_info *sbi) { }
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c8a2f17a8f11..2c4880f24b54 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3043,8 +3043,10 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 	clear_inode_flag(inode, FI_OPU_WRITE);
 unlock_out:
 	inode_unlock(inode);
-	if (!err)
+	if (!err) {
 		range->len = (u64)total << PAGE_SHIFT;
+		stat_inc_defrag_blk_count(sbi, total);
+	}
 	return err;
 }
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 5fbfdc96e502..969e06b65b04 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -338,6 +338,14 @@ static ssize_t avg_vblocks_show(struct f2fs_attr *a,
 	f2fs_update_sit_info(sbi);
 	return sysfs_emit(buf, "%llu\n", (unsigned long long)(si->avg_vblocks));
 }
+
+static ssize_t defrag_blocks_show(struct f2fs_attr *a,
+				struct f2fs_sb_info *sbi, char *buf)
+{
+	struct f2fs_stat_info *si = F2FS_STAT(sbi);
+
+	return sysfs_emit(buf, "%llu\n", (unsigned long long)(si->defrag_blks));
+}
 #endif
 
 static ssize_t main_blkaddr_show(struct f2fs_attr *a,
@@ -1351,6 +1359,7 @@ F2FS_GENERAL_RO_ATTR(gc_mode);
 F2FS_GENERAL_RO_ATTR(moved_blocks_background);
 F2FS_GENERAL_RO_ATTR(moved_blocks_foreground);
 F2FS_GENERAL_RO_ATTR(avg_vblocks);
+F2FS_GENERAL_RO_ATTR(defrag_blocks);
 #endif
 
 #ifdef CONFIG_FS_ENCRYPTION
@@ -1473,6 +1482,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(moved_blocks_foreground),
 	ATTR_LIST(moved_blocks_background),
 	ATTR_LIST(avg_vblocks),
+	ATTR_LIST(defrag_blocks),
 #endif
 #ifdef CONFIG_BLK_DEV_ZONED
 	ATTR_LIST(unusable_blocks_per_sec),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
