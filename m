Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3648BAFC4CA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 09:56:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjqrEEqS8tTJyuhf1AmQDUGTn2Wn3f0vQlJTQutLvFo=; b=AYB2CARS19Sp06LQ67p7pupZHW
	/ZcDnej9zqHTZ/BLGuM0ltM/72Ahnude64CFrRMbxt9qCNQUhCDEyNO4ocwTWSKu5fDAJkfN4BdqD
	Me2WmlAfQM8f2p9IvBUuITMX1vLQ52FAC2flwLfI+quVN1tjM8Vj/f04RwAf+tRqdmWQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZ3BD-0002N6-78;
	Tue, 08 Jul 2025 07:55:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1uZ3Ap-0002MZ-IX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 07:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F9HYnUQLadU1OjmrUiD7rKAEe5xZdi/mNVwKG2KX8Kg=; b=QMh59UyLwAZFRICyoubvn0kVbd
 9TOxWlaJ8FwA4Ez5resiQsNNXrnOmYfMdXdGFLfrzC5egupVFcY7NHIy1A0P1F6l8lDXU8HIqNrbG
 7rM3v8NU6vxOuvvc80HcDm/vsCouzDZPYtHzFURmwAnbSk5n/SkvMUzX9Z31nGO2kaW4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F9HYnUQLadU1OjmrUiD7rKAEe5xZdi/mNVwKG2KX8Kg=; b=J4XunucWinkW2+i3ZBulQInG8x
 godIeOzmge0vkz/nUCLby+lv3wNRS7VRn3HtlwR8cWuFG13pg4tOjWZngx81l6vH8bOG4d1jMXrB/
 grmKpB8h025I7kpRE6l90UAFnze99Bvcmm6lg0ObOr4P5LzP8nKpwEQTcjl0dYbV268Q=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZ3Ao-0002nf-Ug for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 07:55:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4A34C61472;
 Tue,  8 Jul 2025 07:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B88C4CEED;
 Tue,  8 Jul 2025 07:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751961320;
 bh=qsPSN2BpCezUCvdd+RaM6scGQ8lIU5NoJZv7E/OP/1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sgxuPBfh3cZ0dSDKch6I5Rqryw9OXZSRJcFlBBbK2wZk7UGITXp4prgxpzNUQi6VS
 +nmmibndMCtDY0Li8hfg7Jw/0gZudYRJblZ6FolRAubFzcLMuAsK7XEoKiSDxIgIW1
 9qRXNQoc/ihFCGt2UwXeahyM5dgBpX/hh1PBhZEkRleJQEzgoAcBwUYxCiRTCaUC1o
 XPGqDJKxSp5j5XzA1ld1uWapoMzVkWw9oV5u9f/lfYdSi0W1PygUXlIMOWdhVsP0C/
 ABdtdShHTLFroT13TzZA/Ayi8o093gg45lzstPUfEDRdSAW6wkVshNvzkuIsltRaXJ
 tIjDK/9jXsNog==
