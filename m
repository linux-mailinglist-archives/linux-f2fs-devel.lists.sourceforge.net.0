Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE96222BDE0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 08:05:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyqpV-0002Oh-9T; Fri, 24 Jul 2020 06:05:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <Markus.Elfring@web.de>) id 1jyqpU-0002OW-2N
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 06:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:From:Subject:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IZqya46lb9WZbs07Xpn4biD4AoQ4Sq63+0pbH+Tqyuk=; b=eUya8help688OTP/MU4CUCX8az
 RaYMR+kB4ThaV0wse5LXpPfIHGBMd+LYianinBSNfN7yapLuWWBEDVNZUTujL+s6yRV+PiRH1Frqx
 2IvCvqqRlvufv4ZMM276rlVmxhGqf5HWDycbgDh7mFM8HAHaSFIfKtwfBVikcPgiYePo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:From:
 Subject:Cc:To:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IZqya46lb9WZbs07Xpn4biD4AoQ4Sq63+0pbH+Tqyuk=; b=d
 ffi7CRnTDlM68+9C/neDSFWHTdoAJ07PbCkwUb8awe/by36/5xsw/XDCyZGZL1GplI6nVGZ8a79De
 jpUgaK31WPFMLUlQRT3OmC03UWiBS28cbWmBii/NnCstOlxaKSYiqFiIGcOxJuwCLHyqAKvt24E6s
 jLjJz7b7eCtHwBTQ=;
Received: from mout.web.de ([212.227.15.14])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyqpO-007CV4-ED
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 06:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1595570685;
 bh=IZqya46lb9WZbs07Xpn4biD4AoQ4Sq63+0pbH+Tqyuk=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=Uxi47DSO2n8rhSUqGdX1MaPAryFyj/aN2xSOqPHLCRxio92uSIbQAEysVGydF1TTz
 u5NWnu5NsXhdbAMpHjkNhaWv3cYv8TRYhLJXg/XR2Jf3+S9NZjaQJONPSXJe9wYyxQ
 wlvU5qBfskrL1qBk6eteUapnJLN5Kxi36rlkX90Y=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.46.40]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MVLsk-1kJ4ok3OgA-00YfDv; Fri, 24
 Jul 2020 08:04:44 +0200
To: Li Guifu <bluce.liguifu@huawei.com>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <9236e712-cd98-1f6c-4bcd-4dcabbae6461@web.de>
Date: Fri, 24 Jul 2020 08:04:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:fuzp87DJDEQCI6qvpTtr9jdI+2HbuahdBu9BeD36lTkaR5Ahprk
 XZweJZFWJA4q4bCCZGrgMvg1vSbyk/osrT/RKh+yyxsMZDqNqgrqNCpO+rBff3gfCireqor
 I0IoT4w2gylJOOUR4JTetXStW47DbKE4V+5JwYsqkpx1oy8BbFawxK5zoKor5WJ7ZiGp79E
 54cJgYD3IJwkVdh3TX42Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/7M/G5g1ptM=:R4yt1ZNic3t7hRP5xF48Bu
 zhnFdY1w+XdFCZsA3ZSNO9zK003NXMEjHM1Y2rgVpln0NjQ6LAMn/IUE9XC1/DKEwggGSyJPb
 EJ67m5KCYWviqw0lU2AJGyiDhkR78weGWhMzYDvyVlysIHuk6Dd8ZK6NOGrMuzxBOyQSVNxkS
 Runiaf6XRArXGFh6IEtzpm14WL068MoSWtWDA2ewvan3gGDl+sOFZvld3H1QgNNbTBaXWr1NL
 StzZ7IBWv+BqVZ6znMRkW5NXc2ixaAM+44jysAMEojJkvs1i6N0TkAZIx+y+CU92l7jhxgDIS
 Btvt6jVpo2hkrVPsdJSvj2dtB2Ywg1mrd6RUloxWEG8HlhpUZL4ANIkoO4mwqB5f0Ikukeki2
 esoGtaTaN9jB5tELehpy06g3qpycbL8F3NXB2nWDpRzE7Ym/AYqSgicZEX9nBI3ZuunzQ6p2j
 /JxtdRWu/2z/zuHuld98qD3fyljTG3su3n0tfPp8UCO3mee2mugZhl4XasgdIaJRmACn/Pt/I
 zLqhvlc5h2mTGaW5Lgn70vWsAxy5MV4lKhtEHWB2AivH1df1Q7W/PGrA97mNhpYyixiRXVJhP
 AkIAmTkX4isz2ElPHcoYG9Q/+4DO7Qg44fWoVxqUGRaebANu+Xf/akQWkoEJ5L+zLmfOve5ZS
 vubJWO/u5J3rVtMCOsO7BljUp3zNz2waIlTb5Sjs+ompzKMvVddpSS4aOfEGeJ1hT3z7ouNBW
 G1W3pDCXjlYrkS/Qf5QciLOpIL6dJ4R76Xpa2zEgBGYOnxJkDLxk9fTy5rPkORXfK0/IM6cSQ
 hpPI9dvNKR9NwquMWSwRV3keJvJ/WTcGXQpcusRgJRKRHx+KCk+is8lO6S0hezXQ7B9o3m+1h
 Bm6aBWf5Ao6Ahi3vGblrto5R2fPP9LmFPHkdtbcf3lpU3LxRqNk86SXcFtiZdBsQLXLjwh3rj
 xLBiOwk2eoDM6VV4R/qjq9LD7Fdwsz/vcr5Am6OTDntJ1reM/u3LqBcdyv909fqwlRDUjTNkl
 v1XXLZAJUyiUaERdR6rQ+fE8Gv0QWh03hpzXlGPpAiiQxajcIwOdiGm77GHPZGXnrQ7r4dq0m
 3GOe3Y6Zgu72hA9jnxOtKKy8FtUfzQyChFUyj1a1bm5TLOu6h8pAJfCvb5Uej3L3JO1MOmjcK
 3JBv9KgBQiNIgbNwko0I8KiS3lZH7QFG6xjhsr+iunaF44jok43WOgg8hXHriSrZQonWX6F6k
 4BuHB9v9b7x+SZKPW9+DPg9B6CHM6dZUN7zxwQA==
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (markus.elfring[at]web.de)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [212.227.15.14 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jyqpO-007CV4-ED
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix use-after-free issue in
 f2fs_put_super()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBEdXJpbmcgdW1vdW50LCDigKYKCkRvIHlvdSByZWZlciB0byB0aGUgYWN0aW9uIOKAnHVubW91
bnTigJ0gaGVyZT8KCgo+IGYyZnNfZGVzdHJveV9zZWdtZW50X21hbmFnZXIoKSwgaXQgbWF5IGNh
dXNlIOKApgoKV29yZGluZyBhZGp1c3RtZW50czoKZjJmc19kZXN0cm95X3NlZ21lbnRfbWFuYWdl
cigpLiBJdCBtaWdodCBjYXVzZSDigKYKCgo+IOKApiB3aXRoIHByb2NmcyBhY2Nlc3NpbmcsIOKA
pgoKQXZvaWQgYW5vdGhlciB0eXBvPzoK4oCmIHdpdGggcHJvY2ZzIGFjY2Vzc2VzLCDigKYKCgo+
IOKApiwgZml4IGl0IGJ5IOKApgoKUGxlYXNlIHJlcGxhY2UgdGhpcyB3b3JkaW5nIGJ5IHRoZSB0
YWcg4oCcRml4ZXPigJ0uCgpSZWdhcmRzLApNYXJrdXMKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
