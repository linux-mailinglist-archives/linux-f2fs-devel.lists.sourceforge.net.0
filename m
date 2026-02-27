Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMdfJUiGoWlOuAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 12:55:52 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F41B6CF3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 12:55:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9sgznwjVWaziVaSITAyVOTs1zaBJc7vffjHuB4q51s=; b=LY1Adhvp0NfY38z2qQqH2vuNFH
	iQ85GB8REMfx+BsM41jvGkw7g0zhZDTbBvvzf8ZlNiyNNIR9ui8uRa6rBpUeXvNqAX6GKwe+0Zrm8
	57AwRc77o2WyvIGRZ8MPviSuUlddWB2wTBmiDrVdmo8vak2jL7uYW7GBp7owMlpiDQ5E=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvwRi-00035V-Nr;
	Fri, 27 Feb 2026 11:55:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1vvwRh-00035I-G6
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 11:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KUGu+I/AUtRwvximuI7ErURozsjn0dcbN9ISoxvkoio=; b=g0eAOIaXjSoCwRy15rWQ5v9+Ev
 8NSOuSutxpULuTjEsgWUqK667LfJJ3BjlFCfG6KyxJrkFjeYi0Qgy6z06wHJgkzY69RwLTLIhef4R
 m9t6FiKkLj5BfjPJyUM9IiuxRkM2qf10BTHRg2y/gKs2EKjsiHJL0c9FRVFCL/z23PRk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KUGu+I/AUtRwvximuI7ErURozsjn0dcbN9ISoxvkoio=; b=dsvUG+U+Y8HOZy3RED3reCUCtc
 4AKwjgAStScZAJgsgfRo2dPkrOEYVc2cHPcPXBHmZFC0lEd4j3hibC46VenfXHPvw7a3xcZqtm34f
 PrD/68Fa7Q+yjTkDtnMTWRPNiuS8aS/B2C2lsMBcF0DoV5Xd02i3KWE4Ex7UD1FojKiQ=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vvwRa-0001T2-5B for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 11:55:43 +0000
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-824a9348603so771139b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 27 Feb 2026 03:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772193331; x=1772798131; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KUGu+I/AUtRwvximuI7ErURozsjn0dcbN9ISoxvkoio=;
 b=arD39q2jMiZ78tXWg45Xf5UO+3AWFQQxOLWzEzKcM9bx91BysKtiE03eZ8zXs6sMMH
 phQkAwzk4sP6I1qqrO1E+1EpO2e9APVBpwqUevJfwKKkXPDuwwbg10mI/kqgKQojchCG
 gnLPyL0NXGTPGzY06ilIDBqH0aAXMQpngaALXR2ByZX7VvXLZWu3n1IQos4FdoopGCnn
 ttjWTyvdSnXiYaVEqWwEcU4Pe7ViSsJZr+2Yxe+JN4qcB842zoSJw1bH2oSZmLvad4CJ
 e16kAzJ8Lq4qp4Pwbn0SnKN/WujfpCBSB2OKNpkw0IfD0VI8SEmdUATs/DWVLARSgM9i
 LEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772193331; x=1772798131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KUGu+I/AUtRwvximuI7ErURozsjn0dcbN9ISoxvkoio=;
 b=R62YLUvkSbrsmbKEZv4G1Zg1lmadKPGLyfYnfKwmh8bVsoZurOKQqCyu+5hQOCF4jp
 riehU+sNjBjdjqC9y0swwpZ8Y+dvRLY6FFlD8qA/IwmuBc3kOge1s9kKOyVkSB5WXHef
 P8bKho6M/R8fXJ5z+llq7Uoqs30232zPYPY0CqZmpBlwNZbLYHEmPcU5nU82p7+Utt80
 fXk5ReoQAaddpknBfeNOWtmxPu2g/OptGUXxsgGBu97LzvhgX0uZO1vJgSX3063OvmcV
 Cz6ny3+AG9bCl5ZQMSC8jv6DQw0nvQFKxq5IW62ZwI2YmSr097kuLd2apL2TH9AXCb4Y
 kdhg==
