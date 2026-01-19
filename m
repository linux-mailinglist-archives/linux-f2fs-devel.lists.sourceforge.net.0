Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CE4D3B1C6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:43:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjkTtBUDdVAfF0q1IN7Fwd8Rctp413lHgAevrk3suV0=; b=Qk/o0JkN17/BX3FXVc2dC3q0ch
	B/cV02SlVmMYh7cf/XwANV6AOyoxTRxamUWLWJardTJDusEDyZ2OcOcXt4F1zoJVeGLfjVM0LD9v4
	53XOgmHDGpywI8WxI/h5XenjYitxUxAZGPDHwie5bbnAhqFlOF0oJRtwDHMi57UH982w=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhsLq-00064Q-Th;
	Mon, 19 Jan 2026 16:43:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1vhsLq-00064K-Gu
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 16:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t7xapJC59KqqTTsHRvPEloTsuOjJhUfycEcUpCAL4U8=; b=kL467upNh1k9xcORPA4ekjtaht
 VmtTj9QLS43BmrLqIiXgUtoKFwEkBwbcLhNt2cMjoY/92pXEJYomdO7JEgBs2oK5Qxkuo7NiaIhjY
 YjRMALGnpqx8gQkPjbMFGBc3bBE5BZh4GNmkE6AglehersclB6Qol3rIUA/ZqXk7Y4mU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t7xapJC59KqqTTsHRvPEloTsuOjJhUfycEcUpCAL4U8=; b=J1SOzcsBg5m39WplY3TgwMhg2O
 kB2abLISEKO5wobb3ccf1DBSmYjBFVbgScleTjll/NDhYYxNZyq5WW8iKcqW+xkFC0tpK+tRv6Ifk
 ogJvfeI6L0HTBvd+C4/mmVJ1ZsCEnAJax6K7TcGs10WIfYA07Wfqq3jO336Cq1qjvoRw=;
