Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZSpIACEYR2q2TAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Jul 2026 04:02:09 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE1E6FDD48
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Jul 2026 04:02:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=VFBmBgSt;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=kq4azn6A;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=QRllyG09;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=UZ+G2Lxb;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/UKpZascL8SGL4luLt5Kzaa1bFPevKYhlMjluDgJ6Y=; b=VFBmBgStMPgk11bolhlHkwaNBA
	P/XF9Sbs/iwrynjdbqAZocvCtmmfGkRY3CfTmqdAoZflutwH/k6gLpMfpYehsVL5nJ7bV85l2K9MA
	j16T4n8MKOOWgHuHbn49tSy5BNfdSOK9nYO37Dbs7jT8Hyf2WVwIJdkPCJMWHdGHMJcs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wfTE8-000662-LO;
	Fri, 03 Jul 2026 02:02:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1wfTE7-00065o-3r
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jul 2026 02:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oMB68yM9vnc03sy1HjctW2y/WonQpK4WbJis7WinceA=; b=kq4azn6A361wgol2xx0f+/2RDj
 xzFNavnzp7MAkxxFBphnN7k3jho8vcGEG3u1hUPepqqm77nm0cyr8tnkAxcZgC7g38OL90Zq0TPyk
 A4/HarCm1eEDFvEAcIoL9xERp46PQ/j/PR5AYTABGvwxDUqvGO1q7NAGYuYSRT/n8uNg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oMB68yM9vnc03sy1HjctW2y/WonQpK4WbJis7WinceA=; b=QRllyG097hL4GA8SKH4sjSDb1L
 JRkd3CpshBlRJAqLhG2I1KzGKkcTLZuQ2Zr/iFzPYJeIOpBSXswQSvzAXL9evnl1Adn0b83rKDPV8
 GtITEja4UKKSi6gNqr+14s0HPcdC9ZfdOd1iwThQmTnyQ8ythgs4G++YiMG+nkPtM4yQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wfTE5-0000pY-JM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jul 2026 02:01:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with UTF8SMTP id AAEDE4043D;
 Fri,  3 Jul 2026 02:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 74CBF1F000E9;
 Fri,  3 Jul 2026 02:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783044107;
 bh=oMB68yM9vnc03sy1HjctW2y/WonQpK4WbJis7WinceA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=UZ+G2LxbC6hyyPY45gChM82kirEdP2W1cjQ9cB8OMLYUlkgPJvcmz/MIwlujeZotn
 4R/Zvspof7xaAk0X3wOEeMxwWctRoLV4NTsc8rCCvYPFhVb70Q3E9WueaPYWgiO166
 2xfbkdD8pCO8AIcoqCOfLU0RCSAZUSynWck7z/YdMGgn6CidZh7U3ECdLyiqSYmIa8
 M5P1TAt9IbsmnguwJe2hbJNiSXqqC63NyKcHW0pu+qG7lIvuTSoTWo9hiMZTxGrVTP
 BJg1wFffSxulJHs9pt/+Ff8RV8ItkGlqOI2T/5xJPdCI7Mb+FwKTLrcrnQUpxeWmfr
 1in1VDEBLw3PA==
