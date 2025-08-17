Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A271B29190
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Aug 2025 06:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:Message-ID:MIME-Version:References:In-Reply-To:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkoqLtwqKm7JdQsj38WmwwwVSFLiTic89gqeg4pESII=; b=gZ3Uc7RNi+7rnuRexvkQ0lf6+L
	MuACismP3JuEBjzn9dgPXV2cM7hCkj6MCiDREGb+O2TMYFf3TF/WaoDSHFHJrg/+C9vZWhYcm0ST1
	ObiIMuiZsVFW6cyA+Qg7KaSvUNhvNGFS9IHBMoB+Igdl1stSb3ENOUF+r953DKmOvVQM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1unVFu-00070O-F2;
	Sun, 17 Aug 2025 04:44:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1unVFM-0006wt-9b
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Aug 2025 04:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P3VOaa2AHqjcGObv6vHwnEfq1cYCBzytJb2Lv6uoxLc=; b=R4fJPdeULTPivivrCHGdHhXGOX
 49Klv5/awc1jj0r8jTHSvHENovAan5aAvSXsFY8827J4xBNEF1Sqg6Qt/0veWJuySwq2dyyZpqv3M
 9yZwsQbNfzM/goejTqSMlwX3sDBVQs4dOnbFmC4SR2LApj6UopqdHQTyEQAOzTxBk1Vo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References
 :In-Reply-To:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P3VOaa2AHqjcGObv6vHwnEfq1cYCBzytJb2Lv6uoxLc=; b=eV6aSHN0G0zoI9/EVrDuOy8SzC
 Uesyqr+au0//YQwr+lwre0DYgd1UuUC2pvBsFXV7BFm7g0zsO8sJGiMghdejuGGYucPMXTM9nBqLb
 d9UPt+KsRSYGxrTbDoDEFoAFIu/9Ny8h+/9FNwbjcqoHobFUZt1s1eWfKFstheQ5VpFg=;
