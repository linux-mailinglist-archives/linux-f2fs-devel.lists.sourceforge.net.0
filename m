Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A8A97D794
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Sep 2024 17:39:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1srfii-0002B9-9t;
	Fri, 20 Sep 2024 15:38:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1srfig-0002B2-SJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Sep 2024 15:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rr5KQ5ZLHVOl3Oeu6RlbYVLwrPzOvhWdRLnaEIc3JZ4=; b=SfeCYR2bqePb9OikpuxS4GpRV9
 dSeQYYYoLDw5WXYv3AUQrj/HBldI/BNvRHI/A0uwwtKOcE+iHoWZ9aRRMGEgm1ZqY/DTgs76E+H0V
 ZNMb5It8tDgP5eaSJVOPTPiGDrafLZZd13tCUi6VlMVNVCWoBwG3HZmYy+cjvXRPWaGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rr5KQ5ZLHVOl3Oeu6RlbYVLwrPzOvhWdRLnaEIc3JZ4=; b=gHA96hwTZbAffIy4OLLHgTyrUa
 QSzeK6bYSuwpw5e7fpwvo9nc0qKgeV8av02BlEwc4LjFw3aLW7x9F+HMn2Q6PJfb9K8ViBtfu13Sm
 gtsmzPjEOAGrI2PJ2vVOHQkUjphyOOX+s0bbfveyJIW/9MUOOp/W/260k4gkfJHdQiBU=;
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1srfig-0002gI-Jo for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Sep 2024 15:38:55 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-7124352ecc3so1354000a34.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Sep 2024 08:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726846729; x=1727451529; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rr5KQ5ZLHVOl3Oeu6RlbYVLwrPzOvhWdRLnaEIc3JZ4=;
 b=TLm8OL9zE6+aw24McaMUczvZShDTeIq53J3KQYARprS9JnJSra+WbZLu9OW76bYlid
 EasHfjBZoDu3rg3kui7zHwDTRPbmQldSWcXvKxv7TAKvQnB6W1cVZAufps1ISA84foSr
 mxcY4ccjM/mSbJl0Z96b0p1ZKorfZQprMMpAxBbeQkzLgC3sC2ps06oJFLAC6wiXA5nl
 CqXRcy3vTsjIiy08kJVmhdUlkRwIMRv3ROAUjH7TjFqlgd04uY47+DHbSTgYZRR8P4ET
 yUOxAbV1PX4Ax/vdI0+lnJCeCDzctNiv+g3BIBHiN/dqUnWArFmA8NioTEVpSmAhPih9
 xzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726846729; x=1727451529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rr5KQ5ZLHVOl3Oeu6RlbYVLwrPzOvhWdRLnaEIc3JZ4=;
 b=FJZZ/3uFY+IP6EE+p7zEAKT3yVLJFym4PXrntee3JJWyeqyeMyl3bPcd1cokaSIX6B
 0mV/pJuWUB3SNwDj7InMCtCr/Il5nsIcPsXPjyuVb9yYQ5JsA6MjR7Ujlh5xhFue7X1+
 GVD3tY6+glenNsh5/EF6OxD/9jxb2hiQiyVhBa9ImcWWieOTwAyTb8Dbh7s3PBXCKFCT
 Th0wbqX4nLzlr6UnbDymGeygl1Tfor6uDwFLXauIip6AEkcO7qzPgNXybn5HSRox9dcV
 JTs0Z6Bd6X87+rfGJPi3aTieVD9mtsWMJ2tzAxfiSM4ie/8KgttUym34KdS4Ol1ZN0uO
 F1Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1jNWA+/KFU08DPDjtjZe8rsKGYa+wsgfEKtty3hQ0LktbfJ0PDOrr3ofambKhmRbQzNjB/7JY92BwxS83zUo/@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxn4F7tn/9KkOx2JNrJxpAiBDJ7fN5eudGqnEzqB+rCJaaH0ZR9
 YQGTJZLqFMvVemt2MrcPtUUbpn2N/pQUQSAeV4vh1jjteed0n3hDXbaUmDC+pz5NOWJy8wVlrz/
 7zYU04rPDmjIwRiDKnVAmYMLpv3U=
