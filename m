Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C69D07767F0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Aug 2023 21:05:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qToUz-0003yl-MT;
	Wed, 09 Aug 2023 19:05:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qToUy-0003vm-Iz
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 19:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vuRLPJqHHB4jKbIejrjNY+b9NF+LaeumSqgXikGIlQ4=; b=IaDmW/e1lYG6JlSB+oAF96T5uy
 5Sb6ux/MF2XE1lmMkVlVrRB/mv/CR7R2CcVNdHUacvOiAGUzRfyh/Z1rwZ3egjRIuYQgdN0n3Rp2y
 fppsYJSBcBxAx7x40ydSbWACmpte6safH866sn8pMXIz3cIsCwuZBYm7VT6bjYS/gBzw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vuRLPJqHHB4jKbIejrjNY+b9NF+LaeumSqgXikGIlQ4=; b=JjQ9KkxeoxwEeLqiHXELj2Zfxc
 E0lANvVr1MJslbAqFbqPE+ujvx5RH7kQFBykTaIxQ0bJUi3X60CMN9J+LAj+Qt9R7N66hqR7LR3E/
 UGwAkWIpiwwm6Cnfz0VgHO/9A5f5ljENqYmB+gtEOce/qaVDfsRAcecLIVFBaVjTxhys=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qToUx-00057O-N4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 19:05:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E99E6446B;
 Wed,  9 Aug 2023 19:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5CFC433C8;
 Wed,  9 Aug 2023 19:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691607929;
 bh=4GKDaia1VeW/OijfJXE9UHIufNesebWNQDy9LU2whYI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=gEyeaJZ4RUWChIryvRrKWbHk6CbM8eHu0rqtHvzvba6SSDpBpPtag+D6BMw4GFw2n
 hFXK4OEbm0L9R1B4K8eNiaiBDtquinDOVTFyiDIMSP6pKYqwvVgkMBHyc14BMMGMP8
 zAV3KdTeX3lKcSKjE5oKnAjO29eKsnCAgTvUvEsF/+3xUpWxGZvbyls48Ed9vXaSwV
 DcuV4QvGf703nsP6BpmM4kVysUgEr6LDinf8/zizcxdQ20sie+EHfzuPrXj/APOCtH
 91Mo4Dg4M0l0SApVPB8n1GBtVl5sn3TKwCbUSa9ZQiDyJiArJw0iRB7MWozIYejid0
 q+2d4Xd9I1nbw==
