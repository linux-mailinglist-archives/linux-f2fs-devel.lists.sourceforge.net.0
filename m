Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30521AAF2B4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 07:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3RlIEvla9zz8O0jdkzm6sbOMWPjetTvr3FCSEg817c=; b=ImHLAstdf2uSSLs3Yra7zp2/He
	k9e4OlunSknFF7uyfxxdAw4G9rcU32vzvIB/yiQFAomP0JJvbXLx3B/WDDvT4HC8Plw44IjTzVfVC
	MlmpOvQCED8lk5yoy1ISBVchzDRfliq3FfBlc3RUcn9RlmRqePFWiy+IksU2+EqKrE7E=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCtbi-0007xB-Ou;
	Thu, 08 May 2025 05:15:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b29930b5fa9b2b8daadf+7928+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uCtbg-0007wz-SI for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hjROd0wIshF4nMKexOdcqPc3YUZQgQDvNXYUo/8KwuY=; b=Kmt4ICPyfxmRZ4g5GYrJrMvKNB
 GH1V4+FwNoXMb3p8MKoagxROp3koZO6GMJCYn1NRUj3ecxYsQdYlfuY0TiSQhZRr0I5svErnp8LN1
 Q5tDI43PtnKWS+8noaH5JOx4Uk1RUX/OLiKH/xp7x5HllNfhlA5lSoZ9G54VEBKZXzb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hjROd0wIshF4nMKexOdcqPc3YUZQgQDvNXYUo/8KwuY=; b=gLlQno3hU4gWX5WwlYZTkVBchX
 tT9hWX1t2+gsdVBsr0dIUldKGefmhYyJSxdMvXNGk40FIi8+pXy34mnDol62nSOBpo4VVc+hFCP2B
 L4f1dPCgwGNwkkyoEsNyD3ARDhQHHHivZA4nVAw5mwzi44hTt/7b8WP25FeogzWKb4kc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCtbg-0003ca-HN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=hjROd0wIshF4nMKexOdcqPc3YUZQgQDvNXYUo/8KwuY=; b=tncbnr0Z/51DQlCz6NmFJZGyGG
 aT5jujsnIXf19DNcnuMwusr8F6xwrqODAPPL9iFemFFE57h1vKdZUjODAEz3VbjoxneORcLp3Hcrf
 hcvGv1PqEWzkPHfSq93lefR+hoh01EzsNvGxsjxP+U9D3RXMVHb/48DhFfyIfmilZQf5Ag7bdXVhp
 J4iXUvDw0XBvLlGAeuEvMezQ+tsnOh76DlgmzV7DYzIAQU/mRPDr9FEexZIhHb9HyCI3oQiUa1lAE
 QRBiLXPc7diNb6EwD5Qb+UHE/+k4EJO0xXwLRsmjdnLVvb4RmWnhTYcYXmD6xRMwtLF2t8Vw4jaBl
 1yt/wrPg==;
Received: from
 2a02-8389-2341-5b80-2368-be33-a304-131f.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:2368:be33:a304:131f] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uCtbV-0000000HLfo-2btf; Thu, 08 May 2025 05:15:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu,  8 May 2025 07:14:27 +0200
Message-ID: <20250508051520.4169795-2-hch@lst.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508051520.4169795-1-hch@lst.de>
References: <20250508051520.4169795-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> If __write_node_folio()
 failed, 
 it will return AOP_WRITEPAGE_ACTIVATE, the incorrect return value may be
 passed to userspace in below path,
 fix it. - sync_filesystem - sync_fs - f2fs_issue_checkpoint
 - block_operations - f2fs_sync_node_pages - __write_node_folio : return
 AOP_WRITEPAGE_ACTIVATE
 Content analysis details:   (-2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1uCtbg-0003ca-HN
Subject: [f2fs-dev] [PATCH 1/6] f2fs: fix to return correct error number in
 f2fs_sync_node_pages()
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

If __write_node_folio() failed, it will return AOP_WRITEPAGE_ACTIVATE,
the incorrect return value may be passed to userspace in below path,
fix it.

- sync_filesystem
 - sync_fs
  - f2fs_issue_checkpoint
   - block_operations
    - f2fs_sync_node_pages
     - __write_node_folio
     : return AOP_WRITEPAGE_ACTIVATE

Cc: stable@vger.kernel.org
Reported-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ec74eb9982a5..69308523c34e 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2092,10 +2092,14 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 
 			ret = __write_node_folio(folio, false, &submitted,
 						wbc, do_balance, io_type, NULL);
-			if (ret)
+			if (ret) {
 				folio_unlock(folio);
-			else if (submitted)
+				folio_batch_release(&fbatch);
+				ret = -EIO;
+				goto out;
+			} else if (submitted) {
 				nwritten++;
+			}
 
 			if (--wbc->nr_to_write == 0)
 				break;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
