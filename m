Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FA3CFBE25
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 04:45:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:Message-ID:MIME-Version:References:In-Reply-To:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPQwO4rYh+lMwbXZZU2RVDX4RrM8AfVsYF6EeDhMs18=; b=mwg/j6z9vQN1EIa7YNaXVulIe7
	5EMrlQ+wA7p9cY8mhbYw6m+ji24y5QeheBLRnNpNmBEKcvnUttnTzb3JAg4bz5W6iHgvefI0sSA1h
	HL/xkHJOcLiZzR7paD2sbllzWUamqmjtMWcSJkJ7afRAqAO5OuTDFs5WNQI50FEs79tE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdKTw-0007HH-Hi;
	Wed, 07 Jan 2026 03:45:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vdKTt-0007HA-Ny
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x9inBkxoD+Tn/7jDc1FHHAR/hYQhcJHrLEcftBbJ35g=; b=l5fyVZ1ieFo7vTaF2bZEZ4ri+1
 6rnIyk7fy6j5j0/Hm2Z2luAb2OcHhXT4gAJuYTMsaWicudIg5M31t9Ftbv6IgO7BNuW0mfFdUunoU
 HEiLBTBD6Dss1bCafSbx1+3BexlTP1CV9g85r5nueK9SjR5xtKLTKg+hSvRQkWFpAOm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References
 :In-Reply-To:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x9inBkxoD+Tn/7jDc1FHHAR/hYQhcJHrLEcftBbJ35g=; b=aU2SGFPEHb/u1SBWspd+IugYU9
 JTfhsxdicbX/hXT2vpjjqQbP98/3y58DKy74yPKORj/VurN6Wt5mpCI4p6ZDICbRXbSnSf+1RYjwm
 U9vNYG2IR/lJhMLa56Rw6ruyrEukDKKajCIW+BfimeErYTifFz5dGjo7c7ah+CKA0m8g=;
