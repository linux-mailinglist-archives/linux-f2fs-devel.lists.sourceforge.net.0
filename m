Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DECBB97C2D4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Sep 2024 04:23:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sr6pc-00068z-59;
	Thu, 19 Sep 2024 02:23:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1sr6pY-00068s-VJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Sep 2024 02:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qhLFHkcyTLaLAQFd6owrvSOx6913wgzUyjCt8LLZGTw=; b=i0LNuQLFCg0lRE9jKY3y3+vD1O
 SXJH7L0zGXhq49wyxXCo8fSo9w1JxRRCXPgYf5vzrDK99Bfnz+hMw1X6FxTxz0r+2Ba02E9yh7ZpD
 wBPfo9G68hv5n0fE82U8hboba0J/SwBpj/qrsOHWvFNqqZ/nUJHaLqaNf5Xl8BNXEF5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qhLFHkcyTLaLAQFd6owrvSOx6913wgzUyjCt8LLZGTw=; b=E1rPD22JrI0HfqmaEBRpi8sF17
 XI26NTK29pKVLOfeK+VOBGQM06TWHDEcP6RNyHkdeV6txFfOA/NWCJZG7Eav2jPyuZMoehUPyWs4L
 6Hs6Z/mVaPumgh6GbIJRh5KRnzQeV61ezKomdrcmBx7NN/vYBVa6WkkmETLQhBtrAm6M=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sr6pY-0001gK-2W for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Sep 2024 02:23:40 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42cb1e3b449so452905e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Sep 2024 19:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726712608; x=1727317408; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhLFHkcyTLaLAQFd6owrvSOx6913wgzUyjCt8LLZGTw=;
 b=NEjAQ5ZttEGsV3O4IpxYoYFFmb4V5XSO2VrO1hgE1Gdw9yL8guj3iwc7H7iUnwAnA/
 KXpIh73/fISQdblp23IPAGvSKTHOpZSBX6psVV+6y1NovG1sgUWtcZKDQLjF8mxVSR+k
 wQaZIQOP3PJOCZqGwkPfaiPzK+ZDzdSUVdYQZncy7d8Zd4tVyT6FLhzZxL68HPdfxYEe
 LE/2iQRIDcrEsDUAeKLOC+XVqnaT/Cw5hu7c5T4qA7Ip22J9tegQAcWTsJd52/hIEKob
 wpAKXiP/TUVeFzb19BvpGENsVfJHEJgTHD0F5IM7vjhYo2Ix8bcYAH34PUksO2TKZYZt
 pejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726712608; x=1727317408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhLFHkcyTLaLAQFd6owrvSOx6913wgzUyjCt8LLZGTw=;
 b=SNqVlcuHjI76FizPK34d2WaxKRt2s5MZeA09XugFWQObpS76Fie5zxNUDoY5NKhqSX
 FHiMKEBQbSys6BbtfEcVDMWzdNLsQW9WeR8ABtJivHBaj2qWDPbJRHldVc//1LQYmeVd
 5/eiV2H3EXB5cvNYzWgZPv5MtvZB59LJf30nt/InbaqKqGt/X49op5T1G0GQlIjiIlX+
 M/4Qw+tGeGVjIixeANQ4KCcwdH1MNiDHK/S+DqqkRT5bM2ZVrzSHrPaNkyh+lkC97Qyk
 z1jgT/jZYCqIERl8xpFc26zn5Ca304vWEA4rZ7p5gX92QVuuY0mSLN+lfTSnE6GRx7vV
 3YGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDO3T9SIASGf9Ej6qNWyGnjZKezM9j5jqiR2DRrzqOWkH8TviTe9TjbB5XbGvNDEZkK58YhOTD7wvwjSDqeTtd@lists.sourceforge.net
X-Gm-Message-State: AOJu0YziRFvCBUomrZs3/WJ52rPA/RKIu/6sknj2wA166Rkb7qLhuR1k
 HDvsCeENI6543McKYsvUzZDJo3BiAcCI2B3JQbfNaHDhGaWSNexRArV5EmowZnd8q5UrA4GEeK7
 aU2WlZZjgXYcSKcmb3ujpnHuqFjE=
