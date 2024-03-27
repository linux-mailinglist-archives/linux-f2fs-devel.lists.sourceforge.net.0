Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8CD88D75D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Mar 2024 08:38:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rpNrz-0004rj-T1;
	Wed, 27 Mar 2024 07:38:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rpNry-0004rV-Je
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Mar 2024 07:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ItZHhOcFyzFOy1l+CkMWr2iKKkEIs5cA1g5tVStj0A=; b=Pr8jTN3jtcIDbfN8/ONbW3uyqC
 S9fQMGBAWrMOgJAkzeOsdELjEwx9dXX2jRu8OOQIVOmgmiQjjWWM2IL6clt0v0C1n1UUWrZms5dvh
 X6h99F15nUKgrV1Idqym8VM/p8TsQeSrQRixTsC20lpw99RVqxaL9NxjHtJmuZiBt+i4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7ItZHhOcFyzFOy1l+CkMWr2iKKkEIs5cA1g5tVStj0A=; b=Zh9SJL13UJmAArpZV+2q98EpzB
 RecdvMOEoJ4GbxSJOtYZY+hG2CQyOlSOrNk1KjB1C/hCwdptIg6tDKl6dN7kLrtaSCOcW+19bB2YZ
 OgGGQf4KbJ5XVOm7SAz9tHZvaeShQE5Tyh1l9FIedEFvyjiLFrxtCG6epi6RD0BV5Mz4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rpNrx-0003KE-W4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Mar 2024 07:38:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8580ECE253F;
 Wed, 27 Mar 2024 07:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2177AC433C7;
 Wed, 27 Mar 2024 07:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711525118;
 bh=vOZBAan2Cx/wF+uoGUYShV+giAfOXpqrqoKkEy8CSw4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YhIgEMST9xtsM1kuUIFnjNtUlS4bDEW6Xe7XuLJyuMAL4l/C4BzzYnGQMLFFSXifX
 T56E0U7fOGPEpCT4v+pukG+27VYedgBlhWMHVpQlr93mo0dY/Q+ej62gxaIikCMki8
 KhU7sjFmeAmQV36czX5Hn8OXp3TjilAKWrpY3cHVgF0/RBujgNRK5n9iK/g0VuLORF
 vpEjbeC/UKNdlxboX4DNdbe2e3zVW3wAfYHNwqeS7eNDLVB5B3la2e2Eh4GRddXHSL
 G6VsUI32rqktTFO3wyhcsxnL3IB36I/CRR2tH+POgAyBYaYrpjp6K2HWktfBvNZqdC
 +l1RPXcC3DBUw==
