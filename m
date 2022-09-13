Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFA05B67A7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Sep 2022 08:14:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXzBt-0005lK-Fm;
	Tue, 13 Sep 2022 06:14:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oXzBr-0005lD-Dn
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 06:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rvnlCDOszysmPVrlA111RH0Bc2LHbTQtWlsYyB5yX54=; b=du+Ny17Jplky2fhyh7yShNoPut
 UQ/j1pWTnJEE1Zq2C69FzhZGXkDi038cwfeaEcRK0xOpmVqI+7Lm3XyCyeps7zcRTdQk0b96mj1O9
 0xAAbJG9rhlWbmJ0V4lqkRL3p2L/cEatHqQC6O4HJYqKl+8jSEHTWvjV0ZV3f7+UoeVc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rvnlCDOszysmPVrlA111RH0Bc2LHbTQtWlsYyB5yX54=; b=jwgDGPxHHOtLDDq3znxDq/4Eh/
 gniXF2FM2E1SP3eSjbXlSqN3p301Toi6TAe/DumB8zgI6O8tVgcwp9OhFEvjyovl0XRoUMR1GrOK6
 wpXfpeeqC7qIVTOq98GWqKM1TDUr3LvMNrAyFrJgGOqVruHwpTMKduHh2IiZzX0DRDZM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oXzBn-006bjq-Ox for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 06:14:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9467B60D3B;
 Tue, 13 Sep 2022 06:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157C4C433D6;
 Tue, 13 Sep 2022 06:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663049661;
 bh=kvICSyi5WPx8xhFgitmkNJTtGXnd0oVMSBx6QXmzUZ0=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=mK0OHgEVjzsxWjFZXJ18cQqlY6JNxtV9vZfGEvk6/S/DhVOUla2miCEMKC8fsHtN2
 OFaGSGxsUV++vNAfiv/hOeur6IwOYgucCm8QdjUTvU/W7fNX1e9Wujrskl/Bk66o2o
 EFoCPRKf/7tV5ooAsCXVqpAZhndhjz7NSb+J5fRIr0sk0anJ385FkRey9vcLT5EV0G
 0HvMRtTgmjRm5dqUWIwxrSr3JmJkTJ7985ov5xsL9zX8PtfoPyLvMsfdm+2r1IOnEf
 wbpgWehEdQkBdtaolQTGrpQcQHGUOYmjbJy1+XBXJ87pfAxKPznncYT5GjAlbcK876
 V0ZDt+Xug9Mng==
Message-ID: <4e5d2c1c-f77d-841c-8920-c0e0ec41680c@kernel.org>
Date: Tue, 13 Sep 2022 14:14:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: zhangqilong <zhangqilong3@huawei.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20220913030529.3944-1-zhangqilong3@huawei.com>
 <293a41a4-7c7d-aac8-0bc2-15d47b7bd538@kernel.org>
 <4430326a24364b6aa92332c1393509f4@huawei.com>
 <0cf48a6c-79ff-ef04-b630-a76faaca34c6@kernel.org>
 <ae929a5c21b441f49fc187e7e893fe61@huawei.com>
 <4fd0acaa-8231-200b-b90c-81d1e82dd861@kernel.org>
