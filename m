Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 418282C7CA6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Nov 2020 03:06:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kjYa9-0005As-IC; Mon, 30 Nov 2020 02:06:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kjYa8-0005Ae-3j
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 02:06:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OrvQla5CHsKHe0xdLtRdz/d8Ju49sgl15CnpFfI2GOU=; b=l2RNiFvv6Ctg22jOBrkE84RFY+
 jBOXtpjdUUpXuw+lIIS2ppO11CmA0+ON0Vlb5SZxF1cG/uhFr++FKCGCmlMRvSJFQWu91jAVhPle9
 /4xax2Gbkt9ASmri38Rq8Kdyra6k3rsoe33QMTvat9HkIkxGEOCfpxriro+Y8799Vb9U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OrvQla5CHsKHe0xdLtRdz/d8Ju49sgl15CnpFfI2GOU=; b=UFEyYi3yLjuLmToLhfRatqTc+r
 BzAvKaWkwtJhAY9JsvDV6z4RJwvBEcofO0AObtV4cBJ0kJ/DNvbgf475DGzyaBYhUF3iY0m6C2KBm
 OXcj3VVFCoNb+d1of9rekkNF6I1QKf2FWqjmOQBk1Jx6j1Wbt0mQ+xokIIcfY7p3VMp0=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kjYa2-00AJAO-C8
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 02:06:24 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CkpVJ6JF8z6vcd;
 Mon, 30 Nov 2020 10:05:44 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 30 Nov
 2020 10:06:00 +0800
To: Daeho Jeong <daeho43@gmail.com>
References: <20201016051455.1913795-1-daeho43@gmail.com>
 <f8359dde-7e0c-b2fc-451f-2984c50fa552@huawei.com>
 <CACOAw_wrTSZ3DWBUJA=ePe=fDRgEgqCfsbSqKmE6+ACW8A-RQg@mail.gmail.com>
 <2d354bbe-9d1e-f3e0-b918-b9ec023a93ba@huawei.com>
 <CACOAw_x1Zkn-yY-cmWwQUByHVg5mUDqYz86e+TFKWWuhas+_MA@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <3e3e3ec4-89cb-9dc6-e84b-ec4acfba4ffe@huawei.com>
Date: Mon, 30 Nov 2020 10:05:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOAw_x1Zkn-yY-cmWwQUByHVg5mUDqYz86e+TFKWWuhas+_MA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kjYa2-00AJAO-C8
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