Received: from m16.mail.126.com ([117.135.210.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdKTr-00057A-Sz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=x9inBkxoD+Tn/7jDc1FHHAR/hYQhcJHrLEcftBbJ35g=; b=C
 oIGsKuUjQaVJoP58XliE5qryyd2lvyQgW5s2r/UC3/9aYWwQkPTctbS1K3dTlN4d
 w+xs1z7JsuC0UpshP/0zz7REE+IhWFLn0guAebyFaWcI5S+5Qx7t3TD6bDIZn+7j
 FzOz4xnD9LVj92QVBHM+bInlme7XRQb6SqotVQQLr4=
Received: from nzzhao$126.com ( [212.135.214.2] ) by
 ajax-webmail-wmsvr-41-112 (Coremail) ; Wed, 7 Jan 2026 11:44:35 +0800 (CST)
X-Originating-IP: [212.135.214.2]
Date: Wed, 7 Jan 2026 11:44:35 +0800 (CST)
From: "Nanzhe Zhao" <nzzhao@126.com>
To: "Barry Song" <21cnbao@gmail.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <CAGsJ_4yrspqjbEK8vj8Fd9FCDAasQ7mp5nBsE0Zg9XX265PXgA@mail.gmail.com>
References: <20260105153101.152892-1-nzzhao@126.com>
 <20260105153101.152892-2-nzzhao@126.com>
 <CAGsJ_4yrspqjbEK8vj8Fd9FCDAasQ7mp5nBsE0Zg9XX265PXgA@mail.gmail.com>
X-NTES-SC: AL_Qu2dBfueuEws4yaaZukfmUkUh+w4X8azs/kn1Y5VP5B+jArjxyoSQ1VpHFXH0fywJjKOtCCWfgdpyf5DeoxRdoUL6pCJNHm8uI6YcTkeeVZoFQ==
MIME-Version: 1.0
Message-ID: <1a779a14.3453.19b968e6f2d.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cCkvCgDXH1Ok1l1pY+c_AA--.38445W
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsQSQYGld1qRRcAAA3i
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Barry: >At 2026-01-06 11:38:49, "Barry Song" wrote: >>On
 Tue, Jan 6, 2026 at 12:12 AM Nanzhe Zhao wrote: >>> >>> f2fs_folio_state
 is attached to folio->private and is expected to start >>> with read_page
 [...] Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [212.135.214.2 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [117.135.210.6 listed in wl.mailspike.net]
X-Headers-End: 1vdKTr-00057A-Sz
Subject: Re: [f2fs-dev] [PATCH v1 1/5] f2fs: Zero f2fs_folio_state on
 allocation
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQmFycnk6Cgo+QXQgMjAyNi0wMS0wNiAxMTozODo0OSwgIkJhcnJ5IFNvbmciIDwyMWNuYmFv
QGdtYWlsLmNvbT4gd3JvdGU6Cj4+T24gVHVlLCBKYW4gNiwgMjAyNiBhdCAxMjoxMuKAr0FNIE5h
bnpoZSBaaGFvIDxuenpoYW9AMTI2LmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gZjJmc19mb2xpb19zdGF0
ZSBpcyBhdHRhY2hlZCB0byBmb2xpby0+cHJpdmF0ZSBhbmQgaXMgZXhwZWN0ZWQgdG8gc3RhcnQK
Pj4+IHdpdGggcmVhZF9wYWdlc19wZW5kaW5nID09IDAuICBIb3dldmVyLCB0aGUgc3RydWN0dXJl
IHdhcyBhbGxvY2F0ZWQgZnJvbQo+Pj4gZmZzX2VudHJ5X3NsYWIgd2l0aG91dCBiZWluZyBmdWxs
eSBpbml0aWFsaXplZCwgd2hpY2ggY2FuIGxlYXZlCj4+PiByZWFkX3BhZ2VzX3BlbmRpbmcgd2l0
aCBzdGFsZSB2YWx1ZXMuCj4+Pgo+Pj4gQWxsb2NhdGUgdGhlIG9iamVjdCB3aXRoIF9fR0ZQX1pF
Uk8gc28gYWxsIGZpZWxkcyBhcmUgcmVsaWFibHkgemVyb2VkIGF0Cj4+PiBjcmVhdGlvbiB0aW1l
Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE5hbnpoZSBaaGFvIDxuenpoYW9AMTI2LmNvbT4KPj4K
Pj4KPj5XZSBhbHJlYWR5IGhhdmUgR0ZQX0YyRlNfWkVSTywgYnV0IGl0IGluY2x1ZGVzIEdGUF9J
Ty4gU2hvdWxkIHdlCj4+aW50cm9kdWNlIGFub3RoZXIgdmFyaWFudCwgc3VjaCBhcyBHRlBfRjJG
U19OT0lPX1pFUk8gKG9yIHNpbWlsYXIpPwo+Pk92ZXJhbGwsIExHVE0uCj4+CgpJJ20gc3RpbGwg
bm90IGZ1bGx5IHVuZGVyc3RhbmQgYWJvdXQgdGhlIGV4YWN0IHNlbWFudGljcyBvZiBHRlBfTk9J
TyB2cyBHRlBfTk9GUy4gCkkgZGlkIGEgYml0IG9mIGRpZ2dpbmcgYW5kLCBpbiB0aGUgY3VycmVu
dCBidWZmZXJlZCByZWFkIC8gcmVhZGFoZWFkIGNvbnRleHQsIGl0IHNlZW1zIApsaWtlIHRoZXJl
IG1heSBiZSBubyBtZWFuaW5nZnVsIGRpZmZlcmVuY2UgZm9yIHRoZSBwdXJwb3NlIG9mIGF2b2lk
aW5nIGRpcmVjdC1yZWNsYWltIApyZWN1cnNpb24gZGVhZGxvY2tzPwoKTXkgY3VycmVudCAocG9z
c2libHkgaW5jb21wbGV0ZSkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGluIG1heV9lbnRlcl9mcygp
LCBHRlBfTk9JTyAKb25seSBjaGFuZ2VzIGJlaGF2aW9yIGZvciBzd2FwY2FjaGUgZm9saW9zLCBy
YXRoZXIgdGhhbiBmaWxlLWJhY2tlZCBmb2xpb3MgdGhhdCBhcmUKY3VycmVudGx5IGluIHRoZSBy
ZWFkIElPIHBhdGgsYW5kIHRoZSBzd2FwIHdyaXRlYmFjayBwYXRoIHdvbid0IHJlY3Vyc2UgYmFj
ayBpbnRvIGYyZnMncyAKb3duIHdyaXRlYmFjayBmdW5jdGlvbiBhbnl3YXkuIChPbiBwaG9uZXMg
dGhlcmUgdXN1YWxseSBpc24ndCAgYSBzd2FwIHBhcnRpdGlvbjsgZm9yIHpyYW0gCiBJIGd1ZXNz
IHN3YXAgd3JpdGViYWNrIGlzIGVmZmVjdGl2ZWx5IHdyaXRpbmcgdG8gUkFNIHZpYSB0aGUgenJh
bSBibG9jayBkZXZpY2UgPyAKU29ycnkgZm9yICBub3QgYmVpbmcgdmVyeSBmYW1pbGlhciB3aXRo
IHRoZSBkZXRhaWxzIHRoZXJlLikKCkkgbm90aWNlZCBpb21hcCdzIGlmc19hbGxvYyB1c2VzIEdG
UF9OT0ZTIHwgX19HRlBfTk9GQUlMLiBTbyBpZiBHRlBfTk9GUyBpcyBhY2NlcHRhYmxlIGhlcmUs
IAp3ZSBjb3VsZCBzaW1wbHkgdXNlIEdGUF9GMkZTX1pFUk8gYW5kIGF2b2lkIGludHJvZHVjaW5n
IGEgbmV3IEdGUF9GMkZTX05PSU9fWkVSTyB2YXJpYW50PwoKSnVzdCBjdXJpb3VzLkkgd2lsbCB2
b3RlICBmb3IgR0ZQX05PSU8gIGZyb20gc2VtYW50aWMgY2xhcml0eSBwZXJzcGVjdGl2ZSBoZXJl
LgoKVGhhbmtzLApOYW56aGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
