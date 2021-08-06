Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFA73E262E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 10:33:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBvI5-0008JY-1a; Fri, 06 Aug 2021 08:33:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mBvI3-0008J8-M7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 08:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oNBlZ7NpjWQXKpdUmUIZJbjcv/eL/UUNubTi7jfJgx4=; b=ItKEf7m894aXeqGixxKPF7fZUm
 Fl56nYUn6xwKf6XVAHc6AWKIFavrMB3d0RHvct6t15u/ARKO7z/3IX0abe0QJvDA7xtmKIB4PL5kK
 beGwrWd92pcXfkix/Az8VVysY4QOzFhGTBp1KmG+B7bgBfo1H85OSOTggYh5aHtuMXp4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oNBlZ7NpjWQXKpdUmUIZJbjcv/eL/UUNubTi7jfJgx4=; b=Css+nPS57RsIOexBH2QKmMIQgt
 5Uv6vSsl0ZiuUZRkb2kxWuXe53R9wcfcaCRYyKAlK9rW7OF+0zIG1H3dtqPiN9ukEry+ZSSdlmOd1
 b5lOGmRw7I25qE2hq6pWwAPBtiPGz63tJOYTlqoTllaZIzUOFwWU6YRYBx4O6r98f7Co=;
Received: from mail-m17654.qiye.163.com ([59.111.176.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBvI0-0001BH-4W
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 08:33:15 +0000
Received: from [172.25.44.145] (unknown [58.251.74.232])
 by mail-m17654.qiye.163.com (Hmail) with ESMTPA id C54EF20211;
 Fri,  6 Aug 2021 16:33:00 +0800 (CST)
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210722032536.150423-1-changfengnan@vivo.com>
 <b2ce8000-226e-6dfa-0052-36cb2faeaf3a@kernel.org>
 <72752bc5-c8b9-43b2-ca82-d7364238649e@vivo.com>
 <1c45e327-00f4-1cc8-b168-9a7b571ba47a@kernel.org>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <51249dea-9190-0094-be8a-59684b5f81ba@vivo.com>
Date: Fri, 6 Aug 2021 16:32:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1c45e327-00f4-1cc8-b168-9a7b571ba47a@kernel.org>
Content-Language: en-US
X-HM-Spam-Status: e1kIDxoPDggYFB8eWUFWSldZCBgUCR5ZQVlLVUtZV1kWDxoPAgseWUFZKD
 YvK1lXWShZQUhPN1dZLVlBSVdZCQ4XHghZQVkyNS06NzI*QUtVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBg6Hww5Qz9ROSsrAkkrTThD
 UQEKCjxVSlVKTUlDSUhDTENLQk1IVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBT0tOSTcG
X-HM-Tid: 0a7b1a9819fad9fdkuwsc54ef20211
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.6 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mBvI0-0001BH-4W
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: compress: avoid duplicate counting
 of valid blocks when read compressed file
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

SSdsbCBjaGVjayB0aGlzIGxhdGVyLgoKVGhhbmtzLgoKT24gMjAyMS84LzYgODo1NywgQ2hhbyBZ
dSB3cm90ZToKPiBPbiAyMDIxLzcvMjMgMTE6MTgsIEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4+IGYy
ZnNfcmVhZF9tdWx0aV9wYWdlcyB3aWxsIGhhbmRsZe+8jGFsbCB0cnVuY2F0ZSBwYWdlIHdpbGwg
YmUgemVybyBvdXQsCj4+IFdoZXRoZXIgcGFydGlhbCBvciBhbGwgcGFnZSBpbiBjbHVzdGVyLgo+
Pgo+Pgo+PiBPbiAyMDIxLzcvMjIgMjE6NDcsIENoYW8gWXUgd3JvdGU6Cj4+PiBPbiAyMDIxLzcv
MjIgMTE6MjUsIEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4+Pj4gU2luY2UgY2x1c3RlciBpcyBiYXNp
YyB1bml0IG9mIGNvbXByZXNzaW9uLCBvbmUgY2x1c3RlciBpcyAKPj4+PiBjb21wcmVzc2VkIG9y
Cj4+Pj4gbm90LCBzbyB3ZSBjYW4gY2FsY3VsYXRlIHZhbGlkIGJsb2NrcyBvbmx5IGZvciBmaXJz
dCBwYWdlIGluIAo+Pj4+IGNsdXN0ZXIsIHRoZQo+Pj4+IG90aGVyIHBhZ2VzIGp1c3Qgc2tpcC4K
Pj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEZlbmduYW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2aXZv
LmNvbT4KPj4+PiAtLS0KPj4+PiDCoMKgIGZzL2YyZnMvZGF0YS5jIHwgMTMgKysrKysrKy0tLS0t
LQo+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5j
Cj4+Pj4gaW5kZXggZDJjZjQ4YzVhMmU0Li5hMDA5OWQ4MzI5ZjAgMTAwNjQ0Cj4+Pj4gLS0tIGEv
ZnMvZjJmcy9kYXRhLmMKPj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+IEBAIC0yMzA0LDEy
ICsyMzA0LDEzIEBAIHN0YXRpYyBpbnQgZjJmc19tcGFnZV9yZWFkcGFnZXMoc3RydWN0IGlub2Rl
Cj4+Pj4gKmlub2RlLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAocmV0KQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9
Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gZjJmc19pc19jb21wcmVzc2VkX2Ns
dXN0ZXIoaW5vZGUsIHBhZ2UtPmluZGV4KTsKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAocmV0IDwgMCkKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0
X2Vycm9yX3BhZ2U7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAoIXJldCkK
Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gcmVhZF9zaW5nbGVfcGFn
ZTsKPj4+Cj4+PiBIb3cgYWJvdXQgdHJ1bmNhdGlvbiByYWNlcyB3aXRoIHJlYWQ/Cj4gCj4gTG9v
ayBpbnRvIHRoaXMgYWdhaW4sIGl0IGxvb2tzIGZpbmUsIHRydW5jYXRpb24gdHJpZXMgdG8gZ3Jh
YiBhbGwgcGFnZXMgCj4gbG9jawo+IG9mIGNsdXN0ZXIsIGJ1dCByZWFkYWhlYWQgaGFzIGFscmVh
ZHkgaGVsZCBzb21lL2FsbCBvZiB0aGVtLCBzbyB0aGVyZSBpcyBubwo+IHN1Y2ggcmFjZSBjb25k
aXRpb24uCj4gCj4gU28gY29tcHJlc3NlZCBjbHVzdGVyIGNhc2UgbG9va3MgZmluZSB0byBtZSwg
YnV0IHdlIHN0aWxsIG5lZWQgdG8gY2FsbAo+IGYyZnNfaXNfY29tcHJlc3NlZF9jbHVzdGVyKCkg
ZXZlcnkgdGltZSBmb3Igbm9uLWNvbXByZXNzZWQgY2x1c3RlciwgY291bGQKPiB5b3UgcGxlYXNl
IGNoZWNrIHRoYXQgYXMgd2VsbD8KPiAKPiBUaGFua3MsCj4gCj4+Pgo+Pj4gVGhhbmtzLAo+Pj4K
Pj4+PiAtCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGNjLmNsdXN0ZXJfaWR4ID09
IE5VTExfQ0xVU1RFUikgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
ID0gZjJmc19pc19jb21wcmVzc2VkX2NsdXN0ZXIoaW5vZGUsIHBhZ2UtPmluZGV4KTsKPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHNldF9lcnJvcl9wYWdlOwo+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAoIXJldCkKPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byByZWFkX3NpbmdsZV9wYWdl
Owo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldCA9IGYyZnNfaW5pdF9jb21wcmVzc19jdHgoJmNjKTsKPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+Pj4KPj4+Cj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
