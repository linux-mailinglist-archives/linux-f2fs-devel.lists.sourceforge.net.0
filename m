Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63339630B0E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 19 Nov 2022 04:23:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1owERe-0008Ki-3E;
	Sat, 19 Nov 2022 03:23:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Lilli@webmail.com>) id 1owERc-0008Kc-Iw
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 19 Nov 2022 03:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Reply-To:From:
 Date:Subject:To:Sender:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PDWtDKZ3G2OxrWvY15sUBDNLzuPMBZPj+yVFwX4YGXk=; b=HUPBmFvRGRdWMeKXzEBIb36e79
 6T6P70DnYwWERxmBiXrI6+QF8AOxzX0TKvNoZ+pmY28HQ7t1tE1lYAS9hs2oy7yqvuqjK4sDxM3Ic
 24EoSM1x637rcq6rX0VG9GwRkrPeqZfzbzVd15kZXm3IrYjdjcrddN9ngHW765F5rAZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Reply-To:From:Date:Subject:To:Sender
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PDWtDKZ3G2OxrWvY15sUBDNLzuPMBZPj+yVFwX4YGXk=; b=j
 zG+TsM7r9KEFFxPTTv7V1fQZad5TlMs+l51wyvhfMpUQ3aKjGPQb+7pHkv+/zNVsZ+lX5+pVz6/pv
 uaKACijyoHM1YZ5VgkUxmnqTfFm17Fg1JroAE2hi/bRfrQ/0Q+ZIUE+tLm8ruWxk3kvw5C5BbbT5z
 8MvaIX1tR1agXQ6c=;
Received: from vps-87137a11.vps.ovh.net ([135.125.237.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1owERb-00D442-RT for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 19 Nov 2022 03:23:04 +0000
Received: by vps-87137a11.vps.ovh.net (Postfix, from userid 33)
 id D9D429051A; Sat, 19 Nov 2022 03:22:19 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 19 Nov 2022 03:22:19 +0000
Message-ID: <0cb88742532dc9d93709709b36332cfa@135.125.237.141>
MIME-Version: 1.0
X-Spam-Score: 5.9 (+++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Good Day I am interested in relating a business venture with
 you. I will make the details available on your acknowledgment of this email.
 Please revert back at your earliest convenience for complete details. 
 Content analysis details:   (5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [135.125.237.141 listed in dnsbl-1.uceprotect.net]
 0.9 SPF_FAIL               SPF: sender does not match SPF record (fail)
 [SPF failed: Please see http://www.openspf.org/Why?s=mfrom;
 id=lilli%40webmail.com; ip=135.125.237.141;
 r=util-spamd-2.v13.lw.sourceforge.com]
 1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
 https://senderscore.org/blocklistlookup/
 [135.125.237.141 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
 digit [lillibark75[at]gmail.com]
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1owERb-00D442-RT
Subject: [f2fs-dev] Treat this as urgent
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
From: Lilli Barke via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: lillibark75@gmail.com
Cc: Lilli Barke <Lilli@webmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Good Day

I am interested in relating a business venture with you. I will make the details available on your acknowledgment of this email. Please revert back at your earliest convenience for complete details.

Regards,
Lilli



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
