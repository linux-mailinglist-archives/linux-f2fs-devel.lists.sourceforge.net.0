Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EED23AFD83C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 22:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwLdugxBezD1Mf/7JEcqXkuoVZfOifqiQZBxOfCefL0=; b=HsfuLiXv4+JTi0ldXRGqSHRNyp
	BtycHNSh/b/9eG5vMxRp43vAqMn93tyiVMtXm5iS4BE9T8noZRgUmKlrEdhIYSARzXJfRscm4Z76B
	mw6kR69ffGTY/Hc6M7ylfoueyhuuBlQYNz1qQ0ec/46rXIXLkLP24R1x0312YbCawoqA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZEoF-0001Yi-IX;
	Tue, 08 Jul 2025 20:20:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1uZEoE-0001Yb-6k
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 20:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PWwKvY6KOz4F96BvwaSF8sN15vVnBrAbiHBkd86yDMI=; b=ODJZmB7xm9UvE/EIXe6zCu3iQS
 BqktX1v04jWtH7RwsrcNQZ+Q+6hQI20zgjy4naI1q/KHch6K+mXc6h7Z8h8bpdEH0d9Y09bvrTeX1
 63JIl3hsnTvkZCrx+VkHwP1N1iBmRGLzizxnmDZ7YE9JMLvYSFLEEwjalx8K70+gcCQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PWwKvY6KOz4F96BvwaSF8sN15vVnBrAbiHBkd86yDMI=; b=iQ4tMpmU0vdFf+PyA5V/2bdvdV
 4EBoD2Yp/lL6n5nmi4iX5SAxXxX3982r4cNxB5ORn/KbzYmhVHdt16X6sAfSvaLCKtQjgR3hyoDLa
 iwmfhOPe957Eace9pad2hLh7MJcH21wBY2T5K47NVnVseN3DIuxG/bKe0OP2g1gVaGSs=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZEoD-0000CD-FS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 20:20:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B59F1A542FE;
 Tue,  8 Jul 2025 20:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E7EC4CEED;
 Tue,  8 Jul 2025 20:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752006051;
 bh=+yxZ08dKrAbdFZ6sAL+9jMwOYAMn3pq6/TMoNHiAVqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hPMEhSkUX/LsvtZLeds9iEsFR445eshxWZXvoRnSLujgLEPzAcfHTEY1hKzvOZwLi
 CO6xBgdyPLvwJKOyvRvQbfayjvwz//qmWRwCqXX9eJfnurVWX9yJjB+FGnGJqw9Bdo
 YvTa4ZUzOiq4x/0+MnhVWgvty8CXom2KMAk1lU1DdgCV3QPlLlzl63cgXPodHeUmuR
 c/DyafLAONZHqILRSCVnIMh6DkLySD8sZvd+yvzKsb2YGHyNZ8+dzvy79GVsPU2CIa
 QSxZLDXRKYoNFJq9mC7u92Mfs4HyGdJgpKNx3bbNB6DnNtxSNNOGKynr+rejYv2LwT
 nVQjowPhBvE+A==
Date: Tue, 8 Jul 2025 13:20:50 -0700
To: Jan Kara <jack@suse.cz>
Message-ID: <20250708202050.GG2672049@frogsfrogsfrogs>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <2dm6bsup7vxwl4vwmllkvt5erncirr272bov4ehd5gix7n2vnw@bkagb26tjtj5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2dm6bsup7vxwl4vwmllkvt5erncirr272bov4ehd5gix7n2vnw@bkagb26tjtj5>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jul 08, 2025 at 12:20:00PM +0200, Jan Kara wrote:
   > On Mon 07-07-25 17:45:32, Darrick J. Wong wrote: > > On Tue, Jul 08, 2025
    at 08:52:47AM +0930, Qu Wenruo wrote: > > > 在 2025/7/8 08:32, Da [...] 
 
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
X-Headers-End: 1uZEoD-0000CD-FS
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: brauner@kernel.org, ntfs3@lists.linux.dev,
 Dave Chinner <david@fromorbit.com>, Qu Wenruo <quwenruo.btrfs@gmx.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdWwgMDgsIDIwMjUgYXQgMTI6MjA6MDBQTSArMDIwMCwgSmFuIEthcmEgd3JvdGU6
