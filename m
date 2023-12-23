Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2761781D2AD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Dec 2023 07:23:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rGvPi-0006i0-80;
	Sat, 23 Dec 2023 06:23:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1rGvPh-0006ht-2C
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Dec 2023 06:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jdy/jEn9rjZcaWc0z9psfXWLkfhGOHPMtnjcr7zVpzU=; b=CqODzDc0vpkeXE4j2x3boxfRJU
 6PQhgBryWpAQiZX37MxNZ2osuNODWQlMDGEIczqwrFpmMdQnBts33RBl978l5jKS3NE15qBv7nWLu
 He5vIpp1a90KZt3tEdJdGuYzqDBsVgLjpSQO/k4jzZUagjgmzO5pGWVbCIt2c9VajxYo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jdy/jEn9rjZcaWc0z9psfXWLkfhGOHPMtnjcr7zVpzU=; b=H/BC1Mt5KzETLy4fPnFvYfsrai
 ZagsKTACjTVwsuKq/x1qcTBr3al+XuxAt+Zd20PoeRotshvVIYyMgu2+4O8U3Z04dZLldhSuClEv6
 6ldja0yIsPEaioIH3o19rnE6/xAibhuY41VXB2nMOxOcy1cvcARSlMBgfoqA6FvKiyEo=;
