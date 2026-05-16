Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL3RHrLpB2pFOQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 05:51:14 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE6555A136
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 05:51:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=En9mEcQXnvtLdUKNxhE5/TxlFBNm7A3PjeSUJF9bEso=; b=ZwHdIO2TkdbSgB6L1pURRQz/Ar
	lAOsjIcjjULUQ2FD6/N0gqgX9IApQTmgQ+ruDVd1LR0eg2lnek+U5ZKuzRz+giV9L9sfWkE1yMD4a
	mui1MiWQo3D9nvVnDMJPNICtstpVNq2JqggWKtNWFsQ1AJyChLarP1rhWFMVOypk8XZ4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wO63E-0007Sa-Lw;
	Sat, 16 May 2026 03:50:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ziyuzhang201@gmail.com>) id 1wO62g-0007S2-Rf
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 May 2026 03:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D3InZjJXzh6o9PPA8Dqvz6fSczpvregHfJlC221mW1Y=; b=OvpLmDlBZFd91xwqY+qTxZRLgs
 0as2Qjiyhqb24uyn9EzcHtg4vcM7vTJsyJtbIcxIcMrTeqHfv61iWT3l36IxtAZvUztuJqreaRi5j
 Rb3Wba6qW4Kwmitvose+96JwjqLrDC2Ff1M7EbRcY1UXZ1DAeG1TH7F3qKEOuyCgUwSo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=D3InZjJXzh6o9PPA8Dqvz6fSczpvregHfJlC221mW1Y=; b=V
 hJ9AupTnhktCcgS+Y/YmbHd9yKyDiAI9QMZo0pPtZZfPdmBC8DasmMPSAblvBdvBQ0kGlAbwWlzyV
 WjV2OcBcBkdP2LOB1N1wZmLfnbdu0BtNtl2dip/BLUa/8xbNej+bUlRjQonIFZfCLSTXHwpa+WOy+
 iCtA03PRbnMinW2w=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wO62f-0005RB-Un for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 May 2026 03:50:22 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2bd5b3f8a98so1001445ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 20:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778903412; x=1779508212; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D3InZjJXzh6o9PPA8Dqvz6fSczpvregHfJlC221mW1Y=;
 b=ZTLXlpnzBfFYKbFlK0vIcVJQt9QBFkfH44/ybG2ov3uvJSTeC0xYgTGTK9MmXUUE8m
 8T36n6ysSU3OFQFZTThizbIpi8Em48qBX88iRghuF8My5JjjNtaibACzlutoJfTjKUiN
 MkQJBSsgvy77mtXdJ5BbCECfd4PCdn9CSV+dd10Zd5LBlMy1zivQbLnwyToyET4kYdfV
 pBLUr3M8yY0hLTLtAVNt6WTom1HTR5oRVeamI1oftlE9Lp/oFau5xpCuTUA41xGhXFgy
 XZx4tModVERrK7Z8qOGcPatztHQqnqoqB1ITU/FSnFfVGGeDZOJta5rdV/D/46H1lrN3
 fJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778903412; x=1779508212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D3InZjJXzh6o9PPA8Dqvz6fSczpvregHfJlC221mW1Y=;
 b=IijSd+esOj5djfN+mXEFX9DmMzwp2a0drqqXo3PHwaySXoOUUZ024/Cc2mgWcF8JKY
 3VU9K6S068v8OCUP6OdmesKJ7H1ELz51FIlRmqg05yRuX0OpBURX5M502r9MGimznctF
 a+L+ABB7IIP/22gRbLeo29+6bBnkgZ6hUou5kvX/uTbdhabIObX7XpHK+rSi2pPPYLvq
 re8pBwBcVVUEp1AqqK4DztsfVcw00+9Xz0dCACD10d4m8PwHF4Rys0fD2oPYIkvnIEaL
 LSafR8+0HP5uXWs02Lc5KPx6v2L1Z+8PPNZ1NEge/lJMRnJO3hoQZyc3n4SWdLNQvajz
 Zs/g==
X-Gm-Message-State: AOJu0YzhhCZAROokJoHdNCldTIi7rTGpPFq0rYGKZC/JCreBjLwPMwzJ
 UwbB80fW3CZcKPX5HbyX+cqWTy31uITW42GEdYqx8bDHCIVqW5xZc63P
X-Gm-Gg: Acq92OFgXkoghLFt1LcP6vMnbjtQAPCHcKbQNY01w2xl2B8WSPXcSAGktbSdU6PvZt+
 F8YzvkHLQ78DPGu/4iywg771KPouPGbAbTT0I4BXh36y5eZljJZQUoRDZVoMjbn2NNpFHy8RhlB
 CXK1z/SFFDuXAf91cYgCUSZXvIOGRrFec3qdZwkCZQz6/jy6t51fsrGqvR/1Xad0op2a5/jxUrp
 iYkRrujenWsBHyvIpXdsM8iUQv8IEhcToKwjd5fGZUkV8wiHEEchkzACIPvWlM+HubMQ9q9xjVl
 CYqCikg6yBRIubvzRqEhCvlaq/W95rraJw+0rLxBlKoh64iY5PRlsMaUROA0LJiiYsAL9QyZhYt
 ye3qMEM3nthb/m9FvGuEBKpFjbCnmbaW4Fz7zvr0hh875Tj+UhEAx8ZQJxw6GLUCGtY+ULMCUyz
 b4NCOK9KZv1R1K2p3L+IjZGbXLWCeYvWRt73E2qRqaWA==
