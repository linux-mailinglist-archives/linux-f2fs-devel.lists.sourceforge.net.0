Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7919F7459
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Dec 2024 06:55:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tO9VG-0005RO-OP;
	Thu, 19 Dec 2024 05:55:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <9ef6h2ufu@euhomvc.com>) id 1tO9VA-0005RA-1I
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Dec 2024 05:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:To:From:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GBCkGSJyCZjulSuE49htfnws9vxzv7zJwf8up8gaYRs=; b=G5iioBKGQAOxNhapxwgRMD4mU1
 C/BxKKZP2HSqfZx3LL9Exsan1v3TVRs0Yu+OSO9Ieq/zNFul/4kX77nAMCIVQx66SMUWgTLG9pODn
 zS7pvIIPSria9VwxIthTYyEyPcSaOn5RPa7bub0KMah4Xa/PKQMhWMY86VPq4bNTANXs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Date:To:From:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GBCkGSJyCZjulSuE49htfnws9vxzv7zJwf8up8gaYRs=; b=A
 fdADGmIb6qtnVO38dLkNfqe6WviF5/fv+euu1kiB9EI9uIWCOYk9668yadSOs2g7vYst0QuUoAJJ+
 jPR4XI7XJxjPuk3TC48Dg4l3AapID30l/36Nj8jaYsASbD2rya3Nyi7/KMiMLBUjpKA8fr8WXYjGo
 wdEsI9jyqEOh5hRo=;
