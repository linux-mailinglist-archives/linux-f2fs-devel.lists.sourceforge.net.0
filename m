Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC9FD331B3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 16:14:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:Date:To:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZV6PnrDYDFmC+abSWpC8aS2BkaC9Z9m8DxHL/ucb364=; b=XZouAlGEJacjEJtx/vym4AdtyW
	IvdDTN8TUNiDZWETXWzPtTgDBN4c/KUCrcSDhdaTrzPwc1XxPydJSEvH30+MT/1dpJtXrwZIkm8k/
	qOGrEMZB2kWNkt5RO1AnFhfrqLKZSLcz+jemgBrgSPsBrsGdxNDz/Vr58uVS+vJTMMas=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vglWg-0002RD-62;
	Fri, 16 Jan 2026 15:14:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vglWe-0002Qy-ST;
 Fri, 16 Jan 2026 15:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XoBRHt16IJ3n5doYM6de0GyIKu5/7IipaX4IaeHvHjw=; b=a1DAggEVy5ZCdm6BZC9QiUiGuH
 c+JniF67la/3xVGP26Mb3BkjwXnMOLwITmS6pZk1DlUNNxM2vZcM2jOaRiv00PuIID3DquE8cRWqJ
 CtR6C7g6TTzYFC0z6LEeSRFdQSNPVZhBwELYHbyI2cNBJRjdxUVSuJVuhGDtRwR8SpNI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XoBRHt16IJ3n5doYM6de0GyIKu5/7IipaX4IaeHvHjw=; b=FblSN29h1m6HRlvvPo1Oo46yCc
 rYXwCkDyC8by4baQwc1QARNOZ86lKHIsSAHj5VnENRKv9zlpSmWDejhK2eW1f9w7QFsyDx/1oTQfO
 +Wza7pIqkL2GBw2gA2hW+s2yamo2gszAMB6xV0LGpNgbmcbMBJryQUMqpqiFDK/2lMjw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vglWe-0003xO-A2; Fri, 16 Jan 2026 15:14:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5A89F60150;
 Fri, 16 Jan 2026 15:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83716C116C6;
 Fri, 16 Jan 2026 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768576441;
 bh=tpTMvFa8WoYlxudKpX8gL9LyC0nYKPD87OgBqTCF7oo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=sOQIWvxjf0X9zTvo0MmiqKYnTp+VBuPh77NyyR+yp5oT+0zUR5rdA3BVyP4ki9RIP
 19DMhEVaTdYW2BmN5vSBmlzFAefvTdRUypqyC1egnFSeEfmhbgdTa9n1Hkq7gezA3g
 9/lmcXHh0NTrBy6CHRHSZh+7fo/g25F8IyeVGyEJ7Fku2hDbmPX17KntFgZI2Rqjg6
 v1Lg2MSxy9d4Q3s3cmJd69FTkh8YcxZWqBU51gjheg0LEUOmR8Og9VIOlE5YZt7u7x
 Ngtrq6Dy3tNyRlI8hYjdERDhJv0B8nd7wRVN4T4pwG3HCF4Sj/LJ/RymfJ/xVm1Qzz
 RQtOpfQqnuLcg==
Message-ID: <0cb769af0673ea1c28df7fa9a1cefe3ec23bc367.camel@kernel.org>
To: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 16 Jan 2026 10:13:52 -0500
In-Reply-To: <CAOQ4uxhkZNueydP0tTCAj6tuzKWPTYB7=JR_hb4gaavSKQ8C2w@mail.gmail.com>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <20260115-exportfs-nfsd-v1-29-8e80160e3c0c@kernel.org>
 <CAOQ4uxg304=s1Uoeayy3rm1e154Nf7ScOgseJHThw4uQjKwk0A@mail.gmail.com>
 <8e4c3df4828351c677186bf018061f2b1fd1b48e.camel@kernel.org>
 <CAOQ4uxhkZNueydP0tTCAj6tuzKWPTYB7=JR_hb4gaavSKQ8C2w@mail.gmail.com>
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
 Content preview:  On Fri, 2026-01-16 at 15:46 +0100, Amir Goldstein wrote: >
 On Fri, Jan 16, 2026 at 1:36 PM Jeff Layton <jlayton@kernel.org> wrote: >
 > > > On Thu, 2026-01-15 at 20:23 +0100, Amir Goldstein wrote: > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vglWe-0003xO-A2
