Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A0B017F8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Jul 2025 11:35:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kP3KeBsZ7pQfKeDZ2TSWkzSYaHavDIjrXMml18oJA4o=; b=Hav7HH34RUzQ5cHoCi7W3srhar
	bhXyORz7J04ZVriJCAST3eIvC/RJR2tSVlDiT9jObiYCKvlFGLHScoG0alWo//7A/hHg7uIMlk/aA
	aUvojS5Ta6/VtutX309Q1tC21HwzRbhDhZuzeXeLRjayFO6BukXn+XOKmFFiY+/ld4/M=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uaA9h-0003CG-Ew;
	Fri, 11 Jul 2025 09:34:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1uaA9f-0003C7-AR
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 09:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J35gn/lHjjqDBjt+Ui2XEO+OFCVe+VkyLKlixzIwESM=; b=LynWEuz7JEO4x5atAykWNB7I/Q
 wWNfR9FrqMgz6lMhFZ9+bW+jyIHFja+zgKSZwLnNRq9XklLMlSo6ppnfvSf6YT9+EPttBdblNSQSG
 v3oVfjQFHH7jaKBI9IkwAM7YEc3XG/6mxW9NVgcIM0nAplL8cJIDRe2XsESQFHxcVx0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J35gn/lHjjqDBjt+Ui2XEO+OFCVe+VkyLKlixzIwESM=; b=ODTD6V3h/zaLFCZ1QzUAvxC5a3
 +dDfmZvzILuMva0MGif0SZmKgrk0moUYSB0tFyK+6geoXbsPaTHD5PjbJ2dE9GOkdnHVup6HeWULV
 8vE7xZI214mCqqixBwC2rNX+6nbmGl+Hlza+cxKDndEPoEkWShgaok3lsqbtB+KaunA0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uaA9e-0001pZ-Jv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 09:34:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DBF47A54D63;
 Fri, 11 Jul 2025 09:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7DFC4CEED;
 Fri, 11 Jul 2025 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752226488;
 bh=US1+pc6SRiFDL5Y8bsBR5PM/ITaXbir6Tmel16mVkN8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=keLpUsU9wMm5+VwJWHpWll3xr0PwAYK46YVFkueTbpjhtP24PtM51CgNoBSRvUfg3
 ODhKG9ZngQDG7aBBlVhfvWjxqzZfNAvTKZEwJimpK6vG02uwNxKUcuKPFlCDwf8iA/
 mE/9ynUvq9AKDB+gdKsmRw5EY5RmSZXO7ShaHK1f6cfb7RG3KLfa4MgZWT+ICgRYfk
 /sDctPR82sOxFvr3t4UQXi/stJac09jJqftND/dxE3ADMKeJwPC7Y59FHPbhbAh9Fb
 sBIu+7npyDxLfl3SUA52T8ibedfDiidTW2lHFnUeU66hWNw9PQv4LNs7noYQRYqqQc
 2mJfNFSRI483Q==
