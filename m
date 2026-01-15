Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86814D27D1A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 19:54:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XN2WhLsRgpooPtUmNwUrlpORYzMNoaVrfokqm3N6so=; b=Caeq3hP2wj0A4JlkbyJUYwli7H
	y3gtbesRfYjHMOpF5KKfeVboMXeL2KkJxx8avxPqKdoKElwSn53lLfQc4sq3IH6Y6mdEdO8d0fro3
	dd7I1nETW7P7RBezy1/X/enJmy1ELv+xqpkYMYLLuLSNKHNargM4I37TP6upoeVaXZcw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgSUR-0007Sf-Kn;
	Thu, 15 Jan 2026 18:54:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1vgSUM-0007SD-QX
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 18:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R/pIR9g5xBWqOZmQj/jDCO8xKQONNisoQQHHakrcMdk=; b=H2Kdp9x/sT5QZUH8COf84XytX7
 83isP/3tSknNrwza45Ce6sEVJXj+B1L0bkssHynLpHGaxhNIFpt2ulczBAm/Phfc/gFoak4t3h9qQ
 i7SOs49VF86mw8jOGQGZ61Kp5vwU/hSHIiJKYYOsTTyOlxcCCR/P8CbJN1av/i6LUBcI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R/pIR9g5xBWqOZmQj/jDCO8xKQONNisoQQHHakrcMdk=; b=dJrCZB701Q9y8CLzYyZkL3edTH
 pAVoDm0lMc+cGRMYfrcwSXKLnO/yGUWfhsbsjx3f1XVTJErKgta/hTwSk+XBrBqO1ifDe6dr8kQfx
 xEP8v3gbV8FyuAmfg/6el/J8ZBVS42AtYbzI/fJVBljHjPdJmDPrWqGs3b/h0coxbTVQ=;
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgSUN-0002dP-8k for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 18:54:35 +0000
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-432da746749so614623f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Jan 2026 10:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768503269; x=1769108069; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/pIR9g5xBWqOZmQj/jDCO8xKQONNisoQQHHakrcMdk=;
 b=nG8vxtHktlGGdXi1untFjAZZOZpVDgz3iD20SXuFvQ5Ap2Sng5szOW+VriMPtm/5tY
 dwNRKgDfpVntYtUskhyqi9lWgx+egvgRdHNOnzDLAKL38x3ANUnO9slDDvA936i0QIH5
 PEUPJeeCXPlWFewvMj1Yk40MWHlsW8+jX3J99gzelCXMoHla7QYRQjw8h3/0/gyN79dZ
 icdpVyLLpH5KlKfKzmWrxrDtfHXJGpWdpH1BWsTY//ET5g7/gYtxdJF1FcG+ELmUt86q
 bmMcCRPaE0W0yRXJibGA5L5Esy5UPBr2ICb/OaSp7osFcU3tdGae2dxtC3ziF4Id51as
 A6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768503269; x=1769108069;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R/pIR9g5xBWqOZmQj/jDCO8xKQONNisoQQHHakrcMdk=;
 b=MhZN8rqZ8+xgD2ZEN4uZWw2YtgtzRZlHW3gNdjQh++crA34sn+X0e1tB0rc12V7Fp7
 soZL/UWFyBUrrtjBoPFrnKH3AIOpWHc3BQyezeJ3ba3QKyEGHLQ7fq3iyBk46kfvNB+V
 54Mp5pRD+WlyqWHUUYnkWqQ8fpiihy6adbzgcJjWwrtgVU3jEyd95cR/Xss5vLLFKkmF
 dWvrfSVOZqZaoaI4up248aZn9T6jDPAlB80bBkHGdYJB6l2QPEqVm7Lx34yxXzImZHaJ
 oQLaHyXEERfS+b115ipl0NjEDTUzHzl6aVBfgEwGnhAPG2BNQgZlJiWCiAxfsXmba60/
 O71A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUgGVYENeCIAQ47jk2sdVdrAacnP5tEdRiIURBZ4IEevsdOVcUJEM6ODQluGaCYfdeinpf+SN6PCleATlFrWi1@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw+0S07diidQNcxmrSoQ0wqIgZ+w/J3KiSVC4Hlm9d6nWhsqOVR
 Wvd+cKyxATDcn0DY7XJ4AgbCWPnxlf6RAR1ApMp6VAbDlo2gmLjtuV9N4oCnTeltk2c/EXgJKrJ
 nbnERtVLjSm5Tliu9vEvlXf3LHEy6Hsw=
