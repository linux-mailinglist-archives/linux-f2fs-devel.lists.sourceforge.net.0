Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B699EAFFC6D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jul 2025 10:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUla6y8LSlinvHiMHMop8BH6DM/UHr/MLbdobnyvcyI=; b=RfWQJgmW83o66jBjwhZxf0WHio
	W3sBkwNlZ+KUqy8Ki8aW1xuX3qMtz2Ymzy+QVmM0CHIJrG0KcrmIj0LqB1iurB8FbWuYXfdH5QY59
	+IyrFhTccM/UjRrYos3nSa8+DAgCIUij9honMdnXx+gvEWxNaR+4a6oPREF0eZbyvbL4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZmir-0006EQ-Le;
	Thu, 10 Jul 2025 08:33:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1uZmiq-0006EK-Me
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 08:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d3LUEwvD6ulCbTVBKRSLI42nIh36olAjEYIjrKrElkM=; b=RzNJJZyeAtysqk1rdOVuOzucDA
 ALguCNYad39iY3JR31mqdMuBGceiRmwiT3bKQvGbIuObOF9wXhXwNllcRNT0sFnYq5KcGqUUV7i1g
 FgC19/nxcc5XewQnWFJvnQ9ecOn8Ro/RpH7L2e0VE7AlYr4dsq5tQGmYz+p8IgqTfRlI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d3LUEwvD6ulCbTVBKRSLI42nIh36olAjEYIjrKrElkM=; b=lYBxBm4lUvm78AfbvnmkFWfRMa
 ggaD/nEKrqnq8puG7WmV8a8uBSDlqlqXwp4GStHOPlt5iIitSHaT8qLi8cv9HHnkPM2GU/rKHDyDH
 3F//hJMj1qs/ZxK0MAkY/FYolmlQz2sAueynvkHkMqkJJ32dWOGomo25q3tznIwOyPQk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZmip-0005RQ-U6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 08:33:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 913D85C5C9B;
 Thu, 10 Jul 2025 08:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77394C4CEE3;
 Thu, 10 Jul 2025 08:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752136414;
 bh=R9b7+hWyJ6gpe2+oeqJYo/68ZSLNbj8perkTo8oGBwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s4wYb/wJqU7WvJJS+HWpf+MLbR4QdL3k6V9v1TTBW0gSIbyziqUP77aR5nlTEsLj6
 ql7ifdWjFUYsBjZnUVXuVU1DlrR++M7jlytzAZHlLuGAEFjGCGnevtsRmBnKta2E0d
 IV4NUe1U5YRS7bFHuNAkYLG1WusQB1wHNIVm2tIed7LZSEpj7mPoCLVkfRo0opGOX4
 qw+Nvfp+eSBpOHuEhpPuzsuEhRtuI29DOn/H5yY5UDm5GMsxT8Y3DUrYAVnrOTzy2j
 F0bO9JcYT1vjE/JPysLLt+3cYSQwUnctap/qv9Ob1QpRo4MbnrV9f+Fkmzu3E1Hyqf
 i6YqXhl34iobw==
