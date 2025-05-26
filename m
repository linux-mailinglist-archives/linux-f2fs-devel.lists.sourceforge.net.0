Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0258AAC3B0E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 May 2025 10:03:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCugz08AmPwsVo73r6EzHpIjUd3Rx6Bj4eamfizCam4=; b=RFYPEemM/2JPYJbnGTo7R+YEkd
	ifzFwxdenwYwmEXhm3r9B8TH9Rm6TWL23R8yEqRYjBZfZMOso05Nsa4pqgrlO48khPZZ2vVbc5f1Y
	1VLJi7gnAoPR6UUx2c2bMsl4qt6/fCDAlqJPLy6EkFXLrydWd/04wLXbzplegQB3f0WQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uJSns-0000um-Sz;
	Mon, 26 May 2025 08:03:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uJSnr-0000ug-Ks
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 May 2025 08:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nrzliQ0wzkOvPiTiCfOYuzFAbdaZPSp3Kj99D8gNC1A=; b=WQRa5QELDzPpf25vMIcx5tDHQH
 Nr8/2tAh1Bh7TA9wEQWJ9V+acWLyDvJOIXrfZMqlb6xGQAwbTcloEohPI6l69ms6tKOMN/haPiJPi
 nGcYiXEPtpWLq1kzYm/3I4l4pxSAbUo0BplsSHp6u+rAgxc3ivtomP3cKMFi7HzOlag0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nrzliQ0wzkOvPiTiCfOYuzFAbdaZPSp3Kj99D8gNC1A=; b=mbdXTg+Gv5bP3sN/sogxTZ8Bs7
 wdXFQts0W9zP2X5CAMXJmiSqjjmOyrLK2eNYs10+zdHljEShk9+1jhXUZto3JSVOpOpR7iPa8IX+g
 HgoWUNUrhnDwSGe5Cp4H9pwpF/thfLt9bRqwIo/MkBw0nNgAnrgwFe1ARgg/OgZfRQME=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uJSnM-0002Kc-Vj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 May 2025 08:03:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8C65F5C5704;
 Mon, 26 May 2025 08:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363EDC4CEE7;
 Mon, 26 May 2025 08:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748246562;
 bh=AQphoJ265lGo7sNOh0YNwRvk4m7dRYdocE5/tdcaqx8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=kEsnCnHtBgqvyIcLVu7cvG+2W0NexKvLYLK7U2Ge9d3i5dpCdyPinFXz4Yu9+vxwM
 p4MHnxECewPxMq5rwD4M7XTldVY81+FiDx7T2aZqq18tjaWDcbONnysqvlVUfKRwZx
 sIC5s+p8K29G2aK76ra7CEDr3gN1kuTBXISwsxuPHOu4+WKRYuqb3eVwCAnmRSDRZJ
 W0jjOe+a/874Hz5NtctPW+wty2LvN5+LvcCgMp8LbrTW7dOpkllrrc9izeihBrRvXB
 o4Kr3bfsSPG03xf2MjMPeBu0jZL1SmSWLSS/TsELS44OHr19M3e6ix2E8jhF5gpGoJ
 If7Z/witJ5osQ==
Message-ID: <10dde2aa-f2f3-4553-9fc0-a0659e0c5543@kernel.org>
Date: Mon, 26 May 2025 16:02:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20250522182644.2176645-1-daeho43@gmail.com>
 <52eee781-f53c-46a9-8ce4-96c5a0589240@kernel.org>
 <CACOAw_xCQpmiRRuhjpGbB4mKzonE24Uyg=jtrxge-hFZrn5dXg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_xCQpmiRRuhjpGbB4mKzonE24Uyg=jtrxge-hFZrn5dXg@mail.gmail.com>
