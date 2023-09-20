Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4707A765B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Sep 2023 10:51:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qisvU-0005iP-4D;
	Wed, 20 Sep 2023 08:51:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xry111@linuxfromscratch.org>) id 1qisvS-0005iE-Mp
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 08:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aOrmEQVHlGP4NIc/KsyybAf3h59NYTPKZ1pCQKmMgow=; b=a7zE9yWuRpaevNwM3rzx1p9wZa
 pFNyRIDkjgOPzXOP9/cOmxkQu7SrAepDURbYHPx427KroQ/A+Y44HU80ApVYepF02/p1r/YXfZ7Se
 LsT5Xb2b3HE/mcgy1qsGRSm+8LB3iXpvknA+onixQW+h8Q5LzcwoHHn9sTDLzQdRfmZE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aOrmEQVHlGP4NIc/KsyybAf3h59NYTPKZ1pCQKmMgow=; b=TDdjvo84T4OWx955oJelZGMh2z
 uhWHFJo5ZF2Cti70PAcZ7SAPcDo0HKnb3mhZHbdegf4nSiBQ05eqwooXZ959OGsRcxUznrxbcYOGj
 tFKbDYZfM/GzKFbNgwFsGG/AsawUz1QQ9e2ym28iEri4uyKb0H5xMVQmrQyNxy1PaRO0=;
