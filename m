Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7824D9F2CAE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Dec 2024 10:16:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tN7D9-0003tT-RD;
	Mon, 16 Dec 2024 09:16:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.zawadzki@thrivecreator.com>)
 id 1tN7D7-0003tB-Hp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Dec 2024 09:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wHe8Z2CRkd+23Wgu4wFeb9QUWOB3kx1YQJoPcO3cm8M=; b=O5+sxtTA9ph42HRNyvOR5YThUA
 gjrcDR/vjyiDqMam+pkInqf725whthjUAUIQuuu4vheWQ0lSceB/xORfl1h5uB8qBP4c9sCX+VWdi
 /xoCByI+Z6Nn6wmUCoJPvAZsfjh8eIxE5gLXuEH3bKOToe707DJ8ONWgnvXrLaseSiJI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wHe8Z2CRkd+23Wgu4wFeb9QUWOB3kx1YQJoPcO3cm8M=; b=H
 colmTj/6BTEmVI/ll75rGHHPke1XP9dPfecm+X6merDCfgtLEHsHY5JIbAuG5gGNtrA0INFSv5QYp
 /alcY2ETf5GlHL6UkOMFSt/PpKFqSEcY0eCxwDuyeE5UlUbY2hwCWBazauqTjJ0ZL4sdqMwoLveUa
 ED3DkV7rsHNVbc3w=;
Received: from [5.196.14.173] (helo=mail.thrivecreator.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tN7D6-0006Hd-8N for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Dec 2024 09:16:17 +0000
Received: by mail.thrivecreator.com (Postfix, from userid 1002)
 id C50184BF62; Mon, 16 Dec 2024 10:16:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thrivecreator.com;
 s=mail; t=1734340569;
 bh=wHe8Z2CRkd+23Wgu4wFeb9QUWOB3kx1YQJoPcO3cm8M=;
 h=Date:From:To:Subject:From;
 b=hlZBQ40bwRaLz08OEVF1pGVxjK4yFMR5bl6OuYsxnH8Ahpvv3TmIWQ9ovWjuvdT5c
 AQa4zNe5SByuaXT8uGwmCZwVFci5B8C1H4TTBcHHHPR1MvfDwVrrOYBidxjdhKmkLG
 6K6fH9O7ym6LQeFm3o7s2k9XzVcELwaNO9lC41pTo4xWdNMCgWYF2FWEEBObIpJsqk
 /aXGmkbn2Pr6I41pFbJwq0fbDaS7SHGAAhtVCnvC8T50YCn/J2Qv/K4iSX15iUlVtp
 ghaGT2WCouk7LV8MWd9WC472phLoIwnUciCdxclJPfUzL8p3vdS0LH+KncJyOlGzQQ
 hPRo6xI7+RYlg==
Received: by mail.thrivecreator.com for
 <linux-f2fs-devel@lists.sourceforge.net>; Mon, 16 Dec 2024 09:16:07 GMT
Message-ID: <20241216084500-0.1.6h.vfq5.0.0mgrh7407n@thrivecreator.com>
Date: Mon, 16 Dec 2024 09:16:07 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.thrivecreator.com
MIME-Version: 1.0
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dzień dobry, Czy interesuje Państwa pozyskanie nowych klientów?
    Zajmujemy się profesjonalnie wsparciem firm w tym zakresie. 
 
 Content analysis details:   (3.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [5.196.14.173 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                           [5.196.14.173 listed in sa-trusted.bondedsender.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  2.0 PYZOR_CHECK            Listed in Pyzor
                             (https://pyzor.readthedocs.io/en/latest/)
  1.3 RDNS_NONE              Delivered to internal network by a host with no rDNS
  0.0 FSL_BULK_SIG           Bulk signature with no Unsubscribe
X-Headers-End: 1tN7D6-0006Hd-8N
Subject: [f2fs-dev] =?utf-8?b?V3Nww7PFgnByYWNh?=
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
From: Daniel Zawadzki via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Zawadzki <daniel.zawadzki@thrivecreator.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RHppZcWEIGRvYnJ5LCAKCkN6eSBpbnRlcmVzdWplIFBhxYRzdHdhIHBvenlza2FuaWUgbm93eWNo
IGtsaWVudMOzdz8KClpham11amVteSBzacSZIHByb2Zlc2pvbmFsbmllIHdzcGFyY2llbSBmaXJt
IHcgdHltIHpha3Jlc2llLiAKCk5hc2kgcGFydG5lcnp5IHp5c2t1asSFIHN0YcWCeSBuYXDFgnl3
IG5vd3ljaCB6bGVjZcWEIG9yYXogemFtw7N3aWXFhCwgYSB0eW0gc2FteW0gendpxJlrc3phasSF
IHN3b2plIHd5bmlraSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcHJ6ZWRzdGF3acSHIHN6Y3pl
Z8OzxYJ5IGRvdHljesSFY2UgemFzYWQgaSBtb8W8bGl3b8WbY2kgd3Nww7PFgnByYWN5PwoKClBv
emRyYXdpYW0KRGFuaWVsIFphd2FkemtpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
