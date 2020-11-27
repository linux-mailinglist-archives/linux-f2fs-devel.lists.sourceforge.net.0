Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AD12C6225
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Nov 2020 10:44:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kiaJD-0001F9-2z; Fri, 27 Nov 2020 09:44:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kiaJC-0001F2-8v
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Nov 2020 09:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KW+smw2diFul8LJH+4uO8WQ+c77h0DoFXNHlwoEc3+U=; b=AQMWJ+QfyRawZTDFppNQF6KMZI
 BNcC4P8LCiaa4zpIYgxzzT4juxecrVkyEEo5BqP9zT59q3kQtlRG9XTeCFumvJZjku8uimM1Ukyx9
 TM2OAeVz1JhkQ9u+CHoighqkLVGvdZFuruFXUMjkbH7Ep5W8p82lgVNmrNZd0Gqn3J+k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KW+smw2diFul8LJH+4uO8WQ+c77h0DoFXNHlwoEc3+U=; b=nJlN9IhpwRvsXX11h4Jz43aK6O
 yFJjFP6s2s5zxSpmvnfrNXTKI9JXuijC2j0YhW6Q0N58NU8b6jxLzhj/5TA6XHK03ycf4fnNZlFeD
 8GPOh+U8xyq4FTKolmwjHCOOvTwBIB5fKfv0LArupDtxiA45uZxJYEYIyuLuPk3ueJvw=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kiaJ7-001By7-AQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Nov 2020 09:44:54 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cj8pp4YjYzhZRN;
 Fri, 27 Nov 2020 17:44:18 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 27 Nov
 2020 17:44:30 +0800
To: Daeho Jeong <daeho43@gmail.com>
References: <20201016051455.1913795-1-daeho43@gmail.com>
 <f8359dde-7e0c-b2fc-451f-2984c50fa552@huawei.com>
 <CACOAw_wrTSZ3DWBUJA=ePe=fDRgEgqCfsbSqKmE6+ACW8A-RQg@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2d354bbe-9d1e-f3e0-b918-b9ec023a93ba@huawei.com>
