Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJGFNQWqb2lUEwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 17:15:01 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C647330
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 17:15:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:Date:To:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ufXo+dYzc+9qffJgTGl26obYOYdOSPjYVIKxDZzaB0=; b=lK5wrcMNaNDMQlHO/ZiqAjCkWJ
	PK6SmSQdRozRnEn7mjYzlrpnvH/IVvDmZuQKDn7zBnrkDlrUYITnsRHP5M5ZLL1DmHYZMeuCWkos4
	YvqxmKjhkBEyfO1M+haev1iuyvrvzVcJ/nDGcXC1gw3DvnwwBo1TuKNOh5LtNGwe6+jw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viBC8-0003yY-8a;
	Tue, 20 Jan 2026 12:50:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1viBC7-0003yC-2S;
 Tue, 20 Jan 2026 12:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gO3Dmc96/EjmtjK6IVhEDHlhQcRIlpbkWGT37ZF75JE=; b=D/CT5ZpRjUkp+RlWE3lQqWpvmj
 CDzLk4BWlBtxo3TxDbPbEhSmPtGyEprFgLqLtxphz+ZLpL8Ix4R3cap6xcXFhQ2xq0BfO7VngSlnB
 s/uGbjacsh58Lm11KvckcF0ahFbChl1R7LyKB/aQ302BNpz5bL+TJEHFmUHFlgqi41T0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gO3Dmc96/EjmtjK6IVhEDHlhQcRIlpbkWGT37ZF75JE=; b=M3WrNNzMWPa+ZMNVZNNaMORzne
 Wa303VnM8r7dUyD/ihp22DlC+VcGs2BCXfqYKRoEH9D5RKGOe/ZNgh19SOJbcbT8RRlD8Sz3aq0ZP
 8nXXnZHgE9e+45iFA1IdnQQpkeprAvUwj4KRVWAkQFI7idibF4Rd4ltKQvNlXK6RkJLI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viBC6-0003Fh-Ko; Tue, 20 Jan 2026 12:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 35EF540DA6;
 Tue, 20 Jan 2026 12:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB6DC19422;
 Tue, 20 Jan 2026 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768913440;
 bh=vYIy05TFBjkJSOZIJnTTiuPvxldNCSA6NdRoiqFyWpc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=e1zT2vocwF78r7FL+5WzUHXIWy93w1CsZBXidVyUfNwBF1R9uERAYCeSR1I34Y48P
 fZA1tCB9PdNKfqEm3Ik3seHCB/fan0+KTHSp4ICQcZWb4Gsp7fA/RoVS82lqp79kRd
 W7mln6Md5hIUxVVb8qiRT771zybKHVixN7sK/3MvHcNmuLW8t/T6Y7VNyfw+KedZu2
 MWac278JPjkATMe0Lt9fyxkUXmIhbV7lpHHCqOA3jzbt0OyYU8ZgSAhX24ZaUONwTl
 Nw2byKXBQA/Ft6+a+bhzFkGe4xozYyiwbpysp6m+qMx0ppPTXrqrWjl6fl5eTnA+Jf
 bsFdLxD14gb5w==
