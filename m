Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D61ACDC50
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jun 2025 13:09:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AUfiJOR68Zf64o5+An5MjtIns1zcsyFtrjOzU7UUzA=; b=cPktBiJgfU32oAMqCmcFVdbcFg
	EmSzr1qUzf7+dQc8I2lB9NypJYbm4v01fVc5AIwlMI25v3jU5WcUdqjjKJaKiLUUmIyJvfmtQOpFa
	iTVpYSO5FgnSjJgzkVW8rkVeJtT6Vk13Ay3718qHwJTtw5KXlYtx+/cbWnQm6H7eFhMg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMlzu-000536-A8;
	Wed, 04 Jun 2025 11:09:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uMlzs-00052y-IA
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 11:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pJlW+/IPrrf9OIpDSajorS+ZHLicKTjCWx791JZHvxU=; b=mgh1hpiaAkVTTQ6dvt5Lhxg14U
 jsq9bEKC6NVJOsVT/fFsWGXcFykQKjqajRjuZk2pIHj0TXUFFEDWHk8dohyV9fW4ei75ItVDY4gI8
 GUjt16fg0mub3l3ZK2bUaM3nBTtHJ+OGOe3T3xIX4WwkpFd7BN+71HBROuRMqa2WllZU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pJlW+/IPrrf9OIpDSajorS+ZHLicKTjCWx791JZHvxU=; b=W+eGsXIc5RfVpqXemwisqE2RYP
 R3U26EuP2aR9gDlYs9nVzaATLvyHVex+WGkxUv5UbGcTm1MFaEYtFgj5lhcN34mgoagANJT7kLT/P
 bvoEA8DvWTVZ3G9K/MOO4w++RkMyZ9LjnEiDXc+Phnejm28HfReI7FpygJOKwsfOZPrQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uMlzr-0005bH-Mt for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 11:09:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 79DAB5C4210;
 Wed,  4 Jun 2025 11:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE364C4CEE7;
 Wed,  4 Jun 2025 11:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749035362;
 bh=bxbzNNKPCagVAfsznDam2r9jaVbG7yC74u5DW2QcVFI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=d76ficgWdxxqPKuMtBDUFhRi8MS/oyNrEUGQ34Bkafomm8+7djXA8UCvTJ2LHbod1
 HIHzw2gV3/ck5nB472azG8/WGH6w4mn79IyRymk/W5YmOFWamKZLp1fihjvA1KTXYH
 WcwnjFrboIPtRrVJZ7TM5RRQAwDSQESgOhL82Xgkp3gRQ/ZETm4AIL+Orxhd/TPK2F
 l92pT2D7pErPMJ/itTOsIFInlaaE8dGa3oB8Tp/9jaOuFhyE+PovEuQfmC4SJ6DXGe
 s1q86KCXJgqMQ8lmbQA6muM8AkU6fcXJdnlpzJuayDFjY5MX/7wz84TETngsmLCoAW
 c/Kwmu4MeUTBg==
Message-ID: <1791cead-c598-41dc-8c6c-811787df14b7@kernel.org>
Date: Wed, 4 Jun 2025 19:09:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1749016492-31835-1-git-send-email-zhiguo.niu@unisoc.com>
 <061c94ab-ff57-42e3-ad7c-592dfb2a822e@kernel.org>
 <CAHJ8P3J4Q-0ckCuZhV-r_O_Hct4yqqtC0uboLjxZP1bnfBJOEg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3J4Q-0ckCuZhV-r_O_Hct4yqqtC0uboLjxZP1bnfBJOEg@mail.gmail.com>
