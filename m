Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BF1B2DCD9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 14:43:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1/dhxVWSO1Lr6h1RJ/dJ55+k1JSJiJpRVkBnGcXcVQ=; b=VnWNUI8q/jqO5/bFuAszGJbPV7
	0DPgX/MYLJOdXIPPgrZGVjesacI2kgKAVu4havny9U1swWn0dLgrLg2aZ8/4hhf4YDwas4EAaBQKz
	+o81T6Z6akyIYjhcP2dwtnK9l1mrJgVxXb/l550OnxJgjz3NflQ4m9+wA/ADiHPA6Yc8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoi9w-00059v-4d;
	Wed, 20 Aug 2025 12:43:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uoi9r-000599-Vs
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IO3IO0G39YQlC6WTuO3l4hM9bgIKK5Faz6uUUKkNtWk=; b=DC4QFjhps8vhkZdEfymY3/9B9L
 sF49NOLk0uf6D9raSKGLiNvGQfeeKtkqFPbivwwGAn8wNPgtmU9Yfl+2ExGgN6gU5RKuAA9udODzW
 L7aL0NL4dpgDvdc6x1CPeFTol/gLNBIovx0huCkImH6KOYXcUzKjIl3X4GXnZe26icnc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IO3IO0G39YQlC6WTuO3l4hM9bgIKK5Faz6uUUKkNtWk=; b=UkC4vBHwA31VODY6Ib2ZAV1qpF
 Jm5nWxFUaJRmAnywCMAN/x4wQmluL9VOtoxQCdKyL1Fw45TC5kfyvtP/mU5aSrsIT7o64Ux54cJpu
 2RY/Umru6oVzZBUWrLk546xLEhA7ZhPL7c725tw9mhoFpKlIKK2x1DGRJ7D1fLyPJoZc=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoi9q-0003m0-Nr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:15 +0000
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2445806d44fso53487535ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Aug 2025 05:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755693784; x=1756298584; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IO3IO0G39YQlC6WTuO3l4hM9bgIKK5Faz6uUUKkNtWk=;
 b=F7aylUJCRJvqJq31S3W9kbsKWdL2ZayciexvdERFbmH3JRmvL2DtF3x8zKCb2li9UO
 +bXZ5/D6MeRAk/z04RC7sXzn7ql+qnuAFBi5KThLjQRqrA6MA73UxEXJ+YXlUv3AOdce
 Ff/9AXQfGkrdKmmKz28/PTqtrfBQSEzX2zDbbVSI/jEzQbjJr6RG27jcr39pAB1wyRWi
 Z3p4ATCU+ww0MpdGI1/tL3FPrPiWOlvUqm6ZKKc09tUoPZ32YxicjWGczYmdao3k8VuR
 OGAk8Oh8Os4YCZbRW5rfRfFnVJFtUwOPEpgi/FUYmQmH3XAg01xH60YfSQ+6buE/z+A+
 VjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755693784; x=1756298584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IO3IO0G39YQlC6WTuO3l4hM9bgIKK5Faz6uUUKkNtWk=;
 b=bh6gIZLoCsIvsdXHkPeGiURdIdDx+wAP4UbC223z37xnBs9jykfV6+3SPs2zk9o8Vq
 gw0u4VxcPqavrNmhRvyfrdHsMuRfBHCSiFC72+9oQpSxt7dUmZUQ7H+NKHIFL1TbuNr0
 YPTAKULLZcY79IK5yJdPdtqJmHSFvnlrycKsenoSz6jAnhX8DtFX4q/xc0KvMIFgfOzo
 oMhW5oiPcohqYXNpl0yhMdtPELEUkdqLEzp+RxJ9UfpJXMApFmqTyvIyVDkMpdEUrXxA
 P9bMmomIKLe2ydZ//Ln0E+pXst44BgYgkTwf8tj8uYX5fYTTuetynEo7YaZUCy4UJBP1
 Idlg==
X-Gm-Message-State: AOJu0Yy42JJ0bXC+gT5sVk9I34RDkwUcV5O/kEsLqrVFGZXHW9jZZWMN
 x2y+ZxxEhmAkrcu1IrRmvV4fglpe3VwEhVW92TLV5JDcMb4IW+zIZfRyr3KyHg==
