Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 882718388A1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jan 2024 09:13:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rSBuL-0007lz-QC;
	Tue, 23 Jan 2024 08:13:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1rSBuK-0007lt-4y
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 08:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KcINxNqK9poEeYbYdpTS1L5ZKLd+2H3epIO3RsMgjVY=; b=DBNR5HXZnJc80FizVVICMz3Z0o
 meWh832LPL63TyzUUcBSWjew/vmK+i1fIAFKTSPC/kURRkWKnC2IAcKqiljcndfRiy4TRR1nNfRcK
 uCGofocOW8yzsD4Eg9RFQbUWaha4N0phpyDbno10Hh6PPLPoAI9SI2sWPgavODJTWMkg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KcINxNqK9poEeYbYdpTS1L5ZKLd+2H3epIO3RsMgjVY=; b=Z
 EPw6oa8DVB4c54Er26wWeIYopV8hks5F9AXBjCNXZNwITAvjWnQ0lveWUAgXZfBcKJNJs/lvYqCBg
 h9wrGZqg97EbRean+iXpmJ0FN68OHAj3Px/ZOu2W2rW0G6hy2+Oq7BXfZuCF5T+PLTxEfl7mpSaiK
 fMtjqOqOMUtT+JD0=;
Received: from mail-pl1-f173.google.com ([209.85.214.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rSBuJ-0000q8-Am for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 08:13:20 +0000
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1d751bc0c15so15608995ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Jan 2024 00:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705997594; x=1706602394; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KcINxNqK9poEeYbYdpTS1L5ZKLd+2H3epIO3RsMgjVY=;
 b=RrG8EQSY7RQU0pPh66/BJ3Y10fEED/QqLM1YXGlI7BFKG615O5gr2f8mUQnm49Y33o
 LDFYHgtx2PMAyTTmwGywnQMVHguCwwuDlwtj/u44XOFy8kIX1mhAkRUsMKUXgqr5hw7s
 bHjn7ax+KcFmQm09wUzyys0tDy5B48LbKtlVBlS8F4LhS1YuiMzVMIvKC1UidreVClyc
 +ZkhjUG/IdeuACLiLfBXCeaae2UHKpXpkHkpSxy95R3BBdp/VGePRLw2ch2pL9D3CMv/
 n3xueVFLPMQ39Y/ZOmwrWkreon097adE7JCnu8b6zQgmlTCAamRUx0wHLJePYwcVoe0B
 efKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705997594; x=1706602394;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KcINxNqK9poEeYbYdpTS1L5ZKLd+2H3epIO3RsMgjVY=;
 b=EvH6s3wIupWySCMWjOoUOgI33/rRC/Yps6HClZS5xebqzM916wJy0UV9f0AxSmtCGx
 oioKKBfb36LdGK433lR7O1Frla8l1ubTHfxdi2LWNZqbK8/vb80tAcqBR490NWLxLMmE
 Xfp8pXNQmIC/nZQPt/BYYcnPsaxEp5KPjalpJSpBQgpjGpAz04taM40K2EHPwo2OqteB
 5pg2fYfFsKX5PXU2bB/qhsGqf8zs8JK/vUYdBxkQJItQMvefXxBIor2QCJTC46RQlCeq
 jHnX4oTMGebkR+M8/mO7ViFLYODDuloQcAGc3Y5MCGQ9FcAIhOiP6XVTCItw3C8//64w
 QbMA==
X-Gm-Message-State: AOJu0YxbGiZUe6IbsbiYKs4nhXvgNC3anDhW/Xij1fllr+WAQWe+bdnl
 3E742DgpmFTMaiL4e4dEclYb1vIZgjqaPJoxP8xGwcuIrCjw5uBh
X-Google-Smtp-Source: AGHT+IErVu63V4k0+Aq4pa/jHhmVEQBrs+2RsnmDS9vb3LEMXIfyc+CDCcw5kcox8aQnrm0Z/3H8aA==
X-Received: by 2002:a17:903:25d5:b0:1d7:808:dcfb with SMTP id
 jc21-20020a17090325d500b001d70808dcfbmr5123860plb.91.1705997594253; 
 Tue, 23 Jan 2024 00:13:14 -0800 (PST)
Received: from localhost.localdomain ([2001:250:4000:8246:d59a:da76:65b9:ef0])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a17090341c900b001d70c6d40f3sm7798578ple.237.2024.01.23.00.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 00:13:13 -0800 (PST)
From: Wenjie Qi <qwjhust@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Tue, 23 Jan 2024 16:12:58 +0800
Message-ID: <20240123081258.700-1-qwjhust@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If the max active zones of zoned devices are less than the
 active logs of F2FS, the device may error due to insufficient zone resources
 when multiple active logs are being written at the same time. If [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.173 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qwjhust[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.173 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rSBuJ-0000q8-Am
Subject: [f2fs-dev] [PATCH v3] f2fs: fix zoned block device information
 initialization
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
Cc: Wenjie Qi <qwjhust@gmail.com>, hustqwj@hust.edu.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If the max active zones of zoned devices are less than
the active logs of F2FS, the device may error due to
insufficient zone resources when multiple active logs are
being written at the same time. If this value is 0, there is no limit.

Signed-off-by: Wenjie Qi <qwjhust@gmail.com>
---
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/super.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 65294e3b0bef..669f84f6b0e5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1551,6 +1551,7 @@ struct f2fs_sb_info {
 
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
+	unsigned int max_active_zones;		/* max zone resources of the zoned device */
 #endif
 
 	/* for node-related operations */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 206d03c82d96..aef41b54098c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2385,6 +2385,16 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	if (err)
 		goto restore_opts;
 
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (sbi->max_active_zones && sbi->max_active_zones < F2FS_OPTION(sbi).active_logs) {
+		f2fs_err(sbi,
+			"zoned: max active zones %u is too small, need at least %u active zones",
+				 sbi->max_active_zones, F2FS_OPTION(sbi).active_logs);
+		err = -EINVAL;
+		goto restore_opts;
+	}
+#endif
+
 	/* flush outstanding errors before changing fs state */
 	flush_work(&sbi->s_error_work);
 
@@ -3932,6 +3942,14 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 	if (!f2fs_sb_has_blkzoned(sbi))
 		return 0;
 
+	sbi->max_active_zones = bdev_max_active_zones(bdev);
+	if (sbi->max_active_zones && sbi->max_active_zones < F2FS_OPTION(sbi).active_logs) {
+		f2fs_err(sbi,
+			"zoned: max active zones %u is too small, need at least %u active zones",
+				 sbi->max_active_zones, F2FS_OPTION(sbi).active_logs);
+		return -EINVAL;
+	}
+
 	zone_sectors = bdev_zone_sectors(bdev);
 	if (!is_power_of_2(zone_sectors)) {
 		f2fs_err(sbi, "F2FS does not support non power of 2 zone sizes\n");
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
