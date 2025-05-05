Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 999EBAA9128
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 May 2025 12:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOlIbmJHEymyCVoRSapJA8TBsrElG1Xh9bcpS6yH9SE=; b=N2CScWxcAzBW8p0o1HdNYjU/uJ
	nXdyDDUjwuxOpvjeyRQAGEnCHQ638jDGXN5VNqNeUfW1HEttYUO557Ao1fFxjzcMnaam40XNYXA43
	A9vuztO35EO1nfVCfe3q0xZjiAmYMmay3odqoGY+oJPr0C9eX+kVi+pAzEaww9BotkUw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uBt5r-0007ya-DD;
	Mon, 05 May 2025 10:30:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+9b9d72b124a21f5aaaac+7925+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uBt5q-0007yS-9C for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 May 2025 10:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1iiA19Fpkg3RQwIUcBZsoeN39RODM7CDkoOHf3ZXDJ4=; b=B8wFEO97nLDRYHmzznuI1bK5Bx
 b6bdFQxu2LclVOmxtrYdTIf8cEsk6DE95/SnTViXaj8h+3f5HTlp/HLYqorJfjvAogTXDA5xqI5Cp
 BIjEC0bIbQMFNRzFsn5wFziQKJZvitKe2cZ6TPKdtZYDvS8lTxF6FXX60msLTPSIMGH8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1iiA19Fpkg3RQwIUcBZsoeN39RODM7CDkoOHf3ZXDJ4=; b=jOHHxwBhpVtImK2nwadmneh7PN
 sQbrpUGk11TDoDHWRRGwJUWJ48RGLORljVcpjgmgBTvvNjgbyozZgB6gIWsUZ0M4Qztf9uNV2eIMq
 QP3oFFBHhK5XLcpiwyhjobWXnvtrlBfuxkMviaBoUogoWUUpI5zlF7CyDdc6BQ3GZLLU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uBt5a-0002yE-Hb for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 May 2025 10:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=1iiA19Fpkg3RQwIUcBZsoeN39RODM7CDkoOHf3ZXDJ4=; b=x/U3nuPkN4ZRicLcyPK8i5g35N
 QUGZj0hAQXwIjC5s0sVXePlxxMTFvxhB+Ul6RvtUffY5O8fQpvNj2yuVG0YjFd2Ot5c3CC9q1S/vn
 o15RL2oI5tZybBe2WylZMNpf6yI/ZzBaPR7yFbqHA+WNY6s7w6Ws+kWT8hNtCZTXG59PBZBauJCp1
 ognWOiZNN4dyh1fM4UfwRXWlknrKZp2sAenHRXagT9yyxPhqKb9IrX+7mEfDPzTck/lomedt0cZRt
 /Zibx+bM6AsszTGD5UVC0nJJ64JZXY8r8MJkXrQcFeFzT4GtR+s3HujOGZHy9BC5SXEglXZ6DD9fn
 tUVe/2rA==;
Received: from
 2a02-8389-2341-5b80-c9f7-77ec-522e-47ca.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:c9f7:77ec:522e:47ca] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uBs5g-00000006um6-3OZ8; Mon, 05 May 2025 09:26:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon,  5 May 2025 11:26:00 +0200
Message-ID: <20250505092613.3451524-4-hch@lst.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505092613.3451524-1-hch@lst.de>
References: <20250505092613.3451524-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Always assign ret where the error happens, and jump to out
 instead of multiple loop exit conditions to prepare for changes in the
 __write_node_folio
 calling convention. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 fs/f2fs/node.c
 | 18 +++++++++--------- 1 file changed, 9 insertions(+), 9 deletions(-) 
 Content analysis details:   (-2.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1uBt5a-0002yE-Hb
Subject: [f2fs-dev] [PATCH 3/4] f2fs: simplify return value handling in
 f2fs_fsync_node_pages
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

Always assign ret where the error happens, and jump to out instead
of multiple loop exit conditions to prepare for changes in the
__write_node_folio calling convention.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/node.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ec74eb9982a5..b9d9519c3da4 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1882,17 +1882,17 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
-			ret = __write_node_folio(folio, atomic &&
+			if (__write_node_folio(folio, atomic &&
 						folio == last_folio,
 						&submitted, wbc, true,
-						FS_NODE_IO, seq_id);
-			if (ret) {
+						FS_NODE_IO, seq_id)) {
 				folio_unlock(folio);
 				f2fs_folio_put(last_folio, false);
-				break;
-			} else if (submitted) {
-				nwritten++;
+				ret = -EIO;
+				goto out;
 			}
+			if (submitted)
+				nwritten++;
 
 			if (folio == last_folio) {
 				f2fs_folio_put(folio, false);
@@ -1903,10 +1903,10 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 		folio_batch_release(&fbatch);
 		cond_resched();
 
-		if (ret || marked)
+		if (marked)
 			break;
 	}
-	if (!ret && atomic && !marked) {
+	if (atomic && !marked) {
 		f2fs_debug(sbi, "Retry to write fsync mark: ino=%u, idx=%lx",
 			   ino, last_folio->index);
 		folio_lock(last_folio);
@@ -1918,7 +1918,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 out:
 	if (nwritten)
 		f2fs_submit_merged_write_cond(sbi, NULL, NULL, ino, NODE);
-	return ret ? -EIO : 0;
+	return ret;
 }
 
 static int f2fs_match_ino(struct inode *inode, unsigned long ino, void *data)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
