Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6A6AFBF65
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 02:45:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPl2R6mIiAZKCI2mkR2yAdcfLIqbRvMyRU0Ku+wr6Vk=; b=kn1xiRVkP/Yd0dr6B1Pieq8jkJ
	E+JoDFDUA5imDPU6x0iTJubeY9yTy7RbuD6hm8/qiXGlIxC4LAOq9JEwVcAUokgwpJr+b4CfRg8w2
	rhSfni/1LYOJ5XGmJssxrvi/uJg9NbVPeted1vSJUVJrYmgYXzAL0PWTbgi3Qp+NHpHY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uYwSw-0005zp-81;
	Tue, 08 Jul 2025 00:45:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1uYwSv-0005zc-37
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 00:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pTZTGaWM4zipEWtBIxc66onI18FS2dN1V8xkAV5zPeQ=; b=enVgn7atF9DlGW4G155NQLc0up
 LG9LkSVItk13LdfHqVt2nVGMV+06raUr4+h8Y38V4LqfWoHWussB3CkUz4wPnQ5hXEOvrblLXyUeh
 /om9IoglVdOhQPOnKeLz3lLud6VRq6kZNDt7qbZIKdm/u5DF5shMMZv861VvKfajAfTw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pTZTGaWM4zipEWtBIxc66onI18FS2dN1V8xkAV5zPeQ=; b=hK9uhAWNeXhBlogV8xU1dLr9Jg
 LJYDB54sMNlnFq0cPlRd5zCoFL/bW9Rg1zPAUzNlDe/zcKY9+no9PebKZJ/NrngTbqu9McdywY0zm
 lWaUV83O7j5ZgoKnT4AXFkd/ekfjYhCfP8pcSIAo8E1F6dZX0wYAjqFAC9+sw3hANqEI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uYwSu-0005o0-GQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 00:45:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D88376000A;
 Tue,  8 Jul 2025 00:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4F0C4CEE3;
 Tue,  8 Jul 2025 00:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751935533;
 bh=SyfWNoh9Z00/hpkgQeKtTe7VULbEcE6tZnu4VonKfXY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=An1g12mbj+OPThp27l2LzBK6Kea6/V6HUSsPuGBFzUqOcTzLXKzTOESP1Gp8cJb7I
 vS8coYw0RH69GLJUnemTExyhystL08DjRV2f88I5+Cg/PMZq/fJqaB8HIAJrZKmYyZ
 JVVls6+h1qG4156UWQySe6HTkDhY6zXIqi9hxDd1SL8yJ7UtR22lmk+mSGsm+BIcAf
 RTLqBN2/BO+SeJPVIQoMhf7pxvne28//yJVkK4MX34dhu4hLLl6TY2BEeaykR4IMw8
 l8ZJYhHrzXu0tiHFh7xJUAIgg+j2RbIg/1Bf4Rks5N17T3tGtjAiM8aMe6QHxE+Z6i
 katjEBgQCVkOQ==
