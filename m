Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id igQjJ9VhM2rT/wUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2026 05:11:17 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7AF69D378
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2026 05:11:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=VWwHW+Sn;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="Z0/6rMmn";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="R Laoudt";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=pJkEE8B8;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gkKyRrN0skkSWqmSV7z5rj/zlesfz3mmr7lLf11TI6M=; b=VWwHW+Sn4oQiKEbMCBFiz0LWTF
	75DneDW6aaXUIUz48pRaRpK4dXbUf/w0Vo0FVwwAZ6n4epkAnLJvOm42icq+Gqx7ryNYy6GKaHFSV
	n5/XahwHgdIkaw3rCfYUSg3urVY3twbO8vyzcp0wuqSobrc+BCa5w4ND/0t/MV/y+dUs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wa39l-0007wN-Pl;
	Thu, 18 Jun 2026 03:11:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wa39K-0007vi-LX
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Jun 2026 03:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M8Kg1mc083x8JX2hv995NqUUghKcte7werBgnQTU6Co=; b=Z0/6rMmn3dLr3TRtac/ufn+PtE
 oCQfnheimt2r5ZOs0MQxDS93ctPSL6bnB7EYCq5aRnf/ri/eSU6zUbv/YFzJDj6qnjvfBGC2Dmct/
 m9qUKhIuMP8/eS1zzqpiC61lGuruXav8wYqzv4tvBuD/ll/UIzcLd0gp8mi/HUPeYWKM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=M8Kg1mc083x8JX2hv995NqUUghKcte7werBgnQTU6Co=; b=R
 LaoudtM0NxNUwz29xb1Wz5A3qAu4KGXEkv9Nve3kZU46OUcmcEN20cavP/tkG+8j7YnWmRbuRN0dG
 avuSxVVKAQ4TJWSxg8Sy75g60WypNiiN9eC+wGbcdX9IUGBnJPqtqoplDnsx+pEWqsmn9uhfq77fh
 WZhXmfJ2NgfioX28=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wa39G-0006Hw-Bw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Jun 2026 03:10:36 +0000
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-842358aaf36so143544b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jun 2026 20:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781752224; x=1782357024; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M8Kg1mc083x8JX2hv995NqUUghKcte7werBgnQTU6Co=;
 b=pJkEE8B8Rq4lpfL+QIzoL+VBi+en/vG20oD9b2XTs3bD5lvXf+CQUmvXlP0d0bIbH9
 gWRj9ExwbYCFOyngyIC/Ekj0PQurtPmAZROjAUslu9hBGShzkUikgI1UKrIVTcMuqdYv
 y2wI71z72va5UkEMCNlIjLru/femFBgMsTgqhhRNuKUtb8QA9J02gN4Essh0UiNA6id6
 H4I0psPwZHV9rOfLpHodNHfpIcPIbiFLrHP4/ckO7a+LbNhCspu199yRxbXsSGG883Y8
 zpwLHA63Mifjf89jQtDxT0feJh8AWXUA//en6wkmsF8jLzNCNh2FBUhZDyJvISDRpLlc
 0uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781752224; x=1782357024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8Kg1mc083x8JX2hv995NqUUghKcte7werBgnQTU6Co=;
 b=KZh4Bn4apEwWegRuyywyZU7yruibLiMVvi49WL0K2XsSC495hrQ9kclWPwHJ9xQjv/
 8Jia7AJE5leq7w++h+Y8LFgvCru+ASYyQkA4g2wIexLRDNGHUhOpUGrZXgda4TG5b58k
 u0VDT1vW/BKMeYB3mtZfNv17ijB8pAYhlFzM64vwVYORL3xhsN0aVKU+Q5AkK13rb+05
 IvfmJay1p/7bDpSfm9g/19YNGuP2BKHBAZsyCjhQINSsAURQzJO35s00NeSBZ3hgM3+7
 7OJQdlba3aAHRdotroNE0fS17woyXNUae42sW1b9eTONcEY5VuZZLFcAcUzaIIReYCcU
 H+oQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/9pE6GwlqaBoEyaWPWCDJQvA/iAGRt1FsjtwDT7idImMGNT7l8HeZwk3VepRLwxHkiCFm9DvnbA2uhGmfORyhW@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx69hsQ00JPX0AUzRDMWkvzOnPupE/h0zU8kBsMb5zRcX6gTL6X
 v5wHP9/JDRY2Mt+KSsKGY2ir9D69rA7vPh0I3uM6pdCBN0TKiMgtUBA5
