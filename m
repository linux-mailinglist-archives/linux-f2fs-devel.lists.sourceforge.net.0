Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B70957D7B1F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Oct 2023 04:57:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qvqYX-0002WO-OG;
	Thu, 26 Oct 2023 02:57:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1qvqYW-0002WI-OK
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Oct 2023 02:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wjcX8xEr22WkDUSJPrJz4vn34WBOxifwZu4rEIY0Thc=; b=ZVWDhGmQ5bQepEj9qC4YgFSY3z
 1nREqMWnmP7wDA+4fYGsvjN3xk+Pdcn8ltp612mg0YsAFIoFmTTPflo4WevQqsQIeBs0Jw3txjovW
 Bt5Y4M9eQHqIgLELlXHgBZwYitEFRNnnUb5viiouMyAu/mDXyWAAcvJ7g+XskOoOuLR4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wjcX8xEr22WkDUSJPrJz4vn34WBOxifwZu4rEIY0Thc=; b=Cba8FmhV8ccca6AvG7uNXazZm1
 q6A/oxxJorrblrGkVtEQnCVrJ3PK/unSGnLXJhl/hyRCpBYR0aBkISVkewuwIN+YXJTaVJaoUE+bE
 cwPQ8n5VNXuksOnjbt2KVHQF/4HPlOw/iDzWfe0LpU103dvt9tcdHi6nSReebQ0R1BSc=;