QWxyaWdodCwgbGV0J3MgZXhwb3J0IHJlYWRvbmx5IHN0YXRzIGluIG5ldyBkaXJlY3Rvcnkgb25j
ZSB5b3UgaGF2ZSBzdWNoIHJlcXVpcmVtZW50LiA6KQoKVGhhbmtzLAoKT24gMjAyMC8xMS8zMCAx
MDowMiwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gU3VyZSwgYnV0IEkgZG9uJ3QgdGhpbmsgd2UgbmVl
ZCB0byBleHBvc2UgY29tcHJfaW5vZGUgYW5kIGNvbXByX2Jsb2NrIHJpZ2h0IG5vdy4KPiAKPiAy
MDIw64WEIDEx7JuUIDI37J28ICjquIgpIOyYpO2bhCA2OjQ0LCBDaGFvIFl1IDx5dWNoYW8wQGh1
YXdlaS5jb20+64uY7J20IOyekeyEsToKPj4KPj4gRGFlaG8sCj4+Cj4+IEhvdyBhYm91dCB1cGRh
dGluZyB0aGlzIHBhdGNoIGJhc2VkIG9uIGJlbG93IHBhdGNoPwo+Pgo+PiAgICAgICAgICBmMmZz
OiBpbnRyb2R1Y2UgYSBuZXcgcGVyLXNiIGRpcmVjdG9yeSBpbiBzeXNmcwo+Pgo+PiBPbiAyMDIw
LzEwLzIyIDEwOjUzLCBEYWVobyBKZW9uZyB3cm90ZToKPj4+IFllcCwgSXQgc291bmRzIGdvb2Qg
dG8gbWUuCj4+Pgo+Pj4gMjAyMOuFhCAxMOyblCAyMeydvCAo7IiYKSDsmKTtm4QgMzowOCwgQ2hh
byBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPuuLmOydtCDsnpHshLE6Cj4+Pj4KPj4+PiBPbiAyMDIw
LzEwLzE2IDEzOjE0LCBEYWVobyBKZW9uZyB3cm90ZToKPj4+Pj4gRnJvbTogRGFlaG8gSmVvbmcg
PGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Pj4KPj4+Pj4gQWRkZWQgY29tcHJfaW5vZGUgdG8g
c2hvdyBjb21wcmVzc2VkIGlub2RlIGNvdW50IGFuZCBjb21wcl9ibG9ja3MgdG8KPj4+Pj4gc2hv
dyBjb21wcmVzc2VkIGJsb2NrIGNvdW50IGluIHN5c2ZzLgo+Pj4+Cj4+Pj4gQXMgdGhlcmUgYXJl
IHNvIG1hbnkgZW50cmllcyBpbiAuLi9mMmZzLzxkaXNrPi8gZGlyZWN0b3J5LCBpdCBsb29rcyBh
IG1lc3MKPj4+PiB0aGVyZSwgSSBzdWdnZXN0IHRoYXQgd2UgY2FuIGFkZCBhIG5ldyBkaXJlY3Rv
cnkgJ3N0YXRzJyBpbiAuLi9mMmZzLzxkaXNrPi8sCj4+Pj4gaW4gd2hlcmUgd2UgY2FuIHN0b3Jl
IGFsbCByZWFkb25seSBzdGF0cyByZWxhdGVkIGVudHJpZXMgdGhlcmUgbGF0ZXIuCj4+Pj4KPj4+
PiBIb3cgZG8geW91IHRoaW5rPwo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pj4+Cj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+Pj4+IC0t
LQo+Pj4+PiAgICAgRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzIHwgMTAg
KysrKysrKysrKwo+Pj4+PiAgICAgZnMvZjJmcy9zeXNmcy5jICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMTcgKysrKysrKysrKysrKysrKysKPj4+Pj4gICAgIDIgZmlsZXMgY2hhbmdlZCwgMjcg
aW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9BQkkv
dGVzdGluZy9zeXNmcy1mcy1mMmZzIGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1m
cy1mMmZzCj4+Pj4+IGluZGV4IDgzNGQwYmVjYWU2ZC4uYTAxYzI2NDg0YzY5IDEwMDY0NAo+Pj4+
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMKPj4+Pj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4+Pj4+IEBAIC0zNTAs
MyArMzUwLDEzIEBAIERhdGU6ICAgICAgICAgICAgQXByaWwgMjAyMAo+Pj4+PiAgICAgQ29udGFj
dDogICAgIkRhZWhvIEplb25nIiA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+Pj4+PiAgICAgRGVz
Y3JpcHRpb246ICAgICAgICBHaXZlIGEgd2F5IHRvIGNoYW5nZSBpb3N0YXRfcGVyaW9kIHRpbWUu
IDNzZWNzIGJ5IGRlZmF1bHQuCj4+Pj4+ICAgICAgICAgICAgICAgICBUaGUgbmV3IGlvc3RhdCB0
cmFjZSBnaXZlcyBzdGF0cyBnYXAgZ2l2ZW4gdGhlIHBlcmlvZC4KPj4+Pj4gKwo+Pj4+PiArV2hh
dDogICAgICAgICAgICAgICAgL3N5cy9mcy9mMmZzLzxkaXNrPi9jb21wcl9pbm9kZQo+Pj4+PiAr
RGF0ZTogICAgICAgICAgICAgICAgT2N0b2JlciAyMDIwCj4+Pj4+ICtDb250YWN0OiAgICAgIkRh
ZWhvIEplb25nIiA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+Pj4+PiArRGVzY3JpcHRpb246IFNo
b3cgY29tcHJlc3NlZCBpbm9kZSBjb3VudAo+Pj4+PiArCj4+Pj4+ICtXaGF0OiAgICAgICAgICAg
ICAgICAvc3lzL2ZzL2YyZnMvPGRpc2s+L2NvbXByX2Jsb2Nrcwo+Pj4+PiArRGF0ZTogICAgICAg
ICAgICAgICAgT2N0b2JlciAyMDIwCj4+Pj4+ICtDb250YWN0OiAgICAgIkRhZWhvIEplb25nIiA8
ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+Pj4+PiArRGVzY3JpcHRpb246IFNob3cgY29tcHJlc3Nl
ZCBibG9jayBjb3VudAo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJm
cy9zeXNmcy5jCj4+Pj4+IGluZGV4IDk0Yzk4ZTQxMmFhMS4uNzEzOWEyOWEwMGQzIDEwMDY0NAo+
Pj4+PiAtLS0gYS9mcy9mMmZzL3N5c2ZzLmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9zeXNmcy5jCj4+
Pj4+IEBAIC0yMjMsNiArMjIzLDE5IEBAIHN0YXRpYyBzc2l6ZV90IGF2Z192YmxvY2tzX3Nob3co
c3RydWN0IGYyZnNfYXR0ciAqYSwKPj4+Pj4gICAgICAgICBmMmZzX3VwZGF0ZV9zaXRfaW5mbyhz
YmkpOwo+Pj4+PiAgICAgICAgIHJldHVybiBzcHJpbnRmKGJ1ZiwgIiVsbHVcbiIsICh1bnNpZ25l
ZCBsb25nIGxvbmcpKHNpLT5hdmdfdmJsb2NrcykpOwo+Pj4+PiAgICAgfQo+Pj4+PiArCj4+Pj4+
ICtzdGF0aWMgc3NpemVfdCBjb21wcl9pbm9kZV9zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwgY2hhciAqYnVmKQo+Pj4+PiArewo+Pj4+PiArICAgICByZXR1cm4gc3ByaW50ZihidWYsICIl
dVxuIiwgYXRvbWljX3JlYWQoJnNiaS0+Y29tcHJfaW5vZGUpKTsKPj4+Pj4gK30KPj4+Pj4gKwo+
Pj4+PiArc3RhdGljIHNzaXplX3QgY29tcHJfYmxvY2tzX3Nob3coc3RydWN0IGYyZnNfYXR0ciAq
YSwKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLCBjaGFyICpidWYpCj4+Pj4+ICt7Cj4+Pj4+ICsgICAgIHJldHVybiBzcHJpbnRmKGJ1
ZiwgIiVsbHVcbiIsIGF0b21pYzY0X3JlYWQoJnNiaS0+Y29tcHJfYmxvY2tzKSk7Cj4+Pj4+ICt9
Cj4+Pj4+ICsKPj4+Pj4gICAgICNlbmRpZgo+Pj4+Pgo+Pj4+PiAgICAgc3RhdGljIHNzaXplX3Qg
bWFpbl9ibGthZGRyX3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPj4+Pj4gQEAgLTU5MSw2ICs2
MDQsOCBAQCBGMkZTX1NUQVRfQVRUUihTVEFUX0lORk8sIGYyZnNfc3RhdF9pbmZvLCBnY19iYWNr
Z3JvdW5kX2NhbGxzLCBiZ19nYyk7Cj4+Pj4+ICAgICBGMkZTX0dFTkVSQUxfUk9fQVRUUihtb3Zl
ZF9ibG9ja3NfYmFja2dyb3VuZCk7Cj4+Pj4+ICAgICBGMkZTX0dFTkVSQUxfUk9fQVRUUihtb3Zl
ZF9ibG9ja3NfZm9yZWdyb3VuZCk7Cj4+Pj4+ICAgICBGMkZTX0dFTkVSQUxfUk9fQVRUUihhdmdf
dmJsb2Nrcyk7Cj4+Pj4+ICtGMkZTX0dFTkVSQUxfUk9fQVRUUihjb21wcl9pbm9kZSk7Cj4+Pj4+
ICtGMkZTX0dFTkVSQUxfUk9fQVRUUihjb21wcl9ibG9ja3MpOwo+Pj4+PiAgICAgI2VuZGlmCj4+
Pj4+Cj4+Pj4+ICAgICAjaWZkZWYgQ09ORklHX0ZTX0VOQ1JZUFRJT04KPj4+Pj4gQEAgLTY3NSw2
ICs2OTAsOCBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqZjJmc19hdHRyc1tdID0gewo+Pj4+
PiAgICAgICAgIEFUVFJfTElTVChtb3ZlZF9ibG9ja3NfZm9yZWdyb3VuZCksCj4+Pj4+ICAgICAg
ICAgQVRUUl9MSVNUKG1vdmVkX2Jsb2Nrc19iYWNrZ3JvdW5kKSwKPj4+Pj4gICAgICAgICBBVFRS
X0xJU1QoYXZnX3ZibG9ja3MpLAo+Pj4+PiArICAgICBBVFRSX0xJU1QoY29tcHJfaW5vZGUpLAo+
Pj4+PiArICAgICBBVFRSX0xJU1QoY29tcHJfYmxvY2tzKSwKPj4+Pj4gICAgICNlbmRpZgo+Pj4+
PiAgICAgICAgIE5VTEwsCj4+Pj4+ICAgICB9Owo+Pj4+Pgo+Pj4gLgo+Pj4KPiAuCj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
