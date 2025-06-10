Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A6AD3DB8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:44:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jge9aRUpLkXL7fMVRJO7aMgoIX8mX70aCmZB1pWObnY=; b=FSzgz6GGq5inJio0U2RmVRqFah
	9SZulR8PUC6AD2oAsN+SkokIL5Iwn97QAhPQ95RoSnFan3KC5B/8pFZPBVBkVQ10Yp238GiwFdqfY
	ExprDmlg1V7Nz8zxKzLpTwkR8VAsZfkumxBDXe02n/Ya04ry3VWTZwGYKY4t9VIGnv/Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP18v-0000qH-1p;
	Tue, 10 Jun 2025 15:44:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP18t-0000q8-HH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oABJ1CBvsChdhWT9C6qI8koFYAjMhz8JTY/1WSGfTLY=; b=NSEiSiuNd6h2+bb2gUd4JfbeRv
 LeS+xWGqNkNU6u3wGY8f+GoCz1uXIFcwbGrUJh1DiHCVDhOHIwaZUTzvf+G0gXK0zgyD9iOTLUNSj
 cmhwYN7Vye2xZ/g/grCDxEO12Zh4wnhCZPsoJ/U0qJoNvLblqifnGsyL+F3tuBo0In8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oABJ1CBvsChdhWT9C6qI8koFYAjMhz8JTY/1WSGfTLY=; b=kxdZMURqhVe5UG/0yuHDtwzanl
 DYv+cS6i156Pk3kSj68ZlZQ1UtUarwjWWhKrFKPc530sX9XVsNxaFzbxv1VBlssFJI93ygttty9fM
 vXQgIw9ElyJsZbi/HlfVFfWULne3wqyDJ9huL7dHsxMbYJ0RNlR86kA/OB+9ywGRw+Mk=;
