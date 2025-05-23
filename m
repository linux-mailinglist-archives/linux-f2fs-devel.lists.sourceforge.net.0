Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEADFAC1DB5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 May 2025 09:33:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VV3jBe0KFWgCt4OZaoUoUQMhlmMgxlRo8YvhabElwXE=; b=AQvLfFfAJMtO3rbybkrrRiytok
	uZPNoynA+CAWqc61FfimPMlSm0nxFcHyhuTCsPmZsl7Y1jhuo4DxF+WmTcoyjDwtd80Jb5uuNnG0c
	H3U9kGRNIzDhqBUXhzHP+7Rk6Y3sLsUe4OMrhXxLMEW/S803gqgB7Xf1lzVM7Dw1fLTk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uIMuB-0007gh-Ln;
	Fri, 23 May 2025 07:33:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uIMuA-0007ga-T1
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 07:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jSJCxpK7G8wRqG5r7FKQO3FUbv6gkFnC66yAUGa5ik0=; b=cwezHHZJfJT1CAtTc8bC3o8OLK
 Bx52GHGyv1BexjlUhEGhg/65KKAAlbY5KFaHdsN7pz1GtOB/DwDh16dIExRJBmDlbR0nsNprQvQq0
 eRRmNPpG1PCToXs0C0TRXtSKMleqUmTh7vZ6BcKyn+JxH20R0c0wzHlEZ90x2naUVcwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jSJCxpK7G8wRqG5r7FKQO3FUbv6gkFnC66yAUGa5ik0=; b=IpQDy4Vxa/lsqrlRdP7okB3tO6
 FRm5kStVaqlTNpjOi/TH02Blh6jE1aw2y9RN/0BxI2kkySGXQ1xOhi6280XlHFCm9ByoSMDjHK70z
 m9kpA/LP4xgeJbiC7BkHXji+9rmIf1+sDMr1FvLXmgcmTpG4f/FXaZrZNz5moLLW0Ito=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uIMuA-0004Gi-6G for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 07:33:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8B750A4F0E5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 May 2025 07:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCACC4CEF0;
 Fri, 23 May 2025 07:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747985591;
 bh=Hd0gSY4BrbsvkvJ25VLQRBMFsp5HZ45eDTPk810HP3s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fZvtBVxTk0e0/OQnhpqUSRnlqkRZNCcsEbaEoXs+WsEcCe5VmZ2bjuZ5Z+7mp7wfQ
 595vhB1mXwK1nsFFC5V7PPivH0zTAlLSMkCetuYjvbQKaz9cV6If/T2+1bxs4XOB2B
 8HY7zAKYFkYxOJv4ikymmqzukNyX1MGMkKsLb753aWeAh9hVsMhMazfSrJ7QMhA8jb
 F9cbeN4DzH4DVOifu30AjStRfLX5Ys01ACYYhaX72pAMt4B5GdnnX6jb5W3oSoL/Yf
 5SCq932yJzP+r4M0X30Vb2A2up2Y+vkbtjSawq4uiDxPeZbWRIubE2WEguCj1uZ6KO
 AMJ2M0g6cp63Q==
To: jaegeuk@kernel.org
Date: Fri, 23 May 2025 15:33:04 +0800
Message-ID: <20250523073304.1454247-2-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
In-Reply-To: <20250523073304.1454247-1-chao@kernel.org>
References: <20250523073304.1454247-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Check bi_status w/ BLK_STS_OK instead of 0 for cleanup.
 Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/compress.c | 2 +- fs/f2fs/data.c |
 6 +++--- 2 files changed, 4 insertions(+), 4 deletions(-) 
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uIMuA-0004Gi-6G
Subject: [f2fs-dev] [PATCH 2/2] f2fs: clean up to check bi_status w/
 BLK_STS_OK
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Check bi_status w/ BLK_STS_OK instead of 0 for cleanup.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 2 +-
 fs/f2fs/data.c     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 0dc65634cc61..b3c1df93a163 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1483,7 +1483,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
 				f2fs_is_compressed_page(page));
 	int i;
 
-	if (unlikely(bio->bi_status))
+	if (unlikely(bio->bi_status != BLK_STS_OK))
 		mapping_set_error(cic->inode->i_mapping, -EIO);
 
 	f2fs_compress_free_page(page);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 1be38186076d..31e892842625 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -151,7 +151,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 		}
 
 		dec_page_count(F2FS_F_SB(folio), __read_io_type(folio));
-		folio_end_read(folio, bio->bi_status == 0);
+		folio_end_read(folio, bio->bi_status == BLK_STS_OK);
 	}
 
 	if (ctx)
@@ -290,7 +290,7 @@ static void f2fs_read_end_io(struct bio *bio)
 	if (time_to_inject(sbi, FAULT_READ_IO))
 		bio->bi_status = BLK_STS_IOERR;
 
-	if (bio->bi_status) {
+	if (bio->bi_status != BLK_STS_OK) {
 		f2fs_finish_read_bio(bio, intask);
 		return;
 	}
@@ -347,7 +347,7 @@ static void f2fs_write_end_io(struct bio *bio)
 
 		type = WB_DATA_TYPE(&folio->page, false);
 
-		if (unlikely(bio->bi_status)) {
+		if (unlikely(bio->bi_status != BLK_STS_OK)) {
 			mapping_set_error(folio->mapping, -EIO);
 			if (type == F2FS_WB_CP_DATA)
 				f2fs_stop_checkpoint(sbi, true,
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
