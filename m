Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4544CB333C0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 03:56:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDgiLdcTXr/6R2Vf8lHMsst0yioB6yD2ESCS819pfhs=; b=B7MkD+0m4pWwTDM8hbYBZJoK39
	cKlCis+PRucgMoJHCKm0hgCsTWNIyK8pRKcviunTvKXnkPKSS9771y9DQkHZHiVQTWJ1PgMOA5i7F
	d9V4Af/Duu30vBASCvap1JZMtAPtPZHn+Gxh5QXe2EAGQfCRxdG5P/RDh6+6jL1Arno0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqMRb-00040f-Am;
	Mon, 25 Aug 2025 01:56:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uqMRa-00040X-F0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bCTOlKqVoLcpRR1LeYbYWI4MOVbyb3aEPdpxue+2sjM=; b=OaDdL5RJRhWkx2WWLYbTLsb5vS
 CLYLaWyJT7iZ9x/ceyplgROkPQK7juxRRUe3tgzvpiJ2ttAyJGuaZRYJZbkQXFMUwBk0QAtlph2kd
 z/3K+HfVLeC8SSSrnvLKIDYWAoYjufUMs4+sCrerC/01sl1Kg4O13c8jSXEyrfub4BrE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bCTOlKqVoLcpRR1LeYbYWI4MOVbyb3aEPdpxue+2sjM=; b=JAavccodMf1zY62sRF6BrsXocH
 dxoDR0y2jwZYYXUyCzu7NXr/TLBokg8f/2xoo+ptPcfpeP9nBGFjT38voi2q/rsmvd3Z5GASFChGw
 hZrkeMm3xMn0PwrQl1NfFBte+TaGC55sPpJC//KZB/UGg6IxuGDEpqy4s7KJNJNJhq7o=;
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uqMRa-0002pO-Fi for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:23 +0000
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b49d6f8f347so1012161a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 Aug 2025 18:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756086977; x=1756691777; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bCTOlKqVoLcpRR1LeYbYWI4MOVbyb3aEPdpxue+2sjM=;
 b=LZNH9IZAGIUjmM1Qmx/ZHiiT2rB6XV10X4aHU8V1qBxt/9Idthh0/F33MYy/5ciQFW
 UynceSWrz6sn0aocuGEUFFtP8ah6zCBDU/GX43vxVeHcTkc95SU4X6D/URb2aFBLLqCX
 eb8JDPOQ4w5nZNJj52DWOrFZcio+GDgxbH046ZRowRy9a+U5n4ezL1W5Af5OG+tf9O3Z
 893NG18OS+VTecejGe0oi/FURRYDqB+IQNCkF7JTS48lglnND5vmDoFPcmLGAEkemh33
 1MXsamHkKV9dXRywHB3+FMIYo/OYluNMOA5raQK57Wedw+pRNufR1vVmblZs+sPzDWwj
 kRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756086977; x=1756691777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bCTOlKqVoLcpRR1LeYbYWI4MOVbyb3aEPdpxue+2sjM=;
 b=NgegdYpKD722Wxa3XHxP/Y3KmJEo305gHGyPxqyQg4o79Thk8NXoS4pPQ353UJOUE+
 wlUajpTLwdteHY/f3ZEug9Jy47Mn42v1Oo4O6hkFBr1jD9wTeGId7Iwe6hFUDmPK6hAT
 tbFMN8lWk7J4QHaHCpScJkDliqX5+sPy5qgcWtcVNNZQQTJf7VKlEjljz/zBy+kwUnPO
 +iNZR3f2tyBa/jqmYyzJ6kjcxtRCkw+DiMb6SPb+nMauob+kd9hDSz/SY3xpAKvUVcpR
 Oi1VX3nS/VvWRSqx9rfNe6IQiwXCnRFyRDJhH460BXcMv+gDXnq3J191xZqjWYjxz7t8
 AJXg==
X-Gm-Message-State: AOJu0YwPJMik6nqpJc+bm9iiNGMf2MizYsc+2xUoIsC+8n9l08wDayYs
 o8u/iuyGll1NZpJV/OulCbwHtDI6g+B7J/Cr67nYwRWM8/yvpofDs44k