X-Gm-Gg: AY/fxX5kK/5SWIFOIJVl8dN5Gyp++QvGehv8YzU9+U6+gpm1T9rw0Cx6KDEqiwRDi3P
 zrfhtIQKGkd2GJMUvP+/NJD8+84TZsBtW29s7IShJMMvxpvNN265zbNm2qaE/4IbLIzrzoQiWla
 P6Dj/sB7+yYceFuu9j537vouKa1U23xBH3PGJ9oVFrty/l16cJxD3ziQq/HliMpkRiD1ucGZ/fm
 fO3WSNLb/4xsVQHfVM986LNV1g/VyHLhrrgrJY4MRSya/VP4/Hlcp1bvNCFtPM1dvs31hEOQrqk
 SQCJRQf9ifm50q5TkeRJuZIXR8Niuw==
X-Received: by 2002:a05:6000:2313:b0:432:5c43:76 with SMTP id
 ffacd0b85a97d-43569bc17ebmr434376f8f.39.1768503268480; Thu, 15 Jan 2026
 10:54:28 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <20260115-exportfs-nfsd-v1-26-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-26-8e80160e3c0c@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 19:54:17 +0100
X-Gm-Features: AZwV_QgNgqINU2MW0ct-_EKOImgQ1uAwJfq7nKBHPoIgHpyzlMCSNbXGV-6zTEg
Message-ID: <CAOQ4uxh4VaVL9PD7-_Op9Xs-z5Qrx8g6x2x5FccujQX-Cw9RqQ@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 15, 2026 at 6:50 PM Jeff Layton wrote: > > Add
 the EXPORT_OP_STABLE_HANDLES flag to fuse export operations to indicate >
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
 [209.85.221.54 listed in wl.mailspike.net]
X-Headers-End: 1vgSUN-0002dP-8k
Subject: Re: [f2fs-dev] [PATCH 26/29] fuse: add EXPORT_OP_STABLE_HANDLES
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo1MOKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQWRkIHRoZSBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMgZmxh
ZyB0byBmdXNlIGV4cG9ydCBvcGVyYXRpb25zIHRvIGluZGljYXRlCj4gdGhhdCB0aGlzIGZpbGVz
eXN0ZW0gY2FuIGJlIGV4cG9ydGVkIHZpYSBORlMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWZmIExh
eXRvbiA8amxheXRvbkBrZXJuZWwub3JnPgo+IC0tLQo+ICBmcy9mdXNlL2lub2RlLmMgfCAyICsr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9mcy9m
dXNlL2lub2RlLmMgYi9mcy9mdXNlL2lub2RlLmMKPiBpbmRleCA4MTllNTBkNjY2MjI0YTYyMDFj
ZmM3ZjQ1MGUwYmQzN2JmZTMyODEwLi4xNjUyYTk4ZGI2MzlmZDc1ZTgyMDFiNjgxYTI5YzY4YjRl
YWIwOTNjIDEwMDY0NAo+IC0tLSBhL2ZzL2Z1c2UvaW5vZGUuYwo+ICsrKyBiL2ZzL2Z1c2UvaW5v
ZGUuYwo+IEBAIC0xMjA4LDYgKzEyMDgsNyBAQCBzdGF0aWMgc3RydWN0IGRlbnRyeSAqZnVzZV9n
ZXRfcGFyZW50KHN0cnVjdCBkZW50cnkgKmNoaWxkKQo+ICAvKiBvbmx5IGZvciBmaWQgZW5jb2Rp
bmc7IG5vIHN1cHBvcnQgZm9yIGZpbGUgaGFuZGxlICovCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZXhwb3J0X29wZXJhdGlvbnMgZnVzZV9leHBvcnRfZmlkX29wZXJhdGlvbnMgPSB7Cj4gICAgICAg
ICAuZW5jb2RlX2ZoICAgICAgPSBmdXNlX2VuY29kZV9maCwKPiArICAgICAgIC5mbGFncyAgICAg
ICAgICA9IEVYUE9SVF9PUF9TVEFCTEVfSEFORExFUywKPiAgfTsKClRoZXNlIGFyZSB1c2VkIHdo
ZW4gdGhlIHNlcnZlciBkZWNsYXJlcyBGVVNFX05PX0VYUE9SVF9TVVBQT1JUCnNvIGRvIG5vdCBv
cHQgaW4gZm9yIE5GUyBleHBvcnQuCgpUaGUgc2FkIHRoaW5nIHcuci50IEZVU0UgaXMgdGhhdCBp
biBtb3N0IGxpa2VsaWhvb2Qgc2VydmVyIGRvZXMgbm90IHByb3ZpZGUKcGVyc2lzdGVudCBoYW5k
bGVzIGFsc28gd2hlbiBpdCBkb2VzIG5vdCBkZWNsYXJlIEZVU0VfTk9fRVhQT1JUX1NVUFBPUlQK
YnV0IHdlIGFyZSBzdHVjayB3aXRoIHRoYXQuCgpUaGFua3MsCkFtaXIuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
