Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2274F137CAD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Jan 2020 10:44:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iqDJH-0001cY-6M; Sat, 11 Jan 2020 09:43:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iqDJF-0001cG-17
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Jan 2020 09:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7y8k6nZY4nLnGrxRvJhJEop0dMN0tNp1acXiOfogKj8=; b=gcgQcUJKQkooCoQt4Gp7tcdlVb
 MRfip5FfZ3pyftH2O7uAS3NQ3HyEFblrDJ2tqHlBE+Pjq1EDZ258vCtTKtGwdzg7UZPCFuoA696Fk
 sZ6j2HI8e/ojUuxMjhqeEMEDBTY1Y3w/mAcg5pU8ssVOzkMMh+F4Ckd4Qd8V5hmXh+Yw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7y8k6nZY4nLnGrxRvJhJEop0dMN0tNp1acXiOfogKj8=; b=MH6MFI/1Rth/chJ9l2nl1990Kh
 lCVfPROQCnQNWdmXgHq3m6451vgy4WaEQ/9dlh2vIWgtbV6KJ8lQ50RmqicqMyXMn4FrlfIGdWWsg
 h1LCe5hxFsdzK9icJIl3d1T3qsvgwZuQwkEKCogLax/RR/glyDxipT2dLiwdCZh8XlbY=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iqDJA-000Mxh-Ms
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Jan 2020 09:43:56 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5064B8E2B9F4581B6FE7;
 Sat, 11 Jan 2020 17:43:43 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sat, 11 Jan
 2020 17:43:40 +0800
To: xiong ping <xp1982.06.06@gmail.com>
References: <1578482416650.67283@xiaomi.com>
 <d48d8d65-1308-278c-db86-0806a0c3637a@huawei.com>
 <CAOqdbhdyaNg3RoGF0+gJ=6wX4YDrgpfuVDsuAg05BSp3dmZKww@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <cd24098e-5c26-39de-6024-1bbb71375556@huawei.com>
