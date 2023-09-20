Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F7A7A74A9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Sep 2023 09:46:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qirv1-0007kb-VQ;
	Wed, 20 Sep 2023 07:46:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lukas.varga@venturelinkage.com>) id 1qiruz-0007kU-S3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 07:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7iowqdzve/IIiUUjcEwx8j3uMrVqqiE7R9zbOCKRV9Q=; b=AY1FA45cShrz2tTdwkgoe5asZK
 dMZa2xbp2k5+6xqH6rOJMT1wyRsx/hvNopB4HPHykZIeIoeK6oPAiiUpUYwM6axsvdoDNwja0Z/aM
 uo0Ts7Jn38rRfm6bkQ4LUkU2OoNqT0ExnzPUQ3f6AJPuXKDTd0CSkObkLWnY1gSyIEag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7iowqdzve/IIiUUjcEwx8j3uMrVqqiE7R9zbOCKRV9Q=; b=c
 1dqameudwnAlBJU61gXhGwExibTqttIQfpWwnzm6lsCgdaPYCQ1dYnFh0usqfp1JyMpiesD3FakdZ
 xdMZfgwceLq34s9hE31D7C/mGzL5TjR7kRLX8UHzXuwGwm8BYQ/ODJINNEolnGuB/b5DdZWCqTbn5
 TUcsFv+SeGReoStQ=;
Received: from mail.venturelinkage.com ([80.211.143.151])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qirux-0002YH-Gr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 07:46:40 +0000
Received: by mail.venturelinkage.com (Postfix, from userid 1002)
 id 654DB82754; Wed, 20 Sep 2023 09:46:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturelinkage.com;
 s=mail; t=1695195993;
 bh=7iowqdzve/IIiUUjcEwx8j3uMrVqqiE7R9zbOCKRV9Q=;
 h=Date:From:To:Subject:From;
 b=MzUIKwMP06gQbOx7JQmpOvGJGozrwpJhdQq3rCs/OVcAUzHM4R2BEU7cGUms7JaGI
 CbwBrV9PM7hIXPa+D4L3p1bu944eqtF6fIBUeUEkLfXOZ7R6heH2sYepV6JaYTwJ3O
 O0/uECaBxxu19Dl9DJ3z9DLzQrelfCCb8/xDUx1krVDKUeZV5kR898kxGz91XYj+bn
 K9MErwTv5coR+6/6KA0iM+rP8wXAD+5zjd/0C15eXkg2jO+VVoyUcRvvYmwrkajOV6
 1a20kE3z7B0AieqHS9UPFUx7rpTlbXJll0cP3Lg3rEuAW5fEf88hP4DQUmc/kxTQqp
 msWXjHsMBAPVA==
Received: by mail.venturelinkage.com for
 <linux-f2fs-devel@lists.sourceforge.net>; Wed, 20 Sep 2023 07:46:15 GMT
Message-ID: <20230920084500-0.1.l.121d.0.q0xo3ncee9@venturelinkage.com>
Date: Wed, 20 Sep 2023 07:46:15 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.venturelinkage.com
MIME-Version: 1.0
X-Spam-Score: 6.8 (++++++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dobré ráno, Dovolil jsem si Vás kontaktovat, protože mám
    zájem ověřit možnost navázání spolupráce. Podporujeme firmy při
   získávání nových obchodních zákazníků. 
 
 Content analysis details:   (6.8 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  2.5 URIBL_DBL_SPAM         Contains a spam URL listed in the Spamhaus DBL
                             blocklist
                             [URIs: venturelinkage.com]
  3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
                             [80.211.143.151 listed in zen.spamhaus.org]
  0.1 URIBL_CSS_A            Contains URL's A record listed in the Spamhaus CSS
                             blocklist
                             [URIs: venturelinkage.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.8 FROM_FMBLA_NEWDOM28    From domain was registered in last 14-28
                             days
X-Headers-End: 1qirux-0002YH-Gr
Subject: [f2fs-dev] =?utf-8?b?UG9wdMOhdmth?=
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
From: Lukas Varga via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Lukas Varga <lukas.varga@venturelinkage.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RG9icsOpIHLDoW5vLAoKRG92b2xpbCBqc2VtIHNpIFbDoXMga29udGFrdG92YXQsIHByb3Rvxb5l
IG3DoW0gesOhamVtIG92xJvFmWl0IG1vxb5ub3N0IG5hdsOhesOhbsOtIHNwb2x1cHLDoWNlLgoK
UG9kcG9ydWplbWUgZmlybXkgcMWZaSB6w61za8OhdsOhbsOtIG5vdsO9Y2ggb2JjaG9kbsOtY2gg
esOha2F6bsOta8WvLgoKTcWvxb5lbWUgc2kgcHJvbWx1dml0IGEgcG9za3l0bm91dCBwb2Ryb2Ju
b3N0aT8KClYgcMWZw61wYWTEmyB6w6FqbXUgVsOhcyBidWRlIGtvbnRha3RvdmF0IG7DocWhIGFu
Z2xpY2t5IG1sdXbDrWPDrSB6w6FzdHVwY2UuCgoKUG96ZHJhdnkKTHVrYXMgVmFyZ2EKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
