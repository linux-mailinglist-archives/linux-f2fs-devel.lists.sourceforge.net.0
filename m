Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 371441203F1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Dec 2019 12:32:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1igoc3-0006eP-5S; Mon, 16 Dec 2019 11:32:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <Markus.Elfring@web.de>) id 1igoc1-0006dw-67
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Dec 2019 11:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Subject:References:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s7s4dbULmgG+ebpWpCYlbjhdB0N/vaPW6ABo/EJP5W4=; b=exfEUgsvZ98bM4m+Pm8pI1FWlg
 uFlJfbgqVzr/6WhGIsG+YFTTwaaiPncVsYs7Dz7vO+SGkyrat0rK38j24hz3xsk+iyH7yIrdWHqDc
 LfmSNv3rB74ao+0sp8ByHnz09ur3q5vQ44p6gMMihMI4XsZl7+sOx9ulG6OexNkOWs3c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Subject:References:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s7s4dbULmgG+ebpWpCYlbjhdB0N/vaPW6ABo/EJP5W4=; b=ev2SVQWY2N/SmgJ+8HamhM2EdJ
 /AMvTfZgvedQVi4iLpZK6+2PXmAhDNZjgsjoUqaY2UToqbMt31JD7OitgZ3BnV1Cak8dbh7EYJeIH
 iiZIpGrB1/r4qJGRzMNYsjRCnQcHVRqffnS/CAY41w8uHV9cGEWjxDxBtRX8dHgJa6S8=;
Received: from mout.web.de ([217.72.192.78])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1igobz-00EUDi-6q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Dec 2019 11:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1576495930;
 bh=ScEN8n3GV+WMJgfH5FlVtKpqjsLsOHIgy5pLVHm/22g=;
 h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
 b=Uk02i/mPN6wHepBgQQm5RBJeoOiV2O9+Xig6UE17gqutji+xUxBRsldobOydiYx1X
 L8kZ5qBy7EjJZYESZHiIprQISEiYXDT9jCV2CNZ5N4eYg4cE/++qKM0gSkdyxNsyVU
 g3Ev7W5su/RdRfSUbjKIhWAQidE8N/0Ay15IbO+s=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.181.202]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MUW7T-1iFUBG48l1-00RIWn; Mon, 16
 Dec 2019 12:32:10 +0100
