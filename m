Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2360370EAAB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 May 2023 03:20:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1dAY-0004dX-CG;
	Wed, 24 May 2023 01:20:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q1dAW-0004d8-De
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 01:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H5CCbom2d/q6aI2Wehv8VgVd1lXGvHhfvX0n1jzMw0o=; b=TSjQpdozL4Ay/p1hSs2SGFA9/K
 YrPO4oRC+Aq1eI9kbffWQK7h4V/ClvGZrcOiRRwNtNl+hfRH6rjbua2NGMD9NY2UiGqD8VPV5VjrE
 psCjcxdoAuCPxUXUpxEPfT1lnJQJRN6giJQi7T+woi4Xe9qlVIuyEwRbEhGsbLAPcoWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H5CCbom2d/q6aI2Wehv8VgVd1lXGvHhfvX0n1jzMw0o=; b=YsXfgxwGtZoyCRPmFtg8z3awSP
 Gb1O3F6oQ7TGq3NmPzDQ1AqRUMkL/1k/hVSBJgLuEL5Ccd8iPk5lcYtr0v6IfS+FPBCukJxNc6eB+
 yJ5b+w/gpBVAr1ArRlRGmeefkvgPowSGgWVWFcaUdospXvjZgDLkzoWO3KBgGs9qxz48=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1dAT-0004te-1W for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 01:20:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9169C61B8C;
 Wed, 24 May 2023 01:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9053FC4339B;
 Wed, 24 May 2023 01:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684891187;
 bh=vgMUJ0JPuqX3GxrYfWAArh7Rs47vUDfarxjvge6QVMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZIq2ukc5kVKUSZ+gxHhSfKpQOGIZv/wynX+FZ2VTmG+R7PG+8jnH0p2mBl2zmsbHC
 +IwIwR3Brwzbe024M0lqa4AIo8wjpNFXjrgI9J9Y27e9v9RQigBXM9x3MRtuavSS1Z
 +hue6VisSfH1tXYeuuuhEsRDJPJenVaUA73rYQon8XZ5oWKcAawl4X67aRHCgQ35k9
 zGcu9LzqIa3L76OZa4jDJsVqr2Hy5OT7wg1fejSyvSJqLOQOtlq/6iIBBn5ifr+Lw3
 dIXEbyPWwYsCe+849pkIq5oXWq9CyDl8wyOxte+3Rb9pP7bryMMbJ3dV4+4sCPlBNI
 4HXC2qNjbKTiw==
