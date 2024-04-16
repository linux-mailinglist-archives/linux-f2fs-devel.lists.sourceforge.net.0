Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C48A8A71AB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Apr 2024 18:49:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rwlzi-0006e7-F1;
	Tue, 16 Apr 2024 16:49:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rwlzg-0006e1-1p
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 16:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZMxCw54AtBaRumCAIXDGXxgbQHZ/5d+ZHh20djuB//c=; b=Ed1r1d25q6OkRbj3Is+Rt1DZr6
 x9OwmgUqJRzOoWqCIXjTahRHL4QZCFROp63r5rGHY2yXKHzqLTMXuYusOl2A5tAyp+aD2jOwj0bwF
 zQDGpSExA1ao3szmHzFRuRF5b4gaorG2W5VjIxcuVrcTYSSltYzSL059gtdGZr9pUdRI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZMxCw54AtBaRumCAIXDGXxgbQHZ/5d+ZHh20djuB//c=; b=GQPtPMl3pDJIVMlJcvs1js6GNj
 E9EP9TkFftpbwNJAHKaLs7x3Mcd33abiY8/Vp4OgIAdz7QR1j5si9ogeXgqkaMXYzJ8y1SuhpKJo8
 nUS+hh17J+FJaDsEHnHtvDOkCg1zhYDtOCQ0D4oUVs1AnGOshWUUzOieH6IV9GPNncwU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rwlzf-0006Z0-QC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 16:49:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B2C061135
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Apr 2024 16:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0474C113CE;
 Tue, 16 Apr 2024 16:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713286144;
 bh=HAesg3qRZc7lQplWbxqms8wxUlus9BS8t2j/gdAeWJs=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=c11lxcyGVB6UA+AdljlYDtaJ9Rin2zGn20+yuOq0VpmK0Mpu7ThJO3lSev5W/K4AP
 IRW1Yo5mDJKGDM9wb+fak8Ki3XZhuYOrJpOuDBxa6aPIRAvL8a2dhVwwmgI2ZqLCMJ
 WpisGNxpjqjmIMljr52uOZKL6KDOTRvnChiXnWZLBRXI50+h0ZIiFxFRyMAdNNzjgX
 HTPhx80A6+36tkz3YT6NGcByUM1mw1OOGOnuUyESWSlhBueMfjOBoaS7sVFneVzFkI
 FwQRo481Ghx4vz7ztFrqGPPEwTSAaZAqBky0mkQS8RBv5y4AoxbZaBjFUNTPIUIena
 PtXJEUw0P6lqQ==
Date: Tue, 16 Apr 2024 16:49:03 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Zh6r_yLKOnNkMedZ@google.com>
References: <20240409203411.1885121-1-jaegeuk@kernel.org>
 <20240409203411.1885121-2-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240409203411.1885121-2-jaegeuk@kernel.org>
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's stop issuing compressed writes and clear their
 writeback
 flags. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- Now, I don't see
 any kernel hang for 24hours. 
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rwlzf-0006Z0-QC
Subject: Re: [f2fs-dev] [PATCH 2/3 v2] f2fs: clear writeback when
 compression failed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's stop issuing compressed writes and clear their writeback flags.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Now, I don't see any kernel hang for 24hours.

 Change log from v1:
  - fix bugs

 fs/f2fs/compress.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d67c471ab5df..b12d3a49bfda 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1031,6 +1031,31 @@ static void set_cluster_writeback(struct compress_ctx *cc)
 	}
 }
 
+static void cancel_cluster_writeback(struct compress_ctx *cc,
+			struct compress_io_ctx *cic, int submitted)
+{
+	int i;
+
+	/* Wait for submitted IOs. */
+	if (submitted > 1) {
+		f2fs_submit_merged_write(F2FS_I_SB(cc->inode), DATA);
+		while (atomic_read(&cic->pending_pages) !=
+					(cc->valid_nr_cpages - submitted + 1))
+			f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+	}
+
+	/* Cancel writeback and stay locked. */
+	for (i = 0; i < cc->cluster_size; i++) {
+		if (i < submitted) {
+			inode_inc_dirty_pages(cc->inode);
+			lock_page(cc->rpages[i]);
+		}
+		clear_page_private_gcing(cc->rpages[i]);
+		if (folio_test_writeback(page_folio(cc->rpages[i])))
+			end_page_writeback(cc->rpages[i]);
+	}
+}
+
 static void set_cluster_dirty(struct compress_ctx *cc)
 {
 	int i;
@@ -1232,7 +1257,6 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		.page = NULL,
 		.encrypted_page = NULL,
 		.compressed_page = NULL,
-		.submitted = 0,
 		.io_type = io_type,
 		.io_wbc = wbc,
 		.encrypted = fscrypt_inode_uses_fs_layer_crypto(cc->inode) ?
@@ -1358,7 +1382,16 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 			fio.compressed_page = cc->cpages[i - 1];
 
 		cc->cpages[i - 1] = NULL;
+		fio.submitted = 0;
 		f2fs_outplace_write_data(&dn, &fio);
+		if (unlikely(!fio.submitted)) {
+			cancel_cluster_writeback(cc, cic, i);
+
+			/* To call fscrypt_finalize_bounce_page */
+			i = cc->valid_nr_cpages;
+			*submitted = 0;
+			goto out_destroy_crypt;
+		}
 		(*submitted)++;
 unlock_continue:
 		inode_dec_dirty_pages(cc->inode);
@@ -1392,8 +1425,11 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 out_destroy_crypt:
 	page_array_free(cc->inode, cic->rpages, cc->cluster_size);
 
-	for (--i; i >= 0; i--)
+	for (--i; i >= 0; i--) {
+		if (!cc->cpages[i])
+			continue;
 		fscrypt_finalize_bounce_page(&cc->cpages[i]);
+	}
 out_put_cic:
 	kmem_cache_free(cic_entry_slab, cic);
 out_put_dnode:
-- 
2.44.0.683.g7961c838ac-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
