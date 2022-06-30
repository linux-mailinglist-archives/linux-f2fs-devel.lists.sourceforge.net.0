Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC55A561915
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Jun 2022 13:26:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o6sJy-0004CN-6D; Thu, 30 Jun 2022 11:26:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <duguoweisz@gmail.com>) id 1o6sJx-0004CE-Eb
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Jun 2022 11:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/QWnWQZOHsPg9TekwAFOUwpYu4RmqUhD1lw7F3VzOwI=; b=KRk0o5EBx1fwCWeBKx9fQkUUdj
 cZv9hBwq0GipnI6gc3Jm+RUHk97srfZ+tLPtxASp79JJ0bdu6VdIhTMvrZVCfyedYNjAQMyPGgPqp
 KN7/GoMoqAGQYvo1PbcSEZ9uFTpwUsjZ79ydtYSERrzZmAi1vIKW6I0++bXaPc5RTZaw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/QWnWQZOHsPg9TekwAFOUwpYu4RmqUhD1lw7F3VzOwI=; b=h
 jFmDer6sv56Dsc7sjlg7lQC4XW19hBFQ1id06QkmDbImdEMnkVDfR4y90bR2Q8h5utAYIn7U83u8l
 nj+pQFK3ZXmsjV0fmas8kP/nlMR6KpJJOyBiMcuogKUJE9xbst4tO0sXalhoGyFWRKxb/FQo7hui8
 XmDKFK/jMYmk1mEw=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o6sJt-0001Gs-1d
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Jun 2022 11:26:53 +0000
Received: by mail-pl1-f180.google.com with SMTP id k14so16777170plh.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Jun 2022 04:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/QWnWQZOHsPg9TekwAFOUwpYu4RmqUhD1lw7F3VzOwI=;
 b=D33t8BX/qMfkIJXaxFFUsnMMUHOyWDb1Y6hmRH9SZ+al09qzBn0tqtk9qp1hmuBYaj
 ICEWlm5DoP2uZjQG9wQqhLmzpkVD7yJsBRfP+vdreSS17o6DvfV1Nb38t22O50ybakBb
 QH4HUR6ZZ+Z7ObpQV8na4DjXBRkk3MklnY74HTo8hdvGIAHAb0l/pOm9qAAeOX/JwpTX
 GN2wERyMXNEtejs8iVZlF+vN/5IVOaTgNnsXaAyVb75uEUlFOPIPHyOuH+7ql2PXqZqn
 fOev2GIBFexbrdcFU0KVj0irqBvceMF6PnA5DfdAzJ+vX1jSN/ZymGqm1ARGl4vsDgwI
 /vWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/QWnWQZOHsPg9TekwAFOUwpYu4RmqUhD1lw7F3VzOwI=;
 b=mml88RzoFddlf4I9IHEdB7Nmt25n5vgN0q/LO5vQx2gMKk379FRzD4+5nxv27oVViB
 T4aiErMp3xZISXotLChqOFLOvd6SQPSEhy9bCyhBcBndWz/SedbS+XKf4M+AAZcCeiTN
 7g+EwE38P5ssKN32bCXHPzOYZeAuum0mUvRO9/ODU0xvKWgsYuksb/d+vgTu/zofcxNr
 oI4mnxfZLRcZdWB5VPoB5rvKo2oaZFrYuFFbNjxYVH6mEHEAAHiruZQO8+vIrPCpguEk
 IHKcOueIZwkseEYAMaLtlCnHEB0Imui8hllsZDxQ6jcV2ItS3eY/7iWmUvdFc5P/qbPR
 W2cA==
X-Gm-Message-State: AJIora9DNhLV/axdoWnL6ah87JnXjwddw4kcqf/zYNtQ/ugyGGIQoA57
 kzgYAwkQu+T4hvdT932ccvw=
X-Google-Smtp-Source: AGRyM1t1yuX1kimrdl1mLic0T2PGJbcd4R9nhPE94hxmhrwiFq1P3gwLkvbNvMTlcHZEwVQ7aygskA==
X-Received: by 2002:a17:90b:1e06:b0:1ec:b513:4523 with SMTP id
 pg6-20020a17090b1e0600b001ecb5134523mr11666097pjb.58.1656588403407; 
 Thu, 30 Jun 2022 04:26:43 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.232])
 by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b0016378bfeb90sm13247053plb.227.2022.06.30.04.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 04:26:42 -0700 (PDT)
From: Guowei Du <duguoweisz@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 30 Jun 2022 19:26:29 +0800
Message-Id: <20220630112629.6611-1-duguoweisz@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: duguowei Remove the local variable 'run_no',
 add comments
 for better reading. Signed-off-by: duguowei --- fs/f2fs/shrinker.c | 12
 ++++++------ 1 file changed, 6 insertions(+), 6 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.180 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [duguoweisz[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1o6sJt-0001Gs-1d
Subject: [f2fs-dev] [PATCH 7/7] f2fs: optimize shrink count
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
Cc: linux-kernel@vger.kernel.org, duguowei <duguowei@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: duguowei <duguowei@xiaomi.com>

Remove the local variable 'run_no', add comments for better
reading.

Signed-off-by: duguowei <duguowei@xiaomi.com>
---
 fs/f2fs/shrinker.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index dd3c3c7a90ec..7e439496dfca 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -76,18 +76,18 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
 	unsigned long nr = sc->nr_to_scan;
 	struct f2fs_sb_info *sbi;
 	struct list_head *p;
-	unsigned int run_no;
 	unsigned long freed = 0;
 
 	spin_lock(&f2fs_list_lock);
-	do {
-		run_no = ++shrinker_run_no;
-	} while (run_no == 0);
+	shrinker_run_no++;
+	/* if overflow, next loop needs to skip number 0 */
+	if (!shrinker_run_no)
+		shrinker_run_no = 1;
 	p = f2fs_list.next;
 	while (p != &f2fs_list) {
 		sbi = list_entry(p, struct f2fs_sb_info, s_list);
 
-		if (sbi->shrinker_run_no == run_no)
+		if (sbi->shrinker_run_no == shrinker_run_no)
 			break;
 
 		/* stop f2fs_put_super */
@@ -97,7 +97,7 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
 		}
 		spin_unlock(&f2fs_list_lock);
 
-		sbi->shrinker_run_no = run_no;
+		sbi->shrinker_run_no = shrinker_run_no;
 
 		/* shrink extent cache entries */
 		freed += f2fs_shrink_extent_tree(sbi, nr >> 1);
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
