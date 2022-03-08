Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3294D11FF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Mar 2022 09:20:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRV4k-0005IO-CK; Tue, 08 Mar 2022 08:20:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jiayang5@huawei.com>) id 1nRV4c-0005Hw-AF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Mar 2022 08:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gygBvlqJ9nUINYgS0tZTXCEkwws9F1lcI8xeHQXJGx0=; b=WcS642iB+O47l2zoF6GHE6xURc
 FQUZKXjyfuzxv5IjoapRciX79brY1yP8D9PgBOBQa0dh5ypa+ZA+0e0pNCQvwt+fyQ89gRCewBZeN
 7vKN2gA9/McbPR6cQMf2SxBzsnuwn7SKJ0ibn3hc3RXHYz6ycz3hN0UjhLduX/yUwFRk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gygBvlqJ9nUINYgS0tZTXCEkwws9F1lcI8xeHQXJGx0=; b=U0k8K3l0seglLDmibVJvZXvJSJ
 tcQlxLWlA870A8Vla4rwSzl9Dz0DrbUzoXJpoNFSK/28QEYERe5bb7V5n2cOtLcQ0Lq0AHTU3UlQs
 PUU5Y+C4oTVVrmxdk2QRZ6SKNDGd2u6Ie6p2wzF+fvq5sxagjAe5PzNyHG3W3PpIk+hQ=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRV4Z-008IMk-9i
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Mar 2022 08:20:00 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KCSmk0pq4zbc0X;
 Tue,  8 Mar 2022 16:15:02 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 16:19:37 +0800
Received: from [10.174.179.183] (10.174.179.183) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 16:19:37 +0800
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20220307081227.1353957-1-jiayang5@huawei.com>
 <0833a084-f31d-2815-40cf-c8e173feec02@kernel.org>
