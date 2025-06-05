Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC0FACE895
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Jun 2025 05:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7++2XWP6JUTqJnInobIQp9xIXN+YHIc0BQgPP9pY5jg=; b=RqIVUKMvQmTWxg8WUJNbMSckzw
	gNZmM28wddwbs+pR6sNn8DexGAufhZMibdMY9m4GzAlFXOwSzUyL8uJbziKAy3/QBjwvG6ArXviw0
	SeSaVW3jZcwU4gksJKeibACNA/PXSNd7pj3cmBQxRNHhmkfAf/X8QrhjXDktrgUK8r2w=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uN15Z-0002R1-VX;
	Thu, 05 Jun 2025 03:16:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uN15Y-0002Qv-9s
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 03:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QbNUACK42pwDzBMer4VyWtG0LARFMpf9s/TeAwY+NnA=; b=bJtCnORY4t4uERn2zyor8H2HGM
 9eu360nhE+Oxl2DlUJGYOnkFhoft5ycJptu+LqwY1dQKNtLra3i4A0+dhB4B77S2lsK36ueuUofRf
 MAQi6YChJ+96XxRH95IsLE7VUJDBElx0QkznkMbUAudezwRf4IXT3hM7WOvtY80sE09U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QbNUACK42pwDzBMer4VyWtG0LARFMpf9s/TeAwY+NnA=; b=j5yFqMOI6+mg/0eKCPtWzy2CJX
 xw2vYDroHGpg/nYmMxHtNp45Gk+2v6avgBFKKF9PIYa9libeS1H1CzM850A9LOn1v3UW8UrwZxmpa
 zlCLsb+C9uOheQWdRAdrj3kJPCojk3CjZOg39cQKlL1K89ccH9Z8e94V30jZs5zRtCHw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uN15X-0007XC-IK for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 03:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1BD376115E;
 Thu,  5 Jun 2025 03:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26854C4CEE4;
 Thu,  5 Jun 2025 03:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749093367;
 bh=+CjIvXaGtuRDG6cMi1GJLC+GDWg0p4LsrvNVFq5f54E=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=oz9dmKQdCZ2JokklxksMokEVVIIN+3StPWKGMbFe6is+ndKRT0hyol8Zm58cSHQyR
 MExoEtTFHeftA/Ba+UTo5FdYeM2InM6TKAYYfWjzUMpYFiVFgej9sXnWprzSssW9Oy
 ovSAAPCpwVZFRcZWO00vJ6IxfhZh0ynvzKCmyHji35L1EDX/VteuIC/rUrGVLLRs9V
 EwLpLunn7y7OpgcfNyE/eGNMBurXbR5utPrKnS5SUZdahEeHxKmlZ2TScxYXBVrbAc
 +s8/jEmwdP+YIdQirVcD7mRTerAdsgTMSU4DqcjPQ+LaALYaVhTqXvdRYAuwMGytNL
 TCNjZkxYvVhJA==
