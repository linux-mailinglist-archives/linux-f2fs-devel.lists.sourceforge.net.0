Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9E1600BE8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 12:05:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okMzR-0002zU-FY;
	Mon, 17 Oct 2022 10:04:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wuhoipok@gmail.com>) id 1okMzP-0002zM-Ne
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 10:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RuPi2kJWnTKaT4aVfokzpN9MYv+IdW9MQr50PHecKpc=; b=RAZ6CiLVkktpmB/LyidYsqFpp0
 XtjE0FL94rEbMhVWmg02RPHlrOtNvILzttN6WtrUY052mwmhGnvTyDpoW3UC76uUqFMtBo9+PI5Em
 QNdzbSFvwru72btfuXmSC+nPZ8o7/6mtXfxCkxq8Ev4lc7GqcviREgvVym8dJqfHo98o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RuPi2kJWnTKaT4aVfokzpN9MYv+IdW9MQr50PHecKpc=; b=N
 isBazJWqBi2m5BThpW64M5ssnirOq6/bSKCUDRudlvKYEWwLGO2TwR+MogZJERp2KML7u9aDQRsDm
 3A7Zv7gkZrJyootHGU6CdMmsyj1Vnbobxrcyf7f7soGnIzeqdpqGclNrU00Bw0WR64rIEVU9x6cHx
 RzzyQMUoKm+/wWkY=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okMzP-006qiI-4z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 10:04:55 +0000
Received: by mail-pf1-f170.google.com with SMTP id i3so10607148pfk.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Oct 2022 03:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RuPi2kJWnTKaT4aVfokzpN9MYv+IdW9MQr50PHecKpc=;
 b=YqrS+attN7r6MY97eZcauP2HvFXu4WYJG9YWeF68qJKfCeX4QvaDqnSIf7HRVaCGBu
 dyfX63Th9wv9ekjiN4sNRwIFAJOIH8V4CW4DoGjI3E7NrGgyqpxqX+Gb5LVgxMrT5iph
 kp6diM4a3u4zvnIh9+qT9M+bISfNBPi8ilhCdN3gfZRoX92oalbeY8NOo61j4icEA/LU
 TUl+caQH8o+IfOQx/Gr6iJFRzWFJPl+UVKH7dEsC69z1Fe5CI6CfnwEUnXtLFS62gjmj
 I6WvoOaJkOq2dj2Tj2qjCVWcvVNYoBZLQd7VkGTI0YotieAGsHB8qRroUGsYyI6JNS3Q
 9Lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RuPi2kJWnTKaT4aVfokzpN9MYv+IdW9MQr50PHecKpc=;
 b=6KXHZsYrMYiMiv3wRDTnhxGoiNvjOTIHlwqW1oMw9GhYLyKZOWPvtvKrHQJf1ENX25
 w7NsNJyb10xPDM1WGwSQBSdr1NBZeZQArX+QTF9YcftSNHeDcFqVn5SACCPyjF/2lebw
 6iSRxq1xFczJM4u4d1YgYvoZmxwBzTDBi9R6yeVLl4g3TK+YiTopJugZ/6JDJGDyEyXU
 LsZafTPiN/WQlCAJvN0feULZM2MKhVUt6v200UesTwXB8dInXW4TR52aKRsNZuV/+p3R
 J+sUMsBeXsmE8pLXUlxPHug1A8obQ2dzQAe8DaAJyWKKi3nKLvbN8dwmXY+LJpCXHcPN
 3JIg==
X-Gm-Message-State: ACrzQf0XOe0yxRkyqxhn8gHsxb04SGue/jbhrV4k5tGQB2wFowYpEuG4
 +YBkMM4pmopK8DxzDwI8mLU=
X-Google-Smtp-Source: AMsMyM7eZofAjeHWzJ94vO88RDrBbxJwmqGvA2+l5nKX+AFUaM4MF83Mofo0oOBLql0h1YnbJ4S/fg==
X-Received: by 2002:a63:5658:0:b0:43c:dac:9e24 with SMTP id
 g24-20020a635658000000b0043c0dac9e24mr9915160pgm.562.1666001089618; 
 Mon, 17 Oct 2022 03:04:49 -0700 (PDT)
Received: from localhost.localdomain (124244014158.ctinets.com.
 [124.244.14.158]) by smtp.gmail.com with ESMTPSA id
 d8-20020a170902cec800b0017f7b6e970esm6248454plg.146.2022.10.17.03.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 03:04:49 -0700 (PDT)
From: Hoi Pok Wu <wuhoipok@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 17 Oct 2022 18:04:37 +0800
Message-Id: <20221017100437.618363-1-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Pointer discard_thread is pointing to nowhere, using IS_ERR
 prevents the situation. IS_ERR also seen being used throughout the file.
 Link:
 https://syzkaller.appspot.com/bug?id=9499bc6574cea5940e48199c2fd0732d9b11e5e1
 Reported-by: syzbot+035a381ea1afb63f098d@syzkaller.appspotmail.com
 Signed-off-by: Hoi Pok Wu --- fs/f2fs/segment.c [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [wuhoipok[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1okMzP-006qiI-4z
Subject: [f2fs-dev] [PATCH] fs: f2fs: fix kernel discard_thread NULL
 dereference
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
Cc: Hoi Pok Wu <wuhoipok@gmail.com>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org,
 syzbot+035a381ea1afb63f098d@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Pointer discard_thread is pointing to nowhere, using IS_ERR prevents the
situation. IS_ERR also seen being used throughout the file.

Link: https://syzkaller.appspot.com/bug?id=9499bc6574cea5940e48199c2fd0732d9b11e5e1
Reported-by: syzbot+035a381ea1afb63f098d@syzkaller.appspotmail.com
Signed-off-by: Hoi Pok Wu <wuhoipok@gmail.com>
---
 fs/f2fs/segment.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index acf3d3fa4363..79978b7206b5 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1634,7 +1634,8 @@ void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi)
 		struct task_struct *discard_thread = dcc->f2fs_issue_discard;
 
 		dcc->f2fs_issue_discard = NULL;
-		kthread_stop(discard_thread);
+		if (!IS_ERR(discard_thread))
+			kthread_stop(discard_thread);
 	}
 }
 
-- 
2.38.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
