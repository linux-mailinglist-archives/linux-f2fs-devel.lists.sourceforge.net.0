Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BD726253E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Sep 2020 04:37:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kFpyg-0008KZ-8u; Wed, 09 Sep 2020 02:36:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kFpye-0008KO-Mk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Sep 2020 02:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X+oobIN4EvT4cXwyPHq/3JQFjuqR9WTF4FN1mEu2D/4=; b=CBHIuSS+GRMEEk4n0h9a352g7q
 ZihByfE6tqyhcH/GdJifuktFoJwPZokMUKYJiZNJQbgOw3CWKhTO204U+/PUX42KEOJBTL8lkFylc
 zElJ/QJnCH39SE+xBrmKNFoCmOEy5gfUn3CuCI6BYdul1L8yHIKauBVk7bRSnRIZBJBg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=X+oobIN4EvT4cXwyPHq/3JQFjuqR9WTF4FN1mEu2D/4=; b=A
 +YoS+iYBagW3OXTzK3RMWPiZ1PonEpp9PPxjnBG54aIY8pfRrkxrmdwwh40EDuv+uOw2tMTKtCj6x
 YiCueyXA+AfwpLSaf5Un7aCbU1XIiRqgsikwa0FgnpPfO+AUr9KhwtgpMesNkakL9gujI6giltzfR
 mLQTD4g5SFyX+Efo=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kFpyZ-0004Ns-KX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Sep 2020 02:36:52 +0000
Received: by mail-pf1-f195.google.com with SMTP id k15so798275pfc.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 08 Sep 2020 19:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X+oobIN4EvT4cXwyPHq/3JQFjuqR9WTF4FN1mEu2D/4=;
 b=FlkYED+XJPr51CjGG6agsxTpvDCUkcSOwP1LO9wQcPFzPZrbXh0tBBoqTxxJeqFVYT
 pHvykXbaACBsNolxBT8lcMyq/g2JT/xQuGB96JIoXX9BuatufvoXD5HkQY4KKLjaW0it
 C/+JWqNaYXkQ8PlhETWvh1pAG/fQO9IqUNiDOTH/aYimjUyzSeyZEzWe+TvRx8i/jOH4
 n9SLFduLKyHUW3oUbS1e/JtvBDnZdTFkDPifUprOdZImKM+0eipidcdrTmXd/JDhz89O
 +ckCSYOjDhClqOEsNbuW0F/2kejTj99oXShSL4zlpwkgBrzjyAQkjtcXMamuZzst/nw7
 Cogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X+oobIN4EvT4cXwyPHq/3JQFjuqR9WTF4FN1mEu2D/4=;
 b=i2+xVFNxWULfsAU2kbhxi0q6vf8YqWjM+/e/nvGrlH3C8QqP5ElI3Dfz4CV9Pras0s
 QsIdaAPdQOU9QjKEHHsi1CnK9GM2i5L7f5qNlnaxzmivt8YkIgys2cMJi1UWASRqAQzQ
 yhlFiYFjlDAMMYuGXwHA3JKOycnjnUeTGw1oJLj3lwBaOKv1NQvI0cJLHKo6sq/VXO/2
 EjDZxyYyAsvCdsthBcOSGXXiACiOZmCrGQnQfMsp8A0JchGMXGF6BEbduBss+XUKJdgF
 H5nDQzJ5hYR/xMvp2v0njK0X/boeweWKTy9/U2RuXCAYS2bnHWA7Me0unC1wmru+YrqR
 oHOA==
X-Gm-Message-State: AOAM532EWqgRX5/UZJugKpwyAQ2rrz5IwXnYi76/bjns72Pp8YOF1L9U
 dUi/m1GD/avG2K652eh/sWs=
X-Google-Smtp-Source: ABdhPJxRm6GJqFBhoaYprpeyr+sd1af/4h2Oci/9Abej87t39HWxdhaB2mSpi18/QD+3HEnTM/eaBA==
X-Received: by 2002:a17:902:d714:b029:d0:cbe1:e7a2 with SMTP id
 w20-20020a170902d714b02900d0cbe1e7a2mr1913266ply.19.1599619001994; 
 Tue, 08 Sep 2020 19:36:41 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id s67sm760464pfs.117.2020.09.08.19.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 19:36:41 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed,  9 Sep 2020 11:36:34 +0900
Message-Id: <20200909023634.3821423-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kFpyZ-0004Ns-KX
Subject: [f2fs-dev] [PATCH] f2fs: clean up vm_map_ram() call
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Made f2fs_vmap() wrapper to handle vm_map_ram() stuff.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/compress.c | 42 ++++++++++++++++++------------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 357303d8514b..7895186cc765 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -557,6 +557,20 @@ static void f2fs_compress_free_page(struct page *page)
 
 #define MAX_VMAP_RETRIES	3
 
+static void *f2fs_vmap(struct page **pages, unsigned int count)
+{
+	int i;
+	void *buf = NULL;
+
+	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
+		buf = vm_map_ram(pages, count, -1);
+		if (buf)
+			break;
+		vm_unmap_aliases();
+	}
+	return buf;
+}
+
 static int f2fs_compress_pages(struct compress_ctx *cc)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
@@ -593,23 +607,13 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 		}
 	}
 
-	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
-		cc->rbuf = vm_map_ram(cc->rpages, cc->cluster_size, -1);
-		if (cc->rbuf)
-			break;
-		vm_unmap_aliases();
-	}
+	cc->rbuf = f2fs_vmap(cc->rpages, cc->cluster_size);
 	if (!cc->rbuf) {
 		ret = -ENOMEM;
 		goto out_free_cpages;
 	}
 
-	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
-		cc->cbuf = vm_map_ram(cc->cpages, cc->nr_cpages, -1);
-		if (cc->cbuf)
-			break;
-		vm_unmap_aliases();
-	}
+	cc->cbuf = f2fs_vmap(cc->cpages, cc->nr_cpages);
 	if (!cc->cbuf) {
 		ret = -ENOMEM;
 		goto out_vunmap_rbuf;
@@ -728,23 +732,13 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 			goto out_free_dic;
 	}
 
-	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
-		dic->rbuf = vm_map_ram(dic->tpages, dic->cluster_size, -1);
-		if (dic->rbuf)
-			break;
-		vm_unmap_aliases();
-	}
+	dic->rbuf = f2fs_vmap(dic->tpages, dic->cluster_size);
 	if (!dic->rbuf) {
 		ret = -ENOMEM;
 		goto destroy_decompress_ctx;
 	}
 
-	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
-		dic->cbuf = vm_map_ram(dic->cpages, dic->nr_cpages, -1);
-		if (dic->cbuf)
-			break;
-		vm_unmap_aliases();
-	}
+	dic->cbuf = f2fs_vmap(dic->cpages, dic->nr_cpages);
 	if (!dic->cbuf) {
 		ret = -ENOMEM;
 		goto out_vunmap_rbuf;
-- 
2.28.0.526.ge36021eeef-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