X-Headers-End: 1uJSnM-0002Kc-Vj
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: ensure zone size is equal or
 bigger than segment size
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNS8yNC8yNSAwMDo0MCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gT24gVGh1LCBNYXkgMjIsIDIw
MjUgYXQgNzowNuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9u
IDUvMjMvMjUgMDI6MjYsIERhZWhvIEplb25nIHdyb3RlOgo+Pj4gRnJvbTogRGFlaG8gSmVvbmcg
PGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Cj4+PiBPdGhlcndpc2UsIGl0IGRvZXNuJ3Qgd29y
ayB3aXRoIGEgY3Jhc2guCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhv
amVvbmdAZ29vZ2xlLmNvbT4KPj4+IC0tLQo+Pj4gdjI6IHJlbG9jYXRlIHRoZSBjb2RlCj4+PiAt
LS0KPj4+ICBsaWIvbGliZjJmcy5jIHwgNSArKysrKwo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvbGliL2xpYmYyZnMuYyBiL2xpYi9saWJm
MmZzLmMKPj4+IGluZGV4IGQyNTc5ZDcuLjE0OGRjMTIgMTAwNjQ0Cj4+PiAtLS0gYS9saWIvbGli
ZjJmcy5jCj4+PiArKysgYi9saWIvbGliZjJmcy5jCj4+PiBAQCAtMTM0Nyw2ICsxMzQ3LDExIEBA
IGludCBmMmZzX2dldF9mMmZzX2luZm8odm9pZCkKPj4+ICAgICAgICAgICAgICAgICAgICAgICB9
Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgYy56b25lX2Jsb2NrcyA9IGMuZGV2aWNlc1tpXS56
b25lX2Jsb2NrczsKPj4+ICAgICAgICAgICAgICAgfQo+Pj4gKyAgICAgICAgICAgICBpZiAoYy56
b25lX2Jsb2NrcyA8IERFRkFVTFRfQkxPQ0tTX1BFUl9TRUdNRU5UKSB7Cj4+Cj4+IElmIGMuem9u
ZV9ibG9ja3MgY2FuIG5vdCBiZSBhbGlnbmVkIHRvIERFRkFVTFRfQkxPQ0tTX1BFUl9TRUdNRU5U
LCBkbyB3ZSBuZWVkIHRvCj4+IGhhbmRsZSBiZWxvdyBjb2RlPwo+IAo+IFdlIG5lZWQgdG8gbWFr
ZSBzdXJlIHRoYXQgYy56b25lX2Jsb2NrcyBpcyBhIG11bHRpcGxlIG9mCj4gREVGQVVMVF9CTE9D
S1NfUEVSX1NFR01FTlQsIHJpZ2h0PwoKWWVzLCBpZiBjLnpvbmVfYmxvY2tzICUgREVGQVVMVF9C
TE9DS1NfUEVSX1NFR01FTlQgaXMgdHJ1ZSwgd2Ugc2hvdWxkIGZhaWwgbWtmcz8KClRoYW5rcywK
Cj4gCj4+Cj4+ICAgICAgICAgICAgICAgICAvKgo+PiAgICAgICAgICAgICAgICAgICogQWxpZ24g
c2VjdGlvbnMgdG8gdGhlIGRldmljZSB6b25lIHNpemUgYW5kIGFsaWduIEYyRlMgem9uZXMKPj4g
ICAgICAgICAgICAgICAgICAqIHRvIHRoZSBkZXZpY2Ugem9uZXMuIEZvciBGMkZTX1pPTkVEX0hB
IG1vZGVsIHdpdGhvdXQgdGhlCj4+ICAgICAgICAgICAgICAgICAgKiBCTEtaT05FRCBmZWF0dXJl
IHNldCBhdCBmb3JtYXQgdGltZSwgdGhpcyBpcyBvbmx5IGFuCj4+ICAgICAgICAgICAgICAgICAg
KiBvcHRpbWl6YXRpb24gYXMgc2VxdWVudGlhbCB3cml0ZXMgd2lsbCBub3QgYmUgZW5mb3JjZWQu
Cj4+ICAgICAgICAgICAgICAgICAgKi8KPj4gICAgICAgICAgICAgICAgIGMuc2Vnc19wZXJfc2Vj
ID0gYy56b25lX2Jsb2NrcyAvIERFRkFVTFRfQkxPQ0tTX1BFUl9TRUdNRU5UOwo+Pgo+PiBUaGFu
a3MsCj4+Cj4+PiArICAgICAgICAgICAgICAgICAgICAgTVNHKDAsICJcdEVycm9yOiB6b25lIHNp
emUgc2hvdWxkIG5vdCBiZSBsZXNzICIKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJ0aGFuIHNlZ21lbnQgc2l6ZVxuIik7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IC0xOwo+Pj4gKyAgICAgICAgICAgICB9Cj4+Pgo+Pj4gICAgICAgICAgICAgICAvKgo+Pj4gICAg
ICAgICAgICAgICAgKiBBbGlnbiBzZWN0aW9ucyB0byB0aGUgZGV2aWNlIHpvbmUgc2l6ZSBhbmQg
YWxpZ24gRjJGUyB6b25lcwo+PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
