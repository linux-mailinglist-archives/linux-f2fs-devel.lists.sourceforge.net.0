Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E20733D98
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Jun 2023 04:20:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qALY9-0001Ku-Jv;
	Sat, 17 Jun 2023 02:20:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qALY6-0001Kn-Kr
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Jun 2023 02:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vDvoGRKYyXZxY0sWniUB5e2i7o6XXMtzkVFwhM6cAXE=; b=kjY34WtNIdb+RLwfmjL0friUZj
 /YJ9/GudH8syM+iqnSwNCEYEQMmW3NL2dBLvgdYm+uTuDVzm3hjU8HpUvwRe3hXUDlqzS+f6fMWSX
 6fWz8FFWwn7tHVGXIlCzOhZYYGWo8eMoAwnpV6mQJlHbaloYYqjVWu19BcagOYU+wrfQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vDvoGRKYyXZxY0sWniUB5e2i7o6XXMtzkVFwhM6cAXE=; b=XJby4Vb4SOsNF/C1lpc9tnhbjV
 GdV2vcbzbESzIRfWT82yh7btInCXB2vEnxB+KVTcWkqT8fD55iOvxY2bnFMZZB060csnQ+xKBKDjv
 2TqDSD5ZzRGayIRiZVCDlQwOL4W801/7mFQ90rKbxdVgnn31831qkWd0EtCkslAjPuRo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qALY3-006Ko7-B3 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Jun 2023 02:20:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E2D1E61501;
 Sat, 17 Jun 2023 02:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E14FC433C0;
 Sat, 17 Jun 2023 02:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686968413;
 bh=cnZlXfIgoPzHuSqXXjua4qsycYX4+B74DWddA1NV5Ko=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pfPOd2egzTgAKSo1I7bUXYuHtCZr16urNfGa9KcxAKWtOAWOGDPqMNHk7yBul6h1J
 i/fIWpcbT6SpYef4uA4reVeOAi8Ke//35mqLyEbDyPqa7PxAgJeeGRXctytlOUSbUD
 XClaqEEX0C/KDmqTyeOpgPaUN2ziRjb+Grk01rqeb3DTsbbnhq8gG8OEafjKRsY080
 YblEaXEuqqFD3vanrOaz3K3ll8jD3OY5nR+OoHTqQ+/m9RF4QEYZuBQhXcOeamhGl/
 pBBM5EF4zZZiMIk4nQ72nM5p1hSRIRjBdKqcziqJpq9QzLMD4iP4gl7I7DNc72Mn1M
 SC6kUg3wvbTJg==
