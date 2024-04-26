Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C368B367B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Apr 2024 13:25:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s0Jhy-0008FD-BP;
	Fri, 26 Apr 2024 11:25:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1s0Jhx-0008F7-8H
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Apr 2024 11:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P/KkZVOHUjSvKFzby4LSjkn/O+aGICzD1xt5kzZkffs=; b=JmlIdUSqu00QssB+hmS9eSNKfm
 92jEP2HGBV+tzseKEni2RLKU9/fGz/GP+bnIDBBoKoAswi8DqAQ04pYDjjLOHX0oyu5IA+Lkd2ecv
 Isbd8UMx6Z4FMVq/LLgUgfbl8RGN7b++4nzi8Io5nc6q69ep2nD6ivnrlisLDsZJ4cAc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P/KkZVOHUjSvKFzby4LSjkn/O+aGICzD1xt5kzZkffs=; b=G5+nl2VNKjrC680kza3Y8pBIuA
 jgoJi38QNcbFiQHEDqdxhPiuvAPm/B8fdslp0xs33ivXeZDpPGZUQijDE2LF40/6f9qbn96GAr33t
 Eqxt5J9d+UbKnNkEdKNten1CXG0prKdSzU8aULRFfI8q7Ze7ZVcduyZQpAKza+CEN+pk=;
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s0Jhw-0005p6-Fa for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Apr 2024 11:25:37 +0000
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-349545c3eb8so1295485f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Apr 2024 04:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714130725; x=1714735525; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P/KkZVOHUjSvKFzby4LSjkn/O+aGICzD1xt5kzZkffs=;
 b=RgBIxG4SumZXOXdrBCIvOtJRJT+RBraGsKn2qilS+Sd4nEPd5942f7Gi/xwBHtvhE3
 ZnSowPeVh32RwRgXflPdui4HEX2qDad9mel9evSyQiHYspnvhsDAdcSKEbZwNNjpghXu
 BXUuKjkPDUEmNua0m1yeHFxnEf/Hil+lSElTXNkGO4BwQqIMagzTGth46aSE6Y6gvMNe
 EEougqE54eMDVc/6SFbifjTIZ6C12RcylrT2Dq7s9PobRw+fsChwy1QB637+2+z57FRr
 8N4BG3Ur4RoncGa+cUDR7bopcVWUnWE03BKHXUi/DEG0fC6EYQniRLwjv8eTHzCzWVyF
 fCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714130725; x=1714735525;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P/KkZVOHUjSvKFzby4LSjkn/O+aGICzD1xt5kzZkffs=;
 b=UK5zBNXgMJIbbYd0OiFS8B3AI83rXrTBf0tWsgLriMxZ+TSQYnA3kESmbQxhLGTWAA
 5gR81heIVBjYLhb3FHcKHHkwTP9OseBba/K6zBE+qE9nOPlltKKzC0k0WfsGL+DYavLI
 mkDKaEHH4b/Y7QuE7FG755WmBik3g9+/WCckqYFeHxkFZAttvqw/nhXDa9TE+5A5aKyF
 gsV82eAuGQDZSNOCo7Frzl8jArQ0BZ7J8sVFHa0x9lB/029U6NOWBgZm5uo5/my0vVd0
 IXf8VVpkMdVPVapj/ulzWQz0p60+7it79BfClW+gmVcDybNT0aXLrnUZycrFiSAdtxb0
 P1qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBJytT+EFLPbsxS04aGXmOh7ufyE0CDRnr+wtu/VK1CNbe6Ag26DZwhYriyCbkvevJrB7Y6OwZ74AoyzDdHeJ3PXyeRcZQn+NWTS7KgNOXHk1pLfJgDw==
X-Gm-Message-State: AOJu0YyNX5KpnULrpHC8xgyJY1of0UHCDLT0ms2Q9SM6xKKAf6FESdvH
 AirKBL+ZOOUpbEz7hhZ2GaZduZ4ucvTwQjpClecEiSuCFY/b8C+EM3kQLETP+rddwNJjW+xD9qA
 FXA4NbzVzrfryXFl2KiazbOYWDxw=
X-Google-Smtp-Source: AGHT+IFmuUcYbKho8+oCAuzCYhT5xSf0GYuCMoptOuX1QlBaPGQXvi7ZzpYyiYMeFgxOJH0DtuxDUr1rDCanCcD/iyo=
X-Received: by 2002:adf:9bd1:0:b0:34a:9be4:4674 with SMTP id
 e17-20020adf9bd1000000b0034a9be44674mr1517772wrc.8.1714130725203; Fri, 26 Apr
 2024 04:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240416072108.5819-1-chao@kernel.org>
 <20240416072108.5819-2-chao@kernel.org>
 <CAHJ8P3J4Z7QJ=kpd_Nt+TGX2ZD8HH5YQWmbPsbS7+DeN2NrxyA@mail.gmail.com>
 <235d9db4-2ca5-4d7a-bd2a-36f98d1880a9@kernel.org>