Message-ID: <31d7937f-1d8c-4a28-a0b5-3fb34b695401@kernel.org>
Date: Thu, 5 Jun 2025 11:16:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20250604085700.2454694-1-chao@kernel.org>
 <CAHJ8P3JXJfX=YVKGuQzM6n+yRbAh6Kxem+dLqdP_3F_BN=b_+Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3JXJfX=YVKGuQzM6n+yRbAh6Kxem+dLqdP_3F_BN=b_+Q@mail.gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 6/5/25 09:15, Zhiguo Niu wrote: > Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > 于2025年6月4日周三 17:01写道：
    >> >> fstest reports a f2fs bug: >> >> generic/363 [...] 
 
 Content analysis details:   (-0.5 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uN15X-0007XC-IK
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to zero post-eof page
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNi81LzI1IDA5OjE1LCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgdmlhIExpbnV4LWYy
ZnMtZGV2ZWwgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Pgo+IOS6jjIw
MjXlubQ25pyINOaXpeWRqOS4iSAxNzowMeWGmemBk++8mgo+Pgo+PiBmc3Rlc3QgcmVwb3J0cyBh
IGYyZnMgYnVnOgo+Pgo+PiBnZW5lcmljLzM2MyA0MnMgLi4uIFtmYWlsZWQsIGV4aXQgc3RhdHVz
IDFdLSBvdXRwdXQgbWlzbWF0Y2ggKHNlZSAvc2hhcmUvZ2l0L2ZzdGVzdHMvcmVzdWx0cy8vZ2Vu
ZXJpYy8zNjMub3V0LmJhZCkKPj4gICAgIC0tLSB0ZXN0cy9nZW5lcmljLzM2My5vdXQgICAyMDI1
LTAxLTEyIDIxOjU3OjQwLjI3MTQ0MDU0MiArMDgwMAo+PiAgICAgKysrIC9zaGFyZS9naXQvZnN0
ZXN0cy9yZXN1bHRzLy9nZW5lcmljLzM2My5vdXQuYmFkIDIwMjUtMDUtMTkgMTk6NTU6NTguMDAw
MDAwMDAwICswODAwCj4+ICAgICBAQCAtMSwyICsxLDc4IEBACj4+ICAgICAgUUEgb3V0cHV0IGNy
ZWF0ZWQgYnkgMzYzCj4+ICAgICAgZnN4IC1xIC1TIDAgLWUgMSAtTiAxMDAwMDAKPj4gICAgICtS
RUFEIEJBRCBEQVRBOiBvZmZzZXQgPSAweGQ2ZmIsIHNpemUgPSAweGYwNDQsIGZuYW1lID0gL21u
dC9mMmZzL2p1bmsKPj4gICAgICtPRkZTRVQgICAgICBHT09EICAgIEJBRCAgICAgUkFOR0UKPj4g
ICAgICsweDE1NDBkICAgICAweDAwMDAgIDB4MmEyNSAgMHgwCj4+ICAgICArb3BlcmF0aW9uIyAo
bW9kIDI1NikgZm9yIHRoZSBiYWQgZGF0YSBtYXkgYmUgMzcKPj4gICAgICsweDE1NDBlICAgICAw
eDAwMDAgIDB4MjUyNyAgMHgxCj4+ICAgICAuLi4KPj4gICAgIChSdW4gJ2RpZmYgLXUgL3NoYXJl
L2dpdC9mc3Rlc3RzL3Rlc3RzL2dlbmVyaWMvMzYzLm91dCAvc2hhcmUvZ2l0L2ZzdGVzdHMvcmVz
dWx0cy8vZ2VuZXJpYy8zNjMub3V0LmJhZCcgIHRvIHNlZSB0aGUgZW50aXJlIGRpZmYpCj4+IFJh
bjogZ2VuZXJpYy8zNjMKPj4gRmFpbHVyZXM6IGdlbmVyaWMvMzYzCj4+IEZhaWxlZCAxIG9mIDEg
dGVzdHMKPj4KPj4gVGhlIHJvb3QgY2F1c2UgaXMgdXNlciBjYW4gdXBkYXRlIHBvc3QtZW9mIHBh
Z2UgdmlhIG1tYXAsIGhvd2V2ZXIsIGYyZnMgbWlzc2VkCj4+IHRvIHplcm8gcG9zdC1lb2YgcGFn
ZSBpbiBiZWxvdyBvcGVyYXRpb25zLCBzbywgb25jZSBpdCBleHBhbmRzIGlfc2l6ZSwgdGhlbiBp
dAo+PiB3aWxsIGluY2x1ZGUgZHVtbXkgZGF0YSBsb2NhdGVzIHByZXZpb3VzIHBvc3QtZW9mIHBh
Z2UsIHNvIGR1cmluZyBiZWxvdwo+PiBvcGVyYXRpb25zLCB3ZSBuZWVkIHRvIHplcm8gcG9zdC1l
b2YgcGFnZS4KPj4KPj4gT3BlcmF0aW9ucyB3aGljaCBjYW4gaW5jbHVkZSBkdW1teSBkYXRhIGFm
dGVyIHByZXZpb3VzIGlfc2l6ZSBhZnRlciBleHBhbmRpbmcKPj4gaV9zaXplOgo+PiAtIHdyaXRl
Cj4+IC0gbWFwd3JpdGUKPj4gLSB0cnVuY2F0ZQo+PiAtIGZhbGxvY2F0ZQo+PiAgKiBwcmVhbGxv
Y2F0ZQo+PiAgKiB6ZXJvX3JhbmdlCj4+ICAqIGluc2VydF9yYW5nZQo+PiAgKiBjb2xsYXBzZV9y
YW5nZQo+PiAtIGNsb25lX3JhbmdlIChkb2VzbuKAmXQgc3VwcG9ydCBpbiBmMmZzKQo+PiAtIGNv
cHlfcmFuZ2UgKGRvZXNu4oCZdCBzdXBwb3J0IGluIGYyZnMpCj4+Cj4+IENjOiBzdGFibGVAa2Vy
bmVsLm9yZwo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+IC0t
LQo+PiB2MjoKPj4gLSBjb3ZlciBmMmZzX3plcm9fcG9zdF9lb2ZfcGFnZSB3LyBpbnZhbGlkYXRl
X2xvY2sKPj4gIGZzL2YyZnMvZmlsZS5jIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCj4+Cj4+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+IGluZGV4IDZiZDNk
ZTY0ZjJhOC4uZWU1ZTY2MmQyYTRjIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+PiAr
KysgYi9mcy9mMmZzL2ZpbGUuYwo+PiBAQCAtMzUsNiArMzUsMTcgQEAKPj4gICNpbmNsdWRlIDx0
cmFjZS9ldmVudHMvZjJmcy5oPgo+PiAgI2luY2x1ZGUgPHVhcGkvbGludXgvZjJmcy5oPgo+Pgo+
PiArc3RhdGljIHZvaWQgZjJmc196ZXJvX3Bvc3RfZW9mX3BhZ2Uoc3RydWN0IGlub2RlICppbm9k
ZSwgbG9mZl90IG5ld19zaXplKQo+PiArewo+PiArICAgICAgIGxvZmZfdCBvbGRfc2l6ZSA9IGlf
c2l6ZV9yZWFkKGlub2RlKTsKPj4gKwo+PiArICAgICAgIGlmIChvbGRfc2l6ZSA+IG5ld19zaXpl
KQo+IEhpIENoYW8sCj4gc2hvdWxkIGl0IGJlIG9sZF9zaXplID49IG5ld19zaXplPwoKWmhpZ3Vv
LAoKWWVzLCB5b3UncmUgcmlnaHQuCgo+IAo+PiArICAgICAgICAgICAgICAgcmV0dXJuOwo+PiAr
Cj4+ICsgICAgICAgLyogemVybyBvciBkcm9wIHBhZ2VzIG9ubHkgaW4gcmFuZ2Ugb2YgW29sZF9z
aXplLCBuZXdfc2l6ZV0gKi8KPj4gKyAgICAgICB0cnVuY2F0ZV9wYWdlY2FjaGUoaW5vZGUsIG9s
ZF9zaXplKTsKPj4gK30KPj4gKwo+PiAgc3RhdGljIHZtX2ZhdWx0X3QgZjJmc19maWxlbWFwX2Zh
dWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+PiAgewo+PiAgICAgICAgIHN0cnVjdCBpbm9kZSAq
aW5vZGUgPSBmaWxlX2lub2RlKHZtZi0+dm1hLT52bV9maWxlKTsKPj4gQEAgLTEwMyw4ICsxMTQs
MTMgQEAgc3RhdGljIHZtX2ZhdWx0X3QgZjJmc192bV9wYWdlX21rd3JpdGUoc3RydWN0IHZtX2Zh
dWx0ICp2bWYpCj4+Cj4+ICAgICAgICAgZjJmc19idWdfb24oc2JpLCBmMmZzX2hhc19pbmxpbmVf
ZGF0YShpbm9kZSkpOwo+Pgo+PiArICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV9sb2NrKGlub2Rl
LT5pX21hcHBpbmcpOwo+PiArICAgICAgIGYyZnNfemVyb19wb3N0X2VvZl9wYWdlKGlub2RlLCAo
Zm9saW8tPmluZGV4ICsgMSkgPDwgUEFHRV9TSElGVCk7Cj4+ICsgICAgICAgZmlsZW1hcF9pbnZh
bGlkYXRlX3VubG9jayhpbm9kZS0+aV9tYXBwaW5nKTsKPj4gKwo+PiAgICAgICAgIGZpbGVfdXBk
YXRlX3RpbWUodm1mLT52bWEtPnZtX2ZpbGUpOwo+PiAgICAgICAgIGZpbGVtYXBfaW52YWxpZGF0
ZV9sb2NrX3NoYXJlZChpbm9kZS0+aV9tYXBwaW5nKTsKPj4gKwo+PiAgICAgICAgIGZvbGlvX2xv
Y2soZm9saW8pOwo+PiAgICAgICAgIGlmICh1bmxpa2VseShmb2xpby0+bWFwcGluZyAhPSBpbm9k
ZS0+aV9tYXBwaW5nIHx8Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGZvbGlvX3Bvcyhmb2xp
bykgPiBpX3NpemVfcmVhZChpbm9kZSkgfHwKPj4gQEAgLTExMDksNiArMTEyNSw4IEBAIGludCBm
MmZzX3NldGF0dHIoc3RydWN0IG1udF9pZG1hcCAqaWRtYXAsIHN0cnVjdCBkZW50cnkgKmRlbnRy
eSwKPj4gICAgICAgICAgICAgICAgIGYyZnNfZG93bl93cml0ZSgmZmktPmlfZ2NfcndzZW1bV1JJ
VEVdKTsKPj4gICAgICAgICAgICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV9sb2NrKGlub2RlLT5p
X21hcHBpbmcpOwo+Pgo+PiArICAgICAgICAgICAgICAgaWYgKGF0dHItPmlhX3NpemUgPiBvbGRf
c2l6ZSkKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZjJmc196ZXJvX3Bvc3RfZW9mX3BhZ2Uo
aW5vZGUsIG9sZF9zaXplKTsKPiBJJ20gYSBsaXR0bGUgc3VzcGljaW91cyBhYm91dCB0aGUgbG9n
aWMgaGVyZe+8jCBoZXJlIG9sZF9zaXplIGlzIGZyb20KPiBpX3NpemVfcmVhZChpbm9kZSksCj4g
YW5kIGl0IHdpbGwgY29tcGFyZSB3aXRoIHRoZSAib2xkX3NpemUiIGluIGYyZnNfemVyb19wb3N0
X2VvZl9wYWdlLCBpdAo+IGlzIGFsc28gZnJvbSBpX3NpemVfcmVhZChpbm9kZSksCj4gc28gaXMg
dGhpcyBhY3R1YWxseSBtZWFuaW5nbGVzcz8KCk9oLCBJIG5lZWQgdG8gcGFzcyBhdHRyLT5pYV9z
aXplIGluc3RlYWQgb2Ygb2xkX3NpemUuCgpMZXQgbWUgcmV2aXNlIGluIHYzLCBhbnl3YXksIHRo
YW5rcyBmb3IgdGhlIHJldmlldy4KClRoYW5rcywKCj4gVGhhbmtzIQo+PiAgICAgICAgICAgICAg
ICAgdHJ1bmNhdGVfc2V0c2l6ZShpbm9kZSwgYXR0ci0+aWFfc2l6ZSk7Cj4+Cj4+ICAgICAgICAg
ICAgICAgICBpZiAoYXR0ci0+aWFfc2l6ZSA8PSBvbGRfc2l6ZSkKPj4gQEAgLTEyMjcsNiArMTI0
NSwxMCBAQCBzdGF0aWMgaW50IGYyZnNfcHVuY2hfaG9sZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBs
b2ZmX3Qgb2Zmc2V0LCBsb2ZmX3QgbGVuKQo+PiAgICAgICAgIGlmIChyZXQpCj4+ICAgICAgICAg
ICAgICAgICByZXR1cm4gcmV0Owo+Pgo+PiArICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV9sb2Nr
KGlub2RlLT5pX21hcHBpbmcpOwo+PiArICAgICAgIGYyZnNfemVyb19wb3N0X2VvZl9wYWdlKGlu
b2RlLCBvZmZzZXQgKyBsZW4pOwo+PiArICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV91bmxvY2so
aW5vZGUtPmlfbWFwcGluZyk7Cj4+ICsKPj4gICAgICAgICBwZ19zdGFydCA9ICgodW5zaWduZWQg
bG9uZyBsb25nKSBvZmZzZXQpID4+IFBBR0VfU0hJRlQ7Cj4+ICAgICAgICAgcGdfZW5kID0gKCh1
bnNpZ25lZCBsb25nIGxvbmcpIG9mZnNldCArIGxlbikgPj4gUEFHRV9TSElGVDsKPj4KPj4gQEAg
LTE1MTAsNiArMTUzMiw4IEBAIHN0YXRpYyBpbnQgZjJmc19kb19jb2xsYXBzZShzdHJ1Y3QgaW5v
ZGUgKmlub2RlLCBsb2ZmX3Qgb2Zmc2V0LCBsb2ZmX3QgbGVuKQo+PiAgICAgICAgIGYyZnNfZG93
bl93cml0ZSgmRjJGU19JKGlub2RlKS0+aV9nY19yd3NlbVtXUklURV0pOwo+PiAgICAgICAgIGZp
bGVtYXBfaW52YWxpZGF0ZV9sb2NrKGlub2RlLT5pX21hcHBpbmcpOwo+Pgo+PiArICAgICAgIGYy
ZnNfemVyb19wb3N0X2VvZl9wYWdlKGlub2RlLCBvZmZzZXQgKyBsZW4pOwo+PiArCj4+ICAgICAg
ICAgZjJmc19sb2NrX29wKHNiaSk7Cj4+ICAgICAgICAgZjJmc19kcm9wX2V4dGVudF90cmVlKGlu
b2RlKTsKPj4gICAgICAgICB0cnVuY2F0ZV9wYWdlY2FjaGUoaW5vZGUsIG9mZnNldCk7Cj4+IEBA
IC0xNjMxLDYgKzE2NTUsMTAgQEAgc3RhdGljIGludCBmMmZzX3plcm9fcmFuZ2Uoc3RydWN0IGlu
b2RlICppbm9kZSwgbG9mZl90IG9mZnNldCwgbG9mZl90IGxlbiwKPj4gICAgICAgICBpZiAocmV0
KQo+PiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4KPj4gKyAgICAgICBmaWxlbWFwX2lu
dmFsaWRhdGVfbG9jayhtYXBwaW5nKTsKPj4gKyAgICAgICBmMmZzX3plcm9fcG9zdF9lb2ZfcGFn
ZShpbm9kZSwgb2Zmc2V0ICsgbGVuKTsKPj4gKyAgICAgICBmaWxlbWFwX2ludmFsaWRhdGVfdW5s
b2NrKG1hcHBpbmcpOwo+PiArCj4+ICAgICAgICAgcGdfc3RhcnQgPSAoKHVuc2lnbmVkIGxvbmcg
bG9uZykgb2Zmc2V0KSA+PiBQQUdFX1NISUZUOwo+PiAgICAgICAgIHBnX2VuZCA9ICgodW5zaWdu
ZWQgbG9uZyBsb25nKSBvZmZzZXQgKyBsZW4pID4+IFBBR0VfU0hJRlQ7Cj4+Cj4+IEBAIC0xNzYy
LDYgKzE3OTAsOCBAQCBzdGF0aWMgaW50IGYyZnNfaW5zZXJ0X3JhbmdlKHN0cnVjdCBpbm9kZSAq
aW5vZGUsIGxvZmZfdCBvZmZzZXQsIGxvZmZfdCBsZW4pCj4+ICAgICAgICAgLyogYXZvaWQgZ2Mg
b3BlcmF0aW9uIGR1cmluZyBibG9jayBleGNoYW5nZSAqLwo+PiAgICAgICAgIGYyZnNfZG93bl93
cml0ZSgmRjJGU19JKGlub2RlKS0+aV9nY19yd3NlbVtXUklURV0pOwo+PiAgICAgICAgIGZpbGVt
YXBfaW52YWxpZGF0ZV9sb2NrKG1hcHBpbmcpOwo+PiArCj4+ICsgICAgICAgZjJmc196ZXJvX3Bv
c3RfZW9mX3BhZ2UoaW5vZGUsIG9mZnNldCArIGxlbik7Cj4+ICAgICAgICAgdHJ1bmNhdGVfcGFn
ZWNhY2hlKGlub2RlLCBvZmZzZXQpOwo+Pgo+PiAgICAgICAgIHdoaWxlICghcmV0ICYmIGlkeCA+
IHBnX3N0YXJ0KSB7Cj4+IEBAIC0xODE5LDYgKzE4NDksMTAgQEAgc3RhdGljIGludCBmMmZzX2V4
cGFuZF9pbm9kZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGxvZmZfdCBvZmZzZXQsCj4+ICAg
ICAgICAgaWYgKGVycikKPj4gICAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4+Cj4+ICsgICAg
ICAgZmlsZW1hcF9pbnZhbGlkYXRlX2xvY2soaW5vZGUtPmlfbWFwcGluZyk7Cj4+ICsgICAgICAg
ZjJmc196ZXJvX3Bvc3RfZW9mX3BhZ2UoaW5vZGUsIG9mZnNldCArIGxlbik7Cj4+ICsgICAgICAg
ZmlsZW1hcF9pbnZhbGlkYXRlX3VubG9jayhpbm9kZS0+aV9tYXBwaW5nKTsKPj4gKwo+PiAgICAg
ICAgIGYyZnNfYmFsYW5jZV9mcyhzYmksIHRydWUpOwo+Pgo+PiAgICAgICAgIHBnX3N0YXJ0ID0g
KCh1bnNpZ25lZCBsb25nIGxvbmcpb2Zmc2V0KSA+PiBQQUdFX1NISUZUOwo+PiBAQCAtNDg2MCw2
ICs0ODk0LDEwIEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNfd3JpdGVfY2hlY2tzKHN0cnVjdCBraW9j
YiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICpmcm9tKQo+PiAgICAgICAgIGVyciA9IGZpbGVfbW9k
aWZpZWQoZmlsZSk7Cj4+ICAgICAgICAgaWYgKGVycikKPj4gICAgICAgICAgICAgICAgIHJldHVy
biBlcnI7Cj4+ICsKPj4gKyAgICAgICBmaWxlbWFwX2ludmFsaWRhdGVfbG9jayhpbm9kZS0+aV9t
YXBwaW5nKTsKPj4gKyAgICAgICBmMmZzX3plcm9fcG9zdF9lb2ZfcGFnZShpbm9kZSwgaW9jYi0+
a2lfcG9zICsgaW92X2l0ZXJfY291bnQoZnJvbSkpOwo+PiArICAgICAgIGZpbGVtYXBfaW52YWxp
ZGF0ZV91bmxvY2soaW5vZGUtPmlfbWFwcGluZyk7Cj4+ICAgICAgICAgcmV0dXJuIGNvdW50Owo+
PiAgfQo+Pgo+PiAtLQo+PiAyLjQ5LjAKPj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
