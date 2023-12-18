Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A928169DE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Dec 2023 10:33:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFA0R-0004wF-1X;
	Mon, 18 Dec 2023 09:33:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1rFA0P-0004w9-GH
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 09:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9hO+OMQiyml93i1r89vC6c2cYabxC7l3iapV2ElYsAA=; b=d7O9v06MKNd8xIJdAIg+ycnPtY
 Ibx2DhIbn+2FdCliGhu03WjHXGUgXOZjoRGZizKHL5Drje0g52biA+4bV3YZnu85T3xNq4Z4d/0af
 MqmwMbmIgINpnOFFJEDyBXLbReoX+1GfgDszNtIFfar3FZAXFNsxfxrjN0FRe7o3q2jU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9hO+OMQiyml93i1r89vC6c2cYabxC7l3iapV2ElYsAA=; b=Eb1Zj6enj3UzLe042epoRmkWjf
 llm612zSrS9SmSzA75GEl+s/7/o1vsUSP7mzFmZV12eh8uVkK3Uoi6sTg/Lgv+e+jYu8Ru1SQCQos
 eForqSjXlNbMXUUDCpB3sjHl8WLdNRsyw4HwrSoH+pJMzmT0Eib6kgZo20hk6oHz3KOg=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFA0O-0003ig-8q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 09:33:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A1A38CE0F7B;
 Mon, 18 Dec 2023 09:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C5DC433C7;
 Mon, 18 Dec 2023 09:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702892016;
 bh=xCrMPR/698dLE7PHRiGMnC3JzwZkeI7Ei5UdX6bBtCM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Bp/Jjjv+1tWyROtfJwL8AGcvFXDQKD/sJdR2PFp73c6V7l2cEIJKpqk3pJp2BPjXu
 moHv0yPKeSSofgJShwctlIcl5l/zbI3j5p4aWOnIy9AW83jipkSsXMJ5f9WrUyTQIF
 uCt/Iyrpf2hw26o3J6YUrFkT3RsdwqLblCkXAK6tbUDsdn8CJIjYs9pIXUc14pboxB
 w5xOOFVYTRT0z0NcUNYZoXRsVktXzXvEfLdgI1jEFOuBM2+Z+VjiCYgmjdUXmekLa2
 zj3LvcLMziNj1T57aZCGemPrnpORfSOYS1ZwRpoLYoljGh3zE555+rL+a4HyMj3O/e
 vDJ6NpYW+0n1w==
Message-ID: <5d315435-d41f-4cbe-98f6-4e0e2612763a@kernel.org>
Date: Mon, 18 Dec 2023 18:33:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>,
 "hch@lst.de" <hch@lst.de>, "axboe@kernel.dk" <axboe@kernel.dk>
