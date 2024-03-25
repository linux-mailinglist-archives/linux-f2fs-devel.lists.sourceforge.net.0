Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D78C88A5AB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Mar 2024 16:02:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rolqX-0000lZ-9j;
	Mon, 25 Mar 2024 15:02:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rolqT-0000lO-0g
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Mar 2024 15:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EgMCYmFkhuYojEFo2nYez3F6tl2yguGZg3Z/AU6fEKk=; b=kEl+r32v7B8CXDYg8QB4+7aBpG
 oMtACzyZEB415NSDdaSW9pz67+5HA1SpBw6y0eskUdpmBuE8PPg1FFgnp3gLeK7OkIZWLIZWPPQDJ
 mBTLYEsJYQzfjKtyr73rnC3DvQtmoVf+frIQRyxe5yVK8sucbMPX/39VE0THoe1YPJTM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EgMCYmFkhuYojEFo2nYez3F6tl2yguGZg3Z/AU6fEKk=; b=HSqqFv9P9V9rM7nAjmuraSrOlG
 P63PPkXBdbECKWXOkZheVXx77ESgJoKyn8iQeX/YRw1NSQ0sYpTblN9GDA1tFDcEB+OEQeurCAPWs
 RtG6yVV2yAnS06lpydRNv/Bi5wGaJLIgSZ9roZvbAiOh4eV3V1G6zWNzCdCs6eRCIIzA=;
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rolqP-0005Kh-F8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Mar 2024 15:02:41 +0000
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3c3d70191c7so4067b6e.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Mar 2024 08:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711378952; x=1711983752; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EgMCYmFkhuYojEFo2nYez3F6tl2yguGZg3Z/AU6fEKk=;
 b=Xl1dP7cYqZrCiEVqPVPgIvIk9LB75woEDgYeo/0Ymv2Y5x1xaMsreGbLP5xFVlkHDe
 40U9q7pwcqAMEjZK4XKWwbQfOU5qT7SSTehNnyI3o717kRTu2Zm1b2Tqlq7bx9Lqe3qf
 YQKulIFbukRNC6PPABReD+atmB8SNViHdNYSVsgegEUbjoQJVVTxbK6M38eM7y5wZVm1
 dL9PQkWI6EqP1/gDXy8iL4t0FjA+sOvFqAIaBc1RzjmaEjm6c9U3vGLdJK72z52BL4Rc
 xAr6Cb8rOizrEWk6taPirLiUS0dNuNUl93q1pq4RTVBWkZuV2ThTEQvZP5Y+VSlRWPud
 nKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711378952; x=1711983752;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EgMCYmFkhuYojEFo2nYez3F6tl2yguGZg3Z/AU6fEKk=;
 b=ccDpaeluDliwSusBQfpqp9m18kCjUMA4uflX6N4xn2MIQJDfqgLARqb4oEnRs5o830
 seKc4FqzC92TlzFCRHVKc8V1q8AMCKEAq0dJx8CQHzTB6vvkGq12mb18OfJDNkaDcSOu
 GTcZlKT65WyFYZ0bi54NLuIV64CPI87kJuWzlPBQfQ8cGbNJ6Mro4tX5ruwQ4SNZWmSv
 nvWIp9tas+Ow86xpG22ZMl0PGRFnnQQ2v64KYGOhio49Xmd/iudYMKSyzyNHn/Gg4VOZ
 DgT7FnfcLRtDSVdJC7hfmFd77WDxJ5PRPZR5qNzpem5h0L3FdpvXevkti+UbEz9AU/XR
 IWhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqr9GT3UkFrNFAWYuFNonnlj8HzwQNAWd3ODDjXZz20ELwerO+RqP36wmuOYGnmu7uneER3pM2afOISOeTgPjmoRg5sR9mRx1ODUS+g61LdcScL5YpSA==
X-Gm-Message-State: AOJu0YzXjKFVrbtIJlcwvu4CampcaxBEj0zvrr7TaIlMIT9TwhiLzZjL
 YLJ06siRwhpbAmimKIqM5aT3bmJk0gkx7JCYjCrbZ5PdFYEeAn+tt0ty3mzI1BrrZna44013JrZ
 +Kkn+hZxInTIAgBidTVAU83GGhbU=