To: Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20191216062806.112361-1-yuchao0@huawei.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <594c3b59-b6f0-0e87-6acb-04161e555d7e@web.de>
Date: Mon, 16 Dec 2019 12:32:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191216062806.112361-1-yuchao0@huawei.com>
Content-Language: en-US
X-Provags-ID: V03:K1:7pip56QvaNsPXkcUF8CD2nIcFfLq1yUdoc94D3eknuvUIUmZ5hl
 WreGNVq7+OTt1xYhZOGybwdZ0pv2os1vFLGY9W99loHzr7nGIgffrJfFVW1B8V1fN6DpfSA
 vEDtoTXCJLt5T4rMrmKozbBPct0r5sA9t3u/iHovH/JFigD0i9sTiWBv6aENcSSCS+LT4Kj
 8RyYztQEvzLR1pomAn50w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bEnQUXtpG2M=:o/KpONtZB0jc6lMeB5oAsl
 bUAdfrA07oALR0urToFJH9zI2tHnpMHCt1+fhkWb6dSjiJnSfZkW6t56QzBVuSd87vrCllvrB
 wMP6Xo3Wvt1dxqwFZeYgJAbMoLHhr+lx+XBQoccQNnWtU3b+2oLy3t/BgOkaSRxwdtmTbDpJu
 1fvfQKWR1I2xcRpjyhrcE/Dmm9pYGWJHTLZRgYSU+8I8HGvihiehkw6u7TZ00Yq5/X5Jm0TXq
 yrszz+AICqdv/fIsRbfaf6okw5wF/e8vIN2zvP2jI8U+k4/HteWaWcoQKYzs3w4rVArYT27NF
 6R8vPrZzyxbTSeiN0KzQyjC2a2K2tSZnesRyyjE9PpOvzaf5Oso9rAU+tQWeciBe5kavV9//o
 e7jMvb/N+E7FkWzMkKyfJacGkB0095y9yr9dNblOIjLUY6Gwi4FFqf86X+IlY8p8H5AX/dZEO
 5xrRENSorKPwDmbUPy1gzbCqsLGZOy22ot/ROV0Ku/qS2pbJpK6any7FX5H6di+brSzu3UKRg
 e8le+GW5o7mAp/MBaoOZwzobPztJOLpS9q80z3iX5l0vuJIfFz6gmMy4qe3j4t+lZ+1W93j3a
 +o+cFe88OLgueltdCjq+171eMdKeZM37uJIfE7iVWIUnDx/ZsP67KOqudjhF77ujZbS3hP3nk
 A5aBDkXj74/NBM7k01MYpm5Z+TY0yMti27JYNH6EqqCHHY0nnKVVVzWLuPo2fW/vVcobq45J8
 4cEEh7xWfgh9TMtstFKTGHGfC14PfCJB0ERFFi1mFgpodtzTt5aD3PGeWlv5MDxyOqIjOLMfn
 K7E+NReNCyGYBb4EkexNhmV444QD4ELdr9VY0gm9nKhWksa97KLsIA3wllvKWKN1vubF+14y9
 5fwdNU0Jekc/6nTZ+fI+SDY2hF/YtFoBT1AMNmMDWrzF3cmudu/0CRxId0JsZ12BZtQOfNlif
 odL0HSCLJnbeXQzbK/u0Pxua+WfAqHTgqUFgYskqdM1/mpxr3E1UTYJkXbWugcRD49H+GcHzD
 BwbDPvRa6JT2fuYwVD4VFwdD5mrS9boaq3AOVd0ygPmGavDKdlXZ1Bptp+2YzRbH5cmMw9APN
 lBNJQnOmgBOa8fqO6Vx/VlkQwZ2ANxGLmqiESHwzHNXez7deYGYmOHE9+A6kaVMZ4ZiPecioQ
 YFQ/Y74C6bObuwhraTlv1XwvP65lPdwDo5gJHpEJuZcxx2zVUINKypmF3blYRkR7i/MlrsDLW
 xb+7eRALnAF7s6XnjQzz7sc3y9ih810f/8yLeRr0zFwz96hj54nBHrXR6VPg=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (markus.elfring[at]web.de)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1igobz-00EUDi-6q
Subject: Re: [f2fs-dev] [RFC PATCH v5] f2fs: support data compression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

4oCmCj4gKysrIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4gQEAgLTAsMCArMSwxMTM5IEBACuKApgo+
ICtib29sIGYyZnNfaXNfY29tcHJlc3NlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+ICt7Cj4g
KwlpZiAoIVBhZ2VQcml2YXRlKHBhZ2UpKQo+ICsJCXJldHVybiBmYWxzZTsKPiArCWlmICghcGFn
ZV9wcml2YXRlKHBhZ2UpKQo+ICsJCXJldHVybiBmYWxzZTsKPiArCWlmIChJU19BVE9NSUNfV1JJ
VFRFTl9QQUdFKHBhZ2UpIHx8IElTX0RVTU1ZX1dSSVRURU5fUEFHRShwYWdlKSkKPiArCQlyZXR1
cm4gZmFsc2U7CuKApgoKSG93IGRvIHlvdSB0aGluayBhYm91dCB0byBjb21iaW5lIGNvbmRpdGlv
biBjaGVja3MgbGlrZSB0aGUgZm9sbG93aW5nPwoKKwlpZiAoIVBhZ2VQcml2YXRlKHBhZ2UpIHx8
ICFwYWdlX3ByaXZhdGUocGFnZSkgfHwKKwkgICAgSVNfQVRPTUlDX1dSSVRURU5fUEFHRShwYWdl
KSB8fCBJU19EVU1NWV9XUklUVEVOX1BBR0UocGFnZSkpCisJCXJldHVybiBmYWxzZTsKCgpXb3Vs
ZCB5b3UgbGlrZSB0byBhcHBseSBzaW1pbGFyIHRyYW5zZm9ybWF0aW9ucyBhdCBvdGhlciBzb3Vy
Y2UgY29kZSBwbGFjZXM/CgpSZWdhcmRzLApNYXJrdXMKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
