Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 524542CE6A6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 04:43:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kl20X-0003ip-QL; Fri, 04 Dec 2020 03:43:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kl20W-0003ih-S5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 03:43:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gWJppt1udYQQeW4uGML9hDSCvSJGKtR5Pb4awjBzTJU=; b=YZQ2PlWEOIlp8QwUl3kW3w8aLV
 F3PQrd3iG9lU8/nVxl9Z6G3NAgiw0B720CMu9DLh+jGKGLnXz4D3bf/tXqoh/jeBkmpcSCqQ1eEfP
 vGcqOUkV/WjFBkoBy61L+6WF6kxUMJLi3eZZtsjnpRTjZHjX10hMpSmBtm0nJM+TXpcE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gWJppt1udYQQeW4uGML9hDSCvSJGKtR5Pb4awjBzTJU=; b=cCHO3njrdBAl+jRvJ+rKn4/cGC
 GMircH5F6IBE/UOAZOPE4aVOD7OaI2R3u9QJ22MPo1Wihr3zGRSXp1INztA87b6lZYZrjyjo+81VZ
 jAy22GBRbLHiMr1AQZFVYNV6aZSfXI24+Mg9aPlU2hRa7UHZSvLM9PTp261tOuWqoML8=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kl20T-0011Tq-5r
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 03:43:44 +0000
Received: by mail-lf1-f65.google.com with SMTP id l11so5859769lfg.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Dec 2020 19:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gWJppt1udYQQeW4uGML9hDSCvSJGKtR5Pb4awjBzTJU=;
 b=OHeL8X1iRMBjDf9NetzGmz04p+DWn5SewE3USyr9SoLDIh+/sFp0OP6SoHCVWWCN3x
 ag4ejFQHAZl6qgzphD6qz0IjKLddUxjw6Y5INYTIMmsWELd75BdVo3Ra5Do6dp+HC+kQ
 hQZ1lrFhaMZvUbeijh45WWT1HYl6u5/cxtpqHpdyyDbYGUTQQM1cVdESjD9DaY+UcUJe
 3BEzigJCAY/QjDcusWZtvHGWUfqs+LSB4cXSsKTZDgZ5msfB0mk3QJICyU4KsPJ9yZAo
 WBVLnPhcou31Fi6hlVu3JSMLwqelcDfNOrB8LALFK1hFEbx5yKlX05Hw9umwwIaMqPDe
 ipNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gWJppt1udYQQeW4uGML9hDSCvSJGKtR5Pb4awjBzTJU=;
 b=WgJdz1WxGNkvyGe4X/Y1vq+5QqCrApQycBc9AUJI9fCnSfmoetBzQlV9u61PcHeIJh
 iT0UAoY4Mfvh2X/qReIeEWN6s58LgIu9IZ3jOSDd4KWLW8IS64KMqKfr6Ins2CsxKems
 qPCbLNIVHGmioGD33gfXBF+sncnM2Xx4bgo8s94q50CnxJsZ8jpoD7tdeOkYzwHhHtdm
 +12iaCs9Em20NDKeXM0HhT4cXYO3+5NYD1tsX2ctLNbIzQXPh4ieVZbAZ3BqESDovgEt
 WonjbGZkZspD/EqyzhGqPBi64490K5YnFYLVHMxUBdY1TRCPZR7LvfAeF/RSDJL5qRSS
 VihQ==
X-Gm-Message-State: AOAM5330q2LihBnn9ByWveKoTHSH4pfyGtKcSsa3WJciAAtBifV/IsTr
 nre+GIQ11Mbx+PwmDFtebO0tjFS/2i50Fk4wm+I=
X-Google-Smtp-Source: ABdhPJyoICtH1jPOqijPSZsG9CLRcNKMeQFZsKF/5yrs1eYz2Eb9dPPjHpUYM2VYDExFyu+Wdyr9OeNA2wQ18aNrjC0=
X-Received: by 2002:a19:7dc4:: with SMTP id y187mr2514294lfc.326.1607053414500; 
 Thu, 03 Dec 2020 19:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20201204005847.654074-1-daeho43@gmail.com>
 <X8msy1T8uqZ4Z/iR@sol.localdomain>
In-Reply-To: <X8msy1T8uqZ4Z/iR@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 4 Dec 2020 12:43:23 +0900
Message-ID: <CACOAw_wTFsfgLfrWKRoM1o_HQorJE-=2ztZftQTn+comcpmHxQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kl20T-0011Tq-5r
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix race of pending_pages in
 decompression
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

