Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D9038BCEC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 May 2021 05:20:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ljvhh-0005TM-SO; Fri, 21 May 2021 03:20:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dwoo08.lee@samsung.com>) id 1ljvhg-0005T0-O6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 May 2021 03:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:MIME-Version:Date:Message-ID:From:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bmJcn6AtP9rQoxqjab4AfaAtk6XO9+bWDYAMHRCzSVk=; b=mNHVXHFiMwIaHva7D1SX2HkYDd
 atpGvKKkQ1EisTV6LHbGXqo7cE9iuykn8KjcOVAsL5s2Xmf8zIOx61/MQpIve+moUCEOmzktVKfrp
 aqFHShBTqfm7ZVXsIv5VQj+cOkA+TfoYc6J9BEchn2UH+UcMkAoVje0RrSk5Vvf28Zmw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 MIME-Version:Date:Message-ID:From:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bmJcn6AtP9rQoxqjab4AfaAtk6XO9+bWDYAMHRCzSVk=; b=LOyZ5FrmWuPCo0k9SVmjYboptT
 bcitKppxACNTeqfAkX/VosmMV2n8oHijUn3KeXGQQJYrT3RHc8KPmzJiBocV5G+FXSi5tiXSnQWN0
 695pYEo/79DrUWqedwGPeIFrZ+CJvP1X0OHixxefstQow1lDP3F18027rh5R4XiApmsc=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ljvhZ-00HLuh-Fy
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 May 2021 03:20:02 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210521031941epoutp038d565e605f2eb612696cf692d4bdcec6~A9sKmgQCP2682026820epoutp03j
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 May 2021 03:19:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210521031941epoutp038d565e605f2eb612696cf692d4bdcec6~A9sKmgQCP2682026820epoutp03j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1621567181;
 bh=bmJcn6AtP9rQoxqjab4AfaAtk6XO9+bWDYAMHRCzSVk=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=Rcsl8FdMUu8keVyKESybLRy4HT5w7YQDVNlc9YYOwfjaQrVM6huCve6Nl7VuBSTV3
 jYbXbPzlD8zGMXjoYTmeNOUt6Le339IDThIPSUBMVfMY9TeFizTr5AamdaRVJIow6C
 MCqV+waTsKgwLeWOi/Oh8hruqiHjCxc5JmyXu2Hw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210521031941epcas1p1c511027b74ba40a860a40839efb7dd78~A9sKXxuQO3246632466epcas1p1d;
 Fri, 21 May 2021 03:19:41 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.154]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4FmX0C0VMNz4x9Pw; Fri, 21 May
 2021 03:19:39 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 07.35.09824.AC627A06; Fri, 21 May 2021 12:19:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20210521031938epcas1p37ba89e1dc5beeeaf2c3f416dcb9652e9~A9sHRQE3q2479724797epcas1p3f;
 Fri, 21 May 2021 03:19:38 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210521031938epsmtrp2855ebef9fa4adb9b7211776745a06c8c~A9sHQssqU1260412604epsmtrp2B;
 Fri, 21 May 2021 03:19:38 +0000 (GMT)
