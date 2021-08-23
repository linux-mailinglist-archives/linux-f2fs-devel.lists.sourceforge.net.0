Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7340E3F4A53
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Aug 2021 14:07:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mI8jr-0000b6-Gq; Mon, 23 Aug 2021 12:07:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mI8jp-0000as-PN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Aug 2021 12:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MpWw0GTRtz5PG9+o0Q1ExlMltndPAy1qdTKpJdDEeZ0=; b=Hbn/bRV1MuL1iLlymYtRJpmh6N
 7tA4eDkwHu+Bl5dS/4fyhujzXw06rh+HRuvJaecL+/k9HxOdC6kWJNQsB2SVNTNZMTxlZKfNvrm1O
 aCAB2jH4/Xq2mElATJqVtKyQsJJzxut079x31ju5hCHpbBDllCTLACfK4ZiXLGaVsSek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MpWw0GTRtz5PG9+o0Q1ExlMltndPAy1qdTKpJdDEeZ0=; b=LNeQBADGuURlbPoNDqQZxf06RP
 noHoUPdu6aMZnZkolgTn5JJdrtQCXG0As8KbqiDFwGajmL5urWCkAFBXp8myTnu2Nz1BgCAocLnDx
 TD4FROA5W3D6Keq9zKesGgUm0vDfZhMIt02XcIplYlimvpp5+sCqyKq0vkA6btjjeAwo=;
Received: from mail-m17635.qiye.163.com ([59.111.176.35])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mI8jl-0002H3-PV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Aug 2021 12:07:37 +0000
Received: from [172.25.44.145] (unknown [116.31.82.26])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id 3F53B4000E8;
 Mon, 23 Aug 2021 20:07:26 +0800 (CST)
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210729122522.149960-1-changfengnan@vivo.com>
 <9b1f01f4-66ed-3976-3efb-bd5fee347681@kernel.org>
 <YRWPetjv8PqbzzF/@google.com>
 <3b339c10-f4bc-48f4-4c77-84e904dfa9cb@kernel.org>
 <996dff14-19ec-5ce7-95c8-bb6487344705@vivo.com>
 <1a727d7f-081e-c7bf-fa4e-1dc5cbcdc4a2@kernel.org>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <bfad4789-a5a3-7879-ecaf-3812567c33a2@vivo.com>
Date: Mon, 23 Aug 2021 20:07:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1a727d7f-081e-c7bf-fa4e-1dc5cbcdc4a2@kernel.org>
Content-Language: en-US
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUNNTklWQ0NIS0lISEpNHR
 4eVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PjY6Gio4TT9DFwlMTzMxCiIP
 CDYwChhVSlVKTUlCTElLT09NTE9OVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WUpKTVVISlVDSVVJTVlXWQgBWUFNS09ONwY+
