Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DD418EDDB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 03:10:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGCXU-0006gt-LT; Mon, 23 Mar 2020 02:10:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jGCXT-0006gm-PB
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 02:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uXsqFrQoV3CMZMJeow3Kc8jOcMTg9VilywIE+iHZYMA=; b=ZJ+afxsc9VcwerreZtJNhvmT45
 /sAMSnx5CpkTxAiQiZbzT1/EI7P6rnm6P+U3OXNRumfDrsSXcnj9hlppm9QoNdHFJbmmCPbkcTH34
 p/23UuGHNnSkSh8F72WVrxjBJ/QsHhlt55eRq8dEIzghpz4qkF9g/KKEwUj7l0RLEIUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uXsqFrQoV3CMZMJeow3Kc8jOcMTg9VilywIE+iHZYMA=; b=mKOfdIkE6kZ2V5O5cYweKOYC2m
 LUhky+rIJaSrEM8b/L9LSodOPVBcObMHkLC1uw/Zsawx87teAJqJUjc8+5gS9tuup2nlDuuoDoIQG
 yOeJ1k8evgTIOQK1eFfTw4cm/iykUexT1vlrly7O5xSR590LDFL4zDJntNrPuxtPva8o=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGCXR-00DKoq-FV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 02:10:03 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 977822BEDAB46AD93768;
 Mon, 23 Mar 2020 10:09:52 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 23 Mar
 2020 10:09:49 +0800
To: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
 <chao@kernel.org>
References: <20200323012519.41536-1-yuchao0@huawei.com>
 <20200323015036.pniupuucfl3dug4m@core.my.home>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <1d861a2e-0045-af0c-1f5b-c45b774c83f6@huawei.com>
Date: Mon, 23 Mar 2020 10:09:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200323015036.pniupuucfl3dug4m@core.my.home>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: bootlin.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jGCXR-00DKoq-FV
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix potential .flags overflow on
 32bit architecture
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

