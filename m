Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6E3D134C1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 15:50:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:Date:To:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfZxc/efcZYaiE/M4Vugo9Z9n3CxDXbrX1+WCD5lwM8=; b=cUMvB+SVKgIpDO/fWMs2Q/nB9/
	VLm3IHQt1dMu7ezVGC/fbppd2chFNdvyqyNFIU45K6kR411cL2Da1gezno4CyGp7vEHIsGplHIUHV
	ZQSm4z0lvGszvYGODpUVHMIwEld4bjB42y/fM04EPQXpDUfpt+mJZ24TmQ5QC5OJYvK8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfJFe-00004q-3D;
	Mon, 12 Jan 2026 14:50:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vfJFc-0008WF-Jp;
 Mon, 12 Jan 2026 14:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cheSnBLxN544y0UKkw10KpgjiO68XnZpyeYuNQCu1SI=; b=mQMRUQyMWQLWG6cBhw3VwNpBWz
 OnNNis6GzE5spGF/crOxJTQ4lsJO9t7fFTc6MFxMl4JRSOLhnmc8UCPGKYQRYn6YXYeReEcm1QY8F
 +APIRTS020CvNJhdCN7KALhaz2O1zWPvXbufJiOXMI7rGe5LlU2HUfbQMTFnLDWLKsD8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cheSnBLxN544y0UKkw10KpgjiO68XnZpyeYuNQCu1SI=; b=WP2gCpsOhrSoHWk1I+Mx3zn6vT
 7rJei2tCDrmebYwtbbiDx5rLtexKLvjzZgHWkjsWhfSc6Pdej8wiXOe0xqnsd6uKN42GcYMpJgoFK
 OUAXqPYWm4y9Ra2aYjUlCRObmYKLcyMPpFEvFGJEymSdURbFr1bkHbIB9NWqiAlIx8F0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfJFb-0000BZ-QK; Mon, 12 Jan 2026 14:50:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 631B7441BF;
 Mon, 12 Jan 2026 14:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8AEC16AAE;
 Mon, 12 Jan 2026 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768229429;
 bh=cheSnBLxN544y0UKkw10KpgjiO68XnZpyeYuNQCu1SI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=UpMEz5THVo05QbZ/pAisnu0HRhesOIjE2rYftbA7FBhGQj5tCikdbZP3s9Z/gB+1y
 k8fYirWnboJmtXtByE43Gev4eWZMrnZp2xsCYHsMHZKKPwK6nyAzNy2SlEd6q6RdQX
 E9BsB3Zeg8leNoOsSqkZw9UMTUfEJ1CwpbuRjO/ZsHVZdkTGXi72eLukzZew16H4By
 2V8I14GVLtY2HkAvnbTAdK8f8SFRaA/5FSsShCjCBoX+/4KLO8Va98nCZCU0IF7NSt
 5mEIqfFpYxDWcq+lTy0EQTI0buuA/J9QluBW76YeWrm5Yt8NF684D6eD5hHIR3dAHu
 cDKQUbKLqjwJw==
Message-ID: <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>, Amir Goldstein
 <amir73il@gmail.com>,  Christian Brauner	 <brauner@kernel.org>
