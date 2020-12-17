Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D92F02DCE1E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 10:15:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A8diFdekP17emVtJCTjCdcTXjK3QWzLSrRgbqgb4Dy0=; b=lvxGIYA4OuiESRukveTEjVPB7O
	reGSxNuFo0pq/0XmRG2NBCtsEDFfejKSFjM9w8ZzS3gV9NlZ3S0d3ANrznPSsSHaX6SuK1Wa00wYX
	eV5OyTG46NmEKaHgL8H4x0klcdW0BES8LAljeaxUpZOB6v5nrk6/vU1bcVgXdnGiFV9g=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kppNe-0003fB-Jx; Thu, 17 Dec 2020 09:15:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <john+kernel+f2fs-devel@zlima12.com>)
 id 1kppNd-0003ez-H3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 09:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wYPFhFjgvHqu/5l9ULgflOPbfPszsGuCONFlnb4CtSg=; b=hcxUAveYTG1j9Dl3UR2cfycdoV
 TubfYvcgb1DnH6Zfz4rsh/zg1rK+fJkVzhrh4rhx/eoZ91OwtHl9GUgmQgAGSmshTzAT97wT0rgeL
 njieE17kQLDR9L+R14fSKqq2aayw9asOF2WUaCVOS/4+8aQjfcwisbbJXczPuUbB8Mlk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wYPFhFjgvHqu/5l9ULgflOPbfPszsGuCONFlnb4CtSg=; b=g
 x/1SIC07V7gWzkg5jGG7dq/hmEUw9x5a8RLzX/tHqL0mbORnbzSWmP1nJpb+0YSKSLvPYc1FuW3+u
 5qIl6mVXIfdnNptP1vgFNyBpVtJooLplV4AhfT/pXMhm97oXz/j2Xp88gVfOKmhIDM2SVF/F9ZtjV
 EDUR3XqSlx/9gxGQ=;
Received: from smtp.zlima12.com ([107.172.191.159])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kppNU-00HVik-Be
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 09:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zlima12.com; s=dkim;
 t=1608196503; bh=KubPd4gnIzOgFcs/vCdDsNiAmQqycrG010DUXMnygB8=;
 h=From:To:Subject:Date;
 b=VBHmI9U8Cw92gDRFpKPB6uNrbPprAN1NExzAdUJLrDXH7b4PeLQjNMVUmFqGAPSlS
 JxIMmcoNDSvPBo9RB8URnAyV087eUYYjTkWpt0xnqVd73oxsqX/hWPRyby7wdb+KTd
 8fRaSe7kpjkTRGNIC74VfiXiFWHFwPZYkJLBpzHbM+OQqHizkfoGQih5rhbJINvVl6
 H4wC+SUIEEht3khchURRS4L2T5MliuAxQRc+/wwRw7NyWKU8q4crr/uiGmN9pgFZFq
 r8inXrl+TWxSDGek8dBJYpAd1Y5062clApEIiOGMBFePDZIANw3NgND+WJMD4P+SaP
 RAdIBNwCvYz1g==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 17 Dec 2020 04:14:57 -0500
Message-Id: <20201217091457.7807-1-john+kernel+f2fs-devel@zlima12.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: zlima12.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kppNU-00HVik-Be
Subject: [f2fs-dev] [PATCH] Miscellaneous cleanup to README.
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
From: john+kernel+f2fs-devel--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: john+kernel+f2fs-devel@zlima12.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "John A. Leuenhagen" <john@zlima12.com>

---
 README | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/README b/README
index 4ea3356..afe334f 100644
--- a/README
+++ b/README
@@ -1,8 +1,8 @@
-F2FS format utilility
+F2FS format utility
 ---------------------
 
-To use f2fs filesystem, you should format the storage partition
-with this utilility. Otherwise, you cannot mount f2fs.
+To use the f2fs filesystem, you should format the storage partition
+with this utility. Otherwise, you cannot mount f2fs.
 
 Before compilation
 ------------------
@@ -17,7 +17,7 @@ You should install the following packages.
 Initial compilation
 -------------------
 
-Before compilation initially, autoconf/automake tools should be run.
+Before initial compilation, autoconf/automake tools should be run.
 
  # ./autogen.sh
 
@@ -47,4 +47,4 @@ How to run by default
 
  $ mkfs.f2fs -l [LABEL] $DEV
 
-For more mkfs options, see man page.
+For more mkfs options, see the man page.
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
