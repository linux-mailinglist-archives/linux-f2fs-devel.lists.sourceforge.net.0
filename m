Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A803B537A53
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 May 2022 14:03:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nve7E-0000Oz-DT; Mon, 30 May 2022 12:03:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nve7D-0000OU-Fx
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 May 2022 12:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CLHLz1MqeqGwnTrxb6P2j10LtDmmF7WdO/W+fA2tJU8=; b=gdakcpDZfm0Nb3Gzi5x3dKQcnl
 Dm2eGEkFg6CSrVgRqRX24kKmfRHTxr9AViBKXMgW6+V/VxLf3JnSh/siZvwtQTW08q6xujLiNUoK7
 grFj3doA9sPUX7tGq/sQofW/Vb3xP+btBniqQCO/43KOQNTUdWeeRkLRV+ATvwHSiPVk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CLHLz1MqeqGwnTrxb6P2j10LtDmmF7WdO/W+fA2tJU8=; b=JXCmJ4i1WfAyEF52b6uc5llmwf
 QwHfptsCo1XiCEjfehhDlvP5Eo2dHT/HGU+gYojXgWB41yYlpcQGTe+KNKC4fDYNFeSY6I8g6oL5z
 fbOr3064gPxcvWwoCxfGgikZnCEbiqadwNadBiqJiLkBkTjLDgzrfCpGlRg0I4xR09JE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nve77-002R5r-Ed
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 May 2022 12:03:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id AD9CCCE0E58;
 Mon, 30 May 2022 12:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1ABC385B8;
 Mon, 30 May 2022 12:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653912181;
 bh=Ck54rYTg6fSzO8+V9ORBk3Ty7RBH2pzWvJO9ntQg9VI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=eP1x+zQknJ/5R3+BRa3/Olwuh5cEg8UlB0Q/qAdHygclF3+v09AAJcsshvrS5vlFy
 8TTsR16sbRwhnH0QRB3NrxO4GvxoWHAgS3LkRZMPzwEKiuxFEzpL2SzUhfqHD7qs1L
 iJvqkqG6NNGS3ZMHZNjx1VrG/Gak+wHmLoUMxCzKb1ldMVkycJXYIwbLl6/mQeREYN
 sPCLA6ZLwYBV9MG73cwjNWGcpfFdEhCdXk4tjvKcDbeOzbEH/DaHBRMQnYjyNjsiUX
 6VGTUpoPsNueTfAXtrFrt73v0LQ6Zj+CQ77Des77zZKFivUTUqyS1cjBsS4TDjLC57
 gJyRNcffKRwCA==
