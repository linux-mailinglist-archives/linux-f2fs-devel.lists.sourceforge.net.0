Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C5FAD85F6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 10:49:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7mjW4tfRE3XAa02gpqvWJCbqS+gz+Z05Aq7/0/OjxA=; b=BeZt1+uMbKBzsBqaoXHBLlbrQa
	bS2kK+sLo0irPR1yljGNPoznRizalSK/5j1gQA/OAsVu9B0SVaH3omOFqK7Ism6IeTNl5PffmD6o0
	dUb6niXMtpcP3zD0Agacn35oP1YVtMl7ljD6BlezKXwCSP2KWRGq2jq7Qkv4as7EVvnk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uQ066-00063U-81;
	Fri, 13 Jun 2025 08:49:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uQ064-00063F-Uk
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 08:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9MXMaprog7esgRngG7B17YYQATaWrwY4vsk+8kBjFLM=; b=hmMyw2rcMEYoggL7avnhoczUJr
 /mgpn8gzs7m6FR3IwXX1PPGTZPLPH02TUusSHMADXqm8Ur2U4U4nMmjXRy5olt6SsoMc4uF1d3Wwh
 bZ/OLOrqAnd8BEeKjq4cVtdbAzefVgOS8P6IyKTtaQZ+CLqiCCySjdt5i46ursbBw4os=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9MXMaprog7esgRngG7B17YYQATaWrwY4vsk+8kBjFLM=; b=TNmNHdYKKvZiRpmjk9myaiLt1t
 oyEtE85JQx+l/kkn8TFdaDDsHJGUIj4mPYDqyaUs0yWNYKC505JIZavpxbUKcCy6WYEJEZcEOhxVl
 V+phtjNiZDRC/tN6MW9WrurKakIEU3pSs9+q+cI/75MtwB26/a0RuwsyrdKiuTaK3gdE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uQ064-0004bt-9y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 08:49:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 490845C4600;
 Fri, 13 Jun 2025 08:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2679BC4CEE3;
 Fri, 13 Jun 2025 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749804541;
 bh=u7x16W5kMhuO8mP73I83fX0Qfs/D8SHE0KX4Q48Oks4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=u9KNX1kyhxLrcRKV+BaqoAHpw8g08yiQNw6sCBxBOcU/6FRYDtY1+vAzEE7lwOSnt
 12MYGMa17cjhZNQX+0Qr1FzeSN0rxo3/5Mv8S94RLxnbDQaA9vBG/EOsJEsTYbYM2P
 V9pRionuNZtVbZQql/dAuhVJ+acNjYSXQRoX18vu3U+nds1vJ4mtRIet490xhi2Z52
 jIBcgNOWg23HQBXj4zBw0sqnYo/VvPJaKH5W3eEo1KyZM9pkgSpBVJNZxwhBRPI+lQ
 3+9dsV/i0988EswF8HbtjH1nfqQDqnJ8LAD2BdnZmhTjlIbGX/a2ZoD2gJQ3QNBY7f
 NitUwarcD28/Q==
