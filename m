Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD0065A3DF
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Dec 2022 13:01:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pBaYf-0004fo-IX;
	Sat, 31 Dec 2022 12:01:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jeff.chua.linux@gmail.com>) id 1pBaYe-0004fi-8z
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 Dec 2022 12:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RaaY97QCcyGMEMmi6/j1i3/RRPxl4/1opD6hoeKEX1s=; b=SL8kOcWU/Ij9m9uB55vIky8vuu
 74yoNP7FKMJme0x0o0CVsrZ7Vkhiwqa7wKamZvl8CuaZkl9tjWqTCeVlT/9r4kko9g4Qk9eyYqZx/
 3eXTg00f1vhDuJ6+rBQZXUjOROZHi7xSDcHvxWfYxLtDan1+oFwW5lJGAFtDAdS6R2cs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RaaY97QCcyGMEMmi6/j1i3/RRPxl4/1opD6hoeKEX1s=; b=Dr0a8tRh2OX5mxbbmWjejccNmN
 ipSDNLHj9P3xBXwv2ay67Ww1YpUVc79vGz2NgsMdLEcPi7EdPwpK3LTGgDG8MMdLOx1KOCK4LQb4a
 hCLoNil0tp7/hLPpb9EEORW197emLW/LiqSluX9BiifN8iRL8wXf5EAVC6JZhrOiI+Gg=;
