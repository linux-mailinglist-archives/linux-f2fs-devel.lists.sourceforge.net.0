Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBF2AAFABE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 14:59:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BLJa1ctpM9CfwkZyylcqK4ex4oIJSnXBrQdV+2uNJLc=; b=khuJN0v6WBwZGWSmkXYVODs+tG
	hYZbpVeXJqH/j48MAqROkdl+WUCYLxCXHqgnp48Bmi3Tu1fbw3e/Gyfv2EDMt45vlsZ+Me4rLu/Z/
	zMbpNkWW1Oqx4TAaNFfgzrxLr6trXDx3WaQ5XmwTU4Ef5tLUla0KBEE9iJzqbrYNkCxM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uD0qC-00056u-EB;
	Thu, 08 May 2025 12:59:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1uD0qA-00056g-ER
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 12:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gKR0wUmsGrUtG7A76Be5Wa3tELi8pcHO5Lv9RZXxgKA=; b=ENVXANBiP/WktVtE/Kshnexbaj
 h/M1eleGgif0bE4vJMsQlIhUPVh+rP0CZtx1fWjl4VkuhRIi4iXxsHcCtZgdrctOlHRerwEm+1cqp
 o7L/MYMjb+wlDFjLWeNNXUKTmZhy8f/g4l9WTePmPZhSyFot0rmMX0PgWFWxKQfgCd8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gKR0wUmsGrUtG7A76Be5Wa3tELi8pcHO5Lv9RZXxgKA=; b=f
 2WOjrglfd2O42yYRT6+WeksJseCc+aQWdnwaFACXaiYTZMTp+c1yFrylBbvN70omVFYmiN+SIQqWm
 snZt4hL32XGCua323xwioZ/SUm2hNFfDpL7EuEtg5mAKfTntJIDzK4JCMu7Y6rrNPrcfNHBynLBA+
 5Qm2yIEJWODThCN8=;
Received: from outboundhk.mxmail.xiaomi.com ([118.143.206.90])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uD0q9-0005eD-7q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 12:59:06 +0000
X-CSE-ConnectionGUID: HlGlh6SzT0+4lZMAXzhypg==
X-CSE-MsgGUID: xqcy+5GfRgOePl/3otAzXA==
X-IronPort-AV: E=Sophos;i="6.15,272,1739808000"; d="scan'208";a="114051464"
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 8 May 2025 20:42:34 +0800
Message-ID: <20250508124235.58858-1-huangjianan@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.237.8.166]
X-ClientProxiedBy: BJ-MBX03.mioffice.cn (10.237.8.123) To YZ-MBX05.mioffice.cn
 (10.237.88.125)
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Otherwise we will get the following error when executing make
 uninstall: make uninstall-hook make[2]: Entering directory
 '/home/huangjianan/code/f2fs-tools/mkfs'
 rm /usr/local/lib/libf2fs_format.so* rm: cannot remove
 '/usr/local/lib/libf2fs_format.so*': No such file or dir [...] 
 Content analysis details:   (0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [118.143.206.90 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [118.143.206.90 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.9 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
X-Headers-End: 1uD0q9-0005eD-7q
Subject: [f2fs-dev] [PATCH 1/2] f2fs-tools: delete only if the
 libf2fs_format.so* exists
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

Otherwise we will get the following error when executing make uninstall:

make  uninstall-hook
make[2]: Entering directory '/home/huangjianan/code/f2fs-tools/mkfs'
rm /usr/local/lib/libf2fs_format.so*
rm: cannot remove '/usr/local/lib/libf2fs_format.so*': No such file or directory
make[2]: *** [Makefile:827: uninstall-hook] Error 1
make[2]: Leaving directory '/home/huangjianan/code/f2fs-tools/mkfs'
make[1]: *** [Makefile:790: uninstall-am] Error 2
make[1]: Leaving directory '/home/huangjianan/code/f2fs-tools/mkfs'
make: *** [Makefile:418: uninstall-recursive] Error 1

Fixes: b067004c92dc ("add configure option --with-root-libdir")
Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
---
 mkfs/Makefile.am | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
index bfffd88..fb7bce8 100644
--- a/mkfs/Makefile.am
+++ b/mkfs/Makefile.am
@@ -27,4 +27,6 @@ install-exec-hook:
 	fi
 
 uninstall-hook:
-	rm $(DESTDIR)$(root_libdir)/libf2fs_format.so*
+	if test -f "$(DESTDIR)$(root_libdir)/libf2fs_format.so*"; then \
+		rm $(DESTDIR)$(root_libdir)/libf2fs_format.so*; \
+	fi
\ No newline at end of file
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
