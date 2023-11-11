Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F39F97E8943
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Nov 2023 05:49:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r1fw3-0007jr-7x;
	Sat, 11 Nov 2023 04:49:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r1fw0-0007jk-AZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Nov 2023 04:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nvH+zn+m7zPGWpBwB7QycCy7v4STNJRDR3Cq5yxWT8M=; b=g9poRbFQGiK+W2DG4vNdA4/5Qq
 FMmPUvcMp1JBx+OdaVmc3oVoOyo6Fut7Q97QhJPx3HPNGCQResl+mU9xq5jGLDWilAIJ+n7HSowAq
 9S8Qqk2/9PN6RSUuwpR7CUqV3avcCfX0QM7baJQTrFGKmIXnU3yoYJTYxyK+ZXzy0pmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nvH+zn+m7zPGWpBwB7QycCy7v4STNJRDR3Cq5yxWT8M=; b=goZgfiyxbKy9TBnOEHoUdyBipL
 yIAvZ6+1xmdaO12NejG7NC1HMycaxADxMsUDmFqVWedbsQx9otGuLGr4LRjrTDAb36G1LNifw7COD
 CE4wxL3VTOwNjsabjcSC2JSOTz3sbzRDVbEGDYFsFIXKtR+mg7eKLIfoYx8KOgWu55N8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r1fvw-002GJ8-Bo for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Nov 2023 04:49:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1D8FBB8236A;
 Sat, 11 Nov 2023 04:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1BEC433C8;
 Sat, 11 Nov 2023 04:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699678151;
 bh=wLa3/4DyAaT4E/tFa9AXdUKW7rjugUNIJ1QPdxeplNE=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=EX1s6WJWvgiGrBoDpUi+jX5uSn8QxWGCyVGqRDJkzyzQ+57tySFgVEOq2bhHMoH/7
 m1zMAuKVh8oC4I1IbAbALOaJeApkACbtW1CSLkHyk8h06CXxAxAShkxfh34gWWkDvr
 uxZyX5hwin2FKC1HFU95SPczDhzWnPtTe0IUdHQZ9TDVhru6mjtaIPc/S7JQuMfO7D
 5bS8mc0EFDXtX9xzz3khm8blwGFmrQmwVMq7ysybgyRIsQcayJxQl31tedOjfEtz3G
 mUr7nYQ0cwvr6aJc5ANuHAvpErYnPqw512OE7ZaZNcYvC+B2eG3nYd/MRCPjD5ez4X
 43RH2tI/cB44w==
Message-ID: <a69b7544-2312-486c-d655-8b86e370c55e@kernel.org>
Date: Sat, 11 Nov 2023 12:49:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Wu Bo <wubo.oduw@gmail.com>, Wu Bo <bo.wu@vivo.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231030094024.263707-1-bo.wu@vivo.com>
 <c181256e-9f6e-d43e-4d02-a7d8d5286d56@kernel.org>
 <670ce4a6-f00c-dbe9-86e2-366311221cf3@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <670ce4a6-f00c-dbe9-86e2-366311221cf3@gmail.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/8 21:48, Wu Bo wrote: > On 2023/11/7 22:39, Chao
 Yu wrote: >> On 2023/10/30 17:40, Wu Bo wrote: >>> If GC victim has pinned
 block, it can't be recycled. >>> And if GC is foreground running, [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
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
 -3.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r1fvw-002GJ8-Bo
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix fallocate failed under pinned
 block situation
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

