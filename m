Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB5F8728F2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Mar 2024 21:52:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhbli-00030I-Hj;
	Tue, 05 Mar 2024 20:52:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rhblg-000308-TH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 20:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8rXKGPEkTmu+BAnnSkhkWAdeB9xJALl6V0JSG5DPc74=; b=Nve8BaOENksfztUazwVKSPPqXr
 PYdU8FqSmYWtRmUEl14EmCq1uzqUD/QBi+DhmiEYQxn9xe69TCHqkRCor+G/YydNUIhifwa2jvqcD
 KK7O03ZwXFs8on/fWFrb/ntY8TxMjBaRWpFrHOjxSk4PjwvkaO/xwAYTTHmYvt6SYIk0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8rXKGPEkTmu+BAnnSkhkWAdeB9xJALl6V0JSG5DPc74=; b=WHHflAyg7NXB7z11ypCfNiQRBj
 EsijAU6mj2HSfAVWb+WfU9HpSzwcR7/37CHfdLTujCNvYNVx/aYWyhmaUTt5XIRBmCfBilIYWDdvO
 VdioTzRYUtgOzJ7g/4KmKsDs441i+OWaF2nSuYnHaTc7c7gQeiDZWWKdSHTALKbxbn7g=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhblZ-0003Hc-MA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 20:52:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1C90ECE1CF2;
 Tue,  5 Mar 2024 20:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D16AC433F1;
 Tue,  5 Mar 2024 20:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709671915;
 bh=fwx3CwkCXDuygKPyLrt+M9arUyVPx19CfzpNJfgXKhg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cmo/KUmy2938xKZpmmNIp8EQU8g09vcLpTAWw43x5kMDGZ6Al3iFQT4f8y0oKNxbO
 Cc9zLP0aP4QgbZ5scyuXCHXQlp/UorlzTcadjQAofZu+1fxc6x7IniGjGPq6dbBKNC
 wJUydROjXNfcAEzhFuLTvYFId6OQLxUoXC07EwegaxDxvqW2EqB9YwDd6+Gn3xvmQP
 uWGN3zZwq8du1WEhsWjxAAhaceXxBbE9QJW/WygRh+NaYJg4X1ug0nrsbsvQ9nYMR/
 8A28cSZONCC+uCKBDVQU/vXwoyV7fia3Qd4d+6uMORpjT+KFoezTDcgioiGJBdAdzd
 QgWWeqyztrZ5Q==
