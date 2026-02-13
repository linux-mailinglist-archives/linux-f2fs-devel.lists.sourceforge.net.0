Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AINLHer4jmnbGAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Feb 2026 11:11:54 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CA6134ED8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Feb 2026 11:11:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xu/st5bHCv13Zu0tNu4FV3ciVqECXKxdQPayIbQ0U34=; b=mh/9PF8K43wfg+cpZ2CBRINDOB
	0kRwY90XuVNpJRwLbqK+9VIhQCQEA0Cbwx0/Zmkd5WnHZidBxWqnR/aS+DqIT6JIZWXpEfR8pRpoh
	itakS2AsVakU3MuQbpTNC3orQtHjuFbSWhDTg2GCoV7YTkixSH1rNl7YxXEueEr1zfQM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vqq9F-0003Qh-KK;
	Fri, 13 Feb 2026 10:11:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1vqq8z-0003QP-Iv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Feb 2026 10:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gKNTFe8H265of62YNJDNS9isKGx9ghFWnCa5ZUmkIvk=; b=C8xdMyzTVz9iLccYzOGRPJkjEA
 FAfkxWckcDTFZKYzQeJ8GJ3mdhgxiTmCiwbVExpu0oYpB51LsWPfvSKYMKUcIXGBZF49VJN9OSemi
 byl1aK+y3IqBmsBLt1mxCXeKabxfiXO+izWPSSdKIeOGeM2NWsDMKoEk3YO/57HAnpCo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gKNTFe8H265of62YNJDNS9isKGx9ghFWnCa5ZUmkIvk=; b=a
 1XJDR2vPB0bItTwToZXyG/lnP/hk0C4LXQqFFxqcf46JD/egkGx8nPuVG8C9TwHohO2kdXff/RJGd
 ZlOWutZxUcj+SJN+gQgohw9HZZsJzdnqJkhysbYyCWOmLUXaWbxBDlMMCAD3mNMrbvpz4F+LNqMgt
 KI9Y+OSnQP4yUaZI=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vqq8y-0003co-UM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Feb 2026 10:11:25 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-824a3509a12so486509b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Feb 2026 02:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770977473; x=1771582273; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gKNTFe8H265of62YNJDNS9isKGx9ghFWnCa5ZUmkIvk=;
 b=nK9KDyByqbTYWbcgEiuej8DwuuRZWSAO/fMpayx2gpY/kUch/nMb93SO+8mB8LE4Xn
 A2V6W2iFPitJ4KLw0zJ/9C4/PGOS4jPlw5X301kDf850/LiFAp6RkpO4E8XtYxmTDr3z
 sXpxkssjB9Sc2xq9jyjr5k3uaZD9Xymt/QFOyipFluawl9wSINRLzQuW3jxGKjpiUpiP
 w+3OPIFL0qyjhFQazPNnZoKBzEcidnViTYkhuwksQtCk7hTPp12H9wOyDe+wIHVCOhpX
 OODZ+iL5yk8/MUJiHgtlqrHEoysMN8ev8FU2vd3feIM5nv2e2CU7u1bUw+T9wTXSscn+
 XYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770977473; x=1771582273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gKNTFe8H265of62YNJDNS9isKGx9ghFWnCa5ZUmkIvk=;
 b=fLWataitutWrVh2yTMC65b7fOCetw511af6/6PedEBtPdnrCBxmJosm5Pd/aqzC3ER
 qJHWrTUQFiLErjY1NOH17zu6QTnAkDWCdetU9YylRrkxtNkwKFl4YtszFCPwX5H3XlNs
 gHAkXWS+DdDOfD4tPLRcu6EpfnV7SbJFyN5r3OCoStQK3vSwSlHJ6eMBn/JpdEHT3iwY
 4LhyhcinXP+NqHZaAEFBBgqfLLDI2n0ne7HZDMoeoPiZxXa5mSK4ch+6L/vNnRMXGsGM
 yWqO3SaoSF2NyAoIsEDcEk175qHZLwYda9iqZnxsY0dI0mVF1aKit6vexiLerVDv+Idj
 Pzsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEM8RNP08VRL321xeiHlBDmZ/n+O3GyTgpM3g1r4RoGxevU5OLJSpUD98w3xBK0wZbph7W691d9huAx3Dcym/N@lists.sourceforge.net
