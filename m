Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD8D19ADA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 16:00:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:Date:To:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jOg7iUrG8MBKvAUCfCN1ir0KxhNWuPtXN5Z/jeLn7g=; b=OalquWlJ6Nb7t2BuRbY5W8YuqD
	yIqjbXsJmVULwLxLQWHmvpvTfB/XsBH8ABj/KWAoXqJ/iQhDBecya8yq5ADc46FQ7BnQ4IJsRvIDM
	pIDyCc0CIDp/qBf1yT+H5EurAp7A9rs8ZGyQe1O0y5hZ6IoJ9I2wKEaIp0sgelaAqVmQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vffsj-0000C2-Kk;
	Tue, 13 Jan 2026 15:00:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vffsi-0000Bh-78;
 Tue, 13 Jan 2026 15:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iqWo6XEBsTZmTB1GOpVznVxe8jSHbPoaeo5HEoVAzxQ=; b=NUb84N9cm2huqJkNzfi8jBpsVB
 S8i1xImG1qSvlxONpPncm0vh2bOhVjhbiCB8apENfGsU5egRLYBxiwuihHBHtYhH1ywun+Aq+Ykvj
 J1+VdxWDrWCSXNLgVVcxBbkAs1sVBEhlGenzjYIy6T4dNMEHX2c+NZp0/LR58rc2SffA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iqWo6XEBsTZmTB1GOpVznVxe8jSHbPoaeo5HEoVAzxQ=; b=jAELfgDaPjjYvodhwTp7URuEEC
 QAxoSQSKjZL5zWILVTR2fyUR2b15r7Frxrp6r8Cwj8mk3lnu2VnrUqAXsBfaSgvDrlqXJr2FrgeUM
 wyonx6xkn7I/d90xOfw2uJEo/JkbkOPTM2xlmBW0C7aPjyqYe9YdtIAMc+uenfoNdGtY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vffsi-0008OW-1H; Tue, 13 Jan 2026 15:00:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1ED8544418;
 Tue, 13 Jan 2026 15:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C16CC4AF09;
 Tue, 13 Jan 2026 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768316422;
 bh=iqWo6XEBsTZmTB1GOpVznVxe8jSHbPoaeo5HEoVAzxQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Pti0579HtFWYiAekfRrKZQ06MXyTIIC1VoaIre/RaYMenLYb6j3rZgotfcylsoPkd
 +ThgsuvbmIi4xeo3BvoDpfqvBXFg02zNJrj0BC9QOnvFKj0eLJRCKiNP3rCjfbpFXd
 NcfQUmK0lTtPk1P2ZIhMNOkd3StSdcmExinQbOdWBQiREITV8EHyb4zzGu7pv28pm2
 uHa89YkcQW1qJuHvZMRDCJ0ZOCaZ96u05hwYlf+n/Xmz0WtQpALJYgdDBOq/DrcY43
 vd2eIifKUSzTmiPkzKXFo4FX7lTchVyy6zQFWYovMyD1fe6lfdPCr61A9mAoRKIavw
 TynH6bW50mkMQ==
Message-ID: <0fa7b8f75104cb7c6c2df96bd763705b399e05dd.camel@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>, Christian Brauner
 <brauner@kernel.org>,  Amir Goldstein <amir73il@gmail.com>
Date: Tue, 13 Jan 2026 10:00:13 -0500
In-Reply-To: <78a5971a-822b-4eb4-9c3d-9c1011c5b479@oracle.com>
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
 <594043c04e431992f6585d7430b39cff2b770655.camel@kernel.org>
 <78a5971a-822b-4eb4-9c3d-9c1011c5b479@oracle.com>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 2026-01-13 at 09:31 -0500, Chuck Lever wrote: > On
 1/13/26 9:27 AM, Jeff Layton wrote: > > On Tue, 2026-01-13 at 09:03 -0500,
 Chuck Lever wrote: > > > On 1/13/26 6:45 AM, Jeff Layton wrote: > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vffsi-0008OW-1H
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