X-Gm-Gg: Acq92OEneDobai3wXJWjKw7w8zFY4lhBUP1R6dlS6syAaOUC1/6v0VwrCbOI9PSAtl5
 BQZ5iPCai8kz9ZpSpnTMW6sxbA5uRf27uyIH3KYy04wBGCBzrgpph4JFr7uHgga6F1uE+9xzNg1
 fSJSJ56hy3uWkRBNB1KfYO6fmRjCo8rJrbmav8sC7IEHCrj7wRcRZEBp73ur0R7gwINKr4bNpVf
 Gbr2eruGP5fsNvHr0BYr8yNsPszuOdtMBr434+klYUd47lv3IPSUZzxogLwXn/mlZkRwbjl1DZQ
 WGgV8mYL9BiGZnYSRi5LaDBrmZEd2eGfORBzyUjLKnv6w+JtLvz8pY05zyffWWMcWxgi+1+fEIj
 PaxppCSjm6pdganabluaQ7J5e+MlpALUh5IQfPEnzDV3WHrgmqgNM/FDOTshaJM3T+9eWisKuuN
 0ZWawjrBh+AiLM88xJO03sFfx4tYPCF0WqO3XNl4uji758gX4E
X-Received: by 2002:a05:6a00:3a23:b0:842:678a:a7dc with SMTP id
 d2e1a72fcca58-8453b0dabf7mr1852187b3a.2.1781752223623; 
 Wed, 17 Jun 2026 20:10:23 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8434afc8a90sm16936349b3a.28.2026.06.17.20.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 20:10:23 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 18 Jun 2026 11:10:08 +0800
Message-ID: <20260618031008.2447279-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_write_end_io() decrements the writeback page counter
 and then reads it again with get_pages() to decide whether the last
 F2FS_WB_CP_DATA
 completion should wake cp_wait. That second read can race with a new CP-data
 writeback submission. If this completion drops the counter to zero, but another
 thread increments it again before get_pages() runs, the zero transition is
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wa39G-0006Hw-Bw
Subject: [f2fs-dev] [PATCH v6] f2fs: use post-decrement count for cp_wait
 wakeup
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
Cc: geoo115@gmail.com, qwjhust@gmail.com, yangyongpeng@xiaomi.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, qiwenjie@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:geoo115@gmail.com,m:qwjhust@gmail.com,m:yangyongpeng@xiaomi.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,vger.kernel.org,lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA7AF69D378

f2fs_write_end_io() decrements the writeback page counter and then reads
it again with get_pages() to decide whether the last F2FS_WB_CP_DATA
completion should wake cp_wait.

That second read can race with a new CP-data writeback submission.  If
this completion drops the counter to zero, but another thread increments
it again before get_pages() runs, the zero transition is missed and a
checkpoint waiter can keep sleeping until the timeout.

Use the post-decrement value for F2FS_WB_CP_DATA completions so the wakeup
decision is tied to this completion.  Keep the existing dec_page_count()
path for other writeback counters.

Fixes: e234088758fc ("f2fs: avoid wait if IO end up when do_checkpoint for better performance")
Fixes: ce2739e482bc ("f2fs: fix to avoid UAF in f2fs_write_end_io()")
Cc: stable@vger.kernel.org
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/data.c | 12 +++++++-----
 fs/f2fs/f2fs.h |  6 ++++++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d83a21998ec2..2afdcd209d54 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -392,15 +392,17 @@ static void f2fs_write_end_io(struct bio *bio)
 		if (f2fs_in_warm_node_list(folio))
 			f2fs_del_fsync_node_entry(sbi, folio);
 
-		dec_page_count(sbi, type);
-
 		/*
 		 * we should access sbi before folio_end_writeback() to
 		 * avoid racing w/ kill_f2fs_super()
 		 */
-		if (type == F2FS_WB_CP_DATA && !get_pages(sbi, type) &&
-				wq_has_sleeper(&sbi->cp_wait))
-			wake_up(&sbi->cp_wait);
+		if (type == F2FS_WB_CP_DATA) {
+			if (!dec_page_count_return(sbi, type) &&
+			    wq_has_sleeper(&sbi->cp_wait))
+				wake_up(&sbi->cp_wait);
+		} else {
+			dec_page_count(sbi, type);
+		}
 
 		folio_clear_f2fs_gcing(folio);
 		folio_end_writeback(folio);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9f24287de4c3..db750cef371d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2776,6 +2776,12 @@ static inline void dec_page_count(struct f2fs_sb_info *sbi, int count_type)
 	atomic_dec(&sbi->nr_pages[count_type]);
 }
 
+static inline int dec_page_count_return(struct f2fs_sb_info *sbi,
+					int count_type)
+{
+	return atomic_dec_return(&sbi->nr_pages[count_type]);
+}
+
 static inline void inode_dec_dirty_pages(struct inode *inode)
 {
 	if (!S_ISDIR(inode->i_mode) && !S_ISREG(inode->i_mode) &&

base-commit: c0b65f6129c7fbb526e921dd60261650f1b2bef9
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