X-Google-Smtp-Source: AGHT+IEQwE+ThE/YOYpbVVYE+8FMAFtPY47RuCYrjbUPt+edKMJfmiWw86bn75YFfVDR9A3zwT5W2FyPgC7RrlnITEc=
X-Received: by 2002:a05:6000:1f89:b0:376:b7e4:c53d with SMTP id
 ffacd0b85a97d-378c2a4ae79mr7568845f8f.0.1726712608016; Wed, 18 Sep 2024
 19:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <1726123214-208356-1-git-send-email-liuderong@oppo.com>
 <1726123214-208356-3-git-send-email-liuderong@oppo.com>
 <17ceed17-b17f-42d9-8c82-79f1f4814c1a@kernel.org>
In-Reply-To: <17ceed17-b17f-42d9-8c82-79f1f4814c1a@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 19 Sep 2024 10:23:16 +0800
Message-ID: <CAHJ8P3LNpZamiva_Ktck+tRKXvyAAYK0dg_z2Mwjiq41aeMF0Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -1.0 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2024年9月18日周三 14:45写道：
    > > On 2024/9/12 14:40, > > From: liuderong > > > > When segs_per_sec is
   larger than 1, section may contain free segments, > [...] 
 
 Content analysis details:   (-1.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.41 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -1.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1sr6pY-0001gK-2W
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: introduce get_section_mtime
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

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjTlubQ55pyIMTjml6XlkajkuIkgMTQ6NDXlhpnpgZPvvJoKPgo+
IE9uIDIwMjQvOS8xMiAxNDo0MCwgbGl1ZGVyb25nQG9wcG8uY29tIHdyb3RlOgo+ID4gRnJvbTog
bGl1ZGVyb25nIDxsaXVkZXJvbmdAb3Bwby5jb20+Cj4gPgo+ID4gV2hlbiBzZWdzX3Blcl9zZWMg
aXMgbGFyZ2VyIHRoYW4gMSwgc2VjdGlvbiBtYXkgY29udGFpbiBmcmVlIHNlZ21lbnRzLAo+ID4g
bXRpbWUgc2hvdWxkIGJlIHRoZSBtZWFuIHZhbHVlIG9mIGVhY2ggdmFsaWQgc2VnbWVudHMsCj4g
PiBzbyBpbnRyb2R1Y2UgZ2V0X3NlY3Rpb25fbXRpbWUgdG8gZXhjbHVkZSBmcmVlIHNlZ21lbnRz
IGluIGEgc2VjdGlvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBsaXVkZXJvbmcgPGxpdWRlcm9u
Z0BvcHBvLmNvbT4KPiA+IC0tLQo+ID4gICBmcy9mMmZzL2YyZnMuaCAgICB8ICAyICsrCj4gPiAg
IGZzL2YyZnMvZ2MuYyAgICAgIHwgMTUgKystLS0tLS0tLS0tLS0tCj4gPiAgIGZzL2YyZnMvc2Vn
bWVudC5jIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KPiA+
ICAgMyBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+ID4gaW5k
ZXggNGRjZGNkZC4uZDZhZGYwZiAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gPiAr
KysgYi9mcy9mMmZzL2YyZnMuaAo+ID4gQEAgLTM3NjIsNiArMzc2Miw4IEBAIGVudW0gcndfaGlu
dCBmMmZzX2lvX3R5cGVfdG9fcndfaGludChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPiAg
IHVuc2lnbmVkIGludCBmMmZzX3VzYWJsZV9zZWdzX2luX3NlYyhzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmkpOwo+ID4gICB1bnNpZ25lZCBpbnQgZjJmc191c2FibGVfYmxrc19pbl9zZWcoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBzZWdubyk7Cj4gPiArdW5zaWduZWQgbG9uZyBsb25nIGdldF9zZWN0aW9uX210aW1lKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgc2Vnbm8pOwo+Cj4gSGkgRGVyb25nLAo+Cj4gSXQgbmVlZHMgdG8gYWRkICJmMmZzXyIgcHJl
Zml4IGZvciBnZXRfc2VjdGlvbl9tdGltZSgpIHRvIGF2b2lkIGdsb2JhbAo+IG5hbWVzcGFjZSBw
b2xsdXRpb24uCj4KPiA+Cj4gPiAgICNkZWZpbmUgREVGX0ZSQUdNRU5UX1NJWkUgICA0Cj4gPiAg
ICNkZWZpbmUgTUlOX0ZSQUdNRU5UX1NJWkUgICAxCj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9n
Yy5jIGIvZnMvZjJmcy9nYy5jCj4gPiBpbmRleCA2Mjk5NjM5Li4wM2M2MTE3IDEwMDY0NAo+ID4g
LS0tIGEvZnMvZjJmcy9nYy5jCj4gPiArKysgYi9mcy9mMmZzL2djLmMKPiA+IEBAIC0zMzIsMjAg
KzMzMiwxNCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGNoZWNrX2JnX3ZpY3RpbXMoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpKQo+ID4gICBzdGF0aWMgdW5zaWduZWQgaW50IGdldF9jYl9jb3N0KHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgdW5zaWduZWQgaW50IHNlZ25vKQo+ID4gICB7Cj4gPiAg
ICAgICBzdHJ1Y3Qgc2l0X2luZm8gKnNpdF9pID0gU0lUX0koc2JpKTsKPiA+IC0gICAgIHVuc2ln
bmVkIGludCBzZWNubyA9IEdFVF9TRUNfRlJPTV9TRUcoc2JpLCBzZWdubyk7Cj4gPiAtICAgICB1
bnNpZ25lZCBpbnQgc3RhcnQgPSBHRVRfU0VHX0ZST01fU0VDKHNiaSwgc2Vjbm8pOwo+ID4gICAg
ICAgdW5zaWduZWQgbG9uZyBsb25nIG10aW1lID0gMDsKPiA+ICAgICAgIHVuc2lnbmVkIGludCB2
YmxvY2tzOwo+ID4gICAgICAgdW5zaWduZWQgY2hhciBhZ2UgPSAwOwo+ID4gICAgICAgdW5zaWdu
ZWQgY2hhciB1Owo+ID4gLSAgICAgdW5zaWduZWQgaW50IGk7Cj4gPiAgICAgICB1bnNpZ25lZCBp
bnQgdXNhYmxlX3NlZ3NfcGVyX3NlYyA9IGYyZnNfdXNhYmxlX3NlZ3NfaW5fc2VjKHNiaSk7Cj4g
Pgo+ID4gLSAgICAgZm9yIChpID0gMDsgaSA8IHVzYWJsZV9zZWdzX3Blcl9zZWM7IGkrKykKPiA+
IC0gICAgICAgICAgICAgbXRpbWUgKz0gZ2V0X3NlZ19lbnRyeShzYmksIHN0YXJ0ICsgaSktPm10
aW1lOwo+ID4gKyAgICAgbXRpbWUgPSBnZXRfc2VjdGlvbl9tdGltZShzYmksIHNlZ25vKTsKPiA+
ICAgICAgIHZibG9ja3MgPSBnZXRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vnbm8sIHRydWUpOwo+ID4g
LQo+ID4gLSAgICAgbXRpbWUgPSBkaXZfdTY0KG10aW1lLCB1c2FibGVfc2Vnc19wZXJfc2VjKTsK
PiA+ICAgICAgIHZibG9ja3MgPSBkaXZfdTY0KHZibG9ja3MsIHVzYWJsZV9zZWdzX3Blcl9zZWMp
Owo+ID4KPiA+ICAgICAgIHUgPSBCTEtTX1RPX1NFR1Moc2JpLCB2YmxvY2tzICogMTAwKTsKPiA+
IEBAIC00ODUsMTAgKzQ3OSw3IEBAIHN0YXRpYyB2b2lkIGFkZF92aWN0aW1fZW50cnkoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IHZpY3RpbV9zZWxfcG9saWN5ICpwLCB1bnNpZ25lZCBpbnQgc2Vnbm8pCj4gPiAgIHsKPiA+
ICAgICAgIHN0cnVjdCBzaXRfaW5mbyAqc2l0X2kgPSBTSVRfSShzYmkpOwo+ID4gLSAgICAgdW5z
aWduZWQgaW50IHNlY25vID0gR0VUX1NFQ19GUk9NX1NFRyhzYmksIHNlZ25vKTsKPiA+IC0gICAg
IHVuc2lnbmVkIGludCBzdGFydCA9IEdFVF9TRUdfRlJPTV9TRUMoc2JpLCBzZWNubyk7Cj4gPiAg
ICAgICB1bnNpZ25lZCBsb25nIGxvbmcgbXRpbWUgPSAwOwo+ID4gLSAgICAgdW5zaWduZWQgaW50
IGk7Cj4gPgo+ID4gICAgICAgaWYgKHVubGlrZWx5KGlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9D
UF9ESVNBQkxFRCkpKSB7Cj4gPiAgICAgICAgICAgICAgIGlmIChwLT5nY19tb2RlID09IEdDX0FU
ICYmCj4gPiBAQCAtNDk2LDkgKzQ4Nyw3IEBAIHN0YXRpYyB2b2lkIGFkZF92aWN0aW1fZW50cnko
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVy
bjsKPiA+ICAgICAgIH0KPiA+Cj4gPiAtICAgICBmb3IgKGkgPSAwOyBpIDwgU0VHU19QRVJfU0VD
KHNiaSk7IGkrKykKPiA+IC0gICAgICAgICAgICAgbXRpbWUgKz0gZ2V0X3NlZ19lbnRyeShzYmks
IHN0YXJ0ICsgaSktPm10aW1lOwo+ID4gLSAgICAgbXRpbWUgPSBkaXZfdTY0KG10aW1lLCBTRUdT
X1BFUl9TRUMoc2JpKSk7Cj4gPiArICAgICBtdGltZSA9IGdldF9zZWN0aW9uX210aW1lKHNiaSwg
c2Vnbm8pOwo+ID4KPiA+ICAgICAgIC8qIEhhbmRsZSBpZiB0aGUgc3lzdGVtIHRpbWUgaGFzIGNo
YW5nZWQgYnkgdGhlIHVzZXIgKi8KPiA+ICAgICAgIGlmIChtdGltZSA8IHNpdF9pLT5taW5fbXRp
bWUpCj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQu
Ywo+ID4gaW5kZXggNjYyNzM5NC4uZTYyZTcyMiAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvc2Vn
bWVudC5jCj4gPiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+ID4gQEAgLTUzODksNiArNTM4OSw0
MSBAQCB1bnNpZ25lZCBpbnQgZjJmc191c2FibGVfc2Vnc19pbl9zZWMoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpKQo+ID4gICAgICAgcmV0dXJuIFNFR1NfUEVSX1NFQyhzYmkpOwo+ID4gICB9Cj4g
Pgo+ID4gK3Vuc2lnbmVkIGxvbmcgbG9uZyBnZXRfc2VjdGlvbl9tdGltZShzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksCj4gPiArICAgICB1bnNpZ25lZCBpbnQgc2Vnbm8pCj4gPiArewo+ID4gKyAg
ICAgdW5zaWduZWQgaW50IHVzYWJsZV9zZWdzX3Blcl9zZWMgPSBmMmZzX3VzYWJsZV9zZWdzX2lu
X3NlYyhzYmkpOwo+ID4gKyAgICAgdW5zaWduZWQgaW50IHNlY25vID0gMCwgc3RhcnQgPSAwOwo+
ID4gKyAgICAgc3RydWN0IGZyZWVfc2VnbWFwX2luZm8gKmZyZWVfaSA9IEZSRUVfSShzYmkpOwo+
ID4gKyAgICAgdW5zaWduZWQgaW50IHZhbGlkX3NlZ19jb3VudCA9IDA7Cj4gPiArICAgICB1bnNp
Z25lZCBsb25nIGxvbmcgbXRpbWUgPSAwOwo+ID4gKyAgICAgdW5zaWduZWQgaW50IGkgPSAwOwo+
ID4gKwo+ID4gKyAgICAgaWYgKHNlZ25vID09IE5VTExfU0VHTk8pCj4gPiArICAgICAgICAgICAg
IHJldHVybiAwOwo+Cj4gTm8gbmVlZGVkLgo+Cj4gPiArCj4gPiArICAgICBzZWNubyA9IEdFVF9T
RUNfRlJPTV9TRUcoc2JpLCBzZWdubyk7Cj4gPiArICAgICBzdGFydCA9IEdFVF9TRUdfRlJPTV9T
RUMoc2JpLCBzZWNubyk7Cj4gPiArCj4gPiArICAgICBpZiAoIV9faXNfbGFyZ2Vfc2VjdGlvbihz
YmkpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gZ2V0X3NlZ19lbnRyeShzYmksIHN0YXJ0ICsg
aSktPm10aW1lOwo+ID4gKwo+ID4gKyAgICAgZm9yIChpID0gMDsgaSA8IHVzYWJsZV9zZWdzX3Bl
cl9zZWM7IGkrKykgewo+ID4gKyAgICAgICAgICAgICAvKiBmb3IgbGFyZ2Ugc2VjdGlvbiwgb25s
eSBjaGVjayB0aGUgbXRpbWUgb2YgdmFsaWQgc2VnbWVudHMgKi8KPiA+ICsgICAgICAgICAgICAg
c3Bpbl9sb2NrKCZmcmVlX2ktPnNlZ21hcF9sb2NrKTsKPiA+ICsgICAgICAgICAgICAgaWYgKHRl
c3RfYml0KHN0YXJ0ICsgaSwgZnJlZV9pLT5mcmVlX3NlZ21hcCkpIHsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBtdGltZSArPSBnZXRfc2VnX2VudHJ5KHNiaSwgc3RhcnQgKyBpKS0+bXRpbWU7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgdmFsaWRfc2VnX2NvdW50Kys7Cj4gPiArICAgICAg
ICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgc3Bpbl91bmxvY2soJmZyZWVfaS0+c2VnbWFwX2xv
Y2spOwo+ID4gKyAgICAgfQo+Cj4gQWZ0ZXIgY29tbWl0IDZmM2EwMWFlOWI3MiAoImYyZnM6IHJl
Y29yZCBhdmVyYWdlIHVwZGF0ZSB0aW1lIG9mIHNlZ21lbnQiKSwKPiBtdGltZSBvZiBzZWdtZW50
IHN0YXJ0cyB0byBpbmRpY2F0ZSBhdmVyYWdlIHVwZGF0ZSB0aW1lIG9mIHNlZ21lbnQuCj4KPiBT
byBpdCBuZWVkcyB0byBjaGFuZ2UgbGlrZSB0aGlzPwo+Cj4gZm9yIChpID0gMDsgaSA8IHVzYWJs
ZV9zZWdzX3Blcl9zZWM7IGkrKykgewo+ICAgICAgICAgc3RydWN0IHNlZ19lbnRyeSAqc2UgPSBn
ZXRfc2VnX2VudHJ5KHNiaSwgc3RhcnQgKyBpKTsKPgo+ICAgICAgICAgbXRpbWUgKz0gc2UtPm10
aW1lICogc2UtPnZhbGlkX2Jsb2NrczsKPiAgICAgICAgIHRvdGFsX3ZhbGlkX2Jsb2NrcyArPSBz
ZS0+dmFsaWRfYmxvY2tzOwo+IH0KaGkgQ2hhbywKYWZ0ZXIgSSByZWFkIHRoaXMgcGF0Y2ggZnJv
bSBEZXJvbmcgYW5kIGJhc2Ugb24geW91ciB0aGlzIGNvbW1lbnQsCkkgaGF2ZSBzb21lIGRvdWJ0
c++8mgptdGltZSBpcyB1cGRhdGUgaW4gdXBkYXRlX3NlZ21lbnRfbXRpbWUsIGFuZCB0aGlzIEFQ
SSBpcyBjYWxsZWQgYnkKbW9yZSB0aGFuIG9uZSBwYXRo77yMIHN1Y2ggYXMgZjJmc19pbnZhbGlk
YXRlX2Jsb2NrcyBhbmQgZjJmc19hbGxvY2F0ZV9kYXRhX2Jsb2NrLAphbmQgc2UtPm10aW1lIGlz
IGNhbGN1bGF0ZWQgYnkgdGhlIGZvbGxvd2luZyAgZmxvdyBpZiBzZS0+bXRpbWUgaXMgbm90IG51
bGwuCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNlLT5tdGltZSA9IGRpdl91NjQo
c2UtPm10aW1lICogc2UtPnZhbGlkX2Jsb2NrcyArIG10aW1lLApzZS0+dmFsaWRfYmxvY2tzICsg
MSk7Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmlmIHRoaXMgaXMgY2FsbGVkIGZy
b20gZjJmc19pbnZhbGlkYXRlX2Jsb2Nrcywgc2UtPm10aW1lIGlzIHN0aWxsIGNhbGN1bGF0ZWQg
YnkKbXRpbWUgLyBzZS0+dmFsaWRfYmxvY2tzICsgMSwgYnV0IHRoZSByZWFsIHZhbHVlIG9mIHNl
LT52YWxpZF9ibG9ja3Mgd2lsbAp3aWxsIGJlIHJlZHVjZWQgIDHvvIxTbyBpc27igJl0IGl0IGEg
Yml0IGluYWNjdXJhdGUganVzdCBjYWxjdWxhdGluZyB2YWxpZApibG9ja3MgaW4gdGhpcyBwYXRj
aD8KdGhhbmtzIQo+Cj4gaWYgKHRvdGFsX3ZhbGlkX2Jsb2NrcyA9PSAwKQo+ICAgICAgICAgcmV0
dXJuIDA7Cj4KPiByZXR1cm4gZGl2X3U2NChtdGltZSwgdG90YWxfdmFsaWRfYmxvY2tzKTsKPgo+
IFRoYW5rcywKPgo+ID4gKwo+ID4gKyAgICAgaWYgKHZhbGlkX3NlZ19jb3VudCA9PSAwKQo+ID4g
KyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ICsKPiA+ICsgICAgIHJldHVybiBkaXZfdTY0KG10
aW1lLCB2YWxpZF9zZWdfY291bnQpOwo+ID4gK30KPiA+ICsKPiA+ICAgLyoKPiA+ICAgICogVXBk
YXRlIG1pbiwgbWF4IG1vZGlmaWVkIHRpbWUgZm9yIGNvc3QtYmVuZWZpdCBHQyBhbGdvcml0aG0K
PiA+ICAgICovCj4gPiBAQCAtNTQwMiwxMyArNTQzNyw5IEBAIHN0YXRpYyB2b2lkIGluaXRfbWlu
X21heF9tdGltZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gPiAgICAgICBzaXRfaS0+bWlu
X210aW1lID0gVUxMT05HX01BWDsKPiA+Cj4gPiAgICAgICBmb3IgKHNlZ25vID0gMDsgc2Vnbm8g
PCBNQUlOX1NFR1Moc2JpKTsgc2Vnbm8gKz0gU0VHU19QRVJfU0VDKHNiaSkpIHsKPiA+IC0gICAg
ICAgICAgICAgdW5zaWduZWQgaW50IGk7Cj4gPiAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
bG9uZyBtdGltZSA9IDA7Cj4gPgo+ID4gLSAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgU0VH
U19QRVJfU0VDKHNiaSk7IGkrKykKPiA+IC0gICAgICAgICAgICAgICAgICAgICBtdGltZSArPSBn
ZXRfc2VnX2VudHJ5KHNiaSwgc2Vnbm8gKyBpKS0+bXRpbWU7Cj4gPiAtCj4gPiAtICAgICAgICAg
ICAgIG10aW1lID0gZGl2X3U2NChtdGltZSwgU0VHU19QRVJfU0VDKHNiaSkpOwo+ID4gKyAgICAg
ICAgICAgICBtdGltZSA9IGdldF9zZWN0aW9uX210aW1lKHNiaSwgc2Vnbm8pOwo+ID4KPiA+ICAg
ICAgICAgICAgICAgaWYgKHNpdF9pLT5taW5fbXRpbWUgPiBtdGltZSkKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICBzaXRfaS0+bWluX210aW1lID0gbXRpbWU7Cj4KPgo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
