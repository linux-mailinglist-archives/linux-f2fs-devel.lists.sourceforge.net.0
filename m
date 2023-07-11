Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC2C74E894
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jul 2023 10:00:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qJ8IV-0007EH-7t;
	Tue, 11 Jul 2023 08:00:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qJ8IU-0007EA-0S
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 08:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JAmRMJreZBquuYKJMAuR5CEnLkVmnoy64n1vRaii0vM=; b=RfxhQLrX3e8OmAR2gK452s1+9X
 iMWwbw1HYBmOw6ip1qfyLstB2Wo+xA+zMAeuEImrQnhs/MReuo3d4YKlNungy7cXFAUKbRPwbEPwg
 cPZXKcN+EwnVgCI5nRVXq8Y4GmbT5l8TL1CqcArA8lC5SG1ep3c76eGJT+pjpi+byAgU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JAmRMJreZBquuYKJMAuR5CEnLkVmnoy64n1vRaii0vM=; b=IRyj+HEW2EsRb7Z+eEKJ71gMWE
 npdRFgpjzro3RzRCh9GAlTy2cKmexRCbOOn8tCdzWTGvlSL711NVWs70dqieBpmHFumN3c+0zalBI
 JAa28MYLYXUDaONyxV2stv5ahXH66P6tKj8Lu4kkT3HOGeeFRBeN8lOoSDA4K6hSZ20A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qJ8IW-0006vG-7u for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 08:00:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC69461369
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Jul 2023 08:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60765C433C7;
 Tue, 11 Jul 2023 08:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689062428;
 bh=Vh8wJERkeoJAH7WZTn6GTTqD0L/T8dhTkMXGSs9gnIU=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=jpAl+B/LrT3bdYz0t+fF6kSb10UGId090DOAV8pHKt0KOR35ExAOC2E9c6Sqmxk11
 55V/GIGiaSqwg8OCp5F+J4MOLOGINGqkpeNHZAJTxpgA6y7AiTuk50LmhNI7/4t8Ll
 FjYeGyQdtpYi5svnFYmxRGMpBrq/deVqoy5X5YnUy0xGuNx/PHR6zu0yVLb9jE4ux7
 uyyC8es16WDa3nqdI9rDq75XxdNznZw7EYrKOyLYEpKsflY9YnOikXRNOS5gItCO97
 gAnlEJ3m2On+K9Mk4xg0582JdV9tVKyr3HVVDzZaWwJrzHx7Ju7CCmUP/l7yeEGSDC
 3P1qkRM0huGrA==
Message-ID: <94b767a3-e768-54d6-3653-90aeaf8edd4a@kernel.org>
Date: Tue, 11 Jul 2023 16:00:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230613203947.2745943-1-jaegeuk@kernel.org>
 <ZInmkgjDnAUD5Nk0@google.com>
 <50d5fa8c-4fe9-8a03-be78-0b5383e55b62@kernel.org>
 <ZKP6EJ5dZ4f4wScp@google.com>
 <65143701-4c19-ab66-1500-abd1162639cd@kernel.org>
 <ZKWovWZDiHjMavtB@google.com>
 <cadfb8d7-f5d0-a3ec-cafb-a0c06ad7d290@kernel.org>
