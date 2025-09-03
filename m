Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C30C8B411F6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Sep 2025 03:33:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeoTjpJt6BBb4wS6mVG+pHpzaTY+aCBwcfCiTxdkL3A=; b=muPF1Ho726vR8WPdjf1mjVBNcN
	ycxmOK617YWS4EYj1AaMb6VX6n+ivPvOCJ8kzCFv00zoqYP4LTVLSNbBpH5IoVh+27d/vKIEdsi1K
	O3Y0V514mbobdLa7FOPgs0K68GumDGt/sv0IcE6NYxMHTDSm55iR1wLesgD0OJPwTQwI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1utcNM-0001Y0-VI;
	Wed, 03 Sep 2025 01:33:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1utcNM-0001Xu-6s
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Sep 2025 01:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n9r6y6q2yH8GAmsBbh4synGnkdTakGTIbXqI1o2dBc4=; b=j5vt0GTiqET0eyoykv9DxNmo8y
 Y40Xm5hUe0CfLg22CD97I3iRVLyFcNRd0ZEWDu4Xj3WxBjW+2yBXC8HCKMso1TGhsAb+WKbenOVds
 SZ7DDehCGPwTeiyfiaeTqMWOWokmQQKoUYNiU92QikJGvWm6D3MbzLZ9d9MI4YjghSEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n9r6y6q2yH8GAmsBbh4synGnkdTakGTIbXqI1o2dBc4=; b=PML1kbrpg1R5ikHEvSItG4dGCg
 w2n0Eajn9Yfi8kb7HZLYgTZ+prCpOwZ3evl3JMfOHVpp4JBJ+Ghy/h8N71/VCvuk6m2eZ84/pNvQc
 UZusy/VCnH6go+46/FbVxU7MCXnWgm5rB8xlQ/1k1pY/FOHZZjMup0eMHN0SZ5vWV1Xw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1utcNL-0005wK-Lm for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Sep 2025 01:33:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3366544043;
 Wed,  3 Sep 2025 01:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BE8C4CEED;
 Wed,  3 Sep 2025 01:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756863202;
 bh=b37So3j2iYeAd1OR2qYhYUiZfHzafcrukdWRQBjhpms=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=T6Erysx2EfgdNWpSAjSuRn+ri//0/IeUcbCaBHwDDedaSLOZImkBPn7I5yLWs5hiK
 +gf4Y/XTXUq2rP52Jz9F4kcFp3v3m5DueB00JlOs4vz535r0j8+ww3tFxrP4dxR2hh
 uuKdxg8wIziTBeIccsWHV5RP5kPAwfXQeuzHBWyK04zjvcHXIz8x6QftaQKZplYxDA
 jz0s29WIuYg85XwC5l6rdBqW6s+3sJkb/FEhJWzotjhDh1PZbT0cnDvilMcOgX+YUT
 6i98BhqTsfC0NOIrwN4F22keIoU0NC0oif4pFp2Pni20Av1RyRHKeBFgaclO03NEfh
 RaokkT3WceZKg==
