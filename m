Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C6F868741
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Feb 2024 03:35:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1renJT-0005xP-Ok;
	Tue, 27 Feb 2024 02:35:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1renJR-0005wH-Po
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 02:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RKnTk+J+FX3ola1FbmaFj80zZDlGsKyOPaOv8pvNq9Y=; b=V8pC6Bq7+6f+8UtHpCpl/SPnD3
 2rzvd3LEAn79AZpBBO6oJ5Y8EUkpz7QsUjy5N+U6kLdPE13r3TBMDzFP8ObM5DYXjiLsEgibdPj2j
 UxN3zVtIkBrayb87ol4Xcvtx8OOOww4jn5F/aNbf6jxRcAdpKRjnYWfKSSoAqbJkSgjU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RKnTk+J+FX3ola1FbmaFj80zZDlGsKyOPaOv8pvNq9Y=; b=boSvIKz/3dWkqEqDDs5pi4zJli
 bhzvoKq/PV0pT5K3m/MDnZ4/f0IsAGsja9T7vmqwh7+NmgRf7A8p2YuRAGBDz73A9SMMr+rEPIrxc
 2biHh3mXvc+KpznrxuQFnils3lIKPQpGpg1QusLuK2rWc+ylj9EtC/08xp5RGLxh0jA0=;