Message-ID: <cbc98eb171d6ccacb24213af7d0ae91094d39780.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Mike Marshall <hubcap@omnibond.com>, Christian Brauner <brauner@kernel.org>
Date: Wed, 09 Aug 2023 15:05:21 -0400
In-Reply-To: <CAOg9mST=WFAjEwS9eNi_huoUpBvPy3R3fbFVTLUeFZAv6BJEEQ@mail.gmail.com>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-8-d1dec143a704@kernel.org>
 <20230809-segeln-pflaumen-460b81bd2d3a@brauner>
 <CAOg9mST=WFAjEwS9eNi_huoUpBvPy3R3fbFVTLUeFZAv6BJEEQ@mail.gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Yes. It's in Christian's vfs.ctime branch:
 https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs.ctime
 On Wed, 2023-08-09 at 14:38 -0400, Mike Marshall wrote: > I've been following
 this patch on fsdevel... is there a > remote I could fetch with a branch
 that has this in it? > > -Mike > > On Wed, Aug 9, [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qToUx-00057O-N4
Subject: Re: [f2fs-dev] [PATCH v7 08/13] fs: drop the timespec64 argument
 from update_time
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-xfs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 linux-mtd@lists.infradead.org, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Benjamin Coddington <bcodding@redhat.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Amir Goldstein <amir73il@gmail.com>,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

WWVzLiBJdCdzIGluIENocmlzdGlhbidzIHZmcy5jdGltZSBicmFuY2g6CgpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC92ZnMvdmZzLmdpdC9sb2cvP2g9dmZz
LmN0aW1lCgpPbiBXZWQsIDIwMjMtMDgtMDkgYXQgMTQ6MzggLTA0MDAsIE1pa2UgTWFyc2hhbGwg
d3JvdGU6Cj4gSSd2ZSBiZWVuIGZvbGxvd2luZyB0aGlzIHBhdGNoIG9uIGZzZGV2ZWwuLi4gaXMg
dGhlcmUgYQo+IHJlbW90ZSBJIGNvdWxkIGZldGNoIHdpdGggYSBicmFuY2ggdGhhdCBoYXMgdGhp
cyBpbiBpdD8KPiAKPiAtTWlrZQo+IAo+IE9uIFdlZCwgQXVnIDksIDIwMjMgYXQgODozMuKAr0FN
IENocmlzdGlhbiBCcmF1bmVyIDxicmF1bmVyQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gCj4gPiBP
biBNb24sIEF1ZyAwNywgMjAyMyBhdCAwMzozODozOVBNIC0wNDAwLCBKZWZmIExheXRvbiB3cm90
ZToKPiA+ID4gTm93IHRoYXQgYWxsIG9mIHRoZSB1cGRhdGVfdGltZSBvcGVyYXRpb25zIGFyZSBw
cmVwYXJlZCBmb3IgaXQsIHdlIGNhbgo+ID4gPiBkcm9wIHRoZSB0aW1lc3BlYzY0IGFyZ3VtZW50
IGZyb20gdGhlIHVwZGF0ZV90aW1lIG9wZXJhdGlvbi4gRG8gdGhhdCBhbmQKPiA+ID4gcmVtb3Zl
IGl0IGZyb20gc29tZSBhc3NvY2lhdGVkIGZ1bmN0aW9ucyBsaWtlIGlub2RlX3VwZGF0ZV90aW1l
IGFuZAo+ID4gPiBpbm9kZV9uZWVkc191cGRhdGVfdGltZS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAg
ZnMvYmFkX2lub2RlLmMgICAgICAgICAgIHwgIDMgKy0tCj4gPiA+ICBmcy9idHJmcy9pbm9kZS5j
ICAgICAgICAgfCAgMyArLS0KPiA+ID4gIGZzL2J0cmZzL3ZvbHVtZXMuYyAgICAgICB8ICA0ICst
LS0KPiA+ID4gIGZzL2ZhdC9mYXQuaCAgICAgICAgICAgICB8ICAzICstLQo+ID4gPiAgZnMvZmF0
L21pc2MuYyAgICAgICAgICAgIHwgIDIgKy0KPiA+ID4gIGZzL2dmczIvaW5vZGUuYyAgICAgICAg
ICB8ICAzICstLQo+ID4gPiAgZnMvaW5vZGUuYyAgICAgICAgICAgICAgIHwgMzAgKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ICBmcy9vdmVybGF5ZnMvaW5vZGUuYyAgICAgfCAg
MiArLQo+ID4gPiAgZnMvb3ZlcmxheWZzL292ZXJsYXlmcy5oIHwgIDIgKy0KPiA+ID4gIGZzL3Vi
aWZzL2ZpbGUuYyAgICAgICAgICB8ICAzICstLQo+ID4gPiAgZnMvdWJpZnMvdWJpZnMuaCAgICAg
ICAgIHwgIDIgKy0KPiA+ID4gIGZzL3hmcy94ZnNfaW9wcy5jICAgICAgICB8ICAxIC0KPiA+ID4g
IGluY2x1ZGUvbGludXgvZnMuaCAgICAgICB8ICA0ICsrLS0KPiA+IAo+ID4gVGhpcyB3YXMgbWlz
c2luZyB0aGUgY29udmVyc2lvbiBvZiBmcy9vcmFuZ2VmcyBvcmFuZ2Vmc191cGRhdGVfdGltZSgp
Cj4gPiBjYXVzaW5nIHRoZSBidWlsZCB0byBmYWlsLiBTbyBhdCBzb21lIHBvaW50IGtidWlsZCB3
aWxsIHllbGwgaGVyZS4KPiA+IEZ3aXcsIEkndmUgZml4ZWQgdGhhdCB1cCBpbi10cmVlLgoKQ2hl
ZXJzLAotLSAKSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
