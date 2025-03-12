Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F7EA5D4E5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 05:03:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsDJg-0006MW-Ot;
	Wed, 12 Mar 2025 04:03:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tsDJf-0006MP-1s
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 04:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/mE2rz4dvsFuggcx2oh+ku5+I9BshQVGTAU9JLfrPiA=; b=GN+Yy80gh2yNQVyjjd/dnkipYH
 8Q+1YtiOYUNuuvv6CUUylpytps04+r9JP0je/6jJu13OaIzmaxHmcOmti2ka1b6orw+InIkabh3Il
 Br0plL6rlE9JUkn27PnuUWx8vTfYoZuGlDDE7/FIL57vIJMd2MGUXQ/fTLi+jFENoQHs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/mE2rz4dvsFuggcx2oh+ku5+I9BshQVGTAU9JLfrPiA=; b=GclqI07EAXMADnpg0UZu1SBic4
 AkvTR9xrNZhxF0YFe+A6Kl4PVLhoCD3fei3kpjBZY34QQVD3VYiBUx6mKhyLGeWAHOMUq03pJKv7T
 5vX1dPPnO+qWBDowRO5iR01vvkaR61KfthjHq7bcTT2TJu+kNbWZ0RvuhArrIHL4BkxM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsDJe-00086E-6l for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 04:03:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0A6FE5C482B;
 Wed, 12 Mar 2025 04:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA67C4CEE3;
 Wed, 12 Mar 2025 04:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741752208;
 bh=DSIMBFNsY1w4xtxumS2VbvzlE4iL0ICS9Rp8Ydr7DS4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ktv14dhdTjmcCCeMlLMQn8NFoOjnwA/Z+kN6QrXbZ5+mAfFQ9F0GnDcmICr43WIHj
 0qOkNcg4knR4ES2XWt9V3jZd4n6KI3KRzDhKKmezNjVbOG0cVt/AGYFLP2sZ94WCi6
 Gb1ZU8JK9okzB4J6vQi9O5gppynD/9B6dP0tvkC2P539ied6RQ3O9BAxY9Uc1Pzv0z
 foaCg1sLTzYVD4k9vK8ZBuXKB3FseA24ysl4/vEjQO6SJzNXUdyAdrhRDpbHmG17f4
 riEFvwJZ+6jX1quPPyo1YVQLRvy2xwZIyYxezBUCLRtR0o6Ku7o8HvwHPGiW6tM4Iv
 RqdTVfLfv0h+Q==
Message-ID: <381ac49a-25e9-4c37-9855-e2adb64fa81d@kernel.org>
Date: Wed, 12 Mar 2025 12:03:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chunhai Guo <guochunhai@vivo.com>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
References: <20250119140834.1061145-1-guochunhai@vivo.com>
 <77fa4633-f7db-4daa-a9e1-3fdb5bf9dd1d@kernel.org>
 <74811428-9fee-467b-802f-dcb9f9dbb5a5@vivo.com>
