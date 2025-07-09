Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9ECAFDCCA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 03:13:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EuaJFNcDjdkhgU1eSrHm+nu66ZU0HsZ52g3gNUWeD0=; b=ji0tKs2BbVrNCGbTHXrAwV7PN2
	UcVH97RMfsro0jPujhckmH6KShz7GoRlsmOIBpFOQum3/fh2J61RKnr/iH/mnnhJZqTXE7w6SWhqa
	YhePUqDYsRCZhI6Ulrk8BxgDct5OxsCRv3M5wRyqinZ6IHynvbS2B+4Mb96c/Ixz7bpQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZJNZ-0008Sx-Km;
	Wed, 09 Jul 2025 01:13:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kent.overstreet@linux.dev>) id 1uZJNX-0008Sh-Sa
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 01:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cy2fv3s6ERO5d4cU+IzLOG038BuHbFit+Fwtwintg6A=; b=gcefmW/t74f5yGfzJWGyesWGSO
 9VsCdM2eE+8VBKhrfUPYuF6uFMTI33dhprzwA3nJ6/bC6XM4xp2I6rYEnYSoL7Ox6IYJDZgrVfKMr
 rmGvEQUBIAmYykpyZnjX9o72IfdHOUFRQh/MrwE6SYuxUPQyG+f9qhRpcv/8ch4SqLqI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cy2fv3s6ERO5d4cU+IzLOG038BuHbFit+Fwtwintg6A=; b=NFXew97rc4LFAF6K0ZFA9PNKY2
 S7/ctsEL1WB0pV0oguA8IOItujOQlYeuDAt3zQCnMKhE5bcIktEM3mISokalMojsf4tkUy1xy8S77
 nkLLYneZ9/IueebPw/1ToVkUBxS3NCwOq2VOVb8i3d8pdVyWgex6M8/BbYysogyLG9QE=;
Received: from out-183.mta0.migadu.com ([91.218.175.183])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZJNW-00041k-Nr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 01:13:43 +0000
Date: Tue, 8 Jul 2025 21:13:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1752023610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cy2fv3s6ERO5d4cU+IzLOG038BuHbFit+Fwtwintg6A=;
 b=UhSl7kPeAE9NdrlN6dm0fuhSYJ+U/aw9XBq4CN7FGW9Phojz8I1CGRLbLw8wleVPz5RQHI
 5HbOIc7YTA8sPAuR3KhNCRrnFyl/8xtzRiOj7LAuxJ4uH51PZVZdOGEAm0yLDs3pWF5hsV
 wcT3hxFix0OyWJnAqgDKJsCyzR7eNb8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Message-ID: <c6zp6k7ozn7idiyt4shxhwwe2hoprkgdzq66eau5w4jlgbuwta@od2atq4kexoj>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <20250708-geahndet-rohmaterial-0419fd6a76b3@brauner>
 <aG2i3qP01m-vmFVE@dread.disaster.area>
 <00f5c2a2-4216-4eeb-b555-ef49f8cfd447@gmx.com>
 <lcbj2r4etktljckyv3q4mgryvwqsbl7pwe6sqdtyfwgmunhkov@4oinzvvnt44s>
 <eb7c3b1c-b5c0-4078-9a88-327f1220cae8@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb7c3b1c-b5c0-4078-9a88-327f1220cae8@gmx.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Jul 09, 2025 at 10:25:08AM +0930, Qu Wenruo wrote:
    > 在 2025/7/9 10:05, Kent Overstreet 写道: > > Consider that the thing
    that has a block device open might not even be a > > filesystem, or [...]
    
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
X-Headers-End: 1uZJNW-00041k-Nr
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
Cc: Christian Brauner <brauner@kernel.org>, ntfs3@lists.linux.dev, jack@suse.cz,
 "Darrick J. Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKdWwgMDksIDIwMjUgYXQgMTA6MjU6MDhBTSArMDkzMCwgUXUgV2VucnVvIHdyb3Rl
