Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C167BB2FDE4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Aug 2025 17:12:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WB1bggoHf+lnsiwiz/L5SveNNxRTJCOa3M2lv/YDbFg=; b=V0yhBCOQATwU0LToe10eZoA2dJ
	wM2vD1wjwPWzttmPZFiJm3+GTlMmhA2gfS4wz8WrP/Ta+kHJ5iPM7AsVDcVV/MiNxXXuBtEsMYT8c
	99SXC6bEXkINBNrOjS4gxa06Mz8Lp1tl5KXCs0MWpAMa7SrRQloOSL5/4qvQnM5hV+2w=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1up6xP-0000Qt-77;
	Thu, 21 Aug 2025 15:12:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nancymc@exwire.com>) id 1up6xN-0000QJ-3c
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Aug 2025 15:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E2sh7PkU99v95gXhyMFBk9zs8wQA9SBmo0ZEWgF1/ao=; b=GWlaOsUFiedHb1qCjnCYl/EESN
 tvX/xWeVkE5hwzwl6Gt197TgbZPDiJcAU/liB3514mVGPoON9xRoInENYrIjbhIpK3YvRK49hwMSA
 ut22qLqMC0wBKsSi5ZTaxPiuSHWUmxJDc8MfKudHOJpMIcyehWcl7nlTG22Kwyiht5S8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=E2sh7PkU99v95gXhyMFBk9zs8wQA9SBmo0ZEWgF1/ao=; b=V
 lRIH2sdczAqSfBHtI9mELr7N+3ZVdtkt/2kn/rmPoB6hGQMYN5CJAWJUjzVhcc6UXhY/Uon8h1jsd
 YOSqYp3Bd1DGt5TOV+VxnP4ShnG7f2xrX0MZC9FqBp4OnSELHrqKgk9MgCSSXNzv0patc8IMgr4Ig
 InmSqt57TH+jJivI=;
Received: from securitygw1.exwire.com ([216.171.192.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1up6xM-0001RV-O2 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Aug 2025 15:12:01 +0000
X-Spam-Status: No
X-exwire-MailScanner-EFA-Watermark: 1756380468.40601@aSUTsixRlJWaT68hcO2nOw
X-exwire-MailScanner-EFA-To: linux-f2fs-devel@lists.sourceforge.net
X-exwire-MailScanner-EFA-From: nancymc@exwire.com
X-exwire-MailScanner-EFA-SpamScore: ssssssss
X-exwire-MailScanner-EFA: Found to be clean
X-exwire-MailScanner-EFA-ID: 7718524AF68.A4FE4
X-exwire-MailScanner-EFA-Information: Please contact jdeverse@exwire.com for
 more information
Received: from smtp01.exwire.com (smtp01.exwire.com [216.171.192.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by securitygw1.exwire.com (Postfix) with ESMTPS id 7718524AF68
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Aug 2025 04:27:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 securitygw1.exwire.com 7718524AF68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=exwire.com;
 s=default; t=1755775667;
 bh=HV6ngFc0kAPeZqm3RhmqrUX5EZoxx49VvdfM3cgWoeI=;
 h=Reply-To:From:To:Subject:Date:From;
 b=Gqjn7ywbwhiJ6ZeTmNTFTGFICSDR4URlheXLLLXJjuYYbvqVNtnwIW72kVaDXdtjp
 7sh9PYQ6eq+3XDGbnNK3iScd9TJt0xj0b/KOxL8wdpFpWTLb+qTV+GQjfpq7LnPBj7
 rqpGJ0njQTdg0PKgzPzo87GZQwoNZvFFHDSEPmhw=
Received: from localhost (localhost [127.0.0.1])
 by smtp01.exwire.com (Postfix) with ESMTP id DD6A6525D94
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Aug 2025 02:43:36 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.exwire.com
Received: from smtp01.exwire.com ([127.0.0.1])
 by localhost (smtp01.exwire.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3tTjKHbqN8ir
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Aug 2025 02:43:36 -0700 (PDT)
Received: from [45.138.16.152] (unknown [45.138.16.152])
 by smtp01.exwire.com (Postfix) with ESMTPSA id 93D99582598
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Aug 2025 23:25:29 -0700 (PDT)
To: linux-f2fs-devel@lists.sourceforge.net
Date: 20 Aug 2025 23:25:29 -0700
Message-ID: <20250820232528.DEE7397B5FA0B093@exwire.com>
MIME-Version: 1.0
X-Spam-Score: 5.5 (+++++)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Wir freuen uns, Ihnen mitteilen zu können, dass Sie zu den
    Gewinnern der jüngsten SuperEnalotto-Ziehung in Zusammenarbeit mit Lotto24,
    EuroMillions und Powerball gehören. Sie haben einen einmaligen [...] 
 
 Content analysis details:   (5.5 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  1.1 DATE_IN_PAST_03_06     Date: is 3 to 6 hours before Received: date
  0.0 LOTS_OF_MONEY          Huge... sums of money
  1.8 MONEY_NOHTML           Lots of money in plain text
  0.3 MONEY_FREEMAIL_REPTO   Lots of money from someone using free email?
  2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1up6xM-0001RV-O2
Subject: [f2fs-dev] [SPAM] xl
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
From: nancymc--- via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: info.superenalotto@gmail.com
Cc: nancymc@exwire.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

V2lyIGZyZXVlbiB1bnMsIElobmVuIG1pdHRlaWxlbiB6dSBrw7ZubmVuLCBkYXNzIFNpZSB6dSBk
ZW4gCkdld2lubmVybiBkZXIgasO8bmdzdGVuIFN1cGVyRW5hbG90dG8tWmllaHVuZyBpbiBadXNh
bW1lbmFyYmVpdCAKbWl0IExvdHRvMjQsIEV1cm9NaWxsaW9ucyB1bmQgUG93ZXJiYWxsIGdlaMO2
cmVuLiBTaWUgaGFiZW4gZWluZW4gCmVpbm1hbGlnZW4gR2V3aW5uIHZvbiDigqwzLjg1MC4wMDAg
IGluIGRlciB6d2VpdGVuIEdld2lubmtsYXNzZSAKZ2V3b25uZW4uIFVtIElocmVuIEdld2lubiBh
Ynp1d2lja2Vsbiwgc2VuZGVuIFNpZSB1bnMgYml0dGUgCmZvbGdlbmRlIEluZm9ybWF0aW9uZW4g
cGVyIEUtTWFpbDoKClZvbGxzdMOkbmRpZ2VyIE5hbWU6IExhbmQ6IFdvaG5hZHJlc3NlOiBBbHRl
cjogR2VzY2hsZWNodDogQmVydWY6IApIYW5keW51bW1lcjogV2hhdHNBcHAtTnVtbWVyLgoKSW0g
TmFtZW4gZGVyIE9ubGluZS1Mb3R0ZXJpZWFidGVpbHVuZ2VuIFN1cGVyRW5hbG90dG8sIApFdXJv
TWlsbGlvbnMgdW5kIFBvd2VyYmFsbCBncmF0dWxpZXJlbiB3aXIgSWhuZW4gaGVyemxpY2ggenUg
CklocmVtIEdld2lubi4KCk1pdCBmcmV1bmRsaWNoZW4gR3LDvMOfZW4KCkZyYXUgS2F0aGVyaW5l
IEZlZGVyaWNvCkxlaXRlcmluIE9ubGluZS1aYWhsdW5nZW4gLyBWYWxpZGllcnVuZ3NtYW5hZ2Vy
aW4KQ29kZS1OYWNocmljaHQ6IDczN0dIUzk4CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
