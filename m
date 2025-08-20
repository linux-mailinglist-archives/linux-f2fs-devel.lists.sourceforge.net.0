Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A7DB2DCDC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 14:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pp8aRFaFx6Ozft0wJW6oy1XYeIK9Z4qEnivHWHPZbgs=; b=fEC+n8a2kJCFHihz01wrfcWEt0
	g4rcFFaPm3noCa4uISBMOc4ODtcPtS7hiLC5CUgudfe79opqM3IPnrTa7ZyjsNOeIRHSMlXve1l6P
	pS/UIknBqqyBfkyeiMde0o1YtAkai9NOqMjwiXN78QMFOUqLWwfMCvLWMCfTkHIrI9jU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoiAC-0003gV-Bw;
	Wed, 20 Aug 2025 12:43:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uoiAB-0003gP-Jt
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gSr5JT2mDdrHK24Nb/SvzrcUVJ9feUBdkdBLzLKmSnY=; b=I00/h/Q9i7cyL2LPNO4BLQBjY7
 6ebqCtnUqp0DPWsUsb/Bcu3Mje81hBAiovQIjbn3ZqG/+Eqyx3o7Z0B/xgyj19cuU8yOniXelzNCE
 Lp4gmnAIPj4pRY14fEEM/GJHT/5amYezduapB04039M0hCD+YgEdayub7h6TmIifozXE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gSr5JT2mDdrHK24Nb/SvzrcUVJ9feUBdkdBLzLKmSnY=; b=dWfZBiLHT2aj2CesAUEzmx4lWk
 s2RksFWQnGlla6XGddY8vka6zdAkhBWZZwntND1EnLQd9BvlH4/p2LlneBFOTKJPn8TvwlsRBEZ6n
 tdWtahpl7w1kc9KyFtQw3rgnvFWaQzFxQk5ENH0Zma/OL3N3bwdsudqh7FG0Z4rg2ZJA=;
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoiAB-0003o0-4c for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:35 +0000
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-24458317464so72298305ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Aug 2025 05:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755693804; x=1756298604; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gSr5JT2mDdrHK24Nb/SvzrcUVJ9feUBdkdBLzLKmSnY=;
 b=KLY9bSji//SqxcNcrGGu8vDPNoATYGo8HXAZO7Jhhiayc2C5m/ctf+DYC5EAPUPbbK
 HhbbcYt7T0u1JWvuOwOQgXwRVlrUyPWlUy2m/J/DKSZvDXVVK5XFlIBJk7KC1KhPbiF5
 V/mqWwqB65q0jb8BPP88Znoe34MV5wB9CvTzLGTRNRugQ9mOyOePjjpFCtLkgAVthaDm
 oG749AhjDN7dfrbDcsBsSmXwwGYQOe6G0wlmTH8Bu8Kduag9XrL5IC6nuuYyQhru6RJU
 x2eeJZeou7KkO5GT8Dm9M5Cm0J5zn9ZfRYMY4SdY5P92NhySoeOVVsbU75tDvh7Jkapl
 /9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755693804; x=1756298604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gSr5JT2mDdrHK24Nb/SvzrcUVJ9feUBdkdBLzLKmSnY=;
 b=NvyODImwXeYxPhFo4Bzkehpbh+X5QTX307DtcWWFQAwqNsikq3rTH4vJbOXLvJ/jFJ
 AoUgQAEehfQoQQzLSnKUtbpYMxQG1loem9D8Lx5EO6k/m0cayWlcFUMs161Odt3+mxJw
 bST0Y13rJaa00VQgHZ41gAeOxXJciv6xtTtxg0766UYqsGSYinEPzJhBS8bi0EeEQMHF
 58sCJRugvRUdmc6LK5JYVsy8J6az5o0DiqsJ3iPI4frOV39Ur/hO59GkyzczVap76r+9
 9MRaFJwe4TnEkPiZKnt0SeldMkrKzPDe8fWurl5tYlc9a0cKky7XgjboYS4N/Y5uhlEN
 gSKQ==