Received: from mail-qv1-f44.google.com ([209.85.219.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rGvPc-0003jW-D1 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Dec 2023 06:23:08 +0000
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-67ad5b37147so15735446d6.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Dec 2023 22:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703312573; x=1703917373; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jdy/jEn9rjZcaWc0z9psfXWLkfhGOHPMtnjcr7zVpzU=;
 b=MR0llYW5yA7ulz5nseAQczI/kMNiVizztWjbyI5A62iNEBchVgg++wYM7SaNLV4GPR
 Hv4TEgDXxHybzqIJhDwLdbGNr120ACjdFyG2UbXcGN7lYyEEjbzPg2Vj4PJ4hzEMHdlj
 6KgjKfZ3AL2d5Lm+cqHFX3beechfc43f4S7t6HLMShD2ItAvAJQMK0TIF/TJeM6WrLOq
 8DqnaKiLzjR0H3J54L7Vdyk32ZqEM2hxZpkd7kFjNSFGinLfidPflPiCoy7lepqwNFkZ
 0J0KVRebVk/rkcIJoj5Hs3bsC7hW9DWe9AuWGaOgq6ATodInKurOFBUQDvhYXTr025/3
 buWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703312573; x=1703917373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jdy/jEn9rjZcaWc0z9psfXWLkfhGOHPMtnjcr7zVpzU=;
 b=dg/AbYfQQXaGfLJpluFsOdaq5yUHScFCFwXV11LUAha321ukhvez08CuzCZzPYuMa8
 0TzCg/Ub/3DjQ0tioFbMGcKnCLiw8LP0u87kG8bQtiyxAW4zqjqa5Y/d7bpw7XVCeKet
 tNmBaLG4dAz/OH8I7683X2+T5jynjWNC1Cu9C6Sn9pOSUY1OzDfSo+Oapw/NuSh83pwY
 dXLiiHuAZpu9KW8hUqojpq/jarAyLzoBc3lgKJ3J89V0OjFc5QhE6vfRfaD7WOrY/40i
 rGaPup7vKz5d2C9FxZbQ2pFmGVx2LAR5Mqgxco5cCWuhvAy9deLX4tGDutTyfGZxzev0
 D7AA==
X-Gm-Message-State: AOJu0YzINpgzkkTAcnBARlMmya2CH4nka4SjSI9E8xteJglKQqtUGu7B
 0ufsw+ZYdKnx2ehfYbOjYdrS5cLbw71QzyWd6gs=
X-Google-Smtp-Source: AGHT+IEbpHx0UjQt0tA2wOgdSg4sPIFGOPPWcYwiG8Jt0Z/j1OXlw5MMd1Q0/mII/unVN8S7cWkwBlwQ5BFmKEWEb74=
X-Received: by 2002:ad4:5c83:0:b0:67f:568d:2914 with SMTP id
 o3-20020ad45c83000000b0067f568d2914mr4869054qvh.46.1703312573502; Fri, 22 Dec
 2023 22:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20231215211608.6449-1-krisman@suse.de>
 <20231219231222.GI38652@quark.localdomain>
 <87a5q1eecy.fsf_-_@mailhost.krisman.be>
 <CAOQ4uxjhWPB6W+EFyuE-eYbLHehOGRLSfs6K62+h8-f9izJG-A@mail.gmail.com>
In-Reply-To: <CAOQ4uxjhWPB6W+EFyuE-eYbLHehOGRLSfs6K62+h8-f9izJG-A@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 23 Dec 2023 08:22:42 +0200
Message-ID: <CAOQ4uxgiZwQf9cHn6p5j6FFO4Hre4dJF1a-7ss+6A64hFJPt2g@mail.gmail.com>
To: Gabriel Krisman Bertazi <krisman@suse.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  [CC: overlayfs] On Sat, Dec 23, 2023 at 8:20 AM Amir Goldstein
    wrote: > > On Sat, Dec 23, 2023 at 6:23 AM Gabriel Krisman Bertazi wrote:
    > > > > Eric Biggers writes: > > > > > On Fri, Dec 15, 2023 at 04:16: [...]
    
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [amir73il[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.219.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rGvPc-0003jW-D1
Subject: Re: [f2fs-dev] [PATCH] ovl: Reject mounting case-insensitive
 filesystems
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
Cc: tytso@mit.edu, Miklos Szeredi <miklos@szeredi.hu>,
 overlayfs <linux-unionfs@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

W0NDOiBvdmVybGF5ZnNdCgpPbiBTYXQsIERlYyAyMywgMjAyMyBhdCA4OjIw4oCvQU0gQW1pciBH
b2xkc3RlaW4gPGFtaXI3M2lsQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIERlYyAyMywg
MjAyMyBhdCA2OjIz4oCvQU0gR2FicmllbCBLcmlzbWFuIEJlcnRhemkgPGtyaXNtYW5Ac3VzZS5k
ZT4gd3JvdGU6Cj4gPgo+ID4gRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0BrZXJuZWwub3JnPiB3cml0
ZXM6Cj4gPgo+ID4gPiBPbiBGcmksIERlYyAxNSwgMjAyMyBhdCAwNDoxNjowMFBNIC0wNTAwLCBH
YWJyaWVsIEtyaXNtYW4gQmVydGF6aSB3cm90ZToKPiA+ID4+IFtBcG9sb2dpZXMgZm9yIHRoZSBx
dWljayBzcGluIG9mIGEgdjIuICBUaGUgb25seSBkaWZmZXJlbmNlIGFyZSBhIGNvdXBsZQo+ID4g
Pj4gZml4ZXMgdG8gdGhlIGJ1aWxkIHdoZW4gQ09ORklHX1VOSUNPREU9biBjYXVnaHQgYnkgTEtQ
IGFuZCBkZXRhaWxlZCBpbgo+ID4gPj4gZWFjaCBwYXRjaCBjaGFuZ2Vsb2cuXQo+ID4gPj4KPiA+
ID4+IFdoZW4gY2FzZS1pbnNlbnNpdGl2ZSBhbmQgZnNjcnlwdCB3ZXJlIGFkYXB0ZWQgdG8gd29y
ayB0b2dldGhlciwgd2UgbW92ZWQgdGhlCj4gPiA+PiBjb2RlIHRoYXQgc2V0cyB0aGUgZGVudHJ5
IG9wZXJhdGlvbnMgZm9yIGNhc2UtaW5zZW5zaXRpdmUgZGVudHJpZXMoZF9oYXNoIGFuZAo+ID4g
Pj4gZF9jb21wYXJlKSB0byBoYXBwZW4gZnJvbSBhIGhlbHBlciBpbnNpZGUgLT5sb29rdXAuICBU
aGlzIGlzIGJlY2F1c2UgZnNjcnlwdAo+ID4gPj4gd2FudHMgdG8gc2V0IGRfcmV2YWxpZGF0ZSBv
bmx5IG9uIHNvbWUgZGVudHJpZXMsIHNvIGl0IGRvZXMgaXQgb25seSBmb3IgdGhlbSBpbgo+ID4g
Pj4gZF9yZXZhbGlkYXRlLgo+ID4gPj4KPiA+ID4+IEJ1dCwgY2FzZS1pbnNlbnNpdGl2ZSBob29r
cyBhcmUgYWN0dWFsbHkgc2V0IG9uIGFsbCBkZW50cmllcyBpbiB0aGUgZmlsZXN5c3RlbSwKPiA+
ID4+IHNvIHRoZWFuZGFuZCBuYXR1cmFsIHBsYWNlIHRvIGRvIGl0IGlzIHRocm91Z2ggc19kX29w
IGFuZCBsZXQgZF9hbGxvYyBoYW5kbGUgaXQgWzFdLgo+ID4gPj4gSW4gYWRkaXRpb24sIGRvaW5n
IGl0IGluc2lkZSB0aGUgLT5sb29rdXAgaXMgYSBwcm9ibGVtIGZvciBjYXNlLWluc2Vuc2l0aXZl
Cj4gPiA+PiBkZW50cmllcyB0aGF0IGFyZSBub3QgY3JlYXRlZCB0aHJvdWdoIC0+bG9va3VwLCBs
aWtlIHRob3NlIGNvbWluZwo+ID4gPj4gb3Blbi1ieS1maGFuZGxlWzJdLCB3aGljaCB3aWxsIG5v
dCBzZWUgdGhlIHJlcXVpcmVkIGRfb3BzLgo+ID4gPj4KPiA+ID4+IFRoaXMgcGF0Y2hzZXQgdGhl
cmVmb3JlIHJldmVydHMgdG8gdXNpbmcgc2ItPnNfZF9vcCB0byBzZXQgdGhlIGRlbnRyeSBvcGVy
YXRpb25zCj4gPiA+PiBmb3IgY2FzZS1pbnNlbnNpdGl2ZSBmaWxlc3lzdGVtcy4gIEluIG9yZGVy
IHRvIHNldCBjYXNlLWluc2Vuc2l0aXZlIGhvb2tzIGVhcmx5Cj4gPiA+PiBhbmQgbm90IHJlcXVp
cmUgZXZlcnkgZGVudHJ5IHRvIGhhdmUgZF9yZXZhbGlkYXRlIGluIGNhc2UtaW5zZW5zaXRpdmUK
PiA+ID4+IGZpbGVzeXN0ZW1zLCBpdCBpbnRyb2R1Y2VzIGEgcGF0Y2ggc3VnZ2VzdGVkIGJ5IEFs
IFZpcm8gdG8gZGlzYWJsZSBkX3JldmFsaWRhdGUKPiA+ID4+IG9uIHNvbWUgZGVudHJpZXMgb24g
dGhlIGZseS4KPiA+ID4+Cj4gPiA+PiBJdCBzdXJ2aXZlcyBmc3Rlc3RzIGVuY3J5cHQgYW5kIHF1
aWNrIGdyb3VwcyB3aXRob3V0IHJlZ3Jlc3Npb25zLiAgQmFzZWQgb24KPiA+ID4+IHY2LjctcmMx
Lgo+ID4gPj4KPiA+ID4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mc2RldmVs
LzIwMjMxMTIzMTk1MzI3LkdQMzgxNTZAWmVuSVYvCj4gPiA+PiBbMl0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtZnNkZXZlbC8yMDIzMTEyMzE3MTI1NS5HTjM4MTU2QFplbklWLwo+ID4g
Pj4KPiA+ID4+IEdhYnJpZWwgS3Jpc21hbiBCZXJ0YXppICg4KToKPiA+ID4+ICAgZGNhY2hlOiBB
ZGQgaGVscGVyIHRvIGRpc2FibGUgZF9yZXZhbGlkYXRlIGZvciBhIHNwZWNpZmljIGRlbnRyeQo+
ID4gPj4gICBmc2NyeXB0OiBEcm9wIGRfcmV2YWxpZGF0ZSBpZiBrZXkgaXMgYXZhaWxhYmxlCj4g
PiA+PiAgIGxpYmZzOiBNZXJnZSBlbmNyeXB0ZWRfY2lfZGVudHJ5X29wcyBhbmQgY2lfZGVudHJ5
X29wcwo+ID4gPj4gICBsaWJmczogRXhwb3NlIGdlbmVyaWNfY2lfZGVudHJ5X29wcyBvdXRzaWRl
IG9mIGxpYmZzCj4gPiA+PiAgIGV4dDQ6IFNldCB0aGUgY2FzZS1pbnNlbnNpdGl2ZSBkZW50cnkg
b3BlcmF0aW9ucyB0aHJvdWdoIC0+c19kX29wCj4gPiA+PiAgIGYyZnM6IFNldCB0aGUgY2FzZS1p
bnNlbnNpdGl2ZSBkZW50cnkgb3BlcmF0aW9ucyB0aHJvdWdoIC0+c19kX29wCj4gPiA+PiAgIGxp
YmZzOiBEb24ndCBzdXBwb3J0IHNldHRpbmcgY2FzZWZvbGQgb3BlcmF0aW9ucyBkdXJpbmcgbG9v
a3VwCj4gPiA+PiAgIGZzY3J5cHQ6IE1vdmUgZF9yZXZhbGlkYXRlIGNvbmZpZ3VyYXRpb24gYmFj
ayBpbnRvIGZzY3J5cHQKPiA+ID4KPiA+ID4gVGhhbmtzIEdhYnJpZWwsIHRoaXMgc2VyaWVzIGxv
b2tzIGdvb2QuICBTb3JyeSB0aGF0IHdlIG1pc3NlZCB0aGlzIHdoZW4gYWRkaW5nCj4gPiA+IHRo
ZSBzdXBwb3J0IGZvciBlbmNyeXB0K2Nhc2Vmb2xkLgo+ID4gPgo+ID4gPiBJdCdzIHNsaWdodGx5
IGF3a3dhcmQgdGhhdCBzb21lIGxpbmVzIG9mIGNvZGUgYWRkZWQgYnkgcGF0Y2hlcyA1LTYgYXJl
IHJlbW92ZWQKPiA+ID4gaW4gcGF0Y2ggOC4gIFRoZXNlIGNoYW5nZXMgbG9vayB2ZXJ5IGhhcmQg
dG8gc3BsaXQgdXAsIHRob3VnaCwgc28geW91J3ZlCj4gPiA+IHByb2JhYmx5IGRvbmUgYWJvdXQg
dGhlIGJlc3QgdGhhdCBjYW4gYmUgZG9uZS4KPiA+ID4KPiA+ID4gT25lIHF1ZXN0aW9uL3JlcXVl
c3Q6IGJlc2lkZXMgcGVyZm9ybWFuY2UsIHRoZSBvdGhlciByZWFzb24gd2UncmUgc28gY2FyZWZ1
bAo+ID4gPiBhYm91dCBtaW5pbWl6aW5nIHdoZW4gLT5kX3JldmFsaWRhdGUgaXMgc2V0IGZvciBm
c2NyeXB0IGlzIHNvIHRoYXQgb3ZlcmxheWZzCj4gPiA+IHdvcmtzIG9uIGVuY3J5cHRlZCBkaXJl
Y3Rvcmllcy4gIFRoaXMgaXMgYmVjYXVzZSBvdmVybGF5ZnMgaXMgbm90IGNvbXBhdGlibGUKPiA+
ID4gd2l0aCAtPmRfcmV2YWxpZGF0ZS4gIEkgdGhpbmsgeW91ciBzb2x1dGlvbiBzdGlsbCB3b3Jr
cyBmb3IgdGhhdCwgc2luY2UKPiA+ID4gRENBQ0hFX09QX1JFVkFMSURBVEUgd2lsbCBiZSBjbGVh
cmVkIGFmdGVyIHRoZSBmaXJzdCBjYWxsIHRvCj4gPiA+IGZzY3J5cHRfZF9yZXZhbGlkYXRlKCks
IGFuZCB3aGVuIGNoZWNraW5nIGZvciB1c3VwcG9ydGVkIGRlbnRyaWVzIG92ZXJsYXlmcyBkb2Vz
Cj4gPiA+IGluZGVlZCBjaGVjayBmb3IgRENBQ0hFX09QX1JFVkFMSURBVEUgaW5zdGVhZCBvZiAt
PmRfcmV2YWxpZGF0ZSBkaXJlY3RseS4KPiA+ID4gSG93ZXZlciwgdGhhdCBkb2VzIHJlbHkgb24g
dGhhdCB2ZXJ5IGZpcnN0IGNhbGwgdG8gLT5kX3JldmFsaWRhdGUgYWN0dWFsbHkKPiA+ID4gaGFw
cGVuaW5nIGJlZm9yZSB0aGUgY2hlY2sgaXMgZG9uZS4gIEl0IHdvdWxkIGJlIG5pY2UgdG8gdmVy
aWZ5IHRoYXQKPiA+ID4gb3ZlcmxheWZzK2ZzY3J5cHQgaW5kZWVkIGNvbnRpbnVlcyB0byB3b3Jr
LCBhbmQgZXhwbGljaXRseSBtZW50aW9uIHRoaXMKPiA+ID4gc29tZXdoZXJlIChJIGRvbid0IHNl
ZSBhbnkgbWVudGlvbiBvZiBvdmVybGF5ZnMrZnNjcnlwdCBpbiB0aGUgc2VyaWVzKS4KPiA+Cj4g
PiBIaSBFcmljLAo+ID4KPiA+IEZyb20gbXkgdGVzdGluZywgb3ZlcmxheWZzK2ZzY3J5cHQgc2hv
dWxkIHdvcmsgZmluZS4gIEkgdHJpZWQgbW91bnRpbmcKPiA+IGl0IG9uIHRvcCBvZiBlbmNyeXB0
ZWQgZGlyZWN0b3JpZXMsIHdpdGggYW5kIHdpdGhvdXQga2V5LCBhbmQgd2lsbCBhZGQKPiA+IHRo
aXMgaW5mb3JtYXRpb24gdG8gdGhlIGNvbW1pdCBtZXNzYWdlLiAgSWYgd2UgYWRvcHQgdGhlIHN1
Z2dlc3Rpb24gZnJvbQo+ID4gQWwgaW4gdGhlIG90aGVyIHN1YnRocmVhZCwgZXZlbiBiZXR0ZXIs
IHdlIHdvbid0IG5lZWQgdGhlIGZpcnN0Cj4gPiBkX3JldmFsaWRhdGUgdG8gaGFwcGVuIGJlZm9y
ZSB0aGUgY2hlY2ssIHNvIEknbGwgYWRvcHQgdGhhdC4KPiA+Cj4gPiBXaGlsZSBsb29raW5nIGlu
dG8gb3ZlcmxheWZzLCBJIGZvdW5kIGFub3RoZXIgcmVhc29uIHdlIHdvdWxkIG5lZWQgdGhpcwo+
ID4gcGF0Y2hzZXQuICBBIHNpZGUgZWZmZWN0IG9mIG5vdCBjb25maWd1cmluZyAtPmRfb3AgdGhy
b3VnaCBzX2Rfb3AgaXMKPiA+IHRoYXQgdGhlIHJvb3QgZGVudHJ5IHdvbid0IGhhdmUgZF9vcCBz
ZXQuICBXaGlsZSB0aGlzIGlzIGZpbmUgZm9yCj4gPiBjYXNlZm9sZCwgYmVjYXVzZSB3ZSBmb3Ji
aWQgdGhlIHJvb3QgZGlyZWN0b3J5IGZyb20gYmVpbmcKPiA+IGNhc2UtaW5zZW5zaXRpdmUsIHdl
IGNhbiB0cmljayBvdmVybGF5ZnMgaW50byBtb3VudGluZyBhCj4gPiBmaWxlc3lzdGVtIGl0IGNh
bid0IGhhbmRsZS4KPiA+Cj4gPiBFdmVuIHdpdGggdGhpcyBtZXJnZWQsIGFuZCBhcyBDaHJpc3Rp
YW4gc2FpZCBpbiBhbm90aGVyIHRocmVhZCByZWdhcmRpbmcKPiA+IGVjcnlwdGZzLCB3ZSBzaG91
bGQgaGFuZGxlIHRoaXMgZXhwbGljaXRseS4gIFNvbWV0aGluZyBsaWtlIGJlbG93Lgo+ID4KPiA+
IEFtaXIsIHdvdWxkIHlvdSBjb25zaWRlciB0aGlzIGZvciAtcmM4Pwo+Cj4gSUlVQywgdGhpcyBm
aXhlcyBhIHJlZ3Jlc3Npb24gZnJvbSB2NS4xMCB3aXRoIGEgdmVyeSBsb3cgbGlrZWxpaG9vZCBv
Zgo+IGltcGFjdCBvbiBhbnlvbmUgaW4gdGhlIHJlYWwgd29ybGQsIHNvIHdoYXQncyB0aGUgcnVz
aD8KPiBJIHdvdWxkIHJhdGhlciB0aGF0IHlvdSBzZW5kIHRoaXMgZml4IGFsb25nIHdpdGggeW91
ciBwYXRjaCBzZXQuCj4KPiBGZWVsIGZyZWUgdG8gYWRkOgo+Cj4gQWNrZWQtYnk6IEFtaXIgR29s
ZHN0ZWluIDxhbWlyNzNpbEBnbWFpbC5jb20+Cj4KPiBhZnRlciBmaXhpbmcgbml0cyBiZWxvdwo+
Cj4gPgo+ID4gLS0gPjggLS0KPiA+IFN1YmplY3Q6IFtQQVRDSF0gb3ZsOiBSZWplY3QgbW91bnRp
bmcgY2FzZS1pbnNlbnNpdGl2ZSBmaWxlc3lzdGVtcwo+ID4KPiA+IG92ZXJsYXlmcyByZWxpZXMg
b24gdGhlIGZpbGVzeXN0ZW0gc2V0dGluZyBEQ0FDSEVfT1BfSEFTSCBvcgo+ID4gRENBQ0hFX09Q
X0NPTVBBUkUgdG8gcmVqZWN0IG1vdW50aW5nIG92ZXIgY2FzZS1pbnNlbnNpdGl2ZSBkaXJlY3Rv
cmllcy4KPiA+Cj4gPiBTaW5jZSBjb21taXQgYmI5Y2Q5MTA2YjIyICgiZnNjcnlwdDogSGF2ZSBm
aWxlc3lzdGVtcyBoYW5kbGUgdGhlaXIKPiA+IGRfb3BzIiksIHdlIHNldCAtPmRfb3AgdGhyb3Vn
aCBhIGhvb2sgaW4gLT5kX2xvb2t1cCwgd2hpY2gKPiA+IG1lYW5zIHRoZSByb290IGRlbnRyeSB3
b24ndCBoYXZlIHRoZW0sIGNhdXNpbmcgdGhlIG1vdW50IHRvIGFjY2lkZW50YWxseQo+ID4gc3Vj
Y2VlZC4KPiA+Cj4gPiBJbiB2Ni43LXJjNywgdGhlIGZvbGxvd2luZyBzZXF1ZW5jZSB3aWxsIHN1
Y2NlZWQgdG8gbW91bnQsIGJ1dCBhbnkKPiA+IGRlbnRyeSBvdGhlciB0aGFuIHRoZSByb290IGRl
bnRyeSB3aWxsIGJlIGEgIndlaXJkIiBkZW50cnkgdG8gb3ZsIGFuZAo+ID4gZmFpbCB3aXRoIEVS
RU1PVEUuCj4gPgo+ID4gICBta2ZzLmV4dDQgLU8gY2FzZWZvbGQgbG93ZXIuaW1nCj4gPiAgIG1v
dW50IC1PIGxvb3AgbG93ZXIuaW1nIGxvd2VyCj4gPiAgIG1vdW50IC10IG92ZXJsYXkgLW8gbG93
ZXJkaXI9bG93ZXIsdXBwZXJkaXI9dXBwZXIsd29ya2Rpcj13b3JrIG92bCAvbW50Cj4gPgo+ID4g
TW91bnRpbmcgb24gYSBzdWJkaXJlY3RvcnkgZmFpbHMsIGFzIGV4cGVjdGVkLCBiZWNhdXNlIERD
QUNIRV9PUF9IQVNICj4gPiBhbmQgRENBQ0hFX09QX0NPTVBBUkUgYXJlIHByb3Blcmx5IHNldCBi
eSAtPmxvb2t1cC4KPiA+Cj4gPiBGaXggYnkgZXhwbGljaXRseSByZWplY3Rpbmcgc3VwZXJibG9j
a3MgdGhhdCBhbGxvdyBjYXNlLWluc2Vuc2l0aXZlCj4gPiBkZW50cmllcy4KPiA+Cj4gPiBGaXhl
czogYmI5Y2Q5MTA2YjIyICgiZnNjcnlwdDogSGF2ZSBmaWxlc3lzdGVtcyBoYW5kbGUgdGhlaXIg
ZF9vcHMiKQo+ID4gU2lnbmVkLW9mZi1ieTogR2FicmllbCBLcmlzbWFuIEJlcnRhemkgPGtyaXNt
YW5Ac3VzZS5kZT4KPiA+IC0tLQo+ID4gIGZzL292ZXJsYXlmcy9wYXJhbXMuYyB8IDIgKysKPiA+
ICBpbmNsdWRlL2xpbnV4L2ZzLmggICAgfCA5ICsrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9vdmVybGF5ZnMvcGFy
YW1zLmMgYi9mcy9vdmVybGF5ZnMvcGFyYW1zLmMKPiA+IGluZGV4IDNmZTJkZGUxNTk4Zi4uOTk0
OTVmMDc5NjQ0IDEwMDY0NAo+ID4gLS0tIGEvZnMvb3ZlcmxheWZzL3BhcmFtcy5jCj4gPiArKysg
Yi9mcy9vdmVybGF5ZnMvcGFyYW1zLmMKPiA+IEBAIC0yODYsNiArMjg2LDggQEAgc3RhdGljIGlu
dCBvdmxfbW91bnRfZGlyX2NoZWNrKHN0cnVjdCBmc19jb250ZXh0ICpmYywgY29uc3Qgc3RydWN0
IHBhdGggKnBhdGgsCj4gPiAgICAgICAgIGlmICghZF9pc19kaXIocGF0aC0+ZGVudHJ5KSkKPiA+
ICAgICAgICAgICAgICAgICByZXR1cm4gaW52YWxmYyhmYywgIiVzIGlzIG5vdCBhIGRpcmVjdG9y
eSIsIG5hbWUpOwo+ID4KPgo+IFBsZWFzZSBhZGQgYSBjb21tZW50IHRvIGV4cGxhaW4gd2h5IHRo
aXMgaXMgbmVlZGVkIHRvIHByZXZlbnQgcG9zdAo+IG1vdW50IGxvb2t1cCBmYWlsdXJlcy4KPgo+
ID4gKyAgICAgICBpZiAoc2JfaGFzX2VuY29kaW5nKHBhdGgtPm1udC0+bW50X3NiKSkKPiA+ICsg
ICAgICAgICAgICAgICByZXR1cm4gaW52YWxmYyhmYywgImNhc2VsZXNzIGZpbGVzeXN0ZW0gb24g
JXMgbm90IHN1cHBvcnRlZCIsIG5hbWUpOwo+ID4KPgo+IEkgaGF2ZSBub3Qgc2VlbiB5b3UgdXNl
IHRoZSB0ZXJtICJjYXNlbGVzcyIgb24gdGhlIGxpc3Qgc2luY2UgMjAxOC4gb2xkIGhhYml0cz8K
PiBQbGVhc2UgdXNlIHRoZSB0ZXJtICJjYXNlLWluc2Vuc2l0aXZlIiBhbmQgcGxlYXNlIG1vdmUg
dGhlCj4gb3ZsX2RlbnRyeV93ZWlyZCgpIGNoZWNrCj4gYmVsb3cgdGhpcyBvbmUsIGJlY2F1c2Ug
d2hlbiB0cnlpbmcgdG8gbW91bnQgb3ZlcmxheWZzIG92ZXIgbm9uLXJvb3QKPiBjYXNlLWluc2Vu
c2l0aXZlCj4gZGlyZWN0b3J5LCB0aGUgbW9yZSBzcGVjaWZpYyBlcnJvciBtZXNzYWdlIGlzIG1v
cmUgdXNlZnVsLgo+Cj4gVGhhbmtzLAo+IEFtaXIuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
