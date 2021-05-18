Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A423875D0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 May 2021 11:55:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1liwRZ-00016a-W0; Tue, 18 May 2021 09:55:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1liwRW-00016Q-85
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 May 2021 09:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yJUn9+MO3bpkNUrrSUIS9ZRencGPl8DWz7J02+IXWg8=; b=OJ8UkK29h9RwAYcpBY1Ad2jOp1
 kqLUG2LuQ3H1VstLEtO1B2FZPvX1PONvL08lUD9P7MFTd7uLmndyLgorjd6nLUveiKwqsBsOeQLXz
 q75GUVUixr1bJExttBBuqONIhqAWU2AavjBmja+6krBZVIb5GKyYaZ26qjYps3Z4kJjQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yJUn9+MO3bpkNUrrSUIS9ZRencGPl8DWz7J02+IXWg8=; b=CM1BX9yD5aUX7lBavFzOVAKGt6
 m2gyzW3A7BFjCvR/vu1r7VQ54Lom4G/RY33K0u2LSvpNQaSL9WuEM0qTkIccd64CW0EwfyN0O7Uj7
 7jPewldLGDo5QiqMGqirWKkzlMHFJ+oXTeRGZWtJzk6K6N6xogQmp5Opeki3r1Tf82lI=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1liwRU-00CWof-Es
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 May 2021 09:55:16 +0000
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fkrqp1SkczQpgd;
 Tue, 18 May 2021 17:51:34 +0800 (CST)
Received: from dggemx753-chm.china.huawei.com (10.0.44.37) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 17:55:03 +0800
Received: from szvp000207684.huawei.com (10.120.216.130) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 18 May 2021 17:55:02 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 18 May 2021 17:54:58 +0800
Message-ID: <20210518095458.99728-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210518095458.99728-1-yuchao0@huawei.com>
References: <20210518095458.99728-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1liwRU-00CWof-Es
Subject: [f2fs-dev] [PATCH 2/2] f2fs: compress: fix to disallow temp
 extension
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

This patch restricts to configure compress extension as format of:

 [filename + '.' + extension]

rather than:

 [filename + '.' + extension + (optional: '.' + temp extension)]

in order to avoid to enable compression incorrectly:

1. compress_extension=so
2. touch file.soa
3. touch file.so.tmp

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/namei.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 8d78b96a8b3b..36e04148e8f8 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -158,7 +158,8 @@ bool f2fs_is_wildcard_char(const char *ext)
 	return *ext == '*' && strlen(ext) == 1;
 }
 
-static inline int is_extension_exist(const unsigned char *s, const char *sub)
+static inline int is_extension_exist(const unsigned char *s, const char *sub,
+						bool tmp_ext)
 {
 	size_t slen = strlen(s);
 	size_t sublen = strlen(sub);
@@ -171,6 +172,13 @@ static inline int is_extension_exist(const unsigned char *s, const char *sub)
 	if (slen < sublen + 2)
 		return 0;
 
+	if (!tmp_ext) {
+		/* file has no temp extension */
+		if (s[slen - sublen - 1] != '.')
+			return 0;
+		return !strncasecmp(s + slen - sublen, sub, sublen);
+	}
+
 	for (i = 1; i < slen - sublen; i++) {
 		if (s[i] != '.')
 			continue;
@@ -196,7 +204,7 @@ static inline void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *
 	hot_count = sbi->raw_super->hot_ext_count;
 
 	for (i = 0; i < cold_count + hot_count; i++) {
-		if (is_extension_exist(name, extlist[i]))
+		if (is_extension_exist(name, extlist[i], true))
 			break;
 	}
 
@@ -297,7 +305,7 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
 	hot_count = sbi->raw_super->hot_ext_count;
 
 	for (i = cold_count; i < cold_count + hot_count; i++) {
-		if (is_extension_exist(name, extlist[i])) {
+		if (is_extension_exist(name, extlist[i], false)) {
 			up_read(&sbi->sb_lock);
 			return;
 		}
@@ -310,7 +318,7 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
 	for (i = 0; i < ext_cnt; i++) {
 		if (f2fs_is_wildcard_char(ext[i]))
 			goto set_compress;
-		if (!is_extension_exist(name, ext[i]))
+		if (!is_extension_exist(name, ext[i], false))
 			continue;
 set_compress:
 		set_compress_context(inode);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
