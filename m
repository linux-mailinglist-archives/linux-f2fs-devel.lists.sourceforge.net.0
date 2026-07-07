Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8bltItiCTWq11QEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 08 Jul 2026 00:51:04 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B92D72049B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 08 Jul 2026 00:51:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="LJbGxY/J";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=TVNiETtU;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="D +RSIyB";
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b=jfgagTUF;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=samsung.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:References:Date:Message-ID:To:From:Mime-Version:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=wzPCSxgvL270ma8dDDRfUh0OMgvEKJQ1UBd5FLQViYQ=; b=LJbGxY/JViWq7DuuPuZA3zyOUl
	byfH64903qsfztldLHgXF4UYO9KWuuZhV5PahoB9UOS0wDelTtdHzoJH2bWwXy2r9ARlPDrLUJQT1
	N1ZYqGfxRWfN705IaAYgVDjWPsVQg97SaJkB1dtyzQMWwJvH1+zD/fMjZotzBBhhhEDc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1whEct-0004UH-01;
	Tue, 07 Jul 2026 22:50:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1whEcq-0004UA-0u
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jul 2026 22:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IEudq681X/1Ew4NuGJGDJlCKidXrN0Ytfz60y12p3wI=; b=TVNiETtU3B9q5JR2Tq/pKBpCRb
 6xIuUpQnIomO1fBxWvA+DExqAJABjhbBI36BYr3C3gsd0YzAoOli7U1Jfd19V8J4hdXYDpU0ZrmPj
 oMlPI8HR4koniKxcFN2fEX7UnuCWvvbg35IxSQAHrBj74Ptf52UQJDuiYKMNMW1rmmaA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IEudq681X/1Ew4NuGJGDJlCKidXrN0Ytfz60y12p3wI=; b=D
 +RSIyBAIQGzAnM/bk25I41sH+o3j4CUzBCSMosTxKCDNf4YdVQlYTgLi00NFT9Ijpin3TDaggDw0/
 g+YpjgEASVd2UQeFqC8JcUcJ7KzhkGKWvS1eI3DmE3SxHUamQx8fQJ3DWzGUpcthW0OJCdAMlQ2q2
 mxrAAvmS5TUb/o9s=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1whEcm-0000r7-8h for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jul 2026 22:50:45 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20260707225036epoutp0123a98dc400d35a019f85ad4b37e49dfb~AI6NZefPd1393813938epoutp01s
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  7 Jul 2026 22:50:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20260707225036epoutp0123a98dc400d35a019f85ad4b37e49dfb~AI6NZefPd1393813938epoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1783464636;
 bh=IEudq681X/1Ew4NuGJGDJlCKidXrN0Ytfz60y12p3wI=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=jfgagTUFKgoiKkQrt7UzimFtu9GV31s5/RnDthrmY/sBTwoj84A9eDkU8eQJIs5Cy
 ktmnnPHjpXfIPptCcX3khdBF4/dYNReJzQMb5a9JKUidTGghCLmXKOA+8yO8Cawm7B
 u5wvtxFVmETZEzHz/N4trbHswanLI9MEWnWwvDWQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
 20260707225036epcas2p185d145828b1d3162ccf75d212de96860~AI6M6v7rc2339923399epcas2p1q;
 Tue,  7 Jul 2026 22:50:36 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.202]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4gvxJr0fzWz2SSKY; Tue,  7 Jul
 2026 22:50:36 +0000 (GMT)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260707225035epcms2p812b92e6001afb57eb06d98225f1acd87@epcms2p8>