SGVsbG8gT25kxZllaiwKCk9uIDIwMjAvMy8yMyA5OjUwLCBPbmTFmWVqIEppcm1hbiB3cm90ZToK
PiBIZWxsbyBDaGFvIFl1LAo+IAo+IE9uIE1vbiwgTWFyIDIzLCAyMDIwIGF0IDA5OjI1OjE5QU0g
KzA4MDAsIENoYW8gWXUgd3JvdGU6Cj4+IFtzbmlwXQo+PiAgCj4+ICtzdGF0aWMgaW5saW5lIHZv
aWQgX19zZXRfaW5vZGVfZmxhZyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBpbnQgZmxhZykKPj4gK3sK
Pj4gKwl0ZXN0X2FuZF9zZXRfYml0KGZsYWcgJSBCSVRTX1BFUl9MT05HLAo+PiArCQkJJkYyRlNf
SShpbm9kZSktPmZsYWdzW0JJVF9XT1JEKGZsYWcpXSk7Cj4gCj4gVGhpcyBjYW4gc2ltcGx5IGJl
Ogo+IAo+ICAgICB0ZXN0X2FuZF9zZXRfYml0KGZsYWcsIEYyRlNfSShpbm9kZSktPmZsYWdzKTsK
PiAKPiBhbGwgb2YgdGhlc2UgYml0bWFwIG1hbmlwdWxhdGlvbiBmdW5jdGlvbnMgYWxyZWFkeSB3
aWxsIGRvIHRoZQo+IHJpZ2h0IHRoaW5nIHRvIGFjY2VzcyB0aGUgY29ycmVjdCBsb2NhdGlvbiBp
biB0aGUgZmxhZ3MgYXJyYXk6Cj4gCj4gICBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC9sYXRlc3Qvc291cmNlL2luY2x1ZGUvYXNtLWdlbmVyaWMvYml0b3BzL2F0b21pYy5oI0wzMgo+
IAo+IHNlZSBCSVRfTUFTSyBhbmQgQklUX1dPUkQgdXNlIGluIHRoYXQgZnVuY3Rpb24uCgpPb3Bz
LCBtb3N0IGYyZnMgYml0bWFwIGNoZWNrIHVzZXMgdGhlIHNhbWUgZm9ybSwgSSBtaXNzZWQgdGhp
cyBjYXNlLi4uLgoKPiAKPj4gK30KPj4gKwo+PiAgc3RhdGljIGlubGluZSB2b2lkIHNldF9pbm9k
ZV9mbGFnKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGludCBmbGFnKQo+PiAgewo+PiAtCWlmICghdGVz
dF9iaXQoZmxhZywgJkYyRlNfSShpbm9kZSktPmZsYWdzKSkKPj4gLQkJc2V0X2JpdChmbGFnLCAm
RjJGU19JKGlub2RlKS0+ZmxhZ3MpOwo+PiArCV9fc2V0X2lub2RlX2ZsYWcoaW5vZGUsIGZsYWcp
Owo+PiAgCV9fbWFya19pbm9kZV9kaXJ0eV9mbGFnKGlub2RlLCBmbGFnLCB0cnVlKTsKPj4gIH0K
Pj4gIAo+PiAgc3RhdGljIGlubGluZSBpbnQgaXNfaW5vZGVfZmxhZ19zZXQoc3RydWN0IGlub2Rl
ICppbm9kZSwgaW50IGZsYWcpCj4+ICB7Cj4+IC0JcmV0dXJuIHRlc3RfYml0KGZsYWcsICZGMkZT
X0koaW5vZGUpLT5mbGFncyk7Cj4+ICsJcmV0dXJuIHRlc3RfYml0KGZsYWcgJSBCSVRTX1BFUl9M
T05HLAo+PiArCQkJCSZGMkZTX0koaW5vZGUpLT5mbGFnc1tCSVRfV09SRChmbGFnKV0pOwo+IAo+
IGRpdHRvCj4gCj4+ICB9Cj4+ICAKPj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBjbGVhcl9pbm9kZV9m
bGFnKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGludCBmbGFnKQo+PiAgewo+PiAtCWlmICh0ZXN0X2Jp
dChmbGFnLCAmRjJGU19JKGlub2RlKS0+ZmxhZ3MpKQo+PiAtCQljbGVhcl9iaXQoZmxhZywgJkYy
RlNfSShpbm9kZSktPmZsYWdzKTsKPj4gKwl0ZXN0X2FuZF9jbGVhcl9iaXQoZmxhZyAlIEJJVFNf
UEVSX0xPTkcsCj4+ICsJCQkJJkYyRlNfSShpbm9kZSktPmZsYWdzW0JJVF9XT1JEKGZsYWcpXSk7
Cj4gCj4gZGl0dG8KPiAKPiBJJ20gZ29pbmcgdG8gdGVzdCB0aGUgcGF0Y2guIEl0IGxvb2tzIGxp
a2UgdGhhdCB0aGlzIHdhcyByZWFsbHkKPiB0aGUgcm9vdCBjYXVzZSBvZiBhbGwgdGhvc2UgbG9j
a2luZyBpc3N1ZXMgSSB3YXMgc2VlaW5nIG9uIG15Cj4gMzItYml0IHRhYmxldC4gSXQgc2VlbXMg
dG8gZXhwbGFpbiB3aHkgbXkgNjQtYml0IHN5c3RlbXMgd2VyZQo+IG5vdCBhZmZlY3RlZCwgYW5k
IHdoeSByZXZlcnRpbmcgY29tcGVzc2lvbiBmaXhlZCBpdCB0b28uCj4gR3JlYXQgam9iIGZpZ3Vy
aW5nIHRoaXMgb3V0Lgo+IAo+IEknbGwgbGV0IHlvdSBrbm93IHNvb24uCgpHcmVhdCwgaG9waW5n
IHRoaXMgcGF0Y2ggY2FuIGZpeCB0aGUgaXNzdWUgdGhpcyB0aW1lLgoKVGhhbmtzIGFueXdheSBm
b3Igc3VwcG9ydGluZyBvbiB0cm91Ymxlc2hvb3RpbmcgdGhpcyBpc3N1ZS4KClRoYW5rcywKCj4g
Cj4gdGhhbmsgeW91IGFuZCByZWdhcmRzLAo+IAlvLgo+IAo+PiAgCV9fbWFya19pbm9kZV9kaXJ0
eV9mbGFnKGlub2RlLCBmbGFnLCBmYWxzZSk7Cj4+ICB9Cj4+ICAKPiAuCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
