Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM61NNY0tGn4igAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 17:01:26 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C15D28688A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 17:01:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IR3IIeG4dJ4fBtn8gyQdsyNHjilu4NOPcnhSRWkXka0=; b=jsy3y8JsoyNlRNRAcYeV6K5eUp
	ThmCWKkaiN7xpFqWDReXQwNWTs5HuFK76QHAYWDTAlR21WnGvQZaoVhM+5GX3txms6MYIdkaM2F1L
	M1bjCt5+sUuXiGZmQ5lr/FeHmgjYeIIZA5ZFxX0xQ0ROIRvJWWCJjNj7AdXrhx/a1alo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w14wq-0005KL-4h;
	Fri, 13 Mar 2026 16:01:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1w14wn-0005KB-6L
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 16:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LN9w9yNR9f1cITqQHAVZ9h1iIpjIk95ptPB5LEz0210=; b=DeMT0B74Sp/EPi3uiLAqBNsyy8
 +yz55pv8CnXV3P/0+g60xHKIx+4kdXhNrdxF6YC47JoWBEwA0j/BwZ5CsGs+3uHHriVena9Cb1+DP
 7QvhyYEUDC5Iwog9vw91tAQAJWa33uSToXguC51fQvsnOQNVPwwrf6CtWrxOeBDwMBnA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LN9w9yNR9f1cITqQHAVZ9h1iIpjIk95ptPB5LEz0210=; b=d
 gCnZO/KnIRPAEd2B4H9qJBr8Wd5eARhWoDC4T8tRV8v0TPfrWtauCvbS9vjqMdYtqnmSVPvlISLUN
 IFTCe0Q7hmiKn+GVs3QXSpgqmEtBbZHPb4oCCJkVxV+iLwgBUbFEcQ0llmna8fB7iz98RqaypHIEl
 4si52xEPDd6m6VC0=;
Received: from mail-dy1-f182.google.com ([74.125.82.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w14wm-00068H-Jm for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 16:01:09 +0000
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2bea03c64c1so1239989eec.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Mar 2026 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773417658; x=1774022458; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LN9w9yNR9f1cITqQHAVZ9h1iIpjIk95ptPB5LEz0210=;
 b=e6LToNieHPYSsdt2esy3BBEWmLenrJSTBpbw00ka0nx1jUAaK6qqZ7bs5snXzaF5aG
 7x0yPNeaW3MF7B17tIroEpRrCrcPa5LxDi0E94AYMk7ARP1RtAKuJwHBTlR9zUB9xcg4
 VnXpEWD+vTd2vbBBCF1tvlYWkseQx0XEimrwguxwRDweqNeU9KT3/8QMHXvG+wemk4nL
 LAV0P7BcR5cb1cN94dvnC87Z/JIXBBtGY5+fZKyCyVXvBQWCUN/kVEQITMh0sIlrbtbQ
 8Vx5PcecGhGslp8huFoRkxecQ8ulGdUVx1ElG/XuRKDagYIdvObBoodb6sJBvXRgIiBa
 obeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773417658; x=1774022458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LN9w9yNR9f1cITqQHAVZ9h1iIpjIk95ptPB5LEz0210=;
 b=MfYTytsKrAThMzu6iXDtEvq0p1QjAfN25zNo6Lpbxt+A9TVVXPWGx/MBGAhXaJ0vRQ
 YZsn8OM64cAK5IHfCAFZeRHYvsWm8Ujt/+KUotpuRAH2wB9zQ2A5OENaSIBP/RO92nUt
 GD0vzpMdFLUUkvJSsQTqs8vUZHt6fyRRLlAOPm6br0FZe7mtp3fqMUvo3sJNbbRfhvsq
 Np22LhJrZILl5uAQfA9Si9np3LpDhzfYE/W/+N8EP3WkdD7Ii7YYiP4knT7hcfVZAE3z
 3wMWQoQZ48/RHUtubmzPIwRAqDJd6z3auPZuqvQhDLLibljyiSEFP8N+ED7NAiuP2Ao4
 1Abw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBo6yS9DeUdIfJImHq6yQT28q639fvrTqtHbnWIRbih5RPHU4EuoduhBNrzxuunw6Bvhqejy7zAZ2HBpZblEdR@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw7HUCWR22644CpiTgSf0J/YnxGbak9SSSlNwmU/FIym0IQ1Gyl
 tLQdUivpP3ZwAK0SWlpH9syhAkQ2b4jThY1LqvxjUQ96NEsnBXGnJxNC
X-Gm-Gg: ATEYQzzwGpph17R1XxPg0X8iGj5ws9pqv2SuXyW3Bn2N2nmnJIHwiH1O9WpMxWzCRt3
 exboS/uQIllldw7WLFPn8COzPuD1cLx5Z0hLDke/SWRfrIPjCbU+SmrfYkPuBLnIR2h0zOZEnv7
 fth8QW6KUhqHpQt3iLFdzOM4vU3JA/hSyLbgBmJTd0tFhknl0hJGswCrdDR2X6nInDxyjM/xcMU
 UITgMcDUq5NIZ2kr/Xt9HbBNfan6oxLyIbGo7tFSC6WIRY6WBRYzLw9uNarEN0QCGy2SwX2MujF
 1bg5YWdBMjOV5zw7urreVSUgVVD2F3nXwFQ4V5kWBHpmCy1GNA2zQGjOP21EXNfk6pW05z6Knrq
 gnRd1iRCjPSN/yKQtAnsCDC19vrA93jrJd272NQ/GqcJGvLk7pCgCkIIfINwFfRP4oFCV/uHUV4
 0z1roEv4np7OE4I2i6qmUvLK9VbdEKOZM1puAtZYriOCJ3UL4dtMv7xB8cqIxniDZ0MIxWsLDi4
 W/H2De3VIbC+1RI9FliMkl7EgKGSFittI/hZ9yQchvVtSjE56+G1PfxISaDZQ==
X-Received: by 2002:a05:7301:3f0a:b0:2be:1a8e:10bb with SMTP id
 5a478bee46e88-2bea54e71bcmr1628648eec.12.1773417657233; 
 Fri, 13 Mar 2026 09:00:57 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:e956:1317:d042:5a42])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab525c5fsm2955467eec.22.2026.03.13.09.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 09:00:56 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 13 Mar 2026 09:00:51 -0700