X-Google-Smtp-Source: AGHT+IESIjXuG65digZumlpEH1+LhW2toUCoI59eVJjvC/8VUPASncj02dp31mQsRAYYovpGArB2prI1ATX6X8bBV60=
X-Received: by 2002:a05:6830:648b:b0:710:b13b:ff15 with SMTP id
 46e09a7af769-7139348120dmr2402636a34.6.1726846728712; Fri, 20 Sep 2024
 08:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240913212810.912171-1-daeho43@gmail.com>
 <cef0eeba-6089-44c6-b08e-308f8ee36f6a@kernel.org>
In-Reply-To: <cef0eeba-6089-44c6-b08e-308f8ee36f6a@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 20 Sep 2024 08:38:37 -0700
Message-ID: <CACOAw_xW_UsNLy-j6tySmOLzqR6LDDDCZnpx4Uj8PF=ZTuVRag@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Sep 19, 2024 at 6:14 AM Chao Yu wrote: > > On 2024/9/14
    5:28, Daeho Jeong wrote: > > From: Daeho Jeong > > > > F2FS should understand
    how the device aliasing file works and support > > d [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.210.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1srfig-0002gI-Jo
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce device aliasing file
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

T24gVGh1LCBTZXAgMTksIDIwMjQgYXQgNjoxNOKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzkvMTQgNToyOCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBG
cm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4KPiA+IEYyRlMgc2hv
dWxkIHVuZGVyc3RhbmQgaG93IHRoZSBkZXZpY2UgYWxpYXNpbmcgZmlsZSB3b3JrcyBhbmQgc3Vw
cG9ydAo+ID4gZGVsZXRpbmcgdGhlIGZpbGUgYWZ0ZXIgdXNlLiBBIGRldmljZSBhbGlhc2luZyBm
aWxlIGNhbiBiZSBjcmVhdGVkIGJ5Cj4gPiBta2ZzLmYyZnMgdG9vbCBhbmQgaXQgY2FuIG1hcCB0
aGUgd2hvbGUgZGV2aWNlIHdpdGggYW4gZXh0cmVudCwgbm90Cj4gPiB1c2luZyBub2RlIGJsb2Nr
cy4gVGhlIGZpbGUgc3BhY2Ugc2hvdWxkIGJlIHBpbm5lZCBhbmQgbm9ybWFsbHkgdXNlZCBmb3IK
PiA+IHJlYWQtb25seSB1c2FnZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFlaG8gSmVvbmcg
PGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gICBmcy9mMmZzL2RhdGEuYyAgICAg
ICAgIHwgIDUgKysrKysKPiA+ICAgZnMvZjJmcy9leHRlbnRfY2FjaGUuYyB8IDEwICsrKysrKysr
KysKPiA+ICAgZnMvZjJmcy9mMmZzLmggICAgICAgICB8ICA1ICsrKysrCj4gPiAgIGZzL2YyZnMv
ZmlsZS5jICAgICAgICAgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0K
PiA+ICAgZnMvZjJmcy9pbm9kZS5jICAgICAgICB8IDEwICsrKysrKysrLS0KPiA+ICAgZnMvZjJm
cy9zeXNmcy5jICAgICAgICB8ICAyICsrCj4gPiAgIDYgZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRh
LmMgYi9mcy9mMmZzL2RhdGEuYwo+ID4gaW5kZXggNjQ1N2U1YmNhOWM5Li45Y2U5MjA5M2JhMWUg
MTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ID4gKysrIGIvZnMvZjJmcy9kYXRhLmMK
PiA+IEBAIC0zNDIzLDYgKzM0MjMsMTEgQEAgc3RhdGljIGludCBwcmVwYXJlX3dyaXRlX2JlZ2lu
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+Cj4gPiAgICAgICBpZiAoIWYyZnNfbG9va3Vw
X3JlYWRfZXh0ZW50X2NhY2hlX2Jsb2NrKGlub2RlLCBpbmRleCwKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmRuLmRhdGFfYmxrYWRkcikpIHsKPiA+
ICsgICAgICAgICAgICAgaWYgKElTX0RFVklDRV9BTElBU0lORyhpbm9kZSkpIHsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBlcnIgPSAtRU5PREFUQTsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBnb3RvIG91dDsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKwo+ID4gICAgICAgICAgICAgICBp
ZiAobG9ja2VkKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gZjJmc19yZXNlcnZl
X2Jsb2NrKCZkbiwgaW5kZXgpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+
ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMgYi9mcy9mMmZzL2V4dGVudF9j
YWNoZS5jCj4gPiBpbmRleCBmZDFmYzA2MzU5ZWUuLjAzODgzOTYzYjk5MSAxMDA2NDQKPiA+IC0t
LSBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPiA+ICsrKyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hl
LmMKPiA+IEBAIC00MDEsNiArNDAxLDExIEBAIHZvaWQgZjJmc19pbml0X3JlYWRfZXh0ZW50X3Ry
ZWUoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IHBhZ2UgKmlwYWdlKQo+ID4gICAgICAgaWYg
KGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpIHx8ICFlaS5sZW4pCj4gPiAgICAgICAgICAgICAg
IGdvdG8gc2tpcDsKPiA+Cj4gPiArICAgICBpZiAoSVNfREVWSUNFX0FMSUFTSU5HKGlub2RlKSkg
ewo+ID4gKyAgICAgICAgICAgICBldC0+bGFyZ2VzdCA9IGVpOwo+ID4gKyAgICAgICAgICAgICBn
b3RvIHNraXA7Cj4gPiArICAgICB9Cj4gPiArCj4gPiAgICAgICBlbiA9IF9fYXR0YWNoX2V4dGVu
dF9ub2RlKHNiaSwgZXQsICZlaSwgTlVMTCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZldC0+cm9vdC5yYl9yb290LnJiX25vZGUsIHRydWUpOwo+ID4gICAgICAgaWYgKGVuKSB7
Cj4gPiBAQCAtNDYzLDYgKzQ2OCwxMSBAQCBzdGF0aWMgYm9vbCBfX2xvb2t1cF9leHRlbnRfdHJl
ZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBwZ29mZl90IHBnb2ZzLAo+ID4gICAgICAgICAgICAgICBn
b3RvIG91dDsKPiA+ICAgICAgIH0KPiA+Cj4gPiArICAgICBpZiAoSVNfREVWSUNFX0FMSUFTSU5H
KGlub2RlKSkgewo+ID4gKyAgICAgICAgICAgICByZXQgPSBmYWxzZTsKPiA+ICsgICAgICAgICAg
ICAgZ290byBvdXQ7Cj4gPiArICAgICB9Cj4gPiArCj4gPiAgICAgICBlbiA9IF9fbG9va3VwX2V4
dGVudF9ub2RlKCZldC0+cm9vdCwgZXQtPmNhY2hlZF9lbiwgcGdvZnMpOwo+ID4gICAgICAgaWYg
KCFlbikKPiA+ICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+ID4gaW5kZXggYWMxOWM2MWYwYzNlLi41OTE3OWI5
YjNhODMgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ID4gKysrIGIvZnMvZjJmcy9m
MmZzLmgKPiA+IEBAIC0yMDgsNiArMjA4LDcgQEAgc3RydWN0IGYyZnNfbW91bnRfaW5mbyB7Cj4g
PiAgICNkZWZpbmUgRjJGU19GRUFUVVJFX0NBU0VGT0xEICAgICAgICAgICAgICAgICAgICAgICAw
eDAwMDAxMDAwCj4gPiAgICNkZWZpbmUgRjJGU19GRUFUVVJFX0NPTVBSRVNTSU9OICAgICAgICAg
ICAgMHgwMDAwMjAwMAo+ID4gICAjZGVmaW5lIEYyRlNfRkVBVFVSRV9STyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMHgwMDAwNDAwMAo+ID4gKyNkZWZpbmUgRjJGU19GRUFUVVJFX0RFVklD
RV9BTElBUyAgICAgICAgICAgIDB4MDAwMDgwMDAKPiA+Cj4gPiAgICNkZWZpbmUgX19GMkZTX0hB
U19GRUFUVVJFKHJhd19zdXBlciwgbWFzaykgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4g
ICAgICAgKChyYXdfc3VwZXItPmZlYXR1cmUgJiBjcHVfdG9fbGUzMihtYXNrKSkgIT0gMCkKPiA+
IEBAIC0zMDAxLDYgKzMwMDIsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZjJmc19jaGFuZ2VfYml0
KHVuc2lnbmVkIGludCBuciwgY2hhciAqYWRkcikKPiA+ICAgI2RlZmluZSBGMkZTX0RJUlNZTkNf
RkwgICAgICAgICAgICAgICAgICAgICAweDAwMDEwMDAwIC8qIGRpcnN5bmMgYmVoYXZpb3VyIChk
aXJlY3RvcmllcyBvbmx5KSAqLwo+ID4gICAjZGVmaW5lIEYyRlNfUFJPSklOSEVSSVRfRkwgICAg
ICAgICAweDIwMDAwMDAwIC8qIENyZWF0ZSB3aXRoIHBhcmVudHMgcHJvamlkICovCj4gPiAgICNk
ZWZpbmUgRjJGU19DQVNFRk9MRF9GTCAgICAgICAgICAgIDB4NDAwMDAwMDAgLyogQ2FzZWZvbGRl
ZCBmaWxlICovCj4gPiArI2RlZmluZSBGMkZTX0RFVklDRV9BTElBU19GTCAgICAgICAgIDB4ODAw
MDAwMDAgLyogRmlsZSBmb3IgYWxpYXNpbmcgYSBkZXZpY2UgKi8KPiA+Cj4gPiAgICNkZWZpbmUg
RjJGU19RVU9UQV9ERUZBVUxUX0ZMICAgICAgICAgICAgICAgKEYyRlNfTk9BVElNRV9GTCB8IEYy
RlNfSU1NVVRBQkxFX0ZMKQo+ID4KPiA+IEBAIC0zMDE2LDYgKzMwMTgsOCBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgZjJmc19jaGFuZ2VfYml0KHVuc2lnbmVkIGludCBuciwgY2hhciAqYWRkcikKPiA+
ICAgLyogRmxhZ3MgdGhhdCBhcmUgYXBwcm9wcmlhdGUgZm9yIG5vbi1kaXJlY3Rvcmllcy9yZWd1
bGFyIGZpbGVzLiAqLwo+ID4gICAjZGVmaW5lIEYyRlNfT1RIRVJfRkxNQVNLICAgKEYyRlNfTk9E
VU1QX0ZMIHwgRjJGU19OT0FUSU1FX0ZMKQo+ID4KPiA+ICsjZGVmaW5lIElTX0RFVklDRV9BTElB
U0lORyhpbm9kZSkgICAgKEYyRlNfSShpbm9kZSktPmlfZmxhZ3MgJiBGMkZTX0RFVklDRV9BTElB
U19GTCkKPiA+ICsKPiA+ICAgc3RhdGljIGlubGluZSBfX3UzMiBmMmZzX21hc2tfZmxhZ3ModW1v
ZGVfdCBtb2RlLCBfX3UzMiBmbGFncykKPiA+ICAgewo+ID4gICAgICAgaWYgKFNfSVNESVIobW9k
ZSkpCj4gPiBAQCAtNDQ3OCw2ICs0NDgyLDcgQEAgRjJGU19GRUFUVVJFX0ZVTkNTKHNiX2Noa3N1
bSwgU0JfQ0hLU1VNKTsKPiA+ICAgRjJGU19GRUFUVVJFX0ZVTkNTKGNhc2Vmb2xkLCBDQVNFRk9M
RCk7Cj4gPiAgIEYyRlNfRkVBVFVSRV9GVU5DUyhjb21wcmVzc2lvbiwgQ09NUFJFU1NJT04pOwo+
ID4gICBGMkZTX0ZFQVRVUkVfRlVOQ1MocmVhZG9ubHksIFJPKTsKPiA+ICtGMkZTX0ZFQVRVUkVf
RlVOQ1MoZGV2aWNlX2FsaWFzLCBERVZJQ0VfQUxJQVMpOwo+ID4KPiA+ICAgI2lmZGVmIENPTkZJ
R19CTEtfREVWX1pPTkVECj4gPiAgIHN0YXRpYyBpbmxpbmUgYm9vbCBmMmZzX2Jsa3pfaXNfc2Vx
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IGRldmksCj4gPiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+ID4gaW5kZXggMTY4ZjA4NTA3MDA0Li4wZjRh
ZjZiMzAzZmYgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+ID4gKysrIGIvZnMvZjJm
cy9maWxlLmMKPiA+IEBAIC03MjcsNiArNzI3LDExIEBAIGludCBmMmZzX2RvX3RydW5jYXRlX2Js
b2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCB1NjQgZnJvbSwgYm9vbCBsb2NrKQo+ID4KPiA+ICAg
ICAgIHRyYWNlX2YyZnNfdHJ1bmNhdGVfYmxvY2tzX2VudGVyKGlub2RlLCBmcm9tKTsKPiA+Cj4g
PiArICAgICBpZiAoSVNfREVWSUNFX0FMSUFTSU5HKGlub2RlKSAmJiBmcm9tKSB7Cj4gPiArICAg
ICAgICAgICAgIGVyciA9IC1FSU5WQUw7Cj4gPiArICAgICAgICAgICAgIGdvdG8gb3V0X2VycjsK
PiA+ICsgICAgIH0KPiA+ICsKPiA+ICAgICAgIGZyZWVfZnJvbSA9IChwZ29mZl90KUYyRlNfQkxL
X0FMSUdOKGZyb20pOwo+ID4KPiA+ICAgICAgIGlmIChmcmVlX2Zyb20gPj0gbWF4X2ZpbGVfYmxv
Y2tzKGlub2RlKSkKPiA+IEBAIC03NDEsNiArNzQ2LDIxIEBAIGludCBmMmZzX2RvX3RydW5jYXRl
X2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCB1NjQgZnJvbSwgYm9vbCBsb2NrKQo+ID4gICAg
ICAgICAgICAgICBnb3RvIG91dDsKPiA+ICAgICAgIH0KPiA+Cj4gPiArICAgICBpZiAoSVNfREVW
SUNFX0FMSUFTSU5HKGlub2RlKSkgewo+ID4gKyAgICAgICAgICAgICBzdHJ1Y3QgZXh0ZW50X3Ry
ZWUgKmV0ID0gRjJGU19JKGlub2RlKS0+ZXh0ZW50X3RyZWVbRVhfUkVBRF07Cj4gPiArICAgICAg
ICAgICAgIHN0cnVjdCBleHRlbnRfaW5mbyBlaSA9IGV0LT5sYXJnZXN0Owo+ID4gKyAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgaTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgZm9yIChpID0gMDsg
aSA8IGVpLmxlbjsgaSsrKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGYyZnNfaW52YWxpZGF0
ZV9ibG9ja3Moc2JpLCBlaS5ibGsgKyBpKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgZGVjX3Zh
bGlkX2Jsb2NrX2NvdW50KHNiaSwgaW5vZGUsIGVpLmxlbik7Cj4gPiArICAgICAgICAgICAgIGYy
ZnNfdXBkYXRlX3RpbWUoc2JpLCBSRVFfVElNRSk7Cj4gPiArCj4gPiArICAgICAgICAgICAgIGYy
ZnNfcHV0X3BhZ2UoaXBhZ2UsIDEpOwo+ID4gKyAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ICsg
ICAgIH0KPiA+ICsKPiA+ICAgICAgIGlmIChmMmZzX2hhc19pbmxpbmVfZGF0YShpbm9kZSkpIHsK
PiA+ICAgICAgICAgICAgICAgZjJmc190cnVuY2F0ZV9pbmxpbmVfaW5vZGUoaW5vZGUsIGlwYWdl
LCBmcm9tKTsKPiA+ICAgICAgICAgICAgICAgZjJmc19wdXRfcGFnZShpcGFnZSwgMSk7Cj4gPiBA
QCAtNzc2LDcgKzc5Niw3IEBAIGludCBmMmZzX2RvX3RydW5jYXRlX2Jsb2NrcyhzdHJ1Y3QgaW5v
ZGUgKmlub2RlLCB1NjQgZnJvbSwgYm9vbCBsb2NrKQo+ID4gICAgICAgLyogbGFzdGx5IHplcm8g
b3V0IHRoZSBmaXJzdCBkYXRhIHBhZ2UgKi8KPiA+ICAgICAgIGlmICghZXJyKQo+ID4gICAgICAg
ICAgICAgICBlcnIgPSB0cnVuY2F0ZV9wYXJ0aWFsX2RhdGFfcGFnZShpbm9kZSwgZnJvbSwgdHJ1
bmNhdGVfcGFnZSk7Cj4gPiAtCj4gPiArb3V0X2VycjoKPiA+ICAgICAgIHRyYWNlX2YyZnNfdHJ1
bmNhdGVfYmxvY2tzX2V4aXQoaW5vZGUsIGVycik7Cj4gPiAgICAgICByZXR1cm4gZXJyOwo+ID4g
ICB9Cj4gPiBAQCAtOTk0LDcgKzEwMTQsOCBAQCBpbnQgZjJmc19zZXRhdHRyKHN0cnVjdCBtbnRf
aWRtYXAgKmlkbWFwLCBzdHJ1Y3QgZGVudHJ5ICpkZW50cnksCj4gPiAgICAgICAgICAgICAgIHJl
dHVybiAtRVBFUk07Cj4gPgo+ID4gICAgICAgaWYgKChhdHRyLT5pYV92YWxpZCAmIEFUVFJfU0la
RSkpIHsKPiA+IC0gICAgICAgICAgICAgaWYgKCFmMmZzX2lzX2NvbXByZXNzX2JhY2tlbmRfcmVh
ZHkoaW5vZGUpKQo+ID4gKyAgICAgICAgICAgICBpZiAoIWYyZnNfaXNfY29tcHJlc3NfYmFja2Vu
ZF9yZWFkeShpbm9kZSkgfHwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElTX0RF
VklDRV9BTElBU0lORyhpbm9kZSkpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
T1BOT1RTVVBQOwo+ID4gICAgICAgICAgICAgICBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUs
IEZJX0NPTVBSRVNTX1JFTEVBU0VEKSAmJgo+ID4gICAgICAgICAgICAgICAgICAgICAgICFJU19B
TElHTkVEKGF0dHItPmlhX3NpemUsCj4gPiBAQCAtMTg1NSw3ICsxODc2LDcgQEAgc3RhdGljIGxv
bmcgZjJmc19mYWxsb2NhdGUoc3RydWN0IGZpbGUgKmZpbGUsIGludCBtb2RlLAo+ID4gICAgICAg
ICAgICAgICByZXR1cm4gLUVJTzsKPiA+ICAgICAgIGlmICghZjJmc19pc19jaGVja3BvaW50X3Jl
YWR5KEYyRlNfSV9TQihpbm9kZSkpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVOT1NQQzsK
PiA+IC0gICAgIGlmICghZjJmc19pc19jb21wcmVzc19iYWNrZW5kX3JlYWR5KGlub2RlKSkKPiA+
ICsgICAgIGlmICghZjJmc19pc19jb21wcmVzc19iYWNrZW5kX3JlYWR5KGlub2RlKSB8fCBJU19E
RVZJQ0VfQUxJQVNJTkcoaW5vZGUpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNV
UFA7Cj4gPgo+ID4gICAgICAgLyogZjJmcyBvbmx5IHN1cHBvcnQgLT5mYWxsb2NhdGUgZm9yIHJl
Z3VsYXIgZmlsZSAqLwo+ID4gQEAgLTMyNjQsNiArMzI4NSw5IEBAIGludCBmMmZzX3Bpbl9maWxl
X2NvbnRyb2woc3RydWN0IGlub2RlICppbm9kZSwgYm9vbCBpbmMpCj4gPiAgICAgICBzdHJ1Y3Qg
ZjJmc19pbm9kZV9pbmZvICpmaSA9IEYyRlNfSShpbm9kZSk7Cj4gPiAgICAgICBzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOwo+ID4KPiA+ICsgICAgIGlmIChJU19E
RVZJQ0VfQUxJQVNJTkcoaW5vZGUpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
PiA+ICsKPiA+ICAgICAgIGlmIChmaS0+aV9nY19mYWlsdXJlcyA+PSBzYmktPmdjX3Bpbl9maWxl
X3RocmVzaG9sZCkgewo+ID4gICAgICAgICAgICAgICBmMmZzX3dhcm4oc2JpLCAiJXM6IEVuYWJs
ZSBHQyA9IGlubyAlbHggYWZ0ZXIgJXggR0MgdHJpYWxzIiwKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIF9fZnVuY19fLCBpbm9kZS0+aV9pbm8sIGZpLT5pX2djX2ZhaWx1cmVzKTsKPiA+IEBA
IC0zMjk0LDYgKzMzMTgsOSBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX3NldF9waW5fZmlsZShzdHJ1
Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4gPiAgICAgICBpZiAoZjJmc19yZWFk
b25seShzYmktPnNiKSkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FUk9GUzsKPiA+Cj4gPiAr
ICAgICBpZiAoIXBpbiAmJiBJU19ERVZJQ0VfQUxJQVNJTkcoaW5vZGUpKQo+ID4gKyAgICAgICAg
ICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiArCj4gPiAgICAgICByZXQgPSBtbnRfd2FudF93
cml0ZV9maWxlKGZpbHApOwo+ID4gICAgICAgaWYgKHJldCkKPiA+ICAgICAgICAgICAgICAgcmV0
dXJuIHJldDsKPiA+IEBAIC00NzExLDcgKzQ3MzgsOCBAQCBzdGF0aWMgaW50IGYyZnNfcHJlYWxs
b2NhdGVfYmxvY2tzKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICppdGVyLAo+
ID4gICAgICAgZWxzZQo+ID4gICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+Cj4gPiAtICAgICBt
YXAubV9tYXlfY3JlYXRlID0gdHJ1ZTsKPiA+ICsgICAgIGlmICghSVNfREVWSUNFX0FMSUFTSU5H
KGlub2RlKSkKPiA+ICsgICAgICAgICAgICAgbWFwLm1fbWF5X2NyZWF0ZSA9IHRydWU7Cj4gPiAg
ICAgICBpZiAoZGlvKSB7Cj4gPiAgICAgICAgICAgICAgIG1hcC5tX3NlZ190eXBlID0gZjJmc19y
d19oaW50X3RvX3NlZ190eXBlKHNiaSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBpbm9kZS0+aV93cml0ZV9oaW50KTsKPiA+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL2lub2RlLmMgYi9mcy9mMmZzL2lub2RlLmMKPiA+IGluZGV4IGFlZjU3MTcyMDE0Zi4u
ZjExOGU5NTViYTg4IDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9pbm9kZS5jCj4gPiArKysgYi9m
cy9mMmZzL2lub2RlLmMKPiA+IEBAIC0zNjcsNiArMzY3LDEyIEBAIHN0YXRpYyBib29sIHNhbml0
eV9jaGVja19pbm9kZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgcGFnZSAqbm9kZV9wYWdl
KQo+ID4gICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiAgICAgICB9Cj4gPgo+ID4gKyAg
ICAgaWYgKChmaS0+aV9mbGFncyAmIEYyRlNfREVWSUNFX0FMSUFTX0ZMKSAmJiAhZjJmc19zYl9o
YXNfZGV2aWNlX2FsaWFzKHNiaSkpIHsKPiA+ICsgICAgICAgICAgICAgZjJmc193YXJuKHNiaSwg
IiVzOiBpbm9kZSAoaW5vPSVseCkgaGFzIGRldmljZSBhbGlhcyBmbGFnLCBidXQgdGhlIGZlYXR1
cmUgaXMgb2ZmIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBpbm9kZS0+
aV9pbm8pOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiArICAgICB9Cj4KPiBE
byB3ZSBuZWVkIHRvIGRvIHNhbml0eSBjaGVjayBkZXZpY2VfYWxpYXMgZmVhdHVyZSBmbGFnIHcv
Cj4gc2IuZGV2c1tdLnBhdGggZm9ybWF0PyBhbmQgcmVsYXRlZCBpbm9kZT8KClNvcnJ5LCBJIGFt
IG5vdCBzdXJlIEkgZ290IHlvdXIgcG9pbnQuIENvdWxkIHlvdSBlbGFib3JhdGUgaXQgbW9yZT8K
Cj4KPiA+ICsKPiA+ICAgICAgIHJldHVybiB0cnVlOwo+ID4gICB9Cj4gPgo+ID4gQEAgLTgxOCw4
ICs4MjQsNiBAQCB2b2lkIGYyZnNfZXZpY3RfaW5vZGUoc3RydWN0IGlub2RlICppbm9kZSkKPiA+
ICAgICAgIGYyZnNfYnVnX29uKHNiaSwgZ2V0X2RpcnR5X3BhZ2VzKGlub2RlKSk7Cj4gPiAgICAg
ICBmMmZzX3JlbW92ZV9kaXJ0eV9pbm9kZShpbm9kZSk7Cj4gPgo+ID4gLSAgICAgZjJmc19kZXN0
cm95X2V4dGVudF90cmVlKGlub2RlKTsKPgo+IEZvciBoYXJkbGluayBpbm9kZSwgaXQgbWlzc2Vk
IHRvIGNhbGwgZjJmc19kZXN0cm95X2V4dGVudF90cmVlKCk/CgpHb3QgaXQuCgo+Cj4gVGhhbmtz
LAo+Cj4gPiAtCj4gPiAgICAgICBpZiAoaW5vZGUtPmlfbmxpbmsgfHwgaXNfYmFkX2lub2RlKGlu
b2RlKSkKPiA+ICAgICAgICAgICAgICAgZ290byBub19kZWxldGU7Cj4gPgo+ID4gQEAgLTg3NCw2
ICs4NzgsOCBAQCB2b2lkIGYyZnNfZXZpY3RfaW5vZGUoc3RydWN0IGlub2RlICppbm9kZSkKPiA+
ICAgICAgICAgICAgICAgZ290byByZXRyeTsKPiA+ICAgICAgIH0KPiA+Cj4gPiArICAgICBmMmZz
X2Rlc3Ryb3lfZXh0ZW50X3RyZWUoaW5vZGUpOwo+ID4gKwo+ID4gICAgICAgaWYgKGVycikgewo+
ID4gICAgICAgICAgICAgICBmMmZzX3VwZGF0ZV9pbm9kZV9wYWdlKGlub2RlKTsKPiA+ICAgICAg
ICAgICAgICAgaWYgKGRxdW90X2luaXRpYWxpemVfbmVlZGVkKGlub2RlKSkKPiA+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL3N5c2ZzLmMgYi9mcy9mMmZzL3N5c2ZzLmMKPiA+IGluZGV4IGZlZTdlZTQ1
Y2VhYS4uYmY2NGY0Y2MzNTIyIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9zeXNmcy5jCj4gPiAr
KysgYi9mcy9mMmZzL3N5c2ZzLmMKPiA+IEBAIC0xMjgxLDYgKzEyODEsNyBAQCBGMkZTX1NCX0ZF
QVRVUkVfUk9fQVRUUihzYl9jaGVja3N1bSwgU0JfQ0hLU1VNKTsKPiA+ICAgRjJGU19TQl9GRUFU
VVJFX1JPX0FUVFIoY2FzZWZvbGQsIENBU0VGT0xEKTsKPiA+ICAgRjJGU19TQl9GRUFUVVJFX1JP
X0FUVFIoY29tcHJlc3Npb24sIENPTVBSRVNTSU9OKTsKPiA+ICAgRjJGU19TQl9GRUFUVVJFX1JP
X0FUVFIocmVhZG9ubHksIFJPKTsKPiA+ICtGMkZTX1NCX0ZFQVRVUkVfUk9fQVRUUihkZXZpY2Vf
YWxpYXMsIERFVklDRV9BTElBUyk7Cj4gPgo+ID4gICBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAq
ZjJmc19zYl9mZWF0X2F0dHJzW10gPSB7Cj4gPiAgICAgICBBVFRSX0xJU1Qoc2JfZW5jcnlwdGlv
biksCj4gPiBAQCAtMTI5Nyw2ICsxMjk4LDcgQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmYy
ZnNfc2JfZmVhdF9hdHRyc1tdID0gewo+ID4gICAgICAgQVRUUl9MSVNUKHNiX2Nhc2Vmb2xkKSwK
PiA+ICAgICAgIEFUVFJfTElTVChzYl9jb21wcmVzc2lvbiksCj4gPiAgICAgICBBVFRSX0xJU1Qo
c2JfcmVhZG9ubHkpLAo+ID4gKyAgICAgQVRUUl9MSVNUKHNiX2RldmljZV9hbGlhcyksCj4gPiAg
ICAgICBOVUxMLAo+ID4gICB9Owo+ID4gICBBVFRSSUJVVEVfR1JPVVBTKGYyZnNfc2JfZmVhdCk7
Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
