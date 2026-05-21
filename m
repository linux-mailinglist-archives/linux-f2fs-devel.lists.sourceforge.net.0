Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP5MD66YDmoxAgYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 07:31:26 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7991059F0F6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 07:31:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FTluG72FrTboOEKJ1pZ+PyW4ZF9i4sjeKP+GlMsal2s=; b=i+jcT6bCb2h6zyWm60R9643zIh
	sep4x6+JHlmikMe85gPN40m+/4QYgdIYPTL1O88qd002PGYd9hQa0vIVPnzuKFNITlD16y7njceth
	h29xYgJFv01EoUvW+7IC/UxG/ZiUuGPPXt7+Yk/x2WXP67NOvq9hrLe9IOA+65Hzzs8I=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPw01-0006E1-0w;
	Thu, 21 May 2026 05:31:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wPvzz-0006Du-NE
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 05:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q0PEOQd221VA2US+NtTYAbb78QjXPFIspT57cYj0TFg=; b=hC/1l1tvB3uuETFJiYt/Bwgo1Q
 tKwHZhfFXstbF1GRrioR7e2RMm6U7c/hKkwYd4hyKrwjI9MlzUwB3fvJH23Fe4OwWTLAr2zwFQegn
 K6yhoCW8BlNyQu/Fyg6yzKV4r1QETGdqWEWWmR1/lqPWR33wFCChL8jKlNZ1tT8nOwz8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q0PEOQd221VA2US+NtTYAbb78QjXPFIspT57cYj0TFg=; b=U
 cb2Bx1N5hIXs+CH08CMSj3t+eBOvmMe3tulX1pKb66AeHTqlgsld55MEBTBnvk+4P5WRjujbGmkIy
 5dYinsPPGLY8q1ZchLQv51PfXKn/Dmboezgr6K0Ju7ivx+bQZwF4ThUp24FzfbdZ+D/E3GZD3LSV1
 0GqG00RM/VN+5yQo=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wPvzw-0005cE-98 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 05:31:09 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2bc7b311e77so24994185ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 May 2026 22:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779341458; x=1779946258; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q0PEOQd221VA2US+NtTYAbb78QjXPFIspT57cYj0TFg=;
 b=q9EObjqGPVi65GItGb/8PTUGrgXti5WkCa2TJFwgLqn2WhjOH2xwJvMwB73zMCjO5a
 UqybBc+UbDgC5kN8nXgS9vGouhZCcOizXOZ4qpRckGU6ygiBVwYoJIoV+HP6+Pr13ioB
 IXy4lNO/pNLwNmyb+QrvmtmV1Wr5DcEayCm/PDByy9UMdisczIGRQfhGEQ53ZWgay+c3
 8FWT7L4Ft/VLRQdT4xFHvOY/gOdJofk6KogEa0pCdZIn9uviIT35y923TQvMkiN/LhrS
 0MzKmpG7CmarJ/jeof0fic0kN4mS12Dl4Fk8BL98lAjdqGjNOD61J6H6U1Vz6XEdM2Ue
 HoOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779341458; x=1779946258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0PEOQd221VA2US+NtTYAbb78QjXPFIspT57cYj0TFg=;
 b=BRQ9IcSshCrtyhXXytiA2mLCydUZUGpcGvU8snZmdz8oFc1tTSPAdCMszBnm+mhe+u
 PFgX+SrThcd8/7Y9116R0NFBWu6WZxUZLQr6cWBJ/+401jOBe9sPYxdGYWkoNqTOrBVH
 BVwiM2mSzfisqp6PAW8tYa9hyFwXC/z8y6DZyrKiH7xLvgefF7I888pv6fBMUQTpaSU8
 IRk8L7iQmgkKKkINTsfi2TrN/ah3OlwMzb2T+8v+wBCpPdK7/iDE8rv+zZ8MYuYvGgaz
 jTSzPx9VVKnYR4SMifltGWoxn5DDNqsiOmXiN5BuWugZxRAH8Xua7A5oicTkw5eMGyqB
 4uVQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/3MrVRVFhruj5mWJfmncL8Rr3l3W5ySO/feLwWl0hrQmyMpJuksE1uxPb/G3Yc0VEiRlX58TKD76wUxzQs2GwU@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyDgk/DZCY1Ufi8oL6/VnGwKhpzPE57BxQTSv6uPWFu86LBrt3S
 TNFSCyBS6Hu6mtReqFwhObs4K9qtWL9NVJ+us2eIGx6uOGygDP0T9Nvq
