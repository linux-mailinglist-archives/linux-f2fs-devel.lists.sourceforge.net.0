Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D03021A9C67
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:35:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgK7-00034b-LX; Wed, 15 Apr 2020 11:35:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgJz-00034B-LS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xesCfEjgYZZWU2Mg5NJnmXdF7pdmA+DwdGYOtfHtYGY=; b=EM1MRRR2fxWPBKkoLtpSeThMe3
 RTWouaWLYeUkDeupb0LBV+59FcsyivKY/X7pE2bQH2EHBjXKwaKpP64cxrBhBugmBpfHBtLaH2CJ+
 c+samtywpEiO6QU6vevjv/R92g9v5n0IeUz5F0lr77dmbzSnihE87yaMeaKrtIbkcuKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xesCfEjgYZZWU2Mg5NJnmXdF7pdmA+DwdGYOtfHtYGY=; b=UT2Ak64aP/jTUfq5u16igVjkB+
 yC/wsIH7Wm7g/9VOUzIgSGnAq5uR3KheuYpAaj+qZcSkaYz2iJUQ6wQ/VAUDNFLE8C3HzyfVgP1ZE
 +A7oPEL3L3G4lpaGKJY2iMSi23KMsMX98MaF8iToCln2cfoxSS9S28v2vN8D6/YtGlrg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgJv-002XLn-1Y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:35:11 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E10D720775;
 Wed, 15 Apr 2020 11:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586950496;
 bh=LAlumWBbhcpTjkD/toI7vK0NLtLMCH6P3F0H4xaGuv0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oam/UDOW6vbCldWDmSSIfr7NggccawTJORCMuGi+iF5J8NSWtUocKzhl/ywo2RXqC
 O5ppnlEcKMqVXGjRCGvTeT7m+DAuCTWKwJHSRNU5Kz69rwOcPqROE9ZMGxw0YSPtMl
 WShrRV9b9odEZD6tQgckwpvF5yCeXarugx6/vaOg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:32:44 -0400
Message-Id: <20200415113445.11881-9-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415113445.11881-1-sashal@kernel.org>
References: <20200415113445.11881-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOgJv-002XLn-1Y
Subject: [f2fs-dev] [PATCH AUTOSEL 5.6 009/129] f2fs: fix to avoid potential
 deadlock
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit df77fbd8c5b222c680444801ffd20e8bbc90a56e ]

Using f2fs_trylock_op() in f2fs_write_compressed_pages() to avoid potential
deadlock like we did in f2fs_write_single_data_page().

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/compress.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d8a64be90a501..c847523ab4a2e 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -772,7 +772,6 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		.encrypted_page = NULL,
 		.compressed_page = NULL,
 		.submitted = false,
-		.need_lock = LOCK_RETRY,
 		.io_type = io_type,
 		.io_wbc = wbc,
 		.encrypted = f2fs_encrypted_file(cc->inode),
@@ -785,9 +784,10 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	loff_t psize;
 	int i, err;
 
-	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
+	if (!f2fs_trylock_op(sbi))
+		return -EAGAIN;
 
-	f2fs_lock_op(sbi);
+	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
 
 	err = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
 	if (err)
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
