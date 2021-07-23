Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9D03D323B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 05:30:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6ltF-0005UC-2v; Fri, 23 Jul 2021 03:30:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m6lt7-0005Tu-1Z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v8XPxsVFyIeXzFc2XhLnPe0r2pqF7zzRNWH/CHWLlnY=; b=E141lA4UqT74hQTXhM7zEW6coG
 dB/qqf7/nN90efN/LAC57ghRwFDlUE/9XSD8+3HsmwioQzN5zSdlBRbph55B1By2YY4GENCKfOLOK
 L/bx3LHgbYOkt3UsW2J8JRzFcR5qHatAqHhbz5HNXVxLk4Djs6iudiSLd+F1mWzRiQrs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v8XPxsVFyIeXzFc2XhLnPe0r2pqF7zzRNWH/CHWLlnY=; b=UH099pMbnihBWd3XbFiI9jRPNP
 le4cXjxYUS+VMum0rM/kGV7+0w9sL9mbaRU4IorhYZeZ02T3szsVqj01YFdUJaFilkej3oOxOFlAq
 Krbx6TTc2/Bj6WxjpA1qq3q1FlzSNJbPLrudfe/RPupLOQ6yKKhDkAZMCJrWvGQjDbpM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6lt5-0002uu-FM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:30:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 771F560E74;
 Fri, 23 Jul 2021 03:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627011001;
 bh=Pkt/i4/kR56E/v/Mzqmp8vFn6wHe/I3EKGBh2D46f9c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Vu61NKr+0xd8f2IrWVBrKHt5E6oX4yIpTkK7S5k+i+ywcjb/AcgOpSuxpy9jxgAgh
 OLfZApq35Jy+0Vtxzj2lRy+3Io4MAl4P7wX+HQi5Mf1NGoRIDT7y+TZPdnmnW9YVR7
 DS5sAHONgYT3FNd5B2QcmDy1JaVIWJ1o2vbXG31B5yL+x4Uqe4I6cAqoTwTIia5fsR
 BY+BnoMBV66aKDiVaspfGeomhsi/+nMHCq0icIeO9W15u8393o9dL5HU7hFrNgDv1/
 87K9AjHVUVksOnZ0zhvNrRoBeYInozYl7R2LpL3JKLg80YbSyt77O1AyyNtOwM5VMh
 3I4X5qVeYob0A==
To: Jack Qiu <jack.qiu@huawei.com>, jaegeuk@kernel.org
References: <20210722044130.44591-1-jack.qiu@huawei.com>
 <630147dc-4f73-f985-347a-c4933c312edd@kernel.org>
 <e5616c5c-3b3d-2036-3395-8d0d0ce2cf80@huawei.com>
 <fd3b4af6-34a8-2fcf-e82f-888831f5d097@kernel.org>
 <1f950160-1d6a-13ea-2ba1-39b906f5cc0d@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <0a92b28a-d55e-e955-266f-794dd9fb744b@kernel.org>
