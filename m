Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E45D1FBC4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 16:26:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6QIuADu+AUijmfL3BYSdQS/bPIbD+1tPLcquo0AwX0=; b=WSrFeznNkUfsXBQceUXcIvp13X
	MpP3Fj60KTWwe1wQwvIOWhwIJMGhW7bkNHEHVyttkSlKAxF70/3swCQaDTxCILWdXy+TErqtpDmOe
	CEzSuGxZiNpdcngHuvmybU7YPQBmcaea7T9dmGJCeMvs7EMjWBsTgb19Meag1ARUeU9A=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vg2lZ-0000yo-JC;
	Wed, 14 Jan 2026 15:26:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vg2lW-0000yV-NE;
 Wed, 14 Jan 2026 15:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kvsikAIbl+cEhR2X3kc5+cU8s2nM+gaqydUds7eRyR4=; b=lAAHPWsg+7xgmzRdvmrJ6L1JoG
 r0AFllaDGRkKmeLUccQbRB6gFXEMXjepcggoZHeBZvU7Nf7Q+rknfw5VCcMtkbFuSiW4wnxeIpkdI
 +4/k29PRZQM8NHMR6XX0YxbLe/WuENvQzsYSa2cPMy8cg9IhFcsuPHZNZ/jmuM5TZTKc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kvsikAIbl+cEhR2X3kc5+cU8s2nM+gaqydUds7eRyR4=; b=MCibAZEwEqL3k9NifNjcI3hSt9
 xcJ+qSZH3gkA6IXKvmumHogF8EsFal2wPXXw3STeXqtnZYzJVjNwiQdA84IaOfOYmwbA+BcGVMRbP
 zApSaExE8NEQYi6G14V0Wc+EKr63PZGyZe8TWfD6XctcElM+10/VaW/YMMlHa8pQNLcM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vg2lV-00044g-AJ; Wed, 14 Jan 2026 15:26:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4DA7E6000A;
 Wed, 14 Jan 2026 15:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C84C4CEF7;
 Wed, 14 Jan 2026 15:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768404382;
 bh=TJ8HYpqwvKEu5WPBUCmrbZTfwhtmNo45dUDkhLnlTis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UuxL49UpINmE3bPn9I7g1qy3O1U7lEuEQBs6NY4FtevlZRrg+jir4TUf2JL5Et6S/
 Wo3Rq7erhsD0wDrAjS0fAwtu2sdM1Ly6eiM6YJ56Efjw7Aqq9ho5u2uVmIb6CLm0qm
 DbkRjtkwVuzFS/3LLXXupO+XD87WN1YxMglF8PVz6z7zZF37PIEsEJLTAjeNY90c2+
 Is57pvmqsqoUYUcAtHG3VWlWJm+iZsfwi7Dpki4E16iuG5isE531rPd5Kr9GSqblBC
 cmcig5bet6G0LrdDdcPVQ26rluu7tPoRJcI1jAeMRFhOX4YrFqzlg3FxIBJw/nlkLZ
 OyWqiHYjHhBJQ==
