Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0041BD28101
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 20:27:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnCABXQ4HCqiSKmHr1Nc4fiY26MI5zQDSMcRaKt8OLo=; b=gbwW1H4K14geRJik8SRQeDiJeE
	Cnjk635S8xG5WPGCDUXTU1bx6ixA44FVaguGZVFr96jr6mVoDgmvTLjJ3MjUnW2kyummEKRKXvYON
	nNzPYfFSHlQQnY5xThG7mMPL6RhtDO0d4ayQTzzsZl+ihoe+AZB8sO6ZNuDaKDZNcLzQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgSzf-0002Hg-OM;
	Thu, 15 Jan 2026 19:26:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1vgSze-0002HU-LM
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 19:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aDUsn+SB7H7nYSne5YCtxozzRNZ3DAEsXPNjynL2NCs=; b=GJIhxCmbnJCgrYb9tq1xM1zIuQ
 4I4Qj4EC1W1r8mY0+hvKHL/d2oBv3yFIUzAK/03v+dD/AYl2qRJOCtbJ1OypQtcy5C7EbKl4HPYNo
 U3AnQhFPdhOBrtBdTsZrxF+b9mb3mxKjiAgd3DpwichO0+1RjIRlCsprMgwFErvMgnTU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aDUsn+SB7H7nYSne5YCtxozzRNZ3DAEsXPNjynL2NCs=; b=A4YEOjpo/9S5X8tZUqwlFgwVg2
 TkGB+xf+Phu8n1t6J/MiE3+PCSGdUJlyCrmuXsw7uQzva/1GjAQzueqVepxBeGXqAy7e84EHKfTZj
 /A4nQxmnWVaZkIQwtzJaJGHS45LBZoJrM+D+d6n1mLaWWWCgJuwHvDnQpS/Qr5M9btts=;
