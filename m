Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C09848AA3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  4 Feb 2024 03:24:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rWSBa-0007k2-Pp;
	Sun, 04 Feb 2024 02:24:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rWSBZ-0007jq-P2
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 02:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bYvZm/WpSJnLyEg2CJHkUadLZkjrNIMid0KBa/bNz/s=; b=UrgabtMA8iC0ZLbVzn+Lrfej6L
 7xCIdv03O9ihTIjtk+ciaCGgubEEABeVHVqvb3Cw5X0P2PZIXHfYx+4RR7MvbNFJ3oGcMjDHtmi83
 ZzshCWeQjxzNOZnZBFzqmXSJldCMXk2EdzR1RHIueEDImwSMXJkJ1Jb+1Zej2H86cK04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bYvZm/WpSJnLyEg2CJHkUadLZkjrNIMid0KBa/bNz/s=; b=PpSBVVf9i6IP3CvcvGXFHDI7wc
 pIffvAMGO0MCPRJuxrcQBOE5z7+GOo80JtCax/vO1IxFFUSablplDgT3LWyyS7se9AqVgyFDLX9Oo
 YzV4Xvi7RWW0kpXMvGdbtxwwD6NCa2Vb66+3ztb8jiY6KK3AltHcI1Wz4C26a+bTs26A=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rWSBU-0004TN-OX for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 02:24:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A404ACE0988;
 Sun,  4 Feb 2024 02:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7C8C433F1;
 Sun,  4 Feb 2024 02:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707013472;
 bh=w/HWrR+lQGWzJxB85ky3dmWebYzJu5r/BKHq8uRrEXA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NKPLco9jJb9cP8o5a92KUMkiFYpFazPUfaqQtGVqbgSUT5dpcwoHB9O9A4o8amDD6
 8EIGv4wlDzvIGfhZmOKwkugzpabWmi8dM7Fh7YxMgRGGKl15pyosbeGIWnUGI/wfLm
 0I6icbSDsIakO/bqVci64zacXyRV1BqKzJk2G4e4zql1H8uX3Ez/0OQZorJL7IDD/F
 XCtd61ilA29P4RymD8j0fOcK9J3JpAZ3AalFl0IjqXFtFcnPgQHg0PBHC3jTgO/TB4
 uuICc1ns/4M7uGEnhpIh4u1LYu42zCu73oyfXjDCs91IOc6HghP07+UQIeoBSNNDtC
 RRbrrv/V57jng==
Message-ID: <e42ae14e-88b8-41de-9693-1513bf335fc2@kernel.org>
Date: Sun, 4 Feb 2024 10:24:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wenjie Qi <qwjhust@gmail.com>
References: <20240203152436.1352-1-qwjhust@gmail.com>
 <8eaf59a4-1aaa-460e-a3cc-b798ed5e0f63@kernel.org>
 <CAGFpFsTz_9Zaj0PuptjBxOJwxF68geAUfd1qtx9--Tczh+jZww@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAGFpFsTz_9Zaj0PuptjBxOJwxF68geAUfd1qtx9--Tczh+jZww@mail.gmail.com>