T24gVHVlLCAyMDI2LTAxLTEzIGF0IDA5OjMxIC0wNTAwLCBDaHVjayBMZXZlciB3cm90ZToKPiBP
biAxLzEzLzI2IDk6MjcgQU0sIEplZmYgTGF5dG9uIHdyb3RlOgo+ID4gT24gVHVlLCAyMDI2LTAx
LTEzIGF0IDA5OjAzIC0wNTAwLCBDaHVjayBMZXZlciB3cm90ZToKPiA+ID4gT24gMS8xMy8yNiA2
OjQ1IEFNLCBKZWZmIExheXRvbiB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIDIwMjYtMDEtMTMgYXQg
MDk6NTQgKzAxMDAsIENocmlzdGlhbiBCcmF1bmVyIHdyb3RlOgo+ID4gPiA+ID4gT24gTW9uLCBK
YW4gMTIsIDIwMjYgYXQgMDk6NTA6MjBBTSAtMDUwMCwgSmVmZiBMYXl0b24gd3JvdGU6Cj4gPiA+
ID4gPiA+IE9uIE1vbiwgMjAyNi0wMS0xMiBhdCAwOTozMSAtMDUwMCwgQ2h1Y2sgTGV2ZXIgd3Jv
dGU6Cj4gPiA+ID4gPiA+ID4gT24gMS8xMi8yNiA4OjM0IEFNLCBKZWZmIExheXRvbiB3cm90ZToK
PiA+ID4gPiA+ID4gPiA+IE9uIEZyaSwgMjAyNi0wMS0wOSBhdCAxOTo1MiArMDEwMCwgQW1pciBH
b2xkc3RlaW4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+IE9uIFRodSwgSmFuIDgsIDIwMjYgYXQg
Nzo1N+KAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+
ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiA+IE9uIFRodSwgMjAyNi0wMS0wOCBhdCAx
ODo0MCArMDEwMCwgSmFuIEthcmEgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBPbiBUaHUg
MDgtMDEtMjYgMTI6MTI6NTUsIEplZmYgTGF5dG9uIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gPiBZZXN0ZXJkYXksIEkgc2VudCBwYXRjaGVzIHRvIGZpeCBob3cgZGlyZWN0b3J5IGRlbGVn
YXRpb24gc3VwcG9ydCBpcwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBoYW5kbGVkIG9uIGZpbGVz
eXN0ZW1zIHdoZXJlIHRoZSBzaG91bGQgYmUgZGlzYWJsZWQgWzFdLiBUaGF0IHNldCBpcwo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiBhcHByb3ByaWF0ZSBmb3IgdjYuMTkuIEZvciB2Ny4wLCBJIHdh
bnQgdG8gbWFrZSBsZWFzZSBzdXBwb3J0IGJlIG1vcmUKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
b3B0LWluLCByYXRoZXIgdGhhbiBvcHQtb3V0Ogo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gRm9yIGhpc3RvcmljYWwgcmVhc29ucywgd2hlbiAtPnNldGxl
YXNlKCkgZmlsZV9vcGVyYXRpb24gaXMgc2V0IHRvIE5VTEwsCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+IHRoZSBkZWZhdWx0IGlzIHRvIHVzZSB0aGUga2VybmVsLWludGVybmFsIGxlYXNlIGltcGxl
bWVudGF0aW9uLiBUaGlzCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IG1lYW5zIHRoYXQgaWYgeW91
IHdhbnQgdG8gZGlzYWJsZSB0aGVtLCB5b3UgbmVlZCB0byBleHBsaWNpdGx5IHNldCB0aGUKPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gLT5zZXRsZWFzZSgpIGZpbGVfb3BlcmF0aW9uIHRvIHNpbXBs
ZV9ub3NldGxlYXNlKCkgb3IgdGhlIGVxdWl2YWxlbnQuCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIGhhcyBjYXVzZWQgYSBudW1iZXIgb2YgcHJv
YmxlbXMgb3ZlciB0aGUgeWVhcnMgYXMgc29tZSBmaWxlc3lzdGVtcwo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiBoYXZlIGluYWR2ZXJ0YW50bHkgYWxsb3dlZCBsZWFzZXMgdG8gYmUgYWNxdWlyZWQg
c2ltcGx5IGJ5IGhhdmluZyBsZWZ0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGl0IHNldCB0byBO
VUxMLiBJdCB3b3VsZCBiZSBiZXR0ZXIgaWYgZmlsZXN5c3RlbXMgaGFkIHRvIG9wdC1pbiB0byBs
ZWFzZQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBzdXBwb3J0LCBwYXJ0aWN1bGFybHkgd2l0aCB0
aGUgYWR2ZW50IG9mIGRpcmVjdG9yeSBkZWxlZ2F0aW9ucy4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFRoaXMgc2VyaWVzIGhhcyBzZXRzIHRoZSAtPnNl
dGxlYXNlKCkgb3BlcmF0aW9uIGluIGEgcGlsZSBvZiBleGlzdGluZwo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiBsb2NhbCBmaWxlc3lzdGVtcyB0byBnZW5lcmljX3NldGxlYXNlKCkgYW5kIHRoZW4g
Y2hhbmdlcwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBrZXJuZWxfc2V0bGVhc2UoKSB0byByZXR1
cm4gLUVJTlZBTCB3aGVuIHRoZSBzZXRsZWFzZSgpIG9wZXJhdGlvbiBpcyBub3QKPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gc2V0Lgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gV2l0aCB0aGlzIGNoYW5nZSwgbmV3IGZpbGVzeXN0ZW1zIHdpbGwgbmVlZCB0
byBleHBsaWNpdGx5IHNldCB0aGUKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gLT5zZXRsZWFzZSgp
IG9wZXJhdGlvbnMgaW4gb3JkZXIgdG8gcHJvdmlkZSBsZWFzZSBhbmQgZGVsZWdhdGlvbgo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiBzdXBwb3J0Lgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gSSBtYWlubHkgZm9jdXNlZCBvbiBmaWxlc3lzdGVtcyB0aGF0
IGFyZSBORlMgZXhwb3J0YWJsZSwgc2luY2UgTkZTIGFuZAo+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
PiBTTUIgYXJlIHRoZSBtYWluIHVzZXJzIG9mIGZpbGUgbGVhc2VzLCBhbmQgdGhleSB0ZW5kIHRv
IGVuZCB1cCBleHBvcnRpbmcKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gdGhlIHNhbWUgZmlsZXN5
c3RlbSB0eXBlcy4gTGV0IG1lIGtub3cgaWYgSSd2ZSBtaXNzZWQgYW55Lgo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBTbywgd2hhdCBhYm91dCBrZXJuZnMgYW5k
IGZ1c2U/IFRoZXkgc2VlbSB0byBiZSBleHBvcnRhYmxlIGFuZCBkb24ndCBoYXZlCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiAuc2V0bGVhc2Ugc2V0Li4uCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gPiBZZXMsIEZVU0UgbmVlZHMgdGhp
cyB0b28uIEknbGwgYWRkIGEgcGF0Y2ggZm9yIHRoYXQuCj4gPiA+ID4gPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+ID4gPiA+ID4gQXMgZmFyIGFzIGtlcm5mcyBnb2VzOiBBSVVJLCB0aGF0J3MgYmFz
aWNhbGx5IHdoYXQgc3lzZnMgYW5kIHJlc2N0cmwKPiA+ID4gPiA+ID4gPiA+ID4gPiBhcmUgYnVp
bHQgb24uIERvIHdlIHJlYWxseSBleHBlY3QgcGVvcGxlIHRvIHNldCBsZWFzZXMgdGhlcmU/Cj4g
PiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4gSSBndWVzcyBpdCdzIHRlY2hu
aWNhbGx5IGEgcmVncmVzc2lvbiBzaW5jZSB5b3UgY291bGQgc2V0IHRoZW0gb24gdGhvc2UKPiA+
ID4gPiA+ID4gPiA+ID4gPiBzb3J0cyBvZiBmaWxlcyBlYXJsaWVyLCBidXQgcGVvcGxlIGRvbid0
IHVzdWFsbHkgZXhwb3J0IGtlcm5mcyBiYXNlZAo+ID4gPiA+ID4gPiA+ID4gPiA+IGZpbGVzeXN0
ZW1zIHZpYSBORlMgb3IgU01CLCBhbmQgdGhhdCBzZWVtcyBsaWtlIHNvbWV0aGluZyB0aGF0IGNv
dWxkIGJlCj4gPiA+ID4gPiA+ID4gPiA+ID4gdXNlZCB0byBtYWtlIG1pc2NoaWVmLgo+ID4gPiA+
ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiA+IEFGQUlDVCwga2VybmZzX2V4cG9ydF9v
cHMgaXMgbW9zdGx5IHRvIHN1cHBvcnQgb3Blbl9ieV9oYW5kbGVfYXQoKS4gU2VlCj4gPiA+ID4g
PiA+ID4gPiA+ID4gY29tbWl0IGFhODE4ODI1MzQ3NCAoImtlcm5mczogYWRkIGV4cG9ydGZzIG9w
ZXJhdGlvbnMiKS4KPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gPiBPbmUg
aWRlYTogd2UgY291bGQgYWRkIGEgd3JhcHBlciBhcm91bmQgZ2VuZXJpY19zZXRsZWFzZSgpIGZv
cgo+ID4gPiA+ID4gPiA+ID4gPiA+IGZpbGVzeXN0ZW1zIGxpa2UgdGhpcyB0aGF0IHdpbGwgZG8g
YSBXQVJOX09OQ0UoKSBhbmQgdGhlbiBjYWxsCj4gPiA+ID4gPiA+ID4gPiA+ID4gZ2VuZXJpY19z
ZXRsZWFzZSgpLiBUaGF0IHdvdWxkIGtlZXAgbGVhc2VzIHdvcmtpbmcgb24gdGhlbSBidXQgd2Ug
bWlnaHQKPiA+ID4gPiA+ID4gPiA+ID4gPiBnZXQgc29tZSByZXBvcnRzIHRoYXQgd291bGQgdGVs
bCB1cyB3aG8ncyBzZXR0aW5nIGxlYXNlcyBvbiB0aGVzZSBmaWxlcwo+ID4gPiA+ID4gPiA+ID4g
PiA+IGFuZCB3aHkuCj4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiBJTU8sIHlv
dSBhcmUgYmVpbmcgdG9vIGNhdXRpb3VzLCBidXQgd2hhdGV2ZXIuCj4gPiA+ID4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiA+ID4gPiBJdCBpcyBub3QgYWNjdXJhdGUgdGhhdCBrZXJuZnMgZmlsZXN5
c3RlbXMgYXJlIE5GUyBleHBvcnRhYmxlIGluIGdlbmVyYWwuCj4gPiA+ID4gPiA+ID4gPiA+IE9u
bHkgY2dyb3VwZnMgaGFzIEtFUk5GU19ST09UX1NVUFBPUlRfRVhQT1JUT1AuCj4gPiA+ID4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiBJZiBhbnkgYXBwbGljYXRpb24gaXMgdXNpbmcgbGVh
c2VzIG9uIGNncm91cCBmaWxlcywgaXQgbXVzdCBiZSBzb21lCj4gPiA+ID4gPiA+ID4gPiA+IHZl
cnkgYWR2YW5jZWQgcnVudGltZSAoaS5lLiBzeXN0ZW1kKSwgc28gd2Ugc2hvdWxkIGtub3cgYWJv
dXQgdGhlCj4gPiA+ID4gPiA+ID4gPiA+IHJlZ3Jlc3Npb24gc29vbmVyIHJhdGhlciB0aGFuIGxh
dGVyLgo+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4g
SSB0aGluayBzbyB0b28uIEZvciBub3csIEkgdGhpbmsgSSdsbCBub3QgYm90aGVyIHdpdGggdGhl
IFdBUk5fT05DRSgpLgo+ID4gPiA+ID4gPiA+ID4gTGV0J3MganVzdCBsZWF2ZSBrZXJuZnMgb3V0
IG9mIHRoZSBzZXQgdW50aWwgc29tZW9uZSBwcmVzZW50cyBhIHJlYWwKPiA+ID4gPiA+ID4gPiA+
IHVzZS1jYXNlLgo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+IFRoZXJlIGFyZSBh
bHNvIHRoZSByZWNlbnRseSBhZGRlZCBuc2ZzIGFuZCBwaWRmcyBleHBvcnRfb3BlcmF0aW9ucy4K
PiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+IEkgaGF2ZSBhIHJlY29sbGVjdGlv
biBhYm91dCB3YW50aW5nIHRvIGJlIGV4cGxpY2l0IGFib3V0IG5vdCBhbGxvd2luZwo+ID4gPiA+
ID4gPiA+ID4gPiB0aG9zZSB0byBiZSBleHBvcnRhYmxlIHRvIE5GUyAobnNmcyBzcGVjaWZpY2Fs
bHkpLCBidXQgSSBjYW4ndCBzZWUgd2hlcmUKPiA+ID4gPiA+ID4gPiA+ID4gYW5kIGlmIHRoYXQg
cmVzdHJpY3Rpb24gd2FzIGRvbmUuCj4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4g
PiBDaHJpc3RpYW4/IERvIHlvdSByZW1lbWJlcj8KPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IChjYydpbmcgQ2h1Y2spCj4gPiA+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gPiA+IEZXSVcsIHlvdSBjYW4gY3VycmVudGx5IGV4cG9ydCBhbmQgbW91bnQg
L3N5cy9mcy9jZ3JvdXAgdmlhIE5GUy4gVGhlCj4gPiA+ID4gPiA+ID4gPiBkaXJlY3RvcnkgZG9l
c24ndCBzaG93IHVwIHdoZW4geW91IHRyeSB0byBnZXQgdG8gaXQgdmlhIE5GU3Y0LCBidXQgeW91
Cj4gPiA+ID4gPiA+ID4gPiBjYW4gbW91bnQgaXQgdXNpbmcgdjMgYW5kIFJFQURESVIgd29ya3Mu
IFRoZSBmaWxlcyBhcmUgYWxsIGVtcHR5IHdoZW4KPiA+ID4gPiA+ID4gPiA+IHlvdSB0cnkgdG8g
cmVhZCB0aGVtLiBJIGRpZG4ndCB0cnkgdG8gZG8gYW55IHdyaXRlcy4KPiA+ID4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiA+ID4gU2hvdWxkIHdlIGFkZCBhIG1lY2hhbmlzbSB0byBwcmV2ZW50IGV4
cG9ydGluZyB0aGVzZSBzb3J0cyBvZgo+ID4gPiA+ID4gPiA+ID4gZmlsZXN5c3RlbXM/Cj4gPiA+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IEV2ZW4gYmV0dGVyIHdvdWxkIGJlIHRvIG1ha2Ug
bmZzZCBleHBvcnRpbmcgZXhwbGljaXRseSBvcHQtaW4uIFdoYXQgaWYKPiA+ID4gPiA+ID4gPiA+
IHdlIHdlcmUgdG8gYWRkIGEgRVhQT1JUX09QX05GU0QgZmxhZyB0aGF0IGV4cGxpY2l0bHkgYWxs
b3dzIGZpbGVzeXN0ZW1zCj4gPiA+ID4gPiA+ID4gPiB0byBvcHQtaW4gdG8gTkZTIGV4cG9ydGlu
ZywgYW5kIGNoZWNrIGZvciB0aGF0IGluIF9fZmhfdmVyaWZ5KCk/IFdlJ2QKPiA+ID4gPiA+ID4g
PiA+IGhhdmUgdG8gYWRkIGl0IHRvIGEgYnVuY2ggb2YgZXhpc3RpbmcgZmlsZXN5c3RlbXMsIGJ1
dCB0aGF0J3MgZmFpcmx5Cj4gPiA+ID4gPiA+ID4gPiBzaW1wbGUgdG8gZG8gd2l0aCBhbiBMTE0u
Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gV2hhdCdzIHRoZSBhY3RpdmUgaGFybSBpbiBl
eHBvcnRpbmcgL3N5cy9mcy9jZ3JvdXAgPyBJdCBoYXMgdG8gYmUgZG9uZQo+ID4gPiA+ID4gPiA+
IGV4cGxpY2l0bHkgdmlhIC9ldGMvZXhwb3J0cywgc28gdGhpcyBpcyB1bmRlciB0aGUgTkZTIHNl
cnZlciBhZG1pbidzCj4gPiA+ID4gPiA+ID4gY29udHJvbC4gSXMgaXQgYW4gYXR0YWNrIHN1cmZh
Y2U/Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBQb3RlbnRpYWxseT8K
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEkgZG9uJ3Qgc2VlIGFueSBhY3RpdmUgaGFybSB3aXRo
IGV4cG9ydGluZyBjZ3JvdXBmcy4gSXQgZG9lc24ndCB3b3JrCj4gPiA+ID4gPiA+IHJpZ2h0IHZp
YSBuZnNkLCBidXQgaXQncyBub3QgY3Jhc2hpbmcgdGhlIGJveCBvciBhbnl0aGluZy4KPiA+ID4g
PiA+ID4gCj4gPiA+ID4gPiA+IEF0IG9uZSB0aW1lLCB0aG9zZSB3ZXJlIG9ubHkgZGVmaW5lZCBi
eSBmaWxlc3lzdGVtcyB0aGF0IHdhbnRlZCB0bwo+ID4gPiA+ID4gPiBhbGxvdyBORlMgZXhwb3J0
LiBOb3cgd2UndmUgZ3Jvd24gdGhlbSBvbiBmaWxlc3lzdGVtcyB0aGF0IGp1c3Qgd2FudCB0bwo+
ID4gPiA+ID4gPiBwcm92aWRlIGZpbGVoYW5kbGVzIGZvciBvcGVuX2J5X2hhbmRsZV9hdCgpIGFu
ZCB0aGUgbGlrZS4gbmZzZCBkb2Vzbid0Cj4gPiA+ID4gPiA+IGNhcmUgdGhvdWdoOiBpZiB0aGUg
ZnMgaGFzIGV4cG9ydCBvcGVyYXRpb25zLCBpdCdsbCBoYXBwaWx5IHVzZSB0aGVtLgo+ID4gPiA+
ID4gPiAKPiA+ID4gPiA+ID4gSGF2aW5nIGFuIGV4cGxpY2l0ICJJIHdhbnQgdG8gYWxsb3cgbmZz
ZCIgZmxhZyBzZWUgbXMgbGlrZSBpdCBtaWdodAo+ID4gPiA+ID4gPiBzYXZlIHVzIHNvbWUgaGVh
ZGFjaGVzIGluIHRoZSBmdXR1cmUgd2hlbiBvdGhlciBmaWxlc3lzdGVtcyBhZGQgZXhwb3J0Cj4g
PiA+ID4gPiA+IG9wcyBmb3IgdGhpcyBzb3J0IG9mIGZpbGVoYW5kbGUgdXNlLgo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBTbyB3ZSBhcmUgcmUtaGFzaGluZyBhIGRpc2N1c3Npb24gd2UgaGFkIGEgZmV3
IG1vbnRocyBhZ28gKEFtaXIgd2FzCj4gPiA+ID4gPiBpbnZvbHZlZCBhdCBsZWFzdCkuCj4gPiA+
ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBZZXAsIEkgd2FzIGx1cmtpbmcgb24gaXQsIGJ1dCBkaWRu
J3QgaGF2ZSBhIGxvdCBvZiBpbnB1dCBhdCB0aGUgdGltZS4KPiA+ID4gPiAKPiA+ID4gPiA+IEkg
ZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBleHBvc2UgY2dyb3VwZnMgdmlhIE5GUyB0aGF0J3Mgc3Vw
ZXIgd2VpcmQuCj4gPiA+ID4gPiBJdCdzIGxpa2UgcmVtb3RlIHBhcnRpYWwgcmVzb3VyY2UgbWFu
YWdlbWVudCBhbmQgaXQgd291bGQgYmUgdmVyeQo+ID4gPiA+ID4gc3RyYW5nZSBpZiBhIHJlbW90
ZSBwcm9jZXNzIHN1ZGRlbmx5IHdvdWxkIGJlIGFibGUgdG8gbW92ZSB0aGluZ3MgYXJvdW5kCj4g
PiA+ID4gPiBpbiB0aGUgY2dyb3VwIHRyZWUuIFNvIEkgd291bGQgcHJlZmVyIHRvIG5vdCBkbyB0
aGlzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTbyBteSBwcmVmZXJlbmNlIHdvdWxkIGJlIHRvIHJl
YWxseSBzZXZlciBmaWxlIGhhbmRsZXMgZnJvbSB0aGUgZXhwb3J0Cj4gPiA+ID4gPiBtZWNoYW5p
c20gc28gdGhhdCB3ZSBjYW4gYWxsb3cgc3R1ZmYgbGlrZSBwaWRmcyBhbmQgbnNmcyBhbmQgY2dy
b3VwZnMgdG8KPiA+ID4gPiA+IHVzZSBmaWxlIGhhbmRsZXMgdmlhIG5hbWVfdG9faGFuZGxlX2F0
KCkgYW5kIG9wZW5fYnlfaGFuZGxlX2F0KCkgd2l0aG91dAo+ID4gPiA+ID4gbWFraW5nIHRoZW0g
ZXhwb3J0YWJsZS4KPiA+ID4gPiAKPiA+ID4gPiBBZ3JlZWQuIEkgdGhpbmsgd2Ugd2FudCB0byBt
YWtlIE5GUyBleHBvcnQgYmUgYSBkZWxpYmVyYXRlIG9wdC1pbgo+ID4gPiA+IGRlY2lzaW9uIHRo
YXQgZmlsZXN5c3RlbSBkZXZlbG9wZXJzIG1ha2UuCj4gPiA+IAo+ID4gPiBObyBvYmplY3Rpb24s
IHdoYXQgYWJvdXQga3NtYmQsIEFGUywgb3IgQ2VwaD8KPiA+ID4gCj4gPiAKPiA+IGtzbWJkIGRv
ZXNuJ3QgaGF2ZSBhbnl0aGluZyBha2luIHRvIGFuIGV4cG9ydF9vcGVyYXRpb25zLiBJIHRoaW5r
IGl0Cj4gPiByZWFsbHkgaGFzIHRvIHJlbHkgb24gYWRtaW5zIGdldHRpbmcgdGhlIHNoYXJlIHBh
dGhzIHJpZ2h0IHdoZW4KPiA+IGV4cG9ydGluZy4gVGhpcyBpcyBhIGJpdCBzaW1wbGVyIHRoZXJl
IHRob3VnaCBzaW5jZSBTTUIyIGRvZXNuJ3QgZGVhbAo+ID4gd2l0aCBmaWxlaGFuZGxlcy4KPiA+
IAo+ID4gQUZTIGFuZCBDZXBoIGluIHRoZSBrZXJuZWwgYXJlIGNsaWVudHMuIEFGUyBpc24ndCBy
ZWV4cG9ydGFibGUgdmlhIE5GUywKPiA+IGJ1dCBDZXBoIGlzLiBXZSdsbCBuZWVkIHRvIHByZXNl
cnZlIHRoYXQgYWJpbGl0eS4KPiAKPiBXZWxsIEkgdGhpbmsgbXkgcG9pbnQgaXMgdGhhdCAiaXMg
dGhpcyBmaWxlIHN5c3RlbSB0eXBlIGV4cG9ydGFibGUiCj4gbWlnaHQgYmUgb3J0aG9nb25hbCB0
byB3aGV0aGVyIHRoZSBGUyBvZmZlcnMgYSBmaWxlaGFuZGxlIGNhcGFiaWxpdHkuIElmCj4gaXQg
ZG9lc24ndCBtYWtlIHNlbnNlIHRvIGV4cG9ydCBjZ3JvdXBmcyB2aWEgTkZTLCBpdCBwcm9iYWJs
eSBhbHNvIGRvZXMKPiBub3QgbWFrZSBzZW5zZSBmb3Iga3NtYmQuIExhdGhlciwgcmluc2UsIHJl
cGVhdCBmb3Igb3RoZXIgaW4ta2VybmVsIGZpbGUKPiBzZXJ2ZXJzLgo+IAo+IFBlcmhhcHMgdGhl
ICJpc19leHBvcnRhYmxlIiBwcmVkaWNhdGUgaXMgYmV0dGVyIHBsYWNlZCBzZXBhcmF0ZWx5IGZy
b20KPiBleHBvcnRfb3BzLgo+IAoKVGhhdCdzIGEgZmFpciBwb2ludC4KCkFuIGZzdHlwZSBmbGFn
IHdvdWxkIHNlZW0gbW9zdCBuYXR1cmFsIHRoZW4uIEZvciBuZnNkLCBJIGd1ZXNzIHdlJ2QKd2Fu
dCB0byBjaGVjayBmb3IgdGhhdCBpbiBmaF9jb21wb3NlKCkgYW5kIGZoX3ZlcmlmeSgpID8KCkkg
ZG9uJ3Qga25vdyBrc21iZCB3ZWxsIGVub3VnaCB0byBrbm93IGhvdyB0aGV5IHdvdWxkIHdhbnQg
dG8gcGx1bWIgaW4KYSBjaGVjayBmb3IgdGhpcyB0aG91Z2guIE1heWJlIGF0IHRoZSBwb2ludCB3
aGVyZSB0aGV5IHJlc29sdmUKcGF0aG5hbWVzPwotLSAKSmVmZiBMYXl0b24gPGpsYXl0b25Aa2Vy
bmVsLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