Received: from [208.118.68.85] (helo=rivendell.linuxfromscratch.org)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qisvP-00GOFR-6c for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 08:51:14 +0000
Received: from [192.168.3.211] (unknown [36.44.137.238])
 by rivendell.linuxfromscratch.org (Postfix) with ESMTPSA id 1EF0B1C1DCD;
 Wed, 20 Sep 2023 08:50:31 +0000 (GMT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.0 at rivendell.linuxfromscratch.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfromscratch.org;
 s=cert4; t=1695199854;
 bh=3Z1+GidcJMavvwBcREoqn7oXqIoMxeJ9etaya6Fu9M0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=eObk1KcHIFgyOq0PM0GHhNP2/hul2wPtxGcaRxEcqFDCkKZIPj2t/9TxEWDmhO6YZ
 aezBQiQYv28rq2gmvKDO1vLC0cjJ4lkZqX+AWhOX80av065LcuDU/dQQlCUdAz+F5v
 EMnFKjI7RQ2SB6tMDzdbLxzYFo10Nqo0SoW1H1a/NoxdCJZXpxyBoREnlKsc2adPNi
 tbCaBepclPdYSRgGsku+r9JOsLdUStV6efcHtTldH9x3uUyad5uMYo/g4osBB/tLJ8
 12slT1IuoRsY1p0CjzdaDH1JpjFGWIS5aueo9MwBbmOsZYKMRjHoGNDe8fOb9NSvgA
 Jjo932cwggiGw==
Message-ID: <34d45270efccc44b64af835e73c1d1e111ce5098.camel@linuxfromscratch.org>
To: Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>
Date: Wed, 20 Sep 2023 16:50:26 +0800
In-Reply-To: <20230920-leerung-krokodil-52ec6cb44707@brauner>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <20230920-leerung-krokodil-52ec6cb44707@brauner>
User-Agent: Evolution 3.50.0 
MIME-Version: 1.0
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,RDNS_NONE,SPF_FAIL,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=ham
 autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
 rivendell.linuxfromscratch.org
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 2023-09-20 at 10:41 +0200, Christian Brauner wrote:
 > > > f1 was last written to *after* f2 was last written to. If the timestamp
 of f1 > > > is then lower than the timestamp of f2, timestamps [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1qisvP-00GOFR-6c
Subject: Re: [f2fs-dev] [PATCH v7 12/13] ext4: switch to multigrain
 timestamps
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
From: Xi Ruoyao via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Xi Ruoyao <xry111@linuxfromscratch.org>
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Jan Kara <jack@suse.cz>, linux-xfs@vger.kernel.org, "Darrick
 J. Wong" <djwong@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Marc Dionne <marc.dionne@auristor.com>, codalist@coda.cs.cmu.edu,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 Amir Goldstein <l@gmail.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 bug-gnulib@gnu.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Benjamin Coddington <bcodding@redhat.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 Ilya Dryomov <idryomov@gmail.com>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 linux-cifs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Gao Xiang <xiang@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-nfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, Bo b Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Bruno Haible <bruno@clisp.org>,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCAyMDIzLTA5LTIwIGF0IDEwOjQxICswMjAwLCBDaHJpc3RpYW4gQnJhdW5lciB3cm90
ZToKPiA+ID4gZjEgd2FzIGxhc3Qgd3JpdHRlbiB0byAqYWZ0ZXIqIGYyIHdhcyBsYXN0IHdyaXR0
ZW4gdG8uIElmIHRoZSB0aW1lc3RhbXAgb2YgZjEKPiA+ID4gaXMgdGhlbiBsb3dlciB0aGFuIHRo
ZSB0aW1lc3RhbXAgb2YgZjIsIHRpbWVzdGFtcHMgYXJlIGZ1bmRhbWVudGFsbHkgYnJva2VuLgo+
ID4gPiAKPiA+ID4gTWFueSB0aGluZ3MgaW4gdXNlci1zcGFjZSBkZXBlbmQgb24gdGltZXN0YW1w
cywgc3VjaCBhcyBidWlsZCBzeXN0ZW0KPiA+ID4gY2VudGVyZWQgYXJvdW5kICdtYWtlJywgYnV0
IGFsc28gJ2ZpbmQgLi4uIC1uZXdlciAuLi4nLgo+ID4gPiAKPiA+IAo+ID4gCj4gPiBXaGF0IGRv
ZXMgYnJlYWthZ2Ugd2l0aCBtYWtlIGxvb2sgbGlrZSBpbiB0aGlzIHNpdHVhdGlvbj8gVGhlICJm
dXp6Igo+ID4gaGVyZSBpcyBnb2luZyB0byBiZSBvbiB0aGUgb3JkZXIgb2YgYSBqaWZmeS4gVGhl
IHR5cGljYWwgY2FzZSBmb3IgbWFrZQo+ID4gdGltZXN0YW1wIGNvbXBhcmlzb25zIGlzIGNvbXBh
cmluZyBzb3VyY2UgZmlsZXMgdnMuIGEgYnVpbGQgdGFyZ2V0LiBJZgo+ID4gdGhvc2UgYXJlIGJl
aW5nIHdyaXR0ZW4gbmVhcmx5IHNpbXVsdGFuZW91c2x5LCB0aGVuIHRoYXQgY291bGQgYmUgYW4K
PiA+IGlzc3VlLCBidXQgaXMgdGhhdCBhIHR5cGljYWwgYmVoYXZpb3I/IEl0IHNlZW1zIGxpa2Ug
aXQgd291bGQgYmUgaGFyZCB0bwo+ID4gcmVseSBvbiB0aGF0IGFueXdheSwgZXNwLiBnaXZlbiBm
aWxlc3lzdGVtcyBsaWtlIE5GUyB0aGF0IGNhbiBkbyBsYXp5Cj4gPiB3cml0ZWJhY2suCj4gPiAK
PiA+IE9uZSBvZiB0aGUgb3BlcmF0aW5nIHByaW5jaXBsZXMgd2l0aCB0aGlzIHNlcmllcyBpcyB0
aGF0IHRpbWVzdGFtcHMgY2FuCj4gPiBiZSBvZiB2YXJ5aW5nIGdyYW51bGFyaXR5IGJldHdlZW4g
ZGlmZmVyZW50IGZpbGVzLiBOb3RlIHRoYXQgTGludXgKPiA+IGFscmVhZHkgdmlvbGF0ZXMgdGhp
cyBhc3N1bXB0aW9uIHdoZW4geW91J3JlIHdvcmtpbmcgYWNyb3NzIGZpbGVzeXN0ZW1zCj4gPiBv
ZiBkaWZmZXJlbnQgdHlwZXMuCj4gPiAKPiA+IEFzIHRvIHBvdGVudGlhbCBmaXhlcyBpZiB0aGlz
IGlzIGEgcmVhbCBwcm9ibGVtOgo+ID4gCj4gPiBJIGRvbid0IHJlYWxseSB3YW50IHRvIHB1dCB0
aGlzIGJlaGluZCBhIG1vdW50IG9yIG1rZnMgb3B0aW9uIChhJ2xhCj4gPiByZWxhdGltZSwgZXRj
LiksIGJ1dCB0aGF0IGlzIG9uZSBwb3NzaWJpbGl0eS4KPiA+IAo+ID4gSSB3b25kZXIgaWYgaXQg
d291bGQgYmUgZmVhc2libGUgdG8ganVzdCBhZHZhbmNlIHRoZSBjb2Fyc2UtZ3JhaW5lZAo+ID4g
Y3VycmVudF90aW1lIHdoZW5ldmVyIHdlIGVuZCB1cCB1cGRhdGluZyBhIGN0aW1lIHdpdGggYSBm
aW5lLWdyYWluZWQKPiA+IHRpbWVzdGFtcD8gSXQgbWlnaHQgcHJvZHVjZSBzb21lIGlub2RlIHdy
aXRlIGFtcGxpZmljYXRpb24uIEZpbGVzIHRoYXQKPiAKPiBMZXNzIHRoYW4gaWRlYWwgaW1oby4K
PiAKPiBJZiB0aGlzIHJpc2tzIGJyZWFraW5nIGV4aXN0aW5nIHdvcmtsb2FkcyBieSBlbmFibGlu
ZyBpdCB1bmNvbmRpdGlvbmFsbHkKPiBhbmQgdGhlcmUgaXNuJ3QgYSBjbGVhciB3YXkgdG8gZGV0
ZWN0IGFuZCBoYW5kbGUgdGhlc2Ugc2l0dWF0aW9ucwo+IHdpdGhvdXQgcmlzayBvZiByZWdyZXNz
aW9uIHRoZW4gd2Ugc2hvdWxkIG1vdmUgdGhpcyBiZWhpbmQgYSBtb3VudAo+IG9wdGlvbi4KPiAK
PiBTbyBob3cgYWJvdXQgdGhlIGZvbGxvd2luZzoKPiAKPiBGcm9tIGNiMTRhZGQ0MjE5NjdmNmUz
NzRlYjc3YzM2Y2M0YTA1MjZiMTBkMTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gRnJvbTog
Q2hyaXN0aWFuIEJyYXVuZXIgPGJyYXVuZXJAa2VybmVsLm9yZz4KPiBEYXRlOiBXZWQsIDIwIFNl
cCAyMDIzIDEwOjAwOjA4ICswMjAwCj4gU3ViamVjdDogW1BBVENIXSB2ZnM6IG1vdmUgbXVsdGkt
Z3JhaW4gdGltZXN0YW1wcyBiZWhpbmQgYSBtb3VudCBvcHRpb24KPiAKPiBXaGlsZSB3ZSBpbml0
aWFsbHkgdGhvdWdodCB3ZSBjYW4gZG8gdGhpcyB1bmNvbmRpdGlvbmFsbHkgaXQgdHVybnMgb3V0
Cj4gdGhhdCB0aGlzIG1pZ2h0IGJyZWFrIGV4aXN0aW5nIHdvcmtsb2FkcyB0aGF0IHJlbHkgb24g
dGltZXN0YW1wcyBpbiB2ZXJ5Cj4gc3BlY2lmaWMgd2F5cyBhbmQgd2UgYWx3YXlzIGtuZXcgdGhp
cyB3YXMgYSBwb3NzaWJpbGl0eS4gTW92ZQo+IG11bHRpLWdyYWluIHRpbWVzdGFtcHMgYmVoaW5k
IGEgdmZzIG1vdW50IG9wdGlvbi4KCkkgYWdyZWUgd2l0aCB0aGlzIHNvbHV0aW9uLgoKWW91IGNh
biBhZGQgc29tZSBtZXRhaW5mbzoKClJlcG9ydGVkLWJ5OiBLZW4gTW9mZmF0IDxrZW5AbGludXhm
cm9tc2NyYXRjaC5vcmc+CkJpc2VjdGVkLWJ5OiBYaSBSdW95YW8gPHhyeTExMUBsaW51eGZyb21z
Y3JhdGNoLm9yZz4KTGluazogaHR0cHM6Ly9saXN0cy5saW51eGZyb21zY3JhdGNoLm9yZy9zeW1w
YS9hcmMvbGZzLWRldi8yMDIzLTA5L21zZzAwMDM2Lmh0bWwKCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0aWFuIEJyYXVuZXIgPGJyYXVuZXJAa2VybmVsLm9yZz4KPiAtLS0KPiDCoGZzL2ZzX2NvbnRl
eHQuY8KgwqDCoMKgIHwgMTggKysrKysrKysrKysrKysrKysrCj4gwqBmcy9pbm9kZS5jwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0KPiDCoGZzL3Byb2NfbmFtZXNwYWNlLmMgfMKgIDEgKwo+
IMKgZnMvc3RhdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGluY2x1ZGUvbGlu
dXgvZnMuaMKgIHzCoCA0ICsrKy0KPiDCoDUgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvZnNfY29udGV4dC5jIGIvZnMv
ZnNfY29udGV4dC5jCj4gaW5kZXggYTBhZDdhMGM0NjgwLi5kZDRkYWRlMGJiOWUgMTAwNjQ0Cj4g
LS0tIGEvZnMvZnNfY29udGV4dC5jCj4gKysrIGIvZnMvZnNfY29udGV4dC5jCj4gQEAgLTQ0LDYg
KzQ0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjb25zdGFudF90YWJsZSBjb21tb25fc2V0X3Ni
X2ZsYWdbXSA9IHsKPiDCoAl7ICJtYW5kIiwJU0JfTUFORExPQ0sgfSwKPiDCoAl7ICJybyIsCQlT
Ql9SRE9OTFkgfSwKPiDCoAl7ICJzeW5jIiwJU0JfU1lOQ0hST05PVVMgfSwKPiArCXsgIm1ndGlt
ZSIsCVNCX01HVElNRSB9LAo+IMKgCXsgfSwKPiDCoH07Cj4gwqAKPiBAQCAtNTIsMTggKzUzLDMy
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY29uc3RhbnRfdGFibGUgY29tbW9uX2NsZWFyX3NiX2Zs
YWdbXSA9IHsKPiDCoAl7ICJub2xhenl0aW1lIiwJU0JfTEFaWVRJTUUgfSwKPiDCoAl7ICJub21h
bmQiLAlTQl9NQU5ETE9DSyB9LAo+IMKgCXsgInJ3IiwJCVNCX1JET05MWSB9LAo+ICsJeyAibm9t
Z3RpbWUiLAlTQl9NR1RJTUUgfSwKPiDCoAl7IH0sCj4gwqB9Owo+IMKgCj4gK3N0YXRpYyBpbmxp
bmUgaW50IGNoZWNrX21ndGltZSh1bnNpZ25lZCBpbnQgdG9rZW4sIGNvbnN0IHN0cnVjdCBmc19j
b250ZXh0ICpmYykKPiArewo+ICsJaWYgKHRva2VuICE9IFNCX01HVElNRSkKPiArCQlyZXR1cm4g
MDsKPiArCWlmICghKGZjLT5mc190eXBlLT5mc19mbGFncyAmIEZTX01HVElNRSkpCj4gKwkJcmV0
dXJuIGludmFsZihmYywgIkZpbGVzeXN0ZW0gZG9lc24ndCBzdXBwb3J0IG11bHRpLWdyYWluIHRp
bWVzdGFtcHMiKTsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+IMKgLyoKPiDCoCAqIENoZWNrIGZv
ciBhIGNvbW1vbiBtb3VudCBvcHRpb24gdGhhdCBtYW5pcHVsYXRlcyBzX2ZsYWdzLgo+IMKgICov
Cj4gwqBzdGF0aWMgaW50IHZmc19wYXJzZV9zYl9mbGFnKHN0cnVjdCBmc19jb250ZXh0ICpmYywg
Y29uc3QgY2hhciAqa2V5KQo+IMKgewo+IMKgCXVuc2lnbmVkIGludCB0b2tlbjsKPiArCWludCBy
ZXQ7Cj4gwqAKPiDCoAl0b2tlbiA9IGxvb2t1cF9jb25zdGFudChjb21tb25fc2V0X3NiX2ZsYWcs
IGtleSwgMCk7Cj4gwqAJaWYgKHRva2VuKSB7Cj4gKwkJcmV0ID0gY2hlY2tfbWd0aW1lKHRva2Vu
LCBmYyk7Cj4gKwkJaWYgKHJldCkKPiArCQkJcmV0dXJuIHJldDsKPiDCoAkJZmMtPnNiX2ZsYWdz
IHw9IHRva2VuOwo+IMKgCQlmYy0+c2JfZmxhZ3NfbWFzayB8PSB0b2tlbjsKPiDCoAkJcmV0dXJu
IDA7Cj4gQEAgLTcxLDYgKzg2LDkgQEAgc3RhdGljIGludCB2ZnNfcGFyc2Vfc2JfZmxhZyhzdHJ1
Y3QgZnNfY29udGV4dCAqZmMsIGNvbnN0IGNoYXIgKmtleSkKPiDCoAo+IMKgCXRva2VuID0gbG9v
a3VwX2NvbnN0YW50KGNvbW1vbl9jbGVhcl9zYl9mbGFnLCBrZXksIDApOwo+IMKgCWlmICh0b2tl
bikgewo+ICsJCXJldCA9IGNoZWNrX21ndGltZSh0b2tlbiwgZmMpOwo+ICsJCWlmIChyZXQpCj4g
KwkJCXJldHVybiByZXQ7Cj4gwqAJCWZjLT5zYl9mbGFncyAmPSB+dG9rZW47Cj4gwqAJCWZjLT5z
Yl9mbGFnc19tYXNrIHw9IHRva2VuOwo+IMKgCQlyZXR1cm4gMDsKPiBkaWZmIC0tZ2l0IGEvZnMv
aW5vZGUuYyBiL2ZzL2lub2RlLmMKPiBpbmRleCA1NDIzN2Y0MjQyZmYuLmZkMWEyMzkwYWFhMyAx
MDA2NDQKPiAtLS0gYS9mcy9pbm9kZS5jCj4gKysrIGIvZnMvaW5vZGUuYwo+IEBAIC0yMTQxLDcg
KzIxNDEsNyBAQCBFWFBPUlRfU1lNQk9MKGN1cnJlbnRfbWd0aW1lKTsKPiDCoAo+IMKgc3RhdGlj
IHN0cnVjdCB0aW1lc3BlYzY0IGN1cnJlbnRfY3RpbWUoc3RydWN0IGlub2RlICppbm9kZSkKPiDC
oHsKPiAtCWlmIChpc19tZ3RpbWUoaW5vZGUpKQo+ICsJaWYgKElTX01HVElNRShpbm9kZSkpCj4g
wqAJCXJldHVybiBjdXJyZW50X21ndGltZShpbm9kZSk7Cj4gwqAJcmV0dXJuIGN1cnJlbnRfdGlt
ZShpbm9kZSk7Cj4gwqB9Cj4gQEAgLTI1ODgsNyArMjU4OCw3IEBAIHN0cnVjdCB0aW1lc3BlYzY0
IGlub2RlX3NldF9jdGltZV9jdXJyZW50KHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gwqAJCW5vdyA9
IGN1cnJlbnRfdGltZShpbm9kZSk7Cj4gwqAKPiDCoAkJLyogSnVzdCBjb3B5IGl0IGludG8gcGxh
Y2UgaWYgaXQncyBub3QgbXVsdGlncmFpbiAqLwo+IC0JCWlmICghaXNfbWd0aW1lKGlub2RlKSkg
ewo+ICsJCWlmICghSVNfTUdUSU1FKGlub2RlKSkgewo+IMKgCQkJaW5vZGVfc2V0X2N0aW1lX3Rv
X3RzKGlub2RlLCBub3cpOwo+IMKgCQkJcmV0dXJuIG5vdzsKPiDCoAkJfQo+IGRpZmYgLS1naXQg
YS9mcy9wcm9jX25hbWVzcGFjZS5jIGIvZnMvcHJvY19uYW1lc3BhY2UuYwo+IGluZGV4IDI1MGVi
NWJmN2I1Mi4uMDhmNWJmNGQyYzZjIDEwMDY0NAo+IC0tLSBhL2ZzL3Byb2NfbmFtZXNwYWNlLmMK
PiArKysgYi9mcy9wcm9jX25hbWVzcGFjZS5jCj4gQEAgLTQ5LDYgKzQ5LDcgQEAgc3RhdGljIGlu
dCBzaG93X3NiX29wdHMoc3RydWN0IHNlcV9maWxlICptLCBzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNi
KQo+IMKgCQl7IFNCX0RJUlNZTkMsICIsZGlyc3luYyIgfSwKPiDCoAkJeyBTQl9NQU5ETE9DSywg
IixtYW5kIiB9LAo+IMKgCQl7IFNCX0xBWllUSU1FLCAiLGxhenl0aW1lIiB9LAo+ICsJCXsgU0Jf
TUdUSU1FLCAiLG1ndGltZSIgfSwKPiDCoAkJeyAwLCBOVUxMIH0KPiDCoAl9Owo+IMKgCWNvbnN0
IHN0cnVjdCBwcm9jX2ZzX29wdHMgKmZzX2luZm9wOwo+IGRpZmYgLS1naXQgYS9mcy9zdGF0LmMg
Yi9mcy9zdGF0LmMKPiBpbmRleCA2ZTYwMzg5ZDZhMTUuLjJmMThkZDVkZTE4YiAxMDA2NDQKPiAt
LS0gYS9mcy9zdGF0LmMKPiArKysgYi9mcy9zdGF0LmMKPiBAQCAtOTAsNyArOTAsNyBAQCB2b2lk
IGdlbmVyaWNfZmlsbGF0dHIoc3RydWN0IG1udF9pZG1hcCAqaWRtYXAsIHUzMiByZXF1ZXN0X21h
c2ssCj4gwqAJc3RhdC0+c2l6ZSA9IGlfc2l6ZV9yZWFkKGlub2RlKTsKPiDCoAlzdGF0LT5hdGlt
ZSA9IGlub2RlLT5pX2F0aW1lOwo+IMKgCj4gLQlpZiAoaXNfbWd0aW1lKGlub2RlKSkgewo+ICsJ
aWYgKElTX01HVElNRShpbm9kZSkpIHsKPiDCoAkJZmlsbF9tZ19jbXRpbWUoc3RhdCwgcmVxdWVz
dF9tYXNrLCBpbm9kZSk7Cj4gwqAJfSBlbHNlIHsKPiDCoAkJc3RhdC0+bXRpbWUgPSBpbm9kZS0+
aV9tdGltZTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mcy5oIGIvaW5jbHVkZS9saW51
eC9mcy5oCj4gaW5kZXggNGFlYjNmYTExOTI3Li4wM2U0MTVmYjNhN2MgMTAwNjQ0Cj4gLS0tIGEv
aW5jbHVkZS9saW51eC9mcy5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9mcy5oCj4gQEAgLTExMTQs
NiArMTExNCw3IEBAIGV4dGVybiBpbnQgc2VuZF9zaWd1cmcoc3RydWN0IGZvd25fc3RydWN0ICpm
b3duKTsKPiDCoCNkZWZpbmUgU0JfTk9ERVbCoMKgwqDCoMKgwqDCoCBCSVQoMikJLyogRGlzYWxs
b3cgYWNjZXNzIHRvIGRldmljZSBzcGVjaWFsIGZpbGVzICovCj4gwqAjZGVmaW5lIFNCX05PRVhF
Q8KgwqDCoMKgwqDCoCBCSVQoMykJLyogRGlzYWxsb3cgcHJvZ3JhbSBleGVjdXRpb24gKi8KPiDC
oCNkZWZpbmUgU0JfU1lOQ0hST05PVVPCoCBCSVQoNCkJLyogV3JpdGVzIGFyZSBzeW5jZWQgYXQg
b25jZSAqLwo+ICsjZGVmaW5lIFNCX01HVElNRQlCSVQoNSkJLyogVXNlIG11bHRpLWdyYWluIHRp
bWVzdGFtcHMgKi8KPiDCoCNkZWZpbmUgU0JfTUFORExPQ0vCoMKgwqDCoCBCSVQoNikJLyogQWxs
b3cgbWFuZGF0b3J5IGxvY2tzIG9uIGFuIEZTICovCj4gwqAjZGVmaW5lIFNCX0RJUlNZTkPCoMKg
wqDCoMKgIEJJVCg3KQkvKiBEaXJlY3RvcnkgbW9kaWZpY2F0aW9ucyBhcmUgc3luY2hyb25vdXMg
Ki8KPiDCoCNkZWZpbmUgU0JfTk9BVElNRcKgwqDCoMKgwqAgQklUKDEwKQkvKiBEbyBub3QgdXBk
YXRlIGFjY2VzcyB0aW1lcy4gKi8KPiBAQCAtMjEwNSw2ICsyMTA2LDcgQEAgc3RhdGljIGlubGlu
ZSBib29sIHNiX3Jkb25seShjb25zdCBzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKSB7IHJldHVybiBz
Yi0+c19mbGFncwo+IMKgCQkJCQkoKGlub2RlKS0+aV9mbGFncyAmIChTX1NZTkN8U19ESVJTWU5D
KSkpCj4gwqAjZGVmaW5lIElTX01BTkRMT0NLKGlub2RlKQlfX0lTX0ZMRyhpbm9kZSwgU0JfTUFO
RExPQ0spCj4gwqAjZGVmaW5lIElTX05PQVRJTUUoaW5vZGUpCV9fSVNfRkxHKGlub2RlLCBTQl9S
RE9OTFl8U0JfTk9BVElNRSkKPiArI2RlZmluZSBJU19NR1RJTUUoaW5vZGUpCV9fSVNfRkxHKGlu
b2RlLCBTQl9NR1RJTUUpCj4gwqAjZGVmaW5lIElTX0lfVkVSU0lPTihpbm9kZSkJX19JU19GTEco
aW5vZGUsIFNCX0lfVkVSU0lPTikKPiDCoAo+IMKgI2RlZmluZSBJU19OT1FVT1RBKGlub2RlKQko
KGlub2RlKS0+aV9mbGFncyAmIFNfTk9RVU9UQSkKPiBAQCAtMjM2Niw3ICsyMzY4LDcgQEAgc3Ry
dWN0IGZpbGVfc3lzdGVtX3R5cGUgewo+IMKgICovCj4gwqBzdGF0aWMgaW5saW5lIGJvb2wgaXNf
bWd0aW1lKGNvbnN0IHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gwqB7Cj4gLQlyZXR1cm4gaW5vZGUt
Pmlfc2ItPnNfdHlwZS0+ZnNfZmxhZ3MgJiBGU19NR1RJTUU7Cj4gKwlyZXR1cm4gaW5vZGUtPmlf
c2ItPnNfZmxhZ3MgJiBTQl9NR1RJTUU7Cj4gwqB9Cj4gwqAKPiDCoGV4dGVybiBzdHJ1Y3QgZGVu
dHJ5ICptb3VudF9iZGV2KHN0cnVjdCBmaWxlX3N5c3RlbV90eXBlICpmc190eXBlLAoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
