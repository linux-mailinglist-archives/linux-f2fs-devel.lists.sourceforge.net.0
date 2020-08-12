Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E7B2424F6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Aug 2020 07:17:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k5j8h-0001A3-U4; Wed, 12 Aug 2020 05:17:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1k5j8h-00019w-6X
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Aug 2020 05:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Po0Y4p2+iqQSTXjlLpva9c3LO+7SRYD5DhzkCojY0rw=; b=WXX/IS/5Me8kAD6EOvLkF5r8/+
 3LqD1hLw81ncKx4IxLGf3q1Mk1mvehf4h7sfD6lBTEgtlFb36hr945Gy/NHBPapOiVwCJ/FNZJV1b
 xQ7N6QuDIEVwcbf4RmHv19MiDaoTLGB5VXJjYwzuwRzh553cMmSt52VTrBdD+d9fXBJ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Po0Y4p2+iqQSTXjlLpva9c3LO+7SRYD5DhzkCojY0rw=; b=I
 3hYFREpbqRq1IwKLmrbGrvfRakPMu2q9bzrBu3ubJVbfWbSvv5g7wyf1N+HQxI0Rs7rHioH6Df91p
 lZuzFbemboI8UHxwTq1rYIn+BUlOZPOxdEw/JEb8V4HoWcP/FElN6Nk0p3pIFhwMF3XmgSbEeypf7
 USTpyasYtt9+MHqc=;
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5j8f-00AQ8Y-SR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Aug 2020 05:17:27 +0000
Received: by mail-pl1-f194.google.com with SMTP id p1so580518pls.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Aug 2020 22:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Po0Y4p2+iqQSTXjlLpva9c3LO+7SRYD5DhzkCojY0rw=;
 b=T+hYaEb0HCElY2tWsbM5W2OErXBuUOKpwFlxWyU7GeFOuaA7VmANP6Sm/ojvkoW6Lj
 ze6hRFfp+XqHCTjiR01H78yxPYc9QQGbTKy2M7wL09Aa38GzciSlWvcU8VSjoHkkUVVp
 kQ860FhamX+2VAkRTCRGhiMh27zsRbsHVTV9W7zdGy25I4pS4R8fywWs438zzsIg00ZQ
 3Z71uvfqJiztHgUc+wDKPCOten49RAnUM6uNI/CvSdwb0xNozlxG7q183B2aNkUk+ju2
 ZbgdBcvPHOaDezWYuaW5ZyDcLYv9jDbOBY6HCslSNJgzBi+u51hlW0aTw6OPLLYZMUjU
 PfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Po0Y4p2+iqQSTXjlLpva9c3LO+7SRYD5DhzkCojY0rw=;
 b=YCrRMg6rN0OWzf2mckDGNr7IowH3D6n3HwhljlzOpV5C071143CuT1cbhappoi8zVm
 R2ZtK5e1FIPmHXdzi1K0cvDviMwFLCfZqEe3VImugA9rVEPD4mccAF7/RNPFFwSMu6iL
 +XoOzcHxIyhrdrfvXe3MVMvy2lhQpOhuEMIKnb/eYte99yRFWfD9lKP3mGXgYYpFhwxO
 dg6CgP3F/Pz2P+b5X7JgGya6cTUqRj3U0Vq+Nh3g41EJ/X0WD1FusnmEz6fnZbdSJwCx
 GBbwPjNomiVnc3QfCuqay4aeqL3shX06Fz96SHIVCPox5D/dghOf3o29Vq1/WO+A5RMd
 mYAg==
X-Gm-Message-State: AOAM533RyzmbRgq8Iu7djefFZPcDBCV0JNRE82DrxaSeMmJesesiIjs2
 dxf1zJlAY+EyGTXvqNj4Sq4=
X-Google-Smtp-Source: ABdhPJyeBNwymK1KUM8ISupJ71mP+GdrxXLlbOSEw6ff1QuP1H/mgJ4B+Fn1heF/hO7NcLul0DcWNQ==
X-Received: by 2002:a17:90a:ee8d:: with SMTP id
 i13mr4604727pjz.19.1597209440187; 
 Tue, 11 Aug 2020 22:17:20 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id z6sm841051pfg.68.2020.08.11.22.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 22:17:19 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 12 Aug 2020 14:17:11 +0900
Message-Id: <20200812051711.2147716-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.194 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1k5j8f-00AQ8Y-SR
Subject: [f2fs-dev] [PATCH v3] f2fs: change virtual mapping way for
 compression pages
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

By profiling f2fs compression works, I've found vmap() callings have
unexpected hikes in the execution time in our test environment and
those are bottlenecks of f2fs decompression path. Changing these with
vm_map_ram(), we can enhance f2fs decompression speed pretty much.

[Verification]
Android Pixel 3(ARM64, 6GB RAM, 128GB UFS)
Turned on only 0-3 little cores(at 1.785GHz)

dd if=/dev/zero of=dummy bs=1m count=1000
echo 3 > /proc/sys/vm/drop_caches
dd if=dummy of=/dev/zero bs=512k

- w/o compression -
1048576000 bytes (0.9 G) copied, 2.082554 s, 480 M/s
1048576000 bytes (0.9 G) copied, 2.081634 s, 480 M/s
1048576000 bytes (0.9 G) copied, 2.090861 s, 478 M/s

- before patch -
1048576000 bytes (0.9 G) copied, 7.407527 s, 135 M/s
1048576000 bytes (0.9 G) copied, 7.283734 s, 137 M/s
1048576000 bytes (0.9 G) copied, 7.291508 s, 137 M/s

- after patch -
1048576000 bytes (0.9 G) copied, 1.998959 s, 500 M/s
1048576000 bytes (0.9 G) copied, 1.987554 s, 503 M/s
1048576000 bytes (0.9 G) copied, 1.986380 s, 503 M/s

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
Changes in v2:
 - Added test environment description.
Changes in v3:
 - Re-tested using only ARM little cores and maximzing cpu clock.
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
