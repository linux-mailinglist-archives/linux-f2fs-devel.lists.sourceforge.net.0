Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F79A16BF8B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2020 12:24:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6YKI-0002QQ-Fy; Tue, 25 Feb 2020 11:24:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j6YKG-0002QD-Ab
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 11:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8nqmrn1FEHfI4yF6i9uuqrcAQMYtPwTYwRGB+C7hUg0=; b=J2Gc0hzEsUr/ZZc6xpY1Ae3U4T
 x+TqIT3A2IgsxmRBZHwupkD9oG31QRu+VEVBwSMQArLwHXnRgaGOYpQ8IcyaQ87a4ebqaIl/H44GO
 c9kVYPIQ+dr5chem5jgqlaETyYI00ci/G+mH48xPwrszVcE772S/Q8ff+0RwHOfxvGIg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8nqmrn1FEHfI4yF6i9uuqrcAQMYtPwTYwRGB+C7hUg0=; b=bAKF8MEjBQmxTj9quc0E8+7ofo
 azTNryWxJxSVTHgJy0hnyjAfRpgs/RCZE8PFQ8z5BP5DQVK6Tgtb0xTXwG/OJyAKClAjOzPPEetT1
 SWjDEMd2TTKQMVNr9FmedslfVBVlDAivJYa0u8sgfDn/O5A4yHwis0crH3igQXFW4z24=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6YKC-005sLP-6D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 11:24:32 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5AC988B14A407D73EA4C;
 Tue, 25 Feb 2020 19:24:17 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 25 Feb
 2020 19:24:13 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20191209222345.1078-1-jaegeuk@kernel.org>
 <20200222044617.pfrhnz2iavkrtdn6@core.my.home>
 <20200222181721.tzrrohep5l3yklpf@core.my.home>
 <bec3798b-f861-b132-9138-221027bb5195@huawei.com>
 <b1eb9b22-b570-41ab-5177-2c89105428a2@huawei.com>
 <20200224135837.k54ke4ppca26ibec@core.my.home>
 <20200224140349.74yagjdwewmclx4v@core.my.home>
 <20200224143149.au6hvmmfw4ajsq2g@core.my.home>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <39712bf4-210b-d7b6-cbb1-eb57585d991a@huawei.com>
