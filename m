Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 163008D7E12
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Jun 2024 11:06:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sE3di-0004fl-ES;
	Mon, 03 Jun 2024 09:06:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1sE3dh-0004fV-42
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 09:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xSQVPnz7myYAOgmYIoz+PW++0ntehkTkLHzuX99TEyc=; b=ZZAesrwwL8ce49b7vQEp9OL+NP
 3AXnknBEkE8K0jLjJyo/y3PX2AK0JJh+rqhjcml/GCAYcIyj8TPMUvh4kmxw0zmAWDQNP6wM1HgQH
 mG0TZxf8ZDHHa0GmplIjh4v1VZJ1Qo7JkzD9NaSDjznorw1tN6Q3L8FeL8H/Zo8K1ORQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xSQVPnz7myYAOgmYIoz+PW++0ntehkTkLHzuX99TEyc=; b=dViTklqWLZfLhQe55UybTffhJp
 cA4l2koJQx/SbAce4EXoJkP1mN1sVy170aKy0GRdLuq+RY+QeyG0iVIpVrcFsUTJm4DON/nj05W8V
 seEntARnGSkO4zeTDcg32X+I/a2wLrh0GYPhIT+McbPwQ6HHQn0dtLTEgJwWiTCiP3lg=;
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sE3dg-0008SO-Fw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 09:06:00 +0000
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-35dce610207so1881504f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Jun 2024 02:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717405548; x=1718010348; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xSQVPnz7myYAOgmYIoz+PW++0ntehkTkLHzuX99TEyc=;
 b=JEqVU3wwUfzoqm3ej3fB0DNUzmrkqiRWlXyv2yvg2ZX8DxcVJJUei2plM86RpqFTDu
 bMEOG4l/wJA+AoTPoJedgMijssTLaBDLFx942JaCHF6E84HkyZYZlugN2jEjpRPUSY5Z
 l3JUZsYX7ZwiouG5vgII66VDVN1GC/kXE6+Dm7urb+6Gk/98HopnJHwfKMAEf+bcScl+
 sLJe4qFDNDN15vI5VOTziutQVXavocIcHU/mzlx0yfy9274sVu4q9B90qukVPuFC0Ef/
 JMFpKpPcXF+k7eTbmOMqjtBUQMIbXhilKfVDIRDrloGd3WTnw7J1wEdP9go4O8Xh1gcO
 +Ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717405548; x=1718010348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xSQVPnz7myYAOgmYIoz+PW++0ntehkTkLHzuX99TEyc=;
 b=XpwxrRlXYkCemOXF3Wgky5kLqdJXT8q1aVZDYmKQ91a+NeJpfbwiILLntUw/Xw9K4t
 wV0J5Cu/pdc7vePcAMAAWWkOBcMLziw/TSTbfhGdqhjxn4KgdquvcGkf2wUFMIL85cK1
 NyBWU435dVNyNoMo1JfV929G9GCqqu8LGwzO3r+gm68RiZYu25HYfLaWCc8gc9ZbplHr
 oFKmMA+W2T3bngTRUUiFydDsiX1mWRWzcN2xLi8er6jhYKMivaTSNQLHcs3Vev9RZ90w
 WJxBg2e1UlkUcDcL877/ICwoX1z40EyDmhpUXsMA4yc3VEqZiHF1B4UW4OFhJ/ijOlEB
 cmTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1d532EXc2YZ4uvTGk03TFYaCwScZm3VLzzOCwwcmsOoLSGmAYddRziw6LLIhMOT9tZW3tel+8CLrrVYBlTymfU5nm7O5mEzlCqBws/vP8EzJPze3sAA==
X-Gm-Message-State: AOJu0Yyr5R7mkkqQaElRaEnU4tlSyWzOYq63I9v39F5oUFXJqtpixN+o
 yLnxIoUouMNev/7PMrRESP8YLhaFDRpx4ufqzQYLkfoWUubVsZLFML0K1opD5qxB5n3ZB6WmnGN
 igHpcM98Lj4gn/CPt9aPH0jLsYTg=
