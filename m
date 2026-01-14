Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9ED1EF95
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 14:07:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4e6G4yvB9aFujZmBjNngScAo96x0pYoTed/XMh968I=; b=fcz57dkgt0BCK1lotEVFa6e1PX
	h6wKq9BYCvMkYvA8yLf5C0eUCjKD4IzdrB6ykuWWsjYqtQi0kgIPUNW62lZJDyPWASTGBISs3+b2m
	t9ayMyPErBu8FUvecPQ6sOmQsFWZ8aZ/ZtAm+AqmIdlho04GAM8ZrCl+95Myf1CK8m0s=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vg0ag-0004Nc-24;
	Wed, 14 Jan 2026 13:07:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+26d5290b15125d0fae64+8179+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vg0ad-0004NR-Pt; Wed, 14 Jan 2026 13:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=frpDmmp1i4r1AZelS3CVor2fKx/lP0Tq5j8/mhEG/8s=; b=aBdXCTgn/6cSmthCl/sdbiD0YE
 aGJTpjHR0Y+gjhwaJPjs9wGVXXgPgW/ppA0fnW8LMtBDECt92hhFbNgsewWZ0r+0eEhZpAGKup6z1
 fPtfRATPurp/ciTa9dkl+vD95AOYXzKupzbV4ioUa20pylBAc7QI6BkU/ltdrVRsMjlQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=frpDmmp1i4r1AZelS3CVor2fKx/lP0Tq5j8/mhEG/8s=; b=Ap6tIAASXLToX+qIIdli4Ptlo9
 H9eCKDPbTVOXoONsnGePZncYGUihh/dKNtt9frjdpW9qNgpzw0qSAZvHSFFVZiVBgowqUa+2d9Ub4
 yaOVIydsF7FJxhmy7K7E2ltKcAfKYiXdZ37joLaEZsle2fVS5zeC1ayEUR/Zx1gR3WW4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vg0ad-0005Zd-4P; Wed, 14 Jan 2026 13:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=frpDmmp1i4r1AZelS3CVor2fKx/lP0Tq5j8/mhEG/8s=; b=CsUTToetKF+Id6BSRt8PfLBnAS
 Y0ul3yOPNvK2EqLosGUY3uqxb0rBGjpkb3pFkF+nzL0tn0KOBAl2xhlehcW9SbJloDYCaYos/fI+R
 /3mikrJStWJrWeOJzR2PeycF0eBRtBI6m7fleAVeDpZJmAWb5/mhUGXdyVHOSGGKP+FgMpRotCkGe
 U4rxrSW9vdcoJ/4xvbYl6nQLLy/pVnBBXwulC6bpAsoSvSw4Aw1pxxyPY2C1RxEdi/vm7DGCPqLOa
 XPJH2SpQwhbv/9XjUm+ADr7Kr9Po4kKl3x0XMHBhpwdVI/FJYFR2ISU4AMVB1IFKkKKX1rv/bPqoF
 Uf0wlX6w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vg0Zb-00000009Gnt-0ut4;
 Wed, 14 Jan 2026 13:06:07 +0000
