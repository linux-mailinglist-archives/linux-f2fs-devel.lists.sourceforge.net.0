Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBC1241560
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Aug 2020 05:38:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k5L7C-0000XL-0D; Tue, 11 Aug 2020 03:38:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1k5L7A-0000XE-Aw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 03:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uvnYmX5PBlwpImHnXxxWchHoc30rMXnuTKNbFFXi55o=; b=UX7uDYZ1Ee0VunX5SKgs95Ogwx
 Ju8Kk+fMlaRr1zB80G0q9ouZiucPdcody+P1o7FMuQuNErERswbPRZmsGrVIDueCbflWfhMXYU9TD
 vvokRpAaohgENvhz5OjNm6Iq1saStmP5AhMk5L/NBDXcy0jMTGBUJz+TBvADk2sdnzt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uvnYmX5PBlwpImHnXxxWchHoc30rMXnuTKNbFFXi55o=; b=J
 3n/tDwcIKOeEoi6cnpw2eaMt/qNQFCQH1MIWtpVB8LqFR9oURrgLpt8jZGn8KxvRGPfDC5pcQw1Vj
 l/sch4Csn7ELeqOgGkr1Zg+bO9XMBOLFfEz7I6DGqeZXWKSuBtVqLJL4HDXl8lV6OBLjKV+Oid8FS
 tlz+IKE4n//pqrUM=;
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5L78-00GwpB-VD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 03:38:16 +0000
Received: by mail-pl1-f194.google.com with SMTP id f10so6143840plj.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Aug 2020 20:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uvnYmX5PBlwpImHnXxxWchHoc30rMXnuTKNbFFXi55o=;
 b=JuLJo6yVUGZojVryoUBe6GbWigpZF/q+mCKcpHEwcXIJ8jU7evVbMDRdm8h80V9Yk2
 VxkElGRUdfxwnBeeoHJ2ismfNOhXh7yy2g4UqgKY7Jk5MVSK5ZbNvb9XLHD5tzoacOl1
 4Y+yYHoXnSxLzNZv+oQ1ITAXY45dRAEZb5DwrG0gmjk/rdDuyDU+ZjZ4HjYVvHdRKOI/
 6pbMDuR+Yx0GhqFVwzC1q4fPFk0LsA5X/+0n+P6Q+zLqddz5lfUTSXx9uDYSxNAAbtLe
 hdVx6IylxTk3jVXeVyLfHCfj8arrME6AJdBFmfwCaqBs0NRd1sFjpSmMUTo8kEDn8ZIB
 YT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uvnYmX5PBlwpImHnXxxWchHoc30rMXnuTKNbFFXi55o=;
 b=fwrhxNE0c+GMsLABp7v5Y7hb7LFOFI1uFRcVJjF+UgrrePe4LQtIP+L9tKZT8mWGsa
 k8i3+d4XC5x/xiuTaQSvdlNP+dER720rs+IvQF2apOTTphxUPk4sy2vmLyoZKz0G9A6j
 Q4U6IWrscYJOKYZaCzWR2ouolANP3EJF0Agle/7FzxIYU8ea19FqrNqMtpHAV4c5DWYI
 IN/s0tzOzpL9fMvXlzaMdoI5cCFr2HHsoHBmEscLVIlWZMCMX/WBr66o3W3kiCLKq4Nu
 XSa5DA/o82AJtWq6vGKfGXXh9w1Gtlb6R2RYK1sOLQfMLjwG4JsRCIi5sSnTq22Plhu0
 pdJw==
X-Gm-Message-State: AOAM530ijMVDGu08w39m6+lT0FjncNjWeddA8MHLX0kBWs4zvTXK5IGd
 r582IsvtTJeWZ9X1PwiXCGA=
X-Google-Smtp-Source: ABdhPJxId44YKFt1dP26u0IpbkikiLFA5z6pJm4cqWwvbFvtVNjGOeRyzD/l2ipwCHY0sWi3Ogs62A==
X-Received: by 2002:a17:90b:94c:: with SMTP id
 dw12mr2592970pjb.214.1597117082121; 
 Mon, 10 Aug 2020 20:38:02 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id e22sm19307183pgi.62.2020.08.10.20.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 20:38:01 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 11 Aug 2020 12:37:53 +0900
Message-Id: <20200811033753.783276-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1k5L78-00GwpB-VD
Subject: [f2fs-dev] [PATCH] f2fs: change virtual mapping way for compression
 pages
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

By profiling f2fs compression works, I've found vmap() callings are
bottlenecks of f2fs decompression path. Changing these with
vm_map_ram(), we can enhance f2fs decompression speed pretty much.

[Verification]
dd if=/dev/zero of=dummy bs=1m count=1000
echo 3 > /proc/sys/vm/drop_caches
dd if=dummy of=/dev/zero bs=512k

