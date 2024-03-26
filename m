Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DBE88CB0B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Mar 2024 18:35:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rpAhX-0006F2-00;
	Tue, 26 Mar 2024 17:35:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rpAhV-0006Et-Vq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 17:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bQ35C+kL3axh6L7EwSqgU9ptD4Ff3HJAuCiRN7ziw38=; b=f+S9gkqHk6ebKh9BjZXQsPQP6/
 JrVU4XcqTc+hg9kfcmWgMnstIWMkOZztsPSB67rSrR5bUBf0aNrHbTmv7T+K9z3LzGeg0I6ORWYOm
 fpIapYy9nAUP/LmOvoCyhDzzUWlnN1EPHpoh74W5kGwtgZV/M8y5m1cndC9ZI24RsRkM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bQ35C+kL3axh6L7EwSqgU9ptD4Ff3HJAuCiRN7ziw38=; b=nPCXgs9AhKfvXrs2QZFG9YTop3
 zvu42zGPfxndyGF5T0WnyOOxqeOslFf26y4L1oyX5UIK/QxqDAorEhxK6F9KWKuMwh0gC/eKdFr/f
 6brvh6Y7yfGltsqFBFe4cUP5VbQ/LhYZgYftB4cT/l7d0Gcp0fc6062OVTVLgwxO+nwc=;