Date: Fri, 11 Jul 2025 11:34:42 +0200
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Message-ID: <20250711-senkung-getextet-b040f11cec39@brauner>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <2dm6bsup7vxwl4vwmllkvt5erncirr272bov4ehd5gix7n2vnw@bkagb26tjtj5>
 <20250708202050.GG2672049@frogsfrogsfrogs>
 <20250710-sitzung-gelaufen-4ee804949772@brauner>
 <9bce3d22-5ea2-4a95-9a7e-fc391ae9a2b6@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9bce3d22-5ea2-4a95-9a7e-fc391ae9a2b6@gmx.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Jul 10, 2025 at 07:24:46PM +0930, Qu Wenruo wrote:
    > > > 在 2025/7/10 18:10, Christian Brauner 写道: > > On Tue, Jul 08,
   2025 at 01:20:50PM -0700, Darrick J. Wong wrote: > > > On Tue, Jul 0 [...]
    
 
 Content analysis details:   (-0.3 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uaA9e-0001pZ-Jv
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
 "Darrick J. Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgMDc6MjQ6NDZQTSArMDkzMCwgUXUgV2VucnVvIHdyb3Rl
Ogo+IAo+IAo+IOWcqCAyMDI1LzcvMTAgMTg6MTAsIENocmlzdGlhbiBCcmF1bmVyIOWGmemBkzoK
PiA+IE9uIFR1ZSwgSnVsIDA4LCAyMDI1IGF0IDAxOjIwOjUwUE0gLTA3MDAsIERhcnJpY2sgSi4g
V29uZyB3cm90ZToKPiA+ID4gT24gVHVlLCBKdWwgMDgsIDIwMjUgYXQgMTI6MjA6MDBQTSArMDIw
MCwgSmFuIEthcmEgd3JvdGU6Cj4gPiA+ID4gT24gTW9uIDA3LTA3LTI1IDE3OjQ1OjMyLCBEYXJy
aWNrIEouIFdvbmcgd3JvdGU6Cj4gPiA+ID4gPiBPbiBUdWUsIEp1bCAwOCwgMjAyNSBhdCAwODo1
Mjo0N0FNICswOTMwLCBRdSBXZW5ydW8gd3JvdGU6Cj4gPiA+ID4gPiA+IOWcqCAyMDI1LzcvOCAw
ODozMiwgRGF2ZSBDaGlubmVyIOWGmemBkzoKPiA+ID4gPiA+ID4gPiBPbiBGcmksIEp1bCAwNCwg
MjAyNSBhdCAxMDoxMjoyOUFNICswOTMwLCBRdSBXZW5ydW8gd3JvdGU6Cj4gPiA+ID4gPiA+ID4g
PiBDdXJyZW50bHkgYWxsIHRoZSBmaWxlc3lzdGVtcyBpbXBsZW1lbnRpbmcgdGhlCj4gPiA+ID4g
PiA+ID4gPiBzdXBlcl9vcGVhcmF0aW9uczo6c2h1dGRvd24oKSBjYWxsYmFjayBjYW4gbm90IGFm
Zm9yZCBsb3NpbmcgYSBkZXZpY2UuCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IFRo
dXMgZnNfYmRldl9tYXJrX2RlYWQoKSB3aWxsIGp1c3QgY2FsbCB0aGUgc2h1dGRvd24oKSBjYWxs
YmFjayBmb3IgdGhlCj4gPiA+ID4gPiA+ID4gPiBpbnZvbHZlZCBmaWxlc3lzdGVtLgo+ID4gPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBCdXQgaXQgd2lsbCBubyBsb25nZXIgYmUgdGhlIGNh
c2UsIHdpdGggbXVsdGktZGV2aWNlIGZpbGVzeXN0ZW1zIGxpa2UKPiA+ID4gPiA+ID4gPiA+IGJ0
cmZzIGFuZCBiY2FjaGVmcyB0aGUgZmlsZXN5c3RlbSBjYW4gaGFuZGxlIGNlcnRhaW4gZGV2aWNl
IGxvc3Mgd2l0aG91dAo+ID4gPiA+ID4gPiA+ID4gc2h1dHRpbmcgZG93biB0aGUgd2hvbGUgZmls
ZXN5c3RlbS4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gVG8gYWxsb3cgdGhvc2Ug
bXVsdGktZGV2aWNlIGZpbGVzeXN0ZW1zIHRvIGJlIGludGVncmF0ZWQgdG8gdXNlCj4gPiA+ID4g
PiA+ID4gPiBmc19ob2xkZXJfb3BzOgo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiAt
IFJlcGxhY2Ugc3VwZXJfb3BlYXJhdGlvbjo6c2h1dGRvd24oKSB3aXRoCj4gPiA+ID4gPiA+ID4g
PiAgICAgc3VwZXJfb3BlYXJhdGlvbnM6OnJlbW92ZV9iZGV2KCkKPiA+ID4gPiA+ID4gPiA+ICAg
ICBUbyBiZXR0ZXIgZGVzY3JpYmUgd2hlbiB0aGUgY2FsbGJhY2sgaXMgY2FsbGVkLgo+ID4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFRoaXMgY29uZmxhdGVzIGNhdXNlIHdpdGggYWN0aW9uLgo+
ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFRoZSBzaHV0ZG93biBjYWxsb3V0IGlzIGFuIGFj
dGlvbiB0aGF0IHRoZSBmaWxlc3lzdGVtIG11c3QgZXhlY3V0ZSwKPiA+ID4gPiA+ID4gPiB3aGls
c3QgInJlbW92ZSBiZGV2IiBpcyBhIGNhdXNlIG5vdGlmaWNhdGlvbiB0aGF0IG1pZ2h0IHJlcXVp
cmUgYW4KPiA+ID4gPiA+ID4gPiBhY3Rpb24gdG8gYmUgdGFrZS4KPiA+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gPiBZZXMsIHRoZSBjYXVzZSBjb3VsZCBiZSBzb21lb25lIGRvaW5nIGhvdC11bnBs
dWcgb2YgdGhlIGJsb2NrCj4gPiA+ID4gPiA+ID4gZGV2aWNlLCBidXQgaXQgY291bGQgYWxzbyBi
ZSBzb21ldGhpbmcgZ29pbmcgd3JvbmcgaW4gc29mdHdhcmUKPiA+ID4gPiA+ID4gPiBsYXllcnMg
YmVsb3cgdGhlIGZpbGVzeXN0ZW0uIGUuZy4gZG0tdGhpbnAgaGF2aW5nIGFuIHVucmVjb3ZlcmFi
bGUKPiA+ID4gPiA+ID4gPiBjb3JydXB0aW9uIG9yIEVOT1NQQyBlcnJvcnMuCj4gPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+ID4gV2UgYWxyZWFkeSBoYXZlIGEgImNhdXNlIiBub3RpZmljYXRpb246
IGJsa19ob2xkZXJfb3BzLT5tYXJrX2RlYWQoKS4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
PiBUaGUgZ2VuZXJpYyBmcyBhY3Rpb24gdGhhdCBpcyB0YWtlbiBieSB0aGlzIG5vdGlmaWNhdGlv
biBpcwo+ID4gPiA+ID4gPiA+IGZzX2JkZXZfbWFya19kZWFkKCkuICBUaGF0IGFjdGlvbiBpcyB0
byBpbnZhbGlkYXRlIGNhY2hlcyBhbmQgc2h1dAo+ID4gPiA+ID4gPiA+IGRvd24gdGhlIGZpbGVz
eXN0ZW0uCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gYnRyZnMgbmVlZHMgdG8gZG8gc29t
ZXRoaW5nIGRpZmZlcmVudCB0byBhIGJsa19ob2xkZXJfb3BzLT5tYXJrX2RlYWQKPiA+ID4gPiA+
ID4gPiBub3RpZmljYXRpb24uIGkuZS4gaXQgbmVlZHMgYW4gYWN0aW9uIHRoYXQgaXMgZGlmZmVy
ZW50IHRvCj4gPiA+ID4gPiA+ID4gZnNfYmRldl9tYXJrX2RlYWQoKS4KPiA+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gPiBJbmRlZWQsIHRoaXMgaXMgaG93IGJjYWNoZWZzIGFscmVhZHkgaGFuZGxl
cyAic2luZ2xlIGRldmljZQo+ID4gPiA+ID4gPiA+IGRpZWQiIGV2ZW50cyBmb3IgbXVsdGktZGV2
aWNlIGZpbGVzeXN0ZW1zIC0gc2VlCj4gPiA+ID4gPiA+ID4gYmNoMl9mc19iZGV2X21hcmtfZGVh
ZCgpLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gSSBkbyBub3QgdGhpbmsgaXQncyB0aGUgY29y
cmVjdCB3YXkgdG8gZ28sIGVzcGVjaWFsbHkgd2hlbiB0aGVyZSBpcyBhbHJlYWR5Cj4gPiA+ID4g
PiA+IGZzX2hvbGRlcl9vcHMuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBXZSdyZSBhbHdheXMg
Z29pbmcgdG93YXJkcyBhIG1vcmUgZ2VuZXJpYyBzb2x1dGlvbiwgb3RoZXIgdGhhbiBsZXR0aW5n
IHRoZQo+ID4gPiA+ID4gPiBpbmRpdmlkdWFsIGZzIHRvIGRvIHRoZSBzYW1lIHRoaW5nIHNsaWdo
dGx5IGRpZmZlcmVudGx5Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBPbiBzZWNvbmQgdGhvdWdodCAt
LSBpdCdzIHdlaXJkIHRoYXQgeW91J2QgZmx1c2ggdGhlIGZpbGVzeXN0ZW0gYW5kCj4gPiA+ID4g
PiBzaHJpbmsgdGhlIGlub2RlL2RlbnRyeSBjYWNoZXMgaW4gYSAieW91ciBkZXZpY2Ugd2VudCBh
d2F5IiBoYW5kbGVyLgo+ID4gPiA+ID4gRmFuY3kgZmlsZXN5c3RlbXMgbGlrZSBiY2FjaGVmcyBh
bmQgYnRyZnMgd291bGQgbGlrZWx5IGp1c3Qgc2hpZnQgSU8gdG8KPiA+ID4gPiA+IGEgZGlmZmVy
ZW50IGJkZXYsIHJpZ2h0PyAgQW5kIHRoZXJlJ3Mgbm8gZ29vZCByZWFzb24gdG8gcnVuIHNocmlu
a2VycyBvbgo+ID4gPiA+ID4gZWl0aGVyIG9mIHRob3NlIGZzZXMsIHJpZ2h0Pwo+ID4gPiA+IAo+
ID4gPiA+IEkgYWdyZWUgaXQgaXMgYXdrd2FyZCBhbmQgYmNhY2hlZnMgYXZvaWRzIHRoZXNlIGlu
IGNhc2Ugb2YgcmVtb3ZhbCBpdCBjYW4KPiA+ID4gPiBoYW5kbGUgZ3JhY2VmdWxseSBBRkFJQ1Mu
Cj4gPiA+ID4gCj4gPiA+ID4gPiA+IFllcywgdGhlIG5hbWluZyBpcyBub3QgcGVyZmVjdCBhbmQg
bWl4aW5nIGNhdXNlIGFuZCBhY3Rpb24sIGJ1dCB0aGUgZW5kCj4gPiA+ID4gPiA+IHJlc3VsdCBp
cyBzdGlsbCBhIG1vcmUgZ2VuZXJpYyBhbmQgbGVzcyBkdXBsaWNhdGVkIGNvZGUgYmFzZS4KPiA+
ID4gPiA+IAo+ID4gPiA+ID4gSSB0aGluayBkY2hpbm5lciBtYWtlcyBhIGdvb2QgcG9pbnQgdGhh
dCBpZiB5b3VyIGZpbGVzeXN0ZW0gY2FuIGRvCj4gPiA+ID4gPiBzb21ldGhpbmcgY2xldmVyIG9u
IGRldmljZSByZW1vdmFsLCBpdCBzaG91bGQgcHJvdmlkZSBpdHMgb3duIGJsb2NrCj4gPiA+ID4g
PiBkZXZpY2UgaG9sZGVyIG9wcyBpbnN0ZWFkIG9mIHVzaW5nIGZzX2hvbGRlcl9vcHMuICBJIGRv
bid0IHVuZGVyc3RhbmQKPiA+ID4gPiA+IHdoeSB5b3UgbmVlZCBhICJnZW5lcmljIiBzb2x1dGlv
biBmb3IgYnRyZnMgd2hlbiBpdCdzIG5vdCBnb2luZyB0byBkbwo+ID4gPiA+ID4gd2hhdCB0aGUg
b3RoZXJzIGRvIGFueXdheS4KPiA+ID4gPiAKPiA+ID4gPiBXZWxsLCBJJ2QgYWxzbyBzYXkganVz
dCBnbyBmb3Igb3duIGZzX2hvbGRlcl9vcHMgaWYgaXQgd2FzIG5vdCBmb3IgdGhlCj4gPiA+ID4g
YXdrd2FyZCAiZ2V0IHN1cGVyIGZyb20gYmRldiIgc3RlcC4gQXMgQ2hyaXN0aWFuIHdyb3RlIHdl
J3ZlIGVuY2Fwc3VsYXRlZAo+ID4gPiA+IHRoYXQgaW4gZnMvc3VwZXIuYyBhbmQgYmRldl9zdXBl
cl9sb2NrKCkgaW4gcGFydGljdWxhciBidXQgdGhlIGNhbGxpbmcKPiA+ID4gPiBjb252ZW50aW9u
cyBmb3IgdGhlIGZzX2hvbGRlcl9vcHMgYXJlIG5vdCB2ZXJ5IG5pY2UgKGhvbGRpbmcKPiA+ID4g
PiBiZGV2X2hvbGRlcl9sb2NrLCBuZWVkIHRvIHJlbGVhc2UgaXQgYmVmb3JlIGdyYWJiaW5nIHBy
YWN0aWNhbGx5IGFueXRoaW5nCj4gPiA+ID4gZWxzZSkgc28gSSdkIGhhdmUgbXVjaCBncmVhdGVy
IHBlYWNlIG9mIG1pbmQgaWYgdGhpcyBkaWRuJ3Qgc3ByZWFkIHRvbwo+ID4gPiA+IG11Y2guIE9u
Y2UgeW91IGNhbGwgYmRldl9zdXBlcl9sb2NrKCkgYW5kIGhvbGQgb24gdG8gc2Igd2l0aCBzX3Vt
b3VudCBoZWxkLAo+ID4gPiA+IHRoaW5ncyBhcmUgbXVjaCBtb3JlIGNvbnZlbnRpb25hbCBmb3Ig
dGhlIGZzIGxhbmQgc28gSSdkIGxpa2UgaWYgdGhpcwo+ID4gPiA+IHN0ZXAgaGFwcGVuZWQgYmVm
b3JlIGFueSBmcyBob29rIGdvdCBjYWxsZWQuIFNvIEkgcHJlZmVyIHNvbWV0aGluZyBsaWtlCj4g
PiA+ID4gUXUncyBwcm9wb3NhbCBvZiBzZXBhcmF0ZSBzYiBvcCBmb3IgZGV2aWNlIHJlbW92YWwg
b3ZlciBleHBvcnRpbmcKPiA+ID4gPiBiZGV2X3N1cGVyX2xvY2soKS4gTGlrZToKPiA+ID4gPiAK
PiA+ID4gPiBzdGF0aWMgdm9pZCBmc19iZGV2X21hcmtfZGVhZChzdHJ1Y3QgYmxvY2tfZGV2aWNl
ICpiZGV2LCBib29sIHN1cnByaXNlKQo+ID4gPiA+IHsKPiA+ID4gPiAgICAgICAgICBzdHJ1Y3Qg
c3VwZXJfYmxvY2sgKnNiOwo+ID4gPiA+IAo+ID4gPiA+ICAgICAgICAgIHNiID0gYmRldl9zdXBl
cl9sb2NrKGJkZXYsIGZhbHNlKTsKPiA+ID4gPiAgICAgICAgICBpZiAoIXNiKQo+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gPiA+IAo+ID4gPiA+IAlpZiAoc2ItPnNfb3AtPnJl
bW92ZV9iZGV2KSB7Cj4gPiA+ID4gCQlzYi0+c19vcC0+cmVtb3ZlX2JkZXYoc2IsIGJkZXYsIHN1
cnByaXNlKTsKPiA+ID4gPiAJCXJldHVybjsKPiA+ID4gPiAJfQo+ID4gPiAKPiA+ID4gSXQgZmVl
bHMgb2RkIGJ1dCBJIGNvdWxkIGxpdmUgd2l0aCB0aGlzLCBwYXJ0aWN1bGFybHkgc2luY2UgdGhh
dCdzIHRoZQo+ID4gPiBkaXJlY3Rpb24gdGhhdCBicmF1bmVyIGlzIGxheWluZyBkb3duLiA6KQo+
ID4gCj4gPiBJIHdhbnQgdG8gcmVpdGVyYXRlIHRoYXQgbm8gb25lIGlzIHNheWluZyAidW5kZXIg
bm8gY2lyY3Vtc3RhbmNlcwo+ID4gaW1wbGVtZW50IHlvdXIgb3duIGhvbGRlciBvcHMiLiBCdXQg
aWYgeW91IHJlbHkgb24gdGhlIFZGUyBsb2NraW5nIHRoZW4KPiA+IHlvdSBiZXR0ZXIgbm90IHNw
aWxsIGl0J3MgZ3V0cyBpbnRvIHlvdXIgZmlsZXN5c3RlbSBhbmQgbWFrZSB1cyBleHBvcnQKPiA+
IHRoaXMgYmxvb2R5IGxvY2tpbmcgdGhhdCBoYWxmIHRoZSB3b3JsZCBoYWQgaW1wbGVtZW50ZWQg
d3JvbmcgaW4gdGhlaXIKPiA+IGRyaXZlcnMgaW4gdGhlIGZpcnN0IHBsYWNlcyBzcGV3aW5nIGVu
ZGxlc3Mgc3l6Ym90IGRlYWRsb2NrcyByZXBvcnRzCj4gPiB0aGF0IHdlIGhhZCB0byB0cmFjayBk
b3duIGFuZCBmaXguIFRoYXQgd2lsbCBub3QgaGFwcGVuIGFnYWluIHNpbWlsYXIKPiA+IHdheSB3
ZSBkb24ndCBibGVlZCBhbGwgdGhlIG5hc3RpbmVzcyBvZiBvdGhlciBsb2NraW5nIHBhdGhzLgo+
ID4gCj4gPiBQbGVhc2UgYWxsIHN0b3AgbG9uZyBwaGlsb3NvcGhpY2FsIHRyZWF0aXNlcyBhYm91
dCB0aGluZ3Mgbm8gb24gaGFzIGV2ZXIKPiA+IGFyZ3VlZC4gYnRyZnMgd2FudHMgdG8gcmVseSBv
biB0aGUgVkZTIGluZnJhLiBUaGF0IGlzIGZpbmUgYW5kIHdlbGwuIFdlCj4gPiB3aWxsIHN1cHBv
cnQgYW5kIGVuYWJsZSB0aGlzLgo+ID4gCj4gPiBJIHRoaW5rIHRoZSB0d28gbWV0aG9kIGlkZWEg
aXMgZmluZSBnaXZlbiB0aGF0IHRoZXkgbm93IGFyZSBjbGVhcmx5Cj4gPiBkZWxpbmVhdGVkLgo+
ID4gCj4gPiBUaGFua3MgZm9yIHByb3ZpZGluZyBzb21lIGNsYXJpdHkgaGVyZSwgRGFycmljayBh
bmQgUXUuCj4gPiAKPiAKPiBTbyB0aGUgbmV4dCB1cGRhdGUgd291bGQgYmUgc29tZXRoaW5nIGxp
a2UgdGhpcyBmb3IgZnNfYmRldl9tYXJrX2RlYWQoKToKPiAKPiAJc2IgPSBiZGV2X3N1cGVyX2xv
Y2soKTsKPiAJaWYgKCFzYikKPiAJCXJldHVybjsKPiAJaWYgKCFzdXJwcmlzZSkKPiAJCXN5bmNf
ZmlsZXN5c3RlbShzYik7Cj4gKwlpZiAoc2ItPnNfb3AtPnJlbW92ZV9iZGV2KSB7Cj4gKwkJcmV0
ID0gc2ItPnNfb3AtPnJlbW92ZV9iZGV2KCk7Cj4gKwkJaWYgKCFyZXQpIHsKPiArCQkJLyogRnMg
Y2FuIGhhbmRsZSB0aGUgZGV2IGxvc3MuICovCj4gKwkJCXN1cGVyX3VubG9ja19zaGFyZWQoKTsK
PiArCQkJcmV0dXJuOwo+ICsJCX0KPiArCX0KPiArCS8qIEZzIGNhbiBub3QgaGFuZGxlIHRoZSBk
ZXYgbG9zcywgc2h1dGRvd24uICovCj4gCXNocmlua19kY2FjaGVfc2IoKTsKPiAJZXZpY3RfaW5v
ZGVzKCk7Cj4gCWlmIChzYi0+c19vcC0+c2h1dGRvd24pCj4gCQlzYi0+c19vcC0+c2h1dGRvd24o
KTsKPiAJc3VwZXJfdW5sb2NrX3NoYXJlZCgpOwo+IAo+IFRoaXMgbWVhbnMgLT5yZW1vdmVfYmRl
digpIG11c3QgaGF2ZSBhIHJldHVybiB2YWx1ZSB0byBpbmRpY2F0ZSBpZiB0aGUgZnMKPiBjYW4g
aGFuZGxlIHRoZSBsb3NzLgo+IEFuZCBhbnkgZXJyb3IsIG5vIG1hdHRlciBpZiBpdCdzIG5vdCBl
bm91Z2ggdG9sZXJhbmNlIGZyb20gdGhlIGZzIG9yIHNvbWUKPiBvdGhlciBwcm9ibGVtIGR1cmlu
ZyB0aGUgZGV2IGxvc3MgaGFuZGxpbmcsIHRoZSBvbGQgc2h1dGRvd24gYmVoYXZpb3Igd2lsbAo+
IGJlIHRyaWdnZXJlZC4KPiAKPiBXb3VsZCB0aGlzIGJlIGFuIGFjY2VwdGFibGUgc29sdXRpb24/
CgpUaGlzIHdvcmtzIGZvciBtZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
