Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E95E9C4335
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Nov 2024 18:08:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tAXtM-0004pv-Qm;
	Mon, 11 Nov 2024 17:07:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1tAXtJ-0004pn-Uu
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Nov 2024 17:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=26L2jzx0WX57YZoCgN+U2AY3EnNhogrMyUmzYR/FRAo=; b=XrWebgL/MELgEbyvX7nLumfmOB
 r5x+SBcOJTFarSKaYlxWcsQ6Z3JvQCdMwr2uFOilgZJYtJN/WcK5zW2ha2w6SsEUB2Gb4sFxZ60as
 Tyg4EI3cU2lCxrOSsox8MNqEJllFlkbR1O3n0a9Qw5DBKgMU5gAFwvS4224mI8uscB/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=26L2jzx0WX57YZoCgN+U2AY3EnNhogrMyUmzYR/FRAo=; b=VaIdxPIuf546vNaTEfd7F+K9D1
 fBNvCiWk+YFqNoHi1EyHumGDOZX+NOgfZLGgKwAAg/cGdtxW5MiYjMXn1MeCOwAGZK6On01lTRsKj
 S8z9t3HLUEqf9hvr+vcwd1d+/eOmIv3NCG2rQjL9+iZKwMoly2UAMdeXi3xBZITFYspk=;
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tAXtI-0004im-OK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Nov 2024 17:07:53 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-718998df806so2316948a34.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Nov 2024 09:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731344862; x=1731949662; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=26L2jzx0WX57YZoCgN+U2AY3EnNhogrMyUmzYR/FRAo=;
 b=HZKWdAeHoXxUEXeeb7zNNBaeHVrbnwzA49lIV0YvESWo+MrQN7Mki7/1GYV/pqygbf
 x9M2mCufY0PaYVtbEYfBFICqI63L0pMHq5jV8bmWUHgBX7I4QXMJaeDx2hlSuQAYoAbp
 0Q+Qy7xqQ1r3ZpGhjbmzoNjMH/bPfact3DBFuKZ3WAUvt/zS6UJ4H2RenSdLPUzFyCIe
 r487QWh1IKbioib+LG9aUavcXbnOJebCb9KnicZwgwiu2qG+5aZC/X/j/G5Ejs/CX2Pt
 0ppXhUKAzaUZVK8cQ1EldGi46JdonIf2eMGdDPe55tkqy2Xbs0kMbplUiayDJO9I6wO/
 Tg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731344862; x=1731949662;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=26L2jzx0WX57YZoCgN+U2AY3EnNhogrMyUmzYR/FRAo=;
 b=Hm9RuEfOUwnelUk88Y8fxK+VoOpluU7vMTsGb7OM8EUKFdYvywTz7u8ouinwtwj1Eg
 psLcJdHvCh5YzobY1Cp4qZ8iUWdRfgjUh7vqqh5K+WXoLBybhystW9vkvHhncVQpnqNI
 RaxGgUg4P0yQibiSkFyTu7maOg5w0tlD7qNgyThRnsZgtvF1k+sAK0JLX62DdQ/Q8nXn
 T2VA8lYj1es7XZHfQY8Pimz12V++SNH+5erZ6lcbEcERY5X1J8RpcKuiDhStjXII283W
 v+Fk6afk11mlVKOaZjcYyR7LH6QtYd0vOSfs1mtNZBFNmomsYa+Nn5Jq9gqE4fc+3+fI
 kJGA==
X-Gm-Message-State: AOJu0YwNXUTtzH9+CeFHQiIlbz0+TmSnPrBZQoY+Ospbd+qWey/MX/h+
 xbex3/w3h7jnPG8Z0P53A5ntl9TGcv+NcXiNbvKaWmpUu94Lr18hY71+1QvV/MGvJEDo0rr79ki
 5NtEOvhxAvOmcmWzoOlkD7GRCyQRcyYvLRZ4=
