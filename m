Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 894BF86D16E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Feb 2024 19:07:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfkon-000449-Pc;
	Thu, 29 Feb 2024 18:07:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rfkom-00043x-7x
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 18:07:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y5aO9FKYCVkPiimp5ZLTW2UUTWK+L37GG2aW8Lkr1OY=; b=ODkAP51uoTNQEhcC3wdueVhjdk
 0QXCyAkBo5kiH86rgoJJyPmNlO2kmTpVFx3Ac6x1cexBK9MSWaBI8oZjVGLP+70IGhr4erZvZJmeI
 OdmQ0jdXop21B2hcl32xHWDiXtSd/tey+AeeBxG6J+rzVl8wWGPcZMkoxFZT4lgqsjAU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y5aO9FKYCVkPiimp5ZLTW2UUTWK+L37GG2aW8Lkr1OY=; b=YwtTg0wetptsiEucQ2nJsdxUIO
 xayFLZ2oHU60Z25sBrMKu/ZObGHpjDWGA5TDyewix31rmgL+CMhEfx8ZwzLM9H4ANZX+I55D1Kjpl
 fpiOSebqq9MM8HxgNoLgizPExXcw4kA6eJqsZDu8YMPU70dIRMTyEag7snw1UGq2Dx5s=;
Received: from mail-vk1-f174.google.com ([209.85.221.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rfkom-00031W-24 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 18:07:40 +0000
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-4d34144d710so634379e0c.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Feb 2024 10:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709230049; x=1709834849; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y5aO9FKYCVkPiimp5ZLTW2UUTWK+L37GG2aW8Lkr1OY=;
 b=XoQnKc+OM0+ydDKda8BKY6xX+9RqYO029J8Sxw68cExNnhQ8A7Q+AccD6xVTyonr5l
 FyD1pJgIzzeJYsqxOmlwzxsDsxx6FrnQnpx6OgTui/5AnCl5/YWgSRxXmi6xK4ioSU0i
 nqdPs2emJI9N/HfqQkHifVup/UiykHXxU9ESQXLNhi88Ez3HAFDps26drHiy5v9irqSd
 wc6+vMikF+b+oIE97/TU+Xuri53msOBnaiRiYtvO5z6/F9MqLMgtmVMP/Xyp21+E83SK
 KblQjDARQABA2RiBnb4AF545RTrKntRmg1z+WIfTiOZCCkSHEkbkn4NSsH1XR4G+koIX
 xeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709230049; x=1709834849;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y5aO9FKYCVkPiimp5ZLTW2UUTWK+L37GG2aW8Lkr1OY=;
 b=ttfjqkS3uP9PU84Gf8nDd/WWso03A4TlJLTK6Ho2sZbI9JbEFVuaxnfio/2NrDMUKk
 h4q9DT8K1ei2ecACog1WuW+s+6vDpKpAkUIi1VGbmmStITZTmjT7ZFmMR1nw0515JJIx
 bsD0K9QYphV4KeWjcezMiB73Mj/Ow0pF9u8Fn+OAJIi9M7FDGGGqMrkCiwRcMp3O0zEi
 Tc60qrAcEq/6vE5ktV///0QuC6zbtL6IpCIkWfqhL/5jKK8OwJLmzZxFZAFGErG4JY4Q
 dtf+CttkbQd79RuQnGjc+gNQX7eJ357suCTDswHNkEd+K9Unu7Q1MRt9jUSJ6AENRaIC
 aPkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzgJn8d+IQYs8/6LRaIrmS4XQ5Z1jnqiiJ0nRf5P8S3kkRxCokPXZ8r7h8xSxrw5C8G4H0IYMySPA6+ew4dyWeiL2qdZWwMzqS+W1c0qrA/6CcLw+/NQ==
X-Gm-Message-State: AOJu0YxO7g/Om9PywynRGLOAB3goTHh3i14KgbIzDwmuVyo+SgOT08TV
 LP1VYueIQLK4XIAcEaKAZ7/ORcxQ3aLL/efsdtDsozHh/86vCBYuOm+9NG/RvYFQVsqQAL91ZjY
 IhASybArH3/PJeGPmNwkiQsk+j/w=
X-Google-Smtp-Source: AGHT+IHm0Q3ixNNu9cmggWgNNsR8ASg0FLqyjz36T/uPBKyzWma2Rx7sIr/qnpSDb4vMRsldinkwtqy7QMI+FvSqI9Y=
X-Received: by 2002:a05:6122:1c0d:b0:4cf:da07:fb01 with SMTP id
 et13-20020a0561221c0d00b004cfda07fb01mr2408795vkb.8.1709230049114; Thu, 29
 Feb 2024 10:07:29 -0800 (PST)
MIME-Version: 1.0
References: <20240226013208.2389246-1-chao@kernel.org>
 <20240226013208.2389246-4-chao@kernel.org>
In-Reply-To: <20240226013208.2389246-4-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 29 Feb 2024 10:07:16 -0800
Message-ID: <CACOAw_zMrGQp4oX1x559jrOVkcmj54gS0bHepMhYgFPCQKFcOg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Daeho Jeong Thanks, On Sun, Feb 25, 2024 at 5:33 PM
    Chao Yu wrote: > > In f2fs_allocate_data_block(), before skip allocating
   new segment > for DATA_PINNED log header, it needs to tag log header as unloaded
    > one to a [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.174 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rfkom-00031W-24
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs: fix to reset fields for unloaded
 curseg
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

UmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpUaGFua3Ms
CgpPbiBTdW4sIEZlYiAyNSwgMjAyNCBhdCA1OjMz4oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IEluIGYyZnNfYWxsb2NhdGVfZGF0YV9ibG9jaygpLCBiZWZvcmUgc2tp
cCBhbGxvY2F0aW5nIG5ldyBzZWdtZW50Cj4gZm9yIERBVEFfUElOTkVEIGxvZyBoZWFkZXIsIGl0
IG5lZWRzIHRvIHRhZyBsb2cgaGVhZGVyIGFzIHVubG9hZGVkCj4gb25lIHRvIGF2b2lkIHNraXBw
aW5nIGxvZ2ljIGluIGxvY2F0ZV9kaXJ0eV9zZWdtZW50KCkgYW5kCj4gX19mMmZzX3NhdmVfaW5t
ZW1fY3Vyc2VnKCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+
Cj4gLS0tCj4gIGZzL2YyZnMvc2VnbWVudC5jIHwgMTkgKysrKysrKysrKysrKysrLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gaW5kZXggYzE1
OWIwOTg1NTk2Li41ZTQ1YWZkNjlmM2YgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMK
PiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+IEBAIC0zMTAxLDEyICszMTAxLDE2IEBAIHN0YXRp
YyBpbnQgX19hbGxvY2F0ZV9uZXdfc2VnbWVudChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGlu
dCB0eXBlLAo+ICAgICAgICAgc3RydWN0IGN1cnNlZ19pbmZvICpjdXJzZWcgPSBDVVJTRUdfSShz
YmksIHR5cGUpOwo+ICAgICAgICAgdW5zaWduZWQgaW50IG9sZF9zZWdubzsKPgo+ICsgICAgICAg
aWYgKHR5cGUgPT0gQ1VSU0VHX0NPTERfREFUQV9QSU5ORUQgJiYgIWN1cnNlZy0+aW5pdGVkKQo+
ICsgICAgICAgICAgICAgICBnb3RvIGFsbG9jYXRlOwo+ICsKPiAgICAgICAgIGlmICghZm9yY2Ug
JiYgY3Vyc2VnLT5pbml0ZWQgJiYKPiAgICAgICAgICAgICAhY3Vyc2VnLT5uZXh0X2Jsa29mZiAm
Jgo+ICAgICAgICAgICAgICFnZXRfdmFsaWRfYmxvY2tzKHNiaSwgY3Vyc2VnLT5zZWdubywgbmV3
X3NlYykgJiYKPiAgICAgICAgICAgICAhZ2V0X2NrcHRfdmFsaWRfYmxvY2tzKHNiaSwgY3Vyc2Vn
LT5zZWdubywgbmV3X3NlYykpCj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4gK2FsbG9j
YXRlOgo+ICAgICAgICAgb2xkX3NlZ25vID0gY3Vyc2VnLT5zZWdubzsKPiAgICAgICAgIGlmIChu
ZXdfY3Vyc2VnKHNiaSwgdHlwZSwgdHJ1ZSkpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUFH
QUlOOwo+IEBAIC0zNDUxLDYgKzM0NTUsMTMgQEAgc3RhdGljIHZvaWQgZjJmc19yYW5kb21pemVf
Y2h1bmsoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ICAgICAgICAgICAgICAgICBnZXRfcmFu
ZG9tX3UzMl9pbmNsdXNpdmUoMSwgc2JpLT5tYXhfZnJhZ21lbnRfaG9sZSk7Cj4gIH0KPgo+ICtz
dGF0aWMgdm9pZCByZXNldF9jdXJzZWdfZmllbGRzKHN0cnVjdCBjdXJzZWdfaW5mbyAqY3Vyc2Vn
KQo+ICt7Cj4gKyAgICAgICBjdXJzZWctPmluaXRlZCA9IGZhbHNlOwo+ICsgICAgICAgY3Vyc2Vn
LT5zZWdubyA9IE5VTExfU0VHTk87Cj4gKyAgICAgICBjdXJzZWctPm5leHRfc2Vnbm8gPSAwOwo+
ICt9Cj4gKwo+ICBpbnQgZjJmc19hbGxvY2F0ZV9kYXRhX2Jsb2NrKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gICAgICAgICAgICAgICAgIGJsb2NrX3Qgb2xk
X2Jsa2FkZHIsIGJsb2NrX3QgKm5ld19ibGthZGRyLAo+ICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
ZjJmc19zdW1tYXJ5ICpzdW0sIGludCB0eXBlLAo+IEBAIC0zNTE2LDggKzM1MjcsMTAgQEAgaW50
IGYyZnNfYWxsb2NhdGVfZGF0YV9ibG9jayhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVj
dCBwYWdlICpwYWdlLAo+ICAgICAgICAgICovCj4gICAgICAgICBpZiAoc2VnbWVudF9mdWxsKSB7
Cj4gICAgICAgICAgICAgICAgIGlmICh0eXBlID09IENVUlNFR19DT0xEX0RBVEFfUElOTkVEICYm
Cj4gLSAgICAgICAgICAgICAgICAgICAhKChjdXJzZWctPnNlZ25vICsgMSkgJSBzYmktPnNlZ3Nf
cGVyX3NlYykpCj4gKyAgICAgICAgICAgICAgICAgICAhKChjdXJzZWctPnNlZ25vICsgMSkgJSBz
YmktPnNlZ3NfcGVyX3NlYykpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXNldF9jdXJz
ZWdfZmllbGRzKGN1cnNlZyk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZ290byBza2lwX25l
d19zZWdtZW50Owo+ICsgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAgaWYgKGZy
b21fZ2MpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBnZXRfYXRzc3Jfc2VnbWVudChzYmks
IHR5cGUsIHNlLT50eXBlLAo+IEBAIC00NTk1LDkgKzQ2MDgsNyBAQCBzdGF0aWMgaW50IGJ1aWxk
X2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgYXJyYXlbaV0uc2VnX3R5cGUgPSBDVVJTRUdfQ09MRF9EQVRBOwo+ICAgICAgICAgICAgICAg
ICBlbHNlIGlmIChpID09IENVUlNFR19BTExfREFUQV9BVEdDKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGFycmF5W2ldLnNlZ190eXBlID0gQ1VSU0VHX0NPTERfREFUQTsKPiAtICAgICAgICAg
ICAgICAgYXJyYXlbaV0uc2Vnbm8gPSBOVUxMX1NFR05POwo+IC0gICAgICAgICAgICAgICBhcnJh
eVtpXS5uZXh0X2Jsa29mZiA9IDA7Cj4gLSAgICAgICAgICAgICAgIGFycmF5W2ldLmluaXRlZCA9
IGZhbHNlOwo+ICsgICAgICAgICAgICAgICByZXNldF9jdXJzZWdfZmllbGRzKCZhcnJheVtpXSk7
Cj4gICAgICAgICB9Cj4gICAgICAgICByZXR1cm4gcmVzdG9yZV9jdXJzZWdfc3VtbWFyaWVzKHNi
aSk7Cj4gIH0KPiAtLQo+IDIuNDAuMQo+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
