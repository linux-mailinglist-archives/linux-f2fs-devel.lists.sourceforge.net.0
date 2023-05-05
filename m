Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA5E6F8A47
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 May 2023 22:40:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pv2Ds-0005Xy-G8;
	Fri, 05 May 2023 20:40:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1pv2Dr-0005Xs-1g
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 20:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OGFXeU2dXaRo8clMCkR8c/hfrCLvrLrfrAcbGat2bS8=; b=kAn3+1RE1vcN/LB2aydrMcqqhm
 7p+vgqx+ccCR14xF2BW23tGw1jbB8dIeVJObI4hjFn2OSKSVctlTXjAs5ykoMRB7WWgp3TGh71iue
 RY/fc81C9Ln8QGS7cTPiRpsvkKFAz0smYTH0bluVMBFHXbhwGgivSUI64p3KUZYy+XxU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OGFXeU2dXaRo8clMCkR8c/hfrCLvrLrfrAcbGat2bS8=; b=f
 GiAFwekfIJgBXhEJBwjf+vKq5/zkAWQW0F4Zvy24/QstAM2MX/L8JHsflw864m3WWiTqUr5ToXIVr
 5+GfbYSL0ItEykOTCER3qo25x3TthCFFSIsWswyjclSdnxsWtfq6txlbXdByoVikpcFU4rtkcq3uP
 ZbY9q2yiMQL2jKe4=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pv2Dq-0003PL-Eu for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 20:40:10 +0000
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-24df4ef05d4so2038835a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 05 May 2023 13:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683319205; x=1685911205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OGFXeU2dXaRo8clMCkR8c/hfrCLvrLrfrAcbGat2bS8=;
 b=gM0mLhZPPogTqDhH2p1bvP3RMMjdphDn/Ubq+8G64h4i2qq7VyxacwfPbtU+trWfKU
 U7gTntgoYJnK0Th0YsMLnQFnRLwRle6BHJYf9oxow1BmL14BDo+u9P0ZiNigKd3cRj/P
 uJpIpOx5Mv2xA32aqLN6X8fjC+LabvrS4mt2mpMYMeEnhZaPHdphaz4LbzSEXIiMoOG0
 GHMZ9uKkL+h0BauzZ0vBeJF/R79NsUchwPmDsX/fSIu+hWBN/68zg5TKJmn5j/hlUJUR
 9qEi/QfcJy0yyve6CDIg7gFaZvjW+DmLiuytY1TkGxjQgf8tH1W5aUYRtnPca2XVR0xs
 9U1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683319205; x=1685911205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OGFXeU2dXaRo8clMCkR8c/hfrCLvrLrfrAcbGat2bS8=;
 b=Bq8eAMHwDIJaN/FRyyXd+CC4fx35JcSH6jnQoD7EXcvqnSMvPDv/FCOI/sEQuzdHsN
 7gDUmDi1IyQsSMID6f+Ch21IBq9a0OHkBNY2Fhe3KVs22LRUIiQ5mYi2SphIDARxL9zx
 no/T5bdPlgMys46ZPwJQWlpBlbDgEQTVI2BGnClswdf2Z4zwBU39sNLpW6Dsiawpzc0W
 kvONcOIwfYM8KZtZKZFOBIKgQaghkyzKwUTnRE5Gl1enuNxk4H9I0s8RPTc6uLlsfdDn
 dJghI6PRbg9nvQru/k5ualoEjUZfK1iF4fYOgZCLR1iU2QzcbhDXKz4ahNWxK+je7eER
 7SLA==
X-Gm-Message-State: AC+VfDy2m2FkWWqdBA534uBI0Wq/H0RygZgSVgy+w9RM0dFbNQxpkrnS
 SdPMCvvf8a9y4hgVqI24uOvLP3Ibt94=
