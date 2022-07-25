Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5239F57FF6C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Jul 2022 15:01:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oFxhx-0006Ee-NP; Mon, 25 Jul 2022 13:01:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <fengnanchang@gmail.com>) id 1oFxhw-0006EX-Gz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Jul 2022 13:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:References:Message-Id:Content-Transfer-Encoding:
 Cc:Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zGZB5Wrro8zcG4ToCmy/bbs1NXkqTE3i+1bt+5r8ZGU=; b=htkQ+QpWXH9R3YlkCiHXhOAsCv
 vd/WmbarX2HYAjONerAJq01/ieJezHATdRx1VjDgS1QXtaJC/ZPfm10973e0AhkUSleYC8w1IeiCJ
 kknjUlaSwR6BcCjvRTdVWNaNhouh5eUAVuDdf0HUAtcJ16MrPGwywBPjf68JvO3X4kK0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:
 From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zGZB5Wrro8zcG4ToCmy/bbs1NXkqTE3i+1bt+5r8ZGU=; b=gBkTBn8oF9hYAUJ26FvOYWbMBY
 +74oZbnvIhURVcwEF5ulS18gAmEYFoBTD57cI5zhJWhEZncVjlqtyMu/27Xo7iWi/ecFUGzTahkbM
 Oh1uv5W2Lz7Qxl7QevypenmYTUuER7MkkKvcldH46bP5PR1nuDpIm6q4V6ZF+W3XJARo=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oFxhu-009n98-HO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Jul 2022 13:01:12 +0000
Received: by mail-pf1-f177.google.com with SMTP id g12so10388257pfb.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Jul 2022 06:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zGZB5Wrro8zcG4ToCmy/bbs1NXkqTE3i+1bt+5r8ZGU=;
 b=fZW5cqz0TWXAXdxJjHOiilDK6a2QlbWYQrpA2R/kSmj3gp9wrrkWZJYaTi+g9KL6wc
 AXSxvyS8GVWZwmWlmcxE4saBLm2bFvXp4iRmThw8E71w335ia5ov2rLQS+TPgp9hQBc9
 cGAuXjenJc9fbq2lPiiiXf36iJJoFylA6rIArsesK98zZh1Pnqn69IrgYizQaBpTXVCJ
 U9VM6Bn96VnDLobdyG0siC6JRopjuUwIb8355wTrHPF/vThIMj/OziKLmmCr9NjA/iGD
 a8Wufju1odWLNbcwLK9HC+9clIJ6lX1YwvzDW8pE21kgV4gIAwPnaTVLGOEFzvPf+K0P
 xq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zGZB5Wrro8zcG4ToCmy/bbs1NXkqTE3i+1bt+5r8ZGU=;
 b=jRe4DSLqNhGHHWJ6ZZZ20Ji7pui6yqDUCsFJ6005/0+WiNg2iZtW8Flh/HAJouuPVX
 IiMJFEmjsNWs/R+Qubio25Picl1C3GcRmz/eJsj4xan7hRGO1dQ5s9e/+74c7JPhX+Se
 R61FxOqLwhVDCSWnQNyPcQ34OC4kYseAzdUMgE7QlS/QTmKQmW0hgLPZHbRfGdiU/5Qs
 BQ8zXnI3eFVVn5imWRmC1gL3h850YeiZ/iQ1Iqh2hLE4hyiH+JnhqIrS1+kbkf7n/Y5u
 3FvZxUVkr8Z9OfMOH3T5ko3vcH+zT5ylh8Xt5hCqQchVS1J930QZ59VEwjYmaCmg2tiI
 pc1Q==
X-Gm-Message-State: AJIora8wliHSXiGzT1czjeOTPu3k7CLTuyWGKcdVlULb8lzbJcCHT4Vt
 yc2rDW+YyMrxjV59mXE3gB4=
