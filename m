Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3B2D17668
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 09:54:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aB81OGTllddD8CBizhGMPbXC6H22jZJkdLeUGtbCSIE=; b=EzEMmaP6kaEFSFfuYe+DW1S4A5
	Bs8PZ1ROHKZPTtzVoLE+3HfXB1CxxTfomQwBJfdrzH2/BO9rZv9RHFxK0ezzYBaq0kMemICgCtcQR
	+u+//9Dv6kgcU3rPnM1gHYkBQvFhSdQteHxu4ddg0m1BxKgvLj29m6JrftYqJUDnPgx4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfaAk-0000Yt-G3;
	Tue, 13 Jan 2026 08:54:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vfaAi-0000Yd-SW;
 Tue, 13 Jan 2026 08:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3EVqflcatbx4V1B46xWWhgcfIYUol4ag4eDJtKtbMe4=; b=iYEEuVO4or+a4IZG5SZbXLdoaI
 6EcRSjRIuKfQ1QO0KRIAm9SzVkWnqbUUdrqb0I00VTtDuZ2v205rrsZYWUfQyXJ+CCIO6YLzHjI77
 HbyLVwEv9XPynp8f0RYv9QmuYWM87cLvB5PvOjmMmYknoTDEH8g8YEFfcJEJQZWgS7g0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3EVqflcatbx4V1B46xWWhgcfIYUol4ag4eDJtKtbMe4=; b=Ml78xx6Zx12ULQWSGbR9bgN9K9
 OJ02h8SbtI5aFkxfwtCLMHBHm5k5Tyk0QVZ5jzK/TNNmV1uJTmUIcXgiuAUL1n/oEJPdLdOUdEN2a
 nbn5ErC+mwjrgViu2j4MvKEEcM3bmtHno77Tg5dvgMIM374ZXM0S7Xm+7cbUody47DPA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfaAi-0004ca-7U; Tue, 13 Jan 2026 08:54:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6B157432B5;
 Tue, 13 Jan 2026 08:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A24BC116C6;
 Tue, 13 Jan 2026 08:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768294474;
 bh=8pJH5EMsw2Zf/vnxVI5TNW+Tn1VjYrvuVd/4u81hQjw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VMqw4jfOdED4XJIXekFPVJQafNNTl6ZiZA++QmJZRBiaMMpeaGnJz3p4o2lTbIKwN
 ZGKZS5HpYR0+N1ii5xC8s/TyQQtV2NHGSS3n0xjeitfnyVlfkGYGF3WN3Zn7pEUn7y
 amB5o/YtgvPlamLE3g3COpvYgjvxdfsKYBT2hFD400U3g9OGS1J+dMj0yVSbLkyPHq
 +GkCBtTzjYLjVlnxILoQmVvBvvr3BKnDX0iaKwspCd8aN5JnS4IRKaSF02TomWn63P
 ouok9TX1G4ku4VsaA4mPbFNSkRS1iOdM6roW82YC7GjR5YxocE6Li41axUo0cFM9rz
 CEFrc/zUFpOyw==
Date: Tue, 13 Jan 2026 09:54:15 +0100
To: Jeff Layton <jlayton@kernel.org>, Amir Goldstein <amir73il@gmail.com>
Message-ID: <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
 <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 12, 2026 at 09:50:20AM -0500, Jeff Layton wrote:
 > On Mon, 2026-01-12 at 09:31 -0500, Chuck Lever wrote: > > On 1/12/26 8:34
 AM, Jeff Layton wrote: > > > On Fri, 2026-01-09 at 19:52 +0100, [...] 
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
X-Headers-End: 1vfaAi-0004ca-7U
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
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

