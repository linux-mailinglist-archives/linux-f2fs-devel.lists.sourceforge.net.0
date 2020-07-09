Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60679219829
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jul 2020 08:00:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtPbx-0001NO-N2; Thu, 09 Jul 2020 06:00:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jtPbu-0001NG-Sc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 06:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZameAAM/OSypxl5eP4NQC+AzJS4YHSZiv1p46+Z9Tu4=; b=lWeqqVWKWeEs7mwnTpWpDw8o6k
 2zikbNy1J7BEeJ+ibFUG9ylxBfcxe74OdFHljNhVi1vWTEMZyc4l2v4HEhZaUw0TuWnOGZ13LUEm5
 D2ErOhjeo6deyLJOJHWfffsYrHvjsYh+Rsvp1/p8qMWAdT72/QS1yLHIJEWMopPREBnQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZameAAM/OSypxl5eP4NQC+AzJS4YHSZiv1p46+Z9Tu4=; b=lZbBkELeKG7Al4dNLKXoXFj81V
 fOTgUjKe1Rji91rgwzF3gPAUdHadrs2SgQTG/1MfqobJMgMHe2nJIOg5DTWKVZarv2F7YNofnRnuD
 F0bIDHxdYSbrrxJSOSgRgAZPuYVtYX8OAtF6lyCCIEH1Tf2kKjO+T4uNfrL/lGd0g/nU=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtPbt-00EoPP-Ec
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 06:00:42 +0000
Received: by mail-lj1-f195.google.com with SMTP id f5so972382ljj.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 08 Jul 2020 23:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZameAAM/OSypxl5eP4NQC+AzJS4YHSZiv1p46+Z9Tu4=;
 b=OaNF3VOdLYAgncGOKs3FAJDYtt5qRwg8iNuVkRLTGMOU+ZRBomDs37eiMoB9nLPry1
 iMcFV7ScGdRdWR+pqyLq5EGwH94XI8ALEW9hfxpmY4Qp0eYUOYmiuNzpwSL3asQDTF+c
 KEFRquXoq/Ppw59TGdgMMaiDVdb3XmoQyxFqb+/qMcyMsmrhGIrqFnIt+g/Aeg+I0XZq
 6iODt0uMPESEZVyI2uY8Tdc1ICfQQbN8yKSS1pPXu5pz9M2HsjZP0YIHw2Ejaqbm9VoA
 SfVjlxeLl57D7n9B/SHGR4F9LYavnspGhADKGFuWg/OxmYvWt7/Sy2jGDm4BWBaSRTyX
 xB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZameAAM/OSypxl5eP4NQC+AzJS4YHSZiv1p46+Z9Tu4=;
 b=QTFUTq5RgT/CKfVOsIN/Bd9MdjCHnBVSq6UrqNw+G86eRDwaCX7wZFl73XmXGiF+zY
 5KBy3akyTQkz7U9roXjsOeo/ixAUb6AYQ4xQoHxa7k5eNyxXd3VuK52NoTCtazbtKrfY
 lNsXVYn/B2OW0Kc7egirIm+uMT4jZIGXLE7mLZ7kkvLDDqwr3v+MED5m+IGE0PX0o2T3
 eZz+AKw3tYvbtec57Iv9UeTPyQ1ep9Onv9gfCT02rg2QTEX5zfujj16SzSMV0YaHB3rB
 bNxQvjGsLeBmG36JHXa6CmGtyX9nnERSaa9S0Ni5lBqh5jwRX3Mo3VwZ7cElYK/vSp5z
 prZg==
X-Gm-Message-State: AOAM530HDgUTmRMsBcTGKEztGsnxgZ5F1RemCgI8fEtSmLAMhNJaV21I
 51CHNzE4Oy+b6diFQHhIsx1kX1hNZGyHcoJce/U=
X-Google-Smtp-Source: ABdhPJwS4iUBMzQ++c1xWQ+RhU6P+J3sMzp3kDtGIUi47HzW2BW3zK2H7U/IYo3JsZV2EzZjK/mtWIBigfFUM7ztPDU=
X-Received: by 2002:a2e:8954:: with SMTP id b20mr33948652ljk.262.1594274434661; 
 Wed, 08 Jul 2020 23:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200709015739.1653668-1-daeho43@gmail.com>
 <619af72b-2f8a-4a84-f73e-ac49989ba79f@huawei.com>
 <20200709053943.GA352648@google.com>