X-Google-Smtp-Source: AGRyM1sQG7UQm8cahoTxZvXIsYJLG7MIbYKgZEM3s6Ft6n99pbKAnU0epRloyHd+EpwSrRZehd28GQ==
X-Received: by 2002:a63:3d1:0:b0:41a:390e:c0c0 with SMTP id
 200-20020a6303d1000000b0041a390ec0c0mr10674677pgd.609.1658754064694; 
 Mon, 25 Jul 2022 06:01:04 -0700 (PDT)
Received: from smtpclient.apple ([2404:9dc0:cd01::25])
 by smtp.gmail.com with ESMTPSA id
 d20-20020aa797b4000000b0052b8a7f6b65sm9493157pfq.109.2022.07.25.06.01.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jul 2022 06:01:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
From: fengnan chang <fengnanchang@gmail.com>
In-Reply-To: <a931509e-aba2-1d67-789a-72b830d872cc@kernel.org>
Date: Mon, 25 Jul 2022 21:00:59 +0800
Message-Id: <3966C2CA-9B85-4E62-8F7F-122D52A4D968@gmail.com>
References: <20220717053207.192372-1-fengnanchang@gmail.com>
 <20220717053207.192372-4-fengnanchang@gmail.com>
 <a931509e-aba2-1d67-789a-72b830d872cc@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  > 2022年7月24日 17:58，Chao Yu 写道： > > On 2022/7/17
    13:32, Fengnan Chang wrote: >> From: Fengnan Chang >> Try to support compressed
    file write and amplifiction accounting. >> Signed-off- [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [fengnanchang[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.177 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.210.177 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oFxhu-009n98-HO
Subject: Re: [f2fs-dev] [PATCH v3 3/3] f2fs: support compressed file
 write/read amplifiction
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Cgo+IDIwMjLlubQ35pyIMjTml6UgMTc6NTjvvIxDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOWG
memBk++8mgo+IAo+IE9uIDIwMjIvNy8xNyAxMzozMiwgRmVuZ25hbiBDaGFuZyB3cm90ZToKPj4g
RnJvbTogRmVuZ25hbiBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPgo+PiBUcnkgdG8gc3Vw
cG9ydCBjb21wcmVzc2VkIGZpbGUgd3JpdGUgYW5kIGFtcGxpZmljdGlvbiBhY2NvdW50aW5nLgo+
PiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+Cj4+
IC0tLQo+PiAgZnMvZjJmcy9kYXRhLmMgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrLS0tLS0K
Pj4gIGZzL2YyZnMvZGVidWcuYyB8ICA3ICsrKysrLS0KPj4gIGZzL2YyZnMvZjJmcy5oICB8IDM0
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gIDMgZmlsZXMgY2hhbmdlZCwg
NjAgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
ZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4gaW5kZXggZDJkMmNmZDU0MjEwLi5kMDUzMjk1ODgz
NWIgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5j
Cj4+IEBAIC0yMTMyLDcgKzIxMzIsNyBAQCBpbnQgZjJmc19yZWFkX211bHRpX3BhZ2VzKHN0cnVj
dCBjb21wcmVzc19jdHggKmNjLCBzdHJ1Y3QgYmlvICoqYmlvX3JldCwKPj4gIAlzdHJ1Y3QgZXh0
ZW50X2luZm8gZWkgPSB7MCwgfTsKPj4gIAlib29sIGZyb21fZG5vZGUgPSB0cnVlOwo+PiAgCWlu
dCBpOwo+PiAtCWludCByZXQgPSAwOwo+PiArCWludCByZXQgPSAwLCBucl9jYWNoZV9oaXQgPSAw
Owo+PiAgICAJZjJmc19idWdfb24oc2JpLCBmMmZzX2NsdXN0ZXJfaXNfZW1wdHkoY2MpKTsKPj4g
IEBAIC0yMjIzLDYgKzIyMjMsNyBAQCBpbnQgZjJmc19yZWFkX211bHRpX3BhZ2VzKHN0cnVjdCBj
b21wcmVzc19jdHggKmNjLCBzdHJ1Y3QgYmlvICoqYmlvX3JldCwKPj4gIAkJaWYgKGYyZnNfbG9h
ZF9jb21wcmVzc2VkX3BhZ2Uoc2JpLCBwYWdlLCBibGthZGRyKSkgewo+PiAgCQkJaWYgKGF0b21p
Y19kZWNfYW5kX3Rlc3QoJmRpYy0+cmVtYWluaW5nX3BhZ2VzKSkKPj4gIAkJCQlmMmZzX2RlY29t
cHJlc3NfY2x1c3RlcihkaWMpOwo+PiArCQkJbnJfY2FjaGVfaGl0Kys7Cj4+ICAJCQljb250aW51
ZTsKPj4gIAkJfQo+PiAgQEAgLTIyNjEsNiArMjI2MiwxNSBAQCBpbnQgZjJmc19yZWFkX211bHRp
X3BhZ2VzKHN0cnVjdCBjb21wcmVzc19jdHggKmNjLCBzdHJ1Y3QgYmlvICoqYmlvX3JldCwKPj4g
IAkJKmxhc3RfYmxvY2tfaW5fYmlvID0gYmxrYWRkcjsKPj4gIAl9Cj4+ICArCWlmIChjYy0+bnJf
Y3BhZ2VzIC0gbnJfY2FjaGVfaGl0ID4gY2MtPm5yX3JwYWdlcykKPj4gKwkJZjJmc19pX2NvbXBy
X3JhX2Jsb2Nrc191cGRhdGUoaW5vZGUsCj4+ICsJCQkJY2MtPm5yX2NwYWdlcyAtIG5yX2NhY2hl
X2hpdCAtIGNjLT5ucl9ycGFnZXMsCj4gCj4gSSBndWVzcyBucl9ycGFnZXMgaXMgbm90IGFjY3Vy
YXRlIGhlcmUsIGR1ZSB0byBpdCBhbHdheXMgZXF1YWxzIHRvIGNsdXN0ZXJfc2l6ZSwKPiBob3dl
dmVyIHVzZXIgbWF5IGp1c3Qgd2FudCB0byByZWFkIG9uZSBwYWdlIGRhdGEuCj4gCj4gSG1tLi4u
SSBmb3VuZCBpb3N0YXQgZnJhbWV3b3JrIGhhcyBhbHJlYWR5IGFjY291bnRlZCBGU19DREFUQV9S
RUFEX0lPIElPLCBob3cKPiBhYm91dCBhZGp1c3RpbmcgaXQgdG8gc3VwcG9ydCBhY2NvdW50aW5n
IGNvbXByZXNzZWQgaW5vZGUncyByZWFkL3dyaXRlIElPcz8KPiAKCk9mIGNvdXJzZSB3ZSBjYW4g
c3VwcG9ydCBhY2NvdW50aW5nIGNvbXByZXNzZWQgaW5vZGUncyByZWFkL3dyaXRlIElPcy4KQnV0
IG15IGluaXRpYWwgdGhvdWdodCB3YXMgdG8gcHJvdmlkZSBhIHdheSB0byBhY2NvdW50IHdyaXRl
L3JlYWQgYW1wbGlmaWNhdGlvbiBmb3IKY29tcHJlc3NlZCBmaWxlLiBJZiBhZGp1c3QgdGhpcyB0
byBpb3N0YXQsICBpdOKAmXMgc2VlbXMgc3RpbGwgY2Fu4oCZdCBvYnRhaW4gcmVhZCBhbXBsaWZp
Y2F0aW9uLgpNYXliZSBJIG5lZWQgYWRkIGEgYXJndW1lbnQgZm9yIGYyZnNfcmVhZF9tdWx0aV9w
YWdlcyB0byBnZXQgaG93IG1hbnkKcGFnZSBuZWVkIHRvIHJlYWQgaW4gY2x1c3RlciwgYW5kIGNh
bGN1bGF0ZSByZWFkIGFtcGxpZmljYXRpb24gaW4gZjJmc19tcGFnZV9yZWFkcGFnZXM/CgpUaGFu
a3MuCgo+IFRoYW5rcywKPiAKPj4gKwkJCQl0cnVlKTsKPj4gKwllbHNlCj4+ICsJCWYyZnNfaV9j
b21wcl9yYV9ibG9ja3NfdXBkYXRlKGlub2RlLAo+PiArCQkJCWNjLT5ucl9ycGFnZXMgLSBjYy0+
bnJfY3BhZ2VzICsgbnJfY2FjaGVfaGl0LAo+PiArCQkJCWZhbHNlKTsKPj4gKwo+PiAgCWlmIChm
cm9tX2Rub2RlKQo+PiAgCQlmMmZzX3B1dF9kbm9kZSgmZG4pOwo+PiAgQEAgLTI5MjksMTEgKzI5
MzksMTEgQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzKHN0cnVjdCBhZGRyZXNz
X3NwYWNlICptYXBwaW5nLAo+PiAgCWludCByYW5nZV93aG9sZSA9IDA7Cj4+ICAJeGFfbWFya190
IHRhZzsKPj4gIAlpbnQgbndyaXR0ZW4gPSAwOwo+PiAtCWludCBzdWJtaXR0ZWQgPSAwOwo+PiAr
CWludCBzdWJtaXR0ZWQgPSAwLCByYXdfZGlydHlfcGFnZXMgPSAwOwo+PiAgCWludCBpOwo+PiAg
LQlpZiAoZ2V0X2RpcnR5X3BhZ2VzKG1hcHBpbmctPmhvc3QpIDw9Cj4+IC0JCQkJU01fSShGMkZT
X01fU0IobWFwcGluZykpLT5taW5faG90X2Jsb2NrcykKPj4gKwlyYXdfZGlydHlfcGFnZXMgPSBn
ZXRfZGlydHlfcGFnZXMobWFwcGluZy0+aG9zdCk7Cj4+ICsJaWYgKHJhd19kaXJ0eV9wYWdlcyA8
PSBTTV9JKEYyRlNfTV9TQihtYXBwaW5nKSktPm1pbl9ob3RfYmxvY2tzKQo+PiAgCQlzZXRfaW5v
ZGVfZmxhZyhtYXBwaW5nLT5ob3N0LCBGSV9IT1RfREFUQSk7Cj4+ICAJZWxzZQo+PiAgCQljbGVh
cl9pbm9kZV9mbGFnKG1hcHBpbmctPmhvc3QsIEZJX0hPVF9EQVRBKTsKPj4gQEAgLTMwNjcsNyAr
MzA3Nyw2IEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9jYWNoZV9wYWdlcyhzdHJ1Y3QgYWRkcmVz
c19zcGFjZSAqbWFwcGluZywKPj4gICNlbmRpZgo+PiAgCQkJbndyaXR0ZW4gKz0gc3VibWl0dGVk
Owo+PiAgCQkJd2JjLT5ucl90b193cml0ZSAtPSBzdWJtaXR0ZWQ7Cj4+IC0KPj4gIAkJCWlmICh1
bmxpa2VseShyZXQpKSB7Cj4+ICAJCQkJLyoKPj4gIAkJCQkgKiBrZWVwIG5yX3RvX3dyaXRlLCBz
aW5jZSB2ZnMgdXNlcyB0aGlzIHRvCj4+IEBAIC0zMTMzLDYgKzMxNDIsMTIgQEAgc3RhdGljIGlu
dCBmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzKHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+
PiAgCWlmIChiaW8pCj4+ICAJCWYyZnNfc3VibWl0X21lcmdlZF9pcHVfd3JpdGUoc2JpLCAmYmlv
LCBOVUxMKTsKPj4gICsJaWYgKGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkgewo+PiArCQlp
ZiAobndyaXR0ZW4gPiByYXdfZGlydHlfcGFnZXMpCj4+ICsJCQlmMmZzX2lfY29tcHJfd2FfYmxv
Y2tzX3VwZGF0ZShpbm9kZSwgbndyaXR0ZW4gLSByYXdfZGlydHlfcGFnZXMsIHRydWUpOwo+PiAr
CQllbHNlCj4+ICsJCQlmMmZzX2lfY29tcHJfd2FfYmxvY2tzX3VwZGF0ZShpbm9kZSwgcmF3X2Rp
cnR5X3BhZ2VzIC0gbndyaXR0ZW4sIGZhbHNlKTsKPj4gKwl9Cj4+ICAJcmV0dXJuIHJldDsKPj4g
IH0KPj4gIEBAIC0zNDgyLDYgKzM0OTcsNyBAQCBzdGF0aWMgaW50IGYyZnNfd3JpdGVfYmVnaW4o
c3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+PiAgCQkJ
ZXJyID0gcmV0Owo+PiAgCQkJZ290byBmYWlsOwo+PiAgCQl9IGVsc2UgaWYgKHJldCkgewo+PiAr
CQkJZjJmc19pX2NvbXByX3dhX2Jsb2Nrc191cGRhdGUoaW5vZGUsIHJldCAtIDEsIHRydWUpOwo+
PiAgCQkJcmV0dXJuIDA7Cj4+ICAJCX0KPj4gIAl9Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2Rl
YnVnLmMgYi9mcy9mMmZzL2RlYnVnLmMKPj4gaW5kZXggYzkyNjI1ZWYxNmQwLi4yYmJmN2ZhNDkw
OTcgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZGVidWcuYwo+PiArKysgYi9mcy9mMmZzL2RlYnVn
LmMKPj4gQEAgLTEzNiw2ICsxMzYsOCBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfZ2VuZXJhbF9zdGF0
dXMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+PiAgCXNpLT5pbmxpbmVfZGlyID0gYXRvbWlj
X3JlYWQoJnNiaS0+aW5saW5lX2Rpcik7Cj4+ICAJc2ktPmNvbXByX2lub2RlID0gYXRvbWljX3Jl
YWQoJnNiaS0+Y29tcHJfaW5vZGUpOwo+PiAgCXNpLT5jb21wcl9ibG9ja3MgPSBhdG9taWM2NF9y
ZWFkKCZzYmktPmNvbXByX2Jsb2Nrcyk7Cj4+ICsJc2ktPmNvbXByX3dhX2Jsb2NrcyA9IGF0b21p
YzY0X3JlYWQoJnNiaS0+Y29tcHJfd2FfYmxvY2tzKTsKPj4gKwlzaS0+Y29tcHJfcmFfYmxvY2tz
ID0gYXRvbWljNjRfcmVhZCgmc2JpLT5jb21wcl9yYV9ibG9ja3MpOwo+PiAgCXNpLT5hcHBlbmQg
PSBzYmktPmltW0FQUEVORF9JTk9dLmlub19udW07Cj4+ICAJc2ktPnVwZGF0ZSA9IHNiaS0+aW1b
VVBEQVRFX0lOT10uaW5vX251bTsKPj4gIAlzaS0+b3JwaGFucyA9IHNiaS0+aW1bT1JQSEFOX0lO
T10uaW5vX251bTsKPj4gQEAgLTM4Myw4ICszODUsOSBAQCBzdGF0aWMgaW50IHN0YXRfc2hvdyhz
dHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKnYpCj4+ICAJCQkgICBzaS0+aW5saW5lX2lub2RlKTsK
Pj4gIAkJc2VxX3ByaW50ZihzLCAiICAtIElubGluZV9kZW50cnkgSW5vZGU6ICV1XG4iLAo+PiAg
CQkJICAgc2ktPmlubGluZV9kaXIpOwo+PiAtCQlzZXFfcHJpbnRmKHMsICIgIC0gQ29tcHJlc3Nl
ZCBJbm9kZTogJXUsIEJsb2NrczogJWxsdVxuIiwKPj4gLQkJCSAgIHNpLT5jb21wcl9pbm9kZSwg
c2ktPmNvbXByX2Jsb2Nrcyk7Cj4+ICsJCXNlcV9wcmludGYocywgIiAgLSBDb21wcmVzc2VkIElu
b2RlOiAldSwgQmxvY2tzOiAlbGx1LCBXQSBCbG9ja3M6ICVsbGQsIFJBIEJsb2NrcyAlbGxkXG4i
LAo+PiArCQkJICAgc2ktPmNvbXByX2lub2RlLCBzaS0+Y29tcHJfYmxvY2tzLAo+PiArCQkJICAg
c2ktPmNvbXByX3dhX2Jsb2Nrcywgc2ktPmNvbXByX3JhX2Jsb2Nrcyk7Cj4+ICAJCXNlcV9wcmlu
dGYocywgIiAgLSBPcnBoYW4vQXBwZW5kL1VwZGF0ZSBJbm9kZTogJXUsICV1LCAldVxuIiwKPj4g
IAkJCSAgIHNpLT5vcnBoYW5zLCBzaS0+YXBwZW5kLCBzaS0+dXBkYXRlKTsKPj4gIAkJc2VxX3By
aW50ZihzLCAiXG5NYWluIGFyZWE6ICVkIHNlZ3MsICVkIHNlY3MgJWQgem9uZXNcbiIsCj4+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4+IGluZGV4IDA2ZDAz
NzBmZDc2MC4uOWQwNDI5ZTkxNzE4IDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+PiAr
KysgYi9mcy9mMmZzL2YyZnMuaAo+PiBAQCAtMTc0OSw2ICsxNzQ5LDggQEAgc3RydWN0IGYyZnNf
c2JfaW5mbyB7Cj4+ICAJYXRvbWljX3QgaW5saW5lX2RpcjsJCQkvKiAjIG9mIGlubGluZV9kZW50
cnkgaW5vZGVzICovCj4+ICAJYXRvbWljX3QgY29tcHJfaW5vZGU7CQkJLyogIyBvZiBjb21wcmVz
c2VkIGlub2RlcyAqLwo+PiAgCWF0b21pYzY0X3QgY29tcHJfYmxvY2tzOwkJLyogIyBvZiBjb21w
cmVzc2VkIGJsb2NrcyAqLwo+PiArCWF0b21pYzY0X3QgY29tcHJfd2FfYmxvY2tzOwkJLyogIyBv
ZiBjb21wcmVzc2VkIFdBIGJsb2NrcyAqLwo+PiArCWF0b21pYzY0X3QgY29tcHJfcmFfYmxvY2tz
OwkJLyogIyBvZiBjb21wcmVzc2VkIFJBIGJsb2NrcyAqLwo+PiAgCWF0b21pY190IG1heF9hd19j
bnQ7CQkJLyogbWF4ICMgb2YgYXRvbWljIHdyaXRlcyAqLwo+PiAgCXVuc2lnbmVkIGludCBpb19z
a2lwX2JnZ2M7CQkvKiBza2lwIGJhY2tncm91bmQgZ2MgZm9yIGluLWZsaWdodCBJTyAqLwo+PiAg
CXVuc2lnbmVkIGludCBvdGhlcl9za2lwX2JnZ2M7CQkvKiBza2lwIGJhY2tncm91bmQgZ2MgZm9y
IG90aGVyIHJlYXNvbnMgKi8KPj4gQEAgLTM4MjksNiArMzgzMSw4IEBAIHN0cnVjdCBmMmZzX3N0
YXRfaW5mbyB7Cj4+ICAJaW50IGlubGluZV94YXR0ciwgaW5saW5lX2lub2RlLCBpbmxpbmVfZGly
LCBhcHBlbmQsIHVwZGF0ZSwgb3JwaGFuczsKPj4gIAlpbnQgY29tcHJfaW5vZGU7Cj4+ICAJdW5z
aWduZWQgbG9uZyBsb25nIGNvbXByX2Jsb2NrczsKPj4gKwlsb25nIGxvbmcgY29tcHJfd2FfYmxv
Y2tzOwo+PiArCWxvbmcgbG9uZyBjb21wcl9yYV9ibG9ja3M7Cj4+ICAJaW50IGF3X2NudCwgbWF4
X2F3X2NudDsKPj4gIAl1bnNpZ25lZCBpbnQgdmFsaWRfY291bnQsIHZhbGlkX25vZGVfY291bnQs
IHZhbGlkX2lub2RlX2NvdW50LCBkaXNjYXJkX2Jsa3M7Cj4+ICAJdW5zaWduZWQgaW50IGJpbW9k
YWwsIGF2Z192YmxvY2tzOwo+PiBAQCAtMzkxNiw2ICszOTIwLDE0IEBAIHN0YXRpYyBpbmxpbmUg
c3RydWN0IGYyZnNfc3RhdF9pbmZvICpGMkZTX1NUQVQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
KQo+PiAgCQkoYXRvbWljNjRfYWRkKGJsb2NrcywgJkYyRlNfSV9TQihpbm9kZSktPmNvbXByX2Js
b2NrcykpCj4+ICAjZGVmaW5lIHN0YXRfc3ViX2NvbXByX2Jsb2Nrcyhpbm9kZSwgYmxvY2tzKQkJ
CQlcCj4+ICAJCShhdG9taWM2NF9zdWIoYmxvY2tzLCAmRjJGU19JX1NCKGlub2RlKS0+Y29tcHJf
YmxvY2tzKSkKPj4gKyNkZWZpbmUgc3RhdF9hZGRfY29tcHJfd2FfYmxvY2tzKGlub2RlLCBibG9j
a3MpCQkJCVwKPj4gKwkoYXRvbWljNjRfYWRkKGJsb2NrcywgJkYyRlNfSV9TQihpbm9kZSktPmNv
bXByX3dhX2Jsb2NrcykpCj4+ICsjZGVmaW5lIHN0YXRfc3ViX2NvbXByX3dhX2Jsb2Nrcyhpbm9k
ZSwgYmxvY2tzKQkJCQlcCj4+ICsJKGF0b21pYzY0X3N1YihibG9ja3MsICZGMkZTX0lfU0IoaW5v
ZGUpLT5jb21wcl93YV9ibG9ja3MpKQo+PiArI2RlZmluZSBzdGF0X2FkZF9jb21wcl9yYV9ibG9j
a3MoaW5vZGUsIGJsb2NrcykJCQkJXAo+PiArCShhdG9taWM2NF9hZGQoYmxvY2tzLCAmRjJGU19J
X1NCKGlub2RlKS0+Y29tcHJfcmFfYmxvY2tzKSkKPj4gKyNkZWZpbmUgc3RhdF9zdWJfY29tcHJf
cmFfYmxvY2tzKGlub2RlLCBibG9ja3MpCQkJCVwKPj4gKwkoYXRvbWljNjRfc3ViKGJsb2Nrcywg
JkYyRlNfSV9TQihpbm9kZSktPmNvbXByX3JhX2Jsb2NrcykpCj4+ICAjZGVmaW5lIHN0YXRfaW5j
X21ldGFfY291bnQoc2JpLCBibGthZGRyKQkJCQlcCj4+ICAJZG8gewkJCQkJCQkJXAo+PiAgCQlp
ZiAoYmxrYWRkciA8IFNJVF9JKHNiaSktPnNpdF9iYXNlX2FkZHIpCQlcCj4+IEBAIC00MDAwLDYg
KzQwMTIsMTAgQEAgdm9pZCBmMmZzX3VwZGF0ZV9zaXRfaW5mbyhzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmkpOwo+PiAgI2RlZmluZSBzdGF0X2RlY19jb21wcl9pbm9kZShpbm9kZSkJCQlkbyB7IH0g
d2hpbGUgKDApCj4+ICAjZGVmaW5lIHN0YXRfYWRkX2NvbXByX2Jsb2Nrcyhpbm9kZSwgYmxvY2tz
KQkJZG8geyB9IHdoaWxlICgwKQo+PiAgI2RlZmluZSBzdGF0X3N1Yl9jb21wcl9ibG9ja3MoaW5v
ZGUsIGJsb2NrcykJCWRvIHsgfSB3aGlsZSAoMCkKPj4gKyNkZWZpbmUgc3RhdF9hZGRfY29tcHJf
d2FfYmxvY2tzKGlub2RlLCBibG9ja3MpCQlkbyB7IH0gd2hpbGUgKDApCj4+ICsjZGVmaW5lIHN0
YXRfc3ViX2NvbXByX3dhX2Jsb2Nrcyhpbm9kZSwgYmxvY2tzKQkJZG8geyB9IHdoaWxlICgwKQo+
PiArI2RlZmluZSBzdGF0X2FkZF9jb21wcl9yYV9ibG9ja3MoaW5vZGUsIGJsb2NrcykJCWRvIHsg
fSB3aGlsZSAoMCkKPj4gKyNkZWZpbmUgc3RhdF9zdWJfY29tcHJfcmFfYmxvY2tzKGlub2RlLCBi
bG9ja3MpCQlkbyB7IH0gd2hpbGUgKDApCj4+ICAjZGVmaW5lIHN0YXRfdXBkYXRlX21heF9hdG9t
aWNfd3JpdGUoaW5vZGUpCQlkbyB7IH0gd2hpbGUgKDApCj4+ICAjZGVmaW5lIHN0YXRfaW5jX21l
dGFfY291bnQoc2JpLCBibGthZGRyKQkJZG8geyB9IHdoaWxlICgwKQo+PiAgI2RlZmluZSBzdGF0
X2luY19zZWdfdHlwZShzYmksIGN1cnNlZykJCQlkbyB7IH0gd2hpbGUgKDApCj4+IEBAIC00NDI4
LDYgKzQ0NDQsMjQgQEAgc3RhdGljIGlubGluZSB2b2lkIGYyZnNfaV9jb21wcl9ibG9ja3NfdXBk
YXRlKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+ICAJZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMo
aW5vZGUsIHRydWUpOwo+PiAgfQo+PiAgK3N0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2lfY29tcHJf
d2FfYmxvY2tzX3VwZGF0ZShzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+PiArCQkJCQkJdTY0IGJsb2Nr
cywgYm9vbCBhZGQpCj4+ICt7Cj4+ICsJaWYgKGFkZCkKPj4gKwkJc3RhdF9hZGRfY29tcHJfd2Ff
YmxvY2tzKGlub2RlLCBibG9ja3MpOwo+PiArCWVsc2UKPj4gKwkJc3RhdF9zdWJfY29tcHJfd2Ff
YmxvY2tzKGlub2RlLCBibG9ja3MpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQg
ZjJmc19pX2NvbXByX3JhX2Jsb2Nrc191cGRhdGUoc3RydWN0IGlub2RlICppbm9kZSwKPj4gKwkJ
CQkJCXU2NCBibG9ja3MsIGJvb2wgYWRkKQo+PiArewo+PiArCWlmIChhZGQpCj4+ICsJCXN0YXRf
YWRkX2NvbXByX3JhX2Jsb2Nrcyhpbm9kZSwgYmxvY2tzKTsKPj4gKwllbHNlCj4+ICsJCXN0YXRf
c3ViX2NvbXByX3JhX2Jsb2Nrcyhpbm9kZSwgYmxvY2tzKTsKPj4gK30KPj4gKwo+PiAgc3RhdGlj
IGlubGluZSBpbnQgYmxvY2tfdW5hbGlnbmVkX0lPKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+ICAJ
CQkJc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKml0ZXIpCj4+ICB7CgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
