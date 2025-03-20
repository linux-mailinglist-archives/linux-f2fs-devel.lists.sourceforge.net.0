Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD9EA69ED8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Mar 2025 04:33:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tv6en-0003u1-GN;
	Thu, 20 Mar 2025 03:33:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1tv6el-0003tl-TE
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Mar 2025 03:33:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wAHNeXDKHyLVzzq0rwOTQsewoGoPfVxW3U1+mtmUEUk=; b=kB8FYJ7aWliGpVhrNRxnMvF3rG
 YNJONoSbtLBmWBUm/rla0h2RzERb5nmLk8SBJOHRQdvTm2+j+QuVufPAhxGv/gqDDX9Q5Xq6qK4ny
 rYoRi9mZFqQQSsKh5IasXUKvWdAPaYutar2xJpOIM/SnJsKokQm5GfMPFc2uEgKeDBhg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wAHNeXDKHyLVzzq0rwOTQsewoGoPfVxW3U1+mtmUEUk=; b=Wif240OG0RDMyVuuCR5EXg/ZY3
 gXSdsUDZqF/eu86T9wzEKVgawk+wUFSCowSGK7DtQiMzJ4GnUK9ToOfdtlxYZTuJTtKVwPmeAxBdr
 NB+5oNy/94pFLbFA9T94GESmxlTdcFeTGaau1oBUFLib6IzPvvJUvpkppZqDSRZMTh3Y=;
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tv6el-0000kH-WB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Mar 2025 03:33:20 +0000
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3912622c9c0so29455f8f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 19 Mar 2025 20:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742441588; x=1743046388; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wAHNeXDKHyLVzzq0rwOTQsewoGoPfVxW3U1+mtmUEUk=;
 b=COCw40Qp9ERqNfI9+YVU9uCD6h88F1kuvC+9lzz/byCG32z3davgDmWHmfpXwnFwId
 S4cwEbVYhf5PJV/JB9eftR4ynXzadQDjdsufMnk38XMmwIKuBrjazN11iWViG5zADWB6
 FgKNwKCejCykjwYgA9zIHji8DYLQyNjZa3dsv8ovCp2jPD4rVjpmOjE9Mnnf3s2FSVeZ
 sbaaovVQwqgp+a7+zq0aU0K/77VjWMWDfgz4qXsjntewOa1oAR4h2Xfe0WHelip8PjYL
 Jq8DWlLDqpWOU9BiEXU3YdPEtdYVkJMs6f6YnaajSemTYWLXKkCfI44vmfkqWMKkaNj5
 HjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742441588; x=1743046388;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wAHNeXDKHyLVzzq0rwOTQsewoGoPfVxW3U1+mtmUEUk=;
 b=ee8VQMEIV6uDLPp35nAux+j0JuwfAvDpPI+FO2njxeukljscgNU+xKnVX63Bha5ABx
 tPzidr11GpDGln3lzEVYRi/YPwH1O/NCGJ4yKz5OTcBmYw5z+kDR03iI2td29w/DQQUK
 Ooi6K9W2qK7703cHcRQ5CN9XqbwiGegH0KttXGTYFdjNLKp9lkWvNJO6MVDRQUwEXcZU
 p9IoY7Mq5v5N4lByLaMLOjyTJBIXABt//rdODkvwO3yYEb4ZLRJ81Z+3m26YcV0w+eC1
 vKZ83NsDFe2gfakRoML/rQAf4cWDZ/XAK02zZpnnxXYuOXbR+pUjR0793pTHpqm85V2v
 3TKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDdCb0qEXwsHwTI6EpPAsX2aHBtPg5MKFi9+uNxBYJNLTzpbnAUyURDlepWTy3SylotU3pRAFmtXT5p3y/c5dV@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzHcrC0SrrQT9Rxlg3TmLmSjZDYYjUYqYBaQUT46wzPIlrsiiHD
 96vtbYdGvIpSR5lU4o5RgBYorVxd3xw5EXV4PhOb0qlAg27BPAIWxqai6rOCvpNZXR7YU9dznXi
 lkVVzRXJe4epyUyjTPgBjcUAgfSs=
