Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0D116A4ED
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 12:32:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6ByD-0006Cn-8l; Mon, 24 Feb 2020 11:32:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j6ByC-0006Cc-11
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 11:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0NcRI2RiPpcf+2iFELLDLxL6kP7s4TvqX2zUg5CmiUI=; b=XrfECBARGmrpVfBa+afMHr/NZP
 bp8oVQrkdP0I759So6mGV7/ZnbjbFrfyLwQvWoAWu3dcDIbo+Y4kzRy4mITmoRH7tTsVRznGZWp54
 Frg39ktG69Vf+YCDQgBiVasKMvZc3hG8kC3aNf/c3fewk8v3VcKqhug0O1AtKbXqRyxA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0NcRI2RiPpcf+2iFELLDLxL6kP7s4TvqX2zUg5CmiUI=; b=f+NmSmfJd6VCgmyGSWiFDWlnpj
 +ghKItKUdoHCanmlu9zcLbtqTbw1Ulr++SEmLbixBTxxNsKXk/kCDuiNIfdIrbWl3bn9FOY7rIbyH
 sR73lyBB0GZYiEGM8hJbTdbxQKYKyY/IVuQUD3qi4Ch/+UmfVRWu3u8eH16D47zuZMvk=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6ByA-00573W-07
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 11:32:15 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CAA0257DFB2B9C171D8D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Feb 2020 19:32:03 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 24 Feb
 2020 19:31:58 +0800
To: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200222182805.he7zj3wqyjwy6fbs@core.my.home>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <b1759ed8-3977-8e89-8819-c3101ae8d61a@huawei.com>
Date: Mon, 24 Feb 2020 19:31:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200222182805.he7zj3wqyjwy6fbs@core.my.home>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.9 CTE_8BIT_MISMATCH      Header says 7bits but body disagrees
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j6ByA-00573W-07
Subject: Re: [f2fs-dev] f2fs.fsck should allow dry-run on RO mounted device
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

T24gMjAyMC8yLzIzIDI6MjgsIE9uZMWZZWogSmlybWFuIHdyb3RlOgo+IEhlbGxvLAo+IAo+IEkg
d2FzIHRyeWluZyB0byBydW46IGZzY2suZjJmcyAtLWRyeS1ydW4gL2Rldi9tbWNibGswcDIgb24g
YSBSTyBtb3VudGVkIGRldmljZSwKPiBhbmQgZnNjayByZWZ1c2VzIHRvIHJ1bi4gU3RyYWNlIHNo
b3dzIHRoYXQgaXQgdHJpZXMgdG8gb3BlbiB0aGUgYmxvY2sgZGV2aWNlCj4gd2l0aCBPX0VYQ0wg
ZXZlbiBpbiBSTyBtb2RlLCB3aGljaCB3aWxsIGFsd2F5cyBmYWlsIGlmIHRoZSBibG9jayBkZXZp
Y2UKPiBpcyBtb3VudGVkLgoKVGhhbmtzIGZvciB5b3VyIHJlcG9ydCwgSSd2ZSBmaWd1cmVkIG91
dCBvbmUgcGF0Y2ggdG8gZml4IHRoaXMuCgpUaGFua3MsCgo+IAo+IG9wZW5hdChBVF9GRENXRCwg
Ii9wcm9jL21vdW50cyIsIE9fUkRPTkxZfE9fQ0xPRVhFQykgPSAzCj4gZnN0YXQ2NCgzLCB7c3Rf
bW9kZT1TX0lGUkVHfDA0NDQsIHN0X3NpemU9MCwgLi4ufSkgPSAwCj4gcmVhZCgzLCAiL2Rldi9y
b290IC8gZjJmcyBybyxsYXp5dGltZSxyZWwiLi4uLCAxMDI0KSA9IDg0Mwo+IGNsb3NlKDMpICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IDAKPiB3cml0ZSgxLCAiSW5mbzogTW91bnRl
ZCBkZXZpY2UhXG4iLCAyMkluZm86IE1vdW50ZWQgZGV2aWNlIQo+ICkgPSAyMgo+IHdyaXRlKDEs
ICJJbmZvOiBDaGVjayBGUyBvbmx5IG9uIFJPIG1vdW50ZSIuLi4sIDQxSW5mbzogQ2hlY2sgRlMg
b25seSBvbiBSTyBtb3VudGVkIGRldmljZQo+ICkgPSA0MQo+IHN0YXQ2NCgiL2Rldi9tbWNibGsw
cDIiLCB7c3RfbW9kZT1TX0lGQkxLfDA2MDAsIHN0X3JkZXY9bWFrZWRldigweGIzLCAweDIpLCAu
Li59KSA9IDAKPiBvcGVuYXQoQVRfRkRDV0QsICIvZGV2L21tY2JsazBwMiIsIE9fUkRXUnxPX0VY
Q0x8T19MQVJHRUZJTEUpID0gLTEgRUJVU1kgKERldmljZSBvciByZXNvdXJjZSBidXN5KQo+IG9w
ZW5hdChBVF9GRENXRCwgIi9kZXYvbW1jYmxrMHAyIiwgT19SRE9OTFl8T19FWENMfE9fTEFSR0VG
SUxFKSA9IC0xIEVCVVNZIChEZXZpY2Ugb3IgcmVzb3VyY2UgYnVzeSkKPiB3cml0ZSgxLCAiXHRF
cnJvcjogRmFpbGVkIHRvIG9wZW4gdGhlIGRldmljIi4uLiwgMzUJRXJyb3I6IEZhaWxlZCB0byBv
cGVuIHRoZSBkZXZpY2UhCj4gKSA9IDM1Cj4gZXhpdF9ncm91cCgtMSkgICAgICAgICAgICAgICAg
ICAgICAgICAgID0gPwo+ICsrKyBleGl0ZWQgd2l0aCAyNTUgKysrCj4gCj4gCj4gZnNjay5mMmZz
IC0tZHJ5LXJ1biAvZGV2L21tY2JsazBwMgo+IEluZm86IERyeSBydW4KPiBJbmZvOiBNb3VudGVk
IGRldmljZSEKPiBJbmZvOiBDaGVjayBGUyBvbmx5IG9uIFJPIG1vdW50ZWQgZGV2aWNlCj4gCUVy
cm9yOiBGYWlsZWQgdG8gb3BlbiB0aGUgZGV2aWNlIQo+IAo+IEkgc3VnZ2VzdCBub3QgdXNpbmcg
T19FWENMIGZvciAtLWRyeS1ydW4gY2hlY2suCj4gCj4gcmVnYXJkcywKPiAJT25kcmVqCj4gCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
