Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8586073A2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 11:13:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olo5a-0003Si-Do;
	Fri, 21 Oct 2022 09:13:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyingliang@huawei.com>) id 1olo5W-0003Ry-Gi
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 09:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mVjxaa9G9RxQE0jI1jk9dCyMzXIJAlT2XTMFYUT9Et4=; b=ip0YRvcj2jMln8TvNRkrY9LY6E
 ad7YO/XYCA9NQcQBc70C/sXdPjs8M8ZKtiNmLAWhGMf7DQVsIyjQL8KK/yjMKjxXtOM83AkeS9r8d
 0JBfDgzOnKH51txJCT6RBIaH6e8sTuGkFXw88wyRnIhhtItTr+1XiNxBaCN11wZ8329o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mVjxaa9G9RxQE0jI1jk9dCyMzXIJAlT2XTMFYUT9Et4=; b=Czb1KQ+Jkt6YYAEcoZyUUh6fvg
 mmMMW7jUPS9X1aDAtqpzJSBJFt99KOm9OQq/WzDb9rhs9XPRQzjN9v9+n8NxX1jEQozTNuYg8+fwd
 AuRLh8YxkzHwVoyphGhpLHtuO+WmTjOoT86JiHz3/mt1q4tOsHbDEhQSxWNyGOXGm4BE=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olo5S-00C8Vd-Fn for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 09:13:10 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MtzJb6fMCzHvCS;
 Fri, 21 Oct 2022 17:12:47 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 17:12:39 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 17:12:38 +0800
To: Greg KH <gregkh@linuxfoundation.org>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com> <Y1IwLOUGayjT9p6d@kroah.com>
 <0591e66f-731a-5f81-fc9d-3a6d80516c65@huawei.com>
 <Y1JZ9IUPL6jZIQ8E@kroah.com>
