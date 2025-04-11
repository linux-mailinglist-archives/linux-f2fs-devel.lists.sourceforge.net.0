Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBC6A85166
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 04:08:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u33oC-0005lI-FU;
	Fri, 11 Apr 2025 02:07:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1u33oA-0005lA-I1
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 02:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I3wG24XjJTCo1m+UcmX0RtsTg3K64Snc8O4DlJKF5fE=; b=O0un2/ueIg2YqCR7WtT0iDzO8Y
 ulgCYKRw5rAQxyB1kGB1cOtorPLqDYqPnayLhyJSfmFVDIs7hQoebqzuJ5T3QevgN/QIlHtjWI7Pb
 ROQiS9hlUQNtSUaylB4oKIipcTkKeR84kMd6Zrwp6W41f3EYGHmAnMDLCofYc+wNbNKM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I3wG24XjJTCo1m+UcmX0RtsTg3K64Snc8O4DlJKF5fE=; b=cky3yL9SOXJ5b0D59ifnPo+e9g
 MbLFa0xTFX7G4HCjzzaqnV1YaMcm41wgKgbUct2a7AQpV2XL4NEb4rp+sfFk30AnNcBqVE0Es1chM
 Bxvbyh2SY2trCigjl0z79e5JkfQPzNO2ZH/voMr8VF2wTb8Hx9vSRNb4cQzhSESoHJ0s=;
