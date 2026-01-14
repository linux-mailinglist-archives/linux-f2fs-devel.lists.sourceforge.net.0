Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD8ED1FB22
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 16:20:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61CxNinRaR14PfjV4N2z5nedg/GzQbrA86GuFksyIJE=; b=lojuaArspxTfrYOalz9vqSAj2E
	nk8XSSXGYuLCmsbixbfAvMY5khIIy1KrJ+2HNBAartnzqVWdzRykjajvIPJ8Ysdc+1he5/MRc1sek
	1gcUblfBYcYMMPzvkb4pQLQaQ/V8A49m6W9rV6Pz8MMlUxh6sNfyOygyB+O4mic1CQkk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vg2ft-0001Pw-IV;
	Wed, 14 Jan 2026 15:20:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vg2fr-0001Pf-M9;
 Wed, 14 Jan 2026 15:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mM/mGj7mKtWtzR+95sdegxfPi111qb3075OeDVGNDZ4=; b=evtLI/OtuyFUufEIkkOgrtLuOc
 KqXxF+AIwnP38djpXWj6CRxaPabwBuxtyvNPsBvcyyc94LdBY9/FlNwGp/oBZv0byULzXKue3i6bK
 W9CtiSfdpwacFSmW/RoERsf/Jan00lqwCKSe6BmCWS2tiqcrsdBqVPy9OdZPDKEW+jPU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mM/mGj7mKtWtzR+95sdegxfPi111qb3075OeDVGNDZ4=; b=SX4a6F2sjfD0127Ov7B3mgikFA
 oEfGHaaUXTIqodaPWXo69IDOW27Q2T++jsV6jvTZ/mpUqSFGmFL3DbvUgqOwdCju1ejarS+lid/TX
 E6bnMJrZV+zR1sjlxr2xY4zOauEMiOHCsM3AIWgnxqlQlUl9wMvtCUHH087awuAXxGyw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vg2fr-0003lL-4K; Wed, 14 Jan 2026 15:20:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 353AC443ED;
 Wed, 14 Jan 2026 15:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C66C4CEF7;
 Wed, 14 Jan 2026 15:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768404032;
 bh=95l5NkW0A/27kpGYcRaUumPREirLPSD0h/i7bikH9bU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FqipJ8Fclg/c7qbEuyuUoO5LnexEwFkZgygpoboZW7ULcYAGY34jzrJax6uIrAgGb
 FUepiZcAjlgA0R6fvdFVWwhV9jk0Bth6JPV5psDXj3fKzojOCwDT/rEZzcVE5OnNcB
 fkG5ZlQLelxcsKpIOTgMpMe11bGcKCWvNYmxvgnzxn2ZC8L7s2dKJy1mrpvPNu7Z7A
 UqZxpjIOgw/V7XPIA/1Y2FN9yOrK13WyoEdrmVdFpCQbw6zTva9Pkh2JqEgk58ngiJ
 5S6BKkDUQrDweGrzgYJLMr/YFieOsQM7bFBSWWwVpgpU92+aZuVuBVHfvvOSCo18FZ
 sKemGEnojFw5A==
Date: Wed, 14 Jan 2026 16:20:13 +0100
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20260114-klarstellen-blamieren-0b7d40182800@brauner>
References: <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org>
 <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
 <aWeUv2UUJ_NdgozS@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWeUv2UUJ_NdgozS@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 14, 2026 at 05:06:07AM -0800, Christoph Hellwig
 wrote: > On Wed, Jan 14, 2026 at 10:34:04AM +0100, Amir Goldstein wrote:
 > > On Wed, Jan 14, 2026 at 7:28 AM Christoph Hellwig <hch@infradea [...] 
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
X-Headers-End: 1vg2fr-0003lL-4K
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
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-mm@kvack.org,
 Viacheslav Dubeyko <slava@dubeyko.com>, linux-btrfs@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, Carlos Maiolino <cem@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-doc@vger.kernel.org,
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
 Jonathan Corbet <corbet@lwn.net>, Jeff Layton <jlayton@kernel.org>,
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

