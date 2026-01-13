Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D59BD196FD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 15:27:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:Date:To:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6gXylIMX3DoQAK9c7vlbxQgBmfDjiX6uVRzvgdAeTs=; b=SdvaSD454fbjw3Xzu9e2cFr/LM
	LyZTwpTxNaijZpDRfaFvQHFWJg5UmdY41oj6a+SfXv+hjz68LClBC4tjpuip9J6FQkSsRH2BZyS0g
	rVawkV0Vy/+kNYKQGbFDzndTWXRYawwsBIHe6eioZwQCtCAihJ1XM9q4P1S09yEk/nVw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vffMu-0003sX-F3;
	Tue, 13 Jan 2026 14:27:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vffMs-0003sH-I4;
 Tue, 13 Jan 2026 14:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=voYb0DywiBp6FZyvGWnVpLV+F3/B5O4eT1B8kp+Veyg=; b=XCKRa+WEmX/5s3FStyz+LaIxBa
 I2bgwDqwPT4dpwSOt0RGpZyDw2Ay2HzZVy7PbRBMos26KN91l0cdFDdwTRaVCIpKP3LBrmaDg8+I5
 fyEOeIuUutaLrdoh6q0mfJojqjuCp3YT9FRdo+j9SdcTBccsV8jSC3eTOJU2nlbuPuzc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=voYb0DywiBp6FZyvGWnVpLV+F3/B5O4eT1B8kp+Veyg=; b=IflPvvHH4n3nc3ZmKIR1dTaX21
 mEhfAiYqOczNRDZHgXjE3l4YUOuyIZgL4CVXZ25jKsRs/GMBW0gzSIzdQ+TsSiIVQLtN3ybR1yyQl
 GArQd599H9fPX6GsuuQgmKYNAMRITlqYH5UYopiFUtntaijRXCeTHsQoxsDaK9uU6m7k=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vffMr-0006Tu-Ox; Tue, 13 Jan 2026 14:27:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2DF6B4385A;
 Tue, 13 Jan 2026 14:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C53C116C6;
 Tue, 13 Jan 2026 14:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768314443;
 bh=voYb0DywiBp6FZyvGWnVpLV+F3/B5O4eT1B8kp+Veyg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=UKOKD7zq7ZENrVufNp/hM9Mf0esyBXwtSb1sraVHk7Kuw5JckEtlSzd4ownbobJ2a
 Z6hXRiwc+r9lFFNguJyyzRISM+lnaXmTVbRwnM+g/OMPuuuDDH3+MLb2waHm+/zlZI
 XGM8HcLNIcpQWROLZPkoKCcaAsdOF0maoXn+pjHKao6g/ryZpSURBrh8k3+NHno34A
 Rhcj8av4r26P7UQZS7Ipu+vsshBmFzpjCfOuQPdiXfjb6dSx6DN201oYh/kJPONRvB
 VM4kvbs0zqDEJqHusQNNJjr4AmHBhYOcEZfs5aY4qhISBIwfaX17P5qjKtI5qLJSn6
 qFu6bkPuVOV8g==
Message-ID: <594043c04e431992f6585d7430b39cff2b770655.camel@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>, Christian Brauner
 <brauner@kernel.org>,  Amir Goldstein <amir73il@gmail.com>
Date: Tue, 13 Jan 2026 09:27:14 -0500
In-Reply-To: <5809690c-bc87-4e66-9604-3f3ee58e2902@oracle.com>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
 <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <4a38de737a64e9b32092ea1f8a25a61b33705034.camel@kernel.org>
 <5809690c-bc87-4e66-9604-3f3ee58e2902@oracle.com>
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
 Content preview:  On Tue, 2026-01-13 at 09:03 -0500, Chuck Lever wrote: > On
 1/13/26 6:45 AM, Jeff Layton wrote: > > On Tue, 2026-01-13 at 09:54 +0100,
 Christian Brauner wrote: > > > On Mon, Jan 12, 2026 at 09:50:20AM [...] 
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
X-Headers-End: 1vffMr-0006Tu-Ox
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
 Hugh Dickins <hughd@google.com>, "Matthew Wilcox
 \(Oracle\)" <willy@infradead.org>, ntfs3@lists.linux.dev,
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
 Steve French <sfrench@samba.org>, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCAyMDI2LTAxLTEzIGF0IDA5OjAzIC0wNTAwLCBDaHVjayBMZXZlciB3cm90ZToKPiBP
