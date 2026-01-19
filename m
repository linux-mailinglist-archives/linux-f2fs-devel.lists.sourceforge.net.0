Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4702D3BC05
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 00:48:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7HtQSjh8U7Oul3h/lctKHlYM6I69Wc7ywCzzyd99vXc=; b=VN14b0zkXPQW7OiGi4fd3EDaIC
	itA16XA/bqb29Maa5+UFC+FoZA8yhGEgoCO2uN2/Etxnv6ctznl2R5am84qOCQ7Wg38mV4N4qnej1
	SNF/ANjyavFB1HJNd3d4Fw9V/YX9BdItIsm5csBiolc+dlEtVVpM/s4pmTfp1RmhvbT0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhyyb-0007ZM-GY;
	Mon, 19 Jan 2026 23:48:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1vhyyZ-0007ZE-W2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 23:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9UKK8NDYTiAe114hXal5pKXodUcO1YoE3E0p/Sm/yQE=; b=D/yNlP0R2nWMtAa8XINlycf7oz
 4+3riykFpEsVfpEKBnTfs+5cpi1DOTgDPBWA645LmxVDNJjOeCAXwP8J/U2ILfpclXCDTcbW0TPCA
 sh+IHiP9+PCIBj2QHymIyb1UWGeNV3/6rb8wh5zlWJYxlNJ56pmt35+GvsVxUfcioBMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9UKK8NDYTiAe114hXal5pKXodUcO1YoE3E0p/Sm/yQE=; b=BNUiImmCQNt5x5STbGEmnRRQH3
 k5oRGYjqjwR4c9eIvldbaL/GoGjkkj/xDpTsj/6Cq2Nx1MjrkWjgnjjLfNANLuBQodJFu/YXzvlN+
 gKPIJQ5GzB85i/0KE5Vpxt0Tkx0+xSo4t6vZjjrFKX4szaYF+xe+RUcoEwLNAXE8NNNw=;
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vhyyZ-0002Sw-FO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 23:48:03 +0000
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4358f854840so1346f8f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Jan 2026 15:48:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768866477; cv=none;
 d=google.com; s=arc-20240605;
 b=Wqk7QcDbQxpZQ0QI3zx9beNZfPkOwVE/36dDTI8Xe1R4Zbe8v+9bJubwa8EDbZwhn8
 pLyuM69Y6mmB4La5pD4LlQF9EXtlIf8Veo8Wptj/X2wcnyBNbIaYnNMXOeWMSF/2QDri
 q0yZUs0sioqUpxb9fPx0QtCNykES2jnEyKaSboFXMP/XrmrrxsG/c1z4MzwnhnJ3zbr1
 02AXNJ6iVLWKpZCrO1Wj8TdNj2lqkdpi5gQclKB//b/hFNXlnEnTkv7ga/2j81JBXGo0
 GiIgc/v/srebR1OzLSIm3m+8TzNA0IpkfAUeUNW+3pkfW0xd6r92ufu2cpdhV0Kr2rFi
 TgjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9UKK8NDYTiAe114hXal5pKXodUcO1YoE3E0p/Sm/yQE=;
 fh=xFZW6L9M1Ee4CoHHhUKTuQ84Bm++XD4Jab+InrblInE=;
 b=W9rY9jRCpu3pnnuh+WJDmbVuWgtjiJ2xB2mp5kB5LxE3gcN0AkCJqPshIxly5/ZxX7
 VJwrbt7//V13639aYOliwqZsdiubCBcSZuCRmrL1DaXdsJZzct61iwa55LlP6jOruXpB
 Z3wybVk0XvCkCMLdtfHkH3DIKT+WB+l/6TT93aMh9anzQOlSiKeOUI88dNwmTnqzGdhP
 dkXF/S8Q3JEqlZbU6Ovn3pG2C09LPzWvEWROtDFJNayEemiJGYW9Gm0nN/pjHYzN7TIV
 sZd9nf6WScltyyziacjNWO1f4yoem6ko+mTC9+cXeX66Jw3yT97Pd3872QA1l/4Q9rJE
 40cw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768866477; x=1769471277; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9UKK8NDYTiAe114hXal5pKXodUcO1YoE3E0p/Sm/yQE=;
 b=losZqFCVY6g3VNjwRLUNRJY80Ns7yOXVy8h52AMOvDSA9AAvc96L59oZwF4u6TjoBE
 NTFhsGCVXsrs7CCj+MTHxpnobpJ+KeR7Evv3DtQMHjuqUs63EREtxjvXTDsTyht7ymsO
 Yu4/9e/3fLIlU04pEsDrcTo0BWQgN89gYPKWFqVL7YqMv8PM7Bu0T5vGsZ0FGUCilqMu
 H/J8AxTpFBWnxK5C/5xLj3wGUWBQKBqaGMeHtPRvwmbkaaUez0DfeoAfmVnFDmKMSXVf
 +NFjjJzB7RtLDGaAWFEn2DEbiCyMzNikvPdokLRZPzQ9rHxntkY7LYB2p7SVmKlTVazI
 h8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768866477; x=1769471277;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9UKK8NDYTiAe114hXal5pKXodUcO1YoE3E0p/Sm/yQE=;
 b=ufnmJbuY5yx3/N3FQJBD6vLS1QHiGBtecSnXMK0WxxeCpeoPT0emzFopu7ILtX/2us
 cKkVcsB0XqaVluz0b2t8J2UHMxae+3uj16h5HmHynSMamFwDGwalN9agb9peuiT5VFGf
 S7xdSZ3gXrfEmNH35wGUvmWTbHRiN4JP8z04XJbINlhzqSiZWoPQ+NTIzfm+h5yMRoKX
 MN1KBia9JStFKWOnUp+XiDpFJwVdQLioW2E9LR/NPpEVZdN7IT94gEbsWTc4TdpuY/lN
 Iq4nDqGHRko5RhI6PpXE2+gLrmUkBI0FqeNxXKr4GNo+HSOZ2KZsGySmxKHrl7nHzu52
 L8eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAHqFfJhV6nk/z8Yy2snhMweXh++rvHLPC8Uuj9HxqpMVQti/slJcrB+P2cbXsb2hG9MnvGzjL7o4ekni1qxZj@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw9P3NbFfeOs48dybJdv4Ro7/D9JSsCK6zGezfSW0mOq8Mv7TiB
 0e14yi7F18ZnZxIqNU4242u2TDtwkcYz9BYLLrR3gbQykcce9n01rjsGKen3WlVClRbt2ZS0tL7
 c6VZ1PGDQ9KsDZ9GFGBAGaVZ9siQdjew=