X-Google-Smtp-Source: AGHT+IF6++1LgATf/3YMjs1tFLt22xdXcldrBzpJboHBzvEckJfcXDY+IuIp7q2opq5t1jO5g0VwBtK1ZfFXWvAYsfY=
X-Received: by 2002:a5d:5350:0:b0:351:b56e:8bc3 with SMTP id
 ffacd0b85a97d-35e0f325baemr7011366f8f.53.1717405547911; Mon, 03 Jun 2024
 02:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <1716204978-29455-1-git-send-email-zhiguo.niu@unisoc.com>
 <446c7e4a-2a1e-402d-8238-2eee7cdfd5c2@kernel.org>
In-Reply-To: <446c7e4a-2a1e-402d-8238-2eee7cdfd5c2@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 3 Jun 2024 17:05:36 +0800
Message-ID: <CAHJ8P3J2NkSfVTEcpxR+n3CjtywMxxEDMg4cLSL=8UOX8KcM+Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Jun 3, 2024 at 3:41 PM Chao Yu wrote: > > On 2024/5/20
    19:36, Zhiguo Niu wrote: > > Now atgc can be enabled based on the following
    conditions: > > -ATGC mount option is set > > -elapsed_ti [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.43 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.43 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.43 listed in bl.score.senderscore.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.43 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sE3dg-0008SO-Fw
Subject: Re: [f2fs-dev] [PATCH] f2fs: enable atgc if atgc_age_threshold from
 user is less than elapsed_time
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
Cc: jaegeuk@kernel.org, ke.wang@unisoc.com, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBKdW4gMywgMjAyNCBhdCAzOjQx4oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIDIwMjQvNS8yMCAxOTozNiwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+IE5v
dyBhdGdjIGNhbiBiZSBlbmFibGVkIGJhc2VkIG9uIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoK
PiA+IC1BVEdDIG1vdW50IG9wdGlvbiBpcyBzZXQKPiA+IC1lbGFwc2VkX3RpbWUgaXMgbW9yZSB0
aGFuIGF0Z2NfYWdlX3RocmVzaG9sZCBhbHJlYWR5Cj4gPiBidXQgdGhlc2UgY29uZGl0aW9ucyBh
cmUgY2hlY2sgd2hlbiB1bW91bnRlZC0+bW91bnRlZCBkZXZpY2UgYWdhaW4uCj4gPiBJZiB0aGUg
ZGV2aWNlIGhhcyBub3QgYmUgdW1vdW50ZWQtPm1vdW50ZWQgZm9yIGEgbG9uZyB0aW1lLCBhdGdj
IGNhbgo+ID4gbm90IHdvcmsgZXZlbiB0aGUgYWJvdmUgY29uZGl0aW9ucyBtZXQuCj4gPgo+ID4g
SXQgaXMgYmV0dGVyIHRvIGVuYWJsZSBhdGdjIGR5bmFtaWNsbHkgd2hlbiB1c2VyIGNoYW5nZSBh
dGdjX2FnZV90aHJlc2hvbGQKPiA+IG1lYW53aGlsZSB0aGlzIHZhbGUgaXMgbGVzcyB0aGFuIGVs
YXBzZWRfdGltZSBhbmQgQVRHQyBtb3VudCBvcHRpb24gaXMgb24uCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+ID4gLS0tCj4gPiAgIGZz
L2YyZnMvZjJmcy5oICAgIHwgIDEgKwo+ID4gICBmcy9mMmZzL3NlZ21lbnQuYyB8ICA5ICsrKyst
LS0tLQo+ID4gICBmcy9mMmZzL3N5c2ZzLmMgICB8IDE2ICsrKysrKysrKysrKysrKysKPiA+ICAg
MyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBpbmRleCAx
OTc0YjZhLi5lNDQxZDJkIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPiA+ICsrKyBi
L2ZzL2YyZnMvZjJmcy5oCj4gPiBAQCAtMzY5NCw2ICszNjk0LDcgQEAgdm9pZCBmMmZzX2NsZWFy
X3ByZWZyZWVfc2VnbWVudHMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gICBpbnQgZjJm
c19pbml0X2lubWVtX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+ID4gICB2b2lk
IGYyZnNfc2F2ZV9pbm1lbV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+ICAg
dm9pZCBmMmZzX3Jlc3RvcmVfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7
Cj4gPiAraW50IGYyZnNfaW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkp
Owo+ID4gICBpbnQgZjJmc19hbGxvY2F0ZV9zZWdtZW50X2Zvcl9yZXNpemUoc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50IHN0YXJ0LCB1bnNpZ25lZCBpbnQgZW5kKTsKPiA+ICAgaW50
IGYyZnNfYWxsb2NhdGVfbmV3X3NlY3Rpb24oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQg
dHlwZSwgYm9vbCBmb3JjZSk7Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9m
cy9mMmZzL3NlZ21lbnQuYwo+ID4gaW5kZXggNzFkYzgwNDIuLjQ0OTIzZDQgMTAwNjQ0Cj4gPiAt
LS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+ID4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiA+IEBA
IC0yOTMxLDE0ICsyOTMxLDExIEBAIHN0YXRpYyBpbnQgZ2V0X2F0c3NyX3NlZ21lbnQoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwKPiA+ICAgICAgIHJldHVybiByZXQ7Cj4gPiAg
IH0KPiA+Cj4gPiAtc3RhdGljIGludCBfX2YyZnNfaW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmkpCj4gPiAraW50IGYyZnNfaW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmkpCj4gPiAgIHsKPiA+ICAgICAgIHN0cnVjdCBjdXJzZWdfaW5mbyAqY3Vy
c2VnID0gQ1VSU0VHX0koc2JpLCBDVVJTRUdfQUxMX0RBVEFfQVRHQyk7Cj4gPiAgICAgICBpbnQg
cmV0ID0gMDsKPiA+Cj4gPiAtICAgICBpZiAoIXNiaS0+YW0uYXRnY19lbmFibGVkKQo+ID4gLSAg
ICAgICAgICAgICByZXR1cm4gMDsKPiA+IC0KPiA+ICAgICAgIGYyZnNfZG93bl9yZWFkKCZTTV9J
KHNiaSktPmN1cnNlZ19sb2NrKTsKPiA+Cj4gPiAgICAgICBtdXRleF9sb2NrKCZjdXJzZWctPmN1
cnNlZ19tdXRleCk7Cj4gPiBAQCAtMjk1NSw3ICsyOTUyLDkgQEAgc3RhdGljIGludCBfX2YyZnNf
aW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gPiAgIH0KPiA+ICAg
aW50IGYyZnNfaW5pdF9pbm1lbV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4g
ICB7Cj4gPiAtICAgICByZXR1cm4gX19mMmZzX2luaXRfYXRnY19jdXJzZWcoc2JpKTsKPiA+ICsg
ICAgIGlmICghc2JpLT5hbS5hdGdjX2VuYWJsZWQpCj4gPiArICAgICAgICAgICAgIHJldHVybiAw
Owo+ID4gKyAgICAgcmV0dXJuIGYyZnNfaW5pdF9hdGdjX2N1cnNlZyhzYmkpOwo+ID4gICB9Cj4g
Pgo+ID4gICBzdGF0aWMgdm9pZCBfX2YyZnNfc2F2ZV9pbm1lbV9jdXJzZWcoc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpLCBpbnQgdHlwZSkKPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N5c2ZzLmMg
Yi9mcy9mMmZzL3N5c2ZzLmMKPiA+IGluZGV4IDA5ZDNlY2YuLjcyNjc2YzUgMTAwNjQ0Cj4gPiAt
LS0gYS9mcy9mMmZzL3N5c2ZzLmMKPiA+ICsrKyBiL2ZzL2YyZnMvc3lzZnMuYwo+ID4gQEAgLTY3
Myw2ICs2NzMsMjIgQEAgc3RhdGljIHNzaXplX3QgX19zYmlfc3RvcmUoc3RydWN0IGYyZnNfYXR0
ciAqYSwKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIGNvdW50Owo+ID4gICAgICAgfQo+ID4KPiA+
ICsgICAgIGlmICghc3RyY21wKGEtPmF0dHIubmFtZSwgImF0Z2NfYWdlX3RocmVzaG9sZCIpKSB7
Cj4gPiArICAgICAgICAgICAgIGlmICh0IDwgMCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiA+ICsgICAgICAgICAgICAgc2JpLT5hbS5hZ2VfdGhyZXNob2xkID0g
dDsKPiA+ICsgICAgICAgICAgICAgaWYgKHNiaS0+YW0uYXRnY19lbmFibGVkKQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiBjb3VudDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgaWYg
KHRlc3Rfb3B0KHNiaSwgQVRHQykgJiYKPiA+ICsgICAgICAgICAgICAgICAgICAgICBsZTY0X3Rv
X2NwdShzYmktPmNrcHQtPmVsYXBzZWRfdGltZSkgPj0gdCkgewo+CkhpIENoYW8sCj4gT2gsIEkg
Z3Vlc3MgeW91IHdhbnQgdG8gZml4IHRoaXM6ClllcywgIFNvcnJ5IGZvciBub3QgbWFraW5nIGl0
IGNsZWFyIGJlZm9yZS4KPgo+IHN0YXRpYyB2b2lkIGluaXRfYXRnY19tYW5hZ2VtZW50KHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSkKPiB7Cj4gLi4uCj4gICAgICAgICBpZiAodGVzdF9vcHQoc2Jp
LCBBVEdDKSAmJgo+ICAgICAgICAgICAgICAgICBTSVRfSShzYmkpLT5lbGFwc2VkX3RpbWUgPj0g
REVGX0dDX1RIUkVBRF9BR0VfVEhSRVNIT0xEKQo+ICAgICAgICAgICAgICAgICBhbS0+YXRnY19l
bmFibGVkID0gdHJ1ZTsKPgo+IFdoYXQgYWJvdXQgZW5hYmxpbmcgYXRnY19lbmFibGVkIGR1cmlu
ZyBjaGVja3BvaW50IG9uY2UgZWxhcHNlZCB0aW1lIGlzCj4gc2F0aXNmZWQgdy8gdGhlIGNvbmRp
dGlvbj8gSSBndWVzcyB0aGlzIGNhbiBnaXZlIGFub3RoZXIgY2hhbmNlIHdoZW5ldmVyCj4gQ1Ag
aXMgYmVlbiB0cmlnZ2VyZWQsIGFuZCBpdCBjYW4gYXZvaWQgdGhlIHJhY2luZyBjb25kaXRpb24g
YXMgd2VsbC4KMS4gSSdtIG5vdCBzdXJlIGlmIHRoaXMgd2lsbCBpbmNyZWFzZSBjaGVja3BvaW50
IHRpbWUgY29uc3VtcHRpb24/CjIuIGR5bmFtaWNhbGx5IGVuYWJsaW5nIGF0Z2MgbWF5IGhhdmUg
b3RoZXIgcHJvYmxlbXMuIElzIHRoaXMgY29uZmlybWVkPwp0aGFua3PvvIEKPgo+IFRoYW5rcywK
Pgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChmMmZzX2luaXRfYXRnY19jdXJzZWcoc2Jp
KSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIHNiaS0+YW0uYXRnY19lbmFibGVkID0gdHJ1ZTsKPiA+ICsg
ICAgICAgICAgICAgfQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gY291bnQ7Cj4gPiArICAgICB9
Cj4gPiArCj4gPiAgICAgICBpZiAoIXN0cmNtcChhLT5hdHRyLm5hbWUsICJnY19zZWdtZW50X21v
ZGUiKSkgewo+ID4gICAgICAgICAgICAgICBpZiAodCA8IE1BWF9HQ19NT0RFKQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIHNiaS0+Z2Nfc2VnbWVudF9tb2RlID0gdDsKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