Date: Tue, 25 Feb 2020 19:24:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200224143149.au6hvmmfw4ajsq2g@core.my.home>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: megous.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j6YKC-005sLP-6D
Subject: Re: [f2fs-dev] Writes stoped working on f2fs after the compression
 support was added
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC8yLzI0IDIyOjMxLCBPbmTFmWVqIEppcm1hbiB3cm90ZToKPiBPbiBNb24sIEZlYiAy
NCwgMjAyMCBhdCAwMzowMzo0OVBNICswMTAwLCBtZWdpIHhmZiB3cm90ZToKPj4gT24gTW9uLCBG
ZWIgMjQsIDIwMjAgYXQgMDI6NTg6MzdQTSArMDEwMCwgbWVnaSB4ZmYgd3JvdGU6Cj4+PiBIZWxs
bywKPj4+Cj4+PiBPbiBNb24sIEZlYiAyNCwgMjAyMCBhdCAwNjo0MTowM1BNICswODAwLCBDaGFv
IFl1IHdyb3RlOgo+Pj4+IE9uIDIwMjAvMi8yNCAxODozNywgQ2hhbyBZdSB3cm90ZToKPj4+Pj4g
SGksCj4+Pj4+Cj4+Pj4+IFRoYW5rcyBmb3IgdGhlIHJlcG9ydC4KPj4+Pj4KPj4+Pj4gQ291bGQg
eW91IGR1bXAgYWxsIG90aGVyIHRhc2sgc3RhY2sgaW5mbyB2aWEgImVjaG8gInQiID4gL3Byb2Mv
c3lzcnEtdHJpZ2dlciI/Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gWyAgMjQ2Ljc1ODAyMV0gSU5GTzog
dGFzayBrd29ya2VyL3UxNjoxOjU4IGJsb2NrZWQgZm9yIG1vcmUgdGhhbiAxMjIgc2Vjb25kcy4K
Pj4+Pj4+IFsgIDI0Ni43NTgwNDBdICAgICAgIE5vdCB0YWludGVkIDUuNi4wLXJjMi0wMDU5MC1n
OTk4M2JkYWU0OTc0ZSAjMTEKPj4+Pj4+IFsgIDI0Ni43NTgwNDRdICJlY2hvIDAgPiAvcHJvYy9z
eXMva2VybmVsL2h1bmdfdGFza190aW1lb3V0X3NlY3MiIGRpc2FibGVzIHRoaXMgbWVzc2FnZS4K
Pj4+Pj4+IFsgIDI0Ni43NTgwNTJdIGt3b3JrZXIvdTE2OjEgICBEICAgIDAgICAgNTggICAgICAy
IDB4MDAwMDAwMDAKPj4+Pj4+IFsgIDI0Ni43NTgwOTBdIFdvcmtxdWV1ZTogd3JpdGViYWNrIHdi
X3dvcmtmbiAoZmx1c2gtMTc5OjApCj4+Pj4+PiBbICAyNDYuNzU4MDk5XSBCYWNrdHJhY2U6Cj4+
Pj4+PiBbICAyNDYuNzU4MTIxXSBbPGMwOTEyYjkwPl0gKF9fc2NoZWR1bGUpIGZyb20gWzxjMDkx
MzIzND5dIChzY2hlZHVsZSsweDc4LzB4ZjQpCj4+Pj4+PiBbICAyNDYuNzU4MTMwXSAgcjEwOmRh
NjQ0MDAwIHI5OjAwMDAwMDAwIHI4OmRhNjQ1YTYwIHI3OmRhMjgzZTEwIHI2OjAwMDAwMDAyIHI1
OmRhNjQ0MDAwCj4+Pj4+PiBbICAyNDYuNzU4MTMyXSAgcjQ6ZGE0ZDM2MDAKPj4+Pj4+IFsgIDI0
Ni43NTgxNDhdIFs8YzA5MTMxYmM+XSAoc2NoZWR1bGUpIGZyb20gWzxjMDE3ZWM3ND5dIChyd3Nl
bV9kb3duX3dyaXRlX3Nsb3dwYXRoKzB4MjRjLzB4NGMwKQo+Pj4+Pj4gWyAgMjQ2Ljc1ODE1Ml0g
IHI1OjAwMDAwMDAxIHI0OmRhMjgzZTAwCj4+Pj4+PiBbICAyNDYuNzU4MTYxXSBbPGMwMTdlYTI4
Pl0gKHJ3c2VtX2Rvd25fd3JpdGVfc2xvd3BhdGgpIGZyb20gWzxjMDkxNWYyYz5dIChkb3duX3dy
aXRlKzB4NmMvMHg3MCkKPj4+Pj4+IFsgIDI0Ni43NTgxNjddICByMTA6ZGEyODNlMDAgcjk6ZGE2
NDVkODAgcjg6ZDllZDAwMDAgcjc6MDAwMDAwMDEgcjY6MDAwMDAwMDAgcjU6ZWZmMjEzYjAKPj4+
Pj4+IFsgIDI0Ni43NTgxNjldICByNDpkYTI4M2UwMAo+Pj4+Pj4gWyAgMjQ2Ljc1ODE4N10gWzxj
MDkxNWVjMD5dIChkb3duX3dyaXRlKSBmcm9tIFs8YzA0MzViODA+XSAoZjJmc193cml0ZV9zaW5n
bGVfZGF0YV9wYWdlKzB4NjA4LzB4N2FjKQo+Pj4+Pgo+Pj4+PiBJJ20gbm90IHN1cmUgd2hhdCBp
cyB0aGlzIHNlbWFwaG9yZSwgSSBzdXNwZWN0IHRoaXMgaXMgRjJGU19JKGlub2RlKS0+aV9zZW0s
IGluIG9yZGVyIHRvIG1ha2UKPj4+Pj4gc3VyZSBvZiB0aGlzLCBjYW4geW91IGhlbHAgdG8gYWRk
IGJlbG93IGZ1bmN0aW9uLCBhbmQgdXNlIHRoZW0gdG8gcmVwbGFjZQo+Pj4+PiBhbGwge2Rvd24s
dXB9X3t3cml0ZSxyZWFkfSgmLmlfc2VtKSBpbnZva2luZz8gdGhlbiByZXByb2R1Y2UgdGhpcyBp
c3N1ZSBhbmQgY2F0Y2ggdGhlIGxvZy4KPj4+Pgo+Pj4+IFNvcnJ5LCBqdXN0IGZvcmdvdCBhdHRh
Y2hpbmcgYmVsb3cgZnVuY3Rpb24uCj4+Pj4KPj4+PiB2b2lkIGlub2RlX2Rvd25fd3JpdGUoc3Ry
dWN0IGlub2RlICppbm9kZSkKPj4+PiB7Cj4+Pj4gCXByaW50aygiJXMgZnJvbSAlcFNcbiIsIF9f
ZnVuY19fLCBfX2J1aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCkpOwo+Pj4+IAlkb3duX3dyaXRlKCZG
MkZTX0koaW5vZGUpLT5pX3NlbSk7Cj4+Pj4gfQo+Pj4+Cj4+Pj4gdm9pZCBpbm9kZV91cF93cml0
ZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+Pj4+IHsKPj4+PiAJdXBfd3JpdGUoJkYyRlNfSShpbm9k
ZSktPmlfc2VtKTsKPj4+PiAJcHJpbnRrKCIlcyBmcm9tICVwU1xuIiwgX19mdW5jX18sIF9fYnVp
bHRpbl9yZXR1cm5fYWRkcmVzcygwKSk7Cj4+Pj4gfQo+Pj4+Cj4+Pj4gdm9pZCBpbm9kZV9kb3du
X3JlYWQoc3RydWN0IGlub2RlICppbm9kZSkKPj4+PiB7Cj4+Pj4gCXByaW50aygiJXMgZnJvbSAl
cFNcbiIsIF9fZnVuY19fLCBfX2J1aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCkpOwo+Pj4+IAlkb3du
X3JlYWQoJkYyRlNfSShpbm9kZSktPmlfc2VtKTsKPj4+PiB9Cj4+Pj4KPj4+PiB2b2lkIGlub2Rl
X3VwX3JlYWQoc3RydWN0IGlub2RlICppbm9kZSkKPj4+PiB7Cj4+Pj4gCXVwX3JlYWQoJkYyRlNf
SShpbm9kZSktPmlfc2VtKTsKPj4+PiAJcHJpbnRrKCIlcyBmcm9tICVwU1xuIiwgX19mdW5jX18s
IF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygwKSk7Cj4+Pj4gfQo+Pj4+Cj4+Pgo+Pj4gSGVyZSdz
IHRoZSBsb2cgYW5kIHZtbGludXggZmlsZSB0aGF0IG1heSBoZWxwIG1hcHBpbmcgdGhlIGNvZGUg
YWRkcmVzc2VzIGJhY2sgdG8KPj4+IGNvZGUsIGhvcGUgaXQgaGVscHM6Cj4+Pgo+Pj4gaHR0cHM6
Ly9tZWdvdXMuY29tL2RsL3RtcC9mMmZzLWRtZXNnLWxvZwo+Pj4gaHR0cHM6Ly9tZWdvdXMuY29t
L2RsL3RtcC9mMmZzLWxvZy1idWlsZC1hcnRpZmFjdHMudGFyLmd6Cj4+Cj4+IEp1c3QgYnkgYSBs
b29rcyBvZiBpdDoKPj4KPj4gcm9vdEB0YnMyWy9wcm9jL3N5cy9rZXJuZWxdICMgZG1lc2cgfCBn
cmVwIHVwX3dyaXRlIHwgd2MgLWwKPj4gMzI0Cj4+IHJvb3RAdGJzMlsvcHJvYy9zeXMva2VybmVs
XSAjIGRtZXNnIHwgZ3JlcCBkb3duX3dyaXRlIHwgd2MgLWwKPj4gMzQ3Cj4+Cj4+IHRoZXJlIHNl
ZW1zIHRvIGJlIGEgbWlzbWF0Y2ggb2YgbG9jay91bmxvY2sgY291bnRzLgo+ICAKPiBTb3JyeSwg
YSB3cm9uZyBncmVwIGV4cHJlc3Npb24uCj4gCj4gcm9vdEB0YnMyW35dICMgZG1lc2cgfCBncmVw
IGlub2RlX2Rvd25fd3JpdGUgfCB3YyAtbAo+IDM1Nwo+IHJvb3RAdGJzMlt+XSAjIGRtZXNnIHwg
Z3JlcCBpbm9kZV91cF93cml0ZSB8IHdjIC1sCj4gMzU3Cj4gcm9vdEB0YnMyW35dICMgZG1lc2cg
fCBncmVwIGlub2RlX3VwX3JlYWQgfCB3YyAtbAo+IDE2Cj4gcm9vdEB0YnMyW35dICMgZG1lc2cg
fCBncmVwIGlub2RlX2Rvd25fcmVhZCB8IHdjIC1sCj4gMTYKCkkgZG9uJ3Qga25vdyB3aHkgd2Ug
aGF2ZSBjb25zaXN0ZW50IGRvd24vdXAgcGFpciwgYnV0IHRocm91Z2ggZGlzYXNzZW1ibGVkCmNv
ZGUsIEkgZG91YnQgaXQncyB0aGUgZjJmc19pbm9kZS0+aV9zZW0uCgpjMDQzNWQ3YzogICAgICAg
ZWJmNTRhZjggICAgICAgIGJsICAgICAgYzAxODg5NjQgPHByaW50az4KYzA0MzVkODA6ICAgICAg
IGUxYTAwMDA2ICAgICAgICBtb3YgICAgIHIwLCByNgpjMDQzNWQ4NDogICAgICAgZWIxMzgxMzUg
ICAgICAgIGJsICAgICAgYzA5MTYyNjAgPGRvd25fd3JpdGU+Cgppbm9kZV9kb3duX3dyaXRlKCkK
CmMwNDM1ZDg4OiAgICAgICBlMjg0Y2UxZCAgICAgICAgYWRkICAgICBpcCwgcjQsICM0NjQgICAg
OyAweDFkMAoKV2UgYXJlIHN0dWNrIGhlcmUuCgpbICA0MzAuNjc1NzU0XSBbPGMwOTE2MjYwPl0g
KGRvd25fd3JpdGUpIGZyb20gWzxjMDQzNWQ4OD5dIChmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3Bh
Z2UrMHg2MDAvMHg3ZDgpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5eXl5eXl5eXgpbICA0MzAuNjc1NzY0XSBbPGMwNDM1Nzg4Pl0gKGYyZnNfd3JpdGVf
c2luZ2xlX2RhdGFfcGFnZSkgZnJvbSBbPGMwNDM2MjE0Pl0gKGYyZnNfd3JpdGVfY2FjaGVfcGFn
ZXMrMHgyYjQvMHg3YzQpCgoKYzA0MzVkOGM6ICAgICAgIGUxNGIwYWQ0ICAgICAgICBsZHJkICAg
IHIwLCBbZnAsICMtMTY0XSA7IDB4ZmZmZmZmNWMKYzA0MzVkOTA6ICAgICAgIGUxY2MyMGQwICAg
ICAgICBsZHJkICAgIHIyLCBbaXBdCmMwNDM1ZDk0OiAgICAgICBlMTUyMDAwMCAgICAgICAgY21w
ICAgICByMiwgcjAKYzA0MzVkOTg6ICAgICAgIGUwZDMzMDAxICAgICAgICBzYmNzICAgIHIzLCBy
MywgcjEKYzA0MzVkOWM6ICAgICAgIGIxY2MwMGYwICAgICAgICBzdHJkbHQgIHIwLCBbaXBdCmMw
NDM1ZGEwOiAgICAgICBlMWEwMDAwNiAgICAgICAgbW92ICAgICByMCwgcjYKYzA0MzVkYTQ6ICAg
ICAgIGViZjUyMjI3ICAgICAgICBibCAgICAgIGMwMTdlNjQ4IDx1cF93cml0ZT4KYzA0MzVkYTg6
ICAgICAgIGU1MWIyMDk4ICAgICAgICBsZHIgICAgIHIyLCBbZnAsICMtMTUyXSA7IDB4ZmZmZmZm
NjgKYzA0MzVkYWM6ICAgICAgIGUzMGMwNzMwICAgICAgICBtb3Z3ICAgIHIwLCAjNTA5OTIgICAg
ICA7IDB4YzczMApjMDQzNWRiMDogICAgICAgZTU5ZjExYTQgICAgICAgIGxkciAgICAgcjEsIFtw
YywgIzQyMF0gIDsgYzA0MzVmNWMgPGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSsweDdkND4K
YzA0MzVkYjQ6ICAgICAgIGUzNGMwMGI2ICAgICAgICBtb3Z0ICAgIHIwLCAjNDkzMzQgICAgICA7
IDB4YzBiNgpjMDQzNWRiODogICAgICAgZWJmNTRhZTkgICAgICAgIGJsICAgICAgYzAxODg5NjQg
PHByaW50az4KCmlub2RlX3VwX3dyaXRlKCkKClRoYW5rcywKCj4gCj4gU28gaXQncyBwcm9iYWJs
eSBub3QgaW5vZGUgbG9ja2luZy4KPiAKPj4gcm9vdEB0YnMyWy9wcm9jL3N5cy9rZXJuZWxdICMg
ZG1lc2cgfCBncmVwIGRvd25fcmVhZCB8IHdjIC1sCj4+IDE2Cj4+IHJvb3RAdGJzMlsvcHJvYy9z
eXMva2VybmVsXSAjIGRtZXNnIHwgZ3JlcCB1cF9yZWFkIHwgd2MgLWwKPj4gMTYKPj4KPj4gcmVn
YXJkcywKPj4gCW8uCj4+Cj4+PiB0aGFuayB5b3UsCj4+PiAJby4KPj4+Cj4+Pj4+IFRoYW5rcywK
Pj4+Pj4KPj4+Pj4+IFsgIDI0Ni43NTgxOTBdICByNTplZmYyMTNiMCByNDpkYTI4M2M2MAo+Pj4+
Pj4gWyAgMjQ2Ljc1ODE5OF0gWzxjMDQzNTU3OD5dIChmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3Bh
Z2UpIGZyb20gWzxjMDQzNWZkOD5dIChmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzKzB4MmI0LzB4N2M0
KQo+Pj4+Pj4gWyAgMjQ2Ljc1ODIwNF0gIHIxMDpkYTY0NWMyOCByOTpkYTI4M2Q2MCByODpkYTI4
M2M2MCByNzowMDAwMDAwZiByNjpkYTY0NWQ4MCByNTowMDAwMDAwMQo+Pj4+Pj4gWyAgMjQ2Ljc1
ODIwNl0gIHI0OmVmZjIxM2IwCj4+Pj4+PiBbICAyNDYuNzU4MjE0XSBbPGMwNDM1ZDI0Pl0gKGYy
ZnNfd3JpdGVfY2FjaGVfcGFnZXMpIGZyb20gWzxjMDQzNjgyYz5dIChmMmZzX3dyaXRlX2RhdGFf
cGFnZXMrMHgzNDQvMHgzNWMpCj4+Pj4+PiBbICAyNDYuNzU4MjIwXSAgcjEwOjAwMDAwMDAwIHI5
OmQ5ZWQwMDJjIHI4OmQ5ZWQwMDAwIHI3OjAwMDAwMDA0IHI2OmRhMjgzZDYwIHI1OmRhMjgzYzYw
Cj4+Pj4+PiBbICAyNDYuNzU4MjIzXSAgcjQ6ZGE2NDVkODAKPj4+Pj4+IFsgIDI0Ni43NTgyMzhd
IFs8YzA0MzY0ZTg+XSAoZjJmc193cml0ZV9kYXRhX3BhZ2VzKSBmcm9tIFs8YzAyNjdlZTg+XSAo
ZG9fd3JpdGVwYWdlcysweDNjLzB4ZDQpCj4+Pj4+PiBbICAyNDYuNzU4MjQ0XSAgcjEwOjAwMDAw
MDBhIHI5OmMwZTAzZDAwIHI4OjAwMDAwYzAwIHI3OmMwMjY0ZGRjIHI2OmRhNjQ1ZDgwIHI1OmRh
MjgzZDYwCj4+Pj4+PiBbICAyNDYuNzU4MjQ2XSAgcjQ6ZGEyODNjNjAKPj4+Pj4+IFsgIDI0Ni43
NTgyNTRdIFs8YzAyNjdlYWM+XSAoZG9fd3JpdGVwYWdlcykgZnJvbSBbPGMwMzEwY2JjPl0gKF9f
d3JpdGViYWNrX3NpbmdsZV9pbm9kZSsweDQ0LzB4NDU0KQo+Pj4+Pj4gWyAgMjQ2Ljc1ODI1OV0g
IHI3OmRhMjgzZDYwIHI2OmRhNjQ1ZWFjIHI1OmRhNjQ1ZDgwIHI0OmRhMjgzYzYwCj4+Pj4+PiBb
ICAyNDYuNzU4MjY2XSBbPGMwMzEwYzc4Pl0gKF9fd3JpdGViYWNrX3NpbmdsZV9pbm9kZSkgZnJv
bSBbPGMwMzExMmQwPl0gKHdyaXRlYmFja19zYl9pbm9kZXMrMHgyMDQvMHg0YjApCj4+Pj4+PiBb
ICAyNDYuNzU4MjcyXSAgcjEwOjAwMDAwMDBhIHI5OmMwZTAzZDAwIHI4OmRhMjgzY2M4IHI3OmRh
MjgzYzYwIHI2OmRhNjQ1ZWFjIHI1OmRhMjgzZDA4Cj4+Pj4+PiBbICAyNDYuNzU4Mjc0XSAgcjQ6
ZDlkYzk4NDgKPj4+Pj4+IFsgIDI0Ni43NTgyODFdIFs8YzAzMTEwY2M+XSAod3JpdGViYWNrX3Ni
X2lub2RlcykgZnJvbSBbPGMwMzExNWNjPl0gKF9fd3JpdGViYWNrX2lub2Rlc193YisweDUwLzB4
ZTQpCj4+Pj4+PiBbICAyNDYuNzU4Mjg3XSAgcjEwOmRhMzc5N2E4IHI5OmMwZTAzZDAwIHI4OmQ5
ZGM5ODVjIHI3OmRhNjQ1ZWFjIHI2OjAwMDAwMDAwIHI1OmQ5ZGM5ODQ4Cj4+Pj4+PiBbICAyNDYu
NzU4Mjg5XSAgcjQ6ZGE1YTg4MDAKPj4+Pj4+IFsgIDI0Ni43NTgyOTZdIFs8YzAzMTE1N2M+XSAo
X193cml0ZWJhY2tfaW5vZGVzX3diKSBmcm9tIFs8YzAzMTE4ZjQ+XSAod2Jfd3JpdGViYWNrKzB4
Mjk0LzB4MzM4KQo+Pj4+Pj4gWyAgMjQ2Ljc1ODMwMl0gIHIxMDpmZmZiZjIwMCByOTpkYTY0NDAw
MCByODpjMGUwNGU2NCByNzpkOWRjOTg0OCByNjpkOWRjOTg3NCByNTpkYTY0NWVhYwo+Pj4+Pj4g
WyAgMjQ2Ljc1ODMwNV0gIHI0OmQ5ZGM5ODQ4Cj4+Pj4+PiBbICAyNDYuNzU4MzEyXSBbPGMwMzEx
NjYwPl0gKHdiX3dyaXRlYmFjaykgZnJvbSBbPGMwMzEyZGFjPl0gKHdiX3dvcmtmbisweDM1Yy8w
eDU0YykKPj4+Pj4+IFsgIDI0Ni43NTgzMThdICByMTA6ZGE1ZjIwMDUgcjk6ZDlkYzk4NGMgcjg6
ZDlkYzk5NDggcjc6ZDlkYzk4NDggcjY6MDAwMDAwMDAgcjU6ZDlkYzk5NTQKPj4+Pj4+IFsgIDI0
Ni43NTgzMjFdICByNDowMDAwMzFlNgo+Pj4+Pj4gWyAgMjQ2Ljc1ODMzNF0gWzxjMDMxMmE1MD5d
ICh3Yl93b3JrZm4pIGZyb20gWzxjMDE0ZjJiOD5dIChwcm9jZXNzX29uZV93b3JrKzB4MjE0LzB4
NTQ0KQo+Pj4+Pj4gWyAgMjQ2Ljc1ODM0MF0gIHIxMDpkYTVmMjAwNSByOTowMDAwMDIwMCByODow
MDAwMDAwMCByNzpkYTVmMjAwMCByNjplZjA0NDQwMCByNTpkYTVlYjAwMAo+Pj4+Pj4gWyAgMjQ2
Ljc1ODM0M10gIHI0OmQ5ZGM5OTU0Cj4+Pj4+PiBbICAyNDYuNzU4MzUwXSBbPGMwMTRmMGE0Pl0g
KHByb2Nlc3Nfb25lX3dvcmspIGZyb20gWzxjMDE0ZjYzND5dICh3b3JrZXJfdGhyZWFkKzB4NGMv
MHg1NzQpCj4+Pj4+PiBbICAyNDYuNzU4MzU3XSAgcjEwOmVmMDQ0NDAwIHI5OmMwZTAzZDAwIHI4
OmVmMDQ0NDE4IHI3OjAwMDAwMDg4IHI2OmVmMDQ0NDAwIHI1OmRhNWViMDE0Cj4+Pj4+PiBbICAy
NDYuNzU4MzU5XSAgcjQ6ZGE1ZWIwMDAKPj4+Pj4+IFsgIDI0Ni43NTgzNjhdIFs8YzAxNGY1ZTg+
XSAod29ya2VyX3RocmVhZCkgZnJvbSBbPGMwMTU2NGZjPl0gKGt0aHJlYWQrMHgxNDQvMHgxNzAp
Cj4+Pj4+PiBbICAyNDYuNzU4Mzc0XSAgcjEwOmVjOWU1ZTkwIHI5OmRhYmYzMjVjIHI4OmRhNWVi
MDAwIHI3OmRhNjQ0MDAwIHI2OjAwMDAwMDAwIHI1OmRhNWZlMDAwCj4+Pj4+PiBbICAyNDYuNzU4
Mzc3XSAgcjQ6ZGFiZjMyNDAKPj4+Pj4+IFsgIDI0Ni43NTgzODZdIFs8YzAxNTYzYjg+XSAoa3Ro
cmVhZCkgZnJvbSBbPGMwMTAxMGU4Pl0gKHJldF9mcm9tX2ZvcmsrMHgxNC8weDJjKQo+Pj4+Pj4g
WyAgMjQ2Ljc1ODM5MV0gRXhjZXB0aW9uIHN0YWNrKDB4ZGE2NDVmYjAgdG8gMHhkYTY0NWZmOCkK
Pj4+Pj4+IFsgIDI0Ni43NTgzOTddIDVmYTA6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwCj4+Pj4+PiBbICAyNDYu
NzU4NDAyXSA1ZmMwOiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAw
MCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMAo+Pj4+Pj4gWyAgMjQ2Ljc1ODQwN10gNWZlMDog
MDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMTMgMDAwMDAwMDAKPj4+
Pj4+IFsgIDI0Ni43NTg0MTNdICByMTA6MDAwMDAwMDAgcjk6MDAwMDAwMDAgcjg6MDAwMDAwMDAg
cjc6MDAwMDAwMDAgcjY6MDAwMDAwMDAgcjU6YzAxNTYzYjgKPj4+Pj4+IFsgIDI0Ni43NTg0MTZd
ICByNDpkYTVmZTAwMAo+Pj4+Pj4gLgo+Pj4+Pj4KPj4+Pj4KPj4+Pj4KPj4+Pj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+Pj4gTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKPj4+Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKPj4+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo+Pj4+Pgo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