Message-ID: <1f3aa2ac-fba6-dc7a-d01d-7dd5331c8dc5@huawei.com>
Date: Fri, 21 Oct 2022 17:12:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y1JZ9IUPL6jZIQ8E@kroah.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/21 16:36, Greg KH wrote: > On Fri, Oct 21, 2022
 at 04:24:23PM +0800, Yang Yingliang wrote: >> On 2022/10/21 13:37, Greg KH
 wrote: >>> On Fri, Oct 21, 2022 at 01:29:31AM -0400, Luben Tuikov [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1olo5S-00C8Vd-Fn
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
Cc: rafael@kernel.org, qemu-devel@nongnu.org, liushixin2@huawei.com,
 joseph.qi@linux.alibaba.com, linux-mtd@lists.infradead.org, richard@nod.at,
 mark@fasheh.com, mst@redhat.com, amd-gfx@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, hsiangkao@linux.alibaba.com,
 somlo@cmu.edu, jlbec@evilplan.org, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 alexander.deucher@amd.com, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDIwMjIvMTAvMjEgMTY6MzYsIEdyZWcgS0ggd3JvdGU6Cj4gT24gRnJpLCBPY3QgMjEsIDIw
MjIgYXQgMDQ6MjQ6MjNQTSArMDgwMCwgWWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4+IE9uIDIwMjIv
MTAvMjEgMTM6MzcsIEdyZWcgS0ggd3JvdGU6Cj4+PiBPbiBGcmksIE9jdCAyMSwgMjAyMiBhdCAw
MToyOTozMUFNIC0wNDAwLCBMdWJlbiBUdWlrb3Ygd3JvdGU6Cj4+Pj4gT24gMjAyMi0xMC0yMCAy
MjoyMCwgWWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4+Pj4+IFRoZSBwcmV2aW91cyBkaXNjdXNzaW9u
IGxpbms6Cj4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMGRiNDg2ZWItNjkyNy05
MjdlLTM2MjktOTU4ZjhmMjExMTk0QGh1YXdlaS5jb20vVC8KPj4+PiBUaGUgdmVyeSBmaXJzdCBk
aXNjdXNzaW9uIG9uIHRoaXMgd2FzIGhlcmU6Cj4+Pj4KPj4+PiBodHRwczovL3d3dy5zcGluaWNz
Lm5ldC9saXN0cy9kcmktZGV2ZWwvbXNnMzY4MDc3Lmh0bWwKPj4+Pgo+Pj4+IFBsZWFzZSB1c2Ug
dGhpcyBsaW5rLCBhbmQgbm90IHRoZSB0aGF0IG9uZSB1cCB0aGVyZSB5b3Ugd2hpY2ggcXVvdGVk
IGFib3ZlLAo+Pj4+IGFuZCB3aG9zZSBjb21taXQgZGVzY3JpcHRpb24gaXMgdGFrZW4gdmVyYmF0
aW0gZnJvbSB0aGUgdGhpcyBsaW5rLgo+Pj4+Cj4+Pj4+IGtzZXRfcmVnaXN0ZXIoKSBpcyBjdXJy
ZW50bHkgdXNlZCBpbiBzb21lIHBsYWNlcyB3aXRob3V0IGNhbGxpbmcKPj4+Pj4ga3NldF9wdXQo
KSBpbiBlcnJvciBwYXRoLCBiZWNhdXNlIHRoZSBjYWxsZXJzIHRoaW5rIGl0IHNob3VsZCBiZQo+
Pj4+PiBrc2V0IGludGVybmFsIHRoaW5nIHRvIGRvLCBidXQgdGhlIGRyaXZlciBjb3JlIGNhbiBu
b3Qga25vdyB3aGF0Cj4+Pj4+IGNhbGxlciBkb2luZyB3aXRoIHRoYXQgbWVtb3J5IGF0IHRpbWVz
LiBUaGUgbWVtb3J5IGNvdWxkIGJlIGZyZWVkCj4+Pj4+IGJvdGggaW4ga3NldF9wdXQoKSBhbmQg
ZXJyb3IgcGF0aCBvZiBjYWxsZXIsIGlmIGl0IGlzIGNhbGxlZCBpbgo+Pj4+PiBrc2V0X3JlZ2lz
dGVyKCkuCj4+Pj4gQXMgSSBleHBsYWluZWQgaW4gdGhlIGxpbmsgYWJvdmUsIHRoZSByZWFzb24g
dGhlcmUncwo+Pj4+IGEgbWVtb3J5IGxlYWsgaXMgdGhhdCBvbmUgY2Fubm90IGNhbGwga3NldF9y
ZWdpc3RlcigpIHdpdGhvdXQKPj4+PiB0aGUga3NldC0+a29iai5uYW1lIGJlaW5nIHNldC0ta29i
al9hZGRfaW50ZXJuYWwoKSByZXR1cm5zIC1FSU5WQUwsCj4+Pj4gaW4gdGhpcyBjYXNlLCBpLmUu
IGtzZXRfcmVnaXN0ZXIoKSBmYWlscyB3aXRoIC1FSU5WQUwuCj4+Pj4KPj4+PiBUaHVzLCB0aGUg
bW9zdCBjb21tb24gdXNhZ2UgaXMgc29tZXRoaW5nIGxpa2UgdGhpczoKPj4+Pgo+Pj4+IAlrb2Jq
X3NldF9uYW1lKCZrc2V0LT5rb2JqLCBmb3JtYXQsIC4uLik7Cj4+Pj4gCWtzZXQtPmtvYmoua3Nl
dCA9IHBhcmVudF9rc2V0Owo+Pj4+IAlrc2V0LT5rb2JqLmt0eXBlID0ga3R5cGU7Cj4+Pj4gCXJl
cyA9IGtzZXRfcmVnaXN0ZXIoa3NldCk7Cj4+Pj4KPj4+PiBTbywgd2hhdCBpcyBiZWluZyBsZWFr
ZWQsIGlzIHRoZSBtZW1vcnkgYWxsb2NhdGVkIGluIGtvYmpfc2V0X25hbWUoKSwKPj4+PiBieSB0
aGUgY29tbW9uIGlkaW9tIHNob3duIGFib3ZlLiBUaGlzIG5lZWRzIHRvIGJlIG1lbnRpb25lZCBp
bgo+Pj4+IHRoZSBkb2N1bWVudGF0aW9uLCBhdCBsZWFzdCwgaW4gY2FzZSwgaW4gdGhlIGZ1dHVy
ZSB0aGlzIGlzIGFic29sdmVkCj4+Pj4gaW4ga3NldF9yZWdpc3RlcigpIHJlZGVzaWduLCBldGMu
Cj4+PiBCYXNlZCBvbiB0aGlzLCBjYW4ga3NldF9yZWdpc3RlcigpIGp1c3QgY2xlYW4gdXAgZnJv
bSBpdHNlbGYgd2hlbiBhbgo+Pj4gZXJyb3IgaGFwcGVucz8gIElkZWFsbHkgdGhhdCB3b3VsZCBi
ZSB0aGUgY2FzZSwgYXMgdGhlIG9kZHMgb2YgYSBrc2V0Cj4+PiBiZWluZyBlbWJlZGRlZCBpbiBh
IGxhcmdlciBzdHJ1Y3R1cmUgaXMgcHJvYmFibHkgc2xpbSwgYnV0IHdlIHdvdWxkIGhhdmUKPj4+
IHRvIHNlYXJjaCB0aGUgdHJlZSB0byBtYWtlIHN1cmUuCj4+IEkgaGF2ZSBzZWFyY2ggdGhlIHdo
b2xlIHRyZWUsIHRoZSBrc2V0IHVzZWQgaW4gYnVzX3JlZ2lzdGVyKCkgLSBwYXRjaCAjMywKPj4g
a3NldF9jcmVhdGVfYW5kX2FkZCgpIC0gcGF0Y2ggIzQKPj4gX19jbGFzc19yZWdpc3RlcigpIC0g
cGF0Y2ggIzUswqAgZndfY2ZnX2J1aWxkX3N5bWxpbmsoKSAtIHBhdGNoICM2IGFuZAo+PiBhbWRn
cHVfZGlzY292ZXJ5LmMgLSBwYXRjaCAjMTAKPj4gaXMgZW1iZWRkZWQgaW4gYSBsYXJnZXIgc3Ry
dWN0dXJlLiBJbiB0aGVzZSBjYXNlcywgd2UgY2FuIG5vdCBjYWxsCj4+IGtzZXRfcHV0KCkgaW4g
ZXJyb3IgcGF0aCBpbiBrc2V0X3JlZ2lzdGVyKCkKPiBZZXMgeW91IGNhbiBhcyB0aGUga29iamVj
dCBpbiB0aGUga3NldCBzaG91bGQgTk9UIGJlIGNvbnRyb2xpbmcgdGhlCj4gbGlmZXNwYW4gb2Yg
dGhvc2UgbGFyZ2VyIG9iamVjdHMuClJlYWQgdGhyb3VnaCB0aGUgY29kZSB0aGUgb25seSBsZWFr
IGluIHRoaXMgY2FzZSBpcyB0aGUgbmFtZSwgc28gY2FuIHdlIApmcmVlIGl0CmRpcmVjdGx5IGlu
IGtzZXRfcmVnaXN0ZXIoKToKCi0tLSBhL2xpYi9rb2JqZWN0LmMKKysrIGIvbGliL2tvYmplY3Qu
YwpAQCAtODQ0LDggKzg0NCwxMSBAQCBpbnQga3NldF9yZWdpc3RlcihzdHJ1Y3Qga3NldCAqaykK
CiDCoMKgwqDCoMKgwqDCoCBrc2V0X2luaXQoayk7CiDCoMKgwqDCoMKgwqDCoCBlcnIgPSBrb2Jq
ZWN0X2FkZF9pbnRlcm5hbCgmay0+a29iaik7Ci3CoMKgwqDCoMKgwqAgaWYgKGVycikKK8KgwqDC
oMKgwqDCoCBpZiAoZXJyKSB7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGtmcmVlX2Nv
bnN0KGstPmtvYmoubmFtZSk7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGstPmtvYmou
bmFtZSA9IE5VTEw7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsK
K8KgwqDCoMKgwqDCoCB9CiDCoMKgwqDCoMKgwqDCoCBrb2JqZWN0X3VldmVudCgmay0+a29iaiwg
S09CSl9BREQpOwogwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7CiDCoH0KCm9yIHVuc2V0IGt0eXBl
IG9mIGtvYmplY3QsIHRoZW4gY2FsbCBrc2V0X3B1dCgpOgoKLS0tIGEvbGliL2tvYmplY3QuYwor
KysgYi9saWIva29iamVjdC5jCkBAIC04NDQsOCArODQ0LDExIEBAIGludCBrc2V0X3JlZ2lzdGVy
KHN0cnVjdCBrc2V0ICprKQoKIMKgwqDCoMKgwqDCoMKgIGtzZXRfaW5pdChrKTsKIMKgwqDCoMKg
wqDCoMKgIGVyciA9IGtvYmplY3RfYWRkX2ludGVybmFsKCZrLT5rb2JqKTsKLcKgwqDCoMKgwqDC
oCBpZiAoZXJyKQorwqDCoMKgwqDCoMKgIGlmIChlcnIpIHsKK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgay0+a29iai5rdHlwZSA9IE5VTEw7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGtzZXRfcHV0KGspOwogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBl
cnI7CivCoMKgwqDCoMKgwqAgfQogwqDCoMKgwqDCoMKgwqAga29iamVjdF91ZXZlbnQoJmstPmtv
YmosIEtPQkpfQUREKTsKIMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwogwqB9Cgo+Cj4gSWYgaXQg
aXMsIHBsZWFzZSBwb2ludCBvdXQgdGhlIGNhbGwgY2hhaW4gaGVyZSBhcyBJIGRvbid0IHRoaW5r
IHRoYXQKPiBzaG91bGQgYmUgcG9zc2libGUuCj4KPiBOb3RlIGFsbCBvZiB0aGlzIGlzIGEgbWVz
cyBiZWNhdXNlIHRoZSBrb2JqZWN0IG5hbWUgc3R1ZmYgd2FzIGFkZGVkIG11Y2gKPiBsYXRlciwg
YWZ0ZXIgdGhlIGRyaXZlciBtb2RlbCBoYWQgYmVlbiBjcmVhdGVkIGFuZCBydW5uaW5nIGZvciBh
IHdoaWxlLgo+IFdlIG1pc3NlZCB0aGlzIGVycm9yIHBhdGggd2hlbiBhZGRpbmcgdGhlIGR5bmFt
aWMga29iamVjdCBuYW1lIGxvZ2ljLAo+IHRoYW5rIGZvciBsb29raW5nIGludG8gdGhpcy4KPgo+
IElmIHlvdSBjb3VsZCB0ZXN0IHRoZSBwYXRjaCBwb3N0ZWQgd2l0aCB5b3VyIGVycm9yIGluamVj
dGlvbiBzeXN0ZW1zLAo+IHRoYXQgY291bGQgbWFrZSB0aGlzIGFsbCBtdWNoIHNpbXBsZXIgdG8g
c29sdmUuCj4KPiB0aGFua3MsCj4KPiBncmVnIGstaAo+IC4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
