Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A829ADCEA3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 16:02:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6SWRNzUzoFsLhhcRiWwuCiGm2Hz1x8ZxUhFq9S3P2I=; b=W/UWmC/Lf4AUbrUo7ps5Pu+NUa
	9UmbL0EnGkK1fk+tpvZVUlsJGz7WAzPEWq/AyAIjduDLmeEh4MmdXZrWegF9xHcIIJ+Q7qD6d8TJ7
	j4R9vKhDAEWLmFlMlRVyvC2NC8oxKxw0rz3u6Oi4+3ZXLJu1wiPCKVkhT6Wu4cgdkbqk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRWth-00069k-33;
	Tue, 17 Jun 2025 14:02:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chullee@google.com>) id 1uRWtf-00069d-Qr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 14:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c+UFyZIgkXcU1C4nuYojltirWTQx/xgJ01GPsEaJd3c=; b=DO+3VZJ/F6l4Tmn3oyHO90IqWS
 fY2/7MNTFKITOomCpyZwg4hvMrdfO+uBhWxzaaiStlFUly8utNROmhjtw3e2+grSWeil5xYXsHdOs
 anVybhUGqnBd8+vpjBHumvAjMwj9CnesyvHvEJGLkghZlK+tytVPv0OndqxzIKUFxugA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c+UFyZIgkXcU1C4nuYojltirWTQx/xgJ01GPsEaJd3c=; b=K+ZwJ10o8SJQv0tlGVOCq+9eqK
 nxTHmBpExElwVsi+NMOGaKgpo0LcZv89BMf9jCuB5KZ9SY+fmYDkT/VlKoiJtguFj7jHTNTeB3CSl
 PJcGs73ht1ZVAqwHLQk9hmhczmPdNh3ReRpnv8DUR3U7lQUk2z8usGMe0HG1rVilGNfU=;
