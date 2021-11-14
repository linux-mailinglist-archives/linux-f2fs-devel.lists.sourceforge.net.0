Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7F344F9E6
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Nov 2021 19:08:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mmJvK-00045F-FB; Sun, 14 Nov 2021 18:08:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <info@smbc-card.com>) id 1mmJvJ-000459-MC
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 14 Nov 2021 18:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Subject:To:From:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pOflaWTncEjDVSIxbUHVAwPscWyQX/oW+W5V+fHRzqY=; b=lHuFN6Skg6R98EMS1wpDop0rVa
 HLBKSRfIa3KYqokaaX17mHjN+GjjNY+tIpaW/F/ctYjjvLz1zg930Rec55Jqdz9KNELJmKO8ItxvC
 l9OKxAzEzyB7J2kArYdS4rvHuxUFm6/IhK0NU2NPUmA5eMVdlvmErE2MjZoZYvhlkMek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:To:From:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pOflaWTncEjDVSIxbUHVAwPscWyQX/oW+W5V+fHRzqY=; b=O
 OCV1W0PoB2uyN6syFu7/ZnVhB9HF/vG6Erv2oE4jkPNFsk5gkb7Lvhhb/LtoUc8EURqhROzpd2kIC
 uQycgle2kNwPYXqmuJ360eiGjv4c0epYsANqosDphZphsNm7Gr7+hBerKmm4DApUBRoLUhtPZOwDu
 qMG5uTL2VqCCHByc=;
Received: from [107.150.117.139] (helo=smbc-card.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1mmJvJ-0006ze-SS
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 14 Nov 2021 18:08:14 +0000
Message-ID: <20211114190813534087@smbc-card.com>
From: =?utf-8?B?5LiJ5LqV5L2P5Y+L44Kr5LiA44OJ?= <info@smbc-card.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Sun, 14 Nov 2021 19:08:03 +0100
MIME-Version: 1.0
X-mailer: Hcjkfsz 5
X-Spam-Score: 7.2 (+++++++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  この度はVpassにご利用いただき。 にご注意ください
    あなたのクレジットカードは取引1証明書を受け取りました(JPY
    6,9800),Vpassパスワードにてご本人確認を 行う場合があります。
    ぜひ、お早めにご確認� [...] 
 
 Content analysis details:   (7.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  3.6 RCVD_IN_PBL            RBL: Received via a relay in Spamhaus PBL
                             [107.150.117.139 listed in zen.spamhaus.org]
  0.5 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
                             [107.150.117.139 listed in dnsbl-1.uceprotect.net]
  1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
  0.9 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
  1.3 RDNS_NONE              Delivered to internal network by a host with no rDNS
X-Headers-End: 1mmJvJ-0006ze-SS
Subject: [f2fs-dev] =?utf-8?b?VnBhc3PmnKzkurrnorroqo3jga7jgYrnn6XjgonjgZs=?=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCg0K44GT44Gu5bqm44GvVnBhc3PjgavjgZTliKnnlKjjgYTjgZ/jgaDjgY3jgIINCg0KDQoN
CuOBq+OBlOazqOaEj+OBj+OBoOOBleOBhA0KDQoNCg0K44GC44Gq44Gf44Gu44Kv44Os44K444OD
44OI44Kr44O844OJ44Gv5Y+W5byVMeiovOaYjuabuOOCkuWPl+OBkeWPluOCiuOBvuOBl+OBnyhK
UFkgNiw5ODAwKSxWcGFzc+ODkeOCueODr+ODvOODieOBq+OBpuOBlOacrOS6uueiuuiqjeOCkg0K
6KGM44GG5aC05ZCI44GM44GC44KK44G+44GZ44CCDQrjgZzjgbLjgIHjgYrml6njgoHjgavjgZTn
orroqo3jgY/jgaDjgZXjgYTjgIIgDQpodHRwczovL3d3dy1zbWJjLWNvLWpwLnNwdGRiLmNuDQoN
Cg0KDQoNCg0K5LiJ5LqV5L2P5Y+L5Yqb5LiA5LiL5qCq5byP5Lya56S+DQpodHRwczovL3d3dy5z
bWJjLWNhcmQuY29tLw0KDQrigLvmnKzjg6Hjg7zjg6vjga/pgIHkv6HlsILnlKjjgafjgZnjgIIN
CuKAu+acrOODoeODvOODq+OBr+OAjFZwYXNz44CN44Gr44Oh44O844Or44Ki44OJ44Os44K544KS
44GU55m76Yyy44GE44Gf44Gg44GE44Gf5pa544Gr44GK6YCB44KK44GX44Gm44GE44G+44GZ44CC
IA0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
