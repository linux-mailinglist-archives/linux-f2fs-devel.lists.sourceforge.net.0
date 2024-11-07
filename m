Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E471C9BFCEB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2024 04:19:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8t3T-0000xD-1V;
	Thu, 07 Nov 2024 03:19:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t8t3Q-0000x0-EA
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 03:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9i6iU2j4fsq9YuVwHW6fI2V1rvkHGx0ZfuUTvvlwbmo=; b=BgpeWvJSzLouiTphMD/tJf5XCf
 TqoG8JsxM8AW/nKDCX0Kan01/YaF2muBybTEtdWOn8tORvNNovwghLGnREPrlQmv7PI5fffeNeXxy
 dnmNxEJf2O4yuPS17oFVqLmq58Cm++/YVsttfB1lg/8I/7h342RhT/dUoNY+iFlaPlSE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9i6iU2j4fsq9YuVwHW6fI2V1rvkHGx0ZfuUTvvlwbmo=; b=MTHsEglWBDz2CLy5fuvvsZXZVP
 kjw500akj6xFlIxnvxtH0LDeVECbZaw3Z/10ISuqFKBIL0Ei0QgOpIXIlVa11IqL0+OapqKain2Q2
 DfhOW2HGC+q1YdtpiyoQienNLTaUb4iq0xZJEkvQo7OD41HrXy+OX8zEcG+md7anRVtw=;
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t8t3L-0006kJ-Vq for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 03:19:24 +0000
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-37d43a34a0cso59325f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 06 Nov 2024 19:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730949552; x=1731554352; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9i6iU2j4fsq9YuVwHW6fI2V1rvkHGx0ZfuUTvvlwbmo=;
 b=VwjqRNMdi6JqYrQZAUxCj6eA3wNAUcuvhIGJ5j15+X48YjzOMdX7heg0vMNMlKL9fe
 2s6qZMxmi9h6nJIYHdgVexmaJQTDeAnUdprNMJnW1Mdsras+lTeRHYdQ5vjbC3IZEQxr
 qkffu15A9fZ5+l0oW98w5exvORBSskxErkCm2w7coBaEQ3yYysGCgKzdtHAKtJuZyoOj
 hU/OYY8uguLQDRO3m5o8neB5S8GQbAjYRWKOAyvYff2XNma0nLe8meE2sWpLO/N89mJ3
 mgYfAOmhNqScfm+H95+DxSXti0sie81AdT0vT6O1UcCYVgQs5sjUmkSI0qxDOtG7PNU2
 e9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730949552; x=1731554352;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9i6iU2j4fsq9YuVwHW6fI2V1rvkHGx0ZfuUTvvlwbmo=;
 b=wU/YKgJ6vopbAf/OSgdcpi7ShX0q7LxnzfMCRgBV44dVhWmEguicWhePyqFa73vph3
 19kVpz1JidiEZUZ3zGBMChcQrzzU88l1nfijq37XeuBU4LdUm5I+mSre7+N+qJS90lIV
 gDuvNLW0+BZbLwOeiS0oZceve+LRPNvooiU5q8AlC9x4uOo3ucPUgiQn8zMGfj0uexT/
 uv6DDfVkPdo/SJlPcqmN2r9DpM0m1AyrLs72v0N+3OjXLZFpp5wE1t6x2+pylrFWq5Cs
 P7lXaIQI6MDiiUl61ZNuqPZBjFxfRHiKbj44Khs5xhhMn2YT6AIhwfCKeLUVE1SOCIsc
 OdLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUawEolVgLQArNhy/bvwfkVympZAE0oAyk9oqsPHsXE8S58glxCR0qy4LiLuvnQcVmZz5ARkdGOdM4Yoo38TdS2@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzinB+CZDLwUHKcEdtSI+fQay7gLiUoL6f/6hb2LEsHWyAxsaBl
 +1yyK2EO1/dwgl7+Irx9Ii0RJI0LTUAsjHPBfI5EUIfvVwVmP8LyEY5AzkK4+zHGf0PJy70U7sl
 lfx5G6eCP5+eLGSY1u2Z9ppHw6h8=