Message-ID: <0ed07576-256c-4ed7-8ddc-33ed788a45ac@kernel.org>
Date: Wed, 27 Mar 2024 15:38:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1711346195-24555-1-git-send-email-zhiguo.niu@unisoc.com>
 <8a6b2768-8ab6-4275-8c4e-05b4eca83987@kernel.org>
 <CAHJ8P3J3xK2uz7egvShyCeAjGFJ87AvqKxVN=NFiKDgMLMJDPg@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3J3xK2uz7egvShyCeAjGFJ87AvqKxVN=NFiKDgMLMJDPg@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/3/27 9:26, Zhiguo Niu wrote: > On Tue, Mar 26, 2024
    at 7:11 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2024/3/25 13:56, Zhiguo
    Niu wrote: >>> A length that exceeds the real size of the ino [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rpNrx-0003KE-W4
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix to adjust appropirate
 defragment pg_end
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8zLzI3IDk6MjYsIFpoaWd1byBOaXUgd3JvdGU6Cj4gT24gVHVlLCBNYXIgMjYsIDIw
MjQgYXQgNzoxMeKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9u
IDIwMjQvMy8yNSAxMzo1NiwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+IEEgbGVuZ3RoIHRoYXQgZXhj
ZWVkcyB0aGUgcmVhbCBzaXplIG9mIHRoZSBpbm9kZSBtYXkgYmUKPj4+IHNwZWNpZmllZCBmcm9t
IHVzZXIsIGFsdGhvdWdoIHRoZXNlIG91dC1vZi1yYW5nZSBhcmVhcwo+Pj4gYXJlIG5vdCBtYXBw
ZWQsIGJ1dCB0aGV5IHN0aWxsIG5lZWQgdG8gYmUgY2hlY2sgaW4KPj4+IHdoaWxlIGxvb3AsIHdo
aWNoIGlzIHVubmVjZXNzYXJ5Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpo
aWd1by5uaXVAdW5pc29jLmNvbT4KPj4+IC0tLQo+Pj4gdjI6IGNoZWNrIGlfc2l6ZSB3aXRoaW4g
aW5vZGUgbG9jayBhY2NvcmRpbmcgdG8gQ2hhbydzIHN1Z2dlc3Rpb25zCj4+PiAtLS0KPj4+IC0t
LQo+Pj4gICAgZnMvZjJmcy9maWxlLmMgfCAxMSArKysrKysrLS0tLQo+Pj4gICAgMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4gaW5kZXggMTI4ZTUzZC4uY2Y2
M2RiNyAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+PiArKysgYi9mcy9mMmZzL2Zp
bGUuYwo+Pj4gQEAgLTI2MDgsOSArMjYwOCw2IEBAIHN0YXRpYyBpbnQgZjJmc19kZWZyYWdtZW50
X3JhbmdlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+ICAgICAgICBib29sIGZyYWdtZW50
ZWQgPSBmYWxzZTsKPj4+ICAgICAgICBpbnQgZXJyOwo+Pj4KPj4+IC0gICAgIHBnX3N0YXJ0ID0g
cmFuZ2UtPnN0YXJ0ID4+IFBBR0VfU0hJRlQ7Cj4+PiAtICAgICBwZ19lbmQgPSAocmFuZ2UtPnN0
YXJ0ICsgcmFuZ2UtPmxlbikgPj4gUEFHRV9TSElGVDsKPj4+IC0KPj4+ICAgICAgICBmMmZzX2Jh
bGFuY2VfZnMoc2JpLCB0cnVlKTsKPj4+Cj4+PiAgICAgICAgaW5vZGVfbG9jayhpbm9kZSk7Cj4+
PiBAQCAtMjYyOSwxMCArMjYyNiwxNiBAQCBzdGF0aWMgaW50IGYyZnNfZGVmcmFnbWVudF9yYW5n
ZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+Cj4+IHBnX3N0YXJ0ID0gcmFuZ2UtPnN0YXJ0
ID4+IFBBR0VfU0hJRlQ7Cj4+IHBnX2VuZCA9IG1pbl90KHBnb2ZmX3QsIChyYW5nZS0+c3RhcnQg
KyByYW5nZS0+bGVuKSA+PiBQQUdFX1NISUZULAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
RElWX1JPVU5EX1VQKGlfc2l6ZV9yZWFkKGlub2RlKSwgUEFHRV9TSVpFKSk7Cj4+Cj4+Pgo+Pj4g
ICAgICAgIC8qIHdyaXRlYmFjayBhbGwgZGlydHkgcGFnZXMgaW4gdGhlIHJhbmdlICovCj4+PiAg
ICAgICAgZXJyID0gZmlsZW1hcF93cml0ZV9hbmRfd2FpdF9yYW5nZShpbm9kZS0+aV9tYXBwaW5n
LCByYW5nZS0+c3RhcnQsCj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmFuZ2UtPnN0YXJ0ICsgcmFuZ2UtPmxlbiAtIDEpOwo+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1pbl90KGxvZmZfdCwgcmFuZ2UtPnN0
YXJ0ICsgcmFuZ2UtPmxlbiAtIDEsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaV9zaXplX3JlYWQoaW5vZGUpIC0gMSkpOwo+Pgo+PiAsIHBnX3N0YXJ0
IDw8IFBBR0VfU0hJRlQgLSAxLCBwZ19lbmQgPDwgUEFHRV9TSElGVCAtIDEpOyA/Cj4gc2hvdWxk
IGJlICBwZ19zdGFydCA8PCBQQUdFX1NISUZUICwgcGdfZW5kIDw8IFBBR0VfU0hJRlQgLSAxKT8/
CgpPaCwgeWVzLiA6KQoKVGhhbmtzLAoKPiBpZiByYW5nZS5zdGFydD0wLCBwZ19zdGFydCBpcyBh
bHNvIDAsIGxzdGFydCBpbgo+IGZpbGVtYXBfd3JpdGVfYW5kX3dhaXRfcmFuZ2UgaXMgMCwKPiBi
dXQgcGdfc3RhcnQgPDwgUEFHRV9TSElGVCAtIDEgd2lsbCBnZXQgbHN0YXJ0PS0xPwo+IHRoYW5r
c++8gQo+Pgo+PiBUaGFua3MsCj4+Cj4+PiAgICAgICAgaWYgKGVycikKPj4+ICAgICAgICAgICAg
ICAgIGdvdG8gb3V0Owo+Pj4KPj4+ICsgICAgIHBnX3N0YXJ0ID0gcmFuZ2UtPnN0YXJ0ID4+IFBB
R0VfU0hJRlQ7Cj4+PiArICAgICBwZ19lbmQgPSBtaW5fdChwZ29mZl90LAo+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgKHJhbmdlLT5zdGFydCArIHJhbmdlLT5sZW4pID4+IFBBR0Vf
U0hJRlQsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBESVZfUk9VTkRfVVAoaV9z
aXplX3JlYWQoaW5vZGUpLCBQQUdFX1NJWkUpKTsKPj4+ICsKPj4+ICAgICAgICAvKgo+Pj4gICAg
ICAgICAqIGxvb2t1cCBtYXBwaW5nIGluZm8gaW4gZXh0ZW50IGNhY2hlLCBza2lwIGRlZnJhZ21l
bnRpbmcgaWYgcGh5c2ljYWwKPj4+ICAgICAgICAgKiBibG9jayBhZGRyZXNzZXMgYXJlIGNvbnRp
bnVvdXMuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
