Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C509D32D64
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 15:47:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdosdOCe2BZzJIPc/U1POHZXmGAjZO57k/oqky0AmSI=; b=GYBZpr2wWSLw3MIVSA7gZTrnPy
	8xnbastVtdm8NAY3XzXfgClbU4x6QfT1PQFm9V1GFQExc1APWgApbgOYZIsLKKlTOHZ4Ohz7XFSkR
	tnE/ZToc9nHLAuJw1gjwCd1XbK/EPdx2h+5JrxfslN5X0QY2ew6zkhZ13mZYcNs+0/I0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgl6f-0002aR-0j;
	Fri, 16 Jan 2026 14:47:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1vgl6Z-0002Zy-Gc
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 14:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rWCEzzwQTN3Jcqg8Pr6svjg3sqJRK7qADI0E/O11arI=; b=M4wmzmr9gg8Ar4vM6gTvjBPCzr
 WW3N9AaTdd/L4MpUrJkD7f1aFHyC5Jh32vQobwr57HNGTPFdZawcsYSL3SfyBzn3oh/OL+ZIrFmtc
 FH9IRP89EhNYN9btYV3bu1AMsNdp4+TI69oVfHSv3PIybz9lNcPes9Zs/E6ZgNiD+43E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rWCEzzwQTN3Jcqg8Pr6svjg3sqJRK7qADI0E/O11arI=; b=bVqdXhcpslMzL6BdrNkJWgxvVo
 ZRsSgqwY+jawldzxWXNQqlCey+Y0xYKZaqFP/VJlrvD3+6HHJrwjQq1yxY6u4fBgHlPxRbJAYa74P
 8K/um1KzqqC4E2ZTX2BPfWkdtyufPWYRWoWxq1jnMEht0MvPZZKoliCJF354/OQPXYro=;
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgl6Z-0002GU-3O for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 14:47:15 +0000
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b870cbd1e52so306872266b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Jan 2026 06:47:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768574823; cv=none;
 d=google.com; s=arc-20240605;
 b=WsZVQx42Nl8q+pdSt6SomVQ2Ci2W2fzo9SzOesD3up7Y/WkZw/D8AZBvO81V6tBT5v
 rbCKuKsDd2AEtfCLylrNIUHxyCmoPPSWXpNcxjo4z3DPgqQeKqywJO2hB3eChIKKTIiU
 IzH0dOso12bd89vWTOCwiJXm1PRwDEyrVUpC8qRBlqeNyPFmmu674KBP1dsNGscYlhqT
 uTxKMB8AwNo4XGc/on2D4d7jcGirutjkZBYwieBheHj/VU1ey5aZxR3W9imqGwTR5xdY
 5ws/qd7p229q8q1jBm7/CZ0SP2hQcEORvO8Ki92Beyfc2D5QzRt8kXQrS8PXsHKcPOHU
 4t9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rWCEzzwQTN3Jcqg8Pr6svjg3sqJRK7qADI0E/O11arI=;
 fh=cElZ/fMjIQY1zhEDQQE5rP3rDuZMnr7Ow2bKUfumM4g=;
 b=S/Rmhl/EECubiioKtraV3+biU0jM9DOiD1xtu029v/ICOPpOe1meImS9XpMfnvtccc
 3WZZ53Mej/WuR0JwfUUMZpntWlbEoVsNMIByys8/VYzbAXqcUB/Gmchm/Umn7/pz86V/
 cIjDHvVQdGo61zknO3umwsydtWci4vWBOaVf2MrQMU7FP+r5+wVkXXazP1e/7p6Cd4j6
 Z7D+4WkbEr2OZMEbYIu6Hj1P0oe+PtVihGouDlAIMRgEQmLAf+dMzAxYGreQtUlGZKNl
 cnlD0GqidkOyFyj07aetsRBPAqHcQoQn//lea4j2UUGrQdaz6hgWnq9iR7KKjMYVrGXd
 EBCQ==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768574823; x=1769179623; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rWCEzzwQTN3Jcqg8Pr6svjg3sqJRK7qADI0E/O11arI=;
 b=Y+KB7pB2X7ayz+nfEUCQkiX8CIIJfXhHaljoMKO9WOjvRvZn0bOjGd8slBuQK0snBE
 oGrZsjfWVl9i5EgOBRIwWnIszgeFScEtI7bLeP8shqCpHzPy2Hjz5yVmmEx6zXEVu/3a
 kftuF6maHxRCSGKNURk4BXUM6jlkDSTzApNzMnDv2+G6Jlhb5JKZ2x+gC50lMT1y4X+t
 ryPxAOmcVHO+0s1Ft6b2oT6g9f9SoXo4sCIyq8QHyyLtT/YVU+YBvfvoxu01pGcozZR2
 DW0ciI1vynurZJjp/VOANuezA2OmVqNSS/eZqkuRF7yKQPx2uEPcfqp4+Nl6YByHX4ZC
 weow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768574823; x=1769179623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rWCEzzwQTN3Jcqg8Pr6svjg3sqJRK7qADI0E/O11arI=;
 b=Hgp8wrUTdRn2HsAJVq8KGMDjhTYDccK7ryBnliSGDlX2NE2mnSLjz3s5rWGkjHJi9E
 7QoMuUZDYD2GlvcavZqyoLYVa8xBWVYi3LetYKhNMMrQr7/ZXU16LTCzE/+Bc0ygHisa
 gKQfA7s6wN/6ojz1vUA8RQzzsamblOZdgdzrMufWoNMYWYxFgOMkFcH5Gh2nZuiaCvYx
 wQ1Zayrneon8RANbrnFhM/ccyuHw25P83UoVDmdfttHOcGJf/S8wcf8LXZGcaDrdw8MZ
 gS1XUgmRJLxFXVxszsq9T/YOXhKXLaptFQtxDLH7zkOzUQVBemqrS7hjO9Z6fVwF7NOK
 7e3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMcD3W2G0pjAgw3Z7yMQA6tl1C4ZVnN2V6qDkDqi70IUdLHzcWHuzAo1WPXZNzbTrmyU5wUGmsHAfs7Aecbi95@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz2/IWqkEs+9hgOPULGmPfWBybzHCCwm1LkKZMZo+7WGSoKA6bY
 +GxYKYJf9zt89JczZztKqDJrgZnnl7Fy910C8+6e4LECFOpkezmUFf7JRmN7buz2i2JmZjbHVP0
 BG/nBTAU2/YX38B1zjCHN5270V5/eBJE=