Date: Thu, 2 Jul 2026 19:01:47 -0700
To: Joanne Koong <joannelkoong@gmail.com>
Message-ID: <20260703020147.GT9392@frogsfrogsfrogs>
References: <20260701000949.1666714-1-joannelkoong@gmail.com>
 <20260701000949.1666714-18-joannelkoong@gmail.com>
 <20260702140705.GE21339@lst.de>
 <20260702165117.GK9392@frogsfrogsfrogs>
 <CAJnrk1b8j5WHtbHOWNXc4=QBFOxde1f2QxTOeui7Ta8O-xWcTA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJnrk1b8j5WHtbHOWNXc4=QBFOxde1f2QxTOeui7Ta8O-xWcTA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 02, 2026 at 06:47:43PM -0700, Joanne Koong wrote:
 > On Thu, Jul 2, 2026 at 9:51 AM Darrick J. Wong <djwong@kernel.org> wrote:
 > > > > On Thu, Jul 02, 2026 at 04:07:05PM +0200, Christoph He [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wfTE5-0000pY-JM
Subject: Re: [f2fs-dev] [PATCH v2 17/18] iomap: pass iomap_next_fn directly
 instead of struct iomap_ops
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, Jan Kara <jack@suse.cz>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Chunhai Guo <guochunhai@vivo.com>, Dan Williams <djbw@kernel.org>,
 Naohiro Aota <naohiro.aota@wdc.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Zhang Yi <yi.zhang@huawei.com>,
 willy@infradead.org, Christoph Hellwig <hch@lst.de>,
 hsiangkao@linux.alibaba.com, Gao Xiang <xiang@kernel.org>,
 "open list:EXT2 FILE SYSTEM" <linux-ext4@vger.kernel.org>,
 Namjae Jeon <linkinjeon@kernel.org>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 "open list:FUSE FILESYSTEM \[CORE\]" <fuse-devel@lists.linux.dev>,
 brauner@kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:NTFS3 FILESYSTEM" <ntfs3@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, "open list:GFS2 FILE SYSTEM" <gfs2@lists.linux.dev>,
 "open list:FILESYSTEM DIRECT ACCESS \(DAX\)" <nvdimm@lists.linux.dev>,
 Hongbo Li <lihongbo22@huawei.com>, linux-fsdevel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>,
 "open list:EROFS FILE SYSTEM" <linux-erofs@lists.ozlabs.org>,
 "open list:BTRFS FILE SYSTEM" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:joannelkoong@gmail.com,m:ritesh.list@gmail.com,m:jack@suse.cz,m:mikulas@artax.karlin.mff.cuni.cz,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:hyc.lee@gmail.com,m:almaz.alexandrovich@paragon-software.com,m:clm@fb.com,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:guochunhai@vivo.com,m:djbw@kernel.org,m:naohiro.aota@wdc.com,m:zbestahu@gmail.com,m:miklos@szeredi.hu,m:yi.zhang@huawei.com,m:willy@infradead.org,m:hch@lst.de,m:hsiangkao@linux.alibaba.com,m:xiang@kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:viro@zeniv.linux.org.uk,m:jefflexu@linux.alibaba.com,m:jaegeuk@kernel.org,m:agruenba@redhat.com,m:axboe@kernel.dk,m:fuse-devel@lists.linux.dev,m:brauner@kernel.org,m:jth@kernel.org,m:tytso@mit.edu,m:ntfs3@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:gfs2@lists.linux.dev
 ,m:nvdimm@lists.linux.dev,m:lihongbo22@huawei.com,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,m:riteshlist@gmail.com,m:hyclee@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.cz,artax.karlin.mff.cuni.cz,sony.com,kernel.org,paragon-software.com,fb.com,dilger.ca,linux.ibm.com,linux.alibaba.com,vivo.com,wdc.com,szeredi.hu,huawei.com,infradead.org,lst.de,vger.kernel.org,suse.com,zeniv.linux.org.uk,redhat.com,kernel.dk,lists.linux.dev,mit.edu,lists.sourceforge.net,samsung.com,lists.ozlabs.org];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,frogsfrogsfrogs:mid,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CE1E6FDD48