Message-ID: <e44dc335-dfe1-45ba-8bac-9c5f7a5f24d7@kernel.org>
Date: Wed, 3 Sep 2025 09:33:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20250901020416.2172182-1-chao@kernel.org>
 <CAHJ8P3+NJfE+F-Tsbw4Rz6PyT9o2F74kyrJncLqyQv+YeOSvgA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3+NJfE+F-Tsbw4Rz6PyT9o2F74kyrJncLqyQv+YeOSvgA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 9/3/25 08:04, Zhiguo Niu wrote: > Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > 于2025年9月1日周一 10:08写道：
    >> >> It reports a bug from device w/ zufs: >> >> F [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1utcNL-0005wK-Lm
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid migrating empty section
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOS8zLzI1IDA4OjA0LCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgdmlhIExpbnV4LWYy
ZnMtZGV2ZWwgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Pgo+IOS6jjIw
MjXlubQ55pyIMeaXpeWRqOS4gCAxMDowOOWGmemBk++8mgo+Pgo+PiBJdCByZXBvcnRzIGEgYnVn
IGZyb20gZGV2aWNlIHcvIHp1ZnM6Cj4+Cj4+IEYyRlMtZnMgKGRtLTY0KTogSW5jb25zaXN0ZW50
IHNlZ21lbnQgKDE3MzgyMikgdHlwZSBbMSwgMF0gaW4gU1NBIGFuZCBTSVQKPj4gRjJGUy1mcyAo
ZG0tNjQpOiBTdG9wcGVkIGZpbGVzeXN0ZW0gZHVlIHRvIHJlYXNvbjogNAo+Pgo+PiBUaHJlYWQg
QSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVGhyZWFkIEIKPj4gLSBmMmZzX2V4cGFu
ZF9pbm9kZV9kYXRhCj4+ICAtIGYyZnNfYWxsb2NhdGVfcGlubmluZ19zZWN0aW9uCj4+ICAgLSBm
MmZzX2djX3JhbmdlCj4+ICAgIC0gZG9fZ2FyYmFnZV9jb2xsZWN0IHcvIHNlZ25vICN4Cj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIHdyaXRlcGFnZQo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZjJmc19hbGxvY2F0ZV9kYXRh
X2Jsb2NrCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gbmV3
X2N1cnNlZwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBh
bGxvY2F0ZSBzZWdubyAjeAo+Pgo+PiBUaGUgcm9vdCBjYXVzZSBpczogZmFsbG9jYXRlIG9uIHBp
bm5pbmcgZmlsZSBtYXkgcmFjZSB3LyBibG9jayBhbGxvY2F0aW9uCj4+IGFzIGFib3ZlLCByZXN1
bHQgaW4gZG9fZ2FyYmFnZV9jb2xsZWN0KCkgZnJvbSBmYWxsb2NhdGUoKSBtYXkgbWlncmF0ZQo+
PiBzZWdtZW50IHdoaWNoIGlzIGp1c3QgYWxsb2NhdGVkIGJ5IGEgbG9nLCB0aGUgbG9nIHdpbGwg
dXBkYXRlIHNlZ21lbnQgdHlwZQo+PiBpbiBpdHMgaW4tbWVtb3J5IHN0cnVjdHVyZSwgaG93ZXZl
ciBHQyB3aWxsIGdldCBzZWdtZW50IHR5cGUgZnJvbSBvbi1kaXNrCj4+IFNTQSBibG9jaywgb25j
ZSBzZWdtZW50IHR5cGUgY2hhbmdlcyBieSBsb2csIHdlIGNhbiBkZXRlY3Qgc3VjaAo+PiBpbmNv
bnNpc3RlbmN5LCB0aGVuIHNodXRkb3duIGZpbGVzeXN0ZW0uCj4+Cj4+IEluIHRoaXMgY2FzZSwg
b24tZGlzayBTU0Egc2hvd3MgdHlwZSBvZiBzZWdubyAjMTczODIyIGlzIDEgKFNVTV9UWVBFX05P
REUpLAo+PiBob3dldmVyIHNlZ25vICMxNzM4MjIgd2FzIGp1c3QgYWxsb2NhdGVkIGFzIGRhdGEg
dHlwZSBzZWdtZW50LCBzbyBpbi1tZW1vcnkKPj4gU0lUIHNob3dzIHR5cGUgb2Ygc2Vnbm8gIzE3
MzgyMiBpcyAwIChTVU1fVFlQRV9EQVRBKS4KPj4KPj4gQ2hhbmdlIGFzIGJlbG93IHRvIGZpeCB0
aGlzIGlzc3VlOgo+PiAtIGNoZWNrIHdoZXRoZXIgY3VycmVudCBzZWN0aW9uIGlzIGVtcHR5IGJl
Zm9yZSBnYwo+PiAtIGFkZCBzYW5pdHkgY2hlY2tzIG9uIGRvX2dhcmJhZ2VfY29sbGVjdCgpIHRv
IGF2b2lkIGFueSByYWNlIGNhc2UsIHJlc3VsdAo+PiBpbiBtaWdyYXRpbmcgc2VnbWVudCB1c2Vk
IGJ5IGxvZy4KPj4gLSBidHcsIGl0IGZpeGVzIG1pc2MgaXNzdWUgaW4gcHJpbnRlZCBsb2dzOiAi
U1NBIGFuZCBTSVQiIC0+ICJTSVQgYW5kIFNTQSIuCj4+Cj4+IEZpeGVzOiA5NzAzZDY5ZDlkMTUg
KCJmMmZzOiBzdXBwb3J0IGZpbGUgcGlubmluZyBmb3Igem9uZWQgZGV2aWNlcyIpCj4+IENjOiBE
YWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFv
IFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiAgZnMvZjJmcy9nYy5jIHwgMTYgKysrKysr
KysrKysrKysrLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMvZ2MuYwo+PiBp
bmRleCBlZDNhY2JmYzgzY2EuLmE3NzA4Y2Y4MGMwNCAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9n
Yy5jCj4+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+PiBAQCAtMTc5NCw2ICsxNzk0LDEzIEBAIHN0YXRp
YyBpbnQgZG9fZ2FyYmFnZV9jb2xsZWN0KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4gICAg
ICAgICAgICAgICAgIHN0cnVjdCBmb2xpbyAqc3VtX2ZvbGlvID0gZmlsZW1hcF9nZXRfZm9saW8o
TUVUQV9NQVBQSU5HKHNiaSksCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBHRVRfU1VNX0JMT0NLKHNiaSwgc2Vnbm8pKTsKPj4KPj4gKyAgICAgICAgICAgICAgIGlm
IChpc19jdXJzZWMoc2JpLCBHRVRfU0VDX0ZST01fU0VHKHNiaSwgc2Vnbm8pKSkgewo+PiArICAg
ICAgICAgICAgICAgICAgICAgICBmMmZzX2VycihzYmksICIlczogc2VnbWVudCAldSBpcyB1c2Vk
IGJ5IGxvZyIsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgX19mdW5jX18sIHNlZ25vKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ZjJmc19idWdfb24oc2JpLCAxKTsKPiBIaSBDaGFvLAo+IERvIHdlIG5lZWQgZjJmc19idWdfb24g
aGVyZT8gIG9yIGl0IGlzIGVub3VnaCB0byBza2lwIGN1cnJlbnQgc2Vnbm8KPiBhbmQgbGV0IGdj
IGNvbnRpbnVlPwoKWmhpZ3VvLAoKSSB0aGluayB3ZSBzaG91bGQgbmV2ZXIgc2VsZWN0IGluLXVz
ZSBzZWdtZW50IGFzIEdDIHZpY3RpbSwgc28gSSBhZGQgYQpmMmZzX2J1Z19vbigpIGhlcmUgdG8g
ZGV0ZWN0IGFueSBwb3RlbnRpYWwgYnVncy4gTGV0J3Mgc2VlIHdoYXQgd2lsbCB3ZQpmaW5kIHcv
IHRoaXMuCgpUaGFua3MsCgo+IFRoYW5rcyEKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290
byBza2lwOwo+PiArICAgICAgICAgICAgICAgfQo+PiArCj4+ICAgICAgICAgICAgICAgICBpZiAo
Z2V0X3ZhbGlkX2Jsb2NrcyhzYmksIHNlZ25vLCBmYWxzZSkgPT0gMCkKPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgZ290byBmcmVlZDsKPj4gICAgICAgICAgICAgICAgIGlmIChnY190eXBlID09
IEJHX0dDICYmIF9faXNfbGFyZ2Vfc2VjdGlvbihzYmkpICYmCj4+IEBAIC0xODA1LDcgKzE4MTIs
NyBAQCBzdGF0aWMgaW50IGRvX2dhcmJhZ2VfY29sbGVjdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmksCj4+Cj4+ICAgICAgICAgICAgICAgICBzdW0gPSBmb2xpb19hZGRyZXNzKHN1bV9mb2xpbyk7
Cj4+ICAgICAgICAgICAgICAgICBpZiAodHlwZSAhPSBHRVRfU1VNX1RZUEUoKCZzdW0tPmZvb3Rl
cikpKSB7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGYyZnNfZXJyKHNiaSwgIkluY29uc2lz
dGVudCBzZWdtZW50ICgldSkgdHlwZSBbJWQsICVkXSBpbiBTU0EgYW5kIFNJVCIsCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGYyZnNfZXJyKHNiaSwgIkluY29uc2lzdGVudCBzZWdtZW50ICgl
dSkgdHlwZSBbJWQsICVkXSBpbiBTSVQgYW5kIFNTQSIsCj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNlZ25vLCB0eXBlLCBHRVRfU1VNX1RZUEUoKCZzdW0tPmZvb3RlcikpKTsK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19zdG9wX2NoZWNrcG9pbnQoc2JpLCBmYWxz
ZSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVE9QX0NQX1JFQVNPTl9DT1JS
VVBURURfU1VNTUFSWSk7Cj4+IEBAIC0yMDY4LDYgKzIwNzUsMTMgQEAgaW50IGYyZnNfZ2NfcmFu
Z2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAu
aXJvb3QgPSBSQURJWF9UUkVFX0lOSVQoZ2NfbGlzdC5pcm9vdCwgR0ZQX05PRlMpLAo+PiAgICAg
ICAgICAgICAgICAgfTsKPj4KPj4gKyAgICAgICAgICAgICAgIC8qCj4+ICsgICAgICAgICAgICAg
ICAgKiBhdm9pZCBtaWdyYXRpbmcgZW1wdHkgc2VjdGlvbiwgYXMgaXQgY2FuIGJlIGFsbG9jYXRl
ZCBieQo+PiArICAgICAgICAgICAgICAgICogbG9nIGluIHBhcmFsbGVsLgo+PiArICAgICAgICAg
ICAgICAgICovCj4+ICsgICAgICAgICAgICAgICBpZiAoIWdldF92YWxpZF9ibG9ja3Moc2JpLCBz
ZWdubywgdHJ1ZSkpCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+PiArCj4+
ICAgICAgICAgICAgICAgICBpZiAoaXNfY3Vyc2VjKHNiaSwgR0VUX1NFQ19GUk9NX1NFRyhzYmks
IHNlZ25vKSkpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+Pgo+PiAtLQo+
PiAyLjQ5LjAKPj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
