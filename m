Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA81B1D102
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 04:47:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SY5Cu3D8EDNirfgasPTW+QBfgf/kyzAuixBFg4QrnQg=; b=EMdCXg+vVwkwmTBSECqdapvF3K
	IrWoMHRtTOFyMFaSkqpU5yqjvO9rTc96h99//R5+J8CNkY34Htrwhbsw8BjFfYBiE9ysu45XG2WKT
	4JBFSSMjmTCAvTS5MsyGgdEcQVWBNS5D242KMngXxNt0j/86z+TC3F3g6LQZeDzZMlkQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujqfa-0005Ij-L0;
	Thu, 07 Aug 2025 02:47:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujqfZ-0005Ic-Cb
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 02:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ffqXu0rB15gol3fbdg7jzD99a1ID5FPu6ZBc+icYNEk=; b=J7s9YZpTpZAzefCHsBB4bA6jPb
 fGpzSpYUFHgQQ54X5+zRbBDjiIloq8QOPIgbBi/PtXEV5HsSrlwzu0SFV2M5OJC2wPxsvQJO8MNJm
 HFx4SW3P3mDZdGYOiZxOnX2MM6Q/PEcH0ZXbk4fvdGsP0RO/V0nM/LMbhi4USb10Zt40=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ffqXu0rB15gol3fbdg7jzD99a1ID5FPu6ZBc+icYNEk=; b=a56tVkADncyjPTvZUms9eS17HH
 z2yOWfrIo6iZ31xT8oAYy7+YYWNZLzDnsC0dq3G9x+0NgoO1WlSxX4BJ966qGiOgCLyXjO0nwHIAI
 O5KWkoBQk7D3lJWD/1Ig1jxEFoGpraVHOH8nAwRFUtoRx046a+WQ6FEH2If9UKet3h+Q=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujqfY-00013b-HC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 02:47:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C3D0B60206;
 Thu,  7 Aug 2025 02:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD8DC4CEE7;
 Thu,  7 Aug 2025 02:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754534866;
 bh=uTtkPEq2yFmxCcFM/cPem5ZdCduiGqyu/C6uW0UOaZc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=pwBV7J5E4b9ZdLq6jrLdWGFr/R9CR1SwZMqjXpOnX6WPH9o3VcvOZqPJv/t+hinSR
 DZMoLDfT6q4XB3etQ2EoCZrkBF7hKxPrZ+gVPrc7mMfYKEcK4+Fq1c3gtsKBO8Opap
 AKhZ9ms5Rbi+zPnH00ykgztByByAFwU6syZVZsumcorFLzyApW6DVD/OISMPLQpoNz
 YPVGJ6C20b5pS/J7MkIKmHctNuWmpL1ypbD2mz9lpK0A39bPJADWPCeFYKrzzMV4p3
 VZwwGJi5qtJo9dCz4wqOU5r9Tym27pItJ7Idr07eE8/IGzf7ghYjQcEWSCZqwk7ury
 8RzCcYstVEEMA==