X-Received: by 2002:a17:90a:fe17:b0:369:7421:8926 with SMTP id
 98e67ed59e1d1-36974221529mr267195a91.7.1778903411654; 
 Fri, 15 May 2026 20:50:11 -0700 (PDT)
Received: from b330-MS-7D46.. ([122.192.219.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-369512424a6sm5491095a91.1.2026.05.15.20.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 20:50:11 -0700 (PDT)
From: Ziyu Zhang <ziyuzhang201@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sat, 16 May 2026 11:50:01 +0800
Message-ID: <20260516035001.272335-1-ziyuzhang201@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: gc_thread_func() tests gc_th->gc_wake and then clears it with
 separate plain accesses. sysfs gc_urgent writes set the same flag and wake
 the GC thread. If a sysfs writer stores true between the GC thr [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [ziyuzhang201(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ziyuzhang201(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wO62f-0005RB-Un
Subject: [f2fs-dev] [PATCH] f2fs: make gc_wake test-and-clear atomic
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
Cc: gality369@gmail.com, zhenghaoran154@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, baijiaju1990@gmail.com,
 zzzccc427@gmail.com, Ziyu Zhang <ziyuzhang201@gmail.com>, r33s3n6@gmail.com,
 hanguidong02@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: AAE6555A136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ziyuzhang201@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:gality369@gmail.com,m:zhenghaoran154@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:baijiaju1990@gmail.com,m:zzzccc427@gmail.com,m:ziyuzhang201@gmail.com,m:r33s3n6@gmail.com,m:hanguidong02@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziyuzhang201@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

gc_thread_func() tests gc_th->gc_wake and then clears it with
separate plain accesses. sysfs gc_urgent writes set the same flag and
wake the GC thread. If a sysfs writer stores true between the GC
thread's load and store, the later store false can clear the new wake
request.

Store gc_wake as an atomic_t. Use atomic_read() for the wait
condition, atomic_xchg(..., 0) in the GC thread, and atomic_set(..., 1)
in the sysfs trigger paths. This makes the consume-and-clear operation
atomic with respect to new wake requests: a set before the exchange is
consumed by the current iteration, while a set after the exchange stays
pending for the next wait.

Fixes: d9872a698c39 ("f2fs: introduce gc_urgent mode for background GC")
Signed-off-by: Ziyu Zhang <ziyuzhang201@gmail.com>
---
 fs/f2fs/gc.c    | 7 +++----
 fs/f2fs/gc.h    | 2 +-
 fs/f2fs/sysfs.c | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 098e9f71421e..71e40e4083ad 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -49,15 +49,14 @@ static int gc_thread_func(void *data)
 		wait_event_freezable_timeout(*wq,
 				kthread_should_stop() ||
 				waitqueue_active(fggc_wq) ||
-				gc_th->gc_wake,
+				atomic_read(&gc_th->gc_wake),
 				msecs_to_jiffies(wait_ms));
 
 		if (test_opt(sbi, GC_MERGE) && waitqueue_active(fggc_wq))
 			foreground = true;
 
 		/* give it a try one time */
-		if (gc_th->gc_wake)
-			gc_th->gc_wake = false;
+		atomic_xchg(&gc_th->gc_wake, 0);
 
 		if (f2fs_readonly(sbi->sb)) {
 			stat_other_skip_bggc_count(sbi);
@@ -214,7 +213,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 		gc_th->boost_zoned_gc_percent = 0;
 	}
 
-	gc_th->gc_wake = false;
+	atomic_set(&gc_th->gc_wake, 0);
 
 	sbi->gc_thread = gc_th;
 	init_waitqueue_head(&sbi->gc_thread->gc_wait_queue_head);
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 24e8b1c27acc..65e5b062a0d3 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -56,7 +56,7 @@ struct f2fs_gc_kthread {
 	unsigned int no_gc_sleep_time;
 
 	/* for changing gc mode */
-	bool gc_wake;
+	atomic_t gc_wake;
 
 	/* for GC_MERGE mount option */
 	wait_queue_head_t fggc_wq;		/*
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index f736052dea50..6ca5943450d5 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -586,7 +586,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		} else if (t == 1) {
 			sbi->gc_mode = GC_URGENT_HIGH;
 			if (sbi->gc_thread) {
-				sbi->gc_thread->gc_wake = true;
+				atomic_set(&sbi->gc_thread->gc_wake, 1);
 				wake_up_interruptible_all(
 					&sbi->gc_thread->gc_wait_queue_head);
 				wake_up_discard_thread(sbi, true);
@@ -596,7 +596,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		} else if (t == 3) {
 			sbi->gc_mode = GC_URGENT_MID;
 			if (sbi->gc_thread) {
-				sbi->gc_thread->gc_wake = true;
+				atomic_set(&sbi->gc_thread->gc_wake, 1);
 				wake_up_interruptible_all(
 					&sbi->gc_thread->gc_wait_queue_head);
 			}
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
