Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 087BF895C0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Aug 2019 05:26:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hx0yh-00086v-UE; Mon, 12 Aug 2019 03:26:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hx0yg-00086j-HA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 03:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GUGkznQjZAwvuO4Hs9J8KX5jEQaZd1EfC7QHH2APWNc=; b=Iq5IXstPVFa5cuZlTuulI5JSi/
 FzWLXQuzOeDsF+JCSvPnWl81obnULl0Mf1xNfC9DOoOPGy0iUr8gytWPhBE2ogN2hBMWCAi+ljk6E
 KD10jgrF0v9TmXO2qPKY+HCtoewknbKLzUbks7lFJbhtEFOeII9HqOHDS1kDqvnWjPGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GUGkznQjZAwvuO4Hs9J8KX5jEQaZd1EfC7QHH2APWNc=; b=cT7+JcFt6y3/El3PHd7C4upH1I
 R3OfvpAqZrzSyZy3/DSUroUmctvSM9+/iB+3OOd0YzaHaNRq4tXvvJiR4JV+/wWDnUGupsloeUrPA
 PaHGOPzaR+6DGLyoLq+73q6K93jmd8H9O+CsyJoBUaVcUveMfau2Sr9EjFKjfGDIWgzw=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hx0ye-000J9t-9T
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 03:26:34 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4B038B98CC016F5A011F;
 Mon, 12 Aug 2019 11:26:25 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 12 Aug
 2019 11:26:21 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Ju Hyung Park <qkrwngud825@gmail.com>
References: <20190808231108.75599-1-jaegeuk@kernel.org>
 <20190809151253.GA93481@jaegeuk-macbookpro.roam.corp.google.com>
 <CAD14+f2V=j8o=0sUGMgmJHmwKgm80WyzJC5yW7qmyffL=CBJhw@mail.gmail.com>
 <20190809153911.GE93481@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7067cea7-c358-11c5-7cdc-560e107706c0@huawei.com>
