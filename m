Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFFF28FD95
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Oct 2020 07:15:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kTI5O-0005Ge-93; Fri, 16 Oct 2020 05:15:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kTI5M-0005GN-E6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Oct 2020 05:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pPRKGwCWlhzW2fZpjziEJb0M3iHjtjmgnX8F6uX861E=; b=WgDceYal6qzLl48adljNNXnDCE
 6cCl699OetmpowgcVyf7uYhy5Z2QjFYyaUALAnXIeYwYJjLbwDS7FjhxxjbBAas3t0ArvV7lnBul2
 L8dyn4lfQT1Z3GFXIrMm9jqQQehmntezllPusuGLoOolwEqHpUmde1KGPHcCLmjFErJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pPRKGwCWlhzW2fZpjziEJb0M3iHjtjmgnX8F6uX861E=; b=k
 VAzc61VBw0wfMGFZ4wRPOhmOQWi/kxqj4vu+yas/FgU+bhrG/IQYKj1EaM7qkgcv3nHiJaEoGLLTG
 OvqsC09VJjruYTh/hcNGT6BTuPo5KeMiDnXL/ZmDOrtLzrlXCQOWmNcTGckEOoWVmxppNtBidAqDP
 zMAQ+QXULozS8fTA=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kTI5D-00HRPh-4y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Oct 2020 05:15:24 +0000
Received: by mail-pf1-f193.google.com with SMTP id b26so806407pff.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Oct 2020 22:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pPRKGwCWlhzW2fZpjziEJb0M3iHjtjmgnX8F6uX861E=;
 b=HyQm0F1Ds6YoQolTS544JgaLlzxxYxEJVA0HZFcTVEa0eKtX8IU2WfIKowIIlGlp80
 jJD9su0lBNh7fhLAY6BbMfyVwJU7egk6MdA4xhSiH0oyD3325wjY2VWzJwBuIb+tmVSb
 NVyHEx4eLTrfJ2+/P3klgnjbhwKdysoSnYyhJnL1Dvth5MiYz1RL7QZDwXzRB0hmYe71
 x46P3b0bxBjoeEXQs8tzgK+NE45chbib18jZIbBP2pzgyt+8lpDTI3a2MicJxrn+QA6b
 elUB4ZgQCym2YYWYlmWW8WEqOWfyO0IDjYPb8ZO+xYoGQ41lLTwlE8bhmxfsYr5bmZNd
 f/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pPRKGwCWlhzW2fZpjziEJb0M3iHjtjmgnX8F6uX861E=;
 b=UH8a/K7awIHXCwH/OZmUe2JYyM+PR3IejBzcFH1BRRMKDJN1XFrou4y+5OvfPi0c1Z
 qfLKojwKLNnyXR4pX7xaWGRxx+vSqRXDJu+yNsf5h+IGnDkC52r2v0vmo4kWBuz3p73m
 Qoav3jiJUI2Ypu6ne9fKm5VQEbroJ3iIHpTlg4U/RpdFWQ2BQbt4JTNHK8oEC5Cb5CDQ
 B/LgxGW3H0afqj/jxR/sUqLyTZ98ZHuNBAWzVixRV8OOBSFiV7M9tOzPS7rQ/W/K58Ic
 bD9P0780SJxKyQ/cOqjt1NCdSeiTSOf3ha+LXPTXe0H6SdJfdXNiNMhdKroB+TYDRBsE
 SVuw==
X-Gm-Message-State: AOAM532oaMStMk66K8CRwLUPkUId2QBsF6hJycL6WohVpuWVbXeB760u
 ak7QrhNoK7OrEt5JKyzL6IWyES+osKs=
X-Google-Smtp-Source: ABdhPJzUutEPt92K6TaLg/1fFgd8kxj4nhUPYUPqPgwM9EbegeLWlstMp7eXArbq5ZNTTFQkLlSvxw==
X-Received: by 2002:a62:5215:0:b029:156:6a80:a257 with SMTP id
 g21-20020a6252150000b02901566a80a257mr2003516pfb.63.1602825302319; 
 Thu, 15 Oct 2020 22:15:02 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id m3sm1139218pjv.52.2020.10.15.22.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 22:15:01 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 16 Oct 2020 14:14:55 +0900
Message-Id: <20201016051455.1913795-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
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
X-Headers-End: 1kTI5D-00HRPh-4y
Subject: [f2fs-dev] [PATCH] f2fs: add compr_inode and compr_blocks sysfs
 nodes
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

Added compr_inode to show compressed inode count and compr_blocks to
show compressed block count in sysfs.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 10 ++++++++++
 fs/f2fs/sysfs.c                         | 17 +++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 834d0becae6d..a01c26484c69 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -350,3 +350,13 @@ Date:		April 2020
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Give a way to change iostat_period time. 3secs by default.
 		The new iostat trace gives stats gap given the period.
+
+What:		/sys/fs/f2fs/<disk>/compr_inode
+Date:		October 2020
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Show compressed inode count
+
+What:		/sys/fs/f2fs/<disk>/compr_blocks
+Date:		October 2020
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Show compressed block count
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 94c98e412aa1..7139a29a00d3 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -223,6 +223,19 @@ static ssize_t avg_vblocks_show(struct f2fs_attr *a,
 	f2fs_update_sit_info(sbi);
 	return sprintf(buf, "%llu\n", (unsigned long long)(si->avg_vblocks));
 }
+
+static ssize_t compr_inode_show(struct f2fs_attr *a,
+				struct f2fs_sb_info *sbi, char *buf)
+{
+	return sprintf(buf, "%u\n", atomic_read(&sbi->compr_inode));
+}
+
+static ssize_t compr_blocks_show(struct f2fs_attr *a,
+				struct f2fs_sb_info *sbi, char *buf)
+{
+	return sprintf(buf, "%llu\n", atomic64_read(&sbi->compr_blocks));
+}
+
 #endif
 
 static ssize_t main_blkaddr_show(struct f2fs_attr *a,
@@ -591,6 +604,8 @@ F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_background_calls, bg_gc);
 F2FS_GENERAL_RO_ATTR(moved_blocks_background);
 F2FS_GENERAL_RO_ATTR(moved_blocks_foreground);
 F2FS_GENERAL_RO_ATTR(avg_vblocks);
+F2FS_GENERAL_RO_ATTR(compr_inode);
+F2FS_GENERAL_RO_ATTR(compr_blocks);
 #endif
 
 #ifdef CONFIG_FS_ENCRYPTION
@@ -675,6 +690,8 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(moved_blocks_foreground),
 	ATTR_LIST(moved_blocks_background),
 	ATTR_LIST(avg_vblocks),
+	ATTR_LIST(compr_inode),
+	ATTR_LIST(compr_blocks),
 #endif
 	NULL,
 };
-- 
2.29.0.rc1.297.gfa9743e501-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