Received: from mail-qv1-f46.google.com ([209.85.219.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP18t-0006su-2a for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:44:03 +0000
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6fb28d4ab79so9737936d6.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749570232; x=1750175032; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oABJ1CBvsChdhWT9C6qI8koFYAjMhz8JTY/1WSGfTLY=;
 b=W/kdvoBrBp9zUwW9ymUnIpNXrcXGPr06vbE5xl1B/ctvUAky14MX2mr4RL838SHua1
 PPXvaQU4BjXyXuNan5mynfrQ7LOfsLxQ42Z+UugMlU8RXg5UZHjaoEZpu2GsWd1y1cXD
 Ky9O1Ht62Np42fvEIjzP1it5Hy0XM5S8mvULm2FuHmOFOTVJAbtgCC9iOx/TbhjzGfhQ
 I5hd+vhTplP25Ps8t78c+xlO2XcHX5IPahdrGjYK/ElKFnSU/dWcU9Q7q6ztDzvepTx/
 TDDGlEgcYhs+8VfUwpxGY20eIWuZB9eqbiiHpwPO4tyAd+b8sSnKFwvO2J4gWB4IHXAJ
 0+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749570232; x=1750175032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oABJ1CBvsChdhWT9C6qI8koFYAjMhz8JTY/1WSGfTLY=;
 b=okzTxLK+Lml0XA0q+m6PC+smj0s6bcvjmycPiqYaPIm/xWwd+E91iThAU1QP8yYoto
 zEQwtJZg52ESWCm2tl2OG4pIxEeIohtjnBynPlqDzr8ZS8xnZ9caOfofrO5JWakfx3w3
 mfvC2x6hUWcMrPx20Rnl7GFHvytx22D/rlGmqebk6Gqy6imiDv5UgBUSp8idQCqGb9EN
 cdzNceWMnDLziChPHlJCuPamWw0+kmEA+Bi2pVFpU2hLzKmXOBxkGvJ5L+U2A3erHppB
 IokAN0kiwXSCuQcHSBFFnsAl4jxPdTsDdIVjpXqYkgdj37onkU/tFBpEAvbCexzQ0R3O
 7+CQ==
X-Gm-Message-State: AOJu0YyGkuQ1SDxlevNa66cP8NOrnPx1y5iQbburHLF76m7yNurkXZ14
 KoyQI7LDqEN5GNe1eVP6+TywRYVDLHdWXpLi6b2YGvrsSw0z2B0UedopHXV9cA==
X-Gm-Gg: ASbGnctseZL58xMyY/KyfKS4y92oQ+XdZ8xYtWScz9XxOaXTb5p0qluo21JbYcOyEML
 KLQnv3rlmDCfsjijqqddtojWk7JmiZJ7jQx/I8a2FTDDV+ct0C2t4BtQvirCNjUAHjVTv299Qwh
 Cxu7v78VEVHGNkwpPw6lfKgjpb7hXiV8uhckHzWlUkxOb3pfChrkA6iP6Cmr/QfTz5tU4HR7/LH
 iO1pOSTc5u8sKT0IqZBuqtIDbU4YfV9RNJbsX523jAWxtUhT+uTiAnnbR+h8PcrFwfJOwR/PrLu
 Q2LSXMJWLByjH8Dyx+ajFC4SIlkqH4RL8WbbYFE6e2biqNbYAP5QlCfwrObW6EiwREr+cEQelMx
 aoGc=
X-Google-Smtp-Source: AGHT+IHPDIDqP+I69AyG1CUXWIiDxseqQU8VEBC9ZmRSJmRHyqfgqEe7YdgLep7jvUh8PaesFgw3LQ==
X-Received: by 2002:a05:6a00:9a3:b0:747:b043:41e8 with SMTP id
 d2e1a72fcca58-74827f12808mr21240752b3a.15.1749559087784; 
 Tue, 10 Jun 2025 05:38:07 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:07 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:13 +0800
Message-ID: <20250610123743.667183-4-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610123743.667183-1-shengyong1@xiaomi.com>
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sheng Yong Signed-off-by: Sheng Yong --- fsck/f2fs.h
 | 4 ++-- fsck/mount.c | 14 +++++++------- 2 files changed, 9 insertions(+),
 9 deletions(-) diff --git a/fsck/f2fs.h b/fsck/f2fs.h index
 187e73cf9aec..4c6c0c48b9ee
 100644 --- a/fsck/f2fs.h +++ b/fsck/f2fs.h @@ -504, 9 +504,
 9 @@ struct fsync_inode_entry
 { #define sits_in_cursum(jnl) (le16_to_c [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.46 listed in wl.mailspike.net]
X-Headers-End: 1uP18t-0006su-2a
Subject: [f2fs-dev] [RFC PATCH v2 03/32] f2fs-tools: cleanup
 {nid|segno}_in_journal
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

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fsck/f2fs.h  |  4 ++--
 fsck/mount.c | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 187e73cf9aec..4c6c0c48b9ee 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -504,9 +504,9 @@ struct fsync_inode_entry {
 #define sits_in_cursum(jnl)             (le16_to_cpu(jnl->n_sits))
 
 #define nat_in_journal(jnl, i)          (jnl->nat_j.entries[i].ne)
-#define nid_in_journal(jnl, i)          (jnl->nat_j.entries[i].nid)
+#define nid_in_journal(jnl, i)          (le32_to_cpu(jnl->nat_j.entries[i].nid))
 #define sit_in_journal(jnl, i)          (jnl->sit_j.entries[i].se)
-#define segno_in_journal(jnl, i)        (jnl->sit_j.entries[i].segno)
+#define segno_in_journal(jnl, i)        (le32_to_cpu(jnl->sit_j.entries[i].segno))
 
 #define SIT_ENTRY_OFFSET(sit_i, segno)                                  \
 	((segno) % sit_i->sents_per_block)
diff --git a/fsck/mount.c b/fsck/mount.c
index a7f16e78bae7..337acb6f8ff8 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1687,7 +1687,7 @@ static int f2fs_early_init_nid_bitmap(struct f2fs_sb_info *sbi)
 			continue;
 		}
 
-		nid = le32_to_cpu(nid_in_journal(journal, i));
+		nid = nid_in_journal(journal, i);
 		if (!IS_VALID_NID(sbi, nid)) {
 			MSG(0, "\tError: f2fs_init_nid_bitmap: nid(%u) is invalid!!!\n", nid);
 			journal->n_nats = cpu_to_le16(i);
@@ -2566,7 +2566,7 @@ void update_nat_blkaddr(struct f2fs_sb_info *sbi, nid_t ino,
 	int ret, i;
 
 	for (i = 0; i < nats_in_cursum(journal); i++) {
-		if (le32_to_cpu(nid_in_journal(journal, i)) == nid) {
+		if (nid_in_journal(journal, i) == nid) {
 			entry = &nat_in_journal(journal, i);
 			entry->block_addr = cpu_to_le32(newaddr);
 			if (ino)
@@ -2670,7 +2670,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	}
 
 	for (i = 0; i < sits_in_cursum(journal); i++) {
-		segno = le32_to_cpu(segno_in_journal(journal, i));
+		segno = segno_in_journal(journal, i);
 
 		if (segno >= MAIN_SEGS(sbi)) {
 			MSG(0, "\tError: build_sit_entries: segno(%u) is invalid!!!\n", segno);
@@ -2876,7 +2876,7 @@ next:
 		return i;
 	}
 
-	nid = le32_to_cpu(nid_in_journal(journal, i));
+	nid = nid_in_journal(journal, i);
 
 	entry_off = nid % NAT_ENTRY_PER_BLOCK;
 	block_addr = current_nat_addr(sbi, nid, NULL);
@@ -3275,7 +3275,7 @@ int lookup_nat_in_journal(struct f2fs_sb_info *sbi, u32 nid,
 	int i = 0;
 
 	for (i = 0; i < nats_in_cursum(journal); i++) {
-		if (le32_to_cpu(nid_in_journal(journal, i)) == nid) {
+		if (nid_in_journal(journal, i) == nid) {
 			memcpy(raw_nat, &nat_in_journal(journal, i),
 						sizeof(struct f2fs_nat_entry));
 			DBG(3, "==> Found nid [0x%x] in nat cache\n", nid);
@@ -3300,7 +3300,7 @@ void nullify_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
 
 	/* check in journal */
 	for (i = 0; i < nats_in_cursum(journal); i++) {
-		if (le32_to_cpu(nid_in_journal(journal, i)) == nid) {
+		if (nid_in_journal(journal, i) == nid) {
 			memset(&nat_in_journal(journal, i), 0,
 					sizeof(struct f2fs_nat_entry));
 			FIX_MSG("Remove nid [0x%x] in nat journal", nid);
@@ -3604,7 +3604,7 @@ void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
 	/* Traverse nat journal, update the corresponding entries */
 	for (i = 0; i < nats_in_cursum(journal); i++) {
 		struct f2fs_nat_entry raw_nat;
-		nid = le32_to_cpu(nid_in_journal(journal, i));
+		nid = nid_in_journal(journal, i);
 		ni.nid = nid;
 
 		DBG(3, "==> Found nid [0x%x] in nat cache, update it\n", nid);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