X-Gm-Message-State: AOJu0Yz/oC8Gp8wGe66ExKTiLbSeqT/DYh2kogWm6pc6oo3bLvHSpDnN
 6M/hhOBAbgcsyQx4ydfrHCfBOJzyA7wbsWFrz4qEpH+bXI3Lm9ViSdvdl/YtiA==
X-Gm-Gg: ASbGncti0AfsIvvtQoVNPkUaRCFEbypk1pST/FAluh3GnaAurzynY6ySLSmAg7KNRQR
 E5PQMqtvP4J6fHlDsmExywUdGthhjgdzLAJ0/+IKPdwVDKJWCz2azJ3j1uEZXPnZkXeu7+QmJ4m
 DkFnIEIhq0dL7tjShxPZvr1WEf+AqpfYebaQ9JO+cKpm2020HVvopfVOzbhNp7tEOBtnyidnczP
 KCAGXSh9HvOUTaVPx73LeK+qUFJfLOw6yEyC7i+AbOknu2h0Ko+ZM+Zh4q2bEemFErtRT6ugpI3
 PsERSGaUoM1h73pF+lhHcwzVt0PosuSjJiTQHGCQCiSbEihx0strrIAUqcFsevItHBzbsw06yoG
 a/pes5WrW5fNNiSgcLl3J7gGyKqYV
X-Google-Smtp-Source: AGHT+IHeUVTlNeDdqwZIIGhA6XZhwjgGDj6Rw2C+5U4sL9oBMPqQ05pg73SDJjn/+GN2YdjFnMeksQ==
X-Received: by 2002:a17:903:1103:b0:244:7bce:9530 with SMTP id
 d9443c01a7336-245ef1235d2mr28934095ad.18.1755693804300; 
 Wed, 20 Aug 2025 05:43:24 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51b3dfsm25962545ad.142.2025.08.20.05.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 05:43:23 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 20 Aug 2025 20:42:37 +0800
