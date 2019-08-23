Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 877A39B896
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 24 Aug 2019 00:41:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i1IEr-0003y0-Ft; Fri, 23 Aug 2019 22:40:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <f2fsnewbie@gmail.com>) id 1i1IEq-0003xo-Kz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 22:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CvrATbvJZ5YXZnU+IwQ0yrOpoNEooZFLKR0d2HZ8QWs=; b=au0ekMxHW/qpkq17A5GYLcbVjY
 KzyXVxldR6lTT1RSbGMFxX195n3WeKxwgHppfhapTQUJhe2FJQwwy88WFz0EWmLKrrt2EY5puhoFx
 psPKY9CKbd//PpRPuFhSuRoftobEQWIhUt0OIiL4f4h0oYWNX7w0vfEI8aAYDXjs1jOA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CvrATbvJZ5YXZnU+IwQ0yrOpoNEooZFLKR0d2HZ8QWs=; b=f
 1tWM66aiqPUI/pFH6go4KZsY6qSNPSgD6UZXya9U0UdrdNszgWaU2fbWPVN0zY0oNo6Qg/AhS11E2
 yI+aDViThoMGsMhmRnkW32aVWmZfRVwZZFwHxSpxMUGJzenVDJ2LTJ6FpoLvJJkNNgd4eugSrcca4
 TbkssNeU6I/3K/b8=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i1IEo-00Dw9d-25
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 22:40:56 +0000
Received: by mail-pg1-f193.google.com with SMTP id l21so6536962pgm.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Aug 2019 15:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CvrATbvJZ5YXZnU+IwQ0yrOpoNEooZFLKR0d2HZ8QWs=;
 b=fPbXivgPdGtIovycNkVCxHbrZ7NUSTQsLAuVEFrc0XBJP2xit8IhpYFnbUAfR4zJe3
 Qsf85y2NVLPMW/YNoktKFjwIWzq5Pc0ltcJYp5+wT27HdI2zCoQX4yM7xSWI3xMwY/QV
 LMwSBOIW0ozHljET7S2bsB2P+ihZjZyMayGF5D7GWzQY5o1Rb8o7ttaU040nKiS0V4s6
 zNzRQ+IXzikxGDIXOA7xY5PMyUNfzhtc1YI2Rtt4e2xdi0Y11kGwTzSyDdn1rZyyLlZ3
 sb0qxH4DjvimzrG87GOx+oXre+TMayQbufpj4fkQmgwSrUFTjsiHzyQzZSKIHAruTi1b
 bLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CvrATbvJZ5YXZnU+IwQ0yrOpoNEooZFLKR0d2HZ8QWs=;
 b=BK/ScjALVSHxJBT9P6ubZ1UNadUUInSax2q+VNHwMDi+OHa/8isT5+KC04q/qe7kIS
 715D4fB8rR/zSXh5V2CLSq7pd6PZpCWH0BAAcPQnLODUMxnZdHwZpqliIk7m66fKk2hl
 JmHg4nm5KUZVm+e3U8sWIU4R1td+zXoR6wg+5DPWLO36XWgYFomck4WqGcExsivkwifr
 CBbjQ2WrS0Rzmi1oAOITUI10g5nlu4TBZrsE2IojO9AWyTuxzC+P5k/ku+U/sFtoME4J
 6TYSsv952yAOVVFQZJhVjbETPa9qoFyfwjqq+QDn1CD5xRroxWIzAWsB4HbPs9pVf8S9
 /esg==
X-Gm-Message-State: APjAAAUceTS2k40shqL0lSq0yej/Mm+vlOpF8D4CIzZW0UnWx/RJ5cZd
 1QJC73BOeMLt4AjX+5YH8y0KK6kd
X-Google-Smtp-Source: APXvYqw2IV3GP+YQhrTZ49RDgXMsZqnxH4Ibmpk3flcmDtglDZbyOVbJXbHpsNRU0h5zxqsP6FnlCQ==
X-Received: by 2002:a17:90a:1d0:: with SMTP id 16mr7425139pjd.98.1566600048045; 
 Fri, 23 Aug 2019 15:40:48 -0700 (PDT)
Received: from curare.nss.cs.ubc.ca (coconut.cs.ubc.ca. [198.162.52.139])
 by smtp.gmail.com with ESMTPSA id a18sm2699070pgl.44.2019.08.23.15.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 15:40:47 -0700 (PDT)
From: Surbhi Palande <f2fsnewbie@gmail.com>
X-Google-Original-From: Surbhi Palande <csurbhi@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 23 Aug 2019 15:40:45 -0700
Message-Id: <20190823224045.26377-1-csurbhi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (f2fsnewbie[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1i1IEo-00Dw9d-25
Subject: [f2fs-dev] [PATCH] Check all the data segments against all node
 ones.
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
Cc: Surbhi Palande <csurbhi@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As a part of the sanity checking while mounting, distinct segment number
assignment to data and node segments is verified. Fixing a small bug in
this verification between node and data segments. We need to check all
the data segments with all the node segments.

Signed-off-by: Surbhi Palande <csurbhi@gmail.com>
---
 fs/f2fs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6b959bb..1ec4d95 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2684,11 +2684,11 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 		}
 	}
 	for (i = 0; i < NR_CURSEG_NODE_TYPE; i++) {
-		for (j = i; j < NR_CURSEG_DATA_TYPE; j++) {
+		for (j = 0; j < NR_CURSEG_DATA_TYPE; j++) {
 			if (le32_to_cpu(ckpt->cur_node_segno[i]) ==
 				le32_to_cpu(ckpt->cur_data_segno[j])) {
 				f2fs_msg(sbi->sb, KERN_ERR,
-					"Data segment (%u) and Data segment (%u)"
+					"Node segment (%u) and Data segment (%u)"
 					" has the same segno: %u", i, j,
 					le32_to_cpu(ckpt->cur_node_segno[i]));
 				return 1;
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
