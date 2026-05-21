Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IADFC5/gDmqKCwYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 12:38:23 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C445A3700
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 12:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jP4hUJ7fs+HMMfpSk+5hItR7E7gk/Kv3i7Hxg0JJb68=; b=TZD6jpJpf08StZJ4gIpLT/o1X1
	eT+OlvUHTkBEFKTuqT6tAfnz+HcX79engmmXKqWg47FuiLVE+ytaEMLY0WncoSXNgNOyMOeYgC7jd
	SdzCbIGdBWaK8aoEdEan1gJj3Qn5wf/mCHcEZZ92wSAlT/MNYX9p0HQD1nfV9KX10Htc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQ0n7-0003UT-WF;
	Thu, 21 May 2026 10:38:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wQ0n5-0003UJ-ID
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 10:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bX9jxgAxFaBc5uY2GbAKfiZoFYnFAq+cwQmmEbrvRP4=; b=KX8iFUKE6hBqY56DAilSzparzw
 YzBC3eXZZzvjWVeLHp1nZSrQmZPyUNOiuJb7BLzUssnMw8tzWgnMFVHdhJoyCEJxmQnoaC4plav3q
 22pHtQU19F0O1aCYe6zfPLbFJde0ez82VGiBMwoBdEggLePINM+jOBt3b170B7kLehDI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bX9jxgAxFaBc5uY2GbAKfiZoFYnFAq+cwQmmEbrvRP4=; b=d
 uwaJVtXcXclG9KcgZQlbN6+nBRkXXVJBJ7HYWuiynytWToAjh+6kNjNY9ppc+W5U/9AUN9+X4tXLA
 Dc2uirKA4k/33rsIiDowrKwoY0VwtXRA/K+p8TPocvK7q3UnGvF07uhCSvWoZ760ByvNQONdGlsND
 HAtwENNN9gNjXUpc=;
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wQ0mz-0007kz-4b for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 10:38:09 +0000
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-8379e010b01so2575017b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2026 03:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779359875; x=1779964675; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bX9jxgAxFaBc5uY2GbAKfiZoFYnFAq+cwQmmEbrvRP4=;
 b=BeP1c0gYAa7bBgO4PB7FOQm3UWnQmCWl3SRU63Dnv4/sD0gXfH9y83W0CPL3Q3WHys
 YsXcjseF4nBRZsdIBWlUBoA3yRp4p1Zot2DpzHl6aLdhQMrAgZDtDF6kTlm3DDl1AZuk
 eEiTkJIsWlGrF3LuYW4pkvdN1OGx57XVqdNrbxbnADhi0dNWLdFvUqZ4oz6RPCkshNSa
 zXP7JwrfhcOnRbvxRQ+5JtLJGio/KKuBSguRUz4SFzG0MevIQuB71Je8MHnqTKyvBvG7
 WQXkHCwAzVcy/EHkCfAhBMJF/vd3uzMBvhqNveR0m+k9yNIQX3Buxy69vnuQjoiLYqaw
 GCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779359875; x=1779964675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bX9jxgAxFaBc5uY2GbAKfiZoFYnFAq+cwQmmEbrvRP4=;
 b=r23hcKVSkh221ca0eB1N4YP/NiIzNJ3S43f/hkgzQW1a8BTqYfrReQCaMeS1BMgBMF
 EXhAyK6iFjNtbiOEmlSeFUqgkWtxn33l4SLzsCssaaC835EXpd7pZactOnogRj6lookp
 6YlGe+FDSGI5Crpn5ZNYZZqj9dsoe7uYX609qzAWF/CME4e4TXNmoPNrE1vGNoXbndBz
 0nh6yZxalmiEUuzBjVvQBcdBHre8SZh9nZqsvfWanuGFJeL+bL0IA7AEk6XUqUV7F9UE
 6rxUJLuDbij3bWzXxDxusGYswnwMDvyDEdt/U/5Aho7FbC1EvaCyOtLvvRD5TkeH2PT4
 7eWA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/N0v79LiSuT2MJwascn75emOnP7s1HbW3jhCIWPVT9iq/M89J1RhvUn0GRurz/E6E4uFxOLQWskjwYdvIuNASh@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzlcC5niklu+zpWyRzSUD3Q9ihJwWw7it1+km490CbqD2PLpUjt
 foopOU3I0D63W7thOotGa+XoPMp4OMhnKdGGfgblXcOZHMSJ6Zidd+GA