Received: from mail-ed1-f47.google.com ([209.85.208.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1renJR-0003jX-I9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 02:35:22 +0000
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-564647bcdbfso3796733a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 18:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709001310; x=1709606110; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RKnTk+J+FX3ola1FbmaFj80zZDlGsKyOPaOv8pvNq9Y=;
 b=g2tpxSHRawhRKisZOQN2vee27mkLDI6Inyh/m7ChEYeXMCkCFC/ImTUiCUEeb7sQcE
 D6zecKtXfUBwSqpHq7MW6W+zzVq0vj4Wq5UoGla3xjsOOSZ2SzgEjOBDIYnZZwqjZrg0
 Opamb4Jbxfi61D6NksXk4m+8DGDu1ev1B0PYSG57jraZWMxIynjKVkqybM/qOlTqVn8R
 u0wTLPgzzH6M/aLIGmdAWFRA5Msu5K0wfEk54djMGKKGiUGQansmrkZEZX+TVZcsSBV6
 c1AQB6CeYHk65mCkiG+wfUMvjj+Mx0fYeYTmn9tyd2nMkN7OuhRUbHB6+ZYw0UFCNjjU
 qCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709001310; x=1709606110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RKnTk+J+FX3ola1FbmaFj80zZDlGsKyOPaOv8pvNq9Y=;
 b=ieIhHOfk1b2++170N9usd5eUSDCW40OLGnhG9H1wYdHMudiWlDWifw2KuOCqtEQfgq
 grCAjGbTBfQ8Vf2v63HR0NW6hBvU/afmlhVeHCrEamclmfVVCqmvU5VsA3DnCVX7/vhm
 4l9E6J+0Fd3W7MV4JACJVh36Dz8u7WrFGVz8matTelfp/h4y2JCm1PtGhLPhSfBCDFIY
 OuB6yEA9fg02aMoOTBqqnD+YtCafxNTnAbOFSQt0Y+4MOFSoTj1K9E8HUJTyx+ZyLPoX
 JlBEbfqsOxAKM8/426C0Vl1L8lKQ8g9AmPEoAN9XgSdrc6eMPsHeVq0WSeZEd496kNfy
 4y0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj+6fCUAtQ5AKzC1e0duXqe/oY7+dFgMhIMuebDvHEUc80dv2qemsZK40IPGrBI5hpSVXXEsc/GPL3S7njDKwt8bY6mIfCt2WYrkTePee18la24XvCWQ==
X-Gm-Message-State: AOJu0YzqM1bs7cUXfdL8uIfXcB5o9yCWEkPD4DEpErx/GPb56go2SYbT
 dsYLxmX8cyrjKI9+6B3MDv7BmU1R0V7pwJro2kXDMhr+oyCo3WwIXYM9vl19tU6qycWY71NlT0b
 msp2deOFHPFQc7pw+mH+cqyzodNQ=
X-Google-Smtp-Source: AGHT+IEXXbKpXmjl9N8hMVutjJqfZLOxImX2rF+nFapa9vIsJj1qUBXl6dHVVXRP2UAScLC8ElOF8tquWZvBP2Qa+dY=
X-Received: by 2002:aa7:d5d5:0:b0:564:3392:e9db with SMTP id
 d21-20020aa7d5d5000000b005643392e9dbmr5247469eds.33.1709001309894; Mon, 26
 Feb 2024 18:35:09 -0800 (PST)
MIME-Version: 1.0
References: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
 <88459a22-a21c-4c3d-8371-31d7d713b536@kernel.org>
 <CAHJ8P3KYY27M3v=9Lu-yD2ufxU1fdG-bg=G92AbpnLUx0zLz3g@mail.gmail.com>
 <f36ef5d0-8922-449e-b19c-de009c89e712@kernel.org>
 <CAHJ8P3KS2YAXm=GND8DknZqvGqTvm38Nv_9z1nEq4cTJjir-sA@mail.gmail.com>
 <Zd03RHMKBqv1f6GF@google.com>
In-Reply-To: <Zd03RHMKBqv1f6GF@google.com>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 27 Feb 2024 10:34:58 +0800
Message-ID: <CAHJ8P3Lj_1pa=npkAsMfeStEY3nWgf591tFndKTT_skFYLv+GQ@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Feb 27, 2024 at 9:13 AM Jaegeuk Kim wrote: > > On
    02/26, Zhiguo Niu wrote: > > Dear Chao, > > > > On Fri, Feb 23, 2024 at 10:38 AM
    Chao Yu wrote: > > > > > > On 2024/2/23 10:01, Zhiguo [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.47 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1renJR-0003jX-I9
Subject: Re: [f2fs-dev] [PATCH v2 0/4] f2fs: fix panic issue in small
 capacity device
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 Zhiguo Niu <zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBGZWIgMjcsIDIwMjQgYXQgOToxM+KAr0FNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMDIvMjYsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBEZWFy
IENoYW8sCj4gPgo+ID4gT24gRnJpLCBGZWIgMjMsIDIwMjQgYXQgMTA6MzjigK9BTSBDaGFvIFl1
IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiAyMDI0LzIvMjMgMTA6MDEs
IFpoaWd1byBOaXUgd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IE9uIFRodSwgRmViIDIy
LCAyMDI0IGF0IDg6MzDigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmcgPG1haWx0bzpjaGFv
QGtlcm5lbC5vcmc+PiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ICAgICBPbiAyMDI0LzIvNyAxMDow
MSwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+ID4gPiAgICAgID4gQSBwYW5pYyBpc3N1ZSBoYXBwZW5l
ZCBpbiBhIHJlYm9vdCB0ZXN0IGluIHNtYWxsIGNhcGFjaXR5IGRldmljZQo+ID4gPiA+ICAgICAg
PiBhcyBmb2xsb3dpbmc6Cj4gPiA+ID4gICAgICA+IDEuVGhlIGRldmljZSBzaXplIGlzIDY0TUIs
IGFuZCBtYWluIGFyZWEgaGFzIDI0IHNlZ21lbnRzLCBhbmQKPiA+ID4gPiAgICAgID4gQ09ORklH
X0YyRlNfQ0hFQ0tfRlMgaXMgbm90IGVuYWJsZWQuCj4gPiA+ID4gICAgICA+IDIuVGhlcmUgaXMg
bm8gYW55IGZyZWUgc2VnbWVudHMgbGVmdCBzaG93biBpbiBmcmVlX3NlZ21hcF9pbmZvLAo+ID4g
PiA+ICAgICAgPiB0aGVuIGFub3RoZXIgd3JpdGUgcmVxdWVzdCBjYXVzZSBnZXRfbmV3X3NlZ21l
bnQgZ2V0IGEgb3V0LW9mLWJvdW5kCj4gPiA+ID4gICAgICA+IHNlZ21lbnQgd2l0aCBzZWdubyAy
NC4KPiA+ID4gPiAgICAgID4gMy5wYW5pYyBoYXBwZW4gaW4gdXBkYXRlX3NpdF9lbnRyeSBiZWNh
dXNlIGFjY2VzcyBpbnZhbGlkIGJpdG1hcAo+ID4gPiA+ICAgICAgPiBwb2ludGVyLgo+ID4gPiA+
Cj4gPiA+ID4gICAgIFpoaWd1bywKPiA+ID4gPgo+ID4gPiA+ICAgICBDYW4geW91IHBsZWFzZSB0
cnkgYmVsb3cgcGF0Y2ggdG8gc2VlIHdoZXRoZXIgaXQgY2FuIGZpeCB5b3VyIHByb2JsZW0/Cj4g
PiA+ID4KPiA+ID4gPiAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZl
bC8yMDI0MDIyMjEyMTg1MS44ODMxNDEtMy1jaGFvQGtlcm5lbC5vcmcgPGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyNDAyMjIxMjE4NTEuODgzMTQxLTMtY2hhb0Br
ZXJuZWwub3JnPgo+ID4gPiA+Cj4gPiA+ID4gICAgIFRoYW5rcywKPiA+ID4gPgo+ID4gPiA+Cj4g
PiA+ID4gRGVhciBDaGFvLAo+ID4gPiA+IEkgbmVlZCB0byBjb29yZGluYXRlIHRoZSB0ZXN0aW5n
IHJlc291cmNlcy4gVGhlIHByZXZpb3VzIHRlc3RpbmcgaGFzIGJlZW4gc3RvcHBlZCBiZWNhdXNl
IGl0IHdhcyBmaXhlZCB3aXRoIHRoZSBjdXJyZW50IHBhdGNoLiBJbiBhZGRpdGlvbiwgdGhpcyBy
ZXF1aXJlcyBzdGFiaWxpdHkgdGVzdGluZyB0byByZXByb2R1Y2UsIHNvIGl0IHdpbGwgdGFrZSBh
IGNlcnRhaW4gYW1vdW50IG9mIHRpbWUuIElmIHRoZXJlIGlzIGFueSBzaXR1YXRpb24sIEkgd2ls
bCB0ZWxsIHlvdSBpbiB0aW1lLgo+ID4gPgo+ID4gPiBaaGlndW8sIHRoYW5rIHlvdSEKPiA+Cj4g
PiBXZSB0ZXN0ZWQgdGhpcyBwYXRjaCAgdGhpcyB3ZWVrZW5kIG9uIHRoZSBwcmV2aW91cyB2ZXJz
aW9uIHdpdGgKPiA+IHByb2JsZW0sIGFuZCBpdCBjYW4gbm90IHJlcHJvZHVjZSBwYW5pYyBpc3N1
ZXMsCj4gPiBzbyB0aGlzIHBhdGNoIHNob3VsZCBmaXggdGhlIG9yaWdpbmFsIGlzc3VlLgo+ID4g
dGhhbmtz77yBCj4KRGVhciBKYWVnZXVrLAo+IEhleSwgZG8geW91IGd1eXMgcGxlYXNlIHBvaW50
IG91dCB3aGljaCBwYXRjaGVzIHdlcmUgdGVzdGVkIHdpdGhvdXQgd2hhdD8KVGhpcyBwcm9ibGVt
IG9jY3VycmVkIGR1cmluZyBvdXIgcGxhdGZvcm0gc3RhYmlsaXR5IHRlc3RpbmcuCml0IGNhbiBi
ZSBmaXhlZCBieSBteSAgdGhpcyBwYXRjaCBzZXQsIG1haW5seSBiZSBmaXhlZCBieToKZjJmczog
Zml4IHBhbmljIGlzc3VlIGluIHVwZGF0ZV9zaXRfZW50cnkgJiBmMmZzOiBlbmhhbmNlIGp1ZGdt
ZW50CmNvbmRpdGlvbnMgb2YgR0VUX1NFR05PCmFuZCBDaGFvJ3MgcGF0Y2ggY2FuIGFsc28gZml4
IHRoaXMgcHJvYmxlbXMgdGVzdGluZyB3aXRob3V0IG15IHBhdGNoCj4gSU9Xcywgd2hpY2ggcGF0
Y2hlcyBzaG91bGQgSSByZW1vdmUgYW5kIGtlZXAgQ2hhbydzIHBhdGNoPwpJIHRoaW5rIGNoYW8n
cyBwYXRjaCBpcyBtb3JlIHJlYXNvbmFibGUsIGl0IGRvZXMgZXJyb3IgaGFuZGxpbmcgbW9yZSBj
b21wbGV0ZS4KYnV0IG15IHBhdGNoIGp1c3QgZG8gc29tZSBzYW5pdHkgY2hlY2sgZm9yIHJldHVy
biB2YWx1ZSBvZiBHRVRfU0VHTk8KU2FtZSBhcyBvdGhlciBjb2Rlcyh1cGRhdGVfc2VnbWVudF9t
dGltZSkKYW5kIGkgdGhpbmsgaXQgYWxzbyBuZWVkZWQgZXhjZXB0IHRoaXMgcGFydDoKCmRpZmYg
LS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuaCBiL2ZzL2YyZnMvc2VnbWVudC5oCmluZGV4IDNiZjJj
ZTQ2ZmEwOTA3Li5iYjIyZmVlYWUxY2ZjYiAxMDA2NDQKLS0tIGEvZnMvZjJmcy9zZWdtZW50LmgK
KysrIGIvZnMvZjJmcy9zZWdtZW50LmgKQEAgLTk2LDcgKzk2LDggQEAgc3RhdGljIGlubGluZSB2
b2lkIHNhbml0eV9jaGVja19zZWdfdHlwZShzdHJ1Y3QKZjJmc19zYl9pbmZvICpzYmksCihHRVRf
U0VHT0ZGX0ZST01fU0VHMChzYmksIGJsa19hZGRyKSAmIChCTEtTX1BFUl9TRUcoc2JpKSAtIDEp
KQojZGVmaW5lIEdFVF9TRUdOTyhzYmksIGJsa19hZGRyKSBcCi0gKCghX19pc192YWxpZF9kYXRh
X2Jsa2FkZHIoYmxrX2FkZHIpKSA/IFwKKyAoKCFfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihibGtf
YWRkcikgfHwgXAorICFmMmZzX2lzX3ZhbGlkX2Jsa2FkZHIoc2JpLCBibGtfYWRkciwgREFUQV9H
RU5FUklDKSkgPyBcCk5VTExfU0VHTk8gOiBHRVRfTDJSX1NFR05PKEZSRUVfSShzYmkpLCBcCkdF
VF9TRUdOT19GUk9NX1NFRzAoc2JpLCBibGtfYWRkcikpKQojZGVmaW5lIENBUF9CTEtTX1BFUl9T
RUMoc2JpKQpiZWNhdXNlIENoYW8ncyBwYXRjaCBsZXQgbmV3X2FkZHI9bnVsbF9hZGRyIHdoZW4g
IGdldF9uZXdfc2VnbWVudApyZXR1cm5zIE5PU1BBQ0UsCnNvIEkgdGhpbmsgdGhpcyBjYW4gYmUg
cmV2ZXJ0ZWQgYW5kIGl0IGFsc28gc2F2ZXMgY29kZSBydW5uaW5nIHRpbWUuCkhvdyBhYm91dCBD
aGFvJ3Mgb3BpbmlvbnM/CnRoYW5rcyEKPgo+ID4KPiA+ID4KPiA+ID4gQlRXLCBJJ3ZlIHRlc3Rl
ZCB0aGlzIHBhdGNoIGZvciBhIHdoaWxlLCBhbmQgaXQgbG9va3MgdGhlcmUgaXMgbm8gaXNzdWUg
dy8KPiA+ID4gRkFVTFRfTk9fU0VHTUVOVCBmYXVsdCBpbmplY3Rpb24gaXMgb24uCj4gPiA+Cj4g
PiA+ID4gYnR3LCBXaHkgY2Fu4oCZdCBJIHNlZSB0aGlzIHBhdGNoIG9uIHlvdXIgYnJhbmNoXl4/
Cj4gPiA+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
Y2hhby9saW51eC5naXQvbG9nLz9oPWRldi10ZXN0IDxodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9jaGFvL2xpbnV4LmdpdC9sb2cvP2g9ZGV2LXRlc3Q+Cj4g
PiA+Cj4gPiA+IFRvbyBsYXp5IHRvIHB1c2ggcGF0Y2hlcyBpbiB0aW1lLCB3aWxsIGRvIGl0IGlu
IHRoaXMgd2Vla2VuZC4gOlAKPiA+ID4KPiA+ID4gPiB0aGFua3PvvIEKPiA+ID4gPgo+ID4gPiA+
Cj4gPiA+ID4gICAgICA+Cj4gPiA+ID4gICAgICA+IE1vcmUgZGV0YWlsIHNob3duIGluIGZvbGxv
d2luZyBwYXRjaCBzZXRzLgo+ID4gPiA+ICAgICAgPiBUaGUgdGhyZWUgcGF0Y2hlcyBhcmUgc3Bs
aXRlZCBoZXJlIGJlY2F1c2UgdGhlIG1vZGlmaWNhdGlvbnMgYXJlCj4gPiA+ID4gICAgICA+IHJl
bGF0aXZlbHkgaW5kZXBlbmRlbnQgYW5kIG1vcmUgcmVhZGFibGUuCj4gPiA+ID4gICAgICA+Cj4g
PiA+ID4gICAgICA+IC0tLQo+ID4gPiA+ICAgICAgPiBDaGFuZ2VzIG9mIHYyOiBzdG9wIGNoZWNr
cG9pbnQgd2hlbiBnZXQgYSBvdXQtb2YtYm91bmQgc2VnbWVudAo+ID4gPiA+ICAgICAgPiAtLS0K
PiA+ID4gPiAgICAgID4KPiA+ID4gPiAgICAgID4gWmhpZ3VvIE5pdSAoNCk6Cj4gPiA+ID4gICAg
ICA+ICAgIGYyZnM6IGNvcnJlY3QgY291bnRpbmcgbWV0aG9kcyBvZiBmcmVlX3NlZ21lbnRzIGlu
IF9fc2V0X2ludXNlCj4gPiA+ID4gICAgICA+ICAgIGYyZnM6IGZpeCBwYW5pYyBpc3N1ZSBpbiB1
cGRhdGVfc2l0X2VudHJ5Cj4gPiA+ID4gICAgICA+ICAgIGYyZnM6IGVuaGFuY2UganVkZ21lbnQg
Y29uZGl0aW9ucyBvZiBHRVRfU0VHTk8KPiA+ID4gPiAgICAgID4gICAgZjJmczogc3RvcCBjaGVj
a3BvaW50IHdoZW4gZ2V0IGEgb3V0LW9mLWJvdW5kcyBzZWdtZW50Cj4gPiA+ID4gICAgICA+Cj4g
PiA+ID4gICAgICA+ICAgZnMvZjJmcy9maWxlLmMgICAgICAgICAgfCAgNyArKysrKystCj4gPiA+
ID4gICAgICA+ICAgZnMvZjJmcy9zZWdtZW50LmMgICAgICAgfCAyMSArKysrKysrKysrKysrKysr
LS0tLS0KPiA+ID4gPiAgICAgID4gICBmcy9mMmZzL3NlZ21lbnQuaCAgICAgICB8ICA3ICsrKyst
LS0KPiA+ID4gPiAgICAgID4gICBpbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCB8ICAxICsKPiA+ID4g
PiAgICAgID4gICA0IGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pCj4gPiA+ID4gICAgICA+Cj4gPiA+ID4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