Date: Tue, 23 May 2023 18:19:44 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daejun Park <daejun7.park@samsung.com>
Message-ID: <ZG1mMMPOO5himXhM@google.com>
References: <ZGV56DEz54529znm@google.com> <ZFqWr3sSYMsHtHAC@google.com>
 <20230508081042epcms2p8a637deae7de1829f54614e09d5fde5e5@epcms2p8>
 <20230511052416epcms2p617838faa71a203da6978c89ffd216e91@epcms2p6>
 <CGME20230508081042epcms2p8a637deae7de1829f54614e09d5fde5e5@epcms2p7>
 <20230518020801epcms2p717775d12022c5371fbe9dcdf226efd4c@epcms2p7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230518020801epcms2p717775d12022c5371fbe9dcdf226efd4c@epcms2p7>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 05/18, Daejun Park wrote: > > On 05/11, Daejun Park wrote:
    > > > > Sender : Jaegeuk Kim <jaegeuk@kernel.org> > > > > Date : 2023-05-10
    03:53 (GMT+9) > > > > Title : Re: [PATCH v6] f2fs: add async [...] 
 
 Content analysis details:   (-5.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q1dAT-0004te-1W
Subject: Re: [f2fs-dev] (2) (2) [PATCH v6] f2fs: add async reset zone
 command support
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 Seokhwan Kim <sukka.kim@samsung.com>, beomsu kim <beomsu7.kim@samsung.com>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDUvMTgsIERhZWp1biBQYXJrIHdyb3RlOgo+ID4gT24gMDUvMTEsIERhZWp1biBQYXJrIHdy
b3RlOgo+ID4gPiA+IFNlbmRlciA6IEphZWdldWsgS2ltwqA8amFlZ2V1a0BrZXJuZWwub3JnPgo+
ID4gPiA+IERhdGUgOiAyMDIzLTA1LTEwIDAzOjUzIChHTVQrOSkKPiA+ID4gPiBUaXRsZSA6IFJl
OiBbUEFUQ0ggdjZdIGYyZnM6IGFkZCBhc3luYyByZXNldCB6b25lIGNvbW1hbmQgc3VwcG9ydAo+
ID4gPiA+IFRvIDog67CV64yA7KSAPGRhZWp1bjcucGFya0BzYW1zdW5nLmNvbT4KPiA+ID4gPiBD
QyA6IGNoYW9Aa2VybmVsLm9yZzxjaGFvQGtlcm5lbC5vcmc+LCByb3N0ZWR0QGdvb2RtaXMub3Jn
PHJvc3RlZHRAZ29vZG1pcy5vcmc+LCBtaGlyYW1hdEBrZXJuZWwub3JnPG1oaXJhbWF0QGtlcm5l
bC5vcmc+LCBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDxsaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4sIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sIGxpbnV4LXRyYWNlLWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc8bGludXgtdHJhY2Uta2VybmVsQHZnZXIua2VybmVsLm9yZz4sIOq5gOyEne2Z
mDxzdWtrYS5raW1Ac2Ftc3VuZy5jb20+LCDshqHsmqnquLg8eW9uZ2dpbC5zb25nQHNhbXN1bmcu
Y29tPiwg6rmA67KU7IiYPGJlb21zdTcua2ltQHNhbXN1bmcuY29tPgo+ID4gPiA+IMKgCj4gPiA+
ID4gT24gMDUvMDgsIERhZWp1biBQYXJrIHdyb3RlOgo+ID4gPiA+ID4gdjUgLT4gdjYKPiA+ID4g
PiA+IEFkZGVkIHRyYWNlX2YyZnNfaW9zdGF0IHN1cHBvcnQgZm9yIHpvbmUgcmVzZXQgY29tbWFu
ZC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gdjQgLT4gdjUKPiA+ID4gPiA+IEFkZGVkIGYyZnMgaW9z
dGF0IGZvciB6b25lIHJlc2V0IGNvbW1hbmQuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IHYzIC0+IHY0
Cj4gPiA+ID4gPiBGaXhlZCBidWlsZCBlcnJvciBjYXVzZWQgYnkgdW51c2VkIGZ1bmN0aW9uLgo+
ID4gPiA+ID4gCj4gPiA+ID4gPiB2MiAtPiB2Mwo+ID4gPiA+ID4gTW9kaWZpZWQgYXJndW1lbnRz
IHRvIGJlIGNvcnJlY3QgZm9yIGZ0cmFjZSBwYXJhbWV0ZXIuCj4gPiA+ID4gPiBDaGFuZ2VkIF9f
c3VibWl0X3pvbmVfcmVzZXRfY21kIHRvIHZvaWQgcmV0dXJuLgo+ID4gPiA+ID4gUmVmYWN0b3Jl
ZCB0aGUgZjJmc193YWl0X2Rpc2NhcmRfYmlvIGZ1bmN0aW9uLgo+ID4gPiA+ID4gRml4ZWQgY29k
ZSB0aGF0IHdhcyBwcmV2aW91c2x5IGluY29ycmVjdGx5IG1lcmdlZC4KPiA+ID4gPiA+IAo+ID4g
PiA+ID4gdjEgLT4gdjIKPiA+ID4gPiA+IENoYW5nZWQgdG8gYXBwbHkgdGhlIG9wdGlvbmFsIGFz
eW5jIHJlc2V0IHdyaXRlIHBvaW50ZXIgYnkgZGVmYXVsdC4KPiA+ID4gPiAKPiA+ID4gPiBEb24n
dCBhZGQgdGhlIGhpc3RvcnkgaW4gdGhlIHBhdGNoIGRlc2NyaXB0aW9uLgo+ID4gPiAKPiA+ID4g
T0ssIEkgd2lsbCBkby4KPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoaXMgcGF0Y2ggZW5h
YmxlcyBzdWJtaXQgcmVzZXQgem9uZSBjb21tYW5kIGFzeW5jaG9ybm91c2x5LiBJdCBoZWxwcwo+
ID4gPiA+ID4gZGVjcmVhc2UgYXZlcmFnZSBsYXRlbmN5IG9mIHdyaXRlIElPcyBpbiBoaWdoIHV0
aWxpemF0aW9uIHNjZW5hcmlvIGJ5Cj4gPiA+ID4gPiBmYXN0ZXIgY2hlY2twb2ludGluZy4KPiA+
ID4gPiA+IAo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRGFlanVuIFBhcmsgPGRhZWp1bjcucGFy
a0BzYW1zdW5nLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gwqBmcy9mMmZzL2YyZnMuaCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHwgwqAxICsKPiA+ID4gPiA+IMKgZnMvZjJmcy9pb3N0YXQuYyDC
oCDCoCDCoCDCoCDCoCDCoHwgwqAxICsKPiA+ID4gPiA+IMKgZnMvZjJmcy9zZWdtZW50LmMgwqAg
wqAgwqAgwqAgwqAgfCA4NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4g
PiA+ID4gPiDCoGluY2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaCB8IDI0ICsrKysrKysrKy0tCj4g
PiA+ID4gPiDCoDQgZmlsZXMgY2hhbmdlZCwgMTA0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCj4gPiA+ID4gPiAKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2Zz
L2YyZnMvZjJmcy5oCj4gPiA+ID4gPiBpbmRleCBkMjExZWU4OWMxNTguLjUxYjY4YTYyOTgxNCAx
MDA2NDQKPiA+ID4gPiA+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gPiA+ID4gPiArKysgYi9mcy9m
MmZzL2YyZnMuaAo+ID4gPiA+ID4gQEAgLTExNzUsNiArMTE3NSw3IEBAIGVudW0gaW9zdGF0X3R5
cGUgewo+ID4gPiA+ID4gwqAgwqAgwqAgwqAgwqAvKiBvdGhlciAqLwo+ID4gPiA+ID4gwqAgwqAg
wqAgwqAgwqBGU19ESVNDQVJEX0lPLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oC8qIGRpc2NhcmQgKi8KPiA+ID4gPiA+IMKgIMKgIMKgIMKgIMKgRlNfRkxVU0hfSU8sIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyogZmx1c2ggKi8KPiA+ID4gPiA+ICsgwqAg
wqAgwqAgwqBGU19aT05FX1JFU0VUX0lPLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIHpvbmUg
cmVzZXQgKi8KPiA+ID4gPiA+IMKgIMKgIMKgIMKgIMKgTlJfSU9fVFlQRSwKPiA+ID4gPiA+IMKg
fTsKPiA+ID4gPiA+IMKgCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9pb3N0YXQuYyBi
L2ZzL2YyZnMvaW9zdGF0LmMKPiA+ID4gPiA+IGluZGV4IDNkNWJmYjFhZDU4NS4uZjg3MDMwMzhl
MWQ4IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZnMvZjJmcy9pb3N0YXQuYwo+ID4gPiA+ID4gKysr
IGIvZnMvZjJmcy9pb3N0YXQuYwo+ID4gPiA+ID4gQEAgLTgwLDYgKzgwLDcgQEAgaW50IF9fbWF5
YmVfdW51c2VkIGlvc3RhdF9pbmZvX3NlcV9zaG93KHN0cnVjdCBzZXFfZmlsZSAqc2VxLCB2b2lk
ICpvZmZzZXQpCj4gPiA+ID4gPiDCoCDCoCDCoCDCoCDCoHNlcV9wdXRzKHNlcSwgIltPVEhFUl1c
biIpOwo+ID4gPiA+ID4gwqAgwqAgwqAgwqAgwqBJT1NUQVRfSU5GT19TSE9XKCJmcyBkaXNjYXJk
IiwgRlNfRElTQ0FSRF9JTyk7Cj4gPiA+ID4gPiDCoCDCoCDCoCDCoCDCoElPU1RBVF9JTkZPX1NI
T1coImZzIGZsdXNoIiwgRlNfRkxVU0hfSU8pOwo+ID4gPiA+ID4gKyDCoCDCoCDCoCDCoElPU1RB
VF9JTkZPX1NIT1coImZzIHpvbmUgcmVzZXQiLCBGU19aT05FX1JFU0VUX0lPKTsKPiA+ID4gPiA+
IMKgCj4gPiA+ID4gPiDCoCDCoCDCoCDCoCDCoHJldHVybiAwOwo+ID4gPiA+ID4gwqB9Cj4gPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+
ID4gPiA+ID4gaW5kZXggNmRiNDEwZjFiYjhjLi40ODAyYjA1YTc5NWIgMTAwNjQ0Cj4gPiA+ID4g
PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+ID4gPiA+ID4gKysrIGIvZnMvZjJmcy9zZWdtZW50
LmMKPiA+ID4gPiA+IEBAIC0xMTk2LDYgKzExOTYsNDUgQEAgc3RhdGljIHZvaWQgX19pbml0X2Rp
c2NhcmRfcG9saWN5KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+ID4gPiA+IMKgc3RhdGlj
IHZvaWQgX191cGRhdGVfZGlzY2FyZF90cmVlX3JhbmdlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwKPiA+ID4gPiA+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgYmxvY2tfdCBsc3RhcnQsCj4gPiA+ID4g
PiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJsb2Nr
X3Qgc3RhcnQsIGJsb2NrX3QgbGVuKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsjaWZkZWYgQ09O
RklHX0JMS19ERVZfWk9ORUQKPiA+ID4gPiA+ICtzdGF0aWMgdm9pZCBfX3N1Ym1pdF96b25lX3Jl
c2V0X2NtZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPiA+ID4gCj4gPiA+ID4gV2h5IGNh
bid0IHdlIHVzZSBfX2YyZnNfaXNzdWVfZGlzY2FyZF96b25lKCk/Cj4gPiA+IAo+ID4gPiBJbiBt
eSB1bmRlcnN0YW5kaW5nLCBfX2YyZnNfaXNzdWVfZGlzY2FyZF96b25lIGlzIHVzZWQgdG8gcXVl
dWUgdGhlIHpvbmUgcmVzZXQgY29tbWFuZC4KPiA+ID4gV2hpY2ggcG9pbnQgZG8geW91IHRoaW5r
IGlzIHRoZSBpc3N1ZT8KPiA+IAo+ID4gVGhhdCBhY3R1YWxseSBjYWxscyBibGtkZXZfem9uZV9t
Z210KCkgd2hpY2ggaXMgZG9pbmcgdGhlIHNhbWUgdGhpbmcuCj4gCj4gZjJmc19jbGVhcl9wcmVm
cmVlX3NlZ21lbnRzIC0+IGYyZnNfaXNzdWVfZGlzY2FyZCAtPiBfX2lzc3VlX2Rpc2NhcmRfYXN5
bmMgLT4gX19mMmZzX2lzc3VlX2Rpc2NhcmRfem9uZQo+IEluIHRoZSBjYXNlIG9mIGRpc2NhcmQg
aW4gdGhlIGV4aXN0aW5nIGNvZGUsIGRpc2NhcmQgY2FuIGJlIHF1ZXVlZCBieSBfX3F1ZXVlX2Rp
c2NhcmRfY21kKCkuIEhvd2V2ZXIgdGhlIHJlc2V0IGNvbW1hbmQgaXMgaXNzdWVkIGltbWVkaWF0
ZWx5Lgo+IAo+IEluIHRoaXMgcGF0Y2gsIEkgY2hhbmdlZCB0aGUgem9uZSByZXNldCBjb21tYW5k
IGNhbiBiZSBxdWV1ZWQgbGlrZSBkaXNjYXJkIGNvbW1hbmQuCj4gVGhlcmVmb3JlLCBJIGNoYW5n
ZWQgX19mMmZzX2lzc3VlX2Rpc2NhcmRfem9uZSgpIHRvIHF1ZXVlIHRoZSByZXNldCBjb21tYW5k
LCBhbmQgdG8gaXNzdWUgdGhlIHJlc2V0IGNvbW1hbmQgdGhyb3VnaCBfX3N1Ym1pdF9kaXNjYXJk
X2NtZCgpIC0+IF9fc3VibWl0X3pvbmVfcmVzZXRfY21kKCkuCj4gCj4gQWxzbywgaW4gYmxrZGV2
X3pvbmVfbWdtdCgpLCBiaV9lbmRfaW8gY2Fubm90IGJlIHNwZWNpZmllZCwgc28gd2FpdGluZyBp
biBmMmZzX3dhaXRfZGlzY2FyZF9iaW8oKSBpcyBub3QgcG9zc2libGUuCj4gVGhhdCdzIHdoeSBJ
IGNyZWF0ZWQgYSBuZXcgX19zdWJtaXRfem9uZV9yZXNldF9jbWQoKS4KCkhtbSwgSSB3YXMgdGhp
bmtpbmcgd2hldGhlciB0aGVyZSdzIGFueSBjaGFuY2UgdG8gcmV1c2UgX19xdWV1ZV9kaXNjYXJk
X2NtZCgpIGluCl9faXNzdWVfZGlzY2FyZF9hc3luYygpIGZvciB0aGUgem9uZV9yZXNldCBjb21t
YW5kLiBMZXQgbWUgdGFrZSBhIGxvb2sgYXQgaW4KYW5vdGhlciB2aWV3LgoKPiAKPiA+IAo+ID4g
PiAKPiA+ID4gPiAKPiA+ID4gPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0IGRpc2NhcmRfY21kICpkYywgYmxrX29wZl90IGZsYWcs
Cj4gPiA+ID4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHN0cnVjdCBsaXN0X2hlYWQgKndhaXRfbGlzdCwKPiA+ID4gPiA+ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdW5zaWduZWQgaW50ICpp
c3N1ZWQpCj4gPiA+ID4gPiArewo+ID4gPiA+ID4gKyDCoCDCoCDCoCDCoHN0cnVjdCBkaXNjYXJk
X2NtZF9jb250cm9sICpkY2MgPSBTTV9JKHNiaSktPmRjY19pbmZvOwo+ID4gPiA+ID4gKyDCoCDC
oCDCoCDCoHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYgPSBkYy0+YmRldjsKPiA+ID4gPiA+ICsg
wqAgwqAgwqAgwqBzdHJ1Y3QgYmlvICpiaW8gPSBiaW9fYWxsb2MoYmRldiwgMCwgUkVRX09QX1pP
TkVfUkVTRVQgfCBmbGFnLCBHRlBfTk9GUyk7Cj4gPiA+ID4gPiArIMKgIMKgIMKgIMKgdW5zaWdu
ZWQgbG9uZyBmbGFnczsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgwqAgwqAgwqAgwqB0cmFjZV9m
MmZzX2lzc3VlX3Jlc2V0X3pvbmUoYmRldiwgZGMtPmRpLnN0YXJ0KTsKPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ICsgwqAgwqAgwqAgwqBzcGluX2xvY2tfaXJxc2F2ZSgmZGMtPmxvY2ssIGZsYWdzKTsK
PiA+ID4gPiA+ICsgwqAgwqAgwqAgwqBkYy0+c3RhdGUgPSBEX1NVQk1JVDsKPiA+ID4gPiA+ICsg
wqAgwqAgwqAgwqBkYy0+YmlvX3JlZisrOwo+ID4gPiA+ID4gKyDCoCDCoCDCoCDCoHNwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJmRjLT5sb2NrLCBmbGFncyk7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAr
IMKgIMKgIMKgIMKgaWYgKGlzc3VlZCkKPiA+ID4gPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAoKmlzc3VlZCkrKzsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgwqAgwqAgwqAgwqBhdG9taWNf
aW5jKCZkY2MtPnF1ZXVlZF9kaXNjYXJkKTsKPiA+ID4gPiA+ICsgwqAgwqAgwqAgwqBkYy0+cXVl
dWVkKys7Cj4gPiA+ID4gPiArIMKgIMKgIMKgIMKgbGlzdF9tb3ZlX3RhaWwoJmRjLT5saXN0LCB3
YWl0X2xpc3QpOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyDCoCDCoCDCoCDCoC8qIHNhbml0eSBj
aGVjayBvbiBkaXNjYXJkIHJhbmdlICovCj4gPiA+ID4gPiArIMKgIMKgIMKgIMKgX19jaGVja19z
aXRfYml0bWFwKHNiaSwgZGMtPmRpLmxzdGFydCwgZGMtPmRpLmxzdGFydCArIGRjLT5kaS5sZW4p
Owo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyDCoCDCoCDCoCDCoGJpby0+YmlfaXRlci5iaV9zZWN0
b3IgPSBTRUNUT1JfRlJPTV9CTE9DSyhkYy0+ZGkuc3RhcnQpOwo+ID4gPiA+ID4gKyDCoCDCoCDC
oCDCoGJpby0+YmlfcHJpdmF0ZSA9IGRjOwo+ID4gPiA+ID4gKyDCoCDCoCDCoCDCoGJpby0+Ymlf
ZW5kX2lvID0gZjJmc19zdWJtaXRfZGlzY2FyZF9lbmRpbzsKPiA+ID4gPiA+ICsgwqAgwqAgwqAg
wqBzdWJtaXRfYmlvKGJpbyk7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArIMKgIMKgIMKgIMKgYXRv
bWljX2luYygmZGNjLT5pc3N1ZWRfZGlzY2FyZCk7Cj4gPiA+ID4gPiArIMKgIMKgIMKgIMKgZjJm
c191cGRhdGVfaW9zdGF0KHNiaSwgTlVMTCwgRlNfWk9ORV9SRVNFVF9JTywgZGMtPmRpLmxlbiAq
IEYyRlNfQkxLU0laRSk7Cj4gPiA+ID4gPiArfQo+ID4gPiA+ID4gKyNlbmRpZgo+ID4gPiA+ID4g
Kwo+ID4gPiA+ID4gwqAvKiB0aGlzIGZ1bmN0aW9uIGlzIGNvcGllZCBmcm9tIGJsa2Rldl9pc3N1
ZV9kaXNjYXJkIGZyb20gYmxvY2svYmxrLWxpYi5jICovCj4gPiA+ID4gPiDCoHN0YXRpYyBpbnQg
X19zdWJtaXRfZGlzY2FyZF9jbWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gPiA+ID4g
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3Qg
ZGlzY2FyZF9wb2xpY3kgKmRwb2xpY3ksCj4gPiA+ID4gPiBAQCAtMTIxNyw2ICsxMjU2LDEzIEBA
IHN0YXRpYyBpbnQgX19zdWJtaXRfZGlzY2FyZF9jbWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LAo+ID4gPiA+ID4gwqAgwqAgwqAgwqAgwqBpZiAoaXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJX05F
RURfRlNDSykpCj4gPiA+ID4gPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAwOwo+
ID4gPiA+ID4gwqAKPiA+ID4gPiA+ICsjaWZkZWYgQ09ORklHX0JMS19ERVZfWk9ORUQKPiA+ID4g
PiA+ICsgwqAgwqAgwqAgwqBpZiAoZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSAmJiBiZGV2X2lz
X3pvbmVkKGJkZXYpKSB7Cj4gPiA+ID4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgX19zdWJt
aXRfem9uZV9yZXNldF9jbWQoc2JpLCBkYywgZmxhZywgd2FpdF9saXN0LCBpc3N1ZWQpOwo+ID4g
PiA+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAwOwo+ID4gPiA+ID4gKyDCoCDC
oCDCoCDCoH0KPiA+ID4gPiA+ICsjZW5kaWYKPiA+ID4gPiA+ICsKPiA+ID4gPiA+IMKgIMKgIMKg
IMKgIMKgdHJhY2VfZjJmc19pc3N1ZV9kaXNjYXJkKGJkZXYsIGRjLT5kaS5zdGFydCwgZGMtPmRp
Lmxlbik7Cj4gPiA+ID4gPiDCoAo+ID4gPiA+ID4gwqAgwqAgwqAgwqAgwqBsc3RhcnQgPSBkYy0+
ZGkubHN0YXJ0Owo+ID4gPiA+ID4gQEAgLTE0NjEsNiArMTUwNywxOSBAQCBzdGF0aWMgdm9pZCBf
X3VwZGF0ZV9kaXNjYXJkX3RyZWVfcmFuZ2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4g
PiA+ID4gwqAgwqAgwqAgwqAgwqB9Cj4gPiA+ID4gPiDCoH0KPiA+ID4gPiA+IMKgCj4gPiA+ID4g
PiArI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4gPiA+ID4gPiArc3RhdGljIHZvaWQgX19x
dWV1ZV96b25lX3Jlc2V0X2NtZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPiA+ID4gPiAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgYmxvY2tf
dCBibGtzdGFydCwgYmxvY2tfdCBsYmxrc3RhcnQsCj4gPiA+ID4gPiArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgYmxvY2tfdCBibGtsZW4pCj4gPiA+ID4gPiArewo+ID4gPiA+ID4gKyDCoCDCoCDC
oCDCoHRyYWNlX2YyZnNfcXVldWVfcmVzZXRfem9uZShiZGV2LCBibGtzdGFydCk7Cj4gPiA+ID4g
PiArCj4gPiA+ID4gPiArIMKgIMKgIMKgIMKgbXV0ZXhfbG9jaygmU01fSShzYmkpLT5kY2NfaW5m
by0+Y21kX2xvY2spOwo+ID4gPiA+ID4gKyDCoCDCoCDCoCDCoF9faW5zZXJ0X2Rpc2NhcmRfY21k
KHNiaSwgYmRldiwgbGJsa3N0YXJ0LCBibGtzdGFydCwgYmxrbGVuKTsKPiA+ID4gPiA+ICsgwqAg
wqAgwqAgwqBtdXRleF91bmxvY2soJlNNX0koc2JpKS0+ZGNjX2luZm8tPmNtZF9sb2NrKTsKPiA+
ID4gPiA+ICt9Cj4gPiA+ID4gPiArI2VuZGlmCj4gPiA+ID4gPiArCj4gPiA+ID4gPiDCoHN0YXRp
YyB2b2lkIF9fcXVldWVfZGlzY2FyZF9jbWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4g
PiA+ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2
LCBibG9ja190IGJsa3N0YXJ0LCBibG9ja190IGJsa2xlbikKPiA+ID4gPiA+IMKgewo+ID4gPiA+
ID4gQEAgLTE3MjQsNiArMTc4MywxOSBAQCBzdGF0aWMgdm9pZCBmMmZzX3dhaXRfZGlzY2FyZF9i
aW8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9ja190IGJsa2FkZHIpCj4gPiA+ID4gPiDC
oAo+ID4gPiA+ID4gwqAgwqAgwqAgwqAgwqBtdXRleF9sb2NrKCZkY2MtPmNtZF9sb2NrKTsKPiA+
ID4gPiA+IMKgIMKgIMKgIMKgIMKgZGMgPSBfX2xvb2t1cF9kaXNjYXJkX2NtZChzYmksIGJsa2Fk
ZHIpOwo+ID4gPiA+ID4gKyNpZmRlZiBDT05GSUdfQkxLX0RFVl9aT05FRAo+ID4gPiA+ID4gKyDC
oCDCoCDCoCDCoGlmIChkYyAmJiBmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpICYmIGJkZXZfaXNf
em9uZWQoZGMtPmJkZXYpKSB7Cj4gPiA+ID4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyog
Zm9yY2Ugc3VibWl0IHpvbmUgcmVzZXQgKi8KPiA+ID4gPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpZiAoZGMtPnN0YXRlID09IERfUFJFUCkKPiA+ID4gPiA+ICsgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBfX3N1Ym1pdF96b25lX3Jlc2V0X2NtZChzYmksIGRjLCBSRVFf
U1lOQywKPiA+ID4gPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZGNjLT53YWl0X2xpc3QsIE5VTEwpOwo+
ID4gPiA+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRjLT5yZWYrKzsKPiA+ID4gPiA+ICsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtdXRleF91bmxvY2soJmRjYy0+Y21kX2xvY2spOwo+ID4g
PiA+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIHdhaXQgem9uZSByZXNldCAqLwo+ID4g
PiA+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9fd2FpdF9vbmVfZGlzY2FyZF9iaW8oc2Jp
LCBkYyk7Cj4gPiA+ID4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuOwo+ID4gPiA+
ID4gKyDCoCDCoCDCoCDCoH0KPiA+ID4gPiA+ICsjZW5kaWYKPiA+ID4gPiA+IMKgIMKgIMKgIMKg
IMKgaWYgKGRjKSB7Cj4gPiA+ID4gPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChkYy0+
c3RhdGUgPT0gRF9QUkVQKSB7Cj4gPiA+ID4gPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoF9fcHVuY2hfZGlzY2FyZF9jbWQoc2JpLCBkYywgYmxrYWRkcik7Cj4gPiA+ID4g
PiBAQCAtMTg3Niw5ICsxOTQ4LDE1IEBAIHN0YXRpYyBpbnQgX19mMmZzX2lzc3VlX2Rpc2NhcmRf
em9uZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPiA+ID4gPiDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBibGtzdGFydCwgYmxrbGVuKTsKPiA+
ID4gPiA+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FSU87
Cj4gPiA+ID4gPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0KPiA+ID4gPiA+IC0gwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB0cmFjZV9mMmZzX2lzc3VlX3Jlc2V0X3pvbmUoYmRldiwgYmxrc3Rh
cnQpOwo+ID4gPiA+ID4gLSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiBibGtkZXZfem9u
ZV9tZ210KGJkZXYsIFJFUV9PUF9aT05FX1JFU0VULAo+ID4gPiA+ID4gLSDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNlY3RvciwgbnJf
c2VjdHMsIEdGUF9OT0ZTKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBpZiAodW5saWtlbHkoaXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJX1BPUl9ET0lORykp
KSB7Cj4gPiA+ID4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHJhY2Vf
ZjJmc19pc3N1ZV9yZXNldF96b25lKGJkZXYsIGJsa3N0YXJ0KTsKPiA+ID4gPiA+ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gYmxrZGV2X3pvbmVfbWdtdChiZGV2
LCBSRVFfT1BfWk9ORV9SRVNFVCwKPiA+ID4gPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzZWN0b3IsIG5y
X3NlY3RzLCBHRlBfTk9GUyk7Cj4gPiA+ID4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfQo+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9fcXVldWVfem9u
ZV9yZXNldF9jbWQoc2JpLCBiZGV2LCBibGtzdGFydCwgbGJsa3N0YXJ0LCBibGtsZW4pOwo+ID4g
PiA+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAwOwo+ID4gPiA+ID4gwqAgwqAg
wqAgwqAgwqB9Cj4gPiA+ID4gPiDCoAo+ID4gPiA+ID4gwqAgwqAgwqAgwqAgwqAvKiBGb3IgY29u
dmVudGlvbmFsIHpvbmVzLCB1c2UgcmVndWxhciBkaXNjYXJkIGlmIHN1cHBvcnRlZCAqLwo+ID4g
PiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaCBiL2luY2x1ZGUv
dHJhY2UvZXZlbnRzL2YyZnMuaAo+ID4gPiA+ID4gaW5kZXggOTljYmM1OTQ5ZTNjLi43OTNmODJj
YzE1MTUgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9pbmNsdWRlL3RyYWNlL2V2ZW50cy9mMmZzLmgK
PiA+ID4gPiA+ICsrKyBiL2luY2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaAo+ID4gPiA+ID4gQEAg
LTE1MTIsNyArMTUxMiw3IEBAIERFRklORV9FVkVOVChmMmZzX2Rpc2NhcmQsIGYyZnNfcmVtb3Zl
X2Rpc2NhcmQsCj4gPiA+ID4gPiDCoCDCoCDCoCDCoCDCoFRQX0FSR1MoZGV2LCBibGtzdGFydCwg
YmxrbGVuKQo+ID4gPiA+ID4gwqApOwo+ID4gPiA+ID4gwqAKPiA+ID4gPiA+IC1UUkFDRV9FVkVO
VChmMmZzX2lzc3VlX3Jlc2V0X3pvbmUsCj4gPiA+ID4gPiArREVDTEFSRV9FVkVOVF9DTEFTUyhm
MmZzX3Jlc2V0X3pvbmUsCj4gPiA+ID4gPiDCoAo+ID4gPiA+ID4gwqAgwqAgwqAgwqAgwqBUUF9Q
Uk9UTyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpkZXYsIGJsb2NrX3QgYmxrc3RhcnQpLAo+ID4gPiA+
ID4gwqAKPiA+ID4gPiA+IEBAIC0xNTI4LDExICsxNTI4LDI1IEBAIFRSQUNFX0VWRU5UKGYyZnNf
aXNzdWVfcmVzZXRfem9uZSwKPiA+ID4gPiA+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgX19l
bnRyeS0+Ymxrc3RhcnQgPSBibGtzdGFydDsKPiA+ID4gPiA+IMKgIMKgIMKgIMKgIMKgKSwKPiA+
ID4gPiA+IMKgCj4gPiA+ID4gPiAtIMKgIMKgIMKgIMKgVFBfcHJpbnRrKCJkZXYgPSAoJWQsJWQp
LCByZXNldCB6b25lIGF0IGJsb2NrID0gMHglbGx4IiwKPiA+ID4gPiA+ICsgwqAgwqAgwqAgwqBU
UF9wcmludGsoImRldiA9ICglZCwlZCksIHpvbmUgYXQgYmxvY2sgPSAweCVsbHgiLAo+ID4gPiA+
ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzaG93X2RldihfX2VudHJ5LT5kZXYpLAo+ID4g
PiA+ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAodW5zaWduZWQgbG9uZyBsb25nKV9fZW50
cnktPmJsa3N0YXJ0KQo+ID4gPiA+ID4gwqApOwo+ID4gPiA+ID4gwqAKPiA+ID4gPiA+ICtERUZJ
TkVfRVZFTlQoZjJmc19yZXNldF96b25lLCBmMmZzX3F1ZXVlX3Jlc2V0X3pvbmUsCj4gPiA+ID4g
PiArCj4gPiA+ID4gPiArIMKgIMKgIMKgIMKgVFBfUFJPVE8oc3RydWN0IGJsb2NrX2RldmljZSAq
ZGV2LCBibG9ja190IGJsa3N0YXJ0KSwKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgwqAgwqAgwqAg
wqBUUF9BUkdTKGRldiwgYmxrc3RhcnQpCj4gPiA+ID4gPiArKTsKPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ICtERUZJTkVfRVZFTlQoZjJmc19yZXNldF96b25lLCBmMmZzX2lzc3VlX3Jlc2V0X3pvbmUs
Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArIMKgIMKgIMKgIMKgVFBfUFJPVE8oc3RydWN0IGJsb2Nr
X2RldmljZSAqZGV2LCBibG9ja190IGJsa3N0YXJ0KSwKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsg
wqAgwqAgwqAgwqBUUF9BUkdTKGRldiwgYmxrc3RhcnQpCj4gPiA+ID4gPiArKTsKPiA+ID4gPiA+
ICsKPiA+ID4gPiA+IMKgVFJBQ0VfRVZFTlQoZjJmc19pc3N1ZV9mbHVzaCwKPiA+ID4gPiA+IMKg
Cj4gPiA+ID4gPiDCoCDCoCDCoCDCoCDCoFRQX1BST1RPKHN0cnVjdCBibG9ja19kZXZpY2UgKmRl
diwgdW5zaWduZWQgaW50IG5vYmFycmllciwKPiA+ID4gPiA+IEBAIC0xOTc5LDYgKzE5OTMsNyBA
QCBUUkFDRV9FVkVOVChmMmZzX2lvc3RhdCwKPiA+ID4gPiA+IMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgX19maWVsZCh1bnNpZ25lZCBsb25nIGxvbmcsIMKgIMKgIMKgIMKgZnNfbnJpbykKPiA+
ID4gPiA+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgX19maWVsZCh1bnNpZ25lZCBsb25nIGxv
bmcsIMKgIMKgIMKgIMKgZnNfbXJpbykKPiA+ID4gPiA+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgX19maWVsZCh1bnNpZ25lZCBsb25nIGxvbmcsIMKgIMKgIMKgIMKgZnNfZGlzY2FyZCkKPiA+
ID4gPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfX2ZpZWxkKHVuc2lnbmVkIGxvbmcgbG9u
ZywgwqAgwqAgwqAgwqBmc19yZXNldF96b25lKQo+ID4gPiA+ID4gwqAgwqAgwqAgwqAgwqApLAo+
ID4gPiA+ID4gwqAKPiA+ID4gPiA+IMKgIMKgIMKgIMKgIMKgVFBfZmFzdF9hc3NpZ24oCj4gPiA+
ID4gPiBAQCAtMjAxMCwxMiArMjAyNSwxNCBAQCBUUkFDRV9FVkVOVChmMmZzX2lvc3RhdCwKPiA+
ID4gPiA+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgX19lbnRyeS0+ZnNfbnJpbyDCoCDCoCDC
oCDCoD0gaW9zdGF0W0ZTX05PREVfUkVBRF9JT107Cj4gPiA+ID4gPiDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoF9fZW50cnktPmZzX21yaW8gwqAgwqAgwqAgwqA9IGlvc3RhdFtGU19NRVRBX1JF
QURfSU9dOwo+ID4gPiA+ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfX2VudHJ5LT5mc19k
aXNjYXJkIMKgIMKgIMKgIMKgPSBpb3N0YXRbRlNfRElTQ0FSRF9JT107Cj4gPiA+ID4gPiArIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgX19lbnRyeS0+ZnNfcmVzZXRfem9uZSDCoCDCoCDCoCDCoD0g
aW9zdGF0W0ZTX1pPTkVfUkVTRVRfSU9dOwo+ID4gPiA+ID4gwqAgwqAgwqAgwqAgwqApLAo+ID4g
PiA+ID4gwqAKPiA+ID4gPiA+IMKgIMKgIMKgIMKgIMKgVFBfcHJpbnRrKCJkZXYgPSAoJWQsJWQp
LCAiCj4gPiA+ID4gPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCJhcHAgW3dyaXRlPSVsbHUg
KGRpcmVjdD0lbGx1LCBidWZmZXJlZD0lbGx1KSwgbWFwcGVkPSVsbHUsICIKPiA+ID4gPiA+IMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgImNvbXByKGJ1ZmZlcmVkPSVsbHUsIG1hcHBlZD0lbGx1
KV0sICIKPiA+ID4gPiA+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAiZnMgW2RhdGE9JWxsdSwg
Y2RhdGE9JWxsdSwgbm9kZT0lbGx1LCBtZXRhPSVsbHUsIGRpc2NhcmQ9JWxsdV0sICIKPiA+ID4g
PiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAiZnMgW2RhdGE9JWxsdSwgY2RhdGE9JWxsdSwg
bm9kZT0lbGx1LCBtZXRhPSVsbHUsIGRpc2NhcmQ9JWxsdSwgIgo+ID4gPiA+ID4gKyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCJyZXNldF96b25lPSVsbHVdLCAiCj4gPiA+ID4gPiDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCJnYyBbZGF0YT0lbGx1LCBub2RlPSVsbHVdLCAiCj4gPiA+ID4gPiDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCJjcCBbZGF0YT0lbGx1LCBub2RlPSVsbHUsIG1ldGE9
JWxsdV0sICIKPiA+ID4gPiA+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgImFwcCBbcmVhZD0l
bGx1IChkaXJlY3Q9JWxsdSwgYnVmZmVyZWQ9JWxsdSksIG1hcHBlZD0lbGx1XSwgIgo+ID4gPiA+
ID4gQEAgLTIwMjYsNiArMjA0Myw3IEBAIFRSQUNFX0VWRU5UKGYyZnNfaW9zdGF0LAo+ID4gPiA+
ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfX2VudHJ5LT5hcHBfYmlvLCBfX2VudHJ5LT5h
cHBfbWlvLCBfX2VudHJ5LT5hcHBfYmNkaW8sCj4gPiA+ID4gPiDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoF9fZW50cnktPmFwcF9tY2RpbywgX19lbnRyeS0+ZnNfZGlvLCBfX2VudHJ5LT5mc19j
ZGlvLAo+ID4gPiA+ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfX2VudHJ5LT5mc19uaW8s
IF9fZW50cnktPmZzX21pbywgX19lbnRyeS0+ZnNfZGlzY2FyZCwKPiA+ID4gPiA+ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBfX2VudHJ5LT5mc19yZXNldF96b25lLAo+ID4gPiA+ID4gwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBfX2VudHJ5LT5mc19nY19kaW8sIF9fZW50cnktPmZzX2djX25p
bywgX19lbnRyeS0+ZnNfY3BfZGlvLAo+ID4gPiA+ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBfX2VudHJ5LT5mc19jcF9uaW8sIF9fZW50cnktPmZzX2NwX21pbywKPiA+ID4gPiA+IMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgX19lbnRyeS0+YXBwX3JpbywgX19lbnRyeS0+YXBwX2RyaW8s
IF9fZW50cnktPmFwcF9icmlvLAo+ID4gPiA+ID4gLS0gCj4gPiA+ID4gPiAyLjI1LjEKPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