Received: from mail-wm1-f50.google.com ([209.85.128.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u33nu-0002rx-Lh for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 02:07:54 +0000
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43d4ff56136so2248715e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Apr 2025 19:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744337247; x=1744942047; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3wG24XjJTCo1m+UcmX0RtsTg3K64Snc8O4DlJKF5fE=;
 b=XY5FtTaLFwpIht9Twe12diXFJWbjZNW85od4Cb/w36zCNtBKNcC3Wcp8SkZmeIzNI+
 B8NE08BtIAxG5ct7jva2mFsSfR41L0+Sw8olC7bhVTy4UrdjkWKyyr8KC7DLo5Nkf8M5
 /4ob3Cv8vcdIHBn8SIeXvSrNDBfCrIp39s3ykML/IgFm+vPpXi4nAMiu4h5Y5KTfvtpb
 UYLjjENpo+ajgft7GMnQuvagdKVmgs5V5X2BOQEX3ILdWfGyMAsNwkd2S9XpE1A2xNNe
 wKf0u3HhjcXTSwZvOhgLNlnZ0pd3T3lLHlIblHKxMgKZzxfHlh7B6NvOMZc3GAIhJ/J7
 8Sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744337247; x=1744942047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I3wG24XjJTCo1m+UcmX0RtsTg3K64Snc8O4DlJKF5fE=;
 b=w8ngPmRJSAKMUhahq/G54oz6NCgXrR2Hk7+xYj4fq5e71fiTkm8VW83D1AywRxc8FN
 zNCb5SWhSDzdK0oap8qcTkWB7kC4/Rg5mLowBxY1c2rj4DbFh7wYe2TnMcmKxVE2OxAt
 2+pKv4YkNDcP6qqtL8qGZMpnPtGhyx31fXE+7r8jkTcoiMqKNownC0l5i4kEhzXKJeAr
 pQ94lRDdHssiRtg9TdRaiNtpwQPTuhGj6bkBLHgsuFDDDF7gtpCVKBls6ZVgeVLoqeJJ
 ycQ3N11Gd6ni1iS3xI1YFMixRjPr+bmGgvtwyWf5M0dnuvBg1Npr+jRBv7OzylyHSV4E
 OWdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQA00LfvLcmGQFYg7y2XoE4K3JmPq14AvDEa/hu8+BeoSgAXsBElHCEngj+J3MCz7VUamGlNzIvMHBSPcDUNJx@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy4W1NJVabgftaFPKgjZ8CRRgQvLs9rFTf2I0f0Cf5YlbufBWzP
 6eOU622EVMmLmf+/adMW/zChfxZx1eeyoShKFOeZ7/9SanKHvEBP54HjOuKbDTD/wd+Wn32XT0a
 WPdhQExJXTxSNyuLfIrKXEogTbE7RrxHn
X-Gm-Gg: ASbGnctj6KD+r9AN5hBKhzAeDBsaOMqceL9EsDzexFs/ekiOdGHOIKJbzo3lvfPQg70
 LXBcZh0iiSIR89EJQZIqa+Ohqf49mSTePBjyN4b3aqFEjJJRTVhwCbJY42rWJ2u3hbr6KvDME8l
 /I6GN9PsZOV6FLpWqzPgdzSZ4=
X-Google-Smtp-Source: AGHT+IH5O4Y6PPna8CcyfmheCa2oKQgxIo8ppyg5F4X16RynaCCIhp+9YDevO6jwGvIjJ5T8Fre+VBA14DN16mlgd+o=
X-Received: by 2002:a05:6000:1862:b0:39c:dfc:f496 with SMTP id
 ffacd0b85a97d-39ec22f8a45mr34849f8f.8.1744337246614; Thu, 10 Apr 2025
 19:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250407020727.1810288-1-chao@kernel.org>
In-Reply-To: <20250407020727.1810288-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 11 Apr 2025 10:07:15 +0800
X-Gm-Features: ATxdqUFlgttaK5_Ah2haV40yTtsXAAXmWLhOYtMqaW4wDkCfu1JBoPDgoxA7pqs
Message-ID: <CAHJ8P3+p9ExSyCxhBT0EUsVD15-v==4rhyQ8nXYXWwMEBEKvFA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年4月7日周一 10:11写道：
    > > Support a new option --nolinear-lookup=X for fsck.f2fs to tune > linear
    lookup fallback conditionally, X=1: disable linear lo [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.50 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.50 listed in bl.score.senderscore.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.50 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.50 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1u33nu-0002rx-Lh
Subject: Re: [f2fs-dev] [PATCH v2 3/3] fsck.f2fs: support to tune linear
 lookup feature
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQ05pyIN+aXpeWRqOS4gCAxMDoxMeWGmemBk++8mgo+Cj4g
U3VwcG9ydCBhIG5ldyBvcHRpb24gLS1ub2xpbmVhci1sb29rdXA9WCBmb3IgZnNjay5mMmZzIHRv
IHR1bmUKPiBsaW5lYXIgbG9va3VwIGZhbGxiYWNrIGNvbmRpdGlvbmFsbHksIFg9MTogZGlzYWJs
ZSBsaW5lYXIgbG9va3VwLAo+IFg9MDogZW5hYmxlIGxpbmVhciBsb29rdXAuCj4KPiBUaGlzIGNh
biBoZWxwIHRvIDEpIGFkZCBhIHJlZ3Jlc3Npb24gdGVzdGNhc2UgdG8gY2hlY2sga2VybmVsCj4g
d2hldGhlciBsaW5lYXIgbG9va3VwIGZhbGxiYWNrIGhhcyBmaXhlZCB1bmljb2RlIHJlZCBoZWFy
dCBsb29rdXAKPiBpc3N1ZSwgMikgb25jZSB1bmljb2RlIGJ1ZyBoYXMgYmVlbiBmaXhlZCwgd2Ug
Y2FuIHVzZSB0aGlzIG9wdGlvbgo+IHRvIGRpc2FibGUgbGluZWFyIGxvb2t1cCBmb3IgcGVyZm9y
bWFuY2UgcmVjb3ZlcnkuCj4KPiBDYzogRGFuaWVsIExlZSA8Y2h1bGxlZUBnb29nbGUuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0KPiB2MjoKPiAt
IGFkZCBkZXNjcmlwdGlvbiBpbiBmc2NrIG1hbnVhbAo+ICBmc2NrL2ZzY2suYyAgICAgICB8IDI2
ICsrKysrKysrKysrKysrKysrKysrKysrKystCj4gIGZzY2svZnNjay5oICAgICAgIHwgIDEgKwo+
ICBmc2NrL21haW4uYyAgICAgICB8IDEwICsrKysrKysrKysKPiAgaW5jbHVkZS9mMmZzX2ZzLmgg
fCAgOCArKysrKystLQo+ICBtYW4vZnNjay5mMmZzLjggICB8ICAzICsrKwo+ICA1IGZpbGVzIGNo
YW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZnNjay9mc2NrLmMgYi9mc2NrL2ZzY2suYwo+IGluZGV4IDgxNTVjYmQuLjA1OWJhNjEgMTAwNjQ0
Cj4gLS0tIGEvZnNjay9mc2NrLmMKPiArKysgYi9mc2NrL2ZzY2suYwo+IEBAIC0yMzU3LDYgKzIz
NTcsMzAgQEAgaW50IGZzY2tfY2hrX3F1b3RhX2ZpbGVzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSkKPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPgo+ICt2b2lkIGZzY2tfdXBkYXRlX3NiX2Zs
YWdzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiArewo+ICsgICAgICAgc3RydWN0IGYyZnNf
c3VwZXJfYmxvY2sgKnNiID0gRjJGU19SQVdfU1VQRVIoc2JpKTsKPiArICAgICAgIHUxNiBmbGFn
cyA9IGdldF9zYihzX2VuY29kaW5nX2ZsYWdzKTsKPiArCj4gKyAgICAgICBpZiAoYy5ub2xpbmVh
cl9sb29rdXApIHsKPiArICAgICAgICAgICAgICAgaWYgKCEoZmxhZ3MgJiBGMkZTX0VOQ19OT19D
T01QQVRfRkFMTEJBQ0tfRkwpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3MgfD0g
RjJGU19FTkNfTk9fQ09NUEFUX0ZBTExCQUNLX0ZMOwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHNldF9zYihzX2VuY29kaW5nX2ZsYWdzLCBmbGFncyk7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgYy5maXhfb24gPSAxOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGMuaW52YWxpZF9zYiB8
PSBTQl9FTkNPREVfRkxBRzsKPiArICAgICAgICAgICAgICAgICAgICAgICBEQkcoMCwgIkNhc2Vm
b2xkOiBlbmFibGUgbm9saW5lYXIgbG9va3VwXG4iKTsKPiArICAgICAgICAgICAgICAgfQo+ICsg
ICAgICAgfSBlbHNlIHsKPiArICAgICAgICAgICAgICAgaWYgKGZsYWdzICYgRjJGU19FTkNfTk9f
Q09NUEFUX0ZBTExCQUNLX0ZMKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3MgJj0g
fkYyRlNfRU5DX05PX0NPTVBBVF9GQUxMQkFDS19GTDsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBzZXRfc2Ioc19lbmNvZGluZ19mbGFncywgZmxhZ3MpOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGMuZml4X29uID0gMTsKPiArICAgICAgICAgICAgICAgICAgICAgICBjLmludmFsaWRfc2Ig
fD0gU0JfRU5DT0RFX0ZMQUc7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgREJHKDAsICJDYXNl
Zm9sZDogZGlzYWJsZSBub2xpbmVhciBsb29rdXBcbiIpOwo+ICsgICAgICAgICAgICAgICB9Cj4g
KyAgICAgICB9Cj4gK30KPiArCj4gIGludCBmc2NrX2Noa19tZXRhKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSkKPiAgewo+ICAgICAgICAgc3RydWN0IGYyZnNfZnNjayAqZnNjayA9IEYyRlNfRlND
SyhzYmkpOwo+IEBAIC0zNzcwLDcgKzM3OTQsNyBAQCBpbnQgZnNja192ZXJpZnkoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpKQo+ICAgICAgICAgICAgICAgICBpZiAoYy5pbnZhbGlkX3NiICYgU0Jf
RlNfRVJST1JTKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIG1lbXNldChzYi0+c19lcnJvcnMs
IDAsIE1BWF9GMkZTX0VSUk9SUyk7Cj4KPiAtICAgICAgICAgICAgICAgaWYgKGMuaW52YWxpZF9z
YiAmIFNCX05FRURfRklYKQo+ICsgICAgICAgICAgICAgICBpZiAoYy5pbnZhbGlkX3NiICYgKFNC
X05FRURfRklYIHwgU0JfRU5DT0RFX0ZMQUcpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHVw
ZGF0ZV9zdXBlcmJsb2NrKHNiLCBTQl9NQVNLX0FMTCk7Cj4KPiAgICAgICAgICAgICAgICAgLyog
dG8gcmV0dXJuIEZTQ0tfRVJST1JfQ09SUkVDVEVEICovCj4gZGlmZiAtLWdpdCBhL2ZzY2svZnNj
ay5oIGIvZnNjay9mc2NrLmgKPiBpbmRleCBiNTgxZDNlLi40MGNiNmQ5IDEwMDY0NAo+IC0tLSBh
L2ZzY2svZnNjay5oCj4gKysrIGIvZnNjay9mc2NrLmgKPiBAQCAtMTg4LDYgKzE4OCw3IEBAIGV4
dGVybiBpbnQgZnNja19jaGtfZGVudHJ5X2JsayhzdHJ1Y3QgZjJmc19zYl9pbmZvICosIGludCwK
PiAgaW50IGZzY2tfY2hrX2lubGluZV9kZW50cmllcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICosIHN0
cnVjdCBmMmZzX25vZGUgKiwKPiAgICAgICAgICAgICAgICAgc3RydWN0IGNoaWxkX2luZm8gKik7
Cj4gIHZvaWQgZnNja19jaGtfY2hlY2twb2ludChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+
ICt2b2lkIGZzY2tfdXBkYXRlX3NiX2ZsYWdzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4g
IGludCBmc2NrX2Noa19tZXRhKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gIHZvaWQgZnNj
a19jaGtfYW5kX2ZpeF93cml0ZV9wb2ludGVycyhzdHJ1Y3QgZjJmc19zYl9pbmZvICopOwo+ICBp
bnQgZnNja19jaGtfY3Vyc2VnX2luZm8oc3RydWN0IGYyZnNfc2JfaW5mbyAqKTsKPiBkaWZmIC0t
Z2l0IGEvZnNjay9tYWluLmMgYi9mc2NrL21haW4uYwo+IGluZGV4IDQ3YmE2YzkuLjUyNGRiYjEg
MTAwNjQ0Cj4gLS0tIGEvZnNjay9tYWluLmMKPiArKysgYi9mc2NrL21haW4uYwo+IEBAIC05MSw2
ICs5MSw3IEBAIHZvaWQgZnNja191c2FnZSgpCj4gICAgICAgICBNU0coMCwgIiAgLS1uby1rZXJu
ZWwtY2hlY2sgc2tpcHMgZGV0ZWN0aW5nIGtlcm5lbCBjaGFuZ2VcbiIpOwo+ICAgICAgICAgTVNH
KDAsICIgIC0ta2VybmVsLWNoZWNrIGNoZWNrcyBrZXJuZWwgY2hhbmdlXG4iKTsKPiAgICAgICAg
IE1TRygwLCAiICAtLWRlYnVnLWNhY2hlIHRvIGRlYnVnIGNhY2hlIHdoZW4gLWMgaXMgdXNlZFxu
Iik7Cj4gKyAgICAgICBNU0coMCwgIiAgLS1ub2xpbmVhci1sb29rdXA9WCBYPTE6IGRpc2FibGUg
bGluZWFyIGxvb2t1cCwgWD0wOiBlbmFibGUgbGluZWFyIGxvb2t1cFxuIik7Cj4gICAgICAgICBl
eGl0KDEpOwo+ICB9Cj4KPiBAQCAtMjYzLDYgKzI2NCw3IEBAIHZvaWQgZjJmc19wYXJzZV9vcHRp
b25zKGludCBhcmdjLCBjaGFyICphcmd2W10pCj4gICAgICAgICAgICAgICAgICAgICAgICAgeyJu
by1rZXJuZWwtY2hlY2siLCBub19hcmd1bWVudCwgMCwgMn0sCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgeyJrZXJuZWwtY2hlY2siLCBub19hcmd1bWVudCwgMCwgM30sCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgeyJkZWJ1Zy1jYWNoZSIsIG5vX2FyZ3VtZW50LCAwLCA0fSwKPiArICAgICAg
ICAgICAgICAgICAgICAgICB7Im5vbGluZWFyLWxvb2t1cCIsIHJlcXVpcmVkX2FyZ3VtZW50LCAw
LCA1fSwKPiAgICAgICAgICAgICAgICAgICAgICAgICB7MCwgMCwgMCwgMH0KPiAgICAgICAgICAg
ICAgICAgfTsKPgo+IEBAIC0yODcsNiArMjg5LDEyIEBAIHZvaWQgZjJmc19wYXJzZV9vcHRpb25z
KGludCBhcmdjLCBjaGFyICphcmd2W10pCj4gICAgICAgICAgICAgICAgICAgICAgICAgY2FzZSA0
Ogo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5jYWNoZV9jb25maWcuZGJnX2Vu
ID0gdHJ1ZTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGNhc2UgNToKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlmICghb3B0YXJnIHx8ICFzdHJjbXAob3B0YXJnLCAiMCIpKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjLm5vbGluZWFyX2xvb2t1cCA9IDA7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGMubm9saW5lYXJfbG9va3VwID0gMTsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwpIaSBDaGFvCkkgYWxzbyBlbmNvdW50ZXJlZCB0aGUgc2Ft
ZSBwZXJmb3JtYW5jZSByZWdyZXNzaW9uIHByb2JsZW0gaW4gQW5kcm9pZApkZXZpY2UgYXMga2Vy
bmVsIGNvbW1pdAo1MWRjNDkxYTA4NTUoImYyZnM6IHN1cHBvcnQgdG8gZGlzYWJsZSBsaW5lYXIg
bG9va3VwIGZhbGxiYWNrIikgc2hvd24uCgpzbyBiZWNhdXNlIHdlIGFsc28gbmVlZCB0byB1cGRh
dGUgdGhpcyBjb21taXQgYWJvdXQgZnNjayB0byBhdm9pZApwZXJmb3JtYW5jZSByZWdyZXNzaW9u
cy4KSXMgaXQgYXBwcm9wcmlhdGUgdG8gc2V0IHRoaXMgcGFyYW1ldGVyICBkaXNhYmxlIGxpbmVh
cl9sb29rdXAgYnkKZGVmYXVsdCDvvIhjLm5vbGluZWFyX2xvb2t1cCA9IDHvvIk/ClRoaXMgYWxz
byBmaXRzIG1vc3Qgb2YgdGhlIHNjZW5hcmlvcy4KSWYgb3RoZXIgdXNlcnMgd2FudCB0byBlbmFi
bGUgdGhpcyBmZWF0dXJlLCB0aGV5IGNhbiBjb250cm9sIGl0CnRocm91Z2ggcGFyYW1ldGVycy4K
dGhhbmtzIQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNhc2UgJ2EnOgo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYy5hdXRvX2ZpeCA9IDE7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBNU0coMCwgIkluZm86IEF1dG9tYXRpYyBmaXggbW9kZSBlbmFibGVkLlxu
Iik7Cj4gQEAgLTk5MCw2ICs5OTgsOCBAQCBzdGF0aWMgaW50IGRvX2ZzY2soc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEYyRlNfRlRfRElSLCBUWVBF
X0lOT0RFLCAmYmxrX2NudCwgJmNiYywgJmNoaWxkKTsKPiAgICAgICAgIGZzY2tfY2hrX3F1b3Rh
X2ZpbGVzKHNiaSk7Cj4KPiArICAgICAgIGZzY2tfdXBkYXRlX3NiX2ZsYWdzKHNiaSk7Cj4gKwo+
ICAgICAgICAgcmV0ID0gZnNja192ZXJpZnkoc2JpKTsKPiAgICAgICAgIGZzY2tfZnJlZShzYmkp
Owo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZjJmc19mcy5oIGIvaW5jbHVkZS9mMmZzX2ZzLmgK
PiBpbmRleCBmMjA2OTk0Li43ZTNmMjViIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZjJmc19mcy5o
Cj4gKysrIGIvaW5jbHVkZS9mMmZzX2ZzLmgKPiBAQCAtNjgyLDcgKzY4Miw4IEBAIGVudW0gewo+
ICAjZGVmaW5lIElTX0RFVklDRV9BTElBU0lORyhmaSkgKChmaSktPmlfZmxhZ3MgJiBjcHVfdG9f
bGUzMihGMkZTX0RFVklDRV9BTElBU19GTCkpCj4KPiAgI2RlZmluZSBGMkZTX0VOQ19VVEY4XzEy
XzEgICAgIDEKPiAtI2RlZmluZSBGMkZTX0VOQ19TVFJJQ1RfTU9ERV9GTCAgICAgICAgKDEgPDwg
MCkKPiArI2RlZmluZSBGMkZTX0VOQ19TVFJJQ1RfTU9ERV9GTCAgICAgICAgICAgICAgICAoMSA8
PCAwKQo+ICsjZGVmaW5lIEYyRlNfRU5DX05PX0NPTVBBVF9GQUxMQkFDS19GTCAoMSA8PCAxKQo+
Cj4gIC8qIFRoaXMgZmxhZyBpcyB1c2VkIGJ5IG5vZGUgYW5kIG1ldGEgaW5vZGVzLCBhbmQgYnkg
cmVjb3ZlcnkgKi8KPiAgI2RlZmluZSBHRlBfRjJGU19aRVJPICAoR0ZQX05PRlMgfCBfX0dGUF9a
RVJPKQo+IEBAIC0xNDY3LDcgKzE0NjgsOSBAQCBlbnVtIHsKPiAgI2RlZmluZSBTQl9BQk5PUk1B
TF9TVE9QICAgICAgIDB4MiAgICAgLyogc19zdG9wX3JlYXNvbiBpcyBzZXQgZXhjZXB0IHNodXRk
b3duICovCj4gICNkZWZpbmUgU0JfRlNfRVJST1JTICAgICAgICAgICAweDQgICAgIC8qIHNfZXJy
b3MgaXMgc2V0ICovCj4gICNkZWZpbmUgU0JfSU5WQUxJRCAgICAgICAgICAgICAweDggICAgIC8q
IHNiIGlzIGludmFsaWQgKi8KPiAtI2RlZmluZSBTQl9ORUVEX0ZJWCAoU0JfQUJOT1JNQUxfU1RP
UCB8IFNCX0ZTX0VSUk9SUyB8IFNCX0lOVkFMSUQpCj4gKyNkZWZpbmUgU0JfRU5DT0RFX0ZMQUcg
ICAgICAgICAweDE2ICAgIC8qIGVuY29kZV9mbGFnICovCj4gKyNkZWZpbmUgU0JfTkVFRF9GSVgg
ICAgICAgICAgICAoU0JfQUJOT1JNQUxfU1RPUCB8IFNCX0ZTX0VSUk9SUyB8ICAgICAgXAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JfSU5WQUxJRCB8IFNCX0VOQ09ERV9GTEFH
KQo+Cj4gICNkZWZpbmUgTUFYX0NBQ0hFX1NVTVMgICAgICAgICAgICAgICAgIDgKPgo+IEBAIC0x
NTQxLDYgKzE1NDQsNyBAQCBzdHJ1Y3QgZjJmc19jb25maWd1cmF0aW9uIHsKPiAgICAgICAgIGlu
dCBwcmVzZXJ2ZV9saW1pdHM7ICAgICAgICAgICAgLyogcHJlc2VydmUgcXVvdGEgbGltaXRzICov
Cj4gICAgICAgICBpbnQgbGFyZ2VfbmF0X2JpdG1hcDsKPiAgICAgICAgIGludCBmaXhfY2hrc3Vt
OyAgICAgICAgICAgICAgICAgLyogZml4IG9sZCBjcC5jaGtzdW0gcG9zaXRpb24gKi8KPiArICAg
ICAgIGludCBub2xpbmVhcl9sb29rdXA7ICAgICAgICAgICAgLyogZGlzYWJsZSBsaW5lYXIgbG9v
a3VwICovCj4gICAgICAgICB1bnNpZ25lZCBpbnQgZmVhdHVyZTsgICAgICAgICAgICAgICAgICAg
LyogZGVmaW5lZCBmZWF0dXJlcyAqLwo+ICAgICAgICAgdW5zaWduZWQgaW50IGRpc2FibGVkX2Zl
YXR1cmU7ICAvKiBkaXNhYmxlZCBmZWF0dXJlLCB1c2VkIGZvciBBbmRyb2lkIG9ubHkgKi8KPiAg
ICAgICAgIHVuc2lnbmVkIGludCBxdW90YV9iaXRzOyAgICAgICAgLyogcXVvdGEgYml0cyAqLwo+
IGRpZmYgLS1naXQgYS9tYW4vZnNjay5mMmZzLjggYi9tYW4vZnNjay5mMmZzLjgKPiBpbmRleCBl
MzlhODQ2Li42MDZlMjg4IDEwMDY0NAo+IC0tLSBhL21hbi9mc2NrLmYyZnMuOAo+ICsrKyBiL21h
bi9mc2NrLmYyZnMuOAo+IEBAIC02Nyw2ICs2Nyw5IEBAIEVuYWJsZSB0byBzaG93IGV2ZXJ5IGRp
cmVjdG9yeSBlbnRyaWVzIGluIHRoZSBwYXJ0aXRpb24uCj4gIFNwZWNpZnkgdGhlIGxldmVsIG9m
IGRlYnVnZ2luZyBvcHRpb25zLgo+ICBUaGUgZGVmYXVsdCBudW1iZXIgaXMgMCwgd2hpY2ggc2hv
d3MgYmFzaWMgZGVidWdnaW5nIG1lc3NhZ2VzLgo+ICAuVFAKPiArLkJJIFwtLW5vbGluZWFyLWxv
b2t1cAo+ICtUdW5lIGxpbmVhciBsb29rdXAgZmFsbGJhY2ssIG11c3Qgc3BlY2lmeSBhbiBhcmd1
bWVudCwgMDogZW5hYmxlIGxpbmVhciBsb29rdXAsIDE6IGRpc2FibGUgbGluZWFyIGxvb2t1cC4K
PiArLlRQCj4gIC5TSCBBVVRIT1IKPiAgSW5pdGlhbCBjaGVja2luZyBjb2RlIHdhcyB3cml0dGVu
IGJ5IEJ5b3VuZyBHZXVuIEtpbSA8YmdiZy5raW1Ac2Ftc3VuZy5jb20+Lgo+ICBKYWVnZXVrIEtp
bSA8amFlZ2V1a0BrZXJuZWwub3JnPiByZXdvcmtlZCBtb3N0IHBhcnRzIG9mIHRoZSBjb2RlcyB0
byBzdXBwb3J0Cj4gLS0KPiAyLjQ5LjAKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
