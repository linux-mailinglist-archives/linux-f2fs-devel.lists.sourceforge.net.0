Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B291F953F2C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2024 03:56:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1semCq-0003qX-44;
	Fri, 16 Aug 2024 01:56:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1semCo-0003qR-T5
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Aug 2024 01:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u2bM0cUIKVeOIyqClZJbyu+G796CPJouut+35KoTLX0=; b=c4c6wg/9YlxeKDFvdMSTyuuTfk
 79wXX8nTk236CeWj9NZljnMng/6qN5IWLMPhWat9BUApda/5RbWfNGyVAyN5OJCDi26SY19bCq4/k
 aI3Fo1Hh7cgaMrUfTyWZfSEBpZA5BraXrlqrgtfT30eZZNBBdbVcS3MDnSkVdDESbONM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u2bM0cUIKVeOIyqClZJbyu+G796CPJouut+35KoTLX0=; b=khbzhdj3JB1pZBsvVRFRb5FNa0
 a164UPqxmNnlslbyjnt+GEHlyUeR87N50vexypnxPgLR77pRkxg3FSMXKfqRfnleIIWKyJ/3W9usr
 ztmTyGaZgz1qyedJ3MCrxaDugpa3ZMMVDpA6mTrn13PMV3nBBtdilalhEAgUsbN4mAzY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1semCn-0006qY-HJ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Aug 2024 01:56:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2587362087;
 Fri, 16 Aug 2024 01:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0B5C32786;
 Fri, 16 Aug 2024 01:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723773390;
 bh=dZIWTkbqG9CE4eee0cwu5JPhJzQVRrcUFkrIXFMHhXg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YdflQGqHWKcmAxnISCI3IZxHAaluNUWQVi9Pa/NDbz96xkysrjIaxluFMUc+nU4Bq
 mEQTkEocIsMART1ZnO63nEu5o/lBGlzk9n698E+jYviO8ToHKG6Ehe1oo5GbYJDDKN
 ZyHJC80kpP4/hzalSLjmxqw5vAEdKSvkNMM5Wyxvmr2EPKnRdOtMCYzuhi96u1ha0u
 D9eOEcTai6pvy8kovOoOj3IzZMOkzqxu82ZMBc7jP/Fw4sphxfx4JyjxmlyZbaI+P/
 uxV9l+f3pnOXwLVhfWJ3YCDO0/deU/EcSH6Zz3eYwOOQ2mCFCyAp/QI7FNxBdbbr+F
 vRJK0FCNJlmKg==
Message-ID: <5b892d6a-620d-47f4-b870-214dcf4bc480@kernel.org>
Date: Fri, 16 Aug 2024 09:56:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: daejun7.park@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <7860b050-3948-4e23-b40f-a3df522477cd@kernel.org>
 <20240801074715epcms2p788934486cd0e8090f67ed0d7cffbc91b@epcms2p7>
 <CGME20240801074715epcms2p788934486cd0e8090f67ed0d7cffbc91b@epcms2p3>
 <20240816001700epcms2p37f406e9cd3a1d6438a866e7a7a3d5c31@epcms2p3>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240816001700epcms2p37f406e9cd3a1d6438a866e7a7a3d5c31@epcms2p3>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/16 8:17, Daejun Park wrote: > Hi Chao Yu, >> >>
 --------- Original Message --------- >> Sender : Chao Yu <chao@kernel.org>
 >> Date : 2024-08-14 18:50 (GMT+9) >> Title : Re: [PATCH] f2fs: avo [...]
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1semCn-0006qY-HJ
Subject: Re: [f2fs-dev] (2) [PATCH] f2fs: avoid unused block when dio write
 in LFS mode
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
Cc: Nayeon Kim <nayeoni.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Jeuk Kim <jeuk20.kim@samsung.com>,
 Dongjin Kim <dongjin_.kim@samsung.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC84LzE2IDg6MTcsIERhZWp1biBQYXJrIHdyb3RlOgo+IEhpIENoYW8gWXUsCj4+ICAg
