Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AACC5B333BC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 03:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzmK+bYvhzQkRB8ugctrkovck/LVn/ww4+dsnSXtz/4=; b=htWr7pMtvmO72ir83cQPUr76Cd
	ctvhbQIS3k+K0bdvIFVFxu912x8rocNvPejM3cQ8Q8G5dq4Dl5lvVz59T0Ra7HpN85/+uLNzpEzML
	/ziL0kBLrLIQTxTf4XxPtJPhMB2nMeXHdk8JhruNKg6GbgzdeubcrynoZKQPEolDjPIg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqMRU-0007TB-BS;
	Mon, 25 Aug 2025 01:56:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uqMRS-0007T5-S4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nlj+k/R/UR32l62u4VVQNzlAoc95P52L4kB0ydPemJU=; b=id+p8krjYduf+N56CUcLw3a07u
 6yCY/SfEfJaR8FSMjjSvqOZ9QN0pB29k86F9wIGl3fCqNQ5kbmQsaurG07XzMLTIxAZTCE31C7NaS
 BIAYPXMjW529Tp60z+KnMbogOZGeWpGJy9B3ymnuozEsKLAM3iXu99HVjLDkb7GoexNk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nlj+k/R/UR32l62u4VVQNzlAoc95P52L4kB0ydPemJU=; b=Wm9p2pZvf3us0sUx+Ve7oGrxwx
 cAZOPO5HSd1Q/vZRTHih8Kg1xVrdi7is3ElkVswBPsjkBfMv3k8RfjqevthE1VzuZds0hMGdyHcfb
 w7U9sXA5c6IYwkRur20OhT4oYR2s52bNhp3lC4/TnuM+u6d01BBGeUEEnHTOkkOP7qcQ=;