Received: from mail-ua1-f43.google.com ([209.85.222.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qvqYW-0005ra-HB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Oct 2023 02:57:09 +0000
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-7b6043d0b82so186924241.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Oct 2023 19:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698289022; x=1698893822; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wjcX8xEr22WkDUSJPrJz4vn34WBOxifwZu4rEIY0Thc=;
 b=IAK1nz29xUNi/6exOatI5lnyUP16pqN+nHRSABuLJi6Qmj2TRg2F3rIOgAzJE+ORlE
 7G+R95QhExiHWom7DAF4qATPCR8piMYqbGnpmZIWst8xtxTqlJQP34n+pTu38hjOmt3p
 5fi5excO5CzZN1p4m3H+l1oxHep4iI647qmdgSDr8liWAvmyAMjfxyVwRBA9s3lC+wwn
 sfGx0wuJLaFdw4iyTipCWWpGrzLX98H6vFNGx37NHxfyhdh1VTvM5a6kN1JZGxNcZ3iN
 jd85ty9YVG45TJld+lgBsZF9Q17SmP0gZHJFZQqzKnHm2M3LXfkt1tzWNgz63NNlTS+o
 S1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698289022; x=1698893822;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wjcX8xEr22WkDUSJPrJz4vn34WBOxifwZu4rEIY0Thc=;
 b=aJuzROssP6IDAMczNBS3DzxHDxKHin9htfs+w6tKGoSZrz/d1MbenQYKikJDwMVekp
 peFXYmtSOLv3uzPBi99XO+MpBV/gpgLQXKXIFTe8YCyFEBa8TDVrABv/hPb6595lKE+G
 LEeabT6n5XsWAX97GTakU+g8Yk9j+9NubcsdmML/389JXQhc+oO9lV6PoMgm6xGCb+sL
 hY2FHa7xk68NernQruQ8J/NlU9uL0uTlNpI0PK8ze9ub7rCyCCST6BWDZo2h8wBFS/Ev
 zV5Zyr61Xo3YX68PeLGH3m8pZPDoEyGSVcdGGCURxqaKO3PFR7KtOyrMXIosxN+K+9L/
 LEIA==
X-Gm-Message-State: AOJu0Yw34ipoyPBKGNE7vgB5CpWylfRGzTwYRCDa6fd9shmvMNnesrL4
 Tta1MLXzJWrnHKofDcDMd6ySnZlWBJ31JjYoSK6Knqce
X-Google-Smtp-Source: AGHT+IExVucxUyxKYRBKH3I0xHBJJNlUffiCa3mxWTA/HSYEeYSgWi1I/Msizhzz2fZKKryIlWTV5wmJeLHOUhN3Xp4=
X-Received: by 2002:a67:e150:0:b0:452:b574:3c9a with SMTP id
 o16-20020a67e150000000b00452b5743c9amr15549593vsl.26.1698289022471; Wed, 25
 Oct 2023 19:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231018223925.2135987-1-daeho43@gmail.com>
In-Reply-To: <20231018223925.2135987-1-daeho43@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 25 Oct 2023 19:56:51 -0700
Message-ID: <CACOAw_wKXnHznkN-LWnNp8Va4-Lx_BKgVzQEfPjhuY248yhcjQ@mail.gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 kernel-team@android.com
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Let me fix one thing for this patch. On Wed, Oct 18, 2023
   at 3:39 PM Daeho Jeong wrote: > > From: Daeho Jeong > > We need to make
   sure to finish all the zones except six open zones. In > a case of that the
    previous mount wasn't suc [...] 
 
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.43 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1qvqYW-0005ra-HB
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: make six open zone check
 resilient
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

TGV0IG1lIGZpeCBvbmUgdGhpbmcgZm9yIHRoaXMgcGF0Y2guCgpPbiBXZWQsIE9jdCAxOCwgMjAy
MyBhdCAzOjM54oCvUE0gRGFlaG8gSmVvbmcgPGRhZWhvNDNAZ21haWwuY29tPiB3cm90ZToKPgo+
IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4KPiBXZSBuZWVkIHRv
IG1ha2Ugc3VyZSB0byBmaW5pc2ggYWxsIHRoZSB6b25lcyBleGNlcHQgc2l4IG9wZW4gem9uZXMu
IEluCj4gYSBjYXNlIG9mIHRoYXQgdGhlIHByZXZpb3VzIG1vdW50IHdhc24ndCBzdWNjZXNzZnVs
bHkgdW5tb3VudGVkLCB3ZSBoYXZlCj4gdG8gY2hhbmdlIGFsbCB0aGUgY3VycmVudCBzZWdtZW50
cy4KPgo+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+
Cj4gLS0tCj4gIGZzY2svZnNjay5jICAgICAgICAgfCA4NyArKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVkZS9mMmZzX2ZzLmggICB8ICAxICsKPiAg
bGliL2xpYmYyZnNfem9uZWQuYyB8IDI4ICsrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5n
ZWQsIDY1IGluc2VydGlvbnMoKyksIDUxIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Zz
Y2svZnNjay5jIGIvZnNjay9mc2NrLmMKPiBpbmRleCA5OWNmYWNlLi44OTBiNTM2IDEwMDY0NAo+
IC0tLSBhL2ZzY2svZnNjay5jCj4gKysrIGIvZnNjay9mc2NrLmMKPiBAQCAtMjU4NywxMCArMjU4
Nyw5IEBAIHN0YXRpYyBpbnQgY2hlY2tfY3Vyc2VnX3dyaXRlX3BvaW50ZXIoc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpLCBpbnQgdHlwZSkKPiAgICAgICAgIHN0cnVjdCBjdXJzZWdfaW5mbyAqY3Vy
c2VnID0gQ1VSU0VHX0koc2JpLCB0eXBlKTsKPiAgICAgICAgIHN0cnVjdCBmMmZzX2ZzY2sgKmZz
Y2sgPSBGMkZTX0ZTQ0soc2JpKTsKPiAgICAgICAgIHN0cnVjdCBibGtfem9uZSBibGt6Owo+IC0g
ICAgICAgYmxvY2tfdCBjc19ibG9jaywgd3BfYmxvY2ssIHpvbmVfbGFzdF92YmxvY2s7Cj4gKyAg
ICAgICBibG9ja190IGNzX2Jsb2NrLCB3cF9ibG9jazsKPiAgICAgICAgIHVpbnQ2NF90IGNzX3Nl
Y3Rvciwgd3Bfc2VjdG9yOwo+ICAgICAgICAgaW50IGksIHJldDsKPiAtICAgICAgIHVuc2lnbmVk
IGludCB6b25lX3NlZ25vOwo+ICAgICAgICAgaW50IGxvZ19zZWN0b3JzX3Blcl9ibG9jayA9IHNi
aS0+bG9nX2Jsb2Nrc2l6ZSAtIFNFQ1RPUl9TSElGVDsKPgo+ICAgICAgICAgLyogZ2V0IHRoZSBk
ZXZpY2UgdGhlIGN1cnNlZyBwb2ludHMgdG8gKi8KPiBAQCAtMjYyNCw0OSArMjYyMywyOCBAQCBz
dGF0aWMgaW50IGNoZWNrX2N1cnNlZ193cml0ZV9wb2ludGVyKHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSwgaW50IHR5cGUpCj4gICAgICAgICAgICAgICAgIChibGtfem9uZV93cF9zZWN0b3IoJmJs
a3opID4+IGxvZ19zZWN0b3JzX3Blcl9ibG9jayk7Cj4gICAgICAgICB3cF9zZWN0b3IgPSBibGtf
em9uZV93cF9zZWN0b3IoJmJsa3opOwo+Cj4gLSAgICAgICBpZiAoY3Nfc2VjdG9yID09IHdwX3Nl
Y3RvcikKPiAtICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gLQo+IC0gICAgICAgaWYgKGNzX3Nl
Y3RvciA+IHdwX3NlY3Rvcikgewo+ICsgICAgICAgaWYgKGNzX3NlY3RvciA9PSB3cF9zZWN0b3Ip
IHsKPiArICAgICAgICAgICAgICAgaWYgKGlzX3NldF9ja3B0X2ZsYWdzKEYyRlNfQ0tQVChzYmkp
LCBDUF9VTU9VTlRfRkxBRykpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4g
KyAgICAgICAgICAgICAgIE1TRygwLCAiQ29ycmVjdCB3cml0ZSBwb2ludGVyLiBCdXQsIHdlIGNh
bid0IHRydXN0IGl0LCAiCj4gKyAgICAgICAgICAgICAgICAgICAic2luY2UgdGhlIHByZXZpb3Vz
IG1vdW50IHdhc24ndCBzYWZlbHkgdW5tb3VudGVkOiAiCj4gKyAgICAgICAgICAgICAgICAgICAi
Y3Vyc2VnICVkWzB4JXgsMHgleF1cbiIsCj4gKyAgICAgICAgICAgICAgICAgICB0eXBlLCBjdXJz
ZWctPnNlZ25vLCBjdXJzZWctPm5leHRfYmxrb2ZmKTsKPiArICAgICAgIH0gZWxzZSBpZiAoY3Nf
c2VjdG9yID4gd3Bfc2VjdG9yKSB7Cj4gICAgICAgICAgICAgICAgIE1TRygwLCAiSW5jb25zaXN0
ZW50IHdyaXRlIHBvaW50ZXIgd2l0aCBjdXJzZWcgJWQ6ICIKPiAgICAgICAgICAgICAgICAgICAg
ICJjdXJzZWcgJWRbMHgleCwweCV4XSA+IHdwWzB4JXgsMHgleF1cbiIsCj4gICAgICAgICAgICAg
ICAgICAgICB0eXBlLCB0eXBlLCBjdXJzZWctPnNlZ25vLCBjdXJzZWctPm5leHRfYmxrb2ZmLAo+
ICsgICAgICAgICAgICAgICAgICAgR0VUX1NFR05PKHNiaSwgd3BfYmxvY2spLAo+ICsgICAgICAg
ICAgICAgICAgICAgT0ZGU0VUX0lOX1NFRyhzYmksIHdwX2Jsb2NrKSk7Cj4gKyAgICAgICAgICAg
ICAgIGlmICghYy5maXhfb24pCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZnNjay0+Y2hrLndw
X2luY29uc2lzdGVudF96b25lcysrOwo+ICsgICAgICAgfSBlbHNlIHsKPiArICAgICAgICAgICAg
ICAgTVNHKDAsICJXcml0ZSBwb2ludGVyIGdvZXMgYWR2YW5jZSBmcm9tIGN1cnNlZyAlZDogIgo+
ICsgICAgICAgICAgICAgICAgICAgImN1cnNlZyAlZFsweCV4LDB4JXhdIHdwWzB4JXgsMHgleF1c
biIsCj4gKyAgICAgICAgICAgICAgICAgICB0eXBlLCB0eXBlLCBjdXJzZWctPnNlZ25vLCBjdXJz
ZWctPm5leHRfYmxrb2ZmLAo+ICAgICAgICAgICAgICAgICAgICAgR0VUX1NFR05PKHNiaSwgd3Bf
YmxvY2spLCBPRkZTRVRfSU5fU0VHKHNiaSwgd3BfYmxvY2spKTsKPiAtICAgICAgICAgICAgICAg
ZnNjay0+Y2hrLndwX2luY29uc2lzdGVudF96b25lcysrOwo+IC0gICAgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsKPiAtICAgICAgIH0KPiAtCj4gLSAgICAgICBNU0coMCwgIldyaXRlIHBvaW50
ZXIgZ29lcyBhZHZhbmNlIGZyb20gY3Vyc2VnICVkOiAiCj4gLSAgICAgICAgICAgImN1cnNlZyAl
ZFsweCV4LDB4JXhdIHdwWzB4JXgsMHgleF1cbiIsCj4gLSAgICAgICAgICAgdHlwZSwgdHlwZSwg
Y3Vyc2VnLT5zZWdubywgY3Vyc2VnLT5uZXh0X2Jsa29mZiwKPiAtICAgICAgICAgICBHRVRfU0VH
Tk8oc2JpLCB3cF9ibG9jayksIE9GRlNFVF9JTl9TRUcoc2JpLCB3cF9ibG9jaykpOwo+IC0KPiAt
ICAgICAgIHpvbmVfc2Vnbm8gPSBHRVRfU0VHX0ZST01fU0VDKHNiaSwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEdFVF9TRUNfRlJPTV9TRUcoc2JpLCBjdXJzZWctPnNl
Z25vKSk7Cj4gLSAgICAgICB6b25lX2xhc3RfdmJsb2NrID0gU1RBUlRfQkxPQ0soc2JpLCB6b25l
X3NlZ25vKSArCj4gLSAgICAgICAgICAgICAgIGxhc3RfdmJsa19vZmZfaW5fem9uZShzYmksIHpv
bmVfc2Vnbm8pOwo+IC0KPiAtICAgICAgIC8qCj4gLSAgICAgICAgKiBJZiB2YWxpZCBibG9ja3Mg
ZXhpc3QgYmV0d2VlbiB0aGUgY3Vyc2VnIHBvc2l0aW9uIGFuZCB0aGUgd3JpdGUKPiAtICAgICAg
ICAqIHBvaW50ZXIsIHRoZXkgYXJlIGZzeW5jIGRhdGEuIFRoaXMgaXMgbm90IGFuIGVycm9yIHRv
IGZpeC4gTGVhdmUgaXQKPiAtICAgICAgICAqIGZvciBrZXJuZWwgdG8gcmVjb3ZlciBsYXRlci4K
PiAtICAgICAgICAqIElmIHZhbGlkIGJsb2NrcyBleGlzdCBiZXR3ZWVuIHRoZSBjdXJzZWcncyB6
b25lIHN0YXJ0IGFuZCB0aGUgY3Vyc2VnCj4gLSAgICAgICAgKiBwb3NpdGlvbiwgb3IgaWYgdGhl
cmUgaXMgbm8gdmFsaWQgYmxvY2sgaW4gdGhlIGN1cnNlZydzIHpvbmUsIGZpeAo+IC0gICAgICAg
ICogdGhlIGluY29uc2lzdGVuY3kgYmV0d2VlbiB0aGUgY3Vyc2VnIGFuZCB0aGUgd3JpdCBwb2lu
dGVyLgo+IC0gICAgICAgICogT2YgTm90ZSBpcyB0aGF0IGlmIHRoZXJlIGlzIG5vIHZhbGlkIGJs
b2NrIGluIHRoZSBjdXJzZWcncyB6b25lLAo+IC0gICAgICAgICogbGFzdF92YmxrX29mZl9pbl96
b25lKCkgcmV0dXJucyAtMSBhbmQgem9uZV9sYXN0X3ZibG9jayBpcyBhbHdheXMKPiAtICAgICAg
ICAqIHNtYWxsZXIgdGhhbiBjc19ibG9jay4KPiAtICAgICAgICAqLwo+IC0gICAgICAgaWYgKGNz
X2Jsb2NrIDw9IHpvbmVfbGFzdF92YmxvY2sgJiYgem9uZV9sYXN0X3ZibG9jayA8IHdwX2Jsb2Nr
KSB7Cj4gLSAgICAgICAgICAgICAgIE1TRygwLCAiQ3Vyc2VnIGhhcyBmc3luYyBkYXRhOiBjdXJz
ZWcgJWRbMHgleCwweCV4XSAiCj4gLSAgICAgICAgICAgICAgICAgICAibGFzdCB2YWxpZCBibG9j
ayBpbiB6b25lWzB4JXgsMHgleF1cbiIsCj4gLSAgICAgICAgICAgICAgICAgICB0eXBlLCBjdXJz
ZWctPnNlZ25vLCBjdXJzZWctPm5leHRfYmxrb2ZmLAo+IC0gICAgICAgICAgICAgICAgICAgR0VU
X1NFR05PKHNiaSwgem9uZV9sYXN0X3ZibG9jayksCj4gLSAgICAgICAgICAgICAgICAgICBPRkZT
RVRfSU5fU0VHKHNiaSwgem9uZV9sYXN0X3ZibG9jaykpOwo+IC0gICAgICAgICAgICAgICByZXR1
cm4gMDsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgZnNjay0+Y2hrLndwX2luY29uc2lzdGVudF96
b25lcysrOwo+ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gIH0KPgo+IEBAIC0zMTU1LDEwICsz
MTMzLDggQEAgc3RhdGljIGludCBjaGtfYW5kX2ZpeF93cF93aXRoX3NpdChpbnQgVU5VU0VEKGkp
LCB2b2lkICpibGt6b25lLCB2b2lkICpvcGFxdWUpCj4gICAgICAgICBzdHJ1Y3QgZjJmc19mc2Nr
ICpmc2NrID0gRjJGU19GU0NLKHNiaSk7Cj4gICAgICAgICBibG9ja190IHpvbmVfYmxvY2ssIHdw
X2Jsb2NrLCB3cF9ibGtvZmY7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgem9uZV9zZWdubywgd3Bf
c2Vnbm87Cj4gLSAgICAgICBzdHJ1Y3QgY3Vyc2VnX2luZm8gKmNzOwo+IC0gICAgICAgaW50IGNz
X2luZGV4LCByZXQsIGxhc3RfdmFsaWRfYmxrb2ZmOwo+ICsgICAgICAgaW50IHJldCwgbGFzdF92
YWxpZF9ibGtvZmY7Cj4gICAgICAgICBpbnQgbG9nX3NlY3RvcnNfcGVyX2Jsb2NrID0gc2JpLT5s
b2dfYmxvY2tzaXplIC0gU0VDVE9SX1NISUZUOwo+IC0gICAgICAgdW5zaWduZWQgaW50IHNlZ3Nf
cGVyX3pvbmUgPSBzYmktPnNlZ3NfcGVyX3NlYyAqIHNiaS0+c2Vjc19wZXJfem9uZTsKPgo+ICAg
ICAgICAgaWYgKGJsa196b25lX2NvbnYoYmxreikpCj4gICAgICAgICAgICAgICAgIHJldHVybiAw
Owo+IEBAIC0zMTc0LDE0ICszMTUwLDYgQEAgc3RhdGljIGludCBjaGtfYW5kX2ZpeF93cF93aXRo
X3NpdChpbnQgVU5VU0VEKGkpLCB2b2lkICpibGt6b25lLCB2b2lkICpvcGFxdWUpCj4gICAgICAg
ICB3cF9zZWdubyA9IEdFVF9TRUdOTyhzYmksIHdwX2Jsb2NrKTsKPiAgICAgICAgIHdwX2Jsa29m
ZiA9IHdwX2Jsb2NrIC0gU1RBUlRfQkxPQ0soc2JpLCB3cF9zZWdubyk7Cj4KPiAtICAgICAgIC8q
IGlmIGEgY3Vyc2VnIHBvaW50cyB0byB0aGUgem9uZSwgc2tpcCB0aGUgY2hlY2sgKi8KPiAtICAg
ICAgIGZvciAoY3NfaW5kZXggPSAwOyBjc19pbmRleCA8IE5PX0NIRUNLX1RZUEU7IGNzX2luZGV4
KyspIHsKPiAtICAgICAgICAgICAgICAgY3MgPSAmU01fSShzYmkpLT5jdXJzZWdfYXJyYXlbY3Nf
aW5kZXhdOwo+IC0gICAgICAgICAgICAgICBpZiAoem9uZV9zZWdubyA8PSBjcy0+c2Vnbm8gJiYK
PiAtICAgICAgICAgICAgICAgICAgIGNzLT5zZWdubyA8IHpvbmVfc2Vnbm8gKyBzZWdzX3Blcl96
b25lKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+IC0gICAgICAgfQo+IC0K
PiAgICAgICAgIGxhc3RfdmFsaWRfYmxrb2ZmID0gbGFzdF92YmxrX29mZl9pbl96b25lKHNiaSwg
em9uZV9zZWdubyk7Cj4KPiAgICAgICAgIC8qCj4gQEAgLTMyMTcsMTAgKzMxODUsMjcgQEAgc3Rh
dGljIGludCBjaGtfYW5kX2ZpeF93cF93aXRoX3NpdChpbnQgVU5VU0VEKGkpLCB2b2lkICpibGt6
b25lLCB2b2lkICpvcGFxdWUpCj4gICAgICAgICBpZiAobGFzdF92YWxpZF9ibGtvZmYgKyB6b25l
X2Jsb2NrID4gd3BfYmxvY2spIHsKPiAgICAgICAgICAgICAgICAgTVNHKDAsICJVbmV4cGVjdGVk
IGludmFsaWQgd3JpdGUgcG9pbnRlcjogd3BbMHgleCwweCV4XVxuIiwKPiAgICAgICAgICAgICAg
ICAgICAgIHdwX3NlZ25vLCB3cF9ibGtvZmYpOwo+ICsgICAgICAgICAgICAgICBpZiAoIWMuZml4
X29uKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGZzY2stPmNoay53cF9pbmNvbnNpc3RlbnRf
em9uZXMrKzsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBpZiAoIWMuZml4X29uKQo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICAgICByZXQgPSBmMmZzX2ZpbmlzaF96b25l
KHdwZC0+ZGV2X2luZGV4LCBibGt6KTsKPiArICAgICAgIGlmIChyZXQpIHsKPiArICAgICAgICAg
ICAgICAgdTY0IGZpbGxfc2VjdHMgPSBibGtfem9uZV9sZW5ndGgoYmxreikgLQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIChibGtfem9uZV93cF9zZWN0b3IoYmxreikgLSBibGtfem9uZV9zZWN0
b3IoYmxreikpOwo+ICsgICAgICAgICAgICAgICBwcmludGYoIltGU0NLXSBGaW5pc2hpbmcgem9u
ZSBmYWlsZWQ6ICVzXG4iLCBkZXYtPnBhdGgpOwo+ICsgICAgICAgICAgICAgICByZXQgPSBkZXZf
ZmlsbChOVUxMLCB3cF9ibG9jayAqIEYyRlNfQkxLU0laRSwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAoZmlsbF9zZWN0cyA+PiBsb2dfc2VjdG9yc19wZXJfYmxvY2spICogRjJGU19CTEtTSVpF
KTsKPiArICAgICAgICAgICAgICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgICAgICAgICBw
cmludGYoIltGU0NLXSBGaWxsIHVwIHpvbmUgZmFpbGVkOiAlc1xuIiwgZGV2LT5wYXRoKTsKPiAg
ICAgICAgIH0KPgo+IC0gICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICBpZiAoIXJldCkKPiArICAg
ICAgICAgICAgICAgZnNjay0+Y2hrLndwX2ZpeGVkID0gMTsKPiArICAgICAgIHJldHVybiByZXQ7
Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBmaXhfd3Bfc2l0X2FsaWdubWVudChzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmkpCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZjJmc19mcy5oIGIvaW5jbHVkZS9m
MmZzX2ZzLmgKPiBpbmRleCA3NzJhNmE1Li5kOTRlNDQ3IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
ZjJmc19mcy5oCj4gKysrIGIvaW5jbHVkZS9mMmZzX2ZzLmgKPiBAQCAtMTc0OSw2ICsxNzQ5LDcg
QEAgZXh0ZXJuIGludCBmMmZzX3JlcG9ydF96b25lcyhpbnQsIHJlcG9ydF96b25lc19jYl90ICos
IHZvaWQgKik7Cj4gIGV4dGVybiBpbnQgZjJmc19jaGVja196b25lcyhpbnQpOwo+ICBpbnQgZjJm
c19yZXNldF96b25lKGludCwgdm9pZCAqKTsKPiAgZXh0ZXJuIGludCBmMmZzX3Jlc2V0X3pvbmVz
KGludCk7Cj4gK2ludCBmMmZzX2ZpbmlzaF96b25lKGludCBpLCB2b2lkICpibGt6b25lKTsKPiAg
ZXh0ZXJuIHVpbnQzMl90IGYyZnNfZ2V0X3VzYWJsZV9zZWdtZW50cyhzdHJ1Y3QgZjJmc19zdXBl
cl9ibG9jayAqc2IpOwo+Cj4gICNkZWZpbmUgU0laRV9BTElHTih2YWwsIHNpemUpICAoKCh2YWwp
ICsgKHNpemUpIC0gMSkgLyAoc2l6ZSkpCj4gZGlmZiAtLWdpdCBhL2xpYi9saWJmMmZzX3pvbmVk
LmMgYi9saWIvbGliZjJmc196b25lZC5jCj4gaW5kZXggMmFiMjQ5Ny4uYmE5Mjg2ZiAxMDA2NDQK
PiAtLS0gYS9saWIvbGliZjJmc196b25lZC5jCj4gKysrIGIvbGliL2xpYmYyZnNfem9uZWQuYwo+
IEBAIC01MDIsNiArNTAyLDI4IEBAIG91dDoKPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPgo+
ICtpbnQgZjJmc19maW5pc2hfem9uZShpbnQgaSwgdm9pZCAqYmxrem9uZSkKPiArewo+ICsgICAg
ICAgc3RydWN0IGJsa196b25lICpibGt6ID0gKHN0cnVjdCBibGtfem9uZSAqKWJsa3pvbmU7Cj4g
KyAgICAgICBzdHJ1Y3QgZGV2aWNlX2luZm8gKmRldiA9IGMuZGV2aWNlcyArIGk7Cj4gKyAgICAg
ICBzdHJ1Y3QgYmxrX3pvbmVfcmFuZ2UgcmFuZ2U7Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsKPiAr
ICAgICAgIGlmICghYmxrX3pvbmVfc2VxKGJsa3opIHx8IGJsa196b25lX2VtcHR5KGJsa3opKQo+
ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICAgICAvKiBOb24gZW1wdHkgc2Vx
dWVudGlhbCB6b25lOiBmaW5pc2ggKi8KPiArICAgICAgIHJhbmdlLnNlY3RvciA9IGJsa196b25l
X3NlY3RvcihibGt6KTsKPiArICAgICAgIHJhbmdlLm5yX3NlY3RvcnMgPSBibGtfem9uZV9sZW5n
dGgoYmxreik7Cj4gKyAgICAgICByZXQgPSBpb2N0bChkZXYtPmZkLCBCTEtGSU5JU0haT05FLCAm
cmFuZ2UpOwo+ICsgICAgICAgaWYgKHJldCAhPSAwKSB7Cj4gKyAgICAgICAgICAgICAgIHJldCA9
IC1lcnJubzsKPiArICAgICAgICAgICAgICAgRVJSX01TRygiaW9jdGwgQkxLRklOSVNIWk9ORSBm
YWlsZWQ6IGVycm5vPSVkXG4iLCBlcnJubyk7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0
dXJuIHJldDsKPiArfQo+ICsKPiAgdWludDMyX3QgZjJmc19nZXRfdXNhYmxlX3NlZ21lbnRzKHN0
cnVjdCBmMmZzX3N1cGVyX2Jsb2NrICpzYikKPiAgewo+ICAjaWZkZWYgSEFWRV9CTEtfWk9ORV9S
RVBfVjIKPiBAQCAtNTg4LDYgKzYxMCwxMiBAQCBpbnQgZjJmc19yZXNldF96b25lcyhpbnQgaSkK
PiAgICAgICAgIHJldHVybiAtMTsKPiAgfQo+Cj4gK2ludCBmMmZzX2ZpbmlzaF96b25lKGludCBp
LCB2b2lkICpVTlVTRUQoYmxrem9uZSkpCj4gK3sKPiArICAgICAgIEVSUl9NU0coIiVkOiBVbnN1
cHBvcnRlZCB6b25lZCBibG9jayBkZXZpY2VcbiIsIGkpOwo+ICsgICAgICAgcmV0dXJuIC0xOwo+
ICt9Cj4gKwo+ICB1aW50MzJfdCBmMmZzX2dldF91c2FibGVfc2VnbWVudHMoc3RydWN0IGYyZnNf
c3VwZXJfYmxvY2sgKnNiKQo+ICB7Cj4gICAgICAgICByZXR1cm4gZ2V0X3NiKHNlZ21lbnRfY291
bnRfbWFpbik7Cj4gLS0KPiAyLjQyLjAuNjU1Lmc0MjFmMTJjMjg0LWdvb2cKPgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
