Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CF17FB5DA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Nov 2023 10:32:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7uRn-0000kx-Un;
	Tue, 28 Nov 2023 09:32:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r7uRi-0000kq-LA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 09:31:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yrf0Ha5B2dVQ1oyjwhbawOKsSsKx44e9w1NM0Ljj7Is=; b=de8Flm8y/zmNSGxf/cq7EHZGiE
 /gmgrcDnXHrIx90rl1ey3VuHwOi19AYUoPcMp365sG9rfQraw64yOs0YbfdieIwK+Nd9YaQZcEz+i
 UokjmfN4ft6YLvUaqTuL2inxJqFcxzFEwwdGjhrrGELVSfUqDq/4gXhPI4GYC728hdgo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yrf0Ha5B2dVQ1oyjwhbawOKsSsKx44e9w1NM0Ljj7Is=; b=iIllh/GomkgnoHja7UjOPwdq2s
 bIj7m0mqUfCiFSN6Ek5LqMZROFSbeEy+EiNPcOaWSQ7na9CwfNaMHB0grSX/WDM1+eBRVLbOkAhom
 uc9oUC67Pd9pCAHDS7QhRKp51lqro0TVEbmt9C99JM+Wv5jMXJQqNmlKgK7THz5xaTp4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7uRV-0001Pn-6i for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 09:31:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E5C4CB8399B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Nov 2023 09:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E569BC433C7;
 Tue, 28 Nov 2023 09:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701163898;
 bh=G4S7OaZ+7+gNaP/ANhOUYrSGPJa7mnRp3UrQ13Aljts=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qfoI+uJu2cYqV1quN6GEoY4pCDQoAKo0iNtVygR0GM8h9rYdGgSFovSUq5fsp3DCN
 XR+bFFHllMZOdmUp36p1PQsjWXcdmmFjihsNpv8BHhj9C5Uv4PI7mrN5NvgMkiE9py
 vCRGCbgBt9k4Bq788JiNDjMGU8uuVklRGZIlU0vv5xo3pqsrUG95wo3CDIuyUcOEDl
 9LKaRi2KZFPmvn22MBt5odlp4lV5XLs1yrZe4Our8dSOGpROTUIglCJ4wsD6LH2wdO
 7C47lXZZFmWGIMxlc1r433jYvzujanL5pfrVbQEKGxqQF68ZOOtA3fGtXzW5uhX9x1
 wwzh3a//mHh9A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 28 Nov 2023 17:31:30 +0800
Message-Id: <20231128093130.2885216-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231128093130.2885216-1-chao@kernel.org>
References: <20231128093130.2885216-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch supports to show i_mode field in
 trace_f2fs_new_inode().
 Signed-off-by: Chao Yu <chao@kernel.org> --- include/trace/events/f2fs.h
 | 19 ++++++++++++++++++- 1 file changed, 18 insertions(+), 1 deletion(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r7uRV-0001Pn-6i
Subject: [f2fs-dev] [PATCH 2/2] f2fs: show i_mode in trace_f2fs_new_inode()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch supports to show i_mode field in trace_f2fs_new_inode().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 include/trace/events/f2fs.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 36d9e29ca3c5..479d26eae22f 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -161,6 +161,19 @@ TRACE_DEFINE_ENUM(EX_BLOCK_AGE);
 		{ EX_READ,	"Read" },				\
 		{ EX_BLOCK_AGE,	"Block Age" })
 
+#define show_inode_type(x) \
+	__print_symbolic(x, \
+		{ S_IFLNK,		"symbolic" }, \
+		{ S_IFREG,		"regular" }, \
+		{ S_IFDIR,		"directory" }, \
+		{ S_IFCHR,		"character" }, \
+		{ S_IFBLK,		"block" }, \
+		{ S_IFIFO,		"fifo" }, \
+		{ S_IFSOCK,		"sock" })
+
+#define S_ALL_PERM	(S_ISUID | S_ISGID | S_ISVTX |	\
+			S_IRWXU | S_IRWXG | S_IRWXO)
+
 struct f2fs_sb_info;
 struct f2fs_io_info;
 struct extent_info;
@@ -215,17 +228,21 @@ DECLARE_EVENT_CLASS(f2fs__inode_exit,
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
 		__field(ino_t,	ino)
+		__field(umode_t, mode)
 		__field(int,	ret)
 	),
 
 	TP_fast_assign(
 		__entry->dev	= inode->i_sb->s_dev;
 		__entry->ino	= inode->i_ino;
+		__entry->mode	= inode->i_mode;
 		__entry->ret	= ret;
 	),
 
-	TP_printk("dev = (%d,%d), ino = %lu, ret = %d",
+	TP_printk("dev = (%d,%d), ino = %lu, type: %s, mode = 0%o, ret = %d",
 		show_dev_ino(__entry),
+		show_inode_type(__entry->mode & S_IFMT),
+		__entry->mode & S_ALL_PERM,
 		__entry->ret)
 );
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