Date: Thu, 10 Jul 2025 10:33:28 +0200
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20250710-laufkundschaft-watscheln-2b1ea9ee4519@brauner>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <20250708-geahndet-rohmaterial-0419fd6a76b3@brauner>
 <aG2i3qP01m-vmFVE@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aG2i3qP01m-vmFVE@dread.disaster.area>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jul 09, 2025 at 08:59:42AM +1000, Dave Chinner wrote:
 > On Tue, Jul 08, 2025 at 09:55:14AM +0200, Christian Brauner wrote: > >
 On Mon, Jul 07, 2025 at 05:45:32PM -0700, Darrick J. Wong wrote: [...] 
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
X-Headers-End: 1uZmip-0005RQ-U6
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
Cc: ntfs3@lists.linux.dev, jack@suse.cz, "Darrick J. Wong" <djwong@kernel.org>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Qu Wenruo <wqu@suse.com>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKdWwgMDksIDIwMjUgYXQgMDg6NTk6NDJBTSArMTAwMCwgRGF2ZSBDaGlubmVyIHdy
b3RlOgo+IE9uIFR1ZSwgSnVsIDA4LCAyMDI1IGF0IDA5OjU1OjE0QU0gKzAyMDAsIENocmlzdGlh
biBCcmF1bmVyIHdyb3RlOgo+ID4gT24gTW9uLCBKdWwgMDcsIDIwMjUgYXQgMDU6NDU6MzJQTSAt
MDcwMCwgRGFycmljayBKLiBXb25nIHdyb3RlOgo+ID4gPiBPbiBUdWUsIEp1bCAwOCwgMjAyNSBh
dCAwODo1Mjo0N0FNICswOTMwLCBRdSBXZW5ydW8gd3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4gCj4g
PiA+ID4g5ZyoIDIwMjUvNy84IDA4OjMyLCBEYXZlIENoaW5uZXIg5YaZ6YGTOgo+ID4gPiA+ID4g
T24gRnJpLCBKdWwgMDQsIDIwMjUgYXQgMTA6MTI6MjlBTSArMDkzMCwgUXUgV2VucnVvIHdyb3Rl
Ogo+ID4gPiA+ID4gPiBDdXJyZW50bHkgYWxsIHRoZSBmaWxlc3lzdGVtcyBpbXBsZW1lbnRpbmcg
dGhlCj4gPiA+ID4gPiA+IHN1cGVyX29wZWFyYXRpb25zOjpzaHV0ZG93bigpIGNhbGxiYWNrIGNh
biBub3QgYWZmb3JkIGxvc2luZyBhIGRldmljZS4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFRo
dXMgZnNfYmRldl9tYXJrX2RlYWQoKSB3aWxsIGp1c3QgY2FsbCB0aGUgc2h1dGRvd24oKSBjYWxs
YmFjayBmb3IgdGhlCj4gPiA+ID4gPiA+IGludm9sdmVkIGZpbGVzeXN0ZW0uCj4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiBCdXQgaXQgd2lsbCBubyBsb25nZXIgYmUgdGhlIGNhc2UsIHdpdGggbXVs
dGktZGV2aWNlIGZpbGVzeXN0ZW1zIGxpa2UKPiA+ID4gPiA+ID4gYnRyZnMgYW5kIGJjYWNoZWZz
IHRoZSBmaWxlc3lzdGVtIGNhbiBoYW5kbGUgY2VydGFpbiBkZXZpY2UgbG9zcyB3aXRob3V0Cj4g
PiA+ID4gPiA+IHNodXR0aW5nIGRvd24gdGhlIHdob2xlIGZpbGVzeXN0ZW0uCj4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiBUbyBhbGxvdyB0aG9zZSBtdWx0aS1kZXZpY2UgZmlsZXN5c3RlbXMgdG8g
YmUgaW50ZWdyYXRlZCB0byB1c2UKPiA+ID4gPiA+ID4gZnNfaG9sZGVyX29wczoKPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+IC0gUmVwbGFjZSBzdXBlcl9vcGVhcmF0aW9uOjpzaHV0ZG93bigpIHdp
dGgKPiA+ID4gPiA+ID4gICAgc3VwZXJfb3BlYXJhdGlvbnM6OnJlbW92ZV9iZGV2KCkKPiA+ID4g
PiA+ID4gICAgVG8gYmV0dGVyIGRlc2NyaWJlIHdoZW4gdGhlIGNhbGxiYWNrIGlzIGNhbGxlZC4K
PiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhpcyBjb25mbGF0ZXMgY2F1c2Ugd2l0aCBhY3Rpb24uCj4g
PiA+ID4gPiAKPiA+ID4gPiA+IFRoZSBzaHV0ZG93biBjYWxsb3V0IGlzIGFuIGFjdGlvbiB0aGF0
IHRoZSBmaWxlc3lzdGVtIG11c3QgZXhlY3V0ZSwKPiA+ID4gPiA+IHdoaWxzdCAicmVtb3ZlIGJk
ZXYiIGlzIGEgY2F1c2Ugbm90aWZpY2F0aW9uIHRoYXQgbWlnaHQgcmVxdWlyZSBhbgo+ID4gPiA+
ID4gYWN0aW9uIHRvIGJlIHRha2UuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFllcywgdGhlIGNhdXNl
IGNvdWxkIGJlIHNvbWVvbmUgZG9pbmcgaG90LXVucGx1ZyBvZiB0aGUgYmxvY2sKPiA+ID4gPiA+
IGRldmljZSwgYnV0IGl0IGNvdWxkIGFsc28gYmUgc29tZXRoaW5nIGdvaW5nIHdyb25nIGluIHNv
ZnR3YXJlCj4gPiA+ID4gPiBsYXllcnMgYmVsb3cgdGhlIGZpbGVzeXN0ZW0uIGUuZy4gZG0tdGhp
bnAgaGF2aW5nIGFuIHVucmVjb3ZlcmFibGUKPiA+ID4gPiA+IGNvcnJ1cHRpb24gb3IgRU5PU1BD
IGVycm9ycy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gV2UgYWxyZWFkeSBoYXZlIGEgImNhdXNlIiBu
b3RpZmljYXRpb246IGJsa19ob2xkZXJfb3BzLT5tYXJrX2RlYWQoKS4KPiA+ID4gPiA+IAo+ID4g
PiA+ID4gVGhlIGdlbmVyaWMgZnMgYWN0aW9uIHRoYXQgaXMgdGFrZW4gYnkgdGhpcyBub3RpZmlj
YXRpb24gaXMKPiA+ID4gPiA+IGZzX2JkZXZfbWFya19kZWFkKCkuICBUaGF0IGFjdGlvbiBpcyB0
byBpbnZhbGlkYXRlIGNhY2hlcyBhbmQgc2h1dAo+ID4gPiA+ID4gZG93biB0aGUgZmlsZXN5c3Rl
bS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gYnRyZnMgbmVlZHMgdG8gZG8gc29tZXRoaW5nIGRpZmZl
cmVudCB0byBhIGJsa19ob2xkZXJfb3BzLT5tYXJrX2RlYWQKPiA+ID4gPiA+IG5vdGlmaWNhdGlv
bi4gaS5lLiBpdCBuZWVkcyBhbiBhY3Rpb24gdGhhdCBpcyBkaWZmZXJlbnQgdG8KPiA+ID4gPiA+
IGZzX2JkZXZfbWFya19kZWFkKCkuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEluZGVlZCwgdGhpcyBp
cyBob3cgYmNhY2hlZnMgYWxyZWFkeSBoYW5kbGVzICJzaW5nbGUgZGV2aWNlCj4gPiA+ID4gPiBk
aWVkIiBldmVudHMgZm9yIG11bHRpLWRldmljZSBmaWxlc3lzdGVtcyAtIHNlZQo+ID4gPiA+ID4g
YmNoMl9mc19iZGV2X21hcmtfZGVhZCgpLgo+ID4gPiA+IAo+ID4gPiA+IEkgZG8gbm90IHRoaW5r
IGl0J3MgdGhlIGNvcnJlY3Qgd2F5IHRvIGdvLCBlc3BlY2lhbGx5IHdoZW4gdGhlcmUgaXMgYWxy
ZWFkeQo+ID4gPiA+IGZzX2hvbGRlcl9vcHMuCj4gPiA+ID4gCj4gPiA+ID4gV2UncmUgYWx3YXlz
IGdvaW5nIHRvd2FyZHMgYSBtb3JlIGdlbmVyaWMgc29sdXRpb24sIG90aGVyIHRoYW4gbGV0dGlu
ZyB0aGUKPiA+ID4gPiBpbmRpdmlkdWFsIGZzIHRvIGRvIHRoZSBzYW1lIHRoaW5nIHNsaWdodGx5
IGRpZmZlcmVudGx5Lgo+ID4gPiAKPiA+ID4gT24gc2Vjb25kIHRob3VnaHQgLS0gaXQncyB3ZWly
ZCB0aGF0IHlvdSdkIGZsdXNoIHRoZSBmaWxlc3lzdGVtIGFuZAo+ID4gPiBzaHJpbmsgdGhlIGlu
b2RlL2RlbnRyeSBjYWNoZXMgaW4gYSAieW91ciBkZXZpY2Ugd2VudCBhd2F5IiBoYW5kbGVyLgo+
ID4gPiBGYW5jeSBmaWxlc3lzdGVtcyBsaWtlIGJjYWNoZWZzIGFuZCBidHJmcyB3b3VsZCBsaWtl
bHkganVzdCBzaGlmdCBJTyB0bwo+ID4gPiBhIGRpZmZlcmVudCBiZGV2LCByaWdodD8gIEFuZCB0
aGVyZSdzIG5vIGdvb2QgcmVhc29uIHRvIHJ1biBzaHJpbmtlcnMgb24KPiA+ID4gZWl0aGVyIG9m
IHRob3NlIGZzZXMsIHJpZ2h0Pwo+ID4gPiAKPiA+ID4gPiBZZXMsIHRoZSBuYW1pbmcgaXMgbm90
IHBlcmZlY3QgYW5kIG1peGluZyBjYXVzZSBhbmQgYWN0aW9uLCBidXQgdGhlIGVuZAo+ID4gPiA+
IHJlc3VsdCBpcyBzdGlsbCBhIG1vcmUgZ2VuZXJpYyBhbmQgbGVzcyBkdXBsaWNhdGVkIGNvZGUg
YmFzZS4KPiA+ID4gCj4gPiA+IEkgdGhpbmsgZGNoaW5uZXIgbWFrZXMgYSBnb29kIHBvaW50IHRo
YXQgaWYgeW91ciBmaWxlc3lzdGVtIGNhbiBkbwo+ID4gPiBzb21ldGhpbmcgY2xldmVyIG9uIGRl
dmljZSByZW1vdmFsLCBpdCBzaG91bGQgcHJvdmlkZSBpdHMgb3duIGJsb2NrCj4gPiA+IGRldmlj
ZSBob2xkZXIgb3BzIGluc3RlYWQgb2YgdXNpbmcgZnNfaG9sZGVyX29wcy4gIEkgZG9uJ3QgdW5k
ZXJzdGFuZAo+ID4gPiB3aHkgeW91IG5lZWQgYSAiZ2VuZXJpYyIgc29sdXRpb24gZm9yIGJ0cmZz
IHdoZW4gaXQncyBub3QgZ29pbmcgdG8gZG8KPiA+ID4gd2hhdCB0aGUgb3RoZXJzIGRvIGFueXdh
eS4KPiA+IAo+ID4gSSB0aGluayBsZXR0aW5nIGZpbGVzeXN0ZW1zIGltcGxlbWVudCB0aGVpciBv
d24gaG9sZGVyIG9wcyBzaG91bGQgYmUKPiA+IGF2b2lkZWQgaWYgd2UgY2FuLiBDaHJpc3RvcGgg
bWF5IGNoaW1lIGluIGhlcmUuIEkgaGF2ZSBubyBhcHBldHRpdGUgZm9yCj4gPiBleHBvcnRpbmcg
c3R1ZmYgbGlrZSBnZXRfYmRldl9zdXBlcigpIHVubGVzcyBhYnNvbHV0ZWx5IG5lY2Vzc2FyeS4g
V2UKPiA+IHRyaWVkIHRvIG1vdmUgYWxsIHRoYXQgaGFuZGxpbmcgaW50byB0aGUgVkZTIHRvIGVs
aW1pbmF0ZSBhIHNsZXcgb2YKPiA+IGRlYWRsb2NrcyB3ZSBkZXRlY3RlZCBhbmQgZml4ZWQuIEkg
aGF2ZSBubyBhcHBldGl0ZSB0byByZXBlYXQgdGhhdAo+ID4gY3ljbGUuCj4gCj4gRXhjZXB0IGl0
IGlzbid0IGFjdHVhbGx5IG5lY2Vzc2FyeS4KPiAKPiBFdmVyeW9uZSBoZXJlIHNlZW1zIHRvIGJl
IGFzc3VtaW5nIHRoYXQgdGhlIGZpbGVzeXN0ZW0gKm11c3QqIHRha2UKPiBhbiBhY3RpdmUgc3Vw
ZXJibG9jayByZWZlcmVuY2UgdG8gcHJvY2VzcyBhIGRldmljZSByZW1vdmFsIGV2ZW50LAo+IGFu
ZCB0aGF0IGlzICpzaW1wbHkgbm90IHRydWUqLgo+IAo+IGJjYWNoZWZzIGRvZXMgbm90IHVzZSBn
ZXRfYmRldl9zdXBlcigpIG9yIGFuIGFjdGl2ZSBzdXBlcmJsb2NrCj4gcmVmZXJlbmNlIHRvIHBy
b2Nlc3MgLT5tYXJrX2RlYWQgZXZlbnRzLgo+IAo+IEl0IGhhcyBpdCdzIG93biBpbnRlcm5hbCBy
ZWZlcmVuY2UgY291bnRpbmcgb24gdGhlIHN0cnVjdCBiY2hfZnMKPiBhdHRhY2hlZCB0byB0aGUg
YmRldiB0aGF0IGVuc3VyZXMgdGhlIGZpbGVzeXN0ZW0gc3RydWN0dXJlcyBjYW4ndCBnbwo+IGF3
YXkgd2hpbHN0IC0+bWFya19kZWFkIGlzIGJlaW5nIHByb2Nlc3NlZC4gIGkuZS4gYmNhY2hlZnMg
aXMgb25seQo+IGRlcGVuZGVudCBvbiB0aGUgYmRldi0+YmRfaG9sZGVyX2xvY2soKSBiZWluZyBo
ZWxkIHdoZW4KPiAtPm1hcmtfZGVhZCgpIGlzIGNhbGxlZCBhbmQgZG9lcyBub3QgcmVseSBvbiB0
aGUgVkZTIGZvciBhbnl0aGluZy4KPiAKPiBUaGlzIG1lYW5zIHRoYXQgZGV2aWNlIHJlbW92YWwg
cHJvY2Vzc2luZyBjYW4gYmUgcGVyZm9ybWVkCj4gd2l0aG91dCBnbG9iYWwgZmlsZXN5c3RlbS9W
RlMgbG9ja3MgbmVlZGluZyB0byBiZSBoZWxkLiBIZW5jZSBpc3N1ZXMKPiBsaWtlIHJlLWVudHJh
bmN5IGRlYWRsb2NrcyB3aGVuIHRoZXJlIGFyZSBjb25jdXJyZW50L2Nhc2NhZGluZwo+IGRldmlj
ZSBmYWlsdXJlcyAoZS5nLiBhIEhCQSBkaWVzLCB0YWtpbmcgb3V0IG11bHRpcGxlIGRldmljZXMK
PiBzaW11bHRhbmVvdXNseSkgYXJlIGNvbXBsZXRlbHkgYXZvaWRlZC4uLgo+IAo+IEl0IGFsc28g
YXZvaWRzIHRoZSBwcm9ibGVtIG9mIC0+bWFya19kZWFkIGV2ZW50cyBiZWluZyBnZW5lcmF0ZWQK
PiBmcm9tIGEgY29udGV4dCB0aGF0IGhvbGRzIGZpbGVzeXN0ZW0vdmZzIGxvY2tzIGFuZCB0aGVu
IGRlYWRsb2NraW5nCj4gd2FpdGluZyBmb3IgdGhvc2UgbG9ja3MgdG8gYmUgcmVsZWFzZWQuCj4g
Cj4gSU9XcywgYSBtdWx0aS1kZXZpY2UgZmlsZXN5c3RlbSBzaG91bGQgcmVhbGx5IGJlIGltcGxl
bWVudGluZwo+IC0+bWFya19kZWFkIGl0c2VsZiwgYW5kIHNob3VsZCBub3QgYmUgZGVwZW5kaW5n
IG9uIGJlaW5nIGFibGUgdG8KPiBsb2NrIHRoZSBzdXBlcmJsb2NrIHRvIHRha2UgYW4gYWN0aXZl
IHJlZmVyZW5jZSB0byBpdC4KPiAKPiBJdCBzaG91bGQgYmUgcHJldHR5IGNsZWFyIHRoYXQgdGhl
c2UgYXJlIG5vdCBpc3N1ZXMgdGhhdCB0aGUgZ2VuZXJpYwo+IGZpbGVzeXN0ZW0gLT5tYXJrX2Rl
YWQgaW1wbGVtZW50YXRpb24gc2hvdWxkIGJlIHRyeWluZyB0bwo+IGhhbmRsZS4uLi4uCj4gCj4g
PiBUaGUgc2h1dGRvd24gbWV0aG9kIGlzIGltcGxlbWVudGVkIG9ubHkgYnkgYmxvY2stYmFzZWQg
ZmlsZXN5c3RlbXMgYW5kCj4gPiBhcmd1YWJseSBzaHV0ZG93biB3YXMgYWx3YXlzIGEgbWlzbm9t
ZXIgYmVjYXVzZSBpdCBhc3N1bWVkIHRoYXQgdGhlCj4gPiBmaWxlc3lzdGVtIG5lZWRzIHRvIGFj
dHVhbGx5IHNodXQgZG93biB3aGVuIGl0IGlzIGNhbGxlZC4KPiAKPiBTaHV0ZG93biB3YXMgbm90
IC1hc3N1bWVkLSBhcyB0aGUgb3BlcmF0aW9uIHRoYXQgbmVlZGVkIHRvIGJlCj4gcGVyZm9ybWVk
LiBUaGF0IHdhcyB0aGUgZmVhdHVyZSB0aGF0IHdhcyAqcmVxdWlyZWQqIHRvIGZpeAo+IGZpbGVz
eXN0ZW0gbGV2ZWwgcHJvYmxlbXMgdGhhdCBvY2N1ciB3aGVuIHRoZSBkZXZpY2UgdW5kZXJuZWF0
aCBpdAo+IGRpc2FwcGVhcnMuCj4gCj4gLT5tYXJrX2RlYWQoKSBpcyB0aGUgYWJzdHJhY3QgZmls
ZXN5c3RlbSBub3RpZmljYXRpb24gZnJvbSB0aGUgYmxvY2sKPiBkZXZpY2UsIGZzX2JkZmV2X21h
cmtfZGVhZCgpIGlzIHRoZSAtZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbi0gb2YgdGhlCj4gZnVuY3Rp
b25hbGl0eSByZXF1aXJlZCBieSBzaW5nbGUgYmxvY2sgZGV2aWNlIGZpbGVzeXN0ZW1zLiBQYXJ0
IG9mCj4gdGhhdCBmdW5jdGlvbmFsaXR5IGlzIHNodXR0aW5nIGRvd24gdGhlIGZpbGVzeXN0ZW0g
YmVjYXVzZSBpdCBjYW4KPiAqbm8gbG9uZ2VyIGZ1bmN0aW9uIHdpdGhvdXQgYSBiYWNraW5nIGRl
dmljZSouCj4gCj4gbXVsdGktYmxvY2sgZGV2aWNlIGZpbGVzeXN0ZW1zIHJlcXVpcmUgY29tcGVs
dGVseSBkaWZmZXJlbnQKPiBpbXBsZW1lbnRhdGlvbnMsIGFuZCB3ZSBhbHJlYWR5IGhhdmUgb25l
IHRoYXQgLWRvZXMgbm90IHVzZSBhY3RpdmUKPiBzdXBlcmJsb2NrIHJlZmVyZW5jZXMtLiBJT1dz
LCBldmVuIGlmIHdlIGFkZCAtPnJlbW92ZV9iZGV2KHNiKQo+IGNhbGxvdXQsIGJjYWNoZWZzIHdp
bGwgY29udGludWUgdG8gdXNlIC0+bWFya19kZWFkKCkgYmVjYXVzZSBsb3cKPiBsZXZlbCBmaWxl
c3lzdGVtIGRldmljZSBtYW5hZ2VtZW50IGlzbid0IChhbmQgc2hvdWxkbid0IGJlISkKPiBkZXBl
bmRlbnQgb24gaGlnaCBsZXZlbCBWRlMgc3RydWN0dXJlIHJlZmVyZW5jZSBjb3VudGluZy4uLi4K
PiAKPiA+IElPVywgd2UgbWFkZQo+ID4gaXQgc28gdGhhdCBpdCBpcyBhIGNhbGwgdG8gYWN0aW9u
IGJ1dCB0aGF0IGRvZXNuJ3QgaGF2ZSB0byBiZSB0aGUgY2FzZS4KPiA+IENhbGxpbmcgaXQgLT5y
ZW1vdmVfYmRldigpIGlzIGltbyB0aGUgY29ycmVjdCB0aGluZyBiZWNhdXNlIGl0IGdpdmVzCj4g
PiBibG9jayBiYXNlZCBmaWxlc3lzdGVtIHRoZSBhYmlsaXR5IHRvIGhhbmRsZSBkZXZpY2UgZXZl
bnRzIGhvdyB0aGV5IHNlZQo+ID4gZml0Lgo+IAo+IEFuZCB0aGF0J3MgZXhhY3RseSB3aGF0IC0+
bWFya19kZWFkIGFscmVhZHkgcHJvdmlkZXMuIAo+IAo+IEFuZCwgYXMgSSd2ZSBwb2ludGVkIG91
dCBhYm92ZSwgbXVsdGktZGV2aWNlIGZpbGVzeXN0ZW1zIGRvbid0Cj4gYWN0dWFsbHkgbmVlZCBh
Y3RpdmVseSByZWZlcmVuY2VkIHN1cGVyYmxvY2tzIHRvIHByb2Nlc3MgZGV2aWNlCj4gcmVtb3Zh
bCBub3RpZmljYXRpb25zLiBIZW5jZSAtPm1hcmtfZGVhZCBpcyB0aGUgY29ycmVjdCBpbnRlcmZh
Y2UKPiBmb3IgdGhlbSB0byB1c2UuCgpJJ20gbm90IHN1cmUgd2hhdCB0aGlzIGlzIHRyeWluZyB0
byBhcmd1ZSBhYm91dCBhcyB3ZSBhZ3JlZS4KCkFsbCBjdXJyZW50IGZpbGVzeXN0ZW1zIHRoYXQg
dXNlIHRoZSBmc19ob2xkZXJfb3BzIHJlcXVpcmUgYW4gYWN0aXZlCnN1cGVyYmxvY2sgcmVmZXJl
bmNlLiBJZiB0aGV5IHdhbnQgdG8gcmV3cml0ZSB0aGVtc2VsdmVzIHRvIG5vdCBuZWVkIGFuCmFj
dGl2ZSBzdXBlcmJsb2NrIHJlZmVyZW5jZSBhbmQgc3dpdGNoIHRvIGN1c3RvbSBob2xkZXIgb3Bz
IHRoZW4gdGhlIFZGUwpkb2Vzbid0IGNhcmUuCgpUaGlzIGlzIGFib3V0IHdoYXQgaXMgY3VycmVu
dGx5IHRoZSBjYXNlLiBFdmVyeW9uZSBpcyBhd2FyZSB0aGF0IGEKZmlsZXN5c3RlbSBjYW4gZG8g
dGhpcyBkaWZmZXJlbnRseS4KCklmIGJ0cmZzIHdhbnRzIHRvIHJlbHkgb24gdGhlIFZGUyBpbmZy
YXN0cnVjdHVyZSB0aGVuIHdlIHdpbGwgZW5hYmxlIGl0CmFuZCB3ZSB3aWxsIGhlbHAgdGhlbSBt
b3ZlIGFsb25nIGFuZCB0aGUgb25seSByZXF1aXJlbWVudCBpcyB0aGF0IHdlCmRvbid0IGhhdmUg
dG8gYmxlZWQgdGhlIFZGUyBsb2NraW5nIHJlcXVpcmVtZW50cyBpbnRvIHRoZSBzcGVjaWZpYwpm
aWxlc3lzdGVtIHVubmVjZXNzYXJpbHkuIFRoYXQncyBhbGwgdGhpcyBpcy4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
