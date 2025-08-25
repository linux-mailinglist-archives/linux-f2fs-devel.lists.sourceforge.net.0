Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 846D9B333C2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 03:56:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FHTjnhZVr7dYhzpeZsWnb40HmSoDNhvPQFIMv/heBs=; b=JsyOlT+OAue9rDyq1gsQE82SM2
	jl2aFSZMP/WVnaoA3NCvHVvCeuNWNmGqOnu3xbW2JV0h2s0AFO8U/negAVZuvTViawWbFuU1NFQ7s
	0TG/rFnKT3AaX8ZQgs6bSHlZTozbeEpHG2QbdfkBP1VxBGL0rs3Ix6/EWjFTP9ytgjhQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqMRf-0004ZY-CT;
	Mon, 25 Aug 2025 01:56:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uqMRb-0004ZR-Ta
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1weaUcKvNE/6g730dU/CYsTgau3ibpm9eJP8OK2bY1c=; b=cEXucvW5EiiuZTnIwQURLoxeFn
 BtiKOA2+BFfKaqnzo3+xw0nDrf4U7UNKIcX5n9AEkfBUjiCp7YegzYR/qVkMgSpr/i8n17Ijw2VQ0
 py4umWJ26JvTF6QcnETny1Y9RuId3akSldmgqY+gMsLtNB24VbJ0HCLCJ3fXweCZy68g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1weaUcKvNE/6g730dU/CYsTgau3ibpm9eJP8OK2bY1c=; b=CklOGSVYOhD09KoQWdTNIjx2UB
 fAxqRuk0MHNFQOsiIFbYvdWv01yqKwhnm1bY1kPyTJXe4nlEuKOzUVtlsI+7pRzjX4FIOVr36rk5Y
 0qb7RFtte2RImMjlH+1es+b/GaJ5ihJtw1pNwxc7Zl4KzdTt0eYhXSoaXR9DpRViP2fo=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uqMRb-0002pa-J7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:23 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-76e2eb6d07bso3174362b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 Aug 2025 18:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756086973; x=1756691773; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1weaUcKvNE/6g730dU/CYsTgau3ibpm9eJP8OK2bY1c=;
 b=RtKkhKSX7t6i3ksf5aLC7sguSRA6sAVKyluW64nlHfQ/s/6138Ukmk1sKj0J8t4S2o
 DstkxsdHgtTdJH52v86LlFLs4fhqO+lwoW5e/bM5NCFnoaN6MlaX09h4TJntlgTA2BAp
 aH4pkU4E5153Y+Bpej5atZpiOLo0ooTTJMNmJiENAvh+Zc7odAtRKX155LP809+AsHzP
 8CjqtmyB6tZy8dx5zZSH1jFbYW4FwqCHERVk0GcNtMQnEchzEgLNxPK3C4UvEBFlSsmt
 6WOnEgCB9UfbVfqYe3JbffYbhmuXx7zftEA4gLwQmKJvuRw6hnjtN8t3bxkL9MI9A7pR
 HLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756086973; x=1756691773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1weaUcKvNE/6g730dU/CYsTgau3ibpm9eJP8OK2bY1c=;
 b=Ws7GhBr6ljTx1ujFeSIlQALUDK0ELsCKhAJmpygjREpt4JwoSXx0ChlcESUJb2dmX/
 jnzLcu5UYl/GLrciX5ToHrKdtACvH4tpwiDZuLWDQ3Xdy+DsCxj1Ui6tghH8BQIpX0sf
 9bcnPK569MdJHtgWDpR7AWf+qiux4G05VPBei4O56VYTJp8/fQaBZ+pNRXbQGRWAsO20
 8I/9JpOBdIynjkZdYrUfz8B08vyWTsfNyCJ2ijemlHuGpw4h05k6sTaKgFLSfiEKGcVk
 SRE1JDwN0ErCx60Lpxpr3Ty3CuRM1L+0UIwUYzz9GoxbSfkmtQB+CAQN4FVcy2a0mhat
 OsmQ==
X-Gm-Message-State: AOJu0YwwLg8gRElu8Aj7CkVGRfiGIdZPdjT7vyvS8FvT4e9J3m5pg5si
 AwLnPtt5bBKwoHfPkTCMOtx5DEm49LhbDuCjPIn55DpQbSqi3WChq5S9+OReBw==