In-Reply-To: <20200709053943.GA352648@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 9 Jul 2020 15:00:23 +0900
Message-ID: <CACOAw_xD08m8p3Hzy-QQJCGUZMgR-3K33hTESGDVESRcaHFyqg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtPbt-00EoPP-Ec
Subject: Re: [f2fs-dev] [PATCH] f2fs: ignore when len of range in
 f2fs_sec_trim_file is zero
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

SSBjYW4gYWRkIGl0fgoKMjAyMOuFhCA37JuUIDnsnbwgKOuqqSkg7Jik7ZuEIDI6MzksIEphZWdl
dWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+64uY7J20IOyekeyEsToKPgo+IE9uIDA3LzA5LCBD
aGFvIFl1IHdyb3RlOgo+ID4gT24gMjAyMC83LzkgOTo1NywgRGFlaG8gSmVvbmcgd3JvdGU6Cj4g
PiA+IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiA+Cj4gPiA+
IFdoZW4gZW5kX2FkZHIgY29tZXMgdG8gemVybywgaXQnbGwgdHJpZ2dlciBkaWZmZXJlbnQgYmVo
YXZpb3VyLgo+ID4gPiBUbyBwcmV2ZW50IHRoaXMsIHdlIG5lZWQgdG8gaWdub3JlIHRoZSBjYXNl
IG9mIHRoYXQgcmFuZ2UubGVuIGlzCj4gPiA+IHplcm8gaW4gdGhlIGZ1bmN0aW9uLgo+ID4gPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+
ID4gPiAtLS0KPiA+ID4gIGZzL2YyZnMvZmlsZS5jIHwgNyArKystLS0tCj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+ID4gPiBpbmRleCAzNjhj
ODBmOGUyYTEuLjk4YjBhOGRiZjY2OSAxMDA2NDQKPiA+ID4gLS0tIGEvZnMvZjJmcy9maWxlLmMK
PiA+ID4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiA+ID4gQEAgLTM4MTMsMTUgKzM4MTMsMTQgQEAg
c3RhdGljIGludCBmMmZzX3NlY190cmltX2ZpbGUoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVk
IGxvbmcgYXJnKQo+ID4gPiAgICAgZmlsZV9zdGFydF93cml0ZShmaWxwKTsKPiA+ID4gICAgIGlu
b2RlX2xvY2soaW5vZGUpOwo+ID4gPgo+ID4gPiAtICAgaWYgKGYyZnNfaXNfYXRvbWljX2ZpbGUo
aW5vZGUpIHx8IGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkgewo+ID4gPiArICAgaWYgKGYy
ZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpIHx8IGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSB8
fAo+ID4gPiArICAgICAgICAgICAgICAgICAgIHJhbmdlLnN0YXJ0ID49IGlub2RlLT5pX3NpemUp
IHsKPiA+ID4gICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+ID4gICAgICAgICAgICAgZ290
byBlcnI7Cj4gPiA+ICAgICB9Cj4gPiA+Cj4gPiA+IC0gICBpZiAocmFuZ2Uuc3RhcnQgPj0gaW5v
ZGUtPmlfc2l6ZSkgewo+ID4gPiAtICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+ID4gPiArICAg
aWYgKHJhbmdlLmxlbiA9PSAwKQo+ID4gPiAgICAgICAgICAgICBnb3RvIGVycjsKPiA+ID4gLSAg
IH0KPiA+ID4KPiA+ID4gICAgIGlmIChpbm9kZS0+aV9zaXplIC0gcmFuZ2Uuc3RhcnQgPCByYW5n
ZS5sZW4pIHsKPiA+ID4gICAgICAgICAgICAgcmV0ID0gLUUyQklHOwo+ID4KPiA+IEhvdyBhYm91
dCB0aGUgY2FzZSB0cmltbWluZyBsYXN0IHBhcnRpYWwgd3JpdHRlbiBibG9jaz8KPiA+Cj4gPiBp
X3NpemUgPSA4MDAwCj4gPiByYW5nZS5zdGFydCA9IDQwOTYKPiA+IHJhbmdlLmxlbiA9IDQwOTYK
PiA+Cj4gPiBEbyB3ZSBuZWVkIHRvIHJvdW5kdXAoaXNpemUsIFBBR0VfU0laRSkgYmVmb3JlIGNv
bXBhcmlzb24/Cj4KPiBJZiB3ZSB3YW50IHRvIHRyaW0gd2hvbGUgZmlsZSwgZG8gd2UgbmVlZCB0
byBnaXZlIHRoZSBleGFjdCBpX3NpemU/Cj4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGdpdmUg
dHJpbSgwLCAtMSk/Cj4KPiA+Cj4gPiBUaGFua3MsCj4gPgo+ID4gPgo+ID4KPiA+Cj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cj4gPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