Subject: Re: [f2fs-dev] [PATCH 29/29] nfsd: only allow filesystems that set
 EXPORT_OP_STABLE_HANDLES
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
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Ilya Dryomov <idryomov@gmail.com>,
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
 ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
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

T24gRnJpLCAyMDI2LTAxLTE2IGF0IDE1OjQ2ICswMTAwLCBBbWlyIEdvbGRzdGVpbiB3cm90ZToK
PiBPbiBGcmksIEphbiAxNiwgMjAyNiBhdCAxOjM24oCvUE0gSmVmZiBMYXl0b24gPGpsYXl0b25A
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiAKPiA+IE9uIFRodSwgMjAyNi0wMS0xNSBhdCAyMDoyMyAr
MDEwMCwgQW1pciBHb2xkc3RlaW4gd3JvdGU6Cj4gPiA+IE9uIFRodSwgSmFuIDE1LCAyMDI2IGF0
IDY6NTHigK9QTSBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4g
PiAKPiA+ID4gPiBTb21lIGZpbGVzeXN0ZW1zIGhhdmUgZ3Jvd24gZXhwb3J0IG9wZXJhdGlvbnMg
aW4gb3JkZXIgdG8gcHJvdmlkZQo+ID4gPiA+IGZpbGVoYW5kbGVzIGZvciBsb2NhbCB1c2FnZS4g
U29tZSBvZiB0aGVzZSBmaWxlc3lzdGVtcyBhcmUgdW5zdWl0YWJsZQo+ID4gPiA+IGZvciB1c2Ug
d2l0aCBuZnNkLCBzaW5jZSB0aGVpciBmaWxlaGFuZGxlcyBhcmUgbm90IHBlcnNpc3RlbnQgYWNy
b3NzCj4gPiA+ID4gcmVib290cy4KPiA+ID4gPiAKPiA+ID4gPiBJbiBfX2ZoX3ZlcmlmeSwgY2hl
Y2sgd2hldGhlciBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMgaXMgc2V0Cj4gPiA+ID4gYW5kIHJl
dHVybiBuZnNlcnJfc3RhbGUgaWYgaXQgaXNuJ3QuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4g
PiAgZnMvbmZzZC9uZnNmaC5jIHwgNCArKysrCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZnMvbmZzZC9uZnNmaC5j
IGIvZnMvbmZzZC9uZnNmaC5jCj4gPiA+ID4gaW5kZXggZWQ4NWRkNDNkYTE4ZTZkNGM0NjY3ZmYx
NGRjMDM1ZjJlYWNmZjFkNi4uZGE5ZDVmYjJlNjYxM2MyNzA3MTk1ZGEyZTg2NzhiM2ZjYjNkNDQ0
ZCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9mcy9uZnNkL25mc2ZoLmMKPiA+ID4gPiArKysgYi9mcy9u
ZnNkL25mc2ZoLmMKPiA+ID4gPiBAQCAtMzM0LDYgKzMzNCwxMCBAQCBfX2ZoX3ZlcmlmeShzdHJ1
Y3Qgc3ZjX3Jxc3QgKnJxc3RwLAo+ID4gPiA+ICAgICAgICAgZGVudHJ5ID0gZmhwLT5maF9kZW50
cnk7Cj4gPiA+ID4gICAgICAgICBleHAgPSBmaHAtPmZoX2V4cG9ydDsKPiA+ID4gPiAKPiA+ID4g
PiArICAgICAgIGVycm9yID0gbmZzZXJyX3N0YWxlOwo+ID4gPiA+ICsgICAgICAgaWYgKCEoZGVu
dHJ5LT5kX3NiLT5zX2V4cG9ydF9vcC0+ZmxhZ3MgJiBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMp
KQo+ID4gPiA+ICsgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ID4gPiArCj4gPiA+ID4gICAg
ICAgICB0cmFjZV9uZnNkX2ZoX3ZlcmlmeShycXN0cCwgZmhwLCB0eXBlLCBhY2Nlc3MpOwo+ID4g
PiA+IAo+ID4gPiAKPiA+ID4gSURHSS4gRG9uJ3QgeW91IHdhbnQgIHRvIGRlbnkgdGhlIGV4cG9y
dCBvZiB0aG9zZSBmcyBpbiBjaGVja19leHBvcnQoKT8KPiA+ID4gQnkgdGhlIHNhbWUgbG9naWMg
dGhhdCBjaGVja19leHBvcnQoKSBjaGVja3MgZm9yIGNhbl9kZWNvZGVfZmgoKQo+ID4gPiBub3Qg
Zm9yIGNhbl9lbmNvZGVfZmgoKS4KPiA+ID4gCj4gPiAKPiA+IEl0IGNlcnRhaW5seSB3b24ndCBo
dXJ0IHRvIGFkZCBhIGNoZWNrIGZvciB0aGlzIHRvIGNoZWNrX2V4cG9ydCgpLCBhbmQKPiA+IEkn
dmUgZ29uZSBhaGVhZCBhbmQgZG9uZSBzby4gVG8gYmUgY2xlYXIsIGRvaW5nIHRoYXQgd29uJ3Qg
cHJldmVudCB0aGUKPiA+IGZpbGVzeXN0ZW0gZnJvbSBiZWluZyBleHBvcnRlZCwgYnV0IHlvdSB3
aWxsIGdldCBhIHdhcm5pbmcgbGlrZSB0aGlzCj4gPiB3aGVuIHlvdSB0cnk6Cj4gPiAKPiA+ICAg
ICBleHBvcnRmczogL3N5cy9mcy9jZ3JvdXAgZG9lcyBub3Qgc3VwcG9ydCBORlMgZXhwb3J0Cj4g
PiAKPiA+IFRoYXQgZXhwb3J0IHdpbGwgc3RpbGwgc2hvdyB1cCBpbiBtb3VudGQgdGhvdWdoLCBz
byB0aGlzIGlzIGp1c3QgYQo+ID4gd2FybmluZy4gVHJ5aW5nIHRvIG1vdW50IGl0IHRob3VnaCB3
aWxsIGZhaWwuCj4gPiAKPiAKPiBPaCwgSSBkaWQgbm90IGtub3cuIFdoYXQgYW4gb2RkIHVzZXIg
ZXhwZXJpZW5jZS4KPiBBbnl3YXksIGJldHRlciB0aGFuIG5vIHdhcm5pbmcgYXQgYWxsLgo+IAoK
SW5kZWVkLgoKVGhlIGNhdGNoIGlzIHRoYXQgdGhpcyB3b24ndCBjYXRjaCBhbGwgc2NlbmFyaW9z
IHdoZXJlIHRoYXQgZnMgY291bGQgYmUKZXhwb3J0ZWQuIElmIHlvdSBkbyBzb21ldGhpbmcgbGlr
ZSB0aGlzIGluIC9ldGMvZXhwb3J0czoKCiAgICAgLwkqKHJ3LGNyb3NzbW50LGluc2VjdXJlLG5v
X3Jvb3Rfc3F1YXNoKQoKLi4ueW91IHdvbid0IHNlZSBhIHdhcm5pbmcuIEdyYW50ZWQsIGRvaW5n
IHRoZSBhYm92ZSBpcyBfZHVtYl8gYnV0IGl0CmlsbHVzdHJhdGVzIHRoYXQgaXQncyBub3QgcG9z
c2libGUgdG8gY29tcGxldGVseSB2ZXQgdGhlIGV4cG9ydCB0YWJsZS4KRXZlbiBpZiB5b3UgY291
bGQsIGl0IGNvdWxkIGNoYW5nZSBvdXQgZnJvbSB1bmRlciB5b3UuCgpXZSBkbyBoYXZlIHNvbWUg
aWRlYXMgYWJvdXQgdXBkYXRpbmcgdGhlIGV4cG9ydCBtYW5hZ2VtZW50LCBidXQgbm90aGluZwpj
b25jcmV0ZSB5ZXQuIEV2ZW4gdGhlbiwgd2UnbGwgbmVlZCB0byBtYWludGFpbiBiYWNrd2FyZCBj
b21wYXRpYmlsaXR5LApzbyBJIGRvdWJ0IHdlIGNhbiBjaGFuZ2UgdGhlIHVzZXIgZXhwZXJpZW5j
ZSBpbiBhIGZ1bmRhbWVudGFsIHdheSBhdAp0aGlzIHBvaW50LgotLSAKSmVmZiBMYXl0b24gPGps
YXl0b25Aa2VybmVsLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
