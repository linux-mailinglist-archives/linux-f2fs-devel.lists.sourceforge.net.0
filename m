Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0FA3A74EC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jun 2021 05:19:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lszc1-0003pk-DZ; Tue, 15 Jun 2021 03:19:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1lszc0-0003pb-Lz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 03:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tiSiATC6r7ap4/aY50iSKM8fz6SLF2qIBQHaRKV2EHc=; b=B02LWyBATumiWAis9doRQ9xBy3
 i4NcfpnX8FbOVqmCIR0wRJEy7qHXgPqg7kuNPsX2s/s/5DGsoMsD95hnuoktbVFhmOwvF9f5u61rd
 zmzCUILtrYNpL+94DNV8OGNmvXtU0oW/K6MBCT7NLPVT8cI5/PhzUGtxKxoyNJXUaeMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tiSiATC6r7ap4/aY50iSKM8fz6SLF2qIBQHaRKV2EHc=; b=VZpWOWFMxisNVD2HNQJ0b2gyuH
 Reof0vWRtrwJw/t+99verlD3Lar3mRxEhwZG5RG+zpWmyIXqCLWrHj5dgYDg7YBPiQPO1WN2oubk+
 pfSbo+OUCZQeBETD4g2WjyQEkUzialT/AckWWDZPacNSzMqEgHPqiKen9Vwr1NqG6axk=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lszbx-00A0zt-RI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 03:19:38 +0000
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G3thd5r58zXfLg;
 Tue, 15 Jun 2021 11:14:25 +0800 (CST)
Received: from [10.174.177.8] (10.174.177.8) by dggeml756-chm.china.huawei.com
 (10.1.199.158) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 15
 Jun 2021 11:19:24 +0800
To: Gao Xiang <hsiangkao@linux.alibaba.com>
References: <20210615013509.4130329-1-wangxiaojun11@huawei.com>
 <YMgRBshqToatVwzP@B-P7TQMD6M-0146.local>
From: "wangxiaojun (N)" <wangxiaojun11@huawei.com>
Message-ID: <36670fed-569b-c553-6283-fb6ef950e89c@huawei.com>
Date: Tue, 15 Jun 2021 11:19:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMgRBshqToatVwzP@B-P7TQMD6M-0146.local>
X-Originating-IP: [10.174.177.8]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
 dggeml756-chm.china.huawei.com (10.1.199.158)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.187 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lszbx-00A0zt-RI
Subject: Re: [f2fs-dev] [PATCH] f2fs: replace ERANGE with ENAMETOOLONG in
 file name length check
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CuWcqCAyMDIxLzYvMTUgMTA6MzEsIEdhbyBYaWFuZyDlhpnpgZM6Cj4gT24gVHVlLCBKdW4gMTUs
IDIwMjEgYXQgMDk6MzU6MDlBTSArMDgwMCwgV2FuZyBYaWFvanVuIHdyb3RlOgo+PiBFUkFOR0Ug
aW5kaWNhdGVzIHRoYXQgdGhlIG1hdGggcmVzdWx0IGlzIG5vdCByZXByZXNlbnRhdGl2ZS4gSGVy
ZSwKPj4gRU5BTUVUT09MT05HIGlzIHVzZWQgdG8gcmVwbGFjZSBFUkFOR0UuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFdhbmcgWGlhb2p1biA8d2FuZ3hpYW9qdW4xMUBodWF3ZWkuY29tPgo+IEkgZG9u
J3QgdGhpbmsgRU5BTUVUT09MT05HIGlzIGEgdmFsaWQgcmV0dXJuIGNvZGUgZm9yIHtnLHN9ZXR4
YXR0ci4KPiBodHRwczovL21hbjcub3JnL2xpbnV4L21hbi1wYWdlcy9tYW4yL2dldHhhdHRyLjIu
aHRtbAo+IGh0dHBzOi8vbWFuNy5vcmcvbGludXgvbWFuLXBhZ2VzL21hbjIvc2V0eGF0dHIuMi5o
dG1sCj4gaW5zdGVhZCBvZiBFUkFOR0UuCj4KPiBwbGVhc2UgYWxzbyBzZWUgZXh0NCAvIHhmcyBp
bXBsZW1lbnRhdGlvbnMuCj4KPiBUaGFua3MsCj4gR2FvIFhpYW5nCgpIaSBYaWFuZywgWW91J3Jl
IHJpZ2h0LiBUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuCgo+Cj4+IC0tLQo+PiAgIGZzL2YyZnMv
eGF0dHIuYyB8IDQgKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3hhdHRyLmMgYi9mcy9mMmZz
L3hhdHRyLmMKPj4gaW5kZXggYzhmMzRkZWNiZjhlLi5lYjgyN2MxMGU5NzAgMTAwNjQ0Cj4+IC0t
LSBhL2ZzL2YyZnMveGF0dHIuYwo+PiArKysgYi9mcy9mMmZzL3hhdHRyLmMKPj4gQEAgLTUyOSw3
ICs1MjksNyBAQCBpbnQgZjJmc19nZXR4YXR0cihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBpbnQgaW5k
ZXgsIGNvbnN0IGNoYXIgKm5hbWUsCj4+ICAgCj4+ICAgCWxlbiA9IHN0cmxlbihuYW1lKTsKPj4g
ICAJaWYgKGxlbiA+IEYyRlNfTkFNRV9MRU4pCj4+IC0JCXJldHVybiAtRVJBTkdFOwo+PiArCQly
ZXR1cm4gLUVOQU1FVE9PTE9ORzsKPj4gICAKPj4gICAJZG93bl9yZWFkKCZGMkZTX0koaW5vZGUp
LT5pX3hhdHRyX3NlbSk7Cj4+ICAgCWVycm9yID0gbG9va3VwX2FsbF94YXR0cnMoaW5vZGUsIGlw
YWdlLCBpbmRleCwgbGVuLCBuYW1lLAo+PiBAQCAtNjQ2LDcgKzY0Niw3IEBAIHN0YXRpYyBpbnQg
X19mMmZzX3NldHhhdHRyKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGludCBpbmRleCwKPj4gICAJbGVu
ID0gc3RybGVuKG5hbWUpOwo+PiAgIAo+PiAgIAlpZiAobGVuID4gRjJGU19OQU1FX0xFTikKPj4g
LQkJcmV0dXJuIC1FUkFOR0U7Cj4+ICsJCXJldHVybiAtRU5BTUVUT09MT05HOwo+PiAgIAo+PiAg
IAlpZiAoc2l6ZSA+IE1BWF9WQUxVRV9MRU4oaW5vZGUpKQo+PiAgIAkJcmV0dXJuIC1FMkJJRzsK
Pj4gLS0gCj4+IDIuMjUuNAo+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+PiBM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4gLgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