X-Gm-Message-State: AOJu0Yzos3zLVuSAqeLN2oxnUePxh52f8fS3YDxjwy3RGRxUliLafuYV
 ws1SIvGXG6hj4F0YEwE0/jGjdh/H4nYbGGBnwIM8dzbBCdTer0GaMeeh
X-Gm-Gg: ATEYQzxsipt8WEn7Uy3hdtWDp7CYdMwMquY864vMhFbJTmyCHLOHnrPn+WxwxyZY3td
 1jw/G7vDYM/4Sk8M9Q/zD8c/8PRmNWu7HZrfrtxaxWlspvjB4ldVVDsJ0sQBFwkO6+jvo1UupMh
 1H5txR+b21rFbvMSfCfzgEKHdHmkeuM7qa/MCGN8/KZmK+PQX11seEh73K4pADGFtxMwkgKz65w
 lyHC9/6ZUBjI42d02YQ2yZMkmyTPOgoNRiHIUdP0ites8b+Hk4bbbOFflaBHeJ+grVfHlDIWpGL
 q9qsv8BXvBJcmtjUAS19RtaMBpS2wfTp55TSEe52tSAtcQcvzLpNtCV7QrjC0gVUXq6xon2IwfB
 mSMco+GFiWAMb1kiBOwEKVNE4vbg33WICJipswOC3YEoV88FxpscBLkY/zS/PZ/bxKH5bJskAWX
 mc0Oa1F7H1XYuoYCx5FKzLKbnzmqVfRNEZ
X-Received: by 2002:a05:6a00:94c1:b0:823:1276:9a86 with SMTP id
 d2e1a72fcca58-8274d9ebcdcmr2879830b3a.39.1772193331446; 
 Fri, 27 Feb 2026 03:55:31 -0800 (PST)