X-Gm-Gg: AY/fxX6gaas81LI29GP0nPp9/Ls6BJkDAu1daHAJeOTVI8867esS8H57Zvmg/iXDqBL
 aubSdnL0CZMXChXkXu+cJGzileEVAUy0s7UGr8dfzg3T85zYWUylpE2I6+j5RiCVtYomA1arv6f
 YQMmexhiNNP2SA0CfY4/mDp9AvCRfjHy1RsLvfW9cEZLrjFQtybifNC5elw2OrvpCxejhPfFFoF
 yjE/uQLgUuLlsodXxWMup+ksZZcGFkotD86Aek5UyRNXajDL9cAzwYXKU3LZLQIYBns11bGICYx
 LoTDy7Qm8DUWQh8VJYQbfmSFB7/6iA==
X-Received: by 2002:a17:906:7305:b0:b72:a899:169f with SMTP id
 a640c23a62f3a-b8792d6cf8amr335795366b.4.1768574823087; Fri, 16 Jan 2026
 06:47:03 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <20260115-exportfs-nfsd-v1-29-8e80160e3c0c@kernel.org>
 <CAOQ4uxg304=s1Uoeayy3rm1e154Nf7ScOgseJHThw4uQjKwk0A@mail.gmail.com>
 <8e4c3df4828351c677186bf018061f2b1fd1b48e.camel@kernel.org>