X-Google-Smtp-Source: ACHHUZ6dB/vPtTYWg7uhHznNlXJ0K2YkXLUMaIa/tmbVDicNbO1mh6N+YwG2esq5hI9+qVRtISfWng==
X-Received: by 2002:a17:90a:b281:b0:24e:1dcd:4e73 with SMTP id
 c1-20020a17090ab28100b0024e1dcd4e73mr3000560pjr.0.1683319204509; 
 Fri, 05 May 2023 13:40:04 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:4c39:b490:cecf:cb9c])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a17090ad34e00b0024e3d26f644sm6057166pjx.3.2023.05.05.13.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 13:40:04 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  5 May 2023 13:40:00 -0700
Message-ID: <20230505204000.3604748-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Zoned UFS allows only 6 open zones at the
 same time, so we need to take care of the count of open zones while mounting.
 Signed-off-by: Daeho Jeong --- fs/f2fs/segment.c | 53
 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+), 22 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.50 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pv2Dq-0003PL-Eu
Subject: [f2fs-dev] [PATCH] f2fs: close unused open zones while mounting
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

Zoned UFS allows only 6 open zones at the same time, so we need to take
care of the count of open zones while mounting.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/segment.c | 53 +++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6db410f1bb8c..43d537d29b52 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4810,40 +4810,49 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 			break;
 	}
 
-	/*
-	 * If last valid block is beyond the write pointer, report the
-	 * inconsistency. This inconsistency does not cause write error
-	 * because the zone will not be selected for write operation until
-	 * it get discarded. Just report it.
-	 */
-	if (last_valid_block >= wp_block) {
-		f2fs_notice(sbi, "Valid block beyond write pointer: "
-			    "valid block[0x%x,0x%x] wp[0x%x,0x%x]",
-			    GET_SEGNO(sbi, last_valid_block),
-			    GET_BLKOFF_FROM_SEG0(sbi, last_valid_block),
-			    wp_segno, wp_blkoff);
+	// The write pointer matches with the valid blocks
+	if (last_valid_block + 1 == wp_block)
 		return 0;
-	}
 
-	/*
-	 * If there is no valid block in the zone and if write pointer is
-	 * not at zone start, reset the write pointer.
-	 */
-	if (last_valid_block + 1 == zone_block && zone->wp != zone->start) {
+	if (last_valid_block + 1 == zone_block) {
+		/*
+		 * If there is no valid block in the zone and if write pointer
+		 * is not at zone start, reset the write pointer.
+		 */
 		f2fs_notice(sbi,
 			    "Zone without valid block has non-zero write "
 			    "pointer. Reset the write pointer: wp[0x%x,0x%x]",
 			    wp_segno, wp_blkoff);
 		ret = __f2fs_issue_discard_zone(sbi, fdev->bdev, zone_block,
 					zone->len >> log_sectors_per_block);
-		if (ret) {
+		if (ret)
 			f2fs_err(sbi, "Discard zone failed: %s (errno=%d)",
 				 fdev->path, ret);
-			return ret;
-		}
+
+		return ret;
 	}
 
-	return 0;
+	/*
+	 * If there are valid blocks and the write pointer doesn't
+	 * match with them, we need to report the inconsistency and
+	 * fill the zone till the end to close the zone. This inconsistency
+	 * does not cause write error because the zone will not be selected
+	 * for write operation until it get discarded.
+	 */
+	f2fs_notice(sbi, "Valid blocks are not aligned with write pointer: "
+		    "valid block[0x%x,0x%x] wp[0x%x,0x%x]",
+		    GET_SEGNO(sbi, last_valid_block),
+		    GET_BLKOFF_FROM_SEG0(sbi, last_valid_block),
+		    wp_segno, wp_blkoff);
+
+	ret = blkdev_issue_zeroout(fdev->bdev, zone->wp,
+				zone->len - (zone->wp - zone->start),
+				GFP_NOFS, 0);
+	if (ret)
+		f2fs_err(sbi, "Fill up zone failed: %s (errno=%d)",
+			 fdev->path, ret);
+
+	return ret;
 }
 
 static struct f2fs_dev_info *get_target_zoned_dev(struct f2fs_sb_info *sbi,
-- 
2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
