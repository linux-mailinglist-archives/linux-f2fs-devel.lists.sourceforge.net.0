Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E56D3F2969
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Aug 2021 11:41:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mH11c-0004o9-NH; Fri, 20 Aug 2021 09:41:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mH11a-0004o0-7h
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 09:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aar0P1o1ZSwvl8tRvBjPcrSxb2wLV3T+BpekFEaAFeE=; b=WR/augfzfOQVmXa5rXqdsSQAX2
 tCBLVbIOLNqvh4SpiIw+8nIqXJ9MGlXrfpjtvNLZ3xGe8wv22bUcA74tkWdYCGK1K4+RjGEpA8+dM
 IZ0y3mQ7bodroEhmqNTZkQrofgfHVo14Jz+RTUzoUaGiADlu2LHIZCNE6/OAFkw82hPY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aar0P1o1ZSwvl8tRvBjPcrSxb2wLV3T+BpekFEaAFeE=; b=YIBueXQswqno4AqaxfpRawEWTk
 ytJKEJUDh1D3j6XM61Xn4AZb1+27+OhK1DWJphrFQ55oduCK/iLDLEsoxFBmbBuT6b9x8IdzrTWqm
 s6RCicPUsx7fGOfS28nGX5RPn3S6aBigDJpj1hEFUN0vgRWIcM5oE8rOIttsd/Nydo/I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mH11Y-0007mk-Tv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 09:41:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDC72604D7;
 Fri, 20 Aug 2021 09:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629452471;
 bh=9hutWuWkZ8InDGYrgNX/wA+g5846SPQMpAexKYFYCgk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=uP0zIWbYES5rFvas3Iv8uS2qJHV/GhpnKZvAb6oOPkCu29eoKOh0W22FpeLb9bOlx
 bD3vjWFx5HqPzA67kMUdCMMz2Xs/pTyx61aaXK8OSknyiqny9vj2hphSaqwRQqa9lk
 T+GLOqF4W9vgS85ybvzhftTKfzlSrq2+1eNMDIV7kc6QkN78wScbWppRcT07CrR0cK
 HLocNqLSQHkTTIVZKuElMoTVpsREzXpy8NMGkyNgYY8hhRfteCC93eHe3gryY1UsTn
 u6yPDuTLLJkEVkS1MXsGTOeWP7at5r/Bhi3C/gTrgVeEm26KaD5vxZQoW5SoxYOyM3
 m6ZNE7vjpPRdw==
To: Fengnan Chang <changfengnan@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210729122522.149960-1-changfengnan@vivo.com>
 <9b1f01f4-66ed-3976-3efb-bd5fee347681@kernel.org>
 <YRWPetjv8PqbzzF/@google.com>
 <3b339c10-f4bc-48f4-4c77-84e904dfa9cb@kernel.org>
 <996dff14-19ec-5ce7-95c8-bb6487344705@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <1a727d7f-081e-c7bf-fa4e-1dc5cbcdc4a2@kernel.org>
Date: Fri, 20 Aug 2021 17:41:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <996dff14-19ec-5ce7-95c8-bb6487344705@vivo.com>
Content-Language: en-US
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mH11Y-0007mk-Tv
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

