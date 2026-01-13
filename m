Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E0FD18897
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 12:45:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:Date:To:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vj7N+bhNh+Ip7wDE06qUJrsPpNwwTQWC47fwARS4p1c=; b=ad8KFtYHZQVv20l9qmLWwd1V5v
	QLwpYDX+NRqstrb++aBosw6XD8MkQLpagJL6SyVgtlqjf0E/ym5H3vz3JKWfOJmIdNmP9o+jtbQ1B
	8p/zsb3Lis0Mz/Q1LKNOc68hVnKmBgWkKvzC1Urt6oFgPZMQV5FMyQHl+5lQwI2d2EWM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfcq7-0000Kr-ID;
	Tue, 13 Jan 2026 11:45:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vfcq5-0000Ka-AI;
 Tue, 13 Jan 2026 11:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r3fAgtqWrYOpjEcc0WPFdPe/AdLRyr0xvdFog2RxOIc=; b=CjnprSM184CQhBffq+PkG/ZjkD
 9TDG9zCP2nZJkZElUQ1ouUJnxjKFhkL/qd1mgfcZH2yQf9/BQZH24nQdRNNLkYlgwiAyEqGkfSREs
 PCJ17uTfcFoO9qaRTR13qmwrrg6S3ZDuO9HxCgKpL5f6bBB/HJi/GaAaq7+ysOeQaKcY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r3fAgtqWrYOpjEcc0WPFdPe/AdLRyr0xvdFog2RxOIc=; b=e7xG4/PTnxZjXA2mCqMK3sECE/
 izzUGh7PERpj+rCO0hss9AFf9eMDjQbD6jAqT2frNq9+a38V7HUGWjGIONAblm73MflLsRW5DDPUE
 Ko35vRqK1hKZrUmlOKuwR8+Z8uabI3uu6VYw81ZzAfTkxctaFTN5lqBsBLCsNOdoMwA0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfcq4-00077L-I5; Tue, 13 Jan 2026 11:45:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4AA426000A;
 Tue, 13 Jan 2026 11:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A32C116C6;
 Tue, 13 Jan 2026 11:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768304726;
 bh=r3fAgtqWrYOpjEcc0WPFdPe/AdLRyr0xvdFog2RxOIc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=hPYUnVvi9v+0Bh+aUO7p89euuKcL1XxxPaQFiv1yFEfuuQrV9ma8ZqGy9IGWR0Hg2
 nGb0xKIRdckHGuAv6pDfw1L6dnPw+sKxpoFEU1i8FIolyU6IeDrULm5dKoLINaYp/f
 lPrwPJp9HcPXX4GOUuPEu5HtSIzYDfCSS/JXhg1NiKHM+ShGiT3IwwkbUBCVovAIRE
 xomxTEJ/oYJgVGZYTvc/zcfr/Sqq4CEQ75ONFS/TUXLurVleTTrpavEvncOqd97kb9
 M1tQQZ35vEFp6JlLZgDpwcytMAbG40LYkViD6uH7yyE3+w/MdhuXa5ZESoU6U4+6R2
 jlclfIVBJ/ubA==
