Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2701CA111
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 04:49:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWt4M-0003kW-Pr; Fri, 08 May 2020 02:48:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jWt4L-0003kO-5q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 02:48:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oHfdHXR89k8/CuDnGHlAqLECGwDzMgHliQUJ4h8zyHQ=; b=mwgtaGkuN/Rd4GcHIHPNd5qFXr
 moH1BZ3FnZFnSZ9c3QHRkxcyan3bsniHxmrOO43KXnk65g+Hy0CXmLsCR+dugHIribwMED8ZAde6y
 dP61rs6w+tt234nwP6JU1xIgoxJq5IvEbo0eX95cKkWJxPm7g5rvlvwi+iJd7Z4QXm44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oHfdHXR89k8/CuDnGHlAqLECGwDzMgHliQUJ4h8zyHQ=; b=D/D1ev3sWNr3dkbxSdGNp8fjRI
 t/ns0X0nY2vr2/1jSSjoCUntw6xUX0WV5IvyPsSRTwmRilRIwgEvtD2GMLpo66m/7r+sSKNbsFGq0
 EUoRnMk1864Ss3PrrvN76AKluSJutgkCODdgnvc5PBpL4LFOpfNvcU7KMUd08mGjiml0=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWt4J-00EzoZ-0n
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 02:48:57 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BB8E9EE6DD3E7ED40AE4;
 Fri,  8 May 2020 10:48:45 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 8 May 2020
 10:48:40 +0800
To: Daeho Jeong <daeho43@gmail.com>
References: <20200508011603.54553-1-yuchao0@huawei.com>
 <CACOAw_xxS_Wf==KnD31f9AOMu+QUs3WacowsfcD6w4A9n2AkTg@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0d41e29e-c601-e016-e471-aed184ca4a6a@huawei.com>
