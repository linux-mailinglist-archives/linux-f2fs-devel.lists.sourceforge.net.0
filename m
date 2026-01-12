Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CC8D119C0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 10:50:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sp4m0qLBV/QMaUY/TkRLsBKE2snXlG/M25pHoMXehA0=; b=B5vhw0pIihRxsl9Z6iRMKU0Qcf
	HeWxRUYj9SgrwN9B3U0SqmoK56I0n1B4S1O35YkWYftGhDLIud4kub5q7tDC8Oqy7M+QJRu3EdqdH
	jIsoJMZwm4LDBWI24vdXaYpffhnJhSSo9Dp2Ez02UwGs6SLjFT4i+wM84mduo1hcstgw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfEYY-00022a-14;
	Mon, 12 Jan 2026 09:49:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vfEYV-00022L-LB;
 Mon, 12 Jan 2026 09:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MfekXN2se1alUjSsCk4xdLnYVKkV19tWJ8Jv/yRkuaU=; b=jeCxHmlLr/X2B/6wvGpGOAePbP
 ISMTfoI4zM90DUJWRQw9O18XXZbpwzxcQFlYA1K/Y1D9O4dZpAeN6IGlfAcPgHhcZzdsM3pA9Umnv
 KetfstkgH2Sx+TSQPYHRwv3GBYijFB/M9c8fXs9xbcAhTmw5m5VKFdlAm1Yk4ACjrQM8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MfekXN2se1alUjSsCk4xdLnYVKkV19tWJ8Jv/yRkuaU=; b=AzoMmlZoEkWj/PznvfoQtoABHf
 5q1nhbsX8PMmIozn8p+Fp63D38CrUKEiGMVrTIdF+CHLfBMAq3mh27Mz5j1W9JJigAcujsqXqA0yE
 gwKzn9mVczYgmMo+y7U7g4dHEHyfagaIMWfqcR3jLOecD7sb/TfcGyO14TNEX/3cN9RY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfEYV-0001mZ-17; Mon, 12 Jan 2026 09:49:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 217D86013A;
 Mon, 12 Jan 2026 09:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD38C116D0;
 Mon, 12 Jan 2026 09:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768211375;
 bh=m8zAICgnxs6xkW3AmfrwI3a0ispTdY6AQGss0vAXdME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kovjAz4KC5mAD7YrC6t2czYMjBWRcZIetUzNRdlwl4Z1rGgyp9glYOLbnOZypWAbx
 YcmUJCp6E8w+KmTy2i5WzHpX9fHwe2RpJgFtTNA95cnxyqlkjOQ7JUeU62APvVqkZH
 Y3/3WTlqh+tsw7Ls6NjRbDo/fUnqsYd/eTTthVLhPJ/V7Q9k3YIeMunOn+RktLYgES
 ul3EQIBMmxhQ+r6sMjogrCPwB0I4vKTgz3PxtAbmBEyff/p4uJORPrLFe5LDSB0Hni
 RZIrOX4UDngsOGqfziwhf24VBmArYe5xbo5TLnA7nB4zBdXfiNr6kFAgXt4Ej7biQ5
 RxoAJIZnapRSw==
Date: Mon, 12 Jan 2026 10:49:16 +0100
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20260112-gemeldet-gelitten-7d48bae7ef3f@brauner>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
 <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 09, 2026 at 07:52:57PM +0100,
 Amir Goldstein wrote:
 > On Thu, Jan 8, 2026 at 7:57 PM Jeff Layton <jlayton@kernel.org> wrote:
 > > > > On Thu, 2026-01-08 at 18:40 +0100, Jan Kara wrote: > > [...] 
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
X-Headers-End: 1vfEYV-0001mZ-17
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
 linux-doc@vger.kernel.org, linux-cifs@vger.kernel.org,
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

