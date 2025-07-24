Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6ADB10AF3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 15:09:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXCd8EwPLhEt62hr62dtmuzEqU+1EeoNd4hgsP8QG3c=; b=AYt1NlkksMHnTYvRpJG1wodzfK
	ey04WNPShNfWj+oSKP5hjAoCduJ96KyKRlK0F2fwwmu1U/OTEBxUKUGzEl1TwSMvubWphEcxwBEru
	2h6BYbXfD2jLuafdMeIXwQ1XaGqpNCVcf/YF92S18ME5bTfodfvD4k4lK7ybpQBAic0U=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uevhl-0003CV-Cr;
	Thu, 24 Jul 2025 13:09:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uevhk-0003CM-P1
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 13:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fwbXSCh29EoksK2fvBDxaXgZfb17flNady0ONhv5+1I=; b=nMJaFevIOXvnA+LXc6Jsd8yRaK
 SY+4d4sldhXCnrW2l1oJ/QnOXsTQu7uKVad72gnaSnOcSX+eIe6DQJ8NiKWp1zfGypwu8wBeWumI9
 +Bg6MkuCnFCLWaw2mP61twAnEgyh6j1hnrUqD19bFwk+DmqvH/i5xA8cl5LDH79YJK3o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fwbXSCh29EoksK2fvBDxaXgZfb17flNady0ONhv5+1I=; b=m9pH0lsRH8ZBxYf/67oKEgdSo1
 FDbySR+iB0zBxAOkDPG7JCYdA95W2E95B9fnPmfEf0TmXO9/WZHlSUjymDLwz5zNfKYHA7t30xnRz
 3qAOlrniywEutqvMNZmIyu84Ivqgn0hMg2MMfhURyOEWYoC2I+jACHq+F7l76AXpVs5A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uevhk-0000fh-80 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 13:09:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D2D775C633A;
 Thu, 24 Jul 2025 13:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC60C4CEED;
 Thu, 24 Jul 2025 13:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753362582;
 bh=IXt/noFSvrehS4Utza8A0lxjekW096nkpDvGqnkMVEE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=UiDFtDhzzEtBEcXuZOzTeJ+Vu1R5i/Q8vHHpUulgV+ZFLFFAMefqEsGzap70+uHO+
 W31aJlUmfIVwKVVfa6vbYng64I08molTv+IfGE/VRryj0rHE8yw3Z8cYtgpzLwsI+0
 /a8/nh/iIUR6mFhu9s5Jw6afj6fKdcFbDPD70V5lrUA5XZwSZBCa6gZ83YRd8xUF6z
 lG9sxsH+QgUuEpGjtiNaQf4++JkwZbixfAfNToxwEtZd3Hjkg5wBhGoxatxErT9OzT
 wtNiVxm7WNKwMNxV9MdxcxejGgkovaKqeIl9cceV5Z7aZ0QTCxifxDnn/LbU+3Aqtm
 fr9MohyMw49eg==
Message-ID: <d5355d7d-4e93-4741-9ef7-c7407d600ec0@kernel.org>
Date: Thu, 24 Jul 2025 21:09:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: hanqi <hanqi@vivo.com>, Jens Axboe <axboe@kernel.dk>, jaegeuk@kernel.org
References: <20250715031054.14404-1-hanqi@vivo.com>
 <056e083b-8e41-45a2-9b0f-2ec47d1a9f71@kernel.dk>
 <f7408161-eaef-47ed-8810-8c4e8f27bfc6@vivo.com>
 <51168786-6c30-4065-be82-6d07b2ae74a8@kernel.dk>
 <4366bf0f-64a1-44ae-8f81-301af2d179d8@vivo.com>
Content-Language: en-US
In-Reply-To: <4366bf0f-64a1-44ae-8f81-301af2d179d8@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/7/16 16:27, hanqi wrote: > > > 在 2025/7/16 11:43,
    Jens Axboe 写道: >> On 7/15/25 9:34 PM, hanqi wrote: >>> >>> ? 2025/7/15
    22:28, Jens Axboe ??: >>>> On 7/14/25 9:10 PM, Qi Han wrote: >>>> [...] 
 
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
X-Headers-End: 1uevhk-0000fh-80
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

