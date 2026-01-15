Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DE1D28C2D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 22:38:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:References:In-Reply-To:Message-Id:To:Date:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9OsUNfF3euJbZruZx7oR//9C+b09KUnTzysKzSYau4=; b=lW4TV2cweO6EB6BHHKmdFeNvJy
	LgjkTA49UgQwWG0rzlZgQP5lf2IZU0jDtbDPgyA2K9SDDufpFmt02LIqGnGjWLCSE+lk+FWzJKa+P
	foo1+wbRKEtoGZWxK8ILqu7MCMsRBtSxMGr/Uv7tB7dMuBIXwx87JY+c9r6q6wtmmLng=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgV2j-0006PH-3M;
	Thu, 15 Jan 2026 21:38:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vgV2h-0006PA-Rv
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 21:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:
 References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bIvvdJO8RSmQOYhZYgNuTCBL8X7KIXl7wt2Qia9EIAk=; b=mKKlB2bPlV7i+lOOY+s0bS1npG
 ZcM4TixWJirYCw84phZfOmhpnPAJULgmiIUi7Pbp/V9mZnLbvso84ssfzIzfUWv/7860jG13qYT9P
 X+42K/huySbhv1j3GMApgycs535KXFzi3rJoW7i3EQDOpxd0Xq9RjlUeMVnIC90+/21g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:References:In-Reply-To:
 Message-Id:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bIvvdJO8RSmQOYhZYgNuTCBL8X7KIXl7wt2Qia9EIAk=; b=fi+Ews9/rYIJwb6fNzXyjlcPBL
 gxhLThJijLAgCo9TLIhl/HzKkvow+UUE8frQbGAhVyabiKp6NoyJG0aw7Yh2hWXUEHSmOkxWV5muw
 LFhFSTTTrnJ4B1RNDrfFN4jxD+XAAeUVvt1RtofGlNPHrBsLheqGy2V2pOdcTM+0bHI8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgV2h-00022d-9w for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 21:38:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7705144490;
 Thu, 15 Jan 2026 21:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10309C4AF0B;
 Thu, 15 Jan 2026 21:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768513080;
 bh=0fqCmxD4yKmMSe6/QFTJtZ3ssoTn2Cuf5H+QMDU346c=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=cNYvRCtAFr3nio6ZJmSXonm+4Nbnqg0ooZICNUqxoP7XTHZvA1sq5emt+58bZli1v
 oJkAFDqsC8s9exFsPnwjrufRoIKYcNVLkronVW7KfwhObFyoMdVkQc5HZF/9RGxbhF
 F8t+tIqxHXmQeBkIAg74UokUULOqKsZjdX1zKlQqnLNffUaBGWeNAgAEVlrJmM1boN
 LUW1r4fLYT+64uz3Pbcw+N6aibwePtoH6t9exvd7VQjlJQQfeBnIAca7oYTbPKx1xL
 5lZKkhqKesuIWnoeYbXAqAZWFIhec2xBYGvSLr8p1N4f33jTCoUrpWPHuga5OksBPp
 OM0ntrYikD9aw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfauth.phl.internal (Postfix) with ESMTP id F1990F4006D;
 Thu, 15 Jan 2026 16:37:57 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
 by phl-compute-10.internal (MEProxy); Thu, 15 Jan 2026 16:37:58 -0500
