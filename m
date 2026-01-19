Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A20D3A1DE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 09:41:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3EJqSa/lRcPEeFY6QQoPvYJQfppJcXNybIwJq+brruM=; b=m+uWisM2eahRSgW/xfyl/PeZ5i
	NmnNpQKGXseYi1DgbwrltWPqVMx15GaO8dcfsQyNAcdb4dQjGQNPlYSAP/50UnA0hC8/FBLQkFoti
	q1KSRKPd2d94L01awHLi0PrmBZuVoC8iZvydrljPzDCNF0FqNP45CPoUw17XJHFZyEK0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhkot-0008OT-B8;
	Mon, 19 Jan 2026 08:41:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <konishi.ryusuke@gmail.com>) id 1vhkoA-00085O-3s
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 08:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KJoYOa5K18nqNKCWxkYAOdRPH4EyPY3p5tSvazTt+nc=; b=ShQLyEfeUED3ROTjBXgIdTrik1
 ED7JcjSW+Fk9zTBHJnZiM3ZHCSMlgy0rCn6DmIJLAIAKpEsPLxhepFzTN3xgiRXVPWMr28zY2k+7c
 28nEYJ5nR40Lmf5fvUDz5ZTVZ60jOK8ZYR04isXdlKNl5kzHKIvmwsx6IGqNpRpF/6Ro=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KJoYOa5K18nqNKCWxkYAOdRPH4EyPY3p5tSvazTt+nc=; b=AS26VoRUxFRQa5Bq3daq4MT4j/
 q6rbFFS77sUeirxDTwynDNFr/dwqezgKNQFP+Uv8NsZR8Z239kGri7VGwwrjhAHx1eQUIomXUrtlS
 AvBlgMmHuaMXx9UaUXE0daXwn4fCxC0cP++TkVz+YqUtl4bowS3/jcdkCvaBb/asKX1A=;
Received: from mail-lj1-f181.google.com ([209.85.208.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vhko9-0005h0-L9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 08:40:22 +0000
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-383122fbc9bso31224741fa.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Jan 2026 00:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768812015; x=1769416815; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KJoYOa5K18nqNKCWxkYAOdRPH4EyPY3p5tSvazTt+nc=;
 b=WWDdzBjD7mCQ+dy+1ZqrHOivriTDUmmSCNPy9WMuqXEhIT7bQHM139m++8Nv3rY0zv
 88YOanIoJlNZQkHi3Cq7UVMLi/4X7ewY7+yQ8xYVYAoMEtacmj3tkPio9xAQ1W2VI2Rm
 N5xl/0+U3Ay9GtYh25HAVE7Sr2vbPblSByKarViWXWtL8dfR5cH9p2q6NVWjO9ka2HDy
 IjV0rcAcfkZMuQReaiXwkBp2fj1fmfNjNK1Xpw63WUH+7a7N7jRn1I9zA3OnIQNWEWZ9
 iYIVoZBdqxK6ryw2LDofrbY5u5E2QWM6I2dhwtOZVqwEwJx0OPc7Vjy4/71axx1kQ0Z/
 2D1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768812015; x=1769416815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KJoYOa5K18nqNKCWxkYAOdRPH4EyPY3p5tSvazTt+nc=;
 b=a5+saxM0WKR1qp1KbX/t8lUoQ/B385EuutGaOlcMrMnPN/5T/vxiVL5pH3C4k4jOme
 OtAReVXKk0hWEbeQ0qPCIBzpcA5OlvMqiKAGfy1PMxdMgsUfWlQVX+vlswFTdACxrWiA
 GbikPtLm3U2DWAq/ZVql8qiZfQ2thwla2uMRDsZ49pGEbCqAGK7fQb7flaxrtnv7oXll
 7bmLBTE1+QK8CH6deD+MCRqz2NvnQ/Vaq8uvwbewe2S3KeDw1f10zZxUXJb7rusy57c2
 Hb88CyMbI1r0PT0oai+yUxKLS9miB+VLPhqC+qwzpY8R0hIDmdtsCGEYub9qcx0Nk61T
 Rn7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWye9K8wEpv5vdPPiV6eC1wfC7CN67SrSHt/tgZewNfV6QK6g+9wT4+o585mPcQxAKAlpIvBNZCb3tOB1vCZ3MP@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyre4BNT8qcObtKcimxi793Q1m0ZYLc9NwSNSocP0YkEZXdoX9T
 wTk+JA9FOamZk7PHrVSYVSNORZRQ8BWy8qYUgx77LEu0BVGsr5TIHjv3NQVfRJwwIAkyW+KYv+p
 z5X14M7C0RzTrPnl6+gspzf2/77bVJZg=
X-Gm-Gg: AY/fxX6RKnMs5QlUO0ZrWJ2kOxm/dDkThkBPlejKLKA8gXASK7NTWm4MNwz6DnmxTbd
 1iyymLBVbTS25yQJ2zR6f1asI2veTHJkH6sD4VYq1l0cSzLn8JyVL2gFzuSJHVVCSX5odq0U8ix
 gAbKOm8nQsvoRwO9g/sXIAZhdmHuJu5lrUeiT8rvTdOfxgk/Ij+/iTmp3WTH3IRutNNG8nYS5gU
 aqGP2qnRlRdf/1u23vtIfZl7T1liS95gwyU4MT6peoVphwcNYD0pCI36Vf61tti0IpOT7dZ
X-Received: by 2002:a05:651c:31d3:b0:37b:9ab6:a071 with SMTP id
 38308e7fff4ca-383842a1f56mr38777111fa.28.1768812014411; Mon, 19 Jan 2026
 00:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <20260115-exportfs-nfsd-v1-20-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-20-8e80160e3c0c@kernel.org>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Mon, 19 Jan 2026 17:39:57 +0900
X-Gm-Features: AZwV_QgvoiJk-4c_7XszNQLNhAbjR94vrEkk8toY4eDKXl6u9TqMllUY3n06aqo
Message-ID: <CAKFNMomS-8MMAjy8yuFwzuLBuQQA8r7gPJeJh1ci6RvVc9u4EA@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 16, 2026 at 2:50 AM Jeff Layton wrote: > > Add
 the EXPORT_OP_STABLE_HANDLES flag to nilfs2 export operations to indicate
 > that this filesystem can be exported via NFS. > > Signed-off-by: [...] 
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
 [konishi.ryusuke(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.181 listed in wl.mailspike.net]
X-Headers-End: 1vhko9-0005h0-L9
Subject: Re: [f2fs-dev] [PATCH 20/29] nilfs2: add EXPORT_OP_STABLE_HANDLES
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

T24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMjo1MOKAr0FNIEplZmYgTGF5dG9uIHdyb3RlOgo+Cj4g
QWRkIHRoZSBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMgZmxhZyB0byBuaWxmczIgZXhwb3J0IG9w
ZXJhdGlvbnMgdG8gaW5kaWNhdGUKPiB0aGF0IHRoaXMgZmlsZXN5c3RlbSBjYW4gYmUgZXhwb3J0
ZWQgdmlhIE5GUy4KPgo+IFNpZ25lZC1vZmYtYnk6IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5l
bC5vcmc+CgpBY2tlZC1ieTogUnl1c3VrZSBLb25pc2hpIDxrb25pc2hpLnJ5dXN1a2VAZ21haWwu
Y29tPgoKVGhhbmtzLApSeXVzdWtlIEtvbmlzaGkKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