biAxLzEzLzI2IDY6NDUgQU0sIEplZmYgTGF5dG9uIHdyb3RlOgo+ID4gT24gVHVlLCAyMDI2LTAx
LTEzIGF0IDA5OjU0ICswMTAwLCBDaHJpc3RpYW4gQnJhdW5lciB3cm90ZToKPiA+ID4gT24gTW9u
LCBKYW4gMTIsIDIwMjYgYXQgMDk6NTA6MjBBTSAtMDUwMCwgSmVmZiBMYXl0b24gd3JvdGU6Cj4g
PiA+ID4gT24gTW9uLCAyMDI2LTAxLTEyIGF0IDA5OjMxIC0wNTAwLCBDaHVjayBMZXZlciB3cm90
ZToKPiA+ID4gPiA+IE9uIDEvMTIvMjYgODozNCBBTSwgSmVmZiBMYXl0b24gd3JvdGU6Cj4gPiA+
ID4gPiA+IE9uIEZyaSwgMjAyNi0wMS0wOSBhdCAxOTo1MiArMDEwMCwgQW1pciBHb2xkc3RlaW4g
d3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gVGh1LCBKYW4gOCwgMjAyNiBhdCA3OjU34oCvUE0gSmVm
ZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gPiA+IE9uIFRodSwgMjAyNi0wMS0wOCBhdCAxODo0MCArMDEwMCwgSmFuIEthcmEg
d3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+IE9uIFRodSAwOC0wMS0yNiAxMjoxMjo1NSwgSmVmZiBM
YXl0b24gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gWWVzdGVyZGF5LCBJIHNlbnQgcGF0Y2hl
cyB0byBmaXggaG93IGRpcmVjdG9yeSBkZWxlZ2F0aW9uIHN1cHBvcnQgaXMKPiA+ID4gPiA+ID4g
PiA+ID4gPiBoYW5kbGVkIG9uIGZpbGVzeXN0ZW1zIHdoZXJlIHRoZSBzaG91bGQgYmUgZGlzYWJs
ZWQgWzFdLiBUaGF0IHNldCBpcwo+ID4gPiA+ID4gPiA+ID4gPiA+IGFwcHJvcHJpYXRlIGZvciB2
Ni4xOS4gRm9yIHY3LjAsIEkgd2FudCB0byBtYWtlIGxlYXNlIHN1cHBvcnQgYmUgbW9yZQo+ID4g
PiA+ID4gPiA+ID4gPiA+IG9wdC1pbiwgcmF0aGVyIHRoYW4gb3B0LW91dDoKPiA+ID4gPiA+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gPiBGb3IgaGlzdG9yaWNhbCByZWFzb25zLCB3aGVu
IC0+c2V0bGVhc2UoKSBmaWxlX29wZXJhdGlvbiBpcyBzZXQgdG8gTlVMTCwKPiA+ID4gPiA+ID4g
PiA+ID4gPiB0aGUgZGVmYXVsdCBpcyB0byB1c2UgdGhlIGtlcm5lbC1pbnRlcm5hbCBsZWFzZSBp
bXBsZW1lbnRhdGlvbi4gVGhpcwo+ID4gPiA+ID4gPiA+ID4gPiA+IG1lYW5zIHRoYXQgaWYgeW91
IHdhbnQgdG8gZGlzYWJsZSB0aGVtLCB5b3UgbmVlZCB0byBleHBsaWNpdGx5IHNldCB0aGUKPiA+
ID4gPiA+ID4gPiA+ID4gPiAtPnNldGxlYXNlKCkgZmlsZV9vcGVyYXRpb24gdG8gc2ltcGxlX25v
c2V0bGVhc2UoKSBvciB0aGUgZXF1aXZhbGVudC4KPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gPiA+ID4gPiBUaGlzIGhhcyBjYXVzZWQgYSBudW1iZXIgb2YgcHJvYmxlbXMgb3ZlciB0
aGUgeWVhcnMgYXMgc29tZSBmaWxlc3lzdGVtcwo+ID4gPiA+ID4gPiA+ID4gPiA+IGhhdmUgaW5h
ZHZlcnRhbnRseSBhbGxvd2VkIGxlYXNlcyB0byBiZSBhY3F1aXJlZCBzaW1wbHkgYnkgaGF2aW5n
IGxlZnQKPiA+ID4gPiA+ID4gPiA+ID4gPiBpdCBzZXQgdG8gTlVMTC4gSXQgd291bGQgYmUgYmV0
dGVyIGlmIGZpbGVzeXN0ZW1zIGhhZCB0byBvcHQtaW4gdG8gbGVhc2UKPiA+ID4gPiA+ID4gPiA+
ID4gPiBzdXBwb3J0LCBwYXJ0aWN1bGFybHkgd2l0aCB0aGUgYWR2ZW50IG9mIGRpcmVjdG9yeSBk
ZWxlZ2F0aW9ucy4KPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gPiBUaGlz
IHNlcmllcyBoYXMgc2V0cyB0aGUgLT5zZXRsZWFzZSgpIG9wZXJhdGlvbiBpbiBhIHBpbGUgb2Yg
ZXhpc3RpbmcKPiA+ID4gPiA+ID4gPiA+ID4gPiBsb2NhbCBmaWxlc3lzdGVtcyB0byBnZW5lcmlj
X3NldGxlYXNlKCkgYW5kIHRoZW4gY2hhbmdlcwo+ID4gPiA+ID4gPiA+ID4gPiA+IGtlcm5lbF9z
ZXRsZWFzZSgpIHRvIHJldHVybiAtRUlOVkFMIHdoZW4gdGhlIHNldGxlYXNlKCkgb3BlcmF0aW9u
IGlzIG5vdAo+ID4gPiA+ID4gPiA+ID4gPiA+IHNldC4KPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gPiA+ID4gPiBXaXRoIHRoaXMgY2hhbmdlLCBuZXcgZmlsZXN5c3RlbXMgd2lsbCBu
ZWVkIHRvIGV4cGxpY2l0bHkgc2V0IHRoZQo+ID4gPiA+ID4gPiA+ID4gPiA+IC0+c2V0bGVhc2Uo
KSBvcGVyYXRpb25zIGluIG9yZGVyIHRvIHByb3ZpZGUgbGVhc2UgYW5kIGRlbGVnYXRpb24KPiA+
ID4gPiA+ID4gPiA+ID4gPiBzdXBwb3J0Lgo+ID4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4g
PiA+ID4gPiA+IEkgbWFpbmx5IGZvY3VzZWQgb24gZmlsZXN5c3RlbXMgdGhhdCBhcmUgTkZTIGV4
cG9ydGFibGUsIHNpbmNlIE5GUyBhbmQKPiA+ID4gPiA+ID4gPiA+ID4gPiBTTUIgYXJlIHRoZSBt
YWluIHVzZXJzIG9mIGZpbGUgbGVhc2VzLCBhbmQgdGhleSB0ZW5kIHRvIGVuZCB1cCBleHBvcnRp
bmcKPiA+ID4gPiA+ID4gPiA+ID4gPiB0aGUgc2FtZSBmaWxlc3lzdGVtIHR5cGVzLiBMZXQgbWUg
a25vdyBpZiBJJ3ZlIG1pc3NlZCBhbnkuCj4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+
ID4gPiBTbywgd2hhdCBhYm91dCBrZXJuZnMgYW5kIGZ1c2U/IFRoZXkgc2VlbSB0byBiZSBleHBv
cnRhYmxlIGFuZCBkb24ndCBoYXZlCj4gPiA+ID4gPiA+ID4gPiA+IC5zZXRsZWFzZSBzZXQuLi4K
PiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IFllcywg
RlVTRSBuZWVkcyB0aGlzIHRvby4gSSdsbCBhZGQgYSBwYXRjaCBmb3IgdGhhdC4KPiA+ID4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gQXMgZmFyIGFzIGtlcm5mcyBnb2VzOiBBSVVJLCB0aGF0
J3MgYmFzaWNhbGx5IHdoYXQgc3lzZnMgYW5kIHJlc2N0cmwKPiA+ID4gPiA+ID4gPiA+IGFyZSBi
dWlsdCBvbi4gRG8gd2UgcmVhbGx5IGV4cGVjdCBwZW9wbGUgdG8gc2V0IGxlYXNlcyB0aGVyZT8K
PiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gSSBndWVzcyBpdCdzIHRlY2huaWNhbGx5
IGEgcmVncmVzc2lvbiBzaW5jZSB5b3UgY291bGQgc2V0IHRoZW0gb24gdGhvc2UKPiA+ID4gPiA+
ID4gPiA+IHNvcnRzIG9mIGZpbGVzIGVhcmxpZXIsIGJ1dCBwZW9wbGUgZG9uJ3QgdXN1YWxseSBl
eHBvcnQga2VybmZzIGJhc2VkCj4gPiA+ID4gPiA+ID4gPiBmaWxlc3lzdGVtcyB2aWEgTkZTIG9y
IFNNQiwgYW5kIHRoYXQgc2VlbXMgbGlrZSBzb21ldGhpbmcgdGhhdCBjb3VsZCBiZQo+ID4gPiA+
ID4gPiA+ID4gdXNlZCB0byBtYWtlIG1pc2NoaWVmLgo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+ID4gPiBBRkFJQ1QsIGtlcm5mc19leHBvcnRfb3BzIGlzIG1vc3RseSB0byBzdXBwb3J0IG9w
ZW5fYnlfaGFuZGxlX2F0KCkuIFNlZQo+ID4gPiA+ID4gPiA+ID4gY29tbWl0IGFhODE4ODI1MzQ3
NCAoImtlcm5mczogYWRkIGV4cG9ydGZzIG9wZXJhdGlvbnMiKS4KPiA+ID4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiA+ID4gT25lIGlkZWE6IHdlIGNvdWxkIGFkZCBhIHdyYXBwZXIgYXJvdW5kIGdl
bmVyaWNfc2V0bGVhc2UoKSBmb3IKPiA+ID4gPiA+ID4gPiA+IGZpbGVzeXN0ZW1zIGxpa2UgdGhp
cyB0aGF0IHdpbGwgZG8gYSBXQVJOX09OQ0UoKSBhbmQgdGhlbiBjYWxsCj4gPiA+ID4gPiA+ID4g
PiBnZW5lcmljX3NldGxlYXNlKCkuIFRoYXQgd291bGQga2VlcCBsZWFzZXMgd29ya2luZyBvbiB0
aGVtIGJ1dCB3ZSBtaWdodAo+ID4gPiA+ID4gPiA+ID4gZ2V0IHNvbWUgcmVwb3J0cyB0aGF0IHdv
dWxkIHRlbGwgdXMgd2hvJ3Mgc2V0dGluZyBsZWFzZXMgb24gdGhlc2UgZmlsZXMKPiA+ID4gPiA+
ID4gPiA+IGFuZCB3aHkuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gSU1PLCB5b3UgYXJl
IGJlaW5nIHRvbyBjYXV0aW91cywgYnV0IHdoYXRldmVyLgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiA+IEl0IGlzIG5vdCBhY2N1cmF0ZSB0aGF0IGtlcm5mcyBmaWxlc3lzdGVtcyBhcmUgTkZT
IGV4cG9ydGFibGUgaW4gZ2VuZXJhbC4KPiA+ID4gPiA+ID4gPiBPbmx5IGNncm91cGZzIGhhcyBL
RVJORlNfUk9PVF9TVVBQT1JUX0VYUE9SVE9QLgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+
IElmIGFueSBhcHBsaWNhdGlvbiBpcyB1c2luZyBsZWFzZXMgb24gY2dyb3VwIGZpbGVzLCBpdCBt
dXN0IGJlIHNvbWUKPiA+ID4gPiA+ID4gPiB2ZXJ5IGFkdmFuY2VkIHJ1bnRpbWUgKGkuZS4gc3lz
dGVtZCksIHNvIHdlIHNob3VsZCBrbm93IGFib3V0IHRoZQo+ID4gPiA+ID4gPiA+IHJlZ3Jlc3Np
b24gc29vbmVyIHJhdGhlciB0aGFuIGxhdGVyLgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gSSB0aGluayBzbyB0b28uIEZvciBub3csIEkgdGhpbmsgSSdsbCBub3QgYm90
aGVyIHdpdGggdGhlIFdBUk5fT05DRSgpLgo+ID4gPiA+ID4gPiBMZXQncyBqdXN0IGxlYXZlIGtl
cm5mcyBvdXQgb2YgdGhlIHNldCB1bnRpbCBzb21lb25lIHByZXNlbnRzIGEgcmVhbAo+ID4gPiA+
ID4gPiB1c2UtY2FzZS4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gVGhlcmUgYXJlIGFsc28g
dGhlIHJlY2VudGx5IGFkZGVkIG5zZnMgYW5kIHBpZGZzIGV4cG9ydF9vcGVyYXRpb25zLgo+ID4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEkgaGF2ZSBhIHJlY29sbGVjdGlvbiBhYm91dCB3YW50
aW5nIHRvIGJlIGV4cGxpY2l0IGFib3V0IG5vdCBhbGxvd2luZwo+ID4gPiA+ID4gPiA+IHRob3Nl
IHRvIGJlIGV4cG9ydGFibGUgdG8gTkZTIChuc2ZzIHNwZWNpZmljYWxseSksIGJ1dCBJIGNhbid0
IHNlZSB3aGVyZQo+ID4gPiA+ID4gPiA+IGFuZCBpZiB0aGF0IHJlc3RyaWN0aW9uIHdhcyBkb25l
Lgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IENocmlzdGlhbj8gRG8geW91IHJlbWVtYmVy
Pwo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gKGNjJ2luZyBDaHVjaykK
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEZXSVcsIHlvdSBjYW4gY3VycmVudGx5IGV4cG9ydCBh
bmQgbW91bnQgL3N5cy9mcy9jZ3JvdXAgdmlhIE5GUy4gVGhlCj4gPiA+ID4gPiA+IGRpcmVjdG9y
eSBkb2Vzbid0IHNob3cgdXAgd2hlbiB5b3UgdHJ5IHRvIGdldCB0byBpdCB2aWEgTkZTdjQsIGJ1
dCB5b3UKPiA+ID4gPiA+ID4gY2FuIG1vdW50IGl0IHVzaW5nIHYzIGFuZCBSRUFERElSIHdvcmtz
LiBUaGUgZmlsZXMgYXJlIGFsbCBlbXB0eSB3aGVuCj4gPiA+ID4gPiA+IHlvdSB0cnkgdG8gcmVh
ZCB0aGVtLiBJIGRpZG4ndCB0cnkgdG8gZG8gYW55IHdyaXRlcy4KPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+IFNob3VsZCB3ZSBhZGQgYSBtZWNoYW5pc20gdG8gcHJldmVudCBleHBvcnRpbmcgdGhl
c2Ugc29ydHMgb2YKPiA+ID4gPiA+ID4gZmlsZXN5c3RlbXM/Cj4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiBFdmVuIGJldHRlciB3b3VsZCBiZSB0byBtYWtlIG5mc2QgZXhwb3J0aW5nIGV4cGxpY2l0
bHkgb3B0LWluLiBXaGF0IGlmCj4gPiA+ID4gPiA+IHdlIHdlcmUgdG8gYWRkIGEgRVhQT1JUX09Q
X05GU0QgZmxhZyB0aGF0IGV4cGxpY2l0bHkgYWxsb3dzIGZpbGVzeXN0ZW1zCj4gPiA+ID4gPiA+
IHRvIG9wdC1pbiB0byBORlMgZXhwb3J0aW5nLCBhbmQgY2hlY2sgZm9yIHRoYXQgaW4gX19maF92
ZXJpZnkoKT8gV2UnZAo+ID4gPiA+ID4gPiBoYXZlIHRvIGFkZCBpdCB0byBhIGJ1bmNoIG9mIGV4
aXN0aW5nIGZpbGVzeXN0ZW1zLCBidXQgdGhhdCdzIGZhaXJseQo+ID4gPiA+ID4gPiBzaW1wbGUg
dG8gZG8gd2l0aCBhbiBMTE0uCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFdoYXQncyB0aGUgYWN0aXZl
IGhhcm0gaW4gZXhwb3J0aW5nIC9zeXMvZnMvY2dyb3VwID8gSXQgaGFzIHRvIGJlIGRvbmUKPiA+
ID4gPiA+IGV4cGxpY2l0bHkgdmlhIC9ldGMvZXhwb3J0cywgc28gdGhpcyBpcyB1bmRlciB0aGUg
TkZTIHNlcnZlciBhZG1pbidzCj4gPiA+ID4gPiBjb250cm9sLiBJcyBpdCBhbiBhdHRhY2sgc3Vy
ZmFjZT8KPiA+ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IFBvdGVudGlhbGx5Pwo+ID4gPiA+IAo+
ID4gPiA+IEkgZG9uJ3Qgc2VlIGFueSBhY3RpdmUgaGFybSB3aXRoIGV4cG9ydGluZyBjZ3JvdXBm
cy4gSXQgZG9lc24ndCB3b3JrCj4gPiA+ID4gcmlnaHQgdmlhIG5mc2QsIGJ1dCBpdCdzIG5vdCBj
cmFzaGluZyB0aGUgYm94IG9yIGFueXRoaW5nLgo+ID4gPiA+IAo+ID4gPiA+IEF0IG9uZSB0aW1l
LCB0aG9zZSB3ZXJlIG9ubHkgZGVmaW5lZCBieSBmaWxlc3lzdGVtcyB0aGF0IHdhbnRlZCB0bwo+
ID4gPiA+IGFsbG93IE5GUyBleHBvcnQuIE5vdyB3ZSd2ZSBncm93biB0aGVtIG9uIGZpbGVzeXN0
ZW1zIHRoYXQganVzdCB3YW50IHRvCj4gPiA+ID4gcHJvdmlkZSBmaWxlaGFuZGxlcyBmb3Igb3Bl
bl9ieV9oYW5kbGVfYXQoKSBhbmQgdGhlIGxpa2UuIG5mc2QgZG9lc24ndAo+ID4gPiA+IGNhcmUg
dGhvdWdoOiBpZiB0aGUgZnMgaGFzIGV4cG9ydCBvcGVyYXRpb25zLCBpdCdsbCBoYXBwaWx5IHVz
ZSB0aGVtLgo+ID4gPiA+IAo+ID4gPiA+IEhhdmluZyBhbiBleHBsaWNpdCAiSSB3YW50IHRvIGFs
bG93IG5mc2QiIGZsYWcgc2VlIG1zIGxpa2UgaXQgbWlnaHQKPiA+ID4gPiBzYXZlIHVzIHNvbWUg
aGVhZGFjaGVzIGluIHRoZSBmdXR1cmUgd2hlbiBvdGhlciBmaWxlc3lzdGVtcyBhZGQgZXhwb3J0
Cj4gPiA+ID4gb3BzIGZvciB0aGlzIHNvcnQgb2YgZmlsZWhhbmRsZSB1c2UuCj4gPiA+IAo+ID4g
PiBTbyB3ZSBhcmUgcmUtaGFzaGluZyBhIGRpc2N1c3Npb24gd2UgaGFkIGEgZmV3IG1vbnRocyBh
Z28gKEFtaXIgd2FzCj4gPiA+IGludm9sdmVkIGF0IGxlYXN0KS4KPiA+ID4gCj4gPiAKPiA+IFll
cCwgSSB3YXMgbHVya2luZyBvbiBpdCwgYnV0IGRpZG4ndCBoYXZlIGEgbG90IG9mIGlucHV0IGF0
IHRoZSB0aW1lLgo+ID4gCj4gPiA+IEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBleHBvc2UgY2dy
b3VwZnMgdmlhIE5GUyB0aGF0J3Mgc3VwZXIgd2VpcmQuCj4gPiA+IEl0J3MgbGlrZSByZW1vdGUg
cGFydGlhbCByZXNvdXJjZSBtYW5hZ2VtZW50IGFuZCBpdCB3b3VsZCBiZSB2ZXJ5Cj4gPiA+IHN0
cmFuZ2UgaWYgYSByZW1vdGUgcHJvY2VzcyBzdWRkZW5seSB3b3VsZCBiZSBhYmxlIHRvIG1vdmUg
dGhpbmdzIGFyb3VuZAo+ID4gPiBpbiB0aGUgY2dyb3VwIHRyZWUuIFNvIEkgd291bGQgcHJlZmVy
IHRvIG5vdCBkbyB0aGlzLgo+ID4gPiAKPiA+ID4gU28gbXkgcHJlZmVyZW5jZSB3b3VsZCBiZSB0
byByZWFsbHkgc2V2ZXIgZmlsZSBoYW5kbGVzIGZyb20gdGhlIGV4cG9ydAo+ID4gPiBtZWNoYW5p
c20gc28gdGhhdCB3ZSBjYW4gYWxsb3cgc3R1ZmYgbGlrZSBwaWRmcyBhbmQgbnNmcyBhbmQgY2dy
b3VwZnMgdG8KPiA+ID4gdXNlIGZpbGUgaGFuZGxlcyB2aWEgbmFtZV90b19oYW5kbGVfYXQoKSBh
bmQgb3Blbl9ieV9oYW5kbGVfYXQoKSB3aXRob3V0Cj4gPiA+IG1ha2luZyB0aGVtIGV4cG9ydGFi
bGUuCj4gPiAKPiA+IEFncmVlZC4gSSB0aGluayB3ZSB3YW50IHRvIG1ha2UgTkZTIGV4cG9ydCBi
ZSBhIGRlbGliZXJhdGUgb3B0LWluCj4gPiBkZWNpc2lvbiB0aGF0IGZpbGVzeXN0ZW0gZGV2ZWxv
cGVycyBtYWtlLgo+IAo+IE5vIG9iamVjdGlvbiwgd2hhdCBhYm91dCBrc21iZCwgQUZTLCBvciBD
ZXBoPwo+IAoKa3NtYmQgZG9lc24ndCBoYXZlIGFueXRoaW5nIGFraW4gdG8gYW4gZXhwb3J0X29w
ZXJhdGlvbnMuIEkgdGhpbmsgaXQKcmVhbGx5IGhhcyB0byByZWx5IG9uIGFkbWlucyBnZXR0aW5n
IHRoZSBzaGFyZSBwYXRocyByaWdodCB3aGVuCmV4cG9ydGluZy4gVGhpcyBpcyBhIGJpdCBzaW1w
bGVyIHRoZXJlIHRob3VnaCBzaW5jZSBTTUIyIGRvZXNuJ3QgZGVhbAp3aXRoIGZpbGVoYW5kbGVz
LgoKQUZTIGFuZCBDZXBoIGluIHRoZSBrZXJuZWwgYXJlIGNsaWVudHMuIEFGUyBpc24ndCByZWV4
cG9ydGFibGUgdmlhIE5GUywKYnV0IENlcGggaXMuIFdlJ2xsIG5lZWQgdG8gcHJlc2VydmUgdGhh
dCBhYmlsaXR5LgotLSAKSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
