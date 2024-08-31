Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D01C7966E72
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Aug 2024 03:45:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1skDBG-0003E4-TR;
	Sat, 31 Aug 2024 01:45:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1skDBE-0003Dv-MQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 Aug 2024 01:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z3+NurFB4VxivyWSU0JhR2tbVNh99HWv/eKvXIQY8DU=; b=eGTI8BThYfMBOX5tUnt7+H0gMP
 SbD91g28wzVen4w32+yJLy2SlBXW5v1CRgavq5eHLdc2hwlOYLpB1NrDLcKZIDmZlBEswDbFETL+8
 LyYzSMK0jSFJLR9m/BXog/doEyTCrWDmUMU34CWdFrj1W2ovpmzDoe+0cGAX0WlFCG+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z3+NurFB4VxivyWSU0JhR2tbVNh99HWv/eKvXIQY8DU=; b=EV++vP83+K8F+qMkqVEH9l6xzW
 JTkM6e7fsa5OUxuHMcUzrukhwnEJUnUggRARG/RhRoFCu5UO5yJCLk41fEqqqyeW3SOyf/ySSnlss
 fV9QnC9ggpVe8E/BFzBFC1UZdjN6zs2am1A1sf8yYfbMvhDk/kLBT5xeauSMvjFBtBdY=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1skDBC-0004fu-VU for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 Aug 2024 01:45:32 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Wwd4s3FldzQrFN;
 Sat, 31 Aug 2024 09:40:29 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
 by mail.maildlp.com (Postfix) with ESMTPS id 2870614011B;
 Sat, 31 Aug 2024 09:45:22 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 31 Aug 2024 09:45:21 +0800
Message-ID: <05de6982-0f52-437b-815f-e77bd4178691@huawei.com>
Date: Sat, 31 Aug 2024 09:45:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Eric Sandeen <sandeen@sandeen.net>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <20240814023912.3959299-1-lihongbo22@huawei.com>
 <6c1baa6e-5f71-418f-a7fc-27c798e51498@huawei.com>
 <5c194e3e-6dc9-41a2-b967-13fc1177b2f4@sandeen.net>