Date: Fri, 27 Nov 2020 17:44:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOAw_wrTSZ3DWBUJA=ePe=fDRgEgqCfsbSqKmE6+ACW8A-RQg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kiaJ7-001By7-AQ
Subject: Re: [f2fs-dev] [PATCH] f2fs: add compr_inode and compr_blocks sysfs
 nodes
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RGFlaG8sCgpIb3cgYWJvdXQgdXBkYXRpbmcgdGhpcyBwYXRjaCBiYXNlZCBvbiBiZWxvdyBwYXRj
aD8KCglmMmZzOiBpbnRyb2R1Y2UgYSBuZXcgcGVyLXNiIGRpcmVjdG9yeSBpbiBzeXNmcwoKT24g
MjAyMC8xMC8yMiAxMDo1MywgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gWWVwLCBJdCBzb3VuZHMgZ29v
ZCB0byBtZS4KPiAKPiAyMDIw64WEIDEw7JuUIDIx7J28ICjsiJgpIOyYpO2bhCAzOjA4LCBDaGFv
IFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+64uY7J20IOyekeyEsToKPj4KPj4gT24gMjAyMC8xMC8x
NiAxMzoxNCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+PiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9q
ZW9uZ0Bnb29nbGUuY29tPgo+Pj4KPj4+IEFkZGVkIGNvbXByX2lub2RlIHRvIHNob3cgY29tcHJl
c3NlZCBpbm9kZSBjb3VudCBhbmQgY29tcHJfYmxvY2tzIHRvCj4+PiBzaG93IGNvbXByZXNzZWQg
YmxvY2sgY291bnQgaW4gc3lzZnMuCj4+Cj4+IEFzIHRoZXJlIGFyZSBzbyBtYW55IGVudHJpZXMg
aW4gLi4vZjJmcy88ZGlzaz4vIGRpcmVjdG9yeSwgaXQgbG9va3MgYSBtZXNzCj4+IHRoZXJlLCBJ
IHN1Z2dlc3QgdGhhdCB3ZSBjYW4gYWRkIGEgbmV3IGRpcmVjdG9yeSAnc3RhdHMnIGluIC4uL2Yy
ZnMvPGRpc2s+LywKPj4gaW4gd2hlcmUgd2UgY2FuIHN0b3JlIGFsbCByZWFkb25seSBzdGF0cyBy
ZWxhdGVkIGVudHJpZXMgdGhlcmUgbGF0ZXIuCj4+Cj4+IEhvdyBkbyB5b3UgdGhpbms/Cj4+Cj4+
IFRoYW5rcywKPj4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9u
Z0Bnb29nbGUuY29tPgo+Pj4gLS0tCj4+PiAgICBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5
c2ZzLWZzLWYyZnMgfCAxMCArKysrKysrKysrCj4+PiAgICBmcy9mMmZzL3N5c2ZzLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAxNyArKysrKysrKysrKysrKysrKwo+Pj4gICAgMiBmaWxlcyBj
aGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcv
c3lzZnMtZnMtZjJmcwo+Pj4gaW5kZXggODM0ZDBiZWNhZTZkLi5hMDFjMjY0ODRjNjkgMTAwNjQ0
Cj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMKPj4+ICsr
KyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+Pj4gQEAgLTM1MCwz
ICszNTAsMTMgQEAgRGF0ZTogICAgICAgICAgICBBcHJpbCAyMDIwCj4+PiAgICBDb250YWN0OiAg
ICAiRGFlaG8gSmVvbmciIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+PiAgICBEZXNjcmlwdGlv
bjogICAgICAgIEdpdmUgYSB3YXkgdG8gY2hhbmdlIGlvc3RhdF9wZXJpb2QgdGltZS4gM3NlY3Mg
YnkgZGVmYXVsdC4KPj4+ICAgICAgICAgICAgICAgIFRoZSBuZXcgaW9zdGF0IHRyYWNlIGdpdmVz
IHN0YXRzIGdhcCBnaXZlbiB0aGUgcGVyaW9kLgo+Pj4gKwo+Pj4gK1doYXQ6ICAgICAgICAgICAg
ICAgIC9zeXMvZnMvZjJmcy88ZGlzaz4vY29tcHJfaW5vZGUKPj4+ICtEYXRlOiAgICAgICAgICAg
ICAgICBPY3RvYmVyIDIwMjAKPj4+ICtDb250YWN0OiAgICAgIkRhZWhvIEplb25nIiA8ZGFlaG9q
ZW9uZ0Bnb29nbGUuY29tPgo+Pj4gK0Rlc2NyaXB0aW9uOiBTaG93IGNvbXByZXNzZWQgaW5vZGUg
Y291bnQKPj4+ICsKPj4+ICtXaGF0OiAgICAgICAgICAgICAgICAvc3lzL2ZzL2YyZnMvPGRpc2s+
L2NvbXByX2Jsb2Nrcwo+Pj4gK0RhdGU6ICAgICAgICAgICAgICAgIE9jdG9iZXIgMjAyMAo+Pj4g
K0NvbnRhY3Q6ICAgICAiRGFlaG8gSmVvbmciIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+PiAr
RGVzY3JpcHRpb246IFNob3cgY29tcHJlc3NlZCBibG9jayBjb3VudAo+Pj4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvc3lzZnMuYyBiL2ZzL2YyZnMvc3lzZnMuYwo+Pj4gaW5kZXggOTRjOThlNDEyYWEx
Li43MTM5YTI5YTAwZDMgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL3N5c2ZzLmMKPj4+ICsrKyBi
L2ZzL2YyZnMvc3lzZnMuYwo+Pj4gQEAgLTIyMyw2ICsyMjMsMTkgQEAgc3RhdGljIHNzaXplX3Qg
YXZnX3ZibG9ja3Nfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICphLAo+Pj4gICAgICAgIGYyZnNfdXBk
YXRlX3NpdF9pbmZvKHNiaSk7Cj4+PiAgICAgICAgcmV0dXJuIHNwcmludGYoYnVmLCAiJWxsdVxu
IiwgKHVuc2lnbmVkIGxvbmcgbG9uZykoc2ktPmF2Z192YmxvY2tzKSk7Cj4+PiAgICB9Cj4+PiAr
Cj4+PiArc3RhdGljIHNzaXplX3QgY29tcHJfaW5vZGVfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICph
LAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpLCBjaGFyICpidWYpCj4+PiArewo+Pj4gKyAgICAgcmV0dXJuIHNwcmludGYoYnVmLCAiJXVc
biIsIGF0b21pY19yZWFkKCZzYmktPmNvbXByX2lub2RlKSk7Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0
YXRpYyBzc2l6ZV90IGNvbXByX2Jsb2Nrc19zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGNo
YXIgKmJ1ZikKPj4+ICt7Cj4+PiArICAgICByZXR1cm4gc3ByaW50ZihidWYsICIlbGx1XG4iLCBh
dG9taWM2NF9yZWFkKCZzYmktPmNvbXByX2Jsb2NrcykpOwo+Pj4gK30KPj4+ICsKPj4+ICAgICNl
bmRpZgo+Pj4KPj4+ICAgIHN0YXRpYyBzc2l6ZV90IG1haW5fYmxrYWRkcl9zaG93KHN0cnVjdCBm
MmZzX2F0dHIgKmEsCj4+PiBAQCAtNTkxLDYgKzYwNCw4IEBAIEYyRlNfU1RBVF9BVFRSKFNUQVRf
SU5GTywgZjJmc19zdGF0X2luZm8sIGdjX2JhY2tncm91bmRfY2FsbHMsIGJnX2djKTsKPj4+ICAg
IEYyRlNfR0VORVJBTF9ST19BVFRSKG1vdmVkX2Jsb2Nrc19iYWNrZ3JvdW5kKTsKPj4+ICAgIEYy
RlNfR0VORVJBTF9ST19BVFRSKG1vdmVkX2Jsb2Nrc19mb3JlZ3JvdW5kKTsKPj4+ICAgIEYyRlNf
R0VORVJBTF9ST19BVFRSKGF2Z192YmxvY2tzKTsKPj4+ICtGMkZTX0dFTkVSQUxfUk9fQVRUUihj
b21wcl9pbm9kZSk7Cj4+PiArRjJGU19HRU5FUkFMX1JPX0FUVFIoY29tcHJfYmxvY2tzKTsKPj4+
ICAgICNlbmRpZgo+Pj4KPj4+ICAgICNpZmRlZiBDT05GSUdfRlNfRU5DUllQVElPTgo+Pj4gQEAg
LTY3NSw2ICs2OTAsOCBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqZjJmc19hdHRyc1tdID0g
ewo+Pj4gICAgICAgIEFUVFJfTElTVChtb3ZlZF9ibG9ja3NfZm9yZWdyb3VuZCksCj4+PiAgICAg
ICAgQVRUUl9MSVNUKG1vdmVkX2Jsb2Nrc19iYWNrZ3JvdW5kKSwKPj4+ICAgICAgICBBVFRSX0xJ
U1QoYXZnX3ZibG9ja3MpLAo+Pj4gKyAgICAgQVRUUl9MSVNUKGNvbXByX2lub2RlKSwKPj4+ICsg
ICAgIEFUVFJfTElTVChjb21wcl9ibG9ja3MpLAo+Pj4gICAgI2VuZGlmCj4+PiAgICAgICAgTlVM
TCwKPj4+ICAgIH07Cj4+Pgo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