X-Gm-Message-State: AOJu0YycT1hYXIUX+kMA0ml3hKQRXh/LxONR8Zhggda28RY5m7p5Lopx
 EN/JcBvw6dghpkckqyud4Ef82S/o3ThXvkAv9RD6Oj0X9adqw9ZX6w52
X-Gm-Gg: AZuq6aIf/FgKv/dSynmdsi9/TfCD6E0m9Mo2KKTsbfzH6lj2MJu5O6jk44cIve+zsfg
 EcN5a2L/TkyvtaPI00nT6BK4zwG0p7Pw1JEPpEHY4K2WV/+L0fqVlUFIlpY1umHmZlorLUqXouM
 xt7GPZg4ACggosV1eCyzH5+4xqpWzaqGZLGO4RtL+ak8ey2GrI6vTWxxzDl4UJZg5cqa2qZ5Mxi
 HwCYR65z81coZXKqJ6ZNSt9NOEa4B8Da98pierJNErfvNLki+XBsK9BEkb0T+x7X6TarZPJOQdi
 uL/IO9N/SyG77r2/yg0DkYIBqxDEwuIVgYuath6/AN5ROfYVthZ3dVL9MuOvwgw9sB77o3Fllp5
 9MHrtzPiC3oEWgQZBrCLUJ+noBgCVpsVeSI7eGH10QU0XIlAHFVi22nzVk9vWBHUfIxVUjdbk3N
 Lu8kX+NIWWer6iwxe1Sn6UM0r0hmnC+SD4C+NdHiA=
X-Received: by 2002:a05:6a21:7706:b0:38e:90ca:5a4a with SMTP id
 adf61e73a8af0-3946c6c41dfmr1328940637.1.1770977473304; 
 Fri, 13 Feb 2026 02:11:13 -0800 (PST)