T24gVGh1LCBKdWwgMDIsIDIwMjYgYXQgMDY6NDc6NDNQTSAtMDcwMCwgSm9hbm5lIEtvb25nIHdy
b3RlOgo+IE9uIFRodSwgSnVsIDIsIDIwMjYgYXQgOTo1MeKAr0FNIERhcnJpY2sgSi4gV29uZyA8
ZGp3b25nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgSnVsIDAyLCAyMDI2IGF0
IDA0OjA3OjA1UE0gKzAyMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gPiBMb29rcyBn
b29kOgo+ID4gPgo+ID4gPiBSZXZpZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3Qu
ZGU+Cj4gPiA+Cj4gPiA+IEluIHRlcm1zIG9mIG1lcmdlIGxvZ2lzdGljcywgSSB3b25kZXIgaWYg
d2Ugc2hvdWxkIGRlbGF5IHRoaXMgYW5kCj4gPiA+IHRoZSBwcmV2aW91cyBwYXRjaCB0byB0aGUg
bmV4dCBtZXJnZSB3aW5kb3cgc28gdGhhdCB3ZSBjYW4gbWluaW1pemUgdGhlCj4gPiA+IGNyb3Nz
LXN1YnN5c3RlbSBtZXJnZSBwYWluIHdpdGggbW9yZSBmaWxlIHN5c3RlbSBpb21hcCBjb252ZXJz
aW9uLgo+ID4gPiBJZiBub25lIG9mIHRoZW0gYWN0dWFsbHkgaGFwcGVuIHVudGlsIHJjNiBvciBz
bywgb3JpZiAgdGhlIG1lcmdlcyBhcmVuJ3QKPiA+ID4gcGFpbmZ1bCB3ZSBjb3VsZCBzdGlsbCBw
aWNrIHRoZW0gdXAgbGF0ZSBpbiB0aGUgbWVyZ2Ugd2luZG93Lgo+ID4KPiA+IEknZCBzYXkgZXZl
cnl0aGluZyBidXQgdGhpcyBwYXRjaCBzaG91bGQgZ28gaW4gZHVyaW5nIHRoZSBtZXJnZSB3aW5k
b3cKPiA+IGZvciA3LjMsIGFsb25nIHdpdGggY2xlYXIgaW5zdHJ1Y3Rpb25zIHRvIGJyYXVuZXIv
dG9ydmFsZHMgdG8gZXhwZWN0Cj4gPiB0aGlzIHBhdGNoIHRvIGFwcGVhciByaWdodCBiZWZvcmUg
Ny4zLXJjMSBnZXRzIHRhZ2dlZCwgdG8gY2xlYW4gdXAgYWxsCj4gPiB0aGUgb3RoZXIgY2hhbmdl
cyB0aGF0IGNvbWUgaW4uCj4gCj4gSnVzdCB0byBjbGFyaWZ5LCBkaWQgeW91IG1lYW4gdGhpcyBw
YXRjaCBhbmQgdGhlIHByZXZpb3VzIG9uZT8gSWYgaSdtCgpFciwgeWVzLCBwYXRjaGVzIDE2LTE4
IGluIHRoaXMgc2VyaWVzLgoKPiBpbnRlcnByZXRpbmcgQ2hyaXN0b3BoJ3MgY29uY2VybiBjb3Jy
ZWN0bHksIEkgdGhpbmsgaGUncyB3b3JyaWVkIGFib3V0Cj4gb3RoZXIgZmlsZXN5c3RlbXMgY29u
dmVydGluZyB0byBpb21hcCB1c2luZyB0aGUgLT5pb21hcF9iZWdpbigpIC8KPiAtPmlvbWFwX2Vu
ZCgpIGZ1bmN0aW9ucyBzdGlsbD8gVGhhdCBzb3VuZHMgbGlrZSBhIGdvb2QgcGxhbiB0byBtZSwg
Zm9yCj4gdjMgSSdsbCBzdWJtaXQgZXZlcnl0aGluZyBidXQgdGhpcyBwYXRjaCBhbmQgdGhlIGxh
c3Qgb25lIGFuZCB0aGVuCj4gc3VibWl0IHRoZXNlIHBhdGNoZXMgKGFuZCBhbnkgY2xlYW51cCBv
bmVzIHRoYXQgYmVjb21lIG5lY2Vzc2FyeSkgdG8KPiBDaHJpc3RpYW4gcmlnaHQgYmVmb3JlIDcu
My1yYzEgZ2V0cyB0YWdnZWQgKHdoaWNoIGFzIEkgdW5kZXJzdGFuZCBpdCwKPiBpcyB3aGVuIHRo
ZSBtZXJnZSB3aW5kb3cgaXMgYWJvdXQgdG8gY2xvc2UpLgoKWWVzLiAgQW5kIGJlIHN1cmUgdG8g
YXNrIGJvdGggb2YgdGhlbSBiZWZvcmVoYW5kIHNvIHRoZXJlIGFyZW4ndCBhbnkKeW91a25vd3do
by1zdHlsZSBzdXJwcmlzZXMvb3V0cmFnZXMuCgotLUQKCj4gVGhhbmtzLAo+IEpvYW5uZQo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
