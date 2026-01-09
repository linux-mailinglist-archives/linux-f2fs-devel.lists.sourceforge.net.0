Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D95CD0BF40
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 09 Jan 2026 19:53:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jM7MRQ7BeVuHNUgSEi+e5B+7gpBQnGg8NieHzdoyAEg=; b=ZvbQk2cv/r/SDXLEju/GA/1qlU
	xeOr9cyeaMglx7z3L7nlZrxxyxkH5q41lE4rwacPUZo2EgcAIQoxRtbx6urVgnEJgLMwe+XEA1gEd
	MF3pz5/VrGLIPDdfSgqpU3OuHb6ZkYgRyjH4607mpBcb+rWLJ+hrnJWtk5mKkFCJbf2E=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1veHbq-0002wC-7k;
	Fri, 09 Jan 2026 18:53:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1veHbp-0002w6-FA
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 18:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PEO8wbSaGOwwRv5UKfYcgXejOCV3Kmi4mBiob/Mhc5w=; b=F0IUg0Tg7xBWVmxrH30/64MbGN
 qcHtqDaxPg7fLxOtE9rnxXVP2q2qrEsUw0mWldy2U04jRaA/erxKRgIieh81NqMT5VgkNl42MbSAL
 udVhQKWzy45Mr836cyiWwQw0LtmGH8bV/I6fe9gjoQXgiXD5Gzqd09EUhg5R8rXd45ws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PEO8wbSaGOwwRv5UKfYcgXejOCV3Kmi4mBiob/Mhc5w=; b=FhaLjA8k43FQ5tdHIxj4jRdTDg
 u+n31dAXJ/IVD7OlrUACAxYme1hlh6rJxWsNy/wm5QfbtRTGZZGlC/aIz74dEIrOS3S+DFt7Fyzwf
 t2oyC5h9/xW4zgbC4DucLnVFVHV29YrMyLBm7sg8xSej5TsxxvkSBDd8JlnJfq5qOlHs=;
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1veHbo-0007oG-Vk for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 18:53:17 +0000
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-64b9d01e473so7347702a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 09 Jan 2026 10:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767984790; x=1768589590; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEO8wbSaGOwwRv5UKfYcgXejOCV3Kmi4mBiob/Mhc5w=;
 b=OlSCYCNZqkxo2ATOHXsCgcOSLKGyP4qu6o0VT9Ybs5SU8Bp1ACtWN8gagEmR5B20n5
 i9lzp/qQ2w3Wb3NDGRQFrS2n0AVGGLzdKCnSqi0RmuTZC8H5M0NLKnKhvYZ/F6B21/nZ
 RLPHQKEVN7Rg2Z004im43cAO+UkDci74Nw6f+WA3NIYFXh4RjN5ozGZMfX+RhkalFedM
 U3uX4nIHFAf0iLeXAapOmoYUnpqZmq9X60UKu+nt2AdeqvAQOlg47bPNFt0YsE2xoBkY
 PVAkyr4oHFjLlfY2PuEeTnHb6+Bh6h8C9cMiPiclYCKvq8mCOkCkZEriMiBdYyGRFvYs
 zCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767984790; x=1768589590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PEO8wbSaGOwwRv5UKfYcgXejOCV3Kmi4mBiob/Mhc5w=;
 b=HE1Ki54kZQxTd6nDHH7uWCdNA5gR1U8oYVD5kYk3jkdkZxJZIZ1453D/hFNcX9tB92
 1QlWGIZES5p5HUiPt+4n4Dnv8kq5Tn5WXpK/NHmjXjSQgL0Du+WnEcPHhENmOT20qgXf
 LjckWy7VjKPXPTruE9BTEcHDyRCVoP/e4l7wsRaU45j4I7GhNUDM80bU0AjXeyyNvll3
 KV1FGrwAwVhfWquuakbJGtT1N0Ogj44QHeceCjLNPP/c0Iho2CjZmMUK9ar1OETZ4hVJ
 E5C67AaqzmpEwyjrBr6KcZVS69MihLNjkbmSiJxRJ/LHArWzV5Pkrlf9s8Qj+qrTu+48
 8AmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXSjizYy+35Btk+L1I3OB6FyVB0pu4h9z5tZuvM0Qm5DPXYnqX0ZcNlg/odB1CyG2KxbCUayb+FKy0zTfHIC7J@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwepgfxEDoQiFdUfFvLnvkCWDsbVR2c4Ql5g6Wps9/DG4wJDqh6
 NuI0xfjZxe34KaRvr2lKghP77gGWXVW8PuBWjMluJqqJQLaNIj1oK6/tobvysWdURq3z+awzE2r
 7PHHtm62nVzFY/X4/ft2NjDxxyP5i2NM=