U1RFUF9WRVJJVFkgaXMgZW5hYmxlZCBieSBmMmZzX25lZWRfdmVyaXR5KCkgYW5kIHRoZSBmdW5j
dGlvbiBpcyBsaWtlIGJlbG93LgpXZSBhbHJlYWR5IGtub3cgdGhlIHNlY29uZCBjb25kaXRpb24g
KGlkeCA8IERJVl9ST1VORF9VUC4uLikgaXMKc2F0aXNmaWVkIHdoZW4gaW52b2tpbmcgZjJmc19h
bGxvY19kaWMoKS4KCnN0YXRpYyBpbmxpbmUgYm9vbCBmMmZzX25lZWRfdmVyaXR5KGNvbnN0IHN0
cnVjdCBpbm9kZSAqaW5vZGUsIHBnb2ZmX3QgaWR4KQp7CiAgICAgICAgcmV0dXJuIGZzdmVyaXR5
X2FjdGl2ZShpbm9kZSkgJiYKICAgICAgICAgICAgICAgaWR4IDwgRElWX1JPVU5EX1VQKGlub2Rl
LT5pX3NpemUsIFBBR0VfU0laRSk7Cn0KCjIwMjDrhYQgMTLsm5QgNOydvCAo6riIKSDsmKTtm4Qg
MTI6MjgsIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz7ri5jsnbQg7J6R7ISxOgo+
Cj4gT24gRnJpLCBEZWMgMDQsIDIwMjAgYXQgMDk6NTg6NDdBTSArMDkwMCwgRGFlaG8gSmVvbmcg
d3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jb21wcmVzcy5jIGIvZnMvZjJmcy9jb21w
cmVzcy5jCj4gPiBpbmRleCA4NzA5MGRhODY5M2QuLmNkZjcyZTE1M2RhMCAxMDA2NDQKPiA+IC0t
LSBhL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4gKysrIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4gPiBA
QCAtODAzLDggKzgwMyw2IEBAIHZvaWQgZjJmc19kZWNvbXByZXNzX3BhZ2VzKHN0cnVjdCBiaW8g
KmJpbywgc3RydWN0IHBhZ2UgKnBhZ2UsIGJvb2wgdmVyaXR5KQo+ID4gICAgICAgaWYgKGNvcHMt
PmRlc3Ryb3lfZGVjb21wcmVzc19jdHgpCj4gPiAgICAgICAgICAgICAgIGNvcHMtPmRlc3Ryb3lf
ZGVjb21wcmVzc19jdHgoZGljKTsKPiA+ICBvdXRfZnJlZV9kaWM6Cj4gPiAtICAgICBpZiAodmVy
aXR5KQo+ID4gLSAgICAgICAgICAgICBhdG9taWNfc2V0KCZkaWMtPnBlbmRpbmdfcGFnZXMsIGRp
Yy0+bnJfY3BhZ2VzKTsKPiA+ICAgICAgIGlmICghdmVyaXR5KQo+ID4gICAgICAgICAgICAgICBm
MmZzX2RlY29tcHJlc3NfZW5kX2lvKGRpYy0+cnBhZ2VzLCBkaWMtPmNsdXN0ZXJfc2l6ZSwKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0LCBmYWxzZSk7Cj4gPiBAQCAtMTQ5OCw2ICsxNDk2LDggQEAgc3RydWN0IGRlY29t
cHJlc3NfaW9fY3R4ICpmMmZzX2FsbG9jX2RpYyhzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYykKPiA+
ICAgICAgIGRpYy0+bWFnaWMgPSBGMkZTX0NPTVBSRVNTRURfUEFHRV9NQUdJQzsKPiA+ICAgICAg
IGRpYy0+aW5vZGUgPSBjYy0+aW5vZGU7Cj4gPiAgICAgICBhdG9taWNfc2V0KCZkaWMtPnBlbmRp
bmdfcGFnZXMsIGNjLT5ucl9jcGFnZXMpOwo+ID4gKyAgICAgaWYgKGZzdmVyaXR5X2FjdGl2ZShj
Yy0+aW5vZGUpKQo+ID4gKyAgICAgICAgICAgICBhdG9taWNfc2V0KCZkaWMtPnZlcml0eV9wYWdl
cywgY2MtPm5yX2NwYWdlcyk7Cj4gPiAgICAgICBkaWMtPmNsdXN0ZXJfaWR4ID0gY2MtPmNsdXN0
ZXJfaWR4Owo+ID4gICAgICAgZGljLT5jbHVzdGVyX3NpemUgPSBjYy0+Y2x1c3Rlcl9zaXplOwo+
ID4gICAgICAgZGljLT5sb2dfY2x1c3Rlcl9zaXplID0gY2MtPmxvZ19jbHVzdGVyX3NpemU7Cj4K
PiBUaGUgY2hlY2sgZm9yIGZzdmVyaXR5X2FjdGl2ZSgpIGlzIHdyb25nLiAgSXQgbG9va3MgbGlr
ZSB5b3UgbmVlZCB0byBrbm93Cj4gd2hldGhlciB0aGUgYmlvIG5lZWRzIHRvIGdvIHRocm91Z2gg
dGhlIGZzLXZlcml0eSBkYXRhIHZlcmlmaWNhdGlvbi4gIFRoZQo+IGNvcnJlY3Qgd2F5IHRvIGRl
dGVybWluZSB0aGF0IGlzIHRvIGNoZWNrIHdoZXRoZXIgU1RFUF9WRVJJVFkgaXMgZW5hYmxlZCBp
biB0aGUKPiBiaW8ncyBiaW9fcG9zdF9yZWFkX2N0eC4gIEl0J3Mgc2V0IGJ5IGYyZnNfZ3JhYl9y
ZWFkX2JpbygpIHdoZW4gbmVlZGVkLgo+Cj4gLSBFcmljCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