Message-ID: <b9047826-d171-69f9-7c97-c9fc71a4d218@kernel.org>
Date: Mon, 30 May 2022 20:02:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Jack Qiu <jack.qiu@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20220528093503.2608388-1-jack.qiu@huawei.com>
 <fe8f163b-5ba9-f361-8e6f-5af007564420@kernel.org>
 <b5b3ecce-d4d9-eeff-cdbb-3441885cf538@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <b5b3ecce-d4d9-eeff-cdbb-3441885cf538@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/30 9:02, Jack Qiu wrote: > On 2022/5/29 14:58, Chao
 Yu wrote: >> On 2022/5/28 17:35, Jack Qiu via Linux-f2fs-devel wrote: >>>
 When find_lock_page return error, page in [i, page_len) will lea [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nve77-002R5r-Ed
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix page leak in redirty_blocks
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi81LzMwIDk6MDIsIEphY2sgUWl1IHdyb3RlOgo+IE9uIDIwMjIvNS8yOSAxNDo1OCwg
Q2hhbyBZdSB3cm90ZToKPj4gT24gMjAyMi81LzI4IDE3OjM1LCBKYWNrIFFpdSB2aWEgTGludXgt
ZjJmcy1kZXZlbCB3cm90ZToKPj4+IFdoZW4gZmluZF9sb2NrX3BhZ2UgcmV0dXJuIGVycm9yLCBw
YWdlIGluIFtpLCBwYWdlX2xlbikgd2lsbCBsZWFrLgo+Pgo+PiBJIGRvdWJ0IGl0IGlzIGltcG9z
c2libGUgdG8gZmFpbCBpbiBmaW5kX2xvY2tfcGFnZSBkdWUgdG8gb25lIGV4dHJhCj4+IHJlZmVy
ZW5jZSBjb3VudCB3YXMgYWRkZWQgaW4gcHJldmlvdXMgcmVhZF9jYWNoZV9wYWdlKCkuCj4gCj4g
VGhhbmtzIGZvciByZXZpZXcuCj4gSSdtIG5vdCBzdXJlIGFib3V0IGl0IHdpdGggbGltaXRlZCBr
bm93bGVkZ2UuCgpJIGd1ZXNzIHNvbWV0aGluZyBsaWtlIHRob3NlIHBhZ2VzIHdlcmUgcGlubmVk
IGJ5IGFkZGluZyBleHRyYQpyZWZlcmVuY2UsIGFuZCBmaW5kX2xvY2tfcGFnZSgpIHNob3VsZCBu
ZXZlciBtaXNzIHRoZW0uLi4KCiA+IElmIGl0IGlzIHRydWUsIG1heWJlIHVzZSBmMmZzX2J1Z19v
bihzYmksICFwYWdlKSBpcyBiZXR0ZXI/CgpJIHRoaW5rIHNvLgoKVGhhbmtzLAoKPiAKPj4KPj4g
VGhhbmtzLAo+Pgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEphY2sgUWl1IDxqYWNrLnFpdUBodWF3
ZWkuY29tPgo+Pj4gLS0tCj4+PiAgwqAgZnMvZjJmcy9maWxlLmMgfCAxMyArKysrKysrKysrKysr
Cj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4gaW5kZXggMTAwNjM3YjFh
ZGIzLi4wZTg5MzhjNTkxOGUgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+Pj4gKysr
IGIvZnMvZjJmcy9maWxlLmMKPj4+IEBAIC0zOTU0LDYgKzM5NTQsMTIgQEAgc3RhdGljIGludCBy
ZWRpcnR5X2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBwZ29mZl90IHBhZ2VfaWR4LCBpbnQg
bGVuKQo+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IHBhZ2UgKnBhZ2U7Cj4+PiAgwqDCoMKgwqDCoCBw
Z29mZl90IHJlZGlydHlfaWR4ID0gcGFnZV9pZHg7Cj4+PiAgwqDCoMKgwqDCoCBpbnQgaSwgcGFn
ZV9sZW4gPSAwLCByZXQgPSAwOwo+Pj4gK8KgwqDCoCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzOwo+Pj4g
Kwo+Pj4gK8KgwqDCoCBwYWdlcyA9IGYyZnNfa3Z6YWxsb2MoRjJGU19JX1NCKGlub2RlKSwKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZW9mKHN0cnVjdCBwYWdlICopICog
bGVuLCBHRlBfTk9GUyk7Cj4+PiArwqDCoMKgIGlmICghcGFnZXMpCj4+PiArwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIC1FTk9NRU07Cj4+Pgo+Pj4gIMKgwqDCoMKgwqAgcGFnZV9jYWNoZV9yYV91bmJv
dW5kZWQoJnJhY3RsLCBsZW4sIDApOwo+Pj4KPj4+IEBAIC0zOTY0LDYgKzM5NzAsNyBAQCBzdGF0
aWMgaW50IHJlZGlydHlfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHBnb2ZmX3QgcGFnZV9p
ZHgsIGludCBsZW4pCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgcGFnZV9sZW4rKzsK
Pj4+ICvCoMKgwqDCoMKgwqDCoCBwYWdlc1tpXSA9IHBhZ2U7Cj4+PiAgwqDCoMKgwqDCoCB9Cj4+
Pgo+Pj4gIMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IHBhZ2VfbGVuOyBpKyssIHJlZGlydHlf
aWR4KyspIHsKPj4+IEBAIC0zOTc1LDggKzM5ODIsMTQgQEAgc3RhdGljIGludCByZWRpcnR5X2Js
b2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBwZ29mZl90IHBhZ2VfaWR4LCBpbnQgbGVuKQo+Pj4g
IMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfcGFnZV9kaXJ0eShwYWdlKTsKPj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqAgZjJmc19wdXRfcGFnZShwYWdlLCAxKTsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAg
ZjJmc19wdXRfcGFnZShwYWdlLCAwKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBwYWdlc1tpXSA9IE5V
TEw7Cj4+PiAgwqDCoMKgwqDCoCB9Cj4+Pgo+Pj4gK8KgwqDCoCAvKiBwdXQgcGFnZXNbaSwgcGFn
ZV9sZW4pIHdoZW4gZXJyb3IgaGFwcGVucyAqLwo+Pj4gK8KgwqDCoCBmb3IgKDsgcmV0IDwgMCAm
JiBpIDwgcGFnZV9sZW47IGkrKykKPj4+ICvCoMKgwqDCoMKgwqDCoCBmMmZzX3B1dF9wYWdlKHBh
Z2VzW2ldLCAwKTsKPj4+ICvCoMKgwqAga3ZmcmVlKHBhZ2VzKTsKPj4+ICsKPj4+ICDCoMKgwqDC
oMKgIHJldHVybiByZXQ7Cj4+PiAgwqAgfQo+Pj4KPj4+IC0tIAo+Pj4gMi4zMS4xCj4+Pgo+Pj4K
Pj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