X-Headers-End: 1uMlzr-0005bH-Mt
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix UAF of f2fs_inode_info
 in f2fs_free_dic
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, baocong.liu@unisoc.com, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNi80LzI1IDE4OjQ5LCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgPGNoYW9Aa2VybmVs
Lm9yZz4g5LqOMjAyNeW5tDbmnIg05pel5ZGo5LiJIDE3OjQ45YaZ6YGT77yaCj4+Cj4+IE9uIDYv
NC8yNSAxMzo1NCwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+IFRoZSBkZWNvbXByZXNzX2lvX2N0eCBt
YXkgYmUgcmVsZWFzZWQgYXN5bmNocm9ub3VzbHkgYWZ0ZXIKPj4+IEkvTyBjb21wbGV0aW9uLiBJ
ZiB0aGlzIGZpbGUgaXMgZGVsZXRlZCBpbW1lZGlhdGVseSBhZnRlciByZWFkLAo+Pj4gYW5kIHRo
ZSBrd29ya2VyIG9mIHByb2Nlc3NpbmcgcG9zdF9yZWFkX3dxIGhhcyBub3QgYmVlbiBleGVjdXRl
ZCB5ZXQKPj4+IGR1ZSB0byBoaWdoIHdvcmtsb2FkcywgSXQgaXMgcG9zc2libGUgdGhhdCB0aGUg
aW5vZGUoZjJmc19pbm9kZV9pbmZvKQo+Pj4gaXMgZXZpY3RlZCBhbmQgZnJlZWQgYmVmb3JlIGl0
IGlzIHVzZWQgZjJmc19mcmVlX2RpYy4KPj4+Cj4+PiAgICAgVGhlIFVBRiBjYXNlIGFzIGJlbG93
Ogo+Pj4gICAgIFRocmVhZCBBICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBU
aHJlYWQgQgo+Pj4gICAgIC0gZjJmc19kZWNvbXByZXNzX2VuZF9pbwo+Pj4gICAgICAtIGYyZnNf
cHV0X2RpYwo+Pj4gICAgICAgLSBxdWV1ZV93b3JrCj4+PiAgICAgICAgIGFkZCBmcmVlX2RpYyB3
b3JrIHRvIHBvc3RfcmVhZF93cQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLSBkb191bmxpbmsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGlwdXQKPj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBldmljdAo+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBjYWxsX3JjdQo+
Pj4gICAgIFRoaXMgZmlsZSBpcyBkZWxldGVkIGFmdGVyIHJlYWQuCj4+Pgo+Pj4gICAgIFRocmVh
ZCBDICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3dvcmtlciB0byBwcm9jZXNzIHBv
c3RfcmVhZF93cQo+Pj4gICAgIC0gcmN1X2RvX2JhdGNoCj4+PiAgICAgIC0gZjJmc19mcmVlX2lu
b2RlCj4+PiAgICAgICAtIGttZW1fY2FjaGVfZnJlZQo+Pj4gICAgICBpbm9kZSBpcyBmcmVlZCBi
eSByY3UKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0g
cHJvY2Vzc19zY2hlZHVsZWRfd29ya3MKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtIGYyZnNfbGF0ZV9mcmVlX2RpYwo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfZnJlZV9kaWMKPj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZjJmc19yZWxlYXNl
X2RlY29tcF9tZW0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVh
ZCAoZGljLT5pbm9kZSktPmlfY29tcHJlc3NfYWxnb3JpdGhtCj4+Pgo+Pj4gVGhpcyBwYXRjaCBp
bmNyZWFzZSBpbm9kZS0+aV9jb3VudCBiZWZvcmUgZjJmc19mcmVlX2RpYyBhbmQgZGVjcmVhc2Ug
aXQKPj4+IGFmdGVyIGZyZWUgdGhlIGRpYy4KPj4+Cj4+PiBDYzogRGFlaG8gSmVvbmcgPGRhZWhv
amVvbmdAZ29vZ2xlLmNvbT4KPj4+IEZpeGVzOiBiZmYxMzliNDlkOWYgKCJmMmZzOiBoYW5kbGUg
ZGVjb21wcmVzcyBvbmx5IHBvc3QgcHJvY2Vzc2luZyBpbiBzb2Z0aXJxIikKPj4+IFNpZ25lZC1v
ZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPj4+IFNpZ25lZC1vZmYt
Ynk6IEJhb2NvbmcgTGl1IDxiYW9jb25nLmxpdUB1bmlzb2MuY29tPgo+Pj4gLS0tCj4+PiAgZnMv
ZjJmcy9jb21wcmVzcy5jIHwgMTkgKysrKysrKysrKysrKystLS0tLQo+Pj4gIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZzL2NvbXByZXNzLmMKPj4+IGluZGV4IGIzYzFk
ZjkuLjZiM2IzYTcgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2NvbXByZXNzLmMKPj4+ICsrKyBi
L2ZzL2YyZnMvY29tcHJlc3MuYwo+Pj4gQEAgLTE2ODcsNyArMTY4Nyw3IEBAIHN0YXRpYyB2b2lk
IGYyZnNfcmVsZWFzZV9kZWNvbXBfbWVtKHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZGljLAo+
Pj4gIH0KPj4+Cj4+PiAgc3RhdGljIHZvaWQgZjJmc19mcmVlX2RpYyhzdHJ1Y3QgZGVjb21wcmVz
c19pb19jdHggKmRpYywKPj4+IC0gICAgICAgICAgICAgYm9vbCBieXBhc3NfZGVzdHJveV9jYWxs
YmFjayk7Cj4+PiArICAgICAgICAgICAgIGJvb2wgYnlwYXNzX2Rlc3Ryb3lfY2FsbGJhY2ssIGJv
b2wgbGF0ZV9mcmVlKTsKPj4+Cj4+PiAgc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpmMmZzX2Fs
bG9jX2RpYyhzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYykKPj4+ICB7Cj4+PiBAQCAtMTc0MywxMiAr
MTc0MywxMiBAQCBzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmYyZnNfYWxsb2NfZGljKHN0cnVj
dCBjb21wcmVzc19jdHggKmNjKQo+Pj4gICAgICAgcmV0dXJuIGRpYzsKPj4+Cj4+PiAgb3V0X2Zy
ZWU6Cj4+PiAtICAgICBmMmZzX2ZyZWVfZGljKGRpYywgdHJ1ZSk7Cj4+PiArICAgICBmMmZzX2Zy
ZWVfZGljKGRpYywgdHJ1ZSwgZmFsc2UpOwo+Pj4gICAgICAgcmV0dXJuIEVSUl9QVFIocmV0KTsK
Pj4+ICB9Cj4+Pgo+Pj4gIHN0YXRpYyB2b2lkIGYyZnNfZnJlZV9kaWMoc3RydWN0IGRlY29tcHJl
c3NfaW9fY3R4ICpkaWMsCj4+PiAtICAgICAgICAgICAgIGJvb2wgYnlwYXNzX2Rlc3Ryb3lfY2Fs
bGJhY2spCj4+PiArICAgICAgICAgICAgIGJvb2wgYnlwYXNzX2Rlc3Ryb3lfY2FsbGJhY2ssIGJv
b2wgbGF0ZV9mcmVlKQo+Pj4gIHsKPj4+ICAgICAgIGludCBpOwo+Pj4KPj4+IEBAIC0xNzc1LDYg
KzE3NzUsMTEgQEAgc3RhdGljIHZvaWQgZjJmc19mcmVlX2RpYyhzdHJ1Y3QgZGVjb21wcmVzc19p
b19jdHggKmRpYywKPj4+ICAgICAgIH0KPj4+Cj4+PiAgICAgICBwYWdlX2FycmF5X2ZyZWUoZGlj
LT5pbm9kZSwgZGljLT5ycGFnZXMsIGRpYy0+bnJfcnBhZ2VzKTsKPj4+ICsgICAgIGlmIChsYXRl
X2ZyZWUpIHsKPj4+ICsgICAgICAgICAgICAgc3Bpbl9sb2NrKCZkaWMtPmlub2RlLT5pX2xvY2sp
Owo+Pj4gKyAgICAgICAgICAgICBhdG9taWNfZGVjKCZkaWMtPmlub2RlLT5pX2NvdW50KTsKPj4+
ICsgICAgICAgICAgICAgc3Bpbl91bmxvY2soJmRpYy0+aW5vZGUtPmlfbG9jayk7Cj4+Cj4+IElm
IGl0IGlzIHRoZSBsYXN0IG9uZSByZWxlYXNlIGlfY291bnQsIGl0IG5lZWRzIHRvIGNhbGwgaXB1
dF9maW5hbCB0byBldmljdCBpbm9kZQo+PiBsaWtlIHdoYXQgaXB1dCBkaWQsIHNvIHdlJ2QgYmV0
dGVyIHRvIGNhbGwgaXB1dCgpIGhlcmU/Cj4gSGkgQ2hhbywKPiBZZXMsIHdlIGhhdmUgYWxzbyB0
ZXN0ZWQgdGhpcyBtZXRob2QoaXB1dC9fX2lnZXQpLCBhbmQgaXQgd29ya2VkLgo+IEp1c3QgdGhp
bmsgSXQgaXMgc2ltcGxlciBhbmQgZWFzaWVyIHRvIHJlYWQgdG8gZGlyZWN0bHkgb3BlcmF0ZQo+
IGlfY291bnQsIGFuZCB0aGVuIGZyZWUgaXQKPiBieSByZWx5aW5nIG9uIHRoZSBtZW1vcnkgbW9k
dWxlIHdoZW4gaV9jb3VudD0wLgo+IEJ1dCBJdCBzZWVtcyBpcHV0L19faWdldCBpcyBiZXR0ZXIu
Cj4+Cj4+PiArICAgICB9Cj4+PiAgICAgICBrbWVtX2NhY2hlX2ZyZWUoZGljX2VudHJ5X3NsYWIs
IGRpYyk7Cj4+PiAgfQo+Pj4KPj4+IEBAIC0xNzgzLDE2ICsxNzg4LDIwIEBAIHN0YXRpYyB2b2lk
IGYyZnNfbGF0ZV9mcmVlX2RpYyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4+PiAgICAgICBz
dHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYyA9Cj4+PiAgICAgICAgICAgICAgIGNvbnRhaW5l
cl9vZih3b3JrLCBzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHgsIGZyZWVfd29yayk7Cj4+Pgo+Pj4g
LSAgICAgZjJmc19mcmVlX2RpYyhkaWMsIGZhbHNlKTsKPj4+ICsgICAgIGYyZnNfZnJlZV9kaWMo
ZGljLCBmYWxzZSwgdHJ1ZSk7Cj4+PiAgfQo+Pj4KPj4+ICBzdGF0aWMgdm9pZCBmMmZzX3B1dF9k
aWMoc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMsIGJvb2wgaW5fdGFzaykKPj4+ICB7Cj4+
PiAgICAgICBpZiAocmVmY291bnRfZGVjX2FuZF90ZXN0KCZkaWMtPnJlZmNudCkpIHsKPj4+ICAg
ICAgICAgICAgICAgaWYgKGluX3Rhc2spIHsKPj4+IC0gICAgICAgICAgICAgICAgICAgICBmMmZz
X2ZyZWVfZGljKGRpYywgZmFsc2UpOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGYyZnNfZnJl
ZV9kaWMoZGljLCBmYWxzZSwgZmFsc2UpOwo+Pj4gICAgICAgICAgICAgICB9IGVsc2Ugewo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgIElOSVRfV09SSygmZGljLT5mcmVlX3dvcmssIGYyZnNfbGF0
ZV9mcmVlX2RpYyk7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgLyogdG8gYXZvaWQgaW5vZGUg
aXMgZXZpY3RlZCBzaW11bHRhbmVvdXNseSAqLwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHNw
aW5fbG9jaygmZGljLT5pbm9kZS0+aV9sb2NrKTsKPj4+ICsgICAgICAgICAgICAgICAgICAgICBh
dG9taWNfaW5jKCZkaWMtPmlub2RlLT5pX2NvdW50KTsKPj4+ICsgICAgICAgICAgICAgICAgICAg
ICBzcGluX3VubG9jaygmZGljLT5pbm9kZS0+aV9sb2NrKTsKPj4KPj4gaWdldCgpPwo+Pgo+PiBC
VFcsIGNhbiB3ZSBzdG9yZSBpX2NvbXByZXNzX2FsZ29yaXRobSBpbiBkaWMgdG8gYXZvaWQgaW5v
ZGUgYWNjZXNzPwo+IAo+IEFsc28gdGhvdWdodCBvZiB0aGlzIG1ldGhvZCwgYnV0IGl0IHdvdWxk
IHJlcXVpcmUgbW9yZSBjaGFuZ2VzLgo+IGRpYy0+aW5vZGUgdXNlZCBpbiBmMmZzX2ZyZWVfZGlj
IGFyZSBhbGwgbmVlZGVkIHRvIG1vZGlmeSBleGNlcHQKPiBpX2NvbXByZXNzX2FsZ29yaXRobS4K
PiBzdWNoIGFzICBwYWdlX2FycmF5X2ZyZWUoZGljLT5pbm9kZSksCgpaaGlndW8sCgpwYWdlX2Fy
cmF5X2ZyZWUoKSBwYXJzZXMgZGljLT5pbm9kZSB0byBnZXQgc2JpIG9ubHksIHNvIHdlIGNhbiBw
YXNzIHNiaSB0bwpwYWdlX2FycmF5X2ZyZWUoKSBkaXJlY3RseSB0byBhdm9pZCB1c2luZyBkaWMt
Pmlub2RlLgoKPiBhbGxvd19tZW1hbGxvY19mb3JfZGVjb21wKEYyRlNfSV9TQihkaWMtPmlub2Rl
KSkuCj4gCj4gRG8geW91IGhhdmUgYW55IG90aGVyIHN1Z2dlc3Rpb25zPwoKVXNpbmcgaWdldC9p
cHV0IGxvb2tzIGZpbmUgdG8gbWUsIHBsZWFzZSBnbyBhaGVhZC4KClRoYW5rcywKCj4gdGhhbmtz
77yBCj4gCj4+Cj4+IFRoYW5rcywKPj4KPj4+ICAgICAgICAgICAgICAgICAgICAgICBxdWV1ZV93
b3JrKEYyRlNfSV9TQihkaWMtPmlub2RlKS0+cG9zdF9yZWFkX3dxLAo+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmZGljLT5mcmVlX3dvcmspOwo+Pj4gICAgICAgICAg
ICAgICB9Cj4+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