In-Reply-To: <235d9db4-2ca5-4d7a-bd2a-36f98d1880a9@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 26 Apr 2024 19:25:14 +0800
Message-ID: <CAHJ8P3JD4KxSEz0mQF4+Mb8KvupLLwtj4F4ghPpePxTvr23vEg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Fixed! On Fri, Apr 26, 2024 at 5:37 PM Chao Yu wrote: >
   > On 2024/4/16 19:12, Zhiguo Niu wrote: > > On Tue, Apr 16, 2024 at 3:22 PM
    Chao Yu wrote: > >> > >> After commit d7e9a9037de2 ("f2fs: Support [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.50 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1s0Jhw-0005p6-Fa
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: remove unnecessary block size
 check in init_f2fs_fs()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Rml4ZWQhCgpPbiBGcmksIEFwciAyNiwgMjAyNCBhdCA1OjM34oCvUE0gQ2hhbyBZdSA8Y2hhb0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDIwMjQvNC8xNiAxOToxMiwgWmhpZ3VvIE5pdSB3cm90
ZToKPiA+IE9uIFR1ZSwgQXByIDE2LCAyMDI0IGF0IDM6MjLigK9QTSBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gQWZ0ZXIgY29tbWl0IGQ3ZTlhOTAzN2RlMiAoImYy
ZnM6IFN1cHBvcnQgQmxvY2sgU2l6ZSA9PSBQYWdlIFNpemUiKSwKPiA+PiBGMkZTX0JMS1NJWkUg
ZXF1YWxzIHRvIFBBR0VfU0laRSwgcmVtb3ZlIHVubmVjZXNzYXJ5IGNoZWNrIGNvbmRpdGlvbi4K
PiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiA+PiAt
LS0KPiA+PiAgIGZzL2YyZnMvc3VwZXIuYyB8IDYgLS0tLS0tCj4gPj4gICAxIGZpbGUgY2hhbmdl
ZCwgNiBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMg
Yi9mcy9mMmZzL3N1cGVyLmMKPiA+PiBpbmRleCA2ZDFlNGZjNjI5ZTIuLjMyYWE2ZDZmYTg3MSAx
MDA2NDQKPiA+PiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPiA+PiArKysgYi9mcy9mMmZzL3N1cGVy
LmMKPiA+PiBAQCAtNDkzMywxMiArNDkzMyw2IEBAIHN0YXRpYyBpbnQgX19pbml0IGluaXRfZjJm
c19mcyh2b2lkKQo+ID4+ICAgewo+ID4+ICAgICAgICAgIGludCBlcnI7Cj4gPj4KPiA+PiAtICAg
ICAgIGlmIChQQUdFX1NJWkUgIT0gRjJGU19CTEtTSVpFKSB7Cj4gPj4gLSAgICAgICAgICAgICAg
IHByaW50aygiRjJGUyBub3Qgc3VwcG9ydGVkIG9uIFBBR0VfU0laRSglbHUpICE9IEJMT0NLX1NJ
WkUoJWx1KVxuIiwKPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0VfU0la
RSwgRjJGU19CTEtTSVpFKTsKPiA+PiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
Pj4gLSAgICAgICB9Cj4gPj4gLQo+ID4+ICAgICAgICAgIGVyciA9IGluaXRfaW5vZGVjYWNoZSgp
Owo+ID4+ICAgICAgICAgIGlmIChlcnIpCj4gPj4gICAgICAgICAgICAgICAgICBnb3RvIGZhaWw7
Cj4gPiBEZWFyIENoYW8sCj4gPgo+ID4gQ2FuIHlvdSBoZWxwIG1vZGlmeSB0aGUgZm9sbG93aW5n
ICBjb21tZW50IG1zZyB0b2dldGhlciB3aXRoIHRoaXMgcGF0Y2g/Cj4gPiBUaGV5IGFyZSBhbHNv
IHJlbGF0ZWQgdG8gY29tbWl0IGQ3ZTlhOTAzN2RlMiAoImYyZnM6IFN1cHBvcnQgQmxvY2sKPiA+
IFNpemUgPT0gUGFnZSBTaXplIikuCj4gPiBJZiB5b3UgdGhpbmsgdGhlcmUgaXMgYSBtb3JlIHN1
aXRhYmxlIGRlc2NyaXB0aW9uLCBwbGVhc2UgaGVscCBtb2RpZnkKPiA+IGl0IGRpcmVjdGx5Lgo+
Cj4gWmhpZ3VvLAo+Cj4gSSBtaXNzZWQgdG8gcmVwbHkgdGhpcywgSSBndWVzcyB5b3UgY2FuIHVw
ZGF0ZQo+ICJmMmZzOiBmaXggc29tZSBhbWJpZ3VvdXMgY29tbWVudHMiLgpEZWFyIENoYW8sCk9L
LCBJIGdvdCBpdC4KdGhhbmtzIQo+Cj4gPiB0aGFua3PvvIEKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9mMmZzX2ZzLmggYi9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaAo+ID4gaW5k
ZXggYTM1NzI4Ny4uMjQxZTdiMTggMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2YyZnNf
ZnMuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgKPiA+IEBAIC0zOTQsNyArMzk0
LDggQEAgc3RydWN0IGYyZnNfbmF0X2Jsb2NrIHsKPiA+Cj4gPiAgIC8qCj4gPiAgICAqIEYyRlMg
dXNlcyA0IGJ5dGVzIHRvIHJlcHJlc2VudCBibG9jayBhZGRyZXNzLiBBcyBhIHJlc3VsdCwgc3Vw
cG9ydGVkIHNpemUgb2YKPiA+IC0gKiBkaXNrIGlzIDE2IFRCIGFuZCBpdCBlcXVhbHMgdG8gMTYg
KiAxMDI0ICogMTAyNCAvIDIgc2VnbWVudHMuCj4gPiArICogZGlzayBpcyAxNiBUQiBmb3IgYSA0
SyBwYWdlIHNpemUgYW5kIDY0IFRCIGZvciBhIDE2SyBwYWdlIHNpemUgYW5kIGl0IGVxdWFscwo+
Cj4gZGlzayBpcyAxNiBUQiBmb3IgNEsgc2l6ZSBibG9jayBhbmQgNjQgVEIgZm9yIDE2SyBzaXpl
IGJsb2NrIGFuZCBpdCBlcXVhbHMKPiB0byAoMSA8PCAzMikgLyA1MTIgc2VnbWVudHMuCj4KPiAj
ZGVmaW5lIEYyRlNfTUFYX1NFR01FTlQgICAgICAgICAgICAgICAgKCgxIDw8IDMyKSAvIDUxMikK
Pgo+IFRoYW5rcywKPgo+ID4gKyAqIHRvIDE2ICogMTAyNCAqIDEwMjQgLyAyIHNlZ21lbnRzLgo+
ID4gICAgKi8KPiA+ICAgI2RlZmluZSBGMkZTX01BWF9TRUdNRU5UICAgICAgICgoMTYgKiAxMDI0
ICogMTAyNCkgLyAyKQo+ID4KPiA+IEBAIC00MjQsOCArNDI1LDEwIEBAIHN0cnVjdCBmMmZzX3Np
dF9ibG9jayB7Cj4gPiAgIC8qCj4gPiAgICAqIEZvciBzZWdtZW50IHN1bW1hcnkKPiA+ICAgICoK
PiA+IC0gKiBPbmUgc3VtbWFyeSBibG9jayBjb250YWlucyBleGFjdGx5IDUxMiBzdW1tYXJ5IGVu
dHJpZXMsIHdoaWNoIHJlcHJlc2VudHMKPiA+IC0gKiBleGFjdGx5IG9uZSBzZWdtZW50IGJ5IGRl
ZmF1bHQuIE5vdCBhbGxvdyB0byBjaGFuZ2UgdGhlIGJhc2ljIHVuaXRzLgo+ID4gKyAqIE9uZSBz
dW1tYXJ5IGJsb2NrIHdpdGggNEtCIHNpemUgY29udGFpbnMgZXhhY3RseSA1MTIgc3VtbWFyeSBl
bnRyaWVzLCB3aGljaAo+ID4gKyAqIHJlcHJlc2VudHMgZXhhY3RseSBvbmUgc2VnbWVudCB3aXRo
IDJNQiBzaXplLgo+ID4gKyAqIFNpbWlsYXJseSwgaW4gdGhlIGNhc2Ugb2YgMTZrIGJsb2NrIHNp
emUsIGl0IHJlcHJlc2VudHMgb25lCj4gPiBzZWdtZW50IHdpdGggOE1CIHNpemUuCj4gPiArICog
Tm90IGFsbG93IHRvIGNoYW5nZSB0aGUgYmFzaWMgdW5pdHMuCj4gPiAgICAqCj4gPiAgICAqIE5P
VEU6IEZvciBpbml0aWFsaXppbmcgZmllbGRzLCB5b3UgbXVzdCB1c2Ugc2V0X3N1bW1hcnkKPiA+
ICAgICoKPiA+IEBAIC01NTYsNiArNTU5LDcgQEAgc3RydWN0IGYyZnNfc3VtbWFyeV9ibG9jayB7
Cj4gPgo+ID4gICAvKgo+ID4gICAgKiBzcGFjZSB1dGlsaXphdGlvbiBvZiByZWd1bGFyIGRlbnRy
eSBhbmQgaW5saW5lIGRlbnRyeSAody9vIGV4dHJhCj4gPiByZXNlcnZhdGlvbikKPiA+ICsgKiB3
aGVuIGJsb2NrIHNpemUgaXMgNEtCLgo+ID4KPiA+Cj4gPgo+ID4+IC0tCj4gPj4gMi40MC4xCj4g
Pj4KPiA+Pgo+ID4+Cj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiA+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+ID4+IExpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