Message-ID: <20260313160051.3471704-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.53.0.880.g73c4285caa-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Suspend can fail if kernel threads do not
 freeze for a while. f2fs_gc and f2fs_discard threads can perform long-running
 operations that prevent them from reaching a freeze point in a timely manner.
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w14wm-00068H-Jm
Subject: [f2fs-dev] [PATCH v3] f2fs: fix to freeze GC and discard threads
 quickly
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:kernel-team@android.com,m:daehojeong@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 2C15D28688A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Daeho Jeong <daehojeong@google.com>

Suspend can fail if kernel threads do not freeze for a while.
f2fs_gc and f2fs_discard threads can perform long-running operations
that prevent them from reaching a freeze point in a timely manner.

This patch adds explicit freezing checks in the following locations:
1. f2fs_gc: Added a check at the 'retry' label to exit the loop quickly
   if freezing is requested, especially during heavy GC rounds.
2. __issue_discard_cmd: Added a 'suspended' flag to break both inner and
   outer loops during discard command issuance if freezing is detected
   after at least one command has been issued.
3. __issue_discard_cmd_orderly: Added a similar check for orderly discard
   to ensure responsiveness.

These checks ensure that the threads release locks safely and enter the
frozen state.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v3: removed unnecessary suspended check
v2: add freezing check in do_garbage_collect()
---
 fs/f2fs/gc.c      | 10 ++++++++++
 fs/f2fs/segment.c | 12 +++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 981eac629fe9..f07746a14aa4 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1883,12 +1883,18 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 				sbi->next_victim_seg[gc_type] =
 					(cur_segno + 1 < sec_end_segno) ?
 					cur_segno + 1 : NULL_SEGNO;
+
+			if (unlikely(freezing(current))) {
+				folio_put_refs(sum_folio, 2);
+				goto stop;
+			}
 		}
 next_block:
 		folio_put_refs(sum_folio, 2);
 		segno = block_end_segno;
 	}
 
+stop:
 	if (submitted)
 		f2fs_submit_merged_write(sbi, data_type);
 
@@ -1962,6 +1968,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		goto stop;
 	}
 retry:
+	if (unlikely(freezing(current))) {
+		ret = 0;
+		goto stop;
+	}
 	ret = __get_victim(sbi, &segno, gc_type, gc_control->one_time);
 	if (ret) {
 		/* allow to search victim from sections has pinned data */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index e9b6d774b985..0c4fb4270185 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1606,6 +1606,9 @@ static void __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
 		if (dc->state != D_PREP)
 			goto next;
 
+		if (*issued > 0 && unlikely(freezing(current)))
+			break;
+
 		if (dpolicy->io_aware && !is_idle(sbi, DISCARD_TIME)) {
 			io_interrupted = true;
 			break;
@@ -1645,6 +1648,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 	struct blk_plug plug;
 	int i, issued;
 	bool io_interrupted = false;
+	bool suspended = false;
 
 	if (dpolicy->timeout)
 		f2fs_update_time(sbi, UMOUNT_DISCARD_TIMEOUT);
@@ -1675,6 +1679,11 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 		list_for_each_entry_safe(dc, tmp, pend_list, list) {
 			f2fs_bug_on(sbi, dc->state != D_PREP);
 
+			if (issued > 0 && unlikely(freezing(current))) {
+				suspended = true;
+				break;
+			}
+
 			if (dpolicy->timeout &&
 				f2fs_time_over(sbi, UMOUNT_DISCARD_TIMEOUT))
 				break;
@@ -1694,7 +1703,8 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 next:
 		mutex_unlock(&dcc->cmd_lock);
 
-		if (issued >= dpolicy->max_requests || io_interrupted)
+		if (issued >= dpolicy->max_requests || io_interrupted ||
+					suspended)
 			break;
 	}
 
-- 
2.53.0.880.g73c4285caa-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