Message-ID: <da1b15f0-95bd-43ab-9900-c3afd87e9ac7@kernel.org>
Date: Thu, 7 Aug 2025 10:47:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20250731084700.1230841-1-chao@kernel.org>
 <CAHJ8P3+GJu8ztM85pMUih93RUsDF65n2OUc-F7QPwvGwv2x48w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3+GJu8ztM85pMUih93RUsDF65n2OUc-F7QPwvGwv2x48w@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 8/7/25 10:16, Zhiguo Niu wrote: > Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > 于2025年7月31日周四 16:49写道：
    >> >> This patch introduces a new sysfs entry /sys [...] 
 
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
X-Headers-End: 1ujqfY-00013b-HC
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce flush_policy sysfs entry
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOC83LzI1IDEwOjE2LCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgdmlhIExpbnV4LWYy
ZnMtZGV2ZWwgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Pgo+IOS6jjIw
MjXlubQ35pyIMzHml6Xlkajlm5sgMTY6NDnlhpnpgZPvvJoKPj4KPj4gVGhpcyBwYXRjaCBpbnRy
b2R1Y2VzIGEgbmV3IHN5c2ZzIGVudHJ5IC9zeXMvZnMvZjJmcy88ZGlzaz4vZmx1c2hfcG9saWN5
Cj4+IGluIG9yZGVyIHRvIHR1bmUgcGVyZm9ybWFuY2Ugb2YgZjJmcyBkYXRhIGZsdXNoIGZsb3cu
Cj4+Cj4+IEZvciBleGFtcGxlLCBjaGVja3BvaW50IHdpbGwgdXNlIFJFUV9GVUEgdG8gcGVyc2lz
dCBDUCBtZXRhZGF0YSwgaG93ZXZlciwKPj4gc29tZSBraW5kIGRldmljZSBoYXMgYmFkIHBlcmZv
cm1hbmNlIG9uIFJFUV9GVUEgY29tbWFuZCwgcmVzdWx0IGluIHRoYXQKPj4gY2hlY2twb2ludCBi
ZWluZyBibG9ja2VkIGZvciBsb25nIHRpbWUsIHcvIHRoaXMgc3lzZnMgZW50cnksIHdlIGNhbiBn
aXZlCj4+IGFuIG9wdGlvbiB0byB1c2UgUkVRX1BSRUZMVVNIIGNvbW1hbmQgaW5zdGVhZCBvZiBS
RVFfRlVBIGR1cmluZyBjaGVja3BvaW50LAo+PiBpdCBjYW4gaGVscCB0byBtaXRpZ2F0ZSBsb25n
IGxhdGVuY3kgb2YgY2hlY2twb2ludC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hh
b0BrZXJuZWwub3JnPgo+PiAtLS0KPj4gIERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMt
ZnMtZjJmcyB8ICA5ICsrKysrKysrKwo+PiAgZnMvZjJmcy9jaGVja3BvaW50LmMgICAgICAgICAg
ICAgICAgICAgIHwgMTAgKysrKysrKysrLQo+PiAgZnMvZjJmcy9mMmZzLmggICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDcgKysrKysrKwo+PiAgZnMvZjJmcy9zeXNmcy5jICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDkgKysrKysrKysrCj4+ICA0IGZpbGVzIGNoYW5nZWQsIDM0IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
QUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lz
ZnMtZnMtZjJmcwo+PiBpbmRleCBiYzBlN2ZlZmMzOWQuLjJmZWRiNDRiNzEzYiAxMDA2NDQKPj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+PiBAQCAtODgzLDMgKzg4Mywx
MiBAQCBEYXRlOiAgICAgICAgICAgICAgSnVuZSAyMDI1Cj4+ICBDb250YWN0OiAgICAgICAiRGFl
aG8gSmVvbmciIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+ICBEZXNjcmlwdGlvbjogICBDb250
cm9sIEdDIGFsZ29yaXRobSBmb3IgYm9vc3QgR0MuIDA6IGNvc3QgYmVuZWZpdCwgMTogZ3JlZWR5
Cj4+ICAgICAgICAgICAgICAgICBEZWZhdWx0OiAxCj4+ICsKPj4gK1doYXQ6ICAgICAgICAgIC9z
eXMvZnMvZjJmcy88ZGlzaz4vZmx1c2hfcG9saWN5Cj4+ICtEYXRlOiAgICAgICAgICBKdWx5IDIw
MjUKPj4gK0NvbnRhY3Q6ICAgICAgICJDaGFvIFl1IiA8Y2hhb0BrZXJuZWwub3JnPgo+PiArRGVz
Y3JpcHRpb246ICAgRGV2aWNlIGhhcyBkaWZmZXJlbnQgcGVyZm9ybWFuY2UgZm9yIHRoZSBzYW1l
IGZsdXNoIG1ldGhvZHMsIHRoaXMgbm9kZQo+PiArICAgICAgICAgICAgICAgY2FuIGJlIHVzZWQg
dG8gdHVuZSBwZXJmb3JtYW5jZSBieSBzZXR0aW5nIGRpZmZlcmVudCBmbHVzaCBtZXRob2RzLgo+
PiArCj4+ICsgICAgICAgICAgICAgICBwb2xpY3kgdmFsdWUgICAgICAgICAgICBkZXNjcmlwdGlv
bgo+PiArICAgICAgICAgICAgICAgMHgwMDAwMDAwMSAgICAgICAgICAgICAgVXNlIHByZWZsdXNo
IGluc3RlYWQgb2YgZnVhIGR1cmluZyBjaGVja3BvaW50Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2NoZWNrcG9pbnQuYyBiL2ZzL2YyZnMvY2hlY2twb2ludC5jCj4+IGluZGV4IGJiZTA3ZTNhNmM3
NS4uMTBjYzI3MTU4NzcwIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+PiAr
KysgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+PiBAQCAtMTQxOSw3ICsxNDE5LDkgQEAgc3RhdGlj
IHZvaWQgY29tbWl0X2NoZWNrcG9pbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+PiAgICAg
ICAgIGYyZnNfZm9saW9fcHV0KGZvbGlvLCBmYWxzZSk7Cj4+Cj4+ICAgICAgICAgLyogc3VibWl0
IGNoZWNrcG9pbnQgKHdpdGggYmFycmllciBpZiBOT0JBUlJJRVIgaXMgbm90IHNldCkgKi8KPj4g
LSAgICAgICBmMmZzX3N1Ym1pdF9tZXJnZWRfd3JpdGUoc2JpLCBNRVRBX0ZMVVNIKTsKPj4gKyAg
ICAgICBmMmZzX3N1Ym1pdF9tZXJnZWRfd3JpdGUoc2JpLAo+PiArICAgICAgICAgICAgICAgc2Jp
LT5mbHVzaF9wb2xpY3kgJiBCSVQoRkxVU0hfUE9MSUNZX0NQX05PX0ZVQSkgPwo+PiArICAgICAg
ICAgICAgICAgTUVUQSA6IE1FVEFfRkxVU0gpOwo+PiAgfQo+Pgo+PiAgc3RhdGljIGlubGluZSB1
NjQgZ2V0X3NlY3RvcnNfd3JpdHRlbihzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2KQo+PiBAQCAt
MTYwNiw2ICsxNjA4LDEyIEBAIHN0YXRpYyBpbnQgZG9fY2hlY2twb2ludChzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpjcGMpCj4+ICAgICAgICAgZjJmc193YWl0
X29uX2FsbF9wYWdlcyhzYmksIEYyRlNfV0JfQ1BfREFUQSk7Cj4+ICAgICAgICAgc3RhdF9jcF90
aW1lKGNwYywgQ1BfVElNRV9XQUlUX0xBU1RfQ1ApOwo+Pgo+PiArICAgICAgIGlmIChzYmktPmZs
dXNoX3BvbGljeSAmIEJJVChGTFVTSF9QT0xJQ1lfQ1BfTk9fRlVBKSkgewo+PiArICAgICAgICAg
ICAgICAgZXJyID0gZjJmc19mbHVzaF9kZXZpY2VfY2FjaGUoc2JpKTsKPj4gKyAgICAgICAgICAg
ICAgIGlmIChlcnIpCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4+ICsg
ICAgICAgfQo+IEhpIENoYW8sCj4gc29ycnkgZm9yIGxhdGUgaW50ZXJydXB0aW9uLgo+IGYyZnNf
Zmx1c2hfZGV2aWNlX2NhY2hlIGlzIGp1c3QgdXNlZCBmb3IgbXVsdGkgZGV2aWNlIGNhc2VzLCBz
byB0aGlzIHBhdGNoIHdpbGwKPiBub3QgYmUgc3VpdGFibGUgZm9yIGEgc2luZ2xlIGRldmljZSBp
ZiB0aGUgdXNlciBjaGFuZ2VzIGZsdXNoX3BvbGljeQo+IGJ5IHN5c2ZzLCBvdGhlcndpc2UgaXQK
PiB3aWxsIG5vdCB1c2UgRlVBIHdyaXRlIHdoZW4gY29tbWl0dGluZyBjaGVja3BvaW50PyBJcyB0
aGlzIGV4cGVjdGVkPwoKWmhpZ3VvLCBJIGV4cGVjdGVkIHRvIGZsdXNoIHByaW1hcnkgZGV2aWNl
IGFzIHdlbGwsIHNvIEkgbmVlZCB0byBmaXggdGhpcywgdGhhbmtzCmZvciBjYXRjaGluZyB0aGlz
LgoKVGhhbmtzLAoKPiBUaGFua3MhCj4+ICsKPj4gICAgICAgICAvKgo+PiAgICAgICAgICAqIGlu
dmFsaWRhdGUgaW50ZXJtZWRpYXRlIHBhZ2UgY2FjaGUgYm9ycm93ZWQgZnJvbSBtZXRhIGlub2Rl
IHdoaWNoIGFyZQo+PiAgICAgICAgICAqIHVzZWQgZm9yIG1pZ3JhdGlvbiBvZiBlbmNyeXB0ZWQs
IHZlcml0eSBvciBjb21wcmVzc2VkIGlub2RlJ3MgYmxvY2tzLgo+PiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+PiBpbmRleCA1YzBlYTYwZTUwMmUuLjViYmEy
NGNhMTVjOCAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4gKysrIGIvZnMvZjJmcy9m
MmZzLmgKPj4gQEAgLTE2MjEsNiArMTYyMSwxMSBAQCBzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHgg
ewo+PiAgI2RlZmluZSBNQVhfQ09NUFJFU1NfTE9HX1NJWkUgICAgICAgICAgOAo+PiAgI2RlZmlu
ZSBNQVhfQ09NUFJFU1NfV0lORE9XX1NJWkUobG9nX3NpemUpICAgICAoKFBBR0VfU0laRSkgPDwg
KGxvZ19zaXplKSkKPj4KPj4gK2VudW0gZmx1c2hfcG9saWN5IHsKPj4gKyAgICAgICBGTFVTSF9Q
T0xJQ1lfQ1BfTk9fRlVBLAo+PiArICAgICAgIEZMVVNIX1BPTElDWV9NQVgsCj4+ICt9Owo+PiAr
Cj4+ICBzdHJ1Y3QgZjJmc19zYl9pbmZvIHsKPj4gICAgICAgICBzdHJ1Y3Qgc3VwZXJfYmxvY2sg
KnNiOyAgICAgICAgICAgICAgICAgLyogcG9pbnRlciB0byBWRlMgc3VwZXIgYmxvY2sgKi8KPj4g
ICAgICAgICBzdHJ1Y3QgcHJvY19kaXJfZW50cnkgKnNfcHJvYzsgICAgICAgICAgLyogcHJvYyBl
bnRyeSAqLwo+PiBAQCAtMTg3Myw2ICsxODc4LDggQEAgc3RydWN0IGYyZnNfc2JfaW5mbyB7Cj4+
ICAgICAgICAgLyogY2FydmUgb3V0IHJlc2VydmVkX2Jsb2NrcyBmcm9tIHRvdGFsIGJsb2NrcyAq
Lwo+PiAgICAgICAgIGJvb2wgY2FydmVfb3V0Owo+Pgo+PiArICAgICAgIHVuc2lnbmVkIGludCBm
bHVzaF9wb2xpY3k7ICAgICAgICAgICAgICAvKiBmbHVzaCBwb2xpY3kgKi8KPj4gKwo+PiAgI2lm
ZGVmIENPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9OCj4+ICAgICAgICAgc3RydWN0IGttZW1fY2Fj
aGUgKnBhZ2VfYXJyYXlfc2xhYjsgICAgIC8qIHBhZ2UgYXJyYXkgZW50cnkgKi8KPj4gICAgICAg
ICB1bnNpZ25lZCBpbnQgcGFnZV9hcnJheV9zbGFiX3NpemU7ICAgICAgLyogZGVmYXVsdCBwYWdl
IGFycmF5IHNsYWIgc2l6ZSAqLwo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMv
ZjJmcy9zeXNmcy5jCj4+IGluZGV4IGY3MzYwNTJkZWE1MC4uYjY5MDE1ZjFkYzY3IDEwMDY0NAo+
PiAtLS0gYS9mcy9mMmZzL3N5c2ZzLmMKPj4gKysrIGIvZnMvZjJmcy9zeXNmcy5jCj4+IEBAIC04
NTIsNiArODUyLDEzIEBAIHN0YXRpYyBzc2l6ZV90IF9fc2JpX3N0b3JlKHN0cnVjdCBmMmZzX2F0
dHIgKmEsCj4+ICAgICAgICAgICAgICAgICByZXR1cm4gY291bnQ7Cj4+ICAgICAgICAgfQo+Pgo+
PiArICAgICAgIGlmICghc3RyY21wKGEtPmF0dHIubmFtZSwgImZsdXNoX3BvbGljeSIpKSB7Cj4+
ICsgICAgICAgICAgICAgICBpZiAodCA+PSBCSVQoRkxVU0hfUE9MSUNZX01BWCkpCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+PiArICAgICAgICAgICAgICAgKnVp
ID0gKHVuc2lnbmVkIGludCl0Owo+PiArICAgICAgICAgICAgICAgcmV0dXJuIGNvdW50Owo+PiAr
ICAgICAgIH0KPj4gKwo+PiAgICAgICAgIGlmICghc3RyY21wKGEtPmF0dHIubmFtZSwgImdjX2Jv
b3N0X2djX211bHRpcGxlIikpIHsKPj4gICAgICAgICAgICAgICAgIGlmICh0IDwgMSB8fCB0ID4g
U0VHU19QRVJfU0VDKHNiaSkpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOwo+PiBAQCAtMTE3NSw2ICsxMTgyLDcgQEAgRjJGU19TQklfR0VORVJBTF9SV19BVFRSKGJs
a3pvbmVfYWxsb2NfcG9saWN5KTsKPj4gICNlbmRpZgo+PiAgRjJGU19TQklfR0VORVJBTF9SV19B
VFRSKGNhcnZlX291dCk7Cj4+ICBGMkZTX1NCSV9HRU5FUkFMX1JXX0FUVFIocmVzZXJ2ZWRfcGlu
X3NlY3Rpb24pOwo+PiArRjJGU19TQklfR0VORVJBTF9SV19BVFRSKGZsdXNoX3BvbGljeSk7Cj4+
Cj4+ICAvKiBTVEFUX0lORk8gQVRUUiAqLwo+PiAgI2lmZGVmIENPTkZJR19GMkZTX1NUQVRfRlMK
Pj4gQEAgLTEzNzEsNiArMTM3OSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpmMmZzX2F0
dHJzW10gPSB7Cj4+ICAgICAgICAgQVRUUl9MSVNUKG1heF9yZWFkX2V4dGVudF9jb3VudCksCj4+
ICAgICAgICAgQVRUUl9MSVNUKGNhcnZlX291dCksCj4+ICAgICAgICAgQVRUUl9MSVNUKHJlc2Vy
dmVkX3Bpbl9zZWN0aW9uKSwKPj4gKyAgICAgICBBVFRSX0xJU1QoZmx1c2hfcG9saWN5KSwKPj4g
ICAgICAgICBOVUxMLAo+PiAgfTsKPj4gIEFUVFJJQlVURV9HUk9VUFMoZjJmcyk7Cj4+IC0tCj4+
IDIuNDkuMAo+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
