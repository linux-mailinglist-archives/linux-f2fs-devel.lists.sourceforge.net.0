Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0195B333C7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 03:56:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5adZ1iS2Oc0SHC+PU7DuGmpLT1GcuJESZPuQ84hRfqw=; b=cbZ7/CR2LDKd9Ww+n7b3kZnJwe
	GJC8YJ5ELtKxaFKD76m7Ns/EpNN27YPnIhVZtM1Vq3DwSWX8uldXaznN9wQFUqWnuONDki+rH7nNE
	n0mqOx3rpHOsaxq4petSoaYKYnln/yQQbqdcfO1o/LFA1Kk8F/pFDcJG24F9A9imPXgU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqMRq-000140-Q8;
	Mon, 25 Aug 2025 01:56:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uqMRq-00013r-7P
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ryAXKgq3p3vINNdxdnriRkWdGMdOu41obusm3kbjzrM=; b=UMbKaIOpIi0UNqSiveWTjilkve
 LHnKhYBk6JFghgBeX7cKmapg7OWc1CRnN+f76kB+6FvdHVt2i8acwNZc6lBO6n2XklBV84T8P+Tju
 Am4vwF9D/+YguRZPCLRlK0DMwS7v5SvIz4PRFaFglxH5809aOQ8KX2MzrnO0/0G0lBSk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ryAXKgq3p3vINNdxdnriRkWdGMdOu41obusm3kbjzrM=; b=F49p1wM68XdyTXYUOqjAosDoG1
 kzfeFPAcJwnv9NZ3nj6vnCVY3ZY7w61+AQhwdOqQ9qh1/GIL7dXu+14ul+djyq5iwwfOGwPAMQ6iB
 RBrcNL+ct8x+tMhdVM75/f/ND9woqSyewga7c822e02ezX7rNoP+xjPAFhOYF03V1OcQ=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uqMRp-0002qp-Ce for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:38 +0000
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-76e2e88c6a6so3297866b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 Aug 2025 18:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756086987; x=1756691787; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ryAXKgq3p3vINNdxdnriRkWdGMdOu41obusm3kbjzrM=;
 b=iBKd1rlgcEjte6Sz/3VYSEIiXW3copg/+uBIq5xF+/vht3/oHJ8MwGPcGzOqTrAbod
 i6dok9d63uvGzVWeh9+RQB1UJ0gwdLkglnDszKJDnFpHK04xP5QvQWGAzzjau+pugPUj
 EP3Wh3mJxSTHWjJksBpvmk3aKJK1befk6sepJ+aBMfq1Od+jtjHkNOnWdVDk62MRpSYD
 ocrGBHj9+M9WpvesCvJpObnMGASPJYpXeRJpyEi58A2XPn39vjDD0wQHNX/1PD3hUPdO
 RDqJk301+e+bn7TCco7RPQWbFSsBAmCWWWbaZ7KNjwevKqBPgiG+rLG6fmWLvZe4Ym+w
 Cpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756086987; x=1756691787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ryAXKgq3p3vINNdxdnriRkWdGMdOu41obusm3kbjzrM=;
 b=Nq807xJ9F/Ihl2HK7qPCt818iTCt2jIheXcFXoMfiw07IxwsnVUAX04TsQAuJOofHI
 BflCbt1BnaAEWi9lEL4CjwB7uAEJloSScA+N+QmLJDB0phdY5NO6lJOhZE782m2oYrvD
 yqvYEgGwhSLZ9e7qRAArBw6kVfGsqremc0/tRez57PhLM+HSVTm+70pMsxuQ9VNyXgCM
 kuDL2N3gZn5PaeB1QFZs8L6CdjC5YvYG+A6lV6oh6rv5T1/GooeDHkQ4+mSAFTAyfg8A
 h3Aa/SzaB9Dn5dFNcvDodCGRVt71BS+d8FBiAiBRG0k9s0LvdL7HqdYOLw7BHdEouu01
 Fafw==
X-Gm-Message-State: AOJu0YyiBQyUzmfiYHDXWukpK+Nu6ibjUnL8SczcmmSay1l5U0ZYzb20
 n/ToW+KiVdywJ+l6vedGcJPYn9gYqeIb2Ca+ZSKQVitBTglIz1naF05i
X-Gm-Gg: ASbGncuswHz8PhBCC08H2S70r/7CxOmNy4I9KYuwwrxzN6ZWNHXHxYGhYNfRCbBj1OV
 /mkxsg3ZCHumE0+wIDrlSD/qJQqnmY1aSejA3i0Tew+EwMj+zDoRoS4b149kLW6BGg8TWvxg6/t
 TN5t8jJJ/hbOXJhwtkSjYNKQXE5WBrnM9VVT5vJ0+S3yDziLRLcYl7J3jMTyLFVtAvt9MU3eb6B
 GloEfyYI8Rqz+vHOVb+1tRNH12rINZXxaSzghDTB0K6zC7e7ul+4dxMO5ctJ+bGo2IAbXHPtV6j
 pF8EgXMLN9OXWksxl7j9XvxV6Hw2EGUHCFiuGXXNY1khOqT861TSnnaRtZy/DWqjZwth2pCb4k+
 3lSNQYIl9Gg6nZdX0ARE2xE13y7lw
X-Google-Smtp-Source: AGHT+IFG0MdmuJnneNTKMzpPLXI5Ci+4ocn8I7E7+xoYtaLJKJ8a8MukfScU+hLwNFVi9k6Qdd8pSA==
X-Received: by 2002:a05:6a20:939d:b0:243:78a:8294 with SMTP id
 adf61e73a8af0-24340e2f1a5mr16309269637.59.1756086986653; 
 Sun, 24 Aug 2025 18:56:26 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b49cb8b1989sm5147883a12.18.2025.08.24.18.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 18:56:26 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 25 Aug 2025 09:54:54 +0800
Message-ID: <20250825015455.3826644-13-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825015455.3826644-1-shengyong1@xiaomi.com>
References: <20250825015455.3826644-1-shengyong1@xiaomi.com>
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
 [209.85.210.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.210.182 listed in list.dnswl.org]
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
X-Headers-End: 1uqMRp-0002qp-Ce
Subject: [f2fs-dev] [PATCH v4 12/13] inject.f2fs: add members in inject_node
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
Reviewed-by: Chao Yu <chao@kernel.org>
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
index a61d948224b6..232d071b4588 100644
--- a/man/inject.f2fs.8
+++ b/man/inject.f2fs.8
@@ -148,7 +148,7 @@ summary entry ofs_in_node.
 .RE
 .TP
 .BI \-\-node
-Inject node block specified by \fInid\P.
+Inject node block specified by \fInid\fP.
 The available \fImb\fP of \fInode\fP are:
 .RS 1.2i
 .TP
@@ -188,12 +188,27 @@ inode i_blocks.
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
