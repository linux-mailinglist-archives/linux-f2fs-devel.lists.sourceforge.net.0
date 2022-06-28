Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9767C55BDD0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Jun 2022 05:25:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o61qk-0004hl-SH; Tue, 28 Jun 2022 03:25:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <duguoweisz@gmail.com>) id 1o61qj-0004hb-KT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jun 2022 03:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7W3a+cqhlUrLN7zR1YRe1TDmkGT0ULnVmRWaUqT5Xdk=; b=MUYP8feUOY9XWBoQCl5hzkN8Yd
 uZuiNGMjFyCnvymeBoLDOzzO12UXCunXOKJIwUKXTTMAASj0ya0NBBnDtggCo0SoVcL45Z1+8GeOu
 dUSBtzC605wxaE5No+oEjAHGHIlZhpfZOLdAFFk8TXFBlb1F41PC+irkMBi+dmBBSmS8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7W3a+cqhlUrLN7zR1YRe1TDmkGT0ULnVmRWaUqT5Xdk=; b=J
 fVVaNSP1c7PVGtp3DPsD3R13fLzXCLqkZmdsXRv0sQCCZbw5YjTgcnydMtIXRMByOHEOWkmNT1p+f
 Y0fgdwBnD47jieH8AZl41Z7JDlWjr70xYVs/vgZDjIxQSKc+w9MLx93hrCk9gZz44rAJjtYBmvd4j
 rHsYYlX+2zFXq7Ok=;
Received: from mail-pj1-f47.google.com ([209.85.216.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o61qd-000238-9p
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jun 2022 03:25:09 +0000
Received: by mail-pj1-f47.google.com with SMTP id l2so10094056pjf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Jun 2022 20:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7W3a+cqhlUrLN7zR1YRe1TDmkGT0ULnVmRWaUqT5Xdk=;
 b=MDx4EiSYBdUwIxoB/hlLPrm4mNMGmsHVb9dDktqxmCXkIyXgwK8kNofkn65dJzqUmy
 E/UlHGfA3AEOP86jvJww7+IXC1wOIYLJUmI3SEepL42rv3Tq71+gHZ6ngvq+MpNFHByq
 AHRRWvVZ4pIGxPtdRlvlF/F4xFj36+jGkqTTmjM1DTn7UcuVXbYCPikO09BcGPG6OOtY
 yZM1cdGxbUrl4zrcumNrQOeo2cbGsDTcVTm3CJLvhvvdXDHN09E1PHFUBzIF0JkfAVVA
 mCmu1EjVxgQeGBVOWJtk1papjASVdBSGajsO5JbGLhefm6OevtFYPI9ltqI6qnLI1ldN
 lBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7W3a+cqhlUrLN7zR1YRe1TDmkGT0ULnVmRWaUqT5Xdk=;
 b=t7hGpsUsHBh6oShWUYR3An2+EHcpap3bBnYMk7Mc++0bxKpmUzhLM5bbO1PJoPb8S9
 g5FkH5epyypF9hXdKvkGmRGR39YZCGNVvN0JnhKVnGZhWROUd2/NNlpvT70tX4dQWiEJ
 auFBoIcj5P59Bk3L5GQcJFNicO6gZgY37eXz2T6/76dXiC//U/R+LBGuKAedhJcFFobX
 /xmCJRaDLHsurX9C4WEBD5FsMIv8qJDwqzuYiByKm2xCsCUFFXTrmGLLAl75eJu8WTbo
 MBool1FJWt2PnKFIy2RzDHTm7K46410SE7sazubsPcyOTND38VerTliUKc5539+IgX4J
 V4EQ==
X-Gm-Message-State: AJIora+mRRSQjINe/q/m39RKEpeQzm+qV7yjvHu96ubM060hVvUAHlp7
 zkTNapJ6rGCFevJEVgibjvtIpRjSOiPUXuOf
X-Google-Smtp-Source: AGRyM1uQ/H9qsCCDP+yUzGLgtYeMv+LUmj9hXXnBemNlRLt2JRPj5LozT1h/YwsicW4Mre4sp2Bonw==
X-Received: by 2002:a17:903:1ca:b0:16a:5d7f:182f with SMTP id
 e10-20020a17090301ca00b0016a5d7f182fmr2670279plh.88.1656386701676; 
 Mon, 27 Jun 2022 20:25:01 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.232])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b0016b82ff7072sm2174559plm.138.2022.06.27.20.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 20:25:01 -0700 (PDT)