Date: Tue, 8 Jul 2025 09:55:14 +0200
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20250708-geahndet-rohmaterial-0419fd6a76b3@brauner>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250708004532.GA2672018@frogsfrogsfrogs>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Jul 07, 2025 at 05:45:32PM -0700, Darrick J. Wong
   wrote: > On Tue, Jul 08, 2025 at 08:52:47AM +0930, Qu Wenruo wrote: > > >
   > > > 在 2025/7/8 08:32, Dave Chinner 写道: > > > On Fri, Jul 04, [...]
    
 
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
X-Headers-End: 1uZ3Ao-0002nf-Ug
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
Cc: ntfs3@lists.linux.dev, jack@suse.cz, Dave Chinner <david@fromorbit.com>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Qu Wenruo <wqu@suse.com>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBKdWwgMDcsIDIwMjUgYXQgMDU6NDU6MzJQTSAtMDcwMCwgRGFycmljayBKLiBXb25n
IHdyb3RlOgo+IE9uIFR1ZSwgSnVsIDA4LCAyMDI1IGF0IDA4OjUyOjQ3QU0gKzA5MzAsIFF1IFdl
bnJ1byB3cm90ZToKPiA+IAo+ID4gCj4gPiDlnKggMjAyNS83LzggMDg6MzIsIERhdmUgQ2hpbm5l
ciDlhpnpgZM6Cj4gPiA+IE9uIEZyaSwgSnVsIDA0LCAyMDI1IGF0IDEwOjEyOjI5QU0gKzA5MzAs
IFF1IFdlbnJ1byB3cm90ZToKPiA+ID4gPiBDdXJyZW50bHkgYWxsIHRoZSBmaWxlc3lzdGVtcyBp
bXBsZW1lbnRpbmcgdGhlCj4gPiA+ID4gc3VwZXJfb3BlYXJhdGlvbnM6OnNodXRkb3duKCkgY2Fs
bGJhY2sgY2FuIG5vdCBhZmZvcmQgbG9zaW5nIGEgZGV2aWNlLgo+ID4gPiA+IAo+ID4gPiA+IFRo
dXMgZnNfYmRldl9tYXJrX2RlYWQoKSB3aWxsIGp1c3QgY2FsbCB0aGUgc2h1dGRvd24oKSBjYWxs
YmFjayBmb3IgdGhlCj4gPiA+ID4gaW52b2x2ZWQgZmlsZXN5c3RlbS4KPiA+ID4gPiAKPiA+ID4g
PiBCdXQgaXQgd2lsbCBubyBsb25nZXIgYmUgdGhlIGNhc2UsIHdpdGggbXVsdGktZGV2aWNlIGZp
bGVzeXN0ZW1zIGxpa2UKPiA+ID4gPiBidHJmcyBhbmQgYmNhY2hlZnMgdGhlIGZpbGVzeXN0ZW0g
Y2FuIGhhbmRsZSBjZXJ0YWluIGRldmljZSBsb3NzIHdpdGhvdXQKPiA+ID4gPiBzaHV0dGluZyBk
b3duIHRoZSB3aG9sZSBmaWxlc3lzdGVtLgo+ID4gPiA+IAo+ID4gPiA+IFRvIGFsbG93IHRob3Nl
IG11bHRpLWRldmljZSBmaWxlc3lzdGVtcyB0byBiZSBpbnRlZ3JhdGVkIHRvIHVzZQo+ID4gPiA+
IGZzX2hvbGRlcl9vcHM6Cj4gPiA+ID4gCj4gPiA+ID4gLSBSZXBsYWNlIHN1cGVyX29wZWFyYXRp
b246OnNodXRkb3duKCkgd2l0aAo+ID4gPiA+ICAgIHN1cGVyX29wZWFyYXRpb25zOjpyZW1vdmVf
YmRldigpCj4gPiA+ID4gICAgVG8gYmV0dGVyIGRlc2NyaWJlIHdoZW4gdGhlIGNhbGxiYWNrIGlz
IGNhbGxlZC4KPiA+ID4gCj4gPiA+IFRoaXMgY29uZmxhdGVzIGNhdXNlIHdpdGggYWN0aW9uLgo+
ID4gPiAKPiA+ID4gVGhlIHNodXRkb3duIGNhbGxvdXQgaXMgYW4gYWN0aW9uIHRoYXQgdGhlIGZp
bGVzeXN0ZW0gbXVzdCBleGVjdXRlLAo+ID4gPiB3aGlsc3QgInJlbW92ZSBiZGV2IiBpcyBhIGNh
dXNlIG5vdGlmaWNhdGlvbiB0aGF0IG1pZ2h0IHJlcXVpcmUgYW4KPiA+ID4gYWN0aW9uIHRvIGJl
IHRha2UuCj4gPiA+IAo+ID4gPiBZZXMsIHRoZSBjYXVzZSBjb3VsZCBiZSBzb21lb25lIGRvaW5n
IGhvdC11bnBsdWcgb2YgdGhlIGJsb2NrCj4gPiA+IGRldmljZSwgYnV0IGl0IGNvdWxkIGFsc28g
YmUgc29tZXRoaW5nIGdvaW5nIHdyb25nIGluIHNvZnR3YXJlCj4gPiA+IGxheWVycyBiZWxvdyB0
aGUgZmlsZXN5c3RlbS4gZS5nLiBkbS10aGlucCBoYXZpbmcgYW4gdW5yZWNvdmVyYWJsZQo+ID4g
PiBjb3JydXB0aW9uIG9yIEVOT1NQQyBlcnJvcnMuCj4gPiA+IAo+ID4gPiBXZSBhbHJlYWR5IGhh
dmUgYSAiY2F1c2UiIG5vdGlmaWNhdGlvbjogYmxrX2hvbGRlcl9vcHMtPm1hcmtfZGVhZCgpLgo+
ID4gPiAKPiA+ID4gVGhlIGdlbmVyaWMgZnMgYWN0aW9uIHRoYXQgaXMgdGFrZW4gYnkgdGhpcyBu
b3RpZmljYXRpb24gaXMKPiA+ID4gZnNfYmRldl9tYXJrX2RlYWQoKS4gIFRoYXQgYWN0aW9uIGlz
IHRvIGludmFsaWRhdGUgY2FjaGVzIGFuZCBzaHV0Cj4gPiA+IGRvd24gdGhlIGZpbGVzeXN0ZW0u
Cj4gPiA+IAo+ID4gPiBidHJmcyBuZWVkcyB0byBkbyBzb21ldGhpbmcgZGlmZmVyZW50IHRvIGEg
YmxrX2hvbGRlcl9vcHMtPm1hcmtfZGVhZAo+ID4gPiBub3RpZmljYXRpb24uIGkuZS4gaXQgbmVl
ZHMgYW4gYWN0aW9uIHRoYXQgaXMgZGlmZmVyZW50IHRvCj4gPiA+IGZzX2JkZXZfbWFya19kZWFk
KCkuCj4gPiA+IAo+ID4gPiBJbmRlZWQsIHRoaXMgaXMgaG93IGJjYWNoZWZzIGFscmVhZHkgaGFu
ZGxlcyAic2luZ2xlIGRldmljZQo+ID4gPiBkaWVkIiBldmVudHMgZm9yIG11bHRpLWRldmljZSBm
aWxlc3lzdGVtcyAtIHNlZQo+ID4gPiBiY2gyX2ZzX2JkZXZfbWFya19kZWFkKCkuCj4gPiAKPiA+
IEkgZG8gbm90IHRoaW5rIGl0J3MgdGhlIGNvcnJlY3Qgd2F5IHRvIGdvLCBlc3BlY2lhbGx5IHdo
ZW4gdGhlcmUgaXMgYWxyZWFkeQo+ID4gZnNfaG9sZGVyX29wcy4KPiA+IAo+ID4gV2UncmUgYWx3
YXlzIGdvaW5nIHRvd2FyZHMgYSBtb3JlIGdlbmVyaWMgc29sdXRpb24sIG90aGVyIHRoYW4gbGV0
dGluZyB0aGUKPiA+IGluZGl2aWR1YWwgZnMgdG8gZG8gdGhlIHNhbWUgdGhpbmcgc2xpZ2h0bHkg
ZGlmZmVyZW50bHkuCj4gCj4gT24gc2Vjb25kIHRob3VnaHQgLS0gaXQncyB3ZWlyZCB0aGF0IHlv
dSdkIGZsdXNoIHRoZSBmaWxlc3lzdGVtIGFuZAo+IHNocmluayB0aGUgaW5vZGUvZGVudHJ5IGNh
Y2hlcyBpbiBhICJ5b3VyIGRldmljZSB3ZW50IGF3YXkiIGhhbmRsZXIuCj4gRmFuY3kgZmlsZXN5
c3RlbXMgbGlrZSBiY2FjaGVmcyBhbmQgYnRyZnMgd291bGQgbGlrZWx5IGp1c3Qgc2hpZnQgSU8g
dG8KPiBhIGRpZmZlcmVudCBiZGV2LCByaWdodD8gIEFuZCB0aGVyZSdzIG5vIGdvb2QgcmVhc29u
IHRvIHJ1biBzaHJpbmtlcnMgb24KPiBlaXRoZXIgb2YgdGhvc2UgZnNlcywgcmlnaHQ/Cj4gCj4g
PiBZZXMsIHRoZSBuYW1pbmcgaXMgbm90IHBlcmZlY3QgYW5kIG1peGluZyBjYXVzZSBhbmQgYWN0
aW9uLCBidXQgdGhlIGVuZAo+ID4gcmVzdWx0IGlzIHN0aWxsIGEgbW9yZSBnZW5lcmljIGFuZCBs
ZXNzIGR1cGxpY2F0ZWQgY29kZSBiYXNlLgo+IAo+IEkgdGhpbmsgZGNoaW5uZXIgbWFrZXMgYSBn
b29kIHBvaW50IHRoYXQgaWYgeW91ciBmaWxlc3lzdGVtIGNhbiBkbwo+IHNvbWV0aGluZyBjbGV2
ZXIgb24gZGV2aWNlIHJlbW92YWwsIGl0IHNob3VsZCBwcm92aWRlIGl0cyBvd24gYmxvY2sKPiBk
ZXZpY2UgaG9sZGVyIG9wcyBpbnN0ZWFkIG9mIHVzaW5nIGZzX2hvbGRlcl9vcHMuICBJIGRvbid0
IHVuZGVyc3RhbmQKPiB3aHkgeW91IG5lZWQgYSAiZ2VuZXJpYyIgc29sdXRpb24gZm9yIGJ0cmZz
IHdoZW4gaXQncyBub3QgZ29pbmcgdG8gZG8KPiB3aGF0IHRoZSBvdGhlcnMgZG8gYW55d2F5LgoK
SSB0aGluayBsZXR0aW5nIGZpbGVzeXN0ZW1zIGltcGxlbWVudCB0aGVpciBvd24gaG9sZGVyIG9w
cyBzaG91bGQgYmUKYXZvaWRlZCBpZiB3ZSBjYW4uIENocmlzdG9waCBtYXkgY2hpbWUgaW4gaGVy
ZS4gSSBoYXZlIG5vIGFwcGV0dGl0ZSBmb3IKZXhwb3J0aW5nIHN0dWZmIGxpa2UgZ2V0X2JkZXZf
c3VwZXIoKSB1bmxlc3MgYWJzb2x1dGVseSBuZWNlc3NhcnkuIFdlCnRyaWVkIHRvIG1vdmUgYWxs
IHRoYXQgaGFuZGxpbmcgaW50byB0aGUgVkZTIHRvIGVsaW1pbmF0ZSBhIHNsZXcgb2YKZGVhZGxv
Y2tzIHdlIGRldGVjdGVkIGFuZCBmaXhlZC4gSSBoYXZlIG5vIGFwcGV0aXRlIHRvIHJlcGVhdCB0
aGF0CmN5Y2xlLgoKVGhlIHNodXRkb3duIG1ldGhvZCBpcyBpbXBsZW1lbnRlZCBvbmx5IGJ5IGJs
b2NrLWJhc2VkIGZpbGVzeXN0ZW1zIGFuZAphcmd1YWJseSBzaHV0ZG93biB3YXMgYWx3YXlzIGEg
bWlzbm9tZXIgYmVjYXVzZSBpdCBhc3N1bWVkIHRoYXQgdGhlCmZpbGVzeXN0ZW0gbmVlZHMgdG8g
YWN0dWFsbHkgc2h1dCBkb3duIHdoZW4gaXQgaXMgY2FsbGVkLiBJT1csIHdlIG1hZGUKaXQgc28g
dGhhdCBpdCBpcyBhIGNhbGwgdG8gYWN0aW9uIGJ1dCB0aGF0IGRvZXNuJ3QgaGF2ZSB0byBiZSB0
aGUgY2FzZS4KQ2FsbGluZyBpdCAtPnJlbW92ZV9iZGV2KCkgaXMgaW1vIHRoZSBjb3JyZWN0IHRo
aW5nIGJlY2F1c2UgaXQgZ2l2ZXMKYmxvY2sgYmFzZWQgZmlsZXN5c3RlbSB0aGUgYWJpbGl0eSB0
byBoYW5kbGUgZGV2aWNlIGV2ZW50cyBob3cgdGhleSBzZWUKZml0LgoKT25jZSB3ZSB3aWxsIGhh
dmUgbm9uLWJsb2NrIGJhc2VkIGZpbGVzeXN0ZW1zIHRoYXQgbmVlZCBhIG1ldGhvZCB0bwphbHdh
eXMgc2h1dCBkb3duIHRoZSBmaWxlc3lzdGVtIGl0c2VsZiB3ZSBtaWdodCBoYXZlIHRvIHJldmlz
aXQgdGhpcwpkZXNpZ24gYW55d2F5IGJ1dCBubyBvbmUgaGFkIHRoYXQgdXNlLWNhc2UgeWV0LgoK
PiAKPiBBd2t3YXJkIG5hbWluZyBpcyBvZnRlbiBhIHNpZ24gdGhhdCBmdXJ0aGVyIHRob3VnaHQg
KG9yIGF0IGxlYXN0Cj4gc2VwYXJhdGlvbiBvZiBjb2RlKSBpcyBuZWVkZWQuCj4gCj4gQXMgYW4g
YXNpZGU6Cj4gJ3R3b3VsZCBiZSBuaWNlIGlmIHdlIGNvdWxkIGxpZnQgdGhlICpGU19JT0NfU0hV
VERPV04gZGlzcGF0Y2ggb3V0IG9mCj4gZXZlcnlvbmUncyBpb2N0bCBmdW5jdGlvbnMgaW50byB0
aGUgVkZTLCBhbmQgdGhlbiBtb3ZlIHRoZSAiSSBhbSBkZWFkIgo+IHN0YXRlIGludG8gc3VwZXJf
YmxvY2sgc28gdGhhdCB5b3UgY291bGQgYWN0dWFsbHkgc2h1dCBkb3duIGFueQo+IGZpbGVzeXN0
ZW0sIG5vdCBqdXN0IHRoZSBzZXZlbiB0aGF0IGN1cnJlbnRseSBpbXBsZW1lbnQgaXQuCgpUaGF0
IGdvZXMgYmFjayB0byBteSBlYXJsaWVyIHBvaW50LiBGd2l3LCBJIHRoaW5rIHRoYXQncyB2YWx1
YWJsZSB3b3JrLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
