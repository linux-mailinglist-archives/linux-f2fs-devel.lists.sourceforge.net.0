Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DC5E4531
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2019 10:05:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iNuag-0003Nv-S2; Fri, 25 Oct 2019 08:04:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iNuaf-0003Nm-Co
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Oct 2019 08:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HP60YDWPR2E65m01B9rMZ7qmho102mZl9XEFglLlhT4=; b=IfDLFD8Ennqq+8lfl7zXAIAJti
 AALzp0Njijh/6EBQQh3jtdXXTcVeZJvr2ENoghFXAyse+8NM7MKkpg4rYdh6pDwm3TDcV9NIyUdUA
 LlOumNTP9R2sxhEgrmqi3IKeSeZvNgGoToaZvzDPNyWt1Jk7L4GvWpp15jfn7hSzarA4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HP60YDWPR2E65m01B9rMZ7qmho102mZl9XEFglLlhT4=; b=d1vBcVYQs9qv8vBNRtlCKavsjI
 4xr/fhD9/pe9Ofha2a4xXMfPYwywvrWqM5h5BihiI+E3DmAHVQfCZv4t/lF5Y1M1738Y046RZWmR6
 ARw9eYToPiZrM1QMIrjaJmWDYhTVaypbm/9gCSVEDGsG4zPs858MCGmJyDgXh21Op3OE=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iNuac-0034IS-Rs
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Oct 2019 08:04:57 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 096A5ECD9030C7B20AD8;
 Fri, 25 Oct 2019 16:04:46 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 25 Oct
 2019 16:04:42 +0800
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
References: <fc71f3b73116115f78bcee2753e7bb3d5331731e.camel@analog.com>
 <e815981a-50ef-0f49-cab6-e510ea44ddc0@huawei.com>
 <425c2a3697b9973bb2bb51b692f80c02ef105285.camel@analog.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <dbd29eb5-527d-300e-61b8-227d44eb6c86@huawei.com>
Date: Fri, 25 Oct 2019 16:04:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <425c2a3697b9973bb2bb51b692f80c02ef105285.camel@analog.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: travis-ci.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iNuac-0034IS-Rs
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

