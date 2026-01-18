Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB844D39B73
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 00:41:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:Message-id:Date:References:In-reply-to:To:From:MIME-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIH5MMsSmBFXFaml8v/YIyCZxLNbvIFEf2u7pwNvTVU=; b=N0OkkGKC/ykj5K3wjnYjZQTzbN
	ty70GeZEgcUCxeIhoQp4i3Xg9254ceuL20oeY+z9i+fKAo4DfO/8KV5qpGrZVt9QpWJUkgXgHpv7d
	wUU4AnGHT+R2nufcfv+cHayvi9nxNjJR5/MNtgg0PgSa/tsKn4blkpv8irUQgmi8j6kw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhcOW-0001wF-2U;
	Sun, 18 Jan 2026 23:41:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <neilb@ownmail.net>) id 1vhcOT-0001vu-V9;
 Sun, 18 Jan 2026 23:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Message-id:Date:References:In-reply-to:
 Subject:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cLWfoPH86LevLJ5dEarcfR/PsriG4IfSU/3wyLJz+qM=; b=PCnHgLDyBfCT73m1nXWzs9++EE
 4Mi1dp/kLddcxZ3yXI4VSS2gP90H3w3AUEuYjeApbv7IKOy5zVNB9xulYDPLid2etS+c1FaWWerdj
 q9LbiDfEb3TiCn/AjAHayz6WADGEHAhgTYkB6G4PRgAmSHzqsbSRSZ1DyWVUgClSKC+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Message-id:Date:References:In-reply-to:Subject:Cc:To:From:
 MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cLWfoPH86LevLJ5dEarcfR/PsriG4IfSU/3wyLJz+qM=; b=QO4t3+zgxhbksRFcOG444kvRoj
 Tt4zMiSjWfF36K7O+g5xpWmkun/yD/Z7ptrxzB75nL+MQTvRAsdAiFWl1yvz6HFrcUq/dDQIzDsqs
 jos/4yKM4muKmE1PZmyE9LVNledSLP5EqrnsgV1VJHvZcjU5zoQp5mIE5k5JwKDfw8vY=;
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhcOS-0005bL-OT; Sun, 18 Jan 2026 23:41:17 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailflow.phl.internal (Postfix) with ESMTP id 044C21380091;
 Sun, 18 Jan 2026 18:23:37 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Sun, 18 Jan 2026 18:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
 1768778616; x=1768785816; bh=cLWfoPH86LevLJ5dEarcfR/PsriG4IfSU/3
 wyLJz+qM=; b=Dmw+pxT+mC6s44HDc9ViDXhGQeEmMpmNYRhtbA86QNG09PG/Ljt
 hV85ad3/pbmWWoao3arxAaxDpjTC5inzso+nDbFp9L/ocC8FvAlBD0K6BSqaNtKf
 C3km6dpzlK9Qvfbi4RlAOZVQRcgXUx6BbC4NNZXExiSaEBKuKkrscbvke30TKEj0
 X3c26YUO2IvjIKJetsMrJSw+w98guonRsqk3c5wy7tRYCBiBKWCThYgKRu77I56g
 W/jQbAZlq9qtSmpdQFd+C0/rLGEaY2+/6NIHoLbGsxK4GkDCFlahWHWTEoSSJrS/
 k5ZW9JDwUgtzyYMplQwMaStWlBzRHOxECQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768778616; x=
 1768785816; bh=cLWfoPH86LevLJ5dEarcfR/PsriG4IfSU/3wyLJz+qM=; b=I
 GTmerXNj37QbHVnwq2oYiiWRj3dNMRiwAfGv/vxfYmuPEFFfJjUyW8ruiPn+ZUTw
 y96Ysjc5jkE+PfgCaUfHrNzF77vJ+CHZGj8ZZyFQniCqqNBHAWqccBt7S/bU1BV3
 Xnstc4VvhfH6RZxhRpoHiUxWSmJT21A47932/vgOnE5bxUOTfBJmpqxFnE86OITm
 uIg7MLSy3DGOcBFTzEd5fbzcCQYBFRkQDDO9qGFEXh5IfaJ//ctGtwtYx+/A3prw
 KJ8U8PGheh+G3smkjCFKvnDL2ddcVu2iicAyBab5Q6myVEkn0CxZuzyjCejBBwJF
 S/bm6s4tkRpP23BkNvcHg==
