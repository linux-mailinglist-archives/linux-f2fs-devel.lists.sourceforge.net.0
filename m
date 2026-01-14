Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D812BD1F8B6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 15:53:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:References:In-Reply-To:Message-Id:To:Date:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sV0G3PtkbOJKXx7lRxX4r28IOInFLQcNLJ01GKK1MyE=; b=lNdg9GelEcGDAHvJkeDk4mCFpJ
	G7H9t8g8QEmKgPcqMyWHPv7a7wn2tkutOdDXcwMQEYrajtlCstz8ylPAqC/VJDznX9TsFE4vUjx9k
	6LvOsfieGNLl2TIbwMiZlskfaBvYTup17JVaNJfo7WujJS/1Bc4aZoVKVnrUzZExJmDc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vg2FD-00025e-J4;
	Wed, 14 Jan 2026 14:53:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vg2FC-00025Y-C7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 14:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:
 References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xKp2mRX639Xrl1hAH25cMUgzI8E+8kaOkrWTmDZ9gJI=; b=UnUXCwsPAT3hnhULpr8kxyUxm5
 4Oa1UytK9ux+3iVuNZDtbA5gGC0VD9LV6/45vJNxqlK6BsJ2jbfvdmJkvAHiA/+adTBe7LYfHW/Yn
 Oc6ucmjIz9WeCwZlnaGunZBZCffua9Fh+v28IIhosCDoD84Mffs69Fl954yGqByWo0hg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:References:In-Reply-To:
 Message-Id:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xKp2mRX639Xrl1hAH25cMUgzI8E+8kaOkrWTmDZ9gJI=; b=D2R+Qcw7DAdwV6jIoHPw+irOxw
 DjQUZm0cw1qB2W9e1PyJLqT5apeXdoXZb1P79GGqJZ//zGMIZTfGQAmDJfSJmj6XdPm7VlG3hXHaV
 NB3MePuAxrKy8gGxj2hi6OXb+6DZ8Cq57o7sqCRz3oUrNlnvC8LKjiEfaABp0eQKrpIE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vg2FB-0002Xx-SS for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 14:53:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 45A6E43B9A;
 Wed, 14 Jan 2026 14:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570D6C2BC86;
 Wed, 14 Jan 2026 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768402384;
 bh=xKp2mRX639Xrl1hAH25cMUgzI8E+8kaOkrWTmDZ9gJI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=DZ4y7792kI2/4eE5VVTlEy1lwDXzIzeNr2iEGyaqqLMYTsvcSbwt8Bo54fNz4FJrn
 0CjwDI0jj4BZuie48fZ7X8+pogo2m9xuuz5ZkTKqUIWIWMb2aIahe3YDQ1OihTAsyY
 /kSWP/W66gnEfc8gA/3bKKHjBBbzoJWIQmXxEVECLl86oIEVeZwN3rPLewdZXpBLNQ
 4fSATB6J5Q9DEK8WPOow5IHJKdW2q5kckZv1zfwvc/Rackn2AgyYEGYSEHyTHq4m0k
 xzDo6EcWHnQhpPR7xCjV8fvC1tdohxaCsjAOcYPGoYZ1/+HzD4MzDToJBxFdCh/tru
 OSjQsEWq0CzTg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfauth.phl.internal (Postfix) with ESMTP id 32C9EF4006B;
 Wed, 14 Jan 2026 09:53:02 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
 by phl-compute-10.internal (MEProxy); Wed, 14 Jan 2026 09:53:02 -0500
X-ME-Sender: <xms:zq1naRMKLB-vQH7IFdq2onnRojQkLatu-C-zvbT0T438TRsV4tP_4A>
 <xme:zq1naewv4HVLitXOfBmI7UE_Y2gurDnKovxNhXptVvlpsUh9pO0bvYw7t9SjEJlzT
 sLy2LuSF83BZ36FBNWcuJt0cuqdzsP2xJUgTbLRAhgnTSmlJulk9m0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdefgeejucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfvehhuhgt
 khcunfgvvhgvrhdfuceotggvlheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
 hnpefghfeguedtieeiveeugfevtdejfedukeevgfeggfeugfetgfeltdetueelleelteen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegthhhutg
 hklhgvvhgvrhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeifeegleel
 leehledqfedvleekgeegvdefqdgtvghlpeepkhgvrhhnvghlrdhorhhgsehfrghsthhmrg
 hilhdrtghomhdpnhgspghrtghpthhtohepfeeipdhmohguvgepshhmthhpohhuthdprhgt
 phhtthhopehlihhnuhigqdhfvdhfshdquggvvhgvlheslhhishhtshdrshhouhhrtggvfh
 horhhgvgdrnhgvthdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphht
 thhopehhihhrohhfuhhmihesmhgrihhlrdhprghrkhhnvghtrdgtohdrjhhppdhrtghpth
 htohepphgtsehmrghnghhuvggsihhtrdhorhhgpdhrtghpthhtohepsghhrghrrghthhhs
 mhesmhhitghrohhsohhfthdrtghomhdprhgtphhtthhopehsphhrrghsrggusehmihgtrh
 hoshhofhhtrdgtohhmpdhrtghpthhtohepthihthhsohesmhhithdrvgguuhdprhgtphht
 thhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehhuhgstggrphesohhmnh
 hisghonhgurdgtohhm
