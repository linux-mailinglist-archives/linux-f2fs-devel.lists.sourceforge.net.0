Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNPCMrUpsWkBrgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 09:37:09 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E88B25F724
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 09:37:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NeTkza+3Mg1J84bUmzZlGBfuOJaCp1QjnwEEfHgkX8=; b=lCweWBspGVdSSTONIDjobQmeJo
	1W29+I+4Zdu9n5F6/HqAIYOw1LzhiAjxxds6tw78jml+JFYC8SIsaKITjqUPnLhP+KWTqPCGBtWhF
	L5DEWLbRQ1B82ZBPUE+A/qoMyJnJmAiRRv6+52JlYAJyod+LmAAhPw0mxJ2c9JD07p4Y=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0F3u-0004lJ-6w;
	Wed, 11 Mar 2026 08:37:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1w0F3t-0004l5-7k
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 08:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JCYcAvbRCcOnfBWDFgPma6Fe4RptSYf/Hz5xHbvf7PU=; b=D8wlSdfT6E9LiDoiXlwbffN49i
 f8ilVYS4LLQ1jXSNjv3ZEMJ0cLPRm91+TGzR9RhJSXPsLaz68CJjCQFkx7HH5abFz/XorfTONvVYn
 v3jeuedw91GBJh2XIxVRWx3EdOQaZHNw40703VLqfto62sdZ1xlHtoBSsh9LUJIzW7AQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JCYcAvbRCcOnfBWDFgPma6Fe4RptSYf/Hz5xHbvf7PU=; b=mixp85qR37ehmf6CNdlVOuUzdj
 hyBo1XZ2kaslMWEU9XMAA8zqxXOWPJ2NSfSPUTCVgp4Z3/M+49PUbTPsfTQ5+EkuqV30PdhLGnl2p
 Nbvh/1Io0FuxKtqgcR5G5Hk05qrAhguqHdDZBpXI8EpD2o/C80a8XftV+QuFYsSdz6nI=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w0F3s-0004hO-OY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 08:37:01 +0000
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-829abaaa92bso2492360b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Mar 2026 01:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773218210; x=1773823010; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JCYcAvbRCcOnfBWDFgPma6Fe4RptSYf/Hz5xHbvf7PU=;
 b=TSvKMkl48BxYUw+ZHroPeKtWCMlEFVq+OBA2KIrOll9VXT3HtxEwV98BTn877fVD6+
 fQCNoFBclStrDJPWSUrA/4WrduYRN520IPlis+t/QKGa/94Q6ozPdxp9Zpbw9UXNVC4x
 o87j+uNanXZzPPiUQuBl8N8lqX49CyaoQ3JzmjvoHjAeHzkTFxdxXcF0qP99+pxcbl5L
 WBAngUG92HEgUScKFViBSEdbQZmh5ylsvRsHSrHvW2Mdc04Lo0ddioTE78ueH/cb+C4V
 MAykaLbY3/bfqa+qzeydT5kHGGZV59ejyfRLT9EDHIkiBbik77b+Ao6qMSigXgwJxsHQ
 BHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773218210; x=1773823010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JCYcAvbRCcOnfBWDFgPma6Fe4RptSYf/Hz5xHbvf7PU=;
 b=jg7fN4h40CpK2SidqnoGY/8Mklb0VtRj98S6AoI8udEad8aYlQgkh3hX7YVjvcAhw1
 sJzr6PSuvHacistC8F4W9uE3yi0l3vqR3WUxjYi8hcl9U8037ei3Fv59jefjSQY52d+a
 cB6DlGwPFIohz2IzsHpTMTGUpFUVlaBTgmpXZzX22/vTS2nzeYVMQaOKbKV0IxDbgexz
 rUUTKGTTyJPlBYMCKz/zjBBYzZaZF+Df5kSX6PDIKaKlLp1/v5YJCN+gLB5GzpCK9kp3
 mYKyQm3qycCOIb0yShrTUS/3xxh1W/wZQ2KVnP6JUM+jBCs0CAeMS1doyY6qinajIucv
 Yr7g==
X-Gm-Message-State: AOJu0Yy5/3QrnN9iZDY85tniB1bkLYwAQ8L8QjthhpLLNrm7LUlq2o5a
 WH3jbzP7dTz53f8YU8T7n8N1ThQevCpLr64V9PiiC9oIU08yLsv6Vwhv
X-Gm-Gg: ATEYQzwp7UfN8ePOEpTaCWHxwkrqYQZENstwAif8vwxOkf/tWgDgqnl/oDqshcaMwyI
 0LgCnSZltymY5WT9YVYcnaH2N/4uG1WFMJiane0Z+gP/3vhAcZXY8ZrdhBu7jpv3Hn0ccIIK4KZ
 LFl7KrzTtfr0HCBvTd9styaUGyL3kIpwwGCu1aw7MZBfWs05gt133Z3q9tnkYHFn7U3MC7ThHM4
 Ri34U2EhWb0DXOLoiYZC7hozNioOhYhkDocPPtd10gGMUs/iRsfpxbilUPM2D8W8VTwxGlkfL2T
 V5lSpPg8yjLSTkOCcCpDcmnSeOv809YHQfsHnyCm3DGvqr65reK1KZARerFUy3yO2wF8vq8CfMe
 qKes3S8me/nD74X9u+yqq5E+M41aA20/6M2B5w5TfE0ZTo7jmk8hOL+L7T0VpjaqJa5YGCi87QR
 0CUbKEE99XKwFlUKA7+OYStO20qB4q0oY=
X-Received: by 2002:a05:6a00:2495:b0:824:9451:c1e9 with SMTP id
 d2e1a72fcca58-829f7117d75mr1280940b3a.62.1773218210050; 
 Wed, 11 Mar 2026 01:36:50 -0700 (PDT)
Received: from zyy.mioffice.cn ([2408:8607:1b00:8:d2d5:a44:599c:b689])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829f6dc2d76sm1592503b3a.8.2026.03.11.01.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 01:36:49 -0700 (PDT)
From: Yangyang Zang <zangyangyang66@gmail.com>
X-Google-Original-From: Yangyang Zang <zangyangyang1@xiaomi.com>
To: chao@kernel.org,
	jaegeuk@kernel.org,
	daehojeong@google.com
Date: Wed, 11 Mar 2026 16:35:30 +0800
Message-ID: <20260311083530.2582720-3-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20260311083530.2582720-1-zangyangyang1@xiaomi.com>
References: <20260311083530.2582720-1-zangyangyang1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add logs for zeroing SSA blocks and add an ASSERT to prevent
 the issue of zeroing main area blocks from recurring in the future.
 Signed-off-by:
 Yangyang Zang --- Changes in v2: - Add commit message --- fsck/resize.c |
 50 ++++++++++++++++++++++++++++++ 1 file changed, 30 insertions(+),
 20 deletions(-)
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zangyangyang66(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zangyangyang66(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w0F3s-0004hO-OY
Subject: [f2fs-dev] [PATCH v3 3/3] resize.f2fs: add more logs in
 migrate_ssa()
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
X-Rspamd-Queue-Id: 6E88B25F724
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

Add logs for zeroing SSA blocks and add an ASSERT to
prevent the issue of zeroing main area blocks from
recurring in the future.

Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>
---
Changes in v2:
 - Add commit message
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
