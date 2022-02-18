Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 697D14BAFB7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Feb 2022 03:33:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nKt5k-0000fy-FM; Fri, 18 Feb 2022 02:33:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sunke32@huawei.com>) id 1nKt5i-0000fn-KD
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Feb 2022 02:33:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JogWabmIrq96CIBO0bI2ffRIX3JxjL1M0gYdkrMU57A=; b=js/oWRuMuzm8eOE0LRfY2oKtEN
 inOcN2F660gm7y2sAMmZIHjE94CathVO9Li+r8mSjCOoH+rxF383/Q0knWy13Ifkcvbo91ArClmk0
 Pakt8ZHuRYWOXiDOQoS4+IAnusniUVy+he56iKDnvMVeSgAFgN/GjqJGkf4pusw4hklM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JogWabmIrq96CIBO0bI2ffRIX3JxjL1M0gYdkrMU57A=; b=TQ4c+08m6I855GmNNnTSMlHn0G
 h1FHjO67sZSo99KCh8HMSSwGNX4B8Xt6FXZ7F+6oiJ4U+VArpTzDkXnQzSVDwMVk8EjCZmFS1T3SC
 AQcY/2MD74/mjxytSB653dGeCmz4o7nQHjcLibe8f7FrGQUahyxhZeBCHSxcCubhrtBc=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nKt5c-005WfT-Hl
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Feb 2022 02:33:49 +0000
Received: from kwepemi100014.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4K0G1l6xQ5zbkCf;
 Fri, 18 Feb 2022 10:32:27 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 kwepemi100014.china.huawei.com (7.221.188.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Feb 2022 10:33:35 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Feb 2022 10:33:35 +0800
To: <fstests@vger.kernel.org>, <guan@eryu.me>
References: <20220208071624.1095904-1-sunke32@huawei.com>
Message-ID: <99822864-808b-0672-ba5b-efebaa05d9ef@huawei.com>
Date: Fri, 18 Feb 2022 10:33:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20220208071624.1095904-1-sunke32@huawei.com>
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Friendly ping... ÔÚ 2022/2/8 15:16, Sun Ke Ð´µÀ: > f2fs has
    set inline_xattr as a default option, and introduced a new > option named
    'noinline_xattr' for disabling default inline_xattr option. > So in _acl_get_max
    we [...] 
 
 Content analysis details:   (-4.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [45.249.212.188 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
                             [45.249.212.188 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nKt5c-005WfT-Hl
Subject: Re: [f2fs-dev] [PATCH] common/attr: adbjust acl_max of f2fs
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
From: Sun Ke via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sun Ke <sunke32@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RnJpZW5kbHkgcGluZy4uLgoK1NogMjAyMi8yLzggMTU6MTYsIFN1biBLZSDQtLXAOgo+IGYyZnMg
aGFzIHNldCBpbmxpbmVfeGF0dHIgYXMgYSBkZWZhdWx0IG9wdGlvbiwgYW5kIGludHJvZHVjZWQg
YSBuZXcKPiBvcHRpb24gbmFtZWQgJ25vaW5saW5lX3hhdHRyJyBmb3IgZGlzYWJsaW5nIGRlZmF1
bHQgaW5saW5lX3hhdHRyIG9wdGlvbi4KPiBTbyBpbiBfYWNsX2dldF9tYXggd2UgbmVlZCB0byBj
aGVjayAnbm9pbmxpbmVfeGF0dHInIHN0cmluZyBpbiBmcwo+IG9wdGlvbiwgb3RoZXJ3aXNlIHdl
IG1heSBzZWxlY3QgdGhlIHdyb25nIG1heCBhY2wgbnVtYmVyIHNpbmNlIHdlIGFsd2F5cwo+IGZv
dW5kIHRoZSBzdHJpbmcgJ2lubGluZV94YXR0cicgaW4gZnMgb3B0aW9uLgo+Cj4gQWRkaXRpb25h
bGx5LCBmMmZzIGhhcyBjaGFuZ2VkIGRpc2sgbGF5b3V0IG9mIHhhdHRyIGJsb2NrIGEgYml0LCBz
byB3aWxsCj4gY29udGFpbiBvbmUgbW9yZSBlbnRyeSBpbiBib3RoIGlubGluZSBhbmQgbm9pbmxp
bmUgeGF0dHIgaW5vZGUsIHRoaXMKPiBwYXRjaCB3aWxsIG1vZGlmeSB0aGUgbWF4IGFjbCBudW1i
ZXIgdG8gYWRqdXN0IGl0Lgo+Cj4gU3VnZ2VzdGVkLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogU3VuIEtlIDxzdW5rZTMyQGh1YXdlaS5jb20+Cj4gLS0tCj4g
ICBjb21tb24vYXR0ciB8IDE5ICsrKysrKysrKysrKysrKystLS0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2NvbW1v
bi9hdHRyIGIvY29tbW9uL2F0dHIKPiBpbmRleCAzNTY4MmQ3Yy4uZGFlOGExYmIgMTAwNjQ0Cj4g
LS0tIGEvY29tbW9uL2F0dHIKPiArKysgYi9jb21tb24vYXR0cgo+IEBAIC0yNiwxMSArMjYsMjQg
QEAgX2FjbF9nZXRfbWF4KCkKPiAgIAkJZWNobyA4MTkxCj4gICAJCTs7Cj4gICAJZjJmcykKPiAt
CQlfZnNfb3B0aW9ucyAkVEVTVF9ERVYgfCBncmVwICJpbmxpbmVfeGF0dHIiID4vZGV2L251bGwg
Mj4mMQo+ICsJCSMgSWYgbm9pbmxpbmVfeGF0dHIgaXMgZW5hYmxlZCwgbWF4IHhhdHRyIHNpemUg
c2hvdWxkIGJlOgo+ICsJCSMgKDQwOTYgLSAyNCkgLSAoMjQgKyA0KSA9IDQwNDQKPiArCQkjIHRo
ZW4gQUNMX01BWF9FTlRSSUVTIHNob3VsZCBiZToKPiArCQkjICg0MDQ0IC0gKDQgKyA0ICogNCkp
IC8gOCArIDQgPSA1MDcKPiArCQlfZnNfb3B0aW9ucyAkVEVTVF9ERVYgfCBncmVwICJub2lubGlu
ZV94YXR0ciIgPi9kZXYvbnVsbCAyPiYxCj4gICAJCWlmIFsgJD8gLWVxIDAgXTsgdGhlbgo+IC0J
CQllY2hvIDUzMQo+ICsJCQllY2hvIDUwNwo+ICAgCQllbHNlCj4gLQkJCWVjaG8gNTA2Cj4gKwkJ
CSMgSWYgaW5saW5lX3hhdHRyIGlzIGVuYWJsZWQsIG1heCB4YXR0ciBzaXplIHNob3VsZCBiZToK
PiArCQkJIyAoNDA5NiAtIDI0ICsgMjAwKSAtICgyNCArIDQpID0gNDI0NAo+ICsJCQkjIHRoZW4g
QUNMX01BWF9FTlRSSUVTIHNob3VsZCBiZToKPiArCQkJIyAoNDI0NCAtICg0ICsgNCAqIDQpKSAv
IDggKyA0ID0gNTMyCj4gKwkJCV9mc19vcHRpb25zICRURVNUX0RFViB8IGdyZXAgImlubGluZV94
YXR0ciIgPi9kZXYvbnVsbCAyPiYxCj4gKwkJCWlmIFsgJD8gLWVxIDAgXTsgdGhlbgo+ICsJCQkJ
ZWNobyA1MzIKPiArCQkJZWxzZQo+ICsJCQkJZWNobyA1MDcKPiArCQkJZmkKPiAgIAkJZmkKPiAg
IAkJOzsKPiAgIAliY2FjaGVmcykKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
