Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8562DCD44
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 08:58:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:To:Date:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fbh3t10pVXgUlRMg5B7Fgyyg+Hk0j+IXYpaZfIYqW8o=; b=CGtjB8nUlEv6niP3tdrM1H74zi
	7pvIL6e2g/ttz2p3IYoJ+uPBRM/4B63h++9MSjORgIOSBQj44FAyXrCZgVkrtYJZlosLloN3ZABCp
	T1JfupbWV2OmNLGiwfBHedJgXn3M4wz5V9/hkH/DB6TfJ4xuxYmCmUnzApXq4ZB/UqK0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpoAl-0003N0-OH; Thu, 17 Dec 2020 07:58:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <john+kernel+f2fs-devel@zlima12.com>)
 id 1kpoAk-0003Ms-4y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 07:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ou0Cd+5VXhP55Yj8JaogXvrTR0hA7Ktc6pDexJ0SSPk=; b=SK6C7MdkHN469nkH4Jif1Ayc4o
 T5UYO1SvRrinGnBXaa5QYN9CjFk14FjCKXhsDorDlll+g5frPIc/Z5WLpLbpJHpKDxjvOj3LyaJSA
 myli/2bgvS0Sah+QVz9SqVCh1K9uTVGWUx8STDyk92SuscB+QIPsfd0WDu74jwiHIEWw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ou0Cd+5VXhP55Yj8JaogXvrTR0hA7Ktc6pDexJ0SSPk=; b=S
 uDmzvxqtrxeeauEKhfjFPWp000tWhXL0QBDVS4Ts4zsE6NhbvHqqIrIz+SClzrXyNwOWb9hbUCfUu
 dHYixE8wT0a1ISyI2mY/wvQwMmh7wXbolZbi/zpReYYjK86oNIK7fh6Rck6NoGMglgRtQ7rSKpaO4
 qoper+j+t+T6CYbg=;
Received: from smtp.zlima12.com ([107.172.191.159])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpoAf-00HOrc-C8
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 07:58:01 +0000
Date: Thu, 17 Dec 2020 02:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zlima12.com; s=dkim;
 t=1608191871; bh=cypJdOvuFhPcQ3rjufGYexoKffA66NWkGAQ/Sd6ccHU=;
 h=Date:From:To:Subject;
 b=IjhmTRqoSXdUeva6qb3Af2hHoVGDTQCRAtxOrCHXCbpg8JqYBb0Q1siDXCDS9d+MK
 iO4+Z+8S6qjBgYQpCzz8nXIC3dBGZa8GE+o3oWf6Qk7bW/9g39R//dvwcQnJdL6TaO
 lT0GPTZI5DhybQpG88KAXsrMX0HSlFbYTkqMdiuxL4YJkjeKiiqnQs7FEWg7Afq/j2
 Dbu7iWZpndlvEbt1Y/pRigI2ZidQwaxWf70O72yxSTJTkRl0xkiFPeqpgdGNHDEQUk
 Ovwp9HHxEOAvd0vJhizmo8RKOWlDIWfvCoerArdqXrJR53k58ZJXYcGWIxgmaBZjPa
 b3lc57e4hva2w==
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20201217075744.ytylmaawi2fwvxqv@Lima-1.maple.zlima12.com>
MIME-Version: 1.0
Content-Disposition: inline
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
X-Headers-End: 1kpoAf-00HOrc-C8
Subject: [f2fs-dev] [PATCH] mkfs.f2fs.8: Better document the -g argument.
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
From: "John A. Leuenhagen via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "John A. Leuenhagen" <john+kernel+f2fs-devel@zlima12.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

To use Android defaults, you must use `-g android`. However, the man
page previously implied that you need only use `-g`.

Since you must specify `android`, I figured it would be appropriate
to name that field `default-options` in the man page. If there was ever
a reason to have a different set of default options, the `-g` option
could be used with a new `default-options` value, i.e. `-g example`.

Signed-off-by: John A. Leuenhagen <john@zlima12.com>
---
 man/mkfs.f2fs.8 | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index 0aca4dc..c90ebcc 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -32,6 +32,7 @@ mkfs.f2fs \- create an F2FS file system
 ]
 [
 .B \-g
+.I default-options
 ]
 [
 .B \-i
@@ -136,8 +137,14 @@ Force overwrite when an existing filesystem is detected on the device.
 By default, mkfs.f2fs will not write to the device if it suspects that
 there is a filesystem or partition table on the device already.
 .TP
-.BI \-g
-Add default Android options.
+.BI \-g " default-options"
+Use a default set of options.
+The following values are supported:
+.RS 1.2i
+.TP 1.2i
+.B android
+Use default options for Android.
+.RE
 .TP
 .BI \-i
 Enable extended node bitmap.
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