Received: from m16.mail.126.com ([117.135.210.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1unVFM-0006TO-0t for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Aug 2025 04:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=TTUBPNPGlI/pbOhVvgZ3yq4pwbsl1IdZ8XlTgeU2je8=; b=Z
 qWuRZOHVv42DOWA7lmZrS5T2RT7r8sMZgEZd0LkTIKIK8fn/aSVpbiVFwOMdi5e/
 zN14ZRHH3qYUgZO56ujLR6nvRmGcgdHoaV81amxsp9yYf+0zgX/mCedep/aB5nHW
 hnbW0G6kwuceGZ1u7dK7fdiXDppfLdkxFlnTErrbQs=
Received: from nzzhao$126.com ( [112.86.116.50] ) by
 ajax-webmail-wmsvr-41-110 (Coremail) ; Sun, 17 Aug 2025 12:43:11 +0800
 (CST)
X-Originating-IP: [112.86.116.50]
Date: Sun, 17 Aug 2025 12:43:11 +0800 (CST)
From: "Nanzhe Zhao" <nzzhao@126.com>
To: "Christoph Hellwig" <hch@infradead.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 126com
In-Reply-To: <e81c31e.56a.198a604868e.Coremail.nzzhao@126.com>
References: <20250813092131.44762-1-nzzhao@126.com>
 <aJytvfsMcR2hzWKI@infradead.org>
 <e81c31e.56a.198a604868e.Coremail.nzzhao@126.com>
X-NTES-SC: AL_Qu2eB/ibuk8i5yWRZOkfmUgRgOw3XMSyu/oi2o9UO5FwjDHjwAEMdlNvPmP86+SWEwalmwasXgpj785Bco1jU44bXwcKXxuA31xYV6iKzEAS+w==
MIME-Version: 1.0
Message-ID: <6be3b4b7.83a.198b656b16c.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bikvCgD3v9XfXaFoM9AbAA--.3364W
X-CM-SenderInfo: xq22xtbr6rjloofrz/1tbiZBWrz2igkwCEcQAKsx
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There's another important reason to utilize an
 f2fs_iomap_folio_state.
 Because f2fs doesn't possess a per block state tracking data structure like
 buffer heads or subpages, it can't track per block dirty state or read/write
 bytes pending itself. Growing such a structure [...] 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [117.135.210.6 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
X-Headers-End: 1unVFM-0006TO-0t
Subject: Re: [f2fs-dev] [RFC PATCH 0/9] f2fs: Enable buffered read/write
 large folios support with extended iomap
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
Cc: Yi Zhang <yi.zhang@huawei.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

ClRoZXJlJ3MgYW5vdGhlciBpbXBvcnRhbnQgcmVhc29uIHRvIHV0aWxpemUgYW4gZjJmc19pb21h
cF9mb2xpb19zdGF0ZS7CoAoKQmVjYXVzZSBmMmZzIGRvZXNuJ3QgcG9zc2VzcyBhIHBlciBibG9j
ayBzdGF0ZSB0cmFja2luZyBkYXRhIHN0cnVjdHVyZSAKbGlrZSBidWZmZXIgaGVhZHMgb3Igc3Vi
cGFnZXMswqBpdCBjYW4ndCB0cmFjayBwZXIgYmxvY2sgZGlydHkgc3RhdGUgb3IgCnJlYWQvd3Jp
dGUgYnl0ZXMgcGVuZGluZyBpdHNlbGYuIEdyb3dpbmcgc3VjaCBhIHN0cnVjdHVyZSBmb3IgZjJm
cyBhbmQgIAphcHBseWluZyBpdCB0byBhbGwgY29kZSBwYXRocyBjb3VsZCBiZSBhIHRyZW1lbmRv
dXMgYW5kIGRlc3RydWN0aXZlIAp0YXNrLsKgCgpTbyBJIHRoaW5rIGl0J3MgY29udmVuaWVudCB0
byBwb3NzZXNzIGFuIGYyZnMgb3duIHBlciBmb2xpbyAKcHJpdmF0ZSBkYXRhIHN0cnVjdHVyZSB0
aGF0IGNhbiBib3RoIGJlIGNvbXBhdGlibGXCoAp3aXRoIGlvbWFwIGFuZCBmMmZzJ3MgIG5lZWRz
LCBlc3BlY2lhbGx5IGhlbHBmdWwgZm9yIG90aGVyIGYyZnMncyBpL28gcGF0aHMKIHRoYXQgbmVl
ZCB0byAgc3VwcG9ydMKgbGFyZ2UgZm9saW9zIGFsdG9nZXRoZXIgd2l0aCBidWZmZXJlZCBpbyBi
dXQgY2FuJ3QgCmdvIGludG8gaW9tYXAgIHBhdGggKGkuZS4sIGdhcmJhZ2UgY29sbGVjdGlvbiku
CgogSXQgY2FuIGFsc28gYmUgZXh0ZW5kZWQgd2l0aCBmaWVsZHMgdG8KIG1lZXQgdGhlIG5lZWRz
IG9mIG90aGVyIHR5cGVzIG9mIGYyZnMgZmlsZXMgKGUuZy4sIGNvbXByZXNzZWQgZmlsZXMpIGlm
CiB0aGV5IG5lZWQgdG8gc3VwcG9ydCBsYXJnZSBmb2xpb3MgdG9vLgoKCgoKCkF0IDIwMjUtMDgt
MTQgMDg6Mzk6MzEsICLotbXljZflk7IgIiA8bnp6aGFvQDEyNi5jb20+IHdyb3RlOgo+SGkgTXIu
Q2hyaXN0b3BoLAo+Cj5UaGFua3MgZm9yIHRoZSBxdWljayBmZWVkYmFjayEKPgo+PiBUaGF0J3Mg
cHJldHR5IHVnbHkuICBXaGF0IGFkZGl0aW9uYWwgZmxhZ3MgZG8geW91IG5lZWQ/ICAKPgo+RjJG
UyBjYW4gdXRpbGl6ZSB0aGUgZm9saW8ncyBwcml2YXRlIGZpZWxkIGluIGEgbm9uLXBvaW50ZXIg
bW9kZSB0byBzdG9yZSBpdHMgZXh0cmEgZmxhZ3MsIHdoaWNoIGluZGljYXRlIHRoZSBmb2xpbydz
IGFkZGl0aW9uYWwgc3RhdHVzLiAKPlBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGUgZjJmcy5oIGZp
bGUgZnJvbSBQQUdFX1BSSVZBVEVfR0VUX0ZVTkMgdG8gdGhlIGVuZCBvZiBjbGVhcl9wYWdlX3By
aXZhdGVfYWxsKCkuCj4KPlRoZXNlIGZsYWdzIHBlcnNpc3QgdGhyb3VnaG91dCB0aGUgZW50aXJl
IGxpZmV0aW1lIG9mIGEgZm9saW8sIHdoaWNoIGNvbmZsaWN0cyB3aXRoIHRoZSBpb21hcF9mb2xp
b19zdGF0ZSBwb2ludGVyLgo+Q3VycmVudGx5LCB0aGUgcHJpdmF0ZSBmaWVsZHMgb2YgaW9tYXAn
cyBleGlzdGluZyBkYXRhIHN0cnVjdHVyZXMsbmFtZWx5IHN0cnVjdCBpb21hcCdzIHByaXZhdGUs
IHN0cnVjdCBpb21hcF9pdGVyJ3MgcHJpdmF0ZSwgCj5hbmQgc3RydWN0IGlvbWFwX2lvZW5kJ3Mg
aW9fcHJpdmF0ZSxhcmUgZWl0aGVyIGFsbG9jYXRlZCBsb2NhbGx5IG9uIHRoZSBzdGFjayBvciBo
YXZlIGEgbGlmZWN5Y2xlIG9uIHRoZSBoZWFwIHRoYXQgb25seSBleGlzdHMgCj5mb3IgdGhlIGR1
cmF0aW9uIG9mIHRoZSBJL08gcm91dGluZS4gVGhpcyBjYW5ub3QgbWVldCBGMkZTJ3MgcmVxdWly
ZW1lbnRzLgo+Cj4+IFdlIHNob3VsZCAgdHJ5IHRvIGZpZ3VyZSBvdXQgaWYgdGhlcmUgaXMgYSBz
ZW5zaWJsZSB3YXkgdG8gc3VwcG9ydCB0aGUgbmVlZHMKPj4gd2l0aCBhIHNpbmdsZSBjb2RlYmFz
ZSBhbmQgZGF0YSBzdHJ1Y3R1cmUuCj4KPkFzIGZhciBhcyBJIGtub3csIG9ubHkgRjJGUyBoYXMg
dGhpcyByZXF1aXJlbWVudCwgd2hpbGUgb3RoZXIgZmlsZSBzeXN0ZW1zIGRvIG5vdC4gCj5UaGVy
ZWZvcmUsIG15IGluaXRpYWwgdGhvdWdodCB3YXMgdG8gYXZvaWQgZGlyZWN0bHkgbW9kaWZ5aW5n
IHRoZSBnZW5lcmljIGxvZ2ljIGluIGZzL2lvbWFwLiBJbnN0ZWFkLCBJIHByb3Bvc2UgZGVzaWdu
aW5nIAo+YSB3cmFwcGVyIHN0cnVjdHVyZSBmb3IgaW9tYXBfZm9saW9fc3RhdGUgc3BlY2lmaWNh
bGx5IGZvciBGMkZTIHRvIHNhdGlzZnkgYm90aCBpb21hcCdzIGFuZCBGMkZTJ3Mgb3duIG5lZWRz
Lgo+Cj5Bbm90aGVyIGlzc3VlIGlzIHRoZSBoYW5kbGluZyBvZiBvcmRlci0wIGZvbGlvcy4gU2lu
Y2UgdGhlIGlvbWFwIGZyYW1ld29yayBkb2VzIG5vdCBhbGxvY2F0ZSBhbiBpb21hcF9mb2xpb19z
dGF0ZSBmb3IgdGhlc2UgZm9saW9zLCAKPkYyRlMgd2lsbCBhbHdheXMgc3RvcmVzIGl0cyBwcml2
YXRlIGZsYWdzIGluIHRoZSBmb2xpby0+cHJpdmF0ZSBmaWVsZC4gVGhlbiBpb21hcCBmcmFtZXdv
cmsgd291bGQgbWlzdGFrZW5seSBpbnRlcnByZXQgdGhlc2UgZmxhZ3MgYXMgYSBwb2ludGVyLiAK
Pgo+SWYgd2UgYXJlIHRvIHNvbHZlIHRoaXMgaXNzdWUgaW4gZ2VuZXJpYyBpb21hcCBsYXllciwg
YSBtaW5pbWFsIGNoYW5nZXMgbWV0aG9kIHRvIGlvbWFwIGZyYW1ld29yayBJIHN1cHBvc2UgaXMg
dG8gbGV0IGlvbWFwIGxvZ2ljIGNhbgo+Ym90aCBkaXN0aW5ndWlzaCBwb2ludGVyIGFuZCBub24g
cG9pbnRlciBtb2RlIG9mIGZvbGlvLT5wcml2YXRlLiBXZSBzaG91bGQgYWxzbyBhZGQgYSBwcml2
YXRlIGZpZWxkIHRvIGlvbWFwX2ZvbGlvX3N0YXRlICwgb3IgZXh0ZW5kIGhlIHN0YXRlIAo+Zmxl
eGlibGUgYXJyYXkgdG8gc3RvcmUgdGhlIGV4dHJhIGluZm9tYXRpb24uIElmIGlvbWFwIGRldGVj
dHMgYSBvcmRlcj4wIGZvbGlvJ3MgZm9saW8tPnByaXZhdGUgaXMgdXNlZCBpbiBub24gcG9pbnRl
ciBtb2RlLCB0aGVuIGl0IHN0b3JlIHRoZSBmbGFncyBpbiBhIG5ld2x5IAo+YWxsb2N0ZWQgaW9t
YXBfZm9saW9fc3RhdGUgZmlyc3QgLCBjbGVhciB0aGUgcHJpdmF0ZSBmaWVsZCBhbmQgdGhlbiBz
dG9yZSdzIGl0cyBhZGRyZXNzIGluIGl0Lgo+Cj5QLlMuICBJIGp1c3Qgbm90aWNlZCB5b3UgZGlk
bid0IHJlcGx5IHZpYSBteSByZXNlbmQgcGF0Y2guIEkgbWlzc3BlbGxlZCBmMmZzJ3Mgc3Vic3l0
ZW0gbWFpbCBhZGRyZXNzIGluIHRoZSBvcmlnaW5hbCBwYXRjaCBhbmQgSSBzaW5jZXJlbHkgYXBv
bG9naXplIGZvciB0aGF0Lgo+SSBhbHJlYWR5IHJlLXNlbnQgdGhlIHNlcmllcyBhcyAgCj4gIltm
MmZzLWRldl0gW1JFU0VORCBSRkMgUEFUQ0ggMC85XSBmMmZzOiBFbmFibGUgYnVmZmVyZWQgcmVh
ZC93cml0ZSBsYXJnZSBmb2xpb3Mgc3VwcG9ydCB3aXRoIGV4dGVuZGVkIGlvbWFwIgo+Q291bGQg
d2UgY29udGludWUgdGhlIGRpc2N1c3Npb24gb24gdGhhdCB0aHJlYWQgc28gdGhlIHJpZ2h0IGxp
c3QgZ2V0cyB0aGUKPmZ1bGwgY29udGV4dD8gIFRoYW5rcyEKPgo+QmVzdCByZWdhcmRzLAo+TmFu
emhlIFpoYW8KPgo+QXQgMjAyNS0wOC0xMyAyMzoyMjozNywgIkNocmlzdG9waCBIZWxsd2lnIiA8
aGNoQGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+Pk9uIFdlZCwgQXVnIDEzLCAyMDI1IGF0IDA1OjIx
OjIyUE0gKzA4MDAsIE5hbnpoZSBaaGFvIHdyb3RlOgo+Pj4gKiAqKldoeSBleHRlbmRzIGlvbWFw
KioKPj4+ICAgKiBGMkZTIHN0b3JlcyBpdHMgZmxhZ3MgaW4gdGhlIGZvbGlvJ3MgcHJpdmF0ZSBm
aWVsZCwKPj4+ICAgICB3aGljaCBjb25mbGljdHMgd2l0aCBpb21hcF9mb2xpb19zdGF0ZS4KPj4+
ICAgKiBUbyByZXNvbHZlIHRoaXMsIHdlIGRlc2lnbmVkIGYyZnNfaW9tYXBfZm9saW9fc3RhdGUs
Cj4+PiAgICAgY29tcGF0aWJsZSB3aXRoIGlvbWFwX2ZvbGlvX3N0YXRlJ3MgbGF5b3V0IHdoaWxl
IGV4dGVuZGluZwo+Pj4gICAgIGl0cyBmbGV4aWJsZSBzdGF0ZSBhcnJheSBmb3IgRjJGUyBwcml2
YXRlIGZsYWdzLgo+Pj4gICAqIFdlIHN0b3JlIGEgbWFnaWMgbnVtYmVyIGluIHJlYWRfYnl0ZXNf
cGVuZGluZyB0byBkaXN0aW5ndWlzaAo+Pj4gICAgIHdoZXRoZXIgYSBmb2xpbyB1c2VzIHRoZSBv
cmlnaW5hbCBvciBGMkZTJ3MgaW9tYXBfZm9saW9fc3RhdGUuCj4+PiAgICAgSXQncyBjaG9zZW4g
YmVjYXVzZSBpdCByZW1haW5zIDAgYWZ0ZXIgcmVhZGFoZWFkIGNvbXBsZXRlcy4KPj4KPj5UaGF0
J3MgcHJldHR5IHVnbHkuICBXaGF0IGFkZGl0aW9uYWxzIGZsYWdzIGRvIHlvdSBuZWVkPyAgV2Ug
c2hvdWxkCj4+dHJ5IHRvIGZpZ3VyZSBvdXQgaWYgdGhlcmUgaXMgYSBzZW5zaWJsZSB3YXkgdG8g
c3VwcG9ydCB0aGUgbmVlZHMKPj53aXRoIGEgc2luZ2xlIGNvZGViYXNlIGFuZCBkYXRhIHN0cnVj
dHVyZSBpZiB0aGF0IHRoZSByZXF1aXJlbWVudHMKPj5hcmUgc2Vuc2libGUuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
