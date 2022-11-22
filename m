Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7373E633366
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Nov 2022 03:37:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxJ9t-00024v-Cn;
	Tue, 22 Nov 2022 02:37:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1oxJ9r-00024o-RB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 02:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Eata4B+kgbb29SLg8P0D9QKqh1xrqopaU+U9QFKitM=; b=Co7jKPwYr2Ojvpv8qtsJ0UJo94
 /oDpWS2BGaKqPh1YglBoFXvEZveZhE/HZwu+j0gHoCsBGcjJa6KIZVt6+Tn6lRw2YCgiaG/h74VQ4
 Ajie5S0DJGroG+0jyYdEvr1wXMTGhxeMcZqxbEBn1Vh4rwu4oQoVDCJFdwhLbaoz6rAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:To:From
 :Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9Eata4B+kgbb29SLg8P0D9QKqh1xrqopaU+U9QFKitM=; b=d
 aX40VM58i7eXqSxZ4IuuwSktZutETGcqm8h32Pv+KDQU8kuviBTwdmfU4FLehLo/jTRaE0MhWSe6m
 UylwJzbxH4OyKKb3n1JsGWUff55rgaUr3Heq9ld4AGFF+SwhWp9kvIDDD12iJG5kTVeI1mFDpgsGl
 ZhU0KF5kyJA21FOk=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxJ9o-00A9ln-Td for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 02:37:11 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20221122023658epoutp032b59de93151cf80a7cd24e773f4da91f~px53zX1ah0189901899epoutp03P
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Nov 2022 02:36:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20221122023658epoutp032b59de93151cf80a7cd24e773f4da91f~px53zX1ah0189901899epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1669084618;
 bh=9Eata4B+kgbb29SLg8P0D9QKqh1xrqopaU+U9QFKitM=;
 h=Subject:Reply-To:From:To:Date:References:From;
 b=vS/gr5p5K4IDK6wextLnWf6ijGagMDULnUjYZaCc6kqIOXN9fj3LQUCDaiW9eFJGa
 c4CYdaXbb2Bfyy4/IQ9WO2JA0exBE1VWOmh3c0gTQpdhR1xq7ieUykDe86YI7kuOss
 6Mp5R1PW1OnftGcvPGTJcqzwaVb8n8ofGkKp6wCw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20221122023657epcas2p40179ba2ae289fb1a9618df903de5280f~px53Yoydb2507025070epcas2p4u;
 Tue, 22 Nov 2022 02:36:57 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.92]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4NGT1515Dhz4x9Pv; Tue, 22 Nov
 2022 02:36:57 +0000 (GMT)
X-AuditID: b6c32a48-64bff7000001494a-fd-637c35c932f6
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 A2.AF.18762.9C53C736; Tue, 22 Nov 2022 11:36:57 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20221122023656epcms2p4468d4feb97711516206e19890dad09ac@epcms2p4>
Date: Tue, 22 Nov 2022 11:36:56 +0900
X-CMS-MailID: 20221122023656epcms2p4468d4feb97711516206e19890dad09ac
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGKsWRmVeSWpSXmKPExsWy7bCmhe5J05pkg2MLWCxOTz3LZPFk/Sxm
 i0uL3C0u75rDZjH1/BEmB1aPTas62Tx2L/jM5NG3ZRWjx+dNcgEsUdk2GamJKalFCql5yfkp
 mXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUBrlRTKEnNKgUIBicXFSvp2NkX5
 pSWpChn5xSW2SqkFKTkF5gV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGf0NPYwFD6QqLu1eyNjA
 2CbVxcjOISFgIrE1u4uRi0NIYAejxK1V+xi7GDk4eAUEJf7uEO5i5OQQFvCXmHH+IAuILSSg
 JHHtQC8LRFxfYvPiZewgNpuArsTfDcvBbBGBV4wSZ1aLgtgSArwSM9qfskDY0hLbl29lhLA1
 JH4s62WGsEUlbq5+yw5jvz82H6pGRKL13lmoGkGJBz93Q8UlJRYdOs8EYedL/F1xnQ3CrpHY
 2tAGFdeXuNaxEWwvr4CvxOWOLjCbRUBV4sCnq1A1LhJNVzrB9jILaEssW/iaGeR1ZgFNifW7
 9EFMCQFliSO3WCAq+CQ6Dv9lh/lqx7wnUFPUJDZv2swKYctIXHjcBnWlh8T9D7fAJgoJBEqs
 WsU+gVF+FiJoZyFZOwth7QJG5lWMYqkFxbnpqcVGBSbwuEzOz93ECE5wWh47GGe//aB3iJGJ
 g/EQowQHs5IIb31MdbIQb0piZVVqUX58UWlOavEhRlOghycyS4km5wNTbF5JvKGJpYGJmZmh
 uZGpgbmSOG/XDK1kIYH0xJLU7NTUgtQimD4mDk6pBia+wl9Hc6bvlMrXZfwhKbjEaZXqCsEo
 xerreTbOnjaKfQderFRblM//4F5ohlWe9WnLpJLgQ+vE1R5cm3vv7K6IIGH9oJ3x2+3ctYJ/
 mBXcSD15r9e5d4nY7pV3V7buj6rhq4wWW/n/qYWLWle755GshJeShecCEjZc1s3j6Q6ZdLWR
 e65jZfw6z6PZj//fCUld69GU0JTEJXx88rxjjLz1N/ZMXT9nmoTNjY4lb9l23PxRZHqg4d99
 9kkHOf7utO/fsPDP28SY3V/mTFq+UuJI987vEVO/fHI5N0/5g8O5xrYDuhnL9pwJdOK8eo9v
 8fX9zFkz112Ymers4pRlNbOzsmDLKoUnuxO+5699aPtDiaU4I9FQi7moOBEA8J3jIfkDAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221102100756epcms2p23dfabe90c467313ce094c5c81a99c6d7
