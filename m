Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A51E08100A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 03:45:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huS47-0005ZZ-8H; Mon, 05 Aug 2019 01:45:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1huS46-0005ZR-3A
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 01:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7gtmp1RI4jFXVIRz2msp8NU8CGTgnKht6gX+OyJyagk=; b=DSao6aYCLXoUGRxkHcIyZyKSf8
 dyrX3zop4EbsWB1KaOYgKPnq4OS6apSCsSSW6R3+JYUVHo2nKwwimZQ3smXoeVH+1YZ/788yd2AQm
 hSVlmdpgsGVsp+JIx/tbaa6fWhZK9sUa1vYsE3nFhUvnFf//4f2OXI4KFJLIJCoy/C1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7gtmp1RI4jFXVIRz2msp8NU8CGTgnKht6gX+OyJyagk=; b=DuswohiaXvWhqEgNLP5zkQkhzq
 wj1ldJEC48Y9MF62aSuj7AMUGU9317y5cXwQ5qGeeNyiGYdKdpeTsFa8nZtAFRdNPskH79qfiT278
 ZjDkv3L1BWCRlUQawgVrY5XBSC4y9Q2ScvesgexJzqQsE+oYw2owtQ6dsLOilYoAAzlA=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huS41-00B2yL-Uw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 01:45:34 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 18EBAB42E11D2E0923C6;
 Mon,  5 Aug 2019 09:45:22 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Mon, 5 Aug 2019 09:45:13 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 5 Aug 2019 09:44:59 +0800
Message-ID: <20190805014459.119305-3-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190805014459.119305-1-yuchao0@huawei.com>
References: <20190805014459.119305-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1huS41-00B2yL-Uw
Subject: [f2fs-dev] [PATCH 3/3] sload.f2fs: fix error path of build_directory
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The error handling of build_directory is a mess, fix it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/sload.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/fsck/sload.c b/fsck/sload.c
index 940da5c..f601916 100644
--- a/fsck/sload.c
+++ b/fsck/sload.c
@@ -41,19 +41,25 @@ static int filter_dot(const struct dirent *d)
 	return (strcmp(d->d_name, "..") && strcmp(d->d_name, "."));
 }
 
-static void f2fs_make_directory(struct f2fs_sb_info *sbi,
+static int f2fs_make_directory(struct f2fs_sb_info *sbi,
 				int entries, struct dentry *de)
 {
+	int ret = 0;
 	int i = 0;
 
 	for (i = 0; i < entries; i++) {
 		if (de[i].file_type == F2FS_FT_DIR)
-			f2fs_mkdir(sbi, de + i);
+			ret = f2fs_mkdir(sbi, de + i);
 		else if (de[i].file_type == F2FS_FT_REG_FILE)
-			f2fs_create(sbi, de + i);
+			ret = f2fs_create(sbi, de + i);
 		else if (de[i].file_type == F2FS_FT_SYMLINK)
-			f2fs_symlink(sbi, de + i);
+			ret = f2fs_symlink(sbi, de + i);
+
+		if (ret)
+			break;
 	}
+
+	return ret;
 }
 
 #ifdef HAVE_LIBSELINUX
@@ -173,7 +179,7 @@ static int build_directory(struct f2fs_sb_info *sbi, const char *full_path,
 	int entries = 0;
 	struct dentry *dentries;
 	struct dirent **namelist = NULL;
-	int i, ret = 0;
+	int i = 0, ret = 0;
 
 	entries = scandir(full_path, &namelist, filter_dot, (void *)alphasort);
 	if (entries < 0) {
@@ -182,8 +188,7 @@ static int build_directory(struct f2fs_sb_info *sbi, const char *full_path,
 	}
 
 	dentries = calloc(entries, sizeof(struct dentry));
-	if (dentries == NULL)
-		return -ENOMEM;
+	ASSERT(dentries);
 
 	for (i = 0; i < entries; i++) {
 		dentries[i].name = (unsigned char *)strdup(namelist[i]->d_name);
@@ -208,7 +213,9 @@ static int build_directory(struct f2fs_sb_info *sbi, const char *full_path,
 
 	free(namelist);
 
-	f2fs_make_directory(sbi, entries, dentries);
+	ret = f2fs_make_directory(sbi, entries, dentries);
+	if (ret)
+		goto out_free;
 
 	for (i = 0; i < entries; i++) {
 		if (dentries[i].file_type == F2FS_FT_REG_FILE) {
@@ -224,10 +231,15 @@ static int build_directory(struct f2fs_sb_info *sbi, const char *full_path,
 							dentries[i].path);
 			ASSERT(ret > 0);
 
-			build_directory(sbi, subdir_full_path, subdir_dir_path,
-					target_out_dir, dentries[i].ino);
+			ret = build_directory(sbi, subdir_full_path,
+						subdir_dir_path,
+						target_out_dir,
+						dentries[i].ino);
 			free(subdir_full_path);
 			free(subdir_dir_path);
+
+			if (ret)
+				goto out_free;
 		} else if (dentries[i].file_type == F2FS_FT_SYMLINK) {
 			/*
 			 * It is already done in f2fs_make_directory
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
