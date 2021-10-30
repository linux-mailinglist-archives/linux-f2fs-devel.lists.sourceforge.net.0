Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD91440706
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Oct 2021 05:03:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mgee7-0001RB-Vo; Sat, 30 Oct 2021 03:03:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mgee6-0001Qc-NZ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Oct 2021 03:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZXMQO/gmeod9j/JhJwW3M21aNcIwpLEeYTNQo9U2ln0=; b=ivVgfkVtwEv/ITWnmUGIt1EUA6
 QEcRLxT6gIrT3TQwTJjWnadW8WmUyaRaT2VGTGoxgu3jvQYZHOMMpiasUHPTmcpY1JPcILlywpYq3
 rPH4xIETPrKDtbgiO3ppXoY994QKHxlFIOVuVVp9RcY0KETdH8oeX4Zl4FkbLnYsG1mc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZXMQO/gmeod9j/JhJwW3M21aNcIwpLEeYTNQo9U2ln0=; b=fYIbrGZLk6WL01gcdSo+4sb6GP
 QtxVRqqqVZ4eRKRYv7dFNb6Pk13ukRulMUanTyFhHM+EbOBbjFwTNDE15JYCOCrx7aOe/dRE80pSH
 3r9qy2LrN2NP5ZJmjrtw5nyNzOqlqJPDWSDcBkcEoGTpQzc0TYdpsZ50KhFiqaZ2iYhM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mgedz-006gpi-SY
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Oct 2021 03:03:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C23216101B;
 Sat, 30 Oct 2021 03:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635562966;
 bh=4Ng1hPz2ZdQc9vj3i8T2gRU7YKbsF5ock4q66vtGinc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aXjOuYETmRLQcRUoAVZtO85Ry8nQbwf/9s+P7g/wcUaixb7A2R5lYyHbepuNc7nyu
 k0X+7pL6tySh2rY5JwtNTsK6LDPuZTVh3CY12V6F+S6gpYMlkQ7wO+eZojHTYUMN1/
 1AFzQ00nX+og2YzxYQbpMr2xMInk7FwfovRd8o4Ym9zGEDYyUYQPyb7nz0TARyPsqG
 QaipqJkNlRBtjAnj6SgLv+pEOhMXqyBalRere0LpIWKRtkSqwo89uPbcvqKDBO3XNF
 IhoZHxYz1MsSyIkoSDoDvDxjhv4h2jEdpFkc3naH4x2gQpgkB4EokO9Toi55HlStaN
 2gRVXC5Bv0BTA==
Message-ID: <3e653a3d-ddb9-e115-d871-3659a1ba5530@kernel.org>
Date: Sat, 30 Oct 2021 11:02:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210928151911.11189-1-chao@kernel.org>
 <YVNoHudG5c65X85G@google.com>
 <65f6c366-9e5b-fe7f-7c38-061996d1882b@kernel.org>
 <dec765de-407b-07c3-75f6-ec7f71c618b7@kernel.org>
 <YXwyvllUOm6jLiF5@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YXwyvllUOm6jLiF5@google.com>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/10/30 1:43, Jaegeuk Kim wrote: > On 10/29, Chao Yu
 wrote: >> Ping, >> >> On 2021/9/29 8:05, Chao Yu wrote: >>> On 2021/9/29
 3:08, Jaegeuk Kim wrote: >>>> On 09/28, Chao Yu wrote: >>>>> In f2fs [...]
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mgedz-006gpi-SY
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip f2fs_preallocate_blocks() for
 overwrite case
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

