Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EB8232BED
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Jul 2020 08:29:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k124Z-0008Kq-DI; Thu, 30 Jul 2020 06:29:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1k124W-0008KM-7p
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Jul 2020 06:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CsOxKachicy3OmqrENOn8EV2vNFswMwHeC3pAl1Oi8c=; b=cXQP66sXeRF3BvF8vhoWoOjYm9
 jWcoagPzlg6lIQOfZS0GOUCtghAnECGPe+d6xZA2/Vnhq765KQTwXXWZHoWJn5gN/TzWsPbjQikBR
 5UaXWByeWJRS1XyPJyTBUgRAuKpUxBcFU6NmsO60rb7VNdE/1SWOIneGMG1is3kZ7bnY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CsOxKachicy3OmqrENOn8EV2vNFswMwHeC3pAl1Oi8c=; b=a
 JJ4Mkve9Zso3JUXxb6QhG1EMppeYX54li6A2sLL9dN/22w+FwI+QUwNWvktjoQdl04J90MH0lz6rj
 CkMQwzFgpsHS8CFg9F0GxVzGhXHOg12q8S/hRQN7MczLaDytyjVKzXlgJutnU9TaWkaiCtfQuIYo6
 ffPkOUG9bcVS/QOY=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k124S-00ENVj-CZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Jul 2020 06:29:44 +0000
Received: by mail-pj1-f66.google.com with SMTP id t15so3630060pjq.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Jul 2020 23:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CsOxKachicy3OmqrENOn8EV2vNFswMwHeC3pAl1Oi8c=;
 b=SO1HEC4OS2pjdG85QuBpcYgYY9Rmt947bqURN2sZ8TdX0NxycVkBJIVoPkzBZCGDdb
 gTlh0dVwDgkDPNKWrJQVRhVIc7Nq1C8qiVnhebmsyWbfv4d+1jaSMBkgiA6Da4U+fkrp
 CfCBmuhUVenrqRVlbsz2YkfUgLAbC83qlb4BD4XGhivdS3hKPa8fK5YenbqVjBkkWs6p
 XP/SdEvoWVHqbiUN93F1UhfdtdHXnnc/I1sAiHKBpMy/xA5MtNWjDMeA1Y/HoMSpdfTR
 RVuqyUeLHXjfHMr1M7KToScO303uNHyx3WXXVi9Lj/j/u5IyaCg4OSA/ho/lEyemYzfF
 poxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CsOxKachicy3OmqrENOn8EV2vNFswMwHeC3pAl1Oi8c=;
 b=OMd0jqC5dAG8pBWuWfU/MHJZRgTMF5OyaMITxXYFC5/9iXpicpVuCV+Nh7Q37xf45B
 mZVmouYuVL9o1buR+37dYsXdju73wH092U4u7xiMPTBLuSUAQ8lvFPxiQstWVYvTjrDE
 Wap/QsZc7s4Tjy01oyUrCRPcsgqjD8Pvb0uaOZXxvMaCc0sZHAgAqXw3BAiru8QNwice
 SJv2U6R9IoO+vhun/gjzVOV2+YRd+aeLZvrV0jVLpJUqju5k4/FY0OYJX+4wfqpflxEA
 H5Pu+Xved9bpzPCKc6dmC08OzhFPLTvkYqaF3YXhJ0ZCdT61qfq5lBmF4DS91gg5VEUN
 qn9Q==
X-Gm-Message-State: AOAM532JgcdzmAxQJXGGDd7x9GtgeFiZHK3s5yc+lVgvAiO8nC9qSptz
 ZVootj1owTfB/NRvO89uGqZWHfBzXNE=
X-Google-Smtp-Source: ABdhPJwGAcoN3+jW8C/P/pZG/O9t6IdQABLEN5B1zNM2OuRr5cC0McmydHORnhDfrQ2nHATkXI1q4w==
X-Received: by 2002:a17:90a:31ce:: with SMTP id
 j14mr1631801pjf.65.1596090574367; 
 Wed, 29 Jul 2020 23:29:34 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id a6sm4255443pje.8.2020.07.29.23.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 23:29:33 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 30 Jul 2020 15:29:27 +0900
Message-Id: <20200730062927.375325-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.66 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k124S-00ENVj-CZ
Subject: [f2fs-dev] [PATCH] f2fs_io: open file in read only mode for pinning
 file
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

To use "pinfile" command even with read only file, changed open
mode for it.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 tools/f2fs_io/f2fs_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 6266454..abb655a 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -349,7 +349,7 @@ static void do_pinfile(int argc, char **argv, const struct cmd_desc *cmd)
 		exit(1);
 	}
 
-	fd = xopen(argv[2], O_RDWR, 0);
+	fd = xopen(argv[2], O_RDONLY, 0);
 
 	ret = -1;
 	if (!strcmp(argv[1], "set")) {
-- 
2.28.0.rc0.142.g3c755180ce-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