X-HM-Tid: 0a7b72e88586d991kuws3f53b4000e8
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.35 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mI8jl-0002H3-PV
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix missing inplace count in overwrite
 with direct io
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAyMDIxLzgvMjAgMTc6NDEsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyMS84LzE4IDExOjQ5
LCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+Pgo+Pgo+PiBPbiAyMDIxLzgvMTMgOTozNiwgQ2hhbyBZ
dSB3cm90ZToKPj4+IE9uIDIwMjEvOC8xMyA1OjE1LCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+PiBP
biAwOC8wNiwgQ2hhbyBZdSB3cm90ZToKPj4+Pj4gT24gMjAyMS83LzI5IDIwOjI1LCBGZW5nbmFu
IENoYW5nIHdyb3RlOgo+Pj4+Pj4gRm9yIG5vdywgb3ZlcndyaXRlIGZpbGUgd2l0aCBkaXJlY3Qg
aW8gdXNlIGlucGxhY2UgcG9saWN5LCBidXQgbm90Cj4+Pj4+PiBjb3VudGVkLCBmaXggaXQuCj4+
Pj4+Cj4+Pj4+IElNTywgTEZTL1NTUi9JUFUgc3RhdHMgaW4gZGVidWdmcyB3YXMgZm9yIGJ1ZmZl
cmVkIHdyaXRlLCBtYXliZSB3ZQo+Pj4+PiBuZWVkIHRvIGFkZCBzZXBhcmF0ZWQgb25lIGZvciBE
SU8uCj4+Pj4KPj4+PiBEbyB3ZSByZWFsbHkgbmVlZCB0byBtb25pdG9yIERJTyBzdGF0cz8KPj4+
Cj4+PiBTaW1pbGFyIHJlYXNvbiBhcyB3ZSBkaWQgZm9yIGJ1ZmZlcmVkIElPPwo+Pgo+PiBGb3Ig
bm93LCBMRlMgJiBTU1IgYXJlIGNvdW50IGluIERJTywgYnV0IG5vdCBjb3VudCBJUFUswqAgSSB0
aGluayB3ZQo+IAo+IEkgZ3Vlc3MgaXQgd2lsbCBhY2NvdW50IElPcyB3aGljaCBhcmUgZmFsbGJh
Y2tpbmcgZnJvbSBESU8gdG8gYnVmZmVyZWQgSU8sCj4gc28gYWxsIERJT3MgYXJlIG5vdCBhY2Nv
dW50ZWQuLi4KCkl0IHNlZW1zIG5vdCwgdGhlIGFjY291bnQgd2FzIGRvbmUgaW4gCmYyZnNfYWxs
b2NhdGVfZGF0YV9ibG9jay0+c3RhdF9pbmNfYmxvY2tfY291bnQsIHdoZW4gZGlyZWN0ICsgYXBw
ZW5kIAp3cml0ZSBmaWxlLCBpdCB3aWxsIGNvdW50IERJTyB0b28sIGJlY2F1c2Ugc3RhdF9pbmNf
YmxvY2tfY291bnQgZG9lc24ndCAKY2FyZSBhYm91dCBESU8gb3Igbm90LgoKcm9vdEBrdm0teGZz
dGVzdHM6fiMgY2F0IC9zeXMva2VybmVsL2RlYnVnL2YyZnMvc3RhdHVzIHxncmVwIFNTUiAtQyAz
CiAgIFstLS0tLS0tLS18LXwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
XQoKSVBVOiAwIGJsb2NrcwpTU1I6IDAgYmxvY2tzIGluIDAgc2VnbWVudHMKTEZTOiAwIGJsb2Nr
cyBpbiAwIHNlZ21lbnRzCnJvb3RAa3ZtLXhmc3Rlc3RzOi9tbnQjIGRkIGlmPS9kZXYvemVybyBv
Zj0uL25ldyBvZmxhZz1kaXJlY3QgYnM9MU0gY291bnQ9MQoxKzAgcmVjb3JkcyBpbgoxKzAgcmVj
b3JkcyBvdXQKMTA0ODU3NiBieXRlcyAoMS4wIE1CLCAxLjAgTWlCKSBjb3BpZWQsIDAuMDE2MDA4
IHMsIDY1LjUgTUIvcwpyb290QGt2bS14ZnN0ZXN0czovbW50IyBjYXQgL3N5cy9rZXJuZWwvZGVi
dWcvZjJmcy9zdGF0dXMgfGdyZXAgU1NSIC1DIDMKICAgWy0tLS0tLS0tLXwtfC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1dCgpJUFU6IDAgYmxvY2tzClNTUjogMCBibG9j
a3MgaW4gMCBzZWdtZW50cwpMRlM6IDI1NiBibG9ja3MgaW4gMSBzZWdtZW50cwoKQkRGOiA5OSwg
YXZnLiB2YmxvY2tzOiAyMjYKCj4gCj4gVGhhbmtzLAo+IAo+PiBzaG91bGQga2VlcCBjb25zaXN0
ZW5jeS4KPj4KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4+Cj4+Pj4+Cj4+Pj4+IEphZWdldWssIHRo
b3VnaHRzPwo+Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9m
Zi1ieTogRmVuZ25hbiBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPgo+Pj4+Pj4gLS0tCj4+
Pj4+PiDCoMKgwqAgZnMvZjJmcy9kYXRhLmMgfCA2ICsrKysrKwo+Pj4+Pj4gwqDCoMKgIGZzL2Yy
ZnMvZjJmcy5oIHwgMiArKwo+Pj4+Pj4gwqDCoMKgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJm
cy9kYXRhLmMKPj4+Pj4+IGluZGV4IGQyY2Y0OGM1YTJlNC4uNjA1MTBhY2Y5MWVjIDEwMDY0NAo+
Pj4+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+
Pj4+PiBAQCAtMTQ3Nyw2ICsxNDc3LDkgQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5v
ZGUgKmlub2RlLAo+Pj4+Pj4gc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLAo+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19ESU8pCj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc193YWl0X29uX2Jsb2NrX3dyaXRl
YmFja19yYW5nZShpbm9kZSwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXAtPm1fcGJsaywgbWFwLT5tX2xlbik7Cj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgaWYgKCFmMmZzX2xmc19tb2RlKHNiaSkgJiYgZmxhZyA9PSBGMkZTX0dF
VF9CTE9DS19ESU8gJiYKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFw
LT5tX21heV9jcmVhdGUpCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0X2FkZF9p
bnBsYWNlX2Jsb2NrcyhzYmksIG1hcC0+bV9sZW4pOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBnb3RvIG91dDsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+IEBAIC0xNTI2LDYg
KzE1MjksOSBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+Pj4+
PiBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYmxrYWRkciA9IGRuLmRhdGFfYmxrYWRkcjsKPj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVBQRU5EX1dSSVRF
KTsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IGlmICghY3JlYXRlICYmICFmMmZzX2xmc19tb2RlKHNiaSkgJiYgZmxhZyA9PQo+Pj4+Pj4gRjJG
U19HRVRfQkxPQ0tfRElPICYmCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG1hcC0+bV9tYXlfY3JlYXRlKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdF9p
bmNfaW5wbGFjZV9ibG9ja3Moc2JpKTsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChjcmVhdGUpIHsKPj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAodW5saWtlbHkoZjJmc19jcF9lcnJvcihzYmkpKSkg
ewo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+
Pj4+IGluZGV4IDg2N2YyYzVkOTU1OS4uM2E5ZGYyOGU2ZmQ3IDEwMDY0NAo+Pj4+Pj4gLS0tIGEv
ZnMvZjJmcy9mMmZzLmgKPj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+Pj4+PiBAQCAtMzgw
NCw2ICszODA0LDggQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgZjJmc19zdGF0X2luZm8KPj4+Pj4+
ICpGMkZTX1NUQVQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAoKHNiaSktPmJsb2NrX2NvdW50WyhjdXJzZWcpLT5hbGxvY190eXBlXSsrKQo+
Pj4+Pj4gwqDCoMKgICNkZWZpbmUgc3RhdF9pbmNfaW5wbGFjZV9ibG9ja3Moc2JpKcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKGF0b21pY19pbmMoJihzYmkpLT5pbnBsYWNlX2NvdW50KSkKPj4+Pj4+ICsjZGVmaW5l
IHN0YXRfYWRkX2lucGxhY2VfYmxvY2tzKHNiaSwgY291bnQpwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAoYXRvbWljX2FkZChjb3VudCwgJihz
YmkpLT5pbnBsYWNlX2NvdW50KSkKPj4+Pj4+IMKgwqDCoCAjZGVmaW5lIHN0YXRfdXBkYXRlX21h
eF9hdG9taWNfd3JpdGUoaW5vZGUpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+
Pj4+IMKgwqDCoMKgwqDCoMKgIGRvIHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGludCBjdXIgPSBGMkZTX0lfU0IoaW5vZGUpLT5hdG9taWNfZmlsZXM7wqDCoMKgIFwKPj4+
Pj4+Cj4+Pgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