X-ME-Sender: <xms:dGttaT6YTMF6Fa6OlzcaAnM6fKqB4-4u0PRgZNSqPeyFmRns3uNnWw>
 <xme:dGttaZPm2B1Iaa5cFSjo7JQ9nDmVsbYtDSTRFdNHBicQ-lkECLbL66rkbZK2MZehf
 _rCs8HRq47ygqgxsOGTs2CMA0vWt7_AzG555MqfdnDHw6XZXQ>
X-ME-Received: <xmr:dGttaV5f0odFoTqo9Cm-3bXwUWdDQe8OS_nESoDmZC33EUUTmsf8jTlPE6SJiNhWOG4bTHrmA205RC8BAhr3cbUxrYEQhQL_108cgTPUPoLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeeitddtucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epvdeuteelkeejkeevteetvedtkeegleduieeftdeftefgtddtleejgfelgfevffeinecu
 ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehnvghilhgssehofihnmhgrihhlrdhnvghtpdhnsggp
 rhgtphhtthhopeejfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvhhirhhose
 iivghnihhvrdhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehguhhotghhuhhnhhgr
 ihesvhhivhhordgtohhmpdhrtghpthhtoheplhhinhhugidqgihfshesvhhgvghrrdhkvg
 hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhunhhiohhnfhhssehvghgvrhdr
 khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhhilhhfshesvhhgvghrrd
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnfhhssehvghgvrhdrkhgv
 rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
 gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfhhsuggvvhgvlhesvhhgvghr
 rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgvgihtgeesvhhgvghrrd
 hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:dGttaek4FCMZRAxWF6ejfvNQASS42yuMJmNL6Qr_VSzT2alP2kiMEQ>
 <xmx:dGttacMnrF3MIVkqtagaBM_OFbr4viUT9Quj4YPA_rDrR6FZMQe15g>
 <xmx:dGttaRUgcJhZGcX_B2l09umj3yAF-qAbVHXccqpyubd6rn2m6D7nYA>
 <xmx:dGttaVutjkDk_cSqIw9p5HdrWWt8-J_WTU_-yJ8LgZsJLx3q9gD8ew>
 <xmx:eGttab3JlD-dDEAYvGFUDpoqKXPgn7EN1IPurNldS43-2K0UKJSizYjm>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Jan 2026 18:23:15 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jeff Layton" <jlayton@kernel.org>
In-reply-to: <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>,
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>,
 <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>
