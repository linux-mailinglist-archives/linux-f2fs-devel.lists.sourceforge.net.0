Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2968A21105E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 18:14:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqfNq-0000DW-Vj; Wed, 01 Jul 2020 16:14:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jqfNp-0000DG-HO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 16:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OkFjRfsAjps4q5BZOeMRnFuTrh8wyj/wqSyqCxYJOH4=; b=LnkMIS5GnNaNsRuX+rLbKdQ0vc
 3g0+Uo/NaZBLV2chvYSqQCMvzdlbgFfUOrzyTbM5UUZSAkwgAI/tFHpsV63y3ToeT4Y8y/JQQv+xH
 c+ZG8cQ8VnuUbsf4T1LEW89m05gyZ2su1mtF0F9Z3gKUIDUBitFX48zhMSs/5mb02rOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OkFjRfsAjps4q5BZOeMRnFuTrh8wyj/wqSyqCxYJOH4=; b=NHKgea2op6oA5B+Gsq95Ote8QO
 wk4rluqJ+flj6qbnH4/SoErm6aUAIbsdHoanspwGv7wLiDg9dfcnRZK9Iqrkn/hWo/dbhUpM576Wt
 Ec5pZZ9nOQ7Y3W4siAC/YG1Gc8QnDnJpOmAcnxBIUWxyhtlCd3SouzPEHVEbiD7OzQmk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqfNo-004BRq-9S
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 16:14:49 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D077B207FB;
 Wed,  1 Jul 2020 16:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593620082;
 bh=vvX5vaeR82uMFf05stT8fYK8rwwdtEyVA9ggdjIUTSk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RannkZZxUNr/2BO7IaAn8Qr+8Phk2tvtIMdK4syCoQuo0bI6dP7tnUrGkL3XamGdi
 3CLO4HRmAPF8jjYENRZ4Vz8v3lrJ0JXUml2WVg2Ra6cfhn1K25YMWtT/4UPO1kbs+w
 P02+rvCCDKBa5pPZIMuBH8qcvS/oQzQ4escNjoac=
