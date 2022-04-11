Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E247F4FC6A8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Apr 2022 23:21:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ne1Tw-00083O-B4; Mon, 11 Apr 2022 21:21:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ne1Tu-00083I-Vu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Apr 2022 21:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VUzQhVlmMVLI59w1MKtDK1iLXxrtfmH3p/Z3+o1cBUA=; b=iAjIPr7x9wgq1ean3xluRN0Lzw
 u+EIOsUSzKQ3rI50vFx9uI3t7b3iFhYWGk8MDLxGEnMmwaKCv+ORoVEgEHqwIX3wTYdQ1ghQRS1dk
 8gzGRL46FIO/RSJ2awA5muys7IKPfVgvn8J2o+cFHFy0+5rxbcfnxPwvfQe4njfSVzvo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VUzQhVlmMVLI59w1MKtDK1iLXxrtfmH3p/Z3+o1cBUA=; b=j
 ou9kZDbgTZ2RPTFSaxayTEwJxr/FjBJTExYw/JsLRMWFcY93WeR0NK6RSx0iOFideYvdxV4xdVudb
 DvmVBe1OnjxVgVXZaM0HA8z+AAq5rJIYiy/dASQtfXFO4dRVx1yZC0NC8/FxadrZAq8fuV3E9PwNw
 IK8Lfvz0yVFjCfhs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ne1Tt-0008Rw-CN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Apr 2022 21:21:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1BCAB818C4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Apr 2022 21:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB4EC385A3;
 Mon, 11 Apr 2022 21:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649712105;
 bh=KMidD+w99wAIiwGhewAltcaEDYwfTgwuH9rySlM7owU=;
 h=From:To:Cc:Subject:Date:From;
 b=lk9VWBICFXjGKTnI22r2ysF69//hMym+TGv5xnjmfAAu0maDn0rXzdvqNYHyGD9Ev
 RiQerYKR1ioyJJQTrAY1ZTljIQNFs1HVWIt3TSrCoF+w+MKXoep1FwVmVhecdcINvc
 10EzMt5SIL63+xwx2HwNTQnREAZSAn3phmSwvqo6cvy67kjQk9S3YKNQzWeaFWau29
 hrvuOxMiQ2hfb6IYm4wfIdvz9iDDCLKkVbQFQLTRsDIcgfKT8HjqL7Z8m2+8A/Jw1V
 Z0Az20XQUp24kxfdlJ3QylhQTbzxq7LCUj4XRjqTSNmQ1p77v9OmpcBhYFDMwBsWCw
 N5TO3c0Q9UPWg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 11 Apr 2022 14:21:40 -0700
Message-Id: <20220411212141.1775589-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch fixes wrong initialization. Fixes: 50c63009f6ab
 ("f2fs: avoid an infinite loop in f2fs_sync_dirty_inodes") Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/checkpoint.c | 6 +++--- 1 file
 changed, 3 insertions(+), 3 de [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ne1Tt-0008Rw-CN
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix wrong condition check when failing
 metapage read
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

This patch fixes wrong initialization.

Fixes: 50c63009f6ab ("f2fs: avoid an infinite loop in f2fs_sync_dirty_inodes")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index aba1b8a1ce66..ed61ac99a3cf 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -98,9 +98,9 @@ static struct page *__get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index,
 	}
 
 	if (unlikely(!PageUptodate(page))) {
-		if (page->index == sbi->metapage_eio_ofs &&
-			sbi->metapage_eio_cnt++ == MAX_RETRY_META_PAGE_EIO) {
-			set_ckpt_flags(sbi, CP_ERROR_FLAG);
+		if (page->index == sbi->metapage_eio_ofs) {
+			if (sbi->metapage_eio_cnt++ == MAX_RETRY_META_PAGE_EIO)
+				set_ckpt_flags(sbi, CP_ERROR_FLAG);
 		} else {
 			sbi->metapage_eio_ofs = page->index;
 			sbi->metapage_eio_cnt = 0;
-- 
2.35.1.1178.g4f1659d476-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
