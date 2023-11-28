Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D16887FB522
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Nov 2023 10:02:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7tyC-0005mI-JK;
	Tue, 28 Nov 2023 09:01:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <michal.rmoutil@venturelinkbiz.com>)
 id 1r7tyA-0005lq-1M for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 09:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mjfq+hZZ0+rPTC06HjjASvlnsTMgj1yAndWxi/OAu2M=; b=hkHvT7QGzJSAPUpCHphU54AC4u
 zy8Ew64cjIJyaz1u84QMjLnWlKN+zEvvGef0sR/e0Z0pALx38s+wv7kPA7Bq8NuQMZBxgbaINbjxK
 QuUI6HWRcaOhub/OpCDJikLXCrN31XFbAq9TtdkO9W3dNQwcwPCi5X3gMjRcKllm7p3E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Mjfq+hZZ0+rPTC06HjjASvlnsTMgj1yAndWxi/OAu2M=; b=b
 6NuPYGK4wHiAF0KvyT8NZ0HYSfKrP5IB+t3d9wYQoo7ETttnA3z3M28eH9Y0QqKimBCVJiTXZXm7U
 tIGOHhcAZTkIwP02+GrjTrVns58gj5FHsTtrpVLbn8mlIfLZY3UyvYSDsQ7o+sm4o9AEq+PhzMf9D
 kjTNCKT+nSxiad/U=;
Received: from mail.venturelinkbiz.com ([51.195.119.142])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7ty9-0007Cm-Lb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 09:01:26 +0000
Received: by mail.venturelinkbiz.com (Postfix, from userid 1002)
 id 4A9C246E57; Tue, 28 Nov 2023 09:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturelinkbiz.com;
 s=mail; t=1701162079;
 bh=Mjfq+hZZ0+rPTC06HjjASvlnsTMgj1yAndWxi/OAu2M=;
 h=Date:From:To:Subject:From;
 b=qZ/0dBc5NxCCqWutAGzinsXKZfG4DPlEZJcNcJpBfmYuanmolpEvhBtt7IUSC5DTs
 FnKRMYfSxtqdV/DZbbqTK5AUda8lHngTPTgJLrnckwinqK/fwfHPV9HWwhmKZkbz0y
 OPCaGia6gGg95HJUJ/w7GOtRVwcg0UZzy0jepMQ7tKzcRnChlAKCXNscH8h4W2KF2N
 N5L9boLKlOqaxfzyQF8vsv+4vTdnguRpDQddvyx9mWm5VU6EcojbQlvXxuQniGq6NY
 EPZqeM1pEfHGFRw+WzhrxTJ+I/m7Iz5WHLnT1mR4r9XFGxEtvPugwM9ZwDwMU+lMT1
 WdJX+6s3a4G/w==
Received: by mail.venturelinkbiz.com for
 <linux-f2fs-devel@lists.sourceforge.net>; Tue, 28 Nov 2023 09:01:07 GMT
Message-ID: <20231128074500-0.1.3u.b55s.0.608nbun06m@venturelinkbiz.com>
Date: Tue, 28 Nov 2023 09:01:07 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.venturelinkbiz.com
MIME-Version: 1.0
X-Spam-Score: 5.9 (+++++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dobré ráno Znáte systém, který nejen hlídá, ale i optimalizuje
    výrobu a přináší stálý příjem? Díky nejnovějším technologiím
    a analýze dat naše řešení identifikuje oblasti optimalizace, zvýšení
    efektivity a snížení nákladů. Naši klienti zaznamenali nárůst příjmů
    v prům� [...] 
 
 Content analysis details:   (5.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  2.5 URIBL_DBL_SPAM         Contains a spam URL listed in the Spamhaus DBL
                             blocklist
                             [URIs: venturelinkbiz.com]
  3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
                             [51.195.119.142 listed in zen.spamhaus.org]
  0.1 URIBL_CSS_A            Contains URL's A record listed in the Spamhaus CSS
                             blocklist
                             [URIs: venturelinkbiz.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [51.195.119.142 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r7ty9-0007Cm-Lb
Subject: [f2fs-dev] =?utf-8?b?QmV6cGxhdG7DoSA2MGRlbm7DrSB6a3XFoWVibsOtIHZl?=
 =?utf-8?b?cnplOiBWeWxlcMWhZXRlIHN2w6kgdsO9cm9ibsOtIHByb2Nlc3k=?=
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
From: Michal Rmoutil via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Michal Rmoutil <michal.rmoutil@venturelinkbiz.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RG9icsOpIHLDoW5vCgpabsOhdGUgc3lzdMOpbSwga3RlcsO9IG5lamVuIGhsw61kw6EsIGFsZSBp
IG9wdGltYWxpenVqZSB2w71yb2J1IGEgcMWZaW7DocWhw60gc3TDoWzDvSBwxZnDrWplbT8KCkTD
rWt5IG5lam5vdsSbasWhw61tIHRlY2hub2xvZ2nDrW0gYSBhbmFsw716ZSBkYXQgbmHFoWUgxZll
xaFlbsOtIGlkZW50aWZpa3VqZSBvYmxhc3RpIG9wdGltYWxpemFjZSwgenbDvcWhZW7DrSBlZmVr
dGl2aXR5IGEgc27DrcW+ZW7DrSBuw6FrbGFkxa8uIE5hxaFpIGtsaWVudGkgemF6bmFtZW5hbGkg
bsOhcsWvc3QgcMWZw61qbcWvIHYgcHLFr23Em3J1IG8gMjAgJSBhIGRuZXMgc2kgdG8gbcWvxb5l
dGUgdnl6a291xaFldCBuYSA2MCBkbsOtIHpkYXJtYS4KClBva3VkIGNoY2V0ZSBkYWzFocOtIHBv
ZHJvYm5vc3RpLCBvZHBvdsSbenRlIHByb3PDrW0gbmEga29udGFrdG7DrSDEjcOtc2xvLgoKClBv
emRyYXZ5Ck1pY2hhbCBSbW91dGlsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
