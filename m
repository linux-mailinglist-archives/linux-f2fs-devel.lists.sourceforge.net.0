Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 538CF19BE71
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Apr 2020 11:14:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jJvvr-0000rG-K2; Thu, 02 Apr 2020 09:14:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yanaijie@huawei.com>) id 1jJvvp-0000qy-Tu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Apr 2020 09:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hriGjVg371gy4DIV86nW5E3XncWEgryRVCqPCIzaab8=; b=GwYLnEuU00BCl/3BjIwoLMfcny
 sM2AnjoQPmYsmQhEOyp2efR3ABuDO8qcufD5ya+tjeSAOkIzrnuUPdj8Fh7qQBk/ZE5m+vyPWtZAf
 7K0kEfjHyLlk0utPPWj4LYwaj8i/jVlBdgbJCSjqPyzVN2wr92baUzLHCPMtG2AMImcQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hriGjVg371gy4DIV86nW5E3XncWEgryRVCqPCIzaab8=; b=d7rhFgOYH+oMyaKHQuHCdZHCdF
 FpDpi/oaHBmUmA3ZGHaEbK3H8qkQ5YWvcT3LJYnPthnRMc4PQJDLQOat9fJIT3FfT34K3vWK0nask
 PmZWq2dKImXWHMv14HpwUz323W5tpL1OQWsqSfEcjKdx5y5d2/L67/uG0/WA3TfeGiRk=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jJvvn-001Axb-PX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Apr 2020 09:14:37 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id DD45955660C927AEE8D0;
 Thu,  2 Apr 2020 17:14:24 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.195) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0;
 Thu, 2 Apr 2020 17:14:15 +0800
To: Chao Yu <yuchao0@huawei.com>, <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
References: <20200402061545.23208-1-yanaijie@huawei.com>
 <6170e88e-5242-30dd-f624-1171aaa994de@huawei.com>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <ab642c5a-9b43-cad2-27d2-f98d3dca9529@huawei.com>
Date: Thu, 2 Apr 2020 17:14:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <6170e88e-5242-30dd-f624-1171aaa994de@huawei.com>
X-Originating-IP: [10.173.221.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jJvvn-001Axb-PX
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: remove set but not used variable
 'params'
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbywKCuWcqCAyMDIwLzQvMiAxNjozNywgQ2hhbyBZdSDlhpnpgZM6Cj4gSGkgSmFzb24s
Cj4gCj4gT24gMjAyMC80LzIgMTQ6MTUsIEphc29uIFlhbiB3cm90ZToKPj4gRml4IHRoZSBmb2xs
b3dpbmcgZ2NjIHdhcm5pbmc6Cj4+Cj4+IGZzL2YyZnMvY29tcHJlc3MuYzozNzU6MTg6IHdhcm5p
bmc6IHZhcmlhYmxlICdwYXJhbXMnIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGVdCj4+ICAgIFpTVERfcGFyYW1ldGVycyBwYXJhbXM7Cj4+ICAgICAgICAgICAgICAg
ICAgICBefn5+fn4KPj4KPj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWku
Y29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+Cj4g
Cj4gVGhhbmtzIGZvciB0aGUgcGF0Y2gsIHdvdWxkIHlvdSBtaW5kIHRoYXQganVzdCBtZXJnZSB0
aGlzIGZpeCBpbnRvCj4gb3JpZ2luYWwgcGF0aCB3aGljaCBpcyBzdGlsbCBpbiBmMmZzIHByaXZh
dGUgZ2l0IHRyZWU/Cj4gCgpJdCdzIG9rIHRvIG1lcmdlIHRoaXMgaW50byB0aGUgb3JpZ2luYWwg
cGF0Y2guCgo+IFRoYW5rcywKPiAKPj4gLS0tCj4+ICAgZnMvZjJmcy9jb21wcmVzcy5jIHwgMiAt
LQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9jb21wcmVzcy5jIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4+IGluZGV4IGYwNWVjZjRj
Yjg5OS4uZGY3YjJkMTVlYWNkIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2NvbXByZXNzLmMKPj4g
KysrIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4+IEBAIC0zNzIsMTIgKzM3MiwxMCBAQCBzdGF0aWMg
aW50IHpzdGRfY29tcHJlc3NfcGFnZXMoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MpCj4+ICAgCj4+
ICAgc3RhdGljIGludCB6c3RkX2luaXRfZGVjb21wcmVzc19jdHgoc3RydWN0IGRlY29tcHJlc3Nf
aW9fY3R4ICpkaWMpCj4+ICAgewo+PiAtCVpTVERfcGFyYW1ldGVycyBwYXJhbXM7Cj4+ICAgCVpT
VERfRFN0cmVhbSAqc3RyZWFtOwo+PiAgIAl2b2lkICp3b3Jrc3BhY2U7Cj4+ICAgCXVuc2lnbmVk
IGludCB3b3Jrc3BhY2Vfc2l6ZTsKPj4gICAKPj4gLQlwYXJhbXMgPSBaU1REX2dldFBhcmFtcyhG
MkZTX1pTVERfREVGQVVMVF9DTEVWRUwsIGRpYy0+Y2xlbiwgMCk7Cj4+ICAgCXdvcmtzcGFjZV9z
aXplID0gWlNURF9EU3RyZWFtV29ya3NwYWNlQm91bmQoTUFYX0NPTVBSRVNTX1dJTkRPV19TSVpF
KTsKPj4gICAKPj4gICAJd29ya3NwYWNlID0gZjJmc19rdm1hbGxvYyhGMkZTX0lfU0IoZGljLT5p
bm9kZSksCj4+Cj4gCj4gLgo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
