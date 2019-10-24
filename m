Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF184E2CED
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2019 11:13:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iNZBB-0001az-HX; Thu, 24 Oct 2019 09:13:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iNZBA-0001al-8o
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 09:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dwWjqoB6h6aN6/Q5e49zgNpTGkT89/NeK/gE3jnfX/U=; b=bTcEZ3mIoG7JchRsS+zb0aUkh9
 M1qUo2ckYrr3EyKzz7KY6VQtShOoROGG3W9fBvtcTPBkunAkVqBK6szBgY0rZnC/qFPI4yeU3k/qS
 +uyiRl2bB6neLdLnhc57xXoMKtuPOG6LTX2oI06AvmqF5e2CR2iNnyDNk/aahO9vynjc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dwWjqoB6h6aN6/Q5e49zgNpTGkT89/NeK/gE3jnfX/U=; b=SOxC4kRAo+Q6MPC+3FG4cvP7Y5
 5kzntOuwNnnLWbfIfUv7uH+b/7bjlt2iICYqIPylte4Hgtlc+Zw1bUHlORAyPqw8sAtwfcLDaB5mL
 ZvBz3ThVBcup0RKQ8aZhejhRiY1/wJkbg2AL/FdyIEkM6i9209NCzcp+XiBrXP3281z4=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iNZB8-001KCS-HF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 09:13:12 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3BF70C2EBFE337937027;
 Thu, 24 Oct 2019 17:13:03 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 24 Oct
 2019 17:12:59 +0800
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
References: <fc71f3b73116115f78bcee2753e7bb3d5331731e.camel@analog.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e815981a-50ef-0f49-cab6-e510ea44ddc0@huawei.com>
Date: Thu, 24 Oct 2019 17:12:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <fc71f3b73116115f78bcee2753e7bb3d5331731e.camel@analog.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iNZB8-001KCS-HF
Subject: Re: [f2fs-dev] 
 =?utf-8?q?=5Bbug_report=5D_compiler_warning=3A_fs/f2f?=
 =?utf-8?b?cy9ub2RlLmM6IEluIGZ1bmN0aW9uIOKAmF9fc2V0X25hdF9jYWNoZV9kaXJ0?=
 =?utf-8?b?eeKAmTog4oCYaGVhZOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVk?=
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAxOS8xMC8yMyAyMjowMiwgQXJkZWxlYW4sIEFsZXhhbmRydSB3cm90ZToKPiBTZWVtcyB0
byBoYXZlIGJlZW4gaW50cm9kdWNlZCB2aWE6Cj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+IGNvbW1pdCA3ODBk
ZTQ3Y2Y2Y2I1ZjUyNGNkOThlYzhmZmJmZmMzZGE1Njk2ZTE3Cj4gQXV0aG9yOiBDaGFvIFl1IDx5
dWNoYW8wQGh1YXdlaS5jb20+Cj4gRGF0ZTogICBUdWUgTWFyIDIwIDIzOjA4OjMwIDIwMTggKzA4
MDAKPiAKPiAgICAgZjJmczogZG9uJ3QgdHJhY2sgbmV3IG5hdCBlbnRyeSBpbiBuYXQgc2V0Cj4g
ICAgIAo+ICAgICBOYXQgZW50cnkgc2V0IGlzIHVzZWQgb25seSBpbiBjaGVja3BvaW50KCksIGFu
ZCBkdXJpbmcgY2hlY2twb2ludCgpIHdlCj4gICAgIHdvbid0IGZsdXNoIG5ldyBuYXQgZW50cnkg
d2l0aCB1bmFsbG9jYXRlZCBhZGRyZXNzLCBzbyB3ZSBkb24ndCBuZWVkIHRvCj4gICAgIGFkZCBu
ZXcgbmF0IGVudHJ5IGludG8gbmF0IHNldCwgdGhlbiBuYXRfZW50cnlfc2V0OjplbnRyeV9jbnQg
Y2FuCj4gICAgIGluZGljYXRlIGFjdHVhbCBlbnRyeSBjb3VudCB3ZSBuZWVkIHRvIGZsdXNoIGlu
IGNoZWNrcG9pbnQoKS4KPiAgICAgCj4gICAgIFNpZ25lZC1vZmYtYnk6IFl1bmxlaSBIZSA8aGV5
dW5sZWlAaHVhd2VpLmNvbT4KPiAgICAgU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8eXVjaGFvMEBo
dWF3ZWkuY29tPgo+ICAgICBTaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJu
ZWwub3JnPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiAKPiBDb21waWxlciB3YXJuaW5nIGlzOgo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAK
PiAgIENDICAgICAgZnMvZjJmcy9ub2RlLm8KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9pbmNs
dWRlL2xpbnV4L3dhaXQuaDo3OjAsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9s
aW51eC93YWl0X2JpdC5oOjgsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51
eC9mcy5oOjYsCj4gICAgICAgICAgICAgICAgICBmcm9tIGZzL2YyZnMvbm9kZS5jOjExOgo+IGZz
L2YyZnMvbm9kZS5jOiBJbiBmdW5jdGlvbiDigJhfX3NldF9uYXRfY2FjaGVfZGlydHnigJk6Cj4g
Li9pbmNsdWRlL2xpbnV4L2xpc3QuaDo2MzoxMzogZXJyb3I6IOKAmGhlYWTigJkgbWF5IGJlIHVz
ZWQgdW5pbml0aWFsaXplZCBpbgo+IHRoaXMgZnVuY3Rpb24gWy1XZXJyb3I9bWF5YmUtdW5pbml0
aWFsaXplZF0KPiAgIG5leHQtPnByZXYgPSBuZXc7Cj4gICAgICAgICAgICAgIF4KPiBmcy9mMmZz
L25vZGUuYzoyMzg6MjQ6IG5vdGU6IOKAmGhlYWTigJkgd2FzIGRlY2xhcmVkIGhlcmUKPiAgIHN0
cnVjdCBuYXRfZW50cnlfc2V0ICpoZWFkOwoKVGhhdCdzIG5vdCBjb3JyZWN0LCBAaGVhZCB3aWxs
IG9ubHkgYmUgYXNzaWduZWQgYW5kIHVzZWQgaWYgbmV3X25lIGVxdWFscyBOVUxMLgoKVGhhbmtz
LAoKPiAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcg
dHJlYXRlZCBhcyBlcnJvcnMKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gCj4gVGhhbmtzCj4gQWxleAo+IAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