Message-ID: <4a38de737a64e9b32092ea1f8a25a61b33705034.camel@kernel.org>
To: Christian Brauner <brauner@kernel.org>, Amir Goldstein <amir73il@gmail.com>
Date: Tue, 13 Jan 2026 06:45:17 -0500
In-Reply-To: <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
 <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 2026-01-13 at 09:54 +0100, Christian Brauner wrote:
 > On Mon, Jan 12, 2026 at 09:50:20AM -0500, Jeff Layton wrote: > > On Mon,
 2026-01-12 at 09:31 -0500, Chuck Lever wrote: > > > On 1/12/26 8: [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfcq4-00077L-I5
Subject: Re: [f2fs-dev] [PATCH 00/24] vfs: require filesystems to explicitly
 opt-in to lease support
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
From: Jeff Layton via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jeff Layton <jlayton@kernel.org>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Sandeep Dhavale <dhavale@google.com>,
 Martin Brandenburg <martin@omnibond.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Anders Larsen <al@alarsen.net>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 jfs-discussion@lists.sourceforge.net, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, devel@lists.orangefs.org,
 Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, ntfs3@lists.linux.dev,
 Christoph Hellwig <hch@infradead.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 linux-mm@kvack.org, Viacheslav Dubeyko <slava@dubeyko.com>,
 linux-btrfs@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 Carlos Maiolino <cem@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>, samba-technical@lists.samba.org,
 linux-cifs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 linux-nilfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, linux-nfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-erofs@lists.ozlabs.org, v9fs@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCAyMDI2LTAxLTEzIGF0IDA5OjU0ICswMTAwLCBDaHJpc3RpYW4gQnJhdW5lciB3cm90
ZToKPiBPbiBNb24sIEphbiAxMiwgMjAyNiBhdCAwOTo1MDoyMEFNIC0wNTAwLCBKZWZmIExheXRv
biB3cm90ZToKPiA+IE9uIE1vbiwgMjAyNi0wMS0xMiBhdCAwOTozMSAtMDUwMCwgQ2h1Y2sgTGV2
ZXIgd3JvdGU6Cj4gPiA+IE9uIDEvMTIvMjYgODozNCBBTSwgSmVmZiBMYXl0b24gd3JvdGU6Cj4g
PiA+ID4gT24gRnJpLCAyMDI2LTAxLTA5IGF0IDE5OjUyICswMTAwLCBBbWlyIEdvbGRzdGVpbiB3
cm90ZToKPiA+ID4gPiA+IE9uIFRodSwgSmFuIDgsIDIwMjYgYXQgNzo1N+KAr1BNIEplZmYgTGF5
dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
T24gVGh1LCAyMDI2LTAxLTA4IGF0IDE4OjQwICswMTAwLCBKYW4gS2FyYSB3cm90ZToKPiA+ID4g
PiA+ID4gPiBPbiBUaHUgMDgtMDEtMjYgMTI6MTI6NTUsIEplZmYgTGF5dG9uIHdyb3RlOgo+ID4g
PiA+ID4gPiA+ID4gWWVzdGVyZGF5LCBJIHNlbnQgcGF0Y2hlcyB0byBmaXggaG93IGRpcmVjdG9y
eSBkZWxlZ2F0aW9uIHN1cHBvcnQgaXMKPiA+ID4gPiA+ID4gPiA+IGhhbmRsZWQgb24gZmlsZXN5
c3RlbXMgd2hlcmUgdGhlIHNob3VsZCBiZSBkaXNhYmxlZCBbMV0uIFRoYXQgc2V0IGlzCj4gPiA+
ID4gPiA+ID4gPiBhcHByb3ByaWF0ZSBmb3IgdjYuMTkuIEZvciB2Ny4wLCBJIHdhbnQgdG8gbWFr
ZSBsZWFzZSBzdXBwb3J0IGJlIG1vcmUKPiA+ID4gPiA+ID4gPiA+IG9wdC1pbiwgcmF0aGVyIHRo
YW4gb3B0LW91dDoKPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gRm9yIGhpc3Rvcmlj
YWwgcmVhc29ucywgd2hlbiAtPnNldGxlYXNlKCkgZmlsZV9vcGVyYXRpb24gaXMgc2V0IHRvIE5V
TEwsCj4gPiA+ID4gPiA+ID4gPiB0aGUgZGVmYXVsdCBpcyB0byB1c2UgdGhlIGtlcm5lbC1pbnRl
cm5hbCBsZWFzZSBpbXBsZW1lbnRhdGlvbi4gVGhpcwo+ID4gPiA+ID4gPiA+ID4gbWVhbnMgdGhh
dCBpZiB5b3Ugd2FudCB0byBkaXNhYmxlIHRoZW0sIHlvdSBuZWVkIHRvIGV4cGxpY2l0bHkgc2V0
IHRoZQo+ID4gPiA+ID4gPiA+ID4gLT5zZXRsZWFzZSgpIGZpbGVfb3BlcmF0aW9uIHRvIHNpbXBs
ZV9ub3NldGxlYXNlKCkgb3IgdGhlIGVxdWl2YWxlbnQuCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gPiA+IFRoaXMgaGFzIGNhdXNlZCBhIG51bWJlciBvZiBwcm9ibGVtcyBvdmVyIHRoZSB5
ZWFycyBhcyBzb21lIGZpbGVzeXN0ZW1zCj4gPiA+ID4gPiA+ID4gPiBoYXZlIGluYWR2ZXJ0YW50
bHkgYWxsb3dlZCBsZWFzZXMgdG8gYmUgYWNxdWlyZWQgc2ltcGx5IGJ5IGhhdmluZyBsZWZ0Cj4g
PiA+ID4gPiA+ID4gPiBpdCBzZXQgdG8gTlVMTC4gSXQgd291bGQgYmUgYmV0dGVyIGlmIGZpbGVz
eXN0ZW1zIGhhZCB0byBvcHQtaW4gdG8gbGVhc2UKPiA+ID4gPiA+ID4gPiA+IHN1cHBvcnQsIHBh
cnRpY3VsYXJseSB3aXRoIHRoZSBhZHZlbnQgb2YgZGlyZWN0b3J5IGRlbGVnYXRpb25zLgo+ID4g
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBUaGlzIHNlcmllcyBoYXMgc2V0cyB0aGUgLT5z
ZXRsZWFzZSgpIG9wZXJhdGlvbiBpbiBhIHBpbGUgb2YgZXhpc3RpbmcKPiA+ID4gPiA+ID4gPiA+
IGxvY2FsIGZpbGVzeXN0ZW1zIHRvIGdlbmVyaWNfc2V0bGVhc2UoKSBhbmQgdGhlbiBjaGFuZ2Vz
Cj4gPiA+ID4gPiA+ID4gPiBrZXJuZWxfc2V0bGVhc2UoKSB0byByZXR1cm4gLUVJTlZBTCB3aGVu
IHRoZSBzZXRsZWFzZSgpIG9wZXJhdGlvbiBpcyBub3QKPiA+ID4gPiA+ID4gPiA+IHNldC4KPiA+
ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gV2l0aCB0aGlzIGNoYW5nZSwgbmV3IGZpbGVz
eXN0ZW1zIHdpbGwgbmVlZCB0byBleHBsaWNpdGx5IHNldCB0aGUKPiA+ID4gPiA+ID4gPiA+IC0+
c2V0bGVhc2UoKSBvcGVyYXRpb25zIGluIG9yZGVyIHRvIHByb3ZpZGUgbGVhc2UgYW5kIGRlbGVn
YXRpb24KPiA+ID4gPiA+ID4gPiA+IHN1cHBvcnQuCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gPiA+IEkgbWFpbmx5IGZvY3VzZWQgb24gZmlsZXN5c3RlbXMgdGhhdCBhcmUgTkZTIGV4cG9y
dGFibGUsIHNpbmNlIE5GUyBhbmQKPiA+ID4gPiA+ID4gPiA+IFNNQiBhcmUgdGhlIG1haW4gdXNl
cnMgb2YgZmlsZSBsZWFzZXMsIGFuZCB0aGV5IHRlbmQgdG8gZW5kIHVwIGV4cG9ydGluZwo+ID4g
PiA+ID4gPiA+ID4gdGhlIHNhbWUgZmlsZXN5c3RlbSB0eXBlcy4gTGV0IG1lIGtub3cgaWYgSSd2
ZSBtaXNzZWQgYW55Lgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFNvLCB3aGF0IGFib3V0
IGtlcm5mcyBhbmQgZnVzZT8gVGhleSBzZWVtIHRvIGJlIGV4cG9ydGFibGUgYW5kIGRvbid0IGhh
dmUKPiA+ID4gPiA+ID4gPiAuc2V0bGVhc2Ugc2V0Li4uCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+IAo+ID4gPiA+ID4gPiBZZXMsIEZVU0UgbmVlZHMgdGhpcyB0b28uIEknbGwgYWRkIGEgcGF0
Y2ggZm9yIHRoYXQuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBBcyBmYXIgYXMga2VybmZzIGdv
ZXM6IEFJVUksIHRoYXQncyBiYXNpY2FsbHkgd2hhdCBzeXNmcyBhbmQgcmVzY3RybAo+ID4gPiA+
ID4gPiBhcmUgYnVpbHQgb24uIERvIHdlIHJlYWxseSBleHBlY3QgcGVvcGxlIHRvIHNldCBsZWFz
ZXMgdGhlcmU/Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJIGd1ZXNzIGl0J3MgdGVjaG5pY2Fs
bHkgYSByZWdyZXNzaW9uIHNpbmNlIHlvdSBjb3VsZCBzZXQgdGhlbSBvbiB0aG9zZQo+ID4gPiA+
ID4gPiBzb3J0cyBvZiBmaWxlcyBlYXJsaWVyLCBidXQgcGVvcGxlIGRvbid0IHVzdWFsbHkgZXhw
b3J0IGtlcm5mcyBiYXNlZAo+ID4gPiA+ID4gPiBmaWxlc3lzdGVtcyB2aWEgTkZTIG9yIFNNQiwg
YW5kIHRoYXQgc2VlbXMgbGlrZSBzb21ldGhpbmcgdGhhdCBjb3VsZCBiZQo+ID4gPiA+ID4gPiB1
c2VkIHRvIG1ha2UgbWlzY2hpZWYuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBBRkFJQ1QsIGtl
cm5mc19leHBvcnRfb3BzIGlzIG1vc3RseSB0byBzdXBwb3J0IG9wZW5fYnlfaGFuZGxlX2F0KCku
IFNlZQo+ID4gPiA+ID4gPiBjb21taXQgYWE4MTg4MjUzNDc0ICgia2VybmZzOiBhZGQgZXhwb3J0
ZnMgb3BlcmF0aW9ucyIpLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gT25lIGlkZWE6IHdlIGNv
dWxkIGFkZCBhIHdyYXBwZXIgYXJvdW5kIGdlbmVyaWNfc2V0bGVhc2UoKSBmb3IKPiA+ID4gPiA+
ID4gZmlsZXN5c3RlbXMgbGlrZSB0aGlzIHRoYXQgd2lsbCBkbyBhIFdBUk5fT05DRSgpIGFuZCB0
aGVuIGNhbGwKPiA+ID4gPiA+ID4gZ2VuZXJpY19zZXRsZWFzZSgpLiBUaGF0IHdvdWxkIGtlZXAg
bGVhc2VzIHdvcmtpbmcgb24gdGhlbSBidXQgd2UgbWlnaHQKPiA+ID4gPiA+ID4gZ2V0IHNvbWUg
cmVwb3J0cyB0aGF0IHdvdWxkIHRlbGwgdXMgd2hvJ3Mgc2V0dGluZyBsZWFzZXMgb24gdGhlc2Ug
ZmlsZXMKPiA+ID4gPiA+ID4gYW5kIHdoeS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gSU1PLCB5b3Ug
YXJlIGJlaW5nIHRvbyBjYXV0aW91cywgYnV0IHdoYXRldmVyLgo+ID4gPiA+ID4gCj4gPiA+ID4g
PiBJdCBpcyBub3QgYWNjdXJhdGUgdGhhdCBrZXJuZnMgZmlsZXN5c3RlbXMgYXJlIE5GUyBleHBv
cnRhYmxlIGluIGdlbmVyYWwuCj4gPiA+ID4gPiBPbmx5IGNncm91cGZzIGhhcyBLRVJORlNfUk9P
VF9TVVBQT1JUX0VYUE9SVE9QLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJZiBhbnkgYXBwbGljYXRp
b24gaXMgdXNpbmcgbGVhc2VzIG9uIGNncm91cCBmaWxlcywgaXQgbXVzdCBiZSBzb21lCj4gPiA+
ID4gPiB2ZXJ5IGFkdmFuY2VkIHJ1bnRpbWUgKGkuZS4gc3lzdGVtZCksIHNvIHdlIHNob3VsZCBr
bm93IGFib3V0IHRoZQo+ID4gPiA+ID4gcmVncmVzc2lvbiBzb29uZXIgcmF0aGVyIHRoYW4gbGF0
ZXIuCj4gPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBJIHRoaW5rIHNvIHRvby4gRm9yIG5vdywg
SSB0aGluayBJJ2xsIG5vdCBib3RoZXIgd2l0aCB0aGUgV0FSTl9PTkNFKCkuCj4gPiA+ID4gTGV0
J3MganVzdCBsZWF2ZSBrZXJuZnMgb3V0IG9mIHRoZSBzZXQgdW50aWwgc29tZW9uZSBwcmVzZW50
cyBhIHJlYWwKPiA+ID4gPiB1c2UtY2FzZS4KPiA+ID4gPiAKPiA+ID4gPiA+IFRoZXJlIGFyZSBh
bHNvIHRoZSByZWNlbnRseSBhZGRlZCBuc2ZzIGFuZCBwaWRmcyBleHBvcnRfb3BlcmF0aW9ucy4K
PiA+ID4gPiA+IAo+ID4gPiA+ID4gSSBoYXZlIGEgcmVjb2xsZWN0aW9uIGFib3V0IHdhbnRpbmcg
dG8gYmUgZXhwbGljaXQgYWJvdXQgbm90IGFsbG93aW5nCj4gPiA+ID4gPiB0aG9zZSB0byBiZSBl
eHBvcnRhYmxlIHRvIE5GUyAobnNmcyBzcGVjaWZpY2FsbHkpLCBidXQgSSBjYW4ndCBzZWUgd2hl
cmUKPiA+ID4gPiA+IGFuZCBpZiB0aGF0IHJlc3RyaWN0aW9uIHdhcyBkb25lLgo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBDaHJpc3RpYW4/IERvIHlvdSByZW1lbWJlcj8KPiA+ID4gPiA+IAo+ID4gPiA+
IAo+ID4gPiA+IChjYydpbmcgQ2h1Y2spCj4gPiA+ID4gCj4gPiA+ID4gRldJVywgeW91IGNhbiBj
dXJyZW50bHkgZXhwb3J0IGFuZCBtb3VudCAvc3lzL2ZzL2Nncm91cCB2aWEgTkZTLiBUaGUKPiA+
ID4gPiBkaXJlY3RvcnkgZG9lc24ndCBzaG93IHVwIHdoZW4geW91IHRyeSB0byBnZXQgdG8gaXQg
dmlhIE5GU3Y0LCBidXQgeW91Cj4gPiA+ID4gY2FuIG1vdW50IGl0IHVzaW5nIHYzIGFuZCBSRUFE
RElSIHdvcmtzLiBUaGUgZmlsZXMgYXJlIGFsbCBlbXB0eSB3aGVuCj4gPiA+ID4geW91IHRyeSB0
byByZWFkIHRoZW0uIEkgZGlkbid0IHRyeSB0byBkbyBhbnkgd3JpdGVzLgo+ID4gPiA+IAo+ID4g
PiA+IFNob3VsZCB3ZSBhZGQgYSBtZWNoYW5pc20gdG8gcHJldmVudCBleHBvcnRpbmcgdGhlc2Ug
c29ydHMgb2YKPiA+ID4gPiBmaWxlc3lzdGVtcz8KPiA+ID4gPiAKPiA+ID4gPiBFdmVuIGJldHRl
ciB3b3VsZCBiZSB0byBtYWtlIG5mc2QgZXhwb3J0aW5nIGV4cGxpY2l0bHkgb3B0LWluLiBXaGF0
IGlmCj4gPiA+ID4gd2Ugd2VyZSB0byBhZGQgYSBFWFBPUlRfT1BfTkZTRCBmbGFnIHRoYXQgZXhw
bGljaXRseSBhbGxvd3MgZmlsZXN5c3RlbXMKPiA+ID4gPiB0byBvcHQtaW4gdG8gTkZTIGV4cG9y
dGluZywgYW5kIGNoZWNrIGZvciB0aGF0IGluIF9fZmhfdmVyaWZ5KCk/IFdlJ2QKPiA+ID4gPiBo
YXZlIHRvIGFkZCBpdCB0byBhIGJ1bmNoIG9mIGV4aXN0aW5nIGZpbGVzeXN0ZW1zLCBidXQgdGhh
dCdzIGZhaXJseQo+ID4gPiA+IHNpbXBsZSB0byBkbyB3aXRoIGFuIExMTS4KPiA+ID4gCj4gPiA+
IFdoYXQncyB0aGUgYWN0aXZlIGhhcm0gaW4gZXhwb3J0aW5nIC9zeXMvZnMvY2dyb3VwID8gSXQg
aGFzIHRvIGJlIGRvbmUKPiA+ID4gZXhwbGljaXRseSB2aWEgL2V0Yy9leHBvcnRzLCBzbyB0aGlz
IGlzIHVuZGVyIHRoZSBORlMgc2VydmVyIGFkbWluJ3MKPiA+ID4gY29udHJvbC4gSXMgaXQgYW4g
YXR0YWNrIHN1cmZhY2U/Cj4gPiA+IAo+ID4gCj4gPiBQb3RlbnRpYWxseT8KPiA+IAo+ID4gSSBk
b24ndCBzZWUgYW55IGFjdGl2ZSBoYXJtIHdpdGggZXhwb3J0aW5nIGNncm91cGZzLiBJdCBkb2Vz
bid0IHdvcmsKPiA+IHJpZ2h0IHZpYSBuZnNkLCBidXQgaXQncyBub3QgY3Jhc2hpbmcgdGhlIGJv
eCBvciBhbnl0aGluZy4KPiA+IAo+ID4gQXQgb25lIHRpbWUsIHRob3NlIHdlcmUgb25seSBkZWZp
bmVkIGJ5IGZpbGVzeXN0ZW1zIHRoYXQgd2FudGVkIHRvCj4gPiBhbGxvdyBORlMgZXhwb3J0LiBO
b3cgd2UndmUgZ3Jvd24gdGhlbSBvbiBmaWxlc3lzdGVtcyB0aGF0IGp1c3Qgd2FudCB0bwo+ID4g
cHJvdmlkZSBmaWxlaGFuZGxlcyBmb3Igb3Blbl9ieV9oYW5kbGVfYXQoKSBhbmQgdGhlIGxpa2Uu
IG5mc2QgZG9lc24ndAo+ID4gY2FyZSB0aG91Z2g6IGlmIHRoZSBmcyBoYXMgZXhwb3J0IG9wZXJh
dGlvbnMsIGl0J2xsIGhhcHBpbHkgdXNlIHRoZW0uCj4gPiAKPiA+IEhhdmluZyBhbiBleHBsaWNp
dCAiSSB3YW50IHRvIGFsbG93IG5mc2QiIGZsYWcgc2VlIG1zIGxpa2UgaXQgbWlnaHQKPiA+IHNh
dmUgdXMgc29tZSBoZWFkYWNoZXMgaW4gdGhlIGZ1dHVyZSB3aGVuIG90aGVyIGZpbGVzeXN0ZW1z
IGFkZCBleHBvcnQKPiA+IG9wcyBmb3IgdGhpcyBzb3J0IG9mIGZpbGVoYW5kbGUgdXNlLgo+IAo+
IFNvIHdlIGFyZSByZS1oYXNoaW5nIGEgZGlzY3Vzc2lvbiB3ZSBoYWQgYSBmZXcgbW9udGhzIGFn
byAoQW1pciB3YXMKPiBpbnZvbHZlZCBhdCBsZWFzdCkuCj4gCgpZZXAsIEkgd2FzIGx1cmtpbmcg
b24gaXQsIGJ1dCBkaWRuJ3QgaGF2ZSBhIGxvdCBvZiBpbnB1dCBhdCB0aGUgdGltZS4KCj4gSSBk
b24ndCB0aGluayB3ZSB3YW50IHRvIGV4cG9zZSBjZ3JvdXBmcyB2aWEgTkZTIHRoYXQncyBzdXBl
ciB3ZWlyZC4KPiBJdCdzIGxpa2UgcmVtb3RlIHBhcnRpYWwgcmVzb3VyY2UgbWFuYWdlbWVudCBh
bmQgaXQgd291bGQgYmUgdmVyeQo+IHN0cmFuZ2UgaWYgYSByZW1vdGUgcHJvY2VzcyBzdWRkZW5s
eSB3b3VsZCBiZSBhYmxlIHRvIG1vdmUgdGhpbmdzIGFyb3VuZAo+IGluIHRoZSBjZ3JvdXAgdHJl
ZS4gU28gSSB3b3VsZCBwcmVmZXIgdG8gbm90IGRvIHRoaXMuCj4KPiBTbyBteSBwcmVmZXJlbmNl
IHdvdWxkIGJlIHRvIHJlYWxseSBzZXZlciBmaWxlIGhhbmRsZXMgZnJvbSB0aGUgZXhwb3J0Cj4g
bWVjaGFuaXNtIHNvIHRoYXQgd2UgY2FuIGFsbG93IHN0dWZmIGxpa2UgcGlkZnMgYW5kIG5zZnMg
YW5kIGNncm91cGZzIHRvCj4gdXNlIGZpbGUgaGFuZGxlcyB2aWEgbmFtZV90b19oYW5kbGVfYXQo
KSBhbmQgb3Blbl9ieV9oYW5kbGVfYXQoKSB3aXRob3V0Cj4gbWFraW5nIHRoZW0gZXhwb3J0YWJs
ZS4KCkFncmVlZC4gSSB0aGluayB3ZSB3YW50IHRvIG1ha2UgTkZTIGV4cG9ydCBiZSBhIGRlbGli
ZXJhdGUgb3B0LWluCmRlY2lzaW9uIHRoYXQgZmlsZXN5c3RlbSBkZXZlbG9wZXJzIG1ha2UuIEhv
dyB3ZSBkbyB0aGF0IGlzIHVwIGZvcgpkZWJhdGUsIG9mIGNvdXJzZS4KCkFuIGV4cG9ydCBvcHMg
ZmxhZyB3b3VsZCBiZSBmYWlybHkgc2ltcGxlIHRvIGltcGxlbWVudCwgYnV0IGl0IHNvdW5kcwps
aWtlIHlvdSdyZSB0aGlua2luZyB0aGF0IHdlIHNob3VsZCBzcGxpdCBzb21lIGV4cG9ydF9vcGVy
YXRpb25zIGludG8Kc3RydWN0IGZpbGVfaGFuZGxlX29wZXJhdGlvbnMgYW5kIHRoZW4gYWRkIGEg
cG9pbnRlciBmb3IgdGhhdCB0bwpzdXBlcl9ibG9jayAoYW5kIG1heWJlIHRvIGV4cG9ydF9vcGVy
YXRpb25zIHRvbyk/CgpUaGlzIHdvdWxkIGJlIGEgZ29vZCBMU0YvTU0gdG9waWMsIGJ1dCBJJ20g
aG9waW5nIHdlIGNhbiBjb21lIHRvIGEKY29uc2Vuc3VzIGJlZm9yZSB0aGVuLgoKLS0gCkplZmYg
TGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
