Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1889CAEEAC0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 01:02:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPGepPAw8P5bnSgJqTw66fXS9P2trIR7nTpXmrgi9No=; b=WRf2fMm4mGjtT26BR06o3xUn3a
	ybsInV6BM2buqKUd8eaFYxFk5XOQ6FhFHRjJcRf1Vr24J0ZyiseBTTtLh3nKax6PpeETnJ7vK/a8P
	NHpb/D8VCB6ZtmHGqa++qerdN30FKoSxSnRHngb9t7pGhYYesTPx9WM19n7l4itRfo3U=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWNWQ-0004VZ-OU;
	Mon, 30 Jun 2025 23:02:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chullee@google.com>) id 1uWNWO-0004VI-Ur
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 23:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0qLMLP3Ske3Nf/leK3GVL8kkxjqArizAC4Coyy9U/9k=; b=YDAWd/ivStLKcoI4dNAkXY7ce7
 XSvKvynOqLfKkHIhm5UWtr7ksD/Idw0xOMECbns+lt7ufqxBAKT2BkJV75ya3CkWAEC8L4wooPeF5
 qKKJlvVv/dt6UHJVpS+iyoW9wj9Gy7caPCVBQ8Y9086pP9E0JvxW+NqTLebA1OoBQaAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0qLMLP3Ske3Nf/leK3GVL8kkxjqArizAC4Coyy9U/9k=; b=KX+ZSrKt3lxA+CEKoPGX3pXkZ9
 zBxG+UlYJwHf1MoBlwMDH6cQeqNgLJNn28v8QhejdSZNAbnL+6hiPNZE5Ca7uX0kcHV/VHkLsIaAn
 p2TtzTs8iUH7+K+REx5U8RZ4sppQDZhX4gzfg5flOOWg0KwAMnp9vPCfFrgeeN2ju2oc=;
