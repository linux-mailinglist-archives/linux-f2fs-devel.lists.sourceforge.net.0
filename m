Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN8YIDiGoWlOuAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 12:55:36 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6CD1B6CE3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 12:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NjBnLkYGVqZz4yGy984QW0CL31q4lO/PkQWUFOoE7Ek=; b=cP1pbgOcLGo5v/+oiUqOHz78sd
	7eMSoe1m/6tgOYxtUanhy+3RoisdA6HTdcsloi6tPzLrk99a0f/FPOXNsJgoa0XoascsmD92LNWt5
	ues7xkvYqrXjW/X5o64xvUpb942BYYZyUKN8JpND9jiKris9fF+7xDzYkxTm0yWFIDos=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvwRM-0004qo-LF;
	Fri, 27 Feb 2026 11:55:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1vvwRL-0004qh-Dr
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 11:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nRZFJ03Glx74ywD+1IfI2khChXPorPfyJ98pVVHrP5M=; b=iUc7Hio56Al0SYszwaXx+WiREc
 ueGWo6TivRLssI+0dAfB8jtiC35a6o2D88OmuEXVvciLxewKJvw6VsXfrMxSJMVmwO+wNz8TOqYTH
 nchDueTIfBGKzV7waC0lIz88TcgKU5LH4EHXt25fdLNSzl7PCHVC7bWexVmq9b/aZoqQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nRZFJ03Glx74ywD+1IfI2khChXPorPfyJ98pVVHrP5M=; b=B
 CHaKQBx3d1e+KOl/ENJwEIvx1+wKKWzVNjB8IsC8IuBYVfXLHDBDKSpVd8tQVhIsXR3Lso5ogY8ex
 WYdD6W8z5pdBHOhW9y0NRo40CUi/ODWZziJ8crQovjr4qQ8y2+R1sTanww88vZgYLS9FUWPXElyJi
 hGsL9wecWpJSQeNM=;
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vvwRL-0001Ru-0R for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 11:55:27 +0000
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-c70bc5b4e86so784315a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 27 Feb 2026 03:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772193316; x=1772798116; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nRZFJ03Glx74ywD+1IfI2khChXPorPfyJ98pVVHrP5M=;
 b=mcXlmUSCpFLia6mmLiZYbpGLYfhWW5MAH1z6touWRZqDY9kzTTDLVRM+4RZKlPw0PA
 PmmUxltfsHamAeGU45b6vhBBv6uSpqEcvIB4AUmnWddvg/5HTZGvNCypHhZBg6GVn26g
 h+z3mbdMA2qGb0ijkhyMcKm7cVkY3Ok4GY/i78E5RJ/mkEWiQOugAvGO/V9MHonKa6kx
 2gysHD7kIe/bNua7qOXaa+p4Lctzv2IfCcYg0Q/sZT1hezQm1vJlyMGxZbGYWcz2bMWj
 g9cHN5MqS8xZZvgV/9BCbuWp+OZcFsMQOGMNEMFqUqCfd8jMWFPz+TaIOVaaXzmoXcIB
 4fDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772193316; x=1772798116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nRZFJ03Glx74ywD+1IfI2khChXPorPfyJ98pVVHrP5M=;
 b=KNpZpnnO3J4qY3idFWTN35harSl8AXNNECj8jaLF252G2pnBEfy2z86Df67J2+zkw6
 T0bC6NUftaCEh7OZc9OgCN8OwTF2btAAU+lzsIpA6szAMmA0hzxG81sNar538FNwXHhz
 9Kz9mDh08sfMMJN0Uz+7vm63xiEmVX78w0/TuJfbx26vCBD+Vb+1Iu/Tmadn6y/TbmLN
 SfSP+3qs8PT2WsF7fx+knDD8hBeIa5+WtxvqEyt2hamMBSoqnyi/L5oZ/wHJRo7HgnjZ
 xHp3JjrwizoJEkgOvPqBAhor7yfoStyoFdppHW3GoAufLP+id7rbsMHZTao+su5SDvq4
 k5MQ==
X-Gm-Message-State: AOJu0YybulaRnt3AItjhTaMwABmO2wnIjTVYX9zDe3PqFDoRdXJEJgQZ
 XYudZ87JV2S9NPP5m6VQvmLpH71B0sYJHlxdYGVlxaGQt2Qw7ewYf9ZD
X-Gm-Gg: ATEYQzy/8HoIBjH130rsIGI+GQ9KQij0LIuDxMBC50cpbrWTj+Gp3ivUmRJeG2BSsDE
 /eflAs1AQMR8wUExNKzGVKDH7rkswVG/pkZuZDRvEBRc3kQqp/ZBWvtmLhGHpO1L0QG8eRIs25q
 9/UXpulCXByu0ngNwWrT6IylpKO5dNj2bZ39GpTCXFMDReDSbWxMQkVw0M68qMDjlcxPa0ZAfFq
 wUiVmQDeDI2WGR3hUSBKpj0vb1PBwIfSMKDacHTloVmduhCQKO4s7Di1oEVuagXaqCZViw442MM
 thS88Lu0xYeOW863wZCQlp6LOGqIvxyL/SJQihpA4EqVAUKlnvWnXBJ4KbJUHuncttfG4ATCDt1
 7kf9dMzvFFlPXQiUryBBTA+b2UCQO9LDAVx4U3NIftAVI7WA0jz+Pcqmj19EHGv/wdn+XylFz/4
 mP7v6GSOad/9A2EBj55vR/BKhDabMri17m