Date: Wed, 14 Jan 2026 16:26:03 +0100
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20260114-blamabel-hanfernte-ea1345885b46@brauner>
References: <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org>
 <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
 <aWeUv2UUJ_NdgozS@infradead.org>
 <c40862cd65a059ad45fa88f5473722ea5c5f70a5.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c40862cd65a059ad45fa88f5473722ea5c5f70a5.camel@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 14, 2026 at 08:41:16AM -0500, Jeff Layton wrote:
 > On Wed, 2026-01-14 at 05:06 -0800, Christoph Hellwig wrote: > > On Wed,
 Jan 14, 2026 at 10:34:04AM +0100, Amir Goldstein wrote: > > > On [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vg2lV-00044g-AJ
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
 Anders Larsen <al@alarsen.net>, Amir Goldstein <amir73il@gmail.com>,
 jfs-discussion@lists.sourceforge.net, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, samba-technical@lists.samba.org,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 devel@lists.orangefs.org, Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, ntfs3@lists.linux.dev,
 Christoph Hellwig <hch@infradead.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 linux-mm@kvack.org, Viacheslav Dubeyko <slava@dubeyko.com>,
 linux-btrfs@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 Carlos Maiolino <cem@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-cifs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, linux-nilfs@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
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

T24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMDg6NDE6MTZBTSAtMDUwMCwgSmVmZiBMYXl0b24gd3Jv
dGU6Cj4gT24gV2VkLCAyMDI2LTAxLTE0IGF0IDA1OjA2IC0wODAwLCBDaHJpc3RvcGggSGVsbHdp
ZyB3cm90ZToKPiA+IE9uIFdlZCwgSmFuIDE0LCAyMDI2IGF0IDEwOjM0OjA0QU0gKzAxMDAsIEFt
aXIgR29sZHN0ZWluIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEphbiAxNCwgMjAyNiBhdCA3OjI44oCv
QU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+ID4gPiAK
PiA+ID4gPiBPbiBUdWUsIEphbiAxMywgMjAyNiBhdCAxMjowNjo0MlBNIC0wNTAwLCBKZWZmIExh
eXRvbiB3cm90ZToKPiA+ID4gPiA+IEZhaXIgcG9pbnQsIGJ1dCBpdCdzIG5vdCB0aGF0IGhhcmQg
dG8gY29uY2VpdmUgb2YgYSBzaXR1YXRpb24gd2hlcmUKPiA+ID4gPiA+IHNvbWVvbmUgaW5hZHZl
cnRhbnRseSBleHBvcnRzIGNncm91cGZzIG9yIHNvbWUgc2ltaWxhciBmaWxlc3lzdGVtOgo+ID4g
PiA+IAo+ID4gPiA+IFN1cmUuICBCdXQgaG93IGlzIHRoaXMgd29yc2UgdGhhbiBhY2NpZGVudGFs
bHkgZXhwb3J0aW5nIHByaXZhdGUgZGF0YQo+ID4gPiA+IG9yIGFueSBvdGhlciBtaXNjb25maWd1
cmF0aW9uPwo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gTXkgUE9WIGlzIHRoYXQgaXQgaXMgbGVzcyBh
Ym91dCBzZWN1cml0eSAoYXMgeW91ciBxdWVzdGlvbiBpbXBsaWVzKSwgYW5kCj4gPiA+IG1vcmUg
YWJvdXQgY29ycmVjdG5lc3MuCj4gPiAKPiA+IEkgd2FzIGp1c3QgcmVwbHlpbmcgdG8gSmVmZi4K
PiA+IAo+ID4gPiBUaGUgc3BlY2lhbCB0aGluZyBhYm91dCBORlMgZXhwb3J0LCBhcyBvcHBvc2Vk
IHRvLCBzYXksIGtzbWJkLCBpcwo+ID4gPiBvcGVuIGJ5IGZpbGUgaGFuZGxlLCBJT1csIHRoZSBl
eHBvcnRfb3BlcmF0aW9ucy4KPiA+ID4gCj4gPiA+IEkgcGVyY2VpdmUgdGhpcyBhcyBhIHZlcnkg
c3RyYW5nZSBhbmQgdW5kZXNpcmVkIHNpdHVhdGlvbiB3aGVuIE5GUwo+ID4gPiBmaWxlIGhhbmRs
ZXMgZG8gbm90IGJlaGF2ZSBhcyBwZXJzaXN0ZW50IGZpbGUgaGFuZGxlcy4KPiA+IAo+ID4gVGhh
dCBpcyBub3QganVzdCB2ZXJ5IHN0cmFuZ2UsIGJ1dCBhY3R1YWxseSBicm9rZW4gKGRpc2NvdW50
aW5nIHRoZQo+ID4gb2JzY3VyZSB2b2xhdGlsZSBmaWxlIGhhbmRsZXMgZmVhdHVyZXMgbm90IGlt
cGxlbWVudGVkIGluIExpbnV4IE5GUwo+ID4gYW5kIE5GU0QpLiAgQW5kIHRoZSBleHBvcnQgb3Bz
IGFsd2F5cyB3b3JrZWQgdW5kZXIgdGhlIGFzc3VtcHRpb24KPiA+IHRoYXQgdGhlc2UgZmlsZSBo
YW5kbGVzIGFyZSBpbmRlZWQgcGVyc2lzdGVudC4gIElmIHRoZXkncmUgbm90IHdlCj4gPiBkbyBo
YXZlIGEgcHJvYmxlbS4KPiA+IAo+ID4gPiAKPiA+ID4gY2dyb3VwZnMsIHBpZGZzLCBuc2ZzLCBh
bGwgZ2FpbmVkIG9wZW5fYnlfaGFuZGxlX2F0KCkgY2FwYWJpbGl0eSBmb3IKPiA+ID4gYSBrbm93
biByZWFzb24sIHdoaWNoIHdhcyBOT1QgTkZTIGV4cG9ydC4KPiA+ID4gCj4gPiA+IElmIHRoZSBh
dXRob3Igb2Ygb3Blbl9ieV9oYW5kbGVfYXQoKSBzdXBwb3J0IChpLmUuIGJyYXVuZXIpIGRvZXMg
bm90Cj4gPiA+IHdpc2ggdG8gaW1wbHkgdGhhdCB0aG9zZSBmcyBzaG91bGQgYmUgZXhwb3J0ZWQg
dG8gTkZTLCB3aHkgb2JqZWN0Pwo+ID4gCj4gPiBCZWNhdXNlICJ3YW50IHRvIGV4cG9ydCIgaXMg
YSBzdHVwaWQgY2F0ZWdvcnkuCj4gPiAKPiA+IE9UT0ggIk5GUyBleHBvcnRpbmcgZG9lc24ndCBh
Y3R1YWxseSBwcm9wZXJseSB3b3JrIGJlY2F1c2Ugc29tZW9uZQo+ID4gb3ZlcmxvYWRlZCBleHBv
cnRfb3BzIHdpdGggZGlmZmVyZW50IHNlbWFudGljcyIgaXMgYSB2YWxpZCBjYXRlZ29yeS4KPiA+
IAo+IAo+IGNncm91cGZzIGRlZmluaXRlbHkgZG9lc24ndCBiZWhhdmUgYXMgZXhwZWN0ZWQgd2hl
biBleHBvcnRlZCB2aWEgTkZTLgo+IFRoZSBmaWxlcyBhcmVuJ3QgcmVhZGFibGUsIGF0IGxlYXN0
LiBJJ2QgYWxzbyBiZSBzdXJwcmlzZWQgaWYgdGhlCj4gZmlsZWhhbmRsZXMgd2VyZSBzdGFibGUg
YWNyb3NzIGEgcmVib290LCB3aGljaCBpcyBzb3J0IG9mIG5lY2Vzc2FyeSBmb3IKClRoZXkgYXJl
bid0IGFuZCBpdCdzIG5vdCBkZXNpcmFibGUuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
