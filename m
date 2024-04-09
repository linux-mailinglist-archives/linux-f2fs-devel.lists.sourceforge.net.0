Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ECC89D2CC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Apr 2024 09:05:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ru5Xm-00031z-Ff;
	Tue, 09 Apr 2024 07:05:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangjianjian3@huawei.com>) id 1ru5Xk-00031r-56
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 07:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k+aGpZGFfEKhWSu9I7r42HBEZ2rHaYcfdDaGju0tbBw=; b=kolBZ3AgqLQhADdZB68yxa+kph
 khPI4dkmH+KJu4cyQ+eZeb6to8xDyZeUXrbbIE7rhfegZ7bRUfL3QMoG+73Dtg7TYOcJqOPzXiItR
 TPCmQupogYW/V3NXJVo/sEOiNrvcTCj/eWMQfezsCMyeV7dKtMax/nJ0yWcQSkLQ2lRk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k+aGpZGFfEKhWSu9I7r42HBEZ2rHaYcfdDaGju0tbBw=; b=Ac5UfTd5bOwaRSgubeB/CedqaH
 ganl7Cv6PSaRtytQHAabr/1NCuTEXFrWFViHV5KEdzN0C6jFtYjc4DvHMzjqJyNlLUeZ24p4o1XRB
 oHaphPvNUMgTAWygoy+FvU6crR9ojUfJbbpKsELaCCHvmcvp1zuzb0l56uygRfQ4tky8=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ru5Xe-0000SW-PE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 07:05:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VDGfj2Xz0zwRhl
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 Apr 2024 14:45:01 +0800 (CST)
Received: from canpemm500009.china.huawei.com (unknown [7.192.105.203])
 by mail.maildlp.com (Postfix) with ESMTPS id 907DE1400CD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 Apr 2024 14:47:55 +0800 (CST)
Received: from [10.108.234.194] (10.108.234.194) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 14:47:55 +0800
Message-ID: <1c059a01-ec24-4fd4-9e66-7989d07e3207@huawei.com>
Date: Tue, 9 Apr 2024 14:47:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <linux-f2fs-devel@lists.sourceforge.net>
References: <tencent_67A0192ABE8A513889F4DCEEFD83DC2FBB0A@qq.com>
 <b68f94da-4477-4ab5-b979-aa260e0b8ef3@kernel.org>
Content-Language: en-US
In-Reply-To: <b68f94da-4477-4ab5-b979-aa260e0b8ef3@kernel.org>
X-Originating-IP: [10.108.234.194]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/7 14:23, Chao Yu wrote: > On 2024/4/4 21:47, Wang
 Jianjian wrote: >> dquot_mark_dquot_dirty returns old dirty state not the
 error code. > > I think it's fine to just pass return value of dqu [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ru5Xe-0000SW-PE
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix incorrect return value
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
From: "wangjianjian \(C\) via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "wangjianjian \(C\)" <wangjianjian3@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC80LzcgMTQ6MjMsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyNC80LzQgMjE6NDcsIFdh
bmcgSmlhbmppYW4gd3JvdGU6Cj4+IGRxdW90X21hcmtfZHF1b3RfZGlydHkgcmV0dXJucyBvbGQg
ZGlydHkgc3RhdGUgbm90IHRoZSBlcnJvciBjb2RlLgo+IAo+IEkgdGhpbmsgaXQncyBmaW5lIHRv
IGp1c3QgcGFzcyByZXR1cm4gdmFsdWUgb2YgZHF1b3RfbWFya19kcXVvdF9kaXJ0eSgpCj4gdG8g
Y2FsbGVyLCBiZWNhdXNlIGNhbGxlciBjYW4gZGlzdGluZ3Vpc2ggc3RhdHVzIGZyb20gcmV0dXJu
IHZhbHVlOgo+IDEpIDwgMCwgdGhlcmUgaXMgYW4gZXJyb3IsIDIpID49IDAsIHRoZXJlIGlzIG5v
IGVycm9yLCBwcmV2aW91c2x5IGl0IGlzCj4gZGlydHkgaWYgaXQgaXMgMS4KbWFya19hbGxfZHF1
b3RfZGlydHkgdXNlcyBpZiByZXR1cm4gdmFsdWUgaXMgMCB0byBzYXZlIGVycm9yIGNvZGUuIEl0
IAptYXkgY2F1c2UgbWVzcy4KQnkgdGhlIHdheSwgSSBhbSBmaW5lIGRvbid0IGNoYW5nZSBpdC4K
Cj4gCj4gVGhhbmtzLAo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBXYW5nIEppYW5qaWFuIDx3YW5n
amlhbmppYW4wQGZveG1haWwuY29tPgo+PiAtLS0KPj4gwqAgZnMvZjJmcy9zdXBlci5jIHwgNCAr
Ky0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4g
aW5kZXggYTY4NjdmMjZmMTQxLi5hZjA3MDI3NDc1ZDkgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMv
c3VwZXIuYwo+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPj4gQEAgLTMwNjMsMTMgKzMwNjMsMTMg
QEAgc3RhdGljIGludCBmMmZzX2RxdW90X21hcmtfZHF1b3RfZGlydHkoc3RydWN0IAo+PiBkcXVv
dCAqZHF1b3QpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiID0g
ZHF1b3QtPmRxX3NiOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYy
RlNfU0Ioc2IpOwo+PiAtwqDCoMKgIGludCByZXQgPSBkcXVvdF9tYXJrX2RxdW90X2RpcnR5KGRx
dW90KTsKPj4gK8KgwqDCoCBkcXVvdF9tYXJrX2RxdW90X2RpcnR5KGRxdW90KTsKPj4gwqDCoMKg
wqDCoCAvKiBpZiB3ZSBhcmUgdXNpbmcgam91cm5hbGxlZCBxdW90YSAqLwo+PiDCoMKgwqDCoMKg
IGlmIChpc19qb3VybmFsbGVkX3F1b3RhKHNiaSkpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRf
c2JpX2ZsYWcoc2JpLCBTQklfUVVPVEFfTkVFRF9GTFVTSCk7Cj4+IC3CoMKgwqAgcmV0dXJuIHJl
dDsKPj4gK8KgwqDCoCByZXR1cm4gMDsKPj4gwqAgfQo+PiDCoCBzdGF0aWMgaW50IGYyZnNfZHF1
b3RfY29tbWl0X2luZm8oc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgaW50IHR5cGUpCj4gCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAotLSAKUmVnYXJkcwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