References: <20231217165359.604246-1-hch@lst.de>
 <20231217165359.604246-4-hch@lst.de>
 <b4d33dc359495c6227a3f20285566eed27718a14.camel@mediatek.com>
 <190f58f7-2ed6-46f8-af59-5e167a0bddeb@kernel.org>
 <f19c41b9ea990e6da734b6c81caeebb73fb60b29.camel@mediatek.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <f19c41b9ea990e6da734b6c81caeebb73fb60b29.camel@mediatek.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 12/18/23 17:21, Ed Tsai (蔡宗軒) wrote: > On Mon, 2023-12-18
    at 15:53 +0900, Damien Le Moal wrote: >> On 2023/12/18 15:15, Ed Tsai (蔡宗軒)
    wrote: >>> Hi Christoph, >>> >>> some minor suggest [...] 
 
 Content analysis details:   (-2.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFA0O-0003ig-8q
Subject: Re: [f2fs-dev] [PATCH 3/5] block: remove support for the host aware
 zone model
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
Cc: "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMTgvMjMgMTc6MjEsIEVkIFRzYWkgKOiUoeWul+i7kikgd3JvdGU6Cj4gT24gTW9uLCAy
MDIzLTEyLTE4IGF0IDE1OjUzICswOTAwLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPj4gIE9uIDIw
MjMvMTIvMTggMTU6MTUsIEVkIFRzYWkgKOiUoeWul+i7kikgd3JvdGU6Cj4+PiBIaSBDaHJpc3Rv
cGgsCj4+Pgo+Pj4gc29tZSBtaW5vciBzdWdnZXN0aW9uczoKPj4+Cj4+PiBPbiBTdW4sIDIwMjMt
MTItMTcgYXQgMTc6NTMgKzAxMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+Pj4+Cj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWQvZG0tdGFibGUuYyBiL2RyaXZlcnMvbWQvZG0tdGFibGUu
Ywo+Pj4+IGluZGV4IDE5OGQzOGI1MzMyMmMxLi4yNjBiNWI4ZjJiMGQ3ZSAxMDA2NDQKPj4+PiAt
LS0gYS9kcml2ZXJzL21kL2RtLXRhYmxlLmMKPj4+PiArKysgYi9kcml2ZXJzL21kL2RtLXRhYmxl
LmMKPj4+PiBAQCAtMTU3OSwyMSArMTU3OSwxOCBAQCBib29sIGRtX3RhYmxlX2hhc19ub19kYXRh
X2RldmljZXMoc3RydWN0Cj4+Pj4gZG1fdGFibGUgKnQpCj4+Pj4gIHJldHVybiB0cnVlOwo+Pj4+
ICB9Cj4+Pj4gIAo+Pj4+IC1zdGF0aWMgaW50IGRldmljZV9ub3Rfem9uZWRfbW9kZWwoc3RydWN0
IGRtX3RhcmdldCAqdGksIHN0cnVjdAo+Pj4+IGRtX2RldiAqZGV2LAo+Pj4+IC0gIHNlY3Rvcl90
IHN0YXJ0LCBzZWN0b3JfdCBsZW4sIHZvaWQKPj4+PiAqZGF0YSkKPj4+PiArc3RhdGljIGludCBk
ZXZpY2Vfbm90X3pvbmVkKHN0cnVjdCBkbV90YXJnZXQgKnRpLCBzdHJ1Y3QgZG1fZGV2Cj4+Pj4g
KmRldiwKPj4+PiArICAgIHNlY3Rvcl90IHN0YXJ0LCBzZWN0b3JfdCBsZW4sIHZvaWQgKmRhdGEp
Cj4+Pj4gIHsKPj4+PiAtc3RydWN0IHJlcXVlc3RfcXVldWUgKnEgPSBiZGV2X2dldF9xdWV1ZShk
ZXYtPmJkZXYpOwo+Pj4+IC1lbnVtIGJsa196b25lZF9tb2RlbCAqem9uZWRfbW9kZWwgPSBkYXRh
Owo+Pj4+ICtib29sICp6b25lZCA9IGRhdGE7Cj4+Pj4gIAo+Pj4+IC1yZXR1cm4gYmxrX3F1ZXVl
X3pvbmVkX21vZGVsKHEpICE9ICp6b25lZF9tb2RlbDsKPj4+PiArcmV0dXJuIGJkZXZfaXNfem9u
ZWQoZGV2LT5iZGV2KSAhPSAqem9uZWQ7Cj4+Pj4gIH0KPj4+PiAgCj4+Pj4gIHN0YXRpYyBpbnQg
ZGV2aWNlX2lzX3pvbmVkX21vZGVsKHN0cnVjdCBkbV90YXJnZXQgKnRpLCBzdHJ1Y3QKPj4gZG1f
ZGV2Cj4+Pj4gKmRldiwKPj4+PiAgIHNlY3Rvcl90IHN0YXJ0LCBzZWN0b3JfdCBsZW4sIHZvaWQK
Pj4+PiAqZGF0YSkKPj4+Cj4+PiBTZWVtcyBsaWtlIHRoZSB3b3JkICJtb2RlbCIgc2hvdWxkIGFs
c28gYmUgcmVtb3ZlIGhlcmUuCj4+Pgo+Pj4+ICB7Cj4+Pj4gLXN0cnVjdCByZXF1ZXN0X3F1ZXVl
ICpxID0gYmRldl9nZXRfcXVldWUoZGV2LT5iZGV2KTsKPj4+PiAtCj4+Pj4gLXJldHVybiBibGtf
cXVldWVfem9uZWRfbW9kZWwocSkgIT0gQkxLX1pPTkVEX05PTkU7Cj4+Pj4gK3JldHVybiBiZGV2
X2lzX3pvbmVkKGRldi0+YmRldik7Cj4+Pj4gIH0KPj4+PiAgCj4+Pj4gIC8qCj4+Pj4gQEAgLTE2
MDMsOCArMTYwMCw3IEBAIHN0YXRpYyBpbnQgZGV2aWNlX2lzX3pvbmVkX21vZGVsKHN0cnVjdAo+
Pj4+IGRtX3RhcmdldCAqdGksIHN0cnVjdCBkbV9kZXYgKmRldiwKPj4+PiAgICogaGFzIHRoZSBE
TV9UQVJHRVRfTUlYRURfWk9ORURfTU9ERUwgZmVhdHVyZSBzZXQsIHRoZSBkZXZpY2VzCj4+IGNh
bgo+Pj4+IGhhdmUgYW55Cj4+Pj4gICAqIHpvbmVkIG1vZGVsIHdpdGggYWxsIHpvbmVkIGRldmlj
ZXMgaGF2aW5nIHRoZSBzYW1lIHpvbmUgc2l6ZS4KPj4+PiAgICovCj4+Pj4gLXN0YXRpYyBib29s
IGRtX3RhYmxlX3N1cHBvcnRzX3pvbmVkX21vZGVsKHN0cnVjdCBkbV90YWJsZSAqdCwKPj4+PiAt
ICBlbnVtIGJsa196b25lZF9tb2RlbAo+Pj4+IHpvbmVkX21vZGVsKQo+Pj4+ICtzdGF0aWMgYm9v
bCBkbV90YWJsZV9zdXBwb3J0c196b25lZChzdHJ1Y3QgZG1fdGFibGUgKnQsIGJvb2wKPj4gem9u
ZWQpCj4+Pj4gIHsKPj4+PiAgZm9yICh1bnNpZ25lZCBpbnQgaSA9IDA7IGkgPCB0LT5udW1fdGFy
Z2V0czsgaSsrKSB7Cj4+Pj4gIHN0cnVjdCBkbV90YXJnZXQgKnRpID0gZG1fdGFibGVfZ2V0X3Rh
cmdldCh0LCBpKTsKPj4+PiBAQCAtMTYyMywxMSArMTYxOSwxMSBAQCBzdGF0aWMgYm9vbAo+Pj4+
IGRtX3RhYmxlX3N1cHBvcnRzX3pvbmVkX21vZGVsKHN0cnVjdCBkbV90YWJsZSAqdCwKPj4+PiAg
Cj4+Pj4gIGlmIChkbV90YXJnZXRfc3VwcG9ydHNfem9uZWRfaG0odGktPnR5cGUpKSB7Cj4+Pj4g
IGlmICghdGktPnR5cGUtPml0ZXJhdGVfZGV2aWNlcyB8fAo+Pj4+IC0gICAgdGktPnR5cGUtPml0
ZXJhdGVfZGV2aWNlcyh0aSwKPj4+PiBkZXZpY2Vfbm90X3pvbmVkX21vZGVsLAo+Pj4+IC0gICAg
ICAmem9uZWRfbW9kZWwpKQo+Pj4+ICsgICAgdGktPnR5cGUtPml0ZXJhdGVfZGV2aWNlcyh0aSwK
Pj4+PiBkZXZpY2Vfbm90X3pvbmVkLAo+Pj4+ICsgICAgICAmem9uZWQpKQo+Pj4+ICByZXR1cm4g
ZmFsc2U7Cj4+Pj4gIH0gZWxzZSBpZiAoIWRtX3RhcmdldF9zdXBwb3J0c19taXhlZF96b25lZF9t
b2RlbCh0aS0KPj4+Pj4gdHlwZSkpIHsKPj4+PiAtaWYgKHpvbmVkX21vZGVsID09IEJMS19aT05F
RF9ITSkKPj4+PiAraWYgKHpvbmVkKQo+Pj4+ICByZXR1cm4gZmFsc2U7Cj4+Pj4gIH0KPj4+PiAg
fQo+Pj4KPj4+IFRoZSBwYXJhbWV0ZXIgImJvb2wgem9uZWQiIGlzIHJlZHVuZGFudC4gSXQgc2hv
dWxkIGJlIHJlbW92ZWQgZnJvbQo+PiB0aGUKPj4+IGFib3ZlIDMgZnVuY3Rpb25zCj4gCj4gVGhl
IHR3byBmdW5jLCBpcyB6b25lZCBhbmQgbm90IHpvbmVkLCBhcmUgZXNzZW50aWFsbHkgdGhlIHNh
bWUuIFRoZXkKPiBjYW4gYmUgc2ltcGxpZmllZCBpbnRvIG9uZSBmdW5jdGlvbi4KCk1heWJlLi4u
IEJ1dCB0aGF0IG5lZWRzIHRlc3RpbmcvY2hlY2tpbmcuIEkgYWRkZWQgdGhlIG9uZSBiZWNhdXNl
IEkgY291bGQgbm90CnJldXNlIHRoZSBvdGhlciBnaXZlbiB3aGF0IGlzIGJlaW5nIHRlc3RlZC4K
Cj4gCj4+Pgo+Pj4gQWRkaXRpb25hbGx5LCBiZWNhdXNlIHdlIG5vIGxvbmdlciBuZWVkIHRvIGRp
c3Rpbmd1aXNoIHRoZSB6b25lZAo+PiBtb2RlbAo+Pj4gaGVyZSwgRE1fVEFSR0VUX01JWEVEX1pP
TkVEX01PREVMIGlzIG1lYW5pbmdsZXNzLiBXZSBjYW4gYWxzbyBjbGVhbgo+PiB1cAo+Pj4gaXRz
IHJlbGF0ZWQgY29kZS4KPj4KPj4gTm9wZS4gVGhlIG1peGVkIHRoaW5nIGlzIGZvciBtaXhpbmcg
dXAgbm9uLXpvbmVkIHdpdGggem9uZWQgbW9kZWxzLgo+PiBGb3IgdGhlIGVudGlyZSBETSBjb2Rl
LCBITSBhbmQgSEEgYXJlIGJvdGggdHJlYXRlZCBhcyBITS1saWtlIHpvbmVkLgo+Pgo+PiAtLSAK
Pj4gRGFtaWVuIExlIE1vYWwKPj4gV2VzdGVybiBEaWdpdGFsIFJlc2VhcmNoCj4gCj4gVGhhbmsg
eW91LiBJIGhhdmUgc29tZSBtaXN1bmRlcnN0YW5kaW5nLiBQbGVhc2UgZGlzcmVnYXJkIGl0LgoK
LS0gCkRhbWllbiBMZSBNb2FsCldlc3Rlcm4gRGlnaXRhbCBSZXNlYXJjaAoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