X-Spam-Score: -4.6 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/4 10:18, Wenjie Qi wrote: > Hi Chao, > > It seems
 to me that when mounting multiple zoned devices, > if their max_open_zones
 are all 0, then sbi->max_open_zones is 0. > This suggests that al [...] 
 Content analysis details:   (-4.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rWSBU-0004TN-OX
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix zoned block device information
 initialization
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, hustqwj@hust.edu.cn,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8yLzQgMTA6MTgsIFdlbmppZSBRaSB3cm90ZToKPiBIaSBDaGFvLAo+IAo+IEl0IHNl
ZW1zIHRvIG1lIHRoYXQgd2hlbiBtb3VudGluZyBtdWx0aXBsZSB6b25lZCBkZXZpY2VzLAo+IGlm
IHRoZWlyIG1heF9vcGVuX3pvbmVzIGFyZSBhbGwgMCwgdGhlbiBzYmktPm1heF9vcGVuX3pvbmVz
IGlzIDAuCj4gVGhpcyBzdWdnZXN0cyB0aGF0IGFsbCBvZiB0aGUgbW91bnRlZCBkZXZpY2VzIGNh
biBvcGVuIGFuIHVubGltaXRlZAo+IG51bWJlciBvZiB6b25lcywKPiBhbmQgdGhhdCB3ZSBkb24n
dCBuZWVkIHRvIGNvbXBhcmUgc2JpLT5tYXhfb3Blbl96b25lcyB3aXRoCj4gRjJGU19PUFRJT04o
IHNiaSkuYWN0aXZlX2xvZ3MuCgpZZXMsIGJ1dCBJJ20gY3VyaW91cyBhYm91dCBob3cgdGhpcyBj
YXNlIChzYmktPm1heF9vcGVuX3pvbmVzIGlzIHplcm8pCndvcmtzIHcvIGZvbGxvd2luZyBwYXRj
aCwgZG8gd2UgbmVlZCB0byBpbml0aWFsaXplZCBzYmktPm1heF9vcGVuX3pvbmVzCncvIFVJTlRf
TUFYIHRvIGluZGljYXRlIHRoZSB1bmxpbWl0ZWQgb3BlbiB6b25lIHN0YXR1cyBvZiBkZXZpY2Ug
aWYKYWxsIHpvbmVkIGRldmljZXMnIG1heF9vcGVuX3pvbmVzIGlzIHplcm8/Cgo+IAo+IFRoYW5r
cywKPiAKPiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOS6jjIwMjTlubQy5pyINOaXpeWRqOaX
pSAwOTo0N+WGmemBk++8mgo+Pgo+PiBPbiAyMDI0LzIvMyAyMzoyNCwgV2VuamllIFFpIHdyb3Rl
Ogo+Pj4gSWYgdGhlIG1heCBvcGVuIHpvbmVzIG9mIHpvbmVkIGRldmljZXMgYXJlIGxlc3MgdGhh
bgo+Pj4gdGhlIGFjdGl2ZSBsb2dzIG9mIEYyRlMsIHRoZSBkZXZpY2UgbWF5IGVycm9yIGR1ZSB0
bwo+Pj4gaW5zdWZmaWNpZW50IHpvbmUgcmVzb3VyY2VzIHdoZW4gbXVsdGlwbGUgYWN0aXZlIGxv
Z3MgYXJlCj4+PiBiZWluZyB3cml0dGVuIGF0IHRoZSBzYW1lIHRpbWUuIElmIHRoaXMgdmFsdWUg
aXMgMCwKPj4+IHRoZXJlIGlzIG5vIGxpbWl0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFdlbmpp
ZSBRaSA8cXdqaHVzdEBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+ICAgIGZzL2YyZnMvZjJmcy5oICB8
ICAxICsKPj4+ICAgIGZzL2YyZnMvc3VwZXIuYyB8IDIxICsrKysrKysrKysrKysrKysrKysrKwo+
Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+IGluZGV4IDU0Mzg5ODQ4MmY4
Yi4uMTYxMTA3ZjJkM2JkIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+ICsrKyBi
L2ZzL2YyZnMvZjJmcy5oCj4+PiBAQCAtMTU1OCw2ICsxNTU4LDcgQEAgc3RydWN0IGYyZnNfc2Jf
aW5mbyB7Cj4+Pgo+Pj4gICAgI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4+PiAgICAgICAg
dW5zaWduZWQgaW50IGJsb2Nrc19wZXJfYmxrejsgICAgICAgICAgIC8qIEYyRlMgYmxvY2tzIHBl
ciB6b25lICovCj4+PiArICAgICB1bnNpZ25lZCBpbnQgbWF4X29wZW5fem9uZXM7ICAgICAgICAg
ICAgLyogbWF4IG9wZW4gem9uZSByZXNvdXJjZXMgb2YgdGhlIHpvbmVkIGRldmljZSAqLwo+Pj4g
ICAgI2VuZGlmCj4+Pgo+Pj4gICAgICAgIC8qIGZvciBub2RlLXJlbGF0ZWQgb3BlcmF0aW9ucyAq
Lwo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+Pj4g
aW5kZXggMWI3MThiZWJmYWExLi40NWU4MmQ2MDE2ZmMgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZz
L3N1cGVyLmMKPj4+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+Pj4gQEAgLTIzODgsNiArMjM4OCwx
NiBAQCBzdGF0aWMgaW50IGYyZnNfcmVtb3VudChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQg
KmZsYWdzLCBjaGFyICpkYXRhKQo+Pj4gICAgICAgIGlmIChlcnIpCj4+PiAgICAgICAgICAgICAg
ICBnb3RvIHJlc3RvcmVfb3B0czsKPj4+Cj4+PiArI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVE
Cj4+PiArICAgICBpZiAoc2JpLT5tYXhfb3Blbl96b25lcyAmJiBzYmktPm1heF9vcGVuX3pvbmVz
IDwgRjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncykgewo+Pj4gKyAgICAgICAgICAgICBmMmZz
X2VycihzYmksCj4+PiArICAgICAgICAgICAgICAgICAgICAgInpvbmVkOiBtYXggb3BlbiB6b25l
cyAldSBpcyB0b28gc21hbGwsIG5lZWQgYXQgbGVhc3QgJXUgb3BlbiB6b25lcyIsCj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5tYXhfb3Blbl96b25lcywgRjJGU19PUFRJ
T04oc2JpKS5hY3RpdmVfbG9ncyk7Cj4+PiArICAgICAgICAgICAgIGVyciA9IC1FSU5WQUw7Cj4+
PiArICAgICAgICAgICAgIGdvdG8gcmVzdG9yZV9vcHRzOwo+Pj4gKyAgICAgfQo+Pj4gKyNlbmRp
Zgo+Pj4gKwo+Pj4gICAgICAgIC8qIGZsdXNoIG91dHN0YW5kaW5nIGVycm9ycyBiZWZvcmUgY2hh
bmdpbmcgZnMgc3RhdGUgKi8KPj4+ICAgICAgICBmbHVzaF93b3JrKCZzYmktPnNfZXJyb3Jfd29y
ayk7Cj4+Pgo+Pj4gQEAgLTM5MzAsMTEgKzM5NDAsMjIgQEAgc3RhdGljIGludCBpbml0X2Jsa3pf
aW5mbyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCBkZXZpKQo+Pj4gICAgICAgIHNlY3Rv
cl90IG5yX3NlY3RvcnMgPSBiZGV2X25yX3NlY3RvcnMoYmRldik7Cj4+PiAgICAgICAgc3RydWN0
IGYyZnNfcmVwb3J0X3pvbmVzX2FyZ3MgcmVwX3pvbmVfYXJnOwo+Pj4gICAgICAgIHU2NCB6b25l
X3NlY3RvcnM7Cj4+PiArICAgICB1bnNpZ25lZCBpbnQgbWF4X29wZW5fem9uZXM7Cj4+PiAgICAg
ICAgaW50IHJldDsKPj4+Cj4+PiAgICAgICAgaWYgKCFmMmZzX3NiX2hhc19ibGt6b25lZChzYmkp
KQo+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4+Pgo+Pj4gKyAgICAgbWF4X29wZW5fem9u
ZXMgPSBiZGV2X21heF9vcGVuX3pvbmVzKGJkZXYpOwo+Pgo+PiBXZW5qaWUsCj4+Cj4+IG1heF9v
cGVuX3pvbmVzIGNhbiBhbHdheXMgYmUgemVybz8gdGhlbiBzYmktPm1heF9vcGVuX3pvbmVzIHdp
bGwgYmUgemVybywKPj4gaXMgdGhpcyBhIHZhbGlkIGNhc2U/Cj4+Cj4+IFRoYW5rcywKPj4KPj4+
ICsgICAgIGlmIChtYXhfb3Blbl96b25lcyAmJiAobWF4X29wZW5fem9uZXMgPCBzYmktPm1heF9v
cGVuX3pvbmVzIHx8ICFzYmktPm1heF9vcGVuX3pvbmVzKSkKPj4+ICsgICAgICAgICAgICAgc2Jp
LT5tYXhfb3Blbl96b25lcyA9IG1heF9vcGVuX3pvbmVzOwo+Pj4gKyAgICAgaWYgKHNiaS0+bWF4
X29wZW5fem9uZXMgJiYgc2JpLT5tYXhfb3Blbl96b25lcyA8IEYyRlNfT1BUSU9OKHNiaSkuYWN0
aXZlX2xvZ3MpIHsKPj4+ICsgICAgICAgICAgICAgZjJmc19lcnIoc2JpLAo+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICJ6b25lZDogbWF4IG9wZW4gem9uZXMgJXUgaXMgdG9vIHNtYWxsLCBuZWVk
IGF0IGxlYXN0ICV1IG9wZW4gem9uZXMiLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNiaS0+bWF4X29wZW5fem9uZXMsIEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpOwo+
Pj4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+ICsgICAgIH0KPj4+ICsKPj4+ICAg
ICAgICB6b25lX3NlY3RvcnMgPSBiZGV2X3pvbmVfc2VjdG9ycyhiZGV2KTsKPj4+ICAgICAgICBp
ZiAoIWlzX3Bvd2VyX29mXzIoem9uZV9zZWN0b3JzKSkgewo+Pj4gICAgICAgICAgICAgICAgZjJm
c19lcnIoc2JpLCAiRjJGUyBkb2VzIG5vdCBzdXBwb3J0IG5vbiBwb3dlciBvZiAyIHpvbmUgc2l6
ZXNcbiIpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
