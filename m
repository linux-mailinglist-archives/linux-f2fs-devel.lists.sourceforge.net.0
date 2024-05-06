Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6268BCC50
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 May 2024 12:47:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s3vsw-00010y-Ba;
	Mon, 06 May 2024 10:47:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s3vsv-00010s-IN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QL4vyRtmG5FSzbsXBO1xaJgwK7PzdIMcEw34cP4BtdQ=; b=FhstR4DRCg0uSyhhMUM8pUYvrt
 SGgFVutySHoyCp9hDcXCNm6UdEoDjp7TPvhcTNgDwcD2VR1AfcRL+w+J7S4G0mMwowLQr7FbCCGDK
 Nk2OQph4eomnVd0h7mtKCFdDymyFCR3zIS8UkRX3uEo/Ccn6aELylPQx1goxkFOha/MA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QL4vyRtmG5FSzbsXBO1xaJgwK7PzdIMcEw34cP4BtdQ=; b=f
 THGyO8/toBuwkA4NWgJnc4v6D6DnEyog8RQACBTMze222y+Gz50G/hz64s1fefyOYnj3qoZe9hNW5
 ntZHlgv92W147FYC3a9UWuLjgH5Kpw9hDzxoktkILNZz8ud9JPcJkEYzR16MWhKhpVDEJaTFXpUiG
 pbUOxUmyJVP62Lvw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s3vsv-0005Kw-03 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:47:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 970E86117E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 May 2024 10:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08492C116B1;
 Mon,  6 May 2024 10:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714992467;
 bh=YSOHtXih+YcRDLnOvTaIOUa3RK2klhJIDmHmJq0mX3k=;
 h=From:To:Cc:Subject:Date:From;
 b=Jjo+1PnMqGeDq/5Ak6ychi0RCKK3amUWydv05kqIw3yi2W4LbhtTF0BO9bmZCAMKJ
 H2nsAdv53OlGfqSJ7f+SutiegwE3dW+nS4Psv0wjzekblfGTNtAXoiti8BQMOzvlxG
 XtcKPyclF8R/d6nWyZ3DDPZWwxvHNXrZXP+z20y9Wk+sm24RB8MUYrn9za7iFW8C9o
 iZDmm94kGbWgWB5eRQ6gVWmlWzby4Ka9S5Oj9VasrjjS4jficzzh9Glhp16tGeq/TZ
 j5UbFY3FISNTh+glt9EVtF/w4WnS8Gw93PL9khJp/W07XtNCiTKyahCynEVG9J8Oke
 F2IJz8JPpwW5Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  6 May 2024 18:47:42 +0800
Message-Id: <20240506104742.778789-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit b1c9d3f833ba ("f2fs: support printk_ratelimited() in
 f2fs_printk()") missed some cases,
 cover all remains for cleanup. Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/compress.c | 54 +++++++++++++++++++++
 fs/f2fs/segment.c | 5 ++--- 2 files changed, 26 insertions(+), 33 deletions(-)
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s3vsv-0005Kw-03
Subject: [f2fs-dev] [PATCH] f2fs: use f2fs_{err,
 info}_ratelimited() for cleanup
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

Commit b1c9d3f833ba ("f2fs: support printk_ratelimited() in f2fs_printk()")
missed some cases, cover all remains for cleanup.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 54 +++++++++++++++++++++-------------------------
 fs/f2fs/segment.c  |  5 ++---
 2 files changed, 26 insertions(+), 33 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 8892c8262141..3c70a9697063 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -198,8 +198,8 @@ static int lzo_compress_pages(struct compress_ctx *cc)
 	ret = lzo1x_1_compress(cc->rbuf, cc->rlen, cc->cbuf->cdata,
 					&cc->clen, cc->private);
 	if (ret != LZO_E_OK) {
-		printk_ratelimited("%sF2FS-fs (%s): lzo compress failed, ret:%d\n",
-				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id, ret);
+		f2fs_err_ratelimited(F2FS_I_SB(cc->inode),
+				"lzo compress failed, ret:%d", ret);
 		return -EIO;
 	}
 	return 0;
@@ -212,17 +212,15 @@ static int lzo_decompress_pages(struct decompress_io_ctx *dic)
 	ret = lzo1x_decompress_safe(dic->cbuf->cdata, dic->clen,
 						dic->rbuf, &dic->rlen);
 	if (ret != LZO_E_OK) {
-		printk_ratelimited("%sF2FS-fs (%s): lzo decompress failed, ret:%d\n",
-				KERN_ERR, F2FS_I_SB(dic->inode)->sb->s_id, ret);
+		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+				"lzo decompress failed, ret:%d", ret);
 		return -EIO;
 	}
 
 	if (dic->rlen != PAGE_SIZE << dic->log_cluster_size) {
-		printk_ratelimited("%sF2FS-fs (%s): lzo invalid rlen:%zu, "
-					"expected:%lu\n", KERN_ERR,
-					F2FS_I_SB(dic->inode)->sb->s_id,
-					dic->rlen,
-					PAGE_SIZE << dic->log_cluster_size);
+		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+				"lzo invalid rlen:%zu, expected:%lu",
+				dic->rlen, PAGE_SIZE << dic->log_cluster_size);
 		return -EIO;
 	}
 	return 0;
