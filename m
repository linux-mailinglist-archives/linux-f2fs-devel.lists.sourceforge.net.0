Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 381EE86DD38
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Mar 2024 09:39:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfyQn-00057r-8U;
	Fri, 01 Mar 2024 08:39:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1rfyQl-00057j-Ec
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 08:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+LwXzDAXjyzhSJ0eGkIwmfAIIhOzSDonUnicOTkhunY=; b=T+J3/zeiVYNWHez6n9MMxv1OyH
 y67/Qto78q5uHJR/CP7b7zW2v1HM9MDiwZqfIjYTALffZB80O8mvG2aJlu2vKDb50eMXx1KKb/EVU
 vg3yYL3jfZi67nkDHRQJ6Q0FYdItjC55SW4D+FX7h+ltya5X/EO9q+PJErhqbbLMNOe0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+LwXzDAXjyzhSJ0eGkIwmfAIIhOzSDonUnicOTkhunY=; b=i6RqiKr/VRdMv7uDTAFdLL5R2d
 0GOGreRPUrU8kuLRTYOt8FMLyTGnoxr0XcKaLfww2WTE5YT1gOdsu7FgRevIoCuWCDsEQaVRqcgRg
 xVu800WX6vhMaVQFSXHKVpTvteZjCIqobNn2aLYxrzVhvZA0jdqHzv5fq5Yy924KTR/I=;
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rfyQh-0005TC-HW for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 08:39:47 +0000
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a3d484a58f6so295222366b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 Mar 2024 00:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709282372; x=1709887172; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+LwXzDAXjyzhSJ0eGkIwmfAIIhOzSDonUnicOTkhunY=;
 b=nl49W3YKcKCJwJe0ab3BasTtNVgTq1j3hter8V8l1Q4Dme100fh3mtQRnLTce5jCBP
 4BNmjuNU1FZ9jEdaH6KBOt4ZMEzeMhpwZOTOWA4zLydvxHBDrXGJTH3SIoRwWQZGm5AH
 gzzK2RsyK0D4Fedv0eeuCwpaGLeuCo+VTDsJ2irpunbYqADWCAEn0Ic1U9wXLvRLPwee
 fG5dgxwbpNjFfE/qDBmg3Z5Xz6C4PLm/Uuqd4NcAwPC3A/gKE+5PvOEyqmQAb3xP+GL0
 kHIK028l8GFX68gqU64EUAPVa9sQNHxPkE/UCrIfJ0mtpgIYncv524XkA3f/3uh/wVC3
 PFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709282372; x=1709887172;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+LwXzDAXjyzhSJ0eGkIwmfAIIhOzSDonUnicOTkhunY=;
 b=RmGsdDR1CzyrjniAHGl84+LlfvF4+TbiePwDkbiYaMhNSuanx+b8cTJqxplZOnT6Ys
 h+lmEoMHRCL/gWK901Rc7ng5rfD5dA15wx4CMAAbaQt8+dPRE9pp0aScpEF4bC6nDqOB
 51/p7+Nwo70XtJfC3h7bbahKpXFP4jAm80ESRo/t5UIVuT8cN4kd8DybrzcQTpPFp6/R
 WdYyesuHOqEBtpPgVjm8EiAoawpXKax+i1ml2YVNvmKR/l9D+hXBoXalUYLcpcOjLWUC
 PbelaFV8xfDq63Z9V1QrFPOaSz338+Y0N6pEHwSSEX8fCe72Tuxf2wDHp77/r7kzixVc
 bTeg==
X-Gm-Message-State: AOJu0YyAZJSyaUHm2XW21y3s9BXZuzLY47jIdX7gfewhvnER9wXS9MjL
 z9kqK7hMLoaWTyZFGG6LfzQ6Nlrtt7MVq9XS5Pzq8lYsrKGn9hSefmmEkhVU8nKPPwvTrUTMx3V
 xcfRcecuNXrXK4g0AvLGMhNubZbTbvfNXt8t7jg==