X-Gm-Gg: ASbGncsvsWjJzmvHH3PpZ5QraEcf0/IpIy58P2syYBX9rpPYhig7+g5VXKlm+JZEqOt
 VS0kd20UOR2y7xf9zzMNtzPLZ3YAEvK/CFJlHo0i2iNr9fPHQBIBUHNjyJ05CfcqK9Cac9xCldn
 biafbOmChsWYGw9PfJVhTN04Ms1VzsU0Kb77Kj6y4F3XA2hwKuo3fDWnV0wmzHjSpIyPLDNCo54
 j21Rxl7JYC3d8sMeKUzBLgJTy5T09YvReew8lxzaWJj0wpx6uXMbS2xw3+KtNAukXTqZSxxX/06
 cot6d487KQPuVQ8GV9+BHtoIooWxBFeFaeIgy6UTf5Sn7HWT0ZdlVMwZ3HygD23I2jvj0SN+ZrC
 JKlCmbsQtZRyLr5W6WcPUevn6P79SbX1AmnIvcCs=
X-Google-Smtp-Source: AGHT+IE2krfgxyRuBcDZZ7JoU4/Qt6nR1tU/FZOFhRYBx6jPT3o+4ILMLLr0/RhVkun7k0cedoZ1Jg==
X-Received: by 2002:a05:6a21:33a4:b0:240:413:bda6 with SMTP id
 adf61e73a8af0-24340ab310fmr12311267637.9.1756086976685; 
 Sun, 24 Aug 2025 18:56:16 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b49cb8b1989sm5147883a12.18.2025.08.24.18.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 18:56:16 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 25 Aug 2025 09:54:49 +0800