Received: from mail-ed1-f50.google.com ([209.85.208.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vhsLq-0000c1-78 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 16:43:38 +0000
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-64b9b0b4d5dso9321443a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Jan 2026 08:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768841012; x=1769445812; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t7xapJC59KqqTTsHRvPEloTsuOjJhUfycEcUpCAL4U8=;
 b=OrBQYMF/uDVY10cih2L4qzZOrlhh1yPLldXAV7zCwv3xv1+69qS5qkra/HOPI6UzPt
 reEV2SgZbivoinE6huW2564ehriNjwlH8bacg64/48WJT4tVW+VDu5qGWAc5/qAHnnKV
 4D43tDc+Yg4GH6WOroMjs8yA9XxNuHeVv8BV2IJxxNsDRp8sMftagS81Z4L77UaWkv11
 QDO7zlyPP8nYsXDyQUT7t23QNIO2KFpkAcivvXmqCnKkcNdZqwC3y2UGx4URVW41Y49U
 4Gk3Tcyp2wmyX6ak+LBNAyihXGSstlxeqKQf0LpM9Ip4EV0sRTkuwqSMfrlj3c/QDwZX
 VqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768841012; x=1769445812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t7xapJC59KqqTTsHRvPEloTsuOjJhUfycEcUpCAL4U8=;
 b=vur5LoG2zOEHTV2BbQM35rNDw3VBsVV+vWn44gIA3HRz+HYb5qSQ6WGAO3I1NTRDmR
 9rds7nZy9q4jsVN+DWeIqlAmK2rgLeGdcrIvzx8jT5fh/QqqeoAC9oot6jqu/xv0MOKi
 AA1/UTSJ8JNhhK8nX3TaoPLmjH28Ut1OFSZ8NvAVviNmvz6l5lmm+fHsce8BwuHyl/rX
 HFjkR+Eluijux0PSqeIcLMqMmYytqW90TRSJfaI9BuG2aiQIcWA4p7f/xTP7sRjEcOHA
 6UFpFoYcyiI/jV9ys1cyLP4XE7ZQ8B8nZMjoWiwBBtUXvzsI7MsX3uMX27hEbuew11J8
 l4pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUaOyHtqXJ9duFm09+umA/2z4CpEr8u7w6WnyTzHn16NBheghReBocfMjdImE9vABnBVF2tZaWjHUgSY7o2nTV@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzJe/VFNJxn94Kebje1yrKh3D70VlHIgawntkXRH5yb13FH7ojC
 6dC91dbJwqhE/oEW0bsDYnlJE0dFER9u+s9bu0X20+9GPb11AAeHSi7A6lsWNIdcx9P57sniQUU
 GzCgfLlF+ErCUGaF8cj53K2ZUEVn3XZc=
X-Gm-Gg: AZuq6aKeR+Agv+ViED/EkjJWSgZXDxJg6h7ZLXYHZSrks6JVAyKQhDoxxTAdeQm1UZB
 KkxPD6z5tTnKOAS1IMzxa3ZbVFf7c/ya0zfskc1K80slnYCNagvM4Xd4z+W240ErEyaFLWeMqPb
 kuHUXGsNhspvecz2PEdeCZGMLybQL//mGCBvdQuFPKuQlz3QUWRGD899rSxgmjVSooFuCtPedhf
 Q93CSDmHE3vFks+XtH4mkiCooY/v02Wg6NpSzYCyWOWjg30FBdG3nzMW6vSJZFEoZK927lP8Y3V
 2p+6QrDwHcUAJ4gTnVaARcGodv5YTm3EYPFZ+KVX
X-Received: by 2002:a05:6402:5106:b0:64c:584c:556c with SMTP id
 4fb4d7f45d1cf-654bb6192admr8530585a12.30.1768841011353; Mon, 19 Jan 2026
 08:43:31 -0800 (PST)
MIME-Version: 1.0
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
 <20260119-exportfs-nfsd-v2-27-d93368f903bd@kernel.org>
In-Reply-To: <20260119-exportfs-nfsd-v2-27-d93368f903bd@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 19 Jan 2026 17:43:19 +0100
X-Gm-Features: AZwV_QgQ6YFmczFqASwqjyOa509PoCTPsOB-sET1G173IBHOd4X5kFjH9N6z5MI
Message-ID: <CAOQ4uxjyTdf21G1Y=_5Eox58drVPA0gAMeSQZxh=T36_yzssNw@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 19, 2026 at 5:30 PM Jeff Layton wrote: > > Add
 the EXPORT_OP_STABLE_HANDLES flag to fuse export operations to indicate >
 that this filesystem can be exported via NFS. > > Signed-off-by: [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [amir73il(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.50 listed in wl.mailspike.net]
X-Headers-End: 1vhsLq-0000c1-78
Subject: Re: [f2fs-dev] [PATCH v2 27/31] fuse: add EXPORT_OP_STABLE_HANDLES
 flag to export operations
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
 Carlos Maiolino <cem@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-doc@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
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
 Jonathan Corbet <corbet@lwn.net>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>,
 David Laight <david.laight.linux@gmail.com>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBKYW4gMTksIDIwMjYgYXQgNTozMOKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQWRkIHRoZSBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMgZmxh
ZyB0byBmdXNlIGV4cG9ydCBvcGVyYXRpb25zIHRvIGluZGljYXRlCj4gdGhhdCB0aGlzIGZpbGVz
eXN0ZW0gY2FuIGJlIGV4cG9ydGVkIHZpYSBORlMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWZmIExh
eXRvbiA8amxheXRvbkBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogQW1pciBHb2xkc3RlaW4gPGFt
aXI3M2lsQGdtYWlsLmNvbT4KCj4gLS0tCj4gIGZzL2Z1c2UvaW5vZGUuYyB8IDEgKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9mcy9mdXNlL2lub2Rl
LmMgYi9mcy9mdXNlL2lub2RlLmMKPiBpbmRleCA4MTllNTBkNjY2MjI0YTYyMDFjZmM3ZjQ1MGUw
YmQzN2JmZTMyODEwLi5kZjkyNDE0ZTkwM2IyMDBmZWRiOWRjNzc3YjkxM2RhZTFlMmQwNzQxIDEw
MDY0NAo+IC0tLSBhL2ZzL2Z1c2UvaW5vZGUuYwo+ICsrKyBiL2ZzL2Z1c2UvaW5vZGUuYwo+IEBA
IC0xMjE1LDYgKzEyMTUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGV4cG9ydF9vcGVyYXRpb25z
IGZ1c2VfZXhwb3J0X29wZXJhdGlvbnMgPSB7Cj4gICAgICAgICAuZmhfdG9fcGFyZW50ICAgPSBm
dXNlX2ZoX3RvX3BhcmVudCwKPiAgICAgICAgIC5lbmNvZGVfZmggICAgICA9IGZ1c2VfZW5jb2Rl
X2ZoLAo+ICAgICAgICAgLmdldF9wYXJlbnQgICAgID0gZnVzZV9nZXRfcGFyZW50LAo+ICsgICAg
ICAgLmZsYWdzICAgICAgICAgID0gRVhQT1JUX09QX1NUQUJMRV9IQU5ETEVTLAo+ICB9Owo+Cj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VwZXJfb3BlcmF0aW9ucyBmdXNlX3N1cGVyX29wZXJhdGlv
bnMgPSB7Cj4KPiAtLQo+IDIuNTIuMAo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
