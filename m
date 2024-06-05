Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2CE8FC357
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Jun 2024 08:17:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sEjxC-0007Dy-KN;
	Wed, 05 Jun 2024 06:16:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1sEjxB-0007Dr-RE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 06:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DwGm8rESyWh/j9N7TP3XclxhQKKbAqP/4YUVHI40L1M=; b=IpxErSF8WFnXmwmTUxo2r97M/d
 qpjubsD0E5H8M5wDxJTF/otUvbOPWU4cc7K+bQwAKEVaULDj14DrmG0yM1XAFK5UoLkv0L3LqpL+r
 AuLtC50s8ch4UJGDCMVS8wDoi3H5d3ye5K6Qa2f+viS3N5Y57CFL7oID8eL6IyKUGBXc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DwGm8rESyWh/j9N7TP3XclxhQKKbAqP/4YUVHI40L1M=; b=mUt5kk4fvcVaPTMuR9WbjnBJ4Z
 a0cSybK2Zm1TLT4XNtUkRp7ULRKXKcFgK4i+pluq9HPmbsnuQEaL/dpOuTlHZJpEUITtA7Z3+hV2D
 cm3NDLqXtm1hu69TTqIA5yVOzrzQSuBpo8k1ld2117nbST0hybAxDRTNutzIFzmp5mt8=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sEjxC-0004Bw-Ra for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 06:16:58 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42158db02c3so1211175e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Jun 2024 23:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717568211; x=1718173011; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DwGm8rESyWh/j9N7TP3XclxhQKKbAqP/4YUVHI40L1M=;
 b=P/jiAK3GTad3tQtSgsfnSzayINYNBinvNI8SLRmRZ+X+UHUzf23+E4zXnDZmLXa+aI
 cMoDlRM9EgwfvCyC606F+cQvxC7wjjhL6w4k00GS9iIKY3uSlbLoMDn+W/F8wUft78kL
 FwIe+qTiP+oejj7x5rErOBq/eteh+yqUR6VtF2VDJNDMTHbh3fMli+eUMtwPGrmKlWvI
 dr4mLco+Tlp/F1pD6GgPrBjSgA8K7dSC1HCikTdm9NGK+kVDxYTAVDZrQCc6yRpNlkY2
 Je22lQ5bmYfLvIfqESf/Kotlt+rwgQtKcX+opFblQAeww6CrVf9u1DkHqnhnswRuCkpR
 mPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717568211; x=1718173011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DwGm8rESyWh/j9N7TP3XclxhQKKbAqP/4YUVHI40L1M=;
 b=YaC031RY6fCARKlPtI00GGPr/vE/zP9JuV5X1Jq2BDwws3MbnoVh/CXwHcABEZMb4Z
 1JTX+f8wcK2ofLF0kzOJchZeimziOebbjVRbJ0twLaYY6VzX1U1DWXzpnNN3p8lMQYZN
 BvF1AtMkrC/MLf1YS6powfBksTWGT+H2uEujj/ZdIu+MkHF98cRL334b9CXRtnhUza+N
 gXYazYDNBvdCrb1fManz+6C3kjvsMZ5rw3DzKYdSsD22g523tKM3WO+I180Qv/peSyjy
 +L3GSbmHYjE917lbCC2ZP9Iv0jB8WrgTkgubc5fWxPv/lhpf7j2iZ1NbAGW3T+QJjdPG
 OxEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6mZ/zyMPURc8pUMDemnFm+SJ6FNYBQ6AxYmaeFXJT7PkfB9JKmYUQW8wmZZWOHx8CkVNh0i8M6YEUNjZTVqhdJdRyrCcUks0LQ4IfMoZ/sR+bXkzGZQ==
X-Gm-Message-State: AOJu0YyctfLvmJvdhCjrltKixv+HOnR+XrkxwOuJfNyu7o6UK04MRSOX
 aA6js4IXcfGn3cNZF5c4wosspvxnsbezUFuwOF11+eAHXnFqXTqRdG4FojsJQKyKoDDAP/gXbje
 ssBi9BR3WUzSCeAhMB900Y/ckwx6soM7daNM=
