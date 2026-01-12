Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ABED12D5F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 14:35:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:Date:To:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yw1Dow2RVc31ETYgoP25CaxRUE12ygp4wstP77pf3gI=; b=GJ6YTPCHc/mTDkTsJQjcvS27UB
	8XJGraeTf7Aa0GMnM37tS8xDQOVBMkPxZAUnpkFSp+ZBIfje25N20NVKCtFp6D/CEZxupZSajVJm5
	TPT0c0j1l3kMul7Ez1FafUfIG/mOifQh9/gUCABFT7pPhu5YY5HRi+ViSkXKPN3NdCkI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfI4N-0005io-SK;
	Mon, 12 Jan 2026 13:34:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vfI4L-0005iZ-PW;
 Mon, 12 Jan 2026 13:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2IWjz6hy9QWDfK8PS9oJROunKPChMHL7qfV31VPVLc4=; b=RzB+ehsOzhqwaqJieyo4w/eaAv
 U2W7e5YaJHDimrNhjTnrY0X42T3hvP31e57/v6lS52z2nO3fvdaabUTYmr1Jsj2Q5yDb2VOB7+K94
 h9QRXs2/55brsr/r11WBiGWZioyqzifppYefiGXdIM3nvvdpzC10XhqERYncI0n7ZQy8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2IWjz6hy9QWDfK8PS9oJROunKPChMHL7qfV31VPVLc4=; b=kDe/SAGYoQc4xm0XoVoapMs/g5
 YXML/aUvj4bVnYY8EgAZ589LcC8EFWmrW29/1KMPlrfGWxdg47i6Hr+v1ChqCOnfO6Zq78xU7ffRJ
 T7NZuY7jQs8+ielcNOYdTgC3cyxWxsP6sbjwJS0tx+ZLQcfi5sudRWlCyEGxDcm1Txaw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfI4L-0004kk-7S; Mon, 12 Jan 2026 13:34:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6033543A6E;
 Mon, 12 Jan 2026 13:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B799C16AAE;
 Mon, 12 Jan 2026 13:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768224882;
 bh=2IWjz6hy9QWDfK8PS9oJROunKPChMHL7qfV31VPVLc4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Eub6fteqKg51fUIyfYVPjfhq/dGe6jfgS3PHv2l7MuA2WDBxKZKxgFa5iRUXrerE4
 NCDfR5WTUYhS8J67WAWAmkd7wi8z2WBr/unFGD/j9A3HRlgZuYFxhDYeqpg/Y1bU6/
 SVT4kUxc50g2D5vpTAtyIVlTS+as0gFRzWLZ02UbzUZeSu6J5eEbhGiEYd3lon2fp0
 KkfaggLwX518zDD6XsrnqOlVeAdN0tJub+uJ3Abtv1Ckas/zTj5F1B2IkOKkCZ6Z03
 RX8UGZkCCS9waUpnYfWVYwZWgUGVolplz9DFfjeEDAvXKx21pciDOX3tlhE3yfdLJM
 xsxcPK1mHfrww==
Message-ID: <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
To: Amir Goldstein <amir73il@gmail.com>, Christian Brauner
 <brauner@kernel.org>,  Chuck Lever <chuck.lever@oracle.com>
