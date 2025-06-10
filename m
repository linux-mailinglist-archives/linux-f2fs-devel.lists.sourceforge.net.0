Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6EEAD3C8E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:18:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C728Fn0PxZYx31jbU1wHDfpaq/PyJJDRrgvzlnijTKA=; b=Q0axfL2UsFEQS/01HkXo1eoNnM
	hsQHlfvEF3mDUTY5IZyqUccmg88OHbCuFRlWEd5H62ZkLBKnwFLMcAdMP2Z6xynhHSzlovI6D16Q8
	mYZYve6iqdkcN8FwfKnJm1noDypfEQM0TPte09nYmQyQcNMKv8IOPI8ycErCLer6iyJw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0kC-00065T-Bu;
	Tue, 10 Jun 2025 15:18:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0kB-00065L-Hn
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SVrlDQ1iMaAnOcdQP1y1Vazx9sQfwLAK4wYur8e0Rss=; b=V+peUkaoy9meQblugpwCozr03R
 G5p+CFF4oYgRkKxTeNp62ggzU7SK5tHoor4P7+RTkXWoadI509kHDqfwsGCQs5ZipH7Ppo1+z5XrI
 NOLlICVtqQyVstgejOCyphZYxtOhOIb0CW/vEpK9BV4EwomJypDpIcYG3sFI1HQIgdcA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SVrlDQ1iMaAnOcdQP1y1Vazx9sQfwLAK4wYur8e0Rss=; b=kYBqkzN+uEAajyanzglmjDpSSC
 sv9835kbgDy8gqvDG+hJdVtPRMeaFlVKh5IeKn3WXhsDPZ1JcPZo9pJxT7ajWUftpD57GAl/4LoR3
 8q1mBvSaVXVI5xXnI6BqO2QiLjZsGsMCznrU2ch1r4vsSEs4a7VK0bp7M6OZmiBBmbjI=;
Received: from mail-oo1-f41.google.com ([209.85.161.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0kA-0003aa-WD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:18:31 +0000
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-60efc773b5fso3035303eaf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749568700; x=1750173500; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SVrlDQ1iMaAnOcdQP1y1Vazx9sQfwLAK4wYur8e0Rss=;
 b=fgkdew76g681jcxgu2lztNejNuAxFWJX8QJakVGsSJpzQI0S9f28FmBVNf+nXBPmSX
 6iymhVeSZEhSWgVonNUy7clRoq+dVQZzG4rlMEk1JnA01xsMILdxVFr6hgemiy7KjaQF
 2GyPW1mRrgS5ZC5gKPQdLd56BQbhLnFHhWNBbgrtcuA49joqC7Fak+hoqSeJyjYXLIf7
 S3W0eMMiZYr4XTumA+76fxTXnpohZOoKJHjFGE3rW+wxdk4VTr2oDiggzNwqo6aN4XAf
 4I1dskV09F7O39N7lzzwnzgbEVlfjpDJtIJmV4Gr9K4CYrG+5TSLWefSBS/2L965GAFD
 Cm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749568700; x=1750173500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SVrlDQ1iMaAnOcdQP1y1Vazx9sQfwLAK4wYur8e0Rss=;
 b=PmQABM5IIlj+wdPs3492b8999AJEXxEPAh3PTb5O5RdJL6wHu5IxhKVfgctiIIMtmf
 Az8p/maDz97O+xze1ix2abfhX85qJprjWA8FOxjIe83aGGlHlT6zRAU0oinmTAATNSXR
 ZZgvNcxNNMPfqW77A6NwKVTdSVpinN3VsG6l4colMQA2nfmPX4maB2vmCpuRhdtiw5MA
 nOytF29ziPiqNkbHZmSglmIoG0tQHOAjWaDSnwKJMzssUSnLIlXConTGN7toHC9LjGCw
 I8kkXrYDeDaC3XqftWPVtX42x5sjxAL939prhx1YX35ab3WnIt8RAL5A9dIZjmcKiXkK
 OCLw==
X-Gm-Message-State: AOJu0YxiVtA8z9k9iOiMgpnRrGmJXyE19s9SiXC16aWPGQDF/A6seSb3
 XeLbbr0B9uGbHYXp0kL5aoFSEJToELE4KXWr/MrDBfcD2rRUpVuN12udi51L3A==
X-Gm-Gg: ASbGncsIiKFsqmHsP+OI+O09quArBuejgoiyvn2A/c0kP4FK7BlnwXFWMSyz6Mq5F64
 p5xFu59UejbSq6xwsCLmGfVPlIw6LPtqjZMtxWEDlICnXLlRTYSkgxSlzMPfg+zDJO/uTwN8Nkw
 CGNIFzOEcwAtKn7JVVWbLYxLKeLGC86wyQ7Q3SlDJxKXuGzZc9hYsPZ2RQXQPxHFP1iyirX/3t1
 7dj5bwfz7jnxKHwJDzfCstxmasjCS/6B8s/m7uRN68sARlMcOKhJxSqgdoaLspWK5RMyEDGkPkW
 qlttBF+/k5wrkVcDQ01qzOx9NdeByGwnre0LubhYU1qij8NPUSdLC8Zdtexvs9i8/NWE
X-Google-Smtp-Source: AGHT+IGlKLqsTxTBX/GlphoB2jFy9O+x7HnS6Rj88OAZHtqDleisf13Pa3xb7umzj+gGXMXWJ1ik7A==
X-Received: by 2002:a05:6a21:50f:b0:21a:de8e:44b1 with SMTP id
 adf61e73a8af0-21ee686203dmr25607870637.34.1749559106012; 
 Tue, 10 Jun 2025 05:38:26 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:25 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:22 +0800
Message-ID: <20250610123743.667183-13-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610123743.667183-1-shengyong1@xiaomi.com>
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.41 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uP0kA-0003aa-WD
Subject: [f2fs-dev] [RFC PATCH v2 12/32] inject.f2fs: add members in
 inject_node
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
 fsck/inject.c     | 28 ++++++++++++++++++++++++++++
 man/inject.f2fs.8 | 17 ++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/fsck/inject.c b/fsck/inject.c
index 0b5aecbf8061..8c2f8c5dc332 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -198,8 +198,13 @@ static void inject_node_usage(void)
 	MSG(0, "  i_links: inject inode i_links\n");
 	MSG(0, "  i_size: inject inode i_size\n");
 	MSG(0, "  i_blocks: inject inode i_blocks\n");
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
@@ -967,16 +972,39 @@ static int inject_inode(struct f2fs_sb_info *sbi, struct f2fs_node *node,
 		MSG(0, "Info: inject inode i_blocks of nid %u: %"PRIu64" -> %"PRIu64"\n",
 		    opt->nid, le64_to_cpu(inode->i_blocks), (u64)opt->val);
 		inode->i_blocks = cpu_to_le64((u64)opt->val);
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
+		    "%lu -> %lu\n", opt->nid,
+		    le64_to_cpu(inode->i_compr_blocks), (u64)opt->val);
+		inode->i_compr_blocks = cpu_to_le64((u64)opt->val);
 	} else if (!strcmp(opt->mb, "i_addr")) {
 		/* do not care if it is inline data */
 		if (opt->idx >= DEF_ADDRS_PER_INODE) {
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
index 5ae556015a79..72d1c90f7ce4 100644
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
@@ -182,12 +182,27 @@ inode i_size.
 .BI i_blocks
 inode i_blocks.
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
