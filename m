Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCm9DpzYGmqE9QgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2026 14:31:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A85160CD11
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2026 14:31:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EUpCD8eZdzyRDAzRZ/qBxv1sEOROV5kB/QJnuKVIerE=; b=hChZAFoaBrN+fESXYnl2yTcxFG
	LqOR5P4cUJntZEwoXoCRWvV7I7oCNnb1GnY6XJiLp5SJTiybAvBYIYnCr6KkMRKZrJEK3GRk/s/HX
	hoWU/d5fikteJ2YlCe6wGVBQz5jkrqxBzF0KjNgaYVpw7wiuks9sJ/NmKAgBWJS/dIl0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wTIqJ-0000Xs-4L;
	Sat, 30 May 2026 12:31:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1wTIqH-0000Xl-Iv
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 May 2026 12:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9YJyvxL7Jrkm9RBWjxB07D2M41AzDBwFnFXawxioncI=; b=Se5ry924aarK9Z6OFejl30Plvy
 XdsLZ6UP460dvhgwxy1vcvg/2kHCjKsU5G+oLIVHfAmuEG+woi5u9un8WhIdBZU18/73Zl3xCrIVB
 Wywbs37Pr2RvC55tjvQvaGYEQyOdwxVBAEpnVV1C1Gjx6Sw3gBELnt9Q57KH1aucCCuw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9YJyvxL7Jrkm9RBWjxB07D2M41AzDBwFnFXawxioncI=; b=C
 zc0JOUOLO4JREEaV6MJt7zXbH7NK1ZfAlWDG8uWr+hHDoymKu/nD5Tw8F6qEjPSE6g+IDFzsSCbmx
 JH6dkV+mfkiwze+tNpG/gfGqaGO62enpy64eCZdf1Rpg6OrcG+VYqpM4dIMsgqV/qPrCdXuwXiz+G
 T2lI4CXCBzgElJJQ=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wTIqG-0007TA-6f for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 May 2026 12:31:06 +0000
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2bf237e1433so15791025ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 May 2026 05:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780144259; x=1780749059; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9YJyvxL7Jrkm9RBWjxB07D2M41AzDBwFnFXawxioncI=;
 b=c7pYFUKra5yMDkaDzC8NxlNQD6qwj9fnxGU2J0qTGLal0zFUxGt3r3s1NE2Rh57Dyh
 7+7JFbZhmcxxGEBJD7NB7tmnI9zjkWyxvMPK/AE5m/h4INVFxeOROTs+9GhhheG4QBWX
 hpEIspqDhJjn9Jr5/9pKCaDIyVCQEzfJP10zFADvf6ssbkGwbjaC/qKuPK0oSPCjwDVu
 jKJunBzEeBeWTq3yvK6loLic/p3EYCITOHfll+YhJrLPSm8sanaknA295hKjettCxLKx
 3E+at1uB8eEIUI4vrwcX5suCaqYNb7hf9epVAbZKhDFSOre/yx+si3Bmb0IfqmqVOt8W
 zVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780144259; x=1780749059;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9YJyvxL7Jrkm9RBWjxB07D2M41AzDBwFnFXawxioncI=;
 b=dfMFkY2Hns9qjsQtRJITNwSliWwKmgGUS7JuW0H8sHC3Zp2nCyVtadIYC5eao/hazX
 4hcKcaaHFJpe/uZBzw7YsZZqa8wqDMgWehWI0bLCCZizbdGLafDgZgtTWCCvouPrtUfm
 9sbbE/rKDSFEUfbVJB/rIwBPv5brNwSS7Jd8vWNnAAnP9ORrOSqxCK7XqxElkeqhlj63
 hdzD3dKwC6UbMA+KXpEHhsqjrqKCQG2zGWZMbMffyz2+/MisE44w2bcS++JSr78VEX/a
 sIbgrLJffueor8KgnOVL2uqNklb/Oaian0MZzgX3IubOOGSYM1JGrRQGAYs2IMiTM/Dk
 OPSQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+mqTD3Do0spP9DCmroE8nqqiDIRDS7IMtSS+B0FMHc3bF1Jr8BGJVUHOwUR9dHklcnHFK6jScvdIfvKkGJi377@lists.sourceforge.net
X-Gm-Message-State: AOJu0YytICWZZdGLheowK09iUgfdXDrtAxgOBM9f8Ih75CQS/jUzHU/Z
 6kGOT6XU6JvlygvxqGOE8GK1MW29ez4IlmAuhJ1iEMII3TvS7JnyDu8N