In-Reply-To: <8e4c3df4828351c677186bf018061f2b1fd1b48e.camel@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 16 Jan 2026 15:46:50 +0100
X-Gm-Features: AZwV_QiRcITYtWxbtRpeIxfeQr9ho0AGFQM_8wESdHA53c49E-5t7eaX1T9rC3o
Message-ID: <CAOQ4uxhkZNueydP0tTCAj6tuzKWPTYB7=JR_hb4gaavSKQ8C2w@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 16, 2026 at 1:36 PM Jeff Layton wrote: > > On
 Thu, 2026-01-15 at 20:23 +0100, Amir Goldstein wrote: > > On Thu, Jan 15,
 2026 at 6:51 PM Jeff Layton wrote: > > > > > > Some filesystems [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [amir73il(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.44 listed in wl.mailspike.net]
X-Headers-End: 1vgl6Z-0002GU-3O
Subject: Re: [f2fs-dev] [PATCH 29/29] nfsd: only allow filesystems that set
 EXPORT_OP_STABLE_HANDLES
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

T24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMTozNuKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCAyMDI2LTAxLTE1IGF0IDIwOjIzICswMTAwLCBB
bWlyIEdvbGRzdGVpbiB3cm90ZToKPiA+IE9uIFRodSwgSmFuIDE1LCAyMDI2IGF0IDY6NTHigK9Q
TSBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gU29t
ZSBmaWxlc3lzdGVtcyBoYXZlIGdyb3duIGV4cG9ydCBvcGVyYXRpb25zIGluIG9yZGVyIHRvIHBy
b3ZpZGUKPiA+ID4gZmlsZWhhbmRsZXMgZm9yIGxvY2FsIHVzYWdlLiBTb21lIG9mIHRoZXNlIGZp
bGVzeXN0ZW1zIGFyZSB1bnN1aXRhYmxlCj4gPiA+IGZvciB1c2Ugd2l0aCBuZnNkLCBzaW5jZSB0
aGVpciBmaWxlaGFuZGxlcyBhcmUgbm90IHBlcnNpc3RlbnQgYWNyb3NzCj4gPiA+IHJlYm9vdHMu
Cj4gPiA+Cj4gPiA+IEluIF9fZmhfdmVyaWZ5LCBjaGVjayB3aGV0aGVyIEVYUE9SVF9PUF9TVEFC
TEVfSEFORExFUyBpcyBzZXQKPiA+ID4gYW5kIHJldHVybiBuZnNlcnJfc3RhbGUgaWYgaXQgaXNu
J3QuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5l
bC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgZnMvbmZzZC9uZnNmaC5jIHwgNCArKysrCj4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9m
cy9uZnNkL25mc2ZoLmMgYi9mcy9uZnNkL25mc2ZoLmMKPiA+ID4gaW5kZXggZWQ4NWRkNDNkYTE4
ZTZkNGM0NjY3ZmYxNGRjMDM1ZjJlYWNmZjFkNi4uZGE5ZDVmYjJlNjYxM2MyNzA3MTk1ZGEyZTg2
NzhiM2ZjYjNkNDQ0ZCAxMDA2NDQKPiA+ID4gLS0tIGEvZnMvbmZzZC9uZnNmaC5jCj4gPiA+ICsr
KyBiL2ZzL25mc2QvbmZzZmguYwo+ID4gPiBAQCAtMzM0LDYgKzMzNCwxMCBAQCBfX2ZoX3Zlcmlm
eShzdHJ1Y3Qgc3ZjX3Jxc3QgKnJxc3RwLAo+ID4gPiAgICAgICAgIGRlbnRyeSA9IGZocC0+Zmhf
ZGVudHJ5Owo+ID4gPiAgICAgICAgIGV4cCA9IGZocC0+ZmhfZXhwb3J0Owo+ID4gPgo+ID4gPiAr
ICAgICAgIGVycm9yID0gbmZzZXJyX3N0YWxlOwo+ID4gPiArICAgICAgIGlmICghKGRlbnRyeS0+
ZF9zYi0+c19leHBvcnRfb3AtPmZsYWdzICYgRVhQT1JUX09QX1NUQUJMRV9IQU5ETEVTKSkKPiA+
ID4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gPiArCj4gPiA+ICAgICAgICAgdHJhY2Vf
bmZzZF9maF92ZXJpZnkocnFzdHAsIGZocCwgdHlwZSwgYWNjZXNzKTsKPiA+ID4KPiA+Cj4gPiBJ
REdJLiBEb24ndCB5b3Ugd2FudCAgdG8gZGVueSB0aGUgZXhwb3J0IG9mIHRob3NlIGZzIGluIGNo
ZWNrX2V4cG9ydCgpPwo+ID4gQnkgdGhlIHNhbWUgbG9naWMgdGhhdCBjaGVja19leHBvcnQoKSBj
aGVja3MgZm9yIGNhbl9kZWNvZGVfZmgoKQo+ID4gbm90IGZvciBjYW5fZW5jb2RlX2ZoKCkuCj4g
Pgo+Cj4gSXQgY2VydGFpbmx5IHdvbid0IGh1cnQgdG8gYWRkIGEgY2hlY2sgZm9yIHRoaXMgdG8g
Y2hlY2tfZXhwb3J0KCksIGFuZAo+IEkndmUgZ29uZSBhaGVhZCBhbmQgZG9uZSBzby4gVG8gYmUg
Y2xlYXIsIGRvaW5nIHRoYXQgd29uJ3QgcHJldmVudCB0aGUKPiBmaWxlc3lzdGVtIGZyb20gYmVp
bmcgZXhwb3J0ZWQsIGJ1dCB5b3Ugd2lsbCBnZXQgYSB3YXJuaW5nIGxpa2UgdGhpcwo+IHdoZW4g
eW91IHRyeToKPgo+ICAgICBleHBvcnRmczogL3N5cy9mcy9jZ3JvdXAgZG9lcyBub3Qgc3VwcG9y
dCBORlMgZXhwb3J0Cj4KPiBUaGF0IGV4cG9ydCB3aWxsIHN0aWxsIHNob3cgdXAgaW4gbW91bnRk
IHRob3VnaCwgc28gdGhpcyBpcyBqdXN0IGEKPiB3YXJuaW5nLiBUcnlpbmcgdG8gbW91bnQgaXQg
dGhvdWdoIHdpbGwgZmFpbC4KPgoKT2gsIEkgZGlkIG5vdCBrbm93LiBXaGF0IGFuIG9kZCB1c2Vy
IGV4cGVyaWVuY2UuCkFueXdheSwgYmV0dGVyIHRoYW4gbm8gd2FybmluZyBhdCBhbGwuCgpUaGFu
a3MsCkFtaXIuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
