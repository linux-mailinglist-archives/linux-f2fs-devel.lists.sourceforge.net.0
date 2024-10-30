Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C820F9B602A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2024 11:32:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t65zv-0006Nq-AY;
	Wed, 30 Oct 2024 10:32:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1t65zt-0006Nk-Lm
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Oct 2024 10:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ya+aLk0biOx6jdIGzdCPb91Pps+PGV7J3R6P1XkK4NM=; b=Lm+XfWuHcj6vYFHbyUNRGUOHZI
 OJytwhKoQjboyj1rJ5Bz/9jNsP76EjFMtLr3ab1cJBAspKKrOrK/kqWwg8tbCTdV8aPSlmQIXXEX1
 3varZKSoFHigHOZKBbwc9zc4FbUzUE60JID5wOjZWmkJz0tuKohozRzOjryxczI+/Pl4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ya+aLk0biOx6jdIGzdCPb91Pps+PGV7J3R6P1XkK4NM=; b=EK5HANL0arIBRDKpQ0bZrGqSjC
 vB6F+wxSg+CWXI47u6Qf3UjszOvG5ilrDwOpfrk0ArjXAQ7nC/zDUtO/bs6lEIWvoGVURlA4RlxSd
 mOp50nC5DAmV/STvyVcWSux1hnhfPMFq3cRDEUyhJuxTyfmmq2IxwsOfwWkiqh6qmkAk=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t65zs-0002E6-F7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Oct 2024 10:32:17 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 49UAVgrR026815;
 Wed, 30 Oct 2024 18:31:42 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Xdk1N5Y5dz2K4lHM;
 Wed, 30 Oct 2024 18:31:04 +0800 (CST)
Received: from tj10379pcu1.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 30 Oct 2024 18:31:40 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Wed, 30 Oct 2024 18:31:33 +0800
Message-ID: <20241030103136.2874140-3-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030103136.2874140-1-yi.sun@unisoc.com>
References: <20241030103136.2874140-1-yi.sun@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 49UAVgrR026815
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: New function f2fs_invalidate_compress_pages_range() adds the
 @len parameter. So it can process some consecutive blocks at a time.
 Signed-off-by:
 Yi Sun <yi.sun@unisoc.com> --- fs/f2fs/compress.c | 7 ++++--- fs/f2fs/f2fs.h
 | 9 +++++---- 2 files changed, 9 insertions(+), 7 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1t65zs-0002E6-F7
Subject: [f2fs-dev] [PATCH v2 2/5] f2fs: expand
 f2fs_invalidate_compress_page() to f2fs_invalidate_compress_pages_range()
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com, yi.sun@unisoc.com,
 hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

New function f2fs_invalidate_compress_pages_range() adds the @len
parameter. So it can process some consecutive blocks at a time.

Signed-off-by: Yi Sun <yi.sun@unisoc.com>
---
 fs/f2fs/compress.c | 7 ++++---
 fs/f2fs/f2fs.h     | 9 +++++----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 7f26440e8595..e607a7885b57 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1903,11 +1903,12 @@ struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi)
 	return sbi->compress_inode->i_mapping;
 }
 
-void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi, block_t blkaddr)
+void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
+				block_t blkaddr, unsigned int len)
 {
-	if (!sbi->compress_inode)
+	if (!sbi->compress_inode || len == 0)
 		return;
-	invalidate_mapping_pages(COMPRESS_MAPPING(sbi), blkaddr, blkaddr);
+	invalidate_mapping_pages(COMPRESS_MAPPING(sbi), blkaddr, blkaddr + len - 1);
 }
 
 void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3c6f3cce5779..d3fe66a93a56 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4384,7 +4384,8 @@ void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi);
 int __init f2fs_init_compress_cache(void);
 void f2fs_destroy_compress_cache(void);
 struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi);
-void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi, block_t blkaddr);
+void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
+					block_t blkaddr, unsigned int len);
 void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
 						nid_t ino, block_t blkaddr);
 bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
@@ -4439,8 +4440,8 @@ static inline int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi) { return
 static inline void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi) { }
 static inline int __init f2fs_init_compress_cache(void) { return 0; }
 static inline void f2fs_destroy_compress_cache(void) { }
-static inline void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi,
-				block_t blkaddr) { }
+static inline void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
+				block_t blkaddr, unsigned int len) { }
 static inline void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
 				struct page *page, nid_t ino, block_t blkaddr) { }
 static inline bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
@@ -4759,7 +4760,7 @@ static inline void f2fs_invalidate_internal_cache(struct f2fs_sb_info *sbi,
 								block_t blkaddr)
 {
 	f2fs_truncate_meta_inode_pages(sbi, blkaddr, 1);
-	f2fs_invalidate_compress_page(sbi, blkaddr);
+	f2fs_invalidate_compress_pages_range(sbi, blkaddr, 1);
 }
 
 #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
