Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 944EED3C564
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 11:34:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jE2R3wLVbRrpnSYYMMW/+SK5FPp3cVjJRRaUA4avFgw=; b=hHkYJGaITsctkNGLWVSvbk4I+w
	KANxMoRrpIpz+XyNl6leUNBElHi7ooHYL6ysc3QPndHcCuEs69MDpoodgD6J+GHIh8WJ/q8WNEjw7
	6vANqduPv6/b7O1os81+Vhelvtn+FU0YwI0qvDWYiUMTXmOxeIEJnYCgewG/T/futQOQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vi94I-0003Sa-V7;
	Tue, 20 Jan 2026 10:34:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vi94H-0003SG-P9;
 Tue, 20 Jan 2026 10:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5Yl/Ge/38zmabHKosQXQVrEg+BmTHvglVpqWXSfbn0Q=; b=gGOwwvO7liYfTFxU/ZAZtPIZdc
 ghv5ypLH9tVVX4mcvlqX5bc2uHOTfpDkGuEIc4Qm9I/JPfQ6EpwvwFhZ2BYn8zKqxJEO4M1wffSov
 LCdcBQZvjDiFSjLQNXRdVLtWQpXBmY7b2/1MeECZBdq0cQf7b62LMpyzaD9h/z6GaSY0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5Yl/Ge/38zmabHKosQXQVrEg+BmTHvglVpqWXSfbn0Q=; b=Vz5BkvSOIWQNe0ZG/w5AJ4Qjoc
 jZcyoLtfHLRMvpTARPGzdt1a9i/fY6QBVfD5Wcr1UX1+bZJewGFF8Dtj4QVWfoHXztFT5g2ygwJic
 SQzOZvmBsqz5xkEWuespwb2o7IbMGRhy6zfkTZTmnC1pzPfQLd/spBjLUpmWrmSax7UM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vi94H-0003rY-BT; Tue, 20 Jan 2026 10:34:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6D4076011F;
 Tue, 20 Jan 2026 10:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04B6C16AAE;
 Tue, 20 Jan 2026 10:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768905271;
 bh=ofM75JqEotc0v7XRCKkNO2AMeaUn3xH4tlqNjm8W0YQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dkYiavwjArBw+8JM3Doyt4vFEjXCjTBOooZATw7ybtJyDWfHOsWo6vfR+lTcrWca0
 84g12kcedULlbCjwN3OhgKihsyS+8LP34glFKHjjboChPwnx87Mgd4ye5oYrptvwcU
 IR130p8sJwGfsM12J432DDMgzJBXrhBvvtKpy/9JDcG+rvOkHRKRbslb+hAqYozEy4
 8HXCy/UDUBGKe0SB1WSHTXCGpraNDHfp54t2En1JQCop3QwMKo4TzMN4znHIRfj92N
 0amrFzP0cYXKJTlNdj7dkkgVOhyK03N9xYYfKakG8ehUjpIPXdBq3+jcGxXnzZWvCP
 JUo4/sRFClXEw==
Date: Tue, 20 Jan 2026 11:34:13 +0100
To: NeilBrown <neil@brown.name>
Message-ID: <20260120-bindung-eselsfell-fadec0d95909@brauner>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>
 <176877859306.16766.15009835437490907207@noble.neil.brown.name>
 <aW3SAKIr_QsnEE5Q@infradead.org>
 <176880736225.16766.4203157325432990313@noble.neil.brown.name>
 <20260119-kanufahren-meerjungfrau-775048806544@brauner>
 <176885553525.16766.291581709413217562@noble.neil.brown.name>
 <aW8w2SRyFnmA2uqk@infradead.org>
 <176890126683.16766.5241619788613840985@noble.neil.brown.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <176890126683.16766.5241619788613840985@noble.neil.brown.name>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > It took me a while to sift through the
 code/patches/comments
 and come to > this understanding and I apologise if I wasn't as clear earlier.
 But > my intuition was always that file handle stability w [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vi94H-0003rY-BT
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
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
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, linux-mm@kvack.org,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
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

> It took me a while to sift through the code/patches/comments and come to
> this understanding and I apologise if I wasn't as clear earlier.  But
> my intuition was always that file handle stability was never the real
> issue, and maintainer choice was.  Hence my rejection of the

I very much agree with that assessment. Yet we so far have failed to
even agree that this is an acceptable position. Hence my irritation.

And apologies on my part if I'm curt. I'm simply annoyed by the very
lengthy and to me somewhat pointless debate here at times.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
