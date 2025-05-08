Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5AFAAFABD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 14:59:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Le/AlXkBtCXql2A2DXR3/7DfcOGy8UVQGdE5GvjYyBc=; b=UHk925xyHIZ4TXRSuFk1kfO4gr
	lrN02Z/bTKOk9fjVf4pvBcqytrp4qfhVGusVExzl54yzCA/k8CvqKlrVO9yktK2sYrWqEAHRpBWBW
	jIoSPFOuB5UAC3fRgnhJoKpoMC6VT8+FqUVE395lVj3RRDhZQ50uYYlQuwNLyeHQblwY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uD0qA-0006af-3o;
	Thu, 08 May 2025 12:59:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1uD0q8-0006aW-Me
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 12:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jDHrx8CsSHVMNpB8kI2nIJeMeBfc8b0ndgxmwRLLVwM=; b=gu0B3hWAdzZ5c709zjqjkFwCDf
 CGqKwh5+4gHd1wkvqqxlknItVoCtdug/y4LGWVvAAys0sIliFzXx3a2Px7S8PA/sti9q+eY5dINW5
 4O3djRdmSuyMSuCU5WeC5mKY9q9Ke0xsDuRITB3iPP/6dOsYEgq2T4AXBZ+/noEuXieI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jDHrx8CsSHVMNpB8kI2nIJeMeBfc8b0ndgxmwRLLVwM=; b=SpBDLKx7NqQ+CyeGd+QbuPEwwJ
 zYgRHFQo1CIa20OwykSRBTKxCXOVG22ZjNLXZxfVq8mxlQAATjg5/xfsBIWGiQfC3nJCmv15d6gRG
 XWjR0KftUgjEydndH3UhQ0euHWeD45qssKkqxpjoM9hJJvtK4Dd71xCZGYAOtsHBLKFg=;
Received: from outboundhk.mxmail.xiaomi.com ([207.226.244.123])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uD0q7-0005e6-PM for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 12:59:04 +0000
X-CSE-ConnectionGUID: XTc2FjkwROOutUX9/LHxFQ==
X-CSE-MsgGUID: TnwNd7+xT8aKukVHJd7IuQ==
X-IronPort-AV: E=Sophos;i="6.15,272,1739808000"; d="scan'208";a="139551818"
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 8 May 2025 20:42:35 +0800
Message-ID: <20250508124235.58858-2-huangjianan@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508124235.58858-1-huangjianan@xiaomi.com>
References: <20250508124235.58858-1-huangjianan@xiaomi.com>
MIME-Version: 1.0
X-Originating-IP: [10.237.8.166]
X-ClientProxiedBy: BJ-MBX03.mioffice.cn (10.237.8.123) To YZ-MBX05.mioffice.cn
 (10.237.88.125)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise,
 some lonely soft links will be left in /usr/local/bin.
 Signed-off-by: Jianan Huang <huangjianan@xiaomi.com> --- fsck/Makefile.am
 | 8 ++++++++ 1 file changed, 8 insertions(+) diff --git a/fsck/Makefile.am
 b/fsck/Makefile.am index ea3b26a..f0d7f87 100644 --- a/fsck/Makefile.am +++
 b/fsck/Makefile.am @@ -21,3 +21,11 @@ install-data-hook: ln -sf fsck.f2fs
 $(DESTDIR)/$(sbindir [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1uD0q7-0005e6-PM
Subject: [f2fs-dev] [PATCH 2/2] f2fs-tools: clean up dump.f2fs etc. when
 uninstall
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

Otherwise, some lonely soft links will be left in /usr/local/bin.

Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
---
 fsck/Makefile.am | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fsck/Makefile.am b/fsck/Makefile.am
index ea3b26a..f0d7f87 100644
--- a/fsck/Makefile.am
+++ b/fsck/Makefile.am
@@ -21,3 +21,11 @@ install-data-hook:
 	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/sload.f2fs
 	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/f2fslabel
 	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/inject.f2fs
+
+uninstall-hook:
+	-rm -f $(DESTDIR)/$(sbindir)/dump.f2fs
+	-rm -f $(DESTDIR)/$(sbindir)/defrag.f2fs
+	-rm -f $(DESTDIR)/$(sbindir)/resize.f2fs
+	-rm -f $(DESTDIR)/$(sbindir)/sload.f2fs
+	-rm -f $(DESTDIR)/$(sbindir)/f2fslabel
+	-rm -f $(DESTDIR)/$(sbindir)/inject.f2fs
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
