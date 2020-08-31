Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1DF2571E7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Aug 2020 04:31:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCZbk-0007ms-8J; Mon, 31 Aug 2020 02:31:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kCZbj-0007mh-3h
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 02:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M6z100x0GH/0V8MYr3y0ixSYX8Zue1goKOxdCo/zhKU=; b=IgqaQVLEp76lk2RDzvJpPjxoEg
 eRMB8KOLG9ltOteoqt17tlDXNMxDSjasdrraxFWxU1bBqm4Ze0qvPzIpbFgwboKsidmKpfAUZa2bC
 1cNwaSQJb+L2FbJMvUawakauUxh4thfWXfTOamoS/QQ58KG0/HtR41jbyV8+6zCVwpc0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M6z100x0GH/0V8MYr3y0ixSYX8Zue1goKOxdCo/zhKU=; b=iO4AG8VlP2WS/Wydlr3T3wsctc
 qZWBHdg/PwXK67kYBgYxuB20ZsoU1xJJN5kSEGWdhyGMC2IIcInYnvNQsng4wNFzyKhGjZ8kM1gho
 H9xA5a0ssm0qfTfPWQljMiInEGMhd0NsDwRlBxVndV1eQjICT71nQjHrjvNmtgm4IA/4=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kCZbe-0061Po-F2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 02:31:43 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 920CFA952F9902B1F4F0;
 Mon, 31 Aug 2020 10:31:22 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 31 Aug
 2020 10:31:17 +0800
To: Daeho Jeong <daeho43@gmail.com>
References: <20200828054629.583577-1-daeho43@gmail.com>
 <61996dcd-6db1-13fc-8239-7e684f3ec49e@kernel.org>
 <CACOAw_wc29AROzFhcGyC73i_vYZC1NmHP60uQfP7X-j6y6=kSA@mail.gmail.com>
 <bd1a8ffa-83ff-b774-9bed-ed68025d0c7a@huawei.com>
 <CACOAw_y=O35_SFxdfsVER4+a+n-eE6f48NXF6CsAnj=Ms-dgkA@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c4f58675-9df5-e3af-45fc-6fa924e3ee68@huawei.com>