Date: Wed, 14 Jan 2026 05:06:07 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <aWeUv2UUJ_NdgozS@infradead.org>
References: <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org>
 <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 14, 2026 at 10:34:04AM +0100,
 Amir Goldstein wrote:
 > On Wed, Jan 14, 2026 at 7:28 AM Christoph Hellwig <hch@infradead.org> wrote:
 > > > > On Tue, Jan 13, 2026 at 12:06:42PM -0500, Jeff La [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vg0ad-0005Zd-4P
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
 linux-doc@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 linux-nilfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
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

T24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMTA6MzQ6MDRBTSArMDEwMCwgQW1pciBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgNzoyOOKAr0FNIENocmlzdG9waCBIZWxs
d2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBKYW4gMTMsIDIw
MjYgYXQgMTI6MDY6NDJQTSAtMDUwMCwgSmVmZiBMYXl0b24gd3JvdGU6Cj4gPiA+IEZhaXIgcG9p
bnQsIGJ1dCBpdCdzIG5vdCB0aGF0IGhhcmQgdG8gY29uY2VpdmUgb2YgYSBzaXR1YXRpb24gd2hl
cmUKPiA+ID4gc29tZW9uZSBpbmFkdmVydGFudGx5IGV4cG9ydHMgY2dyb3VwZnMgb3Igc29tZSBz
aW1pbGFyIGZpbGVzeXN0ZW06Cj4gPgo+ID4gU3VyZS4gIEJ1dCBob3cgaXMgdGhpcyB3b3JzZSB0
aGFuIGFjY2lkZW50YWxseSBleHBvcnRpbmcgcHJpdmF0ZSBkYXRhCj4gPiBvciBhbnkgb3RoZXIg
bWlzY29uZmlndXJhdGlvbj8KPiA+Cj4gCj4gTXkgUE9WIGlzIHRoYXQgaXQgaXMgbGVzcyBhYm91
dCBzZWN1cml0eSAoYXMgeW91ciBxdWVzdGlvbiBpbXBsaWVzKSwgYW5kCj4gbW9yZSBhYm91dCBj
b3JyZWN0bmVzcy4KCkkgd2FzIGp1c3QgcmVwbHlpbmcgdG8gSmVmZi4KCj4gVGhlIHNwZWNpYWwg
dGhpbmcgYWJvdXQgTkZTIGV4cG9ydCwgYXMgb3Bwb3NlZCB0bywgc2F5LCBrc21iZCwgaXMKPiBv
cGVuIGJ5IGZpbGUgaGFuZGxlLCBJT1csIHRoZSBleHBvcnRfb3BlcmF0aW9ucy4KPiAKPiBJIHBl
cmNlaXZlIHRoaXMgYXMgYSB2ZXJ5IHN0cmFuZ2UgYW5kIHVuZGVzaXJlZCBzaXR1YXRpb24gd2hl
biBORlMKPiBmaWxlIGhhbmRsZXMgZG8gbm90IGJlaGF2ZSBhcyBwZXJzaXN0ZW50IGZpbGUgaGFu
ZGxlcy4KClRoYXQgaXMgbm90IGp1c3QgdmVyeSBzdHJhbmdlLCBidXQgYWN0dWFsbHkgYnJva2Vu
IChkaXNjb3VudGluZyB0aGUKb2JzY3VyZSB2b2xhdGlsZSBmaWxlIGhhbmRsZXMgZmVhdHVyZXMg
bm90IGltcGxlbWVudGVkIGluIExpbnV4IE5GUwphbmQgTkZTRCkuICBBbmQgdGhlIGV4cG9ydCBv
cHMgYWx3YXlzIHdvcmtlZCB1bmRlciB0aGUgYXNzdW1wdGlvbgp0aGF0IHRoZXNlIGZpbGUgaGFu
ZGxlcyBhcmUgaW5kZWVkIHBlcnNpc3RlbnQuICBJZiB0aGV5J3JlIG5vdCB3ZQpkbyBoYXZlIGEg
cHJvYmxlbS4KCj4gCj4gY2dyb3VwZnMsIHBpZGZzLCBuc2ZzLCBhbGwgZ2FpbmVkIG9wZW5fYnlf
aGFuZGxlX2F0KCkgY2FwYWJpbGl0eSBmb3IKPiBhIGtub3duIHJlYXNvbiwgd2hpY2ggd2FzIE5P
VCBORlMgZXhwb3J0Lgo+IAo+IElmIHRoZSBhdXRob3Igb2Ygb3Blbl9ieV9oYW5kbGVfYXQoKSBz
dXBwb3J0IChpLmUuIGJyYXVuZXIpIGRvZXMgbm90Cj4gd2lzaCB0byBpbXBseSB0aGF0IHRob3Nl
IGZzIHNob3VsZCBiZSBleHBvcnRlZCB0byBORlMsIHdoeSBvYmplY3Q/CgpCZWNhdXNlICJ3YW50
IHRvIGV4cG9ydCIgaXMgYSBzdHVwaWQgY2F0ZWdvcnkuCgpPVE9IICJORlMgZXhwb3J0aW5nIGRv
ZXNuJ3QgYWN0dWFsbHkgcHJvcGVybHkgd29yayBiZWNhdXNlIHNvbWVvbmUKb3ZlcmxvYWRlZCBl
eHBvcnRfb3BzIHdpdGggZGlmZmVyZW50IHNlbWFudGljcyIgaXMgYSB2YWxpZCBjYXRlZ29yeS4K
Cj4gV2UgY291bGQgaGF2ZSB0aGUgb3B0LWluL291dCBvZiBORlMgZXhwb3J0IGZpeGVzIHBlciBF
WFBPUlRfT1BfCj4gZmxhZ3MgYW5kIHdlIGNvdWxkIGV2ZW4gdGhpbmsgb2YgYWxsb3dpbmcgYWRt
aW4gdG8gbWFrZSB0aGlzIGRlY2lzaW9uCj4gcGVyIHZmc21vdW50IChlLmcuIGZvciBjZ3JvdXBm
cykuCj4gCj4gSW4gYW55IGNhc2UsIEkgZmFpbCB0byBzZWUgaG93IG9iamVjdGluZyB0byB0aGUg
cG9zc2liaWxpdHkgb2YgTkZTIGV4cG9ydAo+IG9wdC1vdXQgc2VydmVzIGFueW9uZS4KCllvdSdy
ZSBzdGlsbCB0aGluayBvZiBpdCB0aGUgd3Jvbmcgd2F5LiAgSWYgd2UgZG8gaGF2ZSBmaWxlIHN5
c3RlbXMKdGhhdCBicmVhayB0aGUgb3JpZ2luYWwgZXhwb3J0ZnMgc2VtYW50aWNzIHdlIG5lZWQg
dG8gZml4IHRoYXQsIGFuZApzb21ldGhpbmcgbGlrZSBhICJzdGFibGUgaGFuZGxlcyIgZmxhZyB3
aWxsIHdvcmsgd2VsbCBmb3IgdGhhdC4gIEJ1dAphIHRvdGFsbHkgYXJiaXRyYXJ5ICJpcyBleHBv
cnRhYmxlIiBmbGFnIGlzIHRvdGFsIG5vbnNlbnNlLgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