X-ME-Proxy: <xmx:zq1naTkRbv9ZdmB81QztDlnhdErqtX9JaPCkPbhVF7A2EF4siXWTKA>
 <xmx:zq1naQMdIxjnxtmT6iFO3dvBra_cikPt2rs9udjIX9hM3quVc1o8wg>
 <xmx:zq1naSyL6jo-51wpIBye7R4H1uQkRJTayNYX4HLBSWa4OjKE3tRIjg>
 <xmx:zq1naen3U34rfR84UbpLxCNVQHHeUcJBEJes8dFgznAte5TxzT705Q>
 <xmx:zq1nab_H0tCK8W4yIFxCou46A5ZL-g9ECWVg-JI1en9AksHOVnvPNIgI>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id F2C75780070; Wed, 14 Jan 2026 09:53:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ArEQL-Tet5yZ
Date: Wed, 14 Jan 2026 09:52:34 -0500
To: "Amir Goldstein" <amir73il@gmail.com>, "Jeff Layton" <jlayton@kernel.org>
Message-Id: <5a1730f3-30ff-403c-a460-09a81f9616c5@app.fastmail.com>
In-Reply-To: <CAOQ4uxhDwR7dteLaqURX+9CooGM1hA7PL6KnVmSwX11ZdKxZTA@mail.gmail.com>
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
 <aWeUv2UUJ_NdgozS@infradead.org>
 <c40862cd65a059ad45fa88f5473722ea5c5f70a5.camel@kernel.org>
 <CAOQ4uxhDwR7dteLaqURX+9CooGM1hA7PL6KnVmSwX11ZdKxZTA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 14, 2026, at 9:14 AM, Amir Goldstein wrote: >
 On Wed, Jan 14, 2026 at 2:41 PM Jeff Layton <jlayton@kernel.org> wrote: >
 Very well then. > How about EXPORT_OP_PERSISTENT_HANDLES? > > This terminology
 is from the NFS protocol spec and it is also used > to describe the same
 trait in SMB protocol. > >> The problem there [...] 
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
X-Headers-End: 1vg2FB-0002Xx-SS
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
From: Chuck Lever via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chuck Lever <cel@kernel.org>
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
 linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, linux-nilfs@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Tso <tytso@mit.edu>,
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

CgpPbiBXZWQsIEphbiAxNCwgMjAyNiwgYXQgOToxNCBBTSwgQW1pciBHb2xkc3RlaW4gd3JvdGU6
Cj4gT24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMjo0MeKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9u
QGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBWZXJ5IHdlbGwgdGhlbi4KPiBIb3cgYWJvdXQgRVhQT1JU
X09QX1BFUlNJU1RFTlRfSEFORExFUz8KPgo+IFRoaXMgdGVybWlub2xvZ3kgaXMgZnJvbSB0aGUg
TkZTIHByb3RvY29sIHNwZWMgYW5kIGl0IGlzIGFsc28gdXNlZAo+IHRvIGRlc2NyaWJlIHRoZSBz
YW1lIHRyYWl0IGluIFNNQiBwcm90b2NvbC4KPgo+PiBUaGUgcHJvYmxlbSB0aGVyZSBpcyB0aGF0
IHdlIHZlcnkgbXVjaCBkbyB3YW50IHRvIGtlZXAgdG1wZnMKPj4gZXhwb3J0YWJsZSwgYnV0IGl0
IGRvZXNuJ3QgaGF2ZSBzdGFibGUgaGFuZGxlcyAocGVyLXNlKS4KPgo+IFRoaW5raW5nIG91dCBs
b3VkIC0KPiBJdCB3b3VsZCBiZSBtaXNndWlkZWQgdG8gZGVjbGFyZSB0bXBmcyBhcwo+IEVYUE9S
VF9PUF9QRVJTSVNURU5UX0hBTkRMRVMKPiBhbmQgcmVncmVzc2luZyBleHBvcnRzIG9mIHRtcGZz
IHdpbGwgc3VyZWx5IG5vdCBnbyB1bm5vdGljZWQuCj4KPiBIb3cgYWJvdXQgYWRkaW5nIGFuIGV4
cG9ydGZzIG9wdGlvbiAicGVyc2lzdGVudF9oYW5kbGVzIiwKPiB1c2UgaXQgYXMgZGVmYXVsdCBJ
RkYgbmVpdGhlciBvcHRpb25zIGZzaWQ9LCB1dWlkPSBhcmUgdXNlZCwKPiBzbyB0aGF0IGF0IGxl
YXN0IHdoZW4gZXhwb3J0aW5nIHRtcGZzLCBleHBvcnRmcyAtdiB3aWxsIHNob3cKPiAibm9fcGVy
c2lzdGVudF9oYW5kbGVzIiBleHBsaWNpdGx5PwoKSSB0aGluayB3ZSBuZWVkIHRvIGJlIGNhcmVm
dWwuIHRtcGZzIGZpbGVoYW5kbGVzIGFsaWduIHF1aXRlCndlbGwgd2l0aCB0aGUgdHJhZGl0aW9u
YWwgZGVmaW5pdGlvbiBvZiBwZXJzaXN0ZW50IGZpbGVoYW5kbGVzLgp0bXBmcyBmaWxlaGFuZGxl
cyBsaXZlIGFzIGxvbmcgYXMgdG1wZnMgZmlsZXMgZG8sIGFuZCB0aGF0IGlzCmFsbCB0aGF0IGlz
IHJlcXVpcmVkIHRvIGJlIGNvbnNpZGVyZWQgInBlcnNpc3RlbnQiLgoKCi0tIApDaHVjayBMZXZl
cgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