@@ -294,16 +292,15 @@ static int lz4_decompress_pages(struct decompress_io_ctx *dic)
 	ret = LZ4_decompress_safe(dic->cbuf->cdata, dic->rbuf,
 						dic->clen, dic->rlen);
 	if (ret < 0) {
-		printk_ratelimited("%sF2FS-fs (%s): lz4 decompress failed, ret:%d\n",
-				KERN_ERR, F2FS_I_SB(dic->inode)->sb->s_id, ret);
+		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+				"lz4 decompress failed, ret:%d", ret);
 		return -EIO;
 	}
 
 	if (ret != PAGE_SIZE << dic->log_cluster_size) {
-		printk_ratelimited("%sF2FS-fs (%s): lz4 invalid ret:%d, "
-					"expected:%lu\n", KERN_ERR,
-					F2FS_I_SB(dic->inode)->sb->s_id, ret,
-					PAGE_SIZE << dic->log_cluster_size);
+		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+				"lz4 invalid ret:%d, expected:%lu",
+				ret, PAGE_SIZE << dic->log_cluster_size);
 		return -EIO;
 	}
 	return 0;
@@ -350,9 +347,8 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 
 	stream = zstd_init_cstream(&params, 0, workspace, workspace_size);
 	if (!stream) {
-		printk_ratelimited("%sF2FS-fs (%s): %s zstd_init_cstream failed\n",
-				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id,
-				__func__);
+		f2fs_err_ratelimited(F2FS_I_SB(cc->inode),
+				"%s zstd_init_cstream failed", __func__);
 		kvfree(workspace);
 		return -EIO;
 	}
@@ -390,16 +386,16 @@ static int zstd_compress_pages(struct compress_ctx *cc)
 
 	ret = zstd_compress_stream(stream, &outbuf, &inbuf);
 	if (zstd_is_error(ret)) {
-		printk_ratelimited("%sF2FS-fs (%s): %s zstd_compress_stream failed, ret: %d\n",
-				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id,
+		f2fs_err_ratelimited(F2FS_I_SB(cc->inode),
+				"%s zstd_compress_stream failed, ret: %d",
 				__func__, zstd_get_error_code(ret));
 		return -EIO;
 	}
 
 	ret = zstd_end_stream(stream, &outbuf);
 	if (zstd_is_error(ret)) {
-		printk_ratelimited("%sF2FS-fs (%s): %s zstd_end_stream returned %d\n",
-				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id,
+		f2fs_err_ratelimited(F2FS_I_SB(cc->inode),
+				"%s zstd_end_stream returned %d",
 				__func__, zstd_get_error_code(ret));
 		return -EIO;
 	}
@@ -432,9 +428,8 @@ static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 
 	stream = zstd_init_dstream(max_window_size, workspace, workspace_size);
 	if (!stream) {
-		printk_ratelimited("%sF2FS-fs (%s): %s zstd_init_dstream failed\n",
-				KERN_ERR, F2FS_I_SB(dic->inode)->sb->s_id,
-				__func__);
+		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+				"%s zstd_init_dstream failed", __func__);
 		kvfree(workspace);
 		return -EIO;
 	}
@@ -469,16 +464,15 @@ static int zstd_decompress_pages(struct decompress_io_ctx *dic)
 
 	ret = zstd_decompress_stream(stream, &outbuf, &inbuf);
 	if (zstd_is_error(ret)) {
-		printk_ratelimited("%sF2FS-fs (%s): %s zstd_decompress_stream failed, ret: %d\n",
-				KERN_ERR, F2FS_I_SB(dic->inode)->sb->s_id,
+		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+				"%s zstd_decompress_stream failed, ret: %d",
 				__func__, zstd_get_error_code(ret));
 		return -EIO;
 	}
 
 	if (dic->rlen != outbuf.pos) {
-		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD invalid rlen:%zu, "
-				"expected:%lu\n", KERN_ERR,
-				F2FS_I_SB(dic->inode)->sb->s_id,
+		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+				"%s ZSTD invalid rlen:%zu, expected:%lu",
 				__func__, dic->rlen,
 				PAGE_SIZE << dic->log_cluster_size);
 		return -EIO;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4fd76e867e0a..2f85fd40f9eb 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1109,9 +1109,8 @@ static void __remove_discard_cmd(struct f2fs_sb_info *sbi,
 		dc->error = 0;
 
 	if (dc->error)
-		printk_ratelimited(
-			"%sF2FS-fs (%s): Issue discard(%u, %u, %u) failed, ret: %d",
-			KERN_INFO, sbi->sb->s_id,
+		f2fs_info_ratelimited(sbi,
+			"Issue discard(%u, %u, %u) failed, ret: %d",
 			dc->di.lstart, dc->di.start, dc->di.len, dc->error);
 	__detach_discard_cmd(dcc, dc);
 }
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