Message-ID: <12dc51f7-a765-4995-bf6d-8abe973f4ea1@kernel.org>
Date: Fri, 13 Jun 2025 16:49:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>, wangzijie <wangzijie1@honor.com>
References: <f1b9209e-c2fb-4a53-8d15-a3e42dea8bca@kernel.org>
 <20250612123444.1779509-1-wangzijie1@honor.com>
 <CAHJ8P3LSxzSbdz_ONUKy8dyDjLGsNJ08Aq724CUwYdOJ=m_2eA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3LSxzSbdz_ONUKy8dyDjLGsNJ08Aq724CUwYdOJ=m_2eA@mail.gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/6/13 16:25, Zhiguo Niu wrote: > wangzijie <wangzijie1@honor.com>
    于2025年6月12日周四 20:38写道： >> >>> On 6/12/25 11:27, wangzijie
    wrote: >>>> Wu Bo once mentioned a fallocate fail s [...] 
 
 Content analysis details:   (-0.3 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uQ064-0004bt-9y
Subject: Re: [f2fs-dev] [PATCH] f2fs: continue to allocate pinned section
 when gc happens EAGAIN
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
Cc: feng.han@honor.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, bo.wu@vivo.com, jaegeuk@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS82LzEzIDE2OjI1LCBaaGlndW8gTml1IHdyb3RlOgo+IHdhbmd6aWppZSA8d2FuZ3pp
amllMUBob25vci5jb20+IOS6jjIwMjXlubQ25pyIMTLml6Xlkajlm5sgMjA6MzjlhpnpgZPvvJoK
Pj4KPj4+IE9uIDYvMTIvMjUgMTE6MjcsIHdhbmd6aWppZSB3cm90ZToKPj4+PiBXdSBCbyBvbmNl
IG1lbnRpb25lZCBhIGZhbGxvY2F0ZSBmYWlsIHNjZW5hcmlvIGluIHRoaXMgbGlua1sxXS4KPj4+
PiBBZnRlciBjb21taXQgM2ZkZDg5YjQ1MmMyKCJmMmZzOiBwcmV2ZW50IHdyaXRpbmcgd2l0aG91
dCBmYWxsb2NhdGUoKQo+Pj4+IGZvciBwaW5uZWQgZmlsZXMiKSwgd2UgY2Fubm90IGRpcmVjdGx5
IGdlbmVyYXRlIDRLIHNpemUgZmlsZSBhbmQKPj4+PiBwaW4gaXQsIGJ1dCB3ZSBjYW4gc3RpbGwg
Z2VuZXJhdGUgbm9uLXNlZ21lbnQgYWxpZ25lZCBwaW5uZWQgZmlsZToKPj4+Pgo+Pj4+IHRvdWNo
IHRlc3RfZmlsZQo+Pj4+IC4vZjJmc19pbyBwaW5maWxlIHNldCB0ZXN0X2ZpbGUKPj4+PiAuL2Yy
ZnNfaW8gZmFsbG9jYXRlIDAgMCA4MTkyIHRlc3RfZmlsZQo+Pj4+IHRydW5jYXRlIC1zIDQwOTYg
dGVzdF9maWxlCj4+Pgo+Pj4gV2VsbCwgc2hvdWxkbid0IHdlIGF2b2lkIHN1Y2ggY2FzZSBieSBh
ZGRpbmcgY2hlY2sgY29uZGl0aW9uIGluIHNldGF0dHI/Cj4+Cj4+IE1heWJlIGxpa2UgdGhpcz8K
Pj4KPj4gLS0tCj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5j
Cj4+IGluZGV4IDZiZDNkZTY0Zi4uMmY2NTM3ZDljIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2Zp
bGUuYwo+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+PiBAQCAtMTAyNyw2ICsxMDI3LDggQEAgaW50
IGYyZnNfc2V0YXR0cihzdHJ1Y3QgbW50X2lkbWFwICppZG1hcCwgc3RydWN0IGRlbnRyeSAqZGVu
dHJ5LAo+PiAgICAgICAgICBzdHJ1Y3QgaW5vZGUgKmlub2RlID0gZF9pbm9kZShkZW50cnkpOwo+
PiAgICAgICAgICBzdHJ1Y3QgZjJmc19pbm9kZV9pbmZvICpmaSA9IEYyRlNfSShpbm9kZSk7Cj4+
ICAgICAgICAgIGludCBlcnI7Cj4+ICsgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0g
RjJGU19JX1NCKGlub2RlKTsKPj4gKyAgICAgICBibG9ja190IHNlY19ibGtzID0gQ0FQX0JMS1Nf
UEVSX1NFQyhzYmkpOwo+Pgo+PiAgICAgICAgICBpZiAodW5saWtlbHkoZjJmc19jcF9lcnJvcihG
MkZTX0lfU0IoaW5vZGUpKSkpCj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU87Cj4+IEBA
IC0xMDQ3LDYgKzEwNDksMTEgQEAgaW50IGYyZnNfc2V0YXR0cihzdHJ1Y3QgbW50X2lkbWFwICpp
ZG1hcCwgc3RydWN0IGRlbnRyeSAqZGVudHJ5LAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
IUlTX0FMSUdORUQoYXR0ci0+aWFfc2l6ZSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIEYy
RlNfQkxLX1RPX0JZVEVTKGZpLT5pX2NsdXN0ZXJfc2l6ZSkpKQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+ICsgICAgICAgICAgICAgICBpZiAoZjJmc19pc19w
aW5uZWRfZmlsZShpbm9kZSkgJiYKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgYXR0ci0+aWFf
c2l6ZSA8IGlfc2l6ZV9yZWFkKGlub2RlKSAmJgo+PiArICAgICAgICAgICAgICAgICAgICAgICAh
SVNfQUxJR05FRChhdHRyLT5pYV9zaXplLAo+PiArICAgICAgICAgICAgICAgICAgICAgICBGMkZT
X0JMS19UT19CWVRFUyhzZWNfYmxrcykpKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gSGkgQ2hhbyBhbmQgemlqaWUsCj4gRXhjdXNlIG1lICxJJ20gYSBiaXQg
Y29uZnVzZWQgYWJvdXQgdGhpczoKPiB3aGVuIGEgcGluIGZpbGUgc2l6ZSBpcyBub3QgYWxpbmdl
ZCB3aXRoIHNpemUgb2YgInNlY3Rpb24iLCBpdCBjYW4gbm90Cj4gYmUgdHJ1bmNhdGVkPwoKSU1P
LCB0aGUgcGlubmVkIGZpbGUgY2FuIG9ubHkgYmUgdHJ1bmNhdGVkIHRvIHNlY3Rpb24tYWxpZ25l
ZCBzaXplLgoKVGhhbmtzCgo+IHRoYW5rc++8gQo+PiAgICAgICAgICB9Cj4+Cj4+ICAgICAgICAg
IGVyciA9IHNldGF0dHJfcHJlcGFyZShpZG1hcCwgZGVudHJ5LCBhdHRyKTsKPj4gLS0tCj4+Cj4+
Pj4KPj4+PiBCeSBkb2luZyB0aGlzLCBwaW4rZmFsbG9jYXRlIGZhaWx1cmUoZ2MgaGFwcGVucyBF
QUdBSU4gYnV0IGYyZnMgc2hvd3MKPj4+PiBlbm91Z2ggc3BhcmUgc3BhY2UpIG1heSBvY2N1cnMu
Cj4+Pj4KPj4+PiAgRnJvbSBtZXNzYWdlIGluIGNvbW1pdCAyZTQyYjdmODE3YWMoImYyZnM6IHN0
b3AgYWxsb2NhdGluZyBwaW5uZWQgc2VjdGlvbnMKPj4+PiBpZiBFQUdBSU4gaGFwcGVucyIpLCBn
YyBFQUdBSU4gZG9lc24ndCBndWFyYW50ZWUgYSBmcmVlIHNlY3Rpb24sIHNvIHdlIHN0b3AKPj4+
PiBhbGxvY2F0aW5nLiBCdXQgYWZ0ZXIgY29tbWl0IDQ4ZWE4YjIwMDQxNCAoImYyZnM6IGZpeCB0
byBhdm9pZCBwYW5pYyBvbmNlCj4+Pj4gZmFsbG9jYXRpb24gZmFpbHMgZm9yIHBpbmZpbGUiKSwg
d2UgaGF2ZSBhIHdheSB0byBhdm9pZCBwYW5pYyBjYXVzZWQgYnkKPj4+PiBjb25jdXJyZW50IHBp
bmZpbGUgYWxsb2NhdGlvbiBydW4gb3V0IG9mIGZyZWUgc2VjdGlvbiwgc28gSSB0aGluayB0aGF0
IHdlCj4+Pj4gY2FuIGNvbnRpbnVlIHRvIGFsbG9jYXRlIHBpbm5lZCBzZWN0aW9uIHdoZW4gZ2Mg
aGFwcGVucyBFQUdBSU4uIEV2ZW4gaWYgd2UKPj4+PiBkb24ndCBoYXZlIGZyZWUgc2VjdGlvbiwg
ZjJmc19hbGxvY2F0ZV9waW5uaW5nX3NlY3Rpb24oKSBjYW4gZmFpbCB3aXRoIEVOT1NQQy4KPj4+
Cj4+PiBXaGF0IGRvIHlvdSB0aGluayBvZiBpbnRyb2R1Y2UgL3N5cy9mcy9mMmZzLzxkZXY+L3Jl
c2VydmVkX3Bpbl9zZWN0aW9uIHRvCj4+PiB0dW5lIEBuZWVkZWQgcGFyYW1ldGVyIG9mIGhhc19u
b3RfZW5vdWdoX2ZyZWVfc2VjcygpPyBJZiB3ZSBjb25maWd1cmUgaXQKPj4+IHcvIHplcm8sIGl0
IGNhbiBhdm9pZCBmMmZzX2djKCkgYmVmb3JlIHByZWFsbG9jYXRpb24uCj4+Pgo+Pj4gLS0tCj4+
PiAgIGZzL2YyZnMvZjJmcy5oICB8IDMgKysrCj4+PiAgIGZzL2YyZnMvZmlsZS5jICB8IDUgKyst
LS0KPj4+ICAgZnMvZjJmcy9zdXBlci5jIHwgMyArKysKPj4+ICAgZnMvZjJmcy9zeXNmcy5jIHwg
OSArKysrKysrKysKPj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMv
ZjJmcy5oCj4+PiBpbmRleCA3ODU1Mzc1NzZhYTguLmZmYjE1ZGE1NzBkNyAxMDA2NDQKPj4+IC0t
LSBhL2ZzL2YyZnMvZjJmcy5oCj4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+Pj4gQEAgLTE3MzEs
NiArMTczMSw5IEBAIHN0cnVjdCBmMmZzX3NiX2luZm8gewo+Pj4gICAgICAgIC8qIGZvciBza2lw
IHN0YXRpc3RpYyAqLwo+Pj4gICAgICAgIHVuc2lnbmVkIGxvbmcgbG9uZyBza2lwcGVkX2djX3J3
c2VtOyAgICAgICAgICAgIC8qIEZHX0dDIG9ubHkgKi8KPj4+Cj4+PiArICAgICAvKiBmcmVlIHNl
Y3Rpb25zIHJlc2VydmVkIGZvciBwaW5uZWQgZmlsZSAqLwo+Pj4gKyAgICAgdW5zaWduZWQgaW50
IHJlc2VydmVkX3Bpbl9zZWN0aW9uOwo+Pj4gKwo+Pj4gICAgICAgIC8qIHRocmVzaG9sZCBmb3Ig
Z2MgdHJpYWxzIG9uIHBpbm5lZCBmaWxlcyAqLwo+Pj4gICAgICAgIHVuc2lnbmVkIHNob3J0IGdj
X3Bpbl9maWxlX3RocmVzaG9sZDsKPj4+ICAgICAgICBzdHJ1Y3QgZjJmc19yd3NlbSBwaW5fc2Vt
Owo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPj4+IGlu
ZGV4IDY5NjEzMWU2NTVlZC4uYTkwOWY3OWRiMTc4IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9m
aWxlLmMKPj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+PiBAQCAtMTg4Nyw5ICsxODg3LDggQEAg
c3RhdGljIGludCBmMmZzX2V4cGFuZF9pbm9kZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGxv
ZmZfdCBvZmZzZXQsCj4+PiAgICAgICAgICAgICAgICAgICAgICAgIH0KPj4+ICAgICAgICAgICAg
ICAgIH0KPj4+Cj4+PiAtICAgICAgICAgICAgIGlmIChoYXNfbm90X2Vub3VnaF9mcmVlX3NlY3Mo
c2JpLCAwLCBmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpID8KPj4+IC0gICAgICAgICAgICAgICAg
ICAgICBaT05FRF9QSU5fU0VDX1JFUVVJUkVEX0NPVU5UIDoKPj4+IC0gICAgICAgICAgICAgICAg
ICAgICBHRVRfU0VDX0ZST01fU0VHKHNiaSwgb3ZlcnByb3Zpc2lvbl9zZWdtZW50cyhzYmkpKSkp
IHsKPj4+ICsgICAgICAgICAgICAgaWYgKGhhc19ub3RfZW5vdWdoX2ZyZWVfc2VjcyhzYmksIDAs
Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzYmktPnJlc2VydmVkX3Bpbl9zZWN0
aW9uKSkgewo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2Rvd25fd3JpdGUoJnNiaS0+
Z2NfbG9jayk7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgIHN0YXRfaW5jX2djX2NhbGxfY291
bnQoc2JpLCBGT1JFR1JPVU5EKTsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gZjJm
c19nYyhzYmksICZnY19jb250cm9sKTsKPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMg
Yi9mcy9mMmZzL3N1cGVyLmMKPj4+IGluZGV4IDU3YWRlZmY1ZWYyNS4uNDhiOTdhOTVmZDYzIDEw
MDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMK
Pj4+IEBAIC00OTc1LDYgKzQ5NzUsOSBAQCBzdGF0aWMgaW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1
Y3Qgc3VwZXJfYmxvY2sgKnNiLCBzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCj4+PiAgICAgICAgc2Jp
LT5sYXN0X3ZhbGlkX2Jsb2NrX2NvdW50ID0gc2JpLT50b3RhbF92YWxpZF9ibG9ja19jb3VudDsK
Pj4+ICAgICAgICBzYmktPnJlc2VydmVkX2Jsb2NrcyA9IDA7Cj4+PiAgICAgICAgc2JpLT5jdXJy
ZW50X3Jlc2VydmVkX2Jsb2NrcyA9IDA7Cj4+PiArICAgICBzYmktPnJlc2VydmVkX3Bpbl9zZWN0
aW9uID0gZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSA/Cj4+PiArICAgICAgICAgICAgICAgICAg
ICAgWk9ORURfUElOX1NFQ19SRVFVSVJFRF9DT1VOVCA6Cj4+PiArICAgICAgICAgICAgICAgICAg
ICAgR0VUX1NFQ19GUk9NX1NFRyhzYmksIG92ZXJwcm92aXNpb25fc2VnbWVudHMoc2JpKSk7Cj4+
PiAgICAgICAgbGltaXRfcmVzZXJ2ZV9yb290KHNiaSk7Cj4+PiAgICAgICAgYWRqdXN0X3VudXNh
YmxlX2NhcF9wZXJjKHNiaSk7Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3lzZnMuYyBi
L2ZzL2YyZnMvc3lzZnMuYwo+Pj4gaW5kZXggNzUxMzRkNjlhMGJkLi41MWJlN2ZmYjM4YzUgMTAw
NjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL3N5c2ZzLmMKPj4+ICsrKyBiL2ZzL2YyZnMvc3lzZnMuYwo+
Pj4gQEAgLTgyNCw2ICs4MjQsMTMgQEAgc3RhdGljIHNzaXplX3QgX19zYmlfc3RvcmUoc3RydWN0
IGYyZnNfYXR0ciAqYSwKPj4+ICAgICAgICAgICAgICAgIHJldHVybiBjb3VudDsKPj4+ICAgICAg
ICB9Cj4+Pgo+Pj4gKyAgICAgaWYgKCFzdHJjbXAoYS0+YXR0ci5uYW1lLCAicmVzZXJ2ZWRfcGlu
X3NlY3Rpb24iKSkgewo+Pj4gKyAgICAgICAgICAgICBpZiAodCA+IEdFVF9TRUNfRlJPTV9TRUco
c2JpLCBvdmVycHJvdmlzaW9uX3NlZ21lbnRzKHNiaSkpKQo+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+Pj4gKyAgICAgICAgICAgICAqdWkgPSAodW5zaWduZWQgaW50
KXQ7Cj4+PiArICAgICAgICAgICAgIHJldHVybiBjb3VudDsKPj4+ICsgICAgIH0KPj4+ICsKPj4+
ICAgICAgICAqdWkgPSAodW5zaWduZWQgaW50KXQ7Cj4+Pgo+Pj4gICAgICAgIHJldHVybiBjb3Vu
dDsKPj4+IEBAIC0xMTMwLDYgKzExMzcsNyBAQCBGMkZTX1NCSV9HRU5FUkFMX1JPX0FUVFIodW51
c2FibGVfYmxvY2tzX3Blcl9zZWMpOwo+Pj4gICBGMkZTX1NCSV9HRU5FUkFMX1JXX0FUVFIoYmxr
em9uZV9hbGxvY19wb2xpY3kpOwo+Pj4gICAjZW5kaWYKPj4+ICAgRjJGU19TQklfR0VORVJBTF9S
V19BVFRSKGNhcnZlX291dCk7Cj4+PiArRjJGU19TQklfR0VORVJBTF9SV19BVFRSKHJlc2VydmVk
X3Bpbl9zZWN0aW9uKTsKPj4+Cj4+PiAgIC8qIFNUQVRfSU5GTyBBVFRSICovCj4+PiAgICNpZmRl
ZiBDT05GSUdfRjJGU19TVEFUX0ZTCj4+PiBAQCAtMTMyMyw2ICsxMzMxLDcgQEAgc3RhdGljIHN0
cnVjdCBhdHRyaWJ1dGUgKmYyZnNfYXR0cnNbXSA9IHsKPj4+ICAgICAgICBBVFRSX0xJU1QobGFz
dF9hZ2Vfd2VpZ2h0KSwKPj4+ICAgICAgICBBVFRSX0xJU1QobWF4X3JlYWRfZXh0ZW50X2NvdW50
KSwKPj4+ICAgICAgICBBVFRSX0xJU1QoY2FydmVfb3V0KSwKPj4+ICsgICAgIEFUVFJfTElTVChy
ZXNlcnZlZF9waW5fc2VjdGlvbiksCj4+PiAgICAgICAgTlVMTCwKPj4+ICAgfTsKPj4+ICAgQVRU
UklCVVRFX0dST1VQUyhmMmZzKTsKPj4+IC0tCj4+PiAyLjQ5LjAKPj4KPj4gSSB0aGluayBpdCdz
IGEgZ29vZCB3YXkgdG8gc29sdmUgdGhpcyBwcm9ibGVtLiBUaGFuayB5b3UhCj4+Cj4+Cj4+Pj4K
Pj4+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDIzMTAz
MDA5NDAyNC4yNjM3MDctMS1iby53dUB2aXZvLmNvbS90LyN1Cj4+Pj4KPj4+PiBTaWduZWQtb2Zm
LWJ5OiB3YW5nemlqaWUgPHdhbmd6aWppZTFAaG9ub3IuY29tPgo+Pj4+IC0tLQo+Pj4+ICAgZnMv
ZjJmcy9maWxlLmMgfCAyICstCj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2Zz
L2YyZnMvZmlsZS5jCj4+Pj4gaW5kZXggNmJkM2RlNjRmLi4wNWM4MGQyYjUgMTAwNjQ0Cj4+Pj4g
LS0tIGEvZnMvZjJmcy9maWxlLmMKPj4+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4+IEBAIC0x
ODU5LDcgKzE4NTksNyBAQCBzdGF0aWMgaW50IGYyZnNfZXhwYW5kX2lub2RlX2RhdGEoc3RydWN0
IGlub2RlICppbm9kZSwgbG9mZl90IG9mZnNldCwKPj4+PiAgICAgICAgICAgICAgICAgICAgICBm
MmZzX2Rvd25fd3JpdGUoJnNiaS0+Z2NfbG9jayk7Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAg
c3RhdF9pbmNfZ2NfY2FsbF9jb3VudChzYmksIEZPUkVHUk9VTkQpOwo+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgIGVyciA9IGYyZnNfZ2Moc2JpLCAmZ2NfY29udHJvbCk7Cj4+Pj4gLSAgICAgICAg
ICAgICAgICAgICBpZiAoZXJyICYmIGVyciAhPSAtRU5PREFUQSkgewo+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgaWYgKGVyciAmJiBlcnIgIT0gLUVOT0RBVEEgJiYgZXJyICE9IC1FQUdBSU4pIHsK
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfdXBfd3JpdGUoJnNiaS0+cGlu
X3NlbSk7Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dF9lcnI7Cj4+
Pj4gICAgICAgICAgICAgICAgICAgICAgfQo+Pj4KPj4+Cj4+Pgo+Pj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0Cj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4g
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4gCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
