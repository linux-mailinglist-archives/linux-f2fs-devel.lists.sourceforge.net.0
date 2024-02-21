Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 589E385D357
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Feb 2024 10:21:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcinI-0006Wk-1P;
	Wed, 21 Feb 2024 09:21:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcinG-0006Wc-V7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 09:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tDr0+aUxQgeMjc0CyokT/t1hMa9lKxtt/suvE6nXFAs=; b=YKdguMGOm/b9sL4CqqSwM3gz9F
 FEzHpwQ/IenPD+jWc3voA7tN2sajKPwfICakGA0dxszpWxDopvpe0W4vpTp/jQSNUJTGHKT5cyT+m
 VPHbCRCFGxsu5iAehoJE/VTtiVItqecl6cdII0eLcV6PzNPXidZ0sNkCZdivr3oSsZcU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tDr0+aUxQgeMjc0CyokT/t1hMa9lKxtt/suvE6nXFAs=; b=H
 i6oXvf5mokThuxmfz99fZjut2xECcT6Co4XTqJOa5FF5UZaOMIjYnW0AYhrdm5sGuzLDnf9MyRWak
 HFzGtGA7eC1iXY0cQSLAQrVANbQqj+oP/sklixDMn1hwePCpJMZXc9K+lE0GLyBHoMX0XhFqiWCUR
 SAC3yvR/xbJB3Ryg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcinB-0001sF-0f for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 09:21:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E819661070
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Feb 2024 09:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCC7C433C7;
 Wed, 21 Feb 2024 09:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708507279;
 bh=hvHxWx9vm52mmjkQeEbYsIeD8Ps+f2ojhPGoIIt+ypc=;
 h=From:To:Cc:Subject:Date:From;
 b=kw/N1KThkav/ajCgKQySmbau6yVMv3mSjng/3N5toQibShMYWsj9E6KtDezvc2RtU
 3BVapgsvsu9Bh2WjsvEv/pw4adaDJ22u92VFD4slZgKDH9zN8RF1KIX+hZZEBxppdB
 zUyVRbN2qFbrnBPyK90JHpBo9dSY7aOgy3dMMhrOdr6SoFltvpMrUheFlzH4FN4s3Q
 c/WW+o+Xe0B8IIW6HoKKt9q4Jc3eXHQDvDghvJ1TW+QmRt7XyZKEvZGbpO2WXyzHbe
 ZaA/m1CjlkMgrxM8tHAElFNZCulyO7LN17ELTrUZg+VNxxgqlGAvNyAO0+gcU53igm
 8pCOxPv3+IoVA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 21 Feb 2024 17:21:13 +0800
Message-Id: <20240221092113.403851-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: No one uses this feature. Let's kill it. Signed-off-by: Chao
 Yu <chao@kernel.org> --- include/f2fs_fs.h | 1 - man/mkfs.f2fs.8 | 6 +-----
 mkfs/f2fs_format.c | 8 -------- mkfs/f2fs_format_main.c | 5 +---- 4 files
 changed, 2 insertions(+), 18 d [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcinB-0001sF-0f
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: kill heap allocation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

No one uses this feature. Let's kill it.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 include/f2fs_fs.h       | 1 -
 man/mkfs.f2fs.8         | 6 +-----
 mkfs/f2fs_format.c      | 8 --------
 mkfs/f2fs_format_main.c | 5 +----
 4 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 5e9dfad..b59997c 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1475,7 +1475,6 @@ struct f2fs_configuration {
 	char *vol_uuid;
 	uint16_t s_encoding;
 	uint16_t s_encoding_flags;
-	int heap;
 	int32_t kd;
 	int32_t dump_fd;
 	struct device_info devices[MAX_DEVICES];
diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index 6670003..0dc367b 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -8,10 +8,6 @@ mkfs.f2fs \- create an F2FS file system
 .SH SYNOPSIS
 .B mkfs.f2fs
 [
-.B \-a
-.I heap-based-allocation
-]
-[
 .B \-c
 .I device-list
 ]
@@ -110,7 +106,7 @@ The exit code returned by
 is 0 on success and 1 on failure.
 .SH OPTIONS
 .TP
-.BI \-a " heap-based-allocation"
+.BI \-a " heap-based-allocation" (deprecated)
 Specify 1 or 0 to enable/disable heap based block allocation policy.
 If the value is equal to 1, each of active log areas are initially
 assigned separately according to the whole volume size.
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 63d675e..8f632f8 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -548,14 +548,6 @@ static int f2fs_prepare_super_block(void)
 		c.cur_seg[CURSEG_HOT_DATA] = 0;
 		c.cur_seg[CURSEG_COLD_DATA] = 0;
 		c.cur_seg[CURSEG_WARM_DATA] = 0;
-	} else if (c.heap) {
-		c.cur_seg[CURSEG_HOT_NODE] =
-				last_section(last_zone(total_zones));
-		c.cur_seg[CURSEG_WARM_NODE] = prev_zone(CURSEG_HOT_NODE);
-		c.cur_seg[CURSEG_COLD_NODE] = prev_zone(CURSEG_WARM_NODE);
-		c.cur_seg[CURSEG_HOT_DATA] = prev_zone(CURSEG_COLD_NODE);
-		c.cur_seg[CURSEG_COLD_DATA] = 0;
-		c.cur_seg[CURSEG_WARM_DATA] = next_zone(CURSEG_COLD_DATA);
 	} else if (c.zoned_mode) {
 		c.cur_seg[CURSEG_HOT_NODE] = 0;
 		if (c.zoned_model == F2FS_ZONED_HM) {
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index f3316f7..c98e73c 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -49,7 +49,6 @@ static void mkfs_usage()
 {
 	MSG(0, "\nUsage: mkfs.f2fs [options] device [sectors]\n");
 	MSG(0, "[options]:\n");
-	MSG(0, "  -a heap-based allocation [default:0]\n");
 	MSG(0, "  -b filesystem block size [default:4096]\n");
 	MSG(0, "  -c device1[,device2,...] up to 7 additional devices, except meta device\n");
 	MSG(0, "  -d debug level [default:0]\n");
@@ -84,8 +83,6 @@ static void f2fs_show_info()
 	MSG(0, "\n    F2FS-tools: mkfs.f2fs Ver: %s (%s)\n\n",
 				F2FS_TOOLS_VERSION,
 				F2FS_TOOLS_DATE);
-	if (c.heap == 0)
-		MSG(0, "Info: Disable heap-based policy\n");
 
 	MSG(0, "Info: Debug level = %d\n", c.dbg_lv);
 	if (c.extension_list[0])
@@ -191,7 +188,7 @@ static void f2fs_parse_options(int argc, char *argv[])
 			c.dbg_lv = -1;
 			break;
 		case 'a':
-			c.heap = atoi(optarg);
+			MSG(0, "Info: heap allocation is deprecated\n");
 			break;
 		case 'b':
 			c.blksize = atoi(optarg);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
