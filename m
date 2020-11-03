Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1C12A3C6A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Nov 2020 07:02:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZpOz-0007Z3-BV; Tue, 03 Nov 2020 06:02:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kZpOw-0007YQ-9K; Tue, 03 Nov 2020 06:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=290Bo0sJTh/t678nA8yWOfHRoSh5E7Ekj1ME0hd0Klk=; b=m0gpyznWw6iQyKltrqTaZAejZG
 lbqZyZIyNGzePS12Zu9n6xq3E2vs5Pj66M0lsK6rHoh1jW/UNdV0we0LNIwch1ClP4d4V6J1vKkvL
 4TSu+rrsDHgh3U7udaxz6dfQ/ehFlE1AmiXvDb/TfHcbLWNwaslvqjn1DlQ1KazVx4g4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=290Bo0sJTh/t678nA8yWOfHRoSh5E7Ekj1ME0hd0Klk=; b=VWKkAOYqhOwkZRX3E9W3yE+L1w
 cupwhBGp14szk/rcvmCV0J808aGQ+4stn/5GNVGRWLBcFWOtrey6yXmROj00yJM9bYkOEZwKM+yxe
 pUZ50+9XKGpSo+jIC+08la+EH/wlHx+d3uq6L98aZVzHm75v7XZno/61QeKRBmwAlUuM=;
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZpOn-007Kiw-8R; Tue, 03 Nov 2020 06:02:38 +0000
Received: by mail-pl1-f194.google.com with SMTP id g11so1552347pll.13;
 Mon, 02 Nov 2020 22:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=290Bo0sJTh/t678nA8yWOfHRoSh5E7Ekj1ME0hd0Klk=;
 b=tmkhJaJU3VHkDyTbru8lROAJsbWUowjJpfjeebweaYui9+dmpz9dp4CiqwVroJXu4r
 e8qFLTGO7BrrkBcyAJfn8s2nTfvG5gjJ1khl+BjW/1+PVJUxqn9EqV6ZrD0gvug7z8gA
 eY4KuYCaGxS6cQdPkeOmoQrc8TarN3zTBK2tbwqJ7YpAUJ56ov1ZOXJtfACGI+zExXPc
 Esk7bBmXTyf2iTDq9UrZRBWZgsW/jfXOYpNJA72ELOZo6kAHQHKxX3i+3VligPWKziIs
 cVthbjCjS21wLR2JkMrbXMLO8Y4DC/h+kZ4de4lLQ9n3XmynYbfmAnxyI0QNS8VeNWXW
 0rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=290Bo0sJTh/t678nA8yWOfHRoSh5E7Ekj1ME0hd0Klk=;
 b=QsmwfIsSmg703YbsBbIbFBo4RetIrLbpXbeypi2gcV2vQCWJt6AqYd2kc5qI7tkI6t
 alFSAur3MDi8TbzITU22kzPWJxtHIb4aXlJRYPSEddjYnhIwnVB8MY9Q5M3gEKLrL5Cc
 E0hhy1NgSUu4UQZkfg7NAJLuruzb1XBpYVGR5zfeWcY57GCzroj2+l2bLBwWttpYQJnm
 8Y7AOOaOTNuxcEigxoho2iV/UeuxqAtutcAi6S32vfXieVwoEuDR+Dgt3JEFai0rmjWS
 /zVTiL9pSlkQzjFLRrOTeSe+D9v9PIdYdi0SZ/VfjEuZuRWak+NSKytQD/echKx1e+tF
 YZWg==
X-Gm-Message-State: AOAM533W2MZTZ7Q/MfxDAoetY4doQ0V/HTgpO8xq6PcuW4yXnvnFEMzV
 El853rhSZeZgd+APSQScRTc=
X-Google-Smtp-Source: ABdhPJxRj4C0s/7LRqkG1TAIaPpnRoWT0V5FJT5A21qtBTEslWRfNbGEXSp9WpAS5/zlFWRkm2d7KQ==
X-Received: by 2002:a17:902:8d95:b029:d6:521f:2f2d with SMTP id
 v21-20020a1709028d95b02900d6521f2f2dmr24445166plo.76.1604383343728; 
 Mon, 02 Nov 2020 22:02:23 -0800 (PST)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id b16sm15647269pfp.195.2020.11.02.22.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 22:02:23 -0800 (PST)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon,  2 Nov 2020 22:05:33 -0800
Message-Id: <20201103060535.8460-8-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201103060535.8460-1-nickrterrell@gmail.com>
References: <20201103060535.8460-1-nickrterrell@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fb.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.194 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kZpOn-007Kiw-8R
Subject: [f2fs-dev] [PATCH v5 7/9] squashfs: zstd: Switch to the zstd-1.4.6
 API
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
Cc: squashfs-devel@lists.sourceforge.net, Johannes Weiner <jweiner@fb.com>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Petr Malat <oss@malat.biz>, Chris Mason <clm@fb.com>,
 Nick Terrell <terrelln@fb.com>, linux-crypto@vger.kernel.org,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Nick Terrell <terrelln@fb.com>

Move away from the compatibility wrapper to the zstd-1.4.6 API. This
code is functionally equivalent.

Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 fs/squashfs/zstd_wrapper.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/squashfs/zstd_wrapper.c b/fs/squashfs/zstd_wrapper.c
index f8c512a6204e..add582409866 100644
--- a/fs/squashfs/zstd_wrapper.c
+++ b/fs/squashfs/zstd_wrapper.c
@@ -11,7 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/bio.h>
 #include <linux/slab.h>
-#include <linux/zstd_compat.h>
+#include <linux/zstd.h>
 #include <linux/vmalloc.h>
 
 #include "squashfs_fs.h"
@@ -34,7 +34,7 @@ static void *zstd_init(struct squashfs_sb_info *msblk, void *buff)
 		goto failed;
 	wksp->window_size = max_t(size_t,
 			msblk->block_size, SQUASHFS_METADATA_SIZE);
-	wksp->mem_size = ZSTD_DStreamWorkspaceBound(wksp->window_size);
+	wksp->mem_size = ZSTD_estimateDStreamSize(wksp->window_size);
 	wksp->mem = vmalloc(wksp->mem_size);
 	if (wksp->mem == NULL)
 		goto failed;
@@ -71,7 +71,7 @@ static int zstd_uncompress(struct squashfs_sb_info *msblk, void *strm,
 	struct bvec_iter_all iter_all = {};
 	struct bio_vec *bvec = bvec_init_iter_all(&iter_all);
 
-	stream = ZSTD_initDStream(wksp->window_size, wksp->mem, wksp->mem_size);
+	stream = ZSTD_initStaticDStream(wksp->mem, wksp->mem_size);
 
 	if (!stream) {
 		ERROR("Failed to initialize zstd decompressor\n");
@@ -122,8 +122,7 @@ static int zstd_uncompress(struct squashfs_sb_info *msblk, void *strm,
 			break;
 
 		if (ZSTD_isError(zstd_err)) {
-			ERROR("zstd decompression error: %d\n",
-					(int)ZSTD_getErrorCode(zstd_err));
+			ERROR("zstd decompression error: %s\n", ZSTD_getErrorName(zstd_err));
 			error = -EIO;
 			break;
 		}
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
