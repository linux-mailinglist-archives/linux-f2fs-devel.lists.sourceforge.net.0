Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAgvLco2BmqWgQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 May 2026 22:55:38 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD73546D7A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 May 2026 22:55:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=waEb2TTk3vPmN98HUWMTA3LyKrZMcK/zJfaIK5vO+BY=; b=RO7r5FCq3n7ACyHKMpCxJsNQp6
	WeDCTSfA81LMX4iGlwSKWX2Id17folnGLerkRNoYdcf/l7puG8aFMocivyPcCRyitoADxtV1oU9YV
	HU0tfTvoCtykXaHsKExi4Fs66ph+Sd3dUX6VjD2TKQ2f7UtTJIM3iVRx0s22mvxAystg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wNd5d-0000f2-Ns;
	Thu, 14 May 2026 20:55:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1wNd5c-0000ev-Oc
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 May 2026 20:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M+HrC3wUfomSuttyTiJ1cH0jqcmCnpaZOOcbBOvYx+Y=; b=Kj49IHBW74XKO5uuKxbKZ1kpl+
 7+ssDqbe4UXFfYv84gVCESKHi1Fx2pj4SD1RjujKq2weGx3LA1WjQjuGroN8ESvqkvJmInRzJ1f+G
 +TJscYeU/jjvXGrN9Gozi/eZH1u+S9cduJtN8v8iH5FYNCmlNmORN3b5neLlkWnLuBr8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=M+HrC3wUfomSuttyTiJ1cH0jqcmCnpaZOOcbBOvYx+Y=; b=f
 k3Ij/wBbIwUDZxLPh03jpd2atfg7hxyQvM+Uy3ZQboQA9yd5hl8hqu0Gmj9n8hziUlHI0vDq5yOur
 3dqXV+xTJNlNLnrce1RW8ih9uJRgdBAnkqnm9HAes2JQs62CG0/bndQ0OjDBApFWLeTm5q+DGakCE
 PM4vxaYLlBZhO3cs=;
Received: from mail-dl1-f52.google.com ([74.125.82.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wNd5b-0003R8-Rg for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 May 2026 20:55:28 +0000
Received: by mail-dl1-f52.google.com with SMTP id
 a92af1059eb24-132d1b2519eso3023078c88.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 May 2026 13:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778792118; x=1779396918; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M+HrC3wUfomSuttyTiJ1cH0jqcmCnpaZOOcbBOvYx+Y=;
 b=J0q8jALnH8LyyaTYqyQShLcwRow4JHb03hYcmtkrz9a3yy3ExUNCC1caacTZf0vH7y
 AbzkQjtvBToJZZK8c9mmxiZ3rpUL5SiW6axYQvKBIEvTjobWGjygthEo/blYPbex6BMg
 1xOAvK5/jPd8PbDAMLhoeWVBddu4hUnuuvoFWs5yRnXWZ8dSIiEW+KhGwgS6PiF9BNUB
 vxR87WAf/3vaqBtvlAE/x/rkKLjgErSdXGcGpjtqxjYMDvFaiazREelPlVKTAR3apxau
 Ps/XAIUVxVhj4RIL5jK5QwoqSWhTqSlVPNVZk9ZSYbG7oHOezBuKJFMc96XfjB/0v1GC
 9iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778792118; x=1779396918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M+HrC3wUfomSuttyTiJ1cH0jqcmCnpaZOOcbBOvYx+Y=;
 b=tLKt89bsNwh/6aL5S6xCDpZa/HJUDLCjgFJWgMkv5dXDXTUNZ2ZTjSWBZdprOtmIOY
 d53S96e2ewyn3E33vQPBPWTp0Ks25hhSdxQkbuXPg6zG7UC0EQEfoBUxPCsTaq1Imtc4
 +UjupFq0XLpeXaUFLbH2wIdeklXt2RyYixoI044obJ8+Xms4LSKOvK6VUmvytZmArLW1
 Ho2vfhRcNT3or5qm564kUgLva0BPKuZ9dv91DseFgSxvfIgdCwLoVIEUo6sPcIfQFVma
 W/QaGtUOnpZkyEWMctYcEYaxsfPWSCux/un1+yIrwq1Yn/UOPfBH2Lm+fj5Li6JC5Rhh
 i1ZQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8qyjLExOMxQ7EB/8VHT5ZlWpIwRaFtSGKIpK92i64jutcxCC+GuJv5eU/LBFMnLRAtMjV/i+cgzew4grky1MQx@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz66Aj+2UwMHQVGe+yq++Qg5E7eS5CVezyK6GRPvYOpmYtODr/q
 pqJhDmEUhJp/vYXFk0pYMkcKQsGaZdA6Vu3O3xYXbNcQgO69kMumMDfN
X-Gm-Gg: Acq92OFmHIu0udnCE059sXHQpoJ2iGvdPpELQd+jHv6ToiPCP5vZo2nI7o4eXlC+oEq
 u0jHD7H9hbkO1NSpbAVmCJkbXnIYWb0Lfp3uHqP/Km28jAoJ2dfDLAZpoMi0IB7tqftaZcIJbeH
 HhTclp2CuNFmWRFJWe7fDWM0V/0o3JFKqtbEf6N/+Gp4in5UkdZBy3wU2fJmvpdEd2eTPf4F1VU
 2B82hqxTcXjyNGHBKsmXfa4wjUCSv2a/o2w27OwKA/yaE+tM6fsI5fEwL/wToB0mQ2HjA1w4Bcv
 WOpDhPlTU9exLmgG9O4KJLJfSvTxYg1O+7ypwprThhXPKdG8Ix8otCYYvv5wsIP8qwJWNmjEjJK
 JQjNBcepqf2H+x2SKIfEHmty9u4fYv2QhVZyPFkPF4sXvodguo1MjS73J3XGdlBlesqvsTuj7DB
 iShz8pPLhbwjHqwHxsUpGOtDYORToBUmybYtKrLImqoMV+5d+19W/r/v10DKevx1i6cZJpd+2mS
 aPRNFVJJmNF2d7MPtl3kyoKNwwANMfwFUDyUwEbFTYyKVrX3Q==
X-Received: by 2002:a05:7300:e6c6:b0:2dd:c066:bf7 with SMTP id
 5a478bee46e88-303982b11bbmr674972eec.11.1778792117654; 
 Thu, 14 May 2026 13:55:17 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:d674:986:3782:2b17])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30293e2e3c0sm5355763eec.3.2026.05.14.13.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 13:55:17 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 14 May 2026 13:55:13 -0700
