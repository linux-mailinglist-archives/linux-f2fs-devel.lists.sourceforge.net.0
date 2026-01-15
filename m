Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAE9D281C6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 20:32:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIqzc+DYWYmi+3h8uHSAbHja8JpvcVUklHASNcneQP0=; b=bnHvb1aOG0v4XuyLo8Ow309eoW
	sHWaZmbqOJdbgFytrfJuZv33RSC/fj/95oCPatLDjSCK5/RX5CiPdx1p+LpWN2bf38/cHcZTtX2hl
	337B/OLofKiVs8kLIXyEyc8KPG+mYuAv3b2cQCU4KCdyAP3skBVvMA2TDt+5iedpvsPI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgT4a-0003LD-O1;
	Thu, 15 Jan 2026 19:32:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1vgT4Z-0003L6-7c
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 19:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JqDSb07Y8F9mJCkqUS0QQHnJ5q+4REJWbBlGem8BlhI=; b=ZKqffFDr8UNc8xyiZAB+saykX0
 YBcK+pnRQzQaWBnYOocCAXlcr7+db/hn/GoxJxOM9bUbMnfYYxCpFH0Wci+ugUAs+T5E7YgsljSq9
 c0s8lHDGnHi980p80ylpWF0le0I97X8j5VviOWTAwsIkudPEyRsATeCzQL4EB2ALXDUg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JqDSb07Y8F9mJCkqUS0QQHnJ5q+4REJWbBlGem8BlhI=; b=IhJgfOj+Go6QuMzJua9wO1iz5E
 E0ktIxgGgzJ1e2F85ppLWFf8sxWfnOFLCCkHDwJ8qr/Y/DDSWWfNtISpxcAUUbDfXQPWL/8uL4asV
 j7K95Wtt/9k7hCVlCFpMRxt7VFYj+Z5Q12Xg5bTshCN9ucirXSdz+8X1GGPhThrW126g=;
