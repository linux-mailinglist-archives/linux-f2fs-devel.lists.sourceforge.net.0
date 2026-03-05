Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEopHDErqWkC2wAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 08:05:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E28F20C238
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 08:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NeTkza+3Mg1J84bUmzZlGBfuOJaCp1QjnwEEfHgkX8=; b=iIIPyn0v1HMAAJwftROXGl/nHb
	kWqIjDeGU6umW1Fa+Xde3QqFJSR6eyojhLMVX2+oG7Lz6Q8kbk11zza+A6d9ZsDpeyayS5aXXctv8
	yX4WUwWPMA+MGy8+zWPKTR9sGs3JsxBdvomByThNySbINARgbpPSAaoLUrpncjtEEvfM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vy2lh-0002UG-JK;
	Thu, 05 Mar 2026 07:05:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1vy2lg-0002UA-Si
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 07:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JCYcAvbRCcOnfBWDFgPma6Fe4RptSYf/Hz5xHbvf7PU=; b=js1HYsd9q2DE9uzr/TeM7F66aR
 sWsz3CQKmBCJH4MhPq+ieJrtQbr7oQq50qtNCBXvjbgWoT9HzXoHc8E25214z6pc1dWhyBVk35ay8
 5AKkfXeLzsPqFArM1K5ySaCioTHicVb7/65G5DawNl3sIfYHtitLE37kPRj5r1h9/KrQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JCYcAvbRCcOnfBWDFgPma6Fe4RptSYf/Hz5xHbvf7PU=; b=DpCkkFdYEqKKE4XPZR834fY+kL
 GXY/uB+qWAiXpT6YNyf228klbuVu7SnOru4TetGLFhV6qIy+eMgRplFR02WnWXrVfPn8rzLBQwNOv
 lOtumOWn7ECSU84E8PpQr40TrSFk3sfX2Ej9QjsNiHcRmhdTsqF+qFdJ53lbkBWcoRvA=;
Received: from mail-pg1-f173.google.com ([209.85.215.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vy2lg-0003TC-Dg for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 07:05:08 +0000
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-c70f91776fcso3021318a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Mar 2026 23:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772694303; x=1773299103; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JCYcAvbRCcOnfBWDFgPma6Fe4RptSYf/Hz5xHbvf7PU=;
 b=SgWIT2UpHERf35ynTfx+658jV9b+7aztrUgXODoV0DCNoD3QqnFj1d0IYnxGLDhKGd
 mDq+yX/PfdT/WtDsZT0Xdbx4gSE5yhd4gCcHNa9eJGef68g9zkemm8eKURY0+qPLAFjA
 0pOnVY+SgKBFOZ5oWSOOO07A95amIe77mNAovsdqQ/sPZxpnKDqVYtcDa9L76mLqQvaW
 X1FPpvDCT1qtXtHDXPnwiMkqTfyUru6/KTHVDhGX6YVg2YZEJkBeRpcjMtS/2LKQcDcy
 LWJuwZAM3/V4E2q2y5uAFC+cqeYAAQWJr0PKi4SFfYuSCFbZCCEP17cKNCSsJ26KqRIN
 Auig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772694303; x=1773299103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JCYcAvbRCcOnfBWDFgPma6Fe4RptSYf/Hz5xHbvf7PU=;
 b=FTSmRronAMRuFRDStdLnUrweZA12V7Ffh1MBJW31+2xrnHZWVe/lgZHiEEPFR7altq
 F5Spd9dwSv7QushYUUmhQQoa6OAqI2lHB8Zj6JX0D836wOnypcQCabcf4UTHTXVJnCnx
 RIJ/BPc2WerPy/LbcodgnhMNbLtw4/WFwq/+GpyaWpS/HuXIg2G2WIx7RDhHFl0058Ik
 oz9w/iu8MlQVDkTlq0SS+hxjHGaaA2OoEBvbpr0mWwX+voMtzbdLHQE236uhHBXaU5oc
 4FRUw2k+2CTSHxdOFaOYiRmSX84fLqsUqqtS673jsPwKrhBIbp7R2qUouTXyqHVRPh2Z
 x8Zg==
X-Gm-Message-State: AOJu0YydEBpN5DsPIufaIVoiuxKT862g6Ds02tZMC+8TGpil2GP28k69
 07hI1XlycTUe40EkbLsn+IcQs9Tuv7LRIj/HB+Kx/JG//vu8BJYco7reCO5Oig==
X-Gm-Gg: ATEYQzzom0ekruxNyY6MIWzt3glYiHWEfEgspLFnaTIjPIC6NHO4yIMwnVrlSRv3hm0
 DsNj/iDger9RDRFH+DcX0C3b2UJOPXhNmP2zfYKGNf1kSPWKgggfvs981DKwxHA4pObkdI/gbgS
 CisrAEYOV8ARNb4Qy1x8/E9nj4/uzzXhh7M+GFv2ZjrHT8vUYMwP7i/DCMjUSWLv28MdyZiKg4H
 jT7LyByOTjGmJI29XXYdTLo4dWfRhyOTNWNpSJoKCohSiPxWxCFkXBCjHkjNBOU8yx9uX3AQHmF
 bBxwyIFU1ofha5G0Lh/vK/ZI2Pg0KlFsnBYpzQSnlL9gC59/LzM0ysORJJYiXoOIls0o8HRgxJ4
 pVch1k1NnIquk3cG8d3cO55dXNAwka72lo5pFhDi/k1kcI1qLTv/mMpC8veZTb41rjoNS6fzaJj
 16DGbsw56GcxXVv2N8QeurHWRJVjrJlXKE
X-Received: by 2002:a17:903:388f:b0:2ae:5aed:1f4d with SMTP id
 d9443c01a7336-2ae6ab02dd2mr49779195ad.42.1772694302708; 
 Wed, 04 Mar 2026 23:05:02 -0800 (PST)
Received: from zyy.mioffice.cn ([2408:8607:1b00:8:dd2e:1683:5c58:b59d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae46500068sm131813185ad.52.2026.03.04.23.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 23:05:02 -0800 (PST)
From: Yangyang Zang <zangyangyang66@gmail.com>
X-Google-Original-From: Yangyang Zang <zangyangyang1@xiaomi.com>
To: chao@kernel.org,
	jaegeuk@kernel.org,
	daehojeong@google.com
Date: Thu,  5 Mar 2026 15:04:26 +0800
Message-ID: <20260305070426.1890753-2-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20260305070426.1890753-1-zangyangyang1@xiaomi.com>
References: <20260305070426.1890753-1-zangyangyang1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vy2lg-0003TC-Dg
Subject: [f2fs-dev] [PATCH v2 2/2] resize.f2fs: add more logs in
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
X-Rspamd-Queue-Id: 5E28F20C238
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