References: <CGME20221102100756epcms2p23dfabe90c467313ce094c5c81a99c6d7@epcms2p4>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  When f2fs chooses GC victim in large section & LFS mode,
    next_victim_seg[gc_type] is referenced first. After segment is freed,
    next_victim_seg[gc_type] has the next segment numbe [...] 
 
 Content analysis details:   (-3.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [203.254.224.33 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [203.254.224.33 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oxJ9o-00A9ln-Td
Subject: [f2fs-dev] [PATCH v1] f2fs: avoid victim selection from previous
 victim section
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
Reply-To: yonggil.song@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

V2hlbsKgZjJmc8KgY2hvb3Nlc8KgR0PCoHZpY3RpbcKgaW7CoGxhcmdlwqBzZWN0aW9uwqAmwqBM
RlPCoG1vZGUsDQpuZXh0X3ZpY3RpbV9zZWdbZ2NfdHlwZV3CoGlzwqByZWZlcmVuY2VkwqBmaXJz
dC7CoEFmdGVywqBzZWdtZW50wqBpc8KgZnJlZWQsDQpuZXh0X3ZpY3RpbV9zZWdbZ2NfdHlwZV3C
oGhhc8KgdGhlwqBuZXh0wqBzZWdtZW50wqBudW1iZXIuDQpIb3dldmVyLMKgbmV4dF92aWN0aW1f
c2VnW2djX3R5cGVdwqBzdGlsbMKgaGFzwqB0aGXCoGxhc3TCoHNlZ21lbnTCoG51bWJlcg0KZXZl
bsKgYWZ0ZXLCoHRoZcKgbGFzdMKgc2VnbWVudMKgb2bCoHNlY3Rpb27CoGlzwqBmcmVlZC7CoElu
wqB0aGlzwqBjYXNlLMKgd2hlbsKgZjJmcw0KY2hvb3Nlc8KgYcKgdmljdGltwqBmb3LCoHRoZcKg
bmV4dMKgR0PCoHJvdW5kLMKgdGhlwqBsYXN0wqBzZWdtZW50wqBvZsKgcHJldmlvdXPCoHZpY3Rp
bQ0Kc2VjdGlvbsKgaXPCoGNob3NlbsKgYXPCoGHCoHZpY3RpbS4NCg0KSW5pdGlhbGl6ZcKgbmV4
dF92aWN0aW1fc2VnW2djX3R5cGVdwqB0b8KgTlVMTF9TRUdOT8KgZm9ywqB0aGXCoGxhc3TCoHNl
Z21lbnTCoGluDQpsYXJnZcKgc2VjdGlvbi4NCg0KRml4ZXM6IGUzMDgwYjAxMjBhMSAoImYyZnM6
IHN1cHBvcnQgc3Vic2VjdGlvbmFsIGdhcmJhZ2UgY29sbGVjdGlvbiIpDQpTaWduZWQtb2ZmLWJ5
OsKgWW9uZ2dpbMKgU29uZ8KgPHlvbmdnaWwuc29uZ0BzYW1zdW5nLmNvbT4NCi0tLQ0KwqBmcy9m
MmZzL2djLmPCoHzCoDXCoCsrKy0tDQrCoDHCoGZpbGXCoGNoYW5nZWQswqAzwqBpbnNlcnRpb25z
KCspLMKgMsKgZGVsZXRpb25zKC0pDQoNCmRpZmbCoC0tZ2l0wqBhL2ZzL2YyZnMvZ2MuY8KgYi9m
cy9mMmZzL2djLmMNCmluZGV4wqA0NTQ2ZTAxYjJlZTAuLjEwNjc3ZDUzZWYwZcKgMTAwNjQ0DQot
LS3CoGEvZnMvZjJmcy9nYy5jDQorKyvCoGIvZnMvZjJmcy9nYy5jDQpAQMKgLTE3NDQsOMKgKzE3
NDQsOcKgQEDCoHN0YXRpY8KgaW50wqBkb19nYXJiYWdlX2NvbGxlY3Qoc3RydWN0wqBmMmZzX3Ni
X2luZm/CoCpzYmksDQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnZXRfdmFsaWRfYmxvY2tzKHNiaSzCoHNlZ25vLMKgZmFs
c2UpwqA9PcKgMCkNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgc2VnX2ZyZWVkKys7DQrCoA0KLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aWbCoChfX2lzX2xhcmdlX3NlY3Rpb24oc2JpKcKgJibCoHNlZ25vwqArwqAxwqA8wqBlbmRfc2Vn
bm8pDQotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2Jp
LT5uZXh0X3ZpY3RpbV9zZWdbZ2NfdHlwZV3CoD3CoHNlZ25vwqArwqAxOw0KK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaWbCoChfX2lzX2xhcmdlX3NlY3Rpb24oc2JpKSkNCivCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzYmktPm5leHRfdmlj
dGltX3NlZ1tnY190eXBlXcKgPQ0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoc2Vnbm/CoCvCoDHCoDzCoGVuZF9zZWdubynC
oD/CoHNlZ25vwqArwqAxwqA6wqBOVUxMX1NFR05POw0KwqBza2lwOg0KwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGYyZnNfcHV0X3BhZ2Uoc3VtX3BhZ2UswqAwKTsNCsKgwqDCoMKg
wqDCoMKgwqDCoH0NCi0twqANCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
