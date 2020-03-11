Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D86DB18162B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2020 11:51:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jByxg-0002K1-QW; Wed, 11 Mar 2020 10:51:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jByxf-0002Jk-S2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 10:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/oFEUK5DLxs371jsoy47fxRqEl6LKhcDP6hk+xJsc18=; b=f38zQ2FRs2qvzCbqZDic08TrAG
 XMj+4/xEcd/8QQOQ5IP8CT2LbCFGlCi4KPHhPCC2U8k+lKvMxs47vPw5FB2DO8MD/jE0EoYyFe4Fn
 809go8pAPSEKZDZegvRaz03JfIWMSVSW4S7dQ+w/lnl7Go29tgxsh30QPCcvoD7hLucQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/oFEUK5DLxs371jsoy47fxRqEl6LKhcDP6hk+xJsc18=; b=HDp88h8kz8f1WljmJDvZT5g55T
 VW82Nt5GiI6+Kf6Tz376UrmxlmTzbDDj9L8+sB89T2jFhOhsoLI9KaN00QGTEwQVtcEjRPp/IMiQJ
 fPz4OmOQ3aIn1hPSn76Kw6qTXcg7UjBKRsDisECPfFp0VS2OFSvqsIj4cEkdhXXdpDTc=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jByxc-00FUxp-F4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 10:51:39 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B3A2A3473D4233BDE244;
 Wed, 11 Mar 2020 18:51:24 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 11 Mar
 2020 18:51:24 +0800
To: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200224143149.au6hvmmfw4ajsq2g@core.my.home>
 <39712bf4-210b-d7b6-cbb1-eb57585d991a@huawei.com>
 <20200225120814.gjm4dby24cs22lux@core.my.home>
 <20200225122706.d6pngz62iwyowhym@core.my.home>
 <72d28eba-53b9-b6f4-01a5-45b2352f4285@huawei.com>
 <20200226121143.uag224cqzqossvlv@core.my.home>
 <20200226180557.le2fr66fyuvrqker@core.my.home>
 <7b62f506-f737-9fb2-6e8e-4b1c454f03b2@huawei.com>
 <20200306120203.2p34ezryzxb2jeuk@core.my.home>
 <0ce08d13-ca00-2823-94eb-8274c332a8ef@huawei.com>
 <20200311103309.m52hdut7mt7crt7g@core.my.home>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c3d53657-7c2a-9d2f-9111-048db6e30a7e@huawei.com>
Date: Wed, 11 Mar 2020 18:51:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200311103309.m52hdut7mt7crt7g@core.my.home>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jByxc-00FUxp-F4
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