X-Google-Smtp-Source: AGHT+IHrY9t/4B+Lzz2Lw8KN0JAea9whHaYc0CgaYyxDY0fOaoVwm7ACGGZUWyG95vsZ7SD5exvwWcZ3270tMEKSRus=
X-Received: by 2002:a17:906:5a97:b0:a44:9d8:29f1 with SMTP id
 l23-20020a1709065a9700b00a4409d829f1mr728615ejq.60.1709282371534; Fri, 01 Mar
 2024 00:39:31 -0800 (PST)
MIME-Version: 1.0
References: <20240229074141.66395-1-huangjianan@xiaomi.com>
 <20240301071402.159309-1-huangjianan@xiaomi.com>
In-Reply-To: <20240301071402.159309-1-huangjianan@xiaomi.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Fri, 1 Mar 2024 17:39:18 +0900
Message-ID: <CAD14+f0saGRa401qDWKwFiYgsHUBcqrfxgmXCWcq1Eqphj8OPw@mail.gmail.com>
To: Huang Jianan <huangjianan@xiaomi.com>, chao@kernel.org
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hi Huang and Chao. I feel like this special loopback handling
 alongside Chao's 14197d546b93 on f2fs-tools is just unnecessarily complicating
 the code flow. We're now doing what, lookup to /sys, parse original backing
 fi [...] Content analysis details:   (1.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 HK_RANDOM_FROM         From username looks random
 0.7 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.49 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.49 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rfyQh-0005TC-HW
Subject: Re: [f2fs-dev] [PATCH v3] f2fs-tools: fix to check loop device for
 non-root users
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
Cc: jaegeuk@kernel.org, wanghui33@xiaomi.com, jnhuang95@gmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgSHVhbmcgYW5kIENoYW8uCgpJIGZlZWwgbGlrZSB0aGlzIHNwZWNpYWwgbG9vcGJhY2sgaGFu
ZGxpbmcgYWxvbmdzaWRlIENoYW8ncwoxNDE5N2Q1NDZiOTMgb24gZjJmcy10b29scyBpcyBqdXN0
IHVubmVjZXNzYXJpbHkgY29tcGxpY2F0aW5nIHRoZSBjb2RlCmZsb3cuCldlJ3JlIG5vdyBkb2lu
ZyB3aGF0LCBsb29rdXAgdG8gL3N5cywgcGFyc2Ugb3JpZ2luYWwgYmFja2luZyBmaWxlLApyZW1v
dmUgdHJhaWxpbmcgbmV3bGluZSBjaGFyLCBzdGF0KCknaW5nIGl0IHRvIG1ha2Ugc3VyZSBpdCBl
eGlzdHM/CgpXaGF0IGlmIHRoZSBzdGF0KCknZWQgZmlsZSBpcyBhIG5ldyBmaWxlIGFmdGVyIHRo
ZSBvcmlnaW5hbCBiYWNraW5nCmZpbGUgaGFzIGJlZW4gZGVsZXRlZD8KCkJlaW5nIGFibGUgdG8g
b3ZlcndyaXRlIGFuIGFjdGl2ZSBsb29wYmFjayBiYWNraW5nIGZpbGUgaXMgYSBzZW1hbnRpYwp0
aGF0IExpbnV4IHByb3ZpZGVzIHdpbGxpbmdseS4KT19FWENMIG9ubHkgd29ya3Mgb24gYmxvY2sg
ZGV2aWNlcyBhbmQgaXQncyBhIFBPU0lYIGd1YXJhbnRlZSB0aGF0Cm11bHRpcGxlIHdyaXRlcnMg
Y2FuIHdvcmsgb24gYSByZWd1bGFyIGZpbGUuCgpJTUhPIHdlIHNob3VsZCBob25vciB0aGF0LCBi
dXQgaWYgd2UgcmVhbGx5IHdhbnQgdG8gcHJldmVudCB0aGlzIGFraW4KdG8gZTJmc3Byb2dzLCB3
ZSBzaG91bGQgYmUgdXNpbmcgbW50ZW50IGxpa2UgZTJmc3Byb2dzLgoKT24gRnJpLCBNYXIgMSwg
MjAyNCBhdCA0OjE14oCvUE0gSHVhbmcgSmlhbmFuIHZpYSBMaW51eC1mMmZzLWRldmVsCjxsaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4gd3JvdGU6Cj4KPiBDdXJyZW50bHkg
bWtmcy9mc2NrIGdldHMgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVuIGV4ZWN1dGVkIGJ5Cj4gbm9u
LXJvb3QgdXNlcnM6Cj4KPiBJbmZvOiBvcGVuIC9kZXYvbG9vcDAgZmFpbGVkIGVycm5vOjEzCj4g
ICAgICAgICBFcnJvcjogTm90IGF2YWlsYWJsZSBvbiBtb3VudGVkIGRldmljZSEKPgo+IExldCdz
IGZpeCBpdCBieSByZWFkaW5nIHRoZSBiYWNraW5nIGZpbGUgZnJvbSBzeXNmcy4KPgo+IEZpeGVz
OiAxNDE5N2Q1NDZiOTMgKCJmMmZzLXRvb2xzOiBmaXggdG8gY2hlY2sgbG9vcCBkZXZpY2UiKQo+
IFNpZ25lZC1vZmYtYnk6IEh1YW5nIEppYW5hbiA8aHVhbmdqaWFuYW5AeGlhb21pLmNvbT4KPiAt
LS0KPiB2MzoKPiAtIFNraXAgZGVsZXRlZCBiYWNraW5nIGZpbGUuCj4gIGxpYi9saWJmMmZzLmMg
fCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9saWIvbGliZjJmcy5jIGIvbGliL2xpYmYyZnMuYwo+IGluZGV4IGQ1MWU0ODUuLmZhZDNmZDQg
MTAwNjQ0Cj4gLS0tIGEvbGliL2xpYmYyZnMuYwo+ICsrKyBiL2xpYi9saWJmMmZzLmMKPiBAQCAt
ODMyLDcgKzgzMiw3IEBAIGludCBmMmZzX2Rldl9pc191bW91bnRlZChjaGFyICpwYXRoKQo+ICAg
ICAgICAgICAgICAgICB9Cj4gICAgICAgICB9IGVsc2UgaWYgKFNfSVNSRUcoc3RfYnVmLnN0X21v
ZGUpKSB7Cj4gICAgICAgICAgICAgICAgIC8qIGNoZWNrIHdoZXRoZXIgcmVndWxhciBpcyBiYWNr
ZmlsZSBvZiBsb29wIGRldmljZSAqLwo+IC0jaWYgZGVmaW5lZChIQVZFX0xJTlVYX0xPT1BfSCkg
JiYgZGVmaW5lZChIQVZFX0xJTlVYX01BSk9SX0gpCj4gKyNpZiBkZWZpbmVkKEhBVkVfTElOVVhf
TUFKT1JfSCkKPiAgICAgICAgICAgICAgICAgc3RydWN0IG1udGVudCAqbW50Owo+ICAgICAgICAg
ICAgICAgICBzdHJ1Y3Qgc3RhdCBzdF9sb29wOwo+ICAgICAgICAgICAgICAgICBGSUxFICpmOwo+
IEBAIC04NDAsOCArODQwLDkgQEAgaW50IGYyZnNfZGV2X2lzX3Vtb3VudGVkKGNoYXIgKnBhdGgp
Cj4gICAgICAgICAgICAgICAgIGYgPSBzZXRtbnRlbnQoIi9wcm9jL21vdW50cyIsICJyIik7Cj4K
PiAgICAgICAgICAgICAgICAgd2hpbGUgKChtbnQgPSBnZXRtbnRlbnQoZikpICE9IE5VTEwpIHsK
PiAtICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbG9vcF9pbmZvNjQgbG9vcGluZm8gPSB7
MCwgfTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBpbnQgbG9vcF9mZCwgZXJyOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzdGF0IHN0X2JhY2s7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgaW50IHN5c2ZzX2ZkLCByYzsKPiArICAgICAgICAgICAgICAgICAgICAgICBjaGFy
IGJ1ZltQQVRIX01BWCArIDFdOwo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKG1udC0+
bW50X2ZzbmFtZVswXSAhPSAnLycpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsKPiBAQCAtODUyLDIzICs4NTMsMzYgQEAgaW50IGYyZnNfZGV2X2lzX3Vtb3VudGVk
KGNoYXIgKnBhdGgpCj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKG1ham9yKHN0X2xvb3Au
c3RfcmRldikgIT0gTE9PUF9NQUpPUikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnRpbnVlOwo+Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgbG9vcF9mZCA9IG9wZW4obW50
LT5tbnRfZnNuYW1lLCBPX1JET05MWSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKGxv
b3BfZmQgPCAwKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc25wcmludGYoYnVmLCBQQVRI
X01BWCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiL3N5cy9kZXYvYmxvY2sv
JWQ6JWQvbG9vcC9iYWNraW5nX2ZpbGUiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG1ham9yKHN0X2xvb3Auc3RfcmRldiksIG1pbm9yKHN0X2xvb3Auc3RfcmRldikpOwo+ICsK
PiArICAgICAgICAgICAgICAgICAgICAgICBzeXNmc19mZCA9IG9wZW4oYnVmLCBPX1JET05MWSk7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHN5c2ZzX2ZkIDwgMCkgewo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgTVNHKDAsICJJbmZvOiBvcGVuICVzIGZhaWxlZCBlcnJu
bzolZFxuIiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbW50LT5t
bnRfZnNuYW1lLCBlcnJubyk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJ1ZiwgZXJybm8pOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IC0xOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPgo+IC0gICAgICAgICAgICAgICAgICAg
ICAgIGVyciA9IGlvY3RsKGxvb3BfZmQsIExPT1BfR0VUX1NUQVRVUzY0LCAmbG9vcGluZm8pOwo+
IC0gICAgICAgICAgICAgICAgICAgICAgIGNsb3NlKGxvb3BfZmQpOwo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGlmIChlcnIgPCAwKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBNU0coMCwgIlx0RXJyb3I6IGlvY3RsIExPT1BfR0VUX1NUQVRVUzY0IGZhaWxlZCBlcnJubzol
ZCFcbiIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVycm5vKTsK
PiArICAgICAgICAgICAgICAgICAgICAgICBtZW1zZXQoYnVmLCAwLCBQQVRIX01BWCArIDEpOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgIHJjID0gcmVhZChzeXNmc19mZCwgYnVmLCBQQVRIX01B
WCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJjIDwgMCkgewo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgTVNHKDAsICJJbmZvOiByZWFkICVzIGZhaWxlZCBlcnJubzol
ZFxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnVmLCBlcnJu
byk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLTE7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgfQo+Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKHN0X2J1
Zi5zdF9kZXYgPT0gbG9vcGluZm8ubG9fZGV2aWNlICYmCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdF9idWYuc3RfaW5vID09IGxvb3BpbmZvLmxvX2lub2RlKSB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgLyogUmVtb3ZlIHRyYWlsaW5nIG5ld2xpbmUgKi8KPiArICAgICAg
ICAgICAgICAgICAgICAgICBpZiAocmMgPiAwICYmICooYnVmICsgcmMgLSAxKSA9PSAnXG4nKQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS1yYzsKPiArICAgICAgICAgICAgICAg
ICAgICAgICBidWZbcmNdID0gJ1wwJzsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgLyog
U2tpcCBkZWxldGVkIGZpbGVzIGxpa2UgInh4eCAoZGVsZXRlZCkiICovCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKHN0YXQoYnVmLCAmc3RfYmFjaykgIT0gMCkKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoc3RfYnVmLnN0X2RldiA9PSBzdF9iYWNrLnN0X2RldiAmJgo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RfYnVmLnN0X2lubyA9PSBzdF9iYWNrLnN0X2lubykgewo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTVNHKDAsICJcdEVycm9yOiBJbiB1c2UgYnkg
bG9vcCBkZXZpY2UhXG4iKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biAtRUJVU1k7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+IC0tCj4gMi4zNC4xCj4KPgo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
