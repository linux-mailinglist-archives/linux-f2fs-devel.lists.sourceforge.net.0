Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB58660379
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Jan 2023 16:39:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDooU-0000E4-Kb;
	Fri, 06 Jan 2023 15:39:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <alexdeucher@gmail.com>) id 1pDooT-0000Dn-Ev
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jan 2023 15:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nOU74MfLltUT+h+F/CrT1EH2iRW8ZoWBGIJbj4ikcZg=; b=LSWoNkHPjrloW20eDe+DW0uNp7
 MNCAxE7GmDSyxb/ONAboSMNdxZJJH4PdHYMRFArvDW8mHxKbuTCCJB3eqE0ypRCYFEPeimy9s+axz
 hRtMLKRBbdWx78fE6v53mbhPAW+iIzey6RH0tPVuutdUvxq7GbHcafu284jM3Age4OZk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nOU74MfLltUT+h+F/CrT1EH2iRW8ZoWBGIJbj4ikcZg=; b=eFm51oV9kVWDg95MsZSIYaJ8hA
 NIyWHfuT+COnnSmPdbi4Gb8NOBkvXIcR6W5rIa2J287ogdEYTAxX3Z/lOcaYYhnNZhqBKgdmLxvF0
 synLGFqc1djCW0Szf6E9aiTGeFrv9cTT0x1zSQKOA4Zy8ma3xvqUGUov1HJ7alou3zCA=;
