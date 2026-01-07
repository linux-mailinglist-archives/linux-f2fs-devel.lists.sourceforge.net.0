Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC07CFDE08
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 14:16:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wtjCK5RpRvzCAgRRaCUwrxj4x9w1306vycL8kt0LYA8=; b=O4rzzBZuZKmbZMWm6wr6nEhGWf
	odScY3pgZV/LZiM23VHdD/4g5QvIv/OZL+biyyKHeegNyH3Czhe8U6xVIs3o1pMAnFYDIDmZa/Zuu
	QlUEW0ovHW1OmxRnyjuCaSPOwxBF7Sj4zI3JMnXP2wz6dod0tkilaA9MxwKfqchNjIyI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdTOS-0005oj-U3;
	Wed, 07 Jan 2026 13:16:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1vdTOS-0005od-7N
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 13:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZSHqYeQSKnx6x9FQBtMTTpKdtaW1XbhO6OR3FPxiZjc=; b=KthcWEOKL2HnWGRzBjKto818of
 tey8Ik2qdZZGnameyed2KVZSdTUmeLIDycsCTHOOqqYt8P8sRuV4nnuJzGjzQ2XAQeilZNqNknTlm
 FOKolB2LoSalXYhPiDe07U41zgnt0dAGBHev+0bHdxV57USK7v2MLMjTpDZp/TK5jvtI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZSHqYeQSKnx6x9FQBtMTTpKdtaW1XbhO6OR3FPxiZjc=; b=e
 3kwrE6Tycnd9b9pO/veS906hxK1PUQqQl16Cuba1h9o9EcVepbFmOb5wS7vd4Dq5XKLJFfIdMpIuf
 pGhGm625/yDKTFrmWIItgTPxIOWRyPcYbTKIA7N/ZAsVinNK6yJ0TBJHrCHtDt/21pWVSYwbIGwjb
 fPOOKzOF4kvr6SS8=;
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vdTOR-0007vm-Qx for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 13:16:08 +0000
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-bf5ac50827dso1034610a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Jan 2026 05:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767791757; x=1768396557; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSHqYeQSKnx6x9FQBtMTTpKdtaW1XbhO6OR3FPxiZjc=;
 b=l13RMJ/e/Q0h6PGKb8ED7xnvPCdgcEOTnNZV7XQTk3F8cgMrl93NEjFJn7vcWXu8QB
 +rmHsvWgQkltMHkB+EGIzgJ7H68qVM14hSa6n89PhR28nTmgIeWVq6mjU1t5XU6lYxyt
 31E+RE0wVEUlzxpP5l4mLKTMsIVBsp7iKJZtcRk0VJQ+3Jdt8kUYoajrlef6vCAcGtyI
 EkhqlPCOCY/rj6FB1Vqpd2agu7y8ec+jz76cX5gT3VVWsg9F8ShHiCdg4xqlKQiaSGW2
 UUK+/wWlTD8RyY85wYVTXPKgswZ31fJslFmW2n+TG5Lhwj5/aPrAg33bobb6zkLXy+GF
 6YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767791757; x=1768396557;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZSHqYeQSKnx6x9FQBtMTTpKdtaW1XbhO6OR3FPxiZjc=;
 b=tgzEfH07lhOKZQpSIBviItVZkBKmW60z4R2j/PtVzEpVW8OseTF4F0cZrq1tvGRC+y
 IV7NDtiX+NLLGlzjs6kTsNtV7dAEQNQRu4B9Yw30amT17POK1E05zdVlBkupSz0Mrp3J
 MUSGGjtWQvdMOLqERwaJEp9pSl0CM4dCh5XnwKdnlNpRqDg4fYupZwCJNveXUre1MukN
 CKx+p4TQk7h55rONJ373j8EjCtd1KgwKhbN5sRDbVh12aMymTOBxhBenSPoQBTfL0+IG
 Y+hsWrzjgtR+AWo50lpaGUEGhqf/TnEtr9kqMlomnAvkqdwA75SFtuHwu2xR16GxAYss
 ofNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5o25zmP0yfUEtZ4NL3TZl9O7A9W3Xlntf1Lwxma2UT7YE6XW4e9SsWGxlwfMdImcsrVhVg5dRC+QMjaSzPxcw@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz3/qY4UEcrSXk79HmFgjNGzmPBPEZzE/bRGEwWENU+uTx2i+7Q
 5ixkrA0n1OwvspycYnmBmy7jFO8kk2nSNg6uRsos2gBg84j27aS5PE6lilY86w==
