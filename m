Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D96313A9BC7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jun 2021 15:16:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltVOc-000689-EL; Wed, 16 Jun 2021 13:15:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1ltVOb-00067y-AL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 13:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:Cc:From:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OpJhhhWOLGhkv47Nv+L5WxkIlXgXK+jSe48mbh84yuA=; b=KW3bkxzMt4ptb9KNUeuMILszfe
 HcF6oxDfEd67XMy1pPdGA3Q2YumyHcysSbM8D+ewt4UGKn4S3/iwP2rTrOYkce4nJtAtqbBKXyVVL
 tmmAbwCqs/3WDfBltUXqKlJgVmWKvrS1iYRBKQlyFgz6Ap7HnK3rD/ktaTZjz7lYt58s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:Cc:From:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OpJhhhWOLGhkv47Nv+L5WxkIlXgXK+jSe48mbh84yuA=; b=dP9+Tl/u/7HSMDoT37HlpoGwzo
 4jVZJIWBaMvEo5vUFLrddUnM98MuBV7ER+s2tkkuEGytC7IIpH8v0EoCk9hJAtcIhlBpMEo/RjJ/w
 Pw5bXekn2zVwS+/nCGlgAZD/EyRgvuMv7dqFBeovoZPc1U23EpxBhVeE11zTnBODYlXM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltVOT-00CN7J-IZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 13:15:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92CD661164;
 Wed, 16 Jun 2021 13:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623849340;
 bh=dZGU8gWrVEjcpi8gJBee47OaFc0kjuWd3YMGK0b5FhM=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=mctm5ccVm1OdUd/+uZQSai00F1OTwsnd1a8s2FV/6RMCyrHUdMld4OKPHG94C+QrO
 TBiFi7rHw1DL8hzcdDaHEnHypzwAELq8FFJlOMNFc+BcPpN61Ta3pRnH4nocaQoV6I
 RscLvLMp+NdvlZSE7mxvtzyTSlYYyViGw76CqyvV4aK5rIs0HUv3AhhQK1RTf9eXlm
 TebUBTI3dmZelnUVpLwzUXjWn0uPioNSezpo2THB3OkTJGJ2KgINkyFQhAvcKbxyeQ
 VH/b3OLuu0dWxmANAsQ7hundklnI97hWlzuI6JvEthFBbbvvL+6deQXLSYhLiX7b8c
 d8GHnb4zRGvEg==
To: Sun Ke <sunke32@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20210611112211.1408767-1-sunke32@huawei.com>
 <20210611112211.1408767-2-sunke32@huawei.com>
 <1ea6a853-d892-4c3e-d023-72adc379b803@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <aa3fef51-5633-800a-1d93-cbfb66453c2a@kernel.org>