X-Gm-Gg: AZuq6aLvy2L0o6LcZ4r5kAow+XQXP0va6LY7t2mamEZexaYKlOCoW3ElQAyxOyNZGWz
 a1jmIojKN3Mty3WY4aTbPWuMLtHpT/NJ4kN9H3/qBjyVhNjEKtO3UNm162gaKAQyqbQ/Fh5TqhT
 EerWo/eR04XtFPqHhqCpqu/TJst8W/yPK2ZgxfpxlBRdlUWgozZQgo9wvQGyNAO5/jcHUpSZdXD
 NrfTVEJm001bh3Fib/L7aXJHZT76fYP+5+uUmHRg8C4rQHsYR46HSirKYa0RjUOjQlk85in
X-Received: by 2002:a05:6000:3109:b0:42b:2deb:829 with SMTP id
 ffacd0b85a97d-4358b9b77d4mr896561f8f.3.1768866476666; Mon, 19 Jan 2026
 15:47:56 -0800 (PST)
MIME-Version: 1.0
References: <20260119133230.16481-1-chao@kernel.org>
In-Reply-To: <20260119133230.16481-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 20 Jan 2026 07:47:45 +0800
X-Gm-Features: AZwV_Qh8wH8_S8PXgspt1FbVpYg9lcjrAuKjTRk-yaS9rBSsddMciB1u0KAD9Sk
Message-ID: <CAHJ8P3JebPryFL80s+x0gT5JDeaGGpq3MgjLyJATwuNyC2NM7w@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2026年1月19日周一 22:48写道：
    > > This patch introduces sbi->nr_pages[F2FS_SKIPPED_WRITE] to record any
    > skipped write during data flush in f2fs_enable_check [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.51 listed in wl.mailspike.net]