Date: Mon, 19 Jan 2026 10:23:13 +1100
Message-id: <176877859306.16766.15009835437490907207@noble.neil.brown.name>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 16 Jan 2026, Jeff Layton wrote: > On Thu, 2026-01-15
 at 19:17 +0100, Amir Goldstein wrote: > > On Thu, Jan 15, 2026 at 6:48 PM
 Jeff Layton <jlayton@kernel.org> wrote: > > > > > > In recent yea [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [neilb(at)ownmail.net]
X-Headers-End: 1vhcOS-0005bL-OT
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
Reply-To: NeilBrown <neil@brown.name>
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 linux-unionfs@vger.kernel.org,
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
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, linux-mm@kvack.org,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
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

T24gRnJpLCAxNiBKYW4gMjAyNiwgSmVmZiBMYXl0b24gd3JvdGU6Cj4gT24gVGh1LCAyMDI2LTAx
LTE1IGF0IDE5OjE3ICswMTAwLCBBbWlyIEdvbGRzdGVpbiB3cm90ZToKPiA+IE9uIFRodSwgSmFu
IDE1LCAyMDI2IGF0IDY6NDjigK9QTSBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPiB3
cm90ZToKPiA+ID4gCj4gPiA+IEluIHJlY2VudCB5ZWFycywgYSBudW1iZXIgb2YgZmlsZXN5c3Rl
bXMgdGhhdCBjYW4ndCBwcmVzZW50IHN0YWJsZQo+ID4gPiBmaWxlaGFuZGxlcyBoYXZlIGdyb3du
IHN0cnVjdCBleHBvcnRfb3BlcmF0aW9ucy4gVGhleSd2ZSBtb3N0bHkgZG9uZQo+ID4gPiB0aGlz
IGZvciBsb2NhbCB1c2UtY2FzZXMgKGVuYWJsaW5nIG9wZW5fYnlfaGFuZGxlX2F0KCkgYW5kIHRo
ZSBsaWtlKS4KPiA+ID4gVW5mb3J0dW5hdGVseSwgaGF2aW5nIGV4cG9ydF9vcGVyYXRpb25zIGlz
IGdlbmVyYWxseSBzdWZmaWNpZW50IHRvIG1ha2UKPiA+ID4gYSBmaWxlc3lzdGVtIGJlIGNvbnNp
ZGVyZWQgZXhwb3J0YWJsZSB2aWEgbmZzZCwgYnV0IHRoYXQgcmVxdWlyZXMgdGhhdAo+ID4gPiB0
aGUgc2VydmVyIHByZXNlbnQgc3RhYmxlIGZpbGVoYW5kbGVzLgo+ID4gCj4gPiBXaGVyZSBkb2Vz
IHRoZSB0ZXJtICJzdGFibGUgZmlsZSBoYW5kbGVzIiBjb21lIGZyb20/IGFuZCB3aGF0IGRvZXMg
aXQgbWVhbj8KPiA+IFdoeSBub3QgInBlcnNpc3RlbnQgaGFuZGxlcyIsIHdoaWNoIGlzIGRlc2Ny
aWJlZCBpbiBORlMgYW5kIFNNQiBzcGVjcz8KPiA+IAo+ID4gTm90IHRvIG1lbnRpb24gdGhhdCBF
WFBPUlRfT1BfUEVSU0lTVEVOVF9IQU5ETEVTIHdhcyBBY2tlZAo+ID4gYnkgYm90aCBDaHJpc3Rv
cGggYW5kIENocmlzdGlhbjoKPiA+IAo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
ZnNkZXZlbC8yMDI2MDExNS1ydW5kZ2FuZy1sZWloZ2FiZS0xMjAxOGU5M2MwMGNAYnJhdW5lci8K
PiA+IAo+ID4gQW0gSSBtaXNzaW5nIGFueXRoaW5nPwo+ID4gCj4gCj4gVGhpcyB3YXMgQ2h1Y2sn
cyBzdWdnZXN0ZWQgbmFtZS4gSGlzIHBvaW50IHdhcyB0aGF0IFNUQUJMRSBtZWFucyB0aGF0Cj4g
dGhlIEZIJ3MgZG9uJ3QgY2hhbmdlIGR1cmluZyB0aGUgbGlmZXRpbWUgb2YgdGhlIGZpbGUuCj4g
Cj4gSSBkb24ndCBtdWNoIGNhcmUgYWJvdXQgdGhlIGZsYWcgbmFtZSwgc28gaWYgZXZlcnlvbmUg
bGlrZXMgUEVSU0lTVEVOVAo+IGJldHRlciBJJ2xsIHJvbGwgd2l0aCB0aGF0LgoKSSBkb24ndCBs
aWtlIFBFUlNJU1RFTlQuCkknZCByYXRoZXIgY2FsbCBhIHNwYWRlIGEgc3BhZGUuCgogIEVYUE9S
VF9PUF9TVVBQT1JUU19ORlNfRVhQT1JUCm9yCiAgRVhQT1JUX09QX05PVF9ORlNfQ09NUEFUSUJM
RQoKVGhlIGlzc3VlIGhlcmUgaXMgTkZTIGV4cG9ydCBhbmQgaW5kaXJlY3Rpb24gZG9lc24ndCBi
cmluZyBhbnkgYmVuZWZpdHMuCgpOZWlsQnJvd24KCgo+IAo+IEFsc28sIG9uIHRoZSBvdmwgcGF0
Y2g6IHdpbGwgZml4Li4uCj4gCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3IQo+IC0tIAo+IEplZmYg
TGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+Cj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