SGksCgpPbiAyMDIwLzMvMTEgMTg6MzMsIE9uZMWZZWogSmlybWFuIHdyb3RlOgo+IEhlbGxvLAo+
IAo+IE9uIFdlZCwgTWFyIDExLCAyMDIwIGF0IDA1OjAyOjEwUE0gKzA4MDAsIENoYW8gWXUgd3Jv
dGU6Cj4+IEhpLAo+Pgo+PiBTb3JyeSBmb3IgdGhlIGRlbGF5Lgo+Pgo+PiBPbiAyMDIwLzMvNiAy
MDowMiwgT25kxZllaiBKaXJtYW4gd3JvdGU6Cj4+PiBIZWxsbywKPj4+Cj4+PiBPbiBUaHUsIEZl
YiAyNywgMjAyMCBhdCAxMDowMTo1MEFNICswODAwLCBDaGFvIFl1IHdyb3RlOgo+Pj4+IE9uIDIw
MjAvMi8yNyAyOjA1LCBPbmTFmWVqIEppcm1hbiB3cm90ZToKPj4+Pj4KPj4+Pj4gTm8gaXNzdWUg
YWZ0ZXIgN2ggdXB0aW1lIGVpdGhlci4gU28gSSBndWVzcyB0aGlzIHBhdGNoIHNvbHZlZCBpdCBm
b3Igc29tZQo+Pj4+PiByZWFzb24uCj4+Pj4KPj4+PiBJIGhvcGUgc28gYXMgd2VsbCwgSSB3aWxs
IHNlbmQgYSBmb3JtYWwgcGF0Y2ggZm9yIHRoaXMuCj4+Pgo+Pj4gU28gSSBoYWQgaXQgaGFwcGVu
IGFnYWluLCBldmVuIHdpdGggdGhlIHBhdGNoZXMuIFRoaXMgdGltZSBpbiBmMmZzX3JlbmFtZTI6
Cj4+Cj4+IE9vcHMsIGl0IGxvb2tzIHByZXZpb3VzIGZpeCBwYXRjaCBqdXN0IGNvdmVyIHRoZSBy
b290IGNhdXNlLi4uIDooCj4+Cj4+IERpZCB0aGlzIGlzc3VlIHN0aWxsIGhhcHBlbiBmcmVxdWVu
dGx5PyBJZiBpdCBpcywgd291bGQgeW91IHBsZWFzZSBhcHBseSBwYXRjaAo+PiB0aGF0IHByaW50
cyBsb2cgZHVyaW5nIGRvd24vdXAgc2VtYXBob3JlLgo+IAo+IE5vdCBmcmVxdWVudGx5LiBKdXN0
IG9uY2UuIEkgY291bGRuJ3QgYWZmb3JkIEZTIGNvcnJ1cHRpb24gZHVyaW5nIHVwZGF0ZSwKCkFs
cmlnaHQuCgo+IHNvIEkgcmV2ZXJ0ZWQgdGhlIGNvbXByZXNzaW9uIHN1cHBvcnQgc2hvcnRseSBh
ZnRlci4KCldoYXQgSSBjYW4gc2VlIGlzIHRoYXQgZmlsZXN5c3RlbSB3YXMganVzdCBzdHVjaywg
cmF0aGVyIHRoYW4gaW1hZ2UgYmVjYW1lCmNvcnJ1cHRlZCwgSSBndWVzcyB0aGUgY29uZGl0aW9u
IGlzIG5vdCBzdWNoIGJhZCwgYW55d2F5LCBpdCdzIG9rYXkgdG8ganVzdApyZXZlcnQgY29tcHJl
c3Npb24gc3VwcG9ydCBmb3Igbm93IHRvIGtlZXAgZnMgc3RhYmxlLgoKPiAKPiBCdXQgSSB3YXNu
J3Qgc3RyZXNzaW5nIHRoZSBzeXN0ZW0gbXVjaCB3aXRoIEZTIGFjdGl2aXR5IGFmdGVyIGFwcGx5
aW5nIHRoZQo+IGluaXRpYWwgZml4Lgo+IAo+PiBBbmQgb25jZSB3ZSByZXZlcnQgY29tcHJlc3Np
b24gc3VwcG9ydCBwYXRjaCwgdGhpcyBpc3N1ZSB3aWxsIGRpc2FwcGVhciwgcmlnaHQ/Cj4gCj4g
WWVzLCBBRkFJSy4gSSByZXZlcnRlZCBpdCBhbmQgcnVuIGEgZmV3IGN5Y2xlcyBvZiBpbnN0YWxs
IDUwME1pQiB3b3J0aCBvZgo+IHBhY2thZ2VzLCB1bmluc3RhbGwgdGhlIHBhY2thZ2VzIHdpdGgg
cGFjbWFuLiBBbmQgaXQgZGlkbid0IHJlLW9jY3VyLiBJIG5ldmVyCj4gc2F3IGFueSBpc3N1ZXMg
d2l0aCBjb21wcmVzc2lvbiBzdXBwb3J0IHBhdGNoIHJldmVydGVkLgoKT2theSwgY29tcHJlc3Np
b24gc3VwcG9ydCBtYXkgaW5jcmVhc2Ugc3RhY2sgdXNhZ2UgZHVyaW5nIHBhZ2Ugd3JpdGViYWNr
LCBpdApzaG91bGRuJ3Qgb3ZlcmZsb3cgdGhlIHN0YWNrLCBvdGhlcndpc2UgaXQgY291bGQgY2F1
c2UgcGFuaWMgaW4gc29tZXdoZXJlIGVsc2UsCmJ1dCBzdGlsbCBjYW4gZmluZCBhbnkgY2x1ZSB3
aHkgdGhpcyBpcyByZWxhdGVkIHRvIGNvbXByZXNzaW9uIHN1cHBvcnQgcGF0Y2guLi4KCj4gCj4+
IEJ0dywgZGlkIHlvdSB0cnkgb3RoZXIgaGFyZHdhcmUgd2hpY2ggaXMgbm90IEFybSB2Nz8KPiAK
PiBZZXMsIGJ1dCBJIGRpZG4ndCBldmVyIHNlZSBpdCBvbiBhbnl0aGluZyBlbHNlLiBKdXN0IG9u
IHR3byA4IGNvcmUgY29ydGV4ZXMgQTcuCj4gKDIgY2x1c3RlcnMpCgpOb3Qgc3VyZSwgbWF5YmUg
dGhpcyBpc3N1ZSBpcyByZWxhdGVkIHRvIGFybSB2NyBhcmNoaXRlY3R1cmUuCgpUaGFua3MsCgo+
IAo+IHJlZ2FyZHMsCj4gCW8uCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