X-Gm-Gg: Acq92OEhiXYAiiVNVvjw92Rpv+DGge0fupD1kxw6wp4Ial/WF7xlZZTpaapYzpjPgBb
 EQVVthOrWu0DHp1+3qgE1wUUqWc7b9uy2PVgts1U8hZTSYb4P2mL7x/XBTS8G0Ukj4ZFlE+5S5b
 8G303BNHIZ/k4tIM1HlJegCukF/j0sJhMWHzAmrUNfWkZWJwfUUSux3kkf84NRHPNW0SGYiYQnh
 yqFG2TJHez6LSjQUISRhtJss0HhYfocnaGbPSyBuFO9eaQ7pHYxn3WPfOHz0cfaRxjSHadRfasf
 xCpCyCEYTzv8csZQMs2pj1UxhPgdvVrEuCeaKy5O2e2en51MIO1XBBpYC49fjz8y2AGy35K5B7+
 XfZb7a3BwiWWKPywTmECsyl87m6rUe3Pq2vrLukplHiVbhfq88s1mTrlN5ebgKz2V5GZOgKIlPf
 Fy2GT59euirhaMfdHCJfPkJ5epCnJrEfaMIg4OStJOIgKosL6bPPXYbaOH9JQojosq8R2FUQ==
X-Received: by 2002:a05:6a00:1885:b0:82d:62ed:b01d with SMTP id
 d2e1a72fcca58-8414ae57e42mr2514804b3a.45.1779359874799; 
 Thu, 21 May 2026 03:37:54 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-841549c4b82sm893074b3a.3.2026.05.21.03.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 03:37:54 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 21 May 2026 18:37:48 +0800
Message-ID: <20260521103748.1954748-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: F2FS records image errors and checkpoint-stop reasons through
 the same s_error_work worker. The ordinary f2fs_handle_error() path only
 updates s_errors, but the worker still calls fserror_report_shutd [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wQ0mz-0007kz-4b
Subject: [f2fs-dev] [PATCH v2] f2fs: avoid false shutdown fserror reports
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
Cc: qwjhust@gmail.com, linux-kernel@vger.kernel.org, qiwenjie@xiaomi.com,
 stable@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:linux-kernel@vger.kernel.org,m:qiwenjie@xiaomi.com,m:stable@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,xiaomi.com,kernel.org,lists.sourceforge.net];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email]
X-Rspamd-Queue-Id: 72C445A3700
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

F2FS records image errors and checkpoint-stop reasons through the same
s_error_work worker.  The ordinary f2fs_handle_error() path only updates
s_errors, but the worker still calls fserror_report_shutdown()
unconditionally after committing the superblock.

As a result, a metadata corruption report can be followed by a synthetic
FAN_FS_ERROR event with ESHUTDOWN and an invalid superblock file handle,
even though no stop reason was recorded.

Track whether save_stop_reason() actually changed the stop_reason array
and only report the shutdown fserror for that case.  Pure s_errors updates
still commit the superblock, but no longer generate a false shutdown event.

Fixes: 50faed607d32 ("f2fs: support to report fserror")
Cc: stable@kernel.org
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes in v2:
- Add Cc: stable@kernel.org.
- Add Reviewed-by tag from Chao Yu.

 fs/f2fs/f2fs.h  | 1 +
 fs/f2fs/super.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f0a54883b882..fffb516b78f4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1990,6 +1990,7 @@ struct f2fs_sb_info {
 	unsigned char stop_reason[MAX_STOP_REASON];	/* stop reason */
 	spinlock_t error_lock;			/* protect errors/stop_reason array */
 	bool error_dirty;			/* errors of sb is dirty */
+	bool stop_reason_dirty;			/* stop reason of sb is dirty */
 
 	/* For reclaimed segs statistics per each GC mode */
 	unsigned int gc_segment_mode;		/* GC state for reclaimed segments */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ada8098f8b33..718feb854b18 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4616,6 +4616,7 @@ static void save_stop_reason(struct f2fs_sb_info *sbi, unsigned char reason)
 	spin_lock_irqsave(&sbi->error_lock, flags);
 	if (sbi->stop_reason[reason] < GENMASK(BITS_PER_BYTE - 1, 0))
 		sbi->stop_reason[reason]++;
+	sbi->stop_reason_dirty = true;
 	spin_unlock_irqrestore(&sbi->error_lock, flags);
 }
 
@@ -4623,6 +4624,7 @@ static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
 	unsigned long flags;
+	bool report_shutdown = false;
 	int err;
 
 	f2fs_down_write(&sbi->sb_lock);
@@ -4634,6 +4636,10 @@ static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
 		sbi->error_dirty = false;
 	}
 	memcpy(raw_super->s_stop_reason, sbi->stop_reason, MAX_STOP_REASON);
+	if (sbi->stop_reason_dirty) {
+		report_shutdown = true;
+		sbi->stop_reason_dirty = false;
+	}
 	spin_unlock_irqrestore(&sbi->error_lock, flags);
 
 	err = f2fs_commit_super(sbi, false);
@@ -4644,7 +4650,8 @@ static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
 			"f2fs_commit_super fails to record stop_reason, err:%d",
 			err);
 
-	fserror_report_shutdown(sbi->sb, GFP_NOFS);
+	if (report_shutdown)
+		fserror_report_shutdown(sbi->sb, GFP_NOFS);
 }
 
 void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag)

base-commit: 520760b9f9156bf9698de38dc44c614fad68a1f9
-- 
2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