Ogo+IOWcqCAyMDI1LzcvOSAxMDowNSwgS2VudCBPdmVyc3RyZWV0IOWGmemBkzoKPiA+IENvbnNp
ZGVyIHRoYXQgdGhlIHRoaW5nIHRoYXQgaGFzIGEgYmxvY2sgZGV2aWNlIG9wZW4gbWlnaHQgbm90
IGV2ZW4gYmUgYQo+ID4gZmlsZXN5c3RlbSwgb3IgYXQgbGVhc3QgYSBWRlMgZmlsZXN5c3RlbS4K
PiA+IAo+ID4gSXQgY291bGQgYmUgYSBzdGFja2luZyBibG9jayBkZXZpY2UgZHJpdmVyIC0gbWQg
b3IgbWQgLSBhbmQgdGhvc2UKPiA+IGFic29sdXRlbHkgc2hvdWxkIGJlIGltcGxlbWVudGluZyAu
bWFya19kZWFkKCkgKGxpa2VseSBwYXNzaW5nIGl0Cj4gPiB0aHJvdWdoIG9uIHVwIHRoZSBzdGFj
ayksIG9yIHNvbWV0aGluZyBlbHNlIGVudGlyZWx5Lgo+ID4gCj4gPiBJbiBiY2FjaGVmcydzIGNh
c2UsIHdlIG1pZ2h0IG5vdCBldmVuIGhhdmUgY3JlYXRlZCB0aGUgVkZTIHN1cGVyX2Jsb2NrCj4g
PiB5ZXQ6IHdlIGRvbid0IGRvIHRoYXQgdW50aWwgYWZ0ZXIgcmVjb3ZlcnkgZmluaXNoZXMsIGFu
ZCBpbmRlZWQgd2UgY2FuJ3QKPiA+IGJlY2F1c2UgY3JlYXRpbmcgYSBzdXBlcl9ibG9jayBhbmQg
bGVhdmluZyBpdCBpbiAhU0JfQk9STiB3aWxsIGNhdXNlCj4gPiBzdWNoIGZ1biBhcyBzeW5jIGNh
bGxzIHRvIGhhbmcgZm9yIHRoZSBlbnRpcmUgc3lzdGVtLi4uCj4gPiAKPiAKPiBOb3QgcmVsYXRl
ZCB0byB0aGUgc2VyaWVzLCBidXQgSUlSQyBpZiBzX2ZsYWdzIGRvZXNuJ3QgaGF2ZSBTQl9BQ1RJ
VkUgc2V0LAo+IHRoaW5ncyBsaWtlIGJkZXZfc3VwZXJfbG9jaygpIHdvbid0IGNob29zZSB0aGF0
IHN1cGVyYmxvY2ssIHRodXMgd29uJ3QgY2FsbAo+IC0+c3luYygpIGNhbGxiYWNrIHRocm91Z2gg
dGhlIGJkZXYgY2FsbGJhY2tzLgo+IAo+IEFuZCBidHJmcyBhbHNvIGZvbGxvd3MgdGhlIHNhbWUg
c2NoZW1lLCBvbmx5IHNldHRpbmcgU0JfQUNUSVZFIGFmdGVyCj4gZXZlcnl0aGluZyBpcyBkb25l
IChpbmNsdWRpbmcgcmVwbGF5aW5nIHRoZSBsb2cgZXRjKSwgYW5kIHNvIGZhciB3ZSBoYXZlbid0
Cj4geWV0IGhpdCBzdWNoIHN5bmMgZHVyaW5nIG1vdW50LgoKV2VsbCwgaG93IGxvbmcgY2FuIHRo
YXQgdGFrZT8gSGF2ZSBhIGxvb2sgYXQgaXRlcmF0ZV9zdXBlcnMoKSwgaXQncwpzb21ldGhpbmcg
dG8gYmUgd2FyeSBvZi4KCkZpeGluZyB0aGUgZnMvc3VwZXIuYyBsb2NraW5nIGlzIHNvbWV0aGlu
ZyBJIHdhcyBsb29raW5nIGF0LCBpdCdzIGRvYWJsZQpidXQgaXQnZCBiZSBhIGdpYW50IGhhc3Ns
ZSAtIGZvciBiY2FjaGVmcyBpdCB3YXNuJ3Qgd29ydGggaXQsIGJjYWNoZWZzCmhhcyBwcmVleGlz
dGluZyByZWFzb25zIGZvciB3YW50aW5nIHRvIGF2b2lkIHRoZSB2ZnMgc3VwZXJibG9jawpkZXBl
bmRlbmN5LgoKQW55d2F5cyAtIHRoZSBWRlMgdHJ5aW5nIHRvIG93biAubWFya19kZWFkKCkgaXMg
YSBsYXllcmluZyB2aW9sYXRpb24uCgogICAgICAgIFZGUwotLS0tLS0tLS0tLS0tLS0tLS0KICAg
ICAgICBGUwotLS0tLS0tLS0tLS0tLS0tLS0KICAgICAgICBCTE9DSwoKQnkgZGVmYXVsdCwgdGhl
ICJGUyIgbGF5ZXIgc2hvdWxkIGJlIGNvbnNpZGVyZWQgYSBibGFjayBib3ggYnkgYm90aCB0aGUK
YmxvY2sgbGF5ZXIgYW5kIFZGUzsgcmVhY2hpbmcgYWNyb3NzIHRoYXQgYW5kIGFzc3VtaW5nIGZp
bGVzeXN0ZW0KYmVoYXZpb3IgaXMgYSBnb29kIHdheSB0byBwYWludCB5b3Vyc2VsZiBpbnRvIGEg
Y29ybmVyLgoKSXQncyBzZWR1Y3RpdmUgYmVjYXVzZSBtb3N0IGZpbGVzeXN0ZW1zIGFyZSBzaW5n
bGUgZGV2aWNlIGZpbGVzeXN0ZW1zLAphbmQgZm9yIHRoYXQgY2FzZSBpdCBtYWtlcyB0b3RhbCBz
ZW5zZSB0byBwcm92aWRlIGhlbHBlcnMgZm9yCmNvbnZlbmllbmNlLCBnaXZlbiB0aGF0IHRoZXJl
J3Mgbm90IG11Y2ggcm9vbSBmb3IgYmVoYXZpb3VyIHRvIGRldmlhdGUKaW4gdGhlIHNpbmdsZSBk
ZXZpY2UgY2FzZS4KCkJ1dCBpbiB0aGUgbXVsdGkgZGV2aWNlIGNhc2U6IHRoZSBiZWhhdmlvdXIg
aXMgY29tcGxldGVseSB1cCB0byB0aGUKZmlsZXN5c3RlbSAtIGluIGdlbmVyYWwgd2UgZG9uJ3Qg
c2h1dCBkb3duIHRoZSBlbnRpcmUgZmlsZXN5c3RlbSBpZiBhCnNpbmdsZSBibG9jayBkZXZpY2Ug
Z29lcyBkZWFkLCBpZiB3ZSdyZSByZWR1bmRhbnQgd2UgY2FuIGp1c3QgZHJvcCB0aGF0CmRldmlj
ZSBhbmQgY29udGludWUuCgpBbmQgaWYgeW91J3JlIHRoaW5raW5nIHlvdSB3YW50IHRvIG1ha2Ug
dXNlIG9mIGxvY2tpbmcgcHJvdmlkZWQgYnkgdGhlClZGUyAtIEkgd291bGQgd2FybiBhd2F5IGZy
b20gdGhhdCBsaW5lIG9mIHRoaW5raW5nIHRvbywgbWl4aW5nIHVwCmxvY2tpbmcgZnJvbSBkaWZm
ZXJlbnQgbGF5ZXJzIGNyZWF0ZXMgYWxsIHNvcnRzIG9mIGZ1bi4uLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