Date: Mon, 12 Jan 2026 08:34:33 -0500
In-Reply-To: <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
 <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
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
 Content preview:  On Fri, 2026-01-09 at 19:52 +0100, Amir Goldstein wrote: >
 On Thu, Jan 8, 2026 at 7:57 PM Jeff Layton <jlayton@kernel.org> wrote: >
 > > > On Thu, 2026-01-08 at 18:40 +0100, Jan Kara wrote: > > > On Th [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfI4L-0004kk-7S
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

T24gRnJpLCAyMDI2LTAxLTA5IGF0IDE5OjUyICswMTAwLCBBbWlyIEdvbGRzdGVpbiB3cm90ZToK
PiBPbiBUaHUsIEphbiA4LCAyMDI2IGF0IDc6NTfigK9QTSBKZWZmIExheXRvbiA8amxheXRvbkBr
ZXJuZWwub3JnPiB3cm90ZToKPiA+IAo+ID4gT24gVGh1LCAyMDI2LTAxLTA4IGF0IDE4OjQwICsw
MTAwLCBKYW4gS2FyYSB3cm90ZToKPiA+ID4gT24gVGh1IDA4LTAxLTI2IDEyOjEyOjU1LCBKZWZm
IExheXRvbiB3cm90ZToKPiA+ID4gPiBZZXN0ZXJkYXksIEkgc2VudCBwYXRjaGVzIHRvIGZpeCBo
b3cgZGlyZWN0b3J5IGRlbGVnYXRpb24gc3VwcG9ydCBpcwo+ID4gPiA+IGhhbmRsZWQgb24gZmls
ZXN5c3RlbXMgd2hlcmUgdGhlIHNob3VsZCBiZSBkaXNhYmxlZCBbMV0uIFRoYXQgc2V0IGlzCj4g
PiA+ID4gYXBwcm9wcmlhdGUgZm9yIHY2LjE5LiBGb3IgdjcuMCwgSSB3YW50IHRvIG1ha2UgbGVh
c2Ugc3VwcG9ydCBiZSBtb3JlCj4gPiA+ID4gb3B0LWluLCByYXRoZXIgdGhhbiBvcHQtb3V0Ogo+
ID4gPiA+IAo+ID4gPiA+IEZvciBoaXN0b3JpY2FsIHJlYXNvbnMsIHdoZW4gLT5zZXRsZWFzZSgp
IGZpbGVfb3BlcmF0aW9uIGlzIHNldCB0byBOVUxMLAo+ID4gPiA+IHRoZSBkZWZhdWx0IGlzIHRv
IHVzZSB0aGUga2VybmVsLWludGVybmFsIGxlYXNlIGltcGxlbWVudGF0aW9uLiBUaGlzCj4gPiA+
ID4gbWVhbnMgdGhhdCBpZiB5b3Ugd2FudCB0byBkaXNhYmxlIHRoZW0sIHlvdSBuZWVkIHRvIGV4
cGxpY2l0bHkgc2V0IHRoZQo+ID4gPiA+IC0+c2V0bGVhc2UoKSBmaWxlX29wZXJhdGlvbiB0byBz
aW1wbGVfbm9zZXRsZWFzZSgpIG9yIHRoZSBlcXVpdmFsZW50Lgo+ID4gPiA+IAo+ID4gPiA+IFRo
aXMgaGFzIGNhdXNlZCBhIG51bWJlciBvZiBwcm9ibGVtcyBvdmVyIHRoZSB5ZWFycyBhcyBzb21l
IGZpbGVzeXN0ZW1zCj4gPiA+ID4gaGF2ZSBpbmFkdmVydGFudGx5IGFsbG93ZWQgbGVhc2VzIHRv
IGJlIGFjcXVpcmVkIHNpbXBseSBieSBoYXZpbmcgbGVmdAo+ID4gPiA+IGl0IHNldCB0byBOVUxM
LiBJdCB3b3VsZCBiZSBiZXR0ZXIgaWYgZmlsZXN5c3RlbXMgaGFkIHRvIG9wdC1pbiB0byBsZWFz
ZQo+ID4gPiA+IHN1cHBvcnQsIHBhcnRpY3VsYXJseSB3aXRoIHRoZSBhZHZlbnQgb2YgZGlyZWN0
b3J5IGRlbGVnYXRpb25zLgo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgc2VyaWVzIGhhcyBzZXRzIHRo
ZSAtPnNldGxlYXNlKCkgb3BlcmF0aW9uIGluIGEgcGlsZSBvZiBleGlzdGluZwo+ID4gPiA+IGxv
Y2FsIGZpbGVzeXN0ZW1zIHRvIGdlbmVyaWNfc2V0bGVhc2UoKSBhbmQgdGhlbiBjaGFuZ2VzCj4g
PiA+ID4ga2VybmVsX3NldGxlYXNlKCkgdG8gcmV0dXJuIC1FSU5WQUwgd2hlbiB0aGUgc2V0bGVh
c2UoKSBvcGVyYXRpb24gaXMgbm90Cj4gPiA+ID4gc2V0Lgo+ID4gPiA+IAo+ID4gPiA+IFdpdGgg
dGhpcyBjaGFuZ2UsIG5ldyBmaWxlc3lzdGVtcyB3aWxsIG5lZWQgdG8gZXhwbGljaXRseSBzZXQg
dGhlCj4gPiA+ID4gLT5zZXRsZWFzZSgpIG9wZXJhdGlvbnMgaW4gb3JkZXIgdG8gcHJvdmlkZSBs
ZWFzZSBhbmQgZGVsZWdhdGlvbgo+ID4gPiA+IHN1cHBvcnQuCj4gPiA+ID4gCj4gPiA+ID4gSSBt
YWlubHkgZm9jdXNlZCBvbiBmaWxlc3lzdGVtcyB0aGF0IGFyZSBORlMgZXhwb3J0YWJsZSwgc2lu
Y2UgTkZTIGFuZAo+ID4gPiA+IFNNQiBhcmUgdGhlIG1haW4gdXNlcnMgb2YgZmlsZSBsZWFzZXMs
IGFuZCB0aGV5IHRlbmQgdG8gZW5kIHVwIGV4cG9ydGluZwo+ID4gPiA+IHRoZSBzYW1lIGZpbGVz
eXN0ZW0gdHlwZXMuIExldCBtZSBrbm93IGlmIEkndmUgbWlzc2VkIGFueS4KPiA+ID4gCj4gPiA+
IFNvLCB3aGF0IGFib3V0IGtlcm5mcyBhbmQgZnVzZT8gVGhleSBzZWVtIHRvIGJlIGV4cG9ydGFi
bGUgYW5kIGRvbid0IGhhdmUKPiA+ID4gLnNldGxlYXNlIHNldC4uLgo+ID4gPiAKPiA+IAo+ID4g
WWVzLCBGVVNFIG5lZWRzIHRoaXMgdG9vLiBJJ2xsIGFkZCBhIHBhdGNoIGZvciB0aGF0Lgo+ID4g
Cj4gPiBBcyBmYXIgYXMga2VybmZzIGdvZXM6IEFJVUksIHRoYXQncyBiYXNpY2FsbHkgd2hhdCBz
eXNmcyBhbmQgcmVzY3RybAo+ID4gYXJlIGJ1aWx0IG9uLiBEbyB3ZSByZWFsbHkgZXhwZWN0IHBl
b3BsZSB0byBzZXQgbGVhc2VzIHRoZXJlPwo+ID4gCj4gPiBJIGd1ZXNzIGl0J3MgdGVjaG5pY2Fs
bHkgYSByZWdyZXNzaW9uIHNpbmNlIHlvdSBjb3VsZCBzZXQgdGhlbSBvbiB0aG9zZQo+ID4gc29y
dHMgb2YgZmlsZXMgZWFybGllciwgYnV0IHBlb3BsZSBkb24ndCB1c3VhbGx5IGV4cG9ydCBrZXJu
ZnMgYmFzZWQKPiA+IGZpbGVzeXN0ZW1zIHZpYSBORlMgb3IgU01CLCBhbmQgdGhhdCBzZWVtcyBs
aWtlIHNvbWV0aGluZyB0aGF0IGNvdWxkIGJlCj4gPiB1c2VkIHRvIG1ha2UgbWlzY2hpZWYuCj4g
PiAKPiA+IEFGQUlDVCwga2VybmZzX2V4cG9ydF9vcHMgaXMgbW9zdGx5IHRvIHN1cHBvcnQgb3Bl
bl9ieV9oYW5kbGVfYXQoKS4gU2VlCj4gPiBjb21taXQgYWE4MTg4MjUzNDc0ICgia2VybmZzOiBh
ZGQgZXhwb3J0ZnMgb3BlcmF0aW9ucyIpLgo+ID4gCj4gPiBPbmUgaWRlYTogd2UgY291bGQgYWRk
IGEgd3JhcHBlciBhcm91bmQgZ2VuZXJpY19zZXRsZWFzZSgpIGZvcgo+ID4gZmlsZXN5c3RlbXMg
bGlrZSB0aGlzIHRoYXQgd2lsbCBkbyBhIFdBUk5fT05DRSgpIGFuZCB0aGVuIGNhbGwKPiA+IGdl
bmVyaWNfc2V0bGVhc2UoKS4gVGhhdCB3b3VsZCBrZWVwIGxlYXNlcyB3b3JraW5nIG9uIHRoZW0g
YnV0IHdlIG1pZ2h0Cj4gPiBnZXQgc29tZSByZXBvcnRzIHRoYXQgd291bGQgdGVsbCB1cyB3aG8n
cyBzZXR0aW5nIGxlYXNlcyBvbiB0aGVzZSBmaWxlcwo+ID4gYW5kIHdoeS4KPiAKPiBJTU8sIHlv
dSBhcmUgYmVpbmcgdG9vIGNhdXRpb3VzLCBidXQgd2hhdGV2ZXIuCj4gCj4gSXQgaXMgbm90IGFj
Y3VyYXRlIHRoYXQga2VybmZzIGZpbGVzeXN0ZW1zIGFyZSBORlMgZXhwb3J0YWJsZSBpbiBnZW5l
cmFsLgo+IE9ubHkgY2dyb3VwZnMgaGFzIEtFUk5GU19ST09UX1NVUFBPUlRfRVhQT1JUT1AuCj4g
Cj4gSWYgYW55IGFwcGxpY2F0aW9uIGlzIHVzaW5nIGxlYXNlcyBvbiBjZ3JvdXAgZmlsZXMsIGl0
IG11c3QgYmUgc29tZQo+IHZlcnkgYWR2YW5jZWQgcnVudGltZSAoaS5lLiBzeXN0ZW1kKSwgc28g
d2Ugc2hvdWxkIGtub3cgYWJvdXQgdGhlCj4gcmVncmVzc2lvbiBzb29uZXIgcmF0aGVyIHRoYW4g
bGF0ZXIuCj4gCgpJIHRoaW5rIHNvIHRvby4gRm9yIG5vdywgSSB0aGluayBJJ2xsIG5vdCBib3Ro
ZXIgd2l0aCB0aGUgV0FSTl9PTkNFKCkuCkxldCdzIGp1c3QgbGVhdmUga2VybmZzIG91dCBvZiB0
aGUgc2V0IHVudGlsIHNvbWVvbmUgcHJlc2VudHMgYSByZWFsCnVzZS1jYXNlLgoKPiBUaGVyZSBh
cmUgYWxzbyB0aGUgcmVjZW50bHkgYWRkZWQgbnNmcyBhbmQgcGlkZnMgZXhwb3J0X29wZXJhdGlv
bnMuCj4gCj4gSSBoYXZlIGEgcmVjb2xsZWN0aW9uIGFib3V0IHdhbnRpbmcgdG8gYmUgZXhwbGlj
aXQgYWJvdXQgbm90IGFsbG93aW5nCj4gdGhvc2UgdG8gYmUgZXhwb3J0YWJsZSB0byBORlMgKG5z
ZnMgc3BlY2lmaWNhbGx5KSwgYnV0IEkgY2FuJ3Qgc2VlIHdoZXJlCj4gYW5kIGlmIHRoYXQgcmVz
dHJpY3Rpb24gd2FzIGRvbmUuCj4gCj4gQ2hyaXN0aWFuPyBEbyB5b3UgcmVtZW1iZXI/Cj4gCgoo
Y2MnaW5nIENodWNrKQoKRldJVywgeW91IGNhbiBjdXJyZW50bHkgZXhwb3J0IGFuZCBtb3VudCAv
c3lzL2ZzL2Nncm91cCB2aWEgTkZTLiBUaGUKZGlyZWN0b3J5IGRvZXNuJ3Qgc2hvdyB1cCB3aGVu
IHlvdSB0cnkgdG8gZ2V0IHRvIGl0IHZpYSBORlN2NCwgYnV0IHlvdQpjYW4gbW91bnQgaXQgdXNp
bmcgdjMgYW5kIFJFQURESVIgd29ya3MuIFRoZSBmaWxlcyBhcmUgYWxsIGVtcHR5IHdoZW4KeW91
IHRyeSB0byByZWFkIHRoZW0uIEkgZGlkbid0IHRyeSB0byBkbyBhbnkgd3JpdGVzLgoKU2hvdWxk
IHdlIGFkZCBhIG1lY2hhbmlzbSB0byBwcmV2ZW50IGV4cG9ydGluZyB0aGVzZSBzb3J0cyBvZgpm
aWxlc3lzdGVtcz8KCkV2ZW4gYmV0dGVyIHdvdWxkIGJlIHRvIG1ha2UgbmZzZCBleHBvcnRpbmcg
ZXhwbGljaXRseSBvcHQtaW4uIFdoYXQgaWYKd2Ugd2VyZSB0byBhZGQgYSBFWFBPUlRfT1BfTkZT
RCBmbGFnIHRoYXQgZXhwbGljaXRseSBhbGxvd3MgZmlsZXN5c3RlbXMKdG8gb3B0LWluIHRvIE5G
UyBleHBvcnRpbmcsIGFuZCBjaGVjayBmb3IgdGhhdCBpbiBfX2ZoX3ZlcmlmeSgpPyBXZSdkCmhh
dmUgdG8gYWRkIGl0IHRvIGEgYnVuY2ggb2YgZXhpc3RpbmcgZmlsZXN5c3RlbXMsIGJ1dCB0aGF0
J3MgZmFpcmx5CnNpbXBsZSB0byBkbyB3aXRoIGFuIExMTS4KLS0gCkplZmYgTGF5dG9uIDxqbGF5
dG9uQGtlcm5lbC5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