X-Gm-Gg: AY/fxX5eFsOcvGbe0dT7Fp98a/nkw1/MBgmYgR9jlE2Wyvi8KVJAcvpqF6XlfgvT53G
 uzZZ+XCa5SDnLgC4OQ6ygE5a8en/HW4MIp8EoXPQa+VbYC8/sHg42wCkn/6Y3340OZALH2/muBl
 fvCYTv7BGnjkB/VXyWTs05uIZ1PJTvm/jIsIoK2YGZd4sSIAILLIosUDXX1AW6C94M1h14yjVJG
 Q/t+o0UAarR6zUH5q221oEf9ynHOWzg0O/0jg/aawwZFP21FrM1RDiIZgVbCiIVK+uCV3O33r4k
 rEgNA+tFY5IHzIZmzenuFpLPTSw/TIIuYY8sR6EE
X-Google-Smtp-Source: AGHT+IFY7MBbUL67We039/hTqFQidfYCDXoLMKl5hH4eJeY3RDGzxdromP5L0kMZXOGuaChoBhGE8PO55vilYs9+TsQ=
X-Received: by 2002:a05:6402:278f:b0:64b:4333:1ece with SMTP id
 4fb4d7f45d1cf-65097e88af5mr10672063a12.34.1767984790069; Fri, 09 Jan 2026
 10:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
 <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
