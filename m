Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B75CD28245
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 20:37:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaTz1x3nbAc6EenDWzBb/jWWc+itwRu0Wq1zQNFFjVc=; b=fZc3l7u2OSwUawhSUKqkPJpSNv
	zWYquMuQ5JrjKH2NE5ARpw1fjCkuY9CNQpzUIa3SxgrCsXoFteiykGpghfa+/QW3tIRVzixqWPg2M
	B9oPVAMjNGZbVYjlRe0NbCzvqinRE72EHRS7VTfFUZo2Jf5zh3OgIyCBftRIvWv3ZNxI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgTA0-0003VZ-TC;
	Thu, 15 Jan 2026 19:37:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vgT9x-0003VE-7N;
 Thu, 15 Jan 2026 19:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EZT+o0VjsIJqvL4Ye1+Mojw1LAugYAMc89Qw5GYzSAw=; b=Uyyzq4J9GOrz7ch6uiA2euyXqt
 FHSUzm7JyIdeCH82CYL4KKM1iJtEPGwpjN/gxqewN4mdwiAj76/iwUpTSE1f6AQ5idHXzWDmyVmWK
 +ruDqTSAG0vhH7N4E57eJ2K3JaOXYTcJex2129GDvau6qk4xWvKVk/NogIgLndGHC3sk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EZT+o0VjsIJqvL4Ye1+Mojw1LAugYAMc89Qw5GYzSAw=; b=SCHiC63fau7jZZq5wlRJWeTWB+
 3kWVACAipkYsnAa5zOLikD94dlsa4aBCv9dYALFG0uq9VjvNpyskt9qMmNGeSgLek2KnoKcdoVJ0g
 3tJdxdJ/KqiVsH4oUy+J3evU9dVzWuvlQGK80Pheu86g3xy9dNQR7+5gx7MGf/KwU8kk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgT9v-0004gY-0y; Thu, 15 Jan 2026 19:37:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2B2A14443E;
 Thu, 15 Jan 2026 19:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB8DC116D0;
 Thu, 15 Jan 2026 19:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768505845;
 bh=WJfdSxntdjCGN+SFF94mp89xagtZVsc8ko5YpfyHmzo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HFbrkaxb1G2AMG3MzNBQW/L4EalwCCXCDDxxDQ0j51u/B6PgVvK4NDRP+gGsVfnpe
 VyaIgHktK2ed+mNcElWfMOvW8ETWuYtZ5BFV7xemUUxHpfR8cVtiKroue7/9G/qCGd
 rt85fYelVNLihiQeGcg1jxPrf/3yQwBY4s+8zZk5LgZv0Ho8j42Klxvmo6vU2q3pOQ
 ev3GcW+Npw86laMA3/1Ho9Pk9tnCRdwq68XKqMY+ib2uyFDvs9SuOLSNploZHBt1DR
 d0vpBTEHYbunJ8ienXua5qZh3TfRauncM885fsO/Gz1dFmAlUhHctfiqlwv2dV0p89
 QAbmFxgjt0yHA==
Message-ID: <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
Date: Thu, 15 Jan 2026 14:37:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Amir Goldstein <amir73il@gmail.com>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
 <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
