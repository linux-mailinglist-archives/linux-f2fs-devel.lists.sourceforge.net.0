Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5384DAA444D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Apr 2025 09:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:To:Date:Message-ID:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/fvGw+HukmNa+zishKEIMQQHBesd3rQT4sKL+Qgx/uw=; b=jPwoSZ0he68f2NgyfF09esWNnf
	iRdZpFnozAhN+HIm7+OpFPBN/gzZ9fP2kTJPDHMSuDQahj3QPYXFRgRhxLuNRVOuGRKkJK7aFEjby
	Fy4HCPDa2HfCaIFz9q4ascOKJr2WgTF1FygfKM33vAf8GvxzI6yo8k+cXmpq9am+lVAg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uA2AK-0001kZ-Qp;
	Wed, 30 Apr 2025 07:47:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <adrian.liszka@novaplan.pl>) id 1uA2AJ-0001kR-As
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Apr 2025 07:47:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=; b=HVpRsXNQCjQAR98MAGK1yxm8/B
 Vlr5/s2dA9r6qaC0e2Qc+r4AdzlvWRe+QkfSEFLft/4plpCsHxHc63rZJGy/KhamEFH5dRJzx04EY
 uC31iTqIzsQvvC3EiJt02WInqYjI1kd4msv+RcN0DOqxphBHVvMKbDMYLBemvyIZIz4Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=; b=U
 fTHaxE1OxUajZN3D8O/uhj2WyDhffaPTqe20O9SxcL75vADCGu9C7WIN03lzw7NzXpIYUb71gxpiy
 JjPbPGexFACtlaDaXPd6yxx0u9Flb64ZztKBte1FXyS831J7lKpUpslwlcdY4qT+cYvcmBo+JNSSA
 H78d4J0Xgh7lPGCI=;
Received: from mail.novaplan.pl ([51.195.118.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uA2A2-0002g1-QA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Apr 2025 07:47:35 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
 id 06BA9A3976; Wed, 30 Apr 2025 09:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
 t=1745999227; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
 h=Date:From:To:Subject:From;
 b=0Rmib3axtyNiNitvgGFs26X267EmSbbmu19/3HUa00qJnnK2Xhu6U+UV5CFLEUkaH
 ufoEx/Ly4zwMUl/o3YYW1UUwe5jwKBBDHV71bVtvaHz3I9Gajud8fY3l7b8uFd3tyc
 YIGjPdPuQnItjwApxtGPewrXKx2OIOOysWC/f25w3o4YITDl+ahjB3yBTYZlaz/xLT
 Poa8/jgF4ApumgQdKyKJ473LsAl1ELsnI8W4ShDdqxaz2WoG3PYcARSbKNaSvPgpgy
 KzQuv6CD4SNpdYdSmnTcc5FlJ7hSb19xXfULqwE4OMuyXOWntBF2fj4h8b/in+simf
 RGP6Wd6sdl7Ow==
Received: by mail.novaplan.pl for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Apr 2025 07:46:00 GMT
Message-ID: <20250430084500-0.1.lb.1td4l.0.eiderrgnzg@novaplan.pl>
Date: Wed, 30 Apr 2025 07:46:00 GMT
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
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [51.195.118.1 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [51.195.118.1 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  2.0 PYZOR_CHECK            Listed in Pyzor
                             (https://pyzor.readthedocs.io/en/latest/)
  0.0 FSL_BULK_SIG           Bulk signature with no Unsubscribe
X-Headers-End: 1uA2A2-0002g1-QA
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