Message-ID: <3ba141d6-f011-7c4f-accd-8d60aed7a683@kernel.org>
Date: Sat, 17 Jun 2023 10:20:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
To: Chunhai Guo <guochunhai@vivo.com>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
References: <20230524024204.13694-1-guochunhai@vivo.com>
 <12df63c7-71b3-3223-b9fa-0dff6c1d6d14@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <12df63c7-71b3-3223-b9fa-0dff6c1d6d14@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/14 17:27, Chunhai Guo wrote: > Hi Jaegeuk,
 > > Could
 you please help to confirm if this patch has been merged? I cannot > see
 the patch in the dev-test or dev branch. > > Thanks. > > On 2023 [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qALY3-006Ko7-B3
Subject: Re: [f2fs-dev] [PATCH v8] fsck.f2fs: Detect and fix looped node
 chain efficiently
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy82LzE0IDE3OjI3LCBDaHVuaGFpIEd1byB3cm90ZToKPiBIaSBKYWVnZXVrLAo+IAo+
IENvdWxkIHlvdSBwbGVhc2UgaGVscCB0byBjb25maXJtIGlmIHRoaXMgcGF0Y2ggaGFzIGJlZW4g
bWVyZ2VkPyBJIGNhbm5vdAo+IHNlZSB0aGUgcGF0Y2ggaW4gdGhlIGRldi10ZXN0IG9yIGRldiBi
cmFuY2guCj4gCj4gVGhhbmtzLgo+IAo+IE9uIDIwMjMvNS8yNCAxMDo0Miwg6YOt57qv5rW3IHdy
b3RlOgo+PiBmaW5kX2ZzeW5jX2lub2RlKCkgZGV0ZWN0IHRoZSBsb29wZWQgbm9kZSBjaGFpbiBi
eSBjb21wYXJpbmcgdGhlIGxvb3AKPj4gY291bnRlciB3aXRoIGZyZWUgYmxvY2tzLiBXaGlsZSBp
dCBtYXkgdGFrZSB0ZW5zIG9mIHNlY29uZHMgdG8gcXVpdCB3aGVuCj4+IHRoZSBmcmVlIGJsb2Nr
cyBhcmUgbGFyZ2UgZW5vdWdoLiBXZSBjYW4gdXNlIEZsb3lkJ3MgY3ljbGUgZGV0ZWN0aW9uCj4+
IGFsZ29yaXRobSB0byBtYWtlIHRoZSBkZXRlY3Rpb24gbW9yZSBlZmZpY2llbnQsIGFuZCBmaXgg
dGhlIGlzc3VlIGJ5Cj4+IGZpbGxpbmcgYSBOVUxMIGFkZHJlc3MgaW4gdGhlIGxhc3Qgbm9kZSBv
ZiB0aGUgY2hhaW4uCj4+Cj4+IEJlbG93IGlzIHRoZSBsb2cgd2UgZW5jb3VudGVyIG9uIGEgMjU2
R0IgVUZTIHN0b3JhZ2UgYW5kIGl0IHRha2VzIGFib3V0Cj4+IDI1IHNlY29uZHMgdG8gZGV0ZWN0
IGxvb3BlZCBub2RlIGNoYWluLiBBZnRlciBjaGFuZ2luZyB0aGUgYWxnb3JpdGhtLCBpdAo+PiB0
YWtlcyBhYm91dCAyMG1zIHRvIGZpbmlzaCB0aGUgc2FtZSBqb2IuCj4+Cj4+ICAgICAgIFsgICAx
MC44MjI5MDRdIGZzY2suZjJmczogSW5mbzogdmVyc2lvbiB0aW1lc3RhbXAgY3VyOiAxNywgcHJl
djogNDMwCj4+ICAgICAgIFsgICAxMC44MjI5NDldIGZzY2suZjJmczogW3VwZGF0ZV9zdXBlcmJs
b2NrOiA3NjJdIEluZm86IERvbmUgdG8KPj4gdXBkYXRlIHN1cGVyYmxvY2sKPj4gICAgICAgWyAg
IDEwLjgyMjk1M10gZnNjay5mMmZzOiBJbmZvOiBzdXBlcmJsb2NrIGZlYXR1cmVzID0gMTQ5OSA6
Cj4+IGVuY3J5cHQgdmVyaXR5IGV4dHJhX2F0dHIgcHJvamVjdF9xdW90YSBxdW90YV9pbm8gY2Fz
ZWZvbGQKPj4gICAgICAgWyAgIDEwLjgyMjk1Nl0gZnNjay5mMmZzOiBJbmZvOiBzdXBlcmJsb2Nr
IGVuY3J5cHQgbGV2ZWwgPSAwLCBzYWx0ID0KPj4gMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAKPj4gICAgICAgWyAgIDEwLjgyMjk2MF0gZnNjay5mMmZzOiBJbmZvOiB0b3RhbCBGUyBz
ZWN0b3JzID0gNTkyNDk4MTEgKDIzMTQ0NAo+PiBNQikKPj4gICAgICAgWyAgIDM1Ljg1MjgyN10g
ZnNjay5mMmZzOglkZXRlY3QgbG9vcGVkIG5vZGUgY2hhaW4sCj4+IGJsa2FkZHI6MTExNDgwMiwg
bmV4dDoxMTE0ODAzCj4+ICAgICAgIFsgICAzNS44NTI4NDJdIGZzY2suZjJmczogW2YyZnNfZG9f
bW91bnQ6Mzg0Nl0gcmVjb3JkX2ZzeW5jX2RhdGEKPj4gZmFpbGVkCj4+ICAgICAgIFsgICAzNS44
NTYxMDZdIGZzY2suZjJmczogZnNjay5mMmZzIHRlcm1pbmF0ZWQgYnkgZXhpdCgyNTUpCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IENodW5oYWkgR3VvIDxndW9jaHVuaGFpQHZpdm8uY29tPgo+PiAtLS0K
Pj4gdjcgLT4gdjggOiBSZWZvcm1hdCB0aGUgY29kZSB0byByZWR1Y2UgaW5kZW50aW9uLgo+PiB2
NiAtPiB2NyA6IENvcnJlY3QgbG9naWMgZXJyb3IgdG8gaGFuZGxlIGlzX2RldGVjdGluZyByZXR1
cm4gYnkKPj4gCWZpbmRfbm9kZV9ibGtfZmFzdCgpLgo+PiB2NSAtPiB2NiA6IFNpbXBsaWZ5IHRo
ZSBjb2RlIGJ5IHJlbW92aW5nIHVubmVjZXNzYXJ5IHJldHJ5IGxvZ2ljLgo+PiB2NCAtPiB2NSA6
IFVzZSBJU19JTk9ERSgpIHRvIG1ha2UgdGhlIGNvZGUgbW9yZSBjbGVhci4KPj4gdjMgLT4gdjQg
OiBTZXQgYy5idWdfb24gd2l0aCBBU1NFUlRfTVNHKCkgd2hlbiBpc3N1ZSBpcyBkZXRlY3RlZCBh
bmQgZml4Cj4+IAlpdCBvbmx5IGlmIGMuZml4X29uIGlzIDEuCj4+IHYyIC0+IHYzIDogV3JpdGUg
aW5vZGUgd2l0aCB3cml0ZV9pbm9kZSgpIHRvIGF2b2lkIGNoa3N1bSBiZWluZyBicm9rZW4uCj4+
IHYxIC0+IHYyIDogRml4IGxvb3BlZCBub2RlIGNoYWluIGRpcmVjdGx5IGFmdGVyIGl0IGlzIGRl
dGVjdGVkLgo+PiAtLS0KPj4gICAgZnNjay9tb3VudC5jIHwgMTI3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+PiAgICAxIGZpbGUgY2hhbmdlZCwg
MTEyIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnNj
ay9tb3VudC5jIGIvZnNjay9tb3VudC5jCj4+IGluZGV4IDRjNzQ4ODg0MGM3Yy4uOWQ2YTIyMmEw
NTVjIDEwMDY0NAo+PiAtLS0gYS9mc2NrL21vdW50LmMKPj4gKysrIGIvZnNjay9tb3VudC5jCj4+
IEBAIC0zNTE4LDIyICszNTE4LDkwIEBAIHN0YXRpYyB2b2lkIGRlc3Ryb3lfZnN5bmNfZG5vZGVz
KHN0cnVjdCBsaXN0X2hlYWQgKmhlYWQpCj4+ICAgIAkJZGVsX2ZzeW5jX2lub2RlKGVudHJ5KTsK
Pj4gICAgfQo+PiAgICAKPj4gK3N0YXRpYyBpbnQgZmluZF9ub2RlX2Jsa19mYXN0KHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwgYmxvY2tfdCAqYmxrYWRkcl9mYXN0LAo+PiArCQlzdHJ1Y3QgZjJm
c19ub2RlICpub2RlX2Jsa19mYXN0LCBib29sICppc19kZXRlY3RpbmcpCj4+ICt7Cj4+ICsJaW50
IGksIGVycjsKPj4gKwo+PiArCWZvciAoaSA9IDA7IGkgPCAyOyBpKyspIHsKPj4gKwkJaWYgKCFm
MmZzX2lzX3ZhbGlkX2Jsa2FkZHIoc2JpLCAqYmxrYWRkcl9mYXN0LCBNRVRBX1BPUikpIHsKPj4g
KwkJCSppc19kZXRlY3RpbmcgPSBmYWxzZTsKPj4gKwkJCXJldHVybiAwOwo+PiArCQl9Cj4+ICsK
Pj4gKwkJZXJyID0gZGV2X3JlYWRfYmxvY2sobm9kZV9ibGtfZmFzdCwgKmJsa2FkZHJfZmFzdCk7
Cj4+ICsJCWlmIChlcnIpCj4+ICsJCQlyZXR1cm4gZXJyOwo+PiArCj4+ICsJCWlmICghaXNfcmVj
b3ZlcmFibGVfZG5vZGUoc2JpLCBub2RlX2Jsa19mYXN0KSkgewo+PiArCQkJKmlzX2RldGVjdGlu
ZyA9IGZhbHNlOwo+PiArCQkJcmV0dXJuIDA7Cj4+ICsJCX0KPj4gKwo+PiArCQkqYmxrYWRkcl9m
YXN0ID0gbmV4dF9ibGthZGRyX29mX25vZGUobm9kZV9ibGtfZmFzdCk7Cj4+ICsJfQo+PiArCj4+
ICsJcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgbG9vcF9ub2RlX2NoYWluX2Zp
eChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+ICsJCWJsb2NrX3QgYmxrYWRkcl9mYXN0LCBz
dHJ1Y3QgZjJmc19ub2RlICpub2RlX2Jsa19mYXN0LAo+PiArCQlibG9ja190IGJsa2FkZHIsIHN0
cnVjdCBmMmZzX25vZGUgKm5vZGVfYmxrKQo+PiArewo+PiArCWJsb2NrX3QgYmxrYWRkcl9lbnRy
eSwgYmxrYWRkcl90bXA7Cj4+ICsJaW50IGVycjsKPj4gKwo+PiArCS8qIGZpbmQgdGhlIGVudHJ5
IHBvaW50IG9mIHRoZSBsb29wZWQgbm9kZSBjaGFpbiAqLwo+PiArCXdoaWxlIChibGthZGRyX2Zh
c3QgIT0gYmxrYWRkcikgewo+PiArCQllcnIgPSBkZXZfcmVhZF9ibG9jayhub2RlX2Jsa19mYXN0
LCBibGthZGRyX2Zhc3QpOwo+PiArCQlpZiAoZXJyKQo+PiArCQkJcmV0dXJuIGVycjsKPj4gKwkJ
YmxrYWRkcl9mYXN0ID0gbmV4dF9ibGthZGRyX29mX25vZGUobm9kZV9ibGtfZmFzdCk7Cj4+ICsK
Pj4gKwkJZXJyID0gZGV2X3JlYWRfYmxvY2sobm9kZV9ibGssIGJsa2FkZHIpOwo+PiArCQlpZiAo
ZXJyKQo+PiArCQkJcmV0dXJuIGVycjsKPj4gKwkJYmxrYWRkciA9IG5leHRfYmxrYWRkcl9vZl9u
b2RlKG5vZGVfYmxrKTsKPj4gKwl9Cj4+ICsJYmxrYWRkcl9lbnRyeSA9IGJsa2FkZHI7Cj4+ICsK
Pj4gKwkvKiBmaW5kIHRoZSBsYXN0IG5vZGUgb2YgdGhlIGNoYWluICovCj4+ICsJZG8gewo+PiAr
CQlibGthZGRyX3RtcCA9IGJsa2FkZHI7Cj4+ICsJCWVyciA9IGRldl9yZWFkX2Jsb2NrKG5vZGVf
YmxrLCBibGthZGRyKTsKPj4gKwkJaWYgKGVycikKPj4gKwkJCXJldHVybiBlcnI7Cj4+ICsJCWJs
a2FkZHIgPSBuZXh0X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2Jsayk7Cj4+ICsJfSB3aGlsZSAoYmxr
YWRkciAhPSBibGthZGRyX2VudHJ5KTsKPj4gKwo+PiArCS8qIGZpeCB0aGUgYmxrYWRkciBvZiBs
YXN0IG5vZGUgd2l0aCBOVUxMX0FERFIuICovCj4+ICsJbm9kZV9ibGstPmZvb3Rlci5uZXh0X2Js
a2FkZHIgPSBOVUxMX0FERFI7Cj4+ICsJaWYgKElTX0lOT0RFKG5vZGVfYmxrKSkKPj4gKwkJZXJy
ID0gd3JpdGVfaW5vZGUobm9kZV9ibGssIGJsa2FkZHJfdG1wKTsKPj4gKwllbHNlCj4+ICsJCWVy
ciA9IGRldl93cml0ZV9ibG9jayhub2RlX2JsaywgYmxrYWRkcl90bXApOwo+PiArCWlmICghZXJy
KQo+PiArCQlGSVhfTVNHKCJGaXggbG9vcGVkIG5vZGUgY2hhaW4gb24gYmxrYWRkciAldVxuIiwK
Pj4gKwkJCQlibGthZGRyX3RtcCk7Cj4+ICsJcmV0dXJuIGVycjsKPj4gK30KPj4gKwo+PiAgICBz
dGF0aWMgaW50IGZpbmRfZnN5bmNfaW5vZGUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1
Y3QgbGlzdF9oZWFkICpoZWFkKQo+PiAgICB7Cj4+ICAgIAlzdHJ1Y3QgY3Vyc2VnX2luZm8gKmN1
cnNlZzsKPj4gLQlzdHJ1Y3QgZjJmc19ub2RlICpub2RlX2JsazsKPj4gLQlibG9ja190IGJsa2Fk
ZHI7Cj4+IC0JdW5zaWduZWQgaW50IGxvb3BfY250ID0gMDsKPj4gLQl1bnNpZ25lZCBpbnQgZnJl
ZV9ibG9ja3MgPSBNQUlOX1NFR1Moc2JpKSAqIHNiaS0+YmxvY2tzX3Blcl9zZWcgLQo+PiAtCQkJ
CQkJc2JpLT50b3RhbF92YWxpZF9ibG9ja19jb3VudDsKPj4gKwlzdHJ1Y3QgZjJmc19ub2RlICpu
b2RlX2JsaywgKm5vZGVfYmxrX2Zhc3Q7Cj4+ICsJYmxvY2tfdCBibGthZGRyLCBibGthZGRyX2Zh
c3Q7Cj4+ICsJYm9vbCBpc19kZXRlY3RpbmcgPSB0cnVlOwo+PiAgICAJaW50IGVyciA9IDA7Cj4+
ICAgIAo+PiArCW5vZGVfYmxrID0gY2FsbG9jKEYyRlNfQkxLU0laRSwgMSk7Cj4+ICsJbm9kZV9i
bGtfZmFzdCA9IGNhbGxvYyhGMkZTX0JMS1NJWkUsIDEpOwo+PiArCUFTU0VSVChub2RlX2JsayAm
JiBub2RlX2Jsa19mYXN0KTsKPj4gKwo+PiAgICAJLyogZ2V0IG5vZGUgcGFnZXMgaW4gdGhlIGN1
cnJlbnQgc2VnbWVudCAqLwo+PiAgICAJY3Vyc2VnID0gQ1VSU0VHX0koc2JpLCBDVVJTRUdfV0FS
TV9OT0RFKTsKPj4gICAgCWJsa2FkZHIgPSBORVhUX0ZSRUVfQkxLQUREUihzYmksIGN1cnNlZyk7
Cj4+IC0KPj4gLQlub2RlX2JsayA9IGNhbGxvYyhGMkZTX0JMS1NJWkUsIDEpOwo+PiAtCUFTU0VS
VChub2RlX2Jsayk7Cj4+ICsJYmxrYWRkcl9mYXN0ID0gYmxrYWRkcjsKPj4gICAgCj4+ICAgIAl3
aGlsZSAoMSkgewo+PiAgICAJCXN0cnVjdCBmc3luY19pbm9kZV9lbnRyeSAqZW50cnk7Cj4+IEBA
IC0zNTY0LDE5ICszNjMyLDQ4IEBAIHN0YXRpYyBpbnQgZmluZF9mc3luY19pbm9kZShzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBsaXN0X2hlYWQgKmhlYWQpCj4+ICAgIAkJaWYgKElT
X0lOT0RFKG5vZGVfYmxrKSAmJiBpc19kZW50X2Rub2RlKG5vZGVfYmxrKSkKPj4gICAgCQkJZW50
cnktPmxhc3RfZGVudHJ5ID0gYmxrYWRkcjsKPj4gICAgbmV4dDoKPj4gLQkJLyogc2FuaXR5IGNo
ZWNrIGluIG9yZGVyIHRvIGRldGVjdCBsb29wZWQgbm9kZSBjaGFpbiAqLwo+PiAtCQlpZiAoKyts
b29wX2NudCA+PSBmcmVlX2Jsb2NrcyB8fAo+PiAtCQkJYmxrYWRkciA9PSBuZXh0X2Jsa2FkZHJf
b2Zfbm9kZShub2RlX2JsaykpIHsKPj4gLQkJCU1TRygwLCAiXHRkZXRlY3QgbG9vcGVkIG5vZGUg
Y2hhaW4sIGJsa2FkZHI6JXUsIG5leHQ6JXVcbiIsCj4+IC0JCQkJICAgIGJsa2FkZHIsCj4+IC0J
CQkJICAgIG5leHRfYmxrYWRkcl9vZl9ub2RlKG5vZGVfYmxrKSk7Cj4+ICsJCWJsa2FkZHIgPSBu
ZXh0X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2Jsayk7Cj4+ICsKPj4gKwkJLyogQmVsb3cgd2Ugd2ls
bCBkZXRlY3QgbG9vcGVkIG5vZGUgY2hhaW4gd2l0aCBGbG95ZCdzIGN5Y2xlCj4+ICsJCSAqIGRl
dGVjdGlvbiBhbGdvcml0aG0uCj4+ICsJCSAqLwo+PiArCQlpZiAoIWlzX2RldGVjdGluZykKPj4g
KwkJCWNvbnRpbnVlOwo+PiArCj4+ICsJCWVyciA9IGZpbmRfbm9kZV9ibGtfZmFzdChzYmksICZi
bGthZGRyX2Zhc3QsCj4+ICsJCQkJbm9kZV9ibGtfZmFzdCwgJmlzX2RldGVjdGluZyk7Cj4+ICsJ
CWlmIChlcnIpCj4+ICsJCQlicmVhazsKPj4gKwo+PiArCQlpZiAoIWlzX2RldGVjdGluZykKPj4g
KwkJCWNvbnRpbnVlOwo+PiArCj4+ICsJCWlmIChibGthZGRyX2Zhc3QgIT0gYmxrYWRkcikKPj4g
KwkJCWNvbnRpbnVlOwo+PiArCj4+ICsJCUFTU0VSVF9NU0coIlx0ZGV0ZWN0IGxvb3BlZCBub2Rl
IGNoYWluLCBibGthZGRyOiV1XG4iLAo+PiArCQkJCWJsa2FkZHIpOwo+PiArCj4+ICsJCWlmICgh
Yy5maXhfb24pIHsKPj4gICAgCQkJZXJyID0gLTE7Cj4+ICAgIAkJCWJyZWFrOwo+PiAgICAJCX0K
Pj4gICAgCj4+IC0JCWJsa2FkZHIgPSBuZXh0X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2Jsayk7Cj4+
ICsJCWVyciA9IGxvb3Bfbm9kZV9jaGFpbl9maXgoc2JpLAo+PiArCQkJCU5FWFRfRlJFRV9CTEtB
RERSKHNiaSwgY3Vyc2VnKSwKPj4gKwkJCQlub2RlX2Jsa19mYXN0LCBibGthZGRyLCBub2RlX2Js
ayk7Cj4+ICsJCWlmIChlcnIpCj4+ICsJCQlicmVhazsKPj4gKwo+PiArCQkvKiBTaW5jZSB3ZSBj
YWxsIGdldF9mc3luY19pbm9kZSgpIHRvIGVuc3VyZSB0aGVyZSBhcmUgbm8KPj4gKwkJICogZHVw
bGljYXRlIGlub2RlcyBpbiB0aGUgaW5vZGVfbGlzdCBldmVuIGlmIHRoZXJlIGFyZQo+PiArCQkg
KiBkdXBsaWNhdGUgYmxrYWRkciwgd2UgY2FuIGNvbnRpbnVlIHJ1bm5pbmcgYWZ0ZXIgZml4aW5n
IHRoZQo+PiArCQkgKiBsb29wZWQgbm9kZSBjaGFpbi4KPj4gKwkJICovCj4+ICsJCWlzX2RldGVj
dGluZyA9IGZhbHNlOwoKSGkgQ2h1bmhhaSwKCldoYXQgYWJvdXQgY2xlYW5pbmcgdXAgYWJvdmUg
bG9naWMgbGlrZSB3ZSBkaWQgaW4ga2VybmVsIHNpZGU/CgpUaGFua3MsCgo+PiAgICAJfQo+PiAg
ICAKPj4gKwlmcmVlKG5vZGVfYmxrX2Zhc3QpOwo+PiAgICAJZnJlZShub2RlX2Jsayk7Cj4+ICAg
IAlyZXR1cm4gZXJyOwo+PiAgICB9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