Date: Tue, 5 Mar 2024 12:51:53 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: =?utf-8?B?6buE5L2z55S3?= <huangjianan@xiaomi.com>
Message-ID: <ZeeF6QrxxdJ3qnng@google.com>
References: <20240229074141.66395-1-huangjianan@xiaomi.com>
 <20240301071402.159309-1-huangjianan@xiaomi.com>
 <CAD14+f0saGRa401qDWKwFiYgsHUBcqrfxgmXCWcq1Eqphj8OPw@mail.gmail.com>
 <9ee3e01b-72c2-4eed-aed7-b005b3173203@xiaomi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ee3e01b-72c2-4eed-aed7-b005b3173203@xiaomi.com>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 03/01, 黄佳男 wrote: > On 2024/3/1 16:39, Juhyung Park
    wrote: > > [外部邮件] 此邮件来源于小米公司外部，请谨慎处理。若对邮件安全性存疑，请将邮件转发给misec
    [...] 
 
 Content analysis details:   (-3.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhblZ-0003Hc-MA
Subject: Re: [f2fs-dev] [External Mail]Re: [PATCH v3] f2fs-tools: fix to
 check loop device for non-root users
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
Cc: =?utf-8?B?546L6L6J?= <wanghui33@xiaomi.com>,
 "jnhuang95@gmail.com" <jnhuang95@gmail.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDMvMDEsIOm7hOS9s+eUtyB3cm90ZToKPiBPbiAyMDI0LzMvMSAxNjozOSwgSnVoeXVuZyBQ
YXJrIHdyb3RlOgo+ID4gW+WklumDqOmCruS7tl0g5q2k6YKu5Lu25p2l5rqQ5LqO5bCP57Gz5YWs
5Y+45aSW6YOo77yM6K+36LCo5oWO5aSE55CG44CC6Iul5a+56YKu5Lu25a6J5YWo5oCn5a2Y55aR
77yM6K+35bCG6YKu5Lu26L2s5Y+R57uZbWlzZWNAeGlhb21pLmNvbei/m+ihjOWPjemmiAo+ID4K
PiA+IEhpIEh1YW5nIGFuZCBDaGFvLgo+ID4KPiA+IEkgZmVlbCBsaWtlIHRoaXMgc3BlY2lhbCBs
b29wYmFjayBoYW5kbGluZyBhbG9uZ3NpZGUgQ2hhbydzCj4gPiAxNDE5N2Q1NDZiOTMgb24gZjJm
cy10b29scyBpcyBqdXN0IHVubmVjZXNzYXJpbHkgY29tcGxpY2F0aW5nIHRoZSBjb2RlCj4gPiBm
bG93Lgo+ID4gV2UncmUgbm93IGRvaW5nIHdoYXQsIGxvb2t1cCB0byAvc3lzLCBwYXJzZSBvcmln
aW5hbCBiYWNraW5nIGZpbGUsCj4gPiByZW1vdmUgdHJhaWxpbmcgbmV3bGluZSBjaGFyLCBzdGF0
KCknaW5nIGl0IHRvIG1ha2Ugc3VyZSBpdCBleGlzdHM/Cj4gCj4gSW5kZWVkIHRoaXMgaXMgbm90
IGEgZ29vZCBhcHByb2FjaC4KPiAKPiA+IFdoYXQgaWYgdGhlIHN0YXQoKSdlZCBmaWxlIGlzIGEg
bmV3IGZpbGUgYWZ0ZXIgdGhlIG9yaWdpbmFsIGJhY2tpbmcKPiA+IGZpbGUgaGFzIGJlZW4gZGVs
ZXRlZD8KPiA+Cj4gPiBCZWluZyBhYmxlIHRvIG92ZXJ3cml0ZSBhbiBhY3RpdmUgbG9vcGJhY2sg
YmFja2luZyBmaWxlIGlzIGEgc2VtYW50aWMKPiA+IHRoYXQgTGludXggcHJvdmlkZXMgd2lsbGlu
Z2x5Lgo+ID4gT19FWENMIG9ubHkgd29ya3Mgb24gYmxvY2sgZGV2aWNlcyBhbmQgaXQncyBhIFBP
U0lYIGd1YXJhbnRlZSB0aGF0Cj4gPiBtdWx0aXBsZSB3cml0ZXJzIGNhbiB3b3JrIG9uIGEgcmVn
dWxhciBmaWxlLgo+ID4KPiA+IElNSE8gd2Ugc2hvdWxkIGhvbm9yIHRoYXQsIGJ1dCBpZiB3ZSBy
ZWFsbHkgd2FudCB0byBwcmV2ZW50IHRoaXMgYWtpbgo+ID4gdG8gZTJmc3Byb2dzLCB3ZSBzaG91
bGQgYmUgdXNpbmcgbW50ZW50IGxpa2UgZTJmc3Byb2dzLgo+IAo+IGUyZnNwcm9ncyB3aWxsIGNv
bnRpbnVlIHRvIGNoZWNrIGlmIG9wZW5pbmcgdGhlIGxvb3AgZGV2aWNlIGZhaWxzLCAKPiByYXRo
ZXIgdGhhbgo+IAo+IGV4aXRpbmcuIFRoaXMgd2F5IG5vbi1yb290IHVzZXJzIGNhbiB1c2UgbWtm
cy9mc2NrIG5vcm1hbGx5LCBhbHRob3VnaCB0aGVyZQo+IAo+IG1heSBiZSBvdmVyd3JpdGUgaXNz
dWVzLgoKSSB0aGluayB3ZSBuZWVkIHRvIGZpeCB0aGlzIGZpcnN0IGFuZCB0cnkgdG8gZmluZCBh
IGJldHRlciB3YXkuCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIw
MjQwMzA1MjA0ODM0LjEwMTY5Ny0xLWphZWdldWtAa2VybmVsLm9yZy9ULyN1Cgo+IAo+IAo+IFRo
YW5rcywKPiAKPiBKaWFuYW4KPiAKPiA+IE9uIEZyaSwgTWFyIDEsIDIwMjQgYXQgNDoxNeKAr1BN
IEh1YW5nIEppYW5hbiB2aWEgTGludXgtZjJmcy1kZXZlbAo+ID4gPGxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToKPiA+PiBDdXJyZW50bHkgbWtmcy9mc2NrIGdl
dHMgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVuIGV4ZWN1dGVkIGJ5Cj4gPj4gbm9uLXJvb3QgdXNl
cnM6Cj4gPj4KPiA+PiBJbmZvOiBvcGVuIC9kZXYvbG9vcDAgZmFpbGVkIGVycm5vOjEzCj4gPj4g
ICAgICAgICAgRXJyb3I6IE5vdCBhdmFpbGFibGUgb24gbW91bnRlZCBkZXZpY2UhCj4gPj4KPiA+
PiBMZXQncyBmaXggaXQgYnkgcmVhZGluZyB0aGUgYmFja2luZyBmaWxlIGZyb20gc3lzZnMuCj4g
Pj4KPiA+PiBGaXhlczogMTQxOTdkNTQ2YjkzICgiZjJmcy10b29sczogZml4IHRvIGNoZWNrIGxv
b3AgZGV2aWNlIikKPiA+PiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBKaWFuYW4gPGh1YW5namlhbmFu
QHhpYW9taS5jb20+Cj4gPj4gLS0tCj4gPj4gdjM6Cj4gPj4gLSBTa2lwIGRlbGV0ZWQgYmFja2lu
ZyBmaWxlLgo+ID4+ICAgbGliL2xpYmYyZnMuYyB8IDQwICsrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCsp
LCAxMyBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9saWIvbGliZjJmcy5jIGIv
bGliL2xpYmYyZnMuYwo+ID4+IGluZGV4IGQ1MWU0ODUuLmZhZDNmZDQgMTAwNjQ0Cj4gPj4gLS0t
IGEvbGliL2xpYmYyZnMuYwo+ID4+ICsrKyBiL2xpYi9saWJmMmZzLmMKPiA+PiBAQCAtODMyLDcg
KzgzMiw3IEBAIGludCBmMmZzX2Rldl9pc191bW91bnRlZChjaGFyICpwYXRoKQo+ID4+ICAgICAg
ICAgICAgICAgICAgfQo+ID4+ICAgICAgICAgIH0gZWxzZSBpZiAoU19JU1JFRyhzdF9idWYuc3Rf
bW9kZSkpIHsKPiA+PiAgICAgICAgICAgICAgICAgIC8qIGNoZWNrIHdoZXRoZXIgcmVndWxhciBp
cyBiYWNrZmlsZSBvZiBsb29wIGRldmljZSAqLwo+ID4+IC0jaWYgZGVmaW5lZChIQVZFX0xJTlVY
X0xPT1BfSCkgJiYgZGVmaW5lZChIQVZFX0xJTlVYX01BSk9SX0gpCj4gPj4gKyNpZiBkZWZpbmVk
KEhBVkVfTElOVVhfTUFKT1JfSCkKPiA+PiAgICAgICAgICAgICAgICAgIHN0cnVjdCBtbnRlbnQg
Km1udDsKPiA+PiAgICAgICAgICAgICAgICAgIHN0cnVjdCBzdGF0IHN0X2xvb3A7Cj4gPj4gICAg
ICAgICAgICAgICAgICBGSUxFICpmOwo+ID4+IEBAIC04NDAsOCArODQwLDkgQEAgaW50IGYyZnNf
ZGV2X2lzX3Vtb3VudGVkKGNoYXIgKnBhdGgpCj4gPj4gICAgICAgICAgICAgICAgICBmID0gc2V0
bW50ZW50KCIvcHJvYy9tb3VudHMiLCAiciIpOwo+ID4+Cj4gPj4gICAgICAgICAgICAgICAgICB3
aGlsZSAoKG1udCA9IGdldG1udGVudChmKSkgIT0gTlVMTCkgewo+ID4+IC0gICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBsb29wX2luZm82NCBsb29waW5mbyA9IHswLCB9Owo+ID4+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGludCBsb29wX2ZkLCBlcnI7Cj4gPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IHN0YXQgc3RfYmFjazsKPiA+PiArICAgICAgICAgICAgICAgICAgICAg
ICBpbnQgc3lzZnNfZmQsIHJjOwo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIGNoYXIgYnVm
W1BBVEhfTUFYICsgMV07Cj4gPj4KPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKG1u
dC0+bW50X2ZzbmFtZVswXSAhPSAnLycpCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29udGludWU7Cj4gPj4gQEAgLTg1MiwyMyArODUzLDM2IEBAIGludCBmMmZzX2Rldl9p
c191bW91bnRlZChjaGFyICpwYXRoKQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAo
bWFqb3Ioc3RfbG9vcC5zdF9yZGV2KSAhPSBMT09QX01BSk9SKQo+ID4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4+Cj4gPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgbG9vcF9mZCA9IG9wZW4obW50LT5tbnRfZnNuYW1lLCBPX1JET05MWSk7Cj4gPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKGxvb3BfZmQgPCAwKSB7Cj4gPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgc25wcmludGYoYnVmLCBQQVRIX01BWCwKPiA+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAiL3N5cy9kZXYvYmxvY2svJWQ6JWQvbG9vcC9iYWNraW5nX2ZpbGUi
LAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1ham9yKHN0X2xvb3Auc3Rf
cmRldiksIG1pbm9yKHN0X2xvb3Auc3RfcmRldikpOwo+ID4+ICsKPiA+PiArICAgICAgICAgICAg
ICAgICAgICAgICBzeXNmc19mZCA9IG9wZW4oYnVmLCBPX1JET05MWSk7Cj4gPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKHN5c2ZzX2ZkIDwgMCkgewo+ID4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIE1TRygwLCAiSW5mbzogb3BlbiAlcyBmYWlsZWQgZXJybm86JWRcbiIs
Cj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1udC0+bW50X2Zz
bmFtZSwgZXJybm8pOwo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBidWYsIGVycm5vKTsKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gLTE7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+Pgo+ID4+IC0gICAgICAg
ICAgICAgICAgICAgICAgIGVyciA9IGlvY3RsKGxvb3BfZmQsIExPT1BfR0VUX1NUQVRVUzY0LCAm
bG9vcGluZm8pOwo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgIGNsb3NlKGxvb3BfZmQpOwo+
ID4+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmIChlcnIgPCAwKSB7Cj4gPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBNU0coMCwgIlx0RXJyb3I6IGlvY3RsIExPT1BfR0VUX1NU
QVRVUzY0IGZhaWxlZCBlcnJubzolZCFcbiIsCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGVycm5vKTsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBtZW1z
ZXQoYnVmLCAwLCBQQVRIX01BWCArIDEpOwo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJj
ID0gcmVhZChzeXNmc19mZCwgYnVmLCBQQVRIX01BWCk7Cj4gPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKHJjIDwgMCkgewo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
TVNHKDAsICJJbmZvOiByZWFkICVzIGZhaWxlZCBlcnJubzolZFxuIiwKPiA+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnVmLCBlcnJubyk7Cj4gPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC0xOwo+ID4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICB9Cj4gPj4KPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAoc3RfYnVmLnN0
X2RldiA9PSBsb29waW5mby5sb19kZXZpY2UgJiYKPiA+PiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0X2J1Zi5zdF9pbm8gPT0gbG9vcGluZm8ubG9faW5vZGUpIHsKPiA+PiArICAg
ICAgICAgICAgICAgICAgICAgICAvKiBSZW1vdmUgdHJhaWxpbmcgbmV3bGluZSAqLwo+ID4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGlmIChyYyA+IDAgJiYgKihidWYgKyByYyAtIDEpID09ICdc
bicpCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLXJjOwo+ID4+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGJ1ZltyY10gPSAnXDAnOwo+ID4+ICsKPiA+PiArICAgICAgICAg
ICAgICAgICAgICAgICAvKiBTa2lwIGRlbGV0ZWQgZmlsZXMgbGlrZSAieHh4IChkZWxldGVkKSIg
Ki8KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoc3RhdChidWYsICZzdF9iYWNrKSAh
PSAwKQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPj4g
Kwo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChzdF9idWYuc3RfZGV2ID09IHN0X2Jh
Y2suc3RfZGV2ICYmCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdF9idWYu
c3RfaW5vID09IHN0X2JhY2suc3RfaW5vKSB7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgTVNHKDAsICJcdEVycm9yOiBJbiB1c2UgYnkgbG9vcCBkZXZpY2UhXG4iKTsKPiA+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ID4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPj4gLS0KPiA+PiAyLjM0LjEKPiA+Pgo+ID4+Cj4g
Pj4KPiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
ID4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPj4gTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4gCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