Date: Wed, 1 Jul 2020 09:14:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200701161442.GB1724572@google.com>
References: <20200624012148.180050-1-jaegeuk@kernel.org>
 <20200629150323.GA3293033@google.com>
 <20200629202720.GA230664@google.com>
 <20200630204348.GA2504307@ubuntu-s3-xlarge-x86>
 <20200630205635.GB1396584@google.com>
 <285a4e16-2cbc-d1e9-8464-8a06bacbaaa0@huawei.com>
 <d496f4b9-e4fa-1366-61a9-38ee59c20e15@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d496f4b9-e4fa-1366-61a9-38ee59c20e15@huawei.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqfNo-004BRq-9S
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid readahead race condition
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
Cc: Nathan Chancellor <natechancellor@gmail.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDcvMDEsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyMC83LzEgOTo1OSwgQ2hhbyBZdSB3cm90
ZToKPiA+IE9uIDIwMjAvNy8xIDQ6NTYsIEphZWdldWsgS2ltIHdyb3RlOgo+ID4+IE9uIDA2LzMw
LCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90ZToKPiA+Pj4gT24gTW9uLCBKdW4gMjksIDIwMjAgYXQg
MDE6Mjc6MjBQTSAtMDcwMCwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gPj4+PiBJZiB0d28gcmVhZGFo
ZWFkIHRocmVhZHMgaGF2aW5nIHNhbWUgb2Zmc2V0IGVudGVyIGluIHJlYWRwYWdlcywgZXZlcnkg
cmVhZAo+ID4+Pj4gSU9zIGFyZSBzcGxpdCBhbmQgaXNzdWVkIHRvIHRoZSBkaXNrIHdoaWNoIGdp
dmluZyBsb3dlciBiYW5kd2lkdGguCj4gPj4+Pgo+ID4+Pj4gVGhpcyBwYXRjaCB0cmllcyB0byBh
dm9pZCByZWR1bmRhbnQgcmVhZGFoZWFkIGNhbGxzLgo+ID4+Pj4KPiA+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4gPj4+PiAtLS0KPiA+Pj4+IHYz
Ogo+ID4+Pj4gIC0gdXNlIFJFQUR8V1JJVEVfT05DRQo+ID4+Pj4gdjI6Cj4gPj4+PiAgIC0gYWRk
IG1pc3NpbmcgY29kZSB0byBieXBhc3MgcmVhZAo+ID4+Pj4gIAo+ID4+Pj4gIGZzL2YyZnMvZGF0
YS5jICB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ID4+Pj4gIGZzL2YyZnMvZjJmcy5oICB8ICAx
ICsKPiA+Pj4+ICBmcy9mMmZzL3N1cGVyLmMgfCAgMiArKwo+ID4+Pj4gIDMgZmlsZXMgY2hhbmdl
ZCwgMjEgaW5zZXJ0aW9ucygrKQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2Rh
dGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4gPj4+PiBpbmRleCA5OTVjZjc4YjIzYzVlLi4zNjBiNGM5
MDgwZDk3IDEwMDY0NAo+ID4+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiA+Pj4+ICsrKyBiL2Zz
L2YyZnMvZGF0YS5jCj4gPj4+PiBAQCAtMjI5Niw2ICsyMjk2LDcgQEAgc3RhdGljIGludCBmMmZz
X21wYWdlX3JlYWRwYWdlcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ID4+Pj4gIAl1bnNpZ25lZCBu
cl9wYWdlcyA9IHJhYyA/IHJlYWRhaGVhZF9jb3VudChyYWMpIDogMTsKPiA+Pj4+ICAJdW5zaWdu
ZWQgbWF4X25yX3BhZ2VzID0gbnJfcGFnZXM7Cj4gPj4+PiAgCWludCByZXQgPSAwOwo+ID4+Pj4g
Kwlib29sIGRyb3BfcmEgPSBmYWxzZTsKPiA+Pj4+ICAKPiA+Pj4+ICAJbWFwLm1fcGJsayA9IDA7
Cj4gPj4+PiAgCW1hcC5tX2xibGsgPSAwOwo+ID4+Pj4gQEAgLTIzMDYsMTAgKzIzMDcsMjQgQEAg
c3RhdGljIGludCBmMmZzX21wYWdlX3JlYWRwYWdlcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ID4+
Pj4gIAltYXAubV9zZWdfdHlwZSA9IE5PX0NIRUNLX1RZUEU7Cj4gPj4+PiAgCW1hcC5tX21heV9j
cmVhdGUgPSBmYWxzZTsKPiA+Pj4+ICAKPiA+Pj4+ICsJLyoKPiA+Pj4+ICsJICogVHdvIHJlYWRh
aGVhZCB0aHJlYWRzIGZvciBzYW1lIGFkZHJlc3MgcmFuZ2UgY2FuIGNhdXNlIHJhY2UgY29uZGl0
aW9uCj4gPj4+PiArCSAqIHdoaWNoIGZyYWdtZW50cyBzZXF1ZW50aWFsIHJlYWQgSU9zLiBTbyBs
ZXQncyBhdm9pZCBlYWNoIG90aGVyLgo+ID4+Pj4gKwkgKi8KPiA+Pj4+ICsJaWYgKHJhYyAmJiBy
ZWFkYWhlYWRfY291bnQocmFjKSkgewo+ID4+Pj4gKwkJaWYgKFJFQURfT05DRShGMkZTX0koaW5v
ZGUpLT5yYV9vZmZzZXQpID09IHJlYWRhaGVhZF9pbmRleChyYWMpKQo+ID4+Pj4gKwkJCWRyb3Bf
cmEgPSB0cnVlOwo+ID4+Pj4gKwkJZWxzZQo+ID4+Pj4gKwkJCVdSSVRFX09OQ0UoRjJGU19JKGlu
b2RlKS0+cmFfb2Zmc2V0LAo+ID4+Pj4gKwkJCQkJCXJlYWRhaGVhZF9pbmRleChyYWMpKTsKPiA+
Pj4+ICsJfQo+ID4+Pj4gKwo+ID4+Pj4gIAlmb3IgKDsgbnJfcGFnZXM7IG5yX3BhZ2VzLS0pIHsK
PiA+Pj4+ICAJCWlmIChyYWMpIHsKPiA+Pj4+ICAJCQlwYWdlID0gcmVhZGFoZWFkX3BhZ2UocmFj
KTsKPiA+Pj4+ICAJCQlwcmVmZXRjaHcoJnBhZ2UtPmZsYWdzKTsKPiA+Pj4+ICsJCQlpZiAoZHJv
cF9yYSkKPiA+Pj4+ICsJCQkJZ290byBuZXh0X3BhZ2U7Cj4gPj4+Cj4gPj4+IFdoZW4gQ09ORklH
X0YyRlNfRlNfQ09NUFJFU1NJT04gaXMgbm90IHNldCAoaS5lLiB4ODZfNjQgZGVmY29uZmlnICsK
PiA+Pj4gQ09ORklHX0YyRlNfRlM9eSk6Cj4gPj4+Cj4gPj4+ICQgbWFrZSAtc2tqIiQobnByb2Mp
IiBPPW91dCBkaXN0Y2xlYW4gZGVmY29uZmlnIGZzL2YyZnMvZGF0YS5vCj4gPj4+IC4uL2ZzL2Yy
ZnMvZGF0YS5jOiBJbiBmdW5jdGlvbiDigJhmMmZzX21wYWdlX3JlYWRwYWdlc+KAmToKPiA+Pj4g
Li4vZnMvZjJmcy9kYXRhLmM6MjMyNzo1OiBlcnJvcjogbGFiZWwg4oCYbmV4dF9wYWdl4oCZIHVz
ZWQgYnV0IG5vdCBkZWZpbmVkCj4gPj4+ICAyMzI3IHwgICAgIGdvdG8gbmV4dF9wYWdlOwo+ID4+
PiAgICAgICB8ICAgICBefn5+Cj4gPj4+IC4uLgo+ID4+Cj4gPj4gVGhhbmtzLiBJIHB1c2hlZCB0
aGUgZml4IGZvciAtbmV4dC4KPiA+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZz
LWRldmVsLzFiZTE4Mzk3LTdmYzYtNzAzZS0xMjFiLWUyMTBlMTAxMzU3ZkBpbmZyYWRlYWQub3Jn
L1QvI3QKPiAKPiBJdCB3aWxsIGhhbmcgdGhlIGtlcm5lbCBiZWNhdXNlIHdlIG1pc3NlZCB0byB1
bmxvY2sgdGhvc2UgY2FjaGVkIHBhZ2VzLAo+IEkgY2hhbmdlZCB0byAnZ290byBzZXRfZXJyb3Jf
cGFnZScsIHRoZSBpc3N1ZSB3YXMgZ29uZS4KCkhvdyBhYm91dCB2ND8KCj4gCj4gVGhhbmtzLAo+
IAo+ID4gCj4gPiBSZXZpZXdlZC1ieTogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPgo+ID4g
Cj4gPiBUaGFua3MsCj4gPiAKPiA+Pgo+ID4+IFRoYW5rcywKPiA+Pgo+ID4+Pgo+ID4+PiBDaGVl
cnMsCj4gPj4+IE5hdGhhbgo+ID4+Pgo+ID4+Pgo+ID4+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdAo+ID4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4+PiBo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCj4gPj4KPiA+Pgo+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+PiBMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4+IGh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiA+Pgo+ID4gCj4gPiAK
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKPiA+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiA+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
