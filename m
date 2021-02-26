Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D13C3325EA7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Feb 2021 09:10:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lFYCS-00075R-BL; Fri, 26 Feb 2021 08:10:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lFYCQ-00075K-T8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 08:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gfHMIF3ZGXZQig50MeHV0QpJ2TJ+F2O0MkYxGIEbxcc=; b=SF7R5Il3HId4NrCq6IXqgAujKX
 rGQYgkaPjndTw4LY5Igd9BTyGywkj8NrArlpifebeTEeXDU1OKKPxKA9/FrdB5+M3o6h6VM584fNp
 MCYdSne8Wi3bTcbLxfQ5sGqy1h2P0276kzRLE5bp8mklwdVHPsn0RifGsRAhSdkNy3AI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gfHMIF3ZGXZQig50MeHV0QpJ2TJ+F2O0MkYxGIEbxcc=; b=buvQaYpfKLS64fBoEs20zcZiY0
 0OhbflDwK14iDqTUt72exvHOVIRU7PTAXD8QMz0DG4qXLpSvloOhZDtwJqrMThf1l1LPUyCrhTdBs
 wHH2N5k0Ls8MhUiiTc9dnvHR8GhgNiVT5YdpBsEWvD5tOR6VmvAkEvNBTMfzBWqUeNnM=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lFYCI-0001yA-Tv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 08:10:10 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dn2Mx0FHJzjSBr;
 Fri, 26 Feb 2021 16:08:13 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 26 Feb
 2021 16:09:46 +0800
To: <cgxu519@mykernel.net>
References: <20210223115016.2183798-1-cgxu519@mykernel.net>
 <c64bd725-2600-4d0c-bfa9-1e1fc7cdc045@huawei.com>
 <177dc236dfe.cc0d00b0706.1250962138753029869@mykernel.net>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c4add4a5-fbc2-9b76-ef7c-45e9a09390b7@huawei.com>
Date: Fri, 26 Feb 2021 16:09:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <177dc236dfe.cc0d00b0706.1250962138753029869@mykernel.net>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mykernel.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lFYCI-0001yA-Tv
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to use per-inode maxbytes in
 f2fs_fiemap
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
Cc: jaegeuk <jaegeuk@kernel.org>,
 linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8yLzI2IDEwOjIwLCBDaGVuZ2d1YW5nIFh1IHdyb3RlOgo+ICAgLS0tLSDlnKgg5pif