Message-ID: <a35ac736d9ebc6c92a6e7d61aeb5198234102442.camel@kernel.org>
To: Christian Brauner <brauner@kernel.org>, NeilBrown <neil@brown.name>
Date: Tue, 20 Jan 2026 07:50:32 -0500
In-Reply-To: <20260120-hacken-revision-88209121ac2c@brauner>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>
 <176877859306.16766.15009835437490907207@noble.neil.brown.name>
 <aW3SAKIr_QsnEE5Q@infradead.org>
 <176880736225.16766.4203157325432990313@noble.neil.brown.name>
 <20260119-kanufahren-meerjungfrau-775048806544@brauner>
 <176885553525.16766.291581709413217562@noble.neil.brown.name>
 <20260120-entmilitarisieren-wanken-afd04b910897@brauner>
 <176890211061.16766.16354247063052030403@noble.neil.brown.name>
 <20260120-hacken-revision-88209121ac2c@brauner>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 2026-01-20 at 11:31 +0100, Christian Brauner wrote:
 > On Tue, Jan 20, 2026 at 08:41:50PM +1100, NeilBrown wrote: > > On Tue,
 20 Jan 2026, Christian Brauner wrote: > > > On Tue, Jan 20, 2026 at [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1viBC6-0003Fh-Ko
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
From: Jeff Layton via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jeff Layton <jlayton@kernel.org>
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
 Dave Kleikamp <shaggy@kernel.org>, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>, Trond Myklebust <trondmy@kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-6.01 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[omnibond.com,lists.sourceforge.net,suse.cz,manguebit.org,redhat.com,google.com,vger.kernel.org,kernel.org,gmail.com,paragon-software.com,fb.com,dilger.ca,vivo.com,lists.infradead.org,szeredi.hu,nod.at,fasheh.com,oracle.com,infradead.org,dubeyko.com,kvack.org,lists.orangefs.org,microsoft.com,talpey.com,lists.linux.dev,suse.com,zeniv.linux.org.uk,linux.alibaba.com,mail.parknet.co.jp,mit.edu,lists.ozlabs.org,samba.org,huawei.com,squashfs.org.uk,linux-foundation.org,evilplan.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[71];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jlayton@kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 035C647330
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCAyMDI2LTAxLTIwIGF0IDExOjMxICswMTAwLCBDaHJpc3RpYW4gQnJhdW5lciB3cm90
ZToKPiBPbiBUdWUsIEphbiAyMCwgMjAyNiBhdCAwODo0MTo1MFBNICsxMTAwLCBOZWlsQnJvd24g
d3JvdGU6Cj4gPiBPbiBUdWUsIDIwIEphbiAyMDI2LCBDaHJpc3RpYW4gQnJhdW5lciB3cm90ZToK
PiA+ID4gT24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMDc6NDU6MzVBTSArMTEwMCwgTmVpbEJyb3du
IHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgMTkgSmFuIDIwMjYsIENocmlzdGlhbiBCcmF1bmVyIHdy
b3RlOgo+ID4gPiA+ID4gT24gTW9uLCBKYW4gMTksIDIwMjYgYXQgMDY6MjI6NDJQTSArMTEwMCwg
TmVpbEJyb3duIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBNb24sIDE5IEphbiAyMDI2LCBDaHJpc3Rv
cGggSGVsbHdpZyB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiBNb24sIEphbiAxOSwgMjAyNiBhdCAx
MDoyMzoxM0FNICsxMTAwLCBOZWlsQnJvd24gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+IFRoaXMg
d2FzIENodWNrJ3Mgc3VnZ2VzdGVkIG5hbWUuIEhpcyBwb2ludCB3YXMgdGhhdCBTVEFCTEUgbWVh
bnMgdGhhdAo+ID4gPiA+ID4gPiA+ID4gPiB0aGUgRkgncyBkb24ndCBjaGFuZ2UgZHVyaW5nIHRo
ZSBsaWZldGltZSBvZiB0aGUgZmlsZS4KPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4g
PiA+IEkgZG9uJ3QgbXVjaCBjYXJlIGFib3V0IHRoZSBmbGFnIG5hbWUsIHNvIGlmIGV2ZXJ5b25l
IGxpa2VzIFBFUlNJU1RFTlQKPiA+ID4gPiA+ID4gPiA+ID4gYmV0dGVyIEknbGwgcm9sbCB3aXRo
IHRoYXQuCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IEkgZG9uJ3QgbGlrZSBQRVJT
SVNURU5ULgo+ID4gPiA+ID4gPiA+ID4gSSdkIHJhdGhlciBjYWxsIGEgc3BhZGUgYSBzcGFkZS4K
PiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gICBFWFBPUlRfT1BfU1VQUE9SVFNfTkZT
X0VYUE9SVAo+ID4gPiA+ID4gPiA+ID4gb3IKPiA+ID4gPiA+ID4gPiA+ICAgRVhQT1JUX09QX05P
VF9ORlNfQ09NUEFUSUJMRQo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBUaGUgaXNz
dWUgaGVyZSBpcyBORlMgZXhwb3J0IGFuZCBpbmRpcmVjdGlvbiBkb2Vzbid0IGJyaW5nIGFueSBi
ZW5lZml0cy4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBObywgaXQgYWJzb2x1dGVseSBp
cyBub3QuICBBbmQgdGhlIHdob2xlIGNvbmNlcHQgb2YgY2FsbGluZyBzb21ldGhpbmcKPiA+ID4g
PiA+ID4gPiBhZnRlciB0aGUgaW5pdGlhbCBvciBtYWluIHVzZSBpcyBhIHJlY2lwZSBmb3IgYSBt
ZXNzLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gV2UgYXJlIGNhbGxpbmcgaXQgZm9yIGl0J3Mg
b25seSB1c2UuICBJZiB0aGVyZSB3YXMgZXZlciBhbm90aGVyIHVzZSwgd2UKPiA+ID4gPiA+ID4g
Y291bGQgY2hhbmdlIHRoZSBuYW1lIGlmIHRoYXQgbWFkZSBzZW5zZS4gIEl0IGlzIG5vdCBhIHB1
YmxpYyBuYW1lLCBpdAo+ID4gPiA+ID4gPiBpcyBlYXN5IHRvIGNoYW5nZS4KPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gUGljayBhIG5hbWUgdGhhdCBjb252ZXlzIHdo
YXQgdGhlIGZsYWcgaXMgYWJvdXQsIGFuZCBkb2N1bWVudCB0aG9zZQo+ID4gPiA+ID4gPiA+IHNl
bWFudGljcyB3ZWxsLiAgVGhpcyBmbGFnIGlzIGFib3V0IHRoZSBmYWN0IHRoYXQgZm9yIGEgZ2l2
ZW4gZmlsZSwKPiA+ID4gPiA+ID4gPiBhcyBsb25nIGFzIHRoYXQgZmlsZSBleGlzdHMgaW4gdGhl
IGZpbGUgc3lzdGVtIHRoZSBoYW5kbGUgaXMgc3RhYmxlLgo+ID4gPiA+ID4gPiA+IEJvdGggc3Rh
YmxlIGFuZCBwZXJzaXN0ZW50IGFyZSBzdWl0YWJsZSBmb3IgdGhhdCwgbmZzIGlzIGV2ZXJ5dGhp
bmcKPiA+ID4gPiA+ID4gPiBidXQuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBNeSB1bmRlcnN0
YW5kaW5nIGlzIHRoYXQga2VybmZzIHdvdWxkIG5vdCBnZXQgdGhlIGZsYWcuCj4gPiA+ID4gPiA+
IGtlcm5mcyBmaWxlaGFuZGxlcyBkbyBub3QgY2hhbmdlIGFzIGxvbmcgYXMgdGhlIGZpbGUgZXhp
c3QuCj4gPiA+ID4gPiA+IEJ1dCB0aGlzIGlzIG5vdCBzdWZmaWNpZW50IGZvciB0aGUgZmlsZXMg
dG8gYmUgdXNlZnVsbHkgZXhwb3J0ZWQuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJIHN1c3Bl
Y3Qga2VybmZzIGRvZXMgcmUtdXNlIGZpbGVoYW5kbGVzIHJlbGF0aXZlbHkgc29vbiBhZnRlciB0
aGUKPiA+ID4gPiA+ID4gZmlsZS9vYmplY3QgaGFzIGJlZW4gZGVzdHJveWVkLiAgTWF5YmUgdGhh
dCBpcyB0aGUgcmVhbCBwcm9ibGVtIGhlcmU6Cj4gPiA+ID4gPiA+IGZpbGVoYW5kbGUgcmV1c2Us
IG5vdCBmaWxlaGFuZGxlIHN0YWJpbGl0eS4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEplZmY6
IGNvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBkZXRhaWxzIChhbmQgcHJlc2VydmUgdGhlbSBpbiBmdXR1
cmUgY292ZXIKPiA+ID4gPiA+ID4gbGV0dGVycykgb2Ygd2hpY2ggZmlsZXN5c3RlbXMgYXJlIGtu
b3duIHRvIGhhdmUgcHJvYmxlbXMgYW5kIHdoYXQKPiA+ID4gPiA+ID4gZXhhY3RseSB0aG9zZSBw
cm9ibGVtcyBhcmU/Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFJl
bWVtYmVyIG5mcyBhbHNvIHN1cHBvcnQgdm9sYXRpbGUgZmlsZSBoYW5kbGVzLCBhbmQgb3RoZXIg
YXBwbGljYXRpb25zCj4gPiA+ID4gPiA+ID4gbWlnaHQgcmVseSBvbiB0aGlzIChJIGtub3cgb2Yg
cXVpdGUgYSBmZXcgdXNlciBzcGFjZSBhcHBsaWNhdGlvbnMgdGhhdAo+ID4gPiA+ID4gPiA+IGRv
LCBidXQgdGhleSBhcmUga2luZGEgaGFyZHdpcmVkIHRvIHhmcyBhbnl3YXkpLgo+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gVGhlIE5GUyBwcm90b2NvbCBzdXBwb3J0cyB2b2xhdGlsZSBmaWxlIGhh
bmRsZXMuICBrbmZzZCBkb2VzIG5vdC4KPiA+ID4gPiA+ID4gU28gbWF5YmUKPiA+ID4gPiA+ID4g
ICBFWFBPUlRfT1BfTk9UX05GU0RfQ09NUEFUSUJMRQo+ID4gPiA+ID4gPiBtaWdodCBiZSBiZXR0
ZXIuICBvciBFWFBPUlRfT1BfTk9UX0xJTlVYX05GU0RfQ09NUEFUSUJMRS4KPiA+ID4gPiA+ID4g
KEkgcHJlZmVyIG9wdC1vdXQgcmF0aGVyIHRoYW4gb3B0LWluIGJlY2F1c2UgbmZzZCBleHBvcnQg
d2FzIHRoZQo+ID4gPiA+ID4gPiBvcmlnaW5hbCBwdXJwb3NlIG9mIGV4cG9ydF9vcGVyYXRpb25z
LCBidXQgaXQgaXNuJ3Qgc29tZXRoaW5nCj4gPiA+ID4gPiA+IEkgd291bGQgZmlnaHQgZm9yKQo+
ID4gPiA+ID4gCj4gPiA+ID4gPiBJIHByZWZlciBvbmUgb2YgdGhlIHZhcmlhbnRzIHlvdSBwcm9w
b3NlZCBoZXJlIGJ1dCBJIGRvbid0IHBhcnRpY3VsYXJseQo+ID4gPiA+ID4gY2FyZS4gSXQncyBu
b3QgYSBoaWxsIHdvcnRoIGR5aW5nIG9uLiBTbyBpZiBDaHJpc3RvcGggaW5zaXN0cyBvbiB0aGUK
PiA+ID4gPiA+IG90aGVyIG5hbWUgdGhlbiBJIHNheSBsZXQncyBqdXN0IGdvIHdpdGggaXQuCj4g
PiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBUaGlzIHNvdW5kcyBsaWtlIHlvdSBhcmUgcmVjb21t
ZW5kaW5nIHRoYXQgd2UgZ2l2ZSBpbiB0byBidWxseWluZy4KPiA+ID4gPiBJIHdvdWxkIHJhdGhl
ciB0aGUgZGVjaXNpb24gYmUgbWFkZSBiYXNlZCBvbiB0aGUgZmFjdHMgb2YgdGhlIGNhc2UsIG5v
dAo+ID4gPiA+IHRoZSBvcGluaW9ucyB0aGF0IGFyZSBzdGF0ZWQgbW9zdCBibHVudGx5Lgo+ID4g
PiA+IAo+ID4gPiA+IEkgYWN0dWFsbHkgdGhpbmsgdGhhdCB3aGF0IENocmlzdG9waCB3YW50cyBp
cyBhY3R1YWxseSBxdWl0ZSBkaWZmZXJlbnQKPiA+ID4gPiBmcm9tIHdoYXQgSmVmZiB3YW50cywg
YW5kIG1heWJlIHR3byBmbGFncyBhcmUgbmVlZGVkLiAgQnV0IEkgZG9uJ3QgeWV0Cj4gPiA+ID4g
aGF2ZSBhIGNsZWFyIHVuZGVyc3RhbmRpbmcgb2Ygd2hhdCBDaHJpc3RvcGggd2FudHMsIHNvIEkg
Y2Fubm90IGJlIHN1cmUuCj4gPiA+IAo+ID4gPiBJJ3ZlIHRyaWVkIHRvIGluZGlyZWN0bHkgYXNr
IHdoZXRoZXIgeW91IHdvdWxkIGJlIHdpbGxpbmcgdG8gY29tcHJvbWlzZQo+ID4gPiBoZXJlIG9y
IHdoZXRoZXIgeW91IHdhbnQgdG8gaW5zaXN0IG9uIHlvdXIgYWx0ZXJuYXRpdmUgbmFtZS4gQXBw
YXJlbnRseQo+ID4gPiB0aGF0IGRpZG4ndCBjb21lIHRocm91Z2guCj4gPiAKPiA+IFRoaXMgd291
bGQgYmUgdGhlICJub3QgYSBoaWxsIHdvcnRoeSBkeWluZyBvbiIgcGFydCBvZiB5b3VyIHN0YXRl
bWVudC4KPiA+IEkgdGhpbmsgSSBzZWUgdGhhdCBpbXBsaWNhdGlvbiBub3cuCj4gPiBCdXQgbm8s
IEkgZG9uJ3QgdGhpbmsgY29tcHJvbWlzZSBpcyByZWxldmFudC4gIEkgdGhpbmsgdGhlIHByb2Js
ZW0KPiA+IHN0YXRlbWVudCBhcyBvcmlnaW5hbGx5IGdpdmVuIGJ5IEplZmYgaXMgbWlzbGVhZGlu
ZywgYW5kIHBlb3BsZSBoYXZlCj4gPiBiZWVuIG1pc2xlZCB0byBhbiBpbmNvcnJlY3QgbmFtZS4K
PiA+IAo+ID4gPiAKPiA+ID4gSSdtIHVuY2xlYXIgd2hhdCB5b3VyIGdvYWwgaXMgaW4gc3VnZ2Vz
dGluZyB0aGF0IEkgcmVjb21tZW5kICJ3ZSIgZ2l2ZQo+ID4gPiBpbnRvIGJ1bGx5aW5nLiBBbGwg
aXQgYWNoaWV2ZWQgd2FzIHRvIGZ1cnRoZXIgZGVyYWlsIHRoaXMgdGhyZWFkLgo+ID4gPiAKPiA+
IAo+ID4gVGhlICJXZSIgaXMgdGhlIHNhbWUgYXMgdGhlICJ1cyIgaW4gImxldCdzIGp1c3QgZ28g
d2l0aCBpdCIuCj4gPiAKPiA+IAo+ID4gPiBJIGFsc28gdGhpbmsgaXQncyBub3QgdmVyeSBoZWxw
ZnVsIGF0IHY2IG9mIHRoZSBkaXNjdXNzaW9uIHRvIHN0YXJ0Cj4gPiA+IGZpZ3VyaW5nIG91dCB3
aGF0IHRoZSBhY3R1YWwga2V5IHJpZnQgYmV0d2VlbiBKZWZmJ3MgYW5kIENocmlzdG9waCdzCj4g
PiA+IHBvc2l0aW9uIGlzLiBJZiB5b3UndmUgZmlndXJlZCBpdCBvdXQgYW5kIGdvdHRlbiBhbiBh
Z3JlZW1lbnQgYW5kIHRoaXMKPiA+ID4gaXMgYWxyZWFkeSBpbiwgc2VuZCBhIGZvbGxvdy11cCBz
ZXJpZXMuCj4gPiAKPiA+IHY2PyAgdjIgd2FzIHBvc3RlZCB0b2RheS4gIEJ1dCBtYXliZSB5b3Ug
YXJlIHJlZmVycmluZyB0aGUgc29tZSBvdGhlcgo+ID4gcHJlY3Vyc29ycy4KPiA+IAo+ID4gVGhl
IGludHJvZHVjdG9yeSBzdGF0ZW1lbnQgaW4gdjIgaXMKPiA+IAo+ID4gICAgVGhpcyBwYXRjaHNl
dCBhZGRzIGEgZmxhZyB0aGF0IGluZGljYXRlcyB3aGV0aGVyIHRoZSBmaWxlc3lzdGVtIHN1cHBv
cnRzCj4gPiAgICBzdGFibGUgZmlsZWhhbmRsZXMgKGkuZS4gdGhhdCB0aGV5IGRvbid0IGNoYW5n
ZSBvdmVyIHRoZSBsaWZlIG9mIHRoZQo+ID4gICAgZmlsZSkuIEl0IHRoZW4gbWFrZXMgYW55IGZp
bGVzeXN0ZW0gdGhhdCBkb2Vzbid0IHNldCB0aGF0IGZsYWcKPiA+ICAgIGluZWxpZ2libGUgZm9y
IG5mc2QgZXhwb3J0Lgo+ID4gCj4gPiBOb2JvZHkgZWxzZSBxdWVzdGlvbmVkIHRoZSB2YWxpZGl0
eSBvZiB0aGF0LiAgSSBkby4KPiA+IE5vIGV2aWRlbmNlIHdhcyBnaXZlbiB0aGF0IHRoZXJlIGFy
ZSAqYW55KiBmaWxlc3lzdGVtcyB0aGF0IGRvbid0Cj4gPiBzdXBwb3J0IHN0YWJsZSBmaWxlaGFu
ZGxlcy4gIFRoZSBvbmx5IGZpbGVzeXN0ZW0gbWVudGlvbmVkIGlzIGNncm91cHMKPiA+IGFuZCBp
dCBET0VTIHByb3ZpZGUgc3RhYmxlIGZpbGVoYW5kbGVzLgo+IAoKQWNyb3NzIHJlYm9vdD8gTm90
IHJlYWxseS4KCkl0J3MgcXVpdGUgcG9zc2libGUgdGhhdCB3ZSBtYXkgZW5kIHVwIHdpdGggdGhl
IHNhbWUgImlkIiBudW1iZXJzIGluCmNncm91cGZzIG9uIGEgbmV3IGluY2FybmF0aW9uIG9mIHRo
ZSBmaWxlc3lzdGVtIGFmdGVyIGEgcmVib290LiBUaGUKZmlsZXMgaW4gdGhlcmUgYXJlIG5vdCB0
aGUgc2FtZSBvbmVzIGFzIHRoZSBvbmVzIGJlZm9yZSwgYnV0IHRoZWlyCmZpbGVoYW5kbGVzIG1h
eSBtYXRjaCBiZWNhdXNlIGtlcm5mcyBkb2Vzbid0IGZhY3RvciBpbiBhbiBpX2dlbmVyYXRpb24K
bnVtYmVyLgoKQ291bGQgd2UgZml4IGl0IGJ5IGFkZGluZyBhIHJhbmRvbSBpX2dlbmVyYXRpb24g
dmFsdWUgb3Igc29tZXRoaW5nPwpQb3NzaWJseSwgYnV0IHRoZXJlIHJlYWxseSBpc24ndCBhIGdv
b2QgdXNlLWNhc2UgdGhhdCBJIGNhbiBzZWUgZm9yCmFsbG93aW5nIGNncm91cGZzIHRvIGJlIGV4
cG9ydGVkIHZpYSBuZnNkLiBCZXN0IHRvIGRpc2FsbG93IGl0IHVudGlsCnNvbWVvbmUgY29tZXMg
dXAgd2l0aCBvbmUuCgo+IE9oIHllcyB3ZSBkaWQuIEFuZCB0aGlzIGlzIGEgbWVycnktZ28tcm91
bmQuCj4gCj4gSXQgaXMgdmVyeSBtdWNoIGZpbmUgZm9yIGEgZmlsZXN5c3RlbXMgdG8gc3VwcG9y
dCBmaWxlIGhhbmRsZXMgd2l0aG91dAo+IHdhbnRpbmcgdG8gc3VwcG9ydCBleHBvcnRpbmcgdmlh
IE5GUy4gVGhhdCBpcyBlc3BlY2lhbGx5IHRydWUgZm9yCj4gaW4ta2VybmVsIHBzZXVkbyBmaWxl
c3lzdGVtcy4KPiAKPiBBcyBJJ3ZlIHNhaWQgYmVmb3JlIG11bHRpcGxlIHRpbWVzIEkgd2FudCBh
IHdheSB0byBhbGxvdyBmaWxlc3lzdGVtcwo+IHN1Y2ggYXMgcGlkZnMgYW5kIG5zZnMgdG8gdXNl
IGZpbGUgaGFuZGxlcyB3aXRob3V0IHN1cHBvcnRpbmcgZXhwb3J0Lgo+IFdoYXRldmVyIHRoYXQg
ZnNja2luZyBmbGFnIGlzIGNhbGxlZCBhdCB0aGlzIHBvaW50IEkgZnVuZGFtZW50YWxseSBkb24n
dAo+IGNhcmUuIEFuZCB3ZSBhcmUgcmVsaXZpbmcgdGhlIHNhbWUgYXJndW1lbnRzIG92ZXIgYW5k
IG92ZXIuCj4gCj4gSSB3aWxsIF9oYXJkIE5BS18gYW55dGhpbmcgdGhhdCBzdGFydHMgbWFuZGF0
aW5nIHRoYXQgZXhwb3J0IG9mCj4gZmlsZXN5c3RlbXMgbXVzdCBiZSBhbGxvd2VkIHNpbXBseSBi
ZWNhdXNlIHRoZWlyIGZpbGUgaGFuZGxlcyBmaXQgZXhwb3J0Cj4gY3JpdGVyaWEuIEkgZG8gbm90
IGNhcmUgd2hldGhlciBwaWRmcyBvciBuc2ZzIGZpbGUgaGFuZGxlcyBmaXQgdGhlIGJpbGwuCj4g
VGhleSB3aWxsIG5vdCBiZSBleHBvcnRlZC4KCkkgZG9uJ3QgcmVhbGx5IGNhcmUgd2hhdCB3ZSBj
YWxsIHRoZSBmbGFnLiBJIGRvIGNhcmUgYSBsaXR0bGUgYWJvdXQKd2hhdCBpdHMgc2VtYW50aWNz
IGFyZSwgYnV0IHRoZSBlZmZlY3Qgc2hvdWxkIGJlIHRvIGVuc3VyZSB0aGF0IGZzCm1haW50YWlu
ZXJzIG1ha2UgYSBjb25zY2lvdXMgZGVjaXNpb24gYWJvdXQgd2hldGhlciBuZnNkIGV4cG9ydCBz
aG91bGQKYmUgYWxsb3dlZCBvbiB0aGUgZmlsZXN5c3RlbS7CoAoKQXQgdGhpcyBwb2ludCwgbWF5
YmUgd2Ugc2hvdWxkIGp1c3QgZ28gd2l0aCBOZWlsJ3MgCkVYUE9SVF9PUF9TVVBQT1JUU19ORlNf
RVhQT1JUIG9yIHNvbWV0aGluZy4gSXQncyBtdWNoIG1vcmUgYXJiaXRyYXJ5LAp0aGFuIHRyeWlu
ZyB0byBiYXNlIHRoaXMgb24gY3JpdGVyaWEgYWJvdXQgZmlsZWhhbmRsZSBzdGFiaWxpdHksIGJ1
dCBpdAp3b3VsZCBnaXZlIHVzIHRoZSBlZmZlY3Qgd2Ugd2FudC4KCi0tIApKZWZmIExheXRvbiA8
amxheXRvbkBrZXJuZWwub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