Date: Wed, 08 Jul 2026 07:50:35 +0900
X-CMS-MailID: 20260707225035epcms2p812b92e6001afb57eb06d98225f1acd87
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260707225035epcms2p812b92e6001afb57eb06d98225f1acd87
References: <CGME20260707225035epcms2p812b92e6001afb57eb06d98225f1acd87@epcms2p8>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The mount option bitmasks mount_opt.opt and
 f2fs_fs_context.opt_mask
 are unsigned long long, but the bits are manipulated with BIT(), which is
 unsigned long. On 32-bit architectures a 33rd mount optio [...] 
 Content analysis details:   (-0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1whEcm-0000r7-8h
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: use BIT_ULL() for mount option bits
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
Reply-To: yonggil.song@samsung.com
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Seokhwan Kim <sukka.kim@samsung.com>,
 Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	MV_CASE(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,samsung.com:s=mail20170921];
	HAS_X_PRIO_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:sukka.kim@samsung.com,m:dongjin_.kim@samsung.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yonggil.song@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,samsung.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[yonggil.song@samsung.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yonggil.song@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B92D72049B

The mount option bitmasks mount_opt.opt and f2fs_fs_context.opt_mask
are unsigned long long, but the bits are manipulated with BIT(), which
is unsigned long.  On 32-bit architectures a 33rd mount option would
shift past the type width, which is undefined behaviour:

  fs/f2fs/f2fs.h:2945:4: warning: shift count >= width of type
  [-Wshift-count-overflow]

Switch test_opt()/set_opt()/clear_opt(), the fs_context helpers and the
direct opt_mask users to BIT_ULL().  No functional change with the
current 32 options; this prepares for adding more.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607071623.ZxOpKv3S-lkp@intel.com/
Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 fs/f2fs/f2fs.h  |  6 +++---
 fs/f2fs/super.c | 28 ++++++++++++++--------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e40b6b2784ee..20a1e2353f60 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -142,11 +142,11 @@ enum f2fs_mount_opt {
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)		\
-	(F2FS_OPTION(sbi).opt &= ~BIT(F2FS_MOUNT_##option))
+	(F2FS_OPTION(sbi).opt &= ~BIT_ULL(F2FS_MOUNT_##option))
 #define set_opt(sbi, option)		\
-	(F2FS_OPTION(sbi).opt |= BIT(F2FS_MOUNT_##option))
+	(F2FS_OPTION(sbi).opt |= BIT_ULL(F2FS_MOUNT_##option))
 #define test_opt(sbi, option)		\
-	(F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
+	(F2FS_OPTION(sbi).opt & BIT_ULL(F2FS_MOUNT_##option))
 
 #define ver_after(a, b)	(typecheck(unsigned long long, a) &&		\
 		typecheck(unsigned long long, b) &&			\
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ccf806b676f5..62d3a58cb1b2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -416,21 +416,21 @@ struct f2fs_fs_context {
 static inline void ctx_set_opt(struct f2fs_fs_context *ctx,
 			       enum f2fs_mount_opt flag)
 {
-	ctx->info.opt |= BIT(flag);
-	ctx->opt_mask |= BIT(flag);
+	ctx->info.opt |= BIT_ULL(flag);
+	ctx->opt_mask |= BIT_ULL(flag);
 }
 
 static inline void ctx_clear_opt(struct f2fs_fs_context *ctx,
 				 enum f2fs_mount_opt flag)
 {
-	ctx->info.opt &= ~BIT(flag);
-	ctx->opt_mask |= BIT(flag);
+	ctx->info.opt &= ~BIT_ULL(flag);
+	ctx->opt_mask |= BIT_ULL(flag);
 }
 
 static inline bool ctx_test_opt(struct f2fs_fs_context *ctx,
 				enum f2fs_mount_opt flag)
 {
-	return ctx->info.opt & BIT(flag);
+	return ctx->info.opt & BIT_ULL(flag);
 }
 
 void f2fs_printk(struct f2fs_sb_info *sbi, bool limit_rate,
@@ -1422,7 +1422,7 @@ static int f2fs_check_compression(struct fs_context *fc,
 			ctx_test_opt(ctx, F2FS_MOUNT_COMPRESS_CACHE))
 			f2fs_info(sbi, "Image doesn't support compression");
 		clear_compression_spec(ctx);
-		ctx->opt_mask &= ~BIT(F2FS_MOUNT_COMPRESS_CACHE);
+		ctx->opt_mask &= ~BIT_ULL(F2FS_MOUNT_COMPRESS_CACHE);
 		return 0;
 	}
 	if (ctx->spec_mask & F2FS_SPEC_compress_extension) {
@@ -1490,43 +1490,43 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 		return -EINVAL;
 
 	if (f2fs_hw_should_discard(sbi) &&
-			(ctx->opt_mask & BIT(F2FS_MOUNT_DISCARD)) &&
+			(ctx->opt_mask & BIT_ULL(F2FS_MOUNT_DISCARD)) &&
 			!ctx_test_opt(ctx, F2FS_MOUNT_DISCARD)) {
 		f2fs_warn(sbi, "discard is required for zoned block devices");
 		return -EINVAL;
 	}
 
 	if (!f2fs_hw_support_discard(sbi) &&
-			(ctx->opt_mask & BIT(F2FS_MOUNT_DISCARD)) &&
+			(ctx->opt_mask & BIT_ULL(F2FS_MOUNT_DISCARD)) &&
 			ctx_test_opt(ctx, F2FS_MOUNT_DISCARD)) {
 		f2fs_warn(sbi, "device does not support discard");
 		ctx_clear_opt(ctx, F2FS_MOUNT_DISCARD);
-		ctx->opt_mask &= ~BIT(F2FS_MOUNT_DISCARD);
+		ctx->opt_mask &= ~BIT_ULL(F2FS_MOUNT_DISCARD);
 	}
 
 	if (f2fs_sb_has_device_alias(sbi) &&
-			(ctx->opt_mask & BIT(F2FS_MOUNT_READ_EXTENT_CACHE)) &&
+			(ctx->opt_mask & BIT_ULL(F2FS_MOUNT_READ_EXTENT_CACHE)) &&
 			!ctx_test_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE)) {
 		f2fs_err(sbi, "device aliasing requires extent cache");
 		return -EINVAL;
 	}
 
 	if (test_opt(sbi, RESERVE_ROOT) &&
-			(ctx->opt_mask & BIT(F2FS_MOUNT_RESERVE_ROOT)) &&
+			(ctx->opt_mask & BIT_ULL(F2FS_MOUNT_RESERVE_ROOT)) &&
 			ctx_test_opt(ctx, F2FS_MOUNT_RESERVE_ROOT)) {
 		f2fs_info(sbi, "Preserve previous reserve_root=%u",
 			F2FS_OPTION(sbi).root_reserved_blocks);
 		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_ROOT);
-		ctx->opt_mask &= ~BIT(F2FS_MOUNT_RESERVE_ROOT);
+		ctx->opt_mask &= ~BIT_ULL(F2FS_MOUNT_RESERVE_ROOT);
 		ctx->spec_mask &= ~F2FS_SPEC_reserve_root;
 	}
 	if (test_opt(sbi, RESERVE_NODE) &&
-			(ctx->opt_mask & BIT(F2FS_MOUNT_RESERVE_NODE)) &&
+			(ctx->opt_mask & BIT_ULL(F2FS_MOUNT_RESERVE_NODE)) &&
 			ctx_test_opt(ctx, F2FS_MOUNT_RESERVE_NODE)) {
 		f2fs_info(sbi, "Preserve previous reserve_node=%u",
 			F2FS_OPTION(sbi).root_reserved_nodes);
 		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_NODE);
-		ctx->opt_mask &= ~BIT(F2FS_MOUNT_RESERVE_NODE);
+		ctx->opt_mask &= ~BIT_ULL(F2FS_MOUNT_RESERVE_NODE);
 		ctx->spec_mask &= ~F2FS_SPEC_reserve_node;
 	}
 

base-commit: cb8ff3ead9a3fc43727980be58c7099506f65261
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
