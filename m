Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB739260824
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Sep 2020 04:09:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kFT4u-0001pq-DF; Tue, 08 Sep 2020 02:09:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kFT4t-0001pk-5e
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Sep 2020 02:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cw4G1kGPnxVEXDRecH6/IZiKHP/zHsLNMksxLIq354I=; b=BoLvzPBtcsL1kmx7/KWM1ynYg6
 COYXD505UzgeXZ21MxbOz0aogf8/F0aiNOpRDkm1bOOh5+IdZYMjygmW1LPnx75n69Ew1hK9Fv7f0
 3/LoTexcXUNtpBLeKH4tREjdPAzhtdg/SPgIt3yDqGvI7xMdD40mTOSWe4opkG91YPlM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cw4G1kGPnxVEXDRecH6/IZiKHP/zHsLNMksxLIq354I=; b=J1AyFoWnixwVQWJRnRkCo2mj52
 cVNorGKqfjZfRF6LTewdjVvNn70/VnlokrRjDqEixZQC1pVr4vJ2qndLTvqLN8NzbeQl0NRfw3dBY
 TLqa4d1y+RDczqhvGQmqdQAmErJsErioYICTYQFGDtGHsHA7lBCEtgCHFy3Ygou1yIbk=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kFT4o-00G9oR-Dw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Sep 2020 02:09:47 +0000
Received: by mail-lj1-f195.google.com with SMTP id a15so18093313ljk.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Sep 2020 19:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Cw4G1kGPnxVEXDRecH6/IZiKHP/zHsLNMksxLIq354I=;
 b=Rjk/VUQxmCaVUrirSupCwRAyWUF4AJT6PASK4AraFSebjxiQndRpPJr5paAB5XyRP4
 /VcWdNz1Yiz5CbNVvEnNSQ4HHZW4NJeHzWqNc0eEXQBoXq/GDj5TXVqa9rUw366p0ROJ
 8L6tTuyMGmB7u8OY291hg1UH6lmweaScPvsLTDJ+sr3eto84TkuaL191AS8JQ8gHRAA0
 uZelvIdlblLrVEm/hlT0DvmIPWEgNW1uPKR2hiLxttyLgI8Dyd6WDsF0XXkhUSLedRzi
 ovAvP05+W3AVlO1DC5HQs2qi/j/Jjj51Feu7D1lx2Vf8KlqsEf8FyYOXcjY1soQz1RAE
 4GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Cw4G1kGPnxVEXDRecH6/IZiKHP/zHsLNMksxLIq354I=;
 b=q/6kZqZOwEGj/GlzX/kCGEUvB+zj39iJP7PHCrEtPCNg4RBcrHpKQOBSxKjfNQkZ4k
 miyZoaY59LTFxZr8vLO2Me4KVwKDVqEyVb7/vi0RiU4GZtmviqTi3JNStFqOt/0Cob1D
 0bjprDxgL1cNZ4EkvA5fv/GquF8ldNUT1Pv7diL7hXGPCyeornQ+sH7PecMnlZdK5pPj
 Op0/uq1oi/s8KvanLyvs5yfxiKk2kd2C4uvQzgXWrvPe4RO/zc/PocyjIWLj4ARAAJl/
 hK2sJGkhy6H/Xx0xS4IHnA1Ifmfgml/Kpgh9Gf7z+dk2nTCTC5BvfkzLcP8vTpwapo6t
 d14g==
X-Gm-Message-State: AOAM531pnYdLm33tL6VzQfmV4Kzolc4xLXms1YLm+ray9FtH9GrJHpxm
 v8SDbZUpmLb+Qxa2AqkB+QqQprk2n2S7w979XU3pbtr4yKw=
X-Google-Smtp-Source: ABdhPJyJgn3KVehxPc3knavS4GbM2P14T+bqkxrOiAtcvo8EDzi8tWD6QYtfDmWb7rBLkYieyToKERw0soiBbwM7V/Y=
X-Received: by 2002:a2e:6f0d:: with SMTP id k13mr1648192ljc.250.1599530975689; 
 Mon, 07 Sep 2020 19:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200903024442.296703-1-daeho43@gmail.com>
 <4c5dcf19-4495-5181-1695-fddf05c3bf24@huawei.com>
 <CACOAw_xAjUEyVo0Jm4yPvg7KB4G=Mz=tSEQ_wz6OH-P+e_cP8Q@mail.gmail.com>
 <CACOAw_yXkCkZrDELqereZcyJpXHAmWOwS2Q2HiNGs3_63sYfQA@mail.gmail.com>
 <c695e23d-2d54-6912-f139-8c2cde1366b2@huawei.com>
