Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84632A4C92D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 18:21:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tp9UL-0007ei-TP;
	Mon, 03 Mar 2025 17:21:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1tp9UK-0007eW-99
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:21:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q6tarKB1CfAIuXjfEy4x7dyKjThyUG3IiqyL5hoH5MY=; b=IcNCVREQqtvIhVIK1HNBONZZCz
 Zrjjzyci0CAZE7gznZoTv+rfzojg2IaBoDtWqP6423LG+7iWwVZwpszXeG7jhNx5pFZhF9WxyZosv
 Jr3oxq6GrkDSaQ5Jv7wOCwObSpGokxeaFDDIHo2PKezlFWObfniWcARhr2m3rxLE1zOY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q6tarKB1CfAIuXjfEy4x7dyKjThyUG3IiqyL5hoH5MY=; b=dbSuLtS8SLLjGo5PcvQTE+qnRq
 3dPHgTHT+B0ZwZyTMlVC1zNmixKdFtlSIO61MgMOnDcKYuv6nVzOH5WABZFPT6m9ecM0z+LGjwg+a
 K1+ePpY5UzGVi/4sXyfJxsBscm9HMEFWN4LBr4OwhRbcn8nbVWEk9w14oQ0aszLu25O8=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tp9UD-0008QS-V7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:21:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741022504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6tarKB1CfAIuXjfEy4x7dyKjThyUG3IiqyL5hoH5MY=;
 b=Z9sF1C27Dt9BNcwIj4ON41HV6+kojz5DcO670aJFcYswJn1AdWksDXeR+V+IfpgfE+7O07
 zxB+dF9d8vejQKAGmSHd/d7lelsHe2e9Jw7K3JhFqVPQpvIlgFHL6h3ux7GWN+dZ+HkQN8
 t16rqqsqbbJVAPLtSECZg9BKM75EPog=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-1tFF64RhNT6QuwOtJrRxVA-1; Mon, 03 Mar 2025 12:21:43 -0500
X-MC-Unique: 1tFF64RhNT6QuwOtJrRxVA-1
X-Mimecast-MFC-AGG-ID: 1tFF64RhNT6QuwOtJrRxVA_1741022502
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-85ad875acccso316021639f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Mar 2025 09:21:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741022502; x=1741627302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q6tarKB1CfAIuXjfEy4x7dyKjThyUG3IiqyL5hoH5MY=;
 b=v2PqF+bSVO8mTo9WKHuSfh0+AhcEsyItZ3S9kiJbALX1TKgXwyo5TyZJeUZRrOHSO5
 X7z9k8+Pos5jgr4dLpb5XQRkuJRxus93btyHfQGhRJHR47EWbfeYyfwL92zglquXusJH
 ZuiD0ZdRubS4KOmGmKErl3vIF5cs7/8vTvWvA3D2gLqvXY7r9vy8nysPX+/GEvV9/4ww
 2bjKgnNsTkaMH02XtT7K7UkAneFS2mZbWnEWDcPISKulcYJLkrm1O8WLYf3a+6ic+wAh
 +q6vtLwpPczUP+bVnRGrKtxmVOCgy/2noI80uMIa732enQgBOPDY3U79lM3ZDzLZW1r0
 UUOQ==
X-Gm-Message-State: AOJu0YwyFsSxm4+j9pa+os3e7thyrsZv85XM3v77suk46GGtYeSr6wE1
 t+LiVb18jiYo/Ub9etUMI7tIn8YgdKLIyyEDW3a0rGkvH8e2OjcEjQI88ITcpItZlh6Xywfow86
 aR6jj89/thWm5ClL0gO+N/DRtYZCsUy7ipUuY7sKmhtPenS1gw5gAnOJ0HBvw6HcWdYukWijNx7
 +K5ePuci0jFHLz++YDbdbbLcjOM4Q4etd3Z0rNOPmkgps6uqAtSf7nTbbZfw==
X-Gm-Gg: ASbGncvQxWr8kxqVkg9uCu0L+eT/mB5BIGZsWW+CGCxFTcFsbnRqr40XXRqmXu+/w6K
 wNz67bAOOTMcIKmBam3raV7aS/9tS8U9IOFOYDdxQ4nCFsUllnKYGTLkmgqvrV4VA9BT9FqoS+n
 Cv+P52aCA4qLnnCIm5Wji0cz47IYJQ9IaCo0bMq1+oiE64yyd4BClpLyGoaU4EvAZzgHJupkjZe
 K//WRXYGenWI5VNu2STnlKSWFwjNI5Th8zfI4+mMDOV/Z5gHkOOt0Id5vHW6t0zXOtrEtehDLEv
 An7WOxQSwDpdlhp4Mj22UnHgf6uVSF4=
X-Received: by 2002:a05:6602:3a82:b0:85a:e7c4:f6b9 with SMTP id
 ca18e2360f4ac-85ae7c4f81amr265636539f.9.1741022501862; 
 Mon, 03 Mar 2025 09:21:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzrP/3MrFLUly11d4J7+M3FYe3B7Z4Sa8O1Ri1DRSKiJhgxCF8L6Y5elLPDbGRaUwqgULqnA==
X-Received: by 2002:a05:6602:3a82:b0:85a:e7c4:f6b9 with SMTP id
 ca18e2360f4ac-85ae7c4f81amr265633139f.9.1741022501513; 
 Mon, 03 Mar 2025 09:21:41 -0800 (PST)
Received: from fedora-rawhide.sandeen.net ([65.128.97.82])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-85add261b4csm49563939f.9.2025.03.03.09.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 09:21:40 -0800 (PST)
From: Eric Sandeen <sandeen@redhat.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  3 Mar 2025 11:12:19 -0600
Message-ID: <20250303172127.298602-10-sandeen@redhat.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250303172127.298602-1-sandeen@redhat.com>
References: <20250303172127.298602-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AhXmwcrQ5U__zTlHt3wk7CrY-LLlZG56ucxsA8fBGjs_1741022502
X-Mimecast-Originator: redhat.com
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  With the new mount API the sb will not be available during
 initial option parsing, which will happen before fill_super reads sb from
 disk. Now that the sb is no longer directly referenced in parse_options,
 switch it to use sbi. 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 -1.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tp9UD-0008QS-V7
Subject: [f2fs-dev] [PATCH 9/9] f2fs: pass sbi rather than sb to
 parse_options()
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
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com,
 Eric Sandeen <sandeen@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

With the new mount API the sb will not be available during initial option
parsing, which will happen before fill_super reads sb from disk.

Now that the sb is no longer directly referenced in parse_options, switch
it to use sbi.

(Note that all calls to f2fs_sb_has_* originating from parse_options will
need to be deferred to later before we can use the new mount API.)

Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---
 fs/f2fs/super.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9edb200caae7..579c96a80fe2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -670,9 +670,8 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
 #endif
 #endif
 
-static int parse_options(struct super_block *sb, char *options, bool is_remount)
+static int parse_options(struct f2fs_sb_info *sbi, char *options, bool is_remount)
 {
-	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	substring_t args[MAX_OPT_ARGS];
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	unsigned char (*ext)[F2FS_EXTENSION_LEN];
@@ -2356,7 +2355,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	default_options(sbi, true);
 
 	/* parse mount options */
-	err = parse_options(sb, data, true);
+	err = parse_options(sbi, data, true);
 	if (err)
 		goto restore_opts;
 
@@ -4496,7 +4495,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_sb_buf;
 	}
 
-	err = parse_options(sb, options, false);
+	err = parse_options(sbi, options, false);
 	if (err)
 		goto free_options;
 
-- 
2.48.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
