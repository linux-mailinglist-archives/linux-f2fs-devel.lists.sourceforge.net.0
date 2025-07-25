Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D998CB1168B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Jul 2025 04:37:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZyagCDBxNijhbaBceGSpg2mje7HwARgxZ2G7WhA9YM=; b=FtyD1fOccicN8VK1jrpevoybU+
	9DJuXpBdhvzOkIkqXizGVrkT5nek1WM5Sl9400XLI+gb8jbIg2vbiaWt6ea65hfuDOhgtD+R7+uME
	R1oJ5oGOE7yfwLZ74yY2AG2U6Qhsnh+Onp17Wt5dTA3Jb9RWS8qBrffFIISmcav3eNsw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uf8Jl-00036U-5t;
	Fri, 25 Jul 2025 02:37:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uf8Jj-00036O-LH
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 02:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4aXOW1QsEkqPRj8B86gmnmz+yqXhphifEFv69ws3HSc=; b=FOkjeQJKsDaSSgd5tfJwGvr3qI
 B7q0TT44Ln38axsLodqDoDviSwpUj4s8Nc8sefqsZHIMvp5WM3HKlcPBEarQxEYLuwRrdqtJ44n6x
 xkL4l4ZHA4jQdjpuu1ZhCuLplEE8/KNTwsHz9lqR9Uvb0U4BWnZMRZM2Kv4OTpThf8og=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4aXOW1QsEkqPRj8B86gmnmz+yqXhphifEFv69ws3HSc=; b=hViNTe+KLVed9ffOe3Vtt8xvQ3
 dqQL+OfOnB4Ri14pTXie2Hx1Xv9vVmLEZhaJuSCmZ71TI/CF2UaYUcnm0OqOv4Vs7Dkaw5m5D36Bz
 RBttOBF5pmOTVlZylBYPV6fNeeJrFXu1u6Y+7DJTPXjibJYQ6XMrMedv6TIKz16rof3E=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uf8Jj-0002zg-3Z for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 02:37:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C48C241767;
 Fri, 25 Jul 2025 02:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94321C4CEED;
 Fri, 25 Jul 2025 02:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753411065;
 bh=0vVj/wZzFhK1dkR84ctADcX5X2AQkeUbOvVf78yV3ZA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=sFM2/LksFP/acUHo6rJxC1x90GBFf2C2NxVf7CHOoHRiv7OuavkGMD6r2QQ9i2Dlz
 GjWY+Rk21PtHuF0SJiO2mZde1rsb9l4NBe+9mDykpM7mfxLL058kU9uZld2sr4QSz4
 gpWhZLpZ07yXCdFMazuOf0Rrt3yJsCOR9snXDuqHbBvlOO5yx4Q3LGxcZO8xh/FAMW
 ATs9VFIjjX732mbVw0gUC/7cyZb5Gmp1AqjGkcunw0kK9hQdWM8ruk18WdS4I9uFaO
 zxPG2jOmSejCam5FYnaFUyOTvLuVATqFZfuO9ulW0V+q/KDc14tTbCfBI8weI45un/
 lWYcpDWDcYs5Q==
Message-ID: <1d03de75-26c4-4a58-af46-dafb319bed89@kernel.org>
Date: Fri, 25 Jul 2025 10:37:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: hanqi <hanqi@vivo.com>, Jens Axboe <axboe@kernel.dk>, jaegeuk@kernel.org
References: <20250715031054.14404-1-hanqi@vivo.com>
 <056e083b-8e41-45a2-9b0f-2ec47d1a9f71@kernel.dk>
 <f7408161-eaef-47ed-8810-8c4e8f27bfc6@vivo.com>
 <51168786-6c30-4065-be82-6d07b2ae74a8@kernel.dk>
 <4366bf0f-64a1-44ae-8f81-301af2d179d8@vivo.com>
 <d5355d7d-4e93-4741-9ef7-c7407d600ec0@kernel.org>
 <06b9d287-816c-4347-945b-8fda83a6f557@vivo.com>
