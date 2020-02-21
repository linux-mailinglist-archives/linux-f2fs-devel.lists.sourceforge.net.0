Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EC7166EA5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 05:52:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j50IN-0003dY-O0; Fri, 21 Feb 2020 04:52:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j50IM-0003dN-9W
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 04:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8V430hWkyMTB35swz0y0tGK8j3fxKghIblUOn/eKqrg=; b=VlAZ0DwFvhyxnnfxwXpetcj7on
 nBjsbSL561as4Avi4isfKxI7cH4Y7z9VcfcTSkUEmZtEtgunuGEPOBC0cJ3tm4AaBWK4RzEVJPD94
 XvzxSKdAvICLrkh98GrE5Z0pU/pSs0xx0sACxlowheI0rB6YQOvDm5OFeyHE0LeRtjCI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8V430hWkyMTB35swz0y0tGK8j3fxKghIblUOn/eKqrg=; b=J
 0vEmykOqKle+TKHxvoFieJlaFe52/PmCYp1fyEY0wCwCurVp/BCYORpo7lPqCLdk0EPkA8/iUxWj3
 Ez+7EhPp/ldtDt5GOLlVLcdfNSRE8l3tJRW1x/g1pnp0UmHC+v2pnA91/bcJpI5tCiVB+A8P1jvao
 EQM4g9x0Vt8VrxwE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j50IJ-00CQXX-Hc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 04:52:10 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C24D920722;
 Fri, 21 Feb 2020 04:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582260721;
 bh=NIb+2BaYlYqr7iWtTRkiEvfsihqHfCzh+L7LtI63+So=;
 h=From:To:Subject:Date:From;
 b=DC4ELjQ23Y6Vw+rpR1xFnPWxc/v+LkAbBzcq973ggMbhqQPBoTxggh5vjBryLtY+4
 wJ7bg5z8j4tDUwINhxXLbz2SZbNeaWIM4aJTaqn9/WLy0+vx+z1jAGOAgYCogeuvjt
 qKy7dKX+eMkvBEnV4/ZqJyvLsfX67VMJD0e/0eC4=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Chao Yu <chao@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 20 Feb 2020 20:50:37 -0800
Message-Id: <20200221045037.154450-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j50IJ-00CQXX-Hc
Subject: [f2fs-dev] [PATCH] f2fs: fix leaking uninitialized memory in
 compressed clusters
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

From: Eric Biggers <ebiggers@google.com>

When the compressed data of a cluster doesn't end on a page boundary,
the remainder of the last page must be zeroed in order to avoid leaking
uninitialized memory to disk.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/compress.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d8a64be90a501..ef7dd04312fed 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -385,11 +385,15 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	for (i = 0; i < COMPRESS_DATA_RESERVED_SIZE; i++)
 		cc->cbuf->reserved[i] = cpu_to_le32(0);
 
+	nr_cpages = DIV_ROUND_UP(cc->clen + COMPRESS_HEADER_SIZE, PAGE_SIZE);
+
+	/* zero out any unused part of the last page */
+	memset(&cc->cbuf->cdata[cc->clen], 0,
+	       (nr_cpages * PAGE_SIZE) - (cc->clen + COMPRESS_HEADER_SIZE));
+
 	vunmap(cc->cbuf);
 	vunmap(cc->rbuf);
 
-	nr_cpages = DIV_ROUND_UP(cc->clen + COMPRESS_HEADER_SIZE, PAGE_SIZE);
-
 	for (i = nr_cpages; i < cc->nr_cpages; i++) {
 		f2fs_put_compressed_page(cc->cpages[i]);
 		cc->cpages[i] = NULL;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