Received: from mail-ed1-f51.google.com ([209.85.208.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uRWtf-000153-4B for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 14:02:43 +0000
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6000791e832so8979a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Jun 2025 07:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750168956; x=1750773756;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c+UFyZIgkXcU1C4nuYojltirWTQx/xgJ01GPsEaJd3c=;
 b=XJcTq/o/PIsfxnRCS44gprqEceqvi58H+xdnFkHbGq2eoB8rCP6EjAIYECiTi/N+sh
 DYgXb0nIdT4yU0A5mW/OsCUdMg2UvTqzJ7SCXAW/IfxlaOF+hNUNIv/tTgOEUvCSJQfh
 Xf6mMPSTiuHn9dCGdHFWzFrIHoKQAp3gzQTMOdOyjE2g+jkQBqR3DM+Pde17K1bn4a8D
 MNsgdfmNgVTVNUIGWQagIjIXgn7IL6+7iFhjCq49s5GsyvmS9uQtMWzXbGo3HISqFG92
 Dkgj43pPidn71Q7IhB4xLVSwamvTXm1GF2cOsY94tVz+KImupm7IstXSvgKVMe7ZCrTK
 nAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750168956; x=1750773756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c+UFyZIgkXcU1C4nuYojltirWTQx/xgJ01GPsEaJd3c=;
 b=c9CeQ572QFq4fTLfT38SnUJ0bqSc3iLDjxyDXOiYyiOLfb99OG1b1rKqasA50Dt4aH
 VjyY3LK4qReXiUM2v61Auy576+I/mZQRtrYuNyF04kPnaBcDjAgZDPs1Twn4iWaNMnQ6
 tm3qoNY4XMQTLSCD4posSCBSxE8Hybams9/x5pBSsbg3oaa0CHHMV7jKnqRpYcP3VqY+
 CKpyVP/7wHsI7vCJBYTgozR25bQjYSSvIbGkHhPhZV3CeD7SHX0gqZcPDIK0K0I5RrWU
 ywtsTrfOdbNkZCzVmpRu4G1juKnvEHCkmuA7kuogNeCzx18bwK2hyRaNiTjnt2MRC498
 qo7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwFuk0HEHLoDGPwUh7jwv996LPg3RDAp0/cRwuFz6/uVA+uvyxvgUQCpv9S8M+XeUsIjn8L0QI2861HyJ+Ue8z@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxoTSA8SXU212ac8aZ3/Br6H/t/Oktf4Ku2c8HXi2Jg7jWQ4YiC
 XJ6XZ42m1eRlBWp3t7ACHTRDy3WnPBrQRlDT+eKwUD8qejs5N5vCsXBQ/4Lk16yOJZXLenapk1S
 zKtsdzPxzhYS7eEVQ151IgJ+DUtA9ufL7ha1Oi/5U
X-Gm-Gg: ASbGncunDYDqno5ysm24Cd2Uw6h0UI7jZBIzMCNaVrSXy1DjiHXMi9trdti0NK9mK+P
 K8ZPNIOIGrsRSDMlUnPcjNtlMMjcg7rJEwf2iDGIy344ELz54ldNCjFZ+6JNm6mhH0iO8dor6EC
 Hp084TcByC/xTjMtDGQgSydGUv8HwWfIX5PljjxSzv
X-Google-Smtp-Source: AGHT+IGB44XynxITGVrrOKWP/33WJNFIhV47RvHXznN2oJeN14p+VhrrJZzn+rMK0lkKru5tRDD1mxqwI0TyNG+HX+k=
X-Received: by 2002:a05:6402:4407:b0:609:b4b1:514b with SMTP id
 4fb4d7f45d1cf-609b4b15233mr28342a12.3.1750168954779; Tue, 17 Jun 2025
 07:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250613230522.380370-1-chullee@google.com>
 <85f2a9b2-b023-4704-a593-8f00f7e3490a@kernel.org>
In-Reply-To: <85f2a9b2-b023-4704-a593-8f00f7e3490a@kernel.org>
Date: Tue, 17 Jun 2025 23:02:23 +0900
X-Gm-Features: AX0GCFveeoyw9SPjV96zTzgFkPs1ZRB7YWINS7gjwppWYJVqlfp8XFfzZpos1ak
Message-ID: <CALBjLoBZv4yGYwqbGJFH37qZynyWvRaDWS2H9ORDgNcyA3=_ZA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -7.8 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 17, 2025 at 2:33 PM Chao Yu <chao@kernel.org>
 wrote: > > On 6/14/25 07:05,
 Daniel Lee wrote: > > A new command 'test_create_perf', 
 has been introduced to measure > > the performance of cre [...] 
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
 [209.85.208.51 listed in wl.mailspike.net]
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uRWtf-000153-4B
Subject: Re: [f2fs-dev] [PATCH v2] f2fs_io: add test_create_perf command
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgMjozM+KAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiA2LzE0LzI1IDA3OjA1LCBEYW5pZWwgTGVlIHdyb3RlOgo+ID4gQSBu
ZXcgY29tbWFuZCAndGVzdF9jcmVhdGVfcGVyZicsIGhhcyBiZWVuIGludHJvZHVjZWQgdG8gbWVh
c3VyZQo+ID4gdGhlIHBlcmZvcm1hbmNlIG9mIGNyZWF0aW5nIGFuZCBkZWxldGluZyBtYW55IGZp
bGVzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBMZWUgPGNodWxsZWVAZ29vZ2xlLmNv
bT4KPiA+IC0tLQo+ID4gdjI6IFJlbmFtZSBjb21tYW5kIGFuZCBtYWtlIGZzeW5jIG9wdGlvbmFs
Cj4gPiAtLS0KPiA+ICB0b29scy9mMmZzX2lvL2YyZnNfaW8uYyB8IDEzOSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzOSBpbnNl
cnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5jIGIv
dG9vbHMvZjJmc19pby9mMmZzX2lvLmMKPiA+IGluZGV4IDY1MzFiNTUuLjY4MzFlNzggMTAwNjQ0
Cj4gPiAtLS0gYS90b29scy9mMmZzX2lvL2YyZnNfaW8uYwo+ID4gKysrIGIvdG9vbHMvZjJmc19p
by9mMmZzX2lvLmMKPiA+IEBAIC0yMDkyLDYgKzIwOTIsMTQ0IEBAIHN0YXRpYyB2b2lkIGRvX2Z0
cnVuY2F0ZShpbnQgYXJnYywgY2hhciAqKmFyZ3YsIGNvbnN0IHN0cnVjdCBjbWRfZGVzYyAqY21k
KQo+ID4gICAgICAgZXhpdCgwKTsKPiA+ICB9Cj4gPgo+ID4gKyNkZWZpbmUgdGVzdF9jcmVhdGVf
cGVyZl9kZXNjICJtZWFzdXJlIGZpbGUgY3JlYXRpb24gc3BlZWQiCj4gPiArI2RlZmluZSB0ZXN0
X2NyZWF0ZV9wZXJmX2hlbHAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPiArImYyZnNfaW8gdGVzdF9jcmVhdGVfcGVyZiBbLXNdIDxkaXI+IDxudW1f
ZmlsZXM+IDxzaXplX2tiPlxuXG4iICAgICAgICAgICAgICBcCj4gPiArIk1lYXN1cmVzIGZpbGUg
Y3JlYXRpb24gYW5kIGRlbGV0aW9uIHBlcmZvcm1hbmNlLlxuIiAgICAgICAgICAgICAgICAgXAo+
ID4gKyIgIDxkaXI+ICAgICAgICAgIFRoZSB0YXJnZXQgZGlyZWN0b3J5IHdoZXJlIGZpbGVzIHdp
bGwgYmUgY3JlYXRlZC5cbiIgICAgICAgXAo+ID4gKyIgIDxudW1fZmlsZXM+ICAgIFRoZSB0b3Rh
bCBudW1iZXIgb2YgZmlsZXMgdG8gY3JlYXRlIGFuZCBkZWxldGUuXG4iIFwKPiA+ICsiICA8c2l6
ZV9rYj4gICAgICBUaGUgc2l6ZSBvZiBlYWNoIGZpbGUgaW4ga2IuXG4iICAgICAgICAgICAgICAg
ICAgICBcCj4gPiArIiAgWy1zXSAgICAgICAgICAgQ2FsbCBmc3luYygpIGFmdGVyIGVhY2ggZmls
ZSBjcmVhdGlvbiB0byBtZWFzdXJlXG4iCj4gPiArCj4gPiArc3RhdGljIHZvaWQgZG9fdGVzdF9j
cmVhdGVfcGVyZihpbnQgYXJnYywgY2hhciAqKmFyZ3YsIGNvbnN0IHN0cnVjdCBjbWRfZGVzYyAq
Y21kKQo+ID4gK3sKPiA+ICsgICAgIGJvb2wgZG9fZnN5bmMgPSBmYWxzZTsKPiA+ICsgICAgIGlu
dCBvcHQ7Cj4gPiArICAgICBjaGFyICpkaXI7Cj4gPiArICAgICBpbnQgbnVtX2ZpbGVzOwo+ID4g
KyAgICAgaW50IHNpemVfa2I7Cj4gPiArICAgICBjaGFyICp3cml0ZV9idWZmZXIgPSBOVUxMOwo+
ID4gKwo+ID4gKyAgICAgd2hpbGUgKChvcHQgPSBnZXRvcHQoYXJnYywgYXJndiwgInMiKSkgIT0g
LTEpIHsKPiA+ICsgICAgICAgICAgICAgc3dpdGNoIChvcHQpIHsKPiA+ICsgICAgICAgICAgICAg
Y2FzZSAncyc6Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZG9fZnN5bmMgPSB0cnVlOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgICAgICAgICBkZWZhdWx0Ogo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIGZwdXRzKGNtZC0+Y21kX2hlbHAsIHN0ZGVycik7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgZXhpdCgxKTsKPiA+ICsgICAgICAgICAgICAgfQo+ID4g
KyAgICAgfQo+ID4gKwo+ID4gKyAgICAgYXJnYyAtPSBvcHRpbmQ7Cj4gPiArICAgICBhcmd2ICs9
IG9wdGluZDsKPiA+ICsKPiA+ICsgICAgIGlmIChhcmdjICE9IDMpIHsKPiA+ICsgICAgICAgICAg
ICAgZnB1dHMoIkV4Y2VzcyBhcmd1bWVudHNcblxuIiwgc3RkZXJyKTsKPiA+ICsgICAgICAgICAg
ICAgZnB1dHMoY21kLT5jbWRfaGVscCwgc3RkZXJyKTsKPiA+ICsgICAgICAgICAgICAgZXhpdCgx
KTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIGRpciA9IGFyZ3ZbMF07Cj4gPiArICAgICBu
dW1fZmlsZXMgPSBhdG9pKGFyZ3ZbMV0pOwo+ID4gKyAgICAgc2l6ZV9rYiA9IGF0b2koYXJndlsy
XSk7Cj4gPiArCj4gPiArICAgICBpZiAobnVtX2ZpbGVzIDw9IDApIHsKPiA+ICsgICAgICAgICAg
ICAgZnByaW50ZihzdGRlcnIsICJFcnJvcjogTnVtYmVyIG9mIGZpbGVzIG11c3QgYmUgcG9zaXRp
dmUuXG4iKTsKPiA+ICsgICAgICAgICAgICAgZXhpdCgxKTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+
ICsgICAgIGlmIChzaXplX2tiID4gMCkgewo+ID4gKyAgICAgICAgICAgICB3cml0ZV9idWZmZXIg
PSBtYWxsb2Moc2l6ZV9rYiAqIDEwMjQpOwo+ID4gKyAgICAgICAgICAgICBpZiAoIXdyaXRlX2J1
ZmZlcikgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHBlcnJvcigiRmFpbGVkIHRvIGFsbG9j
YXRlIHdyaXRlIGJ1ZmZlciIpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGV4aXQoMSk7Cj4g
PiArICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgbWVtc2V0KHdyaXRlX2J1ZmZlciwg
J2EnLCBzaXplX2tiICogMTAyNCk7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICAvLyBDcmVh
dGlvbiBQaGFzZQo+ID4gKyAgICAgcHJpbnRmKCJTdGFydGluZyB0ZXN0OiBDcmVhdGluZyAlZCBm
aWxlcyBvZiAlZEtCIGVhY2ggaW4gJXMgKGZzeW5jOiAlcylcbiIsCj4gPiArICAgICAgICAgICAg
IG51bV9maWxlcywgc2l6ZV9rYiwgZGlyLAo+ID4gKyAgICAgICAgICAgICBkb19mc3luYyA/ICJF
bmFibGVkIiA6ICJEaXNhYmxlZCIpOwo+ID4gKwo+ID4gKyAgICAgc3RydWN0IHRpbWVzcGVjIGNy
ZWF0ZV9zdGFydCwgY3JlYXRlX2VuZDsKPiA+ICsKPiA+ICsgICAgIGNsb2NrX2dldHRpbWUoQ0xP
Q0tfTU9OT1RPTklDLCAmY3JlYXRlX3N0YXJ0KTsKPiA+ICsKPiA+ICsgICAgIGZvciAoaW50IGkg
PSAwOyBpIDwgbnVtX2ZpbGVzOyBpKyspIHsKPiA+ICsgICAgICAgICAgICAgY2hhciBwYXRoWzEw
MjRdOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICBzbnByaW50ZihwYXRoLCBzaXplb2YocGF0aCks
ICIlcy90ZXN0X2ZpbGVfJWQiLCBkaXIsIGkpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICBpbnQg
ZmQgPSBvcGVuKHBhdGgsIE9fV1JPTkxZIHwgT19DUkVBVCwgMDY0NCk7Cj4gPiArCj4gPiArICAg
ICAgICAgICAgIGlmIChmZCA8IDApIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBwZXJyb3Io
IkVycm9yIG9wZW5pbmcgZmlsZSIpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVl
Owo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgIGlmIChzaXplX2tiID4gMCkg
ewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmICh3cml0ZShmZCwgd3JpdGVfYnVmZmVyLCBz
aXplX2tiICogMTAyNCkgPCAwKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGVy
cm9yKCJFcnJvciB3cml0aW5nIHRvIGZpbGUiKTsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKwo+
ID4gKyAgICAgICAgICAgICBpZiAoZG9fZnN5bmMpCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ZnN5bmMoZmQpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICBjbG9zZShmZCk7Cj4gPiArICAgICB9
Cj4gPiArCj4gPiArICAgICBjbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQywgJmNyZWF0ZV9l
bmQpOwo+ID4gKwo+ID4gKwo+ID4gKyAgICAgLy8gRGVsZXRpb24gUGhhc2UKPiA+ICsgICAgIHBy
aW50ZigiRGVsZXRpbmcgJWQgY3JlYXRlZCBmaWxlcy4uLlxuIiwgbnVtX2ZpbGVzKTsKPiA+ICsK
PiA+ICsgICAgIHN0cnVjdCB0aW1lc3BlYyBkZWxfc3RhcnQsIGRlbF9lbmQ7Cj4gPiArCj4gPiAr
ICAgICBjbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQywgJmRlbF9zdGFydCk7Cj4gPiArCj4g
PiArICAgICBmb3IgKGludCBpID0gMDsgaSA8IG51bV9maWxlczsgaSsrKSB7Cj4gPiArICAgICAg
ICAgICAgIGNoYXIgcGF0aFsxMDI0XTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgc25wcmludGYo
cGF0aCwgc2l6ZW9mKHBhdGgpLCAiJXMvdGVzdF9maWxlXyVkIiwgZGlyLCBpKTsKPiA+ICsgICAg
ICAgICAgICAgaWYgKHVubGluayhwYXRoKSAhPSAwKQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IHBlcnJvcigiRXJyb3IgdW5saW5raW5nIGZpbGUiKTsKPiA+ICsgICAgIH0KPiA+ICsgICAgIHN5
bmMoKTsKPgo+IEhvdyBhYm91dCBjYWxsaW5nIHN5bmMoKSBvciBmc3luYygpIG9wdGlvbmFsbHkg
bGlrZSB3ZSBkaWQgZm9yIGNyZWF0aW9uIHBlcmYgdGVzdD8KPgo+IGlmIChkb19mc3luYykKPiAg
ICAgICAgIGZzeW5jKHBhcmVudF9mZCk7ID8KPgo+IFRoYW5rcywKClRoYW5rcyBmb3IgdGhlIHN1
Z2dlc3Rpb24uIEknbGwgbWFrZSB0aGUgc3luYygpIGNhbGwgb3B0aW9uYWwgaW4gdGhlCm5leHQg
dmVyc2lvbi4KCj4KPiA+ICsKPiA+ICsgICAgIGNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklD
LCAmZGVsX2VuZCk7Cj4gPiArCj4gPiArICAgICBsb25nIGNyZWF0ZV9zZWNvbmRzID0gY3JlYXRl
X2VuZC50dl9zZWMgLSBjcmVhdGVfc3RhcnQudHZfc2VjOwo+ID4gKyAgICAgbG9uZyBjcmVhdGVf
bnMgPSBjcmVhdGVfZW5kLnR2X25zZWMgLSBjcmVhdGVfc3RhcnQudHZfbnNlYzsKPiA+ICsgICAg
IGRvdWJsZSBjcmVhdGVfdGltZV9zID0gKGRvdWJsZSljcmVhdGVfc2Vjb25kcyArIChkb3VibGUp
Y3JlYXRlX25zIC8gMTAwMDAwMDAwMC4wOwo+ID4gKyAgICAgZG91YmxlIGNyZWF0ZV90aHJvdWdo
cHV0ID0gKGNyZWF0ZV90aW1lX3MgPiAwKSA/IChudW1fZmlsZXMgLyBjcmVhdGVfdGltZV9zKSA6
IDA7Cj4gPiArCj4gPiArICAgICBsb25nIGRlbF9zZWNvbmRzID0gZGVsX2VuZC50dl9zZWMgLSBk
ZWxfc3RhcnQudHZfc2VjOwo+ID4gKyAgICAgbG9uZyBkZWxfbnMgPSBkZWxfZW5kLnR2X25zZWMg
LSBkZWxfc3RhcnQudHZfbnNlYzsKPiA+ICsgICAgIGRvdWJsZSBkZWxfdGltZV9zID0gKGRvdWJs
ZSlkZWxfc2Vjb25kcyArIChkb3VibGUpZGVsX25zIC8gMTAwMDAwMDAwMC4wOwo+ID4gKyAgICAg
ZG91YmxlIGRlbF90aHJvdWdocHV0ID0gKGRlbF90aW1lX3MgPiAwKSA/IChudW1fZmlsZXMgLyBk
ZWxfdGltZV9zKSA6IDA7Cj4gPiArCj4gPiArICAgICBwcmludGYoIk9wZXJhdGlvbix0b3RhbF9m
aWxlcyxmaWxlX3NpemVfa2IsdG90YWxfdGltZV9zLHRocm91Z2hwdXRfZmlsZXNfcGVyX3NlY1xu
Iik7Cj4gPiArCj4gPiArICAgICBwcmludGYoIkNSRUFURSwlZCwlZCwlLjRmLCUuMmZcbiIsCj4g
PiArICAgICAgICAgICAgICAgIG51bV9maWxlcywKPiA+ICsgICAgICAgICAgICAgICAgc2l6ZV9r
YiwKPiA+ICsgICAgICAgICAgICAgICAgY3JlYXRlX3RpbWVfcywKPiA+ICsgICAgICAgICAgICAg
ICAgY3JlYXRlX3Rocm91Z2hwdXQpOwo+ID4gKwo+ID4gKyAgICAgcHJpbnRmKCJERUxFVEUsJWQs
JWQsJS40ZiwlLjJmXG4iLAo+ID4gKyAgICAgICAgICAgICAgICBudW1fZmlsZXMsCj4gPiArICAg
ICAgICAgICAgICAgIHNpemVfa2IsCj4gPiArICAgICAgICAgICAgICAgIGRlbF90aW1lX3MsCj4g
PiArICAgICAgICAgICAgICAgIGRlbF90aHJvdWdocHV0KTsKPiA+ICsKPiA+ICsgICAgIGlmICh3
cml0ZV9idWZmZXIpCj4gPiArICAgICAgICAgICAgIGZyZWUod3JpdGVfYnVmZmVyKTsKPiA+ICsK
PiA+ICsgICAgIGV4aXQoMCk7Cj4gPiArfQo+ID4gKwo+ID4gICNkZWZpbmUgQ01EX0hJRERFTiAg
IDB4MDAwMQo+ID4gICNkZWZpbmUgQ01EKG5hbWUpIHsgI25hbWUsIGRvXyMjbmFtZSwgbmFtZSMj
X2Rlc2MsIG5hbWUjI19oZWxwLCAwIH0KPiA+ICAjZGVmaW5lIF9DTUQobmFtZSkgeyAjbmFtZSwg
ZG9fIyNuYW1lLCBOVUxMLCBOVUxMLCBDTURfSElEREVOIH0KPiA+IEBAIC0yMTQwLDYgKzIyNzgs
NyBAQCBjb25zdCBzdHJ1Y3QgY21kX2Rlc2MgY21kX2xpc3RbXSA9IHsKPiA+ICAgICAgIENNRChn
ZXRfYWR2aXNlKSwKPiA+ICAgICAgIENNRChpb3ByaW8pLAo+ID4gICAgICAgQ01EKGZ0cnVuY2F0
ZSksCj4gPiArICAgICBDTUQodGVzdF9jcmVhdGVfcGVyZiksCj4gPiAgICAgICB7IE5VTEwsIE5V
TEwsIE5VTEwsIE5VTEwsIDAgfQo+ID4gIH07Cj4gPgo+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