X-Gm-Gg: Acq92OHIhH7vLZQSITLWY5CCH92zxWok0LkS0cuNhAH7j92tDAn5enniL49tCFwijmu
 Yxcf2ijSyWEUP7Fve31J+7zUDN1k2F8LJ7ViDdH7PibHf9uY/jexaF10LYoI++tXRPr+4BSleZ3
 GDVKwu/gdcAIeHx0iHFum26BOI9Eh8xPibcILw+h2nKNPeA8A9zYyab30uQpJkjn3knFAbJtVWM
 y9z7u8g990Qeh7EGtFsf4DPQmYY5t1ExFpeXlapUmQ8VoRd34rrLb6YNK1QSfcAokfiePNFHKp/
 m4pzZM2oD9+j+CGBCaXpVi2RPxwUmK/jdi/Gp/gRjpcf1BGBoYS9LIR7qNpW5IKJbZD8neGb7ik
 +Hk3VB7zuolwnqOi9HJvXVeqJSoY9XtyivRdBWQ0Sh48NUwDGxt+tFkEotHIadW2/oKi5bhVRS8
 AUt4R0jtrylvGr36pzLfuNwnpgYL3pABM0WlwNCvFtZNrTht6R0loPiWzS7sH3GpRizXkUHg==
X-Received: by 2002:a17:902:fc50:b0:2b0:91e6:bc18 with SMTP id
 d9443c01a7336-2bea2641874mr13741025ad.14.1779341458019; 
 Wed, 20 May 2026 22:30:58 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5cfe47bdsm244625805ad.44.2026.05.20.22.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 22:30:57 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 21 May 2026 13:30:50 +0800
Message-ID: <20260521053050.1785858-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit fefdf0723650 ("f2fs: fix potential deadlock in
 f2fs_balance_fs()")
 added cached DATA bio submission before direct foreground GC in
 f2fs_balance_fs().
 This avoids a deadlock between writeback and GC on cached data folios. However,
 when gc_merge is enabled, f2fs_balance_fs() does not execute foreground GC
 in the caller. It wakes the background GC thr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
X-Headers-End: 1wPvzw-0005cE-98
Subject: [f2fs-dev] [PATCH] f2fs: submit cached data bios before gc_merge GC
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
Cc: qwjhust@gmail.com, qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org,
 ruipengqi3@gmail.com, linux-f2fs-devel@lists.sourceforge.net
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
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:ruipengqi3@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,vger.kernel.org,lists.sourceforge.net];
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
X-Rspamd-Queue-Id: 7991059F0F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit fefdf0723650 ("f2fs: fix potential deadlock in f2fs_balance_fs()")
added cached DATA bio submission before direct foreground GC in
f2fs_balance_fs().

This avoids a deadlock between writeback and GC on cached data folios.
However, when gc_merge is enabled, f2fs_balance_fs() does not execute
foreground GC in the caller. It wakes the background GC thread and waits
for that foreground request to finish.

That branch currently skips the cached DATA bio submission, so the same
foreground GC request can still start with cached DATA bios pending.

Move the cached DATA bio submission before the gc_merge branch so both
direct and merged foreground GC paths satisfy the same precondition.

Fixes: fefdf0723650 ("f2fs: fix potential deadlock in f2fs_balance_fs()")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/segment.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7c8ac62b1b0..1ef4edb7707 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -445,6 +445,13 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	if (has_enough_free_secs(sbi, 0, 0))
 		return;
 
+	/*
+	 * Submit all cached OPU/IPU DATA bios before triggering
+	 * foreground GC to avoid potential deadlocks.
+	 */
+	f2fs_submit_merged_write(sbi, DATA);
+	f2fs_submit_all_merged_ipu_writes(sbi);
+
 	if (test_opt(sbi, GC_MERGE) && sbi->gc_thread &&
 				sbi->gc_thread->f2fs_gc_task) {
 		DEFINE_WAIT(wait);
@@ -464,13 +471,6 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 			.err_gc_skipped = false,
 			.nr_free_secs = 1 };
 
-		/*
-		 * Submit all cached OPU/IPU DATA bios before triggering
-		 * foreground GC to avoid potential deadlocks.
-		 */
-		f2fs_submit_merged_write(sbi, DATA);
-		f2fs_submit_all_merged_ipu_writes(sbi);
-
 		f2fs_down_write_trace(&sbi->gc_lock, &gc_control.lc);
 		stat_inc_gc_call_count(sbi, FOREGROUND);
 		f2fs_gc(sbi, &gc_control);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