Message-ID: <20250825015455.3826644-8-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825015455.3826644-1-shengyong1@xiaomi.com>
References: <20250825015455.3826644-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sheng Yong Previously when injecting sit/nat entry,
 we only inject SIT/NAT pack. If the valid target is in journal, the injection
 has no effect. So we have to check whether the valid target is in journal,
 and in [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uqMRa-0002pO-Fi
Subject: [f2fs-dev] [PATCH v4 07/13] inject.f2fs: fix injecting sit/nat in
 journal
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

Previously when injecting sit/nat entry, we only inject SIT/NAT pack.
If the valid target is in journal, the injection has no effect. So we
have to check whether the valid target is in journal, and inject the
target at its valid position.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
v3: * add helper get_raw_{nat|sit}() to get nat/sit entry and return
      its position (journal/pack1/pack2)
    * show entry's position correctly
    * add helper rewrite_raw_{nat|sit}() to write nat/sit entry back
      to its original position
---
 fsck/inject.c | 257 ++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 195 insertions(+), 62 deletions(-)

diff --git a/fsck/inject.c b/fsck/inject.c
index b291d9dbc096..aae3db0c6524 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -10,9 +10,22 @@
  */
 
 #include <getopt.h>
+#include "f2fs.h"
 #include "node.h"
 #include "inject.h"
 
+/* localtion of a sit/nat entry */
+enum entry_pos {
+	ENT_IN_JOURNAL,
+	ENT_IN_PACK1,
+	ENT_IN_PACK2
+};
+
+/* format of printing entry position */
+#define PRENTPOS "%s %d"
+#define show_entry_pos(pack) (pack) == ENT_IN_JOURNAL ? "journal" : "pack", \
+			     (pack) == ENT_IN_JOURNAL ? 0 : (pack)
+
 static void print_raw_nat_entry_info(struct f2fs_nat_entry *ne)
 {
 	if (!c.dbg_lv)
@@ -534,16 +547,92 @@ out:
 	return ret;
 }
 
-static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
+static void rewrite_nat_in_journal(struct f2fs_sb_info *sbi, u32 nid,
+				   struct f2fs_nat_entry *nat)
+{
+	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
+	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
+	block_t blkaddr;
+	int ret, i;
+
+	for (i = 0; i < nats_in_cursum(journal); i++) {
+		if (nid_in_journal(journal, i) == nid) {
+			memcpy(&nat_in_journal(journal, i), nat, sizeof(*nat));
+			break;
+		}
+	}
+
+	if (is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
+		blkaddr = sum_blk_addr(sbi, NR_CURSEG_TYPE, CURSEG_HOT_DATA);
+	else
+		blkaddr = sum_blk_addr(sbi, NR_CURSEG_DATA_TYPE, CURSEG_HOT_DATA);
+
+	ret = dev_write_block(curseg->sum_blk, blkaddr, WRITE_LIFE_NONE);
+	ASSERT(ret >= 0);
+}
+
+static block_t get_nat_addr(struct f2fs_sb_info *sbi, int nat_pack,
+			    nid_t nid, enum entry_pos *pack)
 {
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
+	block_t blkaddr;
+	unsigned int blkoff;
+
+	blkoff = NAT_BLOCK_OFFSET(nid);
+	blkaddr = nm_i->nat_blkaddr + (blkoff << 1) +
+			(blkoff & (sbi->blocks_per_seg - 1));
+	if (nat_pack == 0) // select valid nat pack
+		nat_pack = f2fs_test_bit(blkoff, nm_i->nat_bitmap) ?
+				ENT_IN_PACK2 : ENT_IN_PACK1;
+	if (nat_pack == ENT_IN_PACK2)
+		blkaddr += sbi->blocks_per_seg;
+	if (pack)
+		*pack = nat_pack;
+	return blkaddr;
+}
+
+static struct f2fs_nat_entry *get_raw_nat(struct f2fs_sb_info *sbi,
+					  struct inject_option *opt,
+					  struct f2fs_nat_block *nat_blk,
+					  enum entry_pos *pack)
+{
+	block_t blkaddr;
+	unsigned int offs;
+
+	if (lookup_nat_in_journal(sbi, opt->nid, &nat_blk->entries[0]) >= 0) {
+		offs = 0;
+		*pack = ENT_IN_JOURNAL;
+	} else {
+		blkaddr = get_nat_addr(sbi, opt->nat, opt->nid, pack);
+		ASSERT(dev_read_block(nat_blk, blkaddr) >= 0);
+		offs = opt->nid % NAT_ENTRY_PER_BLOCK;
+	}
+
+	return &nat_blk->entries[offs];
+}
+
+static void rewrite_raw_nat(struct f2fs_sb_info *sbi,
+			    struct inject_option *opt,
+			    struct f2fs_nat_block *nat_blk,
+			    enum entry_pos pack)
+{
+	block_t blkaddr;
+
+	if (pack == ENT_IN_JOURNAL) {
+		rewrite_nat_in_journal(sbi, opt->nid, &nat_blk->entries[0]);
+	} else {
+		blkaddr = get_nat_addr(sbi, opt->nat, opt->nid, NULL);
+		ASSERT(dev_write_block(nat_blk, blkaddr, WRITE_LIFE_NONE) >= 0);
+	}
+}
+
+static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct f2fs_nat_block *nat_blk;
 	struct f2fs_nat_entry *ne;
-	block_t blk_addr;
-	unsigned int offs;
-	bool is_set;
-	int ret;
+	enum entry_pos pack;
 
 	if (!IS_VALID_NID(sbi, opt->nid)) {
 		ERR_MSG("Invalid nid %u range [%u:%"PRIu64"]\n", opt->nid, 0,
@@ -556,38 +645,24 @@ static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	nat_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(nat_blk);
 
-	/* change NAT version bitmap temporarily to select specified pack */
-	is_set = f2fs_test_bit(opt->nid, nm_i->nat_bitmap);
-	if (opt->nat == 0) {
-		opt->nat = is_set ? 2 : 1;
-	} else {
-		if (opt->nat == 1)
-			f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
-		else
-			f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
-	}
-
-	blk_addr = current_nat_addr(sbi, opt->nid, NULL);
-
-	ret = dev_read_block(nat_blk, blk_addr);
-	ASSERT(ret >= 0);
-
-	offs = opt->nid % NAT_ENTRY_PER_BLOCK;
-	ne = &nat_blk->entries[offs];
+	ne = get_raw_nat(sbi, opt, nat_blk, &pack);
 
 	if (!strcmp(opt->mb, "version")) {
 		MSG(0, "Info: inject nat entry version of nid %u "
-		    "in pack %d: %d -> %d\n", opt->nid, opt->nat,
+		    "in "PRENTPOS": %d -> %d\n", opt->nid,
+		    show_entry_pos(pack),
 		    ne->version, (u8)opt->val);
 		ne->version = (u8)opt->val;
 	} else if (!strcmp(opt->mb, "ino")) {
 		MSG(0, "Info: inject nat entry ino of nid %u "
-		    "in pack %d: %d -> %d\n", opt->nid, opt->nat,
+		    "in "PRENTPOS": %d -> %d\n", opt->nid,
+		    show_entry_pos(pack),
 		    le32_to_cpu(ne->ino), (nid_t)opt->val);
 		ne->ino = cpu_to_le32((nid_t)opt->val);
 	} else if (!strcmp(opt->mb, "block_addr")) {
 		MSG(0, "Info: inject nat entry block_addr of nid %u "
-		    "in pack %d: 0x%x -> 0x%x\n", opt->nid, opt->nat,
+		    "in "PRENTPOS": 0x%x -> 0x%x\n", opt->nid,
+		    show_entry_pos(pack),
 		    le32_to_cpu(ne->block_addr), (block_t)opt->val);
 		ne->block_addr = cpu_to_le32((block_t)opt->val);
 	} else {
@@ -597,25 +672,99 @@ static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	}
 	print_raw_nat_entry_info(ne);
 
-	ret = dev_write_block(nat_blk, blk_addr, WRITE_LIFE_NONE);
-	ASSERT(ret >= 0);
-	/* restore NAT version bitmap */
-	if (is_set)
-		f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
-	else
-		f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
+	rewrite_raw_nat(sbi, opt, nat_blk, pack);
 
 	free(nat_blk);
-	return ret;
+	return 0;
 }
 
-static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
+static void rewrite_sit_in_journal(struct f2fs_sb_info *sbi, unsigned int segno,
+				   struct f2fs_sit_entry *sit)
+{
+	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
+	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_COLD_DATA);
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
+	block_t blkaddr;
+	int ret, i;
+
+	for (i = 0; i < sits_in_cursum(journal); i++) {
+		if (segno_in_journal(journal, i) == segno) {
+			memcpy(&sit_in_journal(journal, i), sit, sizeof(*sit));
+			break;
+		}
+	}
+
+	if (is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
+		blkaddr = sum_blk_addr(sbi, NR_CURSEG_TYPE, CURSEG_COLD_DATA);
+	else
+		blkaddr = sum_blk_addr(sbi, NR_CURSEG_DATA_TYPE, CURSEG_COLD_DATA);
+
+	ret = dev_write_block(curseg->sum_blk, blkaddr, WRITE_LIFE_NONE);
+	ASSERT(ret >= 0);
+}
+
+static block_t get_sit_addr(struct f2fs_sb_info *sbi, int sit_pack,
+			    unsigned int segno, enum entry_pos *pack)
+{
+	struct sit_info *sit_i = SIT_I(sbi);
+	unsigned int blkaddr, offs;
+
+	offs = SIT_BLOCK_OFFSET(sit_i, segno);
+	blkaddr = sit_i->sit_base_addr + offs;
+	if (sit_pack == 0) // select valid sit pack
+		sit_pack = f2fs_test_bit(offs, sit_i->sit_bitmap) ?
+				ENT_IN_PACK2 : ENT_IN_PACK1;
+	if (sit_pack == ENT_IN_PACK2)
+		blkaddr += sit_i->sit_blocks;
+	if (pack)
+		*pack = sit_pack;
+	return blkaddr;
+}
+
+static struct f2fs_sit_entry *get_raw_sit(struct f2fs_sb_info *sbi,
+					  struct inject_option *opt,
+					  struct f2fs_sit_block *sit_blk,
+					  enum entry_pos *pack)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
+	unsigned int segno, offs;
+	block_t blkaddr;
+
+	segno = GET_SEGNO(sbi, opt->blk);
+	if (lookup_sit_in_journal(sbi, segno, &sit_blk->entries[0]) >= 0) {
+		offs = 0;
+		*pack = ENT_IN_JOURNAL;
+	} else {
+		blkaddr = get_sit_addr(sbi, opt->sit, segno, pack);
+		ASSERT(dev_read_block(sit_blk, blkaddr) >= 0);
+		offs = SIT_ENTRY_OFFSET(sit_i, segno);
+	}
+
+	return &sit_blk->entries[offs];
+}
+
+static void rewrite_raw_sit(struct f2fs_sb_info *sbi,
+			    struct inject_option *opt,
+			    struct f2fs_sit_block *sit_blk,
+			    enum entry_pos pack)
+{
+	unsigned int segno;
+	block_t blkaddr;
+
+	segno = GET_SEGNO(sbi, opt->blk);
+	if (pack == ENT_IN_JOURNAL) {
+		rewrite_sit_in_journal(sbi, segno, &sit_blk->entries[0]);
+	} else {
+		blkaddr = get_sit_addr(sbi, opt->sit, segno, NULL);
+		ASSERT(dev_write_block(sit_blk, blkaddr, WRITE_LIFE_NONE) >= 0);
+	}
+}
+
+static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
 	struct f2fs_sit_block *sit_blk;
 	struct f2fs_sit_entry *sit;
-	unsigned int segno, offs;
-	bool is_set;
+	enum entry_pos pack;
 
 	if (!f2fs_is_valid_blkaddr(sbi, opt->blk, DATA_GENERIC)) {
 		ERR_MSG("Invalid blkaddr 0x%x (valid range [0x%x:0x%lx])\n",
@@ -627,30 +776,18 @@ static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	sit_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(sit_blk);
 
-	segno = GET_SEGNO(sbi, opt->blk);
-	/* change SIT version bitmap temporarily to select specified pack */
-	is_set = f2fs_test_bit(segno, sit_i->sit_bitmap);
-	if (opt->sit == 0) {
-		opt->sit = is_set ? 2 : 1;
-	} else {
-		if (opt->sit == 1)
-			f2fs_clear_bit(segno, sit_i->sit_bitmap);
-		else
-			f2fs_set_bit(segno, sit_i->sit_bitmap);
-	}
-	get_current_sit_page(sbi, segno, sit_blk);
-	offs = SIT_ENTRY_OFFSET(sit_i, segno);
-	sit = &sit_blk->entries[offs];
+	sit = get_raw_sit(sbi, opt, sit_blk, &pack);
 
 	if (!strcmp(opt->mb, "vblocks")) {
 		MSG(0, "Info: inject sit entry vblocks of block 0x%x "
-		    "in pack %d: %u -> %u\n", opt->blk, opt->sit,
+		    "in "PRENTPOS": %u -> %u\n", opt->blk,
+		    show_entry_pos(pack),
 		    le16_to_cpu(sit->vblocks), (u16)opt->val);
 		sit->vblocks = cpu_to_le16((u16)opt->val);
 	} else if (!strcmp(opt->mb, "valid_map")) {
 		if (opt->idx == -1) {
-			MSG(0, "Info: auto idx = %u\n", offs);
-			opt->idx = offs;
+			opt->idx = OFFSET_IN_SEG(sbi, opt->blk);
+			MSG(0, "Info: auto idx = %u\n", opt->idx);
 		}
 		if (opt->idx >= SIT_VBLOCK_MAP_SIZE) {
 			ERR_MSG("invalid idx %u of valid_map[]\n", opt->idx);
@@ -658,8 +795,9 @@ static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
 			return -ERANGE;
 		}
 		MSG(0, "Info: inject sit entry valid_map[%d] of block 0x%x "
-		    "in pack %d: 0x%02x -> 0x%02x\n", opt->idx, opt->blk,
-		    opt->sit, sit->valid_map[opt->idx], (u8)opt->val);
+		    "in "PRENTPOS": 0x%02x -> 0x%02x\n", opt->idx, opt->blk,
+		    show_entry_pos(pack),
+		    sit->valid_map[opt->idx], (u8)opt->val);
 		sit->valid_map[opt->idx] = (u8)opt->val;
 	} else if (!strcmp(opt->mb, "mtime")) {
 		MSG(0, "Info: inject sit entry mtime of block 0x%x "
@@ -673,12 +811,7 @@ static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	}
 	print_raw_sit_entry_info(sit);
 
-	rewrite_current_sit_page(sbi, segno, sit_blk);
-	/* restore SIT version bitmap */
-	if (is_set)
-		f2fs_set_bit(segno, sit_i->sit_bitmap);
-	else
-		f2fs_clear_bit(segno, sit_i->sit_bitmap);
+	rewrite_raw_sit(sbi, opt, sit_blk, pack);
 
 	free(sit_blk);
 	return 0;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
