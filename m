Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0593B3875D1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 May 2021 11:55:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1liwRZ-0000bT-B5; Tue, 18 May 2021 09:55:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1liwRX-0000bG-8r
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 May 2021 09:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xoh14okGPlzDvVTaM3YdR6yP8XDBW/OPg17cssgVZ6A=; b=G029nJmOoDisTWATc5fYEn9htl
 4okwkKgWKSUJ4GxW5/hoW35OZJRWwngHW80y4gwlKg22uJtUQ7l7WaQVuRuBDeZ0q6ZbCmxRRMqZG
 cbVEYUkaAWMogQwIaRWB8ZU4Z+L8Ets4BEhPNVvzzz5vktdiwu+1LCsdOkF05K1Ln5uM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Xoh14okGPlzDvVTaM3YdR6yP8XDBW/OPg17cssgVZ6A=; b=A
 xxUBOtO1BgRlLmqPEOxy9XZeFig7+JTfBHwdMucD6eSkf9Nm/E08PHmKj9MNJAk2lS9jLU+HnPH+o
 rxtnYkNJZAfF/HBLA2NN/qEdeCznRL6FOga+3v6rd7Qxomrn4sgeuJduEkwkfU69c6fYWPWmUKjGa
 F+JVYrv+R/n44+84=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1liwRS-0000XA-Pn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 May 2021 09:55:15 +0000
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FkrsC3qG4zlg9R;
 Tue, 18 May 2021 17:52:47 +0800 (CST)
Received: from dggemx753-chm.china.huawei.com (10.0.44.37) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 17:55:02 +0800
Received: from szvp000207684.huawei.com (10.120.216.130) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 18 May 2021 17:55:02 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 18 May 2021 17:54:57 +0800
Message-ID: <20210518095458.99728-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1liwRS-0000XA-Pn
Subject: [f2fs-dev] [PATCH 1/2] f2fs: compress: fix to disallow wildcard
 extension for hot/cold file
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

If all files are hot or cold, hot/cold separation is not needed anymore,
so let's disallow configure wildcard extension.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/namei.c | 12 ++++++++----
 fs/f2fs/sysfs.c |  3 +++
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b753cc88c77e..ecb13c3b458d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3322,6 +3322,7 @@ void f2fs_handle_failed_inode(struct inode *inode);
 /*
  * namei.c
  */
+bool f2fs_is_wildcard_char(const char *ext);
 int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
 							bool hot, bool set);
 struct dentry *f2fs_get_parent(struct dentry *child);
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index a9cd9cf97229..8d78b96a8b3b 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -153,15 +153,17 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
 	return ERR_PTR(err);
 }
 
+bool f2fs_is_wildcard_char(const char *ext)
+{
+	return *ext == '*' && strlen(ext) == 1;
+}
+
 static inline int is_extension_exist(const unsigned char *s, const char *sub)
 {
 	size_t slen = strlen(s);
 	size_t sublen = strlen(sub);
 	int i;
 
-	if (sublen == 1 && *sub == '*')
-		return 1;
-
 	/*
 	 * filename format of multimedia file should be defined as:
 	 * "filename + '.' + extension + (optional: '.' + temp extension)".
@@ -306,9 +308,11 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
 	ext = F2FS_OPTION(sbi).extensions;
 
 	for (i = 0; i < ext_cnt; i++) {
+		if (f2fs_is_wildcard_char(ext[i]))
+			goto set_compress;
 		if (!is_extension_exist(name, ext[i]))
 			continue;
-
+set_compress:
 		set_compress_context(inode);
 		return;
 	}
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index dc71bc968c72..ff5acb4de1b6 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -343,6 +343,9 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		if (strlen(name) >= F2FS_EXTENSION_LEN)
 			return -EINVAL;
 
+		if (f2fs_is_wildcard_char(name))
+			return -EINVAL;
+
 		down_write(&sbi->sb_lock);
 
 		ret = f2fs_update_extension_list(sbi, name, hot, set);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