X-Gm-Gg: AY/fxX6n1bbHtFDQfGBQT75pB4H/+/KFWQLca6pS+ivY551tf+30Yw6S0u/jpYyM91K
 dUdlTz8y4DQX64J3m7FLzUtpfhHR0nP7+GQrxR9jMToN4cmejy5bsMt32p1UT8l0NUpXbcwAbuR
 m8dFLQtCgfwkpZgGl5sBiXV0d8sHtqDcDkgKtSKeOzGDPl+h3nnMpQMO5PR43TaaWcrW9OzztJT
 Eq06mzFL8DxjKlCJTEBQPMYzGZvMoGPVEiW8oSfTorvwJpmYtwQUYKsLDutwTZGkw8C9lZY4srN
 unBxjcUDqT5g6dkRhwoZNG4r6A4EXc2QJgqUxj196IcBPNRU0rZFXQ0pjWz0k7K4aLB/mX1Gfcm
 OzxQu3i+bGsrOgLZg2A+GAuYKU8J068D/CJ2/+9Yd/s97+tCQysLszcJI9Jc56HBQLe2R886o84
 5xD/ZCQZFuePRYa1nM
X-Google-Smtp-Source: AGHT+IG1GcfAlJv1wRmyA56K+Sa+tdhLqcYTe683RamyP9CY2dHXQcnlMJHIe090arjExrdVY63V4w==
X-Received: by 2002:a05:6a21:99a9:b0:33f:df99:11e5 with SMTP id
 adf61e73a8af0-3898f906dadmr2189954637.28.1767791756992; 
 Wed, 07 Jan 2026 05:15:56 -0800 (PST)
Received: from mi.mioffice.cn ([2408:8607:1b00:8:8eec:4bff:fe94:a95d])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cca06b77bsm5305668a12.33.2026.01.07.05.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 05:15:56 -0800 (PST)
From: liujinbao1 <jinbaoliu365@gmail.com>
To: jaegeuk@kernel.org
Date: Wed,  7 Jan 2026 21:15:43 +0800
Message-Id: <20260107131543.3492385-1-jinbaoliu365@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: liujinbao1 During the f2fs_get_victim process, when
 the f2fs_need_rand_seg is enabled in select_policy, p->offset is a random
 value, and the search range is from p->offset to MAIN_SECS. When segno >=
 last_segmen [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [jinbaoliu365(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [jinbaoliu365(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vdTOR-0007vm-Qx
Subject: [f2fs-dev] [PATCH] [PATCH] f2fs:Fix incomplete search range in
 f2fs_get_victim when f2fs_need_rand_seg is enabled
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
Cc: jinbaoliu365@gmail.com, liujinbao1 <liujinbao1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: liujinbao1 <liujinbao1@xiaomi.com>

During the f2fs_get_victim process, when the f2fs_need_rand_seg is enabled in select_policy,
p->offset is a random value, and the search range is from p->offset to MAIN_SECS.
When segno >= last_segment, the loop breaks and exits directly without searching
the range from 0 to p->offset.This results in an incomplete search when the random
offset is not zero.

Signed-off-by: liujinbao1 <liujinbao1@xiaomi.com>
---
 fs/f2fs/gc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 384fa7e2085b..100b8fc3e65a 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -781,6 +781,7 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 	unsigned int valid_thresh_ratio = 100;
 	bool is_atgc;
 	int ret = 0;
+	unsigned int original_offset;
 
 	mutex_lock(&dirty_i->seglist_lock);
 	last_segment = MAIN_SECS(sbi) * SEGS_PER_SEC(sbi);
@@ -799,6 +800,7 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 	p.min_segno = NULL_SEGNO;
 	p.oldest_age = 0;
 	p.min_cost = get_max_cost(sbi, &p);
+	original_offset = p.offset;
 
 	is_atgc = (p.gc_mode == GC_AT || p.alloc_mode == AT_SSR);
 	nsearched = 0;
@@ -859,11 +861,11 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 				p.offset / p.ofs_unit);
 		segno = unit_no * p.ofs_unit;
 		if (segno >= last_segment) {
-			if (sm->last_victim[p.gc_mode]) {
-				last_segment =
-					sm->last_victim[p.gc_mode];
-				sm->last_victim[p.gc_mode] = 0;
+			if (original_offset != 0) {
+				last_segment = original_offset;
 				p.offset = 0;
+				if (sm->last_victim[p.gc_mode])
+					sm->last_victim[p.gc_mode] = 0;
 				continue;
 			}
 			break;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
