Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3BF983ABF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Sep 2024 03:19:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ssuCb-0000kF-Mv;
	Tue, 24 Sep 2024 01:18:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ssuCa-0000k8-S5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 01:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XMRL5BmG9kQY0JTs1AmChaBTd1IxYwIZMjBzp5c+1tQ=; b=FU1A9tULsCXIhTWJCnzQvA/8FH
 SLBR9lQyC5dVZnVKlugryKCE7oKfb5CekZrdpIFggh/9i9F3ya/brlN5g51IM8zxZEjggctiodN2a
 /Hn2jc4lEIE2UI9u0FrO29gVB2hCbbEzyNbOMXBIE7JPL2r1YalQb0KHOzv6Ecb3OuY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XMRL5BmG9kQY0JTs1AmChaBTd1IxYwIZMjBzp5c+1tQ=; b=KD7AztEcswJiq++vb9NTmucl6w
 Ka2AIt1RAwwz0Unqb/+bAMKsrNUGkfa4xDoVMxRt+Y61KWmMuB7Y3j06W3EDOMI5+Kz6NvDG7oPGR
 nB7bnfl87MfA4iUk4KMKef5zvzhsnhbnz13ZUnyDJ0bt/Tgm762AveLgiyBMsKS6rOW8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ssuCZ-0000WT-St for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 01:18:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 880AB5C5950;
 Tue, 24 Sep 2024 01:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B1FC4CECD;
 Tue, 24 Sep 2024 01:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727140726;
 bh=wOoDaYvorsKuiMpU6ETftUFar58R0m0KF7yRCSBKyY0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=iJ4uQ+WgkIo9eNr6lOfaUAg+KPRaS8ZVnro8E7dovz4GiSqHyaUZb9Z4mCTCNG6wb
 Nc5zXPm4y041vnrrAV4MF9HZ1PxAosZIGz+BuAbjQuK1gAjswuFz3PlNw+xPywhVja
 vYoemYQTZK6dTLvQ7goj62PXgMNWzerDKLz+o87uwHj36StfKDopaxp1L2Z2Jc3rIo
 g1mLTlVrex8MExwxz1VYxUHe4rKBoflUkL3aTC+uL37xN0xJ3Av/EqAtUFR60dJLH4
 CEEremfW7aY23AssIOM7RNXCahLWLWPPUyr98jlfFvRvC9Tdtgd45n5xqa9QnIcZDy
 OVxiJn6/GgfKA==
Message-ID: <96f8f5e1-41d1-4730-a9d3-73c296ce0c00@kernel.org>
Date: Tue, 24 Sep 2024 09:18:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240913212810.912171-1-daeho43@gmail.com>
 <cef0eeba-6089-44c6-b08e-308f8ee36f6a@kernel.org>
 <CACOAw_xW_UsNLy-j6tySmOLzqR6LDDDCZnpx4Uj8PF=ZTuVRag@mail.gmail.com>
 <ff63da2f-77f8-40f3-a111-1defec6adb04@kernel.org>
 <ZvGFxTDW-6aa3FUe@google.com>