X-Gm-Gg: ASbGnctECf93Sg0gnZ7RXIbiiV9DIJY3k/KApzr4LWMn9hma6BROFEidCjCKuhvE/wM
 IkPS6pTjWRv3Tf+SJyozy63WhGoVtHZsmwk8AyseuWbSh25d3pKst/NDJvNm4342OhhoiDJ4Y5l
 VgFYsf13o0tlFX7voDk8qxkqBd2/w=
X-Google-Smtp-Source: AGHT+IHEXNhJPFoziNZC1UXWkFDZ5g6z1JFopiu3vc9Q/LvecS+G6l7WSQf1W3Z/XhrusCBoW5rnkRD9RpvZB4oxqf4=
X-Received: by 2002:a5d:6d8a:0:b0:38d:d743:7d36 with SMTP id
 ffacd0b85a97d-39973afe524mr1531554f8f.10.1742441588158; Wed, 19 Mar 2025
 20:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250320022230.1938110-1-chao@kernel.org>
In-Reply-To: <20250320022230.1938110-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 20 Mar 2025 11:32:57 +0800
X-Gm-Features: AQ5f1JrS67VyAWqmg1qZYDDqtRgmbZBRzQk_sAgUFWj5Ju4NfXDkFsmP1V7ZhT8
Message-ID: <CAHJ8P3+Z+LEJysum4ZLO0HGkdYP_JDUfWoTfBiLPcDuHFeBNRw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年3月20日周四 10:27写道：
    > > This patch adds a proc entry named inject_stats to show total injected
    > count for each fault type. > > cat /proc/fs/f2fs/<d [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.221.45 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.45 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.45 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1tv6el-0000kH-WB
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: add a proc entry show inject
 stats
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
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQz5pyIMjDml6Xlkajlm5sgMTA6MjflhpnpgZPvvJoKPgo+
IFRoaXMgcGF0Y2ggYWRkcyBhIHByb2MgZW50cnkgbmFtZWQgaW5qZWN0X3N0YXRzIHRvIHNob3cg
dG90YWwgaW5qZWN0ZWQKPiBjb3VudCBmb3IgZWFjaCBmYXVsdCB0eXBlLgo+Cj4gY2F0IC9wcm9j
L2ZzL2YyZnMvPGRldj4vaW5qZWN0X3N0YXRzCj4gZmF1bHRfdHlwZSAgICAgICAgICAgICAgaW5q
ZWN0ZWRfY291bnQKPiBrbWFsbG9jICAgICAgICAgICAgICAgICAwCj4ga3ZtYWxsb2MgICAgICAg
ICAgICAgICAgMAo+IHBhZ2UgYWxsb2MgICAgICAgICAgICAgIDAKPiBwYWdlIGdldCAgICAgICAg
ICAgICAgICAwCj4gYWxsb2MgYmlvKG9ic29sZXRlKSAgICAgMAo+IGFsbG9jIG5pZCAgICAgICAg
ICAgICAgIDAKPiBvcnBoYW4gICAgICAgICAgICAgICAgICAwCj4gbm8gbW9yZSBibG9jayAgICAg
ICAgICAgMAo+IHRvbyBiaWcgZGlyIGRlcHRoICAgICAgIDAKPiBldmljdF9pbm9kZSBmYWlsICAg
ICAgICAwCj4gdHJ1bmNhdGUgZmFpbCAgICAgICAgICAgMAo+IHJlYWQgSU8gZXJyb3IgICAgICAg
ICAgIDAKPiBjaGVja3BvaW50IGVycm9yICAgICAgICAwCj4gZGlzY2FyZCBlcnJvciAgICAgICAg
ICAgMAo+IHdyaXRlIElPIGVycm9yICAgICAgICAgIDAKPiBzbGFiIGFsbG9jICAgICAgICAgICAg
ICAwCj4gZHF1b3QgaW5pdGlhbGl6ZSAgICAgICAgMAo+IGxvY2tfb3AgICAgICAgICAgICAgICAg
IDAKPiBpbnZhbGlkIGJsa2FkZHIgICAgICAgICAwCj4gaW5jb25zaXN0ZW50IGJsa2FkZHIgICAg
MAo+IG5vIGZyZWUgc2VnbWVudCAgICAgICAgIDAKPiBpbmNvbnNpc3RlbnQgZm9vdGVyICAgICAw
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1i
eTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgp0aGFua3PvvIEKCj4gLS0tCj4g
djI6Cj4gLSBhZGQgbWlzc2luZyBDT05GSUdfRjJGU19GQVVMVF9JTkpFQ1RJT04KPiAgZnMvZjJm
cy9mMmZzLmggIHwgIDMgKysrCj4gIGZzL2YyZnMvc3VwZXIuYyB8ICAxICsKPiAgZnMvZjJmcy9z
eXNmcy5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDI2
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMv
ZjJmcy5oCj4gaW5kZXggZjE1NzZkYzZlYzY3Li45ODZlZTViOTMyNmQgMTAwNjQ0Cj4gLS0tIGEv
ZnMvZjJmcy9mMmZzLmgKPiArKysgYi9mcy9mMmZzL2YyZnMuaAo+IEBAIC03Myw2ICs3Myw4IEBA
IHN0cnVjdCBmMmZzX2ZhdWx0X2luZm8gewo+ICAgICAgICAgYXRvbWljX3QgaW5qZWN0X29wczsK
PiAgICAgICAgIGludCBpbmplY3RfcmF0ZTsKPiAgICAgICAgIHVuc2lnbmVkIGludCBpbmplY3Rf
dHlwZTsKPiArICAgICAgIC8qIFVzZWQgdG8gYWNjb3VudCB0b3RhbCBjb3VudCBvZiBpbmplY3Rp
b24gZm9yIGVhY2ggdHlwZSAqLwo+ICsgICAgICAgdW5zaWduZWQgaW50IGluamVjdF9jb3VudFtG
QVVMVF9NQVhdOwo+ICB9Owo+Cj4gIGV4dGVybiBjb25zdCBjaGFyICpmMmZzX2ZhdWx0X25hbWVb
RkFVTFRfTUFYXTsKPiBAQCAtMTkwMiw2ICsxOTA0LDcgQEAgc3RhdGljIGlubGluZSBib29sIF9f
dGltZV90b19pbmplY3Qoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwKPiAgICAg
ICAgIGF0b21pY19pbmMoJmZmaS0+aW5qZWN0X29wcyk7Cj4gICAgICAgICBpZiAoYXRvbWljX3Jl
YWQoJmZmaS0+aW5qZWN0X29wcykgPj0gZmZpLT5pbmplY3RfcmF0ZSkgewo+ICAgICAgICAgICAg
ICAgICBhdG9taWNfc2V0KCZmZmktPmluamVjdF9vcHMsIDApOwo+ICsgICAgICAgICAgICAgICBm
ZmktPmluamVjdF9jb3VudFt0eXBlXSsrOwo+ICAgICAgICAgICAgICAgICBmMmZzX2luZm9fcmF0
ZWxpbWl0ZWQoc2JpLCAiaW5qZWN0ICVzIGluICVzIG9mICVwUyIsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBmMmZzX2ZhdWx0X25hbWVbdHlwZV0sIGZ1bmMsIHBhcmVudF9mdW5j
KTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
c3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+IGluZGV4IGYwODdiMmI3MWM4OS4uZGZlMDYwNGFi
NTU4IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+ICsrKyBiL2ZzL2YyZnMvc3VwZXIu
Ywo+IEBAIC00Nyw2ICs0Nyw3IEBAIGNvbnN0IGNoYXIgKmYyZnNfZmF1bHRfbmFtZVtGQVVMVF9N
QVhdID0gewo+ICAgICAgICAgW0ZBVUxUX0tWTUFMTE9DXSAgICAgICAgICAgICAgICA9ICJrdm1h
bGxvYyIsCj4gICAgICAgICBbRkFVTFRfUEFHRV9BTExPQ10gICAgICAgICAgICAgID0gInBhZ2Ug
YWxsb2MiLAo+ICAgICAgICAgW0ZBVUxUX1BBR0VfR0VUXSAgICAgICAgICAgICAgICA9ICJwYWdl
IGdldCIsCj4gKyAgICAgICBbRkFVTFRfQUxMT0NfQklPXSAgICAgICAgICAgICAgID0gImFsbG9j
IGJpbyhvYnNvbGV0ZSkiLAo+ICAgICAgICAgW0ZBVUxUX0FMTE9DX05JRF0gICAgICAgICAgICAg
ICA9ICJhbGxvYyBuaWQiLAo+ICAgICAgICAgW0ZBVUxUX09SUEhBTl0gICAgICAgICAgICAgICAg
ICA9ICJvcnBoYW4iLAo+ICAgICAgICAgW0ZBVUxUX0JMT0NLXSAgICAgICAgICAgICAgICAgICA9
ICJubyBtb3JlIGJsb2NrIiwKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJm
cy9zeXNmcy5jCj4gaW5kZXggYzY5MTYxMzY2NDY3Li40NmZhOTRkYjA4YTggMTAwNjQ0Cj4gLS0t
IGEvZnMvZjJmcy9zeXNmcy5jCj4gKysrIGIvZnMvZjJmcy9zeXNmcy5jCj4gQEAgLTE2NzksNiAr
MTY3OSwyNCBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGRpc2tfbWFwX3NlcV9zaG93KHN0
cnVjdCBzZXFfZmlsZSAqc2VxLAo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICsjaWZkZWYg
Q09ORklHX0YyRlNfRkFVTFRfSU5KRUNUSU9OCj4gK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQg
aW5qZWN0X3N0YXRzX3NlcV9zaG93KHN0cnVjdCBzZXFfZmlsZSAqc2VxLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKm9mZnNldCkKPiArewo+
ICsgICAgICAgc3RydWN0IHN1cGVyX2Jsb2NrICpzYiA9IHNlcS0+cHJpdmF0ZTsKPiArICAgICAg
IHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfU0Ioc2IpOwo+ICsgICAgICAgc3RydWN0
IGYyZnNfZmF1bHRfaW5mbyAqZmZpID0gJkYyRlNfT1BUSU9OKHNiaSkuZmF1bHRfaW5mbzsKPiAr
ICAgICAgIGludCBpOwo+ICsKPiArICAgICAgIHNlcV9wdXRzKHNlcSwgImZhdWx0X3R5cGUgICAg
ICAgICAgICAgICBpbmplY3RlZF9jb3VudFxuIik7Cj4gKwo+ICsgICAgICAgZm9yIChpID0gMDsg
aSA8IEZBVUxUX01BWDsgaSsrKQo+ICsgICAgICAgICAgICAgICBzZXFfcHJpbnRmKHNlcSwgIiUt
MjRzJS0xMHVcbiIsIGYyZnNfZmF1bHRfbmFtZVtpXSwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmZmktPmluamVjdF9jb3VudFtpXSk7Cj4gKyAgICAg
ICByZXR1cm4gMDsKPiArfQo+ICsjZW5kaWYKPiArCj4gIGludCBfX2luaXQgZjJmc19pbml0X3N5
c2ZzKHZvaWQpCj4gIHsKPiAgICAgICAgIGludCByZXQ7Cj4gQEAgLTE3NzAsNiArMTc4OCwxMCBA
QCBpbnQgZjJmc19yZWdpc3Rlcl9zeXNmcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkaXNjYXJkX3BsaXN0X3NlcV9zaG93LCBzYik7
Cj4gICAgICAgICBwcm9jX2NyZWF0ZV9zaW5nbGVfZGF0YSgiZGlza19tYXAiLCAwNDQ0LCBzYmkt
PnNfcHJvYywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRpc2tfbWFwX3NlcV9z
aG93LCBzYik7Cj4gKyNpZmRlZiBDT05GSUdfRjJGU19GQVVMVF9JTkpFQ1RJT04KPiArICAgICAg
IHByb2NfY3JlYXRlX3NpbmdsZV9kYXRhKCJpbmplY3Rfc3RhdHMiLCAwNDQ0LCBzYmktPnNfcHJv
YywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluamVjdF9zdGF0c19zZXFfc2hv
dywgc2IpOwo+ICsjZW5kaWYKPiAgICAgICAgIHJldHVybiAwOwo+ICBwdXRfZmVhdHVyZV9saXN0
X2tvYmo6Cj4gICAgICAgICBrb2JqZWN0X3B1dCgmc2JpLT5zX2ZlYXR1cmVfbGlzdF9rb2JqKTsK
PiAtLQo+IDIuNDguMQo+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