X-Google-Smtp-Source: AGHT+IGT6JFd3y6nczDx1HWbAuLSB1jl1UG8yZKH2UDyA5uhVX3x/+pDzUYAA/NbQ37tzmuOkb/qonUNG5NguhwbF24=
X-Received: by 2002:a05:6808:ec8:b0:3c2:39d1:f111 with SMTP id
 q8-20020a0568080ec800b003c239d1f111mr56649oiv.48.1711378952070; Mon, 25 Mar
 2024 08:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240319212316.4193790-1-daeho43@gmail.com>
 <712f380c-68ef-4743-bd9b-7342e838ced7@kernel.org>
 <CACOAw_yAWGbx2Bx2or1OyVUUw6HSgTd=fo3e151d1JHU+Op5qQ@mail.gmail.com>
 <c1fd6c09-0083-439b-a81d-0d2f39cb10d4@kernel.org>
In-Reply-To: <c1fd6c09-0083-439b-a81d-0d2f39cb10d4@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 25 Mar 2024 08:02:21 -0700
Message-ID: <CACOAw_xejyoA9f2x9J0Z-MgbmrHAPYeAmpz8Lf1GfLDs-yHh5w@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Mar 22, 2024 at 9:26 PM Chao Yu wrote: > > On 2024/3/21
    1:42, Daeho Jeong wrote: > > On Wed, Mar 20, 2024 at 2:38 AM Chao Yu wrote:
    > >> > >> On 2024/3/20 5:23, Daeho Jeong wrote: > >> [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1rolqP-0005Kh-F8
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: prevent writing without fallocate()
 for pinned files
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBNYXIgMjIsIDIwMjQgYXQgOToyNuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzMvMjEgMTo0MiwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBP
biBXZWQsIE1hciAyMCwgMjAyNCBhdCAyOjM44oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Pgo+ID4+IE9uIDIwMjQvMy8yMCA1OjIzLCBEYWVobyBKZW9uZyB3cm90ZToK
PiA+Pj4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+Pj4KPiA+
Pj4gSW4gYSBjYXNlIHdyaXRpbmcgd2l0aG91dCBmYWxsb2NhdGUoKSwgd2UgY2FuJ3QgZ3VhcmFu
dGVlIGl0J3MgYWxsb2NhdGVkCj4gPj4+IGluIHRoZSBjb252ZW50aW9uYWwgYXJlYSBmb3Igem9u
ZWQgc3Ryb2FnZS4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhv
amVvbmdAZ29vZ2xlLmNvbT4KPiA+Pj4gLS0tCj4gPj4+IHYyOiBjb3ZlcmVkIHRoZSBkaXJlY3Qg
aW8gY2FzZQo+ID4+PiB2MzogY292ZXJlZCB0aGUgbWt3cml0ZSBjYXNlCj4gPj4+IC0tLQo+ID4+
PiAgICBmcy9mMmZzL2RhdGEuYyB8IDE0ICsrKysrKysrKysrKy0tCj4gPj4+ICAgIGZzL2YyZnMv
ZmlsZS5jIHwgMTYgKysrKysrKystLS0tLS0tLQo+ID4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDIw
IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+ID4+PiBpbmRleCBjMjFiOTJmMTg0NjMu
LmQzZTVhYjI3MzZhNiAxMDA2NDQKPiA+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiA+Pj4gKysr
IGIvZnMvZjJmcy9kYXRhLmMKPiA+Pj4gQEAgLTE1ODQsOCArMTU4NCwxMSBAQCBpbnQgZjJmc19t
YXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmMmZzX21hcF9ibG9ja3MgKm1h
cCwgaW50IGZsYWcpCj4gPj4+Cj4gPj4+ICAgICAgICAvKiB1c2Ugb3V0LXBsYWNlLXVwZGF0ZSBm
b3IgZGlyZWN0IElPIHVuZGVyIExGUyBtb2RlICovCj4gPj4+ICAgICAgICBpZiAobWFwLT5tX21h
eV9jcmVhdGUgJiYKPiA+Pj4gLSAgICAgICAgIChpc19ob2xlIHx8IChmMmZzX2xmc19tb2RlKHNi
aSkgJiYgZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19ESU8pKSkgewo+ID4+PiAtICAgICAgICAgICAg
IGlmICh1bmxpa2VseShmMmZzX2NwX2Vycm9yKHNiaSkpKSB7Cj4gPj4+ICsgICAgICAgICAoaXNf
aG9sZSB8fCAoZjJmc19sZnNfbW9kZShzYmkpICYmIGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfRElP
ICYmCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIWYyZnNfaXNfcGlubmVkX2ZpbGUoaW5v
ZGUpKSkpIHsKPiA+Pj4gKyAgICAgICAgICAgICBpZiAodW5saWtlbHkoZjJmc19jcF9lcnJvcihz
YmkpKSB8fAo+ID4+PiArICAgICAgICAgICAgICAgICAoZjJmc19pc19waW5uZWRfZmlsZShpbm9k
ZSkgJiYgaXNfaG9sZSAmJgo+ID4+PiArICAgICAgICAgICAgICAgICAgZmxhZyAhPSBGMkZTX0dF
VF9CTE9DS19QUkVfRElPKSkgewo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IC1F
SU87Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgZ290byBzeW5jX291dDsKPiA+Pj4gICAg
ICAgICAgICAgICAgfQo+ID4+PiBAQCAtMzM3OCw2ICszMzgxLDggQEAgc3RhdGljIGludCBwcmVw
YXJlX3dyaXRlX2JlZ2luKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+Pj4gICAgICAgICAg
ICAgICAgZjJmc19tYXBfbG9jayhzYmksIGZsYWcpOwo+ID4+PiAgICAgICAgICAgICAgICBsb2Nr
ZWQgPSB0cnVlOwo+ID4+PiAgICAgICAgfSBlbHNlIGlmICgocG9zICYgUEFHRV9NQVNLKSA+PSBp
X3NpemVfcmVhZChpbm9kZSkpIHsKPiA+Pj4gKyAgICAgICAgICAgICBpZiAoZjJmc19pc19waW5u
ZWRfZmlsZShpbm9kZSkpCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTzsK
PiA+Pj4gICAgICAgICAgICAgICAgZjJmc19tYXBfbG9jayhzYmksIGZsYWcpOwo+ID4+PiAgICAg
ICAgICAgICAgICBsb2NrZWQgPSB0cnVlOwo+ID4+PiAgICAgICAgfQo+ID4+PiBAQCAtMzQwNyw2
ICszNDEyLDExIEBAIHN0YXRpYyBpbnQgcHJlcGFyZV93cml0ZV9iZWdpbihzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksCj4gPj4+Cj4gPj4+ICAgICAgICBpZiAoIWYyZnNfbG9va3VwX3JlYWRfZXh0
ZW50X2NhY2hlX2Jsb2NrKGlub2RlLCBpbmRleCwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJmRuLmRhdGFfYmxrYWRkcikpIHsKPiA+Pj4gKyAg
ICAgICAgICAgICBpZiAoZjJmc19pc19waW5uZWRfZmlsZShpbm9kZSkpIHsKPiA+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgIGVyciA9IC1FSU87Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICBn
b3RvIG91dDsKPiA+Pj4gKyAgICAgICAgICAgICB9Cj4gPj4+ICsKPiA+Pj4gICAgICAgICAgICAg
ICAgaWYgKGxvY2tlZCkgewo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IGYyZnNf
cmVzZXJ2ZV9ibG9jaygmZG4sIGluZGV4KTsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICBn
b3RvIG91dDsKPiA+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxl
LmMKPiA+Pj4gaW5kZXggODIyNzdlOTVjODhmLi40ZGIzYjIxYzgwNGIgMTAwNjQ0Cj4gPj4+IC0t
LSBhL2ZzL2YyZnMvZmlsZS5jCj4gPj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4gPj4+IEBAIC01
Nyw3ICs1Nyw3IEBAIHN0YXRpYyB2bV9mYXVsdF90IGYyZnNfdm1fcGFnZV9ta3dyaXRlKHN0cnVj
dCB2bV9mYXVsdCAqdm1mKQo+ID4+PiAgICAgICAgc3RydWN0IGlub2RlICppbm9kZSA9IGZpbGVf
aW5vZGUodm1mLT52bWEtPnZtX2ZpbGUpOwo+ID4+PiAgICAgICAgc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpID0gRjJGU19JX1NCKGlub2RlKTsKPiA+Pj4gICAgICAgIHN0cnVjdCBkbm9kZV9vZl9k
YXRhIGRuOwo+ID4+PiAtICAgICBib29sIG5lZWRfYWxsb2MgPSB0cnVlOwo+ID4+PiArICAgICBi
b29sIG5lZWRfYWxsb2MgPSAhZjJmc19pc19waW5uZWRfZmlsZShpbm9kZSk7Cj4gPj4KPiA+PiBX
aWxsIHRoaXMgY2hlY2sgcmFjZXMgdy8gcGluZmlsZSBnZXR8c2V0Pwo+ID4KPiA+IERvIHlvdSBt
ZWFuICJzZXQvY2xlYXIiIGNhc2U/IEkgYmVsaWV2ZSAic2V0IiBjYXNlIGlzIG9rYXksIHNpbmNl
IHdlCj4KPiBZdXAsCj4KPiA+IGNhbid0IHNldCBpZiB0aGUgaW5vZGUgYWxyZWFkeSBoYXMgYSBk
YXRhIGJsb2NrLiBGb3IgImNsZWFyIiBjYXNlLCBJCj4KPiBIb3dldmVyLCB3ZSBjYW4gc2V0IHBp
bmZpbGUgb24gd3JpdHRlbiBpbm9kZSBpbiByZWd1bGFyIGJsb2NrIGRldmljZToKCllvdSdyZSBy
aWdodC4gSSBtaXNzZWQgaXQuIE1heWJlIEkgdGhpbmsgd2Ugc2hvdWxkIGtlZXAgdGhlIGNvbmNl
cHQKY29uc2lzdGVudCBhY3Jvc3MgZGV2aWNlcyByZWdhcmRsZXNzIG9mIHpvbmVkIHN0b3JhZ2Ug
c3VwcG9ydC4gSG93CmFib3V0IHByZXZlbnRpbmcgZmlsZSBwaW5uaW5nIGZvciBhbHJlYWR5IHdy
aXR0ZW4gaW5vZGVzIGFjcm9zcyBhbGwKZGV2aWNlIHR5cGVzPyBJIGFtIGNoYW5naW5nIHRoZSBw
aW5maWxlIGNvbmNlcHQgYnkgYWxsb3dpbmcgdGhlIHVzZXJzCnRvIHdyaXRlIG9uIG9ubHkgZmFs
bG9jYXRlKCktZWQgc3BhY2UuCgo+Cj4gICAgICAgICBpZiAoZjJmc19zYl9oYXNfYmxrem9uZWQo
c2JpKSAmJiBGMkZTX0hBU19CTE9DS1MoaW5vZGUpKSB7Cj4gICAgICAgICAgICAgICAgIHJldCA9
IC1FRkJJRzsKPiAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gICAgICAgICB9Cj4KPiBTaG91
bGQgd2UgYWRkIHRoZSBsb2dpYyBvbmx5IGlmIGJsa3pvbmVkIGZldHVyZSBpcyBlbmFibGVkPwo+
Cj4gPiBiZWxpZXZlIG1rd3JpdGUgZmFpbHVyZSBpcyBva2F5IGluIHJhY3kgY29uZGl0aW9ucyBj
YXVzZWQgYnkgY2xlYXJpbmcKPiA+IHRoZSBwaW4gZmxhZy4gV2hhdCBkbyB5b3UgdGhpbms/Cj4K
PiBPciB3ZSBjYW4gdXNlIGZpbGVtYXBfaW52YWxpZGF0ZV9sb2NrKCkgaW4gZjJmc19pb2Nfc2V0
X3Bpbl9maWxlKCkgdG8KPiBhdm9pZCB0aGUgcmFjZSBjb25kaXRpb24/Cj4KPiBUaGFua3MsCj4K
PiA+Cj4gPj4KPiA+PiBUaGFua3MsCj4gPj4KPiA+Pj4gICAgICAgIGludCBlcnIgPSAwOwo+ID4+
PiAgICAgICAgdm1fZmF1bHRfdCByZXQ7Cj4gPj4+Cj4gPj4+IEBAIC0xMTQsMTkgKzExNCwxNSBA
QCBzdGF0aWMgdm1fZmF1bHRfdCBmMmZzX3ZtX3BhZ2VfbWt3cml0ZShzdHJ1Y3Qgdm1fZmF1bHQg
KnZtZikKPiA+Pj4gICAgICAgICAgICAgICAgZ290byBvdXRfc2VtOwo+ID4+PiAgICAgICAgfQo+
ID4+Pgo+ID4+PiArICAgICBzZXRfbmV3X2Rub2RlKCZkbiwgaW5vZGUsIE5VTEwsIE5VTEwsIDAp
Owo+ID4+PiAgICAgICAgaWYgKG5lZWRfYWxsb2MpIHsKPiA+Pj4gICAgICAgICAgICAgICAgLyog
YmxvY2sgYWxsb2NhdGlvbiAqLwo+ID4+PiAtICAgICAgICAgICAgIHNldF9uZXdfZG5vZGUoJmRu
LCBpbm9kZSwgTlVMTCwgTlVMTCwgMCk7Cj4gPj4+ICAgICAgICAgICAgICAgIGVyciA9IGYyZnNf
Z2V0X2Jsb2NrX2xvY2tlZCgmZG4sIHBhZ2UtPmluZGV4KTsKPiA+Pj4gLSAgICAgfQo+ID4+PiAt
Cj4gPj4+IC0jaWZkZWYgQ09ORklHX0YyRlNfRlNfQ09NUFJFU1NJT04KPiA+Pj4gLSAgICAgaWYg
KCFuZWVkX2FsbG9jKSB7Cj4gPj4+IC0gICAgICAgICAgICAgc2V0X25ld19kbm9kZSgmZG4sIGlu
b2RlLCBOVUxMLCBOVUxMLCAwKTsKPiA+Pj4gKyAgICAgfSBlbHNlIHsKPiA+Pj4gICAgICAgICAg
ICAgICAgZXJyID0gZjJmc19nZXRfZG5vZGVfb2ZfZGF0YSgmZG4sIHBhZ2UtPmluZGV4LCBMT09L
VVBfTk9ERSk7Cj4gPj4+ICAgICAgICAgICAgICAgIGYyZnNfcHV0X2Rub2RlKCZkbik7Cj4gPj4+
ICAgICAgICB9Cj4gPj4+IC0jZW5kaWYKPiA+Pj4gKwo+ID4+PiAgICAgICAgaWYgKGVycikgewo+
ID4+PiAgICAgICAgICAgICAgICB1bmxvY2tfcGFnZShwYWdlKTsKPiA+Pj4gICAgICAgICAgICAg
ICAgZ290byBvdXRfc2VtOwo+ID4+PiBAQCAtNDYxMSw2ICs0NjA3LDEwIEBAIHN0YXRpYyBpbnQg
ZjJmc19wcmVhbGxvY2F0ZV9ibG9ja3Moc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0
ZXIgKml0ZXIsCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+Pj4g
ICAgICAgIH0KPiA+Pj4KPiA+Pj4gKyAgICAgLyogRm9yIHBpbm5lZCBmaWxlcywgaXQgc2hvdWxk
IGJlIGZhbGxvY2F0ZSgpLWVkIGluIGFkdmFuY2UuICovCj4gPj4+ICsgICAgIGlmIChmMmZzX2lz
X3Bpbm5lZF9maWxlKGlub2RlKSkKPiA+Pj4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+Pj4g
Kwo+ID4+PiAgICAgICAgLyogRG8gbm90IHByZWFsbG9jYXRlIGJsb2NrcyB0aGF0IHdpbGwgYmUg
d3JpdHRlbiBwYXJ0aWFsbHkgaW4gNEtCLiAqLwo+ID4+PiAgICAgICAgbWFwLm1fbGJsayA9IEYy
RlNfQkxLX0FMSUdOKHBvcyk7Cj4gPj4+ICAgICAgICBtYXAubV9sZW4gPSBGMkZTX0JZVEVTX1RP
X0JMSyhwb3MgKyBjb3VudCk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