Date: Mon, 12 Jan 2026 09:50:20 -0500
In-Reply-To: <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
 <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
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
 Content preview:  On Mon, 2026-01-12 at 09:31 -0500, Chuck Lever wrote: > On
 1/12/26 8:34 AM, Jeff Layton wrote: > > On Fri, 2026-01-09 at 19:52 +0100,
 Amir Goldstein wrote: > > > On Thu, Jan 8, 2026 at 7:57 PM Jeff La [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfJFb-0000BZ-QK
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

T24gTW9uLCAyMDI2LTAxLTEyIGF0IDA5OjMxIC0wNTAwLCBDaHVjayBMZXZlciB3cm90ZToKPiBP
biAxLzEyLzI2IDg6MzQgQU0sIEplZmYgTGF5dG9uIHdyb3RlOgo+ID4gT24gRnJpLCAyMDI2LTAx
LTA5IGF0IDE5OjUyICswMTAwLCBBbWlyIEdvbGRzdGVpbiB3cm90ZToKPiA+ID4gT24gVGh1LCBK
YW4gOCwgMjAyNiBhdCA3OjU34oCvUE0gSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4gT24gVGh1LCAyMDI2LTAxLTA4IGF0IDE4OjQwICswMTAw
LCBKYW4gS2FyYSB3cm90ZToKPiA+ID4gPiA+IE9uIFRodSAwOC0wMS0yNiAxMjoxMjo1NSwgSmVm
ZiBMYXl0b24gd3JvdGU6Cj4gPiA+ID4gPiA+IFllc3RlcmRheSwgSSBzZW50IHBhdGNoZXMgdG8g
Zml4IGhvdyBkaXJlY3RvcnkgZGVsZWdhdGlvbiBzdXBwb3J0IGlzCj4gPiA+ID4gPiA+IGhhbmRs
ZWQgb24gZmlsZXN5c3RlbXMgd2hlcmUgdGhlIHNob3VsZCBiZSBkaXNhYmxlZCBbMV0uIFRoYXQg
c2V0IGlzCj4gPiA+ID4gPiA+IGFwcHJvcHJpYXRlIGZvciB2Ni4xOS4gRm9yIHY3LjAsIEkgd2Fu
dCB0byBtYWtlIGxlYXNlIHN1cHBvcnQgYmUgbW9yZQo+ID4gPiA+ID4gPiBvcHQtaW4sIHJhdGhl
ciB0aGFuIG9wdC1vdXQ6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBGb3IgaGlzdG9yaWNhbCBy
ZWFzb25zLCB3aGVuIC0+c2V0bGVhc2UoKSBmaWxlX29wZXJhdGlvbiBpcyBzZXQgdG8gTlVMTCwK
PiA+ID4gPiA+ID4gdGhlIGRlZmF1bHQgaXMgdG8gdXNlIHRoZSBrZXJuZWwtaW50ZXJuYWwgbGVh
c2UgaW1wbGVtZW50YXRpb24uIFRoaXMKPiA+ID4gPiA+ID4gbWVhbnMgdGhhdCBpZiB5b3Ugd2Fu
dCB0byBkaXNhYmxlIHRoZW0sIHlvdSBuZWVkIHRvIGV4cGxpY2l0bHkgc2V0IHRoZQo+ID4gPiA+
ID4gPiAtPnNldGxlYXNlKCkgZmlsZV9vcGVyYXRpb24gdG8gc2ltcGxlX25vc2V0bGVhc2UoKSBv
ciB0aGUgZXF1aXZhbGVudC4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFRoaXMgaGFzIGNhdXNl
ZCBhIG51bWJlciBvZiBwcm9ibGVtcyBvdmVyIHRoZSB5ZWFycyBhcyBzb21lIGZpbGVzeXN0ZW1z
Cj4gPiA+ID4gPiA+IGhhdmUgaW5hZHZlcnRhbnRseSBhbGxvd2VkIGxlYXNlcyB0byBiZSBhY3F1
aXJlZCBzaW1wbHkgYnkgaGF2aW5nIGxlZnQKPiA+ID4gPiA+ID4gaXQgc2V0IHRvIE5VTEwuIEl0
IHdvdWxkIGJlIGJldHRlciBpZiBmaWxlc3lzdGVtcyBoYWQgdG8gb3B0LWluIHRvIGxlYXNlCj4g
PiA+ID4gPiA+IHN1cHBvcnQsIHBhcnRpY3VsYXJseSB3aXRoIHRoZSBhZHZlbnQgb2YgZGlyZWN0
b3J5IGRlbGVnYXRpb25zLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gVGhpcyBzZXJpZXMgaGFz
IHNldHMgdGhlIC0+c2V0bGVhc2UoKSBvcGVyYXRpb24gaW4gYSBwaWxlIG9mIGV4aXN0aW5nCj4g
PiA+ID4gPiA+IGxvY2FsIGZpbGVzeXN0ZW1zIHRvIGdlbmVyaWNfc2V0bGVhc2UoKSBhbmQgdGhl
biBjaGFuZ2VzCj4gPiA+ID4gPiA+IGtlcm5lbF9zZXRsZWFzZSgpIHRvIHJldHVybiAtRUlOVkFM
IHdoZW4gdGhlIHNldGxlYXNlKCkgb3BlcmF0aW9uIGlzIG5vdAo+ID4gPiA+ID4gPiBzZXQuCj4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBXaXRoIHRoaXMgY2hhbmdlLCBuZXcgZmlsZXN5c3RlbXMg
d2lsbCBuZWVkIHRvIGV4cGxpY2l0bHkgc2V0IHRoZQo+ID4gPiA+ID4gPiAtPnNldGxlYXNlKCkg
b3BlcmF0aW9ucyBpbiBvcmRlciB0byBwcm92aWRlIGxlYXNlIGFuZCBkZWxlZ2F0aW9uCj4gPiA+
ID4gPiA+IHN1cHBvcnQuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJIG1haW5seSBmb2N1c2Vk
IG9uIGZpbGVzeXN0ZW1zIHRoYXQgYXJlIE5GUyBleHBvcnRhYmxlLCBzaW5jZSBORlMgYW5kCj4g
PiA+ID4gPiA+IFNNQiBhcmUgdGhlIG1haW4gdXNlcnMgb2YgZmlsZSBsZWFzZXMsIGFuZCB0aGV5
IHRlbmQgdG8gZW5kIHVwIGV4cG9ydGluZwo+ID4gPiA+ID4gPiB0aGUgc2FtZSBmaWxlc3lzdGVt
IHR5cGVzLiBMZXQgbWUga25vdyBpZiBJJ3ZlIG1pc3NlZCBhbnkuCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IFNvLCB3aGF0IGFib3V0IGtlcm5mcyBhbmQgZnVzZT8gVGhleSBzZWVtIHRvIGJlIGV4cG9y
dGFibGUgYW5kIGRvbid0IGhhdmUKPiA+ID4gPiA+IC5zZXRsZWFzZSBzZXQuLi4KPiA+ID4gPiA+
IAo+ID4gPiA+IAo+ID4gPiA+IFllcywgRlVTRSBuZWVkcyB0aGlzIHRvby4gSSdsbCBhZGQgYSBw
YXRjaCBmb3IgdGhhdC4KPiA+ID4gPiAKPiA+ID4gPiBBcyBmYXIgYXMga2VybmZzIGdvZXM6IEFJ
VUksIHRoYXQncyBiYXNpY2FsbHkgd2hhdCBzeXNmcyBhbmQgcmVzY3RybAo+ID4gPiA+IGFyZSBi
dWlsdCBvbi4gRG8gd2UgcmVhbGx5IGV4cGVjdCBwZW9wbGUgdG8gc2V0IGxlYXNlcyB0aGVyZT8K
PiA+ID4gPiAKPiA+ID4gPiBJIGd1ZXNzIGl0J3MgdGVjaG5pY2FsbHkgYSByZWdyZXNzaW9uIHNp
bmNlIHlvdSBjb3VsZCBzZXQgdGhlbSBvbiB0aG9zZQo+ID4gPiA+IHNvcnRzIG9mIGZpbGVzIGVh
cmxpZXIsIGJ1dCBwZW9wbGUgZG9uJ3QgdXN1YWxseSBleHBvcnQga2VybmZzIGJhc2VkCj4gPiA+
ID4gZmlsZXN5c3RlbXMgdmlhIE5GUyBvciBTTUIsIGFuZCB0aGF0IHNlZW1zIGxpa2Ugc29tZXRo
aW5nIHRoYXQgY291bGQgYmUKPiA+ID4gPiB1c2VkIHRvIG1ha2UgbWlzY2hpZWYuCj4gPiA+ID4g
Cj4gPiA+ID4gQUZBSUNULCBrZXJuZnNfZXhwb3J0X29wcyBpcyBtb3N0bHkgdG8gc3VwcG9ydCBv
cGVuX2J5X2hhbmRsZV9hdCgpLiBTZWUKPiA+ID4gPiBjb21taXQgYWE4MTg4MjUzNDc0ICgia2Vy
bmZzOiBhZGQgZXhwb3J0ZnMgb3BlcmF0aW9ucyIpLgo+ID4gPiA+IAo+ID4gPiA+IE9uZSBpZGVh
OiB3ZSBjb3VsZCBhZGQgYSB3cmFwcGVyIGFyb3VuZCBnZW5lcmljX3NldGxlYXNlKCkgZm9yCj4g
PiA+ID4gZmlsZXN5c3RlbXMgbGlrZSB0aGlzIHRoYXQgd2lsbCBkbyBhIFdBUk5fT05DRSgpIGFu
ZCB0aGVuIGNhbGwKPiA+ID4gPiBnZW5lcmljX3NldGxlYXNlKCkuIFRoYXQgd291bGQga2VlcCBs
ZWFzZXMgd29ya2luZyBvbiB0aGVtIGJ1dCB3ZSBtaWdodAo+ID4gPiA+IGdldCBzb21lIHJlcG9y
dHMgdGhhdCB3b3VsZCB0ZWxsIHVzIHdobydzIHNldHRpbmcgbGVhc2VzIG9uIHRoZXNlIGZpbGVz
Cj4gPiA+ID4gYW5kIHdoeS4KPiA+ID4gCj4gPiA+IElNTywgeW91IGFyZSBiZWluZyB0b28gY2F1
dGlvdXMsIGJ1dCB3aGF0ZXZlci4KPiA+ID4gCj4gPiA+IEl0IGlzIG5vdCBhY2N1cmF0ZSB0aGF0
IGtlcm5mcyBmaWxlc3lzdGVtcyBhcmUgTkZTIGV4cG9ydGFibGUgaW4gZ2VuZXJhbC4KPiA+ID4g
T25seSBjZ3JvdXBmcyBoYXMgS0VSTkZTX1JPT1RfU1VQUE9SVF9FWFBPUlRPUC4KPiA+ID4gCj4g
PiA+IElmIGFueSBhcHBsaWNhdGlvbiBpcyB1c2luZyBsZWFzZXMgb24gY2dyb3VwIGZpbGVzLCBp
dCBtdXN0IGJlIHNvbWUKPiA+ID4gdmVyeSBhZHZhbmNlZCBydW50aW1lIChpLmUuIHN5c3RlbWQp
LCBzbyB3ZSBzaG91bGQga25vdyBhYm91dCB0aGUKPiA+ID4gcmVncmVzc2lvbiBzb29uZXIgcmF0
aGVyIHRoYW4gbGF0ZXIuCj4gPiA+IAo+ID4gCj4gPiBJIHRoaW5rIHNvIHRvby4gRm9yIG5vdywg
SSB0aGluayBJJ2xsIG5vdCBib3RoZXIgd2l0aCB0aGUgV0FSTl9PTkNFKCkuCj4gPiBMZXQncyBq
dXN0IGxlYXZlIGtlcm5mcyBvdXQgb2YgdGhlIHNldCB1bnRpbCBzb21lb25lIHByZXNlbnRzIGEg
cmVhbAo+ID4gdXNlLWNhc2UuCj4gPiAKPiA+ID4gVGhlcmUgYXJlIGFsc28gdGhlIHJlY2VudGx5
IGFkZGVkIG5zZnMgYW5kIHBpZGZzIGV4cG9ydF9vcGVyYXRpb25zLgo+ID4gPiAKPiA+ID4gSSBo
YXZlIGEgcmVjb2xsZWN0aW9uIGFib3V0IHdhbnRpbmcgdG8gYmUgZXhwbGljaXQgYWJvdXQgbm90
IGFsbG93aW5nCj4gPiA+IHRob3NlIHRvIGJlIGV4cG9ydGFibGUgdG8gTkZTIChuc2ZzIHNwZWNp
ZmljYWxseSksIGJ1dCBJIGNhbid0IHNlZSB3aGVyZQo+ID4gPiBhbmQgaWYgdGhhdCByZXN0cmlj
dGlvbiB3YXMgZG9uZS4KPiA+ID4gCj4gPiA+IENocmlzdGlhbj8gRG8geW91IHJlbWVtYmVyPwo+
ID4gPiAKPiA+IAo+ID4gKGNjJ2luZyBDaHVjaykKPiA+IAo+ID4gRldJVywgeW91IGNhbiBjdXJy
ZW50bHkgZXhwb3J0IGFuZCBtb3VudCAvc3lzL2ZzL2Nncm91cCB2aWEgTkZTLiBUaGUKPiA+IGRp
cmVjdG9yeSBkb2Vzbid0IHNob3cgdXAgd2hlbiB5b3UgdHJ5IHRvIGdldCB0byBpdCB2aWEgTkZT
djQsIGJ1dCB5b3UKPiA+IGNhbiBtb3VudCBpdCB1c2luZyB2MyBhbmQgUkVBRERJUiB3b3Jrcy4g
VGhlIGZpbGVzIGFyZSBhbGwgZW1wdHkgd2hlbgo+ID4geW91IHRyeSB0byByZWFkIHRoZW0uIEkg
ZGlkbid0IHRyeSB0byBkbyBhbnkgd3JpdGVzLgo+ID4gCj4gPiBTaG91bGQgd2UgYWRkIGEgbWVj
aGFuaXNtIHRvIHByZXZlbnQgZXhwb3J0aW5nIHRoZXNlIHNvcnRzIG9mCj4gPiBmaWxlc3lzdGVt
cz8KPiA+IAo+ID4gRXZlbiBiZXR0ZXIgd291bGQgYmUgdG8gbWFrZSBuZnNkIGV4cG9ydGluZyBl
eHBsaWNpdGx5IG9wdC1pbi4gV2hhdCBpZgo+ID4gd2Ugd2VyZSB0byBhZGQgYSBFWFBPUlRfT1Bf
TkZTRCBmbGFnIHRoYXQgZXhwbGljaXRseSBhbGxvd3MgZmlsZXN5c3RlbXMKPiA+IHRvIG9wdC1p
biB0byBORlMgZXhwb3J0aW5nLCBhbmQgY2hlY2sgZm9yIHRoYXQgaW4gX19maF92ZXJpZnkoKT8g
V2UnZAo+ID4gaGF2ZSB0byBhZGQgaXQgdG8gYSBidW5jaCBvZiBleGlzdGluZyBmaWxlc3lzdGVt
cywgYnV0IHRoYXQncyBmYWlybHkKPiA+IHNpbXBsZSB0byBkbyB3aXRoIGFuIExMTS4KPiAKPiBX
aGF0J3MgdGhlIGFjdGl2ZSBoYXJtIGluIGV4cG9ydGluZyAvc3lzL2ZzL2Nncm91cCA/IEl0IGhh
cyB0byBiZSBkb25lCj4gZXhwbGljaXRseSB2aWEgL2V0Yy9leHBvcnRzLCBzbyB0aGlzIGlzIHVu
ZGVyIHRoZSBORlMgc2VydmVyIGFkbWluJ3MKPiBjb250cm9sLiBJcyBpdCBhbiBhdHRhY2sgc3Vy
ZmFjZT8KPiAKClBvdGVudGlhbGx5PwoKSSBkb24ndCBzZWUgYW55IGFjdGl2ZSBoYXJtIHdpdGgg
ZXhwb3J0aW5nIGNncm91cGZzLiBJdCBkb2Vzbid0IHdvcmsKcmlnaHQgdmlhIG5mc2QsIGJ1dCBp
dCdzIG5vdCBjcmFzaGluZyB0aGUgYm94IG9yIGFueXRoaW5nLgoKQXQgb25lIHRpbWUsIHRob3Nl
IHdlcmUgb25seSBkZWZpbmVkIGJ5IGZpbGVzeXN0ZW1zIHRoYXQgd2FudGVkIHRvCmFsbG93IE5G
UyBleHBvcnQuIE5vdyB3ZSd2ZSBncm93biB0aGVtIG9uIGZpbGVzeXN0ZW1zIHRoYXQganVzdCB3
YW50IHRvCnByb3ZpZGUgZmlsZWhhbmRsZXMgZm9yIG9wZW5fYnlfaGFuZGxlX2F0KCkgYW5kIHRo
ZSBsaWtlLiBuZnNkIGRvZXNuJ3QKY2FyZSB0aG91Z2g6IGlmIHRoZSBmcyBoYXMgZXhwb3J0IG9w
ZXJhdGlvbnMsIGl0J2xsIGhhcHBpbHkgdXNlIHRoZW0uCgpIYXZpbmcgYW4gZXhwbGljaXQgIkkg
d2FudCB0byBhbGxvdyBuZnNkIiBmbGFnIHNlZSBtcyBsaWtlIGl0IG1pZ2h0CnNhdmUgdXMgc29t
ZSBoZWFkYWNoZXMgaW4gdGhlIGZ1dHVyZSB3aGVuIG90aGVyIGZpbGVzeXN0ZW1zIGFkZCBleHBv
cnQKb3BzIGZvciB0aGlzIHNvcnQgb2YgZmlsZWhhbmRsZSB1c2UuCi0tIApKZWZmIExheXRvbiA8
amxheXRvbkBrZXJuZWwub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