T24gMjAyMS8xMC8zMCAxOjQzLCBKYWVnZXVrIEtpbSB3cm90ZToKPiBPbiAxMC8yOSwgQ2hhbyBZ
dSB3cm90ZToKPj4gUGluZywKPj4KPj4gT24gMjAyMS85LzI5IDg6MDUsIENoYW8gWXUgd3JvdGU6
Cj4+PiBPbiAyMDIxLzkvMjkgMzowOCwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4+Pj4gT24gMDkvMjgs
IENoYW8gWXUgd3JvdGU6Cj4+Pj4+IEluIGYyZnNfZmlsZV93cml0ZV9pdGVyKCksIGxldCdzIHVz
ZSBmMmZzX292ZXJ3cml0ZV9pbygpIHRvCj4+Pj4+IGNoZWNrIHdoZXRoZXJlIGl0IGlzIG92ZXJ3
cml0ZSBjYXNlLCBmb3Igc3VjaCBjYXNlLCB3ZSBjYW4gc2tpcAo+Pj4+PiBmMmZzX3ByZWFsbG9j
YXRlX2Jsb2NrcygpIGluIG9yZGVyIHRvIGF2b2lkIGYyZnNfZG9fbWFwX2xvY2soKSwKPj4+Pj4g
d2hpY2ggbWF5IGJlIGJsb2NrZWQgYnkgY2hlY2twb2ludCgpIHBvdGVudGlhbGx5Lgo+Pj4+Pgo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+Pj4+IC0tLQo+
Pj4+PiAgwqAgZnMvZjJmcy9maWxlLmMgfCA0ICsrKysKPj4+Pj4gIMKgIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5j
IGIvZnMvZjJmcy9maWxlLmMKPj4+Pj4gaW5kZXggMTNkZWFlMDNkZjA2Li41MWZlY2IyZjRkYjUg
MTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZmls
ZS5jCj4+Pj4+IEBAIC00MzIxLDYgKzQzMjEsMTAgQEAgc3RhdGljIHNzaXplX3QgZjJmc19maWxl
X3dyaXRlX2l0ZXIoc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKmZyb20pCj4+
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgcHJlYWxsb2NhdGVkID0gdHJ1ZTsKPj4+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoCB0YXJnZXRfc2l6ZSA9IGlvY2ItPmtpX3BvcyArIGlvdl9pdGVyX2NvdW50
KGZyb20pOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGYyZnNfb3ZlcndyaXRlX2lvKGlub2Rl
LCBpb2NiLT5raV9wb3MsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlvdl9pdGVyX2NvdW50KGZyb20pKSkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZ290byB3cml0ZTsKPj4+Pgo+Pj4+IFRoaXMgY2FsbHMgZjJmc19tYXBfYmxvY2tz
KCkgd2hpY2ggY2FuIGJlIGR1cGxpY2F0ZSwgaWYgaXQncyBub3QgdGhlIG92ZXJ3aXJ0ZQo+Pj4+
IGNhc2UuIERvIHdlIGhhdmUgb3RoZXIgYmVuZWZpdD8KPj4+Cj4+PiBmMmZzX292ZXJ3cml0ZV9p
bygpIHdpbGwgYnJlYWsgZm9yIGFwcGVuZCB3cml0ZSBjYXNlIHcvIGJlbG93IGNoZWNrOgo+Pj4K
Pj4+ICAgwqDCoMKgwqBpZiAocG9zICsgbGVuID4gaV9zaXplX3JlYWQoaW5vZGUpKQo+Pj4gICDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4+Pgo+Pj4gSSBndWVzcyB3ZSBtYXkgb25seSBz
dWZmZXIgZG91YmxlIGYyZnNfbWFwX2Jsb2NrcygpIGZvciB3cml0ZSBob2xlCj4+PiBjYXNlLCBl
LmcuIHRydW5jYXRlIHRvIGxhcmdlIHNpemUgJiB3cml0ZSBpbnNpZGUgdGhlIGZpbGVzaXplLiBG
b3IKPj4+IHRoaXMgY2FzZSwgaG93IGFib3V0IGFkZGluZyBhIGNvbmRpdGlvbiB0byBhbGxvdyBk
b3VibGUgZjJmc19tYXBfYmxvY2tzKCkKPj4+IG9ubHkgaWYgd3JpdGUgc2l6ZSBpcyBzbWFsbGVy
IHRoYW4gYSB0aHJlc2hvbGQ/Cj4gCj4gSSBzdGlsbCBkb24ndCBzZWUgdGhlIGJlbmVmaXQgbXVj
aCB0byBkbyBkb3VibGUgZjJmc19tYXBfYmxvY2tzLiBXaGF0IGlzIHRoZQo+IHByb2JsZW0gaGVy
ZT8KClRoZXJlIGlzIHBvdGVudGlhbCBoYW5ndGFzayBoYXBwZW5lZCBkdXJpbmcgc3dhcGZpbGUn
cyB3cml0ZWJhY2s6CgotIGxvb3Bfa3RocmVhZF93b3JrZXJfZm4KICAtIGt0aHJlYWRfd29ya2Vy
X2ZuCiAgIC0gbG9vcF9xdWV1ZV93b3JrCiAgICAtIGxvX3J3X2FpbwogICAgIC0gZjJmc19maWxl
X3dyaXRlX2l0ZXIKICAgICAgLSBmMmZzX3ByZWFsbG9jYXRlX2Jsb2NrcwogICAgICAgLSBmMmZz
X21hcF9ibG9ja3MKICAgICAgICAtIGRvd25fcmVhZAogICAgICAgICAtIHJ3c2VtX2Rvd25fcmVh
ZF9zbG93cGF0aAogICAgICAgICAgLSBzY2hlZHVsZQoKSSB0cnkgdG8gbWl0aWdhdGUgc3VjaCBp
c3N1ZSBieSBwcmVhbGxvY2F0aW5nIHN3YXBmaWxlJ3MgYmxvY2sgYWRkcmVzcyBhbmQKYXZvaWQg
ZjJmc19kb19tYXBfbG9jaygpIGFzIG11Y2ggYXMgcG9zc2libGUgaW4gc3dhcGZpbGUncyB3cml0
ZWJhY2sgcGF0aC4uLgoKVGhhbmtzLAoKPiAKPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4+Cj4+Pj4+
ICsKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSBmMmZzX3ByZWFsbG9jYXRlX2Jsb2Nr
cyhpb2NiLCBmcm9tKTsKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZXJyKSB7Cj4+Pj4+
ICDCoCBvdXRfZXJyOgo+Pj4+PiAtLSAKPj4+Pj4gMi4zMi4wCj4+Pgo+Pj4KPj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdAo+Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKPj4+IGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3Vy
bD1odHRwcyUzQSUyRiUyRmxpc3RzLnNvdXJjZWZvcmdlLm5ldCUyRmxpc3RzJTJGbGlzdGluZm8l
MkZsaW51eC1mMmZzLWRldmVsJmFtcDtkYXRhPTA0JTdDMDElN0NjaGFvLnl1JTQwb3Bwby5jb20l
N0M0MjFjMDY4MTJlYmE0ZjkyMmIwOTA4ZDk4MmRjZGNjNSU3Q2YxOTA1ZWIxYzM1MzQxYzU5NTE2
NjJiNGE1NGI1ZWU2JTdDMCU3QzAlN0M2Mzc2ODQ3MDczNzQ5NDAxOTAlN0NVbmtub3duJTdDVFdG
cGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFo
YVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9dTIyZUVXREFQYUFaQ3lJU3lqVFVP
dFFETER1eUt4VG5OQ0kzZVN3d1dybyUzRCZhbXA7cmVzZXJ2ZWQ9MAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