Content-Language: en-US
In-Reply-To: <74811428-9fee-467b-802f-dcb9f9dbb5a5@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 3/12/25 11:19, Chunhai Guo wrote: > 在 1/20/2025 7:45
   PM, Chao Yu 写道: >> On 1/19/25 22:08, Chunhai Guo wrote: >>> fstrim may
    miss candidates that need to be discarded, as shown in the >>> exam [...]
    
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsDJe-00086E-6l
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix missing discard candidates in
 fstrim
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAzLzEyLzI1IDExOjE5LCBDaHVuaGFpIEd1byB3cm90ZToKPiDlnKggMS8yMC8yMDI1IDc6
NDUgUE0sIENoYW8gWXUg5YaZ6YGTOgo+PiBPbiAxLzE5LzI1IDIyOjA4LCBDaHVuaGFpIEd1byB3
cm90ZToKPj4+IGZzdHJpbSBtYXkgbWlzcyBjYW5kaWRhdGVzIHRoYXQgbmVlZCB0byBiZSBkaXNj
YXJkZWQsIGFzIHNob3duIGluIHRoZQo+Pj4gZXhhbXBsZXMgYmVsb3cuCj4+Pgo+Pj4gVGhlIHJv
b3QgY2F1c2UgaXMgdGhhdCB3aGVuIGNwYy0+cmVhc29uIGlzIHNldCB3aXRoIENQX0RJU0NBUkQs
Cj4+PiBhZGRfZGlzY2FyZF9hZGRycygpIGV4cGVjdHMgdGhhdCBja3B0X3ZhbGlkX21hcCBhbmQg
Y3VyX3ZhbGlkX21hcCBoYXZlCj4+PiBiZWVuIHN5bmNlZCBieSBzZWdfaW5mb190b19yYXdfc2l0
KCkgWzFdLCBhbmQgaXQgdHJpZXMgdG8gZmluZCB0aGUKPj4+IGNhbmRpZGF0ZXMgYmFzZWQgb24g
Y2twdF92YWxpZF9tYXAgYW5kIGRpc2NhcmRfbWFwLiBIb3dldmVyLAo+Pj4gc2VnX2luZm9fdG9f
cmF3X3NpdCgpIGRvZXMgbm90IGFjdHVhbGx5IHJ1biBiZWZvcmUKPj4+IGYyZnNfZXhpc3RfdHJp
bV9jYW5kaWRhdGVzKCksIHJlc3VsdGluZyBpbiB0aGUgZmFpbHVyZS4KPj4+Cj4+PiBUaGUgY29k
ZSBsb2dpYyBjYW4gYmUgc2ltcGxpZmllZCBmb3IgYWxsIGNhc2VzIGJ5IGZpbmRpbmcgYWxsIHRo
ZQo+Pj4gZGlzY2FyZCBibG9ja3MgYmFzZWQgb25seSBvbiBkaXNjYXJkX21hcC4gVGhpcyBtaWdo
dCByZXN1bHQgaW4gbW9yZQo+Pj4gZGlzY2FyZCBibG9ja3MgYmVpbmcgc2VudCBmb3IgdGhlIHNl
Z21lbnQgZHVyaW5nIHRoZSBmaXJzdCBjaGVja3BvaW50Cj4+PiBhZnRlciBtb3VudGluZywgd2hp
Y2ggd2VyZSBvcmlnaW5hbGx5IGV4cGVjdGVkIHRvIGJlIHNlbnQgb25seSBpbgo+Pj4gZnN0cmlt
LiBSZWdhcmRsZXNzLCB0aGVzZSBkaXNjYXJkIGJsb2NrcyBzaG91bGQgZXZlbnR1YWxseSBiZSBz
ZW50LCBhbmQKPj4+IHRoZSBzaW1wbGlmaWVkIGNvZGUgbWFrZXMgc2Vuc2UgaW4gdGhpcyBjb250
ZXh0Lgo+Pj4KPj4+IHJvb3QjIGNwIHRlc3RmaWxlIC9mMmZzX21vdW50cG9pbnQKPj4+Cj4+PiBy
b290IyBmMmZzX2lvIGZpZW1hcCAwIDEgL2YyZnNfbW91bnRwb2ludC90ZXN0ZmlsZQo+Pj4gRmll
bWFwOiBvZmZzZXQgPSAwIGxlbiA9IDEKPj4+ICAgICAgICAgICBsb2dpY2FsIGFkZHIuICAgIHBo
eXNpY2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+Pj4gMCAgICAgICAwMDAwMDAw
MDAwMDAwMDAwIDAwMDAwMDA0MDZhMDAwMDAgMDAwMDAwMDAzZDgwMDAwMCAwMDAwMTAwMAo+Pj4K
Pj4+IHJvb3QjIHJtIC9mMmZzX21vdW50cG9pbnQvdGVzdGZpbGUKPj4+Cj4+PiByb290IyBmc3Ry
aW0gLXYgLW8gMHg0MDZhMDAwMDAgLWwgMTAyNE0gL2YyZnNfbW91bnRwb2ludCAtLSBubyBjYW5k
aWRhdGUgaXMgZm91bmQKPj4+IC9mMmZzX21vdW50cG9pbnQ6IDAgQiAoMCBieXRlcykgdHJpbW1l
ZAo+Pj4KPj4+IFJlbGV2YW50IGNvZGUgcHJvY2VzcyBvZiB0aGUgcm9vdCBjYXVzZToKPj4+IGYy
ZnNfdHJpbV9mcygpCj4+PiAgICAgICBmMmZzX3dyaXRlX2NoZWNrcG9pbnQoKQo+Pj4gICAgICAg
ICAgIC4uLgo+Pj4gICAgICAgICAgIGlmIChjcGMtPnJlYXNvbiAmIENQX0RJU0NBUkQpIHsKPj4+
ICAgICAgICAgICAgICAgICAgIGlmICghZjJmc19leGlzdF90cmltX2NhbmRpZGF0ZXMoc2JpLCBj
cGMpKSB7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgdW5ibG9ja19vcGVyYXRpb25zKHNiaSk7
Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7IC8vIE5vIGNhbmRpZGF0ZXMgYXJl
IGZvdW5kIGhlcmUsIGFuZCBpdCBleGl0cy4KPj4+ICAgICAgICAgICAgICAgICAgIH0KPj4+ICAg
ICAgICAgICAgICAgLi4uCj4+PiAgICAgICAgICAgfQo+Pj4KPj4+IFsxXSBQbGVhc2UgcmVmZXIg
dG8gY29tbWl0IGQ3YmMyNDg0YjhkNCAoImYyZnM6IGZpeCBzbWFsbCBkaXNjYXJkcyBub3QKPj4+
IHRvIGlzc3VlIHJlZHVuZGFudGx5IikgZm9yIHRoZSByZWxhdGlvbnNoaXAgYmV0d2Vlbgo+Pj4g
c2VnX2luZm9fdG9fcmF3X3NpdCgpIGFuZCBhZGRfZGlzY2FyZF9hZGRycygpLgo+Pj4KPj4+IEZp
eGVzOiAyNTI5MGZhNTU5MWQgKCJmMmZzOiByZXR1cm4gZnNfdHJpbSBpZiB0aGVyZSBpcyBubyBj
YW5kaWRhdGUiKQo+Pj4gU2lnbmVkLW9mZi1ieTogQ2h1bmhhaSBHdW8gPGd1b2NodW5oYWlAdml2
by5jb20+Cj4+PiAtLS0KPj4+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZz
LWRldmVsLzIwMjUwMTAyMTAxMzEwLjU4MDI3Ny0xLWd1b2NodW5oYWlAdml2by5jb20vCj4+PiB2
MS0+djI6IEZpbmQgYWxsIHRoZSBkaXNjYXJkIGJsb2NrcyBiYXNlZCBvbmx5IG9uIGRpc2NhcmRf
bWFwIGluIGFkZF9kaXNjYXJkX2FkZHJzKCkuCj4+PiAtLS0KPj4+ICAgIGZzL2YyZnMvc2VnbWVu
dC5jIHwgNSArLS0tLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRl
bGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2Yy
ZnMvc2VnbWVudC5jCj4+PiBpbmRleCAxM2VlNzNhM2M0ODEuLjI1ZWE4OTJhNDJkZCAxMDA2NDQK
Pj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4+PiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+
Pj4gQEAgLTIwNzQsOCArMjA3NCw2IEBAIHN0YXRpYyBib29sIGFkZF9kaXNjYXJkX2FkZHJzKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGNwX2NvbnRyb2wgKmNwYywKPj4+ICAgIHsK
Pj4+ICAgICAgaW50IGVudHJpZXMgPSBTSVRfVkJMT0NLX01BUF9TSVpFIC8gc2l6ZW9mKHVuc2ln
bmVkIGxvbmcpOwo+Pj4gICAgICBzdHJ1Y3Qgc2VnX2VudHJ5ICpzZSA9IGdldF9zZWdfZW50cnko
c2JpLCBjcGMtPnRyaW1fc3RhcnQpOwo+Pj4gLSAgICB1bnNpZ25lZCBsb25nICpjdXJfbWFwID0g
KHVuc2lnbmVkIGxvbmcgKilzZS0+Y3VyX3ZhbGlkX21hcDsKPj4+IC0gICAgdW5zaWduZWQgbG9u
ZyAqY2twdF9tYXAgPSAodW5zaWduZWQgbG9uZyAqKXNlLT5ja3B0X3ZhbGlkX21hcDsKPj4+ICAg
ICAgdW5zaWduZWQgbG9uZyAqZGlzY2FyZF9tYXAgPSAodW5zaWduZWQgbG9uZyAqKXNlLT5kaXNj
YXJkX21hcDsKPj4+ICAgICAgdW5zaWduZWQgbG9uZyAqZG1hcCA9IFNJVF9JKHNiaSktPnRtcF9t
YXA7Cj4+PiAgICAgIHVuc2lnbmVkIGludCBzdGFydCA9IDAsIGVuZCA9IC0xOwo+Pj4gQEAgLTIx
MDAsOCArMjA5OCw3IEBAIHN0YXRpYyBib29sIGFkZF9kaXNjYXJkX2FkZHJzKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSwgc3RydWN0IGNwX2NvbnRyb2wgKmNwYywKPj4+Cj4+PiAgICAgIC8qIFNJ
VF9WQkxPQ0tfTUFQX1NJWkUgc2hvdWxkIGJlIG11bHRpcGxlIG9mIHNpemVvZih1bnNpZ25lZCBs
b25nKSAqLwo+Pj4gICAgICBmb3IgKGkgPSAwOyBpIDwgZW50cmllczsgaSsrKQo+Pj4gLSAgICAg
ICAgICAgIGRtYXBbaV0gPSBmb3JjZSA/IH5ja3B0X21hcFtpXSAmIH5kaXNjYXJkX21hcFtpXSA6
Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIChjdXJfbWFwW2ldIF4gY2twdF9tYXBb
aV0pICYgY2twdF9tYXBbaV07Cj4+PiArICAgICAgICAgICAgZG1hcFtpXSA9IH5kaXNjYXJkX21h
cFtpXTsKPj4gZGlzY2FyZCBpcyBjcml0aWNhbCwgd2UgbmVlZCBtb3JlIHNhbml0eSBjaGVjayBo
ZXJlLCBtYXliZToKPj4KPj4gLyogbmV2ZXIgaXNzdWUgZGlzY2FyZCB0byB2YWxpZCBkYXRhJ3Mg
YmxvY2sgYWRkcmVzcyAqLwo+PiBmMmZzX2J1Z19vbihzYmksIChjdXJfbWFwW2ldIF4gZGlzY2Fy
ZF9tYXBbaV0pICYgY3VyX21hcFtpXSk7Cj4+Cj4+IENhbiB5b3UgcGxlYXNlIGNoZWNrIHRoaXM/
Cj4gCj4gU3VyZS4gSSBoYXZlIGFkZGVkIHRoZSBCVUdfT04gY2hlY2sgYW5kIHBlcmZvcm1lZCB0
aGUgZm9sbG93aW5nIHRlc3RzCj4gd2l0aG91dCBpc3N1ZToKPiAxLiBSYW4geGZzdGVzdHMgYW5k
IGZzc3RyZXNzIGluIHRoZSBRRU1VIGVudmlyb25tZW50Lgo+IAo+IDIuIFJhbiBtb25rZXkgYW5k
IHJlYm9vdCB0ZXN0cyBvbiBBUk02NCBBbmRyb2lkIGRldmljZXMgd2l0aCB0aGUgNi42IGtlcm5l
bC4KClRoYW5rcywgc28gaXQgbG9va3MgZmluZSBub3csIGNhbiB5b3UgcGxlYXNlIHVwZGF0ZSB0
aGUgcGF0Y2ggdy8gYWJvdmUKZjJmc19idWdfb24gY2hlY2s/CgpUaGFua3MsCgo+IAo+IFRoYW5r
cywKPiAKPiAKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4KPj4+ICAgICAgd2hpbGUgKGZvcmNlIHx8IFNN
X0koc2JpKS0+ZGNjX2luZm8tPm5yX2Rpc2NhcmRzIDw9Cj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFNNX0koc2JpKS0+ZGNjX2luZm8tPm1heF9kaXNjYXJkcykgewo+IAo+IAoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