T24gMjAxOS8xMC8yNCAxNzo1NCwgQXJkZWxlYW4sIEFsZXhhbmRydSB3cm90ZToKPiBPbiBUaHUs
IDIwMTktMTAtMjQgYXQgMTc6MTIgKzA4MDAsIENoYW8gWXUgd3JvdGU6Cj4+IFtFeHRlcm5hbF0K
Pj4KPj4gT24gMjAxOS8xMC8yMyAyMjowMiwgQXJkZWxlYW4sIEFsZXhhbmRydSB3cm90ZToKPj4+
IFNlZW1zIHRvIGhhdmUgYmVlbiBpbnRyb2R1Y2VkIHZpYToKPj4+Cj4+PiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pgo+
Pj4gY29tbWl0IDc4MGRlNDdjZjZjYjVmNTI0Y2Q5OGVjOGZmYmZmYzNkYTU2OTZlMTcKPj4+IEF1
dGhvcjogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPgo+Pj4gRGF0ZTogICBUdWUgTWFyIDIw
IDIzOjA4OjMwIDIwMTggKzA4MDAKPj4+Cj4+PiAgICAgZjJmczogZG9uJ3QgdHJhY2sgbmV3IG5h
dCBlbnRyeSBpbiBuYXQgc2V0Cj4+PiAgICAgCj4+PiAgICAgTmF0IGVudHJ5IHNldCBpcyB1c2Vk
IG9ubHkgaW4gY2hlY2twb2ludCgpLCBhbmQgZHVyaW5nIGNoZWNrcG9pbnQoKQo+Pj4gd2UKPj4+
ICAgICB3b24ndCBmbHVzaCBuZXcgbmF0IGVudHJ5IHdpdGggdW5hbGxvY2F0ZWQgYWRkcmVzcywg
c28gd2UgZG9uJ3QKPj4+IG5lZWQgdG8KPj4+ICAgICBhZGQgbmV3IG5hdCBlbnRyeSBpbnRvIG5h
dCBzZXQsIHRoZW4gbmF0X2VudHJ5X3NldDo6ZW50cnlfY250IGNhbgo+Pj4gICAgIGluZGljYXRl
IGFjdHVhbCBlbnRyeSBjb3VudCB3ZSBuZWVkIHRvIGZsdXNoIGluIGNoZWNrcG9pbnQoKS4KPj4+
ICAgICAKPj4+ICAgICBTaWduZWQtb2ZmLWJ5OiBZdW5sZWkgSGUgPGhleXVubGVpQGh1YXdlaS5j
b20+Cj4+PiAgICAgU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPgo+
Pj4gICAgIFNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4+
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4+Pgo+Pj4gQ29tcGlsZXIgd2FybmluZyBpczoKPj4+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+Cj4+
PiAgIENDICAgICAgZnMvZjJmcy9ub2RlLm8KPj4+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2lu
Y2x1ZGUvbGludXgvd2FpdC5oOjc6MCwKPj4+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1
ZGUvbGludXgvd2FpdF9iaXQuaDo4LAo+Pj4gICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVk
ZS9saW51eC9mcy5oOjYsCj4+PiAgICAgICAgICAgICAgICAgIGZyb20gZnMvZjJmcy9ub2RlLmM6
MTE6Cj4+PiBmcy9mMmZzL25vZGUuYzogSW4gZnVuY3Rpb24g4oCYX19zZXRfbmF0X2NhY2hlX2Rp
cnR54oCZOgo+Pj4gLi9pbmNsdWRlL2xpbnV4L2xpc3QuaDo2MzoxMzogZXJyb3I6IOKAmGhlYWTi
gJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZAo+Pj4gaW4KPj4+IHRoaXMgZnVuY3Rpb24gWy1X
ZXJyb3I9bWF5YmUtdW5pbml0aWFsaXplZF0KPj4+ICAgbmV4dC0+cHJldiA9IG5ldzsKPj4+ICAg
ICAgICAgICAgICBeCj4+PiBmcy9mMmZzL25vZGUuYzoyMzg6MjQ6IG5vdGU6IOKAmGhlYWTigJkg
d2FzIGRlY2xhcmVkIGhlcmUKPj4+ICAgc3RydWN0IG5hdF9lbnRyeV9zZXQgKmhlYWQ7Cj4+Cj4+
IFRoYXQncyBub3QgY29ycmVjdCwgQGhlYWQgd2lsbCBvbmx5IGJlIGFzc2lnbmVkIGFuZCB1c2Vk
IGlmIG5ld19uZSBlcXVhbHMKPj4gTlVMTC4KPiAKPiBBY2suCj4gSSBhZG1pdCB0aGF0IEkgZG9u
J3QgdW5kZXJzdGFuZCB0aGUgY29kZSwgYW5kIGRvbid0IGNsYWltIHRvIHVuZGVyc3RhbmQgaXQu
Cj4gCj4gVGhpcyBtYXkgYmUganVzdCBhIHdlaXJkIGNvbXBpbGVyIGlzc3VlLgo+IEkgdGhvdWdo
dCBJJ2Qgc2VuZCBpdCBqdXN0IGFzIGEgaGVhZHMtdXAuCgpJIHRoaW5rIHRoYXQncyB0aGUgcmln
aHQgdGhpbmcgdG8gZG8uCgo+IEkgc2F3IHRoaXMgb24gYSBSYXNwYmVycnkgUGkgYnJhbmNoIFth
ZnRlciB3ZSBlbmFibGVkIHdhcm5pbmdzIGFzIGVycm9yc106Cj4gaHR0cHM6Ly90cmF2aXMtY2ku
b3JnL2FuYWxvZ2RldmljZXNpbmMvbGludXgvam9icy82MDE4NDQ5MjYjTDEyMDgKPiAKPiBMb29r
aW5nIGluIHRoZSBsYXRlc3QgZjJmcy9kZXZbLXRlc3RdIHRyZWUsIGl0IGxvb2tzIGxpa2UgdGhl
IGNvZGUgaXMKPiBzaW1pbGFyIGFzIGluIDQuMTkuCj4gaHR0cHM6Ly9naXRodWIuY29tL2FuYWxv
Z2RldmljZXNpbmMvbGludXgvYmxvYi9ycGktNC4xOS55L2ZzL2YyZnMvbm9kZS5jI0wyMzUKPiAK
PiBDb3VsZCBiZSB0aGF0IHRoZSBSUGkgYnJhbmNoIGhhcyBzb21lIG1vcmUgY29tcGlsZXItc3R1
ZmYgZW5hYmxlZC4KPiAKPiBJbiBhbnkgY2FzZSwgZmVlbCBmcmVlIHRvIGRpc3JlZ2FyZCB0aGlz
Lgo+IFdlIHdpbGwgc2VlIGhvdyB3ZSBmaXggdGhpcyBvbiBvdXIgZW5kIGZvciB0aGF0IGJyYW5j
aCBzcGVjaWZpY2FsbHkuCgpUaGF0IHdvdWxkIG1ha2Ugc2Vuc2UsIGxldCBtZSBrbm93IGlmIHlv
dSBoYXZlIGFueSBvdGhlciBzdXNwaWNpb3VzIGNvbXBpbGVyCndhcm5pbmdzLiA6KQoKVGhhbmtz
LAoKPiAKPiBUaGFua3MKPiBBbGV4Cj4gCj4+Cj4+IFRoYW5rcywKPj4KPj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgIF4KPj4+IGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJy
b3JzCj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4+Pgo+Pj4gVGhhbmtzCj4+PiBBbGV4Cj4+Pgo+Pj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IExpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0Cj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dAo+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo+Pj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