X-Google-Smtp-Source: AGHT+IHvLDn3WWDRIgiBb8xegCJSb9c/zQHxf2WkNfJ5iZcm6MyyQdSm7iuIni8OEHC+yMg0pvFFNUMJsFjTx3TDHb4=
X-Received: by 2002:a5d:54c9:0:b0:354:f622:fc5b with SMTP id
 ffacd0b85a97d-35e88338622mr1177547f8f.23.1717568211177; Tue, 04 Jun 2024
 23:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <1716204978-29455-1-git-send-email-zhiguo.niu@unisoc.com>
 <446c7e4a-2a1e-402d-8238-2eee7cdfd5c2@kernel.org>
 <CAHJ8P3J2NkSfVTEcpxR+n3CjtywMxxEDMg4cLSL=8UOX8KcM+Q@mail.gmail.com>
 <8b841ec1-cb43-462a-9e87-aecdb0755318@kernel.org>
 <CAHJ8P3K_u=ZmXaMF5jUu_MPSJPAhKmEx4hyaTinMQ=nnLQ9aRA@mail.gmail.com>
In-Reply-To: <CAHJ8P3K_u=ZmXaMF5jUu_MPSJPAhKmEx4hyaTinMQ=nnLQ9aRA@mail.gmail.com>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 5 Jun 2024 14:16:40 +0800
Message-ID: <CAHJ8P3LgbpLZhP3+maGXpuwsSzn20Kw5Rgdwsb7y1q5BfTyrwQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Jun 5, 2024 at 1:59 PM Zhiguo Niu wrote: > > On
   Wed, Jun 5, 2024 at 11:48 AM Chao Yu wrote: > > > > On 2024/6/3 17:05, Zhiguo
    Niu wrote: > > > On Mon, Jun 3, 2024 at 3:41 PM Chao Yu [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.128.51 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.51 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.51 listed in bl.score.senderscore.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.51 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sEjxC-0004Bw-Ra
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

T24gV2VkLCBKdW4gNSwgMjAyNCBhdCAxOjU54oCvUE0gWmhpZ3VvIE5pdSA8bml1emhpZ3VvODRA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVuIDUsIDIwMjQgYXQgMTE6NDjigK9BTSBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIDIwMjQvNi8zIDE3OjA1
LCBaaGlndW8gTml1IHdyb3RlOgo+ID4gPiBPbiBNb24sIEp1biAzLCAyMDI0IGF0IDM6NDHigK9Q
TSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPj4KPiA+ID4+IE9uIDIwMjQv
NS8yMCAxOTozNiwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+ID4+PiBOb3cgYXRnYyBjYW4gYmUgZW5h
YmxlZCBiYXNlZCBvbiB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6Cj4gPiA+Pj4gLUFUR0MgbW91
bnQgb3B0aW9uIGlzIHNldAo+ID4gPj4+IC1lbGFwc2VkX3RpbWUgaXMgbW9yZSB0aGFuIGF0Z2Nf
YWdlX3RocmVzaG9sZCBhbHJlYWR5Cj4gPiA+Pj4gYnV0IHRoZXNlIGNvbmRpdGlvbnMgYXJlIGNo
ZWNrIHdoZW4gdW1vdW50ZWQtPm1vdW50ZWQgZGV2aWNlIGFnYWluLgo+ID4gPj4+IElmIHRoZSBk
ZXZpY2UgaGFzIG5vdCBiZSB1bW91bnRlZC0+bW91bnRlZCBmb3IgYSBsb25nIHRpbWUsIGF0Z2Mg
Y2FuCj4gPiA+Pj4gbm90IHdvcmsgZXZlbiB0aGUgYWJvdmUgY29uZGl0aW9ucyBtZXQuCj4gPiA+
Pj4KPiA+ID4+PiBJdCBpcyBiZXR0ZXIgdG8gZW5hYmxlIGF0Z2MgZHluYW1pY2xseSB3aGVuIHVz
ZXIgY2hhbmdlIGF0Z2NfYWdlX3RocmVzaG9sZAo+ID4gPj4+IG1lYW53aGlsZSB0aGlzIHZhbGUg
aXMgbGVzcyB0aGFuIGVsYXBzZWRfdGltZSBhbmQgQVRHQyBtb3VudCBvcHRpb24gaXMgb24uCj4g
PiA+Pj4KPiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNv
Yy5jb20+Cj4gPiA+Pj4gLS0tCj4gPiA+Pj4gICAgZnMvZjJmcy9mMmZzLmggICAgfCAgMSArCj4g
PiA+Pj4gICAgZnMvZjJmcy9zZWdtZW50LmMgfCAgOSArKysrLS0tLS0KPiA+ID4+PiAgICBmcy9m
MmZzL3N5c2ZzLmMgICB8IDE2ICsrKysrKysrKysrKysrKysKPiA+ID4+PiAgICAzIGZpbGVzIGNo
YW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiA+Pj4KPiA+ID4+PiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+ID4gPj4+IGluZGV4
IDE5NzRiNmEuLmU0NDFkMmQgMTAwNjQ0Cj4gPiA+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPiA+
ID4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+ID4gPj4+IEBAIC0zNjk0LDYgKzM2OTQsNyBAQCB2
b2lkIGYyZnNfY2xlYXJfcHJlZnJlZV9zZWdtZW50cyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmks
Cj4gPiA+Pj4gICAgaW50IGYyZnNfaW5pdF9pbm1lbV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpKTsKPiA+ID4+PiAgICB2b2lkIGYyZnNfc2F2ZV9pbm1lbV9jdXJzZWcoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpKTsKPiA+ID4+PiAgICB2b2lkIGYyZnNfcmVzdG9yZV9pbm1lbV9jdXJz
ZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+ID4+PiAraW50IGYyZnNfaW5pdF9hdGdj
X2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+ID4gPj4+ICAgIGludCBmMmZzX2Fs
bG9jYXRlX3NlZ21lbnRfZm9yX3Jlc2l6ZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0
eXBlLAo+ID4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBzdGFydCwgdW5zaWduZWQgaW50IGVuZCk7Cj4gPiA+Pj4gICAgaW50IGYyZnNfYWxs
b2NhdGVfbmV3X3NlY3Rpb24oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwgYm9v
bCBmb3JjZSk7Cj4gPiA+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJm
cy9zZWdtZW50LmMKPiA+ID4+PiBpbmRleCA3MWRjODA0Mi4uNDQ5MjNkNCAxMDA2NDQKPiA+ID4+
PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+ID4gPj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5j
Cj4gPiA+Pj4gQEAgLTI5MzEsMTQgKzI5MzEsMTEgQEAgc3RhdGljIGludCBnZXRfYXRzc3Jfc2Vn
bWVudChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0eXBlLAo+ID4gPj4+ICAgICAgICBy
ZXR1cm4gcmV0Owo+ID4gPj4+ICAgIH0KPiA+ID4+Pgo+ID4gPj4+IC1zdGF0aWMgaW50IF9fZjJm
c19pbml0X2F0Z2NfY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+ID4+PiAraW50
IGYyZnNfaW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gPiA+Pj4g
ICAgewo+ID4gPj4+ICAgICAgICBzdHJ1Y3QgY3Vyc2VnX2luZm8gKmN1cnNlZyA9IENVUlNFR19J
KHNiaSwgQ1VSU0VHX0FMTF9EQVRBX0FUR0MpOwo+ID4gPj4+ICAgICAgICBpbnQgcmV0ID0gMDsK
PiA+ID4+Pgo+ID4gPj4+IC0gICAgIGlmICghc2JpLT5hbS5hdGdjX2VuYWJsZWQpCj4gPiA+Pj4g
LSAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ID4+PiAtCj4gPiA+Pj4gICAgICAgIGYyZnNfZG93
bl9yZWFkKCZTTV9JKHNiaSktPmN1cnNlZ19sb2NrKTsKPiA+ID4+Pgo+ID4gPj4+ICAgICAgICBt
dXRleF9sb2NrKCZjdXJzZWctPmN1cnNlZ19tdXRleCk7Cj4gPiA+Pj4gQEAgLTI5NTUsNyArMjk1
Miw5IEBAIHN0YXRpYyBpbnQgX19mMmZzX2luaXRfYXRnY19jdXJzZWcoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpKQo+ID4gPj4+ICAgIH0KPiA+ID4+PiAgICBpbnQgZjJmc19pbml0X2lubWVtX2N1
cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gPiA+Pj4gICAgewo+ID4gPj4+IC0gICAg
IHJldHVybiBfX2YyZnNfaW5pdF9hdGdjX2N1cnNlZyhzYmkpOwo+ID4gPj4+ICsgICAgIGlmICgh
c2JpLT5hbS5hdGdjX2VuYWJsZWQpCj4gPiA+Pj4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+
ID4+PiArICAgICByZXR1cm4gZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHNiaSk7Cj4gPiA+Pj4gICAg
fQo+ID4gPj4+Cj4gPiA+Pj4gICAgc3RhdGljIHZvaWQgX19mMmZzX3NhdmVfaW5tZW1fY3Vyc2Vn
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IHR5cGUpCj4gPiA+Pj4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvc3lzZnMuYyBiL2ZzL2YyZnMvc3lzZnMuYwo+ID4gPj4+IGluZGV4IDA5ZDNlY2Yu
LjcyNjc2YzUgMTAwNjQ0Cj4gPiA+Pj4gLS0tIGEvZnMvZjJmcy9zeXNmcy5jCj4gPiA+Pj4gKysr
IGIvZnMvZjJmcy9zeXNmcy5jCj4gPiA+Pj4gQEAgLTY3Myw2ICs2NzMsMjIgQEAgc3RhdGljIHNz
aXplX3QgX19zYmlfc3RvcmUoc3RydWN0IGYyZnNfYXR0ciAqYSwKPiA+ID4+PiAgICAgICAgICAg
ICAgICByZXR1cm4gY291bnQ7Cj4gPiA+Pj4gICAgICAgIH0KPiA+ID4+Pgo+ID4gPj4+ICsgICAg
IGlmICghc3RyY21wKGEtPmF0dHIubmFtZSwgImF0Z2NfYWdlX3RocmVzaG9sZCIpKSB7Cj4gPiA+
Pj4gKyAgICAgICAgICAgICBpZiAodCA8IDApCj4gPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+ID4gPj4+ICsgICAgICAgICAgICAgc2JpLT5hbS5hZ2VfdGhyZXNo
b2xkID0gdDsKPiA+ID4+PiArICAgICAgICAgICAgIGlmIChzYmktPmFtLmF0Z2NfZW5hYmxlZCkK
PiA+ID4+PiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGNvdW50Owo+ID4gPj4+ICsKPiA+
ID4+PiArICAgICAgICAgICAgIGlmICh0ZXN0X29wdChzYmksIEFUR0MpICYmCj4gPiA+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgIGxlNjRfdG9fY3B1KHNiaS0+Y2twdC0+ZWxhcHNlZF90aW1lKSA+
PSB0KSB7Cj4gPiA+Pgo+ID4gPiBIaSBDaGFvLAo+ID4gPj4gT2gsIEkgZ3Vlc3MgeW91IHdhbnQg
dG8gZml4IHRoaXM6Cj4gPiA+IFllcywgIFNvcnJ5IGZvciBub3QgbWFraW5nIGl0IGNsZWFyIGJl
Zm9yZS4KPiA+ID4+Cj4gPiA+PiBzdGF0aWMgdm9pZCBpbml0X2F0Z2NfbWFuYWdlbWVudChzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gPiA+PiB7Cj4gPiA+PiAuLi4KPiA+ID4+ICAgICAgICAg
IGlmICh0ZXN0X29wdChzYmksIEFUR0MpICYmCj4gPiA+PiAgICAgICAgICAgICAgICAgIFNJVF9J
KHNiaSktPmVsYXBzZWRfdGltZSA+PSBERUZfR0NfVEhSRUFEX0FHRV9USFJFU0hPTEQpCj4gPiA+
PiAgICAgICAgICAgICAgICAgIGFtLT5hdGdjX2VuYWJsZWQgPSB0cnVlOwo+ID4gPj4KPiA+ID4+
IFdoYXQgYWJvdXQgZW5hYmxpbmcgYXRnY19lbmFibGVkIGR1cmluZyBjaGVja3BvaW50IG9uY2Ug
ZWxhcHNlZCB0aW1lIGlzCj4gPiA+PiBzYXRpc2ZlZCB3LyB0aGUgY29uZGl0aW9uPyBJIGd1ZXNz
IHRoaXMgY2FuIGdpdmUgYW5vdGhlciBjaGFuY2Ugd2hlbmV2ZXIKPiA+ID4+IENQIGlzIGJlZW4g
dHJpZ2dlcmVkLCBhbmQgaXQgY2FuIGF2b2lkIHRoZSByYWNpbmcgY29uZGl0aW9uIGFzIHdlbGwu
Cj4gPiA+IDEuIEknbSBub3Qgc3VyZSBpZiB0aGlzIHdpbGwgaW5jcmVhc2UgY2hlY2twb2ludCB0
aW1lIGNvbnN1bXB0aW9uPwo+ID4KPiA+IFNpbmNlIGl0IHdvbid0IGluY3JlYXNlIGFueSBJTyB0
aW1lLCBJIGd1ZXNzIGl0J3MgZmluZSB0b2xlcmF0ZSB0aW1lIGNvbnN1bWVkCj4gPiBieSBpbml0
aWFsaXphdGlvbiBvZiBhdGdjIGN1cnNlZy4KPiA+Cj4gPiA+IDIuIGR5bmFtaWNhbGx5IGVuYWJs
aW5nIGF0Z2MgbWF5IGhhdmUgb3RoZXIgcHJvYmxlbXMuIElzIHRoaXMgY29uZmlybWVkPwo+ID4K
PiA+IEkgdGhpbmsgc28sIGNoZWNrcG9pbnQgaGFzIGF2b2lkZWQgbW9zdCByYWNlIGNhc2VzLgo+
ID4KPiA+IFNvLCBob3cgZG8geW91IHRoaW5rIG9mIGJlbG93IGRpZmY6Cj4gSGkgQ2hhbywKPiAg
SSB0aGluayBmbG93IGlzIG9rLCAgc29tZSBkZXRhaWxzIG5lZWQgdG8gYmUgZGlzY3Vzc2VkLgo+
ID4KPiA+IC0tLQo+ID4gICBmcy9mMmZzL2NoZWNrcG9pbnQuYyB8ICAyICsrCj4gPiAgIGZzL2Yy
ZnMvZjJmcy5oICAgICAgIHwgIDEgKwo+ID4gICBmcy9mMmZzL3NlZ21lbnQuYyAgICB8IDI2ICsr
KysrKysrKysrKysrKysrKysrKysrLS0tCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jaGVj
a3BvaW50LmMgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+ID4gaW5kZXggNTVkNDQ0YmVjNWMwLi40
YTczYmQ0ODFhMjUgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+ID4gKysr
IGIvZnMvZjJmcy9jaGVja3BvaW50LmMKPiA+IEBAIC0xNzE4LDYgKzE3MTgsOCBAQCBpbnQgZjJm
c193cml0ZV9jaGVja3BvaW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGNwX2Nv
bnRyb2wgKmNwYykKPiA+ICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgZjJmc19yZXN0b3JlX2lu
bWVtX2N1cnNlZyhzYmkpOwo+ID4gKyAgICAgICBmMmZzX3JlaW5pdF9hdGdjX2N1cnNlZyhzYmkp
Owo+ID4gKwo+ID4gICAgICAgICBzdGF0X2luY19jcF9jb3VudChzYmkpOwo+ID4gICBzdG9wOgo+
ID4gICAgICAgICB1bmJsb2NrX29wZXJhdGlvbnMoc2JpKTsKPiA+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBpbmRleCA5Njg4ZGYzMzIxNDcuLjhkMzg1
YTFjNzVhZCAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gPiArKysgYi9mcy9mMmZz
L2YyZnMuaAo+ID4gQEAgLTM2OTMsNiArMzY5Myw3IEBAIHZvaWQgZjJmc19yZWxlYXNlX2Rpc2Nh
cmRfYWRkcnMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+ICAgaW50IGYyZnNfbnBhZ2Vz
X2Zvcl9zdW1tYXJ5X2ZsdXNoKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCBmb3JfcmEp
Owo+ID4gICBib29sIGYyZnNfc2VnbWVudF9oYXNfZnJlZV9zbG90KHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwgaW50IHNlZ25vKTsKPiA+ICAgaW50IGYyZnNfaW5pdF9pbm1lbV9jdXJzZWcoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+ICtpbnQgZjJmc19yZWluaXRfYXRnY19jdXJzZWco
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+ICAgdm9pZCBmMmZzX3NhdmVfaW5tZW1fY3Vy
c2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gPiAgIHZvaWQgZjJmc19yZXN0b3JlX2lu
bWVtX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+ID4gICBpbnQgZjJmc19hbGxv
Y2F0ZV9zZWdtZW50X2Zvcl9yZXNpemUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlw
ZSwKPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5j
Cj4gPiBpbmRleCBiZGMyMjQ3Mzg3ZTguLjZkNDI3M2ZhZjA2MSAxMDA2NDQKPiA+IC0tLSBhL2Zz
L2YyZnMvc2VnbWVudC5jCj4gPiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+ID4gQEAgLTI5NDks
MTIgKzI5NDksMTIgQEAgc3RhdGljIGludCBnZXRfYXRzc3Jfc2VnbWVudChzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksIGludCB0eXBlLAo+ID4gICAgICAgICByZXR1cm4gcmV0Owo+ID4gICB9Cj4g
Pgo+ID4gLXN0YXRpYyBpbnQgX19mMmZzX2luaXRfYXRnY19jdXJzZWcoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpKQo+ID4gK3N0YXRpYyBpbnQgX19mMmZzX2luaXRfYXRnY19jdXJzZWcoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCBib29sIGZvcmNlKQo+ID4gICB7Cj4gPiAgICAgICAgIHN0cnVj
dCBjdXJzZWdfaW5mbyAqY3Vyc2VnID0gQ1VSU0VHX0koc2JpLCBDVVJTRUdfQUxMX0RBVEFfQVRH
Qyk7Cj4gPiAgICAgICAgIGludCByZXQgPSAwOwo+ID4KPiA+IC0gICAgICAgaWYgKCFzYmktPmFt
LmF0Z2NfZW5hYmxlZCkKPiA+ICsgICAgICAgaWYgKCFzYmktPmFtLmF0Z2NfZW5hYmxlZCAmJiAh
Zm9yY2UpCj4gSXMgdGhpcyBwYXJhbWV0ZXIgICJmb3JjZSIgdW5uZWNlc3Nhcnk/Cj4gaW4gbW91
bnQgZmxvdywgZXZlbiBhdGdjIGVuYWJsZSBjb25kaXRpb25zIGFyZSBhbGwgbWV0LCBpdCBpcyBu
b3QKPiBlbmFibGVkIGJlY2F1c2Ugb2YgZm9yY2U9ZmFsc2UuCj4gT3IgYW0gSSBtaXNzaW5nIHNv
bWV0aGluZz8KaGkgQ2hhbywKc29ycnksIEkgcmVhZCAmJiBhcyB8fCAsICBQbGVhc2UgaWdub3Jl
IHRoZSBhYm92ZSBjb21tZW50LApidXQgSXMgaXQgc3RpbGwgT0sgd2l0aG91dCB0aGUgICJmb3Jj
ZSIgIHBhcmFtZXRlcj8KdGhhbmtz77yBCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4g
Pgo+ID4gICAgICAgICBmMmZzX2Rvd25fcmVhZCgmU01fSShzYmkpLT5jdXJzZWdfbG9jayk7Cj4g
PiBAQCAtMjk3MSw5ICsyOTcxLDI5IEBAIHN0YXRpYyBpbnQgX19mMmZzX2luaXRfYXRnY19jdXJz
ZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4gICAgICAgICBmMmZzX3VwX3JlYWQoJlNN
X0koc2JpKS0+Y3Vyc2VnX2xvY2spOwo+ID4gICAgICAgICByZXR1cm4gcmV0Owo+ID4gICB9Cj4g
PiArCj4gPiAgIGludCBmMmZzX2luaXRfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSkKPiA+ICAgewo+ID4gLSAgICAgICByZXR1cm4gX19mMmZzX2luaXRfYXRnY19jdXJzZWco
c2JpKTsKPiA+ICsgICAgICAgcmV0dXJuIF9fZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHNiaSwgZmFs
c2UpOwo+ID4gK30KPiA+ICsKPiA+ICtpbnQgZjJmc19yZWluaXRfYXRnY19jdXJzZWcoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4gK3sKPiA+ICsgICAgICAgaW50IHJldDsKPiA+ICsKPiA+
ICsgICAgICAgaWYgKCF0ZXN0X29wdChzYmksIEFUR0MpKQo+ID4gKyAgICAgICAgICAgICAgIHJl
dHVybiAwOwo+ID4gKyAgICAgICBpZiAoc2JpLT5hbS5hdGdjX2VuYWJsZWQpCj4gPiArICAgICAg
ICAgICAgICAgcmV0dXJuIDA7Cj4gPiArICAgICAgIGlmIChTSVRfSShzYmkpLT5lbGFwc2VkX3Rp
bWUgPCBzYmktPmFtLmFnZV90aHJlc2hvbGQpCj4gU0lUKHNiaSktPmVsYXBzZWRfdGltZSBpcyBq
dXN0IHVwZGF0ZWQgaW4gbW91bnQgZmxvdywgc28KPiBja3B0LT5lbGFwc2VkX3RpbWUgaXMgIG1v
cmUgc3VpdGFibGUgaGVyZT8KPiB0aGFua3MhCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7
Cj4gPiArCj4gPiArICAgICAgIHJldCA9IF9fZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHNiaSwgdHJ1
ZSk7Cj4gPiArICAgICAgIGlmICghcmV0KSB7Cj4gPiArICAgICAgICAgICAgICAgc2JpLT5hbS5h
dGdjX2VuYWJsZWQgPSB0cnVlOwo+ID4gKyAgICAgICAgICAgICAgIGYyZnNfaW5mbyhzYmksICJy
ZWVuYWJsZWQgYWdlIHRocmVzaG9sZCBHQyIpOwo+ID4gKyAgICAgICB9Cj4gPiArICAgICAgIHJl
dHVybiByZXQ7Cj4gPiAgIH0KPiA+Cj4gPiAgIHN0YXRpYyB2b2lkIF9fZjJmc19zYXZlX2lubWVt
X2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0eXBlKQo+ID4gLS0KPiA+IDIu
NDAuMQo+ID4KPiA+ID4gdGhhbmtz77yBCj4gPiA+Pgo+ID4gPj4gVGhhbmtzLAo+ID4gPj4KPiA+
ID4+PiArICAgICAgICAgICAgICAgICAgICAgaWYgKGYyZnNfaW5pdF9hdGdjX2N1cnNlZyhzYmkp
KQo+ID4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ID4gPj4+ICsgICAgICAgICAgICAgICAgICAgICBzYmktPmFtLmF0Z2NfZW5hYmxlZCA9IHRydWU7
Cj4gPiA+Pj4gKyAgICAgICAgICAgICB9Cj4gPiA+Pj4gKyAgICAgICAgICAgICByZXR1cm4gY291
bnQ7Cj4gPiA+Pj4gKyAgICAgfQo+ID4gPj4+ICsKPiA+ID4+PiAgICAgICAgaWYgKCFzdHJjbXAo
YS0+YXR0ci5uYW1lLCAiZ2Nfc2VnbWVudF9tb2RlIikpIHsKPiA+ID4+PiAgICAgICAgICAgICAg
ICBpZiAodCA8IE1BWF9HQ19NT0RFKQo+ID4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgc2Jp
LT5nY19zZWdtZW50X21vZGUgPSB0OwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