T24gTW9uLCBKYW4gMTIsIDIwMjYgYXQgMDk6NTA6MjBBTSAtMDUwMCwgSmVmZiBMYXl0b24gd3Jv
dGU6Cj4gT24gTW9uLCAyMDI2LTAxLTEyIGF0IDA5OjMxIC0wNTAwLCBDaHVjayBMZXZlciB3cm90
ZToKPiA+IE9uIDEvMTIvMjYgODozNCBBTSwgSmVmZiBMYXl0b24gd3JvdGU6Cj4gPiA+IE9uIEZy
aSwgMjAyNi0wMS0wOSBhdCAxOTo1MiArMDEwMCwgQW1pciBHb2xkc3RlaW4gd3JvdGU6Cj4gPiA+
ID4gT24gVGh1LCBKYW4gOCwgMjAyNiBhdCA3OjU34oCvUE0gSmVmZiBMYXl0b24gPGpsYXl0b25A
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IE9uIFRodSwgMjAyNi0wMS0w
OCBhdCAxODo0MCArMDEwMCwgSmFuIEthcmEgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFRodSAwOC0w
MS0yNiAxMjoxMjo1NSwgSmVmZiBMYXl0b24gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gWWVzdGVyZGF5
LCBJIHNlbnQgcGF0Y2hlcyB0byBmaXggaG93IGRpcmVjdG9yeSBkZWxlZ2F0aW9uIHN1cHBvcnQg
aXMKPiA+ID4gPiA+ID4gPiBoYW5kbGVkIG9uIGZpbGVzeXN0ZW1zIHdoZXJlIHRoZSBzaG91bGQg
YmUgZGlzYWJsZWQgWzFdLiBUaGF0IHNldCBpcwo+ID4gPiA+ID4gPiA+IGFwcHJvcHJpYXRlIGZv
ciB2Ni4xOS4gRm9yIHY3LjAsIEkgd2FudCB0byBtYWtlIGxlYXNlIHN1cHBvcnQgYmUgbW9yZQo+
ID4gPiA+ID4gPiA+IG9wdC1pbiwgcmF0aGVyIHRoYW4gb3B0LW91dDoKPiA+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gPiBGb3IgaGlzdG9yaWNhbCByZWFzb25zLCB3aGVuIC0+c2V0bGVhc2UoKSBm
aWxlX29wZXJhdGlvbiBpcyBzZXQgdG8gTlVMTCwKPiA+ID4gPiA+ID4gPiB0aGUgZGVmYXVsdCBp
cyB0byB1c2UgdGhlIGtlcm5lbC1pbnRlcm5hbCBsZWFzZSBpbXBsZW1lbnRhdGlvbi4gVGhpcwo+
ID4gPiA+ID4gPiA+IG1lYW5zIHRoYXQgaWYgeW91IHdhbnQgdG8gZGlzYWJsZSB0aGVtLCB5b3Ug
bmVlZCB0byBleHBsaWNpdGx5IHNldCB0aGUKPiA+ID4gPiA+ID4gPiAtPnNldGxlYXNlKCkgZmls
ZV9vcGVyYXRpb24gdG8gc2ltcGxlX25vc2V0bGVhc2UoKSBvciB0aGUgZXF1aXZhbGVudC4KPiA+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBUaGlzIGhhcyBjYXVzZWQgYSBudW1iZXIgb2YgcHJv
YmxlbXMgb3ZlciB0aGUgeWVhcnMgYXMgc29tZSBmaWxlc3lzdGVtcwo+ID4gPiA+ID4gPiA+IGhh
dmUgaW5hZHZlcnRhbnRseSBhbGxvd2VkIGxlYXNlcyB0byBiZSBhY3F1aXJlZCBzaW1wbHkgYnkg
aGF2aW5nIGxlZnQKPiA+ID4gPiA+ID4gPiBpdCBzZXQgdG8gTlVMTC4gSXQgd291bGQgYmUgYmV0
dGVyIGlmIGZpbGVzeXN0ZW1zIGhhZCB0byBvcHQtaW4gdG8gbGVhc2UKPiA+ID4gPiA+ID4gPiBz
dXBwb3J0LCBwYXJ0aWN1bGFybHkgd2l0aCB0aGUgYWR2ZW50IG9mIGRpcmVjdG9yeSBkZWxlZ2F0
aW9ucy4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBUaGlzIHNlcmllcyBoYXMgc2V0cyB0
aGUgLT5zZXRsZWFzZSgpIG9wZXJhdGlvbiBpbiBhIHBpbGUgb2YgZXhpc3RpbmcKPiA+ID4gPiA+
ID4gPiBsb2NhbCBmaWxlc3lzdGVtcyB0byBnZW5lcmljX3NldGxlYXNlKCkgYW5kIHRoZW4gY2hh
bmdlcwo+ID4gPiA+ID4gPiA+IGtlcm5lbF9zZXRsZWFzZSgpIHRvIHJldHVybiAtRUlOVkFMIHdo
ZW4gdGhlIHNldGxlYXNlKCkgb3BlcmF0aW9uIGlzIG5vdAo+ID4gPiA+ID4gPiA+IHNldC4KPiA+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBXaXRoIHRoaXMgY2hhbmdlLCBuZXcgZmlsZXN5c3Rl
bXMgd2lsbCBuZWVkIHRvIGV4cGxpY2l0bHkgc2V0IHRoZQo+ID4gPiA+ID4gPiA+IC0+c2V0bGVh
c2UoKSBvcGVyYXRpb25zIGluIG9yZGVyIHRvIHByb3ZpZGUgbGVhc2UgYW5kIGRlbGVnYXRpb24K
PiA+ID4gPiA+ID4gPiBzdXBwb3J0Lgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEkgbWFp
bmx5IGZvY3VzZWQgb24gZmlsZXN5c3RlbXMgdGhhdCBhcmUgTkZTIGV4cG9ydGFibGUsIHNpbmNl
IE5GUyBhbmQKPiA+ID4gPiA+ID4gPiBTTUIgYXJlIHRoZSBtYWluIHVzZXJzIG9mIGZpbGUgbGVh
c2VzLCBhbmQgdGhleSB0ZW5kIHRvIGVuZCB1cCBleHBvcnRpbmcKPiA+ID4gPiA+ID4gPiB0aGUg
c2FtZSBmaWxlc3lzdGVtIHR5cGVzLiBMZXQgbWUga25vdyBpZiBJJ3ZlIG1pc3NlZCBhbnkuCj4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBTbywgd2hhdCBhYm91dCBrZXJuZnMgYW5kIGZ1c2U/IFRo
ZXkgc2VlbSB0byBiZSBleHBvcnRhYmxlIGFuZCBkb24ndCBoYXZlCj4gPiA+ID4gPiA+IC5zZXRs
ZWFzZSBzZXQuLi4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFllcywgRlVTRSBu
ZWVkcyB0aGlzIHRvby4gSSdsbCBhZGQgYSBwYXRjaCBmb3IgdGhhdC4KPiA+ID4gPiA+IAo+ID4g
PiA+ID4gQXMgZmFyIGFzIGtlcm5mcyBnb2VzOiBBSVVJLCB0aGF0J3MgYmFzaWNhbGx5IHdoYXQg
c3lzZnMgYW5kIHJlc2N0cmwKPiA+ID4gPiA+IGFyZSBidWlsdCBvbi4gRG8gd2UgcmVhbGx5IGV4
cGVjdCBwZW9wbGUgdG8gc2V0IGxlYXNlcyB0aGVyZT8KPiA+ID4gPiA+IAo+ID4gPiA+ID4gSSBn
dWVzcyBpdCdzIHRlY2huaWNhbGx5IGEgcmVncmVzc2lvbiBzaW5jZSB5b3UgY291bGQgc2V0IHRo
ZW0gb24gdGhvc2UKPiA+ID4gPiA+IHNvcnRzIG9mIGZpbGVzIGVhcmxpZXIsIGJ1dCBwZW9wbGUg
ZG9uJ3QgdXN1YWxseSBleHBvcnQga2VybmZzIGJhc2VkCj4gPiA+ID4gPiBmaWxlc3lzdGVtcyB2
aWEgTkZTIG9yIFNNQiwgYW5kIHRoYXQgc2VlbXMgbGlrZSBzb21ldGhpbmcgdGhhdCBjb3VsZCBi
ZQo+ID4gPiA+ID4gdXNlZCB0byBtYWtlIG1pc2NoaWVmLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBB
RkFJQ1QsIGtlcm5mc19leHBvcnRfb3BzIGlzIG1vc3RseSB0byBzdXBwb3J0IG9wZW5fYnlfaGFu
ZGxlX2F0KCkuIFNlZQo+ID4gPiA+ID4gY29tbWl0IGFhODE4ODI1MzQ3NCAoImtlcm5mczogYWRk
IGV4cG9ydGZzIG9wZXJhdGlvbnMiKS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gT25lIGlkZWE6IHdl
IGNvdWxkIGFkZCBhIHdyYXBwZXIgYXJvdW5kIGdlbmVyaWNfc2V0bGVhc2UoKSBmb3IKPiA+ID4g
PiA+IGZpbGVzeXN0ZW1zIGxpa2UgdGhpcyB0aGF0IHdpbGwgZG8gYSBXQVJOX09OQ0UoKSBhbmQg
dGhlbiBjYWxsCj4gPiA+ID4gPiBnZW5lcmljX3NldGxlYXNlKCkuIFRoYXQgd291bGQga2VlcCBs
ZWFzZXMgd29ya2luZyBvbiB0aGVtIGJ1dCB3ZSBtaWdodAo+ID4gPiA+ID4gZ2V0IHNvbWUgcmVw
b3J0cyB0aGF0IHdvdWxkIHRlbGwgdXMgd2hvJ3Mgc2V0dGluZyBsZWFzZXMgb24gdGhlc2UgZmls
ZXMKPiA+ID4gPiA+IGFuZCB3aHkuCj4gPiA+ID4gCj4gPiA+ID4gSU1PLCB5b3UgYXJlIGJlaW5n
IHRvbyBjYXV0aW91cywgYnV0IHdoYXRldmVyLgo+ID4gPiA+IAo+ID4gPiA+IEl0IGlzIG5vdCBh
Y2N1cmF0ZSB0aGF0IGtlcm5mcyBmaWxlc3lzdGVtcyBhcmUgTkZTIGV4cG9ydGFibGUgaW4gZ2Vu
ZXJhbC4KPiA+ID4gPiBPbmx5IGNncm91cGZzIGhhcyBLRVJORlNfUk9PVF9TVVBQT1JUX0VYUE9S
VE9QLgo+ID4gPiA+IAo+ID4gPiA+IElmIGFueSBhcHBsaWNhdGlvbiBpcyB1c2luZyBsZWFzZXMg
b24gY2dyb3VwIGZpbGVzLCBpdCBtdXN0IGJlIHNvbWUKPiA+ID4gPiB2ZXJ5IGFkdmFuY2VkIHJ1
bnRpbWUgKGkuZS4gc3lzdGVtZCksIHNvIHdlIHNob3VsZCBrbm93IGFib3V0IHRoZQo+ID4gPiA+
IHJlZ3Jlc3Npb24gc29vbmVyIHJhdGhlciB0aGFuIGxhdGVyLgo+ID4gPiA+IAo+ID4gPiAKPiA+
ID4gSSB0aGluayBzbyB0b28uIEZvciBub3csIEkgdGhpbmsgSSdsbCBub3QgYm90aGVyIHdpdGgg
dGhlIFdBUk5fT05DRSgpLgo+ID4gPiBMZXQncyBqdXN0IGxlYXZlIGtlcm5mcyBvdXQgb2YgdGhl
IHNldCB1bnRpbCBzb21lb25lIHByZXNlbnRzIGEgcmVhbAo+ID4gPiB1c2UtY2FzZS4KPiA+ID4g
Cj4gPiA+ID4gVGhlcmUgYXJlIGFsc28gdGhlIHJlY2VudGx5IGFkZGVkIG5zZnMgYW5kIHBpZGZz
IGV4cG9ydF9vcGVyYXRpb25zLgo+ID4gPiA+IAo+ID4gPiA+IEkgaGF2ZSBhIHJlY29sbGVjdGlv
biBhYm91dCB3YW50aW5nIHRvIGJlIGV4cGxpY2l0IGFib3V0IG5vdCBhbGxvd2luZwo+ID4gPiA+
IHRob3NlIHRvIGJlIGV4cG9ydGFibGUgdG8gTkZTIChuc2ZzIHNwZWNpZmljYWxseSksIGJ1dCBJ
IGNhbid0IHNlZSB3aGVyZQo+ID4gPiA+IGFuZCBpZiB0aGF0IHJlc3RyaWN0aW9uIHdhcyBkb25l
Lgo+ID4gPiA+IAo+ID4gPiA+IENocmlzdGlhbj8gRG8geW91IHJlbWVtYmVyPwo+ID4gPiA+IAo+
ID4gPiAKPiA+ID4gKGNjJ2luZyBDaHVjaykKPiA+ID4gCj4gPiA+IEZXSVcsIHlvdSBjYW4gY3Vy
cmVudGx5IGV4cG9ydCBhbmQgbW91bnQgL3N5cy9mcy9jZ3JvdXAgdmlhIE5GUy4gVGhlCj4gPiA+
IGRpcmVjdG9yeSBkb2Vzbid0IHNob3cgdXAgd2hlbiB5b3UgdHJ5IHRvIGdldCB0byBpdCB2aWEg
TkZTdjQsIGJ1dCB5b3UKPiA+ID4gY2FuIG1vdW50IGl0IHVzaW5nIHYzIGFuZCBSRUFERElSIHdv
cmtzLiBUaGUgZmlsZXMgYXJlIGFsbCBlbXB0eSB3aGVuCj4gPiA+IHlvdSB0cnkgdG8gcmVhZCB0
aGVtLiBJIGRpZG4ndCB0cnkgdG8gZG8gYW55IHdyaXRlcy4KPiA+ID4gCj4gPiA+IFNob3VsZCB3
ZSBhZGQgYSBtZWNoYW5pc20gdG8gcHJldmVudCBleHBvcnRpbmcgdGhlc2Ugc29ydHMgb2YKPiA+
ID4gZmlsZXN5c3RlbXM/Cj4gPiA+IAo+ID4gPiBFdmVuIGJldHRlciB3b3VsZCBiZSB0byBtYWtl
IG5mc2QgZXhwb3J0aW5nIGV4cGxpY2l0bHkgb3B0LWluLiBXaGF0IGlmCj4gPiA+IHdlIHdlcmUg
dG8gYWRkIGEgRVhQT1JUX09QX05GU0QgZmxhZyB0aGF0IGV4cGxpY2l0bHkgYWxsb3dzIGZpbGVz
eXN0ZW1zCj4gPiA+IHRvIG9wdC1pbiB0byBORlMgZXhwb3J0aW5nLCBhbmQgY2hlY2sgZm9yIHRo
YXQgaW4gX19maF92ZXJpZnkoKT8gV2UnZAo+ID4gPiBoYXZlIHRvIGFkZCBpdCB0byBhIGJ1bmNo
IG9mIGV4aXN0aW5nIGZpbGVzeXN0ZW1zLCBidXQgdGhhdCdzIGZhaXJseQo+ID4gPiBzaW1wbGUg
dG8gZG8gd2l0aCBhbiBMTE0uCj4gPiAKPiA+IFdoYXQncyB0aGUgYWN0aXZlIGhhcm0gaW4gZXhw
b3J0aW5nIC9zeXMvZnMvY2dyb3VwID8gSXQgaGFzIHRvIGJlIGRvbmUKPiA+IGV4cGxpY2l0bHkg
dmlhIC9ldGMvZXhwb3J0cywgc28gdGhpcyBpcyB1bmRlciB0aGUgTkZTIHNlcnZlciBhZG1pbidz
Cj4gPiBjb250cm9sLiBJcyBpdCBhbiBhdHRhY2sgc3VyZmFjZT8KPiA+IAo+IAo+IFBvdGVudGlh
bGx5Pwo+IAo+IEkgZG9uJ3Qgc2VlIGFueSBhY3RpdmUgaGFybSB3aXRoIGV4cG9ydGluZyBjZ3Jv
dXBmcy4gSXQgZG9lc24ndCB3b3JrCj4gcmlnaHQgdmlhIG5mc2QsIGJ1dCBpdCdzIG5vdCBjcmFz
aGluZyB0aGUgYm94IG9yIGFueXRoaW5nLgo+IAo+IEF0IG9uZSB0aW1lLCB0aG9zZSB3ZXJlIG9u
bHkgZGVmaW5lZCBieSBmaWxlc3lzdGVtcyB0aGF0IHdhbnRlZCB0bwo+IGFsbG93IE5GUyBleHBv
cnQuIE5vdyB3ZSd2ZSBncm93biB0aGVtIG9uIGZpbGVzeXN0ZW1zIHRoYXQganVzdCB3YW50IHRv
Cj4gcHJvdmlkZSBmaWxlaGFuZGxlcyBmb3Igb3Blbl9ieV9oYW5kbGVfYXQoKSBhbmQgdGhlIGxp
a2UuIG5mc2QgZG9lc24ndAo+IGNhcmUgdGhvdWdoOiBpZiB0aGUgZnMgaGFzIGV4cG9ydCBvcGVy
YXRpb25zLCBpdCdsbCBoYXBwaWx5IHVzZSB0aGVtLgo+IAo+IEhhdmluZyBhbiBleHBsaWNpdCAi
SSB3YW50IHRvIGFsbG93IG5mc2QiIGZsYWcgc2VlIG1zIGxpa2UgaXQgbWlnaHQKPiBzYXZlIHVz
IHNvbWUgaGVhZGFjaGVzIGluIHRoZSBmdXR1cmUgd2hlbiBvdGhlciBmaWxlc3lzdGVtcyBhZGQg
ZXhwb3J0Cj4gb3BzIGZvciB0aGlzIHNvcnQgb2YgZmlsZWhhbmRsZSB1c2UuCgpTbyB3ZSBhcmUg
cmUtaGFzaGluZyBhIGRpc2N1c3Npb24gd2UgaGFkIGEgZmV3IG1vbnRocyBhZ28gKEFtaXIgd2Fz
Cmludm9sdmVkIGF0IGxlYXN0KS4KCkkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBleHBvc2UgY2dy
b3VwZnMgdmlhIE5GUyB0aGF0J3Mgc3VwZXIgd2VpcmQuCkl0J3MgbGlrZSByZW1vdGUgcGFydGlh
bCByZXNvdXJjZSBtYW5hZ2VtZW50IGFuZCBpdCB3b3VsZCBiZSB2ZXJ5CnN0cmFuZ2UgaWYgYSBy
ZW1vdGUgcHJvY2VzcyBzdWRkZW5seSB3b3VsZCBiZSBhYmxlIHRvIG1vdmUgdGhpbmdzIGFyb3Vu
ZAppbiB0aGUgY2dyb3VwIHRyZWUuIFNvIEkgd291bGQgcHJlZmVyIHRvIG5vdCBkbyB0aGlzLgoK
U28gbXkgcHJlZmVyZW5jZSB3b3VsZCBiZSB0byByZWFsbHkgc2V2ZXIgZmlsZSBoYW5kbGVzIGZy
b20gdGhlIGV4cG9ydAptZWNoYW5pc20gc28gdGhhdCB3ZSBjYW4gYWxsb3cgc3R1ZmYgbGlrZSBw
aWRmcyBhbmQgbnNmcyBhbmQgY2dyb3VwZnMgdG8KdXNlIGZpbGUgaGFuZGxlcyB2aWEgbmFtZV90
b19oYW5kbGVfYXQoKSBhbmQgb3Blbl9ieV9oYW5kbGVfYXQoKSB3aXRob3V0Cm1ha2luZyB0aGVt
IGV4cG9ydGFibGUuCgpTb21laG93IEkgdGhvdWdodCB0aGF0IEFtaXIgaGFkIGFscmVhZHkgZG9u
ZSB0aGF0IHdvcmsgYSB3aGlsZSBhZ28gYnV0Cm1heWJlIGl0IHdhcyByZWFsbHkganVzdCBhYm91
dCBuYW1lX3RvX2hhbmRsZV9hdCgpIGFuZCBub3QgYWxzbwpvcGVuX2J5X2hhbmRsZV9hdCgpLi4u
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