Date: Fri, 8 May 2020 10:48:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOAw_xxS_Wf==KnD31f9AOMu+QUs3WacowsfcD6w4A9n2AkTg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWt4J-00EzoZ-0n
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix zstd data corruption
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgRGFlaG8sCgpPbiAyMDIwLzUvOCA5OjI4LCBEYWVobyBKZW9uZyB3cm90ZToKPiBIaSBDaGFv
LAo+IAo+IElJVUMsIHlvdSBhcmUgdHJ5aW5nIG5vdCB0byB1c2UgWlNURF9jb21wcmVzc0JvdW5k
KCkgdG8gc2F2ZSB0aGUgbWVtb3J5Cj4gc3BhY2UuIEFtIEkgcmlnaHQ/Cj4gCj4gVGhlbiwgaG93
IGFib3V0IExaNF9jb21wcmVzc0JvdW5kKCkgZm9yIExaNCBhbmQgbHpvMXhfd29yc3RfY29tcHJl
c3MoKSBmb3IKPiBMWk8/CgpPb3BzLCBpdCBsb29rcyB0aG9zZSBsaW1pdHMgd2VyZSB3cm9uZ2x5
IHVzZWQuLi4KCiNkZWZpbmUgTFo0X0NPTVBSRVNTQk9VTkQoaXNpemUpCShcCgkodW5zaWduZWQg
aW50KShpc2l6ZSkgPiAodW5zaWduZWQgaW50KUxaNF9NQVhfSU5QVVRfU0laRSBcCgk/IDAgXAoJ
OiAoaXNpemUpICsgKChpc2l6ZSkvMjU1KSArIDE2KQoKI2RlZmluZSBsem8xeF93b3JzdF9jb21w
cmVzcyh4KSAoKHgpICsgKCh4KSAvIDE2KSArIDY0ICsgMyArIDIpCgpOZXdseSBjYWxjdWxhdGVk
IGJvdW5kYXJ5IHNpemUgaXMgbGFyZ2VyIHRoYW4gdGFyZ2V0IGJ1ZmZlciBzaXplLgoKSG93ZXZl
ciBjb21tZW50cyBvbiBMWjRfY29tcHJlc3NfZGVmYXVsdCgpIHNhaWQ6CgouLi4KICogQG1heE91
dHB1dFNpemU6IGZ1bGwgb3IgcGFydGlhbCBzaXplIG9mIGJ1ZmZlciAnZGVzdCcKICoJd2hpY2gg
bXVzdCBiZSBhbHJlYWR5IGFsbG9jYXRlZAouLi4KaW50IExaNF9jb21wcmVzc19kZWZhdWx0KGNv
bnN0IGNoYXIgKnNvdXJjZSwgY2hhciAqZGVzdCwgaW50IGlucHV0U2l6ZSwKCWludCBtYXhPdXRw
dXRTaXplLCB2b2lkICp3cmttZW0pOwoKQW5kIEBvdXRfbGVuIGluIGx6bzF4XzFfY29tcHJlc3Mo
KSB3YXMgcGFzc2VkIGFzIGFuIG91dHB1dCBwYXJhbWV0ZXIgdG8KcGFzcyBsZW5ndGggb2YgZGF0
YSB0aGF0IGNvbXByZXNzb3IgY29tcHJlc3NlZCBpbnRvIEBvdXQgYnVmZmVyLgoKTGV0IG1lIGtu
b3cgaWYgSSBtaXNzZWQgc3RoLgoKVGhhbm5rcywKCj4gQ291bGQgd2Ugc2F2ZSBtb3JlIG1lbW9y
eSBzcGFjZSBmb3IgdGhlc2UgdHdvIGNhc2VzIGxpa2UgWlNURD8KPiBBcyB5b3Uga25vdywgd2Ug
YXJlIHVzaW5nIDUgcGFnZXMgY29tcHJlc3Npb24gYnVmZmVyIGZvciBMWjQgYW5kIExaTyBpbgo+
IGNvbXByZXNzX2xvZ19zaXplPTIsCj4gYW5kIGlmIHRoZSBjb21wcmVzc2VkIGRhdGEgZG9lc24n
dCBmaXQgaW4gMyBwYWdlcywgaXQgcmV0dXJucyAtRUFHQUlOIHRvCj4gZ2l2ZSB1cCBjb21wcmVz
c2luZyB0aGF0IG9uZS4KPiAKPiBUaGFua3MsCj4gCj4gMjAyMOuFhCA17JuUIDjsnbwgKOq4iCkg
7Jik7KCEIDEwOjE3LCBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+64uY7J20IOyekeyEsToK
PiAKPj4gRHVyaW5nIHpzdGQgY29tcHJlc3Npb24sIFpTVERfZW5kU3RyZWFtKCkgbWF5IHJldHVy
biBub24temVybyB2YWx1ZQo+PiBiZWNhdXNlIGRpc3RpbmF0aW9uIGJ1ZmZlciBpcyBmdWxsLCBi
dXQgdGhlcmUgaXMgc3RpbGwgY29tcHJlc3NlZCBkYXRhCj4+IHJlbWFpbmVkIGluIGludGVybWVk
aWF0ZSBidWZmZXIsIGl0IG1lYW5zIHRoYXQgenN0ZCBhbGdvcml0aG0gY2FuIG5vdAo+PiBzYXZl
IGF0IGxhc3Qgb25lIGJsb2NrIHNwYWNlLCBsZXQncyBqdXN0IHdyaXRlYmFjayByYXcgZGF0YSBp
bnN0ZWFkIG9mCj4+IGNvbXByZXNzZWQgb25lLCB0aGlzIGNhbiBmaXggZGF0YSBjb3JydXB0aW9u
IHdoZW4gZGVjb21wcmVzc2luZwo+PiBpbmNvbXBsZXRlIHN0b3JlZCBjb21wcmVzc2lvbiBkYXRh
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29t
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+Cj4+IC0tLQo+
PiAgZnMvZjJmcy9jb21wcmVzcy5jIHwgNyArKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9m
MmZzL2NvbXByZXNzLmMKPj4gaW5kZXggYzIyY2MwZDM3MzY5Li41ZTQ5NDcyNTAyNjIgMTAwNjQ0
Cj4+IC0tLSBhL2ZzL2YyZnMvY29tcHJlc3MuYwo+PiArKysgYi9mcy9mMmZzL2NvbXByZXNzLmMK
Pj4gQEAgLTM1OCw2ICszNTgsMTMgQEAgc3RhdGljIGludCB6c3RkX2NvbXByZXNzX3BhZ2VzKHN0
cnVjdCBjb21wcmVzc19jdHgKPj4gKmNjKQo+PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU87
Cj4+ICAgICAgICAgfQo+Pgo+PiArICAgICAgIC8qCj4+ICsgICAgICAgICogdGhlcmUgaXMgY29t
cHJlc3NlZCBkYXRhIHJlbWFpbmVkIGluIGludGVybWVkaWF0ZSBidWZmZXIgZHVlIHRvCj4+ICsg
ICAgICAgICogbm8gbW9yZSBzcGFjZSBpbiBjYnVmLmNkYXRhCj4+ICsgICAgICAgICovCj4+ICsg
ICAgICAgaWYgKHJldCkKPj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUFHQUlOOwo+PiArCj4+
ICAgICAgICAgY2MtPmNsZW4gPSBvdXRidWYucG9zOwo+PiAgICAgICAgIHJldHVybiAwOwo+PiAg
fQo+PiAtLQo+PiAyLjE4LjAucmMxCj4+Cj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
Cj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+IGh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPj4KPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
