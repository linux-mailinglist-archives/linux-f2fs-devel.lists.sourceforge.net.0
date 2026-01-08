Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E652BD06769
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 23:47:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfeGpwc1Ph3zJtmdaxFXeU6kwYmsdykJpysbkQ55wqE=; b=THIwBnTIv4t0SW0IG9tWvHli0L
	Goxzg07FVyDzGGKd5ZLvQUHbF6OZUUgzNQeRxe9hGcTwuBd26tEyLA+yTQlaxNVSxNPqlgOka09dd
	KoyM7fEWrMKtB9TM0U0Plc8R67A4XlMhyHszcPwJaf0NytseGWXM0oUbBbJBt4V5muN4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdyn4-0005bL-Le;
	Thu, 08 Jan 2026 22:47:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <linkinjeon@kernel.org>) id 1vdyn2-0005bD-9z
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 22:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o8ABr/DNoRVjWLpEG3gYzt78FrDlsrlJ7hUxCqSBKIw=; b=htRWY+rbPwP81rUOUDiCN1IUeq
 7X0RDLo40UtsbAkBe0/wH29SZRX425+EhInnH76J6Pkt/5h10O5iL4VdrPpK8PPr9Dku5EVhwdNpf
 xdsHv3+xnNtbyE39H82iLrsm6+NPiUPl+B+RwzaT/oVulA4DyrLSbCWGYm2bJzosSx8c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o8ABr/DNoRVjWLpEG3gYzt78FrDlsrlJ7hUxCqSBKIw=; b=XKPhWbMihsY9LUjYFPriBuO9lr
 K63BGOYdkjLeGj4U3+X4LaKeHRJzc7zeCa2DWCFj55P6dRD+edOydsIGKtG2X7dJMw1acStSFXwR6
 3lHdaf6bHedxfEJRsQK3Ln6dYs6esEjTDus2qOhYjqqrZ0MeQhDNbDyq+FuuLhaCkQcc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdyn1-00053M-Rx for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 22:47:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2873B6015F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  8 Jan 2026 22:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC90C19422
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  8 Jan 2026 22:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767912444;
 bh=bpLucB2OVlqnpdSgR5fVsT/9lEifzVxq4+Kg3z371KE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kNZ/y6ld9T/Ac6XqHUpuWQ8PCKoHqDZK4KRIN0fR0qhZUAZgmdbhls/DOYhiAGX7z
 lKJXMbj5kAIa3yPHcJzWdDqHLZWZUws36K4s8WUtTHBy0kZ1G+0Jbjoh7BgoGMTVB0
 EHN+7t2qxXK5Wg9JwteHTuHVEx86cGwPSYmACkxAaR6cPMp9ZisNCP6MINj41SffBs
 rGpQYrIDRH61Pi646aQVZ+ZmxyNbNF5rChS8TKq0svn+ns7GoUEV1FIGJpWNhiL7jz
 wNVHZ83G97Pf5PZFUJN8TAkCmyWsi/CmvHe4Mf70Y4ziokGk5SSSZrPhqGGZMeQCS4
 YWE8KQUzoe6Nw==
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b8010b8f078so592893466b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 08 Jan 2026 14:47:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVjLd9fuLZo1pl15Mtg8dFq05UEVcbly4NuKR0PyRDH5LPvDAYp034PAV9M1M27AXEOUNJ48Oh2heSfGI3U23fo@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy5hyFSwhVjGY8diCsPsck1booj2DYHC7/V1+q47xspKe0UGs8x
 uSWUrr+9xKIz0r3T4cbSAEaJI5GEj0mSREG1Fon2FVLpM61RKdv6INbi5ccr7cK0qd5drQZ9mfE
 DFkDeuYQDq8B7flpSEDCAR6X4Vo5rdX0=
X-Google-Smtp-Source: AGHT+IHRRvrZk+LJHsAd5/mP4TyTtkU5XrZgqXx3MfUuP0vWFtvlehE6tE5BFAh0/XFz8o1ILqvfmo203M6g5zkxlKk=
X-Received: by 2002:a17:907:c1e:b0:b72:c261:3ad2 with SMTP id
 a640c23a62f3a-b84451dab67mr854015966b.50.1767912442100; Thu, 08 Jan 2026
 14:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <20260108-setlease-6-20-v1-7-ea4dec9b67fa@kernel.org>
In-Reply-To: <20260108-setlease-6-20-v1-7-ea4dec9b67fa@kernel.org>
Date: Fri, 9 Jan 2026 07:47:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-JTE+233AwpvrXTsbfrbY+U_pvyUTQQSwz0mXh43jt=A@mail.gmail.com>
X-Gm-Features: AQt7F2q41Fu16p_9dWtEjvrFao8uwKCSAe9mKCbLxMeS3Ih2bsPKkzatUTosKic
Message-ID: <CAKYAXd-JTE+233AwpvrXTsbfrbY+U_pvyUTQQSwz0mXh43jt=A@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 9,
 2026 at 2:14 AM Jeff Layton <jlayton@kernel.org>
 wrote: > > Add the setlease file_operation to exfat_file_operations and >
 exfat_dir_operations, pointing to generic_setlease. A future p [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdyn1-00053M-Rx
Subject: Re: [f2fs-dev] [PATCH 07/24] exfat: add setlease file operation
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
From: Namjae Jeon via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Sandeep Dhavale <dhavale@google.com>,
 Martin Brandenburg <martin@omnibond.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Anders Larsen <al@alarsen.net>, Amir Goldstein <amir73il@gmail.com>,
 jfs-discussion@lists.sourceforge.net, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, samba-technical@lists.samba.org,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 devel@lists.orangefs.org, Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 linux-mm@kvack.org, Viacheslav Dubeyko <slava@dubeyko.com>,
 linux-btrfs@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 Carlos Maiolino <cem@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 linux-nilfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 ntfs3@lists.linux.dev, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-erofs@lists.ozlabs.org, v9fs@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
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

T24gRnJpLCBKYW4gOSwgMjAyNiBhdCAyOjE04oCvQU0gSmVmZiBMYXl0b24gPGpsYXl0b25Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBBZGQgdGhlIHNldGxlYXNlIGZpbGVfb3BlcmF0aW9uIHRvIGV4
ZmF0X2ZpbGVfb3BlcmF0aW9ucyBhbmQKPiBleGZhdF9kaXJfb3BlcmF0aW9ucywgcG9pbnRpbmcg
dG8gZ2VuZXJpY19zZXRsZWFzZS4gIEEgZnV0dXJlIHBhdGNoCj4gd2lsbCBjaGFuZ2UgdGhlIGRl
ZmF1bHQgYmVoYXZpb3IgdG8gcmVqZWN0IGxlYXNlIGF0dGVtcHRzIHdpdGggLUVJTlZBTAo+IHdo
ZW4gdGhlcmUgaXMgbm8gc2V0bGVhc2UgZmlsZSBvcGVyYXRpb24gZGVmaW5lZC4gQWRkIGdlbmVy
aWNfc2V0bGVhc2UKPiB0byByZXRhaW4gdGhlIGFiaWxpdHkgdG8gc2V0IGxlYXNlcyBvbiB0aGlz
IGZpbGVzeXN0ZW0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWZmIExheXRvbiA8amxheXRvbkBrZXJu
ZWwub3JnPgpBY2tlZC1ieTogTmFtamFlIEplb24gPGxpbmtpbmplb25Aa2VybmVsLm9yZz4KVGhh
bmtzIQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
