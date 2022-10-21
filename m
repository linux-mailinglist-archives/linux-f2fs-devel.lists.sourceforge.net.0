Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A88E607216
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 10:25:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olnKy-0006ij-G5;
	Fri, 21 Oct 2022 08:25:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyingliang@huawei.com>) id 1olnKw-0006id-LV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 08:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4tpxnqik1XAnrGlJyGCwUtdkI9g+xhisCqPaAlOGh3M=; b=AG5m9J63HKbxNzdCdefw4vvpQl
 s980i5yedN0jhHsDz88Ze8kADVdhe3wKSIFw1+bjbnnx2ZiMDjnZ5zvOsI4bXryKC5AFJGlGaCIE9
 4573FkTPkkiswbj3FuSkzN9ASrdKsHO8cuIJIQNhmjQapER+loq2mFopIKp/6dmZoG78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4tpxnqik1XAnrGlJyGCwUtdkI9g+xhisCqPaAlOGh3M=; b=febCftTlyWEHqm6SBBc3yphw6L
 0s6M/ht5vyGU7sv4B2IBOQLWTX33Rgooxs8JAseHWGX64tfjpKJRMWr+0tEuGhfeeLgUNjSmWMxwA
 2etI2F2hrfSgHOfhO+SLsSx69PovTPLBgesGn6+AnMwJ3/0eTiVBrHHNRgS0RhZ53KFo=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olnKs-00C2x9-PK for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 08:25:02 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mty7v25HnzVj06;
 Fri, 21 Oct 2022 16:20:11 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 16:24:25 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 16:24:24 +0800
To: Greg KH <gregkh@linuxfoundation.org>, Luben Tuikov <luben.tuikov@amd.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com> <Y1IwLOUGayjT9p6d@kroah.com>
Message-ID: <0591e66f-731a-5f81-fc9d-3a6d80516c65@huawei.com>
Date: Fri, 21 Oct 2022 16:24:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y1IwLOUGayjT9p6d@kroah.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/21 13:37, Greg KH wrote: > On Fri, Oct 21, 2022
 at 01:29:31AM -0400, Luben Tuikov wrote: >> On 2022-10-20 22:20, Yang Yingliang
 wrote: >>> The previous discussion link: >>> https://lore.ker [...] 
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1olnKs-00C2x9-PK
Subject: Re: [f2fs-dev] [PATCH 00/11] fix memory leak while kset_register()
 fails
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
From: Yang Yingliang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yang Yingliang <yangyingliang@huawei.com>
Cc: rafael@kernel.org, qemu-devel@nongnu.org, richard@nod.at, somlo@cmu.edu,
 mst@redhat.com, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-f2fs-devel@lists.sourceforge.net, liushixin2@huawei.com,
 joseph.qi@linux.alibaba.com, linux-mtd@lists.infradead.org, jlbec@evilplan.org,
 hsiangkao@linux.alibaba.com, alexander.deucher@amd.com, jaegeuk@kernel.org,
 akpm@linux-foundation.org, linux-erofs@lists.ozlabs.org, mark@fasheh.com,
 ocfs2-devel@oss.oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDIwMjIvMTAvMjEgMTM6MzcsIEdyZWcgS0ggd3JvdGU6Cj4gT24gRnJpLCBPY3QgMjEsIDIw