T24gRnJpLCBKYW4gMDksIDIwMjYgYXQgMDc6NTI6NTdQTSArMDEwMCwgQW1pciBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gVGh1LCBKYW4gOCwgMjAyNiBhdCA3OjU34oCvUE0gSmVmZiBMYXl0b24gPGps
YXl0b25Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCAyMDI2LTAxLTA4IGF0IDE4
OjQwICswMTAwLCBKYW4gS2FyYSB3cm90ZToKPiA+ID4gT24gVGh1IDA4LTAxLTI2IDEyOjEyOjU1
LCBKZWZmIExheXRvbiB3cm90ZToKPiA+ID4gPiBZZXN0ZXJkYXksIEkgc2VudCBwYXRjaGVzIHRv
IGZpeCBob3cgZGlyZWN0b3J5IGRlbGVnYXRpb24gc3VwcG9ydCBpcwo+ID4gPiA+IGhhbmRsZWQg
b24gZmlsZXN5c3RlbXMgd2hlcmUgdGhlIHNob3VsZCBiZSBkaXNhYmxlZCBbMV0uIFRoYXQgc2V0
IGlzCj4gPiA+ID4gYXBwcm9wcmlhdGUgZm9yIHY2LjE5LiBGb3IgdjcuMCwgSSB3YW50IHRvIG1h
a2UgbGVhc2Ugc3VwcG9ydCBiZSBtb3JlCj4gPiA+ID4gb3B0LWluLCByYXRoZXIgdGhhbiBvcHQt
b3V0Ogo+ID4gPiA+Cj4gPiA+ID4gRm9yIGhpc3RvcmljYWwgcmVhc29ucywgd2hlbiAtPnNldGxl
YXNlKCkgZmlsZV9vcGVyYXRpb24gaXMgc2V0IHRvIE5VTEwsCj4gPiA+ID4gdGhlIGRlZmF1bHQg
aXMgdG8gdXNlIHRoZSBrZXJuZWwtaW50ZXJuYWwgbGVhc2UgaW1wbGVtZW50YXRpb24uIFRoaXMK
PiA+ID4gPiBtZWFucyB0aGF0IGlmIHlvdSB3YW50IHRvIGRpc2FibGUgdGhlbSwgeW91IG5lZWQg
dG8gZXhwbGljaXRseSBzZXQgdGhlCj4gPiA+ID4gLT5zZXRsZWFzZSgpIGZpbGVfb3BlcmF0aW9u
IHRvIHNpbXBsZV9ub3NldGxlYXNlKCkgb3IgdGhlIGVxdWl2YWxlbnQuCj4gPiA+ID4KPiA+ID4g
PiBUaGlzIGhhcyBjYXVzZWQgYSBudW1iZXIgb2YgcHJvYmxlbXMgb3ZlciB0aGUgeWVhcnMgYXMg
c29tZSBmaWxlc3lzdGVtcwo+ID4gPiA+IGhhdmUgaW5hZHZlcnRhbnRseSBhbGxvd2VkIGxlYXNl
cyB0byBiZSBhY3F1aXJlZCBzaW1wbHkgYnkgaGF2aW5nIGxlZnQKPiA+ID4gPiBpdCBzZXQgdG8g
TlVMTC4gSXQgd291bGQgYmUgYmV0dGVyIGlmIGZpbGVzeXN0ZW1zIGhhZCB0byBvcHQtaW4gdG8g
bGVhc2UKPiA+ID4gPiBzdXBwb3J0LCBwYXJ0aWN1bGFybHkgd2l0aCB0aGUgYWR2ZW50IG9mIGRp
cmVjdG9yeSBkZWxlZ2F0aW9ucy4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgc2VyaWVzIGhhcyBzZXRz
IHRoZSAtPnNldGxlYXNlKCkgb3BlcmF0aW9uIGluIGEgcGlsZSBvZiBleGlzdGluZwo+ID4gPiA+
IGxvY2FsIGZpbGVzeXN0ZW1zIHRvIGdlbmVyaWNfc2V0bGVhc2UoKSBhbmQgdGhlbiBjaGFuZ2Vz
Cj4gPiA+ID4ga2VybmVsX3NldGxlYXNlKCkgdG8gcmV0dXJuIC1FSU5WQUwgd2hlbiB0aGUgc2V0
bGVhc2UoKSBvcGVyYXRpb24gaXMgbm90Cj4gPiA+ID4gc2V0Lgo+ID4gPiA+Cj4gPiA+ID4gV2l0
aCB0aGlzIGNoYW5nZSwgbmV3IGZpbGVzeXN0ZW1zIHdpbGwgbmVlZCB0byBleHBsaWNpdGx5IHNl
dCB0aGUKPiA+ID4gPiAtPnNldGxlYXNlKCkgb3BlcmF0aW9ucyBpbiBvcmRlciB0byBwcm92aWRl
IGxlYXNlIGFuZCBkZWxlZ2F0aW9uCj4gPiA+ID4gc3VwcG9ydC4KPiA+ID4gPgo+ID4gPiA+IEkg
bWFpbmx5IGZvY3VzZWQgb24gZmlsZXN5c3RlbXMgdGhhdCBhcmUgTkZTIGV4cG9ydGFibGUsIHNp
bmNlIE5GUyBhbmQKPiA+ID4gPiBTTUIgYXJlIHRoZSBtYWluIHVzZXJzIG9mIGZpbGUgbGVhc2Vz
LCBhbmQgdGhleSB0ZW5kIHRvIGVuZCB1cCBleHBvcnRpbmcKPiA+ID4gPiB0aGUgc2FtZSBmaWxl
c3lzdGVtIHR5cGVzLiBMZXQgbWUga25vdyBpZiBJJ3ZlIG1pc3NlZCBhbnkuCj4gPiA+Cj4gPiA+
IFNvLCB3aGF0IGFib3V0IGtlcm5mcyBhbmQgZnVzZT8gVGhleSBzZWVtIHRvIGJlIGV4cG9ydGFi
bGUgYW5kIGRvbid0IGhhdmUKPiA+ID4gLnNldGxlYXNlIHNldC4uLgo+ID4gPgo+ID4KPiA+IFll
cywgRlVTRSBuZWVkcyB0aGlzIHRvby4gSSdsbCBhZGQgYSBwYXRjaCBmb3IgdGhhdC4KPiA+Cj4g
PiBBcyBmYXIgYXMga2VybmZzIGdvZXM6IEFJVUksIHRoYXQncyBiYXNpY2FsbHkgd2hhdCBzeXNm
cyBhbmQgcmVzY3RybAo+ID4gYXJlIGJ1aWx0IG9uLiBEbyB3ZSByZWFsbHkgZXhwZWN0IHBlb3Bs
ZSB0byBzZXQgbGVhc2VzIHRoZXJlPwo+ID4KPiA+IEkgZ3Vlc3MgaXQncyB0ZWNobmljYWxseSBh
IHJlZ3Jlc3Npb24gc2luY2UgeW91IGNvdWxkIHNldCB0aGVtIG9uIHRob3NlCj4gPiBzb3J0cyBv
ZiBmaWxlcyBlYXJsaWVyLCBidXQgcGVvcGxlIGRvbid0IHVzdWFsbHkgZXhwb3J0IGtlcm5mcyBi
YXNlZAo+ID4gZmlsZXN5c3RlbXMgdmlhIE5GUyBvciBTTUIsIGFuZCB0aGF0IHNlZW1zIGxpa2Ug
c29tZXRoaW5nIHRoYXQgY291bGQgYmUKPiA+IHVzZWQgdG8gbWFrZSBtaXNjaGllZi4KPiA+Cj4g
PiBBRkFJQ1QsIGtlcm5mc19leHBvcnRfb3BzIGlzIG1vc3RseSB0byBzdXBwb3J0IG9wZW5fYnlf
aGFuZGxlX2F0KCkuIFNlZQo+ID4gY29tbWl0IGFhODE4ODI1MzQ3NCAoImtlcm5mczogYWRkIGV4
cG9ydGZzIG9wZXJhdGlvbnMiKS4KPiA+Cj4gPiBPbmUgaWRlYTogd2UgY291bGQgYWRkIGEgd3Jh
cHBlciBhcm91bmQgZ2VuZXJpY19zZXRsZWFzZSgpIGZvcgo+ID4gZmlsZXN5c3RlbXMgbGlrZSB0
aGlzIHRoYXQgd2lsbCBkbyBhIFdBUk5fT05DRSgpIGFuZCB0aGVuIGNhbGwKPiA+IGdlbmVyaWNf
c2V0bGVhc2UoKS4gVGhhdCB3b3VsZCBrZWVwIGxlYXNlcyB3b3JraW5nIG9uIHRoZW0gYnV0IHdl
IG1pZ2h0Cj4gPiBnZXQgc29tZSByZXBvcnRzIHRoYXQgd291bGQgdGVsbCB1cyB3aG8ncyBzZXR0
aW5nIGxlYXNlcyBvbiB0aGVzZSBmaWxlcwo+ID4gYW5kIHdoeS4KPiAKPiBJTU8sIHlvdSBhcmUg
YmVpbmcgdG9vIGNhdXRpb3VzLCBidXQgd2hhdGV2ZXIuCj4gCj4gSXQgaXMgbm90IGFjY3VyYXRl
IHRoYXQga2VybmZzIGZpbGVzeXN0ZW1zIGFyZSBORlMgZXhwb3J0YWJsZSBpbiBnZW5lcmFsLgo+
IE9ubHkgY2dyb3VwZnMgaGFzIEtFUk5GU19ST09UX1NVUFBPUlRfRVhQT1JUT1AuCj4gCj4gSWYg
YW55IGFwcGxpY2F0aW9uIGlzIHVzaW5nIGxlYXNlcyBvbiBjZ3JvdXAgZmlsZXMsIGl0IG11c3Qg
YmUgc29tZQo+IHZlcnkgYWR2YW5jZWQgcnVudGltZSAoaS5lLiBzeXN0ZW1kKSwgc28gd2Ugc2hv
dWxkIGtub3cgYWJvdXQgdGhlCj4gcmVncmVzc2lvbiBzb29uZXIgcmF0aGVyIHRoYW4gbGF0ZXIu
Cj4gCj4gVGhlcmUgYXJlIGFsc28gdGhlIHJlY2VudGx5IGFkZGVkIG5zZnMgYW5kIHBpZGZzIGV4
cG9ydF9vcGVyYXRpb25zLgo+IAo+IEkgaGF2ZSBhIHJlY29sbGVjdGlvbiBhYm91dCB3YW50aW5n
IHRvIGJlIGV4cGxpY2l0IGFib3V0IG5vdCBhbGxvd2luZwo+IHRob3NlIHRvIGJlIGV4cG9ydGFi
bGUgdG8gTkZTIChuc2ZzIHNwZWNpZmljYWxseSksIGJ1dCBJIGNhbid0IHNlZSB3aGVyZQo+IGFu
ZCBpZiB0aGF0IHJlc3RyaWN0aW9uIHdhcyBkb25lLgo+IAo+IENocmlzdGlhbj8gRG8geW91IHJl
bWVtYmVyPwoKSSBkb24ndCB0aGluayBpdCBkb2VzLgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