Cj4gT24gTW9uIDA3LTA3LTI1IDE3OjQ1OjMyLCBEYXJyaWNrIEouIFdvbmcgd3JvdGU6Cj4gPiBP
biBUdWUsIEp1bCAwOCwgMjAyNSBhdCAwODo1Mjo0N0FNICswOTMwLCBRdSBXZW5ydW8gd3JvdGU6
Cj4gPiA+IOWcqCAyMDI1LzcvOCAwODozMiwgRGF2ZSBDaGlubmVyIOWGmemBkzoKPiA+ID4gPiBP
biBGcmksIEp1bCAwNCwgMjAyNSBhdCAxMDoxMjoyOUFNICswOTMwLCBRdSBXZW5ydW8gd3JvdGU6
Cj4gPiA+ID4gPiBDdXJyZW50bHkgYWxsIHRoZSBmaWxlc3lzdGVtcyBpbXBsZW1lbnRpbmcgdGhl
Cj4gPiA+ID4gPiBzdXBlcl9vcGVhcmF0aW9uczo6c2h1dGRvd24oKSBjYWxsYmFjayBjYW4gbm90
IGFmZm9yZCBsb3NpbmcgYSBkZXZpY2UuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRodXMgZnNfYmRl
dl9tYXJrX2RlYWQoKSB3aWxsIGp1c3QgY2FsbCB0aGUgc2h1dGRvd24oKSBjYWxsYmFjayBmb3Ig
dGhlCj4gPiA+ID4gPiBpbnZvbHZlZCBmaWxlc3lzdGVtLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBC
dXQgaXQgd2lsbCBubyBsb25nZXIgYmUgdGhlIGNhc2UsIHdpdGggbXVsdGktZGV2aWNlIGZpbGVz
eXN0ZW1zIGxpa2UKPiA+ID4gPiA+IGJ0cmZzIGFuZCBiY2FjaGVmcyB0aGUgZmlsZXN5c3RlbSBj
YW4gaGFuZGxlIGNlcnRhaW4gZGV2aWNlIGxvc3Mgd2l0aG91dAo+ID4gPiA+ID4gc2h1dHRpbmcg
ZG93biB0aGUgd2hvbGUgZmlsZXN5c3RlbS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVG8gYWxsb3cg
dGhvc2UgbXVsdGktZGV2aWNlIGZpbGVzeXN0ZW1zIHRvIGJlIGludGVncmF0ZWQgdG8gdXNlCj4g
PiA+ID4gPiBmc19ob2xkZXJfb3BzOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAtIFJlcGxhY2Ugc3Vw
ZXJfb3BlYXJhdGlvbjo6c2h1dGRvd24oKSB3aXRoCj4gPiA+ID4gPiAgICBzdXBlcl9vcGVhcmF0
aW9uczo6cmVtb3ZlX2JkZXYoKQo+ID4gPiA+ID4gICAgVG8gYmV0dGVyIGRlc2NyaWJlIHdoZW4g
dGhlIGNhbGxiYWNrIGlzIGNhbGxlZC4KPiA+ID4gPiAKPiA+ID4gPiBUaGlzIGNvbmZsYXRlcyBj
YXVzZSB3aXRoIGFjdGlvbi4KPiA+ID4gPiAKPiA+ID4gPiBUaGUgc2h1dGRvd24gY2FsbG91dCBp
cyBhbiBhY3Rpb24gdGhhdCB0aGUgZmlsZXN5c3RlbSBtdXN0IGV4ZWN1dGUsCj4gPiA+ID4gd2hp
bHN0ICJyZW1vdmUgYmRldiIgaXMgYSBjYXVzZSBub3RpZmljYXRpb24gdGhhdCBtaWdodCByZXF1
aXJlIGFuCj4gPiA+ID4gYWN0aW9uIHRvIGJlIHRha2UuCj4gPiA+ID4gCj4gPiA+ID4gWWVzLCB0
aGUgY2F1c2UgY291bGQgYmUgc29tZW9uZSBkb2luZyBob3QtdW5wbHVnIG9mIHRoZSBibG9jawo+
ID4gPiA+IGRldmljZSwgYnV0IGl0IGNvdWxkIGFsc28gYmUgc29tZXRoaW5nIGdvaW5nIHdyb25n
IGluIHNvZnR3YXJlCj4gPiA+ID4gbGF5ZXJzIGJlbG93IHRoZSBmaWxlc3lzdGVtLiBlLmcuIGRt
LXRoaW5wIGhhdmluZyBhbiB1bnJlY292ZXJhYmxlCj4gPiA+ID4gY29ycnVwdGlvbiBvciBFTk9T
UEMgZXJyb3JzLgo+ID4gPiA+IAo+ID4gPiA+IFdlIGFscmVhZHkgaGF2ZSBhICJjYXVzZSIgbm90
aWZpY2F0aW9uOiBibGtfaG9sZGVyX29wcy0+bWFya19kZWFkKCkuCj4gPiA+ID4gCj4gPiA+ID4g
VGhlIGdlbmVyaWMgZnMgYWN0aW9uIHRoYXQgaXMgdGFrZW4gYnkgdGhpcyBub3RpZmljYXRpb24g
aXMKPiA+ID4gPiBmc19iZGV2X21hcmtfZGVhZCgpLiAgVGhhdCBhY3Rpb24gaXMgdG8gaW52YWxp
ZGF0ZSBjYWNoZXMgYW5kIHNodXQKPiA+ID4gPiBkb3duIHRoZSBmaWxlc3lzdGVtLgo+ID4gPiA+
IAo+ID4gPiA+IGJ0cmZzIG5lZWRzIHRvIGRvIHNvbWV0aGluZyBkaWZmZXJlbnQgdG8gYSBibGtf
aG9sZGVyX29wcy0+bWFya19kZWFkCj4gPiA+ID4gbm90aWZpY2F0aW9uLiBpLmUuIGl0IG5lZWRz
IGFuIGFjdGlvbiB0aGF0IGlzIGRpZmZlcmVudCB0bwo+ID4gPiA+IGZzX2JkZXZfbWFya19kZWFk
KCkuCj4gPiA+ID4gCj4gPiA+ID4gSW5kZWVkLCB0aGlzIGlzIGhvdyBiY2FjaGVmcyBhbHJlYWR5
IGhhbmRsZXMgInNpbmdsZSBkZXZpY2UKPiA+ID4gPiBkaWVkIiBldmVudHMgZm9yIG11bHRpLWRl
dmljZSBmaWxlc3lzdGVtcyAtIHNlZQo+ID4gPiA+IGJjaDJfZnNfYmRldl9tYXJrX2RlYWQoKS4K
PiA+ID4gCj4gPiA+IEkgZG8gbm90IHRoaW5rIGl0J3MgdGhlIGNvcnJlY3Qgd2F5IHRvIGdvLCBl
c3BlY2lhbGx5IHdoZW4gdGhlcmUgaXMgYWxyZWFkeQo+ID4gPiBmc19ob2xkZXJfb3BzLgo+ID4g
PiAKPiA+ID4gV2UncmUgYWx3YXlzIGdvaW5nIHRvd2FyZHMgYSBtb3JlIGdlbmVyaWMgc29sdXRp
b24sIG90aGVyIHRoYW4gbGV0dGluZyB0aGUKPiA+ID4gaW5kaXZpZHVhbCBmcyB0byBkbyB0aGUg
c2FtZSB0aGluZyBzbGlnaHRseSBkaWZmZXJlbnRseS4KPiA+IAo+ID4gT24gc2Vjb25kIHRob3Vn
aHQgLS0gaXQncyB3ZWlyZCB0aGF0IHlvdSdkIGZsdXNoIHRoZSBmaWxlc3lzdGVtIGFuZAo+ID4g
c2hyaW5rIHRoZSBpbm9kZS9kZW50cnkgY2FjaGVzIGluIGEgInlvdXIgZGV2aWNlIHdlbnQgYXdh
eSIgaGFuZGxlci4KPiA+IEZhbmN5IGZpbGVzeXN0ZW1zIGxpa2UgYmNhY2hlZnMgYW5kIGJ0cmZz
IHdvdWxkIGxpa2VseSBqdXN0IHNoaWZ0IElPIHRvCj4gPiBhIGRpZmZlcmVudCBiZGV2LCByaWdo
dD8gIEFuZCB0aGVyZSdzIG5vIGdvb2QgcmVhc29uIHRvIHJ1biBzaHJpbmtlcnMgb24KPiA+IGVp
dGhlciBvZiB0aG9zZSBmc2VzLCByaWdodD8KPiAKPiBJIGFncmVlIGl0IGlzIGF3a3dhcmQgYW5k
IGJjYWNoZWZzIGF2b2lkcyB0aGVzZSBpbiBjYXNlIG9mIHJlbW92YWwgaXQgY2FuCj4gaGFuZGxl
IGdyYWNlZnVsbHkgQUZBSUNTLgo+IAo+ID4gPiBZZXMsIHRoZSBuYW1pbmcgaXMgbm90IHBlcmZl
Y3QgYW5kIG1peGluZyBjYXVzZSBhbmQgYWN0aW9uLCBidXQgdGhlIGVuZAo+ID4gPiByZXN1bHQg
aXMgc3RpbGwgYSBtb3JlIGdlbmVyaWMgYW5kIGxlc3MgZHVwbGljYXRlZCBjb2RlIGJhc2UuCj4g
PiAKPiA+IEkgdGhpbmsgZGNoaW5uZXIgbWFrZXMgYSBnb29kIHBvaW50IHRoYXQgaWYgeW91ciBm
aWxlc3lzdGVtIGNhbiBkbwo+ID4gc29tZXRoaW5nIGNsZXZlciBvbiBkZXZpY2UgcmVtb3ZhbCwg
aXQgc2hvdWxkIHByb3ZpZGUgaXRzIG93biBibG9jawo+ID4gZGV2aWNlIGhvbGRlciBvcHMgaW5z
dGVhZCBvZiB1c2luZyBmc19ob2xkZXJfb3BzLiAgSSBkb24ndCB1bmRlcnN0YW5kCj4gPiB3aHkg
eW91IG5lZWQgYSAiZ2VuZXJpYyIgc29sdXRpb24gZm9yIGJ0cmZzIHdoZW4gaXQncyBub3QgZ29p
bmcgdG8gZG8KPiA+IHdoYXQgdGhlIG90aGVycyBkbyBhbnl3YXkuCj4gCj4gV2VsbCwgSSdkIGFs
c28gc2F5IGp1c3QgZ28gZm9yIG93biBmc19ob2xkZXJfb3BzIGlmIGl0IHdhcyBub3QgZm9yIHRo
ZQo+IGF3a3dhcmQgImdldCBzdXBlciBmcm9tIGJkZXYiIHN0ZXAuIEFzIENocmlzdGlhbiB3cm90
ZSB3ZSd2ZSBlbmNhcHN1bGF0ZWQKPiB0aGF0IGluIGZzL3N1cGVyLmMgYW5kIGJkZXZfc3VwZXJf
bG9jaygpIGluIHBhcnRpY3VsYXIgYnV0IHRoZSBjYWxsaW5nCj4gY29udmVudGlvbnMgZm9yIHRo
ZSBmc19ob2xkZXJfb3BzIGFyZSBub3QgdmVyeSBuaWNlIChob2xkaW5nCj4gYmRldl9ob2xkZXJf
bG9jaywgbmVlZCB0byByZWxlYXNlIGl0IGJlZm9yZSBncmFiYmluZyBwcmFjdGljYWxseSBhbnl0
aGluZwo+IGVsc2UpIHNvIEknZCBoYXZlIG11Y2ggZ3JlYXRlciBwZWFjZSBvZiBtaW5kIGlmIHRo
aXMgZGlkbid0IHNwcmVhZCB0b28KPiBtdWNoLiBPbmNlIHlvdSBjYWxsIGJkZXZfc3VwZXJfbG9j
aygpIGFuZCBob2xkIG9uIHRvIHNiIHdpdGggc191bW91bnQgaGVsZCwKPiB0aGluZ3MgYXJlIG11
Y2ggbW9yZSBjb252ZW50aW9uYWwgZm9yIHRoZSBmcyBsYW5kIHNvIEknZCBsaWtlIGlmIHRoaXMK
PiBzdGVwIGhhcHBlbmVkIGJlZm9yZSBhbnkgZnMgaG9vayBnb3QgY2FsbGVkLiBTbyBJIHByZWZl
ciBzb21ldGhpbmcgbGlrZQo+IFF1J3MgcHJvcG9zYWwgb2Ygc2VwYXJhdGUgc2Igb3AgZm9yIGRl
dmljZSByZW1vdmFsIG92ZXIgZXhwb3J0aW5nCj4gYmRldl9zdXBlcl9sb2NrKCkuIExpa2U6Cj4g
Cj4gc3RhdGljIHZvaWQgZnNfYmRldl9tYXJrX2RlYWQoc3RydWN0IGJsb2NrX2RldmljZSAqYmRl
diwgYm9vbCBzdXJwcmlzZSkKPiB7Cj4gICAgICAgICBzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiOwo+
IAo+ICAgICAgICAgc2IgPSBiZGV2X3N1cGVyX2xvY2soYmRldiwgZmFsc2UpOwo+ICAgICAgICAg
aWYgKCFzYikKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+IAo+IAlpZiAoc2ItPnNfb3AtPnJl
bW92ZV9iZGV2KSB7Cj4gCQlzYi0+c19vcC0+cmVtb3ZlX2JkZXYoc2IsIGJkZXYsIHN1cnByaXNl
KTsKPiAJCXJldHVybjsKPiAJfQoKSXQgZmVlbHMgb2RkIGJ1dCBJIGNvdWxkIGxpdmUgd2l0aCB0
aGlzLCBwYXJ0aWN1bGFybHkgc2luY2UgdGhhdCdzIHRoZQpkaXJlY3Rpb24gdGhhdCBicmF1bmVy
IGlzIGxheWluZyBkb3duLiA6KQoKRG8gd2Ugc3RpbGwgbmVlZCB0byBzdXBlcl91bmxvY2tfc2hh
cmVkIGhlcmU/CgotLUQKCj4gCj4gCWlmICghc3VycHJpc2UpCj4gCQlzeW5jX2ZpbGVzeXN0ZW0o
c2IpOwo+IAlzaHJpbmtfZGNhY2hlX3NiKHNiKTsKPiAJZXZpY3RfaW5vZGVzKHNiKTsKPiAJaWYg
KHNiLT5zX29wLT5zaHV0ZG93bikKPiAJCXNiLT5zX29wLT5zaHV0ZG93bihzYik7Cj4gCj4gCXN1
cGVyX3VubG9ja19zaGFyZWQoc2IpOwo+IH0KPiAKPiA+IEFzIGFuIGFzaWRlOgo+ID4gJ3R3b3Vs
ZCBiZSBuaWNlIGlmIHdlIGNvdWxkIGxpZnQgdGhlICpGU19JT0NfU0hVVERPV04gZGlzcGF0Y2gg
b3V0IG9mCj4gPiBldmVyeW9uZSdzIGlvY3RsIGZ1bmN0aW9ucyBpbnRvIHRoZSBWRlMsIGFuZCB0
aGVuIG1vdmUgdGhlICJJIGFtIGRlYWQiCj4gPiBzdGF0ZSBpbnRvIHN1cGVyX2Jsb2NrIHNvIHRo
YXQgeW91IGNvdWxkIGFjdHVhbGx5IHNodXQgZG93biBhbnkKPiA+IGZpbGVzeXN0ZW0sIG5vdCBq
dXN0IHRoZSBzZXZlbiB0aGF0IGN1cnJlbnRseSBpbXBsZW1lbnQgaXQuCj4gCj4gWWVzLCBJIHNo
b3VsZCBmaW5kIHRpbWUgdG8gcmV2aXZlIHRoYXQgcGF0Y2ggc2VyaWVzLi4uIEl0IHdhcyBub3Qg
KnRoYXQqCj4gaGFyZCB0byBkby4KPiAKPiAJCQkJCQkJCUhvbnphCj4gLS0gCj4gSmFuIEthcmEg
PGphY2tAc3VzZS5jb20+Cj4gU1VTRSBMYWJzLCBDUgo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