Date: Fri, 23 Jul 2021 11:29:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1f950160-1d6a-13ea-2ba1-39b906f5cc0d@huawei.com>
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6lt5-0002uu-FM
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: fix use after free in
 f2fs_fill_super
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS83LzIzIDExOjI3LCBKYWNrIFFpdSB3cm90ZToKPiBPbiAyMDIxLzcvMjMgMTA6NTEs
IENoYW8gWXUgd3JvdGU6Cj4+IE9uIDIwMjEvNy8yMyAxMDo0MSwgSmFjayBRaXUgd3JvdGU6Cj4+
PiBPbiAyMDIxLzcvMjIgMjI6MDUsIENoYW8gWXUgd3JvdGU6Cj4+Pj4gT24gMjAyMS83LzIyIDEy
OjQxLCBKYWNrIFFpdSB3cm90ZToKPj4+Pj4gVGhlIHJvb3QgY2F1c2UgaXMgc2hyaW5rX2RjYWNo
ZV9zYiBhZnRlciBzYmkgaGFzIGJlZW4gZnJlZWQuCj4+Pj4+IFNvIGNhbGwgc2hyaW5rX2RjYWNo
ZV9zYiBiZWZvcmUgZnJlZSBzYmkgYW5kIG90aGVyIHJlc291cmNlcy4KPj4+Pj4KPj4+Pj4gPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Cj4+Pj4+IEJVRzogS0FTQU46IHVzZS1hZnRlci1mcmVlIGluIGYyZnNfZXZpY3RfaW5v
ZGUrMHgzMWMvMHhkZTUKPj4+Pj4gUmVhZCBvZiBzaXplIDQgYXQgYWRkciBmZmZmODg4MWQ5N2Yw
ZDUwIGJ5IHRhc2sgc3l6LWV4ZWN1dG9yLjMvODcyOQo+Pj4+Pgo+Pj4+PiBQVTogMSBQSUQ6IDg3
MjkgQ29tbTogc3l6LWV4ZWN1dG9yLjMgTm90IHRhaW50ZWQKPj4+Pj4gNC4xOS4xOTUtMDAwMDIt
ZzY3ZGNlZWEwNDQzMS1kaXJ0eSAjMzEKPj4+Pgo+Pj4+IERvZXMgdGhpcyBidWcgYmVsb3cgdG8g
NC4xOS4xOTU/Cj4+Cj4+IEkgbWVhbiB3aGV0aGVyIHRoaXMgYnVnIGV4aXN0cyBpbiBtYWlubGlu
ZT8gTm90IHN1cmUsIEkganVzdCBkb3VidCBtYXliZQo+PiB3ZSBoYXZlIGZpeGVkIHRoaXMgaXNz
dWUsIGJ1dCBmb3Jnb3QgdG8gYmFja3BvcnQgaXQgdG8gNC4xOSBzdGFibGUga2VybmVsLgo+Pgo+
IEdvdCBpdC4KPj4+Pgo+Pj4gWWVzLCBJIGJlbGlldmUgZWQyZTYyMWE5NWQ3MDRlNmE0ZTkwNGNj
MDA1MjRlOGNiZGRkYTBjMiBjYXVzZXMgdGhpcyBidWcuCj4+Pgo+Pj4gZ2l0IGRlc2NyaWJlIC0t
Y29udGFpbnMgZWQyZTYyMWE5NWQ3MDRlNmE0ZTkwNGNjMDA1MjRlOGNiZGRkYTBjMgo+Pj4gdjMu
MTctcmM0fjI3XjJ+MTcKPj4+Cj4+PiBAQCAtMTEyNiw2ICsxMTMwLDEzIEBAIHN0YXRpYyBpbnQg
ZjJmc19maWxsX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHZvaWQgKmRhdGEsIGludCBz
aWxlbnQpCj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBicmVsc2UocmF3X3N1cGVyX2J1Zik7Cj4+PiAg
wqAgZnJlZV9zYmk6Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBrZnJlZShzYmkpO8KgwqDCoCAtLS3C
oCBmcmVlIHNiaQo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoCAvKiBnaXZlIG9ubHkgb25lIGFub3Ro
ZXIgY2hhbmNlICovCj4+PiArwqDCoMKgwqDCoMKgIGlmIChyZXRyeSkgewo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0cnkgPSAhcmV0cnk7Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzaHJpbmtfZGNhY2hlX3NiKHNiKTsgLS0tIGNhbGwgZjJmc19ldmljdF9p
bm9kZShyb290IGlub2RlKSwgaXQgd2lsbCBhY2Nlc3Mgc2JpCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBnb3RvIHRyeV9vbmVtb3JlOwo+Pj4gK8KgwqDCoMKgwqDCoCB9Cj4+PiAg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+Pj4gIMKgIH0KPj4+Cj4+Pj4+IEhhcmR3YXJl
IG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9TCj4+Pj4+
ID8tMjAxOTA3MjdfMDczODM2LWJ1aWxkdm0tcHBjNjRsZS0xNi5wcGMuZmVkb3JhcHJvamVjdC5v
cmctMy5mYzMxCj4+Pj4+IDA0LzAxLzIwMTQKPj4+Pj4gQ2FsbCBUcmFjZToKPj4+Pj4gIMKgwqAg
ZHVtcF9zdGFjaysweGU1LzB4MTRiCj4+Pj4+ICDCoMKgID8gZjJmc19ldmljdF9pbm9kZSsweDMx
Yy8weGRlNQo+Pj4+PiAgwqDCoCBwcmludF9hZGRyZXNzX2Rlc2NyaXB0aW9uKzB4NmMvMHgyMzcK
Pj4+Pj4gIMKgwqAgPyBmMmZzX2V2aWN0X2lub2RlKzB4MzFjLzB4ZGU1Cj4+Pj4+ICDCoMKgIGth
c2FuX3JlcG9ydC5jb2xkKzB4ODgvMHgyYTMKPj4+Pj4gIMKgwqAgZjJmc19ldmljdF9pbm9kZSsw
eDMxYy8weGRlNQo+Pj4+PiAgwqDCoCA/IGZ1bGxfcHJveHlfb3Blbi5jb2xkKzB4MTIvMHgxMgo+
Pj4+PiAgwqDCoCBldmljdCsweDJjZC8weDVmMAo+Pj4+PiAgwqDCoCBpcHV0KzB4M2Q5LzB4NmYw
Cj4+Pj4+ICDCoMKgIGRlbnRyeV91bmxpbmtfaW5vZGUrMHgyNzMvMHgzMzAKPj4+Pj4gIMKgwqAg
X19kZW50cnlfa2lsbCsweDM0MC8weDVlMAo+Pj4+PiAgwqDCoCBkZW50cnlfa2lsbCsweGI3LzB4
NzQwCj4+Pj4+ICDCoMKgIHNocmlua19kZW50cnlfbGlzdCsweDI1Ni8weDY2MAo+Pj4+PiAgwqDC
oCBzaHJpbmtfZGNhY2hlX3NiKzB4MTFmLzB4MWQwCj4+Pj4+ICDCoMKgID8gc2hyaW5rX2RlbnRy
eV9saXN0KzB4NjYwLzB4NjYwCj4+Pj4+ICDCoMKgID8gX19rYXNhbl9zbGFiX2ZyZWUrMHgxNDQv
MHgxODAKPj4+Pj4gIMKgwqAgZjJmc19maWxsX3N1cGVyKzB4MmEzNC8weDRhODAKPj4+Pj4gIMKg
wqAgPyBmMmZzX3Nhbml0eV9jaGVja19ja3B0LmNvbGQrMHgyYjYvMHgyYjYKPj4+Pj4gIMKgwqAg
PyB3YWl0X2Zvcl9jb21wbGV0aW9uKzB4M2MwLzB4M2MwCj4+Pj4+ICDCoMKgID8gc2V0X2Jsb2Nr
c2l6ZSsweDIzMC8weDJiMAo+Pj4+PiAgwqDCoCBtb3VudF9iZGV2KzB4MmMxLzB4MzcwCj4+Pj4+
ICDCoMKgID8gZjJmc19zYW5pdHlfY2hlY2tfY2twdC5jb2xkKzB4MmI2LzB4MmI2Cj4+Pj4+ICDC
oMKgIG1vdW50X2ZzKzB4NGMvMHgxYzAKPj4+Pj4gIMKgwqAgdmZzX2tlcm5fbW91bnQucGFydC4w
KzB4NjAvMHgzZDAKPj4+Pj4gIMKgwqAgZG9fbW91bnQrMHgzNjcvMHgyNTcwCj4+Pj4+ICDCoMKg
ID8ga2FzYW5fdW5wb2lzb25fc2hhZG93KzB4MzMvMHg0MAo+Pj4+PiAgwqDCoCA/IGNvcHlfbW91
bnRfc3RyaW5nKzB4NDAvMHg0MAo+Pj4+PiAgwqDCoCA/IGttZW1fY2FjaGVfYWxsb2NfdHJhY2Ur
MHgxM2YvMHgyYjAKPj4+Pj4gIMKgwqAgPyBfY29weV9mcm9tX3VzZXIrMHg5NC8weDEwMAo+Pj4+
PiAgwqDCoCA/IGNvcHlfbW91bnRfb3B0aW9ucysweDFmMS8weDJlMAo+Pj4+PiAgwqDCoCBrc3lz
X21vdW50KzB4YTAvMHgxMDAKPj4+Pj4gIMKgwqAgX194NjRfc3lzX21vdW50KzB4YmYvMHgxNjAK
Pj4+Pj4gIMKgwqAgZG9fc3lzY2FsbF82NCsweGMyLzB4MTkwCj4+Pj4+ICDCoMKgIGVudHJ5X1NZ
U0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ5LzB4YmUKPj4+Pj4gUklQOiAwMDMzOjB4NDc5Mzhl
Cj4+Pj4+IENvZGU6IDQ4IGM3IGMxIGI0IGZmIGZmIGZmIGY3IGQ4IDY0IDg5IDAxIDQ4IDgzIGM4
IGZmIGMzIDY2IDJlIDBmIDFmIDg0Cj4+Pj4+IDAwIDAwIDAwIDAwIDAwIDkwIGYzIDBmIDFlIGZh
IDQ5IDg5IGNhIGI4IGE1IDAwIDAwIDAwIDBmIDA1IDw0OD4gM2QgMDEKPj4+Pj4gZjAgZmYgZmYg
NzMgMDEgYzMgNDggYzcgYzEgYjQgZmYgZmYgZmYgZjcgZDggNjQgODkgMDEgNDgKPj4+Pj4gUlNQ
OiAwMDJiOjAwMDA3ZmVkNjczYjZhNDggRUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDogMDAwMDAw
MDAwMDAwMDBhNQo+Pj4+PiBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwMDAwMDIwMDAw
MjAwIFJDWDogMDAwMDAwMDAwMDQ3OTM4ZQo+Pj4+PiBSRFg6IDAwMDAwMDAwMjAwMDAwMDAgUlNJ
OiAwMDAwMDAwMDIwMDAwMTAwIFJESTogMDAwMDdmZWQ2NzNiNmFhMAo+Pj4+PiBSQlA6IDAwMDA3
ZmVkNjczYjZhZTAgUjA4OiAwMDAwN2ZlZDY3M2I2YWUwIFIwOTogMDAwMDAwMDAyMDAwMDAwMAo+
Pj4+PiBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAwMDAwMDAwMDAwMDAwMjQ2IFIxMjogMDAw
MDAwMDAyMDAwMDAwMAo+Pj4+PiBSMTM6IDAwMDAwMDAwMjAwMDAxMDAgUjE0OiAwMDAwN2ZlZDY3
M2I2YWEwIFIxNTogMDAwMDAwMDAyMDAwMGIwMAo+Pj4+Pgo+Pj4+PiBBbGxvY2F0ZWQgYnkgdGFz
ayA4NzI5Ogo+Pj4+PiAgwqDCoCBrYXNhbl9rbWFsbG9jKzB4YzIvMHhlMAo+Pj4+PiAgwqDCoCBr
bWVtX2NhY2hlX2FsbG9jX3RyYWNlKzB4MTNmLzB4MmIwCj4+Pj4+ICDCoMKgIGYyZnNfZmlsbF9z
dXBlcisweDEyNC8weDRhODAKPj4+Pj4gIMKgwqAgbW91bnRfYmRldisweDJjMS8weDM3MAo+Pj4+
PiAgwqDCoCBtb3VudF9mcysweDRjLzB4MWMwCj4+Pj4+ICDCoMKgIHZmc19rZXJuX21vdW50LnBh
cnQuMCsweDYwLzB4M2QwCj4+Pj4+ICDCoMKgIGRvX21vdW50KzB4MzY3LzB4MjU3MAo+Pj4+PiAg
wqDCoCBrc3lzX21vdW50KzB4YTAvMHgxMDAKPj4+Pj4gIMKgwqAgX194NjRfc3lzX21vdW50KzB4
YmYvMHgxNjAKPj4+Pj4gIMKgwqAgZG9fc3lzY2FsbF82NCsweGMyLzB4MTkwCj4+Pj4+ICDCoMKg
IGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ5LzB4YmUKPj4+Pj4KPj4+Pj4gRnJl
ZWQgYnkgdGFzayA4NzI5Ogo+Pj4+PiAgwqDCoCBfX2thc2FuX3NsYWJfZnJlZSsweDEyZi8weDE4
MAo+Pj4+PiAgwqDCoCBrZnJlZSsweGZhLzB4MmEwCj4+Pj4+ICDCoMKgIGYyZnNfZmlsbF9zdXBl
cisweDJhMDAvMHg0YTgwCj4+Pj4+ICDCoMKgIG1vdW50X2JkZXYrMHgyYzEvMHgzNzAKPj4+Pj4g
IMKgwqAgbW91bnRfZnMrMHg0Yy8weDFjMAo+Pj4+PiAgwqDCoCB2ZnNfa2Vybl9tb3VudC5wYXJ0
LjArMHg2MC8weDNkMAo+Pj4+PiAgwqDCoCBkb19tb3VudCsweDM2Ny8weDI1NzAKPj4+Pj4gIMKg
wqAga3N5c19tb3VudCsweGEwLzB4MTAwCj4+Pj4+ICDCoMKgIF9feDY0X3N5c19tb3VudCsweGJm
LzB4MTYwCj4+Pj4+ICDCoMKgIGRvX3N5c2NhbGxfNjQrMHhjMi8weDE5MAo+Pj4+PiAgwqDCoCBl
bnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0OS8weGJlCj4+Pj4+Cj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEphY2sgUWl1IDxqYWNrLnFpdUBodWF3ZWkuY29tPgo+Pj4+PiAtLS0KPj4+Pj4g
IMKgwqAgZnMvZjJmcy9zdXBlci5jIHwgMyArKy0KPj4+Pj4gIMKgwqAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4+Pj4+IGluZGV4IDhmZWNkMzA1MGNj
ZC4uYjA0MTYyNWUwNmNlIDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPj4+Pj4g
KysrIGIvZnMvZjJmcy9zdXBlci5jCj4+Pj4+IEBAIC00MjI5LDYgKzQyMjksOCBAQCBzdGF0aWMg
aW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCB2b2lkICpkYXRhLCBp
bnQgc2lsZW50KQo+Pj4+PiAgwqDCoCBmcmVlX2NvbXByZXNzX2lub2RlOgo+Pj4+PiAgwqDCoMKg
wqDCoMKgIGYyZnNfZGVzdHJveV9jb21wcmVzc19pbm9kZShzYmkpOwo+Pj4+PiAgwqDCoCBmcmVl
X3Jvb3RfaW5vZGU6Cj4+Pj4+ICvCoMKgwqAgaWYgKHJldHJ5X2NudCA+IDAgJiYgc2tpcF9yZWNv
dmVyeSkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNocmlua19kY2FjaGVfc2Ioc2IpOwo+Pj4+Cj4+
Pj4gQ29tcGFyZSB0byA0LjE5LCBsYXN0IGYyZnMgYWRkcyBldmljdF9pbm9kZXMoKSBiZWZvcmUg
ZjJmc191bnJlZ2lzdGVyX3N5c2ZzKCksCj4+PiBDYW4gbm90IGZpbmQgKmV2aWN0X2lub2Rlcyos
IGNvdWxkIHlvdSBwbGVhc2UgZWxhYm9yYXRlIG1vcmUgZGV0YWlsPwo+Pgo+PiBDb3VsZCB5b3Ug
cGxlYXNlIGNoZWNrIHdoZXRoZXIgYmVsb3cgcGF0Y2ggY2FuIGZpeCB0aGlzIGlzc3VlPwo+Pgo+
PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxk
cy9saW51eC5naXQvY29tbWl0Lz9pZD04MTJhOTU5NzdmZDJmMGQxZjIyMGM3MTZhOTgKPj4KPj4g
VGhhbmtzLAo+Pgo+IEkgd2lsbCB0ZXN0IGl0LgoKQ291bGQgeW91IHBsZWFzZSB0ZXN0IG9uIDUu
MTQtcmMxIGZpcnN0PwoKVGhhbmtzLAoKPiAKPiBUaGFuc2ssCj4+Pj4gY291bGQgeW91IHBsZWFz
ZSBjaGVjayB3aGV0aGVyIHRoaXMgY2FuIGZpeCB0aGUgaXNzdWU/Cj4+PiBJIGhhdmUgcnVuIHRo
ZSB0ZXN0IG1vcmUgdGhhbiAxIGRheSB3LyB0aGlzIHBhdGNoLCBpdCB3aWxsIGZhaWwgaW4gMSBo
b3VyIGJlZm9yZS4KPj4+IEkgYmVsaWV2ZSB0aGlzIHBhdGNoIGNhbiBmaXggKnRoaXMqIGlzc3Vl
LiBCdXQgSSdtIG5vdCBxdWl0ZSBmYW1pbGlhciB3aXRoIHNocmlua19kY2FjaGVfc2IsCj4+PiBt
YXliZSBJIG1pc3Mgb3RoZXIgc2NlbmFyaW8uIElmIHlvdSBoYXZlIG90aGVyIGNvbW1lbnQsIHBs
ZWFzZSBsZXQgbWUga25vdy4KPj4+Cj4+PiBUaGFua3MsCj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4K
Pj4+Pj4gIMKgwqDCoMKgwqDCoCBkcHV0KHNiLT5zX3Jvb3QpOwo+Pj4+PiAgwqDCoMKgwqDCoMKg
IHNiLT5zX3Jvb3QgPSBOVUxMOwo+Pj4+PiAgwqDCoCBmcmVlX25vZGVfaW5vZGU6Cj4+Pj4+IEBA
IC00Mjg1LDcgKzQyODcsNiBAQCBzdGF0aWMgaW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3Vw
ZXJfYmxvY2sgKnNiLCB2b2lkICpkYXRhLCBpbnQgc2lsZW50KQo+Pj4+PiAgwqDCoMKgwqDCoMKg
IC8qIGdpdmUgb25seSBvbmUgYW5vdGhlciBjaGFuY2UgKi8KPj4+Pj4gIMKgwqDCoMKgwqDCoCBp
ZiAocmV0cnlfY250ID4gMCAmJiBza2lwX3JlY292ZXJ5KSB7Cj4+Pj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXRyeV9jbnQtLTsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHNocmlua19kY2FjaGVf
c2Ioc2IpOwo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byB0cnlfb25lbW9yZTsKPj4+
Pj4gIMKgwqDCoMKgwqDCoCB9Cj4+Pj4+ICDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPj4+Pj4g
LS0gCj4+Pj4+IDIuMTcuMQo+Pj4+Pgo+Pj4+IC4KPj4+Cj4+IC4KPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
