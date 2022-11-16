Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0906F62BF1D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Nov 2022 14:11:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ovICD-0007n1-FD;
	Wed, 16 Nov 2022 13:11:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1ovICB-0007mm-TX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Nov 2022 13:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k8y+muBM2qZTT2X8qCBej0zg9DiU1t7btSSNdv1jtiM=; b=lcP7uDy6GAcwwFBZf6M8h4KehK
 QzlQ6pduc5xy9wYpDt53/T8a0zK8p2uhOubGvgy39yO/Ni/wkVf8rCrEDv5S0ZhVHhiMyWQmEMJgi
 yOmuHaFDs2WWd7fIpaOJu8bUVly+1YSZujKg3zYYpHg4Y0HZHy3KdG5Ds2XCcOEuKv/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=k8y+muBM2qZTT2X8qCBej0zg9DiU1t7btSSNdv1jtiM=; b=l
 JpwtxPTMBbNbN6l8F0OX9IlZC6mNJoYVNI+/MFR/61fpCxZ8Pm6UEB7q8wjxEIb2PEV2UgK+P4p5t
 lhWeS3mCQ8U7JlaRIV8a5Uu6UjDJ0csZrsK/EW89eLSZzgk7CvP5JmYrJwBE2vSLaWIomzaJv7B9/
 70kpHww3NgV4giBY=;
Received: from mail-pj1-f48.google.com ([209.85.216.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ovICA-00ARas-20 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Nov 2022 13:11:15 +0000
Received: by mail-pj1-f48.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so2400512pji.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 16 Nov 2022 05:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k8y+muBM2qZTT2X8qCBej0zg9DiU1t7btSSNdv1jtiM=;
 b=KidMbbgSXbx3gh559UeogeA/gGen/Rrnwwla1QMugK8+MpsG3wMqJyOXCme0WRJqMz
 SZaFPwchzImkqspY1mBZw/6Z16gFAfwvL8YBMTEKsSy33rMtgCPkRovb3wsxZhvacMix
 X56N16KJwmMWZKQbsk4sjA4pnOGbybriUIjgbua0IMdfNBUvngIDfYYuM2zYBQMoxIQd
 XgN5RchxhAVatW/zUtHUGna0vNP7FCKkftGxIkyAhyjZN7+f5u/urBo71Ty0G2hEyutX
 0h1jA2gHK8AGjxF5eH6vr20F0ZZmdt4tY8+HH9h3v7bgoEVOcrpG+EmtmIqZknByXv5U
 BFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k8y+muBM2qZTT2X8qCBej0zg9DiU1t7btSSNdv1jtiM=;
 b=u1pV+hbreXDxzFqW8lkkQIPFuJZDgTuz4GsZPrU/Py+V4m1yXHn7ErX5VYmhwpwBLA
 C92tdmBW8qoxSKKrq0BVyVx1of6NukSBuXq2H0l69gVNe4ogpsYPW40o2aM2/yv8ns1I
 7kE/3iR9FI5aGV3AzVMO+ZG1z3Kg4yISw8cgfwQo+WxGT3KYz/lllS4gGWknPO9RA7qz
 +E+mpUph0bVc3UDWP+J4y45CYnWUcCR9CrYWZmjjrYgOiUzy8vgW5/wA/iR6vy2Rpdrx
 IHxlsxL/WEe0m7T9HQufWn0motwrJxBRm7lVYjBjQWs0CoVGDKx2yhcKUcRBo5ui1J7Z
 zNcA==
X-Gm-Message-State: ANoB5pnK/28j//ImXz2+Z2N02lanoWislwfASdsXAw2RqYDaJ3+CNbq1
 3DeLjwdTMMzzuzA2x4BlvTI=
X-Google-Smtp-Source: AA0mqf4AVUd3D4YNlaUpOzwpvqGSSBpVjQ51zX/gSYZPV/tgpr9u82+j4bVx9FgZyYvOyhUaVrvepw==
X-Received: by 2002:a17:902:9b84:b0:188:e255:39af with SMTP id
 y4-20020a1709029b8400b00188e25539afmr1263637plp.86.1668604268517; 
 Wed, 16 Nov 2022 05:11:08 -0800 (PST)
Received: from VirtualBox.. ([222.71.102.99]) by smtp.gmail.com with ESMTPSA id
 rj6-20020a17090b3e8600b00217cdc4b0a5sm1519491pjb.16.2022.11.16.05.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 05:11:07 -0800 (PST)
From: Yuwei Guan <ssawgyw@gmail.com>
X-Google-Original-From: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 16 Nov 2022 21:10:35 +0800
Message-Id: <20221116131035.1056523-1-Yuwei.Guan@zeekrlife.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This 'io_aware_gran' is initialized as MAX_PLIST_NUM in
 __init_discard_policy(), 
 and use as 'i < dpolicy->io_aware_gran' in __issue_discard_cmd(), but 'i
 < dpolicy->io_aware_gran' is true always, so r [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ssawgyw[at]gmail.com]
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
 [209.85.216.48 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.48 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ovICA-00ARas-20
Subject: [f2fs-dev] [PATCH] f2fs: remove useless io_aware_gran variable
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This 'io_aware_gran' is initialized as MAX_PLIST_NUM in
__init_discard_policy(), and use as 'i < dpolicy->io_aware_gran'
in __issue_discard_cmd(), but 'i < dpolicy->io_aware_gran' is
true always, so remvoe this variable.

Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
---
 fs/f2fs/f2fs.h    | 1 -
 fs/f2fs/segment.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index dedac413bf64..ced8a5b226b5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -388,7 +388,6 @@ struct discard_policy {
 	unsigned int mid_interval;	/* used for device busy */
 	unsigned int max_interval;	/* used for candidates not exist */
 	unsigned int max_requests;	/* # of discards issued per round */
-	unsigned int io_aware_gran;	/* minimum granularity discard not be aware of I/O */
 	bool io_aware;			/* issue discard in idle time */
 	bool sync;			/* submit discard with REQ_SYNC flag */
 	bool ordered;			/* issue discard by lba order */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8b0b76550578..1cc41a65a645 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1059,7 +1059,6 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
 	dpolicy->granularity = granularity;
 
 	dpolicy->max_requests = dcc->max_discard_request;
-	dpolicy->io_aware_gran = MAX_PLIST_NUM;
 	dpolicy->timeout = false;
 
 	if (discard_type == DPOLICY_BG) {
@@ -1483,8 +1482,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 				f2fs_time_over(sbi, UMOUNT_DISCARD_TIMEOUT))
 				break;
 
-			if (dpolicy->io_aware && i < dpolicy->io_aware_gran &&
-						!is_idle(sbi, DISCARD_TIME)) {
+			if (dpolicy->io_aware && !is_idle(sbi, DISCARD_TIME)) {
 				io_interrupted = true;
 				break;
 			}
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
