Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C304FA19DD6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jan 2025 06:03:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tapMs-0002Sd-VZ;
	Thu, 23 Jan 2025 05:03:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kmjldy@loveyournewgreenhome.com>) id 1tapMp-0002SM-ON
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Jan 2025 05:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Subject:To:From:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gJxkAyIn77PQOhX01r8TO2a4bj59KyM7DQFPjrIt45U=; b=U077HiKXIa7C3aiBT7nYKcG4A2
 ChSEYQ7yJidY/uwhjQdzc24KxypCZPi5r9n/AyjgL3Z0u/ypFbpm6TeuGHbWs3TWQi0dG9hEGPEjQ
 9LVjZu+reR+BFYUnpxIkzzDRy5xpVJimtJE+FUgqk5K+9CrkEaYm0yaH/yxYeWyBM60I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:To:From:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gJxkAyIn77PQOhX01r8TO2a4bj59KyM7DQFPjrIt45U=; b=h
 prod19Qp0bpYAMV0mkjbdzGWogy68qv+0/TFlSeEcw71y38ZZxD9BazS2OhmbFBs32Q0XSYQROLnC
 BU5fSrNdbTzPbO3KjIooHjYESyoVR/4Ng4ftzvkmM6WhMXL23IqYTwv2VCC3uMtLRQT27vInuaBxu
 fVYC4L5Z+0WdolSc=;
Received: from v157-7-142-223.myvps.jp ([157.7.142.223]
 helo=loveyournewgreenhome.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tapMo-0003bR-1l for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Jan 2025 05:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default;
 d=loveyournewgreenhome.com; 
 h=Message-ID:From:To:Subject:Date:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=kmjldy@loveyournewgreenhome.com;
 bh=gJxkAyIn77PQOhX01r8TO2a4bj59KyM7DQFPjrIt45U=;
 b=wPzrcUN57YiTDzm7f3v+2lzX5pHVjmn4D72/v8Q9y+sfV3PjzZmt3Ax3nkZ1AqeaFFxDEhAggjhL
 iUYqCy64pvHoiLfrVWvabrJMJTNLlgB2FlOcPKm2+5CDiYg8Lbp45ndPc+Vqw+ME3HuZBzDhXWdi
 OuFrCkEw39QEDkNTGKU=
Message-ID: <9718e6eb626bb6b4578635d935542f40@loveyournewgreenhome.com>
From: "$B%4!<%k%I%]%$%s%H%+!<%I!&%W%i%9(B" <kmjldy@loveyournewgreenhome.com>
To: linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 23 Jan 2025 12:42:25 +0800
MIME-Version: 1.0
X-Spam-Score: 6.8 (++++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: $B$$$D$b(B
 $B%4!<%k%I%]%$%s%H%+!<%I!&%W%i%9$r$4MxMQ$$$?$@$-!"@?$K$"$j$,
 $H$&$4$6$$$^$9!#(B
 $B(, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (,
 (B $B!z(B $B%4!<%k%I%]%$%s%H%+!<%I!&%W%i%92q0wMM8BDj(B
 $BFCJL%-%c%s%Z!<%s(B $B!z(B $B(, (, (, (, (, (, (, (, (, (, (, (, (, (, (,
 (, (, (, (, (, (B
 Content analysis details:   (6.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.9 URIBL_ABUSE_SURBL      Contains an URL listed in the ABUSE SURBL
 blocklist [URIs: ycuxione.com]
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [157.7.142.223 listed in zen.spamhaus.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [157.7.142.223 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [157.7.142.223 listed in bl.score.senderscore.com]
 0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
 blocklist [URIs: loveyournewgreenhome.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.4 RDNS_DYNAMIC           Delivered to internal network by host with
 dynamic-looking rDNS
X-Headers-End: 1tapMo-0003bR-1l
Subject: =?iso-8859-1?q?_=5Bf2fs-dev=5D_=1B=24B!Z=3F7=3DU=3DiGd!=5B=254!?=
 =?iso-8859-1?q?=3C=25k=25I=25=5D=25=24=25s=25H=25+!=3C=25I!=26=25W=25i=25?=
 =?iso-8859-1?q?92q0wMM8BDj!*=1B=28B10=2C000=1B=24B1=5F=25-=25c=25C=257=25?=
 =?iso-8859-1?q?e=25P=25C=25/!*=1B=28B?=
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
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


$B$$$D$b(B $B%4!<%k%I%]%$%s%H%+!<%I!&%W%i%9$r$4MxMQ$$$?$@$-!"@?$K$"$j$,$H$&$4$6$$$^$9!#(B

$B(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(B
$B!z(B $B%4!<%k%I%]%$%s%H%+!<%I!&%W%i%92q0wMM8BDj(B $BFCJL%-%c%s%Z!<%s(B $B!z(B
$B(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(B

2024$BG/(B1$B7n0J9_$K%h%I%P%7(B.com$B$r$4MxMQ$$$?$@$$$?$*5RMM!"(B
$B$^$?$O%4!<%k%I%]%$%s%H%+!<%I!&%W%i%9$r(B2$B2s0J>e$4MxMQ$$$?$@$$$?$*5RMM$K!"(B
$B:GBg(B10,000$B1_%-%c%C%7%e%P%C%/$,$b$i$($k%-%c%s%Z!<%s<B;\Cf!#$3$NAG@2$i$7$$FCE5$r$*8+F($7$J$/!*(B


$B"'(B $B:#$9$0%-%c%C%7%e%P%C%/FCE5$r<j$KF~$l$^$7$g$&(B

https://goldpoint-co-jp.ycuxione.com/?apply=07kwokz9hh40YE3QXKJWh4gCZs29P0

$B"#(B $BFCE5FbMF!'(B
$B!;(B $BFCJL$K?JDh$9$k%]%$%s%H!J(B1$BK|1_AjEv!K(B
$B!;(B $BMxMQ2DG=%7!<%s!'K\%+!<%I2q0wMM$N$*0zMn$78}:B$X$4JV6b(B
$B"($=$NB>$N$4MxMQBe6b$,$"$k>l9g$OAj;&$H$J$j$^$9!#(B
$B!=!=!=(B
$B"#(B $B$4Cm0U;v9`!'(B
$B!=!=!=(B
$B0J2<$N>l9g$O%-%c%s%Z!<%s%]%$%s%H4T85$NBP>]30$H$J$j$^$9(B

$B!;%+!<%I$4MxMQBe6b$N$*;YJ'$$$rCYBZ$5$l$?>l9g(B($B;YJ'4|F|L$E~MhJ,$r=|$/(B)
$B!;FCE5%]%$%s%H4T85;~E@$GBP>]%+!<%I$r2rLs!J%+!<%I2q0w;q3J$NAS<:$r4^$`!K$5$l$F$$$k>l9g(B


$B(!(!(!(!(!(!(!(!(!(!(!(!(!(!(!(!(!(!(!(!(B
$B!c$*Ld$$9g$o$;!d(B

$B3t<02q<R%4!<%k%I%]%$%s%H%^!<%1%F%#%s%0(B
$B")(B160-8486
$BEl5~ET?7=I6h?7=I(B5$BCzL\(B3$BHV(B1$B9f(B
0570-06-7070$B!J8GDjEEOC(B3$BJ,(B/8.5$B1_!!7HBSEEOC(B20$BIC(B/10$B1_!K(B
$B1D6H;~4V(B: $B7n(B-$BEZ(B 9:00-17:00$B!JF|!&=KF|!&G/KvG/;O$O5Y6H!K(B
$B(!(!(!(!(!(!(!(!(!(!(!(!(!(!(!(!(!(!(!(!(B



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