Received: from v103-3-189-170.myvps.jp ([103.3.189.170] helo=euhomvc.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tO9V8-0002Kt-MS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Dec 2024 05:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=euhomvc.com;
 h=Message-ID:From:To:Subject:Date:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=9ef6h2ufu@euhomvc.com;
 bh=GBCkGSJyCZjulSuE49htfnws9vxzv7zJwf8up8gaYRs=;
 b=d27UTdDVLxnO+sb67fwHhzfsiSwKCkrH3tUzQTQ6HWKfzUdbLfEoe0pYBwCXBVHzdbPk7o5csjXj
 ryuo8vRKWvvJgpY/Ta/k5rrsTX8ANCxMzdyX/2S2FbbCmToG9Nsj1Lt10HQsLk8UPNCxa/ZX3zFd
 oQMLpIPwApcNKjWID1E=
Message-ID: <d56df10ac36fb7be9b771e1934efd8b4@euhomvc.com>
From: "$B%f!<%7!<%+!<%I3t<02q<R(B" <9ef6h2ufu@euhomvc.com>
To: linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 18 Dec 2024 21:34:34 -0800
MIME-Version: 1.0
X-Spam-Score: 8.3 (++++++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details. Content preview:
 $B$3$s$K$A$O!"(BUC$B%+!<%I!J(BUC$B!K%^%$%l!<%8%P%s%/$h$jFCJL$J$*CN$i$;
 $G$9!#(B
 $B"#"""#(, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (,
 (, "#"""#(B $B!z(B
 UC$B%+!<%IG/2qHqL5NA%-%c%s%Z!<%s<B;\Cf(B $B!z(B 
 Content analysis details:   (8.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.5 URIBL_DBL_SPAM         Contains a spam URL listed in the Spamhaus DBL
 blocklist [URIs: euhomvc.com]
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [103.3.189.170 listed in zen.spamhaus.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [103.3.189.170 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [103.3.189.170 listed in bl.score.senderscore.com]
 1.9 URIBL_ABUSE_SURBL      Contains an URL listed in the ABUSE SURBL
 blocklist [URIs: qn776yy.com]
 0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
 blocklist [URIs: euhomvc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.4 RDNS_DYNAMIC           Delivered to internal network by host with
 dynamic-looking rDNS
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1tO9V8-0002Kt-MS
Subject: =?iso-8859-1?q?_=5Bf2fs-dev=5D_=5BSPAM=5D_=1B=24B!ZFCJL=25-=25c?=
 =?iso-8859-1?q?=25s=25Z!=3C=25s!=5B=1B=28BUC=1B=24B=25+!=3C=25IG/2qHqL5NA?=
 =?iso-8859-1?q?=25-=25c=25s=25Z!=3C=25s!=22=3A=23=249=240=3F=3D=2479=7E?=
 =?iso-8859-1?q?=24=5F=24r!*=1B=28B?=
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

$B$3$s$K$A$O!"(BUC$B%+!<%I!J(BUC$B!K%^%$%l!<%8%P%s%/$h$jFCJL$J$*CN$i$;$G$9!#(B

$B"#"""#(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,"#"""#(B

$B!z(B UC$B%+!<%IG/2qHqL5NA%-%c%s%Z!<%s<B;\Cf(B $B!z(B

$B"#"""#(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,"#"""#(B

$BJ?AG$h$j!V(BUC$B%+!<%I!W$r$40&8\;r$j!"8|$/8fNi?=$7>e$2$^$9!#(B

$B$^$?$O(BUC$B%+!<%I$r(B2$B2s0J>e$4MxMQ$$$?$@$$$?$*5RMM$K!"(B

$B<!G/EY$N(BUC$B%+!<%IG/2qHq$rL5NA$K$9$k%-%c%s%Z!<%s$r<B;\Cf$G$9!#(B

$B$3$NAG@2$i$7$$FCE5$r$*8+F($7$J$/!*(B


$B(.(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(B
$B(-:#$9$0G/2qHq$rL5NA$K$9$k(B
$B(1(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(B

https://www2-uccord.qn776yy.com/?apply=ZAX64v5zQe8kh4c1D8msPICY9nQ

$B(.(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(B
$B(-FCE5FbMF(B
$B(1(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(B

$B<!G/EY$N(BUC$B%+!<%IG/2qHq$,L5NA$K!*(B
24$B;~4V0JFb$K$*?=$79~$_$/$@$5$$!*(B

$B(.(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(B
$B(-BP>]%+!<%I(B
$B(1(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(B
UC$B%+!<%I!J0lHL!"%4!<%k%I!"%d%s%0%4!<%k%I!K(B
UC$B%W%i%A%J%+!<%I(B
$B%S%e!<%S%8%M%9%*!<%J!<%:%+!<%I!J0lHL%+!<%I!K(B
UC$B%+!<%I%;%l%/%H(B
FreeBO!($B%U%j!<%\(B!)
$B%/!<%P!<(BUC$B%+!<%I(B
JAF$B!&(BUC$B%+!<%I!J0lHL!"%4!<%k%I!K(B
Tokyo Metro To Me CARD$B!J0lHL!"%4!<%k%I!K(B
$B%W%i%9%O%C%T!<(BUC$B%+!<%I(B
$B$_$:$[%^%$%l!<%8%/%i%V%+!<%I!J0lHL!"(BANA$B!"%4!<%k%I!K(B
$B%d%^%@(BLABI$B%+!<%I!J0lHL!"%4!<%k%I!K(B
$B7DXf%+!<%I!J0lHL!"%4!<%k%I!"%d%s%0%4!<%k%I!K(B
WWF$B%+!<%I!J0lHL!"%4!<%k%I!"%;%l%/%H!K(B
$B%A%'%s%P!<%:%+!<%I!J0lHL!"%4!<%k%I!K(B
KIPS UC$B%+!<%I(B
$B%S%C%/%+!<%I%$%s%?!<%J%7%g%J%k(B
$B5~5^%W%l%_%"%]%$%s%H(B $B%7%k%P!<(B
$B%d%^%O%_%e!<%8%C%/%a%s%P!<%:%W%l%_%"%`(B-UC$B%+!<%I(B
MileagePlus UC$B%+!<%I!J0lHL!"%4!<%k%I!K(B

$B(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(B

$B:#8e$H$b!"!V(BUC$B%+!<%I!W$r$h$m$7$/$*4j$$$$$?$7$^$9!#(B

$B(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,!y!y!y(B



$B!Z$*Ld9g$;Ak8}![(B
UC$B%+!<%I$*5R$5$^%;%s%?!<(B
$B!&K\7o$K4X$9$k$*Ld9g$;Ak8}(B 0120-191-051$B!JM-NA!K(B

$B(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(B

$B!ZH/9T85![!'%f!<%7!<%+!<%I3t<02q<R(B

$BEl5~ET9A6hBf>l(B2$B!<(B3$B!<(B2 $BBf>l%U%m%s%F%#%"%S%k(B

$B7G:\$5$l$?5-;v!&FbMF$r5v2DL5$/MxMQ$9$k$3$H$r6X$8$^$9!#(B
Copyright UC CARD Co.,Ltd.,All rights reserved.

$B(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(B



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