From: Guowei Du <duguoweisz@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 28 Jun 2022 11:24:50 +0800
Message-Id: <20220628032450.5869-1-duguoweisz@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: duguowei No functional change. - one is just using a
 variable for f2fs_available_free_memory - another adds 'inline' modifier
 for the function call 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.47 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [duguoweisz[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1o61qd-000238-9p
Subject: [f2fs-dev] [PATCH 4/4] f2fs: make some changes for memory using
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
Cc: linux-kernel@vger.kernel.org, duguowei <duguowei@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: duguowei <duguowei@xiaomi.com>

No functional change.

- one is just using a variable for f2fs_available_free_memory
- another adds 'inline' modifier for the function call

Signed-off-by: duguowei <duguowei@xiaomi.com>
---
 fs/f2fs/node.c     | 18 ++++++++++--------
 fs/f2fs/shrinker.c |  6 +++---
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 836c79a20afc..2924c8ce13bb 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -46,7 +46,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 	struct sysinfo val;
-	unsigned long avail_ram;
+	unsigned long avail_ram, ram_thresh;
 	unsigned long mem_size = 0;
 	bool res = false;
 
@@ -57,25 +57,27 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 
 	/* only uses low memory */
 	avail_ram = val.totalram - val.totalhigh;
+	ram_thresh = avail_ram * nm_i->ram_thresh / 100;
 
 	/*
-	 * give 25%, 25%, 50%, 50%, 50% memory for each components respectively
+	 * give 25%, 25%, 50%, 50%, 50%, 100% of memory threshold
+	 * for each components respectively
 	 */
 	if (type == FREE_NIDS) {
 		mem_size = (nm_i->nid_cnt[FREE_NID] *
 				sizeof(struct free_nid)) >> PAGE_SHIFT;
-		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 2);
+		res = mem_size < (ram_thresh >> 2);
 	} else if (type == NAT_ENTRIES) {
 		mem_size = (nm_i->nat_cnt[TOTAL_NAT] *
 				sizeof(struct nat_entry)) >> PAGE_SHIFT;
-		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 2);
+		res = mem_size < (ram_thresh >> 2);
 		if (excess_cached_nats(sbi))
 			res = false;
 	} else if (type == DIRTY_DENTS) {
 		if (sbi->sb->s_bdi->wb.dirty_exceeded)
 			return false;
 		mem_size = get_pages(sbi, F2FS_DIRTY_DENTS);
-		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
+		res = mem_size < (ram_thresh >> 1);
 	} else if (type == INO_ENTRIES) {
 		int i;
 
@@ -83,17 +85,17 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 			mem_size += sbi->im[i].ino_num *
 						sizeof(struct ino_entry);
 		mem_size >>= PAGE_SHIFT;
-		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
+		res = mem_size < (ram_thresh >> 1);
 	} else if (type == EXTENT_CACHE) {
 		mem_size = (atomic_read(&sbi->total_ext_tree) *
 				sizeof(struct extent_tree) +
 				atomic_read(&sbi->total_ext_node) *
 				sizeof(struct extent_node)) >> PAGE_SHIFT;
-		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
+		res = mem_size < (ram_thresh >> 1);
 	} else if (type == DISCARD_CACHE) {
 		mem_size = (atomic_read(&dcc->discard_cmd_cnt) *
 				sizeof(struct discard_cmd)) >> PAGE_SHIFT;
-		res = mem_size < (avail_ram * nm_i->ram_thresh / 100);
+		res = mem_size < ram_thresh;
 	} else if (type == COMPRESS_PAGE) {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		unsigned long free_ram = val.freeram;
diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index dd3c3c7a90ec..201207b78bda 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -16,19 +16,19 @@ static LIST_HEAD(f2fs_list);
 static DEFINE_SPINLOCK(f2fs_list_lock);
 static unsigned int shrinker_run_no;
 
-static unsigned long __count_nat_entries(struct f2fs_sb_info *sbi)
+static inline unsigned long __count_nat_entries(struct f2fs_sb_info *sbi)
 {
 	return NM_I(sbi)->nat_cnt[RECLAIMABLE_NAT];
 }
 
-static unsigned long __count_free_nids(struct f2fs_sb_info *sbi)
+static inline unsigned long __count_free_nids(struct f2fs_sb_info *sbi)
 {
 	long count = NM_I(sbi)->nid_cnt[FREE_NID] - MAX_FREE_NIDS;
 
 	return count > 0 ? count : 0;
 }
 
-static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi)
+static inline unsigned long __count_extent_cache(struct f2fs_sb_info *sbi)
 {
 	return atomic_read(&sbi->total_zombie_tree) +
 				atomic_read(&sbi->total_ext_node);
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