X-Gm-Gg: ASbGncsmhfbcMm5wsAKnlEh6zBfHBV8cG1G7aQNpqvARL8JXbmEX+8SpitzYgeLs9g2
 x9WAgpYFLTwS3Hr4Zxw25PkBOqmweL6pQJObXiN+Gcm21A2XWkziQtrUquPaJLO+6R2VtQg35CC
 hsJn6YDGpcBLGkx67UFfdms+DnXb40Ac+n/zRjk5YzI37wJBxarH1dDk4ub84dn3hO3Pi9Eofoa
 wWYonAt1sIRfLzimKrub4ILOOer+d2IWD4dn6Lzg5pVbIpjBeL86oWmMgLlEx1urX0bJb86v4hD
 l0+7VsjO2Zwlo6FgyeHMn3lgZ3h3U/fFN4/1P5FLnpH9SvD4hdGTQ/g9WjFRsJZwfk4h2TS2GoG
 M6L0j+toRgc+R/ln7uARO2wAA8dA1
X-Google-Smtp-Source: AGHT+IG62ta7P0Jp2UJCp8kFDPUFV0y7jcf7NnyZGoT82XRcJjy/Xn8V3/a9n3DubTSv7tKbybvApA==
X-Received: by 2002:a17:902:ecce:b0:243:47:f61b with SMTP id
 d9443c01a7336-245ef239393mr37196975ad.45.1755693783846; 
 Wed, 20 Aug 2025 05:43:03 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51b3dfsm25962545ad.142.2025.08.20.05.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 05:43:03 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 20 Aug 2025 20:42:29 +0800
Message-ID: <20250820124238.3785621-5-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820124238.3785621-1-shengyong1@xiaomi.com>
References: <20250820124238.3785621-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sheng Yong If one cp is invalidate, set CP_FSCK_FLAG
 to allow fsck_verify() to fixing cp at the end of check. Signed-off-by: Sheng
 Yong --- fsck/f2fs.h | 6 ++++++ fsck/mount.c | 11 ++++++++--- 2 files changed, 
 14 insertions(+), 3 deletions(-) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.181 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
X-Headers-End: 1uoi9q-0003m0-Nr
Subject: [f2fs-dev] [PATCH v3 04/13] fsck.f2fs: fix invalidate checkpoint
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

If one cp is invalidate, set CP_FSCK_FLAG to allow fsck_verify() to
fixing cp at the end of check.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fsck/f2fs.h  |  6 ++++++
 fsck/mount.c | 11 ++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 4c6c0c48b9ee..a4888a817284 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -346,6 +346,12 @@ static inline __u64 cur_cp_crc(struct f2fs_checkpoint *cp)
 	return le32_to_cpu(*((__le32 *)((unsigned char *)cp + crc_offset)));
 }
 
+static inline void set_ckpt_flags(struct f2fs_checkpoint *cp, unsigned int f)
+{
+	unsigned int ckpt_flags = le32_to_cpu(cp->ckpt_flags);
+	cp->ckpt_flags = cpu_to_le32(ckpt_flags | f);
+}
+
 static inline bool is_set_ckpt_flags(struct f2fs_checkpoint *cp, unsigned int f)
 {
 	unsigned int ckpt_flags = le32_to_cpu(cp->ckpt_flags);
diff --git a/fsck/mount.c b/fsck/mount.c
index 1fe2b110942b..c671811941ad 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1359,8 +1359,11 @@ void *validate_checkpoint(struct f2fs_sb_info *sbi, block_t cp_addr,
 		return NULL;
 
 	cp = (struct f2fs_checkpoint *)cp_page_1;
-	if (get_cp(cp_pack_total_block_count) > sbi->blocks_per_seg)
+	if (get_cp(cp_pack_total_block_count) > sbi->blocks_per_seg) {
+		MSG(0, "\tInvalid CP pack block count: %u\n",
+		    get_cp(cp_pack_total_block_count));
 		goto invalid_cp1;
+	}
 
 	pre_version = get_cp(checkpoint_ver);
 
@@ -1424,14 +1427,16 @@ int get_valid_checkpoint(struct f2fs_sb_info *sbi)
 			sbi->cur_cp = 1;
 			version = cp1_version;
 		}
-	} else if (cp1) {
+	} else if (cp1) { // cp2 is invalidate
 		cur_page = cp1;
 		sbi->cur_cp = 1;
 		version = cp1_version;
-	} else if (cp2) {
+		set_ckpt_flags(cp1, CP_FSCK_FLAG);
+	} else if (cp2) { // cp1 is invalidate
 		cur_page = cp2;
 		sbi->cur_cp = 2;
 		version = cp2_version;
+		set_ckpt_flags(cp2, CP_FSCK_FLAG);
 	} else
 		goto fail_no_cp;
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
