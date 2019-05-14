Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2B01C350
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 May 2019 08:36:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQR3O-0001TT-QN; Tue, 14 May 2019 06:36:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hQR3O-0001TN-Eg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 06:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dKkmE3MFnfU91x9QroYNdVh2bSS2n0/h/+J7JkGL8dw=; b=EqKMCoMZ6lpjt+eIVK+HFvRNHn
 zVh+FBJ8qlHiAvarBlBxfNAyk/vgIIFDgi3sqUONEBJtHAuOIN8lHu2zL5kH37eNrMLe7Qu3hhy5b
 YNfZVUghJyzzMPSxLnw3EILGzSWHWNlEdH5aIn2n7DCLV4k99Y/fKBrgnQullOBH4ej0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dKkmE3MFnfU91x9QroYNdVh2bSS2n0/h/+J7JkGL8dw=; b=l06nGT65YZNs6ArW0VNFqCf+oW
 +JJux4D/49lONG0RQsUJ7UXxdIVrReci59JFZj21tmUheeAOon98Ht+mYuala3UDjgxAIPDXOxWlv
 zYLLOdvbttSyzWQzr8EPEMEMtBQAqXVcBotZnMcK2i2/bxw+mbyWzfoe8ZQ0XP6oY6jU=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hQR3K-00GFFF-Tx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 06:36:46 +0000
Received: by mail-pf1-f194.google.com with SMTP id g3so8568826pfi.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 May 2019 23:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dKkmE3MFnfU91x9QroYNdVh2bSS2n0/h/+J7JkGL8dw=;
 b=FPkod9CMfiWvxuCHx8JUkxLcGMIfJONckHkWwG2myD6qGVz0btWsqGLLIaJxcRgA48
 fplgzEHxt3SSlVKpzoqcBfS5vl5J69/ypbDIACF1o9QIy6b8MbBKNZJipBmx9G13viyv
 5eKTLzU8sTDqfgsEelzy/ZgNPNGUyok/Inrg8FRHmFqbJopx2PQ8slP82j52UMeCw1d3
 j5xrXtTWdwci1i15ZBegk0GBe51R/FM4GL/TLU344eofc3VijGRcddo0Efdv5Lb3Dkbo
 cXfK/G2ec9GD53GzMKMJIkCdFRo4vVYOCHw/UPLcKIEIB2tskZrG8PiDeF6z0aszyt7a
 JGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dKkmE3MFnfU91x9QroYNdVh2bSS2n0/h/+J7JkGL8dw=;
 b=t3jY3rb49ZGmuqOnXeI6oErxLBqaSh5tnbvfX5C9zDObTIx2PhzBieu93SQBtX6cT2
 nArwz/9SakpN9/QNhAGKktHI0qX+qrIrkZmeKrftJ1o7qqfwwdZ6e/tZePazUpcqf4ZN
 jSyz7kRCt3v9//3W0YRQ9bROd9kLDZMD9L8Q32/5TO/ccpyP4yvW5FlUhDGFRWhMFuNA
 pP+FeOvm8BalOJDscY27q5x4w3i+AilKzDubvh4wd6pl8WJ/swMOkZUAVgc6UNcokf6A
 BbmtRfLkrWECvrjOOOhvBa2s4c8rhTcqNlLeOc5jNcEMGkSaO7VZPyjJfhr8vsNDPC6p
 m0bw==
X-Gm-Message-State: APjAAAVXT2iifItPK3EGli9K6YdgXNNGvj7AKDpE6WBPnhHf0+blYdPP
 FCmlL0pssnKbntXwqLHh1dVmHQkJNBiK1g==
X-Google-Smtp-Source: APXvYqyygGWn9TWF+fp+HZat8zfxDvkOWfcX7ajmozWQAKq+8ezWRbUNrz9tsV0mNGLZ5T74lihrcQ==
X-Received: by 2002:a63:930d:: with SMTP id b13mr25002360pge.18.1557815796924; 
 Mon, 13 May 2019 23:36:36 -0700 (PDT)
Received: from localhost.localdomain ([121.170.223.70])
 by smtp.gmail.com with ESMTPSA id 19sm19767285pfz.84.2019.05.13.23.36.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 23:36:36 -0700 (PDT)
From: Park Ju Hyung <qkrwngud825@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 14 May 2019 15:36:22 +0900
Message-Id: <20190514063623.57162-2-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190514063623.57162-1-qkrwngud825@gmail.com>
References: <20190514063623.57162-1-qkrwngud825@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1hQR3K-00GFFF-Tx
Subject: [f2fs-dev] [PATCH 2/3] f2fs: don't wait with each discards under
 gc_urgent
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

f2fs already addresses gc_urgent under discard, but still uses the
default wait_ms.

To gain as many free segments as fast as possible,
use 1 for wait_ms under gc_urgent for discards.

Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
---
 fs/f2fs/segment.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8dee063c833f..dece5ebfb8f0 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1685,7 +1685,8 @@ static int issue_discard_thread(void *data)
 		wait_event_interruptible_timeout(*q,
 				kthread_should_stop() || freezing(current) ||
 				dcc->discard_wake,
-				msecs_to_jiffies(wait_ms));
+				msecs_to_jiffies((sbi->gc_mode == GC_URGENT) ?
+						 1 : wait_ms));
 
 		if (dcc->discard_wake)
 			dcc->discard_wake = 0;
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