In-Reply-To: <5c194e3e-6dc9-41a2-b967-13fc1177b2f4@sandeen.net>
X-Originating-IP: [10.67.111.104]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/31 1:07, Eric Sandeen wrote: > Just FWIW - > > I
 had missed this thread when I got temporarily unsubscribed from fsdevel.
 > I have a series that I was hacking on for this same work, at > htt [...]
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.189 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.189 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.189 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1skDBC-0004fu-VU
Subject: Re: [f2fs-dev] [PATCH 0/9] f2fs: new mount API conversion
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
From: Hongbo Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hongbo Li <lihongbo22@huawei.com>
Cc: linux-fsdevel@vger.kernel.org, lczerner@redhat.com, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAyMDI0LzgvMzEgMTowNywgRXJpYyBTYW5kZWVuIHdyb3RlOgo+IEp1c3QgRldJVyAtCj4g
Cj4gSSBoYWQgbWlzc2VkIHRoaXMgdGhyZWFkIHdoZW4gSSBnb3QgdGVtcG9yYXJpbHkgdW5zdWJz
Y3JpYmVkIGZyb20gZnNkZXZlbC4KPiBJIGhhdmUgYSBzZXJpZXMgdGhhdCBJIHdhcyBoYWNraW5n
IG9uIGZvciB0aGlzIHNhbWUgd29yaywgYXQKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9zYW5kZWVuL2xpbnV4LmdpdC9jb21taXQvP2g9ZjJmcy1tb3Vu
dC1hcGkKPiBidXQgaXQncyB2ZXJ5IHJvdWdoIGFuZCBhbG1vc3QgY2VydGFpbmx5IGNvbnRhaW5z
IGJ1Z3MuIEl0IG1heSBvciBtYXkgbm90Cj4gYmUgb2YgYW55IGhlbHAgdG8geW91LCBidXQganVz
dCBGWUkuCj4gCj4gSSdsbCB0cnkgdG8gaGVscCByZXZpZXcvdGVzdCB5b3VyIHNlcmllcyBzaW5j
ZSBJIHRyaWVkIHRvIHNvbHZlIHRoaXMgYXMKPiB3ZWxsLCBidXQgSSBuZXZlciBjb21wbGV0ZWQg
dGhlIHdvcmsuIDopCgpUaGF0IHdpbGwgYmUgZ3JlYXQhIFRoYW5rIHlvdSB2ZXJ5IG11Y2ghClRo
ZXJlIGlzIHN0aWxsIGEgbG90IG9mIHJlZmFjdG9yaW5nIHRoYXQgY2FuIGJlIGRvbmUuIEF0IHRo
ZSB0aW1lLCB0aGUgCmNvbnNpZGVyYXRpb24gd2FzIHRvIG1ha2UgdGhlIHNtYWxsZXN0IHBvc3Np
YmxlIGNoYW5nZXMsIHNvIG1hbnkgcGxhY2VzIAp3ZXJlIGVzc2VudGlhbGx5IHByZXNlcnZlZC4g
V2UgY2FuIHdvcmsgdG9nZXRoZXIgdG8gbWFrZSB0aGlzIGJldHRlci4KClRoYW5rcywKSG9uZ2Jv
Cgo+IAo+IFRoYW5rcywKPiAtRXJpYwo+IAo+IE9uIDgvMjcvMjQgNjo0NyBBTSwgSG9uZ2JvIExp
IHdyb3RlOgo+PiBEb2VzIHRoZXJlIGV4aXN0IENJIHRlc3QgZm9yIGYyZnM/IEkgY2FuIG9ubHkg
d3JpdGUgdGhlIG1vdW50IHRlc3QgZm9yIGYyZnMgcmVmZXIgdG8gdGVzdHMvZXh0NC8wNTMuIEFu
ZCBJIGhhdmUgdGVzdGVkIHRoaXMgaW4gbG9jYWwuCj4+Cj4+IFRoYW5rcywKPj4gSG9uZ2JvCj4+
Cj4+IE9uIDIwMjQvOC8xNCAxMDozOSwgSG9uZ2JvIExpIHdyb3RlOgo+Pj4gU2luY2UgbWFueSBm
aWxlc3lzdGVtcyBoYXZlIGRvbmUgdGhlIG5ldyBtb3VudCBBUEkgY29udmVyc2lvbiwKPj4+IHdl
IGludHJvZHVjZSB0aGUgbmV3IG1vdW50IEFQSSBjb252ZXJzaW9uIGluIGYyZnMuCj4+Pgo+Pj4g
VGhlIHNlcmllcyBjYW4gYmUgYXBwbGllZCBvbiB0b3Agb2YgdGhlIGN1cnJlbnQgbWFpbmxpbmUg
dHJlZQo+Pj4gYW5kIHRoZSB3b3JrIGlzIGJhc2VkIG9uIHRoZSBwYXRjaGVzIGZyb20gTHVrYXMg
Q3plcm5lciAoaGFzCj4+PiBkb25lIHRoaXMgaW4gZXh0NFsxXSkuIEhpcyBwYXRjaCBnaXZlIG1l
IGEgbG90IG9mIGlkZWFzLgo+Pj4KPj4+IEhlcmUgaXMgYSBoaWdoIGxldmVsIGRlc2NyaXB0aW9u
IG9mIHRoZSBwYXRjaHNldDoKPj4+Cj4+PiAxLiBQcmVwYXJlIHRoZSBmMmZzIG1vdW50IHBhcmFt
ZXRlcnMgcmVxdWlyZWQgYnkgdGhlIG5ldyBtb3VudAo+Pj4gQVBJIGFuZCB1c2UgaXQgZm9yIHBh
cnNpbmcsIHdoaWxlIHN0aWxsIHVzaW5nIHRoZSBvbGQgQVBJIHRvCj4+PiBnZXQgbW91bnQgb3B0
aW9ucyBzdHJpbmcuIFNwbGl0IHRoZSBwYXJhbWV0ZXIgcGFyc2luZyBhbmQKPj4+IHZhbGlkYXRp
b24gb2YgdGhlIHBhcnNlX29wdGlvbnMgaGVscGVyIGludG8gdHdvIHNlcGFyYXRlCj4+PiBoZWxw
ZXJzLgo+Pj4KPj4+ICDCoMKgIGYyZnM6IEFkZCBmcyBwYXJhbWV0ZXIgc3BlY2lmaWNhdGlvbnMg
Zm9yIG1vdW50IG9wdGlvbnMKPj4+ICDCoMKgIGYyZnM6IG1vdmUgdGhlIG9wdGlvbiBwYXJzZXIg
aW50byBoYW5kbGVfbW91bnRfb3B0Cj4+PiAgwqDCoCBmMmZzOiBtb3ZlIG9wdGlvbiB2YWxpZGF0
aW9uIGludG8gYSBzZXBhcmF0ZSBoZWxwZXIKPj4+Cj4+PiAyLiBSZW1vdmUgdGhlIHVzZSBvZiBz
Yi9zYmkgc3RydWN0dXJlIG9mIGYyZnMgZnJvbSBhbGwgdGhlCj4+PiBwYXJzaW5nIGNvZGUsIGJl
Y2F1c2Ugd2l0aCB0aGUgbmV3IG1vdW50IEFQSSB0aGUgcGFyc2luZyBpcwo+Pj4gZ29pbmcgdG8g
YmUgZG9uZSBiZWZvcmUgd2UgZXZlbiBnZXQgdGhlIHN1cGVyIGJsb2NrLiBJbiB0aGlzCj4+PiBw
YXJ0LCB3ZSBpbnRyb2R1Y2UgZjJmc19mc19jb250ZXh0IHRvIGhvbGQgdGhlIHRlbXBvcmFyeQo+
Pj4gb3B0aW9ucyB3aGVuIHBhcnNpbmcuIEZvciB0aGUgc2ltcGxlIG9wdGlvbnMgY2hlY2ssIGl0
IGhhcwo+Pj4gdG8gYmUgZG9uZSBkdXJpbmcgcGFyc2luZyBieSB1c2luZyBmMmZzX2ZzX2NvbnRl
eHQgc3RydWN0dXJlLgo+Pj4gRm9yIHRoZSBjaGVjayB3aGljaCBuZWVkcyBzYi9zYmksIHdlIGRv
IHRoaXMgZHVyaW5nIHN1cGVyCj4+PiBibG9jayBmaWxsaW5nLgo+Pj4KPj4+ICDCoMKgIGYyZnM6
IEFsbG93IHNiaSB0byBiZSBOVUxMIGluIGYyZnNfcHJpbnRrCj4+PiAgwqDCoCBmMmZzOiBBZGQg
ZjJmc19mc19jb250ZXh0IHRvIHJlY29yZCB0aGUgbW91bnQgb3B0aW9ucwo+Pj4gIMKgwqAgZjJm
czogc2VwYXJhdGUgdGhlIG9wdGlvbnMgcGFyc2luZyBhbmQgb3B0aW9ucyBjaGVja2luZwo+Pj4K
Pj4+IDMuIFN3aXRjaCB0aGUgZjJmcyB0byB1c2UgdGhlIG5ldyBtb3VudCBBUEkgZm9yIG1vdW50
IGFuZAo+Pj4gcmVtb3VudC4KPj4+Cj4+PiAgwqDCoCBmMmZzOiBpbnRyb2R1Y2UgZnNfY29udGV4
dF9vcGVyYXRpb24gc3RydWN0dXJlCj4+PiAgwqDCoCBmMmZzOiBzd2l0Y2ggdG8gdGhlIG5ldyBt
b3VudCBhcGkKPj4+Cj4+PiA0LiBDbGVhbnVwIHRoZSBvbGQgdW51c2VkIHN0cnVjdHVyZXMgYW5k
IGhlbHBlcnMuCj4+Pgo+Pj4gIMKgwqAgZjJmczogcmVtb3ZlIHVudXNlZCBzdHJ1Y3R1cmUgYW5k
IGZ1bmN0aW9ucwo+Pj4KPj4+IFRoZXJlIGlzIHN0aWxsIGEgcG90ZW50aWFsIHRvIGRvIHNvbWUg
Y2xlYW51cHMgYW5kIHBlcmhhcHMKPj4+IHJlZmFjdG9yaW5nLiBIb3dldmVyIHRoYXQgY2FuIGJl
IGRvbmUgbGF0ZXIgYWZ0ZXIgdGhlIGNvbnZlcnNpb24KPj4+IHRvIHRoZSBuZXcgbW91bnQgQVBJ
IHdoaWNoIGlzIHRoZSBtYWluIHB1cnBvc2Ugb2YgdGhlIHBhdGNoc2V0Lgo+Pj4KPj4+IFsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMTEwMjExMTQ1MDguMjE0MDctMS1sY3plcm5l
ckByZWRoYXQuY29tLwo+Pj4KPj4+IEhvbmdibyBMaSAoOSk6Cj4+PiAgwqDCoCBmMmZzOiBBZGQg
ZnMgcGFyYW1ldGVyIHNwZWNpZmljYXRpb25zIGZvciBtb3VudCBvcHRpb25zCj4+PiAgwqDCoCBm
MmZzOiBtb3ZlIHRoZSBvcHRpb24gcGFyc2VyIGludG8gaGFuZGxlX21vdW50X29wdAo+Pj4gIMKg
wqAgZjJmczogbW92ZSBvcHRpb24gdmFsaWRhdGlvbiBpbnRvIGEgc2VwYXJhdGUgaGVscGVyCj4+
PiAgwqDCoCBmMmZzOiBBbGxvdyBzYmkgdG8gYmUgTlVMTCBpbiBmMmZzX3ByaW50awo+Pj4gIMKg
wqAgZjJmczogQWRkIGYyZnNfZnNfY29udGV4dCB0byByZWNvcmQgdGhlIG1vdW50IG9wdGlvbnMK
Pj4+ICDCoMKgIGYyZnM6IHNlcGFyYXRlIHRoZSBvcHRpb25zIHBhcnNpbmcgYW5kIG9wdGlvbnMg
Y2hlY2tpbmcKPj4+ICDCoMKgIGYyZnM6IGludHJvZHVjZSBmc19jb250ZXh0X29wZXJhdGlvbiBz
dHJ1Y3R1cmUKPj4+ICDCoMKgIGYyZnM6IHN3aXRjaCB0byB0aGUgbmV3IG1vdW50IGFwaQo+Pj4g
IMKgwqAgZjJmczogcmVtb3ZlIHVudXNlZCBzdHJ1Y3R1cmUgYW5kIGZ1bmN0aW9ucwo+Pj4KPj4+
ICDCoCBmcy9mMmZzL3N1cGVyLmMgfCAyMjExICsrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0tCj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDEzNDEgaW5zZXJ0aW9u
cygrKSwgODcwIGRlbGV0aW9ucygtKQo+Pj4KPj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