X-Gm-Gg: ASbGnctsDMn1EvzcIWLyJuBO0nv6o4BNPvXS8YcVjLA9ZXVWFYxs2xiBfW6Y7RTx/nk
 E9eFKerVg5Rdnre3qrlI70dDuB8ulxd0yfGoMZF8qxqVucjqDwAmYWzFJ9lL5A3qNrN6856/VE7
 qXw9KtdTzpPs47jtmD0tC7C+/5+333/fXc2jniFT7ve6/Kjy0td43mLFz27wS0+02iEhgsI1fJY
 a0bRCqF3beXvCFhpyRVg/ogXz1spUM9bgR0fRg3VpwJx8iqff0LoqmYT43PneYMbgyKS4dgnTuJ
 EIWJwtErafZzlJFp8r+326ApNGDCa8kXYr/0dJpMCglld0ynL1KH0CczUq1gJKTNfAZ5sbdfkGY
 tr+HardeTW5ycvL/SDt8L5CNwtmmbT5tjEjJcpwo=
X-Google-Smtp-Source: AGHT+IEb0Sd9dVSSJpbobuIXwu4T1Te0Bt4XCQfACWOzLA9Y119xQYiOwtMPGzoeirRAfeJPUn3b7Q==
X-Received: by 2002:a05:6a20:9389:b0:235:5f88:32fc with SMTP id
 adf61e73a8af0-24340c47a7dmr13869075637.18.1756086972745; 
 Sun, 24 Aug 2025 18:56:12 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b49cb8b1989sm5147883a12.18.2025.08.24.18.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 18:56:12 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 25 Aug 2025 09:54:47 +0800
Message-ID: <20250825015455.3826644-6-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825015455.3826644-1-shengyong1@xiaomi.com>
References: <20250825015455.3826644-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong dump.f2fs shows more info: * nat entry
 version
 * sit entry mtime Signed-off-by: Sheng Yong Reviewed-by: Chao Yu ---
 fsck/dump.c
 | 12 +++++++----- 1 file changed, 7 insertions(+), 5 deletions(-) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.172 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
X-Headers-End: 1uqMRb-0002pa-J7
Subject: [f2fs-dev] [PATCH v4 05/13] dump.f2fs: print more info
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

dump.f2fs shows more info:
 * nat entry version
 * sit entry mtime

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fsck/dump.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 10df7e593bfe..21de2acf80b5 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -70,10 +70,10 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
 			ASSERT(ret >= 0);
 			if (ni.blk_addr != 0x0) {
 				len = snprintf(buf, BUF_SZ,
-					"nid:%5u\tino:%5u\toffset:%5u"
+					"nid:%5u\tino:%5u\tver:%3d\toffset:%5u"
 					"\tblkaddr:%10u\tpack:%d"
 					"\tcp_ver:0x%" PRIx64 "\n",
-					ni.nid, ni.ino,
+					ni.nid, ni.ino, ni.version,
 					le32_to_cpu(footer->flag) >> OFFSET_BIT_SHIFT,
 					ni.blk_addr, pack,
 					le64_to_cpu(footer->cp_ver));
@@ -91,10 +91,10 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
 			ret = dev_read_block(node_block, ni.blk_addr);
 			ASSERT(ret >= 0);
 			len = snprintf(buf, BUF_SZ,
-				"nid:%5u\tino:%5u\toffset:%5u"
+				"nid:%5u\tino:%5u\tver:%3d\toffset:%5u"
 				"\tblkaddr:%10u\tpack:%d"
 				"\tcp_ver:0x%" PRIx64 "\n",
-				ni.nid, ni.ino,
+				ni.nid, ni.ino, ni.version,
 				le32_to_cpu(footer->flag) >> OFFSET_BIT_SHIFT,
 				ni.blk_addr, pack,
 				le64_to_cpu(footer->cp_ver));
@@ -135,8 +135,10 @@ void sit_dump(struct f2fs_sb_info *sbi, unsigned int start_sit,
 		offset = SIT_BLOCK_OFFSET(sit_i, segno);
 		memset(buf, 0, BUF_SZ);
 		snprintf(buf, BUF_SZ,
-		"\nsegno:%8u\tvblocks:%3u\tseg_type:%d\tsit_pack:%d\n\n",
+		"\nsegno:%8u\tvblocks:%3u\tseg_type:%d\tmtime:%llu\t"
+		"sit_pack:%d\n\n",
 			segno, se->valid_blocks, se->type,
+			(unsigned long long)se->mtime,
 			f2fs_test_bit(offset, sit_i->sit_bitmap) ? 2 : 1);
 
 		ret = write(fd, buf, strlen(buf));
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