Received: from mail-ua1-f45.google.com ([209.85.222.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pBaYZ-000Q9r-SQ for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 Dec 2022 12:01:48 +0000
Received: by mail-ua1-f45.google.com with SMTP id e24so5267396uam.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 31 Dec 2022 04:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RaaY97QCcyGMEMmi6/j1i3/RRPxl4/1opD6hoeKEX1s=;
 b=aFbcxy3jnOjz7OpodmFHVOnEAlu4wWKJSepnSVGKgdOfp0GHhD+MFuGHgg4owJzytI
 sMJntPbeZJEJsqNxwdjeUHBjRdiDN1PUo2WJkPItrzw7sbk6dZXhGbQ44nCT1kfUuw2G
 LhPD4Az6kN7MEEGKLSwo4lARBg1dbL7Az4OdcnpR5A68f1L/CFZgaOdHToUvof8AlSnV
 E1le7BiOZGIfnXbLeIL31HjAAq3drHWSfPBw3kxyz76U0BNKVsl+muuDDcz1RvpsImhu
 jFn3H8cENN47Bk40+Cfz5BGvprjdG1YrueD0GzPxjfy8iSIICJ9DN7gU1ndhiNIg945g
 EcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RaaY97QCcyGMEMmi6/j1i3/RRPxl4/1opD6hoeKEX1s=;
 b=iR+a0h3OIKZj9sDl4XPBx0YBe00AqTwrMuVuS711pkjAXLYZ3+Wb3We6M9jnnocWkJ
 dLTg+2GK/tuWZdW4v4LU8qfqPIUIiSyIXz0dw5Dko21UerJq5hdVO1ARcRoFp+tLaq8e
 mvL49UCE2XXHSZn9xb2fmrcxAGqG1CNKNCdiRrDIGuF3TLdJmo5+zq8ZQfuIyPXle2Mq
 A/0n4zGl6xlZSmIjPjNiG/GnQun8n3/hWeuG2jstnGo0+SyiNqNiE8eITyqzpPHpuNAY
 EQlVBnDBgUSZcFgCV+BSnbk7NV4WRDJDRVs3BAnNykjycJ9QOBRWTMm7CL3ntrK/CMLs
 q2uA==
X-Gm-Message-State: AFqh2koAoay7qho2+7M+Dc4AA8JPS7oJe/J7GZCjP7SM3ukieg0Evgdq
 G4OpbitSY3R2g78ws//GKLT8C0lUvdU8IdgFozk=
X-Google-Smtp-Source: AMrXdXvKsx7afIiyOlQM/fAlfuwc8EKU3ooyXeRscS6LI85K3vl1IjQhM0xPm1vjdu9B/ewqKGwhz9dluWLXaAle0e8=
X-Received: by 2002:ab0:784f:0:b0:4e5:ad78:8523 with SMTP id
 y15-20020ab0784f000000b004e5ad788523mr2027966uaq.50.1672488097970; Sat, 31
 Dec 2022 04:01:37 -0800 (PST)
MIME-Version: 1.0
References: <Y66Hk6waTeXQDz1/@sol.localdomain>
 <20221230071551.61833-1-frank.li@vivo.com>
In-Reply-To: <20221230071551.61833-1-frank.li@vivo.com>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Sat, 31 Dec 2022 20:01:27 +0800
Message-ID: <CAAJw_Zs7W5yToJ0L0eB55Ch30k-E1+L_B9YHHv9LTCVhHM7LCQ@mail.gmail.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 30, 2022 at 3:16 PM Yangtao Li wrote: > > > What
 happened to the f2fs developers? No response from anyone yet. Am > > I the
 only one facing this? Linux-6.2 is unusable until this is fixe [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jeff.chua.linux[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.45 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.45 listed in list.dnswl.org]
X-Headers-End: 1pBaYZ-000Q9r-SQ
Subject: Re: [f2fs-dev] Fwd: f2fs write error Linux v6.2
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
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 regressions@leemhuis.info, bagasdotme@gmail.com, jaegeuk@kernel.org,
 torvalds@linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBEZWMgMzAsIDIwMjIgYXQgMzoxNiBQTSBZYW5ndGFvIExpIDxmcmFuay5saUB2aXZv
LmNvbT4gd3JvdGU6Cj4KPiA+IFdoYXQgaGFwcGVuZWQgdG8gdGhlIGYyZnMgZGV2ZWxvcGVycz8g
Tm8gcmVzcG9uc2UgZnJvbSBhbnlvbmUgeWV0LiBBbQo+ID4gSSB0aGUgb25seSBvbmUgZmFjaW5n
IHRoaXM/IExpbnV4LTYuMiBpcyB1bnVzYWJsZSB1bnRpbCB0aGlzIGlzIGZpeGVkLgo+ID4gV2hh
dCBjYW4gSSBkbyB0byBoZWxwPwo+Cj4gSXQncyBiZWVuIGEgbG9uZyB0aW1lIHNpbmNlIEkgc2F3
IEtpbSBhbmQgQ2hhbyByZXNwb25kIHRvIG1lc3NhZ2VzLiBJIHRoaW5rCj4gaXQgbWF5IGJlIGJl
Y2F1c2Ugb2YgdGhlIGhvbGlkYXkgaW4gdGhlIFVT77yMYW5kIENoaW5hIGxvb3NlbmVkIHJlc3Ry
aWN0aW9ucwo+IG9uIENPVklELTE5IChsb3RzIG9mIHBlb3BsZSBnb3Qgc2ljaywgSSBqdXN0IHJl
Y292ZXJlZCB0b2RheSkuCj4KPiBCVFcsIHRoZSBsb2cgeW91IHVwbG9hZGVkIGNvcnJlc3BvbmRz
IHRvIHdoaWNoIGtlcm5lbCBnaXQgaXMsIGFuZCB3aGljaAo+IGNvbW1pdCBpdCBjb3JyZXNwb25k
cyB0by4KClVzaW5nIHRoZSBsYXRlc3QgZ2l0IHB1bGwgLi4uCgpjb21taXQgYzg0NTFjMTQxZTA3
YThkMDU2OTNmNmM4ZDBlNDE4ZmJiNGI2OGJiNyAoSEVBRCAtPiBtYXN0ZXIsCm9yaWdpbi9tYXN0
ZXIsIG9yaWdpbi9IRUFEKQpNZXJnZTogMjYyZWVmMjZlMzUwIDA5NDhhOWVmMWQ1OQpBdXRob3I6
IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KRGF0ZTogICBG
cmkgRGVjIDMwIDEwOjQ3OjI1IDIwMjIgLTA4MDAKCgpJIGp1c3QgYXBwbGllZCBDaGFvIFl1J3Mg
cGF0Y2ggYW5kIGl0IHNlZW1zIHRvIGhvbGQgLi4KClRoYW5rIHlvdSEgSGFwcHkgTmV3IFllYXIh
CgpKZWZmCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