In-Reply-To: <cadfb8d7-f5d0-a3ec-cafb-a0c06ad7d290@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/6 8:46, Chao Yu wrote: > On 2023/7/6 1:30, Jaegeuk
 Kim wrote: >> On 07/04, Chao Yu wrote: >>> On 2023/7/4 18:53, Jaegeuk Kim
 wrote: >>>> On 07/03, Chao Yu wrote: >>>>> On 2023/6/15 0:10, Jae [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qJ8IW-0006vG-7u
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: do not issue small discard commands
 during checkpoint
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy83LzYgODo0NiwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIzLzcvNiAxOjMwLCBKYWVn
ZXVrIEtpbSB3cm90ZToKPj4gT24gMDcvMDQsIENoYW8gWXUgd3JvdGU6Cj4+PiBPbiAyMDIzLzcv
NCAxODo1MywgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4+Pj4gT24gMDcvMDMsIENoYW8gWXUgd3JvdGU6
Cj4+Pj4+IE9uIDIwMjMvNi8xNSAwOjEwLCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+Pj4+IElmIHRo
ZXJlJ3JlIGh1Z2UgIyBvZiBzbWFsbCBkaXNjYXJkcywgdGhpcyB3aWxsIGluY3JlYXNlIGNoZWNr
cG9pbnQgbGF0ZW5jeQo+Pj4+Pj4gaW5zYW5lbHkuIExldCdzIGlzc3VlIHNtYWxsIGRpc2NhcmRz
IG9ubHkgYnkgdHJpbS4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtpbSA8
amFlZ2V1a0BrZXJuZWwub3JnPgo+Pj4+Pj4gLS0tCj4+Pj4+Pgo+Pj4+Pj4gwqDCoMKgIENoYW5n
ZSBsb2cgZnJvbSB2MToKPj4+Pj4+IMKgwqDCoMKgIC0gbW92ZSB0aGUgc2tpcCBsb2dpYyB0byBh
dm9pZCBkYW5nbGluZyBvYmplY3RzCj4+Pj4+Pgo+Pj4+Pj4gwqDCoMKgIGZzL2YyZnMvc2VnbWVu
dC5jIHwgMiArLQo+Pj4+Pj4gwqDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQu
YyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4+Pj4+PiBpbmRleCA4YzdhZjhiNGZjNDcuLjA0NTdkNjIw
MDExZiAxMDA2NDQKPj4+Pj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4+Pj4+PiArKysgYi9m
cy9mMmZzL3NlZ21lbnQuYwo+Pj4+Pj4gQEAgLTIxOTMsNyArMjE5Myw3IEBAIHZvaWQgZjJmc19j
bGVhcl9wcmVmcmVlX3NlZ21lbnRzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZW4gPSBuZXh0X3BvcyAtIGN1cl9wb3M7Cj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGYyZnNfc2JfaGFzX2Jsa3pv
bmVkKHNiaSkgfHwKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKGZvcmNl
ICYmIGxlbiA8IGNwYy0+dHJpbV9taW5sZW4pKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICFmb3JjZSB8fCBsZW4gPCBjcGMtPnRyaW1fbWlubGVuKQo+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBza2lwOwo+Pj4+
Pgo+Pj4+PiBTb3JyeSBmb3IgbGF0ZSByZXBseS4KPj4+Pj4KPj4+Pj4gV2UgaGF2ZSBhIGNvbmZp
Z3VyYXRpb24gZm9yIHN1Y2ggY2FzZSwgd2hhdCBkbyB5b3UgdGhpbmsgb2Ygc2V0dGluZwo+Pj4+
PiBtYXhfc21hbGxfZGlzY2FyZHMgdG8gemVybz8gb3RoZXJ3aXNlLCB3LyBhYm92ZSBjaGFuZ2Us
IG1heF9zbWFsbF9kaXNjYXJkcwo+Pj4+PiBsb2dpYyBtYXkgYmUgYnJva2VuPwo+Pj4+Pgo+Pj4+
PiBXaGF0OsKgwqDCoMKgwqDCoMKgwqDCoMKgIC9zeXMvZnMvZjJmcy88ZGlzaz4vbWF4X3NtYWxs
X2Rpc2NhcmRzCj4+Pj4+IERhdGU6wqDCoMKgwqDCoMKgwqDCoMKgwqAgTm92ZW1iZXIgMjAxMwo+
Pj4+PiBDb250YWN0OsKgwqDCoMKgwqDCoMKgICJKYWVnZXVrIEtpbSIgPGphZWdldWsua2ltQHNh
bXN1bmcuY29tPgo+Pj4+PiBEZXNjcmlwdGlvbjrCoMKgwqAgQ29udHJvbHMgdGhlIGlzc3VlIHJh
dGUgb2YgZGlzY2FyZCBjb21tYW5kcyB0aGF0IGNvbnNpc3Qgb2Ygc21hbGwKPj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBibG9ja3MgbGVzcyB0aGFuIDJNQi4gVGhlIGNh
bmRpZGF0ZXMgdG8gYmUgZGlzY2FyZGVkIGFyZSBjYWNoZWQgdW50aWwKPj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjaGVja3BvaW50IGlzIHRyaWdnZXJlZCwgYW5kIGlz
c3VlZCBkdXJpbmcgdGhlIGNoZWNrcG9pbnQuCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgQnkgZGVmYXVsdCwgaXQgaXMgZGlzYWJsZWQgd2l0aCAwLgo+Pj4+Pgo+Pj4+
PiBPciwgaWYgd2UgcHJlZmVyIHRvIGRpc2FibGUgc21hbGxfZGlzY2FyZHMgYnkgZGVmYXVsdCwg
d2hhdCBhYm91dCBiZWxvdyBjaGFuZ2U6Cj4+Pj4KPj4+PiBJIHRoaW5rIHNtYWxsX2Rpc2NhcmRz
IGlzIGZpbmUsIGJ1dCBuZWVkIHRvIGF2b2lkIGxvbmcgY2hlY2twb2ludCBsYXRlbmN5IG9ubHku
Cj4+Pgo+Pj4gSSBkaWRuJ3QgZ2V0IHlvdSwgZG8geW91IG1lYW4gd2UgY2FuIHN0aWxsIGlzc3Vl
IHNtYWxsIGRpc2NhcmQgYnkKPj4+IGZzdHJpbSwgc28gc21hbGxfZGlzY2FyZHMgZnVuY3Rpb25h
bGl0eSBpcyBmaW5lPwo+Pgo+PiBZb3UgZ290IHRoZSBwb2ludC4KPiAKPiBXZWxsLCBhY3R1YWxs
eSwgd2hhdCBJIG1lYW4gaXMgbWF4X3NtYWxsX2Rpc2NhcmRzIHN5c2ZzIGVudHJ5J3MgZnVuY3Rp
b25hbGl0eQo+IGlzIGJyb2tlbi4gTm93LCB0aGUgZW50cnkgY2FuIG5vdCBiZSB1c2VkIHRvIGNv
bnRyb2wgbnVtYmVyIG9mIHNtYWxsIGRpc2NhcmRzCj4gY29tbWl0dGVkIGJ5IGNoZWNrcG9pbnQu
Cj4gCj4gSSB0aGluayB0aGVyZSBpcyBhbm90aGVyIHdheSB0byBhY2hpZXZlICJhdm9pZCBsb25n
IGNoZWNrcG9pbnQgbGF0ZW5jeSBjYXVzZWQKPiBieSBjb21taXR0aW5nIGh1Z2UgIyBvZiBzbWFs
bCBkaXNjYXJkcyIsIHRoZSB3YXkgaXMgd2UgY2FuIHNldCBtYXhfc21hbGxfZGlzY2FyZHMKPiB0
byBzbWFsbCB2YWx1ZSBvciB6ZXJvLCB3LyBzdWNoIGNvbmZpZ3VyYXRpb24sIGl0IHdpbGwgdGFr
ZSBjaGVja3BvaW50IG11Y2ggbGVzcwo+IHRpbWUgb3Igbm8gdGltZSB0byBjb21taXR0aW5nIHNt
YWxsIGRpc2NhcmQgZHVlIHRvIGJlbG93IGNvbnRyb2wgbG9naWM6CgpKYWVnZXVrLCBhbnkgY29t
bWVudHM/CgpUaGFua3MsCgo+IAo+IGYyZnNfZmx1c2hfc2l0X2VudHJpZXMoKQo+IHsKPiAuLi4K
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIShjcGMtPnJlYXNvbiAmIENQX0RJU0NBUkQp
KSB7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjcGMtPnRyaW1fc3RhcnQgPSBz
ZWdubzsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkZF9kaXNjYXJkX2FkZHJz
KHNiaSwgY3BjLCBmYWxzZSk7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+IC4uLgo+IH0K
PiAKPiBhZGRfZGlzY2FyZF9hZGRycygpCj4gewo+IC4uLgo+ICDCoMKgwqDCoHdoaWxlIChmb3Jj
ZSB8fCBTTV9JKHNiaSktPmRjY19pbmZvLT5ucl9kaXNjYXJkcyA8PQo+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgU01fSShzYmkpLT5kY2NfaW5mby0+bWF4X2Rpc2NhcmRzKSB7Cj4g
Cj4gSXQgd2lsbCBicmVhayB0aGUgbG9vcCBvbmNlIG5yX2Rpc2NhcmRzIGlzIGxhcmdlciB0aGFu
IG1heF9kaXNjYXJkcywgaWYKPiBtYXhfZGlzY2FyZHMgaXMgc2V0IHRvIHplcm8sIGNoZWNrcG9p
bnQgd29uJ3QgdGFrZSB0aW1lIHRvIGhhbmRsZSBzbWFsbCBkaXNjYXJkcy4KPiAKPiAuLi4KPiAg
wqDCoMKgwqDCoMKgwqAgaWYgKCFkZSkgewo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlID0g
ZjJmc19rbWVtX2NhY2hlX2FsbG9jKGRpc2NhcmRfZW50cnlfc2xhYiwKPiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfRjJGU19aRVJPLCB0cnVlLCBO
VUxMKTsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZS0+c3RhcnRfYmxrYWRkciA9IFNUQVJU
X0JMT0NLKHNiaSwgY3BjLT50cmltX3N0YXJ0KTsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBs
aXN0X2FkZF90YWlsKCZkZS0+bGlzdCwgaGVhZCk7Cj4gIMKgwqDCoMKgwqDCoMKgIH0KPiAuLi4K
PiAgwqDCoMKgwqB9Cj4gLi4uCj4gCj4gVGhhbmtzLAo+IAo+Pgo+Pj4KPj4+IFRoYW5rcywKPj4+
Cj4+Pj4KPj4+Pj4KPj4+Pj4gwqAgRnJvbSBlYjg5ZDliNTZlODE3ZTMwNDZkN2ZhMTcxNjViMTI0
MTZmMDlkNDU2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+Pj4+PiBGcm9tOiBDaGFvIFl1IDxj
aGFvQGtlcm5lbC5vcmc+Cj4+Pj4+IERhdGU6IE1vbiwgMyBKdWwgMjAyMyAwOTowNjo1MyArMDgw
MAo+Pj4+PiBTdWJqZWN0OiBbUEFUQ0hdIFJldmVydCAiZjJmczogZW5hYmxlIHNtYWxsIGRpc2Nh
cmQgYnkgZGVmYXVsdCIKPj4+Pj4KPj4+Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCBkNjE4ZWJhZjBh
YTgzZDE3NTY1OGFlYTUyOTFlMGM0NTlkNDcxZDM5IGluIG9yZGVyCj4+Pj4+IHRvIGRpc2FibGUg
c21hbGwgZGlzY2FyZCBieSBkZWZhdWx0LCBzbyB0aGF0IGlmIHRoZXJlJ3JlIGh1Z2UgbnVtYmVy
IG9mCj4+Pj4+IHNtYWxsIGRpc2NhcmRzLCBpdCB3aWxsIGRlY3JlYXNlIGNoZWNrcG9pbnQncyBs
YXRlbmN5IG9idmlvdXNseS4KPj4+Pj4KPj4+Pj4gQWxzbywgdGhpcyBwYXRjaCByZXZlcnRzIDlh
YzAwZTdjZWYxMCAoImYyZnM6IGRvIG5vdCBpc3N1ZSBzbWFsbCBkaXNjYXJkCj4+Pj4+IGNvbW1h
bmRzIGR1cmluZyBjaGVja3BvaW50IiksIGR1ZSB0byBpdCBicmVha3Mgc21hbGwgZGlzY2FyZCBm
ZWF0dXJlIHdoaWNoCj4+Pj4+IG1heSBiZSBjb25maWd1cmVkIHZpYSBzeXNmcyBlbnRyeSBtYXhf
c21hbGxfZGlzY2FyZHMuCj4+Pj4+Cj4+Pj4+IEZpeGVzOiA5YWMwMGU3Y2VmMTAgKCJmMmZzOiBk
byBub3QgaXNzdWUgc21hbGwgZGlzY2FyZCBjb21tYW5kcyBkdXJpbmcgY2hlY2twb2ludCIpCj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4+Pj4gLS0tCj4+
Pj4+IMKgwqAgZnMvZjJmcy9zZWdtZW50LmMgfCA0ICsrLS0KPj4+Pj4gwqDCoCAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4+PiBpbmRleCAx
NGM4MjJlNWM5YzkuLjBhMzEzMzY4ZjE4YiAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9zZWdt
ZW50LmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+Pj4gQEAgLTIxOTMsNyArMjE5
Myw3IEBAIHZvaWQgZjJmc19jbGVhcl9wcmVmcmVlX3NlZ21lbnRzKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZW4gPSBuZXh0X3Bv
cyAtIGN1cl9wb3M7Cj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KGYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkgfHwKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICFmb3JjZSB8fCBsZW4gPCBjcGMtPnRyaW1fbWlubGVuKQo+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChmb3JjZSAmJiBsZW4gPCBjcGMtPnRy
aW1fbWlubGVuKSkKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdv
dG8gc2tpcDsKPj4+Pj4KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX2lz
c3VlX2Rpc2NhcmQoc2JpLCBlbnRyeS0+c3RhcnRfYmxrYWRkciArIGN1cl9wb3MsCj4+Pj4+IEBA
IC0yMjY5LDcgKzIyNjksNyBAQCBzdGF0aWMgaW50IGNyZWF0ZV9kaXNjYXJkX2NtZF9jb250cm9s
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPj4+Pj4gwqDCoMKgwqDCoMKgIGF0b21pY19zZXQo
JmRjYy0+cXVldWVkX2Rpc2NhcmQsIDApOwo+Pj4+PiDCoMKgwqDCoMKgwqAgYXRvbWljX3NldCgm
ZGNjLT5kaXNjYXJkX2NtZF9jbnQsIDApOwo+Pj4+PiDCoMKgwqDCoMKgwqAgZGNjLT5ucl9kaXNj
YXJkcyA9IDA7Cj4+Pj4+IC3CoMKgwqAgZGNjLT5tYXhfZGlzY2FyZHMgPSBNQUlOX1NFR1Moc2Jp
KSA8PCBzYmktPmxvZ19ibG9ja3NfcGVyX3NlZzsKPj4+Pj4gK8KgwqDCoCBkY2MtPm1heF9kaXNj
YXJkcyA9IDA7Cj4+Pj4+IMKgwqDCoMKgwqDCoCBkY2MtPm1heF9kaXNjYXJkX3JlcXVlc3QgPSBE
RUZfTUFYX0RJU0NBUkRfUkVRVUVTVDsKPj4+Pj4gwqDCoMKgwqDCoMKgIGRjYy0+bWluX2Rpc2Nh
cmRfaXNzdWVfdGltZSA9IERFRl9NSU5fRElTQ0FSRF9JU1NVRV9USU1FOwo+Pj4+PiDCoMKgwqDC
oMKgwqAgZGNjLT5taWRfZGlzY2FyZF9pc3N1ZV90aW1lID0gREVGX01JRF9ESVNDQVJEX0lTU1VF
X1RJTUU7Cj4+Pj4+IC0tIAo+Pj4+PiAyLjQwLjEKPj4+Pj4KPj4+Pj4KPj4+Pj4KPj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX2lzc3VlX2Rpc2NhcmQoc2JpLCBlbnRy
eS0+c3RhcnRfYmxrYWRkciArIGN1cl9wb3MsCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
