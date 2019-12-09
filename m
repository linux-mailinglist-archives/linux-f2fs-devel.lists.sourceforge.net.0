Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBCF116B59
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 11:46:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieGYu-0003Zg-VW; Mon, 09 Dec 2019 10:46:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ieGYt-0003ZF-Hl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 10:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KuXcOmi3wiRIJZ07UvP/j3jwxDFHLkFb6RZpc+tV1wM=; b=VelOZyFJlt2diCaOCK4YWJZVJs
 gXZUBSEalbXm6M9GurVyMWsKhMtkn1mMRx8G6nTxyXYKrgMkSybNDss2h2YbAJpyvUJG5c+ZKmzIK
 nvy+4cOPJsMONsR6zvP4cmC7n7fZWEOHdUiPIOh1PMRzbrnoM8aipqsQKkQtF12qb710=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KuXcOmi3wiRIJZ07UvP/j3jwxDFHLkFb6RZpc+tV1wM=; b=kzIMrWMFAyZCsL8wLCYZbN+d08
 MrYBKVS3r1ZrdMCWuyRpuRtl82PvojnXoRwg1RHa57mAhMe6eD2WO4XfU4KhUaGeLbBHKHFA8ygec
 JhfnRakm99ncMOvEQ1EEj7nVaDpJeKXF1msPatHY+bFfwFZRMr6il9ufIAcqGHT7IL+E=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieGYr-00F2gc-Au
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 10:46:43 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 85FBF78624F5C19E9F79;
 Mon,  9 Dec 2019 18:46:32 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 9 Dec 2019
 18:46:28 +0800
To: Gao Xiang <hsiangkao@aol.com>, Hongwei Qin <glqinhongwei@gmail.com>
References: <tencent_0B38BD6C2739091DE8A052D6D772D1DEAA06@qq.com>
 <4ef45a4b-47fa-4d7e-a060-4cad56ca372a@kernel.org>
 <CAKvRR0QoH2RAEzb9ki8GVUX22omST-Z2kq287i0fXmYXC7XCLw@mail.gmail.com>
 <20191208135117.GA12771@hsiangkao-HP-ZHAN-66-Pro-G1>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <11aeed7b-24e2-61ba-fddc-6684aac2b152@huawei.com>
