Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF3291D8F8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2024 09:31:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOBUy-0003fb-6i;
	Mon, 01 Jul 2024 07:30:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jan.polasek@envisioncraftsman.com>)
 id 1sOBUw-0003fS-Ap for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Jul 2024 07:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uGTmdNfeKWYppKfROrYtp0X+RK7/pRJQsBUrarqToyk=; b=agNKEOrNqwAqXtDnqRGGSeE0QD
 C1VUl0wtCDu7CHkY+EuHEsHyHjWihR/BKDjwATBoEGjj4RDOHDlYSs8bNSzIZDTkgbE6OAR6Ofcnu
 bGITruN/cVN9ObUvHiEtDFU+219MCGNgYtzbTTHxSu77JrWVT9KnnTNWR+azaxAB5lSw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uGTmdNfeKWYppKfROrYtp0X+RK7/pRJQsBUrarqToyk=; b=W
 opsAXK26IjShXNK7Gm5IqehjkMkoYsA2Z6rdL1U08FOdJ1DEz/RQPZsLYS3g9uiYODLoOTq/U4NDw
 /68FDDLhBTRb+Q4FJxcehipPbeavcw47Y3INGhaUELNjL8t5ijUtgSlAYXNiBulb+RGUVjjZ6ghAM
 FidfDcG0O90uFlOY=;
Received: from mail.envisioncraftsman.com ([162.19.67.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sOBUx-00062d-97 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Jul 2024 07:30:51 +0000
Received: by mail.envisioncraftsman.com (Postfix, from userid 1002)
 id 3A39A218B1; Mon,  1 Jul 2024 09:30:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=envisioncraftsman.com; s=mail; t=1719819039;
 bh=uGTmdNfeKWYppKfROrYtp0X+RK7/pRJQsBUrarqToyk=;
 h=Date:From:To:Subject:From;
 b=VCKqYTDGSOcWtkml9Guqi5xPdIXjiDiVa+qhJYWzW41D32gZQHPYvItQVWYBmATlJ
 DX52HPstc+6zgW5uiyTmtM2uuKaKliiCCk2t0znCQbhgFPF/BjGuYJK35gMkyGcFM+
 VV/uvHu/TCh+IE+kl1sU7g1XWAsX3Gx64sZFxda/2hbO2E9mGNj6KSqzxlezgN2Vc7
 Pf37Gw0+soc2D2WFMPQeJ76U5yIq+qmWWxVLsE29IhJulWUq+6zKiUoCnbsFOG2dAF
 1F+woIA4xB3qlz1/pf2WHFHVbikobSyU6E5Cq0JLCUId2CJywPs1tUGYM26CShWn9v
 EgVSjtATDSo+g==
Received: by mail.envisioncraftsman.com for
 <linux-f2fs-devel@lists.sourceforge.net>; Mon,  1 Jul 2024 07:30:15 GMT
Message-ID: <20240701084500-0.1.3j.n9fp.0.2mmgvqihcy@envisioncraftsman.com>
Date: Mon,  1 Jul 2024 07:30:15 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.envisioncraftsman.com
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello! I am very impressed with the products and services
 you offer. I thought we could help you reach a larger audience with your
 offerings.
 Would you be interested in collaborating with us in an affiliate marketing
 campaign? 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [162.19.67.48 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [162.19.67.48 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [162.19.67.48 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: envisioncraftsman.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sOBUx-00062d-97
Subject: [f2fs-dev] Quick Question About Collaboration
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
From: =?UTF-8?Q? Jan_Pol=C3=A1=C5=A1ek ?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?UTF-8?Q? Jan_Pol=C3=A1=C5=A1ek ?=
 <jan.polasek@envisioncraftsman.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8hCgpJIGFtIHZlcnkgaW1wcmVzc2VkIHdpdGggdGhlIHByb2R1Y3RzIGFuZCBzZXJ2aWNl
cyB5b3Ugb2ZmZXIuCgpJIHRob3VnaHQgd2UgY291bGQgaGVscCB5b3UgcmVhY2ggYSBsYXJnZXIg
YXVkaWVuY2Ugd2l0aCB5b3VyIG9mZmVyaW5ncy4gV291bGQgeW91IGJlIGludGVyZXN0ZWQgaW4g
Y29sbGFib3JhdGluZyB3aXRoIHVzIGluIGFuIGFmZmlsaWF0ZSBtYXJrZXRpbmcgY2FtcGFpZ24/
CgpGb3IgZXhhbXBsZSwgb3VyIHByb2dyYW0gZm9yIGEgY29tcGFueSBpbiB0aGUgZS1jb21tZXJj
ZSBzZWN0b3IgcmVzdWx0ZWQgaW4gYW4gaW5jcmVhc2UgaW4gcmV2ZW51ZSBmcm9tIDglIHRvIGFu
IGltcHJlc3NpdmUgMTklIChvbiBhdmVyYWdlIHBlciBxdWFydGVyKS4KCldlIGFjaGlldmUgdXAg
dG8gMTMlIHR1cm5vdmVyIGluIEdBNCwgd2hpbGUgc3RhbmRhcmQgYWZmaWxpYXRlIG5ldHdvcmtz
IGdlbmVyYXRlIG9ubHkgMy02JS4KCldvdWxkIHlvdSBoYXZlIHRpbWUgZm9yIGEgc2hvcnQgY29u
dmVyc2F0aW9uIGluIHRoZSBuZXh0IGZldyBkYXlzPwoKCkJlc3QgcmVnYXJkcwpKYW4gUG9sw6HF
oWVrCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