In-Reply-To: <c695e23d-2d54-6912-f139-8c2cde1366b2@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 8 Sep 2020 11:09:24 +0900
Message-ID: <CACOAw_zcX1059OytJtW-gwbmcv5T6pBsszESvybq2Xs09T8PMw@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kFT4o-00G9oR-Dw
Subject: Re: [f2fs-dev] [PATCH v2] f2fs_io: change fibmap to fiemap
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhlbiwgeW91IG1lYW4gbGlrZSB0aGUgYmVsb3c/CkkgaGFyZGx5IHNlZSBhbnkgYmVuZWZpdCBp
biB0aGlzIHdheSwgYmVjYXVzZSB3ZSBzdGlsbCBoYXZlIHRvIGRlZmluZQphbGwgdGhlIHN0dWZm
LgoKI2lmZGVmIEhBVkVfTElOVVhfVFlQRVNfSAojaW5jbHVkZSA8bGludXgvZmllbWFwLmg+CiNl
bmRpZgoKI2lmbmRlZiBIQVZFX0xJTlVYX1RZUEVTX0gKc3RydWN0IGZpZW1hcF9leHRlbnQgewog
ICAgICAgIHU2NCBmZV9sb2dpY2FsOwogICAgICAgIHU2NCBmZV9waHlzaWNhbDsKICAgICAgICB1
NjQgZmVfbGVuZ3RoOwogICAgICAgIHU2NCBmZV9yZXNlcnZlZDY0WzJdOwogICAgICAgIHUzMiBm
ZV9mbGFnczsKICAgICAgICB1MzIgZmVfcmVzZXJ2ZWRbM107Cn07CgpzdHJ1Y3QgZmllbWFwIHsK
ICAgICAgICB1NjQgZm1fc3RhcnQ7CiAgICAgICAgdTY0IGZtX2xlbmd0aDsKICAgICAgICB1MzIg
Zm1fZmxhZ3M7CiAgICAgICAgdTMyIGZtX21hcHBlZF9leHRlbnRzOwogICAgICAgIHUzMiBmbV9l
eHRlbnRfY291bnQ7CiAgICAgICAgdTMyIGZtX3Jlc2VydmVkOwogICAgICAgIHN0cnVjdCBmaWVt
YXBfZXh0ZW50IGZtX2V4dGVudFswXTsKfTsKCiNkZWZpbmUgRklFTUFQICAgICAgICAgICAgICAg
ICAgICAgICAgICBfSU9XUignZicsIDExLCBzdHJ1Y3QgZmllbWFwKQojZW5kaWYKCjIwMjDrhYQg
OeyblCA47J28ICjtmZQpIOyYpOyghCAxMDo0MiwgQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29t
PuuLmOydtCDsnpHshLE6Cj4KPiBPbiAyMDIwLzkvOCA4OjUyLCBEYWVobyBKZW9uZyB3cm90ZToK
PiA+IEkndmUgdGhvdWdodCBhYm91dCB0aGlzLgo+ID4gV2UgbmVlZCB0byBzdXBwb3J0IHRoaXMg
dG9vbCBmb3IgZGlmZmVyZW50IE9TLCBub3Qgb25seSBmb3IgTGludXguCj4gPiBTbywgaXMgaXQg
b2sgdG8gaW5jbHVkZSBsaW51eC9maWVtYXAuaCBmb3IgdGhpcz8KPiA+IEFjdHVhbGx5LCBzaW5j
ZSBGSUVNQVAgYW5kIG90aGVyIHN0dWZmIHdlcmUgZGVmaW5lZCBpbiBmMmZzX2lvLmMKPiA+IGRp
cmVjdGx5IGJlZm9yZSwgSSB0aG91Z2h0IHRoYXQgdGhlcmUgd2FzIHNvbWUgcmVhc29uIGZvciBk
b2luZyB0aGF0Cj4gPiBhbmQgSSBmb2xsb3dlZCB0aGUgY29udmVudGlvbi4KPiA+Cj4gPiBXaGF0
IGRvIHlvdSB0aGluaz8KPgo+IFllcywgdGhhdCdzIGdvb2QgcG9pbnQuCj4KPiBJIG5vdGljZWQg
dGhhdCBmMmZzX2lvLmggaGFzIHNpbWlsYXIgY29uY2VybjoKPgo+ICNpZmRlZiBIQVZFX0xJTlVY
X1RZUEVTX0gKPiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiAjZW5kaWYKPgo+IC4uLgo+Cj4g
I2lmbmRlZiBIQVZFX0xJTlVYX1RZUEVTX0gKPiB0eXBlZGVmIHU4ICAgICAgX191ODsKPiB0eXBl
ZGVmIHUxNiAgICAgX191MTY7Cj4gdHlwZWRlZiB1MzIgICAgIF9fdTMyOwo+IHR5cGVkZWYgdTE2
ICAgICBfX2xlMTY7Cj4gdHlwZWRlZiB1MzIgICAgIF9fbGUzMjsKPiB0eXBlZGVmIHUxNiAgICAg
X19iZTE2Owo+IHR5cGVkZWYgdTMyICAgICBfX2JlMzI7Cj4gI2VuZGlmCj4KPiBTbyBob3cgYWJv
dXQgaW1wbGVtZW50aW5nIGFzIGFib3ZlPwo+Cj4gVGhhbmtzLAo+Cj4gPgo+ID4gMjAyMOuFhCA5
7JuUIDTsnbwgKOq4iCkg7Jik7ZuEIDEyOjM5LCBEYWVobyBKZW9uZyA8ZGFlaG80M0BnbWFpbC5j
b20+64uY7J20IOyekeyEsToKPiA+Pgo+ID4+IEl0J3Mgd2F5IGJldHRlcn4gOikKPiA+Pgo+ID4+
IDIwMjDrhYQgOeyblCA07J28ICjquIgpIOyYpO2bhCAxMjoxMSwgQ2hhbyBZdSA8eXVjaGFvMEBo
dWF3ZWkuY29tPuuLmOydtCDsnpHshLE6Cj4gPj4+Cj4gPj4+Cj4gPj4+Cj4gPj4+IE9uIDIwMjAv
OS8zIDEwOjQ0LCBEYWVobyBKZW9uZyB3cm90ZToKPiA+Pj4+IEZyb206IERhZWhvIEplb25nIDxk
YWVob2plb25nQGdvb2dsZS5jb20+Cj4gPj4+Pgo+ID4+Pj4gQ3VycmVudGx5IHdlIHN1cHBvcnQg
ZmllbWFwIGNvbW1hbmQgdXNpbmcgZmlibWFwLiBJdCdzIHNpbXBsZSBhbmQKPiA+Pj4+IGVhc3kg
dG8gdXNlLCBidXQgd2UgY2Fubm90IHVzZSB0aGlzIGZvciBjb21wcmVzc2VkIGZpbGUuIFRvIHN1
cHBvcnQKPiA+Pj4+IG1vcmUgZGlmZmVyZW50IHR5cGVzIG9mIGZpbGVzLCB3ZSBuZWVkIHRvIGNo
YW5nZSB0aGlzIHRvIHVzZSBmaWVtYXAuCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogRGFl
aG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+Pj4+IC0tLQo+ID4+Pj4gQ2hhbmdl
cyBpbiB2MjoKPiA+Pj4+ICAgIC0gTW92ZSBkZWNsYXJhdGlvbiB0byBoZWFkZXIgZmlsZQo+ID4+
Pj4gLS0tCj4gPj4+PiAgICB0b29scy9mMmZzX2lvL2YyZnNfaW8uYyB8IDM3ICsrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+Pj4+ICAgIHRvb2xzL2YyZnNfaW8vZjJmc19p
by5oIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+Pj4+ICAgIDIgZmlsZXMgY2hh
bmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4gPj4+Pgo+ID4+Pj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5jIGIvdG9vbHMvZjJmc19pby9mMmZzX2lv
LmMKPiA+Pj4+IGluZGV4IGFiYjY1NWEuLjlhNjUxYzAgMTAwNjQ0Cj4gPj4+PiAtLS0gYS90b29s
cy9mMmZzX2lvL2YyZnNfaW8uYwo+ID4+Pj4gKysrIGIvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMK
PiA+Pj4+IEBAIC02MzEsMjcgKzYzMSwxNyBAQCBzdGF0aWMgdm9pZCBkb19yYW5kcmVhZChpbnQg
YXJnYywgY2hhciAqKmFyZ3YsIGNvbnN0IHN0cnVjdCBjbWRfZGVzYyAqY21kKQo+ID4+Pj4gICAg
ICAgIGV4aXQoMCk7Cj4gPj4+PiAgICB9Cj4gPj4+Pgo+ID4+Pj4gLXN0cnVjdCBmaWxlX2V4dCB7
Cj4gPj4+PiAtICAgICBfX3UzMiBmX3BvczsKPiA+Pj4+IC0gICAgIF9fdTMyIHN0YXJ0X2JsazsK
PiA+Pj4+IC0gICAgIF9fdTMyIGVuZF9ibGs7Cj4gPj4+PiAtICAgICBfX3UzMiBibGtfY291bnQ7
Cj4gPj4+PiAtfTsKPiA+Pj4+IC0KPiA+Pj4+IC0jaWZuZGVmIEZJQk1BUAo+ID4+Pj4gLSNkZWZp
bmUgRklCTUFQICAgICAgICAgIF9JTygweDAwLCAxKSAgICAvKiBibWFwIGFjY2VzcyAqLwo+ID4+
Pj4gLSNlbmRpZgo+ID4+Pj4gLQo+ID4+Pj4gICAgI2RlZmluZSBmaWVtYXBfZGVzYyAiZ2V0IGJs
b2NrIGFkZHJlc3MgaW4gZmlsZSIKPiA+Pj4+ICAgICNkZWZpbmUgZmllbWFwX2hlbHAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPj4+PiAgICAiZjJmc19pbyBmaWVtYXAgW29m
ZnNldCBpbiA0a2JdIFtjb3VudF0gW2ZpbGVfcGF0aF1cblxuIlwKPiA+Pj4+Cj4gPj4+PiAgICBz
dGF0aWMgdm9pZCBkb19maWVtYXAoaW50IGFyZ2MsIGNoYXIgKiphcmd2LCBjb25zdCBzdHJ1Y3Qg
Y21kX2Rlc2MgKmNtZCkKPiA+Pj4+ICAgIHsKPiA+Pj4+IC0gICAgIHU2NCBvZmZzZXQ7Cj4gPj4+
PiAtICAgICB1MzIgYmxrbnVtOwo+ID4+Pj4gICAgICAgIHVuc2lnbmVkIGNvdW50LCBpOwo+ID4+
Pj4gICAgICAgIGludCBmZDsKPiA+Pj4+ICsgICAgIF9fdTY0IHBoeV9hZGRyOwo+ID4+Pj4gKyAg
ICAgc3RydWN0IGZpZW1hcCAqZm0gPSB4bWFsbG9jKHNpemVvZihzdHJ1Y3QgZmllbWFwKSArCj4g
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBmaWVtYXBfZXh0ZW50KSk7
Cj4gPj4+Pgo+ID4+Pj4gICAgICAgIGlmIChhcmdjICE9IDQpIHsKPiA+Pj4+ICAgICAgICAgICAg
ICAgIGZwdXRzKCJFeGNlc3MgYXJndW1lbnRzXG5cbiIsIHN0ZGVycik7Cj4gPj4+PiBAQCAtNjU5
LDIxICs2NDksMjggQEAgc3RhdGljIHZvaWQgZG9fZmllbWFwKGludCBhcmdjLCBjaGFyICoqYXJn
diwgY29uc3Qgc3RydWN0IGNtZF9kZXNjICpjbWQpCj4gPj4+PiAgICAgICAgICAgICAgICBleGl0
KDEpOwo+ID4+Pj4gICAgICAgIH0KPiA+Pj4+Cj4gPj4+PiAtICAgICBvZmZzZXQgPSBhdG9pKGFy
Z3ZbMV0pOwo+ID4+Pj4gKyAgICAgZm0tPmZtX3N0YXJ0ID0gYXRvaShhcmd2WzFdKSAqIEYyRlNf
QkxLU0laRTsKPiA+Pj4+ICsgICAgIGZtLT5mbV9sZW5ndGggPSBGMkZTX0JMS1NJWkU7Cj4gPj4+
PiArICAgICBmbS0+Zm1fZXh0ZW50X2NvdW50ID0gMTsKPiA+Pj4+ICAgICAgICBjb3VudCA9IGF0
b2koYXJndlsyXSk7Cj4gPj4+Pgo+ID4+Pj4gICAgICAgIGZkID0geG9wZW4oYXJndlszXSwgT19S
RE9OTFkgfCBPX0xBUkdFRklMRSwgMCk7Cj4gPj4+Pgo+ID4+Pj4gLSAgICAgcHJpbnRmKCJGaWVt
YXA6IG9mZnNldCA9ICUwOCJQUkl4NjQiIGxlbiA9ICVkXG4iLCBvZmZzZXQsIGNvdW50KTsKPiA+
Pj4+ICsgICAgIHByaW50ZigiRmllbWFwOiBvZmZzZXQgPSAlMDgiUFJJeDY0IiBsZW4gPSAlZFxu
IiwKPiA+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm0tPmZtX3N0
YXJ0IC8gRjJGU19CTEtTSVpFLCBjb3VudCk7Cj4gPj4+PiAgICAgICAgZm9yIChpID0gMDsgaSA8
IGNvdW50OyBpKyspIHsKPiA+Pj4+IC0gICAgICAgICAgICAgYmxrbnVtID0gb2Zmc2V0ICsgaTsK
PiA+Pj4+IC0KPiA+Pj4+IC0gICAgICAgICAgICAgaWYgKGlvY3RsKGZkLCBGSUJNQVAsICZibGtu
dW0pIDwgMCkKPiA+Pj4+IC0gICAgICAgICAgICAgICAgICAgICBkaWVfZXJybm8oIkZJQk1BUCBm
YWlsZWQiKTsKPiA+Pj4+ICsgICAgICAgICAgICAgaWYgKGlvY3RsKGZkLCBGSUVNQVAsIGZtKSA8
IDApCj4gPj4+PiArICAgICAgICAgICAgICAgICAgICAgZGllX2Vycm5vKCJGSUVNQVAgZmFpbGVk
Iik7Cj4gPj4+Pgo+ID4+Pj4gLSAgICAgICAgICAgICBwcmludGYoIiV1ICIsIGJsa251bSk7Cj4g
Pj4+PiArICAgICAgICAgICAgIHBoeV9hZGRyID0gZm0tPmZtX2V4dGVudFswXS5mZV9waHlzaWNh
bCAvIEYyRlNfQkxLU0laRTsKPiA+Pj4+ICsgICAgICAgICAgICAgaWYgKHBoeV9hZGRyID09IE5F
V19BRERSKQo+ID4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHByaW50ZigiTkVXX0FERFIgIik7
Cj4gPj4+PiArICAgICAgICAgICAgIGVsc2UKPiA+Pj4+ICsgICAgICAgICAgICAgICAgICAgICBw
cmludGYoIiVsbHUgIiwgcGh5X2FkZHIpOwo+ID4+Pj4gKyAgICAgICAgICAgICBmbS0+Zm1fc3Rh
cnQgKz0gRjJGU19CTEtTSVpFOwo+ID4+Pj4gICAgICAgIH0KPiA+Pj4+ICAgICAgICBwcmludGYo
IlxuIik7Cj4gPj4+PiArICAgICBmcmVlKGZtKTsKPiA+Pj4+ICAgICAgICBleGl0KDApOwo+ID4+
Pj4gICAgfQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS90b29scy9mMmZzX2lvL2YyZnNfaW8u
aCBiL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5oCj4gPj4+PiBpbmRleCBiZDE5ZmY5Li42MmQ2ZTdi
IDEwMDY0NAo+ID4+Pj4gLS0tIGEvdG9vbHMvZjJmc19pby9mMmZzX2lvLmgKPiA+Pj4+ICsrKyBi
L3Rvb2xzL2YyZnNfaW8vZjJmc19pby5oCj4gPj4+PiBAQCAtMzgsNiArMzgsOSBAQCB0eXBlZGVm
IHUxNiBfX2JlMTY7Cj4gPj4+PiAgICB0eXBlZGVmIHUzMiBfX2JlMzI7Cj4gPj4+PiAgICAjZW5k
aWYKPiA+Pj4+Cj4gPj4+PiArI2RlZmluZSBGMkZTX0JMS1NJWkUgNDA5Ngo+ID4+Pj4gKyNkZWZp
bmUgTkVXX0FERFIgICAgIDB4RkZGRkZGRkYKPiA+Pj4+ICsKPiA+Pj4+ICAgICNpZm5kZWYgRlNf
SU9DX0dFVEZMQUdTCj4gPj4+PiAgICAjZGVmaW5lIEZTX0lPQ19HRVRGTEFHUyAgICAgICAgICAg
ICAgICAgICAgIF9JT1IoJ2YnLCAxLCBsb25nKQo+ID4+Pj4gICAgI2VuZGlmCj4gPj4+PiBAQCAt
MTMyLDYgKzEzNSwyOSBAQCB0eXBlZGVmIHUzMiAgICAgIF9fYmUzMjsKPiA+Pj4+ICAgICNkZWZp
bmUgRlNfQ0FTRUZPTERfRkwgICAgICAgICAgICAgICAgICAgICAgMHg0MDAwMDAwMCAvKiBGb2xk
ZXIgaXMgY2FzZSBpbnNlbnNpdGl2ZSAqLwo+ID4+Pj4gICAgI2VuZGlmCj4gPj4+Pgo+ID4+Pj4g
K3N0cnVjdCBmaWVtYXBfZXh0ZW50IHsKPiA+Pj4+ICsgICAgIHU2NCBmZV9sb2dpY2FsOwo+ID4+
Pj4gKyAgICAgdTY0IGZlX3BoeXNpY2FsOwo+ID4+Pj4gKyAgICAgdTY0IGZlX2xlbmd0aDsKPiA+
Pj4+ICsgICAgIHU2NCBmZV9yZXNlcnZlZDY0WzJdOwo+ID4+Pj4gKyAgICAgdTMyIGZlX2ZsYWdz
Owo+ID4+Pj4gKyAgICAgdTMyIGZlX3Jlc2VydmVkWzNdOwo+ID4+Pj4gK307Cj4gPj4+PiArCj4g
Pj4+PiArc3RydWN0IGZpZW1hcCB7Cj4gPj4+PiArICAgICB1NjQgZm1fc3RhcnQ7Cj4gPj4+PiAr
ICAgICB1NjQgZm1fbGVuZ3RoOwo+ID4+Pj4gKyAgICAgdTMyIGZtX2ZsYWdzOwo+ID4+Pj4gKyAg
ICAgdTMyIGZtX21hcHBlZF9leHRlbnRzOwo+ID4+Pj4gKyAgICAgdTMyIGZtX2V4dGVudF9jb3Vu
dDsKPiA+Pj4+ICsgICAgIHUzMiBmbV9yZXNlcnZlZDsKPiA+Pj4+ICsgICAgIHN0cnVjdCBmaWVt
YXBfZXh0ZW50IGZtX2V4dGVudFswXTsKPiA+Pj4+ICt9Owo+ID4+Pgo+ID4+PiBXZSBkb24ndCBu
ZWVkIHRvIGNvcHkgJiBwYXN0ZSBmaWVtYXAgcmVsYXRlZCBzdHJ1Y3R1cmUgaGVyZS4KPiA+Pj4K
PiA+Pj4gTGV0J3MganVzdCBpbmNsdWRlIDxsaW51eC9maWVtYXAuaD4gaW4gZjJmc19pby5oCj4g
Pj4+Cj4gPj4+IFRoYW5rcywKPiA+Pj4KPiA+Pj4+ICsKPiA+Pj4+ICsjaWZuZGVmIEZJRU1BUAo+
ID4+Pj4gKyNkZWZpbmUgRklFTUFQICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9JT1dS
KCdmJywgMTEsIHN0cnVjdCBmaWVtYXApCj4gPj4+PiArI2VuZGlmCj4gPj4+PiArCj4gPj4+PiAg
ICBzdHJ1Y3QgZjJmc19nY19yYW5nZSB7Cj4gPj4+PiAgICAgICAgdTMyIHN5bmM7Cj4gPj4+PiAg
ICAgICAgdTY0IHN0YXJ0Owo+ID4+Pj4KPiA+IC4KPiA+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
