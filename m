Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C8A76038
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 09:37:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tz9iG-0006v1-I4;
	Mon, 31 Mar 2025 07:37:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <adrian.liszka@novaplan.pl>) id 1tz9iE-0006uk-KF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 07:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=; b=ZDezcKtLXRRwtjT2MYnb9DztKW
 QxP8u86qoiR5d9OI87bJLI96L6+HFqWbn9S0H8aRCwXlBYFE5zAp35pL5fhs0KQXFxZuCvnJeqhoU
 IulbifjMRtjszZYacqjEeM9uPskFEfPf0DcKyCgjR/NAqfZISLP6FL7FEnAmw4nYxYVY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=; b=k
 pXSbJMnj8EzCyHKgn9sqtA27MOT4waTc/9a+cZGFJtp09SO6eXpL4NnPJ175m4W3P4icoIO1tVzIj
 DKYNu/L0SFZ9aU51mOaFkEhnmgH8y6Pj5DCyC9Uk4Tpb0qrapiHaRpPIoSjLflAHr51/xVgH5Qsno
 mk1+GtXfQquunspo=;
Received: from mail.novaplan.pl ([51.195.118.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tz9i8-0000Dt-0a for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 07:37:39 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
 id 68709A35CC; Mon, 31 Mar 2025 09:36:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
 t=1743406640; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
 h=Date:From:To:Subject:From;
 b=Kck96Hmxfr6od4vmFeWcSHGYfLkWvTjsH+n7iW3VxHwNw+/XGjTrbiAdi/iA1h44Z
 pGx/9SnqgA0sMQXNrZbYtAYRE/JNFS2fgbvS+cAgp3+BTBj0xaAZfHwXuv2styoZLi
 zK6Hbcf+aw86MDqmcJJzATMgRTwITmcKnVcJ+rOIf8v55gTOtGSp7Ue4smSIUNzUE4
 w+ehSSusDF+5L50cMC0zG3NccFiqlfdgQMXxGBpqZRjCx1NXVe3BrJEBbf1fwwryzW
 SLqe34OC5KEBj8U8sAQIdcfOX/Qkx9y/nmhpX46dWaGOKv0xsLR4qg8CBScmJK8bk/
 19VY9xG5QofyA==
Received: by mail.novaplan.pl for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 31 Mar 2025 07:35:55 GMT
Message-ID: <20250331084500-0.1.kq.1kecd.0.qm200dvtyv@novaplan.pl>
Date: Mon, 31 Mar 2025 07:35:55 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dzień dobry, Czy jest możliwość nawiązania współpracy
    z Państwem? Z chęcią porozmawiam z osobą zajmującą się działaniami
    związanymi ze sprzedażą. 
 
 Content analysis details:   (1.8 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [51.195.118.1 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [51.195.118.1 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  2.0 PYZOR_CHECK            Listed in Pyzor
                             (https://pyzor.readthedocs.io/en/latest/)
  0.0 FSL_BULK_SIG           Bulk signature with no Unsubscribe
X-Headers-End: 1tz9i8-0000Dt-0a
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
From: Adrian Liszka via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Adrian Liszka <adrian.liszka@novaplan.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKWiBwb3pkcm93aWVuaWFtaQpBZHJpYW4gTGlzemthCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