Received: from mail-oa1-f41.google.com ([209.85.160.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDooS-0008FQ-IX for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jan 2023 15:39:21 +0000
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-14ffd3c5b15so1892045fac.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Jan 2023 07:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOU74MfLltUT+h+F/CrT1EH2iRW8ZoWBGIJbj4ikcZg=;
 b=kCHCa/r/NH7je4QvL7iXn+mGinMO0F8rBjuPT2QnoR6UCmONeCpDaIl710U7xlpmT6
 ikc1XvbZrH2G6v6Ld0fca1JWE5cOEg+kijfMUaFDYx835qxVEn/NO4CRdNIV1hXhLi6O
 rrlxk+4D9lTSqnIgV2F/N+SXbUbcjK/Jzijiqx247t8iDkut1B0x8qPdt36ZE01G1QZW
 /5R0EoDpcDbcFNpofc0nZGeQSzfXDpRT+ZaQn6YmnNmhgSospP8Ca2nKXFCRIl9L06qc
 0O0Hf1tAT1axF1D8RPs/Aprow4ZU5Du+LmsxjuIoYb/wQtuBG8ejJ4PRaBaX6KY3PrTK
 u6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nOU74MfLltUT+h+F/CrT1EH2iRW8ZoWBGIJbj4ikcZg=;
 b=wtohQJ0f5xw6wG6+Nu0cNzBu58OJn0PZ+4nOmf0Dol3k9iGEhgJCDrLe8WvngheqIy
 3bJiO8x6nbQzKT/tsQHPoLv8a4Wq8DplVv99hOfuFlIWknEKQtVYYDUhvm4SINucogaY
 9UWUzjikrLkV09PtSMje57hNlXJ+fPtud7bHiM63I37cfOGPMwyJhM8MsQVPIcO7C2Ug
 f/0xxEUprEHv9zF6iyDoOAhv9WKoq1RLyLdkkaFMyypEcdBPx/WJl6bfOhZMYKVNKOd+
 2i8kGYGpHQFGz64kHl/ZSbgk8TvViIMbJtZAkAGzIovvhm0KDNnhUrG4NlXEZUdKm5ET
 QQ0Q==
X-Gm-Message-State: AFqh2krqS7QrINnI1UZQPFH6zmoKeM89mHwRyf27qVGCL9pZgidkVHUx
 O5x0hI7N2Ldl846LWSkh2awpw4DyC8bry/WBRQc=
X-Google-Smtp-Source: AMrXdXt0/0Yzb/5d06C0pGHF7OeoMwC1Beik/HhdgRVorPYXTJ/t6Z10/P3fO3icF9eUsmYUsIHQhJSZPSADJk9q0Qw=
X-Received: by 2002:a05:6870:c59c:b0:150:d9aa:4011 with SMTP id
 ba28-20020a056870c59c00b00150d9aa4011mr1145315oab.96.1673019554943; Fri, 06
 Jan 2023 07:39:14 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
In-Reply-To: <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 Jan 2023 10:39:03 -0500
Message-ID: <CADnq5_PtJ2JxAH7vaQsMHomUmiAxhiOqn4suf1SAQkaqt=sg+g@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, 
 "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Dec 27, 2022 at 10:34 AM Geert Uytterhoeven wrote:
 > > On Tue, 27 Dec 2022, Geert Uytterhoeven wrote: > > Below is the list
 of build error/warning regressions/improvements in > > v6.2-rc1[1] [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [alexdeucher[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.41 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pDooS-0008FQ-IX
Subject: Re: [f2fs-dev] Build regressions/improvements in v6.2-rc1
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
Cc: linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mips@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-f2fs-devel@lists.sourceforge.net,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBEZWMgMjcsIDIwMjIgYXQgMTA6MzQgQU0gR2VlcnQgVXl0dGVyaG9ldmVuCjxnZWVy
dEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIDI3IERlYyAyMDIyLCBHZWVydCBV
eXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiBCZWxvdyBpcyB0aGUgbGlzdCBvZiBidWlsZCBlcnJvci93
YXJuaW5nIHJlZ3Jlc3Npb25zL2ltcHJvdmVtZW50cyBpbgo+ID4gdjYuMi1yYzFbMV0gY29tcGFy
ZWQgdG8gdjYuMVsyXS4KPiA+Cj4gPiBTdW1tYXJpemVkOgo+ID4gIC0gYnVpbGQgZXJyb3JzOiAr
MTEvLTEzCj4KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IGxp
bnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZwo+IGxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3Jn
Cj4gbGludXgtc2hAdmdlci5rZXJuZWwub3JnCj4gbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKPiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+IGthc2FuLWRldkBn
b29nbGVncm91cHMuY29tCj4gbGludXgteHRlbnNhQGxpbnV4LXh0ZW5zYS5vcmcKPgo+ICAgICsg
L2tpc3NrYi9zcmMvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kbWwv
ZGNuMzEvZGlzcGxheV9tb2RlX3ZiYV8zMS5jOiBlcnJvcjogdGhlIGZyYW1lIHNpemUgb2YgMjIy
NCBieXRlcyBpcyBsYXJnZXIgdGhhbiAyMDQ4IGJ5dGVzIFstV2Vycm9yPWZyYW1lLWxhcmdlci10
aGFuPV06ICA9PiA3MDgyOjEKPiAgICArIC9raXNza2Ivc3JjL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZG1sL2RjbjMxNC9kaXNwbGF5X21vZGVfdmJhXzMxNC5jOiBl
cnJvcjogdGhlIGZyYW1lIHNpemUgb2YgMjIwOCBieXRlcyBpcyBsYXJnZXIgdGhhbiAyMDQ4IGJ5
dGVzIFstV2Vycm9yPWZyYW1lLWxhcmdlci10aGFuPV06ICA9PiA3MTI3OjEKPgoKQFNpcXVlaXJh
LCBSb2RyaWdvIEBNYWhmb296LCBIYW16YQoKQ2FuIHlvdSB0YWtlIGEgbG9vayBhdCBmaXhpbmcg
dGhlIERNTCBzdGFjayBzaXplIGhlcmUgdXA/CgpBbGV4CgoKPiBhcm02NC1nY2M1L2FybTY0LWFs
bG1vZGNvbmZpZwo+Cj4gICAgKyAva2lzc2tiL3NyYy9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254
cC9pbXgtanBlZy9teGMtanBlZy5jOiBlcnJvcjogYXJyYXkgc3Vic2NyaXB0IDIgaXMgYWJvdmUg
YXJyYXkgYm91bmRzIG9mICd1MzJbMl0nIHtha2EgJ3Vuc2lnbmVkIGludFsyXSd9IFstV2Vycm9y
PWFycmF5LWJvdW5kc106ICA9PiA2NDE6MjgKPiAgICArIC9raXNza2Ivc3JjL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbnhwL2lteC1qcGVnL214Yy1qcGVnLmM6IGVycm9yOiBhcnJheSBzdWJzY3Jp
cHQgMyBpcyBhYm92ZSBhcnJheSBib3VuZHMgb2YgJ3UzMlsyXScge2FrYSAndW5zaWduZWQgaW50
WzJdJ30gWy1XZXJyb3I9YXJyYXktYm91bmRzXTogID0+IDY0MToyOAo+Cj4gbTY4ay1nY2M4L202
OGstYWxsbW9kY29uZmlnCj4gU2VlIGFsc28gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NB
TXVITWRXcFBYMm1wcUZFV2pqYmpzUXZEQlFPWHlqamRwS25RdTlxVVJBdVZaWG1Nd0BtYWlsLmdt
YWlsLmNvbQo+Cj4gICAgKyAva2lzc2tiL3NyYy9pbmNsdWRlL2xpbnV4L2JpdGZpZWxkLmg6IGVy
cm9yOiBjYWxsIHRvICdfX2ZpZWxkX292ZXJmbG93JyBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSBl
cnJvcjogdmFsdWUgZG9lc24ndCBmaXQgaW50byBtYXNrOiAgPT4gMTUxOjMKPgo+IEluIGZ1bmN0
aW9uICd1MzJfZW5jb2RlX2JpdHMnLAo+ICAgICAgaW5saW5lZCBmcm9tICdpZWVlODAyMTFfbWxv
X211bHRpY2FzdF90eCcgYXQgL2tpc3NrYi9zcmMvbmV0L21hYzgwMjExL3R4LmM6NDQzNToxNywK
PiAgICAgIGlubGluZWQgZnJvbSAnaWVlZTgwMjExX3N1YmlmX3N0YXJ0X3htaXQnIGF0IC9raXNz
a2Ivc3JjL25ldC9tYWM4MDIxMS90eC5jOjQ0ODM6MzoKPgo+IG1pcHNlbC1nY2M1L21pcHMtYWxs
bW9kY29uZmlnCj4KPiAgICArIC9raXNza2Ivc3JjL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlw
ZXMuaDogZXJyb3I6IGNhbGwgdG8gJ19fY29tcGlsZXRpbWVfYXNzZXJ0XzI2MicgZGVjbGFyZWQg
d2l0aCBhdHRyaWJ1dGUgZXJyb3I6IFVuc3VwcG9ydGVkIGFjY2VzcyBzaXplIGZvciB7UkVBRCxX
UklURX1fT05DRSgpLjogID0+IDM1ODo0NQo+ICAgICsgL2tpc3NrYi9zcmMvaW5jbHVkZS9saW51
eC9jb21waWxlcl90eXBlcy5oOiBlcnJvcjogY2FsbCB0byAnX19jb21waWxldGltZV9hc3NlcnRf
MjYzJyBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSBlcnJvcjogVW5zdXBwb3J0ZWQgYWNjZXNzIHNp
emUgZm9yIHtSRUFELFdSSVRFfV9PTkNFKCkuOiAgPT4gMzU4OjQ1Cj4KPiBJbiBmdW5jdGlvbiAn
Zm9sbG93X3BtZF9tYXNrJywKPiAgICAgIGlubGluZWQgZnJvbSAnZm9sbG93X3B1ZF9tYXNrJyBh
dCAva2lzc2tiL3NyYy9tbS9ndXAuYzo3MzU6OSwKPiAgICAgIGlubGluZWQgZnJvbSAnZm9sbG93
X3A0ZF9tYXNrJyBhdCAva2lzc2tiL3NyYy9tbS9ndXAuYzo3NTI6OSwKPiAgICAgIGlubGluZWQg
ZnJvbSAnZm9sbG93X3BhZ2VfbWFzaycgYXQgL2tpc3NrYi9zcmMvbW0vZ3VwLmM6ODA5Ojk6Cj4K
PiBzaDQtZ2NjMTEvc2gtZGVmY29uZmlnIChHw7xudGVyIHdvbmRlcmVkIGlmIHBtZF90IHNob3Vs
ZCB1c2UgdW5pb24pCj4KPiAgICArIC9raXNza2Ivc3JjL2luY2x1ZGUvbGludXgvZm9ydGlmeS1z
dHJpbmcuaDogZXJyb3I6ICdfX2J1aWx0aW5fbWVtY3B5JyBvZmZzZXQgWzAsIDEyN10gaXMgb3V0
IG9mIHRoZSBib3VuZHMgWzAsIDBdIFstV2Vycm9yPWFycmF5LWJvdW5kc106ICA9PiA1NzozMwo+
Cj4gL2tpc3NrYi9zcmMvYXJjaC9zMzkwL2tlcm5lbC9zZXR1cC5jOiBJbiBmdW5jdGlvbiAnc2V0
dXBfbG93Y29yZV9kYXRfb24nOgo+IHMzOTB4LWdjYzExL3MzOTAtYWxse21vZCx5ZXN9Y29uZmln
Cj4KPiAgICArIC9raXNza2Ivc3JjL2luY2x1ZGUvbGludXgvZm9ydGlmeS1zdHJpbmcuaDogZXJy
b3I6ICdfX2J1aWx0aW5fbWVtc2V0JyBwb2ludGVyIG92ZXJmbG93IGJldHdlZW4gb2Zmc2V0IFsy
OCwgODk4MjkzODE0XSBhbmQgc2l6ZSBbLTg5ODI5Mzc4NywgLTFdIFstV2Vycm9yPWFycmF5LWJv
dW5kc106ICA9PiA1OTozMwo+Cj4gL2tpc3NrYi9zcmMvZnMvZjJmcy9pbmxpbmUuYzogSW4gZnVu
Y3Rpb24gJ2YyZnNfbW92ZV9pbmxpbmVfZGlyZW50cyc6Cj4KPiBwb3dlcnBjLWdjYzExL3BwYzY0
X2Jvb2szZV9hbGxtb2Rjb25maWcKPiBwb3dlcnBjLWdjYzExL3Bvd2VycGMtYWxse21vZCx5ZXN9
Y29uZmlnCj4KPiAgICArIC9raXNza2Ivc3JjL2tlcm5lbC9rY3Nhbi9rY3Nhbl90ZXN0LmM6IGVy
cm9yOiB0aGUgZnJhbWUgc2l6ZSBvZiAxNjgwIGJ5dGVzIGlzIGxhcmdlciB0aGFuIDE1MzYgYnl0
ZXMgWy1XZXJyb3I9ZnJhbWUtbGFyZ2VyLXRoYW49XTogID0+IDI1NzoxCj4KPiB4dGVuc2EtZ2Nj
MTEveHRlbnNhLWFsbG1vZGNvbmZpZyAocGF0Y2ggYXZhaWxhYmxlKQo+Cj4gICAgKyB7c3RhbmRh
cmQgaW5wdXR9OiBFcnJvcjogdW5rbm93biBwc2V1ZG8tb3A6IGAuY2ZpX2RlZl9jJzogID0+IDE3
MTgKPgo+IHNoNC1nY2MxMS9zaC1hbGxtb2Rjb25maWcgKElDRSA9IGludGVybmFsIGNvbXBpbGVy
IGVycm9yKQo+Cj4gPiBbMV0gaHR0cDovL2tpc3NrYi5lbGxlcm1hbi5pZC5hdS9raXNza2IvYnJh
bmNoL2xpbnVzL2hlYWQvMWI5MjljMDJhZmQzNzg3MWQ1YWZiOWQ0OTg0MjZmODM0MzJlNzFjMi8g
KGFsbCAxNTIgY29uZmlncykKPiA+IFsyXSBodHRwOi8va2lzc2tiLmVsbGVybWFuLmlkLmF1L2tp
c3NrYi9icmFuY2gvbGludXMvaGVhZC84MzBiM2M2OGMxZmIxZTkxNzYwMjhkMDJlZjg2ZjNjZjc2
YWEyNDc2LyAoYWxsIDE1MiBjb25maWdzKQo+Cj4gR3J7b2V0amUsZWV0aW5nfXMsCj4KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydAo+Cj4gLS0K
PiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMy
IC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCj4KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cj4gd2hlbiBJ
J20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21l
dGhpbmcgbGlrZSB0aGF0Lgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