X-Google-Smtp-Source: AGHT+IGZXDGvvqvrKq67r/dAhexAaxUZE9mSpOOgVYdWqOm1hkPAPRuylQygxIwX97+UROKTF+H8WWUwii1c2TqNSdQ=
X-Received: by 2002:a05:6358:f1c5:b0:1ad:14ec:a002 with SMTP id
 e5c5f4694b2df-1c641f90fcbmr473399755d.26.1731344861982; Mon, 11 Nov 2024
 09:07:41 -0800 (PST)
MIME-Version: 1.0
References: <20241111030456.2572093-1-jaegeuk@kernel.org>
In-Reply-To: <20241111030456.2572093-1-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 11 Nov 2024 09:07:31 -0800
Message-ID: <CACOAw_xU71Eo=iLddogKWbuMcY7eco5QfvoZ5P-yAmThgvL8eA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Daeho Jeong Thanks, On Sun, Nov 10, 2024 at 7:09 PM
    Jaegeuk Kim via Linux-f2fs-devel wrote: > > The immutable bit disallows selinux
    permission which gives no way to clear it. > > Fixes: 8cc4e257ec20 ("mkfs.f2fs:
    add [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.51 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.210.51 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tAXtI-0004im-OK
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: remove IMMUTABLE bit
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpUaGFua3Ms
CgpPbiBTdW4sIE5vdiAxMCwgMjAyNCBhdCA3OjA54oCvUE0gSmFlZ2V1ayBLaW0gdmlhIExpbnV4
LWYyZnMtZGV2ZWwKPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90
ZToKPgo+IFRoZSBpbW11dGFibGUgYml0IGRpc2FsbG93cyBzZWxpbnV4IHBlcm1pc3Npb24gd2hp
Y2ggZ2l2ZXMgbm8gd2F5IHRvIGNsZWFyIGl0Lgo+Cj4gRml4ZXM6IDhjYzRlMjU3ZWMyMCAoIm1r
ZnMuZjJmczogYWRkIGRldmljZSBhbGlhc2luZyBmZWF0dXJlIikKPiBTaWduZWQtb2ZmLWJ5OiBK
YWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+IC0tLQo+ICBta2ZzL2YyZnNfZm9ybWF0
LmMgfCAzICstLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvbWtmcy9mMmZzX2Zvcm1hdC5jIGIvbWtmcy9mMmZzX2Zvcm1h
dC5jCj4gaW5kZXggNTJhMWUxODY0YjI5Li42NjM1ZWVkOTk4MTMgMTAwNjQ0Cj4gLS0tIGEvbWtm
cy9mMmZzX2Zvcm1hdC5jCj4gKysrIGIvbWtmcy9mMmZzX2Zvcm1hdC5jCj4gQEAgLTE3NDgsOCAr
MTc0OCw3IEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9hbGlhc19pbm9kZXModm9pZCkKPiAgICAg
ICAgICAgICAgICAgZGV2X29mZisrOwo+ICAgICAgICAgICAgICAgICBmMmZzX2luaXRfaW5vZGUo
c2IsIHJhd19ub2RlLCBpbm8sIG1rZnNfdGltZSwgMHg4MWMwKTsKPgo+IC0gICAgICAgICAgICAg
ICByYXdfbm9kZS0+aS5pX2ZsYWdzID0gY3B1X3RvX2xlMzIoRjJGU19JTU1VVEFCTEVfRkwgfAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRjJGU19ERVZJQ0VfQUxJQVNfRkwpOwo+
ICsgICAgICAgICAgICAgICByYXdfbm9kZS0+aS5pX2ZsYWdzID0gY3B1X3RvX2xlMzIoRjJGU19E
RVZJQ0VfQUxJQVNfRkwpOwo+ICAgICAgICAgICAgICAgICByYXdfbm9kZS0+aS5pX2lubGluZSA9
IEYyRlNfUElOX0ZJTEU7Cj4gICAgICAgICAgICAgICAgIHJhd19ub2RlLT5pLmlfcGlubyA9IHNi
LT5yb290X2lubzsKPiAgICAgICAgICAgICAgICAgZmlsZW5hbWUgPSBjLmRldmljZXNbaV0uYWxp
YXNfZmlsZW5hbWU7Cj4gLS0KPiAyLjQ3LjAuMjc3Lmc4ODAwNDMxZWVhLWdvb2cKPgo+Cj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
