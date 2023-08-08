Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD4A7738FB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Aug 2023 10:15:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTHse-0007q2-Th;
	Tue, 08 Aug 2023 08:15:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <michal.rmoutil@venturelinkbiz.com>)
 id 1qTHsc-0007pE-PI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 08:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mjfq+hZZ0+rPTC06HjjASvlnsTMgj1yAndWxi/OAu2M=; b=HsWuPWoeKi8eLDbTVzu20OYcFI
 YN9+fmq2cgCUU1sPjhG0S95CU7Jd4toNQVsgfZmsJLJhAu3Kxc7haZeY7pbt2v1V8t8DTRsaG14qa
 Gzg8uTnu+DmNVBtGmOu9tXJgW4bVkjjC8Xn9zHUQdhbgSnsdtOOQZL648nwGPXsIkmBU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Mjfq+hZZ0+rPTC06HjjASvlnsTMgj1yAndWxi/OAu2M=; b=h
 +IH3odE2tIp1dZ84molE/4WYAzSxgmPETFrabgnpgYaWtgmlKrUIpv821DO8Onw0/MGBRwG/JFA77
 OqwOnhCylCneShrpXl5rwafJGhYA2NOocNbCwoNnrFfPfeZrOb4/I6Ia6o+zKvNtzoH1/x6n6RkKk
 jGV1e4Wfh8C4ReUk=;
Received: from mail.venturelinkbiz.com ([51.195.119.142])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qTHsd-00GnXC-4B for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 08:15:51 +0000
Received: by mail.venturelinkbiz.com (Postfix, from userid 1002)
 id CD5E445077; Tue,  8 Aug 2023 08:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturelinkbiz.com;
 s=mail; t=1691482543;
 bh=Mjfq+hZZ0+rPTC06HjjASvlnsTMgj1yAndWxi/OAu2M=;
 h=Date:From:To:Subject:From;
 b=HIdHQTocHnTVl9lgP98g7Qe18XeomgKHVYyfjabUvOGzLhQQT54D97bGhCCWct1O6
 3hzBBE/gQf+0etXgNO3Y2ql+IHWi66S04SmOc3mPFzvPfaMH8G7IpNtd4/gI5ZHco3
 ajEJyd8iq2mWE43gMa22CUBdj1kwX4HA6K/0YufUokhXYU6cEkGZ7pmfb4SMBq+hwl
 f5+0qD9SSmaZfpwaFyvSw0DjGj+wSBJInWsIRmSbcRrVaeuI4bOxURsSKr57WxX3uF
 Jx1R1fHvv4OFFWfGkQUPTHPQxbnDwbyPXY9vcvxHEKL+yc5psnVVehIWx3aPt2D/40
 GhAlfHmzfcCDg==
Received: by venturelinkbiz.com for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  8 Aug 2023 08:15:26 GMT
Message-ID: <20230808064500-0.1.1o.4cr3.0.2znaqr3bjd@venturelinkbiz.com>
Date: Tue,  8 Aug 2023 08:15:26 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.venturelinkbiz.com
MIME-Version: 1.0
X-Spam-Score: 5.9 (+++++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
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
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1qTHsd-00GnXC-4B
Subject: [f2fs-dev] =?utf-8?b?U3lzdMOpbSBzbGVkb3bDoW7DrSBhIG9wdGltYWxpemFj?=
 =?utf-8?b?ZSB2w71yb2J5?=
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
