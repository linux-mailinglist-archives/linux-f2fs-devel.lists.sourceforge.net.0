Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A28D3A0C5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 08:57:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmuqVCZwEEXgjRFwwfuUMFOZqXpCVxqVKs+AGY9l7+A=; b=fkpEUzvsMnL+dQ6EkwG94YL5JE
	UjFT2uHh/ZrYN0yzxgba+mkRcTl0J/1W8AMJVqwMgRAD2AIIKppyIKEy/enhiP+RwQHZzPSx63vDa
	7f2k3ORnT/JIkjd5f2WkcLtF2JuFy/v/LewepoSIhLJSgAJvhIhSPcq6mAQ5GmGXlKU8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhk8G-0001pb-1d;
	Mon, 19 Jan 2026 07:57:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+f4f5ba1b7319529cbc9c+8184+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vhk8D-0001p3-QB; Mon, 19 Jan 2026 07:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dkq9dFVnQ02ADyLqi7RRrcu9zIfz19y2EpNLAEqzuhU=; b=OvOJ1UW2dFxsEgrfK+Sa13GV6p
 8Cmacw2Bx3ofZWQWChtv5lOrb6aEeOtfqrvE8ujVmwNO6j9w/XxTCwbD/OGpjkKH/6sDsQrQ3Oapg
 HldUpWGXeoBhpUjFzUhfAc21at6kcXP1a30tqk0CvRpUXsomTdo7tfIrv+fqQWVaSwSk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dkq9dFVnQ02ADyLqi7RRrcu9zIfz19y2EpNLAEqzuhU=; b=DMZt/+fC8RQrud84tyLgD6VK7S
 s09p4LYfSVseuwOeuMmcDeiD8DK3REz7NRIqdNeJp1ILnZ9fmC6HK5hRP3qTkw+3HMxjGR8Kmlda+
 wNFTqywITCFN9m3F4AaipjlVlfjsY5FfISHQDPpaCYQD5yAbkKJ3f1gJw0+L6ZkaliLE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhk8D-0002BD-3G; Mon, 19 Jan 2026 07:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Dkq9dFVnQ02ADyLqi7RRrcu9zIfz19y2EpNLAEqzuhU=; b=dSF1IFL+VEbufi9323VoWF6NEa
 USB2BXBiaW7TjezbApRts+YAG9RNRYfhPamD4lev/bOGd62WvFVIL6sSe70b84ri0HQwV2wQR3fie
 NHQfWzjRaVOmQbjja6GffvX4ybd0IoBxLkxlZm0WDdh5PD1BKJEEZN2XmKjJt0U9yUpYOoLXyNoKl
 otc3GgIv/kotdkVdSchAlA4Bqh/5N1QYuwvhjeDy3jpLtEfduOvglzvDFa82EF8VLL3CFeM6qtHx/
 hFOG9hVRMecn6BOFZagcxLAIBWCAy/KYZmHunHQQXYX+w/fhRGaYWCtIXaohApqoDtQ5t9IT0ZpBl
 498p8SdQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vhk7V-00000001Wju-0c1a;
 Mon, 19 Jan 2026 07:56:17 +0000
Date: Sun, 18 Jan 2026 23:56:17 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <aW3joQQvz2t6xkzh@infradead.org>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
 <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
 <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
 <aWlXfBImnC_jhTw4@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWlXfBImnC_jhTw4@dread.disaster.area>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 16, 2026 at 08:09:16AM +1100, Dave Chinner wrote:
 > > I think we can be a lot more precise about the guarantee: The file >
 > handle does not change for the life of the inode it represents. [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vhk8D-0002BD-3G
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
 Carlos Maiolino <cem@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 samba-technical@lists.samba.org, Chuck Lever <cel@kernel.org>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Gao Xiang <xiang@kernel.org>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 linux-mm@kvack.org, devel@lists.orangefs.org, ocfs2-devel@lists.linux.dev,
 Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, Richard Weinberger <richard@nod.at>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 16, 2026 at 08:09:16AM +1100, Dave Chinner wrote:
> > I think we can be a lot more precise about the guarantee: The file
> > handle does not change for the life of the inode it represents. It
> 
> <pedantic mode engaged>
> 
> File handles most definitely change over the life of a /physical/
> inode. Unlinking a file does not require ending the life of the
> physical object that provides the persistent data store for the
> file.

> i.e. a free inode is still an -allocated, indexed inode- in the
> filesystem, and until we physically remove it from the filesystem
> the inode life cycle has not ended.

For other file systems like ext4 that have statically allocated
inodes that is even more so the case.

> IOWs, the physical (persistent) inode lifetime can span the lifetime
> of -many- files. However, the filesystem guarantees that the handle
> generated for that inode is different for each file it represents
> over the whole inode life time.
> 
> Hence I think that file handle stability/persistence needs to be
> defined in terms of -file lifetimes-, not the lifetimes of the
> filesystem objects implement the file's persistent data store.

Agreed, although I bet that is what most folks think of for the
inode - not a physical place on disk, but an object that gets
invalidated on the last close after unlink.  Either way, that rules
do need to be written down clearly.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