In-Reply-To: <4fd0acaa-8231-200b-b90c-81d1e82dd861@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/13 14:10, Chao Yu wrote: > On 2022/9/13 12:37,
 zhangqilong
 wrote: >>> >>> On 2022/9/13 11:41, zhangqilong wrote: >>>>> On 2022/9/13
 11:05, Zhang Qilong wrote: >>>>>> If we do not truncate so [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oXzBn-006bjq-Ox
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiDnrZTlpI06IFtQQVRDSCAtbmV4dF0g?=
 =?utf-8?q?f2fs=3A_adding_truncate_page_cache_after_being_moved?=
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi85LzEzIDE0OjEwLCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjIvOS8xMyAxMjozNywg
emhhbmdxaWxvbmcgd3JvdGU6Cj4+Pgo+Pj4gT24gMjAyMi85LzEzIDExOjQxLCB6aGFuZ3FpbG9u
ZyB3cm90ZToKPj4+Pj4gT24gMjAyMi85LzEzIDExOjA1LCBaaGFuZyBRaWxvbmcgd3JvdGU6Cj4+
Pj4+PiBJZiB3ZSBkbyBub3QgdHJ1bmNhdGUgc291cmNlIHBhZ2UgY2FjaGUsIHVzZXIgY2FuIHN0
aWxsIHNlZSB0aGUKPj4+Pj4+IHByZXZpb3VzIHNvdXJjZSBkYXRhIGFmdGVyIGJlaW5nIG1vdmVk
LiBXZSBmaXggaXQgYnkgYWRkaW5nCj4+Pj4+PiB0cnVuY2F0aW5nIGFmdGVyIF9fZXhjaGFuZ2Vf
ZGF0YV9ibG9jay4KPj4+Pj4+Cj4+Pj4+PiBGaXhlczo0ZGQ2Zjk3N2ZjNzc4ICgiZjJmczogc3Vw
cG9ydCBhbiBpb2N0bCB0byBtb3ZlIGEgcmFuZ2Ugb2YgZGF0YQo+Pj4+Pj4gYmxvY2tzIikKPj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IFpoYW5nIFFpbG9uZyA8emhhbmdxaWxvbmczQGh1YXdlaS5jb20+
Cj4+Pj4+PiAtLS0KPj4+Pj4+IMKgwqDCoCBmcy9mMmZzL2ZpbGUuYyB8IDQgKysrKwo+Pj4+Pj4g
wqDCoMKgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4+Pj4+Cj4+Pj4+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYyBpbmRleAo+Pj4+Pj4gNzcx
ZjFmN2YzNjkwLi5lM2ZmNjQ4YWE0OTYgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2ZpbGUu
Ywo+Pj4+Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPj4+Pj4+IEBAIC0yNzg5LDYgKzI3ODksMTAg
QEAgc3RhdGljIGludCBmMmZzX21vdmVfZmlsZV9yYW5nZShzdHJ1Y3QgZmlsZQo+Pj4+PiAqZmls
ZV9pbiwgbG9mZl90IHBvc19pbiwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+IMKgwqDC
oMKgwqDCoMKgIGYyZnNfdW5sb2NrX29wKHNiaSk7Cj4+Pj4+Pgo+Pj4+Pj4gK8KgwqDCoCBmaWxl
bWFwX2ludmFsaWRhdGVfbG9jayhzcmMtPmlfbWFwcGluZyk7Cj4+Pj4+Cj4+Pj4+IGludmFsaWRh
dGUgbG9jayBzaG91bGQgY292ZXIgX19leGNoYW5nZV9kYXRhX2Jsb2NrKCk/Cj4+Pj4+Cj4+Pj4+
PiArwqDCoMKgIHRydW5jYXRlX3BhZ2VjYWNoZV9yYW5nZShzcmMsIHBvc19pbiwgcG9zX2luICsg
bGVuIC0gMSk7Cj4+Pj4+Cj4+Pj4+IHRydW5jYXRlX3BhZ2VjYWNoZV9yYW5nZSgpIHNob3VsZCBi
ZSBjYWxsZWQgYmVmb3JlCj4+Pj4+IF9fZXhjaGFuZ2VfZGF0YV9ibG9jaygpPwo+Pj4+Cj4+Pj4g
SSBoYXZlIHRyaWVkIGl0LCBidXQgaXQgZG8gbm90IHdvcmsuIFNvIEkgbW92ZSB0aGUgdHJ1bmNh
dGUgb3BlcmF0aW9uCj4+Pj4gdG8gdGhlIGJhY2sgb2YgX19leGNoYW5nZV9kYXRhX2Jsb2NrIHRo
YXQgaXQgd29ya3Mgd2VsbC4gSSBkb24ndCBrbm93Cj4+Pj4gbXVjaCBlbm91Z2gsIHdoYXQgZG8g
eW91IHRoaW5rIG9mIHRoaXMgaXNzdWUuCj4+Pgo+Pj4gQ2FuIHlvdSBkZXNjcmliZSBkZXRhaWxz
IGFib3V0IHRoZSB0ZXN0Y2FzZT8KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pgo+PiBQcm9jZXNzIDHC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJvY2VzcyAy
Cj4+IC0+IG9wZW4gQQo+PiAtPiBtbWFwCj4+IMKgwqDCoMKgUmVhZCB0aGUgZGF0YSBhbmQgc2F2
ZQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtPiBpb2N0bCB3aXRoIEYyRlNfSU9DX01PVkVfUkFOR0XCoMKgIEHCoCAtPsKg
IEIKPiAKPiBUaGUgaW9jdGwgb25seSBjaGFuZ2UgdGhlIGRhdGEgb24gdGFyZ2V0IGZpbGUgKEIp
LCBzbyBQcm9jZXNzIDEgbmVlZHMgdG8KPiByZWFkIGFuZCBjaGVjayBkYXRhIG9mIHNvdXJjZSBm
aWxlIChCKT8KClNvcnJ5LCB0b28gcnVzaCB0byBzZW5kIHRoaXMsIGxldCBtZSBjaGVjayB5b3Vy
IHRlc3RjYXNlLi4uCgpUaGFua3MsCgo+IAo+IFRoYW5rcywKPiAKPj4KPj4gLT4gbW1hcAo+PiDC
oMKgwqDCoFJlYWQgdGhlIGRhdGEgdGhhdCBvZmZzZXQgaXMgc2FtZSB3aXRoIGZpcnN0IHRpbWUg
YW5kIHNhdmUKPj4KPj4gQ29tcGFyZSB0aGUgY29uc2lzdGVuY3kgb2YgdGhlIGRhdGEgdGhhdCBy
ZWFkIHR3aWNlLgo+Pgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