X-Gm-Gg: Acq92OHS54X1F5V5LP/l9hZCmCel4kUStS6594MgvWs43F87748NFR337eWoyLGL5VI
 QPyPMiBEfpjGqFcJKfsiDeoIxt0fPXfopzjGHraDroUTZjTZ0hgOkogPDwqRXwclM5mDL2wcWjq
 9eIW+H3xZvKmFPkCiS71ORRpiZg4/iyooceA7n+Yvs5N0/QeRSyQuZ3LBdxLWQVY41kwH9mhZMW
 3bJOnDsJy2x0AA2cdnDS5q3bRyP1n0Hl3qTx/lTO4HinsUab9Rh3X3W/9vze+4eEoWJavx6vwRS
 FYVPkHcQSPzXa8MIAZ2Pq45WVzPxpddWy6iIJXOQ8fWx6FDslhpxV66i7sp26M3HZRUtmmNz3rM
 HzIchjPUXQG/oXmXqiTk2kTF/iocQGcECkfSb6c1pjd1lKZKls3M1JLMZRoft99JJ3b6Y8RHZF1
 mK2LV+zYIp1np0BhgHtPhdfbbivPtyHw5DPkckmeW6
X-Received: by 2002:a17:902:e88c:b0:2b2:4d36:7aa with SMTP id
 d9443c01a7336-2bf368859d8mr41607765ad.35.1780144258863; 
 Sat, 30 May 2026 05:30:58 -0700 (PDT)
Received: from mi.mioffice.cn ([2408:8607:1b00:8:f8ee:63c8:7705:c6bf])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf239fd6desm48094995ad.24.2026.05.30.05.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 05:30:58 -0700 (PDT)
From: liujinbao1 <jinbaoliu365@gmail.com>
To: jaegeuk@kernel.org
Date: Sat, 30 May 2026 20:30:38 +0800
Message-ID: <20260530123038.2101877-1-jinbaoliu365@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: liujinbao1 When CP has CP_COMPACT_SUM_FLAG set, the
 nat/sit journal is stored in compact summary blocks at start_sum_block()
 rather
 than in the regular summary area. However, rewrite_nat_in_journal() and rewrite
 [...] Content analysis details:   (0.1 points, 5.0 required)
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
 [jinbaoliu365(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [jinbaoliu365(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wTIqG-0007TA-6f
Subject: [f2fs-dev] [PATCH] inject.f2fs: fix injecting nat/sit journal in
 compact summary
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
Cc: jinbaoliu365@gmail.com, Sheng Yong <shengyong1@xiaomi.com>,
 liujinbao1 <liujinbao1@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:jinbaoliu365@gmail.com,m:shengyong1@xiaomi.com,m:liujinbao1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email]
X-Rspamd-Queue-Id: 6A85160CD11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: liujinbao1 <liujinbao1@xiaomi.com>

When CP has CP_COMPACT_SUM_FLAG set, the nat/sit journal is stored in
compact summary blocks at start_sum_block() rather than in the regular
summary area. However, rewrite_nat_in_journal() and
rewrite_sit_in_journal() only handled CP_UMOUNT_FLAG and the running
state, missing the compact summary case.This caused the fault injection
to fail.

Fix this by adding the CP_COMPACT_SUM_FLAG check before the existing
CP_UMOUNT_FLAG check in both functions, writing the journal to the
correct compact summary block location.

Test steps:
1. NAT journal injection (nid=4, quota file):
  inject.f2fs --nat 0 --mb block_addr --nid 4 --val 12345 /dev/block/by-name/userdata
  Before: blkaddr unchanged (308225)
  After:  blkaddr = 12345

2. SIT journal injection (segno=61075, CURSEG_COLD_DATA):
  inject.f2fs --sit 0 --blk 0x1e1da00 --mb vblocks --val 123 /dev/block/by-name/userdata
  Before: vblocks unchanged (0)
  After:  vblocks = 123

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Signed-off-by: liujinbao1 <liujinbao1@xiaomi.com>
---
 fsck/inject.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index b00e356..60a2d20 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -675,6 +675,14 @@ static void rewrite_nat_in_journal(struct f2fs_sb_info *sbi, u32 nid,
 		}
 	}
 
+	if (is_set_ckpt_flags(cp, CP_COMPACT_SUM_FLAG)) {
+		blkaddr = start_sum_block(sbi);
+		ret = dev_write(&journal->n_nats, blkaddr << F2FS_BLKSIZE_BITS,
+				SUM_JOURNAL_SIZE, WRITE_LIFE_NONE);
+		ASSERT(ret >= 0);
+		return;
+	}
+
 	if (is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
 		blkaddr = sum_blk_addr(sbi, NR_CURSEG_TYPE, CURSEG_HOT_DATA);
 	else
@@ -806,6 +814,14 @@ static void rewrite_sit_in_journal(struct f2fs_sb_info *sbi, unsigned int segno,
 		}
 	}
 
+	if (is_set_ckpt_flags(cp, CP_COMPACT_SUM_FLAG)) {
+		blkaddr = start_sum_block(sbi);
+		ret = dev_write(&journal->n_sits, (blkaddr << F2FS_BLKSIZE_BITS) + SUM_JOURNAL_SIZE,
+				SUM_JOURNAL_SIZE, WRITE_LIFE_NONE);
+		ASSERT(ret >= 0);
+		return;
+	}
+
 	if (is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
 		blkaddr = sum_blk_addr(sbi, NR_CURSEG_TYPE, CURSEG_COLD_DATA);
 	else
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
