Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7992EA457
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 05:17:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwdmA-0007JL-ID; Tue, 05 Jan 2021 04:16:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kwdm8-0007J5-N0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 04:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KKJkbK/0qA+AFIpsLjEXS6BAkzyO10SmGNn3wBUtxds=; b=hJd0Q6GhMxl7PjVYo3G+NLGghK
 yHG7q+/THAKUzwc89XIyYNbAyCJ0Rfm/kCt70ODggklgVuKOXKO+EyF8dKYDAJZidw/RDqreXReGb
 uIqsTdwDcsf4Dgfhkzds680+DudVp5et6/Pz4mz3gN9F6/vQdVoyV8svHVKmPYhhBwUY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KKJkbK/0qA+AFIpsLjEXS6BAkzyO10SmGNn3wBUtxds=; b=A
 QthESL1aBp2pd2yCd+8isHMzSOigWBJfYM/o4HsQd953FVLa6uyPmDB6o9EQdck1rXFubfTvPeQFm
 9TzWNtYN0vu+GpDeTr1CI1qeq3BbMgUFn6HifH6QkSsTiBt+gnUbgWT8je5EevBOIotziCPurjEzT
 f+3Hoc0gcwkxAdu8=;
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kwdm3-00EMxl-8d
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 04:16:52 +0000
Received: by mail-pg1-f170.google.com with SMTP id c132so9140225pga.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Jan 2021 20:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KKJkbK/0qA+AFIpsLjEXS6BAkzyO10SmGNn3wBUtxds=;
 b=vZHsRpHgkgF0zLNjP+xBufgtv7dHa1rQX/fu7pMroYBepvJoKeH0EEfEL7Kk92+qSb
 sSC7BPhPTxc8qh1+Mn5WGivBgcFgLBVFqZAhLsGVHMbmdQmCFExWsgwgesT6JxjUJHhN
 lM85YM6CAC9z3LXeZ28sfxWamikxJUHCEpoxEPiMyhj3H5XextGe1GlbOqGnbtmwGPdq
 +Yo2jpf1aCReEdc7eFgBkXVg/Qu9HNsQEjRzg6K8g4SpdEcGdCBudOZu2keZNJnssLeC
 7u1xTxxl1DlJveLHtiZubKGw94x/jA0EWks1tM0w4qasSKXokW9KMEv2Lqx14nH4bewU
 ENXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KKJkbK/0qA+AFIpsLjEXS6BAkzyO10SmGNn3wBUtxds=;
 b=VaYTNj+EQS3pz1SP38et35N8H1ot57i1XQaqHb1NAxo2BPAETJApNul13InhE3XDNg
 3K+03YTp1Mp+oqOmlhS0IFjnoxhJwvkkngVws9ollaz2dxx+iYIc6bPgPTkU7AyqbjJ3
 KtAAIIjlc/HWmLKN+mZhsjZLjXQ8zfZB1klAc1BEgryoqELD/UGHNWRr+svE6pbpmcNR
 7xrCHjXbb2BUvGXmjigleVLiq3WOqBx1IIoZ62bWEXmlz+LhpBSYFy/HPXLrOn7FMCYG
 XNCWssuvzyXTwO1hUpSVLexkcObJ9licL4sTj3iEECfrFWxUc/C62sytMkxXytqAS7e3
 Q48Q==
X-Gm-Message-State: AOAM532OHBtZ86gMNohxUL49qDjk2rQOGvpl1CjdIIdi+T9TO/BQ1NLW
 5la+NGnQccExgWXL4Anl2EI=
X-Google-Smtp-Source: ABdhPJyuZyKbboWOveGvhjaA3osqPGnttsU+9vHA46r2c5H3DyYcaw0SWeZFljRHgwO3gYp+wF5rrw==
X-Received: by 2002:a62:e212:0:b029:19d:8cff:f179 with SMTP id
 a18-20020a62e2120000b029019d8cfff179mr68030607pfi.44.1609820201665; 
 Mon, 04 Jan 2021 20:16:41 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id z23sm48634077pfj.143.2021.01.04.20.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 20:16:40 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  5 Jan 2021 13:16:30 +0900
Message-Id: <20210105041630.1393157-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.170 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kwdm3-00EMxl-8d
Subject: [f2fs-dev] [PATCH v2] f2fs: fix null page reference in
 redirty_blocks
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
Cc: Colin Ian King <colin.king@canonical.com>,
 Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Fixed null page reference when find_lock_page() fails in
redirty_blocks().

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reported-by: Colin Ian King <colin.king@canonical.com>
Fixes: 5fdb322ff2c2 ("f2fs: add F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE")
---
v2: changed error value and break the loop when error occurs
---
 fs/f2fs/file.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9e5275716be8..d27173c24391 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4060,8 +4060,10 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
 
 	for (i = 0; i < page_len; i++, redirty_idx++) {
 		page = find_lock_page(mapping, redirty_idx);
-		if (!page)
-			ret = -ENOENT;
+		if (!page) {
+			ret = -ENOMEM;
+			break;
+		}
 		set_page_dirty(page);
 		f2fs_put_page(page, 1);
 		f2fs_put_page(page, 0);
-- 
2.29.2.729.g45daf8777d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