X-Google-Smtp-Source: AGHT+IF5IR4Uor1FQMJzAE08YCFSu5KhOkkxnvUkSEc0CHM5BbOv2wVieBgTO1nP8Ry51Ykxh1hUVd9B0ZmhCSDGAYw=
X-Received: by 2002:a05:600c:548d:b0:431:5632:448d with SMTP id
 5b1f17b1804b1-432ae84c727mr6600365e9.9.1730949552125; Wed, 06 Nov 2024
 19:19:12 -0800 (PST)
MIME-Version: 1.0
References: <20241107014602.3638020-1-chao@kernel.org>
In-Reply-To: <20241107014602.3638020-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 7 Nov 2024 11:19:01 +0800
Message-ID: <CAHJ8P3LUTz9XGji5Xa2Jy-KeSuaG9HhtDhxz_aM1hE=-K+zsGw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2024年11月7日周四 09:50写道：
    > > f2fs doesn't support different blksize in one instance, so > bytes_to_blks()
    and blks_to_bytes() are equal to F2FS_BYTES_TO_ [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.54 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1t8t3L-0006kJ-Vq
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up w/ F2FS_{BLK_TO_BYTES,
 BTYES_TO_BLK}
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
Cc: jaegeuk@kernel.org, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjTlubQxMeaciDfml6Xlkajlm5sgMDk6NTDlhpnpgZPvvJoKPgo+
IGYyZnMgZG9lc24ndCBzdXBwb3J0IGRpZmZlcmVudCBibGtzaXplIGluIG9uZSBpbnN0YW5jZSwg
c28KPiBieXRlc190b19ibGtzKCkgYW5kIGJsa3NfdG9fYnl0ZXMoKSBhcmUgZXF1YWwgdG8gRjJG
U19CWVRFU19UT19CTEsKPiBhbmQgRjJGU19CTEtfVE9fQllURVMsIGxldCdzIHVzZSBGMkZTX0JZ
VEVTX1RPX0JMSy9GMkZTX0JMS19UT19CWVRFUwo+IGluc3RlYWQgZm9yIGNsZWFudXAuCj4KPiBS
ZXBvcnRlZC1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KZmVlbCBmcmVlIHRvIGFkZDoKUmV2aWV3
ZWQtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KdGhhbmtzIQo+IC0tLQo+
ICBmcy9mMmZzL2RhdGEuYyB8IDY4ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAzOSBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0
YS5jCj4gaW5kZXggYjMzYWNhMjRiOWVmLi4wZTgzOTBjYmRiNWIgMTAwNjQ0Cj4gLS0tIGEvZnMv
ZjJmcy9kYXRhLmMKPiArKysgYi9mcy9mMmZzL2RhdGEuYwo+IEBAIC0xODE5LDE2ICsxODE5LDYg
QEAgYm9vbCBmMmZzX292ZXJ3cml0ZV9pbyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBsb2ZmX3QgcG9z
LCBzaXplX3QgbGVuKQo+ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gIH0KPgo+IC1zdGF0aWMgaW5s
aW5lIHU2NCBieXRlc190b19ibGtzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHU2NCBieXRlcykKPiAt
ewo+IC0gICAgICAgcmV0dXJuIChieXRlcyA+PiBpbm9kZS0+aV9ibGtiaXRzKTsKPiAtfQo+IC0K
PiAtc3RhdGljIGlubGluZSB1NjQgYmxrc190b19ieXRlcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCB1
NjQgYmxrcykKPiAtewo+IC0gICAgICAgcmV0dXJuIChibGtzIDw8IGlub2RlLT5pX2Jsa2JpdHMp
Owo+IC19Cj4gLQo+ICBzdGF0aWMgaW50IGYyZnNfeGF0dHJfZmllbWFwKHN0cnVjdCBpbm9kZSAq
aW5vZGUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZmllbWFwX2V4
dGVudF9pbmZvICpmaWVpbmZvKQo+ICB7Cj4gQEAgLTE4NTQsNyArMTg0NCw3IEBAIHN0YXRpYyBp
bnQgZjJmc194YXR0cl9maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gZXJyOwo+ICAgICAgICAgICAgICAgICB9Cj4KPiAtICAgICAgICAg
ICAgICAgcGh5cyA9IGJsa3NfdG9fYnl0ZXMoaW5vZGUsIG5pLmJsa19hZGRyKTsKPiArICAgICAg
ICAgICAgICAgcGh5cyA9IEYyRlNfQkxLX1RPX0JZVEVTKG5pLmJsa19hZGRyKTsKPiAgICAgICAg
ICAgICAgICAgb2Zmc2V0ID0gb2Zmc2V0b2Yoc3RydWN0IGYyZnNfaW5vZGUsIGlfYWRkcikgKwo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoX19sZTMyKSAq
IChERUZfQUREUlNfUEVSX0lOT0RFIC0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZ2V0X2lubGluZV94YXR0cl9hZGRycyhpbm9kZSkpOwo+IEBAIC0xODg2LDcgKzE4
NzYsNyBAQCBzdGF0aWMgaW50IGYyZnNfeGF0dHJfZmllbWFwKHN0cnVjdCBpbm9kZSAqaW5vZGUs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGVycjsKPiAgICAgICAgICAgICAgICAg
fQo+Cj4gLSAgICAgICAgICAgICAgIHBoeXMgPSBibGtzX3RvX2J5dGVzKGlub2RlLCBuaS5ibGtf
YWRkcik7Cj4gKyAgICAgICAgICAgICAgIHBoeXMgPSBGMkZTX0JMS19UT19CWVRFUyhuaS5ibGtf
YWRkcik7Cj4gICAgICAgICAgICAgICAgIGxlbiA9IGlub2RlLT5pX3NiLT5zX2Jsb2Nrc2l6ZTsK
Pgo+ICAgICAgICAgICAgICAgICBmMmZzX3B1dF9wYWdlKHBhZ2UsIDEpOwo+IEBAIC0xOTQ4LDE2
ICsxOTM4LDE2IEBAIGludCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3Qg
ZmllbWFwX2V4dGVudF9pbmZvICpmaWVpbmZvLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdv
dG8gb3V0Owo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBpZiAoYnl0ZXNfdG9fYmxrcyhpbm9kZSwg
bGVuKSA9PSAwKQo+IC0gICAgICAgICAgICAgICBsZW4gPSBibGtzX3RvX2J5dGVzKGlub2RlLCAx
KTsKPiArICAgICAgIGlmIChGMkZTX0JZVEVTX1RPX0JMSyhsZW4pID09IDApCj4gKyAgICAgICAg
ICAgICAgIGxlbiA9IEYyRlNfQkxLU0laRTsKPgo+IC0gICAgICAgc3RhcnRfYmxrID0gYnl0ZXNf
dG9fYmxrcyhpbm9kZSwgc3RhcnQpOwo+IC0gICAgICAgbGFzdF9ibGsgPSBieXRlc190b19ibGtz
KGlub2RlLCBzdGFydCArIGxlbiAtIDEpOwo+ICsgICAgICAgc3RhcnRfYmxrID0gRjJGU19CWVRF
U19UT19CTEsoc3RhcnQpOwo+ICsgICAgICAgbGFzdF9ibGsgPSBGMkZTX0JZVEVTX1RPX0JMSyhz
dGFydCArIGxlbiAtIDEpOwo+Cj4gIG5leHQ6Cj4gICAgICAgICBtZW1zZXQoJm1hcCwgMCwgc2l6
ZW9mKG1hcCkpOwo+ICAgICAgICAgbWFwLm1fbGJsayA9IHN0YXJ0X2JsazsKPiAtICAgICAgIG1h
cC5tX2xlbiA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGxlbik7Cj4gKyAgICAgICBtYXAubV9sZW4g
PSBGMkZTX0JZVEVTX1RPX0JMSyhsZW4pOwo+ICAgICAgICAgbWFwLm1fbmV4dF9wZ29mcyA9ICZu
ZXh0X3Bnb2ZzOwo+ICAgICAgICAgbWFwLm1fc2VnX3R5cGUgPSBOT19DSEVDS19UWVBFOwo+Cj4g
QEAgLTE5NzQsNyArMTk2NCw3IEBAIGludCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5vZGUgKmlub2Rl
LCBzdHJ1Y3QgZmllbWFwX2V4dGVudF9pbmZvICpmaWVpbmZvLAo+ICAgICAgICAgaWYgKCFjb21w
cl9jbHVzdGVyICYmICEobWFwLm1fZmxhZ3MgJiBGMkZTX01BUF9GTEFHUykpIHsKPiAgICAgICAg
ICAgICAgICAgc3RhcnRfYmxrID0gbmV4dF9wZ29mczsKPgo+IC0gICAgICAgICAgICAgICBpZiAo
Ymxrc190b19ieXRlcyhpbm9kZSwgc3RhcnRfYmxrKSA8IG1heGJ5dGVzKQo+ICsgICAgICAgICAg
ICAgICBpZiAoRjJGU19CTEtfVE9fQllURVMoc3RhcnRfYmxrKSA8IG1heGJ5dGVzKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gcHJlcF9uZXh0Owo+Cj4gICAgICAgICAgICAgICAgIGZs
YWdzIHw9IEZJRU1BUF9FWFRFTlRfTEFTVDsKPiBAQCAtMjAxMSwxNCArMjAwMSwxNCBAQCBpbnQg
ZjJmc19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpZW1hcF9leHRlbnRfaW5m
byAqZmllaW5mbywKPiAgICAgICAgIH0gZWxzZSBpZiAoY29tcHJfYXBwZW5kZWQpIHsKPiAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50IGFwcGVuZGVkX2Jsa3MgPSBjbHVzdGVyX3NpemUgLQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvdW50X2lu
X2NsdXN0ZXIgKyAxOwo+IC0gICAgICAgICAgICAgICBzaXplICs9IGJsa3NfdG9fYnl0ZXMoaW5v
ZGUsIGFwcGVuZGVkX2Jsa3MpOwo+ICsgICAgICAgICAgICAgICBzaXplICs9IEYyRlNfQkxLX1RP
X0JZVEVTKGFwcGVuZGVkX2Jsa3MpOwo+ICAgICAgICAgICAgICAgICBzdGFydF9ibGsgKz0gYXBw
ZW5kZWRfYmxrczsKPiAgICAgICAgICAgICAgICAgY29tcHJfY2x1c3RlciA9IGZhbHNlOwo+ICAg
ICAgICAgfSBlbHNlIHsKPiAtICAgICAgICAgICAgICAgbG9naWNhbCA9IGJsa3NfdG9fYnl0ZXMo
aW5vZGUsIHN0YXJ0X2Jsayk7Cj4gKyAgICAgICAgICAgICAgIGxvZ2ljYWwgPSBGMkZTX0JMS19U
T19CWVRFUyhzdGFydF9ibGspOwo+ICAgICAgICAgICAgICAgICBwaHlzID0gX19pc192YWxpZF9k
YXRhX2Jsa2FkZHIobWFwLm1fcGJsaykgPwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGJsa3Nf
dG9fYnl0ZXMoaW5vZGUsIG1hcC5tX3BibGspIDogMDsKPiAtICAgICAgICAgICAgICAgc2l6ZSA9
IGJsa3NfdG9fYnl0ZXMoaW5vZGUsIG1hcC5tX2xlbik7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgRjJGU19CTEtfVE9fQllURVMobWFwLm1fcGJsaykgOiAwOwo+ICsgICAgICAgICAgICAgICBz
aXplID0gRjJGU19CTEtfVE9fQllURVMobWFwLm1fbGVuKTsKPiAgICAgICAgICAgICAgICAgZmxh
Z3MgPSAwOwo+Cj4gICAgICAgICAgICAgICAgIGlmIChjb21wcl9jbHVzdGVyKSB7Cj4gQEAgLTIw
MjYsMTMgKzIwMTYsMTMgQEAgaW50IGYyZnNfZmllbWFwKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0
cnVjdCBmaWVtYXBfZXh0ZW50X2luZm8gKmZpZWluZm8sCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgY291bnRfaW5fY2x1c3RlciArPSBtYXAubV9sZW47Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgaWYgKGNvdW50X2luX2NsdXN0ZXIgPT0gY2x1c3Rlcl9zaXplKSB7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb21wcl9jbHVzdGVyID0gZmFsc2U7Cj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzaXplICs9IGJsa3NfdG9fYnl0ZXMoaW5vZGUsIDEpOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZSArPSBGMkZTX0JMS1NJWkU7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICB9IGVsc2UgaWYgKG1hcC5t
X2ZsYWdzICYgRjJGU19NQVBfREVMQUxMT0MpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBm
bGFncyA9IEZJRU1BUF9FWFRFTlRfVU5XUklUVEVOOwo+ICAgICAgICAgICAgICAgICB9Cj4KPiAt
ICAgICAgICAgICAgICAgc3RhcnRfYmxrICs9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHNpemUpOwo+
ICsgICAgICAgICAgICAgICBzdGFydF9ibGsgKz0gRjJGU19CWVRFU19UT19CTEsoc2l6ZSk7Cj4g
ICAgICAgICB9Cj4KPiAgcHJlcF9uZXh0Ogo+IEBAIC0yMDcwLDcgKzIwNjAsNyBAQCBzdGF0aWMg
aW50IGYyZnNfcmVhZF9zaW5nbGVfcGFnZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZm9s
aW8gKmZvbGlvLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgcmVhZGFoZWFkX2NvbnRyb2wgKnJhYykKPiAgewo+ICAgICAgICAgc3RydWN0IGJpbyAqYmlv
ID0gKmJpb19yZXQ7Cj4gLSAgICAgICBjb25zdCB1bnNpZ25lZCBibG9ja3NpemUgPSBibGtzX3Rv
X2J5dGVzKGlub2RlLCAxKTsKPiArICAgICAgIGNvbnN0IHVuc2lnbmVkIGludCBibG9ja3NpemUg
PSBGMkZTX0JMS1NJWkU7Cj4gICAgICAgICBzZWN0b3JfdCBibG9ja19pbl9maWxlOwo+ICAgICAg
ICAgc2VjdG9yX3QgbGFzdF9ibG9jazsKPiAgICAgICAgIHNlY3Rvcl90IGxhc3RfYmxvY2tfaW5f
ZmlsZTsKPiBAQCAtMjA4MCw4ICsyMDcwLDggQEAgc3RhdGljIGludCBmMmZzX3JlYWRfc2luZ2xl
X3BhZ2Uoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZvbGlvICpmb2xpbywKPgo+ICAgICAg
ICAgYmxvY2tfaW5fZmlsZSA9IChzZWN0b3JfdClpbmRleDsKPiAgICAgICAgIGxhc3RfYmxvY2sg
PSBibG9ja19pbl9maWxlICsgbnJfcGFnZXM7Cj4gLSAgICAgICBsYXN0X2Jsb2NrX2luX2ZpbGUg
PSBieXRlc190b19ibGtzKGlub2RlLAo+IC0gICAgICAgICAgICAgICAgICAgICAgIGYyZnNfcmVh
ZHBhZ2VfbGltaXQoaW5vZGUpICsgYmxvY2tzaXplIC0gMSk7Cj4gKyAgICAgICBsYXN0X2Jsb2Nr
X2luX2ZpbGUgPSBGMkZTX0JZVEVTX1RPX0JMSyhmMmZzX3JlYWRwYWdlX2xpbWl0KGlub2RlKSAr
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBibG9ja3NpemUgLSAxKTsKPiAgICAgICAgIGlmIChsYXN0X2Jsb2NrID4gbGFzdF9ibG9ja19p
bl9maWxlKQo+ICAgICAgICAgICAgICAgICBsYXN0X2Jsb2NrID0gbGFzdF9ibG9ja19pbl9maWxl
Owo+Cj4gQEAgLTIxODEsNyArMjE3MSw3IEBAIGludCBmMmZzX3JlYWRfbXVsdGlfcGFnZXMoc3Ry
dWN0IGNvbXByZXNzX2N0eCAqY2MsIHN0cnVjdCBiaW8gKipiaW9fcmV0LAo+ICAgICAgICAgc3Ry
dWN0IGJpbyAqYmlvID0gKmJpb19yZXQ7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgc3RhcnRfaWR4
ID0gY2MtPmNsdXN0ZXJfaWR4IDw8IGNjLT5sb2dfY2x1c3Rlcl9zaXplOwo+ICAgICAgICAgc2Vj
dG9yX3QgbGFzdF9ibG9ja19pbl9maWxlOwo+IC0gICAgICAgY29uc3QgdW5zaWduZWQgYmxvY2tz
aXplID0gYmxrc190b19ieXRlcyhpbm9kZSwgMSk7Cj4gKyAgICAgICBjb25zdCB1bnNpZ25lZCBp
bnQgYmxvY2tzaXplID0gRjJGU19CTEtTSVpFOwo+ICAgICAgICAgc3RydWN0IGRlY29tcHJlc3Nf
aW9fY3R4ICpkaWMgPSBOVUxMOwo+ICAgICAgICAgc3RydWN0IGV4dGVudF9pbmZvIGVpID0ge307
Cj4gICAgICAgICBib29sIGZyb21fZG5vZGUgPSB0cnVlOwo+IEBAIC0yMTkwLDggKzIxODAsOCBA
QCBpbnQgZjJmc19yZWFkX211bHRpX3BhZ2VzKHN0cnVjdCBjb21wcmVzc19jdHggKmNjLCBzdHJ1
Y3QgYmlvICoqYmlvX3JldCwKPgo+ICAgICAgICAgZjJmc19idWdfb24oc2JpLCBmMmZzX2NsdXN0
ZXJfaXNfZW1wdHkoY2MpKTsKPgo+IC0gICAgICAgbGFzdF9ibG9ja19pbl9maWxlID0gYnl0ZXNf
dG9fYmxrcyhpbm9kZSwKPiAtICAgICAgICAgICAgICAgICAgICAgICBmMmZzX3JlYWRwYWdlX2xp
bWl0KGlub2RlKSArIGJsb2Nrc2l6ZSAtIDEpOwo+ICsgICAgICAgbGFzdF9ibG9ja19pbl9maWxl
ID0gRjJGU19CWVRFU19UT19CTEsoZjJmc19yZWFkcGFnZV9saW1pdChpbm9kZSkgKwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tz
aXplIC0gMSk7Cj4KPiAgICAgICAgIC8qIGdldCByaWQgb2YgcGFnZXMgYmV5b25kIEVPRiAqLwo+
ICAgICAgICAgZm9yIChpID0gMDsgaSA8IGNjLT5jbHVzdGVyX3NpemU7IGkrKykgewo+IEBAIC0z
OTU3LDcgKzM5NDcsNyBAQCBzdGF0aWMgaW50IGNoZWNrX3N3YXBfYWN0aXZhdGUoc3RydWN0IHN3
YXBfaW5mb19zdHJ1Y3QgKnNpcywKPiAgICAgICAgICAqIHRvIGJlIHZlcnkgc21hcnQuCj4gICAg
ICAgICAgKi8KPiAgICAgICAgIGN1cl9sYmxvY2sgPSAwOwo+IC0gICAgICAgbGFzdF9sYmxvY2sg
PSBieXRlc190b19ibGtzKGlub2RlLCBpX3NpemVfcmVhZChpbm9kZSkpOwo+ICsgICAgICAgbGFz
dF9sYmxvY2sgPSBGMkZTX0JZVEVTX1RPX0JMSyhpX3NpemVfcmVhZChpbm9kZSkpOwo+Cj4gICAg
ICAgICB3aGlsZSAoY3VyX2xibG9jayA8IGxhc3RfbGJsb2NrICYmIGN1cl9sYmxvY2sgPCBzaXMt
Pm1heCkgewo+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzIG1hcDsKPiBA
QCAtNDIwMCw4ICs0MTkwLDggQEAgc3RhdGljIGludCBmMmZzX2lvbWFwX2JlZ2luKHN0cnVjdCBp
bm9kZSAqaW5vZGUsIGxvZmZfdCBvZmZzZXQsIGxvZmZfdCBsZW5ndGgsCj4gICAgICAgICBwZ29m
Zl90IG5leHRfcGdvZnMgPSAwOwo+ICAgICAgICAgaW50IGVycjsKPgo+IC0gICAgICAgbWFwLm1f
bGJsayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIG9mZnNldCk7Cj4gLSAgICAgICBtYXAubV9sZW4g
PSBieXRlc190b19ibGtzKGlub2RlLCBvZmZzZXQgKyBsZW5ndGggLSAxKSAtIG1hcC5tX2xibGsg
KyAxOwo+ICsgICAgICAgbWFwLm1fbGJsayA9IEYyRlNfQllURVNfVE9fQkxLKG9mZnNldCk7Cj4g
KyAgICAgICBtYXAubV9sZW4gPSBGMkZTX0JZVEVTX1RPX0JMSyhvZmZzZXQgKyBsZW5ndGggLSAx
KSAtIG1hcC5tX2xibGsgKyAxOwo+ICAgICAgICAgbWFwLm1fbmV4dF9wZ29mcyA9ICZuZXh0X3Bn
b2ZzOwo+ICAgICAgICAgbWFwLm1fc2VnX3R5cGUgPSBmMmZzX3J3X2hpbnRfdG9fc2VnX3R5cGUo
RjJGU19JX1NCKGlub2RlKSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbm9kZS0+aV93cml0ZV9oaW50KTsKPiBAQCAtNDIxMiw3ICs0MjAyLDcgQEAg
c3RhdGljIGludCBmMmZzX2lvbWFwX2JlZ2luKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGxvZmZfdCBv
ZmZzZXQsIGxvZmZfdCBsZW5ndGgsCj4gICAgICAgICBpZiAoZXJyKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gZXJyOwo+Cj4gLSAgICAgICBpb21hcC0+b2Zmc2V0ID0gYmxrc190b19ieXRlcyhp
bm9kZSwgbWFwLm1fbGJsayk7Cj4gKyAgICAgICBpb21hcC0+b2Zmc2V0ID0gRjJGU19CTEtfVE9f
QllURVMobWFwLm1fbGJsayk7Cj4KPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBXaGVuIGlubGlu
ZSBlbmNyeXB0aW9uIGlzIGVuYWJsZWQsIHNvbWV0aW1lcyBJL08gdG8gYW4gZW5jcnlwdGVkIGZp
bGUKPiBAQCAtNDIzMiwyMSArNDIyMiwyMSBAQCBzdGF0aWMgaW50IGYyZnNfaW9tYXBfYmVnaW4o
c3RydWN0IGlub2RlICppbm9kZSwgbG9mZl90IG9mZnNldCwgbG9mZl90IGxlbmd0aCwKPiAgICAg
ICAgICAgICAgICAgaWYgKFdBUk5fT05fT05DRShtYXAubV9wYmxrID09IE5FV19BRERSKSkKPiAg
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+IC0gICAgICAgICAgICAg
ICBpb21hcC0+bGVuZ3RoID0gYmxrc190b19ieXRlcyhpbm9kZSwgbWFwLm1fbGVuKTsKPiArICAg
ICAgICAgICAgICAgaW9tYXAtPmxlbmd0aCA9IEYyRlNfQkxLX1RPX0JZVEVTKG1hcC5tX2xlbik7
Cj4gICAgICAgICAgICAgICAgIGlvbWFwLT50eXBlID0gSU9NQVBfTUFQUEVEOwo+ICAgICAgICAg
ICAgICAgICBpb21hcC0+ZmxhZ3MgfD0gSU9NQVBfRl9NRVJHRUQ7Cj4gICAgICAgICAgICAgICAg
IGlvbWFwLT5iZGV2ID0gbWFwLm1fYmRldjsKPiAtICAgICAgICAgICAgICAgaW9tYXAtPmFkZHIg
PSBibGtzX3RvX2J5dGVzKGlub2RlLCBtYXAubV9wYmxrKTsKPiArICAgICAgICAgICAgICAgaW9t
YXAtPmFkZHIgPSBGMkZTX0JMS19UT19CWVRFUyhtYXAubV9wYmxrKTsKPiAgICAgICAgIH0gZWxz
ZSB7Cj4gICAgICAgICAgICAgICAgIGlmIChmbGFncyAmIElPTUFQX1dSSVRFKQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PVEJMSzsKPgo+ICAgICAgICAgICAgICAgICBpZiAo
bWFwLm1fcGJsayA9PSBOVUxMX0FERFIpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBpb21h
cC0+bGVuZ3RoID0gYmxrc190b19ieXRlcyhpbm9kZSwgbmV4dF9wZ29mcykgLQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
b21hcC0+b2Zmc2V0Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlvbWFwLT5sZW5ndGggPSBG
MkZTX0JMS19UT19CWVRFUyhuZXh0X3Bnb2ZzKSAtCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpb21hcC0+b2Zmc2V0Owo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGlvbWFwLT50eXBlID0gSU9NQVBfSE9MRTsKPiAgICAgICAgICAgICAg
ICAgfSBlbHNlIGlmIChtYXAubV9wYmxrID09IE5FV19BRERSKSB7Cj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgaW9tYXAtPmxlbmd0aCA9IGJsa3NfdG9fYnl0ZXMoaW5vZGUsIG1hcC5tX2xlbik7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaW9tYXAtPmxlbmd0aCA9IEYyRlNfQkxLX1RPX0JZ
VEVTKG1hcC5tX2xlbik7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaW9tYXAtPnR5cGUgPSBJ
T01BUF9VTldSSVRURU47Cj4gICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgZjJmc19idWdfb24oRjJGU19JX1NCKGlub2RlKSwgMSk7Cj4gLS0KPiAyLjQw
LjEKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