Content-Language: en-US
In-Reply-To: <ZvGFxTDW-6aa3FUe@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/9/23 23:14, Jaegeuk Kim wrote: > On 09/23, Chao Yu
    wrote: >> On 2024/9/20 23:38, Daeho Jeong wrote: >>> On Thu, Sep 19, 2024
    at 6:14 AM Chao Yu <chao@kernel.org> wrote: >>>> >>>> On 2024/9/1 [...]
    
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ssuCZ-0000WT-St
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce device aliasing file
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC85LzIzIDIzOjE0LCBKYWVnZXVrIEtpbSB3cm90ZToKPiBPbiAwOS8yMywgQ2hhbyBZ
dSB3cm90ZToKPj4gT24gMjAyNC85LzIwIDIzOjM4LCBEYWVobyBKZW9uZyB3cm90ZToKPj4+IE9u
IFRodSwgU2VwIDE5LCAyMDI0IGF0IDY6MTTigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+
IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMjAyNC85LzE0IDU6MjgsIERhZWhvIEplb25nIHdyb3RlOgo+
Pj4+PiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+Pj4+Pgo+Pj4+
PiBGMkZTIHNob3VsZCB1bmRlcnN0YW5kIGhvdyB0aGUgZGV2aWNlIGFsaWFzaW5nIGZpbGUgd29y
a3MgYW5kIHN1cHBvcnQKPj4+Pj4gZGVsZXRpbmcgdGhlIGZpbGUgYWZ0ZXIgdXNlLiBBIGRldmlj
ZSBhbGlhc2luZyBmaWxlIGNhbiBiZSBjcmVhdGVkIGJ5Cj4+Pj4+IG1rZnMuZjJmcyB0b29sIGFu
ZCBpdCBjYW4gbWFwIHRoZSB3aG9sZSBkZXZpY2Ugd2l0aCBhbiBleHRyZW50LCBub3QKPj4+Pj4g
dXNpbmcgbm9kZSBibG9ja3MuIFRoZSBmaWxlIHNwYWNlIHNob3VsZCBiZSBwaW5uZWQgYW5kIG5v
cm1hbGx5IHVzZWQgZm9yCj4+Pj4+IHJlYWQtb25seSB1c2FnZXMuCj4+Pj4+Cj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+Pj4+IC0tLQo+
Pj4+PiAgICAgZnMvZjJmcy9kYXRhLmMgICAgICAgICB8ICA1ICsrKysrCj4+Pj4+ICAgICBmcy9m
MmZzL2V4dGVudF9jYWNoZS5jIHwgMTAgKysrKysrKysrKwo+Pj4+PiAgICAgZnMvZjJmcy9mMmZz
LmggICAgICAgICB8ICA1ICsrKysrCj4+Pj4+ICAgICBmcy9mMmZzL2ZpbGUuYyAgICAgICAgIHwg
MzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCj4+Pj4+ICAgICBmcy9mMmZz
L2lub2RlLmMgICAgICAgIHwgMTAgKysrKysrKystLQo+Pj4+PiAgICAgZnMvZjJmcy9zeXNmcy5j
ICAgICAgICB8ICAyICsrCj4+Pj4+ICAgICA2IGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEu
YyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+IGluZGV4IDY0NTdlNWJjYTljOS4uOWNlOTIwOTNiYTFl
IDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4+PiArKysgYi9mcy9mMmZzL2Rh
dGEuYwo+Pj4+PiBAQCAtMzQyMyw2ICszNDIzLDExIEBAIHN0YXRpYyBpbnQgcHJlcGFyZV93cml0
ZV9iZWdpbihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+Pj4+Cj4+Pj4+ICAgICAgICAgaWYg
KCFmMmZzX2xvb2t1cF9yZWFkX2V4dGVudF9jYWNoZV9ibG9jayhpbm9kZSwgaW5kZXgsCj4+Pj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZG4uZGF0
YV9ibGthZGRyKSkgewo+Pj4+PiArICAgICAgICAgICAgIGlmIChJU19ERVZJQ0VfQUxJQVNJTkco
aW5vZGUpKSB7Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICBlcnIgPSAtRU5PREFUQTsKPj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+Pj4+PiArICAgICAgICAgICAgIH0K
Pj4+Pj4gKwo+Pj4+PiAgICAgICAgICAgICAgICAgaWYgKGxvY2tlZCkgewo+Pj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICBlcnIgPSBmMmZzX3Jlc2VydmVfYmxvY2soJmRuLCBpbmRleCk7Cj4+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9leHRlbnRfY2FjaGUuYyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4+Pj4gaW5k
ZXggZmQxZmMwNjM1OWVlLi4wMzg4Mzk2M2I5OTEgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMv
ZXh0ZW50X2NhY2hlLmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+Pj4+PiBA
QCAtNDAxLDYgKzQwMSwxMSBAQCB2b2lkIGYyZnNfaW5pdF9yZWFkX2V4dGVudF90cmVlKHN0cnVj
dCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICppcGFnZSkKPj4+Pj4gICAgICAgICBpZiAoYXRv
bWljX3JlYWQoJmV0LT5ub2RlX2NudCkgfHwgIWVpLmxlbikKPj4+Pj4gICAgICAgICAgICAgICAg
IGdvdG8gc2tpcDsKPj4+Pj4KPj4+Pj4gKyAgICAgaWYgKElTX0RFVklDRV9BTElBU0lORyhpbm9k
ZSkpIHsKPj4+Pj4gKyAgICAgICAgICAgICBldC0+bGFyZ2VzdCA9IGVpOwo+Pj4+PiArICAgICAg
ICAgICAgIGdvdG8gc2tpcDsKPj4+Pj4gKyAgICAgfQo+Pj4+PiArCj4+Pj4+ICAgICAgICAgZW4g
PSBfX2F0dGFjaF9leHRlbnRfbm9kZShzYmksIGV0LCAmZWksIE5VTEwsCj4+Pj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgJmV0LT5yb290LnJiX3Jvb3QucmJfbm9kZSwgdHJ1ZSk7
Cj4+Pj4+ICAgICAgICAgaWYgKGVuKSB7Cj4+Pj4+IEBAIC00NjMsNiArNDY4LDExIEBAIHN0YXRp
YyBib29sIF9fbG9va3VwX2V4dGVudF90cmVlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHBnb2ZmX3Qg
cGdvZnMsCj4+Pj4+ICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPj4+Pj4gICAgICAgICB9Cj4+
Pj4+Cj4+Pj4+ICsgICAgIGlmIChJU19ERVZJQ0VfQUxJQVNJTkcoaW5vZGUpKSB7Cj4+Pj4+ICsg
ICAgICAgICAgICAgcmV0ID0gZmFsc2U7Cj4+Pj4+ICsgICAgICAgICAgICAgZ290byBvdXQ7Cj4+
Pj4+ICsgICAgIH0KPj4+Pj4gKwo+Pj4+PiAgICAgICAgIGVuID0gX19sb29rdXBfZXh0ZW50X25v
ZGUoJmV0LT5yb290LCBldC0+Y2FjaGVkX2VuLCBwZ29mcyk7Cj4+Pj4+ICAgICAgICAgaWYgKCFl
bikKPj4+Pj4gICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+Pj4+PiBpbmRleCBhYzE5YzYxZjBjM2UuLjU5
MTc5YjliM2E4MyAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+Pj4gKysrIGIv
ZnMvZjJmcy9mMmZzLmgKPj4+Pj4gQEAgLTIwOCw2ICsyMDgsNyBAQCBzdHJ1Y3QgZjJmc19tb3Vu
dF9pbmZvIHsKPj4+Pj4gICAgICNkZWZpbmUgRjJGU19GRUFUVVJFX0NBU0VGT0xEICAgICAgICAg
ICAgICAgICAgICAgICAweDAwMDAxMDAwCj4+Pj4+ICAgICAjZGVmaW5lIEYyRlNfRkVBVFVSRV9D
T01QUkVTU0lPTiAgICAgICAgICAgIDB4MDAwMDIwMDAKPj4+Pj4gICAgICNkZWZpbmUgRjJGU19G
RUFUVVJFX1JPICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAwMDA0MDAwCj4+Pj4+ICsj
ZGVmaW5lIEYyRlNfRkVBVFVSRV9ERVZJQ0VfQUxJQVMgICAgICAgICAgICAweDAwMDA4MDAwCj4+
Pj4+Cj4+Pj4+ICAgICAjZGVmaW5lIF9fRjJGU19IQVNfRkVBVFVSRShyYXdfc3VwZXIsIG1hc2sp
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+Pj4gICAgICAgICAoKHJhd19zdXBlci0+ZmVh
dHVyZSAmIGNwdV90b19sZTMyKG1hc2spKSAhPSAwKQo+Pj4+PiBAQCAtMzAwMSw2ICszMDAyLDcg
QEAgc3RhdGljIGlubGluZSB2b2lkIGYyZnNfY2hhbmdlX2JpdCh1bnNpZ25lZCBpbnQgbnIsIGNo
YXIgKmFkZHIpCj4+Pj4+ICAgICAjZGVmaW5lIEYyRlNfRElSU1lOQ19GTCAgICAgICAgICAgICAg
ICAgICAgIDB4MDAwMTAwMDAgLyogZGlyc3luYyBiZWhhdmlvdXIgKGRpcmVjdG9yaWVzIG9ubHkp
ICovCj4+Pj4+ICAgICAjZGVmaW5lIEYyRlNfUFJPSklOSEVSSVRfRkwgICAgICAgICAweDIwMDAw
MDAwIC8qIENyZWF0ZSB3aXRoIHBhcmVudHMgcHJvamlkICovCj4+Pj4+ICAgICAjZGVmaW5lIEYy
RlNfQ0FTRUZPTERfRkwgICAgICAgICAgICAweDQwMDAwMDAwIC8qIENhc2Vmb2xkZWQgZmlsZSAq
Lwo+Pj4+PiArI2RlZmluZSBGMkZTX0RFVklDRV9BTElBU19GTCAgICAgICAgIDB4ODAwMDAwMDAg
LyogRmlsZSBmb3IgYWxpYXNpbmcgYSBkZXZpY2UgKi8KPj4+Pj4KPj4+Pj4gICAgICNkZWZpbmUg
RjJGU19RVU9UQV9ERUZBVUxUX0ZMICAgICAgICAgICAgICAgKEYyRlNfTk9BVElNRV9GTCB8IEYy
RlNfSU1NVVRBQkxFX0ZMKQo+Pj4+Pgo+Pj4+PiBAQCAtMzAxNiw2ICszMDE4LDggQEAgc3RhdGlj
IGlubGluZSB2b2lkIGYyZnNfY2hhbmdlX2JpdCh1bnNpZ25lZCBpbnQgbnIsIGNoYXIgKmFkZHIp
Cj4+Pj4+ICAgICAvKiBGbGFncyB0aGF0IGFyZSBhcHByb3ByaWF0ZSBmb3Igbm9uLWRpcmVjdG9y
aWVzL3JlZ3VsYXIgZmlsZXMuICovCj4+Pj4+ICAgICAjZGVmaW5lIEYyRlNfT1RIRVJfRkxNQVNL
ICAgKEYyRlNfTk9EVU1QX0ZMIHwgRjJGU19OT0FUSU1FX0ZMKQo+Pj4+Pgo+Pj4+PiArI2RlZmlu
ZSBJU19ERVZJQ0VfQUxJQVNJTkcoaW5vZGUpICAgIChGMkZTX0koaW5vZGUpLT5pX2ZsYWdzICYg
RjJGU19ERVZJQ0VfQUxJQVNfRkwpCj4+Pj4+ICsKPj4+Pj4gICAgIHN0YXRpYyBpbmxpbmUgX191
MzIgZjJmc19tYXNrX2ZsYWdzKHVtb2RlX3QgbW9kZSwgX191MzIgZmxhZ3MpCj4+Pj4+ICAgICB7
Cj4+Pj4+ICAgICAgICAgaWYgKFNfSVNESVIobW9kZSkpCj4+Pj4+IEBAIC00NDc4LDYgKzQ0ODIs
NyBAQCBGMkZTX0ZFQVRVUkVfRlVOQ1Moc2JfY2hrc3VtLCBTQl9DSEtTVU0pOwo+Pj4+PiAgICAg
RjJGU19GRUFUVVJFX0ZVTkNTKGNhc2Vmb2xkLCBDQVNFRk9MRCk7Cj4+Pj4+ICAgICBGMkZTX0ZF
QVRVUkVfRlVOQ1MoY29tcHJlc3Npb24sIENPTVBSRVNTSU9OKTsKPj4+Pj4gICAgIEYyRlNfRkVB
VFVSRV9GVU5DUyhyZWFkb25seSwgUk8pOwo+Pj4+PiArRjJGU19GRUFUVVJFX0ZVTkNTKGRldmlj
ZV9hbGlhcywgREVWSUNFX0FMSUFTKTsKPj4+Pj4KPj4+Pj4gICAgICNpZmRlZiBDT05GSUdfQkxL
X0RFVl9aT05FRAo+Pj4+PiAgICAgc3RhdGljIGlubGluZSBib29sIGYyZnNfYmxrel9pc19zZXEo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgZGV2aSwKPj4+Pj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPj4+Pj4gaW5kZXggMTY4ZjA4NTA3MDA0Li4w
ZjRhZjZiMzAzZmYgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+ICsrKyBi
L2ZzL2YyZnMvZmlsZS5jCj4+Pj4+IEBAIC03MjcsNiArNzI3LDExIEBAIGludCBmMmZzX2RvX3Ry
dW5jYXRlX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCB1NjQgZnJvbSwgYm9vbCBsb2NrKQo+
Pj4+Pgo+Pj4+PiAgICAgICAgIHRyYWNlX2YyZnNfdHJ1bmNhdGVfYmxvY2tzX2VudGVyKGlub2Rl
LCBmcm9tKTsKPj4+Pj4KPj4+Pj4gKyAgICAgaWYgKElTX0RFVklDRV9BTElBU0lORyhpbm9kZSkg
JiYgZnJvbSkgewo+Pj4+PiArICAgICAgICAgICAgIGVyciA9IC1FSU5WQUw7Cj4+Pj4+ICsgICAg
ICAgICAgICAgZ290byBvdXRfZXJyOwo+Pj4+PiArICAgICB9Cj4+Pj4+ICsKPj4+Pj4gICAgICAg
ICBmcmVlX2Zyb20gPSAocGdvZmZfdClGMkZTX0JMS19BTElHTihmcm9tKTsKPj4+Pj4KPj4+Pj4g
ICAgICAgICBpZiAoZnJlZV9mcm9tID49IG1heF9maWxlX2Jsb2Nrcyhpbm9kZSkpCj4+Pj4+IEBA
IC03NDEsNiArNzQ2LDIxIEBAIGludCBmMmZzX2RvX3RydW5jYXRlX2Jsb2NrcyhzdHJ1Y3QgaW5v
ZGUgKmlub2RlLCB1NjQgZnJvbSwgYm9vbCBsb2NrKQo+Pj4+PiAgICAgICAgICAgICAgICAgZ290
byBvdXQ7Cj4+Pj4+ICAgICAgICAgfQo+Pj4+Pgo+Pj4+PiArICAgICBpZiAoSVNfREVWSUNFX0FM
SUFTSU5HKGlub2RlKSkgewo+Pj4+PiArICAgICAgICAgICAgIHN0cnVjdCBleHRlbnRfdHJlZSAq
ZXQgPSBGMkZTX0koaW5vZGUpLT5leHRlbnRfdHJlZVtFWF9SRUFEXTsKPj4+Pj4gKyAgICAgICAg
ICAgICBzdHJ1Y3QgZXh0ZW50X2luZm8gZWkgPSBldC0+bGFyZ2VzdDsKPj4+Pj4gKyAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgaTsKPj4+Pj4gKwo+Pj4+PiArICAgICAgICAgICAgIGZvciAoaSA9
IDA7IGkgPCBlaS5sZW47IGkrKykKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGYyZnNfaW52
YWxpZGF0ZV9ibG9ja3Moc2JpLCBlaS5ibGsgKyBpKTsKPj4+Pj4gKwo+Pj4+PiArICAgICAgICAg
ICAgIGRlY192YWxpZF9ibG9ja19jb3VudChzYmksIGlub2RlLCBlaS5sZW4pOwo+Pj4+PiArICAg
ICAgICAgICAgIGYyZnNfdXBkYXRlX3RpbWUoc2JpLCBSRVFfVElNRSk7Cj4+Pj4+ICsKPj4+Pj4g
KyAgICAgICAgICAgICBmMmZzX3B1dF9wYWdlKGlwYWdlLCAxKTsKPj4+Pj4gKyAgICAgICAgICAg
ICBnb3RvIG91dDsKPj4+Pj4gKyAgICAgfQo+Pj4+PiArCj4+Pj4+ICAgICAgICAgaWYgKGYyZnNf
aGFzX2lubGluZV9kYXRhKGlub2RlKSkgewo+Pj4+PiAgICAgICAgICAgICAgICAgZjJmc190cnVu
Y2F0ZV9pbmxpbmVfaW5vZGUoaW5vZGUsIGlwYWdlLCBmcm9tKTsKPj4+Pj4gICAgICAgICAgICAg
ICAgIGYyZnNfcHV0X3BhZ2UoaXBhZ2UsIDEpOwo+Pj4+PiBAQCAtNzc2LDcgKzc5Niw3IEBAIGlu
dCBmMmZzX2RvX3RydW5jYXRlX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCB1NjQgZnJvbSwg
Ym9vbCBsb2NrKQo+Pj4+PiAgICAgICAgIC8qIGxhc3RseSB6ZXJvIG91dCB0aGUgZmlyc3QgZGF0
YSBwYWdlICovCj4+Pj4+ICAgICAgICAgaWYgKCFlcnIpCj4+Pj4+ICAgICAgICAgICAgICAgICBl
cnIgPSB0cnVuY2F0ZV9wYXJ0aWFsX2RhdGFfcGFnZShpbm9kZSwgZnJvbSwgdHJ1bmNhdGVfcGFn
ZSk7Cj4+Pj4+IC0KPj4+Pj4gK291dF9lcnI6Cj4+Pj4+ICAgICAgICAgdHJhY2VfZjJmc190cnVu
Y2F0ZV9ibG9ja3NfZXhpdChpbm9kZSwgZXJyKTsKPj4+Pj4gICAgICAgICByZXR1cm4gZXJyOwo+
Pj4+PiAgICAgfQo+Pj4+PiBAQCAtOTk0LDcgKzEwMTQsOCBAQCBpbnQgZjJmc19zZXRhdHRyKHN0
cnVjdCBtbnRfaWRtYXAgKmlkbWFwLCBzdHJ1Y3QgZGVudHJ5ICpkZW50cnksCj4+Pj4+ICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVQRVJNOwo+Pj4+Pgo+Pj4+PiAgICAgICAgIGlmICgoYXR0ci0+
aWFfdmFsaWQgJiBBVFRSX1NJWkUpKSB7Cj4+Pj4+IC0gICAgICAgICAgICAgaWYgKCFmMmZzX2lz
X2NvbXByZXNzX2JhY2tlbmRfcmVhZHkoaW5vZGUpKQo+Pj4+PiArICAgICAgICAgICAgIGlmICgh
ZjJmc19pc19jb21wcmVzc19iYWNrZW5kX3JlYWR5KGlub2RlKSB8fAo+Pj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBJU19ERVZJQ0VfQUxJQVNJTkcoaW5vZGUpKQo+Pj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4+Pj4+ICAgICAgICAgICAg
ICAgICBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0NPTVBSRVNTX1JFTEVBU0VEKSAm
Jgo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAhSVNfQUxJR05FRChhdHRyLT5pYV9zaXpl
LAo+Pj4+PiBAQCAtMTg1NSw3ICsxODc2LDcgQEAgc3RhdGljIGxvbmcgZjJmc19mYWxsb2NhdGUo
c3RydWN0IGZpbGUgKmZpbGUsIGludCBtb2RlLAo+Pj4+PiAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU87Cj4+Pj4+ICAgICAgICAgaWYgKCFmMmZzX2lzX2NoZWNrcG9pbnRfcmVhZHkoRjJGU19J
X1NCKGlub2RlKSkpCj4+Pj4+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT1NQQzsKPj4+Pj4g
LSAgICAgaWYgKCFmMmZzX2lzX2NvbXByZXNzX2JhY2tlbmRfcmVhZHkoaW5vZGUpKQo+Pj4+PiAr
ICAgICBpZiAoIWYyZnNfaXNfY29tcHJlc3NfYmFja2VuZF9yZWFkeShpbm9kZSkgfHwgSVNfREVW
SUNFX0FMSUFTSU5HKGlub2RlKSkKPj4+Pj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU9QTk9U
U1VQUDsKPj4+Pj4KPj4+Pj4gICAgICAgICAvKiBmMmZzIG9ubHkgc3VwcG9ydCAtPmZhbGxvY2F0
ZSBmb3IgcmVndWxhciBmaWxlICovCj4+Pj4+IEBAIC0zMjY0LDYgKzMyODUsOSBAQCBpbnQgZjJm
c19waW5fZmlsZV9jb250cm9sKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJvb2wgaW5jKQo+Pj4+PiAg
ICAgICAgIHN0cnVjdCBmMmZzX2lub2RlX2luZm8gKmZpID0gRjJGU19JKGlub2RlKTsKPj4+Pj4g
ICAgICAgICBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOwo+Pj4+
Pgo+Pj4+PiArICAgICBpZiAoSVNfREVWSUNFX0FMSUFTSU5HKGlub2RlKSkKPj4+Pj4gKyAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+Pj4gKwo+Pj4+PiAgICAgICAgIGlmIChmaS0+aV9n
Y19mYWlsdXJlcyA+PSBzYmktPmdjX3Bpbl9maWxlX3RocmVzaG9sZCkgewo+Pj4+PiAgICAgICAg
ICAgICAgICAgZjJmc193YXJuKHNiaSwgIiVzOiBFbmFibGUgR0MgPSBpbm8gJWx4IGFmdGVyICV4
IEdDIHRyaWFscyIsCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGlu
b2RlLT5pX2lubywgZmktPmlfZ2NfZmFpbHVyZXMpOwo+Pj4+PiBAQCAtMzI5NCw2ICszMzE4LDkg
QEAgc3RhdGljIGludCBmMmZzX2lvY19zZXRfcGluX2ZpbGUoc3RydWN0IGZpbGUgKmZpbHAsIHVu
c2lnbmVkIGxvbmcgYXJnKQo+Pj4+PiAgICAgICAgIGlmIChmMmZzX3JlYWRvbmx5KHNiaS0+c2Ip
KQo+Pj4+PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FUk9GUzsKPj4+Pj4KPj4+Pj4gKyAgICAg
aWYgKCFwaW4gJiYgSVNfREVWSUNFX0FMSUFTSU5HKGlub2RlKSkKPj4+Pj4gKyAgICAgICAgICAg
ICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4+Pj4+ICsKPj4+Pj4gICAgICAgICByZXQgPSBtbnRfd2Fu
dF93cml0ZV9maWxlKGZpbHApOwo+Pj4+PiAgICAgICAgIGlmIChyZXQpCj4+Pj4+ICAgICAgICAg
ICAgICAgICByZXR1cm4gcmV0Owo+Pj4+PiBAQCAtNDcxMSw3ICs0NzM4LDggQEAgc3RhdGljIGlu
dCBmMmZzX3ByZWFsbG9jYXRlX2Jsb2NrcyhzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3Zf
aXRlciAqaXRlciwKPj4+Pj4gICAgICAgICBlbHNlCj4+Pj4+ICAgICAgICAgICAgICAgICByZXR1
cm4gMDsKPj4+Pj4KPj4+Pj4gLSAgICAgbWFwLm1fbWF5X2NyZWF0ZSA9IHRydWU7Cj4+Pj4+ICsg
ICAgIGlmICghSVNfREVWSUNFX0FMSUFTSU5HKGlub2RlKSkKPj4+Pj4gKyAgICAgICAgICAgICBt
YXAubV9tYXlfY3JlYXRlID0gdHJ1ZTsKPj4+Pj4gICAgICAgICBpZiAoZGlvKSB7Cj4+Pj4+ICAg
ICAgICAgICAgICAgICBtYXAubV9zZWdfdHlwZSA9IGYyZnNfcndfaGludF90b19zZWdfdHlwZShz
YmksCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGlub2RlLT5pX3dyaXRlX2hpbnQpOwo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9pbm9kZS5j
IGIvZnMvZjJmcy9pbm9kZS5jCj4+Pj4+IGluZGV4IGFlZjU3MTcyMDE0Zi4uZjExOGU5NTViYTg4
IDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZzL2lub2RlLmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9p
bm9kZS5jCj4+Pj4+IEBAIC0zNjcsNiArMzY3LDEyIEBAIHN0YXRpYyBib29sIHNhbml0eV9jaGVj
a19pbm9kZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgcGFnZSAqbm9kZV9wYWdlKQo+Pj4+
PiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pj4+PiAgICAgICAgIH0KPj4+Pj4KPj4+
Pj4gKyAgICAgaWYgKChmaS0+aV9mbGFncyAmIEYyRlNfREVWSUNFX0FMSUFTX0ZMKSAmJiAhZjJm
c19zYl9oYXNfZGV2aWNlX2FsaWFzKHNiaSkpIHsKPj4+Pj4gKyAgICAgICAgICAgICBmMmZzX3dh
cm4oc2JpLCAiJXM6IGlub2RlIChpbm89JWx4KSBoYXMgZGV2aWNlIGFsaWFzIGZsYWcsIGJ1dCB0
aGUgZmVhdHVyZSBpcyBvZmYiLAo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNf
XywgaW5vZGUtPmlfaW5vKTsKPj4+Pj4gKyAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4+Pj4+
ICsgICAgIH0KPj4+Pgo+Pj4+IERvIHdlIG5lZWQgdG8gZG8gc2FuaXR5IGNoZWNrIGRldmljZV9h
bGlhcyBmZWF0dXJlIGZsYWcgdy8KPj4+PiBzYi5kZXZzW10ucGF0aCBmb3JtYXQ/IGFuZCByZWxh
dGVkIGlub2RlPwo+Pj4KPj4+IFNvcnJ5LCBJIGFtIG5vdCBzdXJlIEkgZ290IHlvdXIgcG9pbnQu
IENvdWxkIHlvdSBlbGFib3JhdGUgaXQgbW9yZT8KPj4KPj4gT2gsIHNvcnJ5LCBJIG1pc3VuZGVy
c3RhbmQgaXQuIGFsaWFzX2ZpbGVuYW1lIHdvbid0IGJlIHN0b3JlZCBpbiBzYi5kZXZzW10ucGF0
aCwKPj4gcGxlYXNlIGlnbm9yZSBpdC4KPj4KPj4gQW5vdGhlciBwb2ludCBpczogd2hhdCBkbyB5
b3UgdGhpbmsgb2YgZG9pbmcgc2FuaXR5IGNoZWNrIG9uIGV4dGVudF9pbmZvIG9mCj4+IGRldmlj
ZV9hbGlhcyBpbm9kZT8KPj4KPj4gd2UgY2FuIGNoZWNrIHdoZXRoZXIgaXRzIGV4dGVudCBwb2lu
dHMgdG8gd2hvbGUgcmVnaW9uIG9mIHRhcmdldCBhbGlhcyBkZXZpY2Ugb3IKPj4gbm90Pwo+IAo+
IENoYW8sIEkgdGhpbmsgd2UgY2FuIGFkZCB0aGlzIGxhdGVyLCBhcyBJJ2QgbGlrZSB0byBxdWV1
ZSB0aGlzIGluIHRoZSBtZXJnZQo+IHdpbmRvdy4gV2R5dD8KClN1cmUuCgpUaGFua3MsCgo+IAo+
Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4+Cj4+Pj4+ICsKPj4+Pj4gICAgICAgICByZXR1cm4gdHJ1
ZTsKPj4+Pj4gICAgIH0KPj4+Pj4KPj4+Pj4gQEAgLTgxOCw4ICs4MjQsNiBAQCB2b2lkIGYyZnNf
ZXZpY3RfaW5vZGUoc3RydWN0IGlub2RlICppbm9kZSkKPj4+Pj4gICAgICAgICBmMmZzX2J1Z19v
bihzYmksIGdldF9kaXJ0eV9wYWdlcyhpbm9kZSkpOwo+Pj4+PiAgICAgICAgIGYyZnNfcmVtb3Zl
X2RpcnR5X2lub2RlKGlub2RlKTsKPj4+Pj4KPj4+Pj4gLSAgICAgZjJmc19kZXN0cm95X2V4dGVu
dF90cmVlKGlub2RlKTsKPj4+Pgo+Pj4+IEZvciBoYXJkbGluayBpbm9kZSwgaXQgbWlzc2VkIHRv
IGNhbGwgZjJmc19kZXN0cm95X2V4dGVudF90cmVlKCk/Cj4+Pgo+Pj4gR290IGl0Lgo+Pj4KPj4+
Pgo+Pj4+IFRoYW5rcywKPj4+Pgo+Pj4+PiAtCj4+Pj4+ICAgICAgICAgaWYgKGlub2RlLT5pX25s
aW5rIHx8IGlzX2JhZF9pbm9kZShpbm9kZSkpCj4+Pj4+ICAgICAgICAgICAgICAgICBnb3RvIG5v
X2RlbGV0ZTsKPj4+Pj4KPj4+Pj4gQEAgLTg3NCw2ICs4NzgsOCBAQCB2b2lkIGYyZnNfZXZpY3Rf
aW5vZGUoc3RydWN0IGlub2RlICppbm9kZSkKPj4+Pj4gICAgICAgICAgICAgICAgIGdvdG8gcmV0
cnk7Cj4+Pj4+ICAgICAgICAgfQo+Pj4+Pgo+Pj4+PiArICAgICBmMmZzX2Rlc3Ryb3lfZXh0ZW50
X3RyZWUoaW5vZGUpOwo+Pj4+PiArCj4+Pj4+ICAgICAgICAgaWYgKGVycikgewo+Pj4+PiAgICAg
ICAgICAgICAgICAgZjJmc191cGRhdGVfaW5vZGVfcGFnZShpbm9kZSk7Cj4+Pj4+ICAgICAgICAg
ICAgICAgICBpZiAoZHF1b3RfaW5pdGlhbGl6ZV9uZWVkZWQoaW5vZGUpKQo+Pj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJmcy9zeXNmcy5jCj4+Pj4+IGluZGV4IGZlZTdl
ZTQ1Y2VhYS4uYmY2NGY0Y2MzNTIyIDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZzL3N5c2ZzLmMK
Pj4+Pj4gKysrIGIvZnMvZjJmcy9zeXNmcy5jCj4+Pj4+IEBAIC0xMjgxLDYgKzEyODEsNyBAQCBG
MkZTX1NCX0ZFQVRVUkVfUk9fQVRUUihzYl9jaGVja3N1bSwgU0JfQ0hLU1VNKTsKPj4+Pj4gICAg
IEYyRlNfU0JfRkVBVFVSRV9ST19BVFRSKGNhc2Vmb2xkLCBDQVNFRk9MRCk7Cj4+Pj4+ICAgICBG
MkZTX1NCX0ZFQVRVUkVfUk9fQVRUUihjb21wcmVzc2lvbiwgQ09NUFJFU1NJT04pOwo+Pj4+PiAg
ICAgRjJGU19TQl9GRUFUVVJFX1JPX0FUVFIocmVhZG9ubHksIFJPKTsKPj4+Pj4gK0YyRlNfU0Jf
RkVBVFVSRV9ST19BVFRSKGRldmljZV9hbGlhcywgREVWSUNFX0FMSUFTKTsKPj4+Pj4KPj4+Pj4g
ICAgIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpmMmZzX3NiX2ZlYXRfYXR0cnNbXSA9IHsKPj4+
Pj4gICAgICAgICBBVFRSX0xJU1Qoc2JfZW5jcnlwdGlvbiksCj4+Pj4+IEBAIC0xMjk3LDYgKzEy
OTgsNyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqZjJmc19zYl9mZWF0X2F0dHJzW10gPSB7
Cj4+Pj4+ICAgICAgICAgQVRUUl9MSVNUKHNiX2Nhc2Vmb2xkKSwKPj4+Pj4gICAgICAgICBBVFRS
X0xJU1Qoc2JfY29tcHJlc3Npb24pLAo+Pj4+PiAgICAgICAgIEFUVFJfTElTVChzYl9yZWFkb25s
eSksCj4+Pj4+ICsgICAgIEFUVFJfTElTVChzYl9kZXZpY2VfYWxpYXMpLAo+Pj4+PiAgICAgICAg
IE5VTEwsCj4+Pj4+ICAgICB9Owo+Pj4+PiAgICAgQVRUUklCVVRFX0dST1VQUyhmMmZzX3NiX2Zl
YXQpOwo+Pj4+Cj4+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