Received: from mi.mioffice.cn ([2408:8607:1b00:8:8eec:4bff:fe94:a95d])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6e19815b19sm6832515a12.32.2026.02.13.02.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 02:11:12 -0800 (PST)
From: liujinbao1 <jinbaoliu365@gmail.com>
To: jaegeuk@kernel.org
Date: Fri, 13 Feb 2026 18:11:00 +0800
Message-Id: <20260213101100.276118-1-jinbaoliu365@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: liujinbao1 Add the undiscard_blks_bysize node to
 classify
 undiscard_blks into three categories: [0,15], [15,511], and 512+, and count
 the number of blocks in each category as undiscard_small_blks, undiscard_midd
 [...] Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [jinbaoliu365(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [jinbaoliu365(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.172 listed in wl.mailspike.net]
X-Headers-End: 1vqq8y-0003co-UM
Subject: [f2fs-dev] [PATCH] f2fs: Add undiscard_blks_bysize sysnode
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
Cc: Sheng Yong <shengyong1@xiaomi.com>, liujinbao1 <liujinbao1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:shengyong1@xiaomi.com,m:liujinbao1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: A3CA6134ED8
X-Rspamd-Action: no action

From: liujinbao1 <liujinbao1@xiaomi.com>

Add the undiscard_blks_bysize node to classify undiscard_blks
into three categories: [0,15], [15,511], and 512+, and count
the number of blocks in each category as undiscard_small_blks,
undiscard_middle_blks, and undiscard_large_blks, respectively,
in order to better understand the size distribution of undiscard_blks.
e.g. when the undiscard_blks value is 794,
the undiscard_blks_bysize node shows the number of undiscard_blks
in each range as: small: 424, middle: 370, large: 0.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Signed-off-by: liujinbao1 <liujinbao1@xiaomi.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  8 ++++++
 fs/f2fs/f2fs.h                          |  3 +++
 fs/f2fs/segment.c                       | 34 +++++++++++++++++++++++++
 fs/f2fs/sysfs.c                         | 13 ++++++++++
 4 files changed, 58 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 770470e0598b..23247030e27c 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -516,6 +516,14 @@ Date:		December 2023
 Contact:	"Zhiguo Niu" <zhiguo.niu@unisoc.com>
 Description:	Shows the total number of undiscard blocks.
 
+What:		/sys/fs/f2fs/<disk>/stat/undiscard_blks_bysize
+Date:		Feb 2026
+Contact:	"Jinbao Liu" <liujinbao1@xiaomi.com>
+Description:	Show undiscard block counts by size category.
+		Three block count ranges: small (0-15 blocks),
+		middle (16-511 blocks), large (512+ blocks).
+		Format: "small: %u, middle: %u, large: %u\n"
+
 What:		/sys/fs/f2fs/<disk>/ckpt_thread_ioprio
 Date:		January 2021
 Contact:	"Daeho Jeong" <daehojeong@google.com>
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a90a62cfe617..033666f2f368 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -501,6 +501,9 @@ struct discard_cmd_control {
 	unsigned int max_ordered_discard;	/* maximum discard granularity issued by lba order */
 	unsigned int discard_io_aware;		/* io_aware policy */
 	unsigned int undiscard_blks;		/* # of undiscard blocks */
+	unsigned int undiscard_small_blks;	/* # of undiscard blocks range in [0, 15] */
+	unsigned int undiscard_middle_blks;	/* # of undiscard blocks range in [16, 511]*/
+	unsigned int undiscard_large_blks;	/* # of undiscard blocks range > 511*/
 	unsigned int next_pos;			/* next discard position */
 	atomic_t issued_discard;		/* # of issued discard */
 	atomic_t queued_discard;		/* # of queued discard */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c26424f47686..c354a0f49802 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -962,6 +962,26 @@ static unsigned int get_free_segment(struct f2fs_sb_info *sbi)
 	return NULL_SEGNO;
 }
 
+static void __stat_undiscard_blks(struct discard_cmd_control *dcc,
+				block_t len, bool inc)
+{
+	if (inc) {
+		if (len < DEFAULT_DISCARD_GRANULARITY)
+			dcc->undiscard_small_blks += len;
+		else if (len < MAX_PLIST_NUM)
+			dcc->undiscard_middle_blks += len;
+		else
+			dcc->undiscard_large_blks += len;
+	} else {
+		if (len < DEFAULT_DISCARD_GRANULARITY)
+			dcc->undiscard_small_blks -= len;
+		else if (len < MAX_PLIST_NUM)
+			dcc->undiscard_middle_blks -= len;
+		else
+			dcc->undiscard_large_blks -= len;
+	}
+}
+
 static struct discard_cmd *__create_discard_cmd(struct f2fs_sb_info *sbi,
 		struct block_device *bdev, block_t lstart,
 		block_t start, block_t len)
@@ -990,6 +1010,7 @@ static struct discard_cmd *__create_discard_cmd(struct f2fs_sb_info *sbi,
 	dc->bio_ref = 0;
 	atomic_inc(&dcc->discard_cmd_cnt);
 	dcc->undiscard_blks += len;
+	__stat_undiscard_blks(dcc, len, true);
 
 	return dc;
 }
@@ -1108,6 +1129,7 @@ static void __detach_discard_cmd(struct discard_cmd_control *dcc,
 	list_del(&dc->list);
 	rb_erase_cached(&dc->rb_node, &dcc->root);
 	dcc->undiscard_blks -= dc->di.len;
+	__stat_undiscard_blks(dcc, dc->di.len, false);
 
 	kmem_cache_free(discard_cmd_slab, dc);
 
@@ -1393,6 +1415,8 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 	}
 
 	if (!err && len) {
+		__stat_undiscard_blks(dcc, (dc->di.len + len), false);
+		__stat_undiscard_blks(dcc, dc->di.len, true);
 		dcc->undiscard_blks -= len;
 		__update_discard_tree_range(sbi, bdev, lstart, start, len);
 	}
@@ -1450,10 +1474,12 @@ static void __punch_discard_cmd(struct f2fs_sb_info *sbi,
 	}
 
 	dcc->undiscard_blks -= di.len;
+	__stat_undiscard_blks(dcc, di.len, false);
 
 	if (blkaddr > di.lstart) {
 		dc->di.len = blkaddr - dc->di.lstart;
 		dcc->undiscard_blks += dc->di.len;
+		__stat_undiscard_blks(dcc, dc->di.len, true);
 		__relocate_discard_cmd(dcc, dc);
 		modified = true;
 	}
@@ -1468,6 +1494,7 @@ static void __punch_discard_cmd(struct f2fs_sb_info *sbi,
 			dc->di.len--;
 			dc->di.start++;
 			dcc->undiscard_blks += dc->di.len;
+			__stat_undiscard_blks(dcc, dc->di.len, true);
 			__relocate_discard_cmd(dcc, dc);
 		}
 	}
@@ -1524,8 +1551,10 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 			prev_dc->bdev == bdev &&
 			__is_discard_back_mergeable(&di, &prev_dc->di,
 							max_discard_blocks)) {
+			__stat_undiscard_blks(dcc, prev_dc->di.len, false);
 			prev_dc->di.len += di.len;
 			dcc->undiscard_blks += di.len;
+			__stat_undiscard_blks(dcc, prev_dc->di.len, true);
 			__relocate_discard_cmd(dcc, prev_dc);
 			di = prev_dc->di;
 			tdc = prev_dc;
@@ -1536,10 +1565,12 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 			next_dc->bdev == bdev &&
 			__is_discard_front_mergeable(&di, &next_dc->di,
 							max_discard_blocks)) {
+			__stat_undiscard_blks(dcc, next_dc->di.len, false);
 			next_dc->di.lstart = di.lstart;
 			next_dc->di.len += di.len;
 			next_dc->di.start = di.start;
 			dcc->undiscard_blks += di.len;
+			__stat_undiscard_blks(dcc, next_dc->di.len, true);
 			__relocate_discard_cmd(dcc, next_dc);
 			if (tdc)
 				__remove_discard_cmd(sbi, tdc);
@@ -2349,6 +2380,9 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	dcc->max_discard_issue_time = DEF_MAX_DISCARD_ISSUE_TIME;
 	dcc->discard_urgent_util = DEF_DISCARD_URGENT_UTIL;
 	dcc->undiscard_blks = 0;
+	dcc->undiscard_small_blks = 0;
+	dcc->undiscard_middle_blks = 0;
+	dcc->undiscard_large_blks = 0;
 	dcc->next_pos = 0;
 	dcc->root = RB_ROOT_CACHED;
 	dcc->rbtree_check = false;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index c42f4f979d13..9b11a490c8d0 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -176,6 +176,17 @@ static ssize_t undiscard_blks_show(struct f2fs_attr *a,
 				SM_I(sbi)->dcc_info->undiscard_blks);
 }
 
+static ssize_t undiscard_blks_bysize_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	if (!SM_I(sbi)->dcc_info)
+		return -EINVAL;
+	return sysfs_emit(buf, "small: %u, middle: %u, large: %u\n",
+				SM_I(sbi)->dcc_info->undiscard_small_blks,
+				SM_I(sbi)->dcc_info->undiscard_middle_blks,
+				SM_I(sbi)->dcc_info->undiscard_large_blks);
+}
+
 static ssize_t atgc_enabled_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -1471,6 +1482,7 @@ F2FS_GENERAL_RO_ATTR(cp_status);
 F2FS_GENERAL_RO_ATTR(issued_discard);
 F2FS_GENERAL_RO_ATTR(queued_discard);
 F2FS_GENERAL_RO_ATTR(undiscard_blks);
+F2FS_GENERAL_RO_ATTR(undiscard_blks_bysize);
 
 static struct attribute *f2fs_stat_attrs[] = {
 	ATTR_LIST(sb_status),
@@ -1478,6 +1490,7 @@ static struct attribute *f2fs_stat_attrs[] = {
 	ATTR_LIST(issued_discard),
 	ATTR_LIST(queued_discard),
 	ATTR_LIST(undiscard_blks),
+	ATTR_LIST(undiscard_blks_bysize),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_stat);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