Date: Mon, 31 Aug 2020 10:31:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOAw_y=O35_SFxdfsVER4+a+n-eE6f48NXF6CsAnj=Ms-dgkA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1kCZbe-0061Po-F2
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent compressed file from being
 disabled after releasing cblocks
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
Cc: kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC84LzMxIDk6NDQsIERhZWhvIEplb25nIHdyb3RlOgo+IFNvcnJ5LCBJIGRpZG4ndCBn
ZXQgeW91ciBwb2ludC4KPiAKPiBTbywgZG8geW91IHRoaW5rIHRoaXMgcGF0Y2ggaXMgb2s/IEFu
ZCB3ZSBuZWVkIHRvIGNvbnNpZGVyIHRoYXQgd2UKPiBuZWVkIG1vcmUgaW1tdXRhYmxlIGNoZWNr
cyBmb3Igb3RoZXIgY2FzZXM/CgpZZXMsIHRoaXMgcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4KCkJ1
dCwgSU1PLCB3ZSBzaG91bGQgZGlzY3VzcyBhYm91dCB3aGV0aGVyIHdlIG5lZWQgdG8gYWRkIG1v
cmUgaW1tdXRhYmxlIGNoZWNrcwpmb3Igb3RoZXIgaW9jdGwgY2FzZXMuCgotIG9wZW4oT19SRFdS
KQotIGlvY3RsKEZTX0lPQ19TRVRGTEFHUywgRjJGU19DT01QUl9GTCkKLSB3cml0ZSgpCi0gaW9j
dGwoUkVMRUFTRV9DT01QUkVTU19CTE9DS1MpIC0tIGlub2RlIGlzIGltbXV0YWJsZSBub3cKLSBp
b2N0bChGU19JT0NfU0VURkxBR1MsIH5GMkZTX0NPTVBSX0ZMKSAtLSBTaG91bGQgd2UgYWxsb3cg
dG8gdXBkYXRlIGltbXV0YWJsZSBpbm9kZT8KYXMgd2Uga25vdywgbm9ybWFsbHksIGltbXV0YWJs
ZSBpbm9kZSBzaG91bGQgZGVueSBvcGVuKE9fV1JPTkxZIG9yIE9fUkRXUikgYW5kIGxhdGVyIHVw
ZGF0ZS4KClRoYW5rcywKCj4gT3IgeW91IHdhbnQgdG8gcmVtb3ZlIHRoaXMgaW1tdXRhYmxlIGNo
ZWNrIGZyb20gaGVyZSBhbmQgYWRkIHRoZSBjaGVjawo+IHRvIGVhY2ggaW9jdGwgZnVuY3Rpb25z
PyA+Cj4gMjAyMOuFhCA47JuUIDMx7J28ICjsm5QpIOyYpOyghCAxMDoyNCwgQ2hhbyBZdSA8eXVj
aGFvMEBodWF3ZWkuY29tPuuLmOydtCDsnpHshLE6Cj4+Cj4+IE9uIDIwMjAvOC8zMSA3OjQyLCBE
YWVobyBKZW9uZyB3cm90ZToKPj4+IERvIHlvdSBoYXZlIGFueSByZWFzb24gbm90IHRvIHB1dCB0
aGlzIGNoZWNrIGhlcmU/Cj4+Cj4+IE5vLCB0aGUgcGxhY2UgaXMgb2theSB0byBtZS4gOikKPj4K
Pj4+IElmIHdlIGRvIHRoaXMgY2hlY2sgb3V0c2lkZSBvZiBoZXJlLCB3ZSBkZWZpbml0ZWx5IG1h
a2UgYSBtaXN0YWtlCj4+PiBzb29uZXIgb3IgbGF0ZXIuCj4+Cj4+IEkganVzdCB3YW50IHRvIHNl
ZSB3aGV0aGVyIHdlIGNhbiBjb3ZlciBhbGwgY2FzZXMgaW4gd2hlcmUgd2UgbWlzc2VkIHRvCj4+
IGFkZCBpbW11dGFibGUgY2hlY2sgY29uZGl0aW9uIGlmIG5lY2Vzc2FyeS4KPj4KPj4gVGhhbmtz
LAo+Pgo+Pj4KPj4+IDIwMjDrhYQgOOyblCAzMOydvCAo7J28KSDsmKTtm4QgMTI6MjQsIENoYW8g
WXUgPGNoYW9Aa2VybmVsLm9yZz7ri5jsnbQg7J6R7ISxOgo+Pj4+Cj4+Pj4gT24gMjAyMC04LTI4
IDEzOjQ2LCBEYWVobyBKZW9uZyB3cm90ZToKPj4+Pj4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhv
amVvbmdAZ29vZ2xlLmNvbT4KPj4+Pj4KPj4+Pj4gQWZ0ZXIgcmVsZWFzaW5nIGNibG9ja3MsIHRo
ZSBjb21wcmVzc2VkIGZpbGUgY2FuIGJlIGFjY2lkZW50YWxseQo+Pj4+PiBkaXNhYmxlZCBpbiBj
b21wcmVzc2lvbiBtb2RlLCBzaW5jZSBpdCBoYXMgemVybyBjYmxvY2tzLiBBcyB3ZSBhcmUKPj4+
Pj4gdXNpbmcgSU1NVVRBQkxFIGZsYWcgdG8gcHJlc2VudCByZWxlYXNlZCBjYmxvY2tzIHN0YXRl
LCB3ZSBjYW4gYWRkCj4+Pj4+IElNTVVUQUJMRSBzdGF0ZSBjaGVjayB3aGVuIGNvbnNpZGVyaW5n
IHRoZSBjb21wcmVzc2VkIGZpbGUgZGlzYWJsaW5nLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gICAg
ZnMvZjJmcy9mMmZzLmggfCAyICsrCj4+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9m
MmZzLmgKPj4+Pj4gaW5kZXggMDI4MTFjZTE1MDU5Li4xNGQzMDc0MGJhMDMgMTAwNjQ0Cj4+Pj4+
IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+Pj4+IEBA
IC0zOTM2LDYgKzM5MzYsOCBAQCBzdGF0aWMgaW5saW5lIHU2NCBmMmZzX2Rpc2FibGVfY29tcHJl
c3NlZF9maWxlKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4+Pj4+ICAgICAgICAgaWYgKCFmMmZzX2Nv
bXByZXNzZWRfZmlsZShpbm9kZSkpCj4+Pj4+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPj4+
Pj4gICAgICAgICBpZiAoU19JU1JFRyhpbm9kZS0+aV9tb2RlKSkgewo+Pj4+PiArICAgICAgICAg
ICAgIGlmIChJU19JTU1VVEFCTEUoaW5vZGUpKQo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIDE7Cj4+Pj4KPj4+PiBJdCBsb29rcyBtb3N0IG9mIGNhbGxlcnMgYXJlIGZyb20gaW9j
dGwsIHNob3VsZCB3ZSBhZGQgaW1tdXRhYmxlIGNoZWNrIGluIGYyZnMKPj4+PiBpb2N0bCBpbnRl
cmZhY2VzIGlmIG5lY2Vzc2FyeT8gb3IgSSBtaXNzZWQgZXhpc3RlZCBjaGVjay4KPj4+Pgo+Pj4+
IFRoYW5rcywKPj4+Pgo+Pj4+PiAgICAgICAgICAgICAgICAgaWYgKGdldF9kaXJ0eV9wYWdlcyhp
bm9kZSkpCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAxOwo+Pj4+PiAgICAg
ICAgICAgICAgICAgaWYgKGZpLT5pX2NvbXByX2Jsb2NrcykKPj4+Pj4KPj4+Cj4+Pgo+Pj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IExpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldAo+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo+Pj4KPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