Content-Language: en-US
Organization: kernel.org
In-Reply-To: <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/15/26 2:14 PM, Amir Goldstein wrote: > On Thu, Jan 15, 
 2026 at 7:32 PM Chuck Lever <cel@kernel.org> wrote: >> >> >> >> On Thu, Jan
 15, 2026, at 1:17 PM, Amir Goldstein wrote: >>> On Thu, Jan 15, [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgT9v-0004gY-0y
Subject: Re: [f2fs-dev] [PATCH 00/29] fs: require filesystems to explicitly
 opt-in to nfsd export support
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
From: Chuck Lever via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chuck Lever <cel@kernel.org>
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 samba-technical@lists.samba.org, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Gao Xiang <xiang@kernel.org>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 linux-mm@kvack.org, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Tso <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Chuck Lever <chuck.lever@oracle.com>, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>, Trond Myklebust <trondmy@kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMS8xNS8yNiAyOjE0IFBNLCBBbWlyIEdvbGRzdGVpbiB3cm90ZToKPiBPbiBUaHUsIEphbiAx
NSwgMjAyNiBhdCA3OjMy4oCvUE0gQ2h1Y2sgTGV2ZXIgPGNlbEBrZXJuZWwub3JnPiB3cm90ZToK
Pj4KPj4KPj4KPj4gT24gVGh1LCBKYW4gMTUsIDIwMjYsIGF0IDE6MTcgUE0sIEFtaXIgR29sZHN0
ZWluIHdyb3RlOgo+Pj4gT24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo0OOKAr1BNIEplZmYgTGF5
dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Cj4+Pj4gSW4gcmVjZW50IHllYXJz
LCBhIG51bWJlciBvZiBmaWxlc3lzdGVtcyB0aGF0IGNhbid0IHByZXNlbnQgc3RhYmxlCj4+Pj4g
ZmlsZWhhbmRsZXMgaGF2ZSBncm93biBzdHJ1Y3QgZXhwb3J0X29wZXJhdGlvbnMuIFRoZXkndmUg
bW9zdGx5IGRvbmUKPj4+PiB0aGlzIGZvciBsb2NhbCB1c2UtY2FzZXMgKGVuYWJsaW5nIG9wZW5f
YnlfaGFuZGxlX2F0KCkgYW5kIHRoZSBsaWtlKS4KPj4+PiBVbmZvcnR1bmF0ZWx5LCBoYXZpbmcg
ZXhwb3J0X29wZXJhdGlvbnMgaXMgZ2VuZXJhbGx5IHN1ZmZpY2llbnQgdG8gbWFrZQo+Pj4+IGEg
ZmlsZXN5c3RlbSBiZSBjb25zaWRlcmVkIGV4cG9ydGFibGUgdmlhIG5mc2QsIGJ1dCB0aGF0IHJl
cXVpcmVzIHRoYXQKPj4+PiB0aGUgc2VydmVyIHByZXNlbnQgc3RhYmxlIGZpbGVoYW5kbGVzLgo+
Pj4KPj4+IFdoZXJlIGRvZXMgdGhlIHRlcm0gInN0YWJsZSBmaWxlIGhhbmRsZXMiIGNvbWUgZnJv
bT8gYW5kIHdoYXQgZG9lcyBpdCBtZWFuPwo+Pj4gV2h5IG5vdCAicGVyc2lzdGVudCBoYW5kbGVz
Iiwgd2hpY2ggaXMgZGVzY3JpYmVkIGluIE5GUyBhbmQgU01CIHNwZWNzPwo+Pj4KPj4+IE5vdCB0
byBtZW50aW9uIHRoYXQgRVhQT1JUX09QX1BFUlNJU1RFTlRfSEFORExFUyB3YXMgQWNrZWQKPj4+
IGJ5IGJvdGggQ2hyaXN0b3BoIGFuZCBDaHJpc3RpYW46Cj4+Pgo+Pj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtZnNkZXZlbC8yMDI2MDExNS1ydW5kZ2FuZy1sZWloZ2FiZS0xMjAxOGU5
M2MwMGNAYnJhdW5lci8KPj4+Cj4+PiBBbSBJIG1pc3NpbmcgYW55dGhpbmc/Cj4+Cj4+IFBFUlNJ
U1RFTlQgZ2VuZXJhbGx5IGltcGxpZXMgdGhhdCB0aGUgZmlsZSBoYW5kbGUgaXMgc2F2ZWQgb24K
Pj4gcGVyc2lzdGVudCBzdG9yYWdlLiBUaGlzIGlzIG5vdCB0cnVlIG9mIHRtcGZzLgo+IAo+IFRo
YXQncyBvbmUgd2F5IG9mIGludGVycHJldGluZyAicGVyc2lzdGVudCIuCj4gQW5vdGhlciB3YXkg
aXMgImNvbnRpbnVpbmcgdG8gZXhpc3Qgb3Igb2NjdXIgb3ZlciBhIHByb2xvbmdlZCBwZXJpb2Qu
Igo+IHdoaWNoIHdvcmtzIHdlbGwgZm9yIHRtcGZzIHRoYXQgaXMgbW91bnRlZCBmb3IgYSBsb25n
IHRpbWUuCgpJIHRoaW5rIHdlIGNhbiBiZSBhIGxvdCBtb3JlIHByZWNpc2UgYWJvdXQgdGhlIGd1
YXJhbnRlZTogVGhlIGZpbGUKaGFuZGxlIGRvZXMgbm90IGNoYW5nZSBmb3IgdGhlIGxpZmUgb2Yg
dGhlIGlub2RlIGl0IHJlcHJlc2VudHMuIEl0CmhhcyBub3RoaW5nIHRvIGRvIHdpdGggd2hldGhl
ciB0aGUgZmlsZSBzeXN0ZW0gaXMgbW91bnRlZC4KCgo+IEJ1dCBJIGFtIGNvbmZ1c2VkLCBiZWNh
dXNlIEkgd2VudCBsb29raW5nIGZvciB3aGVyZSBKZWZmIHNhaWQgdGhhdAo+IHlvdSBzdWdnZXN0
ZWQgc3RhYmxlIGZpbGUgaGFuZGxlcyBhbmQgdGhpcyBpcyB3aGF0IEkgZm91bmQgdGhhdCB5b3Ug
d3JvdGU6Cj4gCj4gInRtcGZzIGZpbGVoYW5kbGVzIGFsaWduIHF1aXRlIHdlbGwgd2l0aCB0aGUg
dHJhZGl0aW9uYWwgZGVmaW5pdGlvbgo+ICBvZiBwZXJzaXN0ZW50IGZpbGVoYW5kbGVzLiB0bXBm
cyBmaWxlaGFuZGxlcyBsaXZlIGFzIGxvbmcgYXMgdG1wZnMgZmlsZXMgZG8sCj4gIGFuZCB0aGF0
IGlzIGFsbCB0aGF0IGlzIHJlcXVpcmVkIHRvIGJlIGNvbnNpZGVyZWQgInBlcnNpc3RlbnQiLgoK
SSBjaGFuZ2VkIG15IG1pbmQgYWJvdXQgdGhlIG5hbWUsIGFuZCBJIGxldCBKZWZmIGtub3cgdGhh
dCBwcml2YXRlbHkKd2hlbiBoZSBhc2tlZCBtZSB0byBsb29rIGF0IHRoZXNlIHBhdGNoZXMgdGhp
cyBtb3JuaW5nLgoKCj4+IFRoZSB1c2Ugb2YgInN0YWJsZSIgbWVhbnMgdGhhdCB0aGUgZmlsZSBo
YW5kbGUgaXMgc3RhYmxlIGZvcgo+PiB0aGUgbGlmZSBvZiB0aGUgZmlsZS4gVGhpcyAvaXMvIHRy
dWUgb2YgdG1wZnMuCj4gCj4gSSBjYW4gbGl2ZSB3aXRoIFNUQUJMRV9IQU5ETEVTIEkgZG9uJ3Qg
bWluZCBhcyBtdWNoLAo+IEkgdW5kZXJzdGFuZCB3aGF0IGl0IG1lYW5zLCBidXQgdGhlIGRlZmlu
aXRpb24gYWJvdmUgaXMgaW52ZW50ZWQsCj4gd2hlcmVhcyB0aGUgdGVybSBwZXJzaXN0ZW50IGhh
bmRsZXMgaXMgd2VsbCBrbm93biBhbmQgd2VsbCBkZWZpbmVkLgoKQW5vdGhlciByZWFzb24gbm90
IHRvIGFkb3B0IHRoZSBzYW1lIHRlcm1pbm9sb2d5IGFzIE5GUyBpcyB0aGF0CnNvbWVvbmUgbWln
aHQgY29tZSBhbG9uZyBhbmQgaW1wbGVtZW50IE5GU3Y0J3MgVk9MQVRJTEUgZmlsZQpoYW5kbGVz
IGluIExpbnV4LCBhbmQgdGhlbiBzYXkgIk9LLCAvbm93LyBjYW4gd2UgZXhwb3J0IGNncm91cGZz
PyIKQW5kIHRoZW4gTGludXggd2lsbCBiZSBzdHVjayB3aXRoIG92ZXJsb2FkZWQgdGVybWlub2xv
Z3kgYW5kIHdlJ2xsCnN0aWxsIHdhbnQgdG8gc2F5ICJOTywgTkZTIGRvZXNuJ3Qgc3VwcG9ydCBj
Z3JvdXBmcyIuCgpKdXN0IGEgcmFuZG9tIHRob3VnaHQuCgoKLS0gCkNodWNrIExldmVyCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
