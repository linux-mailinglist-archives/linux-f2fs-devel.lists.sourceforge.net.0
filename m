Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F45257181
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Aug 2020 03:24:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCYZ2-0006XU-E8; Mon, 31 Aug 2020 01:24:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kCYYx-0006XJ-NP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 01:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0IWwRhMadsn6luL1oJDPwsgFWhljeGqIyBLiCkf8WWE=; b=eXpD8/A1xlroxAqLD6E+5Jn5HP
 2iMkpBTaQjULObtyoMPL41MYEit0dv7kU8dQUp3jlKP91xFsFc666GywbxeZPACL836o3TfoxkG0r
 ooATXCE7Y8ta8JcXGQ7EjidBUgnnL6ybJjr3TIjkGD3AU8NSHsRFYVqI8b4vf8x1gfko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0IWwRhMadsn6luL1oJDPwsgFWhljeGqIyBLiCkf8WWE=; b=kx3YhKNCIfZPM/DUy916sKN4FO
 KRjgXLFbwLsBRmNOoUvVxSWLgpxSUzzSuivsQH3xi5u/7PeG/iji2FYLyi+Y09hmpGQ5M7uWx80Gn
 mhSfqazgzSKCEPNY/4G1VhWj1j4GZWdQNtNuAUEBNDgvs/NLbQc3ZG2eitXQwi82D8xU=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kCYYu-005yR0-HU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 01:24:47 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9BB0270C4E370445B9FE;
 Mon, 31 Aug 2020 09:24:34 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 31 Aug
 2020 09:24:28 +0800
To: Daeho Jeong <daeho43@gmail.com>, Chao Yu <chao@kernel.org>
References: <20200828054629.583577-1-daeho43@gmail.com>
 <61996dcd-6db1-13fc-8239-7e684f3ec49e@kernel.org>
 <CACOAw_wc29AROzFhcGyC73i_vYZC1NmHP60uQfP7X-j6y6=kSA@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <bd1a8ffa-83ff-b774-9bed-ed68025d0c7a@huawei.com>
Date: Mon, 31 Aug 2020 09:24:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOAw_wc29AROzFhcGyC73i_vYZC1NmHP60uQfP7X-j6y6=kSA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1kCYYu-005yR0-HU
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
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC84LzMxIDc6NDIsIERhZWhvIEplb25nIHdyb3RlOgo+IERvIHlvdSBoYXZlIGFueSBy
ZWFzb24gbm90IHRvIHB1dCB0aGlzIGNoZWNrIGhlcmU/CgpObywgdGhlIHBsYWNlIGlzIG9rYXkg
dG8gbWUuIDopCgo+IElmIHdlIGRvIHRoaXMgY2hlY2sgb3V0c2lkZSBvZiBoZXJlLCB3ZSBkZWZp
bml0ZWx5IG1ha2UgYSBtaXN0YWtlCj4gc29vbmVyIG9yIGxhdGVyLgoKSSBqdXN0IHdhbnQgdG8g
c2VlIHdoZXRoZXIgd2UgY2FuIGNvdmVyIGFsbCBjYXNlcyBpbiB3aGVyZSB3ZSBtaXNzZWQgdG8K
YWRkIGltbXV0YWJsZSBjaGVjayBjb25kaXRpb24gaWYgbmVjZXNzYXJ5LgoKVGhhbmtzLAoKPiAK
PiAyMDIw64WEIDjsm5QgMzDsnbwgKOydvCkg7Jik7ZuEIDEyOjI0LCBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+64uY7J20IOyekeyEsToKPj4KPj4gT24gMjAyMC04LTI4IDEzOjQ2LCBEYWVobyBK
ZW9uZyB3cm90ZToKPj4+IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+
Cj4+Pgo+Pj4gQWZ0ZXIgcmVsZWFzaW5nIGNibG9ja3MsIHRoZSBjb21wcmVzc2VkIGZpbGUgY2Fu
IGJlIGFjY2lkZW50YWxseQo+Pj4gZGlzYWJsZWQgaW4gY29tcHJlc3Npb24gbW9kZSwgc2luY2Ug
aXQgaGFzIHplcm8gY2Jsb2Nrcy4gQXMgd2UgYXJlCj4+PiB1c2luZyBJTU1VVEFCTEUgZmxhZyB0
byBwcmVzZW50IHJlbGVhc2VkIGNibG9ja3Mgc3RhdGUsIHdlIGNhbiBhZGQKPj4+IElNTVVUQUJM
RSBzdGF0ZSBjaGVjayB3aGVuIGNvbnNpZGVyaW5nIHRoZSBjb21wcmVzc2VkIGZpbGUgZGlzYWJs
aW5nLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2ds
ZS5jb20+Cj4+PiAtLS0KPj4+ICAgZnMvZjJmcy9mMmZzLmggfCAyICsrCj4+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZz
LmggYi9mcy9mMmZzL2YyZnMuaAo+Pj4gaW5kZXggMDI4MTFjZTE1MDU5Li4xNGQzMDc0MGJhMDMg
MTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgK
Pj4+IEBAIC0zOTM2LDYgKzM5MzYsOCBAQCBzdGF0aWMgaW5saW5lIHU2NCBmMmZzX2Rpc2FibGVf
Y29tcHJlc3NlZF9maWxlKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4+PiAgICAgICAgaWYgKCFmMmZz
X2NvbXByZXNzZWRfZmlsZShpbm9kZSkpCj4+PiAgICAgICAgICAgICAgICByZXR1cm4gMDsKPj4+
ICAgICAgICBpZiAoU19JU1JFRyhpbm9kZS0+aV9tb2RlKSkgewo+Pj4gKyAgICAgICAgICAgICBp
ZiAoSVNfSU1NVVRBQkxFKGlub2RlKSkKPj4+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
MTsKPj4KPj4gSXQgbG9va3MgbW9zdCBvZiBjYWxsZXJzIGFyZSBmcm9tIGlvY3RsLCBzaG91bGQg
d2UgYWRkIGltbXV0YWJsZSBjaGVjayBpbiBmMmZzCj4+IGlvY3RsIGludGVyZmFjZXMgaWYgbmVj
ZXNzYXJ5PyBvciBJIG1pc3NlZCBleGlzdGVkIGNoZWNrLgo+Pgo+PiBUaGFua3MsCj4+Cj4+PiAg
ICAgICAgICAgICAgICBpZiAoZ2V0X2RpcnR5X3BhZ2VzKGlub2RlKSkKPj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIDE7Cj4+PiAgICAgICAgICAgICAgICBpZiAoZmktPmlfY29tcHJf
YmxvY2tzKQo+Pj4KPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