T24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMDU6MDY6MDdBTSAtMDgwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMTA6MzQ6MDRBTSArMDEwMCwgQW1p
ciBHb2xkc3RlaW4gd3JvdGU6Cj4gPiBPbiBXZWQsIEphbiAxNCwgMjAyNiBhdCA3OjI44oCvQU0g
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4g
T24gVHVlLCBKYW4gMTMsIDIwMjYgYXQgMTI6MDY6NDJQTSAtMDUwMCwgSmVmZiBMYXl0b24gd3Jv
dGU6Cj4gPiA+ID4gRmFpciBwb2ludCwgYnV0IGl0J3Mgbm90IHRoYXQgaGFyZCB0byBjb25jZWl2
ZSBvZiBhIHNpdHVhdGlvbiB3aGVyZQo+ID4gPiA+IHNvbWVvbmUgaW5hZHZlcnRhbnRseSBleHBv
cnRzIGNncm91cGZzIG9yIHNvbWUgc2ltaWxhciBmaWxlc3lzdGVtOgo+ID4gPgo+ID4gPiBTdXJl
LiAgQnV0IGhvdyBpcyB0aGlzIHdvcnNlIHRoYW4gYWNjaWRlbnRhbGx5IGV4cG9ydGluZyBwcml2
YXRlIGRhdGEKPiA+ID4gb3IgYW55IG90aGVyIG1pc2NvbmZpZ3VyYXRpb24/Cj4gPiA+Cj4gPiAK
PiA+IE15IFBPViBpcyB0aGF0IGl0IGlzIGxlc3MgYWJvdXQgc2VjdXJpdHkgKGFzIHlvdXIgcXVl
c3Rpb24gaW1wbGllcyksIGFuZAo+ID4gbW9yZSBhYm91dCBjb3JyZWN0bmVzcy4KPiAKPiBJIHdh
cyBqdXN0IHJlcGx5aW5nIHRvIEplZmYuCj4gCj4gPiBUaGUgc3BlY2lhbCB0aGluZyBhYm91dCBO
RlMgZXhwb3J0LCBhcyBvcHBvc2VkIHRvLCBzYXksIGtzbWJkLCBpcwo+ID4gb3BlbiBieSBmaWxl
IGhhbmRsZSwgSU9XLCB0aGUgZXhwb3J0X29wZXJhdGlvbnMuCj4gPiAKPiA+IEkgcGVyY2VpdmUg
dGhpcyBhcyBhIHZlcnkgc3RyYW5nZSBhbmQgdW5kZXNpcmVkIHNpdHVhdGlvbiB3aGVuIE5GUwo+
ID4gZmlsZSBoYW5kbGVzIGRvIG5vdCBiZWhhdmUgYXMgcGVyc2lzdGVudCBmaWxlIGhhbmRsZXMu
Cj4gCj4gVGhhdCBpcyBub3QganVzdCB2ZXJ5IHN0cmFuZ2UsIGJ1dCBhY3R1YWxseSBicm9rZW4g
KGRpc2NvdW50aW5nIHRoZQo+IG9ic2N1cmUgdm9sYXRpbGUgZmlsZSBoYW5kbGVzIGZlYXR1cmVz
IG5vdCBpbXBsZW1lbnRlZCBpbiBMaW51eCBORlMKPiBhbmQgTkZTRCkuICBBbmQgdGhlIGV4cG9y
dCBvcHMgYWx3YXlzIHdvcmtlZCB1bmRlciB0aGUgYXNzdW1wdGlvbgo+IHRoYXQgdGhlc2UgZmls
ZSBoYW5kbGVzIGFyZSBpbmRlZWQgcGVyc2lzdGVudC4gIElmIHRoZXkncmUgbm90IHdlCj4gZG8g
aGF2ZSBhIHByb2JsZW0uCj4gCj4gPiAKPiA+IGNncm91cGZzLCBwaWRmcywgbnNmcywgYWxsIGdh
aW5lZCBvcGVuX2J5X2hhbmRsZV9hdCgpIGNhcGFiaWxpdHkgZm9yCj4gPiBhIGtub3duIHJlYXNv
biwgd2hpY2ggd2FzIE5PVCBORlMgZXhwb3J0Lgo+ID4gCj4gPiBJZiB0aGUgYXV0aG9yIG9mIG9w
ZW5fYnlfaGFuZGxlX2F0KCkgc3VwcG9ydCAoaS5lLiBicmF1bmVyKSBkb2VzIG5vdAo+ID4gd2lz
aCB0byBpbXBseSB0aGF0IHRob3NlIGZzIHNob3VsZCBiZSBleHBvcnRlZCB0byBORlMsIHdoeSBv
YmplY3Q/Cj4gCj4gQmVjYXVzZSAid2FudCB0byBleHBvcnQiIGlzIGEgc3R1cGlkIGNhdGVnb3J5
Lgo+IAo+IE9UT0ggIk5GUyBleHBvcnRpbmcgZG9lc24ndCBhY3R1YWxseSBwcm9wZXJseSB3b3Jr
IGJlY2F1c2Ugc29tZW9uZQo+IG92ZXJsb2FkZWQgZXhwb3J0X29wcyB3aXRoIGRpZmZlcmVudCBz
ZW1hbnRpY3MiIGlzIGEgdmFsaWQgY2F0ZWdvcnkuCj4gCj4gPiBXZSBjb3VsZCBoYXZlIHRoZSBv
cHQtaW4vb3V0IG9mIE5GUyBleHBvcnQgZml4ZXMgcGVyIEVYUE9SVF9PUF8KPiA+IGZsYWdzIGFu
ZCB3ZSBjb3VsZCBldmVuIHRoaW5rIG9mIGFsbG93aW5nIGFkbWluIHRvIG1ha2UgdGhpcyBkZWNp
c2lvbgo+ID4gcGVyIHZmc21vdW50IChlLmcuIGZvciBjZ3JvdXBmcykuCj4gPiAKPiA+IEluIGFu
eSBjYXNlLCBJIGZhaWwgdG8gc2VlIGhvdyBvYmplY3RpbmcgdG8gdGhlIHBvc3NpYmlsaXR5IG9m
IE5GUyBleHBvcnQKPiA+IG9wdC1vdXQgc2VydmVzIGFueW9uZS4KPiAKPiBZb3UncmUgc3RpbGwg
dGhpbmsgb2YgaXQgdGhlIHdyb25nIHdheS4gIElmIHdlIGRvIGhhdmUgZmlsZSBzeXN0ZW1zCj4g
dGhhdCBicmVhayB0aGUgb3JpZ2luYWwgZXhwb3J0ZnMgc2VtYW50aWNzIHdlIG5lZWQgdG8gZml4
IHRoYXQsIGFuZAo+IHNvbWV0aGluZyBsaWtlIGEgInN0YWJsZSBoYW5kbGVzIiBmbGFnIHdpbGwg
d29yayB3ZWxsIGZvciB0aGF0LiAgQnV0Cj4gYSB0b3RhbGx5IGFyYml0cmFyeSAiaXMgZXhwb3J0
YWJsZSIgZmxhZyBpcyB0b3RhbCBub25zZW5zZS4KCkZpbGUgaGFuZGxlcyBjYW4gbGVnaXRpbWF0
ZWx5IGJlIGNvbmNlcHR1YWxpemVkIGluZGVwZW5kZW50bHkgb2YKZXhwb3J0aW5nIGEgZmlsZXN5
c3RlbS4gSWYgd2Ugd2FudGVkIHRvIHRlYXIgdGhvc2UgY29uY2VwdHMgYXBhcnQKaW1wbGVtZW50
YXRpb24gd2lzZSB3ZSBjb3VsZC4KCkl0IGlzIGNvbXBsZXRlIG5vbnNlbnNlIHRvIGV4cGVjdCB0
aGUga2VybmVsIHRvIHN1cHBvcnQgZXhwb3J0aW5nIGFueQphcmJpdHJhcnkgaW50ZXJuYWwgZmls
ZXN5c3RlbSBvciB0byBub3Qgc3VwcG9ydCBmaWxlIGhhbmRsZXMgYXQgYWxsLgoKSG93IHRoYXQg
aXMgYWNoaWV2ZWQgaXMgY29tcGxldGVseSBpcnJlbGV2YW50IHRvIHRoYXQgY29yZSBwYXJ0IG9m
IHRoZQphcmd1bWVudC4gVGhlIHBvaW50IEplZmYgYW5kIEFtaXIgYXJlIG1ha2luZyB0aGF0IGl0
IGlzIHNlbnNpYmxlIHRvCmFsbG93IG9uZSB3aXRob3V0IHRoZSBvdGhlci4KCldoZXRoZXIgb3Ig
bm90IHNvbWUgdXNlcnNwYWNlIGNyYXAgYWxsb3dzIHlvdSB0byBhY2hpZXZlIHRoZSBzYW1lIHRo
aW5nCmlzIGVudGlyZWx5IGlycmVsZXZhbnQgYW5kIGRvZXMgbm90IGF0IGFsbCBpbXBseSB3ZSBo
YXZlIHRvIGFsbG93IHRoZQpzYW1lIGNyYXAgaW4gdGhlIGtlcm5lbC4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
