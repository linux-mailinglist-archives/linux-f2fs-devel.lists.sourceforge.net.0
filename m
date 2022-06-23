Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C38D55866A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jun 2022 20:12:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o4RJk-0005XQ-FE; Thu, 23 Jun 2022 18:12:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1o4RJi-0005XK-To
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 18:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yrE/un2nukR43M0z8aCHfwAz4huCkQojpNGfqWE+zm8=; b=lgl8UzYMB5NCiVs5bMFs/QIOHz
 tDVrITFl51vZGsrLl0aavp8Bd05heYRTwhXeDK84Aj2ogtAc7rXEI2nYBq8R6MMh8XApv+016WdSj
 XfL0aIbtWz/u4F1HA+1HmF/p9KwpnOs3dB6/iKvlqnGyC7xbvkhZsn/33UqXMkXzu50E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yrE/un2nukR43M0z8aCHfwAz4huCkQojpNGfqWE+zm8=; b=ltyzIzA1kcNaBvxe6/czzQdoNC
 TK8/y/AzzBO+NZf+9SXMmFwDFL35poMUfvhbrxAQEjHi3ZUlSouIYQGrWwDGpQicCawxoovQWAtOh
 S+nuqCyvfnSPDPk9MmvE68ong/JZXbpvaQLFJkf2IWnax30BEM3YoSQPpCpyAJES27qo=;
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o4RJd-00BS89-Pb
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 18:12:34 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 x1-20020a17090abc8100b001ec7f8a51f5so3430882pjr.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jun 2022 11:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yrE/un2nukR43M0z8aCHfwAz4huCkQojpNGfqWE+zm8=;
 b=hC1/3Sup0VzxzVBTLgxFrdGD3dzAI2mtCgpRTZzYvWVqhrHDXNyirZSsScQ4mmYOUn
 7K/ubMoPOO/NIu8s/8n9vlaHqFOwh/P4u0pa9N5teYV6DGBjxcfFEFKyGuN8Gi291OLF
 ZdaIjzvQIatZg421dMjaB67c/jD8eRB9h0ZGtlRhothGY3Qg3+xUFmRoYC/vp0svzNQo
 XYvXn/WJ/kXhEXEK5lc4WSqwNKksZ475mmdYCuZkhTDAwfHslCjP4D7P0nXhZy1VE1Ew
 ly+Q9dSkDUbYQFZ+qV2ZSCeg7iNnkROq/N1p3hk2sakyRsCe9HjryVrQ1kKk/uuBpLH7
 onGg==
X-Gm-Message-State: AJIora/C/YHxq+sPdbzlW1HnT3iq2BBbn5dRDbzY7baJbN++uSNrAfbw
 Ltmi+AASPqQtXMBLqM3N/4E=
X-Google-Smtp-Source: AGRyM1tz3L5T8bH6V+l0/sDQQlPTVNjbJiC4FbeFbVtQzI7ja/3gKTr1HlCDpvJOQi7/3PZ1ryk6FQ==
X-Received: by 2002:a17:903:2345:b0:16a:28ac:1c1b with SMTP id
 c5-20020a170903234500b0016a28ac1c1bmr20571204plh.106.1656007944114; 
 Thu, 23 Jun 2022 11:12:24 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:70af:1dc5:d20:a563])
 by smtp.gmail.com with ESMTPSA id
 az8-20020a170902a58800b00163d76696e1sm104803plb.102.2022.06.23.11.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 11:12:23 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 23 Jun 2022 11:12:08 -0700
Message-Id: <20220623181208.3596448-6-bvanassche@acm.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220623181208.3596448-1-bvanassche@acm.org>
References: <20220623181208.3596448-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since the size of struct f2fs_summary_block equals
 F2FS_BLKSIZE, 
 use F2FS_BLKSIZE instead of PAGE_CACHE_SIZE as the size of struct
 f2fs_summary_block.
 Signed-off-by: Bart Van Assche <bvanassche@acm.org> --- fsck/mount.c | 8
 ++++---- 1 file changed, 4 insertions(+), 4 deletions(-) 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.53 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.53 listed in list.dnswl.org]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o4RJd-00BS89-Pb
Subject: [f2fs-dev] [PATCH v2 5/5] Use F2FS_BLKSIZE as the size of struct
 f2fs_summary_block
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since the size of struct f2fs_summary_block equals F2FS_BLKSIZE, use
F2FS_BLKSIZE instead of PAGE_CACHE_SIZE as the size of struct
f2fs_summary_block.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fsck/mount.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index cc871fea5d10..584e6d1370ae 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1854,7 +1854,7 @@ static void read_compacted_summaries(struct f2fs_sb_info *sbi)
 			curseg->sum_blk->entries[j] = *s;
 			offset += SUMMARY_SIZE;
 			if (offset + SUMMARY_SIZE <=
-					PAGE_CACHE_SIZE - SUM_FOOTER_SIZE)
+					F2FS_BLKSIZE - SUM_FOOTER_SIZE)
 				continue;
 			memset(kaddr, 0, F2FS_BLKSIZE);
 			ret = dev_read_block(kaddr, start++);
@@ -1914,7 +1914,7 @@ static void read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 			blk_addr = GET_SUM_BLKADDR(sbi, segno);
 	}
 
-	sum_blk = (struct f2fs_summary_block *)malloc(PAGE_SIZE);
+	sum_blk = malloc(sizeof(*sum_blk));
 	ASSERT(sum_blk);
 
 	ret = dev_read_block(sum_blk, blk_addr);
@@ -1924,7 +1924,7 @@ static void read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 		restore_node_summary(sbi, segno, sum_blk);
 
 	curseg = CURSEG_I(sbi, type);
-	memcpy(curseg->sum_blk, sum_blk, PAGE_CACHE_SIZE);
+	memcpy(curseg->sum_blk, sum_blk, sizeof(*sum_blk));
 	reset_curseg(sbi, type);
 	free(sum_blk);
 }
@@ -1990,7 +1990,7 @@ static int build_curseg(struct f2fs_sb_info *sbi)
 	SM_I(sbi)->curseg_array = array;
 
 	for (i = 0; i < NR_CURSEG_TYPE; i++) {
-		array[i].sum_blk = calloc(PAGE_CACHE_SIZE, 1);
+		array[i].sum_blk = calloc(sizeof(*(array[i].sum_blk)), 1);
 		if (!array[i].sum_blk) {
 			MSG(1, "\tError: Calloc failed for build_curseg!!\n");
 			goto seg_cleanup;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
