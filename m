Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAFA2CC67F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Dec 2020 20:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:Message-ID:
	References:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lC1dXiJLSB6w1dnC05qot8VeE5KUmP8JIWAlK+V1xtY=; b=GJvJBc4j0gpSG4uoLQKEwTAFKp
	YFIcmRm9B58qfrSYfFEqXT8EsaGH4rtDKN5Yle8NE28qPVRH7Yn4cSItEBhxqb2etCdH8m4pSqTut
	x85uur30HPuNckP6hYZWbY7l6mqgtsGF1vIYmZku8VMMQ/s0YcajJJQOsrug6QROlWm8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkXjG-0007Vc-Gi; Wed, 02 Dec 2020 19:23:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <m.novosyolov@rosalinux.ru>) id 1kkXiu-0007Rh-BT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 19:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WIrjVoHnAcu0NW3M4XqrVJI6ACUD7gBAEZj6k7YcSI8=; b=hzK/pFC6sZ+Vi6Uv8WSTWwtkM5
 +/lA9D65MqGTi4ymobDXq0rMRECHL8EcvtmdM91phLubWa1n+5R0CwTqy6tIqXAr7MLpLlPbvEXOC
 De2LMuQXhEHQAl/vh4KRzJk0Pi/Y6OXkWFjE4ziK8kz+CWrOD94kW3mYoJsSE921b/NI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WIrjVoHnAcu0NW3M4XqrVJI6ACUD7gBAEZj6k7YcSI8=; b=DHyIPbutQCHKB60Vy/alD4dHQv
 puP9u8xRfI1LxRlBZKp0EFn9MTQmVPB/U2SETHOI2SU4Q+oK2+TYV/woGABU24cboS0kxbW72OOgk
 dsieof9c6+6m8buWZTwdfGMi1A6qsX9tcvRtNZeKd5GtSI8MXhBKSZHankgLhhgHPOg0=;
Received: from mail.rosalinux.ru ([195.19.76.54])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkXio-00GVva-AZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 19:23:32 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 97DCAE1E872DF;
 Wed,  2 Dec 2020 22:23:14 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id JEapJF6gfSUa; Wed,  2 Dec 2020 22:23:14 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 07034E1E7CECE;
 Wed,  2 Dec 2020 22:23:14 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 07034E1E7CECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1606936994;
 bh=WIrjVoHnAcu0NW3M4XqrVJI6ACUD7gBAEZj6k7YcSI8=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=qFky70YY9L40oIHPHdENCW0OCWfbKuQo80PqMAkVt/fT0/ofOaMOIqLKUNCXIkk1R
 9eoos7D5K9lGo0Du9fVAsUOPte2cIgHhYZSY4iR9nakSWhLBMIV2IKtKY1kt1VFU0g
 DWHQwnvr4Jg1la3r5w/ojDFqQGHmZ+RCkoqfMesx4TBDvmmvhC4f0B/j15iKNvSPSm
 A3wjalw6qDGFX31OSu6GJYQvqe/8nfimZ0d8YU1LxcpBSjOIdLsRmrj48H9bECo1bj
 Hubz+SQ6V+PrmSECouNcZecqCuDFEsgvmUswql7dU7h+d+0q20VS3OirO5AcUGfkqa
 O87XTFCi/fb/w==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id b-LXbiU97FqX; Wed,  2 Dec 2020 22:23:13 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-71-204.ip.moscow.rt.ru
 [90.154.71.204])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id C0BD9E1E872DF;
 Wed,  2 Dec 2020 22:23:13 +0300 (MSK)
To: linux-f2fs-devel@lists.sourceforge.net
References: <6ab5fbf4-5c78-8edc-14f0-f280a330d23d@rosalinux.ru>
Message-ID: <371efcfc-581b-2dcf-c2d7-ca7801fdb273@rosalinux.ru>
Date: Wed, 2 Dec 2020 22:23:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <6ab5fbf4-5c78-8edc-14f0-f280a330d23d@rosalinux.ru>
Content-Language: ru-RU
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kkXio-00GVva-AZ
Subject: Re: [f2fs-dev] Using secure erase in f2fs
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
From: Mikhail Novosyolov via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Cc: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>,
 Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

