Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC92823420E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 Jul 2020 11:08:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k1R1s-0005kC-4L; Fri, 31 Jul 2020 09:08:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k1R1p-0005jg-1X
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 31 Jul 2020 09:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P0dggbquqCkeY3gNvgfN5CC9Z5wBaHDsa8RJj/CTEaA=; b=Fqmw0U3p8Rigb7YtZFVKPHD4xn
 BzgSgiPBnzqoQrA/BatyW8u6sJDrmJ3PM+JK5evZFshbeF1jSXmzJchqgPrptaNBzjDeF2/1KJRxq
 RLVbRtdH4enTngUnrtjLBhTW9reHszndUmkxHwRjqodlflKOzS9b+ZD8CL2keDOrA4mo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P0dggbquqCkeY3gNvgfN5CC9Z5wBaHDsa8RJj/CTEaA=; b=TjG4U/Kv4TNQz8TXRlUIwWss6Y
 ZFzJAw1kRwVeA9c2x/RrVWTKwuMurlPI7xXDLwlxwgIweb4xjn9OmG1Zl4c+jJDcudthQ2MPZK6tM
 CkNauPrtlSGxiqmwLF1Wv/AJeZg/WqJ1uHRcAyCCCVi20Mg0CoCkZRZ5Tp/529GDXA7o=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k1R1n-00FhWi-1Z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 31 Jul 2020 09:08:37 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CCE2ABA0FB58781EB0CD;
 Fri, 31 Jul 2020 17:08:18 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 31 Jul
 2020 17:08:13 +0800
To: =?UTF-8?Q?Michael_La=c3=9f?= <bevan@bi-co.net>, Norbert Lange
 <nolange79@gmail.com>
References: <f3094e40-13ff-ea31-faf1-9e78867f4a8d@huawei.com>
 <20200724081125.3376-1-nolange79@gmail.com>
 <c05c0e81-ea55-99e0-0060-df803b3586b6@huawei.com>
 <8e0c3d4372c46ba587e26f5633d3eadf21fb648c.camel@bi-co.net>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f2ccd10d-8a14-be42-d122-0822dc8137bb@huawei.com>
Date: Fri, 31 Jul 2020 17:08:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <8e0c3d4372c46ba587e26f5633d3eadf21fb648c.camel@bi-co.net>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -1.0 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: die.net]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k1R1n-00FhWi-1Z
Subject: Re: [f2fs-dev] Possible issues with fsck of f2fs root
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

T24gMjAyMC83LzI3IDIzOjAyLCBNaWNoYWVsIExhw58gd3JvdGU6Cj4gQW0gU2Ftc3RhZywgZGVu
IDI1LjA3LjIwMjAsIDEwOjA2ICswODAwIHNjaHJpZWIgQ2hhbyBZdToKPj4gT24gMjAyMC83LzI0
IDE2OjExLCBOb3JiZXJ0IExhbmdlIHdyb3RlOgo+Pj4KPj4+ICQgZnNjay5mMmZzIC1hIC9kZXYv
bW1jYmxrMHA1OyBlY2hvICQ/Cj4+PiBJbmZvOiBGaXggdGhlIHJlcG9ydGVkIGNvcnJ1cHRpb24u
Cj4+PiBJbmZvOiBNb3VudGVkIGRldmljZSEKPj4+IEluZm86IENoZWNrIEZTIG9ubHkgb24gUk8g
bW91bnRlZCBkZXZpY2UKPj4+IEVycm9yOiBGYWlsZWQgdG8gb3BlbiB0aGUgZGV2aWNlIQo+Pj4g
MjU1Cj4+Cj4+IEkgdHJpZWQgZXh0NCwgaXQgYWN0cyB0aGUgc2FtZSBhcyBmMmZzLi4uIGV4Y2Vw
dCBkaWZmZXJlbnQgcmV0dXJuCj4+IHZhbHVlLgo+Pgo+PiBmc2NrIC10IGV4dDQgLWEgL2Rldi96
cmFtMTsgZWNobyAkPwo+PiBmc2NrIDEuNDUuMCAoNi1NYXItMjAxOSkKPj4gL2Rldi96cmFtMSBp
cyBtb3VudGVkLgo+PiBlMmZzY2s6IENhbm5vdCBjb250aW51ZSwgYWJvcnRpbmcuCj4+Cj4+Cj4+
IDgKPj4KPj4gZnNjayAtdCBleHQ0IC1hIC1mIC9kZXYvenJhbTE7IGVjaG8gJD8KPj4gZnNjayAx
LjQ1LjAgKDYtTWFyLTIwMTkpCj4+IFdhcm5pbmchICAvZGV2L3pyYW0xIGlzIG1vdW50ZWQuCj4+
IC9kZXYvenJhbTE6IDExLzExNzk2NDggZmlsZXMgKDAuMCUgbm9uLWNvbnRpZ3VvdXMpLCAxMTgw
NjUvNDcxODU5Mgo+PiBibG9ja3MKPj4gMAo+Pgo+PiBJJ2QgbGlrZSB0byBrbm93IHdoYXQgYmVo
YXZpb3Igb2YgZnNjayBkb2VzIHN5c3RlbWQgZXhwZWN0Pwo+PiBmc2NrIC1hIHNob3VsZCB3b3Jr
IChjaGVjayAmIHJlcG9ydCBvciBjaGVjayAmIHJlcG9ydCAmIHJlcGFpcmUpCj4+IG9uIHJlYWRv
bmx5IG1vdW50ZWQgZGV2aWNlPwo+IAo+IEkgdGhpbmsgdGhlIHJldHVybiB2YWx1ZSBpcyBleGFj
dGx5IHRoZSBwcm9ibGVtIGhlcmUuIFNlZSBmc2NrKDgpICgKPiBodHRwczovL2xpbnV4LmRpZS5u
ZXQvbWFuLzgvZnNjaykgd2hpY2ggc3BlY2lmaWVzIHRoZSByZXR1cm4gdmFsdWVzLgo+IFN5c3Rl
bWQgbG9va3MgYXQgdGhlc2UgYW5kIGRlY2lkZXMgaG93IHRvIHByb2NlZWQ6Cj4gCj4gaHR0cHM6
Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9ibG9iL2E4NTlhYmYwNjJjZWYxNTExZTQ4Nzlj
NGVlMzljNjAzNmViZWFlYzgvc3JjL2ZzY2svZnNjay5jI0w0MDcKPiAKPiBUaGF0IG1lYW5zLCBp
ZiBmc2NrLmYyZnMgcmV0dXJucyAyNTUsIHRoZW4KPiB0aGUgRlNDS19TWVNURU1fU0hPVUxEX1JF
Qk9PVCBiaXQgaXMgc2V0IGFuZCBzeXN0ZW1kIHdpbGwgcmVib290LgoKVGhhbmtzIGZvciBwb2lu
dGluZyB0aGlzIG91dCwgd2lsbCBmaXggdGhpcyBzb29uLgoKVGhhbmtzLAoKPiAKPiBCZXN0IHJl
Z2FyZHMsCj4gTWljaGFlbAo+IAo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
