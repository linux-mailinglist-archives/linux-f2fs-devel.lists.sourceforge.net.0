Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47500AF8AA8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jul 2025 10:07:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:To:Date:Message-ID:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2HtFPD7yHLHuVXI8uPHshCL72Vka/8305l2r/eZeIQ4=; b=StJOg4cd5rCNSb8GIgVHDrLZ4y
	AglYYxBMk1XarsiRze9JyR+J92zgj5bbFr1SjYtZovMQXLJPlzyCdi1OoJSg4tUEnbAHoKkechm1z
	VFNRwwLYMDbwO2sj90t99bJ1jkHim3CKd7jFiaRSzKG+Kml1Ve8XPY9RFBMFiBuwyJng=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXbSI-0004P6-4M;
	Fri, 04 Jul 2025 08:07:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dominik.lotka@fintara.pl>) id 1uXbSG-0004O8-RJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 08:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=; b=aR4dCedNcIwFPJN7jhj8OeFrjD
 pwvI8fKv6VrSL++V5FLzpkOsEx0jcuXpfvcjZBJNQiAddcR4hiX4y7JxMGYtAXcAAXs0QRU9kAXi6
 gn01IoC2SBwgk4VPOuzG7WFiMeoq05m6V2L3oeGtXw3+6S3xv/TQDHH01IK6uWYoKyN0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=; b=a
 SXzhNdfjno5a+NU49l+aYuNf7jmr8W215GRjAYi6ConreBgxCsmugXX/OBmDJTyIr/ktPwXMz3X7G
 e21e+ywqBeWCnnWKibGNle4C8KZGgONo1yaHUb+mgds01zdI5elA4ldsBp53zz/aqxiFD0A6t2AdO
 g6uhZl2CfAuZcUqA=;
Received: from mail.fintara.pl ([51.68.214.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uXbSG-0003yO-DN for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 08:07:32 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
 id 3C4304C3C9; Fri,  4 Jul 2025 10:06:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
 t=1751616441; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
 h=Date:From:To:Subject:From;
 b=uXWv+y/rW4dipgyXTT+VS2L8xXS59kspYSAbWs6eKdiprbNpg9bRBw6PqY1hDRC2v
 8vyAqtuRIm7N2xth3ih9Xf9rOFuz2zWnmahzzMbhIGpKVL5C7paKvbTr2LTjnMO2eY
 M5oSav9vdBRtpfSBR3NmxOYd/t/DXZKvRGn1aaF5cPbkiDMX5Qh/ioDdE9pZE6ksJP
 yzo81pe6rQDKAPRqgW1t3s6vOncy2E/6nl1dcL5J4e0HRreWiKnTP7+NC5q5X/POEs
 IzI/70STuDFdP8ZJ2YsvryPes+UsR1ZEacgWMV4RWSwA5L43fKKrxSt8eRVowts90U
 M/wnTwxf9HmeA==
Received: by mail.fintara.pl for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  4 Jul 2025 08:05:42 GMT
Message-ID: <20250704084500-0.1.ah.2ql65.0.lv4j0io714@fintara.pl>
Date: Fri,  4 Jul 2025 08:05:42 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dzień dobry, Czy jest możliwość nawiązania współpracy
    z Państwem? Z chęcią porozmawiam z osobą zajmującą się działaniami
    związanymi ze sprzedażą. 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [51.68.214.200 listed in wl.mailspike.net]
X-Headers-End: 1uXbSG-0003yO-DN
Subject: [f2fs-dev] =?utf-8?q?Prosz=C4=99_o_kontakt?=
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
From: Dominik Lotka via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dominik Lotka <dominik.lotka@fintara.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpEb21pbmlrIExvdGthCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
