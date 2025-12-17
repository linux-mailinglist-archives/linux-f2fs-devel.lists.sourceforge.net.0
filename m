Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A911CC6BC6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Dec 2025 10:12:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:To:Date:Message-ID:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uU1zQPwm5d6iY77D+2f9LorKBnbDHsPXX9iPJJWrRxk=; b=dOfy4a+WUCo1Yx1LmWWiAn1I3J
	kVo92vYPilB9sfES+3YFVpCVLQx3F+eX5EHJ6aeUd48kQ2ftE7dqlNSuPvtXUJl7vXlX0padgsJwh
	HrHPm/OTKuziBXWkJj7reIW4fdY5gmG24lIoKARtk+6xl9Cb6U2MuhV0P2kHZHM6GySY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVnaP-0004e9-1W;
	Wed, 17 Dec 2025 09:12:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zaneta.kedzierska@fontri.pl>) id 1vVnaN-0004e1-OH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Dec 2025 09:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kb7u+lszG/nXqIAGpk/hByhDC/8HGhmWaIRwB9KIYkQ=; b=l+lpaY8JT4UXmEc1/2IQEuTb1O
 U/WccvBZueeYZZVI1k/eOhAm3xayDFppyaX9ydSiyFnrE6gwvwTMk6fFW/P+ntsyh6J8c+25q62pb
 x8f5Fu9Lxglt/Y4iN+87Bg2QCigkYsyOn0zn/ZGdBTJnqHW9AWtSJ7t6+N90yVp7wicA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Kb7u+lszG/nXqIAGpk/hByhDC/8HGhmWaIRwB9KIYkQ=; b=E
 iKTHSSMetgZm+VeMu9KZ7GffaBe10EczBhFkC8EoYrByR3eeMS8fm6ITFp8jbOQcyITPY6rcjyhML
 IrOQrbjV/k0yfVKwEbxryRRFJUKtM9Al3BRWBDpDzj+K23RcnV3jl1utUtvfxXeaRlB0pqcrDV8+p
 06SFr2i+8kdWvegA=;
Received: from mail.fontri.pl ([51.195.90.156])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vVnaN-0002Z1-4P for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Dec 2025 09:12:43 +0000
Received: by mail.fontri.pl (Postfix, from userid 1002)
 id E5F12AC95F; Wed, 17 Dec 2025 10:11:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fontri.pl; s=mail;
 t=1765962756; bh=Kb7u+lszG/nXqIAGpk/hByhDC/8HGhmWaIRwB9KIYkQ=;
 h=Date:From:To:Subject:From;
 b=i0jqwaOt46yifFAvkfNsfAqEB74SzXjm98UMGWJapdWWasgCNJTJhaUr4pyuOowlq
 qG5BI7UxbUDPP0k3DVGyTag0/ekj/m8bmKFdA2RPXTWvsK+k/w+WXk5F1Sl34ihaYA
 Oz28dqCk9Xcn2XCUESHR4O9LWR4R13H6BatNR56Jv1oEi6O+AY8tRLBlRXduphgA7h
 VwiBjcB0cJYMErgSLFuijZ11Cq4n92/v37tISroDTS84kBikdVAFd60gPk19c/XiPQ
 Ab3x2yyrqAPSBr2n+kbmrJPkpbqCtQC6sR/oj5/3tehVdsrRbvH4/WA2F3Y4besWiN
 6MtNHMZMQ0Y9Q==
Received: by mail.fontri.pl for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Dec 2025 09:11:01 GMT
Message-ID: <20251217084500-0.1.t1.6d0xi.0.da0dw98glh@fontri.pl>
Date: Wed, 17 Dec 2025 09:11:01 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.fontri.pl
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dzień dobry, jako lider w usługach kurierskich w Polsce
   przygotowaliśmy elastyczne rozwiązanie dla przedsiębiorców. Stworzyliśmy
    abonament łączący dostawy do Paczkomat 24/7 oraz obsługę kurierską
   - jeden dostawca, jedna faktura i przewidywalne, stałe koszty. 
 
 Content analysis details:   (0.8 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
                             [51.195.90.156 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
X-Headers-End: 1vVnaN-0002Z1-4P
Subject: [f2fs-dev] =?utf-8?q?Odbi=C3=B3r_w_paczkomacie?=
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
From: =?UTF-8?Q? =C5=BBaneta_K=C4=99dzierska ?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?UTF-8?Q? =C5=BBaneta_K=C4=99dzierska ?=
 <zaneta.kedzierska@fontri.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RHppZcWEIGRvYnJ5LAoKamFrbyBsaWRlciB3IHVzxYJ1Z2FjaCBrdXJpZXJza2ljaCB3IFBvbHNj
ZSBwcnp5Z290b3dhbGnFm215IGVsYXN0eWN6bmUgcm96d2nEhXphbmllIGRsYSBwcnplZHNpxJli
aW9yY8Ozdy4KClN0d29yenlsacWbbXkgYWJvbmFtZW50IMWCxIVjesSFY3kgZG9zdGF3eSBkbyBQ
YWN6a29tYXQgMjQvNyBvcmF6IG9ic8WCdWfEmSBrdXJpZXJza8SFIC0gamVkZW4gZG9zdGF3Y2Es
IGplZG5hIGZha3R1cmEgaSBwcnpld2lkeXdhbG5lLCBzdGHFgmUga29zenR5LiAKCkN6eSBtb2fE
mSBwcnplZHN0YXdpxIcsIGNvIG1vxbxlbXkgemFwcm9wb25vd2HEhyB3emdsxJlkZW0gUGHFhHN0
d2EgcG90cnplYj8KCgpQb3pkcmF3aWFtCsW7YW5ldGEgS8SZZHppZXJza2EKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
