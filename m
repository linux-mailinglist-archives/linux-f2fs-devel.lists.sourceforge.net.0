Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EABAFFC8C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jul 2025 10:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+bfERvfghBntBtmI7bp3we8XsUCtcBQlNgGmOMng1Q=; b=ZfqYc4NFMXRnMGom0M6VhgMCrb
	gHrvTPzBS4WWbgBRQYaZO+cylurZlicdtQV4JmMjL3bfkUT3uYEbNUTY42cOk+5gwbuyW4Fra3iOw
	dKBEoBBq/zhosLR82PnOPRMmRRVLmX58E2ciM4xhbCDTaFC1aBvnEm2hmTMEE2Q2sDK0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZmpa-0005aF-4C;
	Thu, 10 Jul 2025 08:40:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1uZmpT-0005a5-Bn
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 08:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gRSM84pK1kKhKYnQhanGaJcM3AlzDOeJnR9YlU2UCc8=; b=MCgnpypBtHp9rGfTXw3YUhSV8O
 ZeWO6mAlfw18yjgqzHFjHqmI5iLnPAfLcZ355vb3hpyZdxvaJrTIp0x5k3F2QRGNyW7Tg8UNFEGSK
 OL5iqudEJz4RwCPQtbjnL4FutNKdm2V0fNwAt96/uyQRThLK5lqiltCveP1gOS/xtX0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gRSM84pK1kKhKYnQhanGaJcM3AlzDOeJnR9YlU2UCc8=; b=P6mB5xovpMC6AsfcaobI+45OiC
 iXnm2C8DSRK8+9DLGG7QkpjC0uP/kMPhRj/JgoOoNGdwSc7x70Q2SfuENQ9trvYD2aDqSg0b7NsbJ
 eQhUHk8hb87XcoVZ9/J6BnNLBGfiAuXR1QrAQeRtzxB0oIt+CzGBO+cBd5Wg8LDbc50Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZmpS-00006Q-8A for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 08:40:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CC3225C6CB9;
 Thu, 10 Jul 2025 08:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C612CC4CEE3;
 Thu, 10 Jul 2025 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752136824;
 bh=9PLxogK3nJE98NYsYw4ic0UVw1bmrgsymXuv+M30YcA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qFfss6a6kaDr4H6voAveuCONryrANTdjYoagQas0dkX3aEb6gXvqCFcEuBMH+gqnV
 gtlEjVA2c5XYLEuswbn+kaVvfSHZSmSSczlZOcu8/cbhGVVq5JJCLilSEGPQNStH86
 oeLE7XlFXLWgb5gg6Pkt/WON3j1nIVRaYyuNiCXSqUcJqXdEv9AQmOSLeICba9p6nR
 /RnPb04ir1PJSWKC1IiAO8p8YKRykF8pXNdbBogCfmc3s7wZV0na0H9zZsNzV1JTlX
 E+lB1K5gFQNR/isOq3ZqEJF4CVvymIfNA9KkXRLX4GMg/vAlt29nbVQvv48/MauA+8
 sv4UXr1v3dckA==