Received: from mail-vk1-f176.google.com ([209.85.221.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rpAhV-00048c-8D for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 17:35:06 +0000
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-4d44216ea59so1975097e0c.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Mar 2024 10:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711474494; x=1712079294; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bQ35C+kL3axh6L7EwSqgU9ptD4Ff3HJAuCiRN7ziw38=;
 b=VpNRluBMMn9SeynKyVIAD/ay2y2iKOKGPeWZ7qr1qVJd+TkOlQheALXPofX6R0EzCK
 +jc6RoSmXN8tlQBCu9VRWOHfWfbTianlfuvbmYzwil+kHX0I0zWBXHyOr2nHyuNFDsvO
 xEC+WbG9g61m/0Ce3DhFnfq9AQpRb4kiWYMMq/OZaqkfwB/p/VBYW8evykp69A3iNXNS
 xlSSi89AW6zmS5xMTuMZ+Ug+wpbIS2S9CKaNJB9NjC4rw9k2Tn0l+1iwjM+Wpsd5RaVC
 C11RccwKnOJj1aEiCdt/HYmtn57uRdE+wmsl2k50deZvggUYlUQ4ZoXLNYi091ICMcTG
 Xo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711474494; x=1712079294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bQ35C+kL3axh6L7EwSqgU9ptD4Ff3HJAuCiRN7ziw38=;
 b=W1lb1WdH1gvkxczJoAK2/OZx85uJUgTFlpLJvNhnt+vYqE/XRLPUQkhGRBcEcaKrNR
 R7Ea+aiQVuIPE9FFkoz+eeEKvRI+Yw9YY7CSMR3+x8mjHVZHkr528t3vZi8UReywActJ
 Giuf8196//xeQKodCubONDM9EToGNqhBEBWDVpHOJpWC25TqKNCHGpIIPHLjSnITs6po
 gk6MY4u5XlMLajzlQQE+Yef3cEWYY1BNCdSJRIvJEGkUHgkf510hmojfDHi/aBVoAv05
 wcmmJL8kmpfxUGGWfy/ZMhzE+YrdELHXlxqopv+EVKZFwHlYOCuFcGxIUcqlQk+Aod6f
 z5CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiq/97cMCH3EDXN7PnETlXuQilA5Lfy+q4u7G0g5SAUpp5DKOXL5de8k9vTuk5rYUqQZl+CIHI/SVLYF8b/1aQFmTYXD6vqrPGadpydWWSo6Jx+fsGFA==
X-Gm-Message-State: AOJu0Yyf/eO2+8qWRZVzjN7HvnvurPkqBENbvuPEn0KuC07sDfPuxdNf
 g/HkTzMMeaNFULsxk8ItXqEGNgqc4fWOwfp+WV3dzVjEETpWkutFTllKxXkWIjXbcwlv90nZCVN
 q6wkw4gHv2Zi8cBMssU2L+jNrKOrGLSI/
X-Google-Smtp-Source: AGHT+IExCzWf5fCgMlqv7sQc5JEBTKzoCjYEl5Gxdi9K/wPbqPt23T5REnExk5HjeMHU/LH+WDUj5Nf+IsYJ9YV2qvo=
X-Received: by 2002:a05:6122:1d02:b0:4d8:79c1:2a21 with SMTP id
 gc2-20020a0561221d0200b004d879c12a21mr9063727vkb.7.1711474494503; Tue, 26 Mar
 2024 10:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240319212316.4193790-1-daeho43@gmail.com>
 <712f380c-68ef-4743-bd9b-7342e838ced7@kernel.org>
 <CACOAw_yAWGbx2Bx2or1OyVUUw6HSgTd=fo3e151d1JHU+Op5qQ@mail.gmail.com>
 <c1fd6c09-0083-439b-a81d-0d2f39cb10d4@kernel.org>
 <CACOAw_xejyoA9f2x9J0Z-MgbmrHAPYeAmpz8Lf1GfLDs-yHh5w@mail.gmail.com>
 <30419139-6fdd-48df-b32a-9db7575cebb8@kernel.org>
In-Reply-To: <30419139-6fdd-48df-b32a-9db7575cebb8@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 26 Mar 2024 10:34:43 -0700
Message-ID: <CACOAw_ypTqWMPac=5vr+LFamYmS4uegiJfeNvRG_h_yBnfJCLQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Mar 25, 2024 at 8:39 PM Chao Yu wrote: > > On 2024/3/25
    23:02, Daeho Jeong wrote: > > On Fri, Mar 22, 2024 at 9:26 PM Chao Yu wrote:
    > >> > >> On 2024/3/21 1:42, Daeho Jeong wrote: > > [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.176 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1rpAhV-00048c-8D
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

T24gTW9uLCBNYXIgMjUsIDIwMjQgYXQgODozOeKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzMvMjUgMjM6MDIsIERhZWhvIEplb25nIHdyb3RlOgo+ID4g
T24gRnJpLCBNYXIgMjIsIDIwMjQgYXQgOToyNuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAyMDI0LzMvMjEgMTo0MiwgRGFlaG8gSmVvbmcgd3JvdGU6
Cj4gPj4+IE9uIFdlZCwgTWFyIDIwLCAyMDI0IGF0IDI6MzjigK9BTSBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IE9uIDIwMjQvMy8yMCA1OjIzLCBEYWVobyBK
ZW9uZyB3cm90ZToKPiA+Pj4+PiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUu
Y29tPgo+ID4+Pj4+Cj4gPj4+Pj4gSW4gYSBjYXNlIHdyaXRpbmcgd2l0aG91dCBmYWxsb2NhdGUo
KSwgd2UgY2FuJ3QgZ3VhcmFudGVlIGl0J3MgYWxsb2NhdGVkCj4gPj4+Pj4gaW4gdGhlIGNvbnZl
bnRpb25hbCBhcmVhIGZvciB6b25lZCBzdHJvYWdlLgo+ID4+Pj4+Cj4gPj4+Pj4gU2lnbmVkLW9m
Zi1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+Pj4+PiAtLS0KPiA+
Pj4+PiB2MjogY292ZXJlZCB0aGUgZGlyZWN0IGlvIGNhc2UKPiA+Pj4+PiB2MzogY292ZXJlZCB0
aGUgbWt3cml0ZSBjYXNlCj4gPj4+Pj4gLS0tCj4gPj4+Pj4gICAgIGZzL2YyZnMvZGF0YS5jIHwg
MTQgKysrKysrKysrKysrLS0KPiA+Pj4+PiAgICAgZnMvZjJmcy9maWxlLmMgfCAxNiArKysrKysr
Ky0tLS0tLS0tCj4gPj4+Pj4gICAgIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pCj4gPj4+Pj4KPiA+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRh
LmMgYi9mcy9mMmZzL2RhdGEuYwo+ID4+Pj4+IGluZGV4IGMyMWI5MmYxODQ2My4uZDNlNWFiMjcz
NmE2IDEwMDY0NAo+ID4+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gPj4+Pj4gKysrIGIvZnMv
ZjJmcy9kYXRhLmMKPiA+Pj4+PiBAQCAtMTU4NCw4ICsxNTg0LDExIEBAIGludCBmMmZzX21hcF9i
bG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLCBp
bnQgZmxhZykKPiA+Pj4+Pgo+ID4+Pj4+ICAgICAgICAgLyogdXNlIG91dC1wbGFjZS11cGRhdGUg
Zm9yIGRpcmVjdCBJTyB1bmRlciBMRlMgbW9kZSAqLwo+ID4+Pj4+ICAgICAgICAgaWYgKG1hcC0+
bV9tYXlfY3JlYXRlICYmCj4gPj4+Pj4gLSAgICAgICAgIChpc19ob2xlIHx8IChmMmZzX2xmc19t
b2RlKHNiaSkgJiYgZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19ESU8pKSkgewo+ID4+Pj4+IC0gICAg
ICAgICAgICAgaWYgKHVubGlrZWx5KGYyZnNfY3BfZXJyb3Ioc2JpKSkpIHsKPiA+Pj4+PiArICAg
ICAgICAgKGlzX2hvbGUgfHwgKGYyZnNfbGZzX21vZGUoc2JpKSAmJiBmbGFnID09IEYyRlNfR0VU
X0JMT0NLX0RJTyAmJgo+ID4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIWYyZnNfaXNfcGlu
bmVkX2ZpbGUoaW5vZGUpKSkpIHsKPiA+Pj4+PiArICAgICAgICAgICAgIGlmICh1bmxpa2VseShm
MmZzX2NwX2Vycm9yKHNiaSkpIHx8Cj4gPj4+Pj4gKyAgICAgICAgICAgICAgICAgKGYyZnNfaXNf
cGlubmVkX2ZpbGUoaW5vZGUpICYmIGlzX2hvbGUgJiYKPiA+Pj4+PiArICAgICAgICAgICAgICAg
ICAgZmxhZyAhPSBGMkZTX0dFVF9CTE9DS19QUkVfRElPKSkgewo+ID4+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGVyciA9IC1FSU87Cj4gPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
Z290byBzeW5jX291dDsKPiA+Pj4+PiAgICAgICAgICAgICAgICAgfQo+ID4+Pj4+IEBAIC0zMzc4
LDYgKzMzODEsOCBAQCBzdGF0aWMgaW50IHByZXBhcmVfd3JpdGVfYmVnaW4oc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpLAo+ID4+Pj4+ICAgICAgICAgICAgICAgICBmMmZzX21hcF9sb2NrKHNiaSwg
ZmxhZyk7Cj4gPj4+Pj4gICAgICAgICAgICAgICAgIGxvY2tlZCA9IHRydWU7Cj4gPj4+Pj4gICAg
ICAgICB9IGVsc2UgaWYgKChwb3MgJiBQQUdFX01BU0spID49IGlfc2l6ZV9yZWFkKGlub2RlKSkg
ewo+ID4+Pj4+ICsgICAgICAgICAgICAgaWYgKGYyZnNfaXNfcGlubmVkX2ZpbGUoaW5vZGUpKQo+
ID4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKPiA+Pj4+PiAgICAgICAg
ICAgICAgICAgZjJmc19tYXBfbG9jayhzYmksIGZsYWcpOwo+ID4+Pj4+ICAgICAgICAgICAgICAg
ICBsb2NrZWQgPSB0cnVlOwo+ID4+Pj4+ICAgICAgICAgfQo+ID4+Pj4+IEBAIC0zNDA3LDYgKzM0
MTIsMTEgQEAgc3RhdGljIGludCBwcmVwYXJlX3dyaXRlX2JlZ2luKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwKPiA+Pj4+Pgo+ID4+Pj4+ICAgICAgICAgaWYgKCFmMmZzX2xvb2t1cF9yZWFkX2V4
dGVudF9jYWNoZV9ibG9jayhpbm9kZSwgaW5kZXgsCj4gPj4+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkbi5kYXRhX2Jsa2FkZHIpKSB7Cj4gPj4+
Pj4gKyAgICAgICAgICAgICBpZiAoZjJmc19pc19waW5uZWRfZmlsZShpbm9kZSkpIHsKPiA+Pj4+
PiArICAgICAgICAgICAgICAgICAgICAgZXJyID0gLUVJTzsKPiA+Pj4+PiArICAgICAgICAgICAg
ICAgICAgICAgZ290byBvdXQ7Cj4gPj4+Pj4gKyAgICAgICAgICAgICB9Cj4gPj4+Pj4gKwo+ID4+
Pj4+ICAgICAgICAgICAgICAgICBpZiAobG9ja2VkKSB7Cj4gPj4+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgZXJyID0gZjJmc19yZXNlcnZlX2Jsb2NrKCZkbiwgaW5kZXgpOwo+ID4+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4+Pj4+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gPj4+Pj4gaW5kZXggODIyNzdlOTVjODhmLi40
ZGIzYjIxYzgwNGIgMTAwNjQ0Cj4gPj4+Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPiA+Pj4+PiAr
KysgYi9mcy9mMmZzL2ZpbGUuYwo+ID4+Pj4+IEBAIC01Nyw3ICs1Nyw3IEBAIHN0YXRpYyB2bV9m
YXVsdF90IGYyZnNfdm1fcGFnZV9ta3dyaXRlKHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+ID4+Pj4+
ICAgICAgICAgc3RydWN0IGlub2RlICppbm9kZSA9IGZpbGVfaW5vZGUodm1mLT52bWEtPnZtX2Zp
bGUpOwo+ID4+Pj4+ICAgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJGU19JX1NC
KGlub2RlKTsKPiA+Pj4+PiAgICAgICAgIHN0cnVjdCBkbm9kZV9vZl9kYXRhIGRuOwo+ID4+Pj4+
IC0gICAgIGJvb2wgbmVlZF9hbGxvYyA9IHRydWU7Cj4gPj4+Pj4gKyAgICAgYm9vbCBuZWVkX2Fs
bG9jID0gIWYyZnNfaXNfcGlubmVkX2ZpbGUoaW5vZGUpOwo+ID4+Pj4KPiA+Pj4+IFdpbGwgdGhp
cyBjaGVjayByYWNlcyB3LyBwaW5maWxlIGdldHxzZXQ/Cj4gPj4+Cj4gPj4+IERvIHlvdSBtZWFu
ICJzZXQvY2xlYXIiIGNhc2U/IEkgYmVsaWV2ZSAic2V0IiBjYXNlIGlzIG9rYXksIHNpbmNlIHdl
Cj4gPj4KPiA+PiBZdXAsCj4gPj4KPiA+Pj4gY2FuJ3Qgc2V0IGlmIHRoZSBpbm9kZSBhbHJlYWR5
IGhhcyBhIGRhdGEgYmxvY2suIEZvciAiY2xlYXIiIGNhc2UsIEkKPiA+Pgo+ID4+IEhvd2V2ZXIs
IHdlIGNhbiBzZXQgcGluZmlsZSBvbiB3cml0dGVuIGlub2RlIGluIHJlZ3VsYXIgYmxvY2sgZGV2
aWNlOgo+ID4KPiA+IFlvdSdyZSByaWdodC4gSSBtaXNzZWQgaXQuIE1heWJlIEkgdGhpbmsgd2Ug
c2hvdWxkIGtlZXAgdGhlIGNvbmNlcHQKPiA+IGNvbnNpc3RlbnQgYWNyb3NzIGRldmljZXMgcmVn
YXJkbGVzcyBvZiB6b25lZCBzdG9yYWdlIHN1cHBvcnQuIEhvdwo+ID4gYWJvdXQgcHJldmVudGlu
ZyBmaWxlIHBpbm5pbmcgZm9yIGFscmVhZHkgd3JpdHRlbiBpbm9kZXMgYWNyb3NzIGFsbAo+ID4g
ZGV2aWNlIHR5cGVzPyBJIGFtIGNoYW5naW5nIHRoZSBwaW5maWxlIGNvbmNlcHQgYnkgYWxsb3dp
bmcgdGhlIHVzZXJzCj4KPiBJJ20gb2theSB3aXRoIHRoYXQsIG9yIHdlIGNhbiB0cmllcyB0byBt
aWdyYXRlIGRhdGEgYmxvY2sgb2YgdGFyZ2V0IGZpbGUKPiBmcm9tIHNlcS16b25lIHRvIGNvbnYt
em9uZSBvciByZWd1bGFyLWRldmljZSBiZWZvcmUgc2V0dGluZyBpdCB3LyBwaW4gZmxhZy4uLgoK
SSBjYW4ndCBzZWUgbG90cyBvZiBiZW5lZml0cyBieSBzdXBwb3J0aW5nIGZpbGUgcGlubmluZyBm
b3IKcHJlLXdyaXR0ZW4gaW5vZGVzLCB3aGlsZSB0aGUgZGVzaWduIGNhbiBiZWNvbWUgY29tcGxp
Y2F0ZWQuIFNpbmNlIHdlCmNvbnNvbGlkYXRlIHRoZSB3YXkgdG8gc3VwcG9ydCBmaWxlIHBpbm5p
bmcgYXMgZmFsbG9jYXRlKCkgYmVmb3JlCnVzaW5nIGl0LCB3ZSBtaWdodCBhcyB3ZWxsIG5vdCBz
dXBwb3J0IHByZS13cml0dGVuIGlub2Rlcy4KCj4KPiBUaGFua3MsCj4KPiA+IHRvIHdyaXRlIG9u
IG9ubHkgZmFsbG9jYXRlKCktZWQgc3BhY2UuCj4gPgo+ID4+Cj4gPj4gICAgICAgICAgaWYgKGYy
ZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkgJiYgRjJGU19IQVNfQkxPQ0tTKGlub2RlKSkgewo+ID4+
ICAgICAgICAgICAgICAgICAgcmV0ID0gLUVGQklHOwo+ID4+ICAgICAgICAgICAgICAgICAgZ290
byBvdXQ7Cj4gPj4gICAgICAgICAgfQo+ID4+Cj4gPj4gU2hvdWxkIHdlIGFkZCB0aGUgbG9naWMg
b25seSBpZiBibGt6b25lZCBmZXR1cmUgaXMgZW5hYmxlZD8KPiA+Pgo+ID4+PiBiZWxpZXZlIG1r
d3JpdGUgZmFpbHVyZSBpcyBva2F5IGluIHJhY3kgY29uZGl0aW9ucyBjYXVzZWQgYnkgY2xlYXJp
bmcKPiA+Pj4gdGhlIHBpbiBmbGFnLiBXaGF0IGRvIHlvdSB0aGluaz8KPiA+Pgo+ID4+IE9yIHdl
IGNhbiB1c2UgZmlsZW1hcF9pbnZhbGlkYXRlX2xvY2soKSBpbiBmMmZzX2lvY19zZXRfcGluX2Zp
bGUoKSB0bwo+ID4+IGF2b2lkIHRoZSByYWNlIGNvbmRpdGlvbj8KPiA+Pgo+ID4+IFRoYW5rcywK
PiA+Pgo+ID4+Pgo+ID4+Pj4KPiA+Pj4+IFRoYW5rcywKPiA+Pj4+Cj4gPj4+Pj4gICAgICAgICBp
bnQgZXJyID0gMDsKPiA+Pj4+PiAgICAgICAgIHZtX2ZhdWx0X3QgcmV0Owo+ID4+Pj4+Cj4gPj4+
Pj4gQEAgLTExNCwxOSArMTE0LDE1IEBAIHN0YXRpYyB2bV9mYXVsdF90IGYyZnNfdm1fcGFnZV9t
a3dyaXRlKHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+ID4+Pj4+ICAgICAgICAgICAgICAgICBnb3Rv
IG91dF9zZW07Cj4gPj4+Pj4gICAgICAgICB9Cj4gPj4+Pj4KPiA+Pj4+PiArICAgICBzZXRfbmV3
X2Rub2RlKCZkbiwgaW5vZGUsIE5VTEwsIE5VTEwsIDApOwo+ID4+Pj4+ICAgICAgICAgaWYgKG5l
ZWRfYWxsb2MpIHsKPiA+Pj4+PiAgICAgICAgICAgICAgICAgLyogYmxvY2sgYWxsb2NhdGlvbiAq
Lwo+ID4+Pj4+IC0gICAgICAgICAgICAgc2V0X25ld19kbm9kZSgmZG4sIGlub2RlLCBOVUxMLCBO
VUxMLCAwKTsKPiA+Pj4+PiAgICAgICAgICAgICAgICAgZXJyID0gZjJmc19nZXRfYmxvY2tfbG9j
a2VkKCZkbiwgcGFnZS0+aW5kZXgpOwo+ID4+Pj4+IC0gICAgIH0KPiA+Pj4+PiAtCj4gPj4+Pj4g
LSNpZmRlZiBDT05GSUdfRjJGU19GU19DT01QUkVTU0lPTgo+ID4+Pj4+IC0gICAgIGlmICghbmVl
ZF9hbGxvYykgewo+ID4+Pj4+IC0gICAgICAgICAgICAgc2V0X25ld19kbm9kZSgmZG4sIGlub2Rl
LCBOVUxMLCBOVUxMLCAwKTsKPiA+Pj4+PiArICAgICB9IGVsc2Ugewo+ID4+Pj4+ICAgICAgICAg
ICAgICAgICBlcnIgPSBmMmZzX2dldF9kbm9kZV9vZl9kYXRhKCZkbiwgcGFnZS0+aW5kZXgsIExP
T0tVUF9OT0RFKTsKPiA+Pj4+PiAgICAgICAgICAgICAgICAgZjJmc19wdXRfZG5vZGUoJmRuKTsK
PiA+Pj4+PiAgICAgICAgIH0KPiA+Pj4+PiAtI2VuZGlmCj4gPj4+Pj4gKwo+ID4+Pj4+ICAgICAg
ICAgaWYgKGVycikgewo+ID4+Pj4+ICAgICAgICAgICAgICAgICB1bmxvY2tfcGFnZShwYWdlKTsK
PiA+Pj4+PiAgICAgICAgICAgICAgICAgZ290byBvdXRfc2VtOwo+ID4+Pj4+IEBAIC00NjExLDYg
KzQ2MDcsMTAgQEAgc3RhdGljIGludCBmMmZzX3ByZWFsbG9jYXRlX2Jsb2NrcyhzdHJ1Y3Qga2lv
Y2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqaXRlciwKPiA+Pj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gcmV0Owo+ID4+Pj4+ICAgICAgICAgfQo+ID4+Pj4+Cj4gPj4+Pj4gKyAg
ICAgLyogRm9yIHBpbm5lZCBmaWxlcywgaXQgc2hvdWxkIGJlIGZhbGxvY2F0ZSgpLWVkIGluIGFk
dmFuY2UuICovCj4gPj4+Pj4gKyAgICAgaWYgKGYyZnNfaXNfcGlubmVkX2ZpbGUoaW5vZGUpKQo+
ID4+Pj4+ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPj4+Pj4gKwo+ID4+Pj4+ICAgICAgICAg
LyogRG8gbm90IHByZWFsbG9jYXRlIGJsb2NrcyB0aGF0IHdpbGwgYmUgd3JpdHRlbiBwYXJ0aWFs
bHkgaW4gNEtCLiAqLwo+ID4+Pj4+ICAgICAgICAgbWFwLm1fbGJsayA9IEYyRlNfQkxLX0FMSUdO
KHBvcyk7Cj4gPj4+Pj4gICAgICAgICBtYXAubV9sZW4gPSBGMkZTX0JZVEVTX1RPX0JMSyhwb3Mg
KyBjb3VudCk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
