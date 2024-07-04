Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 278A7926F7B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 08:26:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPFvQ-0007Sl-Nx;
	Thu, 04 Jul 2024 06:26:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Markus.Elfring@web.de>) id 1sPFvP-0007Sa-Nm
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 06:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uCF2EB4gbFocwquJvCdIKzAh9CSf5NQdGLskTgx1PY8=; b=B2mwCmTYhHRLRShYsYquo3L8bU
 9E14cLMxli5lE/wNR8g0UcuXDPdmUyo4Fe4lGF1B1K8/r2KJ16D0e2o+g/DgqihhjYL4VBFzVE8c0
 TysS2JlUhkVhVv50H/3i/x7FdcjhLtT1xE8ue4wLVRJlycQPwKpvSdxox/IorrG+cYVU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uCF2EB4gbFocwquJvCdIKzAh9CSf5NQdGLskTgx1PY8=; b=AF4/Z/fPr5r+942hodRQDmCEo2
 mnxaUmgGdUno2mU9/2bK9U3535+inbVrwq+T7S82L2/7UuBEfB9itCOQZWk7k0b8+kzUZBxtFASGk
 fcoY4ulmRgQ6BuBp70QyQmrA3v7tnSvskFlzNr226DbzFP6MLjKIDjOsjwAkHHUYA//c=;
Received: from mout.web.de ([212.227.17.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPFvP-0008BV-H7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 06:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1720074374; x=1720679174; i=markus.elfring@web.de;
 bh=uCF2EB4gbFocwquJvCdIKzAh9CSf5NQdGLskTgx1PY8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=uTQpUHlb8ZnUwyNUGHCsQCMUJLUmJxZ9tuEb2AjrOyOJrTrb2+FU9gIbWnY8VdYs
 W1+PE1YQGL9xT41AC9fjiuy97JY2WyeY6Tr54hBVF0OlrCV96KCgF994pYXyr1xVm
 ZcAiSGkPGCYdgBw5pP++BB8iBpOFWDlfFGW9TFacYUdstLlrw1Fcfn1fBeJVtz0qI
 MYMSUzjTdOxLtMu9YNlaVo3Zb0JVQ4UWhN3o7FWTpfvNS2ryxwikIeCFeVFgFZzXR
 oGJ0J22lUscFE+gYVTL84jQ94NlBmp64Ausq9xVogWWM5HULu2gtj5pexUpv2K1bL
 sUn40UYKIVHWv6MuWA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M91Lg-1sS1sO29Oo-00CnbU; Thu, 04
 Jul 2024 08:26:14 +0200
Message-ID: <2121fd23-5cb8-493b-bee8-0c7d74bccfa9@web.de>
Date: Thu, 4 Jul 2024 08:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daejun Park <daejun7.park@samsung.com>,
 linux-f2fs-devel@lists.sourceforge.net, Chao Yu <chao@kernel.org>,
 Daeho Jeong <daehojeong@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240704010121epcms2p4cff8b25d976d4a1b820ba18f1eb5aa90@epcms2p4>
Content-Language: en-GB
In-Reply-To: <20240704010121epcms2p4cff8b25d976d4a1b820ba18f1eb5aa90@epcms2p4>
X-Provags-ID: V03:K1:sziOUlnAjE0P9t6Baaq3Q0zyVJT9942lH223iRRgb2sewW374dX
 f9eJKFIqVlJ0E3PANv06WVqLvxcx9jP3cF2q3B/xsmvJMJ+Ym7QI6mbIlFPnMxa4w+PQC3C
 NoF9KfCkfX6dT8w+cYcpsbYvvYTB3bSA+MKpZAPW6GbZIfvdXPtqtllWkR+0G6NUlE8LHzg
 2LT3x/v1BNYmR9zRHZ3cg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:s5l9pmtnMnc=;lJXEK0apfPqzZOEwUykEJjDA8md
 V9sFsO/B0b8g467YFV0XoCUMZYDPMbZ9red8OIv5PBYkljX19iPJHG/YcT04Iy7VfW+ezgtQa
 28HNOwwqG7oaifiEnbAWdzT0gjtdH71Q+RlHYopVIeDEoObUR6Tb1liEvsqy7uEbfeqTo67zt
 AAKzxSZIj/HEiJ+cFzIrsiLDkR7wxfYvR5b9pzoqsR48Jto/BxGAgbO5iULYezSAByL4UjTfv
 BNNvx8KXXS7GO0SNwXT1iD6C8ZrSd0yQlySk8Ed98oqcpZ4p7IuMVOy+Wyfe3T+rbDFGLaUz/
 0lhL54kDNh4wwtHdxjzt4K9XRBXtwim7GTD/K7HRX3e8rJcwjnA12PDcssauQeeFko+sZ7+Sl
 8IwBJXayMf6SonjYxspEHf3S6Ur2GPdeV64WEHh4Ox9ePsc+Sz6dcqzVT/z2O8ZHoP65nXnG7
 HSxV7lpqknCCax0BWOSO760r8cVkxBseCXwt0ApMtGk/QCGY3fceLQpl8b72/9u0Bamt0VLdD
 GkMn5mXbiJiaRY7EXNLUstRxApHaZuXeDK8aK76cs2GH56wEGaDABI6E1SqMTQKaYQaAhbxA6
 fK/gITSDjvJbra0BctW+K2nJ7wVfBGPrPU4C0hujx33HjYUu3lWZcFNxlqRS+nVjbInJ1mGxX
 OFvJEhP0avtM/8kLxjwDIuVOMdz9v2aRZlZtfVYBIcfQbP8DExQo6Ft0DgrQcZzCfbM0vQ25Z
 fL9P+V5081DSXDcZ2YOopWWe44Jr/wqUrBrfuNg8/W/DTFWzeQFM7wVy4UcwFSOK9vaiA3tNV
 mZgFNf6s5kBvYPIARhX9X7iNvF/DikbpyJYHRMPZ5W5qQ=
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  > This patch fixes a potentially null pointer being accessed
    by … Please improve such a change description with imperative wordings.
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc6#n94
    
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [markus.elfring[at]web.de]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [212.227.17.12 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [212.227.17.12 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [212.227.17.12 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [212.227.17.12 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sPFvP-0008BV-H7
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix null reference error when checking
 end of zone
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
From: Markus Elfring via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Markus Elfring <Markus.Elfring@web.de>
Cc: Nayeon Kim <nayeoni.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 Siwoo Jung <siu.jung@samsung.com>, Seokhwan Kim <sukka.kim@samsung.com>,
 Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBUaGlzIHBhdGNoIGZpeGVzIGEgcG90ZW50aWFsbHkgbnVsbCBwb2ludGVyIGJlaW5nIGFjY2Vz
c2VkIGJ5CuKApgoKUGxlYXNlIGltcHJvdmUgc3VjaCBhIGNoYW5nZSBkZXNjcmlwdGlvbiB3aXRo
IGltcGVyYXRpdmUgd29yZGluZ3MuCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vz
cy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0P2g9djYuMTAtcmM2I245NAoKCkhvdyBkbyB5b3UgdGhp
bmsgYWJvdXQgdG8gdXNlIGEgc3VtbWFyeSBwaHJhc2UgbGlrZQrigJxQcmV2ZW50IG51bGwgcG9p
bnRlciBkZXJlZmVyZW5jZSBpbiBpc19lbmRfem9uZV9ibGthZGRyKCnigJ0/CgpSZWdhcmRzLApN
YXJrdXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