Date: Mon, 12 Aug 2019 11:26:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190809153911.GE93481@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hx0ye-000J9t-9T
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: check zeros in first 16MB for
 Android
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAxOS84LzkgMjM6MzksIEphZWdldWsgS2ltIHdyb3RlOgo+IE9uIDA4LzEwLCBKdSBIeXVu
ZyBQYXJrIHdyb3RlOgo+PiBIaSBKYWVnZXVrLAo+Pgo+PiBKdXN0IG91dCBvZiBjdXJpb3NpdHks
IHdoYXQncyB0aGUgcG9pbnQgb2YgdGhpcz8KPj4KPj4gSSB0aG91Z2h0IGZsYXNoIGNoaXBzIHNr
aXAgZXJhc2luZyBibG9ja3MgaWYgaXQncyBhbHJlYWR5IGVyYXNlZCB0bwo+PiBwcmVzZXJ2ZSBQ
L0UgY3ljbGVzIGFzIG11Y2ggYXMgcG9zc2libGUuCj4+IEFsbCBBbmRyb2lkIGRldmljZXMgSSBo
YWQodmFyaW91cyB2ZXJzaW9ucyBvZiBlTU1DIGFuZCBVRlMpIHJhbiBmdWxsIHJhbmdlCj4+IGJs
b2NrLWxldmVsIGRpc2NhcmRzIHByZXR0eSBmYXN0IHRvby4KPiAKPiBVbmZvcnR1bmF0ZWx5LCBz
b21lIG9mIHRoZW0gYXJlIGdpdmluZyBsb25nIGRlbGF5cyBvbiBhIGJ1bmNoIG9mIHVubWFwIGNv
bW1hbmRzCj4gcmVzdWx0aW5nIGluIHVzZXIgamFua3kgaXNzdWUuCgpBZ3JlZWQsIHRoZSBwZXJm
b3JtYW5jZSBjb21wbGV0ZWx5IGRlcGVuZHMgb24gRlRMIGltcGxlbWVudGF0aW9uLCBzb21lIG9m
IHRoZW0KcGVyZm9ybSB2ZXJ5IGJhZC4uLgoKVGhhbmtzLAoKPiAKPj4KPj4gVGhhbmtzLgo+Pgo+
PiAyMDE564WEIDjsm5QgMTDsnbwgKO2GoCkg7Jik7KCEIDEyOjEzLCBKYWVnZXVrIEtpbSA8amFl
Z2V1a0BrZXJuZWwub3JnPuuLmOydtCDsnpHshLE6Cj4+Cj4+PiBXZSBhY3R1YWxseSBkb24ndCBu
ZWVkIHRvIGlzc3VlIHRyaW0gb24gZW50aXJlIGRpc2sgYnkgY2hlY2tpbmcgZmlyc3QKPj4+IGJs
b2NrcyBoYXZpbmcgemVyb3MuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGph
ZWdldWtAa2VybmVsLm9yZz4KPj4+IC0tLQo+Pj4gdjIgZnJvbSB2MToKPj4+ICAtIGNsZWFuIHVw
Cj4+Pgo+Pj4gIG1rZnMvZjJmc19mb3JtYXRfdXRpbHMuYyB8IDUzICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvbWtmcy9mMmZzX2Zvcm1h
dF91dGlscy5jIGIvbWtmcy9mMmZzX2Zvcm1hdF91dGlscy5jCj4+PiBpbmRleCA4YmYxMjhjLi5m
MmQ1NWFkIDEwMDY0NAo+Pj4gLS0tIGEvbWtmcy9mMmZzX2Zvcm1hdF91dGlscy5jCj4+PiArKysg
Yi9ta2ZzL2YyZnNfZm9ybWF0X3V0aWxzLmMKPj4+IEBAIC0yNSw2ICsyNSw3IEBACj4+PiAgI2lu
Y2x1ZGUgPHN0ZGlvLmg+Cj4+PiAgI2luY2x1ZGUgPHVuaXN0ZC5oPgo+Pj4gICNpbmNsdWRlIDxz
dGRsaWIuaD4KPj4+ICsjaW5jbHVkZSA8c3RkYm9vbC5oPgo+Pj4gICNpZm5kZWYgQU5EUk9JRF9X
SU5ET1dTX0hPU1QKPj4+ICAjaW5jbHVkZSA8c3lzL2lvY3RsLmg+Cj4+PiAgI2VuZGlmCj4+PiBA
QCAtMTEwLDEzICsxMTEsNjEgQEAgc3RhdGljIGludCB0cmltX2RldmljZShpbnQgaSkKPj4+ICAg
ICAgICAgcmV0dXJuIDA7Cj4+PiAgfQo+Pj4KPj4+ICtzdGF0aWMgYm9vbCBpc193aXBlZF9kZXZp
Y2UoaW50IGkpCj4+PiArewo+Pj4gKyNpZmRlZiBXSVRIX0FORFJPSUQKPj4+ICsgICAgICAgc3Ry
dWN0IGRldmljZV9pbmZvICpkZXYgPSBjLmRldmljZXMgKyBpOwo+Pj4gKyAgICAgICBpbnQgZmQg
PSBkZXYtPmZkOwo+Pj4gKyAgICAgICBjaGFyICpidWYsICp6ZXJvX2J1ZjsKPj4+ICsgICAgICAg
Ym9vbCB3aXBlZCA9IHRydWU7Cj4+PiArICAgICAgIGludCBuYmxvY2tzID0gNDA5NjsgICAgIC8q
IDE2TUIgc2l6ZSAqLwo+Pj4gKyAgICAgICBpbnQgajsKPj4+ICsKPj4+ICsgICAgICAgYnVmID0g
bWFsbG9jKEYyRlNfQkxLU0laRSk7Cj4+PiArICAgICAgIGlmIChidWYgPT0gTlVMTCkgewo+Pj4g
KyAgICAgICAgICAgICAgIE1TRygxLCAiXHRFcnJvcjogTWFsbG9jIEZhaWxlZCBmb3IgYnVmISEh
XG4iKTsKPj4+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4+PiArICAgICAgIH0KPj4+
ICsgICAgICAgemVyb19idWYgPSBjYWxsb2MoMSwgRjJGU19CTEtTSVpFKTsKPj4+ICsgICAgICAg
aWYgKHplcm9fYnVmID09IE5VTEwpIHsKPj4+ICsgICAgICAgICAgICAgICBNU0coMSwgIlx0RXJy
b3I6IENhbGxvYyBGYWlsZWQgZm9yIHplcm8gYnVmISEhXG4iKTsKPj4+ICsgICAgICAgICAgICAg
ICBmcmVlKGJ1Zik7Cj4+PiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pj4gKyAgICAg
ICB9Cj4+PiArCj4+PiArICAgICAgIGlmIChsc2VlayhmZCwgMCwgU0VFS19TRVQpIDwgMCkgewo+
Pj4gKyAgICAgICAgICAgICAgIGZyZWUoemVyb19idWYpOwo+Pj4gKyAgICAgICAgICAgICAgIGZy
ZWUoYnVmKTsKPj4+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4+PiArICAgICAgIH0K
Pj4+ICsKPj4+ICsgICAgICAgLyogY2hlY2sgZmlyc3QgbiBibG9ja3MgKi8KPj4+ICsgICAgICAg
Zm9yIChqID0gMDsgaiA8IG5ibG9ja3M7IGorKykgewo+Pj4gKyAgICAgICAgICAgICAgIGlmIChy
ZWFkKGZkLCBidWYsIEYyRlNfQkxLU0laRSkgIT0gRjJGU19CTEtTSVpFIHx8Cj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG1lbWNtcChidWYsIHplcm9fYnVmLCBGMkZTX0JMS1NJ
WkUpKSB7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICB3aXBlZCA9IGZhbHNlOwo+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4+PiArICAgICAgICAgICAgICAgfQo+Pj4gKyAg
ICAgICB9Cj4+PiArICAgICAgIGZyZWUoemVyb19idWYpOwo+Pj4gKyAgICAgICBmcmVlKGJ1Zik7
Cj4+PiArCj4+PiArICAgICAgIGlmICh3aXBlZCkKPj4+ICsgICAgICAgICAgICAgICBNU0coMCwg
IkluZm86IEZvdW5kIGFsbCB6ZXJvcyBpbiBmaXJzdCAlZCBibG9ja3NcbiIsCj4+PiBuYmxvY2tz
KTsKPj4+ICsgICAgICAgcmV0dXJuIHdpcGVkOwo+Pj4gKyNlbHNlCj4+PiArICAgICAgIHJldHVy
biBmYWxzZTsKPj4+ICsjZW5kaWYKPj4+ICt9Cj4+PiArCj4+PiAgaW50IGYyZnNfdHJpbV9kZXZp
Y2VzKHZvaWQpCj4+PiAgewo+Pj4gICAgICAgICBpbnQgaTsKPj4+Cj4+PiAtICAgICAgIGZvciAo
aSA9IDA7IGkgPCBjLm5kZXZzOyBpKyspCj4+PiAtICAgICAgICAgICAgICAgaWYgKHRyaW1fZGV2
aWNlKGkpKQo+Pj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgYy5uZGV2czsgaSsrKSB7Cj4+PiAr
ICAgICAgICAgICAgICAgaWYgKCFpc193aXBlZF9kZXZpY2UoaSkgJiYgdHJpbV9kZXZpY2UoaSkp
Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLTE7Cj4+PiArICAgICAgIH0KPj4+
ICAgICAgICAgYy50cmltbWVkID0gMTsKPj4+ICAgICAgICAgcmV0dXJuIDA7Cj4+PiAgfQo+Pj4g
LS0KPj4+IDIuMTkuMC42MDUuZzAxZDM3MWY3NDEtZ29vZwo+Pj4KPj4+Cj4+Pgo+Pj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IExpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldAo+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo+Pj4KPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4gCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