X-AuditID: b6c32a37-04bff70000002660-86-60a726cada60
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B9.B6.08163.AC627A06; Fri, 21 May 2021 12:19:38 +0900 (KST)
Received: from [10.113.221.208] (unknown [10.113.221.208]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210521031938epsmtip2b97e70b3e93ffae15d7c0f0d3afc2834~A9sHI-h2j3126531265epsmtip2V;
 Fri, 21 May 2021 03:19:38 +0000 (GMT)
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
From: Dongwoo Lee <dwoo08.lee@samsung.com>
Message-ID: <dc7fd078-d577-e731-f6ad-98fd2031d95d@samsung.com>
Date: Fri, 21 May 2021 12:19:34 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d8a50e74-be7e-3242-c3af-2fc6b8ad10b8@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDKsWRmVeSWpSXmKPExsWy7bCmnu4pteUJBqtvyVucnnqWyeLSIncH
 Jo9NqzrZPHYv+MwUwBSVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtq
 q+TiE6DrlpkDNF5JoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BZoFecmFtcmpeu
 l5yfa2VoYGBkClSYkJ3xcuZttoKdYhUX21UbGD8JdTFyckgImEg8XzeHpYuRi0NIYAejxJSt
 59ggnE+MEkfmnGIHqRIS+Mwo8elYZhcjB1jHiaNpEOFdjBJbm2wg6t8zSlxdM4kFJCEsYCsx
 8/dXNhBbRMBV4vbEh2wgvWwCWhL7fxWDhHkF7CQerHsBVsIioCpx9NNpsFZRgQiJN58nsEDU
 CEqcnPkEzOYEql9+eS0jiM0sIC5x68l8JghbXqJ562xmkBskBPaxSzzat40J4jMXiYs/3rNB
 2MISr45vYYewpSQ+v9sLFa+W6L+wnxWiuYVR4m3HNRaIhLHE/qWTmUCOZhbQlFi/Sx8irCix
 8/dcqCP4JN597WGFhAmvREebEISpItH8kRlm07r3/6AGekhMOXmIGRJURxglZr99wDKBUWEW
 kjdnIXltFpLXZiEcsYCRZRWjWGpBcW56arFhgTFyTG9iBCc7LfMdjNPeftA7xMjEwXiIUYKD
 WUmEd7v34gQh3pTEyqrUovz4otKc1OJDjKbAgJ/ILCWanA9Mt3kl8YamRsbGxhYmhmamhoZK
 4rzpztUJQgLpiSWp2ampBalFMH1MHJxSDUwXbn+10Qj1cpHISmzw+WCku982YJtFd8T8L6fq
 Ms4V7bP3O31KTs0o5UWnjLS63MUZb0SuTXEIlGKQbtyRNoNf+cAhnq7JC2btqp7pdG49T/2r
 lzbnjS23pims1tx/p/CZRvu9euZKvfC4upzTdtEPfv3gWzQx5pf/VO2JAd87/j9frdS4lldv
 rdxm9wP7X66Kfb1lj+xeK5llnSmlDU/1OPeeqnnh/HFzyp9JtxQbf02q3hiZ11Pbec/FYp2t
 eK/+l7M539+d28XpruIwJWERozCnyFGlUoPsjPu2sw4yTuxleiAjWsrWpDv/6oNikxn1U6QU
 P7m9YJqy/uIBm/fWLmLLpkZN+8acrOC88oMSS3FGoqEWc1FxIgAwzvmT/wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHLMWRmVeSWpSXmKPExsWy7bCSvO4pteUJBi8es1qcnnqWyeLSIncH
 Jo9NqzrZPHYv+MwUwBTFZZOSmpNZllqkb5fAlfFy5m22gp1iFRfbVRsYPwl1MXJwSAiYSJw4
 mtbFyMUhJLCDUeL95sWMEHEpiX9vBCBMYYnDh4shSt4ySvy+sY2li5GTQ1jAVmLm769sILaI
 gKvE7YkP2SCKjjBK/Fn0hQWkmU1AS2L/r2KQGl4BO4kH616A1bMIqEoc/XQarERUIELi3jQm
 iBJBiZMzn4CN5wQqX355LSOIzSxgJjFv80NmCFtc4taT+UwQtrxE89bZzBMYBWchaZ+FpGUW
 kpZZSFoWMLKsYpRMLSjOTc8tNiwwykst1ytOzC0uzUvXS87P3cQIDmItrR2Me1Z90DvEyMTB
 eIhRgoNZSYR3u/fiBCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8F7pOxgsJpCeWpGanphakFsFk
 mTg4pRqYzJeXmasnSRw/NOXuz/eiqTuXCkR+uSe7WUQ5O+dgSVN0poZbojrr9x0vL91s8RS3
 927lSpPeZ2Xo8e9onayd5LNlt55vZXaw/J295MKlDYwxX/+vUTxxcMYM/uAiTaUns21y37xJ
 Kn6sZxCwVL4mn2mp8/T8/Rsq3ngzbF+6oC85cdqSQ87JBRv3pJ4MYhZIMxbzmtTXpei7afW/
 ycmv/nRv158UM+NoyNMSw50ab6yvxPksWqv5+fT7DVuswj7XdZxz/Tyn04jBuP3O8u0n1KLm
 mqjPc/eL9dJfsMQy+IutToZyTs2L+MBvBX+FGl4ImPM9l1EXYdn6YSWvtTb7gdN7AuoPbWS+
 tFjiuUaZEktxRqKhFnNRcSIAhKkNodECAAA=
X-CMS-MailID: 20210521031938epcas1p37ba89e1dc5beeeaf2c3f416dcb9652e9
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210512090846epcas1p1c19254a0f25b579c697a497fe94f68ad
References: <CGME20210512090846epcas1p1c19254a0f25b579c697a497fe94f68ad@epcas1p1.samsung.com>
 <20210512090842.162973-1-dwoo08.lee@samsung.com>
 <d8a50e74-be7e-3242-c3af-2fc6b8ad10b8@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ljvhZ-00HLuh-Fy
Subject: Re: [f2fs-dev] [PATCH v2] tools: Introduce f2fslabel
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAvMDUvMjAyMSAyMDoyNiwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIxLzUvMTIgMTc6MDgs
IERvbmd3b28gTGVlIHdyb3RlOgo+PiArI2lmZGVmIFdJVEhfTEFCRUwKPj4gK8KgwqDCoMKgwqDC
oMKgIGNvbnN0IGNoYXIgKm9wdGlvbl9zdHJpbmcgPSAiViI7Cj4+ICsKPj4gK8KgwqDCoMKgwqDC
oMKgIGMuZnVuYyA9IExBQkVMOwo+PiArwqDCoMKgwqDCoMKgwqAgd2hpbGUgKChvcHRpb24gPSBn
ZXRvcHQoYXJnYywgYXJndiwgb3B0aW9uX3N0cmluZykpICE9IEVPRikgewo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzd2l0Y2ggKG9wdGlvbikgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjYXNlICdWJzoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaG93X3ZlcnNp
b24ocHJvZyk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXhpdCgwKTsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBlcnIgPSBFVU5LTk9XTl9PUFQ7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGVyciAhPSBOT0VSUk9SKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArwqDCoMKgwqDCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqDC
oMKgwqDCoCBpZiAoYXJnYyA+IChvcHRpbmQgKyAyKSkgeyAvKiB1bmtub3duIGFyZ3VtZW50KHMp
IGlzKGFyZSkgCj4+IHBhc3NlZCAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvcHRpbmQg
Kz0gMjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gRVVOS05PV05fQVJHOwo+PiAr
wqDCoMKgwqDCoMKgwqAgfSBlbHNlIGlmIChhcmdjID09IChvcHRpbmQgKyAyKSkgeyAvKiBjaGFu
Z2UgbGFiZWwgKi8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYy52b2xfbGFiZWwgPSBzdHJk
dXAoYXJndltvcHRpbmQgKyAxXSk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFyZ2MtLTsK
Pj4gK8KgwqDCoMKgwqDCoMKgIH0gZWxzZSB7IC8qIHByaW50IGxhYmVsICovCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC8qCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBTaW5jZSB2
b2xfbGFiZWwgd2FzIGluaXRpYWxpemVkIGFzICIiLCBpbiBvcmRlciB0bwo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICogZGlzdGluZ3Vpc2ggYmV0d2VlbiBjbGVhciBsYWJlbCBhbmQgcHJp
bnQsIHNldAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdm9sX2xhYmVsIGFzIE5VTEwg
Zm9yIHByaW50IGNhc2UKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjLnZvbF9sYWJlbCA9IE5VTEw7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9
Cj4+ICsjZW5kaWYgLyogV0lUSF9MQUJFTCAqLwo+PiDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDC
oCBpZiAoZXJyID09IE5PRVJST1IpIHsKPj4gQEAgLTk3MSw2ICsxMDE0LDM2IEBAIHN0YXRpYyBp
bnQgZG9fc2xvYWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+PiDCoCB9Cj4+IMKgICNlbmRp
Zgo+PiArI2lmZGVmIFdJVEhfTEFCRUwKPj4gK3N0YXRpYyBpbnQgZG9fbGFiZWwoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBmMmZzX3N1cGVyX2Jsb2Nr
ICpzYiA9IEYyRlNfUkFXX1NVUEVSKHNiaSk7Cj4+ICsKPj4gK8KgwqDCoCBpZiAoIWMudm9sX2xh
YmVsKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBjaGFyIGxhYmVsW01BWF9WT0xVTUVfTkFNRV07Cj4+
ICsKPj4gK8KgwqDCoMKgwqDCoMKgIHV0ZjE2X3RvX3V0ZjgobGFiZWwsIHNiLT52b2x1bWVfbmFt
ZSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTUFYX1ZPTFVNRV9OQU1F
LCBNQVhfVk9MVU1FX05BTUUpOwo+PiArwqDCoMKgwqDCoMKgwqAgTVNHKDAsICJJbmZvOiB2b2x1
bWUgbGFiZWwgPSAlc1xuIiwgbGFiZWwpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+
ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgaWYgKHN0cmxlbihjLnZvbF9sYWJlbCkgPiBNQVhf
Vk9MVU1FX05BTUUpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIEVSUl9NU0coIkxhYmVsIHNob3VsZCBu
b3QgZXhjZWVkICVkIGNoYXJhY3RlcnNcbiIsIAo+PiBNQVhfVk9MVU1FX05BTUUpOwo+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIC0xOwo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIHV0Zjhf
dG9fdXRmMTYoc2ItPnZvbHVtZV9uYW1lLCAoY29uc3QgY2hhciAqKWMudm9sX2xhYmVsLAo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTUFYX1ZPTFVNRV9OQU1FLCBzdHJsZW4oYy52b2xf
bGFiZWwpKTsKPj4gKwo+PiArwqDCoMKgIHVwZGF0ZV9zdXBlcmJsb2NrKHNiLCBTQl9NQVNLX0FM
TCk7Cj4+ICsKPj4gK8KgwqDCoCBNU0coMCwgIkluZm86IHZvbHVtZSBsYWJlbCBpcyBjaGFuZ2Vk
IHRvICVzXG4iLCBjLnZvbF9sYWJlbCk7Cj4gCj4gSXQgbmVlZHMgdG8gZnJlZSBjLnZvbF9sYWJl
bCBoZXJlPwo+IAo+IFRoYW5rcywKPiAKClllcywgaXQgc2hvdWxkIGJlIGZyZWVkIGhlcmUgb3Ig
YWZ0ZXIgaWYgbm90IE5VTEwuCkJ1dCBpdCBzZWVtcyBiZSBiZXR0ZXIgdG8gYXNzaWduIG9wdGFy
ZyB0byBjLnZvbF9sYWJlbCBkaXJlY3RseSBpbnN0ZWFkIApvZiBzdHJkdXAgYXMgbGlrZSBta2Zz
IGRvLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
