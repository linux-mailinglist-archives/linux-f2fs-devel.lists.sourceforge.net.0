Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1450D2793D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 19:32:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:References:In-Reply-To:Message-Id:To:Date:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZZA7iIBNztbPfnlgDHgWkKdrq1qkE/cNhWAS4quYV0=; b=XlwgjJJZKUnSrab9mAomS9OoNG
	edqLXxDCo4rwzd/YC1sgSD3MdBOe0HCDiD7CsoZHRPeG1LKZ8HXwPdoyuGA48VvPEVWvKY6RFRXJk
	sXK0ujvgwC9MgNwHQd7Ywjz4ZrQ3jYJ4Zm+XLxM22xb1pSxGak4wN63cF/Z6SjshFBak=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgS95-0001Wj-Sk;
	Thu, 15 Jan 2026 18:32:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vgS94-0001Wd-Ci
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 18:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:
 References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mu/jwyuzs1woV3EsPbDGdDC5dwANFYIHrH4NaGlTLGQ=; b=DfwauiNxZHi/7zEvxHWnulLYo4
 ia1XU7jYHvB+OGGI1xLT1GiZ/SK2oxLoJN8FdOiyPtiOEZJee9tZ7C8mneEj+2AirvflN4V8h9ytn
 VvJ+SuCbaVbKW8IcSkge4FNvwfm5VMBsvqiMCBz0qi5SlL/CpK2Calx6ff4/Ga4ssKbs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:References:In-Reply-To:
 Message-Id:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mu/jwyuzs1woV3EsPbDGdDC5dwANFYIHrH4NaGlTLGQ=; b=EcffPbwqhSoXlPQAyFnYN+cGz6
 E+P3V4ZYxkQka4zWPplPmXNjMfCB83rvQEBGkyIsoq/hPTMf4kRQDRJ2vwRs4ugCDAuKjrIcjTIIE
 iWhWGYS/ozM6C9ChA3wyAXWZFa3R8vLFiOlzI8s5ywB4q9Is6raBZiXPbs9Dxz3kWy3E=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgS93-0001ho-Pf for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 18:32:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 454DC4451E;
 Thu, 15 Jan 2026 18:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A66C2BC87;
 Thu, 15 Jan 2026 18:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768501948;
 bh=mu/jwyuzs1woV3EsPbDGdDC5dwANFYIHrH4NaGlTLGQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=JNemC1yyTQKx5E4pIkzvytUyGES2tmVjzNLWcONSrxdEfLh3HlZ+29IPzV++/rV8O
 /HufzuRETrrLBI4IgK1mEivYdYvao6frYVSEUn2AXXy3guy4u8MrpbYCuAu8C1ruaK
 BwomDAPfPK9evxM9sjnY973CQhs3rFOvwwrsPWD1GN0t9LaV4/M6zqIS22ZYwvDiXt
 7eIxB9z5Cz2MzTOm3tABDloqGJc8wnEFa7XSr1cniiaRjwx+2QKA2jRZ2Mj8DV7eWp
 x1iKOENqOdKyNjx+zUz63w8fofWQL/VEVXD5wSR9ScT7i3QHOaACZWezQRR4LuAx+z
 TU3CqTeesgqIQ==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfauth.phl.internal (Postfix) with ESMTP id 4BF17F40069;
 Thu, 15 Jan 2026 13:32:25 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
 by phl-compute-10.internal (MEProxy); Thu, 15 Jan 2026 13:32:25 -0500
X-ME-Sender: <xms:uTJpaST2S_BQmvIoVXUTG3Uv00CIkT_f-EbDQ1KH8vIlVQcwDXypQQ>
 <xme:uTJpaSn5OoyclbrYS_ARTUh6TEP2VOjUGj53_LG2lxkjeVICq65KK1J-vKaQ4Q1LV
 V04RbrQdCpqL5Mvp67L_2A99E7e0MjEKZHGQg6du4B2aAO0ZSdxuww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeijeekucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfvehhuhgt
 khcunfgvvhgvrhdfuceotggvlheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
 hnpeegheduieeiveevheelheelueeghffhtddtheelhfdutddtheeileetkeelvedtjeen
 ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomheptghhuhgtkhhlvghvvghrodhmvghsmhhtphgruhht
 hhhpvghrshhonhgrlhhithihqdduieefgeelleelheelqdefvdelkeeggedvfedqtggvlh
 eppehkvghrnhgvlhdrohhrghesfhgrshhtmhgrihhlrdgtohhmpdhnsggprhgtphhtthho
 peehtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhgvihhlsegsrhhofihnrd
 hnrghmvgdprhgtphhtthhopegrughilhhgvghrrdhkvghrnhgvlhesughilhhgvghrrdgt
 rgdprhgtphhtthhopehslhgrvhgrseguuhgsvgihkhhordgtohhmpdhrtghpthhtohepjh
 hlsggvtgesvghvihhlphhlrghnrdhorhhgpdhrtghpthhtohepmhgrrhhksehfrghshhgv
 hhdrtghomhdprhgtphhtthhopegtlhhmsehfsgdrtghomhdprhgtphhtthhopegrmhhirh
 ejfehilhesghhmrghilhdrtghomhdprhgtphhtthhopehiughrhihomhhovhesghhmrghi
 lhdrtghomhdprhgtphhtthhopehkohhnihhshhhirdhrhihushhukhgvsehgmhgrihhlrd
 gtohhm
