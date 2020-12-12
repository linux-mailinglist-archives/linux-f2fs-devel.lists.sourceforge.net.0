Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AF32D83E0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Dec 2020 02:39:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:To:Date:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uCF6gMu6RItNCd5ntqisxXt78e1pCFDWIdQ5Gn4iEt4=; b=XLMjEquEkZpe7ANYtcKJezR/5o
	AQjUtxJnw3vySfz0FmeQIAZoyimahUhti4S7XdJE64LBg0wqFLICeIWuJcADMG0h80ZV460RD14Hf
	mmI+XVa43qbPgrWHlwAVLMjOlYd8Rj+3917i9Xjxa7hdLTTe2pF0CJrbpDjsunh/ixe0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kntt2-0000gY-EP; Sat, 12 Dec 2020 01:39:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <john+kernel+f2fs-devel@zlima12.com>)
 id 1kntt0-0000gR-BL
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 12 Dec 2020 01:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cuPx4PEc6PGyfqRu2rQ2B56KOVM1ECe63afoYemfQ2Q=; b=ZF3YMg8enRbtMI/rP58cGtBF09
 uPHvjlZUyzR4VOXiHnL6iQ9YR1w2pwdHc5qIldtlR2QRwuJYyHvoKOx+6LRPDHSTeAElRCxhaMz72
 1hm/BMqoX9woGj0Tla6TQ585zFT1ri/GFB1QVyw/ycElW0euleq+O6nbABX4xInMkDt8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cuPx4PEc6PGyfqRu2rQ2B56KOVM1ECe63afoYemfQ2Q=; b=C
 zk93CcZhODsBXDt1gwL/OLM67guUHWNULlz/DP7a37VS1J3fTQSup6e1K3hd5Wm9cplerpNWuOhsK
 2attjNMMLIIqJLD1Pr2k6a1wfN97dnPyZECt0YP6oON0gxxw3WN+qejVxtScYXKDUuuOnk3b7/S0p
 Teimv2wGXnN8Qrxc=;
Received: from smtp.zlima12.com ([107.172.191.159])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kntsq-008oos-To
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 12 Dec 2020 01:39:50 +0000
Date: Fri, 11 Dec 2020 20:39:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zlima12.com; s=dkim;
 t=1607737166; bh=slW+o1esgodHnoZ17XrHQg0P1PEOUSZTEVSM2dfnYbY=;
 h=Date:From:To:Subject;
 b=Sc7y9mYUgBbSqv4M5wwRH3p/OLWIepf4zJ7/bp8Ch1qoI9rSZF875+172iAchB0Rq
 2kLDR/wI64tfRUHjMqaEhQL2cJZV2+lGQont2rdoqWju89jG1vP30ybzTyUxbwtLPs
 L7r4B4cvIbocmnL94s7o7+4fuuzg13cvVV2qi1pIikHlol3yGKy0i2uGr5rXaoCQ1+
 GSWpX3yTjdPZg57GvYhRx1X3j2qnbsw2hFKK91pu9OVNfRyp/95QgcQGjiYOUEB2OU
 RKVZcEXXS9x/JbZUduZASTwkxI86vcfPpkfluwUSSJ+4Ptr1JguMMF7BuGVS9nI/uR
 gHk4W5XkLzSSw==
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20201212013923.dttfua6jyiu2wxqj@Lima-1.maple.zlima12.com>
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
X-Headers-End: 1kntsq-008oos-To
Subject: [f2fs-dev] [PATCH] mkfs.f2fs.8: fix formatting for -l parameter in
 man page
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

Signed-off-by: John A. Leuenhagen <john@zlima12.com>
---
 man/mkfs.f2fs.8 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index 0aca4dc..8c57216 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -141,6 +141,7 @@ Add default Android options.
 .TP
 .BI \-i
 Enable extended node bitmap.
+.TP
 .BI \-l " volume-label"
 Specify the volume label to the partition mounted as F2FS.
 .TP
-- 
2.29.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
