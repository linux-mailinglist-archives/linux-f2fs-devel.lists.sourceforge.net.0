Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D0E65309E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Dec 2022 13:14:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7xyy-0004rJ-U6;
	Wed, 21 Dec 2022 12:14:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p7xyw-0004r9-Rs
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 12:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZlX40gvfwdHtQPzDn0Mu3Eeqok3/8B1IdBhLZGQMwzs=; b=gEQX3h4UqIoZZ3Ab0jKDiX3nhX
 NOMS9NT+gjWrIiEAbntI1Gf8tCdxIypZ7yImXKXx+UgyM6l6WvCc0N8W2O3gJ3b7W5yGPryDWPI70
 SpCdznLSY6Rnq5kcX5BT2LV54rdotDZFK3PwpT1/aDL8uOFyD69VS1Q3Ub12hc7SVwPI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZlX40gvfwdHtQPzDn0Mu3Eeqok3/8B1IdBhLZGQMwzs=; b=T
 TDs466tn8gBguimRZZ2WBhV50B00vbmS92pqPYVf7n0HE9SKjTI/S68GHc2wL29OjclWIUcafkUkN
 hcxUGAJSqYsIecJ0zQaROosxMUkZDcG+YmhOsEmeU5n3KxkIGx38UJ5eAmaZu9L+qiIjWh48xDanz
 nJqe6LdzZzsLRWnM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7xyw-006h10-3C for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 12:13:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CE319B81B80
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Dec 2022 12:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D252C433F0;
 Wed, 21 Dec 2022 12:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671624830;
 bh=xIFUOdw6h/m98UutRxVbjzmSxlBaUQ21YinqKn/ghXE=;
 h=From:To:Cc:Subject:Date:From;
 b=SVvvbmhux64d167V+FcTPMv/TnlGk5unW1vg9fGJ7J68k8U7F1EiLeZdwLiX5NPOe
 P2tJryziI5jqb+cuCJVMrRoKP1+HHXWJvFjrFlY9SqJWfoTIHmbwYSazch2w8FN3pb
 nO72pXCAFq3M7ywNSzGjUfejRK8KBEilutCLu8WiyBQ0Am1k1oVPC4hSxPQm7OCWuq
 xMCa9jzuF86GEKBNOKw/O3L2/5DcA7cKN1iwu6bHXWlojiyP20c+NFsGqYCfl7dY5Z
 dK18SiGkeBCKBfxZRf4b/opxSEiF3irXDa9gQNg6c8okS/opzSukt2vKEqWYnHSm26
 GCPvS5dBTp06g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 21 Dec 2022 20:13:45 +0800
Message-Id: <20221221121345.14353-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: b763f3bedc2d ("f2fs: restructure f2fs page.private layout")
 missed to call clear_page_private_reference() in .{release,invalid}_folio,
 fix it, though it's not a big deal since folio_detach_private() w [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p7xyw-006h10-3C
Subject: [f2fs-dev] [PATCH] f2fs: fix to call clear_page_private_reference
 in .{release, invalid}_folio
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

b763f3bedc2d ("f2fs: restructure f2fs page.private layout") missed
to call clear_page_private_reference() in .{release,invalid}_folio,
fix it, though it's not a big deal since folio_detach_private() was
called to clear all privae info and reference count in the page.

BTW, remove page_private_reference() definition as it never be used.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 2 ++
 fs/f2fs/f2fs.h | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b1ec0fbf1c8f..53d8945df2c1 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3696,6 +3696,7 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 		}
 	}
 
+	clear_page_private_reference(&folio->page);
 	clear_page_private_gcing(&folio->page);
 
 	if (test_opt(sbi, COMPRESS_CACHE) &&
@@ -3721,6 +3722,7 @@ bool f2fs_release_folio(struct folio *folio, gfp_t wait)
 			clear_page_private_data(&folio->page);
 	}
 
+	clear_page_private_reference(&folio->page);
 	clear_page_private_gcing(&folio->page);
 
 	folio_detach_private(folio);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9da26d4ec017..049d4fa0b59e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1453,7 +1453,6 @@ static inline void clear_page_private_##name(struct page *page) \
 }
 
 PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
-PAGE_PRIVATE_GET_FUNC(reference, REF_RESOURCE);
 PAGE_PRIVATE_GET_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_GET_FUNC(gcing, ONGOING_MIGRATION);
 PAGE_PRIVATE_GET_FUNC(dummy, DUMMY_WRITE);
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