X-ME-Proxy: <xmx:uTJpaX8XlASeI3-hQVJmMxlK8TxdmBSwTtFsbhSoxL3UV4Wvip7VrA>
 <xmx:uTJpaZqkkN3176e2LvdCG3veTiN-GTqcScuGt9t_e1DrtMHWJT3eyA>
 <xmx:uTJpaet8tZs4QdmQ9KbY-CWNsY3QfKFOvT9QPuO68BSRBM5oq_7Zeg>
 <xmx:uTJpaUR2QUA-L1hS5UnoJ8HhY1Uu2p18HC8n7POL1S450zS9m_Kiew>
 <xmx:uTJpaYWzGNFQ6fy0VRVsd1um1FRTenoVzHGzsRuwWHvuFBVbXXDnMbke>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 155C8780070; Thu, 15 Jan 2026 13:32:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A7-j_yKLHrMN
Date: Thu, 15 Jan 2026 13:31:54 -0500
To: "Amir Goldstein" <amir73il@gmail.com>, "Jeff Layton" <jlayton@kernel.org>
Message-Id: <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
In-Reply-To: <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 15, 2026, at 1:17 PM, Amir Goldstein wrote: >
 On Thu, Jan 15, 2026 at 6:48 PM Jeff Layton <jlayton@kernel.org> wrote: >>
 >> In recent years, a number of filesystems that can't present stab [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgS93-0001ho-Pf
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
 Christian Brauner <brauner@kernel.org>, Theodore Tso <tytso@mit.edu>,
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

CgpPbiBUaHUsIEphbiAxNSwgMjAyNiwgYXQgMToxNyBQTSwgQW1pciBHb2xkc3RlaW4gd3JvdGU6
Cj4gT24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo0OOKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9u
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBJbiByZWNlbnQgeWVhcnMsIGEgbnVtYmVyIG9mIGZp
bGVzeXN0ZW1zIHRoYXQgY2FuJ3QgcHJlc2VudCBzdGFibGUKPj4gZmlsZWhhbmRsZXMgaGF2ZSBn
cm93biBzdHJ1Y3QgZXhwb3J0X29wZXJhdGlvbnMuIFRoZXkndmUgbW9zdGx5IGRvbmUKPj4gdGhp
cyBmb3IgbG9jYWwgdXNlLWNhc2VzIChlbmFibGluZyBvcGVuX2J5X2hhbmRsZV9hdCgpIGFuZCB0
aGUgbGlrZSkuCj4+IFVuZm9ydHVuYXRlbHksIGhhdmluZyBleHBvcnRfb3BlcmF0aW9ucyBpcyBn
ZW5lcmFsbHkgc3VmZmljaWVudCB0byBtYWtlCj4+IGEgZmlsZXN5c3RlbSBiZSBjb25zaWRlcmVk
IGV4cG9ydGFibGUgdmlhIG5mc2QsIGJ1dCB0aGF0IHJlcXVpcmVzIHRoYXQKPj4gdGhlIHNlcnZl
ciBwcmVzZW50IHN0YWJsZSBmaWxlaGFuZGxlcy4KPgo+IFdoZXJlIGRvZXMgdGhlIHRlcm0gInN0
YWJsZSBmaWxlIGhhbmRsZXMiIGNvbWUgZnJvbT8gYW5kIHdoYXQgZG9lcyBpdCBtZWFuPwo+IFdo
eSBub3QgInBlcnNpc3RlbnQgaGFuZGxlcyIsIHdoaWNoIGlzIGRlc2NyaWJlZCBpbiBORlMgYW5k
IFNNQiBzcGVjcz8KPgo+IE5vdCB0byBtZW50aW9uIHRoYXQgRVhQT1JUX09QX1BFUlNJU1RFTlRf
SEFORExFUyB3YXMgQWNrZWQKPiBieSBib3RoIENocmlzdG9waCBhbmQgQ2hyaXN0aWFuOgo+Cj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZnNkZXZlbC8yMDI2MDExNS1ydW5kZ2FuZy1s
ZWloZ2FiZS0xMjAxOGU5M2MwMGNAYnJhdW5lci8KPgo+IEFtIEkgbWlzc2luZyBhbnl0aGluZz8K
ClBFUlNJU1RFTlQgZ2VuZXJhbGx5IGltcGxpZXMgdGhhdCB0aGUgZmlsZSBoYW5kbGUgaXMgc2F2
ZWQgb24KcGVyc2lzdGVudCBzdG9yYWdlLiBUaGlzIGlzIG5vdCB0cnVlIG9mIHRtcGZzLgoKVGhl
IHVzZSBvZiAic3RhYmxlIiBtZWFucyB0aGF0IHRoZSBmaWxlIGhhbmRsZSBpcyBzdGFibGUgZm9y
CnRoZSBsaWZlIG9mIHRoZSBmaWxlLiBUaGlzIC9pcy8gdHJ1ZSBvZiB0bXBmcy4KCi0tIApDaHVj
ayBMZXZlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