Received: from mail-ed1-f46.google.com ([209.85.208.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uWNWO-0002eo-CC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 23:02:44 +0000
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-609b169834cso4264a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 Jun 2025 16:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1751324553; x=1751929353;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0qLMLP3Ske3Nf/leK3GVL8kkxjqArizAC4Coyy9U/9k=;
 b=P/cAlLMEWHTjINr6TVmXqYtCmzF7QAtYh+IXrx6xPnPGqn6sWqYalvKehJ96gDeWu8
 mi9gQDMT9F9esMR3Aer/8Auhfx7b/mtrcY1WPwgh0zEczDoMSt0Yo3tiTfK6KxyeAk2J
 qYUo2iclJbu5MooEGqh4U+JfvnsQ0EKv3GXm0CEwSgue34Cf/ZBDuSmbmfaxVBD8K5+q
 DW3EB0lGAxedZjCyJuOOtuJBfa7LJW2pHjHPCYxcyhP2r44RipIwIYkQ0NFg/QUDE8KF
 jSWlN8wAkPPSFoNFaVr5//cZoEKnK89ZPV7lZy3n1lwRQk5TlwsFY2lyb7i/k/ve26B/
 VCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751324553; x=1751929353;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0qLMLP3Ske3Nf/leK3GVL8kkxjqArizAC4Coyy9U/9k=;
 b=R5qFWNherwts6BQpf0EiA6LTC9EBPAAIKSXFC2r6a6UllERLrYuf8TEfUqHASa/Lon
 CY/oQP2WSf3YFW5rT2Xpt5wWzy71Gut9ILL/Ny4zGnNYgzcHFi8EQe7Hmc1WM3uRCK+N
 6QozksPTD/UE3yHApSqXoQ9RWVyTH4DyHuYPUor2G3rmj5go17l3lNWxFHedg1K0zqDJ
 lrdPPOlaFlv5fcWpzQDwYUMYfOngGusNcNO0PFdHj+bGc6swAHFV4qYkbaZmqJkn0XJV
 J0K6Orn2gKVfRmDpCT2/Ku2qSJA64ePjQH5nVqqT1MzKXi4VVj18hxQGIqU9SoSeQ2uO
 BFxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDD3Un3mpDtxMWa4Mqm8F/GnNshlRiH//Ec/VLYgX4iCMpFQyR3WyE68MVB4dHHMTM+DKuHlvAVQvbTxgiZmi5@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzSDZACxa/H5VZe/p9C1u8Xy4jmJ8+DsP+pQDfU0sKWkPGFSt0B
 hivz10vjE8YiAwp3Qdc0Ch4rlTMf6BLwjwolm2rvuuk2DttEwh4ZHSG8AAy//Iiqksm5u4Jv/at
 53nxju58ghZ9QFrkU4LImOyMmjHWGt755J/E8Bn0I
X-Gm-Gg: ASbGncswqDrgURkd3DGv2sQaz4LfOc+eXgOSmp+1Yb/0eTOyCZtq5ivQi3kx4YZpbFj
 P4tVsUzlJq7W5yyybiHwWIn4bCUd6Z57mz64IQGJe/4jSsbc1AOEbFqjDJUzLOObul+8lmUXBa3
 aCcy3EU4f8eiO6XPwkvfazawnLrcNPxPSTENlhfIVWoLO4waH0XcrDSQnXeki5c906pSGBJ3f8t
 vWXNGfRT2eq
X-Google-Smtp-Source: AGHT+IFS0q55gmlJO1hey+/BYI7FeaCTIrlOqFtFfHKgmIhIAMpK39dpsalABFCEMDB/+CBiks2Od8jLmmLp43XyJeE=
X-Received: by 2002:a50:fc10:0:b0:607:30a0:12f4 with SMTP id
 4fb4d7f45d1cf-60e38a75510mr3647a12.5.1751324552596; Mon, 30 Jun 2025 16:02:32
 -0700 (PDT)
MIME-Version: 1.0
References: <20250615144235.1836469-1-chullee@google.com>
 <20250615144235.1836469-2-chullee@google.com>
 <0f09a845-fbaf-4ddf-b684-a1182f85a9ff@kernel.org>
In-Reply-To: <0f09a845-fbaf-4ddf-b684-a1182f85a9ff@kernel.org>
Date: Mon, 30 Jun 2025 16:02:20 -0700
X-Gm-Features: Ac12FXyYd5KOlSBFKj1urp028eA0EYYBuMW47qdrBBYTKnM3VCqPKVInYiuw36Y
Message-ID: <CALBjLoDVk976imbZ8-G97jD0aHE2yzL5y-covCmp7V-97aEg6g@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -7.8 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 16, 2025 at 5:41 AM Chao Yu <chao@kernel.org>
 wrote: > > On 6/15/25 22:42, Daniel Lee wrote: > > Bio flags like REQ_PRIO,
 REQ_META, and REQ_FUA, determined by > > f2fs_io_flags(), were not [...] 
 Content analysis details:   (-7.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.46 listed in wl.mailspike.net]
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uWNWO-0002eo-CC
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: Apply bio flags to direct I/O
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
From: Daniel Lee via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Lee <chullee@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBKdW4gMTYsIDIwMjUgYXQgNTo0MeKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiA2LzE1LzI1IDIyOjQyLCBEYW5pZWwgTGVlIHdyb3RlOgo+ID4gQmlv
IGZsYWdzIGxpa2UgUkVRX1BSSU8sIFJFUV9NRVRBLCBhbmQgUkVRX0ZVQSwgZGV0ZXJtaW5lZCBi
eQo+ID4gZjJmc19pb19mbGFncygpLCB3ZXJlIG5vdCBiZWluZyBhcHBsaWVkIHRvIGRpcmVjdCBJ
L08gKERJTykgd3JpdGVzLgo+ID4gVGhpcyBtZWFudCB0aGF0IERJTyB3cml0ZXMgd291bGQgbm90
IHJlc3BlY3QgZmlsZXN5c3RlbS1sZXZlbCBoaW50cwo+ID4gKGZvciBSRVFfTUVUQS9GVUEpIG9y
IGlub2RlLWxldmVsIGhpbnRzIChsaWtlIEYyRlNfSU9QUklPX1dSSVRFKS4KPiA+Cj4gPiBUaGlz
IHBhdGNoIHJlZmFjdG9ycyBmMmZzX2lvX2ZsYWdzKCkgdG8gdXNlIGEgZGlyZWN0IGlub2RlIHBv
aW50ZXIKPiA+IGluc3RlYWQgb2YgZGVyaXZpbmcgaXQgZnJvbSBhIHBhZ2UuIFRoZSBmdW5jdGlv
biBpcyB0aGVuIGNhbGxlZCBmcm9tCj4gPiB0aGUgRElPIHdyaXRlIHBhdGgsIGVuc3VyaW5nIHRo
YXQgYmlvIGZsYWdzIGFyZSBoYW5kbGVkIGNvbnNpc3RlbnRseQo+ID4gZm9yIGJvdGggYnVmZmVy
ZWQgYW5kIERJTyB3cml0ZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIExlZSA8Y2h1
bGxlZUBnb29nbGUuY29tPgo+ID4gLS0tCj4gPiAgZnMvZjJmcy9kYXRhLmMgfCAxMCArKysrKy0t
LS0tCj4gPiAgZnMvZjJmcy9mMmZzLmggfCAgMSArCj4gPiAgZnMvZjJmcy9maWxlLmMgfCAxMSAr
KysrKysrKysrKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2Rh
dGEuYwo+ID4gaW5kZXggMzFlODkyODQyNjI1Li43MWRkZTQ5NGI4OTIgMTAwNjQ0Cj4gPiAtLS0g
YS9mcy9mMmZzL2RhdGEuYwo+ID4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiA+IEBAIC00MTYsMTAg
KzQxNiw5IEBAIGludCBmMmZzX3RhcmdldF9kZXZpY2VfaW5kZXgoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLCBibG9ja190IGJsa2FkZHIpCj4gPiAgICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPgo+
ID4gLXN0YXRpYyBibGtfb3BmX3QgZjJmc19pb19mbGFncyhzdHJ1Y3QgZjJmc19pb19pbmZvICpm
aW8pCj4gPiArYmxrX29wZl90IGYyZnNfaW9fZmxhZ3Moc3RydWN0IGYyZnNfaW9faW5mbyAqZmlv
LCBzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ID4gIHsKPiA+ICAgICAgIHVuc2lnbmVkIGludCB0ZW1w
X21hc2sgPSBHRU5NQVNLKE5SX1RFTVBfVFlQRSAtIDEsIDApOwo+ID4gLSAgICAgc3RydWN0IGZv
bGlvICpmaW9fZm9saW8gPSBwYWdlX2ZvbGlvKGZpby0+cGFnZSk7Cj4gPiAgICAgICB1bnNpZ25l
ZCBpbnQgZnVhX2ZsYWcsIG1ldGFfZmxhZywgaW9fZmxhZzsKPiA+ICAgICAgIGJsa19vcGZfdCBv
cF9mbGFncyA9IDA7Cj4gPgo+ID4gQEAgLTQ0Niw4ICs0NDUsOCBAQCBzdGF0aWMgYmxrX29wZl90
IGYyZnNfaW9fZmxhZ3Moc3RydWN0IGYyZnNfaW9faW5mbyAqZmlvKQo+ID4gICAgICAgaWYgKEJJ
VChmaW8tPnRlbXApICYgZnVhX2ZsYWcpCj4gPiAgICAgICAgICAgICAgIG9wX2ZsYWdzIHw9IFJF
UV9GVUE7Cj4gPgo+ID4gLSAgICAgaWYgKGZpby0+dHlwZSA9PSBEQVRBICYmCj4gPiAtICAgICAg
ICAgRjJGU19JKGZpb19mb2xpby0+bWFwcGluZy0+aG9zdCktPmlvcHJpb19oaW50ID09IEYyRlNf
SU9QUklPX1dSSVRFKQo+ID4gKyAgICAgaWYgKGlub2RlICYmIGZpby0+dHlwZSA9PSBEQVRBICYm
Cj4gPiArICAgICAgICAgRjJGU19JKGlub2RlKS0+aW9wcmlvX2hpbnQgPT0gRjJGU19JT1BSSU9f
V1JJVEUpCj4gPiAgICAgICAgICAgICAgIG9wX2ZsYWdzIHw9IFJFUV9QUklPOwo+ID4KPiA+ICAg
ICAgIHJldHVybiBvcF9mbGFnczsKPiA+IEBAIC00NTksMTAgKzQ1OCwxMSBAQCBzdGF0aWMgc3Ry
dWN0IGJpbyAqX19iaW9fYWxsb2Moc3RydWN0IGYyZnNfaW9faW5mbyAqZmlvLCBpbnQgbnBhZ2Vz
KQo+ID4gICAgICAgc3RydWN0IGJsb2NrX2RldmljZSAqYmRldjsKPiA+ICAgICAgIHNlY3Rvcl90
IHNlY3RvcjsKPiA+ICAgICAgIHN0cnVjdCBiaW8gKmJpbzsKPiA+ICsgICAgIHN0cnVjdCBpbm9k
ZSAqaW5vZGUgPSBmaW8tPnBhZ2UgPyBmaW8tPnBhZ2UtPm1hcHBpbmctPmhvc3QgOiBOVUxMOwo+
Cj4gZmlvLT5wYWdlIHdpbGwgYWx3YXlzIGJlIHRydWUgbm93PyBXZSBjYW4gcGFzcyBmaW8tPnBh
Z2UtPm1hcHBpbmctPmhvc3QgdG8gZjJmc19pb19mbGFncygpCj4gZGlyZWN0bHk/Cj4KPiBUaGFu
a3MsCgpUaGFua3MgZm9yIHRoZSBpbnNpZ2h0LiBTaW5jZSBmaW8tPnBhZ2UgaXMgYWx3YXlzIG5v
bi1udWxsIGhlcmUsIEknbGwKcmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBjb2RlLgoKPgo+ID4KPiA+
ICAgICAgIGJkZXYgPSBmMmZzX3RhcmdldF9kZXZpY2Uoc2JpLCBmaW8tPm5ld19ibGthZGRyLCAm
c2VjdG9yKTsKPiA+ICAgICAgIGJpbyA9IGJpb19hbGxvY19iaW9zZXQoYmRldiwgbnBhZ2VzLAo+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlvLT5vcCB8IGZpby0+b3BfZmxhZ3Mg
fCBmMmZzX2lvX2ZsYWdzKGZpbyksCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
aW8tPm9wIHwgZmlvLT5vcF9mbGFncyB8IGYyZnNfaW9fZmxhZ3MoZmlvLCBpbm9kZSksCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfTk9JTywgJmYyZnNfYmlvc2V0KTsKPiA+
ICAgICAgIGJpby0+YmlfaXRlci5iaV9zZWN0b3IgPSBzZWN0b3I7Cj4gPiAgICAgICBpZiAoaXNf
cmVhZF9pbyhmaW8tPm9wKSkgewo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMv
ZjJmcy9mMmZzLmgKPiA+IGluZGV4IDkzMzNhMjJiOWEwMS4uM2UwMjY4N2MxYjU4IDEwMDY0NAo+
ID4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPiA+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBAQCAt
Mzk3Miw2ICszOTcyLDcgQEAgdm9pZCBmMmZzX3N1Ym1pdF9wYWdlX3dyaXRlKHN0cnVjdCBmMmZz
X2lvX2luZm8gKmZpbyk7Cj4gPiAgc3RydWN0IGJsb2NrX2RldmljZSAqZjJmc190YXJnZXRfZGV2
aWNlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+ICAgICAgICAgICAgICAgYmxvY2tfdCBi
bGtfYWRkciwgc2VjdG9yX3QgKnNlY3Rvcik7Cj4gPiAgaW50IGYyZnNfdGFyZ2V0X2RldmljZV9p
bmRleChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJsb2NrX3QgYmxrYWRkcik7Cj4gPiArYmxr
X29wZl90IGYyZnNfaW9fZmxhZ3Moc3RydWN0IGYyZnNfaW9faW5mbyAqZmlvLCBzdHJ1Y3QgaW5v
ZGUgKmlub2RlKTsKPiA+ICB2b2lkIGYyZnNfc2V0X2RhdGFfYmxrYWRkcihzdHJ1Y3QgZG5vZGVf
b2ZfZGF0YSAqZG4sIGJsb2NrX3QgYmxrYWRkcik7Cj4gPiAgdm9pZCBmMmZzX3VwZGF0ZV9kYXRh
X2Jsa2FkZHIoc3RydWN0IGRub2RlX29mX2RhdGEgKmRuLCBibG9ja190IGJsa2FkZHIpOwo+ID4g
IGludCBmMmZzX3Jlc2VydmVfbmV3X2Jsb2NrcyhzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAqZG4sIGJs
a2NudF90IGNvdW50KTsKPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMv
ZmlsZS5jCj4gPiBpbmRleCA2OTYxMzFlNjU1ZWQuLjNlYjQwZDdiZjYwMiAxMDA2NDQKPiA+IC0t
LSBhL2ZzL2YyZnMvZmlsZS5jCj4gPiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+ID4gQEAgLTUwMTUs
NiArNTAxNSwxNyBAQCBzdGF0aWMgdm9pZCBmMmZzX2Rpb193cml0ZV9zdWJtaXRfaW8oY29uc3Qg
c3RydWN0IGlvbWFwX2l0ZXIgKml0ZXIsCj4gPiAgICAgICBlbnVtIGxvZ190eXBlIHR5cGUgPSBm
MmZzX3J3X2hpbnRfdG9fc2VnX3R5cGUoc2JpLCBpbm9kZS0+aV93cml0ZV9oaW50KTsKPiA+ICAg
ICAgIGVudW0gdGVtcF90eXBlIHRlbXAgPSBmMmZzX2dldF9zZWdtZW50X3RlbXAoc2JpLCB0eXBl
KTsKPiA+Cj4gPiArICAgICAvKiBpZiBmYWR2aXNlIHNldCB0byBob3QsIG92ZXJyaWRlIHRoZSB0
ZW1wZXJhdHVyZSAqLwo+ID4gKyAgICAgc3RydWN0IGYyZnNfaW9faW5mbyBmaW8gPSB7Cj4gPiAr
ICAgICAgICAgICAgIC5zYmkgPSBzYmksCj4gPiArICAgICAgICAgICAgIC50eXBlID0gREFUQSwK
PiA+ICsgICAgICAgICAgICAgLm9wID0gUkVRX09QX1dSSVRFLAo+ID4gKyAgICAgICAgICAgICAu
dGVtcCA9IGZpbGVfaXNfaG90KGlub2RlKSA/IEhPVCA6IHRlbXAsCj4gPiArICAgICAgICAgICAg
IC5vcF9mbGFncyA9IGJpby0+Ymlfb3BmLAo+ID4gKyAgICAgICAgICAgICAucGFnZSA9IE5VTEws
Cj4gPiArICAgICB9Owo+ID4gKyAgICAgYmlvLT5iaV9vcGYgfD0gZjJmc19pb19mbGFncygmZmlv
LCBpbm9kZSk7Cj4gPiArCj4gPiAgICAgICBiaW8tPmJpX3dyaXRlX2hpbnQgPSBmMmZzX2lvX3R5
cGVfdG9fcndfaGludChzYmksIERBVEEsIHRlbXApOwo+ID4gICAgICAgc3VibWl0X2JpbyhiaW8p
Owo+ID4gIH0KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