X-Headers-End: 1vhyyZ-0002Sw-FO
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: check skipped write in
 f2fs_enable_checkpoint()
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
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjblubQx5pyIMTnml6XlkajkuIAgMjI6NDjlhpnpgZPvvJoKPgo+
IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBzYmktPm5yX3BhZ2VzW0YyRlNfU0tJUFBFRF9XUklURV0g
dG8gcmVjb3JkIGFueQo+IHNraXBwZWQgd3JpdGUgZHVyaW5nIGRhdGEgZmx1c2ggaW4gZjJmc19l
bmFibGVfY2hlY2twb2ludCgpLgo+Cj4gU28gaW4gdGhlIGxvb3Agb2YgZGF0YSBmbHVzaCwgaWYg
dGhlcmUgaXMgYW55IHNraXBwZWQgd3JpdGUgaW4gcHJldmlvdXMKPiBmbHVzaCwgbGV0J3MgcmV0
cnkgc3luY19pbm9kZV9zYigpLCBvdGhlcndpc2UsIGFsbCBkaXJ0eSBkYXRhIHdyaXR0ZW4KPiBi
ZWZvcmUgZjJmc19lbmFibGVfY2hlY2twb2ludCgpIHNob3VsZCBoYXZlIGJlZW4gcGVyc2lzdGVk
LCB0aGVuIGJyZWFrCj4gdGhlIHJldHJ5IGxvb3AuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1
IDxjaGFvQGtlcm5lbC5vcmc+Cj4gLS0tCj4gQ2hhbmdlbG9nOgo+IC0gY29kZSBpcyBiYXNlZCBv
biAnUmV2ZXJ0ICJmMmZzOiBhZGQgdGltZW91dCBpbiBmMmZzX2VuYWJsZV9jaGVja3BvaW50KCki
Jwo+ICBmcy9mMmZzL2RhdGEuYyAgfCAxMiArKysrKysrKysrKysKPiAgZnMvZjJmcy9mMmZzLmgg
IHwgIDIgKysKPiAgZnMvZjJmcy9zdXBlci5jIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEu
Ywo+IGluZGV4IDViNDgzMjk1NjE5Ni4uMDAxMDhkNTg4MWFhIDEwMDY0NAo+IC0tLSBhL2ZzL2Yy
ZnMvZGF0YS5jCj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiBAQCAtMzUwMCw2ICszNTAwLDE1IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBhY2NvdW50X3dyaXRlYmFjayhzdHJ1Y3QgaW5vZGUgKmlub2Rl
LCBib29sIGluYykKPiAgICAgICAgIGYyZnNfdXBfcmVhZCgmRjJGU19JKGlub2RlKS0+aV9zZW0p
Owo+ICB9Cj4KPiArc3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9za2lwcGVkX3dyaXRlKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRyb2wgKndiYykKPiArewo+ICsgICAg
ICAgbG9uZyBza2lwcGVkID0gd2JjLT5wYWdlc19za2lwcGVkOwo+ICsKPiArICAgICAgIGlmIChz
a2lwcGVkICYmIGlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9FTkFCTEVfQ0hFQ0tQT0lOVCkpCj4g
KyAgICAgICAgICAgICAgIGF0b21pY19hZGQoc2tpcHBlZCwgJnNiaS0+bnJfcGFnZXNbRjJGU19T
S0lQUEVEX1dSSVRFXSk7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgX19mMmZzX3dyaXRlX2RhdGFf
cGFnZXMoc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHdyaXRlYmFja19jb250cm9sICp3
YmMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51
bSBpb3N0YXRfdHlwZSBpb190eXBlKQo+IEBAIC0zNTY0LDEwICszNTczLDEzIEBAIHN0YXRpYyBp
bnQgX19mMmZzX3dyaXRlX2RhdGFfcGFnZXMoc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcs
Cj4gICAgICAgICAgKi8KPgo+ICAgICAgICAgZjJmc19yZW1vdmVfZGlydHlfaW5vZGUoaW5vZGUp
Owo+ICsKPiArICAgICAgIHVwZGF0ZV9za2lwcGVkX3dyaXRlKHNiaSwgd2JjKTsKSGkgQ2hhbywK
U29ycnksIHdoeSBkbyB3ZSBuZWVkIHRvIHVwZGF0ZSBza2lwcGVkIHdyaXRlIGhlcmUgYXMgd2Vs
bD8KdGhhbmtzIQo+ICAgICAgICAgcmV0dXJuIHJldDsKPgo+ICBza2lwX3dyaXRlOgo+ICAgICAg
ICAgd2JjLT5wYWdlc19za2lwcGVkICs9IGdldF9kaXJ0eV9wYWdlcyhpbm9kZSk7Cj4gKyAgICAg
ICB1cGRhdGVfc2tpcHBlZF93cml0ZShzYmksIHdiYyk7Cj4gICAgICAgICB0cmFjZV9mMmZzX3dy
aXRlcGFnZXMobWFwcGluZy0+aG9zdCwgd2JjLCBEQVRBKTsKPiAgICAgICAgIHJldHVybiAwOwo+
ICB9Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPiBpbmRl
eCAwMzUyMzk3NThlMzMuLjUyY2VjNmIzZWNmMCAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2YyZnMu
aAo+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gQEAgLTEyMzgsNiArMTIzOCw3IEBAIGVudW0gY291
bnRfdHlwZSB7Cj4gICAgICAgICBGMkZTX1JEX01FVEEsCj4gICAgICAgICBGMkZTX0RJT19XUklU
RSwKPiAgICAgICAgIEYyRlNfRElPX1JFQUQsCj4gKyAgICAgICBGMkZTX1NLSVBQRURfV1JJVEUs
ICAgICAvKiBza2lwIG9yIGZhaWwgZHVyaW5nIGYyZnNfZW5hYmxlX2NoZWNrcG9pbnQoKSAqLwo+
ICAgICAgICAgTlJfQ09VTlRfVFlQRSwKPiAgfTsKPgo+IEBAIC0xNDc2LDYgKzE0NzcsNyBAQCBl
bnVtIHsKPiAgICAgICAgIFNCSV9JU19SRVNJWkVGUywgICAgICAgICAgICAgICAgICAgICAgICAv
KiByZXNpemVmcyBpcyBpbiBwcm9jZXNzICovCj4gICAgICAgICBTQklfSVNfRlJFRVpJTkcsICAg
ICAgICAgICAgICAgICAgICAgICAgLyogZnJlZXplZnMgaXMgaW4gcHJvY2VzcyAqLwo+ICAgICAg
ICAgU0JJX0lTX1dSSVRBQkxFLCAgICAgICAgICAgICAgICAgICAgICAgIC8qIHJlbW92ZSBybyBt
b3VudG9wdGlvbiB0cmFuc2llbnRseSAqLwo+ICsgICAgICAgU0JJX0VOQUJMRV9DSEVDS1BPSU5U
LCAgICAgICAgICAgICAgICAgIC8qIGluZGljYXRlIGl0J3MgZHVyaW5nIGYyZnNfZW5hYmxlX2No
ZWNrcG9pbnQoKSAqLwo+ICAgICAgICAgTUFYX1NCSV9GTEFHLAo+ICB9Owo+Cj4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+IGluZGV4IDk3YzIyNjRlYzdm
ZS4uMGFmZTlmODI5MDU4IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+ICsrKyBiL2Zz
L2YyZnMvc3VwZXIuYwo+IEBAIC0yNjkwLDYgKzI2OTAsNyBAQCBzdGF0aWMgaW50IGYyZnNfZW5h
YmxlX2NoZWNrcG9pbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ICAgICAgICAgbG9uZyBs
b25nIHN0YXJ0LCB3cml0ZWJhY2ssIGVuZDsKPiAgICAgICAgIGludCByZXQ7Cj4gICAgICAgICBz
dHJ1Y3QgZjJmc19sb2NrX2NvbnRleHQgbGM7Cj4gKyAgICAgICBsb25nIGxvbmcgc2tpcHBlZF93
cml0ZSwgZGlydHlfZGF0YTsKPgo+ICAgICAgICAgZjJmc19pbmZvKHNiaSwgImYyZnNfZW5hYmxl
X2NoZWNrcG9pbnQoKSBzdGFydHMsIG1ldGE6ICVsbGQsIG5vZGU6ICVsbGQsIGRhdGE6ICVsbGQi
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZXRfcGFnZXMoc2Jp
LCBGMkZTX0RJUlRZX01FVEEpLAo+IEBAIC0yNjk4LDE3ICsyNjk5LDQ1IEBAIHN0YXRpYyBpbnQg
ZjJmc19lbmFibGVfY2hlY2twb2ludChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4KPiAgICAg
ICAgIHN0YXJ0ID0ga3RpbWVfZ2V0KCk7Cj4KPiArICAgICAgIHNldF9zYmlfZmxhZyhzYmksIFNC
SV9FTkFCTEVfQ0hFQ0tQT0lOVCk7Cj4gKwo+ICAgICAgICAgLyogd2Ugc2hvdWxkIGZsdXNoIGFs
bCB0aGUgZGF0YSB0byBrZWVwIGRhdGEgY29uc2lzdGVuY3kgKi8KPiAgICAgICAgIGRvIHsKPiAr
ICAgICAgICAgICAgICAgc2tpcHBlZF93cml0ZSA9IGdldF9wYWdlcyhzYmksIEYyRlNfU0tJUFBF
RF9XUklURSk7Cj4gKyAgICAgICAgICAgICAgIGRpcnR5X2RhdGEgPSBnZXRfcGFnZXMoc2JpLCBG
MkZTX0RJUlRZX0RBVEEpOwo+ICsKPiAgICAgICAgICAgICAgICAgc3luY19pbm9kZXNfc2Ioc2Jp
LT5zYik7Cj4gICAgICAgICAgICAgICAgIGYyZnNfaW9fc2NoZWR1bGVfdGltZW91dChERUZBVUxU
X1NDSEVEVUxFX1RJTUVPVVQpOwo+IC0gICAgICAgfSB3aGlsZSAoZ2V0X3BhZ2VzKHNiaSwgRjJG
U19ESVJUWV9EQVRBKSAmJiByZXRyeS0tKTsKPiArCj4gKyAgICAgICAgICAgICAgIGYyZnNfaW5m
byhzYmksICJzeW5jX2lub2RlX3NiIGRvbmUsIGRpcnR5X2RhdGE6ICVsbGQsICVsbGQsICIKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJza2lwcGVkIHdyaXRlOiAlbGxkLCAlbGxk
LCByZXRyeTogJWQiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0X3BhZ2Vz
KHNiaSwgRjJGU19ESVJUWV9EQVRBKSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGRpcnR5X2RhdGEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZXRfcGFnZXMo
c2JpLCBGMkZTX1NLSVBQRURfV1JJVEUpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2tpcHBlZF93cml0ZSwgcmV0cnkpOwo+ICsKPiArICAgICAgICAgICAgICAgLyoKPiArICAg
ICAgICAgICAgICAgICogc3luY19pbm9kZXNfc2IoKSBoYXMgcmV0cnkgbG9naWMsIHNvIGxldCdz
IGNoZWNrIGRpcnR5X2RhdGEKPiArICAgICAgICAgICAgICAgICogaW4gcHJpb3IgdG8gc2tpcHBl
ZF93cml0ZSBpbiBjYXNlIHRoZXJlIGlzIG5vIGRpcnR5IGRhdGEuCj4gKyAgICAgICAgICAgICAg
ICAqLwo+ICsgICAgICAgICAgICAgICBpZiAoIWdldF9wYWdlcyhzYmksIEYyRlNfRElSVFlfREFU
QSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAgIGlm
IChnZXRfcGFnZXMoc2JpLCBGMkZTX1NLSVBQRURfV1JJVEUpID09IHNraXBwZWRfd3JpdGUpCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICB9IHdoaWxlIChyZXRyeS0t
KTsKPiArCj4gKyAgICAgICBjbGVhcl9zYmlfZmxhZyhzYmksIFNCSV9FTkFCTEVfQ0hFQ0tQT0lO
VCk7Cj4KPiAgICAgICAgIHdyaXRlYmFjayA9IGt0aW1lX2dldCgpOwo+Cj4gLSAgICAgICBpZiAo
dW5saWtlbHkoZ2V0X3BhZ2VzKHNiaSwgRjJGU19ESVJUWV9EQVRBKSkpCj4gLSAgICAgICAgICAg
ICAgIGYyZnNfd2FybihzYmksICJjaGVja3BvaW50PWVuYWJsZSBoYXMgc29tZSB1bndyaXR0ZW4g
ZGF0YTogJWxsZCIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdl
dF9wYWdlcyhzYmksIEYyRlNfRElSVFlfREFUQSkpOwo+ICsgICAgICAgaWYgKHVubGlrZWx5KGdl
dF9wYWdlcyhzYmksIEYyRlNfRElSVFlfREFUQSkgfHwKPiArICAgICAgICAgICAgICAgICAgICAg
ICBnZXRfcGFnZXMoc2JpLCBGMkZTX1NLSVBQRURfV1JJVEUpKSkKPiArICAgICAgICAgICAgICAg
ZjJmc193YXJuKHNiaSwgImNoZWNrcG9pbnQ9ZW5hYmxlIHVud3JpdHRlbiBkYXRhOiAlbGxkLCBz
a2lwcGVkIGRhdGE6ICVsbGQsIHJldHJ5OiAlZCIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBnZXRfcGFnZXMoc2JpLCBGMkZTX0RJUlRZX0RBVEEpLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZ2V0X3BhZ2VzKHNiaSwgRjJGU19TS0lQUEVEX1dSSVRFKSwgcmV0
cnkpOwo+ICsKPiArICAgICAgIGlmIChnZXRfcGFnZXMoc2JpLCBGMkZTX1NLSVBQRURfV1JJVEUp
KQo+ICsgICAgICAgICAgICAgICBhdG9taWNfc2V0KCZzYmktPm5yX3BhZ2VzW0YyRlNfU0tJUFBF
RF9XUklURV0sIDApOwo+Cj4gICAgICAgICBmMmZzX2Rvd25fd3JpdGVfdHJhY2UoJnNiaS0+Z2Nf
bG9jaywgJmxjKTsKPiAgICAgICAgIGYyZnNfZGlydHlfdG9fcHJlZnJlZShzYmkpOwo+IC0tCj4g
Mi40MC4xCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