Message-ID: <20260514205513.1464863-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong In large section mode, do_garbage_collect()
 previously determined the section's representative type by looking only at
 the first segment of the section. However, if data was fsynced into an area
 previ [...] 
 Content analysis details:   (0.1 points, 5.0 required)
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
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.52 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wNd5b-0003R8-Rg
Subject: [f2fs-dev] [PATCH] f2fs: optimize representative type determination
 in GC
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
X-Rspamd-Queue-Id: EFD73546D7A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:kernel-team@android.com,m:daehojeong@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

From: Daeho Jeong <daehojeong@google.com>

In large section mode, do_garbage_collect() previously determined the
section's representative type by looking only at the first segment of
the section. However, if data was fsynced into an area previously used
as a node section, and this area is recovered during roll-forward
recovery after sudden power off (SPO), GC would incorrectly assume the
section's type based on an empty or obsolete first segment. This caused
the recovered data segment to be misunderstood as being stuck inside a
node section, triggering false inconsistency panics (Inconsistent
segment type in SSA and SIT) and subsequent mount failures.

This patch optimizes do_garbage_collect() to determine the section's
representative type by identifying the first segment that actually
contains valid blocks (valid_blocks > 0) during the main GC loop. This
eliminates false alarms from empty/obsolete leading segments while
maintaining strict section-level type consistency checks for genuine
corruption.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/gc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 755df9b6bbaa..3464ca7d5fb1 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1745,9 +1745,8 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
 	unsigned int sec_end_segno;
 	int seg_freed = 0, migrated = 0;
-	unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
-						SUM_TYPE_DATA : SUM_TYPE_NODE;
-	unsigned char data_type = (type == SUM_TYPE_DATA) ? DATA : NODE;
+	unsigned char type;
+	unsigned char data_type;
 	int submitted = 0, sum_blk_cnt;
 
 	if (__is_large_section(sbi)) {
@@ -1846,6 +1845,12 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 					migrated >= sbi->migration_granularity)
 				continue;
 
+			if (migrated == 0) {
+				type = IS_DATASEG(get_seg_entry(sbi, cur_segno)->type) ?
+							SUM_TYPE_DATA : SUM_TYPE_NODE;
+				data_type = (type == SUM_TYPE_DATA) ? DATA : NODE;
+			}
+
 			sum = SUM_BLK_PAGE_ADDR(sbi, sum_folio, cur_segno);
 			if (type != GET_SUM_TYPE(sum_footer(sbi, sum))) {
 				f2fs_err(sbi, "Inconsistent segment (%u) type "
-- 
2.54.0.563.g4f69b47b94-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