X-ME-Sender: <xms:NV5pafcNmSFQIrTUccBn8Az-kRf21swc3EUsgXiRuArMqrmkgSAOag>
 <xme:NV5paQCw-b3hO3NIG8gXajpY4N_T9w2owcI72ATnDXD-wEPGkb_1VwQQ44qF5W9Sb
 ycL-FXfJ-_J1d0wNMhW4e2tIJ1IW7TLmfEPTlqwXsxG-MEXb98h5wU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdejudehucetufdoteggodetrf
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
 hhdrtghomhdprhgtphhtthhopegtlhhmsehfsgdrtghomhdprhgtphhtthhopegurghvih
 gusehfrhhomhhorhgsihhtrdgtohhmpdhrtghpthhtoheprghmihhrjeefihhlsehgmhgr
 ihhlrdgtohhmpdhrtghpthhtohepihgurhihohhmohhvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:NV5paY71nyiHdxo8pzq2FPJ9wXP4gwvmybtteXjfGQDHBXmjGzMpkg>
 <xmx:NV5paf2q85cEvYskTRa6REbYfWFmhv1wT9xJbgW0M4zwirU4htMbuQ>
 <xmx:NV5paRIn4Ky98h162YQ0v5KUSHllZyM6UcKPFtRPRap3WHWdtGOYVw>
 <xmx:NV5pad_yPpJ8jq6536MO88REqfP8PL0dMv2ASaMKib8OBSJTuLx8og>
 <xmx:NV5paYQD3sBPEihbrDG1vMHuPz-F3Rw0TEVa9JsrMb-OENl5ypTH7YFK>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id B4F44780070; Thu, 15 Jan 2026 16:37:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A7-j_yKLHrMN
Date: Thu, 15 Jan 2026 16:37:27 -0500
To: "Dave Chinner" <david@fromorbit.com>
Message-Id: <06dcc4b6-7457-4094-a1c6-586ce518020f@app.fastmail.com>
In-Reply-To: <aWlXfBImnC_jhTw4@dread.disaster.area>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
 <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
 <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
 <aWlXfBImnC_jhTw4@dread.disaster.area>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 15, 2026, at 4:09 PM, Dave Chinner wrote: > On
 Thu, Jan 15, 2026 at 02:37:09PM -0500, Chuck Lever wrote: >> On 1/15/26 2:14
 PM, Amir Goldstein wrote: >> > On Thu, Jan 15, 2026 at 7:32 PM C [...] 
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
X-Headers-End: 1vgV2h-00022d-9w
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
 Carlos Maiolino <cem@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 linux-unionfs@vger.kernel.org,
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