X-Received: by 2002:a17:902:f64c:b0:2aa:e114:2f5b with SMTP id
 d9443c01a7336-2ae2e3f1575mr25157095ad.17.1772193316165; 
 Fri, 27 Feb 2026 03:55:16 -0800 (PST)
Received: from zyy.mioffice.cn ([2408:8607:1b00:8:f558:685f:3aab:ca1e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8273a0299d9sm5621040b3a.51.2026.02.27.03.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 03:55:15 -0800 (PST)
From: Yangyang Zang <zangyangyang66@gmail.com>
X-Google-Original-From: Yangyang Zang <zangyangyang1@xiaomi.com>
To: chao@kernel.org,
	jaegeuk@kernel.org,
	daehojeong@google.com
Date: Fri, 27 Feb 2026 19:54:29 +0800
Message-ID: <20260227115430.2622877-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The `new_seg_total` may be greater than the total number of
 blocks in the SSA, which can cause main area blocks to be zeroed out during
 SSA migration. This can corrupt the root inode, leading to files [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zangyangyang66(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zangyangyang66(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vvwRL-0001Ru-0R
Subject: [f2fs-dev] [PATCH 1/2] resize.f2fs: fix to avoid zeroing main area
 blocks in migrate_ssa()
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
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:daehojeong@google.com,m:zangyangyang1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[zangyangyang66@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zangyangyang66@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: CC6CD1B6CE3
X-Rspamd-Action: no action

The `new_seg_total` may be greater than the total number of blocks
in the SSA, which can cause main area blocks to be zeroed out during
SSA migration. This can corrupt the root inode, leading to filesystem
corruption.

Fixes: ad1357c34023 ("f2fs-tools: revert summary entry count from 2048 to 512 in 16kb block support")
Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>
---
 fsck/resize.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/fsck/resize.c b/fsck/resize.c
index e6502837b209..79db7eede65c 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -257,48 +257,48 @@ static void migrate_ssa(struct f2fs_sb_info *sbi,
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	block_t old_sum_blkaddr = get_sb(ssa_blkaddr);
 	block_t new_sum_blkaddr = get_newsb(ssa_blkaddr);
-	unsigned int expand_segno = MAIN_SEGS(sbi) - offset;
-	unsigned int new_seg_total = get_newsb(segment_count);
-	int new_segno;
+	unsigned int expand_sum_blocks = MAIN_SEGS(sbi) - offset;
+	unsigned int new_sum_blocks = get_newsb(main_blkaddr) - new_sum_blkaddr;
+	int new_sum_blkoff;
 	int ret = 0;
 	void *zero_block = calloc(F2FS_SUM_BLKSIZE, 1);
 	ASSERT(zero_block);
 
 	if (offset && new_sum_blkaddr <= (old_sum_blkaddr +
 				offset / SUMS_PER_BLOCK)) {
-		new_segno = 0;
-		while (new_segno < new_seg_total) {
-			if (new_segno < expand_segno)
-				move_ssa(sbi, new_sb, offset++, new_segno);
+		new_sum_blkoff = 0;
+		while (new_sum_blkoff < new_sum_blocks) {
+			if (new_sum_blkoff < expand_sum_blocks)
+				move_ssa(sbi, new_sb, offset++, new_sum_blkoff);
 			else if (c.feature & F2FS_FEATURE_PACKED_SSA)
 				ret = dev_write_4k_block(zero_block,
-					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
-					GET_SUM_NEW_BLKOFF(new_sb, new_segno),
+					GET_SUM_NEW_BLKADDR(new_sb, new_sum_blkoff),
+					GET_SUM_NEW_BLKOFF(new_sb, new_sum_blkoff),
 					WRITE_LIFE_NONE);
 			else
 				ret = dev_write_block(zero_block,
-					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
+					GET_SUM_NEW_BLKADDR(new_sb, new_sum_blkoff),
 					WRITE_LIFE_NONE);
 			ASSERT(ret >= 0);
-			new_segno++;
+			new_sum_blkoff++;
 		}
 	} else {
-		new_segno = new_seg_total - 1;
+		new_sum_blkoff = new_sum_blocks - 1;
 		offset = MAIN_SEGS(sbi) - 1;
-		while (new_segno >= 0) {
-			if (new_segno < expand_segno)
-				move_ssa(sbi, new_sb, offset--, new_segno);
+		while (new_sum_blkoff >= 0) {
+			if (new_sum_blkoff < expand_sum_blocks)
+				move_ssa(sbi, new_sb, offset--, new_sum_blkoff);
 			else if (c.feature & F2FS_FEATURE_PACKED_SSA)
 				ret = dev_write_4k_block(zero_block,
-					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
-					GET_SUM_NEW_BLKOFF(new_sb, new_segno),
+					GET_SUM_NEW_BLKADDR(new_sb, new_sum_blkoff),
+					GET_SUM_NEW_BLKOFF(new_sb, new_sum_blkoff),
 					WRITE_LIFE_NONE);
 			else
 				ret = dev_write_block(zero_block,
-					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
+					GET_SUM_NEW_BLKADDR(new_sb, new_sum_blkoff),
 					WRITE_LIFE_NONE);
 			ASSERT(ret >= 0);
-			new_segno--;
+			new_sum_blkoff--;
 		}
 	}
 
-- 
2.43.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
