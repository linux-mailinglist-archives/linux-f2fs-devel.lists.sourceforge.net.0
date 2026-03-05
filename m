Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id H7C1HjErqWkh2wAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 08:05:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6C620C239
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 08:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jiMSXLpi5kwe6LiA8V85jPP8uXJTqwNPsPveEEv5XBw=; b=XbdiMfniGniQ+bcnvyhUsdjlQF
	7qtCOg4EB1PFkNC34vDOvFw0hdxzLeI3G115P5zrMHSzAcoGiA74fSDx7XD5woLw2zG04rDJ+4LwH
	xUTb0uqp/PR+IZcK6iA4iTx7hWpAstzoxLMVaRoNxx15oHc6UmMcqaAvp0pQdTjdBUd8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vy2lf-0005Rr-Ve;
	Thu, 05 Mar 2026 07:05:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1vy2le-0005Re-35
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 07:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Iirm8ITnRHz0Ou2MW1pLFYj9GKiFK2bub8kLgxuFLc=; b=VD2LiP3HkCwIobqXhl3aLd2PfD
 ibpZTk+VjIdlA54dFsFxpwUSui3dEX7WQTXyW4S4rIkblYQd0UPy19FQcKobvn+dZojDd/MwsNY3S
 KflmPOBjJ/J3oSNYt3MjNy+51707J6yUif4OSrEPGo10+U9SoE7q42osBz5DMePw7vMQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6Iirm8ITnRHz0Ou2MW1pLFYj9GKiFK2bub8kLgxuFLc=; b=m
 tWZdWOWAcJBWLKE65J5K38wk2C87dnqBhk+fO1tcGSaTMqFQwU7bkPZhCZ7btbIMvolnVES9OiedX
 Hmtis9p/PDJ5icZ3te7zWTm7jF0gOsYm4flHiZ8b8lZXmtIsJh8CX+KYUDGUH4LzJ20YsAC9PkvOU
 VW9sepCvP7jhcstk=;
Received: from mail-pg1-f175.google.com ([209.85.215.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vy2le-0003Su-6B for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 07:05:06 +0000
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-c7393c6832bso25690a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Mar 2026 23:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772694295; x=1773299095; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Iirm8ITnRHz0Ou2MW1pLFYj9GKiFK2bub8kLgxuFLc=;
 b=X/01xeTOQbFKo0tf2tm8MLe4D5V2rXxJgO2JVwryyJ2rxbfUx1K2FXWIxdylsGRC60
 2n6bgveuk+4jfK64Lmp5Q2EYmkcDTwLQrr/5ozRRLSJruybDsRRRIJpTF6rH1qkkKcpY
 ZqtJiicbJq/HeWXFRL8gkJudCmbQSK9l/EchunybpAyx0vuQkpRyp//chzGFaqJB9md6
 2vjv68zRTCZpGdhcOvMK/pxCu1OBpBJCyD+AixH6rSje/1AdhZ8ckRRxwgjN5NnnaD1s
 NJx0rCYGVC31+K+ikpTXLHPTlaxu3dGg6soalsJd+VM2J/2ZcaWUIKa5yWq5opW0IBrn
 dBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772694295; x=1773299095;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Iirm8ITnRHz0Ou2MW1pLFYj9GKiFK2bub8kLgxuFLc=;
 b=v6lhtTbzlx+LRNKaukz0VKnEvH85k5M60d0VLn+wVMizKtf9MlWdW/Bton7EYi3P09
 r8bJiTWoO9+vrSIjxqFmAhbQILdfokKWH18hyeu5uk1M04JQ/Ct0onx31pS1NJjUICZy
 bAMJx41Mvqj60b8rpy5WdEa8nv1FSAxEEW6H0xGTPutOIABeHJqT/OKN2mm9mq3zD7RP
 X5lc3y9Y4M3IDWJcaj7VND8vfvllzI3FzVORU+6BtQ6BM8lcr896z9ekp9M/FavSgwXv
 Va8i/HgY5tCfDzyQjBdNVBE4lKGrTluknKZxKSJb5SQ8vcfvL49NYKOPTuV8W18LI5fk
 Wn1w==
X-Gm-Message-State: AOJu0YyenZ1IXkOi29w0M8Z6AN6kdfdFwEE1Snlmg69GXjRpEBb4gete
 lrIyeJnS5VOxNSYlLSBdq0cIwbMOzie6jJIMXmitMGHSRhLPodTCZVdO
X-Gm-Gg: ATEYQzz4sgoxenVvF65lyy5WdbXIPHJUqNOmxhS4GdiJWZ7FMA6IxNytwyZy/LuWunG
 GAiWAplrRMsNMKuxZ2ohu+3h1sGisom8n2ZEHe0oyG7YPtb9eapII2hWzyBoh4zGFnmQIMzTDSF
 3phDeuOlRkjJqFNQQ72M5p7uT0mUth1JeTzcgFWnLBLSQddYj7UKhI1aVwb51VxMaHVBzL63SbG
 zLuniFAh2jHs899CozaXJHna1v6OT95Qy1mkbnAZvCTGb1YcTB8cUfhq7oh1wcTBKhanpXD1JXA
 +oPQC4GGUnrV5UwS6Xc+YhqbIOYRCfzkKfnjyjHnU9CkneXNFSacXwfZMmcxQyrUfh2ujuISaK3
 BNDfL9jdLvqT2LT/ZBqmgXYskFoKJJ1iVuOMHhY7bdgLwcpndEg3bqy6AXrEs2vDbeFwh6qBY/X
 zyaMaoUVaXZOIwt06iHWr0+trDVi1bP/C6
X-Received: by 2002:a17:903:15c3:b0:2ae:6637:8238 with SMTP id
 d9443c01a7336-2ae6a9de1c4mr47196695ad.2.1772694295417; 
 Wed, 04 Mar 2026 23:04:55 -0800 (PST)
Received: from zyy.mioffice.cn ([2408:8607:1b00:8:dd2e:1683:5c58:b59d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae46500068sm131813185ad.52.2026.03.04.23.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 23:04:54 -0800 (PST)
From: Yangyang Zang <zangyangyang66@gmail.com>
X-Google-Original-From: Yangyang Zang <zangyangyang1@xiaomi.com>
To: chao@kernel.org,
	jaegeuk@kernel.org,
	daehojeong@google.com
Date: Thu,  5 Mar 2026 15:04:25 +0800
Message-ID: <20260305070426.1890753-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The number of SSA blocks after segment alignment is
 inconsistent
 with get_newsb(segment_count). This could result in some SSA blocks not being
 zeroed out or main area blocks being incorrectly zeroed o [...] 
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
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zangyangyang66(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zangyangyang66(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.175 listed in wl.mailspike.net]
X-Headers-End: 1vy2le-0003Su-6B
Subject: [f2fs-dev] [PATCH v2 1/2] resize.f2fs: fix to avoid zeroing main
 area blocks in migrate_ssa()
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
X-Rspamd-Queue-Id: 5E6C620C239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:daehojeong@google.com,m:zangyangyang1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[zangyangyang66@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

The number of SSA blocks after segment alignment is inconsistent with
get_newsb(segment_count). This could result in some SSA blocks not being
zeroed out or main area blocks being incorrectly zeroed out during SSA
migration. Zeroing out main area blocks can corrupt the root inode, leading
to file system corruption.

Fixes: ad1357c34023 ("f2fs-tools: revert summary entry count from 2048 to 512 in 16kb block support")
Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>
---
Changes in v2:
 - Modify the commit message
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