Date: Mon, 9 Dec 2019 18:46:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191208135117.GA12771@hsiangkao-HP-ZHAN-66-Pro-G1>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ieGYr-00F2gc-Au
Subject: Re: [f2fs-dev] Potential data corruption?
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
Cc: linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAxOS8xMi84IDIxOjUxLCBHYW8gWGlhbmcgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6
Cj4gSGksCj4gCj4gT24gU3VuLCBEZWMgMDgsIDIwMTkgYXQgMDk6MTU6NTVQTSArMDgwMCwgSG9u
Z3dlaSBRaW4gd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiBTdW4sIERlYyA4LCAyMDE5IGF0IDEyOjAx
IFBNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pgo+Pj4gSGVsbG8sCj4+Pgo+
Pj4gT24gMjAxOS0xMi03IDE4OjEwLCDvv73vv73vv73Vte+/ve+/ve+/ve+/ve+/ve+/ve+/vSB3
cm90ZToKPj4+PiBIaSBGMkZTIGV4cGVydHMsCj4+Pj4gVGhlIGZvbGxvd2luZyBjb25mdXNlcyBt
ZToKPj4+Pgo+Pj4+IEEgdHlwaWNhbCBmc3luYygpIGdvZXMgbGlrZSB0aGlzOgo+Pj4+IDEpIElz
c3VlIGRhdGEgYmxvY2sgSU9zCj4+Pj4gMikgV2FpdCBmb3IgY29tcGxldGlvbgo+Pj4+IDMpIElz
c3VlIGNoYWluZWQgbm9kZSBibG9jayBJT3MKPj4+PiA0KSBXYWl0IGZvciBjb21wbGV0aW9uCj4+
Pj4gNSkgSXNzdWUgZmx1c2ggY29tbWFuZAo+Pj4+Cj4+Pj4gSW4gb3JkZXIgdG8gcHJlc2VydmUg
ZGF0YSBjb25zaXN0ZW5jeSB1bmRlciBzdWRkZW4gcG93ZXIgZmFpbHVyZSwgaXQgcmVxdWlyZXMg
dGhhdCB0aGUgc3RvcmFnZSBkZXZpY2UgcGVyc2lzdHMgZGF0YSBibG9ja3MgcHJpb3IgdG8gbm9k
ZSBibG9ja3MuCj4+Pj4gT3RoZXJ3aXNlLCB1bmRlciBzdWRkZW4gcG93ZXIgZmFpbHVyZSwgaXQn
cyBwb3NzaWJsZSB0aGF0IHRoZSBwZXJzaXN0ZWQgbm9kZSBibG9jayBwb2ludHMgdG8gTlVMTCBk
YXRhIGJsb2Nrcy4KPj4+Cj4+PiBGaXJzdGx5IGl0IGRvZXNuJ3QgYnJlYWsgUE9TSVggc2VtYW50
aWNzLCByaWdodD8gc2luY2UgZnN5bmMoKSBkaWRuJ3QgcmV0dXJuCj4+PiBzdWNjZXNzZnVsbHkg
YmVmb3JlIHN1ZGRlbiBwb3dlci1jdXQsIHNvIHdlIGNhbiBub3QgZ3VhcmFudGVlIHRoYXQgZGF0
YSBpcyBmdWxseQo+Pj4gcGVyc2lzdGVkIGluIHN1Y2ggY29uZGl0aW9uLgo+Pj4KPj4+IEhvd2V2
ZXIsIHdoYXQgeW91IHdhbnQgbG9va3MgbGlrZSBhdG9taWMgd3JpdGUgc2VtYW50aWNzLCB3aGlj
aCBtb3N0bHkgZGF0YWJhc2UKPj4+IHdhbnQgdG8gZ3VhcmFudGVlIGR1cmluZyBkYiBmaWxlIHVw
ZGF0ZS4KPj4+Cj4+PiBGMkZTIGhhcyBzdXBwb3J0IGF0b21pY193cml0ZSB2aWEgaW9jdGwsIHdo
aWNoIGlzIHVzZWQgYnkgU1FMaXRlIG9mZmljaWFsbHksIEkKPj4+IGd1ZXNzIHlvdSBjYW4gY2hl
Y2sgaXRzIGltcGxlbWVudGF0aW9uIGRldGFpbC4KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pgo+PiBU
aGFua3MgZm9yIHlvdXIga2luZCByZXBseS4KPj4gSXQncyB0cnVlIHRoYXQgaWYgd2UgbWVldCBw
b3dlciBmYWlsdXJlIGJlZm9yZSBmc3luYygpIGNvbXBsZXRlcywKPj4gUE9TSVggZG9lbid0IHJl
cXVpcmUgRlMgdG8gcmVjb3ZlciB0aGUgZmlsZS4gSG93ZXZlciwgY29uc2lkZXIgdGhlCj4+IGZv
bGxvd2luZyBzaXR1YXRpb246Cj4+Cj4+IDEpIERhdGEgYmxvY2sgSU9zIChOb3QgcGVyc2lzdGVk
KQo+PiAyKSBOb2RlIGJsb2NrIElPcyAoQWxsIFBlcnNpc3RlZCkKPj4gMykgUG93ZXIgZmFpbHVy
ZQo+Pgo+PiBTaW5jZSB0aGUgbm9kZSBibG9ja3MgYXJlIGFsbCBwZXJzaXN0ZWQgYmVmb3JlIHBv
d2VyIGZhaWx1cmUsIHRoZSBub2RlCj4+IGNoYWluIGlzbid0IGJyb2tlbi4gTm90ZSB0aGF0IHRo
aXMgZmlsZSdzIG5ldyBkYXRhIGlzIG5vdCBwcm9wZXJseQo+PiBwZXJzaXN0ZWQgYmVmb3JlIGNy
YXNoLiBTbyB0aGUgcmVjb3ZlcnkgcHJvY2VzcyBzaG91bGQgYmUgYWJsZSB0bwo+PiByZWNvZ25p
emUgdGhpcyBzaXR1YXRpb24gYW5kIGF2b2lkIHJlY292ZXIgdGhpcyBmaWxlLiBIb3dldmVyLCBz
aW5jZQo+PiB0aGUgbm9kZSBjaGFpbiBpcyBub3QgYnJva2VuLCBwZXJoYXBzIHRoZSByZWNvdmVy
eSBwcm9jZXNzIHdpbGwgcmVnYXJkCj4+IHRoaXMgZmlsZSBhcyByZWNvdmVyYWJsZT8KPiAKPiBB
cyBteSBvd24gbGltaXRlZCB1bmRlcnN0YW5kaW5nLCBJJ20gYWZyYWlkIGl0IHNlZW1zIHRydWUg
Zm9yIGV4dHJlbWUgY2FzZS4KPiBXaXRob3V0IHByb3BlciBGTFVTSCBjb21tYW5kLCBuZXdlciBu
b2RlcyBjb3VsZCBiZSByZWNvdmVyZWQgYnV0IG5vIG5ld2VyCj4gZGF0YSBwZXJzaXN0ZWQuCj4g
Cj4gU28gaWYgZnN5bmMoKSBpcyBub3Qgc3VjY2Vzc2Z1bCwgdGhlIG9sZCBkYXRhIHNob3VsZCBi
ZSByZWFkZWQKPiBidXQgZm9yIHRoaXMgY2FzZSwgdW5leHBlY3RlZCBkYXRhIChub3QgQSBvciBB
JywgY291bGQgYmUgcmFuZG9tIGRhdGEKPiBDKSB3aWxsIGJlIGNvbnNpZGVyZWQgdmFsaWRseSBz
aW5jZSBpdHMgbm9kZSBpcyBvay4KPiAKPiBJdCBzZWVtcyBpdCBzaG91bGQgRkxVU0ggZGF0YSBi
ZWZvcmUgdGhlIHJlbGF0ZWQgbm9kZSBjaGFpbiB3cml0dGVuIG9yCj4gaW50cm9kdWNlIHNvbWUg
ZGF0YSBjaGVja3N1bSB0aG91Z2guCj4gCj4gSWYgSSBhbSB3cm9uZywga2luZGx5IGNvcnJlY3Qg
bWUuLi4KClllcywgSSBndWVzcyBpZiB1c2VyIHdhbnRzIG1vcmUgY29uc2lzdGVuY2UgZ3VhcmFu
dGVlIG9mIGZzeW5jKCkgdGhhbiBwb3NpeCBvbmUsCndlIGNhbiByZWZhY3RvciBmc3luY19tb2Rl
PXN0cmljdCBtb2RlIGEgYml0IHRvIGhhbmRsZSBmc3luYygpIElPcyBsaWtlIHdlIGRpZApmb3Ig
YXRvbWljIHdyaXRlIElPcyB0byBrZWVwIHN0cmljdCBkYXRhL25vZGUgSU8gb3JkZXIuIEJ1dCBu
b3RlIHRoYXQgc3VjaApjb25zaXN0ZW5jZSBndWFyYW50ZWUgaXMgd2VhaywgYWZ0ZXIgc3VkZGVu
IHBvd2VyLWN1dCwgcmVjb3ZlcmVkIGZpbGUgbWF5CmNvbnRhaW4gbWl4ZWQgb2xkIGFuZCBuZXcg
ZGF0YSAoZnN5bmNlZCBkYXRhIHBhcnRpYWxseSBwZXJzaXN0ZWQpIHdoaWNoIG1heSBhbHNvCmNy
YXNoIHRoZSBBcHBzLgoKVGhhbmtzLAoKPiAKPiBUaGFua3MsCj4gR2FvIFhpYW5nCj4gCj4gCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