T24gMjAyMS84LzE4IDExOjQ5LCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjEv
OC8xMyA5OjM2LCBDaGFvIFl1IHdyb3RlOgo+PiBPbiAyMDIxLzgvMTMgNToxNSwgSmFlZ2V1ayBL
aW0gd3JvdGU6Cj4+PiBPbiAwOC8wNiwgQ2hhbyBZdSB3cm90ZToKPj4+PiBPbiAyMDIxLzcvMjkg
MjA6MjUsIEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4+Pj4+IEZvciBub3csIG92ZXJ3cml0ZSBmaWxl
IHdpdGggZGlyZWN0IGlvIHVzZSBpbnBsYWNlIHBvbGljeSwgYnV0IG5vdAo+Pj4+PiBjb3VudGVk
LCBmaXggaXQuCj4+Pj4KPj4+PiBJTU8sIExGUy9TU1IvSVBVIHN0YXRzIGluIGRlYnVnZnMgd2Fz
IGZvciBidWZmZXJlZCB3cml0ZSwgbWF5YmUgd2UKPj4+PiBuZWVkIHRvIGFkZCBzZXBhcmF0ZWQg
b25lIGZvciBESU8uCj4+Pgo+Pj4gRG8gd2UgcmVhbGx5IG5lZWQgdG8gbW9uaXRvciBESU8gc3Rh
dHM/Cj4+Cj4+IFNpbWlsYXIgcmVhc29uIGFzIHdlIGRpZCBmb3IgYnVmZmVyZWQgSU8/Cj4gCj4g
Rm9yIG5vdywgTEZTICYgU1NSIGFyZSBjb3VudCBpbiBESU8sIGJ1dCBub3QgY291bnQgSVBVLCAg
SSB0aGluayB3ZQoKSSBndWVzcyBpdCB3aWxsIGFjY291bnQgSU9zIHdoaWNoIGFyZSBmYWxsYmFj
a2luZyBmcm9tIERJTyB0byBidWZmZXJlZCBJTywKc28gYWxsIERJT3MgYXJlIG5vdCBhY2NvdW50
ZWQuLi4KClRoYW5rcywKCj4gc2hvdWxkIGtlZXAgY29uc2lzdGVuY3kuCj4gCj4+Cj4+IFRoYW5r
cywKPj4KPj4+Cj4+Pj4KPj4+PiBKYWVnZXVrLCB0aG91Z2h0cz8KPj4+Pgo+Pj4+IFRoYW5rcywK
Pj4+Pgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2Zlbmdu
YW5Adml2by5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAgwqDCoCBmcy9mMmZzL2RhdGEuYyB8IDYgKysr
KysrCj4+Pj4+ICDCoMKgIGZzL2YyZnMvZjJmcy5oIHwgMiArKwo+Pj4+PiAgwqDCoCAyIGZpbGVz
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+PiBpbmRleCBkMmNmNDhjNWEyZTQuLjYwNTEw
YWNmOTFlYyAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+Pj4gKysrIGIvZnMv
ZjJmcy9kYXRhLmMKPj4+Pj4gQEAgLTE0NzcsNiArMTQ3Nyw5IEBAIGludCBmMmZzX21hcF9ibG9j
a3Moc3RydWN0IGlub2RlICppbm9kZSwKPj4+Pj4gc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFw
LAo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tf
RElPKQo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX3dhaXRfb25fYmxv
Y2tfd3JpdGViYWNrX3JhbmdlKGlub2RlLAo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXAtPm1fcGJsaywgbWFwLT5tX2xlbik7Cj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIWYyZnNfbGZzX21vZGUoc2JpKSAmJiBmbGFnID09IEYy
RlNfR0VUX0JMT0NLX0RJTyAmJgo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG1hcC0+bV9tYXlfY3JlYXRlKQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0X2Fk
ZF9pbnBsYWNlX2Jsb2NrcyhzYmksIG1hcC0+bV9sZW4pOwo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZ290byBvdXQ7Cj4+Pj4+ICDCoMKgwqDCoMKgwqAgfQo+Pj4+PiBAQCAtMTUyNiw2ICsx
NTI5LDkgQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+Pj4+PiBz
dHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGJsa2FkZHIgPSBkbi5kYXRhX2Jsa2FkZHI7Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9BUFBFTkRfV1JJVEUpOwo+Pj4+
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFjcmVh
dGUgJiYgIWYyZnNfbGZzX21vZGUoc2JpKSAmJiBmbGFnID09Cj4+Pj4+IEYyRlNfR0VUX0JMT0NL
X0RJTyAmJgo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hcC0+bV9tYXlf
Y3JlYXRlKQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0X2luY19pbnBsYWNlX2Js
b2NrcyhzYmkpOwo+Pj4+PiAgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+Pj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoY3JlYXRlKSB7Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmICh1bmxpa2VseShmMmZzX2NwX2Vycm9yKHNiaSkpKSB7Cj4+Pj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4+Pj4+IGluZGV4IDg2N2YyYzVkOTU1
OS4uM2E5ZGYyOGU2ZmQ3IDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+Pj4+PiAr
KysgYi9mcy9mMmZzL2YyZnMuaAo+Pj4+PiBAQCAtMzgwNCw2ICszODA0LDggQEAgc3RhdGljIGlu
bGluZSBzdHJ1Y3QgZjJmc19zdGF0X2luZm8KPj4+Pj4gKkYyRlNfU1RBVChzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmkpCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoKHNiaSktPmJsb2NrX2Nv
dW50WyhjdXJzZWcpLT5hbGxvY190eXBlXSsrKQo+Pj4+PiAgwqDCoCAjZGVmaW5lIHN0YXRfaW5j
X2lucGxhY2VfYmxvY2tzKHNiaSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBcCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoYXRvbWljX2luYygmKHNiaSktPmlucGxh
Y2VfY291bnQpKQo+Pj4+PiArI2RlZmluZSBzdGF0X2FkZF9pbnBsYWNlX2Jsb2NrcyhzYmksIGNv
dW50KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCAoYXRvbWljX2FkZChjb3VudCwgJihzYmkpLT5pbnBsYWNlX2NvdW50KSkKPj4+Pj4gIMKgwqAg
I2RlZmluZSBzdGF0X3VwZGF0ZV9tYXhfYXRvbWljX3dyaXRlKGlub2RlKcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBcCj4+Pj4+ICDCoMKgwqDCoMKgwqAgZG8ge8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+Pj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBjdXIgPSBGMkZTX0lfU0IoaW5vZGUpLT5hdG9taWNf
ZmlsZXM7wqDCoMKgIFwKPj4+Pj4KPj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
