Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7AB89E478
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Apr 2024 22:34:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruIAl-0004a9-TE;
	Tue, 09 Apr 2024 20:34:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ruIAi-0004Zg-20
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 20:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DViuD9q47sgWqUNVbmW7SyxVjvs0LravwJ40SFdxKG4=; b=bpnvv/JrSMwaihzdR8hfrPz2P3
 8MxyY/xQFuYoOUcxUi+o13NdGjRikxAnntsYNxpURlBPlmKYunNYHCcIRYYLutp4lyXrcvRqZgFny
 4TZmXFvXtVZBHjs/gKMWUInuO8FEbHzQ8Hahrww60czBioXYSbphdy6mka+KbLm17uPM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DViuD9q47sgWqUNVbmW7SyxVjvs0LravwJ40SFdxKG4=; b=GKM923FmxyAyGUI8QscbkfIwaq
 dI81Y2yc9zxL7uXDA1ZyqBiLSiFzDOTeNj/Z+AWdrRyBVCUVPMRNtgZS76wktuHP++NMKLsEcw6dA
 7zazscK5/MGmm7ON12lcxYGIOR4/FuQ2VSI8rsfiN+2HBZ8rutE/iPecf9Huw3bBF/CI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruIAg-0001QE-AJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 20:34:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0227261A17
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 Apr 2024 20:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A76CC433F1;
 Tue,  9 Apr 2024 20:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712694856;
 bh=yuHHraFJs2uSx9hQ7hdbnjpoe1/DllEgPkr59YJ8+BU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qYS5yUbp2j2MUkMS/chiuO59dZHMJNSE+6fhRmIqgrmpMsWsXPq11EPlEQFcnkp99
 HnWtx8P31Ejg/zj46124biFba+Pz96KQDjmJKVU+nC6XcSZQgQBrrOUWr6bTKqcOpt
 4DY6avaWW08lHV6cty4FKMK6+zo/lsMlbAqXZ2QUptl3W5G26MOWu3+z2vGtX2oXDs
 4Id09by82cRuUMnEwQIiKdAKmEs7Wbybyr9PlYxfKOX5+66+MMC2k6H+jG2kqlTWlM
 f9eIVPMnKbWIBXfIGJ1Eg7iK8YGSTc0vbg1Dk3wDgGQL3U2XskeK37fh4nEmZ5AnTu
 exkNMIRLiJeUg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  9 Apr 2024 20:34:10 +0000
Message-ID: <20240409203411.1885121-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240409203411.1885121-1-jaegeuk@kernel.org>
References: <20240409203411.1885121-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -6.9 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's stop issuing compressed writes and clear their
 writeback
 flags. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/compress.c
 | 33 +++++++++++++++++++++++++++++++-- 1 file changed, 31 insertions(+),
 2 deletions(-) 
 Content analysis details:   (-6.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ruIAg-0001QE-AJ
Subject: [f2fs-dev] [PATCH 2/3] f2fs: clear writeback when compression failed
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's stop issuing compressed writes and clear their writeback flags.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/compress.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d67c471ab5df..3a8ecc6aee84 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1031,6 +1031,25 @@ static void set_cluster_writeback(struct compress_ctx *cc)
 	}
 }
 
+static void cancel_cluster_writeback(struct compress_ctx *cc, int submitted)
+{
+	int i;
+
+	for (i = 0; i < cc->cluster_size; i++) {
+		if (!cc->rpages[i])
+			continue;
+		if (i < submitted) {
+			if (i)
+				f2fs_wait_on_page_writeback(cc->rpages[i],
+						DATA, true, true);
+			inode_inc_dirty_pages(cc->inode);
+			lock_page(cc->rpages[i]);
+		}
+		clear_page_private_gcing(cc->rpages[i]);
+		end_page_writeback(cc->rpages[i]);
+	}
+}
+
 static void set_cluster_dirty(struct compress_ctx *cc)
 {
 	int i;
@@ -1232,7 +1251,6 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		.page = NULL,
 		.encrypted_page = NULL,
 		.compressed_page = NULL,
-		.submitted = 0,
 		.io_type = io_type,
 		.io_wbc = wbc,
 		.encrypted = fscrypt_inode_uses_fs_layer_crypto(cc->inode) ?
@@ -1358,7 +1376,15 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 			fio.compressed_page = cc->cpages[i - 1];
 
 		cc->cpages[i - 1] = NULL;
+		fio.submitted = 0;
 		f2fs_outplace_write_data(&dn, &fio);
+		if (unlikely(!fio.submitted)) {
+			cancel_cluster_writeback(cc, i);
+
+			/* To call fscrypt_finalize_bounce_page */
+			i = cc->valid_nr_cpages;
+			goto out_destroy_crypt;
+		}
 		(*submitted)++;
 unlock_continue:
 		inode_dec_dirty_pages(cc->inode);
@@ -1392,8 +1418,11 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
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
2.44.0.478.gd926399ef9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