Received: from mail-ed1-f50.google.com ([209.85.208.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgT4Y-0004Q7-NY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 19:31:59 +0000
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-64b9b0b4d5dso2794224a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Jan 2026 11:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768505512; x=1769110312; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JqDSb07Y8F9mJCkqUS0QQHnJ5q+4REJWbBlGem8BlhI=;
 b=ZTLKHg28HTt67z6JHhUuhC2+nzeyG3JSz5vZi/pMVgUQ5Ce+kxiX3wz53xwKvjmmAH
 kVcRicRhnE40ovFooLv9lnaN6DDZu83/UXS2ugTXzsugt7lB5ZFfgrzispi4s71x27UU
 DtKcq6VhOwh5VHgzgAWGApXC/nFlm2YovbozTV0+DKi+1/O/NxqUkuy9dJeIDDIpTd1y
 y7eJ80VO/bUntB+DEsHdGiPWpd/LL9CxxyyS0WR0GnhFhILG2iC5qwMWzwiPqjoUNeWM
 W7ImsNGCOPleCT0BWgfo5J2klUpOy0qL3zCFNzO+vaSoxDnEvu5yBoFJ8NDcq6DLOq9v
 1aMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768505512; x=1769110312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JqDSb07Y8F9mJCkqUS0QQHnJ5q+4REJWbBlGem8BlhI=;
 b=MYCdzz0n5JlciVgb31XD9qIOgfhuygpe338nxGBoyNWRJv6ckKVIgTvv4bkipo1DXE
 SFfM1tqxponUOIB7FhG0Lnsp31cgSD16+/sY/CSXe78sq/tgeKj1zkuATgepgSlJ5HGe
 G9pF/omb8MYUBYvwxuCan1u1UIH9+36Ju9V+YH5FzAEGvy6amPHDpwJVrCaKG3PQRg+G
 UNpxDn8CZ3qZzkH1qULJTrzpkCVtheUFTlns8izoTHAxVdiBr5C8Cbg7/h2gzDv8QtdH
 u0i808M3XVrZkHFRPCjPLvKeogn0lsezvyN8FAKh8sKdYUKGEbUu/0QfAvEAgOELVyxB
 Mn6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOJ1fGzpfY+s4/g3VTDaiUi1FaZOj9AKAmSeZPA/NyNaHxBMpXPPu508Ywj5/mcWNYm8OQjfCxfiUpf4TCLw5V@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyJ6y3OrX+f8vDEFEpqOoVm9pJ84Tifib5uZNO/xNz2UcRo1gr7
 iLzsv84h8UtUS3wmz31wBBbdJs3coVipKBEK4Oe4jIMEmwrZvgZCfixxHS4sKcg3rEsiYe/dvAe
 +0strNcqKKAQbpr8NhgnaG9mXkEo367Y=
X-Gm-Gg: AY/fxX5cHvPE64adO5682XTts21EWfzjTICwMB2RENtIeIMKMuz8ccqYLb1RbenZkjO
 z743wRWKx35oT+Uk3y2YebXQZy+QkrlBA7wri8nb3RjPoh8YZN+iOCqByOyfLwAuFPFwZnxgkQR
 zv9D7OSqqh9OexyUSNhPsAnEsJKY1rWRlPZur17+we+X+d2qwuRabsZmpU1yU8aZzeJIRca70pR
 IkNDnCnm2wfq3I1G41JtjXXHkNBeB82idrBSuAyLCWHUgtxuel+yPp5YupKBQaA+uUhlGxsgubm
 oSl40K9sal4zCRG0vhVUhn3JkX3Bgg==
X-Received: by 2002:a17:907:3c87:b0:b87:442:e9b6 with SMTP id
 a640c23a62f3a-b879690c54amr11543766b.17.1768505511676; Thu, 15 Jan 2026
 11:31:51 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
 <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
In-Reply-To: <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 20:31:40 +0100
X-Gm-Features: AZwV_QhvHAFd_rX2K5lnQvHY5zGWrCY2L2ECA3-jgjFMNT8gFVUBrqM9bcPeRhY
Message-ID: <CAOQ4uxhnSPoqwws7XW4JU=jjgZJoFgCjcWwbfPaprDCZq=wnKQ@mail.gmail.com>
To: Chuck Lever <cel@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 15, 2026 at 8:14 PM Amir Goldstein wrote: > >
 On Thu, Jan 15, 2026 at 7:32 PM Chuck Lever wrote: > > > > > > > > On Thu,
 Jan 15, 2026, at 1:17 PM, Amir Goldstein wrote: > > > On Thu, J [...] 
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
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [amir73il(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.50 listed in wl.mailspike.net]
X-Headers-End: 1vgT4Y-0004Q7-NY
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgODoxNOKAr1BNIEFtaXIgR29sZHN0ZWluIDxhbWlyNzNp
bEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNzozMuKAr1BN
IENodWNrIExldmVyIDxjZWxAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4KPiA+Cj4gPiBPbiBU
aHUsIEphbiAxNSwgMjAyNiwgYXQgMToxNyBQTSwgQW1pciBHb2xkc3RlaW4gd3JvdGU6Cj4gPiA+
IE9uIFRodSwgSmFuIDE1LCAyMDI2IGF0IDY6NDjigK9QTSBKZWZmIExheXRvbiA8amxheXRvbkBr
ZXJuZWwub3JnPiB3cm90ZToKPiA+ID4+Cj4gPiA+PiBJbiByZWNlbnQgeWVhcnMsIGEgbnVtYmVy
IG9mIGZpbGVzeXN0ZW1zIHRoYXQgY2FuJ3QgcHJlc2VudCBzdGFibGUKPiA+ID4+IGZpbGVoYW5k
bGVzIGhhdmUgZ3Jvd24gc3RydWN0IGV4cG9ydF9vcGVyYXRpb25zLiBUaGV5J3ZlIG1vc3RseSBk
b25lCj4gPiA+PiB0aGlzIGZvciBsb2NhbCB1c2UtY2FzZXMgKGVuYWJsaW5nIG9wZW5fYnlfaGFu
ZGxlX2F0KCkgYW5kIHRoZSBsaWtlKS4KPiA+ID4+IFVuZm9ydHVuYXRlbHksIGhhdmluZyBleHBv
cnRfb3BlcmF0aW9ucyBpcyBnZW5lcmFsbHkgc3VmZmljaWVudCB0byBtYWtlCj4gPiA+PiBhIGZp
bGVzeXN0ZW0gYmUgY29uc2lkZXJlZCBleHBvcnRhYmxlIHZpYSBuZnNkLCBidXQgdGhhdCByZXF1
aXJlcyB0aGF0Cj4gPiA+PiB0aGUgc2VydmVyIHByZXNlbnQgc3RhYmxlIGZpbGVoYW5kbGVzLgo+
ID4gPgo+ID4gPiBXaGVyZSBkb2VzIHRoZSB0ZXJtICJzdGFibGUgZmlsZSBoYW5kbGVzIiBjb21l
IGZyb20/IGFuZCB3aGF0IGRvZXMgaXQgbWVhbj8KPiA+ID4gV2h5IG5vdCAicGVyc2lzdGVudCBo
YW5kbGVzIiwgd2hpY2ggaXMgZGVzY3JpYmVkIGluIE5GUyBhbmQgU01CIHNwZWNzPwo+ID4gPgo+
ID4gPiBOb3QgdG8gbWVudGlvbiB0aGF0IEVYUE9SVF9PUF9QRVJTSVNURU5UX0hBTkRMRVMgd2Fz
IEFja2VkCj4gPiA+IGJ5IGJvdGggQ2hyaXN0b3BoIGFuZCBDaHJpc3RpYW46Cj4gPiA+Cj4gPiA+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWZzZGV2ZWwvMjAyNjAxMTUtcnVuZGdhbmct
bGVpaGdhYmUtMTIwMThlOTNjMDBjQGJyYXVuZXIvCj4gPiA+Cj4gPiA+IEFtIEkgbWlzc2luZyBh
bnl0aGluZz8KPiA+Cj4gPiBQRVJTSVNURU5UIGdlbmVyYWxseSBpbXBsaWVzIHRoYXQgdGhlIGZp
bGUgaGFuZGxlIGlzIHNhdmVkIG9uCj4gPiBwZXJzaXN0ZW50IHN0b3JhZ2UuIFRoaXMgaXMgbm90
IHRydWUgb2YgdG1wZnMuCj4KPiBUaGF0J3Mgb25lIHdheSBvZiBpbnRlcnByZXRpbmcgInBlcnNp
c3RlbnQiLgo+IEFub3RoZXIgd2F5IGlzICJjb250aW51aW5nIHRvIGV4aXN0IG9yIG9jY3VyIG92
ZXIgYSBwcm9sb25nZWQgcGVyaW9kLiIKPiB3aGljaCB3b3JrcyB3ZWxsIGZvciB0bXBmcyB0aGF0
IGlzIG1vdW50ZWQgZm9yIGEgbG9uZyB0aW1lLgo+Cj4gQnV0IEkgYW0gY29uZnVzZWQsIGJlY2F1
c2UgSSB3ZW50IGxvb2tpbmcgZm9yIHdoZXJlIEplZmYgc2FpZCB0aGF0Cj4geW91IHN1Z2dlc3Rl
ZCBzdGFibGUgZmlsZSBoYW5kbGVzIGFuZCB0aGlzIGlzIHdoYXQgSSBmb3VuZCB0aGF0IHlvdSB3
cm90ZToKPgo+ICJ0bXBmcyBmaWxlaGFuZGxlcyBhbGlnbiBxdWl0ZSB3ZWxsIHdpdGggdGhlIHRy
YWRpdGlvbmFsIGRlZmluaXRpb24KPiAgb2YgcGVyc2lzdGVudCBmaWxlaGFuZGxlcy4gdG1wZnMg
ZmlsZWhhbmRsZXMgbGl2ZSBhcyBsb25nIGFzIHRtcGZzIGZpbGVzIGRvLAo+ICBhbmQgdGhhdCBp
cyBhbGwgdGhhdCBpcyByZXF1aXJlZCB0byBiZSBjb25zaWRlcmVkICJwZXJzaXN0ZW50Ii4KPgo+
ID4KPiA+IFRoZSB1c2Ugb2YgInN0YWJsZSIgbWVhbnMgdGhhdCB0aGUgZmlsZSBoYW5kbGUgaXMg
c3RhYmxlIGZvcgo+ID4gdGhlIGxpZmUgb2YgdGhlIGZpbGUuIFRoaXMgL2lzLyB0cnVlIG9mIHRt
cGZzLgo+Cj4gSSBjYW4gbGl2ZSB3aXRoIFNUQUJMRV9IQU5ETEVTIEkgZG9uJ3QgbWluZCBhcyBt
dWNoLAo+IEkgdW5kZXJzdGFuZCB3aGF0IGl0IG1lYW5zLCBidXQgdGhlIGRlZmluaXRpb24gYWJv
dmUgaXMgaW52ZW50ZWQsCj4gd2hlcmVhcyB0aGUgdGVybSBwZXJzaXN0ZW50IGhhbmRsZXMgaXMg
d2VsbCBrbm93biBhbmQgd2VsbCBkZWZpbmVkLgo+CgpBbmQgYWxzbyBmb3Jnb3QgdG8gbWVudGlv
biAtIFNUQUJMRSBIQU5ETEVTIGlzIHZlcnkgbGV4aWNvZ3JhcGhpY2FsbHkKY2xvc2UgdG8gU1RB
TEUgSEFORExFUyA6LS8KClRoYW5rcywKQW1pci4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