MDIuMTIuMjAyMCAyMToyNCwgTWlraGFpbCBOb3Zvc3lvbG92INC/0LjRiNC10YI6Cj4gSGVsbG8s
IGYyZnMgZGV2ZWxvcGVycyEKPgo+IEkgc2F3IGNvbW1pdCA5YWY4NDY0ODZkNzgxYTYzICJmMmZz
OiBhZGQgRjJGU19JT0NfU0VDX1RSSU1fRklMRSBpb2N0bCIgaW4gTGludXgga2VybmVsCj4gaHR0
cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC85YWY4NDY0ODZkNzgxYTYzZGUw
MjVhNWY1MDJjNTE1MjY4ZTQ4NzkwIwo+Cj4gSSBzYXcgdXNhZ2Ugb2YgaXQgaW4gQW5kcm9pZCBv
bmx5Cj4gaHR0cHM6Ly9hbmRyb2lkLmdvb2dsZXNvdXJjZS5jb20vcGxhdGZvcm0vc3lzdGVtL3Zv
bGQvKy9tYXN0ZXIvc2VjZGlzY2FyZC5jcHAKPgo+IERvIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHkg
dGhhdCB1c2Vyc3BhY2UgY29kZSBkZWNpZGVzIGhpbXNlbGYgd2hlcmUgdGhlIHJlZ2lvbiB0byBl
cmFzZSBzdGFydHMgYW5kIHdoZW4gdG8gY2FsbCB0aGF0IGlvY3RsPwo+Cj4gSSBhbSBpbnRlcmVz
dGVkIGluIGl0IHRvIGltcGxlbWVudCByZWFsdGltZSBzZWN1cmUgZXJhc2UgLSBvdmVyd3JpdGlu
ZyBmaWxlcyB3aXRoIHplcm9zIG9yIHJhbmRvbSBkYXRhIChJIGFtIG5vdCBpbnRlcmVzdGllZCBp
biBzZW5kaW5nIGEgZGlzY2FyZC90cmltIGNvbW1hbmQpIC0gd2hlbiBmaWxlcyBhcmUgZGVsZXRl
ZCBvciBhcmUgcmVtb3ZlZCBjb21wbGV0ZWx5Lgo+IFRoaXMgY29kZSBzZWVtcyB0byBiZSBhIGdv
b2Qgc29sdXRpb24gb2YgdGhpcyBwcm9ibGVtLCBidXQgdGhlIHByb2JsZW0gaXMgdGhhdCBrZXJu
ZWwgY2Fubm90IHRyaWdnZXIgaXQgYnkgaXRzZWxmLgpXaGF0IGlmIGRvIHNvbWV0aGluZyBsaWtl
IHRoaXM/CgpkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQu
YwppbmRleCA3ZDg1Nzg0MDEyNjcuLjFlNzJhYzI3YmZkZiAxMDA2NDQKLS0tIGEvZnMvZjJmcy9z
ZWdtZW50LmMKKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKQEAgLTExNjYsNiArMTE2NiwxMCBAQCBz
dGF0aWMgaW50IF9fc3VibWl0X2Rpc2NhcmRfY21kKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwK
wqDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIFNFQ1RPUl9GUk9NX0JMT0NLKHN0
YXJ0KSwKwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIFNFQ1RPUl9GUk9NX0JM
T0NLKGxlbiksCsKgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCBHRlBfTk9GUywg
MCwgJmJpbyk7CivCoMKgwqAgwqDCoMKgIF9fYmxrZGV2X2lzc3VlX3dyaXRlX3plcm9lcyhiZGV2
LAorwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCBTRUNUT1JfRlJPTV9CTE9DSyhz
dGFydCksCivCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIFNFQ1RPUl9GUk9NX0JM
T0NLKGxlbiksCivCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIEdGUF9OT0ZTLCAw
LCAmYmlvKTsKwqBzdWJtaXQ6CsKgwqDCoMKgIMKgwqDCoCBpZiAoZXJyKSB7CsKgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgc3Bpbl9sb2NrX2lycXNhdmUoJmRjLT5sb2NrLCBmbGFncyk7CgphZnRlciBv
ZiBiZWZvcmUgX19ibGtkZXZfaXNzdWVfZGlzY2FyZCgpPwoKSXMgaXQgc2FmZSB0byBmaWxsIHRo
ZSByZWdpb24gd2hpY2ggaXMgYmVpbmcgZGlzY2FyZGVkIHdpdGggemVyb2VzPwoKV2lsbCBpdCB3
b3JrIGFuZCB3aWxsIGl0IGZpdCB3aXRoIGJhY2tncm91bmQgaG91c2VrZWVwaW5nIGFuZCBkaXNj
YXJkIHF1ZXVlPwoKPgo+IEkgdGhpbmsgaXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGNhbGwgdGhp
cyBmcm9tIGFub3RoZXIgcGFydCBvZiBmMmZzIHdoZW4gYSBmaWxlIGlzIGJlaW5nIGVkaXRlZCBv
ciB1bmxpbmtlZCwgYnV0IEkgYW0gbm90IHN1cmUgZnJvbSB3aGVyZSBleGFjdGx5Lgo+Cj4gRjJG
UyBoYXMgYmFja2dyb3VuZCBob3VzZWtlZXBpbmcsIGl0IHdvdWxkIGJlIG5pY2UgaWYgaXQgY291
bGQgaXNzdWUgc2VjdXJlIHRyaW0gaW4gdGhlIGJhY2tncm91bmQuCj4KPiBBbHNvLCBJIGFtIG5v
dCBzdXJlIHRoYXQgaXQgd2lsbCB3b3JrIHdpdGggc3ltbGlua3MgY29ycmVjdGx5LCBmb3IgZXhh
bXBsZS4KPgo+IFBsZWFzZSBnaXZlIGEgZGlyZWN0aW9uLgo+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
