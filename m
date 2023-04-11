Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E25B6DE1E4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 19:09:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmHUN-0007KH-4V;
	Tue, 11 Apr 2023 17:09:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pmHUJ-0007K1-BT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 17:08:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q+Wic3WCe746D9FBgJNDBmH0JggLxTWamlBEaic8IJo=; b=WWs0uKfT/Z9yLZYXE23CM0jBeq
 0RUnh6CBqS0KSVNW2OvVmlqb3QtLXgzCXaGh8J2uXFz7KmBX+vTFzkuIH9wCD2Za6d2gZKTzMMAOn
 bxSixPBm6oEnQe9zDzV0vNaxFXWSWtDzcEhzt3lqnbE4/GB324wdG0oIkWgCP4uMnVGc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q+Wic3WCe746D9FBgJNDBmH0JggLxTWamlBEaic8IJo=; b=kZJ/NEC1SiTVkhrahH1XvRQqHw
 F8P87YN95WHAtYnou0Ku9XODirg2wNqEISyXIPhG8DFg3x9kt4+8Sd/1tHLiuEMMnnbOoHda+IxlG
 zj5hyoIZJZryhTe/D7LzuGIfHzu1pw3EqQgDHZ8/XhpDTAmo23IjSycyeSUbPH2yYNt0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmHU9-0005WY-O4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 17:08:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E31E622C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Apr 2023 17:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB011C433D2;
 Tue, 11 Apr 2023 17:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681232923;
 bh=KK2wcAmTXAmRl/Ls32v9Ffjf1eFKoGVvdH85RsyomL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rbDEVlmK/qzdpjete8oaogpFA8aGk48GKwmZlPNYfX4F0fm9cTIp0SsGomAEv3HlA
 g0a8MOyx2KPODmisHm0IRP822DhZLodA4FOJ3NdHru65czj68gqhH/F5Fk1t5PzVPT
 mDmGbFhh5nnhfGi9Epa90nSN0Og16VTprHk1WvTW5l6Vf44oh3HauFysQnlr74LRAE
 0nhtqsxwzDgeK8Ew7tKmvI7tsA3kK+wCb8fekmGxBA1c2NVgFWuOyIhuWinhHAZoRK
 iMexVHVLWlKlUwWpASptp+aYa2P8Ib87O0B0IMdmta+QKcIcXDbk6Kv+YzaHBeLwb+
 RiQb/1cY3eB7Q==