Date: Wed, 16 Jun 2021 21:15:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1ea6a853-d892-4c3e-d023-72adc379b803@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ltVOT-00CN7J-IZ
Subject: Re: [f2fs-dev] [PATCH] generic/103: leave more space for f2fs
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
Cc: guan@eryu.me, fstests@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS82LzE1IDExOjI4LCBTdW4gS2Ugd3JvdGU6Cj4gdG8gbGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiAKPiDlnKggMjAyMS82LzExIDE5OjIyLCBTdW4gS2Ug5YaZ
6YGTOgo+PiBJdCBmYWlsZWQgb24gZjJmczoKPj4gwqDCoMKgwqDCoCBRQSBvdXRwdXQgY3JlYXRl
ZCBieSAxMDMKPj4gwqDCoMKgwqAgK2ZhbGxvY2F0ZTogTm8gc3BhY2UgbGVmdCBvbiBkZXZpY2UK
Pj4gwqDCoMKgwqDCoCBTaWxlbmNlIGlzIGdvbGRlbi4KPj4gwqDCoMKgwqAgLi4uCj4+Cj4+IFRy
eSB0byBsZWF2ZSB+NTEyS0IsIGJ1dCBkdXJpbmcgdGhlIGZhbGxvY2F0ZSwgZjJmcyB3aWxsIGJl
IGZpbGxlZC4KPj4gUHJvdmlkZSBlcnJvciBwcm9tcHQ6ICJmYWxsb2NhdGU6IE5vIHNwYWNlIGxl
ZnQgb24gZGV2aWNlIi4KPj4KPj4gTGVhdmUgbW9yZSBzcGFjZSBmb3IgZjJmcy4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogU3VuIEtlIDxzdW5rZTMyQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiBJIGFkZCBz
b21lIHRlc3QgY29kZQo+PiDCoMKgwqDCoCvCoMKgwqDCoMKgwqAgZGYKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBhdmFpbD1gX2dldF9hdmFpbGFibGVfc3BhY2UgJFNDUkFUQ0hfTU5UYAo+PiDC
oMKgwqDCoCvCoMKgwqDCoMKgwqAgZWNobyAiYXZhaWwgPSAke2F2YWlsfSIKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBmaWxlc2l6ZWtiPSQoKGF2YWlsIC8gMTAyNCAtIDUxMikpCj4+IMKgwqDC
oMKgK8KgwqDCoMKgwqDCoCBlY2hvICJmaWxlc2l6ZWtiID0gJHtmaWxlc2l6ZWtifSIKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAkWEZTX0lPX1BST0cgLWZjICJmYWxsb2MgMCAke2ZpbGVzaXpl
a2J9ayIgJGZpbGUKPj4gwqDCoMKgwqArwqDCoMKgwqDCoMKgIGRmCj4+IMKgwqDCoMKgfQo+Pgo+
PiBmMmZzOgo+PiDCoMKgwqDCoFFBIG91dHB1dCBjcmVhdGVkIGJ5IDEwMwo+PiDCoMKgwqDCoCtG
aWxlc3lzdGVtwqDCoMKgwqDCoMKgIDFLLWJsb2Nrc8KgwqDCoMKgwqDCoCBVc2VkwqDCoCBBdmFp
bGFibGUgVXNlJSBNb3VudGVkIG9uCj4+IMKgwqDCoMKgLi4uCj4+IMKgwqDCoMKgKy9kZXYvc2Ri
wqDCoMKgwqDCoMKgwqDCoMKgIDEyNTgwODY0wqDCoMKgwqAgNTUzMjkywqDCoMKgIDEyMDI3NTcy
wqDCoCA1JSAvbW50L3NjcmF0Y2gKPj4gwqDCoMKgwqArYXZhaWwgPSAxMjMxNjIzMzcyOAo+PiDC
oMKgwqDCoCtmaWxlc2l6ZWtiID0gMTIwMjcwNjAKPj4gwqDCoMKgwqArZmFsbG9jYXRlOiBObyBz
cGFjZSBsZWZ0IG9uIGRldmljZQo+PiDCoMKgwqDCoCtGaWxlc3lzdGVtwqDCoMKgwqDCoMKgIDFL
LWJsb2Nrc8KgwqDCoMKgwqDCoCBVc2VkwqDCoCBBdmFpbGFibGUgVXNlJSBNb3VudGVkIG9uCj4+
IMKgwqDCoMKgLi4uCj4+IMKgwqDCoMKgKy9kZXYvc2RiwqDCoMKgwqDCoMKgwqDCoMKgIDEyNTgw
ODY0wqDCoCAxMjU4MDg2NMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAgMTAwJSAvbW50L3NjcmF0Y2gK
Pj4gwqDCoMKgwqBTaWxlbmNlIGlzIGdvbGRlbi4KPj4KPj4geGZzOgo+PiDCoMKgwqDCoFFBIG91
dHB1dCBjcmVhdGVkIGJ5IDEwMwo+PiDCoMKgwqDCoCtGaWxlc3lzdGVtwqDCoMKgwqDCoMKgIDFL
LWJsb2Nrc8KgwqDCoMKgwqDCoCBVc2VkwqDCoCBBdmFpbGFibGUgVXNlJSBNb3VudGVkIG9uCj4+
IMKgwqDCoMKgLi4uCj4+IMKgwqDCoMKgKy9kZXYvc2RiwqDCoMKgwqDCoMKgwqDCoMKgIDEyNTcy
NjcywqDCoMKgwqAgMTIwODI4wqDCoMKgIDEyNDUxODQ0wqDCoCAxJSAvbW50L3NjcmF0Y2gKPj4g
wqDCoMKgwqArYXZhaWwgPSAxMjc1MDY4ODI1Ngo+PiDCoMKgwqDCoCtmaWxlc2l6ZWtiID0gMTI0
NTEzMzIKPj4gwqDCoMKgwqArRmlsZXN5c3RlbcKgwqDCoMKgwqDCoCAxSy1ibG9ja3PCoMKgwqDC
oMKgwqAgVXNlZMKgwqAgQXZhaWxhYmxlIFVzZSUgTW91bnRlZCBvbgo+PiDCoMKgwqDCoC4uLgo+
PiDCoMKgwqDCoCsvZGV2L3NkYsKgwqDCoMKgwqDCoMKgwqDCoCAxMjU3MjY3MsKgwqAgMTI1NzIx
NjDCoMKgwqDCoMKgwqDCoMKgIDUxMiAxMDAlIC9tbnQvc2NyYXRjaAo+PiDCoMKgwqDCoFNpbGVu
Y2UgaXMgZ29sZGVuLgo+Pgo+PiBleHQ0Ogo+PiDCoMKgwqDCoFFBIG91dHB1dCBjcmVhdGVkIGJ5
IDEwMwo+PiDCoMKgwqDCoCtGaWxlc3lzdGVtwqDCoMKgwqDCoMKgIDFLLWJsb2Nrc8KgwqDCoMKg
wqDCoCBVc2VkwqDCoCBBdmFpbGFibGUgVXNlJSBNb3VudGVkIG9uCj4+IMKgwqDCoMKgLi4uCj4+
IMKgwqDCoMKgKy9kZXYvc2RiwqDCoMKgwqDCoMKgwqDCoMKgIDEyMzE5ODgwwqDCoMKgwqDCoCA0
MTA0OMKgwqDCoCAxMTYzMzMwNMKgwqAgMSUgL21udC9zY3JhdGNoCj4+IMKgwqDCoMKgK2F2YWls
ID0gMTE5MTI1MDMyOTYKPj4gwqDCoMKgwqArZmlsZXNpemVrYiA9IDExNjMyNzkyCj4+IMKgwqDC
oMKgK0ZpbGVzeXN0ZW3CoMKgwqDCoMKgwqAgMUstYmxvY2tzwqDCoMKgwqDCoMKgIFVzZWTCoMKg
IEF2YWlsYWJsZSBVc2UlIE1vdW50ZWQgb24KPj4gwqDCoMKgwqAuLi4KPj4gwqDCoMKgwqArL2Rl
di9zZGLCoMKgwqDCoMKgwqDCoMKgwqAgMTIzMTk4ODDCoMKgIDExNjczODQ0wqDCoMKgwqDCoMKg
wqDCoCA1MDggMTAwJSAvbW50L3NjcmF0Y2gKPj4gwqDCoMKgwqBTaWxlbmNlIGlzIGdvbGRlbi4K
Pj4KPj4gYWZ0ZXIgY2hhbmdlIChmMmZzKQo+PiDCoMKgwqDCoFFBIG91dHB1dCBjcmVhdGVkIGJ5
IDEwMwo+PiDCoMKgwqDCoEZpbGVzeXN0ZW3CoMKgwqDCoMKgwqAgMUstYmxvY2tzwqDCoMKgwqDC
oMKgIFVzZWTCoMKgIEF2YWlsYWJsZSBVc2UlIE1vdW50ZWQgb24KPj4gwqDCoMKgwqAuLi4KPj4g
wqDCoMKgwqAvZGV2L3NkYsKgwqDCoMKgwqDCoMKgwqDCoCAxMjU4MDg2NMKgwqAgMTI1ODAzOTbC
oMKgwqDCoMKgwqDCoMKgIDQ2OCAxMDAlIC90bXAvc2NyYXRjaAo+PiDCoMKgwqDCoFNpbGVuY2Ug
aXMgZ29sZGVuLgo+Pgo+PiDCoCB0ZXN0cy9nZW5lcmljLzEwMyB8IDEwICsrKysrKysrKy0KPj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvdGVzdHMvZ2VuZXJpYy8xMDMgYi90ZXN0cy9nZW5lcmljLzEwMwo+PiBpbmRl
eCBiMjJiMDE1OTYyM2UuLmRmY2UzODcwNzgxYyAxMDA3NTUKPj4gLS0tIGEvdGVzdHMvZ2VuZXJp
Yy8xMDMKPj4gKysrIGIvdGVzdHMvZ2VuZXJpYy8xMDMKPj4gQEAgLTQwLDEwICs0MCwxOCBAQCBy
bSAtZiAkc2VxcmVzLmZ1bGwKPj4gwqAgX2NvbnN1bWVfZnJlZXNwKCkKPj4gwqAgewo+PiDCoMKg
wqDCoMKgIGZpbGU9JDEKPj4gK8KgwqDCoCBsZWF2ZT01MTIKPj4gKwo+PiArwqDCoMKgICMgVHJ5
IHRvIGxlYXZlIH41MTJLQiwgYnV0IGR1cmluZyB0aGUgZmFsbG9jYXRlLCBmMmZzIHdpbGwgYmUg
ZmlsbGVkLgo+PiArwqDCoMKgICMgUHJvdmlkZSBlcnJvciBwcm9tcHQ6ICJmYWxsb2NhdGU6IE5v
IHNwYWNlIGxlZnQgb24gZGV2aWNlIi4gTGVhdmUKPj4gK8KgwqDCoCAjIG1vcmUgc3BhY2UgZm9y
IGYyZnMuCj4+ICvCoMKgwqAgaWYgWyAkRlNUWVAgPT0gImYyZnMiIF07IHRoZW4KPj4gK8KgwqDC
oMKgwqDCoMKgIGxlYXZlPTEyMjg4Cj4+ICvCoMKgwqAgZmkKPj4gwqDCoMKgwqDCoCAjIGNvbnN1
bWUgbmVhcmx5IGFsbCBhdmFpbGFibGUgc3BhY2UgKGxlYXZlIH41MTJrQikKPj4gwqDCoMKgwqDC
oCBhdmFpbD1gX2dldF9hdmFpbGFibGVfc3BhY2UgJFNDUkFUQ0hfTU5UYAoKICAgICAgICAgaWYg
WyAkRlNUWVAgPT0gImYyZnMiIF07IHRoZW4KICAgICAgICAgICAgICAgICBsZWZ0PSQoKGxlZnQg
KyBhdmFpbCAvIDEwMjQwMDApKQogICAgICAgICBmaQoKZjJmcyB1c2VzIGluZGV4KHJhZGl4KSB0
cmVlIGFzIG1hcHBpbmcgbWV0YWRhdGEsIGl0cyBzcGFjZSBvdmVyaGVhZAppcyBhYm91dCBvbmUg
dGhvdXNhbmR0aCBvZiB0aGUgZGF0YSwgc28gY2FuIHlvdSBwbGVhc2UgdHJ5IGFib3ZlCmNhbGN1
bGF0aW9uPwoKVGhhbmtzLAoKPj4gLcKgwqDCoCBmaWxlc2l6ZWtiPSQoKGF2YWlsIC8gMTAyNCAt
IDUxMikpCj4+ICvCoMKgwqAgZmlsZXNpemVrYj0kKChhdmFpbCAvIDEwMjQgLSAkbGVhdmUpKQo+
PiDCoMKgwqDCoMKgICRYRlNfSU9fUFJPRyAtZmMgImZhbGxvYyAwICR7ZmlsZXNpemVrYn1rIiAk
ZmlsZQo+PiDCoCB9Cj4+Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