In-Reply-To: <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 9 Jan 2026 19:52:57 +0100
X-Gm-Features: AQt7F2pw3gC6snSxmHIFjd46zJk7oZ4nEXaveS8flAw1hsLI4KglAqmZVf1WWIg
Message-ID: <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>, Christian Brauner <brauner@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 8, 2026 at 7:57 PM Jeff Layton wrote: > > On Thu,
 2026-01-08 at 18:40 +0100, Jan Kara wrote: > > On Thu 08-01-26 12:12:55,
 Jeff Layton wrote: > > > Yesterday, I sent patches to fix how d [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [amir73il(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.44 listed in wl.mailspike.net]
X-Headers-End: 1veHbo-0007oG-Vk
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
 linux-cifs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 linux-nilfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, linux-nfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
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

T24gVGh1LCBKYW4gOCwgMjAyNiBhdCA3OjU34oCvUE0gSmVmZiBMYXl0b24gPGpsYXl0b25Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIDIwMjYtMDEtMDggYXQgMTg6NDAgKzAxMDAsIEph
biBLYXJhIHdyb3RlOgo+ID4gT24gVGh1IDA4LTAxLTI2IDEyOjEyOjU1LCBKZWZmIExheXRvbiB3
cm90ZToKPiA+ID4gWWVzdGVyZGF5LCBJIHNlbnQgcGF0Y2hlcyB0byBmaXggaG93IGRpcmVjdG9y
eSBkZWxlZ2F0aW9uIHN1cHBvcnQgaXMKPiA+ID4gaGFuZGxlZCBvbiBmaWxlc3lzdGVtcyB3aGVy
ZSB0aGUgc2hvdWxkIGJlIGRpc2FibGVkIFsxXS4gVGhhdCBzZXQgaXMKPiA+ID4gYXBwcm9wcmlh
dGUgZm9yIHY2LjE5LiBGb3IgdjcuMCwgSSB3YW50IHRvIG1ha2UgbGVhc2Ugc3VwcG9ydCBiZSBt
b3JlCj4gPiA+IG9wdC1pbiwgcmF0aGVyIHRoYW4gb3B0LW91dDoKPiA+ID4KPiA+ID4gRm9yIGhp
c3RvcmljYWwgcmVhc29ucywgd2hlbiAtPnNldGxlYXNlKCkgZmlsZV9vcGVyYXRpb24gaXMgc2V0
IHRvIE5VTEwsCj4gPiA+IHRoZSBkZWZhdWx0IGlzIHRvIHVzZSB0aGUga2VybmVsLWludGVybmFs
IGxlYXNlIGltcGxlbWVudGF0aW9uLiBUaGlzCj4gPiA+IG1lYW5zIHRoYXQgaWYgeW91IHdhbnQg
dG8gZGlzYWJsZSB0aGVtLCB5b3UgbmVlZCB0byBleHBsaWNpdGx5IHNldCB0aGUKPiA+ID4gLT5z
ZXRsZWFzZSgpIGZpbGVfb3BlcmF0aW9uIHRvIHNpbXBsZV9ub3NldGxlYXNlKCkgb3IgdGhlIGVx
dWl2YWxlbnQuCj4gPiA+Cj4gPiA+IFRoaXMgaGFzIGNhdXNlZCBhIG51bWJlciBvZiBwcm9ibGVt
cyBvdmVyIHRoZSB5ZWFycyBhcyBzb21lIGZpbGVzeXN0ZW1zCj4gPiA+IGhhdmUgaW5hZHZlcnRh
bnRseSBhbGxvd2VkIGxlYXNlcyB0byBiZSBhY3F1aXJlZCBzaW1wbHkgYnkgaGF2aW5nIGxlZnQK
PiA+ID4gaXQgc2V0IHRvIE5VTEwuIEl0IHdvdWxkIGJlIGJldHRlciBpZiBmaWxlc3lzdGVtcyBo
YWQgdG8gb3B0LWluIHRvIGxlYXNlCj4gPiA+IHN1cHBvcnQsIHBhcnRpY3VsYXJseSB3aXRoIHRo
ZSBhZHZlbnQgb2YgZGlyZWN0b3J5IGRlbGVnYXRpb25zLgo+ID4gPgo+ID4gPiBUaGlzIHNlcmll
cyBoYXMgc2V0cyB0aGUgLT5zZXRsZWFzZSgpIG9wZXJhdGlvbiBpbiBhIHBpbGUgb2YgZXhpc3Rp
bmcKPiA+ID4gbG9jYWwgZmlsZXN5c3RlbXMgdG8gZ2VuZXJpY19zZXRsZWFzZSgpIGFuZCB0aGVu
IGNoYW5nZXMKPiA+ID4ga2VybmVsX3NldGxlYXNlKCkgdG8gcmV0dXJuIC1FSU5WQUwgd2hlbiB0
aGUgc2V0bGVhc2UoKSBvcGVyYXRpb24gaXMgbm90Cj4gPiA+IHNldC4KPiA+ID4KPiA+ID4gV2l0
aCB0aGlzIGNoYW5nZSwgbmV3IGZpbGVzeXN0ZW1zIHdpbGwgbmVlZCB0byBleHBsaWNpdGx5IHNl
dCB0aGUKPiA+ID4gLT5zZXRsZWFzZSgpIG9wZXJhdGlvbnMgaW4gb3JkZXIgdG8gcHJvdmlkZSBs
ZWFzZSBhbmQgZGVsZWdhdGlvbgo+ID4gPiBzdXBwb3J0Lgo+ID4gPgo+ID4gPiBJIG1haW5seSBm
b2N1c2VkIG9uIGZpbGVzeXN0ZW1zIHRoYXQgYXJlIE5GUyBleHBvcnRhYmxlLCBzaW5jZSBORlMg
YW5kCj4gPiA+IFNNQiBhcmUgdGhlIG1haW4gdXNlcnMgb2YgZmlsZSBsZWFzZXMsIGFuZCB0aGV5
IHRlbmQgdG8gZW5kIHVwIGV4cG9ydGluZwo+ID4gPiB0aGUgc2FtZSBmaWxlc3lzdGVtIHR5cGVz
LiBMZXQgbWUga25vdyBpZiBJJ3ZlIG1pc3NlZCBhbnkuCj4gPgo+ID4gU28sIHdoYXQgYWJvdXQg
a2VybmZzIGFuZCBmdXNlPyBUaGV5IHNlZW0gdG8gYmUgZXhwb3J0YWJsZSBhbmQgZG9uJ3QgaGF2
ZQo+ID4gLnNldGxlYXNlIHNldC4uLgo+ID4KPgo+IFllcywgRlVTRSBuZWVkcyB0aGlzIHRvby4g
SSdsbCBhZGQgYSBwYXRjaCBmb3IgdGhhdC4KPgo+IEFzIGZhciBhcyBrZXJuZnMgZ29lczogQUlV
SSwgdGhhdCdzIGJhc2ljYWxseSB3aGF0IHN5c2ZzIGFuZCByZXNjdHJsCj4gYXJlIGJ1aWx0IG9u
LiBEbyB3ZSByZWFsbHkgZXhwZWN0IHBlb3BsZSB0byBzZXQgbGVhc2VzIHRoZXJlPwo+Cj4gSSBn
dWVzcyBpdCdzIHRlY2huaWNhbGx5IGEgcmVncmVzc2lvbiBzaW5jZSB5b3UgY291bGQgc2V0IHRo
ZW0gb24gdGhvc2UKPiBzb3J0cyBvZiBmaWxlcyBlYXJsaWVyLCBidXQgcGVvcGxlIGRvbid0IHVz
dWFsbHkgZXhwb3J0IGtlcm5mcyBiYXNlZAo+IGZpbGVzeXN0ZW1zIHZpYSBORlMgb3IgU01CLCBh
bmQgdGhhdCBzZWVtcyBsaWtlIHNvbWV0aGluZyB0aGF0IGNvdWxkIGJlCj4gdXNlZCB0byBtYWtl
IG1pc2NoaWVmLgo+Cj4gQUZBSUNULCBrZXJuZnNfZXhwb3J0X29wcyBpcyBtb3N0bHkgdG8gc3Vw
cG9ydCBvcGVuX2J5X2hhbmRsZV9hdCgpLiBTZWUKPiBjb21taXQgYWE4MTg4MjUzNDc0ICgia2Vy
bmZzOiBhZGQgZXhwb3J0ZnMgb3BlcmF0aW9ucyIpLgo+Cj4gT25lIGlkZWE6IHdlIGNvdWxkIGFk
ZCBhIHdyYXBwZXIgYXJvdW5kIGdlbmVyaWNfc2V0bGVhc2UoKSBmb3IKPiBmaWxlc3lzdGVtcyBs
aWtlIHRoaXMgdGhhdCB3aWxsIGRvIGEgV0FSTl9PTkNFKCkgYW5kIHRoZW4gY2FsbAo+IGdlbmVy
aWNfc2V0bGVhc2UoKS4gVGhhdCB3b3VsZCBrZWVwIGxlYXNlcyB3b3JraW5nIG9uIHRoZW0gYnV0
IHdlIG1pZ2h0Cj4gZ2V0IHNvbWUgcmVwb3J0cyB0aGF0IHdvdWxkIHRlbGwgdXMgd2hvJ3Mgc2V0
dGluZyBsZWFzZXMgb24gdGhlc2UgZmlsZXMKPiBhbmQgd2h5LgoKSU1PLCB5b3UgYXJlIGJlaW5n
IHRvbyBjYXV0aW91cywgYnV0IHdoYXRldmVyLgoKSXQgaXMgbm90IGFjY3VyYXRlIHRoYXQga2Vy
bmZzIGZpbGVzeXN0ZW1zIGFyZSBORlMgZXhwb3J0YWJsZSBpbiBnZW5lcmFsLgpPbmx5IGNncm91
cGZzIGhhcyBLRVJORlNfUk9PVF9TVVBQT1JUX0VYUE9SVE9QLgoKSWYgYW55IGFwcGxpY2F0aW9u
IGlzIHVzaW5nIGxlYXNlcyBvbiBjZ3JvdXAgZmlsZXMsIGl0IG11c3QgYmUgc29tZQp2ZXJ5IGFk
dmFuY2VkIHJ1bnRpbWUgKGkuZS4gc3lzdGVtZCksIHNvIHdlIHNob3VsZCBrbm93IGFib3V0IHRo
ZQpyZWdyZXNzaW9uIHNvb25lciByYXRoZXIgdGhhbiBsYXRlci4KClRoZXJlIGFyZSBhbHNvIHRo
ZSByZWNlbnRseSBhZGRlZCBuc2ZzIGFuZCBwaWRmcyBleHBvcnRfb3BlcmF0aW9ucy4KCkkgaGF2
ZSBhIHJlY29sbGVjdGlvbiBhYm91dCB3YW50aW5nIHRvIGJlIGV4cGxpY2l0IGFib3V0IG5vdCBh
bGxvd2luZwp0aG9zZSB0byBiZSBleHBvcnRhYmxlIHRvIE5GUyAobnNmcyBzcGVjaWZpY2FsbHkp
LCBidXQgSSBjYW4ndCBzZWUgd2hlcmUKYW5kIGlmIHRoYXQgcmVzdHJpY3Rpb24gd2FzIGRvbmUu
CgpDaHJpc3RpYW4/IERvIHlvdSByZW1lbWJlcj8KClRoYW5rcywKQW1pci4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