T24gMjAyMy8xMS84IDIxOjQ4LCBXdSBCbyB3cm90ZToKPiBPbiAyMDIzLzExLzcgMjI6MzksIENo
YW8gWXUgd3JvdGU6Cj4+IE9uIDIwMjMvMTAvMzAgMTc6NDAsIFd1IEJvIHdyb3RlOgo+Pj4gSWYg
R0MgdmljdGltIGhhcyBwaW5uZWQgYmxvY2ssIGl0IGNhbid0IGJlIHJlY3ljbGVkLgo+Pj4gQW5k
IGlmIEdDIGlzIGZvcmVncm91bmQgcnVubmluZywgYWZ0ZXIgbWFueSBmYWlsdXJlIHRyeSwgdGhl
IHBpbm5lZCBmaWxlCj4+PiBpcyBleHBlY3RlZCB0byBiZSBjbGVhciBwaW4gZmxhZy4gVG8gZW5h
YmxlIHRoZSBzZWN0aW9uIGJlIHJlY3ljbGVkLgo+Pj4KPj4+IEJ1dCB3aGVuIGZhbGxvY2F0ZSB0
cmlnZ2VyIEZHX0dDLCBHQyBjYW4gbmV2ZXIgcmVjeWNsZSB0aGUgcGlubmVkCj4+PiBzZWN0aW9u
LiBCZWNhdXNlIEdDIHdpbGwgZ28gdG8gc3RvcCBiZWZvcmUgdGhlIGZhaWx1cmUgdHJ5IG1lZXQg
dGhlCj4+PiB0aHJlc2hvbGQ6Cj4+PiAgwqDCoMKgwqBpZiAoaGFzX2Vub3VnaF9mcmVlX3NlY3Mo
c2JpLCBzZWNfZnJlZWQsIDApKSB7Cj4+PiAgwqDCoMKgwqDCoMKgwqAgaWYgKCFnY19jb250cm9s
LT5ub19iZ19nYyAmJgo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdG90YWxfc2VjX2ZyZWVk
IDwgZ2NfY29udHJvbC0+bnJfZnJlZV9zZWNzKQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Z290byBnb19nY19tb3JlOwo+Pj4gIMKgwqDCoMKgwqDCoMKgIGdvdG8gc3RvcDsKPj4+ICDCoMKg
wqDCoH0KPj4+Cj4+PiBTbyB3aGVuIGZhbGxvY2F0ZSB0cmlnZ2VyIEZHX0dDLCBhdCBsZWFzdCBy
ZWN5Y2xlIG9uZS4KPj4KPj4gSG1tLi4uIGl0IG1heSBicmVhayBwaW5maWxlJ3Mgc2VtYW50aWNz
IGF0IGxlYXN0IG9uIG9uZSBwaW5uZWQgZmlsZT8KPj4gSW4gdGhpcyBjYXNlLCBJIHByZWZlciB0
byBmYWlsIGZhbGxvY2F0ZSgpIHJhdGhlciB0aGFuIHVucGlubmluZyBmaWxlLAo+PiBpbiBvcmRl
ciB0byBhdm9pZCBsZWF2aW5nIGludmFsaWQgTEJBIHJlZmVyZW5jZXMgb2YgdW5waW5uZWQgZmls
ZSBoZWxkCj4+IGJ5IHVzZXJzcGFjZS4KPiAKPiBBcyBmMmZzIGRlc2lnbmVkIG5vdywgRkdfR0Mg
aXMgYWJsZSB0byB1bnBpbiB0aGUgcGlubmVkIGZpbGUuCj4gCj4gZmFsbG9jYXRlKCkgdHJpZ2dl
cmVkIEZHX0dDLCBidXQgY2FuJ3QgcmVjeWNsZSBzcGFjZS7CoCBJdCBicmVha3MgdGhlCj4gZGVz
aWduIGxvZ2ljIG9mIEZHX0dDLgoKWWVzLCBjb250cmFkaWN0b3JpbmVzcyBleGlzdHMuCgpJTU8s
IHVucGluIGZpbGUgYnkgR0MgbG9va3MgbW9yZSBkYW5nZXJvdXMsIGl0IG1heSBjYXVzZSBwb3Rl
bnRpYWwgZGF0YQpjb3JydXB0aW9uIHcvIGJlbG93IGNhc2U6CjEuIGFwcCBwaW5zIGZpbGUgJiBo
b2xkcyBMQkFzIG9mIGRhdGEgYmxvY2tzLgoyLiBHQyB1bnBpbnMgZmlsZSBhbmQgbWlncmF0ZXMg
aXRzIGRhdGEgdG8gbmV3IExCQXMuCjMuIG90aGVyIGZpbGUgcmV1c2VzIHByZXZpb3VzIExCQXMu
CjQuIGFwcCByZWFkL3dyaXRlIGRhdGEgdmlhIHByZXZpb3VzIExCQXMuCgpTbyBJIHN1Z2dlc3Qg
dG8gbm9ybWFsaXplIHVzZSBvZiBwaW5maWxlIGFuZCBkbyBub3QgYWRkIG1vcmUgdW5waW4gY2Fz
ZXMKaW4gZmlsZXN5c3RlbSBpbm5lciBwcm9jZXNzZXMuCgo+IAo+IFRoaXMgaXNzdWUgaXMgaGFw
cGVuZWQgaW4gQW5kcm9pZCBPVEEgc2NlbmFyaW8uwqAgZmFsbG9jYXRlKCkgYWx3YXlzCj4gcmV0
dXJuIGZhaWx1cmUgY2F1c2UgT1RBIGZhaWwuCgpDYW4geW91IHBsZWFzZSBjaGVjayB3aHkgb3Ro
ZXIgcGlubmVkIGZpbGVzIHdlcmUgc28gZnJhZ21lbnRlZCB0aGF0IGYyZnNfZ2MoKQpjYW4gbm90
IHJlY3ljbGUgb25lIGZyZWUgc2VjdGlvbj8KClRoYW5rcywKCj4gCj4gICDCoEFuZCB0aGlzIGNv
bW1pdCBjaGFuZ2VkIHByZXZpb3VzIGJlaGF2aW9yIG9mIGZhbGxvY2F0ZSgpOgo+IAo+IENvbW1p
dCAyZTQyYjdmODE3YWMgKCJmMmZzOiBzdG9wIGFsbG9jYXRpbmcgcGlubmVkIHNlY3Rpb25zIGlm
IEVBR0FJTgo+IGhhcHBlbnMiKQo+IAo+IEJlZm9yZSB0aGlzIGNvbW1pdCwgaWYgZmFsbG9jYXRl
KCkgbWVldCB0aGlzIHNpdHVhdGlvbiwgaXQgd2lsbCB0cmlnZ2VyCj4gRkdfR0MgdG8gcmVjeWNs
ZSBwaW5uZWQgc3BhY2UgZmluYWxseS4KPiAKPiBGR19HQyBpcyBleHBlY3RlZCB0byByZWN5Y2xl
IHBpbm5lZCBzcGFjZSB3aGVuIHRoZXJlIGlzIG5vIG1vcmUgZnJlZQo+IHNwYWNlLsKgIEFuZCB0
aGlzIGlzIHRoZSByaWdodCB0aW1lIHRvIGRvIGl0IHdoZW4gZmFsbG9jYXRlKCkgbmVlZCBmcmVl
Cj4gc3BhY2UuCj4gCj4gSXQgaXMgd2VpcmQgd2hlbiBmMmZzIHNob3dzIGVub3VnaCBzcGFyZSBz
cGFjZSBidXQgY2FuJ3QgZmFsbG9jYXRlKCkuIFNvCj4gSSB0aGluayBpdCBzaG91bGQgYmUgZml4
ZWQuCj4gCj4+Cj4+IFRob3VnaHRzPwo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4gVGhpcyBpc3N1
ZSBjYW4gYmUgcmVwcm9kdWNlZCBieSBmaWxsaW5nIGYyZnMgc3BhY2UgYXMgZm9sbG93aW5nIGxh
eW91dC4KPj4+IEV2ZXJ5IHNlZ21lbnQgaGFzIG9uZSBibG9jayBpcyBwaW5uZWQ6Cj4+PiArLSst
Ky0rLSstKy0rLS0tLS0rLSsKPj4+IHwgfCB8cHwgfCB8IHwgLi4uIHwgfCBzZWdfbgo+Pj4gKy0r
LSstKy0rLSstKy0tLS0tKy0rCj4+PiArLSstKy0rLSstKy0rLS0tLS0rLSsKPj4+IHwgfCB8cHwg
fCB8IHwgLi4uIHwgfCBzZWdfbisxCj4+PiArLSstKy0rLSstKy0rLS0tLS0rLSsKPj4+IC4uLgo+
Pj4gKy0rLSstKy0rLSstKy0tLS0tKy0rCj4+PiB8IHwgfHB8IHwgfCB8IC4uLiB8IHwgc2VnX24r
awo+Pj4gKy0rLSstKy0rLSstKy0tLS0tKy0rCj4+Pgo+Pj4gQW5kIGZvbGxvd2luZyBhcmUgc3Rl
cHMgdG8gcmVwcm9kdWNlIHRoaXMgaXNzdWU6Cj4+PiBkZCBpZj0vZGV2L3plcm8gb2Y9Li9mMmZz
X3Bpbi5pbWcgYnM9Mk0gY291bnQ9MTAyNAo+Pj4gbWtmcy5mMmZzIGYyZnNfcGluLmltZwo+Pj4g
bWtkaXIgZjJmcwo+Pj4gbW91bnQgZjJmc19waW4uaW1nIC4vZjJmcwo+Pj4gY2QgZjJmcwo+Pj4g
ZGQgaWY9L2Rldi96ZXJvIG9mPS4vbGFyZ2VfcGFkZGluZyBicz0xTSBjb3VudD0xNzYwCj4+PiAu
L3Bpbl9maWxsaW5nLnNoCj4+PiBybSBwYWRkaW5nKgo+Pj4gc3luYwo+Pj4gdG91Y2ggZmFsbG9j
YXRlXzQwbQo+Pj4gZjJmc19pbyBwaW5maWxlIHNldCBmYWxsb2NhdGVfNDBtCj4+PiBmYWxsb2Nh
dGUgLWwgNDE5NDMwNDAgZmFsbG9jYXRlXzQwbQo+Pj4KPj4+IGZhbGxvY2F0ZSBhbHdheXMgZmFp
bCB3aXRoIEVBR0FJTiBldmVuIHRoZXJlIGhhcyBlbm91Z2ggZnJlZSBzcGFjZS4KPj4+Cj4+PiAn
cGluX2ZpbGxpbmcuc2gnIGlzOgo+Pj4gY291bnQ9MQo+Pj4gd2hpbGUgOgo+Pj4gZG8KPj4+ICDC
oMKgwqDCoCAjIGZpbGxpbmcgdGhlIHNlZyBzcGFjZQo+Pj4gIMKgwqDCoMKgIGZvciBpIGluIHsx
Li41MTF9Ogo+Pj4gIMKgwqDCoMKgIGRvCj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBuYW1lPXBhZGRp
bmdfJGNvdW50LSRpCj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBlY2hvIHdyaXRlICRuYW1lCj4+PiAg
wqDCoMKgwqDCoMKgwqDCoCBkZCBpZj0vZGV2L3plcm8gb2Y9Li8kbmFtZSBicz00SyBjb3VudD0x
ID4gL2Rldi9udWxsIDI+JjEKPj4+ICDCoMKgwqDCoMKgwqDCoMKgIGlmIFsgJD8gLW5lIDAgXTsg
dGhlbgo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV4aXQgMAo+Pj4gIMKg
wqDCoMKgwqDCoMKgwqAgZmkKPj4+ICDCoMKgwqDCoCBkb25lCj4+PiAgwqDCoMKgwqAgc3luYwo+
Pj4KPj4+ICDCoMKgwqDCoCAjIHBpbiBvbmUgYmxvY2sgaW4gYSBzZWdtZW50Cj4+PiAgwqDCoMKg
wqAgbmFtZT1waW5fZmlsZSRjb3VudAo+Pj4gIMKgwqDCoMKgIGRkIGlmPS9kZXYvemVybyBvZj0u
LyRuYW1lIGJzPTRLIGNvdW50PTEgPiAvZGV2L251bGwgMj4mMQo+Pj4gIMKgwqDCoMKgIHN5bmMK
Pj4+ICDCoMKgwqDCoCBmMmZzX2lvIHBpbmZpbGUgc2V0ICRuYW1lCj4+PiAgwqDCoMKgwqAgY291
bnQ9JCgoJGNvdW50ICsgMSkpCj4+PiBkb25lCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogV3UgQm8g
PGJvLnd1QHZpdm8uY29tPgo+Pj4gLS0tCj4+PiAgwqAgZnMvZjJmcy9maWxlLmMgfCAyICstCj4+
PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPj4+IGluZGV4
IGNhNTkwNDEyOWIxNi4uZThhMTM2MTY1NDNmIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9maWxl
LmMKPj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+PiBAQCAtMTY5MCw3ICsxNjkwLDcgQEAgc3Rh
dGljIGludCBmMmZzX2V4cGFuZF9pbm9kZV9kYXRhKHN0cnVjdCBpbm9kZQo+Pj4gKmlub2RlLCBs
b2ZmX3Qgb2Zmc2V0LAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5pbml0X2djX3R5
cGUgPSBGR19HQywKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2hvdWxkX21pZ3Jh
dGVfYmxvY2tzID0gZmFsc2UsCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmVycl9n
Y19za2lwcGVkID0gdHJ1ZSwKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5ucl9mcmVlX3Nl
Y3MgPSAwIH07Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubnJfZnJlZV9zZWNzID0gMSB9
Owo+Pj4gIMKgwqDCoMKgwqAgcGdvZmZfdCBwZ19zdGFydCwgcGdfZW5kOwo+Pj4gIMKgwqDCoMKg
wqAgbG9mZl90IG5ld19zaXplOwo+Pj4gIMKgwqDCoMKgwqAgbG9mZl90IG9mZl9lbmQ7CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
