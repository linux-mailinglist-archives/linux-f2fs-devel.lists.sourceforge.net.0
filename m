Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCD9909A3F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 16 Jun 2024 00:26:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sIbqy-0007fE-UQ;
	Sat, 15 Jun 2024 22:26:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jjkwak@youngperson.co.kr>) id 1sIbqx-0007f2-Ig
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Jun 2024 22:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4ug1bF7ibgS2m6+kQN7W653Nvm7jBPG+3Q8PpG/Ff5c=; b=YH3Z/EYnzveoRt+T93Av58tVsE
 HpkwzMWVC3UL8kExhtupFnOl7oSsKl9FfJwAMpNsHScyQAKRnFhDlnDoPwyFHRqnDRhv7j2DmoAzk
 MV4O/DDkZkasaufPWx41XVzhXWG72Mf44EHCxUmrrK6uK68umjAT9y8961q56/+0IFk8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4ug1bF7ibgS2m6+kQN7W653Nvm7jBPG+3Q8PpG/Ff5c=; b=X
 d11vzq+2qEM7WnL+tIcnLGvNE5/divxRVwkbh0MdMDGd5tDGPGEgXsqPknJ2hmD1FXbgC8BO7Btsi
 fng7ruiwPTagvF6u7tCPsPa78k3s8uD3+sTaF9NtsxpjddkXPXLojSPs5F6Px2J/mPYIyah6aQGxS
 aFMegvh+xTwGLIv8=;
Received: from [210.116.104.65] (helo=mail.youngperson.co.kr)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sIbqx-00079Q-Vz for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Jun 2024 22:26:31 +0000
Received: from rain-197-184-177-17.rain.network (unknown [146.70.101.36])
 by mail.youngperson.co.kr (Postfix) with ESMTPSA id 17C9C1024498
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 16 Jun 2024 07:21:12 +0900 (KST)
From: jjkwak@youngperson.co.kr
To: linux-f2fs-devel@lists.sourceforge.net
Date: 15 Jun 2024 15:21:04 -0700
Message-ID: <20240615152104.4DD2F02AFA901F71@youngperson.co.kr>
MIME-Version: 1.0
X-Spam-Score: 3.5 (+++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Herzlichen Glückwunsch! Wir haben einen nicht eingeforderten
    Restbetrag von 4.000.000,00 £, der mit Ihren Namen von einem verstorbenen
    Kunden verknüpft ist, der denselben Nachnamen wie Sie hat. Die [...] 
 
 Content analysis details:   (3.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [210.116.104.65 listed in list.dnswl.org]
  2.5 REPTO_419_FRAUD_GM     Reply-To is known advance fee fraud collector
                              mailbox
  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
                             digit
                             [tenreyrosilvana54[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  2.0 PYZOR_CHECK            Listed in Pyzor
                             (https://pyzor.readthedocs.io/en/latest/)
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [210.116.104.65 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [210.116.104.65 listed in sa-trusted.bondedsender.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  1.3 RDNS_NONE              Delivered to internal network by a host with no rDNS
  2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1sIbqx-00079Q-Vz
Subject: [f2fs-dev] Betreff: DRINGENDE HINWEISE!
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
Reply-To: tenreyrosilvana54@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVyemxpY2hlbiBHbMO8Y2t3dW5zY2ghIFdpciBoYWJlbiBlaW5lbiBuaWNodCBlaW5nZWZvcmRl
cnRlbiAKUmVzdGJldHJhZyB2b24gNC4wMDAuMDAwLDAwIMKjLCBkZXIgbWl0IElocmVuIE5hbWVu
IHZvbiBlaW5lbSAKdmVyc3RvcmJlbmVuIEt1bmRlbiB2ZXJrbsO8cGZ0IGlzdCwgZGVyIGRlbnNl
bGJlbiBOYWNobmFtZW4gd2llIApTaWUgaGF0LiBEaWVzZXMgR2VsZCB3dXJkZSBhdWYgZWluZW0g
U2ljaGVyaGVpdHNrb250byBoaWVyIGltIApWZXJlaW5pZ3RlbiBLw7ZuaWdyZWljaCBoaW50ZXJs
ZWd0LiBGw7xyIHdlaXRlcmUgQmVzdMOkdGlndW5nZW4gCnNlbmRlbiBTaWUgSWhyZSB2b2xsc3TD
pG5kaWdlbiBOYW1lbiBhbjogCnRlbnJleXJvc2lsdmFuYTU0QGdtYWlsLmNvbSBmw7xyIGRyaW5n
ZW5kZSBBbnNwcsO8Y2hlLgoKU2lsdmFuYSBUZW5yZXlybwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