Received: from zyy.mioffice.cn ([2408:8607:1b00:8:f558:685f:3aab:ca1e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8273a0299d9sm5621040b3a.51.2026.02.27.03.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 03:55:31 -0800 (PST)
From: Yangyang Zang <zangyangyang66@gmail.com>
X-Google-Original-From: Yangyang Zang <zangyangyang1@xiaomi.com>
To: chao@kernel.org,
	jaegeuk@kernel.org,
	daehojeong@google.com
Date: Fri, 27 Feb 2026 19:54:30 +0800
Message-ID: <20260227115430.2622877-2-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20260227115430.2622877-1-zangyangyang1@xiaomi.com>
References: <20260227115430.2622877-1-zangyangyang1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Yangyang Zang --- fsck/resize.c | 50
 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+), 20 deletions(-) diff --git a/fsck/resize.c
 b/fsck/resize.c index 79db7eede65c..beb7ce047ec8 100644 --- a/fsck/resize.c
 +++ b/fsck/resize.c @@ -259, 6 +259,
 7 @@ static void migrate_ssa(struct f2fs_sb_info
 *sbi, block_t [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zangyangyang66(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zangyangyang66(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vvwRa-0001T2-5B
Subject: [f2fs-dev] [PATCH 2/2] resize.f2fs: add more logs in migrate_ssa()
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
X-Rspamd-Queue-Id: 105F41B6CF3
X-Rspamd-Action: no action

Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>
---
 fsck/resize.c | 50 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/fsck/resize.c b/fsck/resize.c
index 79db7eede65c..beb7ce047ec8 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -259,6 +259,7 @@ static void migrate_ssa(struct f2fs_sb_info *sbi,
 	block_t new_sum_blkaddr = get_newsb(ssa_blkaddr);
 	unsigned int expand_sum_blocks = MAIN_SEGS(sbi) - offset;
 	unsigned int new_sum_blocks = get_newsb(main_blkaddr) - new_sum_blkaddr;
+	block_t sum_blkaddr;
 	int new_sum_blkoff;
 	int ret = 0;
 	void *zero_block = calloc(F2FS_SUM_BLKSIZE, 1);
@@ -268,17 +269,21 @@ static void migrate_ssa(struct f2fs_sb_info *sbi,
 				offset / SUMS_PER_BLOCK)) {
 		new_sum_blkoff = 0;
 		while (new_sum_blkoff < new_sum_blocks) {
-			if (new_sum_blkoff < expand_sum_blocks)
+			if (new_sum_blkoff < expand_sum_blocks) {
 				move_ssa(sbi, new_sb, offset++, new_sum_blkoff);
-			else if (c.feature & F2FS_FEATURE_PACKED_SSA)
-				ret = dev_write_4k_block(zero_block,
-					GET_SUM_NEW_BLKADDR(new_sb, new_sum_blkoff),
-					GET_SUM_NEW_BLKOFF(new_sb, new_sum_blkoff),
-					WRITE_LIFE_NONE);
-			else
-				ret = dev_write_block(zero_block,
-					GET_SUM_NEW_BLKADDR(new_sb, new_sum_blkoff),
-					WRITE_LIFE_NONE);
+			} else {
+				sum_blkaddr = GET_SUM_NEW_BLKADDR(new_sb, new_sum_blkoff);
+				if (c.feature & F2FS_FEATURE_PACKED_SSA)
+					ret = dev_write_4k_block(zero_block,
+						sum_blkaddr,
+						GET_SUM_NEW_BLKOFF(new_sb, new_sum_blkoff),
+						WRITE_LIFE_NONE);
+				else
+					ret = dev_write_block(zero_block,
+						sum_blkaddr,
+						WRITE_LIFE_NONE);
+				DBG(1, "Zero summary block: %x\n", sum_blkaddr);
+			}
 			ASSERT(ret >= 0);
 			new_sum_blkoff++;
 		}
@@ -286,17 +291,22 @@ static void migrate_ssa(struct f2fs_sb_info *sbi,
 		new_sum_blkoff = new_sum_blocks - 1;
 		offset = MAIN_SEGS(sbi) - 1;
 		while (new_sum_blkoff >= 0) {
-			if (new_sum_blkoff < expand_sum_blocks)
+			if (new_sum_blkoff < expand_sum_blocks) {
 				move_ssa(sbi, new_sb, offset--, new_sum_blkoff);
-			else if (c.feature & F2FS_FEATURE_PACKED_SSA)
-				ret = dev_write_4k_block(zero_block,
-					GET_SUM_NEW_BLKADDR(new_sb, new_sum_blkoff),
-					GET_SUM_NEW_BLKOFF(new_sb, new_sum_blkoff),
-					WRITE_LIFE_NONE);
-			else
-				ret = dev_write_block(zero_block,
-					GET_SUM_NEW_BLKADDR(new_sb, new_sum_blkoff),
-					WRITE_LIFE_NONE);
+			} else {
+				sum_blkaddr = GET_SUM_NEW_BLKADDR(new_sb, new_sum_blkoff);
+				ASSERT(sum_blkaddr < get_newsb(main_blkaddr));
+				if (c.feature & F2FS_FEATURE_PACKED_SSA)
+					ret = dev_write_4k_block(zero_block,
+						sum_blkaddr,
+						GET_SUM_NEW_BLKOFF(new_sb, new_sum_blkoff),
+						WRITE_LIFE_NONE);
+				else
+					ret = dev_write_block(zero_block,
+						sum_blkaddr,
+						WRITE_LIFE_NONE);
+				DBG(1, "Zero summary block: %x\n", sum_blkaddr);
+			}
 			ASSERT(ret >= 0);
 			new_sum_blkoff--;
 		}
-- 
2.43.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
