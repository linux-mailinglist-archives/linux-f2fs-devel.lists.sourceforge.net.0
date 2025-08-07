Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F97B1D151
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 05:50:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soML88zMXzTzOf0zgE55hcZ2C2kO7ZLO/MfiCficswU=; b=DbsRBuj5fsNJYqR5qrqCnFUNkh
	QGfC4fMizWU7Mlql2rAe7wAerVPptQ2vxBnNhftdoKTgp+3KzfOr4Ui38s/CdeaOKqnQFINNVOamR
	NETARKuPvuXuInfhZ9e7T1sROtbG0JdFZ/cOS1zbT0NRtcgQsxwFrvuWhQ/ZE8LdyzlA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujrdq-0002x1-25;
	Thu, 07 Aug 2025 03:50:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujrdo-0002wt-I3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 03:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TC2O6MHKqqiMfcj4iPUtOZp3dBlT97Kq/k92NqrRays=; b=UrRBhf7JQGKqDpUkZ72Vv9IAIS
 eLmKuAgO+0vnSeZt8z6Z8UFmiJUgCsQF3KH6oLBjPIprnNQwgh9whVnlxhsjldzbOa9j6GsvwlaQr
 EI0f/TkIa4waCS8ePqBozdLYcOujzVYJ8iWOxcUmasgA7TRsSO+Cwg6rteOXODcbD+FM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TC2O6MHKqqiMfcj4iPUtOZp3dBlT97Kq/k92NqrRays=; b=PBQqw4D08/qLDVQ2vAAC1Mcp0D
 7Nud/84R/WitipyJGhUNabX7+B/+xuRAxivwUavXslNPFw2PGQpTznRzm2LkzIqM3zHTysUcID2ss
 xCzIt20OBOyKMgGfbN+qr7f1mqBCXhgVFWiLkf+oWNmVLq675/H8ycbErlxH+Rk1bYj0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujrdn-0000E7-Vm for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 03:50:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B03AA443B5;
 Thu,  7 Aug 2025 03:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CFEC4CEEB;
 Thu,  7 Aug 2025 03:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754538597;
 bh=XgSHM3SUZ/g5o7AuDV27r0l5zUVXrs7FyX7nJLuRAj0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=FOE4AETbytAUEi8B5qN1PWTZnOqA6IjV6HS3ohSjnuyBS1bpyIFIqh3Z36uwm5u8q
 8pp3MlLDZtkX/ovQ8rxLJRJxn+QsG6IULMMzla35z+f2mB/aiQLzmZOQL6HZBHIcof
 QwolHhTdsdCBanaBQIbE3BuONFozx2NjpKwl1wTc0zQ92r1E/z6rXh/rwanwODB3KF
 lqArPVmf9bIjRL+GOdzay8SCDLqzIkopqUg0RnQJSbGfqR2Nh3Mjh6ea5z2aeSrHbu
 YgCdMXi1Mte7gRgQbt6xBkl1RxqOZVkwfk3ArlmRQh6uiDdxSIoFE/QClz8ZqUjxkh
 PT10mAaqQvi6A==
Message-ID: <77309097-2b76-4dd8-9766-f22fb385aa83@kernel.org>
Date: Thu, 7 Aug 2025 11:49:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20250807032406.3817056-1-chao@kernel.org>
 <CAHJ8P3L9VRghpbpn=ndQQfDXKjit=5PY28yR_19mnbgvda1LxQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3L9VRghpbpn=ndQQfDXKjit=5PY28yR_19mnbgvda1LxQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 8/7/25 11:47, Zhiguo Niu wrote: > Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > 于2025年8月7日周四 11:27写道：
    >> >> This patch introduces a new sysfs entry /sys/ [...] 
 
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
X-Headers-End: 1ujrdn-0000E7-Vm
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce flush_policy sysfs entry
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