Date: Tue, 11 Apr 2023 10:08:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZDWUGr2c3TT2tTgu@google.com>
References: <20230405144359.930253-1-chao@kernel.org>
 <ZDCEK2OPkhTmRZrq@google.com>
 <224e8756-7c63-fd53-a0f3-f3e2a7b4c13f@kernel.org>
 <ZDROBJFxSUdGaqAa@google.com>
 <538fd229-28ae-0ec5-ef07-35d505fbb8a9@kernel.org>
 <2341db3b-5a40-a9f0-51f1-29a8908e3e98@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2341db3b-5a40-a9f0-51f1-29a8908e3e98@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/11, Chao Yu wrote: > On 2023/4/11 16:14, Chao Yu wrote:
 > > On 2023/4/11 1:57, Jaegeuk Kim wrote: > > > On 04/08, Chao Yu wrote:
 > > > > On 2023/4/8 4:59, Jaegeuk Kim wrote: > > > > > This break [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmHU9-0005WY-O4
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to tag FIEMAP_EXTENT_DELALLOC in
 fiemap() for delay allocated extent
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDQvMTEsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyMy80LzExIDE2OjE0LCBDaGFvIFl1IHdy
b3RlOgo+ID4gT24gMjAyMy80LzExIDE6NTcsIEphZWdldWsgS2ltIHdyb3RlOgo+ID4gPiBPbiAw
NC8wOCwgQ2hhbyBZdSB3cm90ZToKPiA+ID4gPiBPbiAyMDIzLzQvOCA0OjU5LCBKYWVnZXVrIEtp
bSB3cm90ZToKPiA+ID4gPiA+IFRoaXMgYnJlYWtzIGdlbmVyaWMvMDA5Pwo+ID4gPiA+IAo+ID4g
PiA+IEkgZ3Vlc3MgaXQgaXMgYXMgZXhwZWN0ZWQ/Cj4gPiA+ID4gCj4gPiA+ID4gUGxlYXNlIGNo
ZWNrIGRlc2NyaXB0aW9uIG9mIGZpZW1hcCBpb2N0bCBtYW51YWwgZnJvbSBbMV06Cj4gPiA+ID4g
Cj4gPiA+ID4gRklFTUFQX0VYVEVOVF9VTktOT1dOCj4gPiA+ID4gVGhlIGxvY2F0aW9uIG9mIHRo
aXMgZXh0ZW50IGlzIGN1cnJlbnRseSB1bmtub3duLiBUaGlzIG1heQo+ID4gPiA+IGluZGljYXRl
IHRoZSBkYXRhIGlzIHN0b3JlZCBvbiBhbiBpbmFjY2Vzc2libGUgdm9sdW1lIG9yIHRoYXQKPiA+
ID4gPiBubyBzdG9yYWdlIGhhcyBiZWVuIGFsbG9jYXRlZCBmb3IgdGhlIGZpbGUgeWV0Lgo+ID4g
PiA+IAo+ID4gPiA+IEZJRU1BUF9FWFRFTlRfREVMQUxMT0MKPiA+ID4gPiBUaGlzIHdpbGwgYWxz
byBzZXQgRklFTUFQX0VYVEVOVF9VTktOT1dOLgo+ID4gPiA+IAo+ID4gPiA+IERlbGF5ZWQgYWxs
b2NhdGlvbiAtIHdoaWxlIHRoZXJlIGlzIGRhdGEgZm9yIHRoaXMgZXh0ZW50LCBpdHMKPiA+ID4g
PiBwaHlzaWNhbCBsb2NhdGlvbiBoYXMgbm90IGJlZW4gYWxsb2NhdGVkIHlldC4KPiA+ID4gPiAK
PiA+ID4gPiBGSUVNQVBfRVhURU5UX1VOV1JJVFRFTgo+ID4gPiA+IFVud3JpdHRlbiBleHRlbnQg
LSB0aGUgZXh0ZW50IGlzIGFsbG9jYXRlZCBidXQgaXRzIGRhdGEgaGFzIG5vdAo+ID4gPiA+IGJl
ZW4gaW5pdGlhbGl6ZWQuIFRoaXMgaW5kaWNhdGVzIHRoZSBleHRlbnTigJlzIGRhdGEgd2lsbCBi
ZSBhbGwKPiA+ID4gPiB6ZXJvIGlmIHJlYWQgdGhyb3VnaCB0aGUgZmlsZXN5c3RlbSBidXQgdGhl
IGNvbnRlbnRzIGFyZSB1bmRlZmluZWQKPiA+ID4gPiBpZiByZWFkIGRpcmVjdGx5IGZyb20gdGhl
IGRldmljZS4KPiA+ID4gPiAKPiA+ID4gPiBbMV0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2Mv
aHRtbC9sYXRlc3QvZmlsZXN5c3RlbXMvZmllbWFwLmh0bWwKPiA+ID4gPiAKPiA+ID4gPiBBY2Nv
cmRpbmcgdG8gaXRzIGRlc2NyaXB0aW9uLCBmMmZzIG9ubHkgc3VwcG9ydAo+ID4gPiA+IEZJRU1B
UF9FWFRFTlRfe1VOS05PV04sIERFTEFMTE9DfSwgYnV0IG5vdCBzdXBwb3J0Cj4gPiA+ID4gRklF
TUFQX0VYVEVOVF9VTldSSVRURU4uCj4gPiA+IAo+ID4gPiBObywgSSBkb24ndCB0aGluayBzby4K
PiA+IAo+ID4gSmFlZ2V1aywKPiA+IAo+ID4gQ291bGQgeW91IHBsZWFzZSBjaGVjayB0aGUgZGV0
YWlsZWQgZGVzY3JpcHRpb24gb2YgRklFTUFQX0VYVEVOVF9VTldSSVRURU4/Cj4gPiBUaGUgZmxh
ZyBpbmRpY2F0ZXMgdHdvIGNvbmRpdGlvbnM6Cj4gPiAxLiBvbi1kaXNrIGJsa2FkZHJzIHdlcmUg
YWxsb2NhdGVkIGZvciBleHRlbnQsIGFuZCB0aGUgZXh0ZW50IGlzIHRhZ2dlZCBhcwo+ID4gdW53
cml0dGVuIHN0YXR1cy4KPiA+IDIuIGRhdGEgcmVhZGVkIG9uIHRob3NlIGJsb2NrcyB3aWxsIGJl
IGFsbCB6ZXJvLgo+IAo+IFNvcnJ5LCBJIG1lYW46Cj4gCj4gMS4gb24tZGlzayBibGthZGRycyB3
ZXJlIGFsbG9jYXRlZCBmb3IgZXh0ZW50Owo+IDIuIGV4dGVudCBpcyB0YWdnZWQgYXMgdW53cml0
dGVuIHN0YXR1cywgZGF0YSByZWFkZWQgb24gdGhvc2UgYmxvY2tzIHdpbGwgYmUKPiBhbGwgemVy
by4KCkkgd2FzIHRoaW5raW5nIGZhbGxvY2F0ZS9waW4gY2FzZXMgdG8gZ2l2ZSB6ZXJvIGRhdGEu
IEJ1dCwgd2UgbWF5IG5lZWQgdG8gY2hlY2sKdGhlIHNwYWNlIGRpc2NhcmRlZCBzZWN1cmVseSBv
ciBkaXNrIHN1cHBvcnQ/Cgo+IAo+IFRoYW5rcywKPiAKPiA+IAo+ID4gU28sIGxldCdzIGNoZWNr
IGYyZnMnIHN0YXR1czoKPiA+IC0gZmFsbG9jYXRlIG9ubHkgcmVzZXJ2ZSB2YWxpZCBibG9jayBj
b3VudCBhbmQgc2V0IE5FV19BRERSIGluIGRub2RlLCBzbwo+ID4gaXQgZG9lcyBub3QgbWF0Y2gg
Y29uZGl0aW9uIDEpCj4gPiAtIHBpbiAmIGZhbGxvY2F0ZSBwcmVhbGxvY2F0ZXMgYmxrYWRkcnMg
YW5kIHNldCBibGthZGRycyBpbiBkbm9kZSwgYnV0Cj4gPiBjb250ZW50IG9uIHRob3NlIGJsa2Fk
ZHJzIG1heSBjb250YWluIHplcm8gb3IgcmFuZG9tIGRhdGEsIHNvIGl0IGRvZXMgbm90Cj4gPiBt
YXRjaMKgIGNvbmRpdGlvbiAyKQo+ID4gCj4gPiBDaHJpc3RvcGggZGVzY3JpYmVzIHRoaXMgaXNz
dWUgaW4gYmVsb3cgcGF0Y2ggYXMgd2VsbCwgeW91IGNhbiBjaGVjayBpdC4KPiA+IGRhOGM3ZmVj
YzljNyAoImYyZnM6IHJlbmFtZSBGMkZTX01BUF9VTldSSVRURU4gdG8gRjJGU19NQVBfREVMQUxM
T0MiKQo+ID4gCj4gPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPwo+ID4gCj4gPiBUaGFua3MsCj4g
PiAKPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gU28gMDA5LCAwOTIsIDA5NCAuLiB3aGljaCBleHBl
Y3RzIHVud3JpdHRlbiBzdGF0dXMgZnJvbSBleHRlbnQgd2lsbAo+ID4gPiA+IGZhaWwuCj4gPiA+
ID4gCj4gPiA+ID4gSG93IGFib3V0IGRpc2FibGluZyB0aG9zZSB0ZXN0Y2FzZT8KPiA+ID4gPiAK
PiA+ID4gPiBUaGFua3MsCj4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+IE9uIDA0LzA1LCBD
aGFvIFl1IHdyb3RlOgo+ID4gPiA+ID4gPiB4ZnN0ZXN0IGdlbmVyaWMvNjE0IGZhaWxzIHRvIHJ1
biBkdWUgYmVsb3cgcmVhc29uOgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gZ2VuZXJpYy82MTQg
MXMgLi4uIFtub3QgcnVuXSB0ZXN0IHJlcXVpcmVzIGRlbGF5ZWQgYWxsb2NhdGlvbiBidWZmZXJl
ZCB3cml0ZXMKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFRoZSByb290IGNhdXNlIGlzIGYyZnMg
dGFncyB3cm9uZyBmaWVtYXAgZmxhZyBmb3IgZGVsYXkgYWxsb2NhdGVkCj4gPiA+ID4gPiA+IGV4
dGVudC4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFF1b3RlZCBmcm9tIGZpZW1hcC5oOgo+ID4g
PiA+ID4gPiBGSUVNQVBfRVhURU5UX1VOS05PV07CoMKgwqDCoMKgwqDCoCAweDAwMDAwMDAyIC8q
IERhdGEgbG9jYXRpb24gdW5rbm93bi4gKi8KPiA+ID4gPiA+ID4gRklFTUFQX0VYVEVOVF9ERUxB
TExPQ8KgwqDCoMKgwqDCoMKgIDB4MDAwMDAwMDQgLyogTG9jYXRpb24gc3RpbGwgcGVuZGluZy4K
PiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICogU2V0cyBFWFRFTlRfVU5LTk9XTi4gKi8KPiA+ID4gPiA+ID4gRklFTUFQX0VY
VEVOVF9VTldSSVRURU7CoMKgwqDCoMKgwqDCoCAweDAwMDAwODAwIC8qIFNwYWNlIGFsbG9jYXRl
ZCwgYnV0Cj4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqIG5vIGRhdGEgKGkuZS4gemVybykuICovCj4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiBGSUVNQVBfRVhURU5UX1VOV1JJVFRFTiBtZWFucyBibG9jayBhZGRyZXNzIGlz
IHByZWFsbG9jYXRlZCwgYnV0IHcvbwo+ID4gPiA+ID4gPiBiZWVuIHdyaXR0ZW4gYW55IGRhdGEs
IHdoaWNoIHN0YXR1cyBmMmZzIGlzIG5vdCBzdXBwb3J0ZWQgbm93LCBmb3IgYWxsCj4gPiA+ID4g
PiA+IE5FV19BRERSIGJsb2NrIGFkZHJlc3NlcywgaXQgbWVhbnMgZGVsYXkgYWxsb2NhdGVkIGJs
b2Nrcywgc28gbGV0J3MKPiA+ID4gPiA+ID4gdGFnIEZJRU1BUF9FWFRFTlRfREVMQUxMT0MgaW5z
dGVhZC4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFRlc3RjYXNlOgo+ID4gPiA+ID4gPiB4ZnNf
aW8gLWYgLWMgJ3B3cml0ZSAwIDY0aycgL21udC9mMmZzL2ZpbGU7Cj4gPiA+ID4gPiA+IGZpbGVm
cmFnIC12IC9tbnQvZjJmcy9maWxlCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBPdXRwdXQ6Cj4g
PiA+ID4gPiA+IC0gQmVmb3JlCj4gPiA+ID4gPiA+IEZpbGVzeXN0ZW0gdHlwZSBpczogZjJmNTIw
MTAKPiA+ID4gPiA+ID4gRml6ZSBvZiAvbW50L2YyZnMvZmlsZSBpcyA2NTUzNiAoMTYgYmxvY2tz
IG9mIDQwOTYgYnl0ZXMpCj4gPiA+ID4gPiA+IMKgwqAgZXh0OsKgwqDCoMKgIGxvZ2ljYWxfb2Zm
c2V0OsKgwqDCoMKgwqDCoMKgIHBoeXNpY2FsX29mZnNldDogbGVuZ3RoOsKgwqAgZXhwZWN0ZWQ6
IGZsYWdzOgo+ID4gPiA+ID4gPiDCoMKgwqDCoCAwOsKgwqDCoMKgwqDCoMKgIDAuLsKgwqDCoMKg
wqAgMTU6wqDCoMKgwqDCoMKgwqDCoMKgIDAuLsKgwqDCoMKgwqDCoMKgIDE1OsKgwqDCoMKgIDE2
OsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsYXN0LHVud3JpdHRlbixtZXJnZWQsZW9mCj4gPiA+
ID4gPiA+IC9tbnQvZjJmcy9maWxlOiAxIGV4dGVudCBmb3VuZAo+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gQWZ0ZXI6Cj4gPiA+ID4gPiA+IEZpbGVzeXN0ZW0gdHlwZSBpczogZjJmNTIwMTAKPiA+
ID4gPiA+ID4gRmlsZSBzaXplIG9mIC9tbnQvZjJmcy9maWxlIGlzIDY1NTM2ICgxNiBibG9ja3Mg
b2YgNDA5NiBieXRlcykKPiA+ID4gPiA+ID4gwqDCoCBleHQ6wqDCoMKgwqAgbG9naWNhbF9vZmZz
ZXQ6wqDCoMKgwqDCoMKgwqAgcGh5c2ljYWxfb2Zmc2V0OiBsZW5ndGg6wqDCoCBleHBlY3RlZDog
ZmxhZ3M6Cj4gPiA+ID4gPiA+IMKgwqDCoMKgIDA6wqDCoMKgwqDCoMKgwqAgMC4uwqDCoMKgwqDC
oCAxNTrCoMKgwqDCoMKgwqDCoMKgwqAgMC4uwqDCoMKgwqDCoMKgwqDCoCAwOsKgwqDCoMKgwqAg
MDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFzdCx1bmtub3duX2xvYyxkZWxhbGxvYyxlb2YK
PiA+ID4gPiA+ID4gL21udC9mMmZzL2ZpbGU6IDEgZXh0ZW50IGZvdW5kCj4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiBGaXhlczogN2Y2M2ViNzdhZjdiICgiZjJmczogcmVwb3J0IHVud3JpdHRlbiBh
cmVhIGluIGYyZnNfZmllbWFwIikKPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8
Y2hhb0BrZXJuZWwub3JnPgo+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gwqDCoCBmcy9mMmZz
L2RhdGEuYyB8IDcgKysrKystLQo+ID4gPiA+ID4gPiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+ID4gPiA+ID4gPiBpbmRl
eCAzNTlkZTY1MDc3MmUuLjNhZmM5NzY0NzQzZSAxMDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEvZnMv
ZjJmcy9kYXRhLmMKPiA+ID4gPiA+ID4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiA+ID4gPiA+ID4g
QEAgLTE5OTUsNyArMTk5NSwxMCBAQCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlub2RlICppbm9k
ZSwgc3RydWN0IGZpZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywKPiA+ID4gPiA+ID4gwqDCoMKg
wqDCoMKgIH0KPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgIGlmIChzaXplKSB7Cj4gPiA+ID4gPiA+
IC3CoMKgwqDCoMKgwqDCoCBmbGFncyB8PSBGSUVNQVBfRVhURU5UX01FUkdFRDsKPiA+ID4gPiA+
ID4gK8KgwqDCoMKgwqDCoMKgIGlmIChmbGFncyAmIEZJRU1BUF9FWFRFTlRfREVMQUxMT0MpCj4g
PiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBoeXMgPSAwOwo+ID4gPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqAgZWxzZQo+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBm
bGFncyB8PSBGSUVNQVBfRVhURU5UX01FUkdFRDsKPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKElTX0VOQ1JZUFRFRChpbm9kZSkpCj4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZmxhZ3MgfD0gRklFTUFQX0VYVEVOVF9EQVRBX0VOQ1JZUFRFRDsKPiA+
ID4gPiA+ID4gQEAgLTIwMzUsNyArMjAzOCw3IEBAIGludCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5v
ZGUgKmlub2RlLCBzdHJ1Y3QgZmllbWFwX2V4dGVudF9pbmZvICpmaWVpbmZvLAo+ID4gPiA+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZSArPSBibGtzX3RvX2J5
dGVzKGlub2RlLCAxKTsKPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9
Cj4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSBpZiAobWFwLm1fZmxhZ3Mg
JiBGMkZTX01BUF9ERUxBTExPQykgewo+ID4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBmbGFncyA9IEZJRU1BUF9FWFRFTlRfVU5XUklUVEVOOwo+ID4gPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBmbGFncyA9IEZJRU1BUF9FWFRFTlRfREVMQUxMT0M7Cj4gPiA+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RhcnRfYmxrICs9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHNpemUpOwo+ID4gPiA+ID4gPiAtLSAK
PiA+ID4gPiA+ID4gMi4zNi4xCj4gPiAKPiA+IAo+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4gaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