Date: Thu, 10 Jul 2025 10:40:19 +0200
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20250710-sitzung-gelaufen-4ee804949772@brauner>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <2dm6bsup7vxwl4vwmllkvt5erncirr272bov4ehd5gix7n2vnw@bkagb26tjtj5>
 <20250708202050.GG2672049@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250708202050.GG2672049@frogsfrogsfrogs>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 08, 2025 at 01:20:50PM -0700, Darrick J. Wong
 wrote: > On Tue, Jul 08, 2025 at 12:20:00PM +0200, Jan Kara wrote: > > On
 Mon 07-07-25 17:45:32, Darrick J. Wong wrote: > > > On Tue, Jul 08, [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZmpS-00006Q-8A
Subject: Re: [f2fs-dev] [PATCH v4 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: ntfs3@lists.linux.dev, Jan Kara <jack@suse.cz>,
 Dave Chinner <david@fromorbit.com>, Qu Wenruo <quwenruo.btrfs@gmx.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdWwgMDgsIDIwMjUgYXQgMDE6MjA6NTBQTSAtMDcwMCwgRGFycmljayBKLiBXb25n
IHdyb3RlOgo+IE9uIFR1ZSwgSnVsIDA4LCAyMDI1IGF0IDEyOjIwOjAwUE0gKzAyMDAsIEphbiBL
YXJhIHdyb3RlOgo+ID4gT24gTW9uIDA3LTA3LTI1IDE3OjQ1OjMyLCBEYXJyaWNrIEouIFdvbmcg
d3JvdGU6Cj4gPiA+IE9uIFR1ZSwgSnVsIDA4LCAyMDI1IGF0IDA4OjUyOjQ3QU0gKzA5MzAsIFF1
IFdlbnJ1byB3cm90ZToKPiA+ID4gPiDlnKggMjAyNS83LzggMDg6MzIsIERhdmUgQ2hpbm5lciDl
hpnpgZM6Cj4gPiA+ID4gPiBPbiBGcmksIEp1bCAwNCwgMjAyNSBhdCAxMDoxMjoyOUFNICswOTMw
LCBRdSBXZW5ydW8gd3JvdGU6Cj4gPiA+ID4gPiA+IEN1cnJlbnRseSBhbGwgdGhlIGZpbGVzeXN0
ZW1zIGltcGxlbWVudGluZyB0aGUKPiA+ID4gPiA+ID4gc3VwZXJfb3BlYXJhdGlvbnM6OnNodXRk
b3duKCkgY2FsbGJhY2sgY2FuIG5vdCBhZmZvcmQgbG9zaW5nIGEgZGV2aWNlLgo+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gVGh1cyBmc19iZGV2X21hcmtfZGVhZCgpIHdpbGwganVzdCBjYWxsIHRo
ZSBzaHV0ZG93bigpIGNhbGxiYWNrIGZvciB0aGUKPiA+ID4gPiA+ID4gaW52b2x2ZWQgZmlsZXN5
c3RlbS4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEJ1dCBpdCB3aWxsIG5vIGxvbmdlciBiZSB0
aGUgY2FzZSwgd2l0aCBtdWx0aS1kZXZpY2UgZmlsZXN5c3RlbXMgbGlrZQo+ID4gPiA+ID4gPiBi
dHJmcyBhbmQgYmNhY2hlZnMgdGhlIGZpbGVzeXN0ZW0gY2FuIGhhbmRsZSBjZXJ0YWluIGRldmlj
ZSBsb3NzIHdpdGhvdXQKPiA+ID4gPiA+ID4gc2h1dHRpbmcgZG93biB0aGUgd2hvbGUgZmlsZXN5
c3RlbS4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFRvIGFsbG93IHRob3NlIG11bHRpLWRldmlj
ZSBmaWxlc3lzdGVtcyB0byBiZSBpbnRlZ3JhdGVkIHRvIHVzZQo+ID4gPiA+ID4gPiBmc19ob2xk
ZXJfb3BzOgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gLSBSZXBsYWNlIHN1cGVyX29wZWFyYXRp
b246OnNodXRkb3duKCkgd2l0aAo+ID4gPiA+ID4gPiAgICBzdXBlcl9vcGVhcmF0aW9uczo6cmVt
b3ZlX2JkZXYoKQo+ID4gPiA+ID4gPiAgICBUbyBiZXR0ZXIgZGVzY3JpYmUgd2hlbiB0aGUgY2Fs
bGJhY2sgaXMgY2FsbGVkLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGlzIGNvbmZsYXRlcyBjYXVz
ZSB3aXRoIGFjdGlvbi4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhlIHNodXRkb3duIGNhbGxvdXQg
aXMgYW4gYWN0aW9uIHRoYXQgdGhlIGZpbGVzeXN0ZW0gbXVzdCBleGVjdXRlLAo+ID4gPiA+ID4g
d2hpbHN0ICJyZW1vdmUgYmRldiIgaXMgYSBjYXVzZSBub3RpZmljYXRpb24gdGhhdCBtaWdodCBy
ZXF1aXJlIGFuCj4gPiA+ID4gPiBhY3Rpb24gdG8gYmUgdGFrZS4KPiA+ID4gPiA+IAo+ID4gPiA+
ID4gWWVzLCB0aGUgY2F1c2UgY291bGQgYmUgc29tZW9uZSBkb2luZyBob3QtdW5wbHVnIG9mIHRo
ZSBibG9jawo+ID4gPiA+ID4gZGV2aWNlLCBidXQgaXQgY291bGQgYWxzbyBiZSBzb21ldGhpbmcg
Z29pbmcgd3JvbmcgaW4gc29mdHdhcmUKPiA+ID4gPiA+IGxheWVycyBiZWxvdyB0aGUgZmlsZXN5
c3RlbS4gZS5nLiBkbS10aGlucCBoYXZpbmcgYW4gdW5yZWNvdmVyYWJsZQo+ID4gPiA+ID4gY29y
cnVwdGlvbiBvciBFTk9TUEMgZXJyb3JzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBXZSBhbHJlYWR5
IGhhdmUgYSAiY2F1c2UiIG5vdGlmaWNhdGlvbjogYmxrX2hvbGRlcl9vcHMtPm1hcmtfZGVhZCgp
Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGUgZ2VuZXJpYyBmcyBhY3Rpb24gdGhhdCBpcyB0YWtl
biBieSB0aGlzIG5vdGlmaWNhdGlvbiBpcwo+ID4gPiA+ID4gZnNfYmRldl9tYXJrX2RlYWQoKS4g
IFRoYXQgYWN0aW9uIGlzIHRvIGludmFsaWRhdGUgY2FjaGVzIGFuZCBzaHV0Cj4gPiA+ID4gPiBk
b3duIHRoZSBmaWxlc3lzdGVtLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBidHJmcyBuZWVkcyB0byBk
byBzb21ldGhpbmcgZGlmZmVyZW50IHRvIGEgYmxrX2hvbGRlcl9vcHMtPm1hcmtfZGVhZAo+ID4g
PiA+ID4gbm90aWZpY2F0aW9uLiBpLmUuIGl0IG5lZWRzIGFuIGFjdGlvbiB0aGF0IGlzIGRpZmZl
cmVudCB0bwo+ID4gPiA+ID4gZnNfYmRldl9tYXJrX2RlYWQoKS4KPiA+ID4gPiA+IAo+ID4gPiA+
ID4gSW5kZWVkLCB0aGlzIGlzIGhvdyBiY2FjaGVmcyBhbHJlYWR5IGhhbmRsZXMgInNpbmdsZSBk
ZXZpY2UKPiA+ID4gPiA+IGRpZWQiIGV2ZW50cyBmb3IgbXVsdGktZGV2aWNlIGZpbGVzeXN0ZW1z
IC0gc2VlCj4gPiA+ID4gPiBiY2gyX2ZzX2JkZXZfbWFya19kZWFkKCkuCj4gPiA+ID4gCj4gPiA+
ID4gSSBkbyBub3QgdGhpbmsgaXQncyB0aGUgY29ycmVjdCB3YXkgdG8gZ28sIGVzcGVjaWFsbHkg
d2hlbiB0aGVyZSBpcyBhbHJlYWR5Cj4gPiA+ID4gZnNfaG9sZGVyX29wcy4KPiA+ID4gPiAKPiA+
ID4gPiBXZSdyZSBhbHdheXMgZ29pbmcgdG93YXJkcyBhIG1vcmUgZ2VuZXJpYyBzb2x1dGlvbiwg
b3RoZXIgdGhhbiBsZXR0aW5nIHRoZQo+ID4gPiA+IGluZGl2aWR1YWwgZnMgdG8gZG8gdGhlIHNh
bWUgdGhpbmcgc2xpZ2h0bHkgZGlmZmVyZW50bHkuCj4gPiA+IAo+ID4gPiBPbiBzZWNvbmQgdGhv
dWdodCAtLSBpdCdzIHdlaXJkIHRoYXQgeW91J2QgZmx1c2ggdGhlIGZpbGVzeXN0ZW0gYW5kCj4g
PiA+IHNocmluayB0aGUgaW5vZGUvZGVudHJ5IGNhY2hlcyBpbiBhICJ5b3VyIGRldmljZSB3ZW50
IGF3YXkiIGhhbmRsZXIuCj4gPiA+IEZhbmN5IGZpbGVzeXN0ZW1zIGxpa2UgYmNhY2hlZnMgYW5k
IGJ0cmZzIHdvdWxkIGxpa2VseSBqdXN0IHNoaWZ0IElPIHRvCj4gPiA+IGEgZGlmZmVyZW50IGJk
ZXYsIHJpZ2h0PyAgQW5kIHRoZXJlJ3Mgbm8gZ29vZCByZWFzb24gdG8gcnVuIHNocmlua2VycyBv
bgo+ID4gPiBlaXRoZXIgb2YgdGhvc2UgZnNlcywgcmlnaHQ/Cj4gPiAKPiA+IEkgYWdyZWUgaXQg
aXMgYXdrd2FyZCBhbmQgYmNhY2hlZnMgYXZvaWRzIHRoZXNlIGluIGNhc2Ugb2YgcmVtb3ZhbCBp
dCBjYW4KPiA+IGhhbmRsZSBncmFjZWZ1bGx5IEFGQUlDUy4KPiA+IAo+ID4gPiA+IFllcywgdGhl
IG5hbWluZyBpcyBub3QgcGVyZmVjdCBhbmQgbWl4aW5nIGNhdXNlIGFuZCBhY3Rpb24sIGJ1dCB0
aGUgZW5kCj4gPiA+ID4gcmVzdWx0IGlzIHN0aWxsIGEgbW9yZSBnZW5lcmljIGFuZCBsZXNzIGR1
cGxpY2F0ZWQgY29kZSBiYXNlLgo+ID4gPiAKPiA+ID4gSSB0aGluayBkY2hpbm5lciBtYWtlcyBh
IGdvb2QgcG9pbnQgdGhhdCBpZiB5b3VyIGZpbGVzeXN0ZW0gY2FuIGRvCj4gPiA+IHNvbWV0aGlu
ZyBjbGV2ZXIgb24gZGV2aWNlIHJlbW92YWwsIGl0IHNob3VsZCBwcm92aWRlIGl0cyBvd24gYmxv
Y2sKPiA+ID4gZGV2aWNlIGhvbGRlciBvcHMgaW5zdGVhZCBvZiB1c2luZyBmc19ob2xkZXJfb3Bz
LiAgSSBkb24ndCB1bmRlcnN0YW5kCj4gPiA+IHdoeSB5b3UgbmVlZCBhICJnZW5lcmljIiBzb2x1
dGlvbiBmb3IgYnRyZnMgd2hlbiBpdCdzIG5vdCBnb2luZyB0byBkbwo+ID4gPiB3aGF0IHRoZSBv
dGhlcnMgZG8gYW55d2F5Lgo+ID4gCj4gPiBXZWxsLCBJJ2QgYWxzbyBzYXkganVzdCBnbyBmb3Ig
b3duIGZzX2hvbGRlcl9vcHMgaWYgaXQgd2FzIG5vdCBmb3IgdGhlCj4gPiBhd2t3YXJkICJnZXQg
c3VwZXIgZnJvbSBiZGV2IiBzdGVwLiBBcyBDaHJpc3RpYW4gd3JvdGUgd2UndmUgZW5jYXBzdWxh
dGVkCj4gPiB0aGF0IGluIGZzL3N1cGVyLmMgYW5kIGJkZXZfc3VwZXJfbG9jaygpIGluIHBhcnRp
Y3VsYXIgYnV0IHRoZSBjYWxsaW5nCj4gPiBjb252ZW50aW9ucyBmb3IgdGhlIGZzX2hvbGRlcl9v
cHMgYXJlIG5vdCB2ZXJ5IG5pY2UgKGhvbGRpbmcKPiA+IGJkZXZfaG9sZGVyX2xvY2ssIG5lZWQg
dG8gcmVsZWFzZSBpdCBiZWZvcmUgZ3JhYmJpbmcgcHJhY3RpY2FsbHkgYW55dGhpbmcKPiA+IGVs
c2UpIHNvIEknZCBoYXZlIG11Y2ggZ3JlYXRlciBwZWFjZSBvZiBtaW5kIGlmIHRoaXMgZGlkbid0
IHNwcmVhZCB0b28KPiA+IG11Y2guIE9uY2UgeW91IGNhbGwgYmRldl9zdXBlcl9sb2NrKCkgYW5k
IGhvbGQgb24gdG8gc2Igd2l0aCBzX3Vtb3VudCBoZWxkLAo+ID4gdGhpbmdzIGFyZSBtdWNoIG1v
cmUgY29udmVudGlvbmFsIGZvciB0aGUgZnMgbGFuZCBzbyBJJ2QgbGlrZSBpZiB0aGlzCj4gPiBz
dGVwIGhhcHBlbmVkIGJlZm9yZSBhbnkgZnMgaG9vayBnb3QgY2FsbGVkLiBTbyBJIHByZWZlciBz
b21ldGhpbmcgbGlrZQo+ID4gUXUncyBwcm9wb3NhbCBvZiBzZXBhcmF0ZSBzYiBvcCBmb3IgZGV2
aWNlIHJlbW92YWwgb3ZlciBleHBvcnRpbmcKPiA+IGJkZXZfc3VwZXJfbG9jaygpLiBMaWtlOgo+
ID4gCj4gPiBzdGF0aWMgdm9pZCBmc19iZGV2X21hcmtfZGVhZChzdHJ1Y3QgYmxvY2tfZGV2aWNl
ICpiZGV2LCBib29sIHN1cnByaXNlKQo+ID4gewo+ID4gICAgICAgICBzdHJ1Y3Qgc3VwZXJfYmxv
Y2sgKnNiOwo+ID4gCj4gPiAgICAgICAgIHNiID0gYmRldl9zdXBlcl9sb2NrKGJkZXYsIGZhbHNl
KTsKPiA+ICAgICAgICAgaWYgKCFzYikKPiA+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4gPiAK
PiA+IAlpZiAoc2ItPnNfb3AtPnJlbW92ZV9iZGV2KSB7Cj4gPiAJCXNiLT5zX29wLT5yZW1vdmVf
YmRldihzYiwgYmRldiwgc3VycHJpc2UpOwo+ID4gCQlyZXR1cm47Cj4gPiAJfQo+IAo+IEl0IGZl
ZWxzIG9kZCBidXQgSSBjb3VsZCBsaXZlIHdpdGggdGhpcywgcGFydGljdWxhcmx5IHNpbmNlIHRo
YXQncyB0aGUKPiBkaXJlY3Rpb24gdGhhdCBicmF1bmVyIGlzIGxheWluZyBkb3duLiA6KQoKSSB3
YW50IHRvIHJlaXRlcmF0ZSB0aGF0IG5vIG9uZSBpcyBzYXlpbmcgInVuZGVyIG5vIGNpcmN1bXN0
YW5jZXMKaW1wbGVtZW50IHlvdXIgb3duIGhvbGRlciBvcHMiLiBCdXQgaWYgeW91IHJlbHkgb24g
dGhlIFZGUyBsb2NraW5nIHRoZW4KeW91IGJldHRlciBub3Qgc3BpbGwgaXQncyBndXRzIGludG8g
eW91ciBmaWxlc3lzdGVtIGFuZCBtYWtlIHVzIGV4cG9ydAp0aGlzIGJsb29keSBsb2NraW5nIHRo
YXQgaGFsZiB0aGUgd29ybGQgaGFkIGltcGxlbWVudGVkIHdyb25nIGluIHRoZWlyCmRyaXZlcnMg
aW4gdGhlIGZpcnN0IHBsYWNlcyBzcGV3aW5nIGVuZGxlc3Mgc3l6Ym90IGRlYWRsb2NrcyByZXBv
cnRzCnRoYXQgd2UgaGFkIHRvIHRyYWNrIGRvd24gYW5kIGZpeC4gVGhhdCB3aWxsIG5vdCBoYXBw
ZW4gYWdhaW4gc2ltaWxhcgp3YXkgd2UgZG9uJ3QgYmxlZWQgYWxsIHRoZSBuYXN0aW5lc3Mgb2Yg
b3RoZXIgbG9ja2luZyBwYXRocy4KClBsZWFzZSBhbGwgc3RvcCBsb25nIHBoaWxvc29waGljYWwg
dHJlYXRpc2VzIGFib3V0IHRoaW5ncyBubyBvbiBoYXMgZXZlcgphcmd1ZWQuIGJ0cmZzIHdhbnRz
IHRvIHJlbHkgb24gdGhlIFZGUyBpbmZyYS4gVGhhdCBpcyBmaW5lIGFuZCB3ZWxsLiBXZQp3aWxs
IHN1cHBvcnQgYW5kIGVuYWJsZSB0aGlzLgoKSSB0aGluayB0aGUgdHdvIG1ldGhvZCBpZGVhIGlz
IGZpbmUgZ2l2ZW4gdGhhdCB0aGV5IG5vdyBhcmUgY2xlYXJseQpkZWxpbmVhdGVkLgoKVGhhbmtz
IGZvciBwcm92aWRpbmcgc29tZSBjbGFyaXR5IGhlcmUsIERhcnJpY2sgYW5kIFF1LgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