Received: from mail-ed1-f46.google.com ([209.85.208.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgSze-0004BT-Rm for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 19:26:55 +0000
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-653781de668so1912016a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Jan 2026 11:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768505203; x=1769110003; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aDUsn+SB7H7nYSne5YCtxozzRNZ3DAEsXPNjynL2NCs=;
 b=ZLsjmj1A87UvY2TyBGnUqfnqWspouboM2fN7jtPUA7p/kEiBksnoJgmFZ7H71zu44V
 31PlQ9t5wO2eQe7aywozu1PTTqdL0awFoUa52n5rkBw/2JSW4ukgEfu75l11YGbIWgVL
 l6iMeVEKqC5tdtVkYeJVBIttDkbtmmvufos3vInixJ0szydKT0MB0EWhobJP6dP4EJpf
 jm9yD/Nze6dAAmB6xZqWeSeGldHEFsawoAirFVvId5Vm8nWs5qR0W8+aoWfGo8jMb74T
 1T8CVIKJxZwOSq2rfHqYmHVC5xLgeUEupO8e4AOxf2IzV14XU/7xjCqwxqiZA4ULTUnp
 1cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768505203; x=1769110003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aDUsn+SB7H7nYSne5YCtxozzRNZ3DAEsXPNjynL2NCs=;
 b=ZGgk/js/yEx74lPbk2ejcEfc+IDzt8RBsFgPeEpBjRNW66TX9D3YFnz3Sy1ISGezDw
 vuaLqS/TWqfwTPdfip0poLiAZV1bKf/PC1cJzW1etTe/Syyz+wt8xYnVq+02VvI8ORmq
 ND/f2WE09HDj+qNjeKvEfezaCqhhJps310pXG2tooDuezAmHy5IqrdBTRHGkadKumbFs
 RuT0lIMysYcpR9mdclQ2KHDMEaBPVXelfMXhnPdLHDR547zgDZoRacX8lydUfiEqEzdT
 63d2147vj4HpYB63oseJ9F9SzcAuynNWij6Oni6L1/7NMTrVlmIHTfIiPgBJw8aEfTuF
 YKyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+lXa2x3z3whDYaSO2gSYG8M+KR4vydw0cvc623VybdDPBNp+ZrHhAfz/z688jBuc9kRynrtQMeBPVPY4mpH9r@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw8EuqdPbfuPeGom39RQai/C5d2TymECtyzxU+xfKyOTwSgIefp
 gX9FWdfBX0oR/tdiaPHwS4EUlfyZzBRxLOVxiTxHzZDDT2nNNdPmPnkSTIk6/lPk84Suf0iCCUC
 9xCvUBvkpf1wM7lyBm7XdAwv3HB0kwo8=
X-Gm-Gg: AY/fxX7xsLYCuFY5nZId3fYzOCt0UYw6B1qs/MGNGbkM29N7NKvUZfqIK/oCp+T8Vuf
 ojmJ1DSepL8iVP3+Wu/ZHOtahi0Ym2KT5Dj3SFIW/FUMgukYF/h8xqbkx7a2Pof+zfEGJkAbb2D
 eRkrI1D+VZ9xNyOPpwyKsCRg98zB2Yu7ZYwbQevZbIoNwZBV4Yz31CxP58Iuxw1BaEO0638mPAR
 gGk3dZahRW4suCSFA7SjrRA0YThVkbW5EuB0jlG1NxA2RxYjpQrsM7hERv36aPtKrkrlS2qTEXB
 sJTe1mseWeer/9PB9amkymaqoKQKcA==
X-Received: by 2002:a05:6402:4402:b0:64b:4540:6edb with SMTP id
 4fb4d7f45d1cf-65452ad0f58mr442903a12.22.1768505202965; Thu, 15 Jan 2026
 11:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <20260115-exportfs-nfsd-v1-15-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-15-8e80160e3c0c@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 20:26:31 +0100
X-Gm-Features: AZwV_QgHlhd5AJtx9A_oESS7w6U6eCWyUuqrhH3MyU474xj2Kq62KuhGZ4o-aoc
Message-ID: <CAOQ4uxiTE+8r+F-e91cg9wZY-fjZfSHHOeLk3RWb+2JQQZvbvA@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 15, 2026 at 6:49 PM Jeff Layton wrote: > > Add
 the EXPORT_OP_STABLE_HANDLES flag to cifs export operations to indicate >
 that this filesystem can be exported via NFS. > > Signed-off-by: [...] 
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
 [209.85.208.46 listed in wl.mailspike.net]
X-Headers-End: 1vgSze-0004BT-Rm
Subject: Re: [f2fs-dev] [PATCH 15/29] smb/client: add
 EXPORT_OP_STABLE_HANDLES flag to export operations
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo0OeKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQWRkIHRoZSBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMgZmxh
ZyB0byBjaWZzIGV4cG9ydCBvcGVyYXRpb25zIHRvIGluZGljYXRlCj4gdGhhdCB0aGlzIGZpbGVz
eXN0ZW0gY2FuIGJlIGV4cG9ydGVkIHZpYSBORlMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWZmIExh
eXRvbiA8amxheXRvbkBrZXJuZWwub3JnPgo+IC0tLQo+ICBmcy9zbWIvY2xpZW50L2V4cG9ydC5j
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBh
L2ZzL3NtYi9jbGllbnQvZXhwb3J0LmMgYi9mcy9zbWIvY2xpZW50L2V4cG9ydC5jCj4gaW5kZXgg
ZDYwNmU4Y2JjYjdkYjJiNDAyNjY3NWJkOWNiYzI2NDgzNDY4NzgwNy4uYzFjMjNlMjFiZmU2MTBm
MWI1YmY4ZDBlZWE2NGFiNDllMmM2ZWUzYSAxMDA2NDQKPiAtLS0gYS9mcy9zbWIvY2xpZW50L2V4
cG9ydC5jCj4gKysrIGIvZnMvc21iL2NsaWVudC9leHBvcnQuYwo+IEBAIC00Nyw2ICs0Nyw3IEBA
IGNvbnN0IHN0cnVjdCBleHBvcnRfb3BlcmF0aW9ucyBjaWZzX2V4cG9ydF9vcHMgPSB7Cj4gICAq
IEZvbGxvd2luZyBleHBvcnQgb3BlcmF0aW9ucyBhcmUgbWFuZGF0b3J5IGZvciBORlMgZXhwb3J0
IHN1cHBvcnQ6Cj4gICAqICAgICAuZmhfdG9fZGVudHJ5ID0KPiAgICovCj4gKyAgICAgICAuZmxh
Z3MgPSBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMsCgpLaW5kIG9mIG9kZCB0byBoYXZlIHRoaXMg
aGVyZSBhZnRlciB0aGUgY29tbWVudCBvdXQgb2YgTkZTIGV4cG9ydC4KTWF5YmUgYWRkIGl0IGlu
c2lkZSB0aGUgY29tbWVudC4uLgoKVGhhbmtzLApBbWlyLgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
