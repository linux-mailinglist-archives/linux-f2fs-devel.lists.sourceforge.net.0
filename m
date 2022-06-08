Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3FE5431E9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jun 2022 15:49:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyw41-0006v8-E5; Wed, 08 Jun 2022 13:49:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <fengnanchang@gmail.com>) id 1nyw40-0006ux-H9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jun 2022 13:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l8dntkIr3AxDxgMQ2Zhzys5TxYWqUo42d7z9UE/B2zc=; b=mx/rg3NVHwgO63BgLTuZoh/Mqd
 2DyaGGE0dX0DJNZyYtGNN4ygBahwXvi0+Q3LkpSqTItHGKlNt2cXP1wTnYk9zwhUhrPWMAe7Dac/r
 JjcKnAxNFDaGp9uV8TAoqknagKOjhb5U5os43HDuaNr5u7/fl4ygvtBaWuorPcOi1vwk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=l8dntkIr3AxDxgMQ2Zhzys5TxYWqUo42d7z9UE/B2zc=; b=A
 Xljq+84SZRBezlopAP9nvQHUiaWpLDAGZp6ZKBslsZvt7r6VKMqrrfotPmQkDBmHCwUI2JVJjJ6Nf
 Lce8qYhJmncPMXnK3yC7sXZd8t7GtS3uQ14L07r2bcTN5LV/asb2vtZ1FR7/ezkivdaNjhITmsjNw
 Y0rxIR+Pf1mjbB0Q=;
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nyw3w-009uPx-Pg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jun 2022 13:49:36 +0000
Received: by mail-pl1-f172.google.com with SMTP id n18so17697836plg.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 08 Jun 2022 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l8dntkIr3AxDxgMQ2Zhzys5TxYWqUo42d7z9UE/B2zc=;
 b=AvDC8YJYODSz8jECoh+QzYDr8sBmj5+QslXeb2zasf9H42coDBNJKEaaGGhALXZSBD
 fRpcZ2gyLMAdm+a3iQt0DbSE53qnJPH0iyra589GM4W2ffkM/vJ9tzTZZo9ssNN70iRy
 AM9LqbaePBGp2U4aZPtE0RRCbou2yVN07lgvui4JDAafCq345sKF9SBJiPVLSrhi6P1i
 jli2qx2ybs/en3Y3vxcShslW9N9tm3RcWnHu1DPL556uqWcAGr93MAMzEK5WUPs3a/3J
 jZ4Fq2Bzv6bMoGE8t/85TmSZb3xQQXTIKq5tyUBacwoFtCBBInrctPiNnsTA4WNjtcg5
 1osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l8dntkIr3AxDxgMQ2Zhzys5TxYWqUo42d7z9UE/B2zc=;
 b=BTp/Cr3k9HlGhiSG82zOqFFCnNgFwONXIyjQLn/2XNY6sr4fE1C692//RGX65pVVSI
 j1OKoI4IT0vWvD5uLZGQ2OzPvlsoXTtpcGMrfDQV4HgOB3E6kIwq4W3MpXq3iRUEBxB9
 n6qSbTG/WWxbTMvp3r6F3F4OtVbbIfJqLonQwypUF9jjh5hqSJ/2vLBOk9jE5YMS+9uz
 268UmlVSzu4KaveDdMHm5CGqA0jYsuz+wrqKl1NSgnyFbEiI+cncuWEFrp2CSMEAkmRZ
 lSaksQdSmzqbHWL6F5ozx5HlLq8GGCARIaz6xZBBfU41zBEUVRB6ejri0J8iTxY7TiH8
 0YAA==
X-Gm-Message-State: AOAM532coSdWs61LMe0Jl/GlI1Hvy5y6LRmzNMk30S+SXJLrfAPScv22
 B6WX3YSabNMNTeWWZ9pL6yHlNchiZyiGCg==
X-Google-Smtp-Source: ABdhPJxObxass9EFEXR0tjvSQJLpfksuOExqB0HPDZG9WRuzAEykYoFEbAzV9Ol0VaSSN+VDB6ZwBA==
X-Received: by 2002:a17:902:da8b:b0:165:112b:b4e7 with SMTP id
 j11-20020a170902da8b00b00165112bb4e7mr34452588plx.85.1654696167239; 
 Wed, 08 Jun 2022 06:49:27 -0700 (PDT)
Received: from localhost.localdomain (pcd720067.netvigator.com.
 [218.102.252.67]) by smtp.googlemail.com with ESMTPSA id
 y200-20020a6264d1000000b0051bdf74177fsm11101081pfb.80.2022.06.08.06.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 06:49:26 -0700 (PDT)
From: Fengnan Chang <fengnanchang@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed,  8 Jun 2022 21:48:52 +0800
Message-Id: <20220608134852.476876-1-fengnanchang@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When decompressed failed, f2fs_prepare_compress_overwrite
 will enter endless loop, may casue hungtask. [ 14.088665] F2FS-fs (nvme0n1):
 lz4 decompress failed, ret:-4155 [ 14.089851] F2FS-fs (nvme0n1): lz4 decompress
 failed, ret:-4155 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [fengnanchang[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.172 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nyw3w-009uPx-Pg
Subject: [f2fs-dev] [PATCH v2] f2fs: fix hungtask when decompressed fail
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

When decompressed failed, f2fs_prepare_compress_overwrite will enter
endless loop, may casue hungtask.

[   14.088665] F2FS-fs (nvme0n1): lz4 decompress failed, ret:-4155
[   14.089851] F2FS-fs (nvme0n1): lz4 decompress failed, ret:-4155

Signed-off-by: Fengnan Chang <fengnanchang@gmail.com>
---
 fs/f2fs/compress.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 24824cd96f36..1764e3859262 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1060,7 +1060,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 	sector_t last_block_in_bio;
 	unsigned fgp_flag = FGP_LOCK | FGP_WRITE | FGP_CREAT;
 	pgoff_t start_idx = start_idx_of_cluster(cc);
-	int i, ret;
+	int i, ret, retry_count = 3;
 
 retry:
 	ret = f2fs_is_compressed_cluster(cc->inode, start_idx);
@@ -1120,7 +1120,12 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 			f2fs_put_rpages(cc);
 			f2fs_unlock_rpages(cc, i + 1);
 			f2fs_destroy_compress_ctx(cc, true);
-			goto retry;
+			retry_count--;
+			if (PageError(page) && !retry_count) {
+				ret = -EIO;
+				goto out;
+			} else
+				goto retry;
 		}
 	}
 
@@ -1657,10 +1662,16 @@ static void __f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
 		if (!rpage)
 			continue;
 
-		/* PG_error was set if verity failed. */
-		if (failed || PageError(rpage)) {
+		if (failed) {
+			/* decompress page failed */
+			ClearPageUptodate(rpage);
+			SetPageError(rpage);
+		} else if (PageError(rpage)) {
+			/*
+			 * PG_error was set if verity failed.
+			 * will re-read again later.
+			 */
 			ClearPageUptodate(rpage);
-			/* will re-read again later */
 			ClearPageError(rpage);
 		} else {
 			SetPageUptodate(rpage);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