MjIgYXQgMDE6Mjk6MzFBTSAtMDQwMCwgTHViZW4gVHVpa292IHdyb3RlOgo+PiBPbiAyMDIyLTEw
LTIwIDIyOjIwLCBZYW5nIFlpbmdsaWFuZyB3cm90ZToKPj4+IFRoZSBwcmV2aW91cyBkaXNjdXNz
aW9uIGxpbms6Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzBkYjQ4NmViLTY5Mjct
OTI3ZS0zNjI5LTk1OGY4ZjIxMTE5NEBodWF3ZWkuY29tL1QvCj4+IFRoZSB2ZXJ5IGZpcnN0IGRp
c2N1c3Npb24gb24gdGhpcyB3YXMgaGVyZToKPj4KPj4gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQv
bGlzdHMvZHJpLWRldmVsL21zZzM2ODA3Ny5odG1sCj4+Cj4+IFBsZWFzZSB1c2UgdGhpcyBsaW5r
LCBhbmQgbm90IHRoZSB0aGF0IG9uZSB1cCB0aGVyZSB5b3Ugd2hpY2ggcXVvdGVkIGFib3ZlLAo+
PiBhbmQgd2hvc2UgY29tbWl0IGRlc2NyaXB0aW9uIGlzIHRha2VuIHZlcmJhdGltIGZyb20gdGhl
IHRoaXMgbGluay4KPj4KPj4+IGtzZXRfcmVnaXN0ZXIoKSBpcyBjdXJyZW50bHkgdXNlZCBpbiBz
b21lIHBsYWNlcyB3aXRob3V0IGNhbGxpbmcKPj4+IGtzZXRfcHV0KCkgaW4gZXJyb3IgcGF0aCwg
YmVjYXVzZSB0aGUgY2FsbGVycyB0aGluayBpdCBzaG91bGQgYmUKPj4+IGtzZXQgaW50ZXJuYWwg
dGhpbmcgdG8gZG8sIGJ1dCB0aGUgZHJpdmVyIGNvcmUgY2FuIG5vdCBrbm93IHdoYXQKPj4+IGNh
bGxlciBkb2luZyB3aXRoIHRoYXQgbWVtb3J5IGF0IHRpbWVzLiBUaGUgbWVtb3J5IGNvdWxkIGJl
IGZyZWVkCj4+PiBib3RoIGluIGtzZXRfcHV0KCkgYW5kIGVycm9yIHBhdGggb2YgY2FsbGVyLCBp
ZiBpdCBpcyBjYWxsZWQgaW4KPj4+IGtzZXRfcmVnaXN0ZXIoKS4KPj4gQXMgSSBleHBsYWluZWQg
aW4gdGhlIGxpbmsgYWJvdmUsIHRoZSByZWFzb24gdGhlcmUncwo+PiBhIG1lbW9yeSBsZWFrIGlz
IHRoYXQgb25lIGNhbm5vdCBjYWxsIGtzZXRfcmVnaXN0ZXIoKSB3aXRob3V0Cj4+IHRoZSBrc2V0
LT5rb2JqLm5hbWUgYmVpbmcgc2V0LS1rb2JqX2FkZF9pbnRlcm5hbCgpIHJldHVybnMgLUVJTlZB
TCwKPj4gaW4gdGhpcyBjYXNlLCBpLmUuIGtzZXRfcmVnaXN0ZXIoKSBmYWlscyB3aXRoIC1FSU5W
QUwuCj4+Cj4+IFRodXMsIHRoZSBtb3N0IGNvbW1vbiB1c2FnZSBpcyBzb21ldGhpbmcgbGlrZSB0
aGlzOgo+Pgo+PiAJa29ial9zZXRfbmFtZSgma3NldC0+a29iaiwgZm9ybWF0LCAuLi4pOwo+PiAJ
a3NldC0+a29iai5rc2V0ID0gcGFyZW50X2tzZXQ7Cj4+IAlrc2V0LT5rb2JqLmt0eXBlID0ga3R5
cGU7Cj4+IAlyZXMgPSBrc2V0X3JlZ2lzdGVyKGtzZXQpOwo+Pgo+PiBTbywgd2hhdCBpcyBiZWlu
ZyBsZWFrZWQsIGlzIHRoZSBtZW1vcnkgYWxsb2NhdGVkIGluIGtvYmpfc2V0X25hbWUoKSwKPj4g
YnkgdGhlIGNvbW1vbiBpZGlvbSBzaG93biBhYm92ZS4gVGhpcyBuZWVkcyB0byBiZSBtZW50aW9u
ZWQgaW4KPj4gdGhlIGRvY3VtZW50YXRpb24sIGF0IGxlYXN0LCBpbiBjYXNlLCBpbiB0aGUgZnV0
dXJlIHRoaXMgaXMgYWJzb2x2ZWQKPj4gaW4ga3NldF9yZWdpc3RlcigpIHJlZGVzaWduLCBldGMu
Cj4gQmFzZWQgb24gdGhpcywgY2FuIGtzZXRfcmVnaXN0ZXIoKSBqdXN0IGNsZWFuIHVwIGZyb20g
aXRzZWxmIHdoZW4gYW4KPiBlcnJvciBoYXBwZW5zPyAgSWRlYWxseSB0aGF0IHdvdWxkIGJlIHRo
ZSBjYXNlLCBhcyB0aGUgb2RkcyBvZiBhIGtzZXQKPiBiZWluZyBlbWJlZGRlZCBpbiBhIGxhcmdl
ciBzdHJ1Y3R1cmUgaXMgcHJvYmFibHkgc2xpbSwgYnV0IHdlIHdvdWxkIGhhdmUKPiB0byBzZWFy
Y2ggdGhlIHRyZWUgdG8gbWFrZSBzdXJlLgpJIGhhdmUgc2VhcmNoIHRoZSB3aG9sZSB0cmVlLCB0
aGUga3NldCB1c2VkIGluIGJ1c19yZWdpc3RlcigpIC0gcGF0Y2ggCiMzLCBrc2V0X2NyZWF0ZV9h
bmRfYWRkKCkgLSBwYXRjaCAjNApfX2NsYXNzX3JlZ2lzdGVyKCkgLSBwYXRjaCAjNSzCoCBmd19j
ZmdfYnVpbGRfc3ltbGluaygpIC0gcGF0Y2ggIzYgYW5kIAphbWRncHVfZGlzY292ZXJ5LmMgLSBw
YXRjaCAjMTAKaXMgZW1iZWRkZWQgaW4gYSBsYXJnZXIgc3RydWN0dXJlLiBJbiB0aGVzZSBjYXNl
cywgd2UgY2FuIG5vdCBjYWxsIAprc2V0X3B1dCgpIGluIGVycm9yIHBhdGggaW4ga3NldF9yZWdp
c3RlcigpCml0c2VsZi4KClRoYW5rcywKWWFuZwo+Cj4gdGhhbmtzLAo+Cj4gZ3JlZyBrLWgKPiAu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