Date: Sat, 11 Jan 2020 17:43:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAOqdbhdyaNg3RoGF0+gJ=6wX4YDrgpfuVDsuAg05BSp3dmZKww@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iqDJA-000Mxh-Ms
Subject: Re: [f2fs-dev] [PATCH] resize.f2fs: add option for large_nat_bitmap
 feature
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
Cc: =?UTF-8?B?UGluZzEgWGlvbmcg54aK5bmz?= <xiongping1@xiaomi.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC8xLzEwIDE3OjU4LCB4aW9uZyBwaW5nIHdyb3RlOgo+IENoYW8gWXUgPHl1Y2hhbzBA
aHVhd2VpLmNvbT4g5LqOMjAyMOW5tDHmnIg55pel5ZGo5ZubIOS4i+WNiDM6MTblhpnpgZPvvJoK
Pj4KPj4gT24gMjAyMC8xLzggMTk6MjAsIFBpbmcxIFhpb25nIOeGiuW5syB3cm90ZToKPj4+IEZy
b20gZDViODQxMWRiYWUzNzE4MGMzN2Q5NmJmMTY0ZmFiMTYxMzhmYzIxYSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKPj4+Cj4+PiBGcm9tOiB4aW9uZ3BpbmcxIDx4aW9uZ3BpbmcxQHhpYW9taS5j
b20+Cj4+PiBEYXRlOiBXZWQsIDggSmFuIDIwMjAgMTc6MjA6NTUgKzA4MDAKPj4+IFN1YmplY3Q6
IFtQQVRDSF0gcmVzaXplLmYyZnM6IGFkZCBvcHRpb24gZm9yIGxhcmdlX25hdF9iaXRtYXAgZmVh
dHVyZQo+Pgo+PiBUaGFua3MgZm9yIHlvdXIgY29udHJpYnV0aW9uLgo+Pgo+PiBUaGUgcGF0Y2gg
Zm9ybWF0IGlzIGluY29ycmVjdCwgSSBndWVzcyBpdCB3YXMgY2hhbmdlZCBieSBlbWFpbCBjbGll
bnQgb3Igd2hlbgo+PiB5b3UgcGFzdGUgcGF0Y2gncyBjb250ZW50LCBjb3VsZCB5b3UgY2hlY2sg
aXQ/Cj4+Cj4gSSBoYXZlIHJlc2VuZCB0aGUgcGF0Y2ggd2l0aCB0aGlzIGVtYWlsIGFjY291bnQg
eWVzdGVyZGF5LCBjYW4geW91IGNoZWNrIGl0Pwo+Pj4KPj4+IHJlc2l6ZS5mMmZzIGhhcyBhbHJl
YWR5IHN1cHBvcnRlZCBsYXJnZV9uYXRfYml0bWFwIGZlYXR1cmUsIGJ1dCBoYXMgbm8KPj4+IG9w
dGlvbiB0byB0dXJuIG9uIGl0Lgo+Pj4KPj4+IFRoaXMgY2hhbmdlIGFkZCBhIG5ldyAnLWknIG9w
dGlvbiB0byBjb250cm9sIHR1cm5pbmcgb24vb2ZmIGl0Lgo+Pgo+PiBXZSBvbmx5IGFkZCBhIG9w
dGlvbiB0byB0dXJuIG9uIHRoaXMgZmVhdHVyZSwgcmlnaHQ/IHJhdGhlciB0aGFuIHR1cm5pbmcK
Pj4gb24gb3Igb2ZmIGl0Pwo+Pgo+IHllcywgdGhlIGZlYXR1cmUgaXMgb2ZmIGJ5IGRlZmF1bHQs
IHNvIHdlIG5lZWQgYW4gb3B0aW9uIHRvIGVuYWJsZSBpdC4KClNvLCBJIG1lYW50IGl0IG5lZWRz
IHRvIGFkanVzdCBjb21taXQgbWVzc2FnZSBmcm9tICJ0dXJuaW5nIG9uL29mZiBpdCIgdG8KInR1
cm5pbmcgb24gaXQiLgoKPj4gVGhhbmtzLAo+Pgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IHhpb25n
cGluZzEgPHhpb25ncGluZzFAeGlhb21pLmNvbT4KPj4+IC0tLQo+Pj4gIGZzY2svbWFpbi5jICAg
fCA2ICsrKysrLQo+Pj4gIGZzY2svcmVzaXplLmMgfCA1ICsrKysrCj4+PiAgMiBmaWxlcyBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2ZzY2svbWFpbi5jIGIvZnNjay9tYWluLmMKPj4+IGluZGV4IDlhN2Q0OTkuLmU3ZTNkZmMgMTAw
NjQ0Cj4+PiAtLS0gYS9mc2NrL21haW4uYwo+Pj4gKysrIGIvZnNjay9tYWluLmMKPj4+IEBAIC0x
MDQsNiArMTA0LDcgQEAgdm9pZCByZXNpemVfdXNhZ2UoKQo+Pj4gICAgICAgICAgTVNHKDAsICJc
blVzYWdlOiByZXNpemUuZjJmcyBbb3B0aW9uc10gZGV2aWNlXG4iKTsKPj4+ICAgICAgICAgIE1T
RygwLCAiW29wdGlvbnNdOlxuIik7Cj4+PiAgICAgICAgICBNU0coMCwgIiAgLWQgZGVidWcgbGV2
ZWwgW2RlZmF1bHQ6MF1cbiIpOwo+Pj4gKyAgICAgICBNU0coMCwgIiAgLWkgZXh0ZW5kZWQgbm9k
ZSBiaXRtYXAsIG5vZGUgcmF0aW8gaXMgMjAlJSBieSBkZWZhdWx0XG4iKTsKPj4+ICAgICAgICAg
IE1TRygwLCAiICAtcyBzYWZlIHJlc2l6ZSAoRG9lcyBub3QgcmVzaXplIG1ldGFkYXRhKSIpOwo+
Pj4gICAgICAgICAgTVNHKDAsICIgIC10IHRhcmdldCBzZWN0b3JzIFtkZWZhdWx0OiBkZXZpY2Ug
c2l6ZV1cbiIpOwo+Pj4gICAgICAgICAgTVNHKDAsICIgIC1WIHByaW50IHRoZSB2ZXJzaW9uIG51
bWJlciBhbmQgZXhpdFxuIik7Cj4+PiBAQCAtNDQ5LDcgKzQ1MCw3IEBAIHZvaWQgZjJmc19wYXJz
ZV9vcHRpb25zKGludCBhcmdjLCBjaGFyICphcmd2W10pCj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsKPj4+ICAgICAgICAgICAgICAgICAgfQo+Pj4gICAgICAgICAg
fSBlbHNlIGlmICghc3RyY21wKCJyZXNpemUuZjJmcyIsIHByb2cpKSB7Cj4+PiAtICAgICAgICAg
ICAgICAgY29uc3QgY2hhciAqb3B0aW9uX3N0cmluZyA9ICJkOnN0OlYiOwo+Pj4gKyAgICAgICAg
ICAgICAgIGNvbnN0IGNoYXIgKm9wdGlvbl9zdHJpbmcgPSAiZDpzdDppViI7Cj4+Pgo+Pj4gICAg
ICAgICAgICAgICAgICBjLmZ1bmMgPSBSRVNJWkU7Cj4+PiAgICAgICAgICAgICAgICAgIHdoaWxl
ICgob3B0aW9uID0gZ2V0b3B0KGFyZ2MsIGFyZ3YsIG9wdGlvbl9zdHJpbmcpKSAhPSBFT0YpIHsK
Pj4+IEBAIC00NzYsNiArNDc3LDkgQEAgdm9pZCBmMmZzX3BhcnNlX29wdGlvbnMoaW50IGFyZ2Ms
IGNoYXIgKmFyZ3ZbXSkKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0ID0gc3NjYW5mKG9wdGFyZywgIiUiUFJJeDY0IiIsCj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYy50YXJnZXRfc2VjdG9y
cyk7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGNhc2UgJ2knOgo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjLmxhcmdlX25hdF9iaXRtYXAgPSAxOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBicmVhazsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBjYXNlICdWJzoK
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNob3dfdmVyc2lvbihwcm9nKTsK
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV4aXQoMCk7Cj4+PiBkaWZmIC0t
Z2l0IGEvZnNjay9yZXNpemUuYyBiL2ZzY2svcmVzaXplLmMKPj4+IGluZGV4IGZjNTYzZjIuLjg4
ZTA2M2UgMTAwNjQ0Cj4+PiAtLS0gYS9mc2NrL3Jlc2l6ZS5jCj4+PiArKysgYi9mc2NrL3Jlc2l6
ZS5jCj4+PiBAQCAtNTE5LDYgKzUxOSwxMSBAQCBzdGF0aWMgdm9pZCByZWJ1aWxkX2NoZWNrcG9p
bnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4gICAgICAgICAgZWxzZQo+Pj4gICAgICAg
ICAgICAgICAgICBzZXRfY3AoY2hlY2tzdW1fb2Zmc2V0LCBDUF9DSEtTVU1fT0ZGU0VUKTsKPj4+
Cj4+PiArICAgICAgIGlmIChjLmxhcmdlX25hdF9iaXRtYXApIHsKPj4+ICsgICAgICAgICAgICAg
ICBzZXRfY3AoY2hlY2tzdW1fb2Zmc2V0LCBDUF9NSU5fQ0hLU1VNX09GRlNFVCk7Cj4+PiArICAg
ICAgICAgICAgICAgZmxhZ3MgfD0gQ1BfTEFSR0VfTkFUX0JJVE1BUF9GTEFHOwo+Pj4gKyAgICAg
ICB9CgpIb3cgYWJvdXQgcmVsb2NhdGluZyBhYm92ZSBjb2RlcyB0byBiZWxvdyBwb3NpdGlvbjoK
CglmbGFncyA9IHVwZGF0ZV9uYXRfYml0c19mbGFncyhuZXdfc2IsIGNwLCBnZXRfY3AoY2twdF9m
bGFncykpOwoKKwlpZiAoYy5sYXJnZV9uYXRfYml0bWFwKQorCQlmbGFncyB8PSBDUF9MQVJHRV9O
QVRfQklUTUFQX0ZMQUc7CgoJaWYgKGZsYWdzICYgQ1BfQ09NUEFDVF9TVU1fRkxBRykKCQlmbGFn
cyAmPSB+Q1BfQ09NUEFDVF9TVU1fRkxBRzsKClRoYW5rcywKCj4+PiArCj4+PiAgICAgICAgICBz
ZXRfY3AoY2twdF9mbGFncywgZmxhZ3MpOwo+Pj4KPj4+ICAgICAgICAgIG1lbWNweShuZXdfY3As
IGNwLCAodW5zaWduZWQgY2hhciAqKWNwLT5zaXRfbmF0X3ZlcnNpb25fYml0bWFwIC0KPj4+IC0t
Cj4+PiAyLjcuNAo+Pj4KPj4+Cj4+Pgo+Pj4KPj4+ICMvKioqKioq5pys6YKu5Lu25Y+K5YW26ZmE
5Lu25ZCr5pyJ5bCP57Gz5YWs5Y+455qE5L+d5a+G5L+h5oGv77yM5LuF6ZmQ5LqO5Y+R6YCB57uZ
5LiK6Z2i5Zyw5Z2A5Lit5YiX5Ye655qE5Liq5Lq65oiW576k57uE44CC56aB5q2i5Lu75L2V5YW2
5LuW5Lq65Lul5Lu75L2V5b2i5byP5L2/55So77yI5YyF5ous5L2G5LiN6ZmQ5LqO5YWo6YOo5oiW
6YOo5YiG5Zyw5rOE6Zyy44CB5aSN5Yi244CB5oiW5pWj5Y+R77yJ5pys6YKu5Lu25Lit55qE5L+h
5oGv44CC5aaC5p6c5oKo6ZSZ5pS25LqG5pys6YKu5Lu277yM6K+35oKo56uL5Y2z55S16K+d5oiW
6YKu5Lu26YCa55+l5Y+R5Lu25Lq65bm25Yig6Zmk5pys6YKu5Lu277yBIFRoaXMgZS1tYWlsIGFu
ZCBpdHMgYXR0YWNobWVudHMgY29udGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gZnJvbSBY
SUFPTUksIHdoaWNoIGlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gb3IgZW50aXR5IHdo
b3NlIGFkZHJlc3MgaXMgbGlzdGVkIGFib3ZlLiBBbnkgdXNlIG9mIHRoZSBpbmZvcm1hdGlvbiBj
b250YWluZWQgaGVyZWluIGluIGFueSB3YXkgKGluY2x1ZGluZywgYnV0IG5vdCBsaW1pdGVkIHRv
LCB0b3RhbCBvciBwYXJ0aWFsIGRpc2Nsb3N1cmUsIHJlcHJvZHVjdGlvbiwgb3IgZGlzc2VtaW5h
dGlvbikgYnkgcGVyc29ucyBvdGhlciB0aGFuIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykgaXMg
cHJvaGliaXRlZC4gSWYgeW91IHJlY2VpdmUgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBu
b3RpZnkgdGhlIHNlbmRlciBieSBwaG9uZSBvciBlbWFpbCBpbW1lZGlhdGVseSBhbmQgZGVsZXRl
IGl0ISoqKioqKi8jCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IExpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiAuCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
