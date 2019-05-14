Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0F71C351
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 May 2019 08:36:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQR3R-0006lc-0u; Tue, 14 May 2019 06:36:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hQR3Q-0006lR-0a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 06:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OlTpojgb+74cQ2l3Wt5QyoIPGQcB3f9O/1lemu+Ob0A=; b=VEG122USNy5mS0Es8E84Z9kOK5
 +oY00hbAf64BM3SLg002mQsLR/5yTnS7hElvEcjUDtqGAyDUD67k+/bPtiML+jXcrHPcrYjw2row7
 56wDruKefdCWBGcDj8W6AQ5BUFe1cZQfpqZRUv0S/ezWusaLX3TmXhnuVkXDEYILPHv0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OlTpojgb+74cQ2l3Wt5QyoIPGQcB3f9O/1lemu+Ob0A=; b=I4fVVKvmszziRcBF6u365xdwGM
 qi7lEG6GscZgPRn0jtjdw/hPH+AWP24Yban8CyPG+T8P/ADZX3dpLzfvmflNy8r9k9os/IbX2qsIm
 nNpQGnq7ZwZoR93Np0CrPVFGcactSwEZ8sLtS+KBj0THBz1gTCAU3l2CE9oqUG5t1Qm0=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hQR3M-0034TW-El
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 06:36:47 +0000
Received: by mail-pf1-f196.google.com with SMTP id z26so8569943pfg.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 May 2019 23:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OlTpojgb+74cQ2l3Wt5QyoIPGQcB3f9O/1lemu+Ob0A=;
 b=FXMzYvjqFvN+VQvxirMQJJHDyIfyy5Rn5FG/rpXFtGN8i8os0uqoBQRQUcvkJyBxDI
 NafeEUlLTyUy1KucNO/6taVb02wp+87b9mrkI9H2u1NViyGzRigap/wv9jJwtOb1T3jG
 FWd+6oOEhLxWdgu2LhEVuf8pi4CQ5cYHwnZYiOqM6oxepQBpuskjlvskzfEoW99ELA64
 lCBc46fB9PVmyrEv3evIp1RxS1r/22ZvdNeRDCv6xCyL1E1lOnBBtH89iV0JIUUTsErT
 CfFDmzPgrHhG6lswXSFdu8nlm9SkWUrS22fkgyTet5Ti8VeL69VnYjFlFQVRvC1m5EPT
 4ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OlTpojgb+74cQ2l3Wt5QyoIPGQcB3f9O/1lemu+Ob0A=;
 b=Lez23mzQrC4Vf4vFXBv9K28pWF22KOTiwaB9066tvvp8JJwmg5lvEa7sqyC0/Wi3Rb
 QefgeJqjxZAmYJ4bv9C3fs8XXSkKZlb6niuQNXWvlQY9JjErP5oiKtS6MirxId6iu9rq
 0I//tck8WQE1dJ1xikTjnDNMHBMvW6i248y9nIEyL1v0T5RFKR3eVcNZ+TSy4iCln2ms
 KVSy9qHkLnHRbTslenYYl95NqcwnvZMd/XNlNIwgM4/DaBzXm308DbymsTPF8W62SWfb
 K621nCkI7PieN7a/hgjPwMhzVnDhutZdkeVxenwcs0IMbp/RkjSQBj12yGwZNR9G8ymu
 VM5Q==
X-Gm-Message-State: APjAAAXH7i3G0VhJeOw5S291r5phv13ZX5yR/VeCPlRMqt0G0bzt6QLX
 UXYzmDQU1NjGXJ8mJbJdUrl5FGTkxrVJtg==
X-Google-Smtp-Source: APXvYqz1xioaQveuW+yKQqGr1bkTCNNcnQsH17ButCI8p9IrTVyio1z9UjSl7OvCmVYAHh508Ms2NQ==
X-Received: by 2002:a63:7:: with SMTP id 7mr36823320pga.108.1557815798468;
 Mon, 13 May 2019 23:36:38 -0700 (PDT)
Received: from localhost.localdomain ([121.170.223.70])
 by smtp.gmail.com with ESMTPSA id 19sm19767285pfz.84.2019.05.13.23.36.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 23:36:38 -0700 (PDT)
From: Park Ju Hyung <qkrwngud825@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 14 May 2019 15:36:23 +0900
Message-Id: <20190514063623.57162-3-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190514063623.57162-1-qkrwngud825@gmail.com>
References: <20190514063623.57162-1-qkrwngud825@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 0.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hQR3M-0034TW-El
Subject: [f2fs-dev] [PATCH 3/3] f2fs: always assume that the device is idle
 under gc_urgent
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

This allows more aggressive discards and balancing job to be done
under gc_urgent.

Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
---
 fs/f2fs/f2fs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 533fafca68f4..14c95116cd3d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2192,6 +2192,9 @@ static inline struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi,
 
 static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
 {
+	if (sbi->gc_mode == GC_URGENT)
+		return true;
+
 	if (get_pages(sbi, F2FS_RD_DATA) || get_pages(sbi, F2FS_RD_NODE) ||
 		get_pages(sbi, F2FS_RD_META) || get_pages(sbi, F2FS_WB_DATA) ||
 		get_pages(sbi, F2FS_WB_CP_DATA) ||
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