Message-ID: <1dfef1c2-2bea-e4ca-39d1-986c2c9b0813@huawei.com>
Date: Tue, 8 Mar 2022 16:19:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0833a084-f31d-2815-40cf-c8e173feec02@kernel.org>
X-Originating-IP: [10.174.179.183]
X-ClientProxiedBy: dggeme713-chm.china.huawei.com (10.1.199.109) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/7 18:40, Chao Yu wrote: > On 2022/3/7 16:12, Jia
 Yang via Linux-f2fs-devel wrote: >> F2FS_FITS_IN_INODE only cares the type
 of f2fs inode, so there >> is no need to read node page of f2fs in [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.187 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nRV4Z-008IMk-9i
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: remove unnecessary read for
 F2FS_FITS_IN_INODE
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
From: Jia Yang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jia Yang <jiayang5@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAyMDIyLzMvNyAxODo0MCwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIyLzMvNyAxNjoxMiwg
SmlhIFlhbmcgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+IEYyRlNfRklUU19JTl9JTk9E
RSBvbmx5IGNhcmVzIHRoZSB0eXBlIG9mIGYyZnMgaW5vZGUsIHNvIHRoZXJlCj4+IGlzIG5vIG5l
ZWQgdG8gcmVhZCBub2RlIHBhZ2Ugb2YgZjJmcyBpbm9kZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
SmlhIFlhbmcgPGppYXlhbmc1QGh1YXdlaS5jb20+Cj4+IC0tLQo+PiDCoCBmcy9mMmZzL2ZpbGUu
YyB8IDEwICsrLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJm
cy9maWxlLmMKPj4gaW5kZXggY2ZkYzQxZjg3ZjVkLi40YjkzZmJlYzJlYzAgMTAwNjQ0Cj4+IC0t
LSBhL2ZzL2YyZnMvZmlsZS5jCj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+IEBAIC0yOTk5LDcg
KzI5OTksNyBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX3NldHByb2plY3Qoc3RydWN0IGlub2RlICpp
bm9kZSwgX191MzIgcHJvamlkKQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGYyZnNfaW5v
ZGVfaW5mbyAqZmkgPSBGMkZTX0koaW5vZGUpOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7Cj4+IC3CoMKgwqAgc3RydWN0IHBhZ2UgKmlw
YWdlOwo+PiArwqDCoMKgIHN0cnVjdCBmMmZzX2lub2RlICpyaTsKPiAKPiBzdHJ1Y3QgZjJmc19p
bm9kZSAqcmkgPSBOVUxMOwo+IAo+IChvZmZzZXRvZih0eXBlb2YoKihmMmZzX2lub2RlKSksIGZp
ZWxkKSArCj4gc2l6ZW9mKChmMmZzX2lub2RlKS0+ZmllbGQpCj4gCj4gQSBsaXR0bGUgYml0IHdv
cnJ5IGFib3V0IHVzaW5nIGEgTlVMTCBwb2ludGVyIGhlcmUsIGR1ZSB0byBub3Qgc3VyZSB0aGUg
cmVzdWx0IG9mCj4gb2Zmc2V0b2YoKSBhbmQgc2l6ZW9mKCkgd2lsbCBhbHdheXMgYmUgY2FsY3Vs
YXRlZCBhdCBjb21waWxpbmcgdGltZSBmb3IgYWxsIGtpbmQgb2YKPiBjb21waWxlcnMsIGNhbiB3
ZSBndWFyYW50ZWUgdGhhdD8KCldlIGNhbid0IGd1YXJhbnRlZSB0aGF0LCBidXQgSSBzZWUgdGhh
dCBmMmZzX2dldGF0dHIgYWxzbyBydW5zIGluIHRoaXMgd2F5LiBEbyB5b3UgdGhpbmsgdGhhdCBh
bGxvY2F0aW5nIG1lbW9yeSBmb3IKZjJmcyBpbm9kZSBpcyBhdmFpbGFibGU/CgpUaGFua3MuCgo+
IAo+PiDCoMKgwqDCoMKgIGtwcm9qaWRfdCBrcHJvamlkOwo+PiDCoMKgwqDCoMKgIGludCBlcnI7
Cj4+IMKgIEBAIC0zMDIzLDE3ICszMDIzLDExIEBAIHN0YXRpYyBpbnQgZjJmc19pb2Nfc2V0cHJv
amVjdChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBfX3UzMiBwcm9qaWQpCj4+IMKgwqDCoMKgwqAgaWYg
KElTX05PUVVPVEEoaW5vZGUpKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPj4g
wqAgLcKgwqDCoCBpcGFnZSA9IGYyZnNfZ2V0X25vZGVfcGFnZShzYmksIGlub2RlLT5pX2lubyk7
Cj4+IC3CoMKgwqAgaWYgKElTX0VSUihpcGFnZSkpCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4g
UFRSX0VSUihpcGFnZSk7Cj4+IMKgIC3CoMKgwqAgaWYgKCFGMkZTX0ZJVFNfSU5fSU5PREUoRjJG
U19JTk9ERShpcGFnZSksIGZpLT5pX2V4dHJhX2lzaXplLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaV9wcm9qaWQpKSB7
Cj4+ICvCoMKgwqAgaWYgKCFGMkZTX0ZJVFNfSU5fSU5PREUocmksIGZpLT5pX2V4dHJhX2lzaXpl
LCBpX3Byb2ppZCkpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IC1FT1ZFUkZMT1c7Cj4+
IC3CoMKgwqDCoMKgwqDCoCBmMmZzX3B1dF9wYWdlKGlwYWdlLCAxKTsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBlcnI7Cj4gCj4gcmV0dXJuIC1FT1ZFUkZMT1c7Cj4gCj4gVGhhbmtzLAo+
IAo+PiDCoMKgwqDCoMKgIH0KPj4gLcKgwqDCoCBmMmZzX3B1dF9wYWdlKGlwYWdlLCAxKTsKPj4g
wqAgwqDCoMKgwqDCoCBlcnIgPSBmMmZzX2RxdW90X2luaXRpYWxpemUoaW5vZGUpOwo+PiDCoMKg
wqDCoMKgIGlmIChlcnIpCj4gLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