T24gMjAyNS83LzE2IDE2OjI3LCBoYW5xaSB3cm90ZToKPiAKPiAKPiDlnKggMjAyNS83LzE2IDEx
OjQzLCBKZW5zIEF4Ym9lIOWGmemBkzoKPj4gT24gNy8xNS8yNSA5OjM0IFBNLCBoYW5xaSB3cm90
ZToKPj4+Cj4+PiA/IDIwMjUvNy8xNSAyMjoyOCwgSmVucyBBeGJvZSA/PzoKPj4+PiBPbiA3LzE0
LzI1IDk6MTAgUE0sIFFpIEhhbiB3cm90ZToKPj4+Pj4gSmVucyBoYXMgYWxyZWFkeSBjb21wbGV0
ZWQgdGhlIGRldmVsb3BtZW50IG9mIHVuY2FjaGVkIGJ1ZmZlcmVkIEkvTwo+Pj4+PiBpbiBnaXQg
WzFdLCBhbmQgaW4gZjJmcywgdGhlIGZlYXR1cmUgY2FuIGJlIGVuYWJsZWQgc2ltcGx5IGJ5IHNl
dHRpbmcKPj4+Pj4gdGhlIEZPUF9ET05UQ0FDSEUgZmxhZyBpbiBmMmZzX2ZpbGVfb3BlcmF0aW9u
cy4KPj4+PiBZb3UgbmVlZCB0byBlbnN1cmUgdGhhdCBmb3IgYW55IERPTlRDQUNIRSBJTyB0aGF0
IHRoZSBjb21wbGV0aW9uIGlzCj4+Pj4gcm91dGVkIHZpYSBub24taXJxIGNvbnRleHQsIGlmIGFw
cGxpY2FibGUuIEkgZGlkbid0IHZlcmlmeSB0aGF0IHRoaXMgaXMKPj4+PiB0aGUgY2FzZSBmb3Ig
ZjJmcy4gR2VuZXJhbGx5IHlvdSBjYW4gZGVkdWNlIHRoaXMgYXMgd2VsbCB0aHJvdWdoCj4+Pj4g
dGVzdGluZywgSSdkIHNheSB0aGUgZm9sbG93aW5nIGNhc2VzIHdvdWxkIGJlIGludGVyZXN0aW5n
IHRvIHRlc3Q6Cj4+Pj4KPj4+PiAxKSBOb3JtYWwgRE9OVENBQ0hFIGJ1ZmZlcmVkIHJlYWQKPj4+
PiAyKSBPdmVyd3JpdGUgRE9OVENBQ0hFIGJ1ZmZlcmVkIHdyaXRlCj4+Pj4gMykgQXBwZW5kIERP
TlRDQUNIRSBidWZmZXJlZCB3cml0ZQo+Pj4+Cj4+Pj4gVGVzdCB0aG9zZSB3aXRoIERFQlVHX0FU
T01JQ19TTEVFUCBzZXQgaW4geW91ciBjb25maWcsIGFuZCBpdCB0aGF0Cj4+Pj4gZG9lc24ndCBj
b21wbGFpbiwgdGhhdCdzIGEgZ3JlYXQgc3RhcnQuCj4+Pj4KPj4+PiBGb3IgdGhlIGFib3ZlIHRl
c3QgY2FzZXMgYXMgd2VsbCwgdmVyaWZ5IHRoYXQgcGFnZSBjYWNoZSBkb2Vzbid0IGdyb3cgYXMK
Pj4+PiBJTyBpcyBwZXJmb3JtZWQuIEEgYml0IGlzIGZpbmUgZm9yIHRoaW5ncyBsaWtlIG1ldGEg
ZGF0YSwgYnV0IGdlbmVyYWxseQo+Pj4+IHlvdSB3YW50IHRvIHNlZSBpdCByZW1haW4gYmFzaWNh
bGx5IGZsYXQgaW4gdGVybXMgb2YgcGFnZSBjYWNoZSB1c2FnZS4KPj4+Pgo+Pj4+IE1heWJlIHRo
aXMgaXMgYWxsIGZpbmUsIGxpa2UgSSBzYWlkIEkgZGlkbid0IHZlcmlmeS4gSnVzdCBtZW50aW9u
aW5nIGl0Cj4+Pj4gZm9yIGNvbXBsZXRlbmVzcyBzYWtlLgo+Pj4gSGksIEplbnMKPj4+IFRoYW5r
cyBmb3IgeW91ciBzdWdnZXN0aW9uLiBBcyBJIG1lbnRpb25lZCBlYXJsaWVyIGluIFsxXSwgaW4g
ZjJmcywKPj4+IHRoZSByZWd1bGFyIGJ1ZmZlcmVkIHdyaXRlIHBhdGggaW52b2tlcyBmb2xpb19l
bmRfd3JpdGViYWNrIGZyb20gYQo+Pj4gc29mdGlycSBjb250ZXh0LiBUaGVyZWZvcmUsIGl0IHNl
ZW1zIHRoYXQgZjJmcyBtYXkgbm90IGJlIHN1aXRhYmxlCj4+PiBmb3IgRE9OVENBQ0hFIEkvTyB3
cml0ZXMuCj4+Pgo+Pj4gST9kIGxpa2UgdG8gYXNrIGEgcXVlc3Rpb246IHdoeSBpcyBET05UQ0FD
SEUgSS9PIHdyaXRlIHJlc3RyaWN0ZWQgdG8KPj4+IG5vbi1pbnRlcnJ1cHQgY29udGV4dCBvbmx5
PyBJcyBpdCBiZWNhdXNlIGRyb3BwaW5nIHRoZSBwYWdlIG1pZ2h0IGJlCj4+PiB0b28gdGltZS1j
b25zdW1pbmcgdG8gYmUgZG9uZSBzYWZlbHkgaW4gaW50ZXJydXB0IGNvbnRleHQ/IFRoaXMgbWln
aHQKPj4+IGJlIGEgbmFpdmUgcXVlc3Rpb24sIGJ1dCBJP2QgcmVhbGx5IGFwcHJlY2lhdGUgeW91
ciBjbGFyaWZpY2F0aW9uLgo+Pj4gVGhhbmtzIGluIGFkdmFuY2UuCj4+IEJlY2F1c2UgKGFzIG9m
IHJpZ2h0IG5vdywgYXQgbGVhc3QpIHRoZSBjb2RlIGRvaW5nIHRoZSBpbnZhbGlkYXRpb24KPj4g
bmVlZHMgcHJvY2VzcyBjb250ZXh0LiBUaGVyZSBhcmUgdmFyaW91cyByZWFzb25zIGZvciB0aGlz
LCB3aGljaCB5b3UnbGwKPj4gc2VlIGlmIHlvdSBmb2xsb3cgdGhlIHBhdGggb2ZmIGZvbGlvX2Vu
ZF93cml0ZWJhY2soKSAtPgo+PiBmaWxlbWFwX2VuZF9kcm9wYmVoaW5kX3dyaXRlKCkgLT4gZmls
ZW1hcF9lbmRfZHJvcGJlaGluZCgpIC0+Cj4+IGZvbGlvX3VubWFwX2ludmFsaWRhdGUoKS4gdW5t
YXBfbWFwcGluZ19mb2xpbygpIGlzIG9uZSBjYXNlLCBhbmQgd2hpbGUKPj4gdGhhdCBtYXkgYmUg
ZG9hYmxlLCB0aGUgaW5vZGUgaV9sb2NrIGlzIG5vdCBJUlEgc2FmZS4KPj4KPj4gTW9zdCBmaWxl
IHN5c3RlbXMgaGF2ZSBhIG5lZWQgdG8gcHVudCBzb21lIHdyaXRlYmFjayBjb21wbGV0aW9ucyB0
bwo+PiBub24taXJxIGNvbnRleHQsIGVnIGZvciBmaWxlIGV4dGVuZGluZyBldGMuIEhlbmNlIGZv
ciBtb3N0IGZpbGUgc3lzdGVtcywKPj4gdGhlIGRvbnRjYWNoZSBjYXNlIGp1c3QgYmVjb21lcyBh
bm90aGVyIGNhc2UgdGhhdCBuZWVkcyB0byBnbyB0aHJvdWdoCj4+IHRoYXQgcGF0aC4KPj4KPj4g
SXQnZCBjZXJ0YWlubHkgYmUgcG9zc2libGUgdG8gaW1wcm92ZSB1cG9uIHRoaXMsIGZvciBleGFt
cGxlIGJ5IGhhdmluZwo+PiBhbiBvcHBvcnR1bmlzdGljIGRvbnRjYWNoZSB1bm1hcCBmcm9tIElS
US9zb2Z0LWlycSBjb250ZXh0LCBhbmQgdGhlbgo+PiBwdW50aW5nIHRvIGEgd29ya3F1ZXVlIGlm
IHRoYXQgZG9lc24ndCBwYW4gb3V0LiBCdXQgdGhpcyBkb2Vzbid0IGV4aXN0Cj4+IGFzIG9mIHll
dCwgaGVuY2UgdGhlIG5lZWQgZm9yIHRoZSB3b3JrcXVldWUgcHVudC4KClRoYW5rcyBKZW5zIGZv
ciB0aGUgZGV0YWlsZWQgZXhwbGFuYXRpb24uCgo+IAo+IEhpLCBKZW5zCj4gVGhhbmsgeW91IGZv
ciB5b3VyIHJlc3BvbnNlLiBJIHRlc3RlZCB1bmNhY2hlZCBidWZmZXIgSS9PIHJlYWRzIHdpdGgK
PiBhIDUwR0IgZGF0YXNldCBvbiBhIGxvY2FsIEYyRlMgZmlsZXN5c3RlbSwgYW5kIHRoZSBwYWdl
IGNhY2hlIHNpemUKPiBvbmx5IGluY3JlYXNlZCBzbGlnaHRseSwgd2hpY2ggSSBiZWxpZXZlIGFs
aWducyB3aXRoIGV4cGVjdGF0aW9ucy4KPiBBZnRlciBjbGVhcmluZyB0aGUgcGFnZSBjYWNoZSwg
dGhlIHBhZ2UgY2FjaGUgc2l6ZSByZXR1cm5lZCB0byBpdHMKPiBpbml0aWFsIHN0YXRlLiBUaGUg
dGVzdCByZXN1bHRzIGFyZSBhcyBmb2xsb3dzOgo+IAo+IHN0YXQgNTBHLnR4dAo+ICAgwqAgRmls
ZTogNTBHLnR4dAo+ICAgwqAgU2l6ZTogNTM2ODcwOTEyMDDCoMKgwqDCoMKgIEJsb2NrczogMTA0
OTYwNzEywqDCoMKgwqDCoMKgIElPIEJsb2NrczogNTEywqAgcmVndWxhciBmaWxlCj4gCj4gW3Jl
YWQgYmVmb3JlXToKPiBlY2hvIDMgPiAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMKPiAwMTo0ODox
N8KgwqDCoCAgICAga2JtZW1mcmVlwqBrYmF2YWlsICAgICBrYm1lbXVzZWTCoCAlbWVtdXNlZCAg
ICAgIGtiYnVmZmVyc8Kga2JjYWNoZWTCoCAga2Jjb21taXTCoMKgICAgJWNvbW1pdMKgICBrYmFj
dGl2ZcKgwqAgIGtiaW5hY3TCoMKgICAga2JkaXJ0eQo+IDAxOjUwOjU5wqDCoMKgwqDCoCA2NDA0
NjQ4wqDCoCA4MTQ5NTA4wqDCoCAyNzE5Mzg0wqDCoCAyMy40MMKgwqDCoMKgwqA1MTLCoMKgICAg
MTg5ODA5MiAgIDE5OTM4NDc2MMKgwqDCoCA4MjMuNzXCoMKgIDE4NDY3NTbCoMKgwqAgNDY2ODMy
wqDCoMKgwqDCoDQ0Cj4gCj4gLi91bmNhY2hlZF9pb190ZXN0IDgxOTIgMSAxIDUwRy50eHQKPiBT
dGFydGluZyAxIHRocmVhZHMKPiByZWFkaW5nIGJzIDgxOTIsIHVuY2FjaGVkIDEKPiAgIMKgIDFz
OiA3NTRNQi9zZWMsIE1CPTc1NAo+ICAgwqAgLi4uCj4gICDCoDY0czogODQ0TUIvc2VjLCBNQj0y
NjIxNDQKPiAKPiBbcmVhZCBhZnRlcl06Cj4gMDE6NTI6MzPCoMKgwqDCoMKgIDYzMjY2NjTCoMKg
IDgxMjEyNDDCoMKgIDI3NDc5NjjCoCAgIDIzLjY1wqDCoMKgwqAgIDcyOMKgwqAgICAxOTQ3NjU2
ICAgMTk5Mzg0Nzg4wqDCoMKgIDgyMy43NcKgwqAgMTg4Nzg5NsKgwqDCoCA1MDIwMDTCoMKgwqDC
oMKgNjgKPiBlY2hvIDMgPiAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMKPiAwMTo1MzoxMcKgwqDC
oMKgwqAgNjM1MTEzNsKgwqAgODA5NjkzNsKgwqAgMjc3MjQwMMKgwqAgMjMuODbCoMKgwqDCoMKg
NTEywqDCoCAgIDE5MDA1MDAgICAxOTkzODUyMTbCoMKgwqAgODIzLjc1wqDCoCAxODQ3MjUywqDC
oMKgIDUzMzc2OMKgwqDCoMKgICAxMDQKPiAKPiBIaSBDaGFvLAo+IEdpdmVuIHRoYXQgRjJGUyBj
dXJyZW50bHkgY2FsbHMgZm9saW9fZW5kX3dyaXRlYmFjayBpbiB0aGUgc29mdGlycQo+IGNvbnRl
eHQgZm9yIG5vcm1hbCB3cml0ZSBzY2VuYXJpb3MsIGNvdWxkIHdlIGZpcnN0IHN1cHBvcnQgdW5j
YWNoZWQKPiBidWZmZXIgSS9PIHJlYWRzPyBGb3Igbm9ybWFsIHVuY2FjaGVkIGJ1ZmZlciBJL08g
d3JpdGVzLCB3b3VsZCBpdCBiZQo+IGZlYXNpYmxlIGZvciBGMkZTIHRvIGludHJvZHVjZSBhbiBh
c3luY2hyb25vdXMgd29ya3F1ZXVlIHRvIGhhbmRsZSB0aGUKPiBwYWdlIGRyb3Agb3BlcmF0aW9u
IGluIHRoZSBmdXR1cmU/IFdoYXQgYXJlIHlvdXIgdGhvdWdodHMgb24gdGhpcz8KClFpLAoKU29y
cnkgZm9yIHRoZSBkZWxheS4KCkkgdGhpbmsgaXQgd2lsbCBiZSBnb29kIHRvIHN1cHBvcnQgdW5j
YWNoZWQgYnVmZmVyZWQgSS9PIGluIHJlYWQgcGF0aApmaXJzdCwgYW5kIHRoZW4gbGV0J3MgdGFr
ZSBhIGxvb2sgd2hhdCB3ZSBjYW4gZG8gZm9yIHdyaXRlIHBhdGgsIGFueXdheSwKbGV0J3MgZG8g
dGhpcyBzdGVwIGJ5IHN0ZXAuCgpDYW4geW91IHBsZWFzZSB1cGRhdGUgdGhlIHBhdGNoPwotIHN1
cHBvcnQgcmVhZCBwYXRoIG9ubHkKLSBpbmNsdWRlIHRlc3QgZGF0YSBpbiBjb21taXQgbWVzc2Fn
ZQoKPiBUaGFuayB5b3UhCj4gCj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
