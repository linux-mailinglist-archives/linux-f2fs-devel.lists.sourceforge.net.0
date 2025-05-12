Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25930AB2E25
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 May 2025 05:34:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PBsNXKZejpDt4b1kaHt7vJcpqx0BU/1w/Oge7Hl1/Bs=; b=ZTY1FpI1tb+V9st+VNZhC3lpKE
	+j7NA+QI0R4YV8AkYIphckATlYvXGNTJ5H3rmhTMsoA4EEZD1bh3prlcadz4Iu+4JmC+QYNeK9OhL
	oDSdbk32XFR1uOecUGNBTBpMubyJfCY39GD/9au7IzT6TXUjZlA7rDcLhM4mtXRLYIi0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEJvu-00018k-Gv;
	Mon, 12 May 2025 03:34:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1uEJvt-00018e-4K
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 03:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AGN32AK9is1aWgHBSwum0YMxkrSRSQlQDkI5JPTw10k=; b=Bj6oIJWbWUG8RtNgJAa7LXMKjw
 doK+Jutf5cG4+nd8ivsUvUEjHCnHJEL67Mezpekmnsm8RaT1ok9YaAs/yzexS3ZqOiWOx14W8lVzY
 n55bLTPUEEHM1hCi17VdU3Dd7l/EUv8qgUYXkaOBInRAILS6pDxqZDzjMGqhXSnQ7VNw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AGN32AK9is1aWgHBSwum0YMxkrSRSQlQDkI5JPTw10k=; b=S
 1kvLg16VuLtOy3vu2imeDwNObjexhYHKb6cssb7P3Pg/5tg6RaRQf7Htcax8yRgcVBZblg32tRSwm
 P5MePk7GKxeLl5dt7vdwKTRyu3mPYybXuqPkYmB9wYLZXbXm5CMRLe5kQ83q6bX7e6FdeFmhOREg3
 yXByG+TQJ3zrUoeE=;
Received: from outboundhk.mxmail.xiaomi.com ([118.143.206.90])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uEJvr-0007Hy-KW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 03:34:25 +0000
X-CSE-ConnectionGUID: o0v6WJ8rS36BiaQoB0TxVA==
X-CSE-MsgGUID: TZhj+PIdSaO6eq01Uf7+GA==
X-IronPort-AV: E=Sophos;i="6.15,281,1739808000"; d="scan'208";a="114285864"
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 12 May 2025 11:33:59 +0800
Message-ID: <20250512033359.304795-1-huangjianan@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.237.8.165]
X-ClientProxiedBy: BJ-MBX19.mioffice.cn (10.237.8.139) To YZ-MBX05.mioffice.cn
 (10.237.88.125)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jianan Huang <huangjianan@xiaomi.com> ---
 tools/f2fs_io/f2fs_io.c
 | 6 ++++++ 1 file changed, 6 insertions(+) diff --git a/tools/f2fs_io/f2fs_io.c
 b/tools/f2fs_io/f2fs_io.c index 292dcb3..6531b55 100644 ---
 a/tools/f2fs_io/f2fs_io.c
 +++ b/tools/f2fs_io/f2fs_io.c @@ -258, 6 +258, 8 @@ static void do_getflags(int
 [...] Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1uEJvr-0007Hy-KW
Subject: [f2fs-dev] [PATCH] f2fs_io: print errno for flag operations
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
From: Jianan Huang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jianan Huang <huangjianan@xiaomi.com>
Cc: wanghui33@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
---
 tools/f2fs_io/f2fs_io.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 292dcb3..6531b55 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -258,6 +258,8 @@ static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 
 	ret = ioctl(fd, F2FS_IOC_GETFLAGS, &flag);
 	printf("get a flag on %s ret=%d, flags=", argv[1], ret);
+	if (ret)
+		die_errno("F2FS_IOC_GETFLAGS failed");
 	if (flag & FS_CASEFOLD_FL) {
 		printf("casefold");
 		exist = 1;
@@ -352,6 +354,8 @@ static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
 
 	ret = ioctl(fd, F2FS_IOC_SETFLAGS, &flag);
 	printf("set a flag on %s ret=%d, flags=%s\n", argv[2], ret, argv[1]);
+	if (ret)
+		die_errno("F2FS_IOC_SETFLAGS failed");
 	exit(0);
 }
 
@@ -394,6 +398,8 @@ static void do_clearflags(int argc, char **argv, const struct cmd_desc *cmd)
 
 	ret = ioctl(fd, F2FS_IOC_SETFLAGS, &flag);
 	printf("clear a flag on %s ret=%d, flags=%s\n", argv[2], ret, argv[1]);
+	if (ret)
+		die_errno("F2FS_IOC_SETFLAGS failed");
 	exit(0);
 }
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
