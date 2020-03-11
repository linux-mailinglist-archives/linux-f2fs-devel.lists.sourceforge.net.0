Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A50E1814FD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2020 10:34:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jBxka-0002PU-08; Wed, 11 Mar 2020 09:34:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tiwai@suse.de>) id 1jBxkY-0002PJ-Fv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 09:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L4ll5CsQ+o9SZsOekiSbQdYDOj3uqCASlyqdmaA72RI=; b=LEn4Cpbv2XTA0syhSxNjrkNvaz
 B3WzTCR/mHvYzO1+nlDXY/7D9WNCyh+LDqOZr7bBBqQppZJTlGyPVIq2YTS1c+yAGE1595WQnNzBs
 pPCr2g3ojQjVE/y2c/ya3E+yf8RAQQ5+LVnReDlgNNPTqeC7PLuFqQ4ptI18qG7p+B4I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L4ll5CsQ+o9SZsOekiSbQdYDOj3uqCASlyqdmaA72RI=; b=kWnua91N/3a0jF9Ls3yIKZkNnO
 I0t6AWO74aqMde56LZarurgqIpe5WV0dMC6ryh3pTDNgcBBLkcNi+kBvh8zySxA0Btyh8w6MLfYdE
 WG3Kf7edd8QSMGBMYsAzDbe/Y8tpHuy56SfqKN1ocWeZQa4PsqYuLrWgT4OWOSKOUgs8=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jBxkW-008Js0-RZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 09:34:02 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5DFB9ADEB;
 Wed, 11 Mar 2020 09:33:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Wed, 11 Mar 2020 10:33:53 +0100
Message-Id: <20200311093353.25008-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.de]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jBxkW-008Js0-RZ
Subject: [f2fs-dev] [PATCH] f2fs: Use scnprintf() for avoiding potential
 buffer overflow
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
Cc: linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since snprintf() returns the would-be-output size instead of the
actual output size, the succeeding calls may go beyond the given
buffer limit.  Fix it by replacing with scnprintf().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 fs/f2fs/sysfs.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 91d649790b1b..5cc58a1fa645 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -109,47 +109,47 @@ static ssize_t features_show(struct f2fs_attr *a,
 		return sprintf(buf, "0\n");
 
 	if (f2fs_sb_has_encrypt(sbi))
-		len += snprintf(buf, PAGE_SIZE - len, "%s",
+		len += scnprintf(buf, PAGE_SIZE - len, "%s",
 						"encryption");
 	if (f2fs_sb_has_blkzoned(sbi))
-		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "blkzoned");
 	if (f2fs_sb_has_extra_attr(sbi))
-		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "extra_attr");
 	if (f2fs_sb_has_project_quota(sbi))
-		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "projquota");
 	if (f2fs_sb_has_inode_chksum(sbi))
-		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "inode_checksum");
 	if (f2fs_sb_has_flexible_inline_xattr(sbi))
-		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "flexible_inline_xattr");
 	if (f2fs_sb_has_quota_ino(sbi))
-		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "quota_ino");
 	if (f2fs_sb_has_inode_crtime(sbi))
-		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "inode_crtime");
 	if (f2fs_sb_has_lost_found(sbi))
-		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "lost_found");
 	if (f2fs_sb_has_verity(sbi))
-		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "verity");
 	if (f2fs_sb_has_sb_chksum(sbi))
-		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "sb_checksum");
 	if (f2fs_sb_has_casefold(sbi))
-		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "casefold");
 	if (f2fs_sb_has_compression(sbi))
-		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "compression");
-	len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+	len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "pin_file");
-	len += snprintf(buf + len, PAGE_SIZE - len, "\n");
+	len += scnprintf(buf + len, PAGE_SIZE - len, "\n");
 	return len;
 }
 
@@ -233,16 +233,16 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 		int hot_count = sbi->raw_super->hot_ext_count;
 		int len = 0, i;
 
-		len += snprintf(buf + len, PAGE_SIZE - len,
+		len += scnprintf(buf + len, PAGE_SIZE - len,
 						"cold file extension:\n");
 		for (i = 0; i < cold_count; i++)
-			len += snprintf(buf + len, PAGE_SIZE - len, "%s\n",
+			len += scnprintf(buf + len, PAGE_SIZE - len, "%s\n",
 								extlist[i]);
 
-		len += snprintf(buf + len, PAGE_SIZE - len,
+		len += scnprintf(buf + len, PAGE_SIZE - len,
 						"hot file extension:\n");
 		for (i = cold_count; i < cold_count + hot_count; i++)
-			len += snprintf(buf + len, PAGE_SIZE - len, "%s\n",
+			len += scnprintf(buf + len, PAGE_SIZE - len, "%s\n",
 								extlist[i]);
 		return len;
 	}
-- 
2.16.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
