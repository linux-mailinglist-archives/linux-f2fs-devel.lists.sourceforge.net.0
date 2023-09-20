Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 399017A87A8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Sep 2023 16:54:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qiyaX-0005Ex-PL;
	Wed, 20 Sep 2023 14:54:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qiyaW-0005Eg-GS
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 14:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pv/mshlnOGkJ5ebR+d6AqRiPt7G4UklH+5Y/YwatjVw=; b=R9LyXUjpLfzrPUzWhcALLKcan9
 axorI4F9rmmJ8jNN0widFzWMWcfmwyY2oHHZZTI6olNVtry2diie0LhBddJLNvAf/5QUlhyHVguRb
 B5QkzEbT/xkQY+M6MZiVlBOk2bWVLDenS9pjFxrTKk+VYlXXUCY3yHPMvYCTxLaRLH/M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pv/mshlnOGkJ5ebR+d6AqRiPt7G4UklH+5Y/YwatjVw=; b=CrAQZL8AtBDqVnoUbWG0e69oq3
 wjCPd1lvalbNsxB3XWyG1SkNqXNeyI8bzHUHTsvQnEXeRgjUmzB7YLt7lXcuUcQ8ImR5WkaEJOZhq
 G294/dND+LUqOzHfVsgaru/vFFoqwQ/YieJ89eQswY3rt5xzOyKpi181Nt1DOIOxCtn4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qiyaR-0001kV-DK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 14:54:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7F51AB81DCF;
 Wed, 20 Sep 2023 14:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10CFC433C7;
 Wed, 20 Sep 2023 14:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695221624;
 bh=pv/mshlnOGkJ5ebR+d6AqRiPt7G4UklH+5Y/YwatjVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hUm3CDqBbqdWl1gTcXLfMGrJ4YfO3wokaDGaQDO3xOEWDbllQ4Mfpj/KueremMgA5
 pBL/JzWz4+0hsTX69O5jnf1yRuwKeufAxYGRi9hiZ4ho9usSCqwyLkEScujErQvTLd
 pH8R4MxKr1CGxSHyPru+0iqA3gh7pydF57H5YT0p+7Rd0zhQBTnYL0en9hUyWFooe+
 Mdfj3r0q5YN+5TWuL0JXteBwUKeABbsXdunQnhbthSc1EwQj0hbuY8ac5vX7VekjTf
 fGOHz5omQ2+B/RCVrXr9woAH7FyctwMygMiv3giawQBEFR5HdvJ9UunmoJQb2brq0N
 41leRmH4Vm1Jg==
Date: Wed, 20 Sep 2023 16:53:26 +0200
From: Christian Brauner <brauner@kernel.org>
To: Chuck Lever III <chuck.lever@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>
Message-ID: <20230920-keine-eile-c9755b5825db@brauner>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <20230920-leerung-krokodil-52ec6cb44707@brauner>
 <20230920101731.ym6pahcvkl57guto@quack3>
 <317d84b1b909b6c6519a2406fcb302ce22dafa41.camel@kernel.org>
 <20230920-raser-teehaus-029cafd5a6e4@brauner>
 <57C103E1-1AD2-4D86-926C-481BC6BDB191@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57C103E1-1AD2-4D86-926C-481BC6BDB191@oracle.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > You could put it behind an EXPERIMENTAL Kconfig option so
 that the > code stays in and can be used by the brave or foolish while it
 is > still being refined. Given that the discussion has now fully gone back
 to the drawing board and this is a regression the honest thing to do is to
 revert the five patches that introduce the infrastructure: 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qiyaR-0001kV-DK
Subject: Re: [f2fs-dev] [PATCH v7 12/13] ext4: switch to multigrain
 timestamps
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 "linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>,
 "codalist@coda.cs.cmu.edu" <codalist@coda.cs.cmu.edu>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 Amir Goldstein <l@gmail.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 "bug-gnulib@gnu.org" <bug-gnulib@gnu.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Benjamin Coddington <bcodding@redhat.com>,
 Tyler Hicks <code@tyhicks.com>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "coda@cs.cmu.edu" <coda@cs.cmu.edu>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Gao Xiang <xiang@kernel.org>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Xi Ruoyao <xry111@linuxfromscratch.org>,
 Shyam Prasad N <sprasad@microsoft.com>,
 "ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>,
 "ocfs2-devel@lists.linux.dev" <ocfs2-devel@lists.linux.dev>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "v9fs@lists.linux.dev" <v9fs@lists.linux.dev>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 "devel@lists.orangefs.org" <devel@lists.orangefs.org>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 Bo b Peterson <rpeterso@redhat.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Bruno Haible <bruno@clisp.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> You could put it behind an EXPERIMENTAL Kconfig option so that the
> code stays in and can be used by the brave or foolish while it is
> still being refined.

Given that the discussion has now fully gone back to the drawing board
and this is a regression the honest thing to do is to revert the five
patches that introduce the infrastructure:

ffb6cf19e063 ("fs: add infrastructure for multigrain timestamps")
d48c33972916 ("tmpfs: add support for multigrain timestamps")
e44df2664746 ("xfs: switch to multigrain timestamps")
0269b585868e ("ext4: switch to multigrain timestamps")
50e9ceef1d4f ("btrfs: convert to multigrain timestamps")

The conversion to helpers and cleanups are sane and should stay and can
be used for any solution that gets built on top of it.

I'd appreciate a look at the branch here:
git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.ctime.revert

survives xfstests.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
