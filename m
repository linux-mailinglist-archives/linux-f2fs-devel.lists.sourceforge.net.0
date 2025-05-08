Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE849AAF2B7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 07:16:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUpbzxk3myU15t7zf0qq6gzJmVCd4BkPzmi5e64f2/4=; b=A0x+TRbivC4cwaaI/uuMQ1figf
	uc6N59bFBaTr9IifBmuvG+5iZCiUARN3VzwF8JOfpOZWi+YLg9fD9CVhwKMj++cOOvd0DFW2zUFr1
	dtI5fppRRZLtsP6s5Ji8sV6/Zit2aRrjV9mcl8C7vI+AHnPdP8vK3K8fUNMKsYhEG30w=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCtc2-0004wo-JM;
	Thu, 08 May 2025 05:16:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b29930b5fa9b2b8daadf+7928+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uCtbv-0004wE-Fr for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9iAR2eTcwVT7JLnmWJ2t+U6ibTzxDLj91NO/OnBFYZ0=; b=XJLZIU8dMFSF35HN4u6A1Zqiwx
 WWOSvvR8Ju1xRr5cnxmrA1X0wrozCcMRpA/FOgDHPqLorZ9ngQ4vEaBcwmKnldLSzpBFbBoQT/LdP
 7apl/CdT9A5ND73i5p1ZSN4NjNUQstY2fkBYnlH1MQLTiorA/skjxvQ4Vfyd9ELq6yj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9iAR2eTcwVT7JLnmWJ2t+U6ibTzxDLj91NO/OnBFYZ0=; b=SsRNXlcy8zaKfEEPWWA3FedNdQ
 FPbOO5giETh4MAnkSQSDP8349AA8LlbX1Re1SIOhF9T+3M6iGdPoSL43lPJDe02s5EDl4/qZSf3jl
 GKDkPbe6DF+sTiGChJI7zm3rksrIzjIN3XB2aZcTy0LGDKUP75+fWEcKWt7jpY50IHes=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCtbt-0003dY-3l for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9iAR2eTcwVT7JLnmWJ2t+U6ibTzxDLj91NO/OnBFYZ0=; b=hav3P66xr2lAYDTPGNAyvOx2VQ
 soPqkPR+ezWtip2+z8m5LB3GZ73Q+f572nR9UwrhAW1946NOZRotbBCwqgIRXVDwxtpdKQnrI+FZn
 7WujXeVzkiWwFQlhLiKEUkN8wa2+E8OUnuRQxBJMpbTx3mw0pJHNe8EYH8TTJfjZWPNGSxRTiR7rb
 yff/cPXdxdQlokrgf1GcUV3bf+OvHdOAwJaD79gehbc/I+33yH8r/qO7xEBaIf3lDSWDCDlCG7QWH
 3F5P7hjDkJt+BoanY7YfbViaCVaev/bxoWwrEqRK9GEn2bpO7a25fLUtNWtvC9b1rL0YRRhVpDNws
 KOgzaL3A==;
Received: from
 2a02-8389-2341-5b80-2368-be33-a304-131f.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:2368:be33:a304:131f] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uCtbi-0000000HLgi-1FeM; Thu, 08 May 2025 05:15:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu,  8 May 2025 07:14:31 +0200
Message-ID: <20250508051520.4169795-6-hch@lst.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508051520.4169795-1-hch@lst.de>
References: <20250508051520.4169795-1-hch@lst.de>
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
 | 23 +++++++++++ 1 file changed, 11 insertions(+), 12 deletions(-) 
 Content analysis details:   (-2.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
X-Headers-End: 1uCtbt-0003dY-3l
Subject: [f2fs-dev] [PATCH 5/6] f2fs: simplify return value handling in
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
 fs/f2fs/node.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index f6e98c9fac95..cbc7e9997b74 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1871,31 +1871,30 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
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
+				folio_batch_release(&fbatch);
+				ret = -EIO;
+				goto out;
 			}
+			if (submitted)
+				nwritten++;
 
 			if (folio == last_folio) {
 				f2fs_folio_put(folio, false);
+				folio_batch_release(&fbatch);
 				marked = true;
-				break;
+				goto out;
 			}
 		}
 		folio_batch_release(&fbatch);
 		cond_resched();
-
-		if (ret || marked)
-			break;
 	}
-	if (!ret && atomic && !marked) {
+	if (atomic && !marked) {
 		f2fs_debug(sbi, "Retry to write fsync mark: ino=%u, idx=%lx",
 			   ino, last_folio->index);
 		folio_lock(last_folio);
@@ -1907,7 +1906,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
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