Received: from mail-pg1-f181.google.com ([209.85.215.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uqMRS-0002on-BG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:14 +0000
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b482fd89b0eso3096081a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 Aug 2025 18:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756086969; x=1756691769; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nlj+k/R/UR32l62u4VVQNzlAoc95P52L4kB0ydPemJU=;
 b=FPchIM4XR+ZrSOL3P+yEKsfdNecK6yxH3RnriKGIiXqL9sUy91vSk7x2QDyR5MHXwg
 KOaHpR3jEu6RKD3EBQZVZM9wlwghIK0piefUWENSqmkNk3S6snvqEgzGHO2+uYbNsbSE
 kQMhisxgljwoqpBOstcwQBSpOrRRBE9IdeQq68xoCq+tR0yoK9mT8THeZYFa4/tUhCbB
 mP5bv/3hfJQgtzXqhm048F+ThpvzyPTHN6E3nl2ZT4rxPszmNwsO0QTWuwAux4QeMd0I
 R5EPib1dT9G9d3qTM7ROVXT6CF+VwfbiX99ATK1hvYuhArA7OIYSZ0SZEBER3KwaMbZJ
 FsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756086969; x=1756691769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nlj+k/R/UR32l62u4VVQNzlAoc95P52L4kB0ydPemJU=;
 b=dxyvv1BLN8EdmG/ODpbDjzbAHpjmhmrDjN4ReQDaMUdOAzu1AoChElE1zHwruIhzFo
 I8IwmF7Kca+aUIPD74F5RylmJsoqFHyQVbhR6nA4lgRunlpDF8NTyKpR9n7BJfuZHbR8
 cQPzsGXhDyxzS5sIwjYTTsFhYN3vNscT24o1nKOqyfvScur6nf2kXMjs9HC1UxXvjGte
 3kLDeCMAD43pyUOD/eN6DZkzAQPNEH8qtPv0XLQ4ZrWIRh+GV65/Yi026xRwS1mJgmIw
 nhqrE4BClALE+jL93aNETA/ceeNHujw7QowbKuNjKUAwDvx3UzBl002hO4qAa9Sktp24
 36RA==
X-Gm-Message-State: AOJu0YwnSNvfmIugf7FwbweJXEgAwnvcdTItrpiFy2li0BLolWtlIAnq
 GHGMBJ8uNWJLv4yOxW+m7zYKj+qVckajDtgmPNgpmtSpfOwEEMxQ5humpg8WxQ==
X-Gm-Gg: ASbGnctFVBS8y9jJW3tmohQVqvRDwwS7jLkcWG34aw8Jg+FGEuRk2R2rWRxbUylN+Zn
 a0VvVDL3byOsfDPQPRrDs7nPdjjUKw8zCH5fI1ZYREtZi7eeCZXZcY7xRJiGxEye9xIJOjWfK+W
 oW1FJClwUGsWZHqgdUg3gIRmPiEblhc4Lr9ZLY47ajNUI1pYs9EeRlWVEDFoTYAukj8EbHTxHSj
 y169OaafltvyR74jij8Ujsi87/JbdF1tq7pWcBLlfkMWmJDam/TF/lgoPHKpjeaPJ2Q1k0WFJx5
 HunIjfM9rXbeA9qEJSl+F5ZwtKKlpsZU/mMophZV2j8YGmKYdVL2cYosKLIZYeyVIqEHs1NXNhZ
 joakT3tO1Vf5zWl5PgJt3wJOcZfMeKuz1PA1jKwM=
X-Google-Smtp-Source: AGHT+IEl1QKXTd4Oz78zNGIPnO62Oqy3llJmtB8HU6IFQAD4yWYSIRu8rZyDs3YJNe0hrhrPG7URCA==
X-Received: by 2002:a05:6a20:3c89:b0:23d:e0a6:d56e with SMTP id
 adf61e73a8af0-24340cd393dmr15290938637.29.1756086968620; 
 Sun, 24 Aug 2025 18:56:08 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b49cb8b1989sm5147883a12.18.2025.08.24.18.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 18:56:08 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 25 Aug 2025 09:54:45 +0800
Message-ID: <20250825015455.3826644-4-shengyong1@xiaomi.com>
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
 Content preview: From: Sheng Yong Signed-off-by: Sheng Yong Reviewed-by: Chao
 Yu --- fsck/f2fs.h | 4 ++-- fsck/mount.c | 14 +++++++------- 2 files changed, 
 9 insertions(+), 9 deletions(-) diff --git a/fsck/f2fs.h b/fsck/f2fs.h index
 187e73cf9aec..4c6c0c48b9ee 100644 --- a/fsck/f2fs.h +++ b/fsck/f2fs.h @@
 -504, 9 +504,
 9 @@ struct fsync_inode_entry { #define sits_in_cursum(jnl) (le16_to_c
 [...] Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.215.181 listed in list.dnswl.org]
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
 [209.85.215.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uqMRS-0002on-BG
Subject: [f2fs-dev] [PATCH v4 03/13] f2fs-tools: cleanup
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
Reviewed-by: Chao Yu <chao@kernel.org>
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
index 5399f16c6bf0..1fe2b110942b 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1694,7 +1694,7 @@ static int f2fs_early_init_nid_bitmap(struct f2fs_sb_info *sbi)
 			continue;
 		}
 
-		nid = le32_to_cpu(nid_in_journal(journal, i));
+		nid = nid_in_journal(journal, i);
 		if (!IS_VALID_NID(sbi, nid)) {
 			MSG(0, "\tError: f2fs_init_nid_bitmap: nid(%u) is invalid!!!\n", nid);
 			journal->n_nats = cpu_to_le16(i);
@@ -2573,7 +2573,7 @@ void update_nat_blkaddr(struct f2fs_sb_info *sbi, nid_t ino,
 	int ret, i;
 
 	for (i = 0; i < nats_in_cursum(journal); i++) {
-		if (le32_to_cpu(nid_in_journal(journal, i)) == nid) {
+		if (nid_in_journal(journal, i) == nid) {
 			entry = &nat_in_journal(journal, i);
 			entry->block_addr = cpu_to_le32(newaddr);
 			if (ino)
@@ -2677,7 +2677,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	}
 
 	for (i = 0; i < sits_in_cursum(journal); i++) {
-		segno = le32_to_cpu(segno_in_journal(journal, i));
+		segno = segno_in_journal(journal, i);
 
 		if (segno >= MAIN_SEGS(sbi)) {
 			MSG(0, "\tError: build_sit_entries: segno(%u) is invalid!!!\n", segno);
@@ -2883,7 +2883,7 @@ next:
 		return i;
 	}
 
-	nid = le32_to_cpu(nid_in_journal(journal, i));
+	nid = nid_in_journal(journal, i);
 
 	entry_off = nid % NAT_ENTRY_PER_BLOCK;
 	block_addr = current_nat_addr(sbi, nid, NULL);
@@ -3282,7 +3282,7 @@ int lookup_nat_in_journal(struct f2fs_sb_info *sbi, u32 nid,
 	int i = 0;
 
 	for (i = 0; i < nats_in_cursum(journal); i++) {
-		if (le32_to_cpu(nid_in_journal(journal, i)) == nid) {
+		if (nid_in_journal(journal, i) == nid) {
 			memcpy(raw_nat, &nat_in_journal(journal, i),
 						sizeof(struct f2fs_nat_entry));
 			DBG(3, "==> Found nid [0x%x] in nat cache\n", nid);
@@ -3307,7 +3307,7 @@ void nullify_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
 
 	/* check in journal */
 	for (i = 0; i < nats_in_cursum(journal); i++) {
-		if (le32_to_cpu(nid_in_journal(journal, i)) == nid) {
+		if (nid_in_journal(journal, i) == nid) {
 			memset(&nat_in_journal(journal, i), 0,
 					sizeof(struct f2fs_nat_entry));
 			FIX_MSG("Remove nid [0x%x] in nat journal", nid);
@@ -3611,7 +3611,7 @@ void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
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
