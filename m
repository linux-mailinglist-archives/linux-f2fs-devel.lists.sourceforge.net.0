Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAD740C001
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Sep 2021 09:02:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQOwD-00026D-G6; Wed, 15 Sep 2021 07:02:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+8aa05ddd91fea3e0ef51+6597+infradead.org+hch@casper.srs.infradead.org>)
 id 1mQOwB-000267-1J
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 07:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BkB2SpdezulujHBf3WGhiV0+MkMtRlb+AsprXrCWmm8=; b=kcsqaHm1nMBPWO8EAkBXir5Nm5
 8O+BUUDNj7eJWfgKTEFd0C6PkPJFM2O4B8Bw5Xe5r+pYhU26KI4lTAZHzYhnbfai7hSE/XybJdU0N
 bETwQTBUbHnK0TSC2wV5o7apvK2G/ZcKl8bxvmSn8nVjN6bCCxabj10zBEO2DXn5LdXM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BkB2SpdezulujHBf3WGhiV0+MkMtRlb+AsprXrCWmm8=; b=bl7jpyxvhcZl/U3gkv+/iow39Z
 ya4AaxN1+KuBYPWZ+jIp4d/DxlIAf+DLLlgMoPoQw1HZcDnyeKFOEoPWkK6vKApyacqq7qXMZ9HBj
 pgAPTr49p1R77xNE/m3Z/wgUntNYMKYtLoGbt6/ahuyW/PZyxOX+ZaFHPmeXeymFwKkk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQOw7-0008KK-KY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 07:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=BkB2SpdezulujHBf3WGhiV0+MkMtRlb+AsprXrCWmm8=; b=CEhy2KIoeV8zhbWw1mDQI8WkVj
 CLnhwX3BIb339QkhSMZ9AmSm9Hkn5xabmVdK1kd5SdjcNHrGujJtM3g1lpzHY+NY9mzHhcyeFoaaH
 hijYksPxsw336/qLWjnYBYVQRwMdHfraDnoi/utI17oE6OsiZWm6bB4hIdOkH9871U1e0r4aHJeHk
 7pzBnpB9XzmJlX4PDcY0xnm5VYhQPRWm8AfEeFyeT7hi17Rgs93CsruOtbDPxs1BCk3lyRg8nxIvT
 ekiab8MaiFlItSV/aLpeIfOHPvaH3bWtDW3nDvkatE93WEDenz2GOQWxIuHC2WiGlcXv1EBzxY+E5
 AsElWuFQ==;
Received: from [2001:4bb8:184:72db:8457:d7a:6e21:dd20] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQOv7-00FRW5-DA; Wed, 15 Sep 2021 07:01:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Wed, 15 Sep 2021 08:59:57 +0200
Message-Id: <20210915070006.954653-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210915070006.954653-1-hch@lst.de>
References: <20210915070006.954653-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Return the encoding table as the return value instead of as
 an argument, and don't bother with the encoding flags as the caller can handle
 that trivially. Signed-off-by: Christoph Hellwig <hch@lst.de> Reviewed-by:
 Gabriel Krisman Bertazi <krisman@collabora.com> Reviewed-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/super.c | 20 +++++++ 1 file c [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mQOw7-0008KK-KY
Subject: [f2fs-dev] [PATCH 02/11] f2fs: simplify f2fs_sb_read_encoding
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Return the encoding table as the return value instead of as an argument,
and don't bother with the encoding flags as the caller can handle that
trivially.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 78ebc306ee2b5..4c457100f18ea 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -264,24 +264,17 @@ static const struct f2fs_sb_encodings {
 	{F2FS_ENC_UTF8_12_1, "utf8", "12.1.0"},
 };
 
-static int f2fs_sb_read_encoding(const struct f2fs_super_block *sb,
-				 const struct f2fs_sb_encodings **encoding,
-				 __u16 *flags)
+static const struct f2fs_sb_encodings *
+f2fs_sb_read_encoding(const struct f2fs_super_block *sb)
 {
 	__u16 magic = le16_to_cpu(sb->s_encoding);
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(f2fs_sb_encoding_map); i++)
 		if (magic == f2fs_sb_encoding_map[i].magic)
-			break;
-
-	if (i >= ARRAY_SIZE(f2fs_sb_encoding_map))
-		return -EINVAL;
+			return &f2fs_sb_encoding_map[i];
 
-	*encoding = &f2fs_sb_encoding_map[i];
-	*flags = le16_to_cpu(sb->s_encoding_flags);
-
-	return 0;
+	return NULL;
 }
 
 struct kmem_cache *f2fs_cf_name_slab;
@@ -3843,13 +3836,14 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 		struct unicode_map *encoding;
 		__u16 encoding_flags;
 
-		if (f2fs_sb_read_encoding(sbi->raw_super, &encoding_info,
-					  &encoding_flags)) {
+		encoding_info = f2fs_sb_read_encoding(sbi->raw_super);
+		if (!encoding_info) {
 			f2fs_err(sbi,
 				 "Encoding requested by superblock is unknown");
 			return -EINVAL;
 		}
 
+		encoding_flags = le16_to_cpu(sbi->raw_super->s_encoding_flags);
 		encoding = utf8_load(encoding_info->version);
 		if (IS_ERR(encoding)) {
 			f2fs_err(sbi,
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
