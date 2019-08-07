Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B54854CA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Aug 2019 22:54:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hvSxE-00063E-9p; Wed, 07 Aug 2019 20:54:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <f2fsnewbie@gmail.com>) id 1hvSxC-000637-Nj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 20:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o4bI9U8M+wVCa1bS44y2Oy8P1YfvfyEAqGDwG4xp/CU=; b=OocDui+EmUW2IZmyn/ll+EO4gD
 Lpaeeb+ILSdfmgh83o4Yd6tMx8QIYxb/BN4jh0wxT4NajFL36M95vhuqyPq80skcU/ieGaLzu9+P0
 Dl2vOiKuO/rGSOeqmmzbl6n6XbNBHT6PkxnZP7TrURd7ELKqwusvMf3AMmz9gJWh3r9Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=o4bI9U8M+wVCa1bS44y2Oy8P1YfvfyEAqGDwG4xp/CU=; b=W
 brVMLP/rbpFHRxtOpmBRDr2LOOjRET3bq9IgLikkVLsXKgoaAVhG/ahQ+5KCH9ZHkjQKIJe2OxzOC
 LPcKcnYPE0WhqumN+npZnKkmDalD6r826GxHEAATlyzc2xXsIqzX8FdScPXRr3gbJMLoHPPgM2W5q
 UgISwqcSeTZlACfM=;
Received: from mail-pl1-f195.google.com ([209.85.214.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hvSxB-00ENnK-Fa
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 20:54:38 +0000
Received: by mail-pl1-f195.google.com with SMTP id m12so3939084plt.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Aug 2019 13:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o4bI9U8M+wVCa1bS44y2Oy8P1YfvfyEAqGDwG4xp/CU=;
 b=tcGoOViW31SW2jz9PG5voE/GcOSc5g7B708vfKeWhl99GYdO5cDrSVUnQYCXrzcfqt
 uPsC3Sqqkt4a7I7Envl5+XigsHrbuESXV4kYQJaFlvYBUE/D896Oc985He/j4rnZrn16
 ToTfvjKfzt1wwEKxLxhJoA9rtn/j7LbUlNhAj8UbGZThqVN7g/yPEWDesicW38usGedA
 rT6yNhhC3fGYcd4eojYXhqNYnG33zgLIocHxZrQKs1vLoVEA+DccLpaKJCDmSaNUvrmT
 htwELS2kCQWGul42OoPpB+rBK1vZiGl8ZhskKSCR9TaZczlXDLhJQ0wOjt+9YjLMl2GJ
 2RKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o4bI9U8M+wVCa1bS44y2Oy8P1YfvfyEAqGDwG4xp/CU=;
 b=KRlow4IdycRxZ8BQXdcWCR9/067ATlj4fKUlSwQKPtvSTu4fRIr5GWChhKoXCoHdpD
 b+mNQJvxaqxCbpz02WyS3vFYAfKu1UE8WwqoHaztIQkq+M/0dY/dVWDqqqgQXeDWGH+U
 Uy3ILdZaFsNthYs2sIDydTop0sYIUhwNG3zm9nYaHDH7pxVkC9gT7SpJCotam/91g+Rp
 IJpVX5PR9rsgl6nt4qacRgNq5zk738q8ey1N3+aVeGzGICt+bKDd9wG3XShhdDlDWI4N
 WLiAPD+q3JEBpZonuXT0uwvklt9KEJuVnBBq4D8ov/4Jr+1+BcxfWym88BuLp2mnjGUD
 fL5A==
X-Gm-Message-State: APjAAAVrR/HXUjjX+CBbmnuzADYOdvPRzowIt6Bkd+jVTZvWWYnAp2BK
 2fWMmlKA4OWUR/Off6F1X14aax+J
X-Google-Smtp-Source: APXvYqwiO8OcZsf5SEKLYX9TFW4vi7BzvVoGFjBhHuLhmAZKxGm+dFNfRlm625vma0Scb5ul8PcEeA==
X-Received: by 2002:a17:90a:d151:: with SMTP id
 t17mr350726pjw.60.1565211271534; 
 Wed, 07 Aug 2019 13:54:31 -0700 (PDT)
Received: from curare.nss.cs.ubc.ca (coconut.cs.ubc.ca. [198.162.52.139])
 by smtp.gmail.com with ESMTPSA id f6sm94199850pga.50.2019.08.07.13.54.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 13:54:30 -0700 (PDT)
From: Surbhi Palande <f2fsnewbie@gmail.com>
X-Google-Original-From: Surbhi Palande <csurbhi@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  7 Aug 2019 13:54:28 -0700
Message-Id: <20190807205428.3454-1-csurbhi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.195 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (f2fsnewbie[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1hvSxB-00ENnK-Fa
Subject: [f2fs-dev]  [PATCH] Return valid segment type in 4 head logging
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

The valid type of current segments in a 4 head logging scheme are:

CURSEG_HOT_DATA, CURSEG_COLD_DATA
CURSEG_HOT_NODE, CURSEG_HOT_NODE.

When a direct node page is not explicitly marked cold,
return CURSEG_HOT_NODE as it's segment type. 
CURSEG_WARM_NODE is not a valid segment type in a
4 head logging scheme.

Signed-off-by: Surbhi Palande <csurbhi@gmail.com>
---
 fs/f2fs/segment.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a661ac32e829..b904b5d7b4df 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3006,8 +3006,8 @@ static int __get_segment_type_4(struct f2fs_io_info *fio)
 		else
 			return CURSEG_COLD_DATA;
 	} else {
-		if (IS_DNODE(fio->page) && is_cold_node(fio->page))
-			return CURSEG_WARM_NODE;
+		if (IS_DNODE(fio->page) && !is_cold_node(fio->page))
+			return CURSEG_HOT_NODE;
 		else
 			return CURSEG_COLD_NODE;
 	}
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