Cj4+IC0tLS0tLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tLS0tLQo+PiBTZW5kZXIgOiBDaGFv
IFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+IERhdGUgOiAyMDI0LTA4LTE0IDE4OjUwIChHTVQrOSkK
Pj4gVGl0bGUgOiBSZTogW1BBVENIXSBmMmZzOiBhdm9pZCB1bnVzZWQgYmxvY2sgd2hlbiBkaW8g
d3JpdGUgaW4gTEZTIG1vZGUKPj4gICAKPj4gT24gMjAyNC84LzEgMTU6NDcsIERhZWp1biBQYXJr
IHdyb3RlOgo+Pj4gVGhpcyBwYXRjaCBhZGRyZXNzZXMgdGhlIHByb2JsZW0gdGhhdCB3aGVuIHVz
aW5nIExGUyBtb2RlLCB1bnVzZWQgYmxvY2tzCj4+PiBtYXkgb2NjdXIgaW4gZjJmc19tYXBfYmxv
Y2tzKCkgZHVyaW5nIGJsb2NrIGFsbG9jYXRpb24gZm9yIGRpbyB3cml0ZXMuCj4+Pgo+Pj4gSWYg
YSBuZXcgc2VjdGlvbiBpcyBhbGxvY2F0ZWQgZHVyaW5nIGJsb2NrIGFsbG9jYXRpb24sIGl0IHdp
bGwgbm90IGJlCj4+PiBpbmNsdWRlZCBpbiB0aGUgbWFwIHN0cnVjdCBieSBtYXBfaXNfbWVyZ2Vh
YmxlKCkgaWYgdGhlIExCQSBvZiB0aGUKPj4KPj4gSSBkaWRuJ3QgZ2V0IGl0LCB3aHkgYmVsb3cg
Y29uZGl0aW9uIGluIG1hcF9pc19tZXJnZWFibGUoKSBjYW4gbm90IGNhdGNoIHRoaXMKPj4gY2Fz
ZT8gQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbiBtb3JlPwo+Pgo+PiAgwqAgwqAgwqAgwqBpZiAobWFw
LT5tX3BibGsgIT0gTkVXX0FERFIgJiYgYmxrYWRkciA9PSAobWFwLT5tX3BibGsgKyBvZnMpKQo+
PiAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gdHJ1ZTsKPj4KPiAKPiBUaGFuayB5b3Ug
Zm9yIHlvdXIgcmV2aWV3Lgo+IG1hcF9pc19tZXJnZWFibGUoKSByZXR1cm5zIHRydWUgd2hlbiB0
aGUgbGFzdCBibG9jayBpbiB0aGUgc2VjdGlvbiBpcyBtZXJnZWQuCj4gVGhlIHByb2JsZW0gaXMg
dGhlIG5leHQgYmxvY2sgYWxsb2NhdGlvbiwgd2hpY2ggaGFwcGVucyBjb25zZWN1dGl2ZWx5Lgo+
IFNpbmNlIGl0IHdpbGwgYmUgYWxsb2NhdGVkIGEgbmV3IHNlY3Rpb24sIGl0cyBibG9jayB3aWxs
IGJlIHRoZSBmaXJzdAo+IGJsb2NrIGluIHRoZSBzZWN0aW9uLgo+IElmIHRoZSBuZXdseSBhbGxv
Y2F0ZWQgc2VjdGlvbiBpcyBub3QgY29udGlndW91cyB3aXRoIHRoZSBwcmV2aW91cyBzZWN0aW9u
LAo+IG1hcF9pc19tZXJnZWFibGUoKSB3aWxsIHJldHVybiBmYWxzZS4KPiBTbyB0aGUgYmxvY2sg
aXMgYWxsb2NhdGVkIGJ1dCB1bnVzZWQuCj4gSG93ZXZlciwgaXQgaXMgbm90IGZyZWVkLCBzbyB0
aGUgYmxvY2sgaXMgdW51c2FibGUuCj4gSWYgbXkgZXhwbGFuYXRpb24gd2FzIG5vdCBjbGVhciBl
bm91Z2gsIHBsZWFzZSBmZWVsIGZyZWUgdG8gYXNrIHF1ZXN0aW9ucy4KCkl0J3MgY2xlYXIgdG8g
bWUgbm93LCB0aGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24uCgo+IAo+IFRoYW5rcwo+IERhZWp1
bgo+IAo+PiBUaGFua3MsCj4+Cj4+PiBhbGxvY2F0ZWQgYmxvY2sgaXMgbm90IGNvbnRpZ3VvdXMu
IEhvd2V2ZXIsIHRoZSBibG9jayBhbHJlYWR5IGFsbG9jYXRlZAo+Pj4gaW4gdGhpcyBwcm9jZXNz
IHdpbGwgcmVtYWluIHVudXNlZCBkdWUgdG8gdGhlIExGUyBtb2RlLgo+Pj4KPj4+IFRoaXMgcGF0
Y2ggYXZvaWRzIHRoZSBwb3NzaWJpbGl0eSBvZiB1bnVzZWQgYmxvY2tzIGJ5IGVzY2FwaW5nCj4+
PiBmMmZzX21hcF9ibG9ja3MoKSB3aGVuIGFsbG9jYXRpbmcgdGhlIGxhc3QgYmxvY2sgaW4gYSBz
ZWN0aW9uLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IERhZWp1biBQYXJrIDxkYWVqdW43LnBhcmtA
c2Ftc3VuZy5jb20+Cj4+PiAtLS0KPj4+ICDCoCBmcy9mMmZzL2RhdGEuYyAxMyArKysrKysrKysr
KysrCj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4gaW5kZXggYjZkY2Iz
YmNhZWY3Li5iMjdhM2Y0NDhmMzIgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4g
KysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+IEBAIC0xNzExLDYgKzE3MTEsMTkgQEAgaW50IGYyZnNf
bWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzICpt
YXAsIGludCBmbGFnKQo+Pj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG4ub2ZzX2lu
X25vZGUgPSBlbmRfb2Zmc2V0Owo+Pj4gIMKgIMKgIMKgIMKgIMKgIMKgfQo+Pj4gICAKPj4+ICsg
wqAgwqAgwqAgwqBpZiAoZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19ESU8gJiYgZjJmc19sZnNfbW9k
ZShzYmkpKSB7CgpUaGUgY29uZGl0aW9uIHNob3VsZCBjaGVjayBtYXAtPm1fbWF5X2NyZWF0ZSBh
cyB3ZWxsLCBvdGhlcndpc2UgZjJmc19tYXBfYmxvY2tzKCkKZnJvbSByZWFkIHBhdGggd2lsbCBi
cmVhayBoZXJlPwoKPj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnQgc2Vnbm8gPSBHRVRf
U0VHTk8oc2JpLCBibGthZGRyKTsKPj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBib29sIGxh
c3Rfc2VnLCBsYXN0X2JsazsKPj4+ICsKPj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYXN0
X3NlZyA9ICEoKHNlZ25vICsgMSkgJSBTRUdTX1BFUl9TRUMoc2JpKSk7CgpTaG91bGQgY29uc2lk
ZXIgdGhlIGNhc2UgdGhhdCBzZWdubyAjKFNFR1NfUEVSX1NFQyAtIDEpIGlzIG5vdCB2YWxpZD8K
ZS5nLiBTRUdTX1BFUl9TRUMgaXMgNCwgQ0FQX1NFR1NfUEVSX1NFQyBpcyAyPwoKPj4+ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBsYXN0X2JsayA9IChmMmZzX3VzYWJsZV9ibGtzX2luX3NlZyhz
YmksIHNlZ25vKSAtIDEpID09Cj4+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgR0VUX0JMS09GRl9GUk9NX1NFRzAoc2JpLCBibGthZGRyKTsKCmlmIChH
RVRfU0VHT0ZGX0ZST01fU0VHMCgpICUgQkxLU19QRVJfU0VDKCkgPT0gQ0FQX0JMS1NfUEVSX1NF
QygpIC0gMSkKCWdvdG8gc3luY19vdXQ7CgpUaGFua3MsCgo+Pj4gKwo+Pj4gKyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoC8qIExCQSBvZiB0aGUgbmV4dCBibG9jayB0byBiZSBhbGxvY2F0ZWQgbWF5
IG5vdCBiZSBjb250aWd1b3VzLiAqLwo+Pj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChs
YXN0X3NlZyAmJiBsYXN0X2JsaykKPj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBnb3RvIHN5bmNfb3V0Owo+Pj4gKyDCoCDCoCDCoCDCoH0KPj4+ICsKPj4+ICDCoCDCoCDC
oCDCoCDCoCDCoGlmIChwZ29mcyA+PSBlbmQpCj4+PiAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBnb3RvIHN5bmNfb3V0Owo+Pj4gIMKgIMKgIMKgIMKgIMKgIMKgZWxzZSBpZiAoZG4ub2Zz
X2luX25vZGUgPCBlbmRfb2Zmc2V0KQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