Content-Language: en-US
In-Reply-To: <06b9d287-816c-4347-945b-8fda83a6f557@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 7/25/2025 9:44 AM, hanqi wrote: > > > 在 2025/7/24 21:09,
    Chao Yu 写道: >> On 2025/7/16 16:27, hanqi wrote: >>> >>> >>> 在 2025/7/16
    11:43, Jens Axboe 写道: >>>> On 7/15/25 9:34 PM, hanqi wro [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uf8Jj-0002zg-3Z
Subject: Re: [f2fs-dev] [PATCH] f2fs: f2fs supports uncached buffered I/O
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNy8yNS8yMDI1IDk6NDQgQU0sIGhhbnFpIHdyb3RlOgo+IAo+IAo+IOWcqCAyMDI1LzcvMjQg
MjE6MDksIENoYW8gWXUg5YaZ6YGTOgo+PiBPbiAyMDI1LzcvMTYgMTY6MjcsIGhhbnFpIHdyb3Rl
Ogo+Pj4KPj4+Cj4+PiDlnKggMjAyNS83LzE2IDExOjQzLCBKZW5zIEF4Ym9lIOWGmemBkzoKPj4+
PiBPbiA3LzE1LzI1IDk6MzQgUE0sIGhhbnFpIHdyb3RlOgo+Pj4+Pgo+Pj4+PiA/IDIwMjUvNy8x
NSAyMjoyOCwgSmVucyBBeGJvZSA/PzoKPj4+Pj4+IE9uIDcvMTQvMjUgOToxMCBQTSwgUWkgSGFu
IHdyb3RlOgo+Pj4+Pj4+IEplbnMgaGFzIGFscmVhZHkgY29tcGxldGVkIHRoZSBkZXZlbG9wbWVu
dCBvZiB1bmNhY2hlZCBidWZmZXJlZCBJL08KPj4+Pj4+PiBpbiBnaXQgWzFdLCBhbmQgaW4gZjJm
cywgdGhlIGZlYXR1cmUgY2FuIGJlIGVuYWJsZWQgc2ltcGx5IGJ5Cj4+Pj4+Pj4gc2V0dGluZwo+
Pj4+Pj4+IHRoZSBGT1BfRE9OVENBQ0hFIGZsYWcgaW4gZjJmc19maWxlX29wZXJhdGlvbnMuCj4+
Pj4+PiBZb3UgbmVlZCB0byBlbnN1cmUgdGhhdCBmb3IgYW55IERPTlRDQUNIRSBJTyB0aGF0IHRo
ZSBjb21wbGV0aW9uIGlzCj4+Pj4+PiByb3V0ZWQgdmlhIG5vbi1pcnEgY29udGV4dCwgaWYgYXBw
bGljYWJsZS4gSSBkaWRuJ3QgdmVyaWZ5IHRoYXQKPj4+Pj4+IHRoaXMgaXMKPj4+Pj4+IHRoZSBj
YXNlIGZvciBmMmZzLiBHZW5lcmFsbHkgeW91IGNhbiBkZWR1Y2UgdGhpcyBhcyB3ZWxsIHRocm91
Z2gKPj4+Pj4+IHRlc3RpbmcsIEknZCBzYXkgdGhlIGZvbGxvd2luZyBjYXNlcyB3b3VsZCBiZSBp
bnRlcmVzdGluZyB0byB0ZXN0Ogo+Pj4+Pj4KPj4+Pj4+IDEpIE5vcm1hbCBET05UQ0FDSEUgYnVm
ZmVyZWQgcmVhZAo+Pj4+Pj4gMikgT3ZlcndyaXRlIERPTlRDQUNIRSBidWZmZXJlZCB3cml0ZQo+
Pj4+Pj4gMykgQXBwZW5kIERPTlRDQUNIRSBidWZmZXJlZCB3cml0ZQo+Pj4+Pj4KPj4+Pj4+IFRl
c3QgdGhvc2Ugd2l0aCBERUJVR19BVE9NSUNfU0xFRVAgc2V0IGluIHlvdXIgY29uZmlnLCBhbmQg
aXQgdGhhdAo+Pj4+Pj4gZG9lc24ndCBjb21wbGFpbiwgdGhhdCdzIGEgZ3JlYXQgc3RhcnQuCj4+
Pj4+Pgo+Pj4+Pj4gRm9yIHRoZSBhYm92ZSB0ZXN0IGNhc2VzIGFzIHdlbGwsIHZlcmlmeSB0aGF0
IHBhZ2UgY2FjaGUgZG9lc24ndAo+Pj4+Pj4gZ3JvdyBhcwo+Pj4+Pj4gSU8gaXMgcGVyZm9ybWVk
LiBBIGJpdCBpcyBmaW5lIGZvciB0aGluZ3MgbGlrZSBtZXRhIGRhdGEsIGJ1dAo+Pj4+Pj4gZ2Vu
ZXJhbGx5Cj4+Pj4+PiB5b3Ugd2FudCB0byBzZWUgaXQgcmVtYWluIGJhc2ljYWxseSBmbGF0IGlu
IHRlcm1zIG9mIHBhZ2UgY2FjaGUKPj4+Pj4+IHVzYWdlLgo+Pj4+Pj4KPj4+Pj4+IE1heWJlIHRo
aXMgaXMgYWxsIGZpbmUsIGxpa2UgSSBzYWlkIEkgZGlkbid0IHZlcmlmeS4gSnVzdAo+Pj4+Pj4g
bWVudGlvbmluZyBpdAo+Pj4+Pj4gZm9yIGNvbXBsZXRlbmVzcyBzYWtlLgo+Pj4+PiBIaSwgSmVu
cwo+Pj4+PiBUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4gQXMgSSBtZW50aW9uZWQgZWFybGll
ciBpbiBbMV0sIGluIGYyZnMsCj4+Pj4+IHRoZSByZWd1bGFyIGJ1ZmZlcmVkIHdyaXRlIHBhdGgg
aW52b2tlcyBmb2xpb19lbmRfd3JpdGViYWNrIGZyb20gYQo+Pj4+PiBzb2Z0aXJxIGNvbnRleHQu
IFRoZXJlZm9yZSwgaXQgc2VlbXMgdGhhdCBmMmZzIG1heSBub3QgYmUgc3VpdGFibGUKPj4+Pj4g
Zm9yIERPTlRDQUNIRSBJL08gd3JpdGVzLgo+Pj4+Pgo+Pj4+PiBJP2QgbGlrZSB0byBhc2sgYSBx
dWVzdGlvbjogd2h5IGlzIERPTlRDQUNIRSBJL08gd3JpdGUgcmVzdHJpY3RlZCB0bwo+Pj4+PiBu
b24taW50ZXJydXB0IGNvbnRleHQgb25seT8gSXMgaXQgYmVjYXVzZSBkcm9wcGluZyB0aGUgcGFn
ZSBtaWdodCBiZQo+Pj4+PiB0b28gdGltZS1jb25zdW1pbmcgdG8gYmUgZG9uZSBzYWZlbHkgaW4g
aW50ZXJydXB0IGNvbnRleHQ/IFRoaXMgbWlnaHQKPj4+Pj4gYmUgYSBuYWl2ZSBxdWVzdGlvbiwg
YnV0IEk/ZCByZWFsbHkgYXBwcmVjaWF0ZSB5b3VyIGNsYXJpZmljYXRpb24uCj4+Pj4+IFRoYW5r
cyBpbiBhZHZhbmNlLgo+Pj4+IEJlY2F1c2UgKGFzIG9mIHJpZ2h0IG5vdywgYXQgbGVhc3QpIHRo
ZSBjb2RlIGRvaW5nIHRoZSBpbnZhbGlkYXRpb24KPj4+PiBuZWVkcyBwcm9jZXNzIGNvbnRleHQu
IFRoZXJlIGFyZSB2YXJpb3VzIHJlYXNvbnMgZm9yIHRoaXMsIHdoaWNoIHlvdSdsbAo+Pj4+IHNl
ZSBpZiB5b3UgZm9sbG93IHRoZSBwYXRoIG9mZiBmb2xpb19lbmRfd3JpdGViYWNrKCkgLT4KPj4+
PiBmaWxlbWFwX2VuZF9kcm9wYmVoaW5kX3dyaXRlKCkgLT4gZmlsZW1hcF9lbmRfZHJvcGJlaGlu
ZCgpIC0+Cj4+Pj4gZm9saW9fdW5tYXBfaW52YWxpZGF0ZSgpLiB1bm1hcF9tYXBwaW5nX2ZvbGlv
KCkgaXMgb25lIGNhc2UsIGFuZCB3aGlsZQo+Pj4+IHRoYXQgbWF5IGJlIGRvYWJsZSwgdGhlIGlu
b2RlIGlfbG9jayBpcyBub3QgSVJRIHNhZmUuCj4+Pj4KPj4+PiBNb3N0IGZpbGUgc3lzdGVtcyBo
YXZlIGEgbmVlZCB0byBwdW50IHNvbWUgd3JpdGViYWNrIGNvbXBsZXRpb25zIHRvCj4+Pj4gbm9u
LWlycSBjb250ZXh0LCBlZyBmb3IgZmlsZSBleHRlbmRpbmcgZXRjLiBIZW5jZSBmb3IgbW9zdCBm
aWxlCj4+Pj4gc3lzdGVtcywKPj4+PiB0aGUgZG9udGNhY2hlIGNhc2UganVzdCBiZWNvbWVzIGFu
b3RoZXIgY2FzZSB0aGF0IG5lZWRzIHRvIGdvIHRocm91Z2gKPj4+PiB0aGF0IHBhdGguCj4+Pj4K
Pj4+PiBJdCdkIGNlcnRhaW5seSBiZSBwb3NzaWJsZSB0byBpbXByb3ZlIHVwb24gdGhpcywgZm9y
IGV4YW1wbGUgYnkgaGF2aW5nCj4+Pj4gYW4gb3Bwb3J0dW5pc3RpYyBkb250Y2FjaGUgdW5tYXAg
ZnJvbSBJUlEvc29mdC1pcnEgY29udGV4dCwgYW5kIHRoZW4KPj4+PiBwdW50aW5nIHRvIGEgd29y
a3F1ZXVlIGlmIHRoYXQgZG9lc24ndCBwYW4gb3V0LiBCdXQgdGhpcyBkb2Vzbid0IGV4aXN0Cj4+
Pj4gYXMgb2YgeWV0LCBoZW5jZSB0aGUgbmVlZCBmb3IgdGhlIHdvcmtxdWV1ZSBwdW50Lgo+Pgo+
PiBUaGFua3MgSmVucyBmb3IgdGhlIGRldGFpbGVkIGV4cGxhbmF0aW9uLgo+Pgo+Pj4KPj4+IEhp
LCBKZW5zCj4+PiBUaGFuayB5b3UgZm9yIHlvdXIgcmVzcG9uc2UuIEkgdGVzdGVkIHVuY2FjaGVk
IGJ1ZmZlciBJL08gcmVhZHMgd2l0aAo+Pj4gYSA1MEdCIGRhdGFzZXQgb24gYSBsb2NhbCBGMkZT
IGZpbGVzeXN0ZW0sIGFuZCB0aGUgcGFnZSBjYWNoZSBzaXplCj4+PiBvbmx5IGluY3JlYXNlZCBz
bGlnaHRseSwgd2hpY2ggSSBiZWxpZXZlIGFsaWducyB3aXRoIGV4cGVjdGF0aW9ucy4KPj4+IEFm
dGVyIGNsZWFyaW5nIHRoZSBwYWdlIGNhY2hlLCB0aGUgcGFnZSBjYWNoZSBzaXplIHJldHVybmVk
IHRvIGl0cwo+Pj4gaW5pdGlhbCBzdGF0ZS4gVGhlIHRlc3QgcmVzdWx0cyBhcmUgYXMgZm9sbG93
czoKPj4+Cj4+PiBzdGF0IDUwRy50eHQKPj4+ICDCoCDCoCBGaWxlOiA1MEcudHh0Cj4+PiAgwqAg
wqAgU2l6ZTogNTM2ODcwOTEyMDDCoMKgwqDCoMKgIEJsb2NrczogMTA0OTYwNzEywqDCoMKgwqDC
oMKgIElPIEJsb2NrczogNTEyCj4+PiByZWd1bGFyIGZpbGUKPj4+Cj4+PiBbcmVhZCBiZWZvcmVd
Ogo+Pj4gZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzCj4+PiAwMTo0ODoxN8KgwqDC
oMKgwqDCoMKgIGtibWVtZnJlZcKga2JhdmFpbMKgwqDCoMKgIGtibWVtdXNlZMKgICVtZW11c2Vk
Cj4+PiBrYmJ1ZmZlcnPCoGtiY2FjaGVkwqDCoCBrYmNvbW1pdMKgwqDCoMKgICVjb21taXTCoMKg
IGtiYWN0aXZlIGtiaW5hY3TCoMKgwqDCoCBrYmRpcnR5Cj4+PiAwMTo1MDo1OcKgwqDCoMKgwqAg
NjQwNDY0OMKgwqAgODE0OTUwOMKgwqAgMjcxOTM4NMKgwqAgMjMuNDDCoMKgwqDCoMKgNTEyIDE4
OTgwOTIKPj4+IDE5OTM4NDc2MMKgwqDCoCA4MjMuNzXCoMKgIDE4NDY3NTbCoMKgwqAgNDY2ODMy
wqDCoMKgwqDCoDQ0Cj4+Pgo+Pj4gLi91bmNhY2hlZF9pb190ZXN0IDgxOTIgMSAxIDUwRy50eHQK
Pj4+IFN0YXJ0aW5nIDEgdGhyZWFkcwo+Pj4gcmVhZGluZyBicyA4MTkyLCB1bmNhY2hlZCAxCj4+
PiAgwqAgwqAgMXM6IDc1NE1CL3NlYywgTUI9NzU0Cj4+PiAgwqAgwqAgLi4uCj4+PiAgwqAgwqA2
NHM6IDg0NE1CL3NlYywgTUI9MjYyMTQ0Cj4+Pgo+Pj4gW3JlYWQgYWZ0ZXJdOgo+Pj4gMDE6NTI6
MzPCoMKgwqDCoMKgIDYzMjY2NjTCoMKgIDgxMjEyNDDCoMKgIDI3NDc5NjjCoMKgwqAgMjMuNjXC
oMKgwqDCoMKgIDcyOCAxOTQ3NjU2Cj4+PiAxOTkzODQ3ODjCoMKgwqAgODIzLjc1wqDCoCAxODg3
ODk2wqDCoMKgIDUwMjAwNMKgwqDCoMKgwqA2OAo+Pj4gZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ry
b3BfY2FjaGVzCj4+PiAwMTo1MzoxMcKgwqDCoMKgwqAgNjM1MTEzNsKgwqAgODA5NjkzNsKgwqAg
Mjc3MjQwMMKgwqAgMjMuODbCoMKgwqDCoMKgNTEyIDE5MDA1MDAKPj4+IDE5OTM4NTIxNsKgwqDC
oCA4MjMuNzXCoMKgIDE4NDcyNTLCoMKgwqAgNTMzNzY4wqDCoMKgwqDCoCAxMDQKPj4+Cj4+PiBI
aSBDaGFvLAo+Pj4gR2l2ZW4gdGhhdCBGMkZTIGN1cnJlbnRseSBjYWxscyBmb2xpb19lbmRfd3Jp
dGViYWNrIGluIHRoZSBzb2Z0aXJxCj4+PiBjb250ZXh0IGZvciBub3JtYWwgd3JpdGUgc2NlbmFy
aW9zLCBjb3VsZCB3ZSBmaXJzdCBzdXBwb3J0IHVuY2FjaGVkCj4+PiBidWZmZXIgSS9PIHJlYWRz
PyBGb3Igbm9ybWFsIHVuY2FjaGVkIGJ1ZmZlciBJL08gd3JpdGVzLCB3b3VsZCBpdCBiZQo+Pj4g
ZmVhc2libGUgZm9yIEYyRlMgdG8gaW50cm9kdWNlIGFuIGFzeW5jaHJvbm91cyB3b3JrcXVldWUg
dG8gaGFuZGxlIHRoZQo+Pj4gcGFnZSBkcm9wIG9wZXJhdGlvbiBpbiB0aGUgZnV0dXJlPyBXaGF0
IGFyZSB5b3VyIHRob3VnaHRzIG9uIHRoaXM/Cj4+Cj4+IFFpLAo+Pgo+PiBTb3JyeSBmb3IgdGhl
IGRlbGF5Lgo+Pgo+PiBJIHRoaW5rIGl0IHdpbGwgYmUgZ29vZCB0byBzdXBwb3J0IHVuY2FjaGVk
IGJ1ZmZlcmVkIEkvTyBpbiByZWFkIHBhdGgKPj4gZmlyc3QsIGFuZCB0aGVuIGxldCdzIHRha2Ug
YSBsb29rIHdoYXQgd2UgY2FuIGRvIGZvciB3cml0ZSBwYXRoLCBhbnl3YXksCj4+IGxldCdzIGRv
IHRoaXMgc3RlcCBieSBzdGVwLgo+Pgo+PiBDYW4geW91IHBsZWFzZSB1cGRhdGUgdGhlIHBhdGNo
Pwo+PiAtIHN1cHBvcnQgcmVhZCBwYXRoIG9ubHkKPj4gLSBpbmNsdWRlIHRlc3QgZGF0YSBpbiBj
b21taXQgbWVzc2FnZQo+IENoYW8KPiAKPiBJIHdpbGwgcmUtc3VibWl0IGEgcGF0Y2ggdG8gZmly
c3QgZW5hYmxlIEYyRlMgc3VwcG9ydCBmb3IgdW5jYWNoZWQKPiBidWZmZXIgSS9PIHJlYWRzLiBG
b2xsb3dpbmcgdGhhdCwgSSB3aWxsIHdvcmsgb24gaW1wbGVtZW50aW5nCj4gYXN5bmNocm9ub3Vz
IHBhZ2UgZHJvcHBpbmcgaW4gRjJGUy4KClFpLCBzdXJlLCBwbGVhc2UgZ28gYWhlYWQsIHRoYW5r
cyBmb3IgdGhlIHdvcmsuIDopCgpUaGFua3MsCgo+IAo+IFRoYW5rIHlvdSEKPj4KPj4+IFRoYW5r
IHlvdSEKPj4+Cj4+Pgo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