T24gOC83LzI1IDExOjQ3LCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgdmlhIExpbnV4LWYy
ZnMtZGV2ZWwgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Pgo+IOS6jjIw
MjXlubQ45pyIN+aXpeWRqOWbmyAxMToyN+WGmemBk++8mgo+Pgo+PiBUaGlzIHBhdGNoIGludHJv
ZHVjZXMgYSBuZXcgc3lzZnMgZW50cnkgL3N5cy9mcy9mMmZzLzxkaXNrPi9mbHVzaF9wb2xpY3kK
Pj4gaW4gb3JkZXIgdG8gdHVuZSBwZXJmb3JtYW5jZSBvZiBmMmZzIGRhdGEgZmx1c2ggZmxvdy4K
Pj4KPj4gRm9yIGV4YW1wbGUsIGNoZWNrcG9pbnQgd2lsbCB1c2UgUkVRX0ZVQSB0byBwZXJzaXN0
IENQIG1ldGFkYXRhLCBob3dldmVyLAo+PiBzb21lIGtpbmQgZGV2aWNlIGhhcyBiYWQgcGVyZm9y
bWFuY2Ugb24gUkVRX0ZVQSBjb21tYW5kLCByZXN1bHQgaW4gdGhhdAo+PiBjaGVja3BvaW50IGJl
aW5nIGJsb2NrZWQgZm9yIGxvbmcgdGltZSwgdy8gdGhpcyBzeXNmcyBlbnRyeSwgd2UgY2FuIGdp
dmUKPj4gYW4gb3B0aW9uIHRvIHVzZSBSRVFfUFJFRkxVU0ggY29tbWFuZCBpbnN0ZWFkIG9mIFJF
UV9GVUEgZHVyaW5nIGNoZWNrcG9pbnQsCj4+IGl0IGNhbiBoZWxwIHRvIG1pdGlnYXRlIGxvbmcg
bGF0ZW5jeSBvZiBjaGVja3BvaW50Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+Cj4gCj4gUmV2aWV3ZWQtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5p
c29jLmNvbT4KClNvcnJ5LCBtaXNzZWQgdG8gZXhwb3J0IGYyZnNfc3VibWl0X2ZsdXNoX3dhaXQo
KSwgcGxlYXNlIGNoZWNrIHYzLCB0aGFua3MhCgpUaGFua3MsCgo+PiAtLS0KPj4gdjI6Cj4+IC0g
dXNlIF9fc3VibWl0X2ZsdXNoX3dhaXQoKSBpbnN0ZWFkIG9mIGYyZnNfZmx1c2hfZGV2aWNlX2Nh
Y2hlKCkgdG8KPj4ganVzdCBmbHVzaCBwcmltYXJ5IGRldmljZSBjYWNoZQo+PiAgRG9jdW1lbnRh
dGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzIHwgIDkgKysrKysrKysrCj4+ICBmcy9mMmZz
L2NoZWNrcG9pbnQuYyAgICAgICAgICAgICAgICAgICAgfCAxMSArKysrKysrKysrLQo+PiAgZnMv
ZjJmcy9mMmZzLmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKysrKwo+PiAgZnMv
ZjJmcy9zeXNmcy5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDkgKysrKysrKysrCj4+ICA0
IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcyBiL0RvY3Vt
ZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+PiBpbmRleCBiYzBlN2ZlZmMzOWQu
LjJmZWRiNDRiNzEzYiAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9z
eXNmcy1mcy1mMmZzCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMt
ZjJmcwo+PiBAQCAtODgzLDMgKzg4MywxMiBAQCBEYXRlOiAgICAgICAgICAgICAgSnVuZSAyMDI1
Cj4+ICBDb250YWN0OiAgICAgICAiRGFlaG8gSmVvbmciIDxkYWVob2plb25nQGdvb2dsZS5jb20+
Cj4+ICBEZXNjcmlwdGlvbjogICBDb250cm9sIEdDIGFsZ29yaXRobSBmb3IgYm9vc3QgR0MuIDA6
IGNvc3QgYmVuZWZpdCwgMTogZ3JlZWR5Cj4+ICAgICAgICAgICAgICAgICBEZWZhdWx0OiAxCj4+
ICsKPj4gK1doYXQ6ICAgICAgICAgIC9zeXMvZnMvZjJmcy88ZGlzaz4vZmx1c2hfcG9saWN5Cj4+
ICtEYXRlOiAgICAgICAgICBKdWx5IDIwMjUKPj4gK0NvbnRhY3Q6ICAgICAgICJDaGFvIFl1IiA8
Y2hhb0BrZXJuZWwub3JnPgo+PiArRGVzY3JpcHRpb246ICAgRGV2aWNlIGhhcyBkaWZmZXJlbnQg
cGVyZm9ybWFuY2UgZm9yIHRoZSBzYW1lIGZsdXNoIG1ldGhvZHMsIHRoaXMgbm9kZQo+PiArICAg
ICAgICAgICAgICAgY2FuIGJlIHVzZWQgdG8gdHVuZSBwZXJmb3JtYW5jZSBieSBzZXR0aW5nIGRp
ZmZlcmVudCBmbHVzaCBtZXRob2RzLgo+PiArCj4+ICsgICAgICAgICAgICAgICBwb2xpY3kgdmFs
dWUgICAgICAgICAgICBkZXNjcmlwdGlvbgo+PiArICAgICAgICAgICAgICAgMHgwMDAwMDAwMSAg
ICAgICAgICAgICAgVXNlIHByZWZsdXNoIGluc3RlYWQgb2YgZnVhIGR1cmluZyBjaGVja3BvaW50
Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NoZWNrcG9pbnQuYyBiL2ZzL2YyZnMvY2hlY2twb2lu
dC5jCj4+IGluZGV4IGRiMzgzMWY3ZjJmNS4uZmFmYTIxNTY3MzJkIDEwMDY0NAo+PiAtLS0gYS9m
cy9mMmZzL2NoZWNrcG9pbnQuYwo+PiArKysgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+PiBAQCAt
MTQxOSw3ICsxNDE5LDkgQEAgc3RhdGljIHZvaWQgY29tbWl0X2NoZWNrcG9pbnQoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLAo+PiAgICAgICAgIGYyZnNfZm9saW9fcHV0KGZvbGlvLCBmYWxzZSk7
Cj4+Cj4+ICAgICAgICAgLyogc3VibWl0IGNoZWNrcG9pbnQgKHdpdGggYmFycmllciBpZiBOT0JB
UlJJRVIgaXMgbm90IHNldCkgKi8KPj4gLSAgICAgICBmMmZzX3N1Ym1pdF9tZXJnZWRfd3JpdGUo
c2JpLCBNRVRBX0ZMVVNIKTsKPj4gKyAgICAgICBmMmZzX3N1Ym1pdF9tZXJnZWRfd3JpdGUoc2Jp
LAo+PiArICAgICAgICAgICAgICAgc2JpLT5mbHVzaF9wb2xpY3kgJiBCSVQoRkxVU0hfUE9MSUNZ
X0NQX05PX0ZVQSkgPwo+PiArICAgICAgICAgICAgICAgTUVUQSA6IE1FVEFfRkxVU0gpOwo+PiAg
fQo+Pgo+PiAgc3RhdGljIGlubGluZSB1NjQgZ2V0X3NlY3RvcnNfd3JpdHRlbihzdHJ1Y3QgYmxv
Y2tfZGV2aWNlICpiZGV2KQo+PiBAQCAtMTU5NCw2ICsxNTk2LDEzIEBAIHN0YXRpYyBpbnQgZG9f
Y2hlY2twb2ludChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpj
cGMpCj4+Cj4+ICAgICAgICAgX19zZXRfY3BfbmV4dF9wYWNrKHNiaSk7Cj4+Cj4+ICsgICAgICAg
LyogZmx1c2ggZGV2aWNlIGNhY2hlIHRvIG1ha2Ugc3VyZSBsYXN0IGNwIHBhY2sgY2FuIGJlIHBl
cnNpc3RlZCAqLwo+PiArICAgICAgIGlmIChzYmktPmZsdXNoX3BvbGljeSAmIEJJVChGTFVTSF9Q
T0xJQ1lfQ1BfTk9fRlVBKSkgewo+PiArICAgICAgICAgICAgICAgZXJyID0gX19zdWJtaXRfZmx1
c2hfd2FpdChzYmksIHNiaS0+c2ItPnNfYmRldik7Cj4+ICsgICAgICAgICAgICAgICBpZiAoZXJy
KQo+PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+PiArICAgICAgIH0KPj4g
Kwo+PiAgICAgICAgIC8qCj4+ICAgICAgICAgICogcmVkaXJ0eSBzdXBlcmJsb2NrIGlmIG1ldGFk
YXRhIGxpa2Ugbm9kZSBwYWdlIG9yIGlub2RlIGNhY2hlIGlzCj4+ICAgICAgICAgICogdXBkYXRl
ZCBkdXJpbmcgd3JpdGluZyBjaGVja3BvaW50Lgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZz
LmggYi9mcy9mMmZzL2YyZnMuaAo+PiBpbmRleCA0NmJlNzU2MDU0OGMuLjVkYjVlYmE0Y2JkNyAx
MDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4g
QEAgLTE1OTQsNiArMTU5NCwxMSBAQCBzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggewo+PiAgI2Rl
ZmluZSBNQVhfQ09NUFJFU1NfTE9HX1NJWkUgICAgICAgICAgOAo+PiAgI2RlZmluZSBNQVhfQ09N
UFJFU1NfV0lORE9XX1NJWkUobG9nX3NpemUpICAgICAoKFBBR0VfU0laRSkgPDwgKGxvZ19zaXpl
KSkKPj4KPj4gK2VudW0gZmx1c2hfcG9saWN5IHsKPj4gKyAgICAgICBGTFVTSF9QT0xJQ1lfQ1Bf
Tk9fRlVBLAo+PiArICAgICAgIEZMVVNIX1BPTElDWV9NQVgsCj4+ICt9Owo+PiArCj4+ICBzdHJ1
Y3QgZjJmc19zYl9pbmZvIHsKPj4gICAgICAgICBzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiOyAgICAg
ICAgICAgICAgICAgLyogcG9pbnRlciB0byBWRlMgc3VwZXIgYmxvY2sgKi8KPj4gICAgICAgICBz
dHJ1Y3QgcHJvY19kaXJfZW50cnkgKnNfcHJvYzsgICAgICAgICAgLyogcHJvYyBlbnRyeSAqLwo+
PiBAQCAtMTg0NSw2ICsxODUwLDggQEAgc3RydWN0IGYyZnNfc2JfaW5mbyB7Cj4+ICAgICAgICAg
LyogY2FydmUgb3V0IHJlc2VydmVkX2Jsb2NrcyBmcm9tIHRvdGFsIGJsb2NrcyAqLwo+PiAgICAg
ICAgIGJvb2wgY2FydmVfb3V0Owo+Pgo+PiArICAgICAgIHVuc2lnbmVkIGludCBmbHVzaF9wb2xp
Y3k7ICAgICAgICAgICAgICAvKiBmbHVzaCBwb2xpY3kgKi8KPj4gKwo+PiAgI2lmZGVmIENPTkZJ
R19GMkZTX0ZTX0NPTVBSRVNTSU9OCj4+ICAgICAgICAgc3RydWN0IGttZW1fY2FjaGUgKnBhZ2Vf
YXJyYXlfc2xhYjsgICAgIC8qIHBhZ2UgYXJyYXkgZW50cnkgKi8KPj4gICAgICAgICB1bnNpZ25l
ZCBpbnQgcGFnZV9hcnJheV9zbGFiX3NpemU7ICAgICAgLyogZGVmYXVsdCBwYWdlIGFycmF5IHNs
YWIgc2l6ZSAqLwo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJmcy9zeXNm
cy5jCj4+IGluZGV4IGY3MzYwNTJkZWE1MC4uYjY5MDE1ZjFkYzY3IDEwMDY0NAo+PiAtLS0gYS9m
cy9mMmZzL3N5c2ZzLmMKPj4gKysrIGIvZnMvZjJmcy9zeXNmcy5jCj4+IEBAIC04NTIsNiArODUy
LDEzIEBAIHN0YXRpYyBzc2l6ZV90IF9fc2JpX3N0b3JlKHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+
ICAgICAgICAgICAgICAgICByZXR1cm4gY291bnQ7Cj4+ICAgICAgICAgfQo+Pgo+PiArICAgICAg
IGlmICghc3RyY21wKGEtPmF0dHIubmFtZSwgImZsdXNoX3BvbGljeSIpKSB7Cj4+ICsgICAgICAg
ICAgICAgICBpZiAodCA+PSBCSVQoRkxVU0hfUE9MSUNZX01BWCkpCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+PiArICAgICAgICAgICAgICAgKnVpID0gKHVuc2ln
bmVkIGludCl0Owo+PiArICAgICAgICAgICAgICAgcmV0dXJuIGNvdW50Owo+PiArICAgICAgIH0K
Pj4gKwo+PiAgICAgICAgIGlmICghc3RyY21wKGEtPmF0dHIubmFtZSwgImdjX2Jvb3N0X2djX211
bHRpcGxlIikpIHsKPj4gICAgICAgICAgICAgICAgIGlmICh0IDwgMSB8fCB0ID4gU0VHU19QRVJf
U0VDKHNiaSkpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+PiBA
QCAtMTE3NSw2ICsxMTgyLDcgQEAgRjJGU19TQklfR0VORVJBTF9SV19BVFRSKGJsa3pvbmVfYWxs
b2NfcG9saWN5KTsKPj4gICNlbmRpZgo+PiAgRjJGU19TQklfR0VORVJBTF9SV19BVFRSKGNhcnZl
X291dCk7Cj4+ICBGMkZTX1NCSV9HRU5FUkFMX1JXX0FUVFIocmVzZXJ2ZWRfcGluX3NlY3Rpb24p
Owo+PiArRjJGU19TQklfR0VORVJBTF9SV19BVFRSKGZsdXNoX3BvbGljeSk7Cj4+Cj4+ICAvKiBT
VEFUX0lORk8gQVRUUiAqLwo+PiAgI2lmZGVmIENPTkZJR19GMkZTX1NUQVRfRlMKPj4gQEAgLTEz
NzEsNiArMTM3OSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpmMmZzX2F0dHJzW10gPSB7
Cj4+ICAgICAgICAgQVRUUl9MSVNUKG1heF9yZWFkX2V4dGVudF9jb3VudCksCj4+ICAgICAgICAg
QVRUUl9MSVNUKGNhcnZlX291dCksCj4+ICAgICAgICAgQVRUUl9MSVNUKHJlc2VydmVkX3Bpbl9z
ZWN0aW9uKSwKPj4gKyAgICAgICBBVFRSX0xJU1QoZmx1c2hfcG9saWN5KSwKPj4gICAgICAgICBO
VUxMLAo+PiAgfTsKPj4gIEFUVFJJQlVURV9HUk9VUFMoZjJmcyk7Cj4+IC0tCj4+IDIuNDkuMAo+
Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