- w/o compression -
1048576000 bytes (0.9 G) copied, 1.999384 s, 500 M/s
1048576000 bytes (0.9 G) copied, 2.035988 s, 491 M/s
1048576000 bytes (0.9 G) copied, 2.039457 s, 490 M/s

- before patch -
1048576000 bytes (0.9 G) copied, 9.146217 s, 109 M/s
1048576000 bytes (0.9 G) copied, 9.997542 s, 100 M/s
1048576000 bytes (0.9 G) copied, 10.109727 s, 99 M/s

- after patch -
1048576000 bytes (0.9 G) copied, 2.253441 s, 444 M/s
1048576000 bytes (0.9 G) copied, 2.739764 s, 365 M/s
1048576000 bytes (0.9 G) copied, 2.185649 s, 458 M/s

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/compress.c | 42 ++++++++++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 6e7db450006c..46b7e359f313 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -554,6 +554,8 @@ static void f2fs_compress_free_page(struct page *page)
 	mempool_free(page, compress_page_pool);
 }
 
+#define MAX_VMAP_RETRIES	3
+
 static int f2fs_compress_pages(struct compress_ctx *cc)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
@@ -590,13 +592,23 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 		}
 	}
 
-	cc->rbuf = vmap(cc->rpages, cc->cluster_size, VM_MAP, PAGE_KERNEL_RO);
+	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
+		cc->rbuf = vm_map_ram(cc->rpages, cc->cluster_size, -1);
+		if (cc->rbuf)
+			break;
+		vm_unmap_aliases();
+	}
 	if (!cc->rbuf) {
 		ret = -ENOMEM;
 		goto out_free_cpages;
 	}
 
-	cc->cbuf = vmap(cc->cpages, cc->nr_cpages, VM_MAP, PAGE_KERNEL);
+	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
+		cc->cbuf = vm_map_ram(cc->cpages, cc->nr_cpages, -1);
+		if (cc->cbuf)
+			break;
+		vm_unmap_aliases();
+	}
 	if (!cc->cbuf) {
 		ret = -ENOMEM;
 		goto out_vunmap_rbuf;
@@ -624,8 +636,8 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	memset(&cc->cbuf->cdata[cc->clen], 0,
 	       (nr_cpages * PAGE_SIZE) - (cc->clen + COMPRESS_HEADER_SIZE));
 
-	vunmap(cc->cbuf);
-	vunmap(cc->rbuf);
+	vm_unmap_ram(cc->cbuf, cc->nr_cpages);
+	vm_unmap_ram(cc->rbuf, cc->cluster_size);
 
 	for (i = nr_cpages; i < cc->nr_cpages; i++) {
 		f2fs_compress_free_page(cc->cpages[i]);
@@ -642,9 +654,9 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	return 0;
 
 out_vunmap_cbuf:
-	vunmap(cc->cbuf);
+	vm_unmap_ram(cc->cbuf, cc->nr_cpages);
 out_vunmap_rbuf:
-	vunmap(cc->rbuf);
+	vm_unmap_ram(cc->rbuf, cc->cluster_size);
 out_free_cpages:
 	for (i = 0; i < cc->nr_cpages; i++) {
 		if (cc->cpages[i])
@@ -715,13 +727,23 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 			goto out_free_dic;
 	}
 
-	dic->rbuf = vmap(dic->tpages, dic->cluster_size, VM_MAP, PAGE_KERNEL);
+	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
+		dic->rbuf = vm_map_ram(dic->tpages, dic->cluster_size, -1);
+		if (dic->rbuf)
+			break;
+		vm_unmap_aliases();
+	}
 	if (!dic->rbuf) {
 		ret = -ENOMEM;
 		goto destroy_decompress_ctx;
 	}
 
-	dic->cbuf = vmap(dic->cpages, dic->nr_cpages, VM_MAP, PAGE_KERNEL_RO);
+	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
+		dic->cbuf = vm_map_ram(dic->cpages, dic->nr_cpages, -1);
+		if (dic->cbuf)
+			break;
+		vm_unmap_aliases();
+	}
 	if (!dic->cbuf) {
 		ret = -ENOMEM;
 		goto out_vunmap_rbuf;
@@ -738,9 +760,9 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 	ret = cops->decompress_pages(dic);
 
 out_vunmap_cbuf:
-	vunmap(dic->cbuf);
+	vm_unmap_ram(dic->cbuf, dic->nr_cpages);
 out_vunmap_rbuf:
-	vunmap(dic->rbuf);
+	vm_unmap_ram(dic->rbuf, dic->cluster_size);
 destroy_decompress_ctx:
 	if (cops->destroy_decompress_ctx)
 		cops->destroy_decompress_ctx(dic);
-- 
2.28.0.236.gb10cc79966-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