Message-ID: <20250820124238.3785621-13-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820124238.3785621-1-shengyong1@xiaomi.com>
References: <20250820124238.3785621-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong This patch adds new members in inject_node
 to inject inode: * i_ext.fofs: extent fofs * i_ext.blk_addr: extent blk_addr
 * i_ext.len: extent len * i_inline_xattr_size: inline xattr size *
 i_compr_block [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.179 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
X-Headers-End: 1uoiAB-0003o0-4c
Subject: [f2fs-dev] [PATCH v3 12/13] inject.f2fs: add members in inject_node
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

This patch adds new members in inject_node to inject inode:
 * i_ext.fofs: extent fofs
 * i_ext.blk_addr: extent blk_addr
 * i_ext.len: extent len
 * i_inline_xattr_size: inline xattr size
 * i_compr_blocks: compression blocks

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
v3: * fix print format
---
 fsck/inject.c     | 28 ++++++++++++++++++++++++++++
 man/inject.f2fs.8 | 17 ++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/fsck/inject.c b/fsck/inject.c
index cb348b3ba067..3c3f37790616 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -211,8 +211,13 @@ static void inject_node_usage(void)
 	MSG(0, "  i_size: inject inode i_size\n");
 	MSG(0, "  i_blocks: inject inode i_blocks\n");
 	MSG(0, "  i_xattr_nid: inject inode i_xattr_nid\n");
+	MSG(0, "  i_ext.fofs: inject inode i_ext.fofs\n");
+	MSG(0, "  i_ext.blk_addr: inject inode i_ext.blk_addr\n");
+	MSG(0, "  i_ext.len: inject inode i_ext.len\n");
 	MSG(0, "  i_extra_isize: inject inode i_extra_isize\n");
+	MSG(0, "  i_inline_xattr_size: inject inode i_inline_xattr_size\n");
 	MSG(0, "  i_inode_checksum: inject inode i_inode_checksum\n");
+	MSG(0, "  i_compr_blocks: inject inode i_compr_blocks\n");
 	MSG(0, "  i_addr: inject inode i_addr array selected by --idx <index>\n");
 	MSG(0, "  i_nid: inject inode i_nid array selected by --idx <index>\n");
 	MSG(0, "  addr: inject {in}direct node nid/addr array selected by --idx <index>\n");
@@ -1023,16 +1028,39 @@ static int inject_inode(struct f2fs_sb_info *sbi, struct f2fs_node *node,
 		MSG(0, "Info: inject inode i_xattr_nid of nid %u: %u -> %u\n",
 		    opt->nid, le32_to_cpu(inode->i_xattr_nid), (u32)opt->val);
 		inode->i_xattr_nid = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "i_ext.fofs")) {
+		MSG(0, "Info: inject inode i_ext.fofs of nid %u: %u -> %u\n",
+		    opt->nid, le32_to_cpu(inode->i_ext.fofs), (u32)opt->val);
+		inode->i_ext.fofs = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "i_ext.blk_addr")) {
+		MSG(0, "Info: inject inode i_ext.blk_addr of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid,
+		    le32_to_cpu(inode->i_ext.blk_addr), (u32)opt->val);
+		inode->i_ext.blk_addr = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "i_ext.len")) {
+		MSG(0, "Info: inject inode i_ext.len of nid %u: %u -> %u\n",
+		    opt->nid, le32_to_cpu(inode->i_ext.len), (u32)opt->val);
+		inode->i_ext.len = cpu_to_le32((u32)opt->val);
 	} else if (!strcmp(opt->mb, "i_extra_isize")) {
 		/* do not care if F2FS_EXTRA_ATTR is enabled */
 		MSG(0, "Info: inject inode i_extra_isize of nid %u: %d -> %d\n",
 		    opt->nid, le16_to_cpu(inode->i_extra_isize), (u16)opt->val);
 		inode->i_extra_isize = cpu_to_le16((u16)opt->val);
+	} else if (!strcmp(opt->mb, "i_inline_xattr_size")) {
+		MSG(0, "Info: inject inode i_inline_xattr_size of nid %u: "
+		    "%d -> %d\n", opt->nid,
+		    le16_to_cpu(inode->i_inline_xattr_size), (u16)opt->val);
+		inode->i_inline_xattr_size = cpu_to_le16((u16)opt->val);
 	} else if (!strcmp(opt->mb, "i_inode_checksum")) {
 		MSG(0, "Info: inject inode i_inode_checksum of nid %u: "
 		    "0x%x -> 0x%x\n", opt->nid,
 		    le32_to_cpu(inode->i_inode_checksum), (u32)opt->val);
 		inode->i_inode_checksum = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "i_compr_blocks")) {
+		MSG(0, "Info: inject inode i_compr_blocks of nid %u: "
+		    "%"PRIu64" -> %"PRIu64"\n", opt->nid,
+		    le64_to_cpu(inode->i_compr_blocks), (u64)opt->val);
+		inode->i_compr_blocks = cpu_to_le64((u64)opt->val);
 	} else if (!strcmp(opt->mb, "i_addr")) {
 		/* do not care if it is inline data */
 		if (opt->idx >= DEF_ADDRS_PER_INODE) {
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
index 0dcf3a23cff8..15f77d076e3c 100644
--- a/man/inject.f2fs.8
+++ b/man/inject.f2fs.8
@@ -145,7 +145,7 @@ summary entry ofs_in_node.
 .RE
 .TP
 .BI \-\-node
-Inject node block specified by \fInid\P.
+Inject node block specified by \fInid\fP.
 The available \fImb\fP of \fInode\fP are:
 .RS 1.2i
 .TP
@@ -185,12 +185,27 @@ inode i_blocks.
 .BI i_xattr_nid
 inode i_xattr_nid.
 .TP
+.BI i_ext.fofs
+inode i_ext.fofs.
+.TP
+.BI i_ext.blk_addr
+inode i_ext.blk_addr.
+.TP
+.BI i_ext.len
+inode i_ext.len.
+.TP
 .BI i_extra_isize
 inode i_extra_isize.
 .TP
+.BI i_inline_xattr_size
+inode i_inline_xattr_size.
+.TP
 .BI i_inode_checksum
 inode i_inode_checksum.
 .TP
+.BI i_compr_blocks
+inode i_compr_blocks.
+.TP
 .BI i_addr
 inode i_addr array specified by \fIidx\fP.
 .TP
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