5pyf5ZubLCAyMDIxLTAyLTI1IDA5OjI0OjUxIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT4g
5pKw5YaZIC0tLS0KPiAgID4gT24gMjAyMS8yLzIzIDE5OjUwLCBDaGVuZ2d1YW5nIFh1IHdyb3Rl
Ogo+ICAgPiA+IEYyRlMgaW5vZGUgbWF5IGhhdmUgZGlmZmVyZW50IG1heCBzaXplLAo+ICAgPiA+
IHNvIGNoYW5nZSB0byB1c2UgcGVyLWlub2RlIG1heGJ5dGVzLgo+ICAgPiA+Cj4gICA+ID4gU2ln
bmVkLW9mZi1ieTogQ2hlbmdndWFuZyBYdSA8Y2d4dTUxOUBteWtlcm5lbC5uZXQ+Cj4gICA+ID4g
LS0tCj4gICA+ID4gICBmcy9mMmZzL2RhdGEuYyB8IDUgKysrKysKPiAgID4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAgID4gPgo+ICAgPiA+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4gICA+ID4gaW5kZXggYjk3MjFjOGYxMTZjLi5i
MzMwYzZhMjdiMTQgMTAwNjQ0Cj4gICA+ID4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiAgID4gPiAr
KysgYi9mcy9mMmZzL2RhdGEuYwo+ICAgPiA+IEBAIC0xODM4LDYgKzE4MzgsNyBAQCBpbnQgZjJm
c19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpZW1hcF9leHRlbnRfaW5mbyAq
ZmllaW5mbywKPiAgID4gPiAgICAgICBpbnQgcmV0ID0gMDsKPiAgID4gPiAgICAgICBib29sIGNv
bXByX2NsdXN0ZXIgPSBmYWxzZTsKPiAgID4gPiAgICAgICB1bnNpZ25lZCBpbnQgY2x1c3Rlcl9z
aXplID0gRjJGU19JKGlub2RlKS0+aV9jbHVzdGVyX3NpemU7Cj4gICA+ID4gKyAgICBsb2ZmX3Qg
bWF4Ynl0ZXM7Cj4gICA+ID4KPiAgID4gPiAgICAgICBpZiAoZmllaW5mby0+ZmlfZmxhZ3MgJiBG
SUVNQVBfRkxBR19DQUNIRSkgewo+ICAgPiA+ICAgICAgICAgICByZXQgPSBmMmZzX3ByZWNhY2hl
X2V4dGVudHMoaW5vZGUpOwo+ICAgPiA+IEBAIC0xODQ1LDYgKzE4NDYsMTAgQEAgaW50IGYyZnNf
ZmllbWFwKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWVtYXBfZXh0ZW50X2luZm8gKmZp
ZWluZm8sCj4gICA+ID4gICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICAgPiA+ICAgICAgIH0K
PiAgID4gPgo+ICAgPiA+ICsgICAgbWF4Ynl0ZXMgPSBtYXhfZmlsZV9ibG9ja3MoaW5vZGUpIDw8
IEYyRlNfQkxLU0laRV9CSVRTOwo+ICAgPiA+ICsgICAgaWYgKGxlbiA+IG1heGJ5dGVzIHx8ICht
YXhieXRlcyAtIGxlbikgPCBzdGFydCkKPiAgID4gPiArICAgICAgICBsZW4gPSBtYXhieXRlcyAt
IHN0YXJ0Owo+ICAgPgo+ICAgPiBUaGlzIHNob3VsZCBiZSBjaGVja2VkIHVuZGVyIGlub2RlIGxv
Y2ssIG90aGVyd2lzZSB0aGUgbWF4IGZpbGVzaXplIGNhbGN1bGF0aW9uCj4gICA+IGNhbiByYWNl
IHdpdGggY29tcHJlc3MgaW5vZGUgY29udmVyc2lvbi4KPiAgID4KPiAKPiBUaGFua3MgZm9yIHlv
dXIgcmV2aWV3LiBUaGVyZSBhcmUgc29tZSBvdGhlciBwbGFjZXMgYWxzbyBjYWxsaW5nIG1heF9m
aWxlX2Jsb2NrcygpIGFuZCBmMmZzX2NvbXByZXNzZWRfZmlsZSgpLAoKWW91IG1lYW4gc2JpLT5t
YXhfZmlsZV9ibG9ja3M/IEkgZ3Vlc3MgaXQgc2hvdWxkIGJlIHJlcGxhY2VkIHdpdGggbWF4X2lu
b2RlX2Jsb2NrcygpLgoKPiBzbyAgSSdtIHdvbmRlcmluZyAgaWYgd2Ugc2hvdWxkIGFkZCBsb2Nr
IGluc2lkZSBmMmZzX2NvbXByZXNzZWRfZmlsZSgpIHRvIGF2b2lkIHJhY2Ugd2l0aCBjb21wcmVz
cyBpbm9kZSBjb252ZXJzaW9uLgoKSSB0aGluayBtYXhfaW5vZGVfYmxvY2tzKCkncyBjYWxsZXIg
c2hvdWxkIGtlZXAgZG8gdGhlIHNpemUgY2hlY2sgdW5kZXIgaW5vZGUgbG9jawpyYXRoZXIgdGhh
biBhZGRpbmcgbG9jayBpbnRvIGYyZnNfY29tcHJlc3NlZF9maWxlKCkuCgpUaGFua3MsCgo+IAo+
IFRoYW5rcywKPiBDaGVuZ2d1YW5nCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