Date: Mon, 7 Jul 2025 17:45:32 -0700
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Message-ID: <20250708004532.GA2672018@frogsfrogsfrogs>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jul 08, 2025 at 08:52:47AM +0930, Qu Wenruo wrote:
    > > > 在 2025/7/8 08:32, Dave Chinner 写道: > > On Fri, Jul 04, 2025 at
    10:12:29AM +0930, Qu Wenruo wrote: > > > Currently all the filesys [...] 
 
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
X-Headers-End: 1uYwSu-0005o0-GQ
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
Cc: brauner@kernel.org, ntfs3@lists.linux.dev, jack@suse.cz,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Qu Wenruo <wqu@suse.com>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdWwgMDgsIDIwMjUgYXQgMDg6NTI6NDdBTSArMDkzMCwgUXUgV2VucnVvIHdyb3Rl
Ogo+IAo+IAo+IOWcqCAyMDI1LzcvOCAwODozMiwgRGF2ZSBDaGlubmVyIOWGmemBkzoKPiA+IE9u
IEZyaSwgSnVsIDA0LCAyMDI1IGF0IDEwOjEyOjI5QU0gKzA5MzAsIFF1IFdlbnJ1byB3cm90ZToK
PiA+ID4gQ3VycmVudGx5IGFsbCB0aGUgZmlsZXN5c3RlbXMgaW1wbGVtZW50aW5nIHRoZQo+ID4g
PiBzdXBlcl9vcGVhcmF0aW9uczo6c2h1dGRvd24oKSBjYWxsYmFjayBjYW4gbm90IGFmZm9yZCBs
b3NpbmcgYSBkZXZpY2UuCj4gPiA+IAo+ID4gPiBUaHVzIGZzX2JkZXZfbWFya19kZWFkKCkgd2ls
bCBqdXN0IGNhbGwgdGhlIHNodXRkb3duKCkgY2FsbGJhY2sgZm9yIHRoZQo+ID4gPiBpbnZvbHZl
ZCBmaWxlc3lzdGVtLgo+ID4gPiAKPiA+ID4gQnV0IGl0IHdpbGwgbm8gbG9uZ2VyIGJlIHRoZSBj
YXNlLCB3aXRoIG11bHRpLWRldmljZSBmaWxlc3lzdGVtcyBsaWtlCj4gPiA+IGJ0cmZzIGFuZCBi
Y2FjaGVmcyB0aGUgZmlsZXN5c3RlbSBjYW4gaGFuZGxlIGNlcnRhaW4gZGV2aWNlIGxvc3Mgd2l0
aG91dAo+ID4gPiBzaHV0dGluZyBkb3duIHRoZSB3aG9sZSBmaWxlc3lzdGVtLgo+ID4gPiAKPiA+
ID4gVG8gYWxsb3cgdGhvc2UgbXVsdGktZGV2aWNlIGZpbGVzeXN0ZW1zIHRvIGJlIGludGVncmF0
ZWQgdG8gdXNlCj4gPiA+IGZzX2hvbGRlcl9vcHM6Cj4gPiA+IAo+ID4gPiAtIFJlcGxhY2Ugc3Vw
ZXJfb3BlYXJhdGlvbjo6c2h1dGRvd24oKSB3aXRoCj4gPiA+ICAgIHN1cGVyX29wZWFyYXRpb25z
OjpyZW1vdmVfYmRldigpCj4gPiA+ICAgIFRvIGJldHRlciBkZXNjcmliZSB3aGVuIHRoZSBjYWxs
YmFjayBpcyBjYWxsZWQuCj4gPiAKPiA+IFRoaXMgY29uZmxhdGVzIGNhdXNlIHdpdGggYWN0aW9u
Lgo+ID4gCj4gPiBUaGUgc2h1dGRvd24gY2FsbG91dCBpcyBhbiBhY3Rpb24gdGhhdCB0aGUgZmls
ZXN5c3RlbSBtdXN0IGV4ZWN1dGUsCj4gPiB3aGlsc3QgInJlbW92ZSBiZGV2IiBpcyBhIGNhdXNl
IG5vdGlmaWNhdGlvbiB0aGF0IG1pZ2h0IHJlcXVpcmUgYW4KPiA+IGFjdGlvbiB0byBiZSB0YWtl
Lgo+ID4gCj4gPiBZZXMsIHRoZSBjYXVzZSBjb3VsZCBiZSBzb21lb25lIGRvaW5nIGhvdC11bnBs
dWcgb2YgdGhlIGJsb2NrCj4gPiBkZXZpY2UsIGJ1dCBpdCBjb3VsZCBhbHNvIGJlIHNvbWV0aGlu
ZyBnb2luZyB3cm9uZyBpbiBzb2Z0d2FyZQo+ID4gbGF5ZXJzIGJlbG93IHRoZSBmaWxlc3lzdGVt
LiBlLmcuIGRtLXRoaW5wIGhhdmluZyBhbiB1bnJlY292ZXJhYmxlCj4gPiBjb3JydXB0aW9uIG9y
IEVOT1NQQyBlcnJvcnMuCj4gPiAKPiA+IFdlIGFscmVhZHkgaGF2ZSBhICJjYXVzZSIgbm90aWZp
Y2F0aW9uOiBibGtfaG9sZGVyX29wcy0+bWFya19kZWFkKCkuCj4gPiAKPiA+IFRoZSBnZW5lcmlj
IGZzIGFjdGlvbiB0aGF0IGlzIHRha2VuIGJ5IHRoaXMgbm90aWZpY2F0aW9uIGlzCj4gPiBmc19i
ZGV2X21hcmtfZGVhZCgpLiAgVGhhdCBhY3Rpb24gaXMgdG8gaW52YWxpZGF0ZSBjYWNoZXMgYW5k
IHNodXQKPiA+IGRvd24gdGhlIGZpbGVzeXN0ZW0uCj4gPiAKPiA+IGJ0cmZzIG5lZWRzIHRvIGRv
IHNvbWV0aGluZyBkaWZmZXJlbnQgdG8gYSBibGtfaG9sZGVyX29wcy0+bWFya19kZWFkCj4gPiBu
b3RpZmljYXRpb24uIGkuZS4gaXQgbmVlZHMgYW4gYWN0aW9uIHRoYXQgaXMgZGlmZmVyZW50IHRv
Cj4gPiBmc19iZGV2X21hcmtfZGVhZCgpLgo+ID4gCj4gPiBJbmRlZWQsIHRoaXMgaXMgaG93IGJj
YWNoZWZzIGFscmVhZHkgaGFuZGxlcyAic2luZ2xlIGRldmljZQo+ID4gZGllZCIgZXZlbnRzIGZv
ciBtdWx0aS1kZXZpY2UgZmlsZXN5c3RlbXMgLSBzZWUKPiA+IGJjaDJfZnNfYmRldl9tYXJrX2Rl
YWQoKS4KPiAKPiBJIGRvIG5vdCB0aGluayBpdCdzIHRoZSBjb3JyZWN0IHdheSB0byBnbywgZXNw
ZWNpYWxseSB3aGVuIHRoZXJlIGlzIGFscmVhZHkKPiBmc19ob2xkZXJfb3BzLgo+IAo+IFdlJ3Jl
IGFsd2F5cyBnb2luZyB0b3dhcmRzIGEgbW9yZSBnZW5lcmljIHNvbHV0aW9uLCBvdGhlciB0aGFu
IGxldHRpbmcgdGhlCj4gaW5kaXZpZHVhbCBmcyB0byBkbyB0aGUgc2FtZSB0aGluZyBzbGlnaHRs
eSBkaWZmZXJlbnRseS4KCk9uIHNlY29uZCB0aG91Z2h0IC0tIGl0J3Mgd2VpcmQgdGhhdCB5b3Un
ZCBmbHVzaCB0aGUgZmlsZXN5c3RlbSBhbmQKc2hyaW5rIHRoZSBpbm9kZS9kZW50cnkgY2FjaGVz
IGluIGEgInlvdXIgZGV2aWNlIHdlbnQgYXdheSIgaGFuZGxlci4KRmFuY3kgZmlsZXN5c3RlbXMg
bGlrZSBiY2FjaGVmcyBhbmQgYnRyZnMgd291bGQgbGlrZWx5IGp1c3Qgc2hpZnQgSU8gdG8KYSBk
aWZmZXJlbnQgYmRldiwgcmlnaHQ/ICBBbmQgdGhlcmUncyBubyBnb29kIHJlYXNvbiB0byBydW4g
c2hyaW5rZXJzIG9uCmVpdGhlciBvZiB0aG9zZSBmc2VzLCByaWdodD8KCj4gWWVzLCB0aGUgbmFt
aW5nIGlzIG5vdCBwZXJmZWN0IGFuZCBtaXhpbmcgY2F1c2UgYW5kIGFjdGlvbiwgYnV0IHRoZSBl
bmQKPiByZXN1bHQgaXMgc3RpbGwgYSBtb3JlIGdlbmVyaWMgYW5kIGxlc3MgZHVwbGljYXRlZCBj
b2RlIGJhc2UuCgpJIHRoaW5rIGRjaGlubmVyIG1ha2VzIGEgZ29vZCBwb2ludCB0aGF0IGlmIHlv
dXIgZmlsZXN5c3RlbSBjYW4gZG8Kc29tZXRoaW5nIGNsZXZlciBvbiBkZXZpY2UgcmVtb3ZhbCwg
aXQgc2hvdWxkIHByb3ZpZGUgaXRzIG93biBibG9jawpkZXZpY2UgaG9sZGVyIG9wcyBpbnN0ZWFk
IG9mIHVzaW5nIGZzX2hvbGRlcl9vcHMuICBJIGRvbid0IHVuZGVyc3RhbmQKd2h5IHlvdSBuZWVk
IGEgImdlbmVyaWMiIHNvbHV0aW9uIGZvciBidHJmcyB3aGVuIGl0J3Mgbm90IGdvaW5nIHRvIGRv
CndoYXQgdGhlIG90aGVycyBkbyBhbnl3YXkuCgpBd2t3YXJkIG5hbWluZyBpcyBvZnRlbiBhIHNp
Z24gdGhhdCBmdXJ0aGVyIHRob3VnaHQgKG9yIGF0IGxlYXN0CnNlcGFyYXRpb24gb2YgY29kZSkg
aXMgbmVlZGVkLgoKQXMgYW4gYXNpZGU6Cid0d291bGQgYmUgbmljZSBpZiB3ZSBjb3VsZCBsaWZ0
IHRoZSAqRlNfSU9DX1NIVVRET1dOIGRpc3BhdGNoIG91dCBvZgpldmVyeW9uZSdzIGlvY3RsIGZ1
bmN0aW9ucyBpbnRvIHRoZSBWRlMsIGFuZCB0aGVuIG1vdmUgdGhlICJJIGFtIGRlYWQiCnN0YXRl
IGludG8gc3VwZXJfYmxvY2sgc28gdGhhdCB5b3UgY291bGQgYWN0dWFsbHkgc2h1dCBkb3duIGFu
eQpmaWxlc3lzdGVtLCBub3QganVzdCB0aGUgc2V2ZW4gdGhhdCBjdXJyZW50bHkgaW1wbGVtZW50
IGl0LgoKLS1ECgo+ID4gSGVuY2UgQnRyZnMgc2hvdWxkIGJlIGRvaW5nIHRoZSBzYW1lIHRoaW5n
IGFzIGJjYWNoZWZzLiBUaGUKPiA+IGJkZXZfaGFuZGxlX29wcyBzdHJ1Y3R1cmUgZXhpc3RzIHBy
ZWNpc2x5IGJlY2F1c2UgaXQgYWxsb3dzIHRoZQo+ID4gZmlsZXN5c3RlbSB0byBoYW5kbGUgYmxv
Y2sgZGV2aWNlIGV2ZW50cyBpbiB0aGUgZXhhY3QgbWFubmVyIHRoZXkKPiA+IHJlcXVpcmUuLi4u
Cj4gPiAKPiA+ID4gLSBBZGQgYSBuZXcgQGJkZXYgcGFyYW1ldGVyIHRvIHJlbW92ZV9iZGV2KCkg
Y2FsbGJhY2sKPiA+ID4gICAgVG8gYWxsb3cgdGhlIGZzIHRvIGRldGVybWluZSB3aGljaCBkZXZp
Y2UgaXMgbWlzc2luZywgYW5kIGRvIHRoZQo+ID4gPiAgICBwcm9wZXIgaGFuZGxpbmcgd2hlbiBu
ZWVkZWQuCj4gPiA+IAo+ID4gPiBGb3IgdGhlIGV4aXN0aW5nIHNodXRkb3duIGNhbGxiYWNrIHVz
ZXJzLCB0aGUgY2hhbmdlIGlzIG1pbmltYWwuCj4gPiAKPiA+IEV4Y2VwdCBmb3IgdGhlIGNoYW5n
ZSBpbiBBUEkgc2VtYW50aWNzLiAtPnNodXRkb3duIGlzIGFuIGV4dGVybmFsCj4gPiBzaHV0ZG93
biB0cmlnZ2VyIGZvciB0aGUgZmlsZXN5c3RlbSwgbm90IGEgZ2VuZXJpYyAiYmxvY2sgZGV2aWNl
Cj4gPiByZW1vdmVkIiBub3RpZmljYXRpb24uCj4gCj4gVGhlIHByb2JsZW0gaXMsIHRoZXJlIGlz
IG5vIG9uZSB1dGlsaXppbmcgLT5zaHV0ZG93bigpIG91dCBvZgo+IGZzX2JkZXZfbWFya19kZWFk
KCkuCj4gCj4gSWYgc2h1dGRvd24gaW9jdGwgaXMgaGFuZGxlZCB0aHJvdWdoIHN1cGVyX29wZXJh
dGlvbnM6OnNodXRkb3duLCBpdCB3aWxsIGJlCj4gbW9yZSBtZWFuaW5nZnVsIHRvIHNwbGl0IHNo
dXRkb3duIGFuZCBkZXYgcmVtb3ZhbC4KPiAKPiBCdXQgdGhhdCdzIG5vdCB0aGUgY2FzZSwgYW5k
IGRpZmZlcmVudCBmc2VzIGV2ZW4gaGF2ZSBzbGlnaHRseSBkaWZmZXJlbnQKPiBoYW5kbGluZyBm
b3IgdGhlIHNodXRkb3duIGZsYWdzIChub3QgYWxsIGZzZXMgZXZlbiB1dGlsaXplIGpvdXJuYWwg
dG8KPiBwcm90ZWN0IHRoZWlyIG1ldGFkYXRhKS4KPiAKPiBUaGFua3MsCj4gUXUKPiAKPiAKPiA+
IAo+ID4gSG9va2luZyBibGtfaG9sZGVyX29wcy0+bWFya19kZWFkIG1lYW5zIHRoYXQgYnRyZnMg
Y2FuIGFsc28gcHJvdmlkZQo+ID4gYSAtPnNodXRkb3duIGltcGxlbWVudGF0aW9uIGZvciB3aGVu
IHNvbWV0aGluZyBleHRlcm5hbCBvdGhlciB0aGFuIGEKPiA+IGJsb2NrIGRldmljZSByZW1vdmFs
IG5lZWRzIHRvIHNodXQgZG93biB0aGUgZmlsZXN5c3RlbS4uLi4KPiA+IAo+ID4gLURhdmUuCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