CgpPbiBUaHUsIEphbiAxNSwgMjAyNiwgYXQgNDowOSBQTSwgRGF2ZSBDaGlubmVyIHdyb3RlOgo+
IE9uIFRodSwgSmFuIDE1LCAyMDI2IGF0IDAyOjM3OjA5UE0gLTA1MDAsIENodWNrIExldmVyIHdy
b3RlOgo+PiBPbiAxLzE1LzI2IDI6MTQgUE0sIEFtaXIgR29sZHN0ZWluIHdyb3RlOgo+PiA+IE9u
IFRodSwgSmFuIDE1LCAyMDI2IGF0IDc6MzLigK9QTSBDaHVjayBMZXZlciA8Y2VsQGtlcm5lbC5v
cmc+IHdyb3RlOgo+PiA+Pgo+PiA+Pgo+PiA+Pgo+PiA+PiBPbiBUaHUsIEphbiAxNSwgMjAyNiwg
YXQgMToxNyBQTSwgQW1pciBHb2xkc3RlaW4gd3JvdGU6Cj4+ID4+PiBPbiBUaHUsIEphbiAxNSwg
MjAyNiBhdCA2OjQ44oCvUE0gSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4gd3JvdGU6
Cj4+ID4+Pj4KPj4gPj4+PiBJbiByZWNlbnQgeWVhcnMsIGEgbnVtYmVyIG9mIGZpbGVzeXN0ZW1z
IHRoYXQgY2FuJ3QgcHJlc2VudCBzdGFibGUKPj4gPj4+PiBmaWxlaGFuZGxlcyBoYXZlIGdyb3du
IHN0cnVjdCBleHBvcnRfb3BlcmF0aW9ucy4gVGhleSd2ZSBtb3N0bHkgZG9uZQo+PiA+Pj4+IHRo
aXMgZm9yIGxvY2FsIHVzZS1jYXNlcyAoZW5hYmxpbmcgb3Blbl9ieV9oYW5kbGVfYXQoKSBhbmQg
dGhlIGxpa2UpLgo+PiA+Pj4+IFVuZm9ydHVuYXRlbHksIGhhdmluZyBleHBvcnRfb3BlcmF0aW9u
cyBpcyBnZW5lcmFsbHkgc3VmZmljaWVudCB0byBtYWtlCj4+ID4+Pj4gYSBmaWxlc3lzdGVtIGJl
IGNvbnNpZGVyZWQgZXhwb3J0YWJsZSB2aWEgbmZzZCwgYnV0IHRoYXQgcmVxdWlyZXMgdGhhdAo+
PiA+Pj4+IHRoZSBzZXJ2ZXIgcHJlc2VudCBzdGFibGUgZmlsZWhhbmRsZXMuCj4+ID4+Pgo+PiA+
Pj4gV2hlcmUgZG9lcyB0aGUgdGVybSAic3RhYmxlIGZpbGUgaGFuZGxlcyIgY29tZSBmcm9tPyBh
bmQgd2hhdCBkb2VzIGl0IG1lYW4/Cj4+ID4+PiBXaHkgbm90ICJwZXJzaXN0ZW50IGhhbmRsZXMi
LCB3aGljaCBpcyBkZXNjcmliZWQgaW4gTkZTIGFuZCBTTUIgc3BlY3M/Cj4+ID4+Pgo+PiA+Pj4g
Tm90IHRvIG1lbnRpb24gdGhhdCBFWFBPUlRfT1BfUEVSU0lTVEVOVF9IQU5ETEVTIHdhcyBBY2tl
ZAo+PiA+Pj4gYnkgYm90aCBDaHJpc3RvcGggYW5kIENocmlzdGlhbjoKPj4gPj4+Cj4+ID4+PiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mc2RldmVsLzIwMjYwMTE1LXJ1bmRnYW5nLWxl
aWhnYWJlLTEyMDE4ZTkzYzAwY0BicmF1bmVyLwo+PiA+Pj4KPj4gPj4+IEFtIEkgbWlzc2luZyBh
bnl0aGluZz8KPj4gPj4KPj4gPj4gUEVSU0lTVEVOVCBnZW5lcmFsbHkgaW1wbGllcyB0aGF0IHRo
ZSBmaWxlIGhhbmRsZSBpcyBzYXZlZCBvbgo+PiA+PiBwZXJzaXN0ZW50IHN0b3JhZ2UuIFRoaXMg
aXMgbm90IHRydWUgb2YgdG1wZnMuCj4+ID4gCj4+ID4gVGhhdCdzIG9uZSB3YXkgb2YgaW50ZXJw
cmV0aW5nICJwZXJzaXN0ZW50Ii4KPj4gPiBBbm90aGVyIHdheSBpcyAiY29udGludWluZyB0byBl
eGlzdCBvciBvY2N1ciBvdmVyIGEgcHJvbG9uZ2VkIHBlcmlvZC4iCj4+ID4gd2hpY2ggd29ya3Mg
d2VsbCBmb3IgdG1wZnMgdGhhdCBpcyBtb3VudGVkIGZvciBhIGxvbmcgdGltZS4KPj4gCj4+IEkg
dGhpbmsgd2UgY2FuIGJlIGEgbG90IG1vcmUgcHJlY2lzZSBhYm91dCB0aGUgZ3VhcmFudGVlOiBU
aGUgZmlsZQo+PiBoYW5kbGUgZG9lcyBub3QgY2hhbmdlIGZvciB0aGUgbGlmZSBvZiB0aGUgaW5v
ZGUgaXQgcmVwcmVzZW50cy4gSXQKPgo+IDxwZWRhbnRpYyBtb2RlIGVuZ2FnZWQ+Cj4KPiBGaWxl
IGhhbmRsZXMgbW9zdCBkZWZpbml0ZWx5IGNoYW5nZSBvdmVyIHRoZSBsaWZlIG9mIGEgL3BoeXNp
Y2FsLwo+IGlub2RlLiBVbmxpbmtpbmcgYSBmaWxlIGRvZXMgbm90IHJlcXVpcmUgZW5kaW5nIHRo
ZSBsaWZlIG9mIHRoZQo+IHBoeXNpY2FsIG9iamVjdCB0aGF0IHByb3ZpZGVzIHRoZSBwZXJzaXN0
ZW50IGRhdGEgc3RvcmUgZm9yIHRoZQo+IGZpbGUuCj4KPiBlLmcuIFhGUyBkeW5hbWljYWxseSBh
bGxvY2F0ZXMgcGh5c2ljYWwgaW5vZGVzIG1pZ2h0IGluIGEgbGlmZSBjeWNsZQo+IHRoYXQgbG9v
a3Mgc29tZXdoYXQgbGlmZSB0aGlzOgo+Cj4gCWFsbG9jYXRlIHBoeXNpY2FsIGlub2RlCj4gCWlu
c2VydCByZWNvcmQgaW50byBhbGxvY2F0ZWQgaW5vZGUgaW5kZXgKPiAJbWFyayBpbm9kZSBhcyBm
cmVlCj4KPiAJd2hpbGUgKGRvbid0IG5lZWQgdG8gZnJlZSBwaHlzaWNhbCBpbm9kZSkgewo+IAkJ
Li4uCj4gCQlhbGxvY2F0ZSBpbm9kZSBmb3IgYSBuZXcgZmlsZQo+IAkJdXBkYXRlIHBlcnNpc3Rl
bnQgaW5vZGUgbWV0YWRhdGEgdG8gZ2VuZXJhdGUgbmV3IGZpbGVoYW5kbGUKPiAJCW1hcmsgaW5v
ZGUgaW4gdXNlCj4gCQkuLi4KPiAJCXVubGluayBmaWxlCj4gCQltYXJrIGlub2RlIGZyZWUKPiAJ
fQo+Cj4gCXJlbW92ZSBpbm9kZSBmcm9tIGFsbG9jYXRlZCBpbm9kZSBpbmRleAo+IAlmcmVlIHBo
eXNpY2FsIGlub2RlCj4KPiBpLmUuIGEgZnJlZSBpbm9kZSBpcyBzdGlsbCBhbiAtYWxsb2NhdGVk
LCBpbmRleGVkIGlub2RlLSBpbiB0aGUKPiBmaWxlc3lzdGVtLCBhbmQgdW50aWwgd2UgcGh5c2lj
YWxseSByZW1vdmUgaXQgZnJvbSB0aGUgZmlsZXN5c3RlbQo+IHRoZSBpbm9kZSBsaWZlIGN5Y2xl
IGhhcyBub3QgZW5kZWQuCj4KPiBJT1dzLCB0aGUgcGh5c2ljYWwgKHBlcnNpc3RlbnQpIGlub2Rl
IGxpZmV0aW1lIGNhbiBzcGFuIHRoZSBsaWZldGltZQo+IG9mIC1tYW55LSBmaWxlcy4gSG93ZXZl
ciwgdGhlIGZpbGVzeXN0ZW0gZ3VhcmFudGVlcyB0aGF0IHRoZSBoYW5kbGUKPiBnZW5lcmF0ZWQg
Zm9yIHRoYXQgaW5vZGUgaXMgZGlmZmVyZW50IGZvciBlYWNoIGZpbGUgaXQgcmVwcmVzZW50cwo+
IG92ZXIgdGhlIHdob2xlIGlub2RlIGxpZmUgdGltZS4KPgo+IEhlbmNlIEkgdGhpbmsgdGhhdCBm
aWxlIGhhbmRsZSBzdGFiaWxpdHkvcGVyc2lzdGVuY2UgbmVlZHMgdG8gYmUKPiBkZWZpbmVkIGlu
IHRlcm1zIG9mIC1maWxlIGxpZmV0aW1lcy0sIG5vdCB0aGUgbGlmZXRpbWVzIG9mIHRoZQo+IGZp
bGVzeXN0ZW0gb2JqZWN0cyBpbXBsZW1lbnQgdGhlIGZpbGUncyBwZXJzaXN0ZW50IGRhdGEgc3Rv
cmUuCgpGYWlyIGVub3VnaCwgImlub2RlIiBpcyB0aGUgd3JvbmcgdGVybSB0byB1c2UgaGVyZS4K
CgotLSAKQ2h1Y2sgTGV2ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
