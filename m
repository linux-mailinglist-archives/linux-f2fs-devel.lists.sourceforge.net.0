Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB279F12C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Aug 2019 19:07:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2evq-0005vO-L8; Tue, 27 Aug 2019 17:06:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dsterba@suse.cz>)
 id 1i2evn-0005v0-GU; Tue, 27 Aug 2019 17:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CwBwJQptCuHABBiHqWjHEuVRxpHn6ZdzRWug18r3P1A=; b=VCFpj9Sbe9j6XlPljjQqyhwWWc
 Lfyo4G7aLlzOr34Y+rxxEMBuGUInj8E4DjeNwwZUrzu41Yc6kW+sGDZOX/LOXRR4Y0wORV87TJbpH
 eLLLf1M70SN04402e6TYd3SLDOGXg1Jdtxv7m0QZxcbEfq1isEocuSIYbQeBT47gOL0w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CwBwJQptCuHABBiHqWjHEuVRxpHn6ZdzRWug18r3P1A=; b=DDRfx/qGYEOUMjJHyFt+wLNWtC
 ZO8D40bqTFJodW2bjZMPqTJuXlbYtQIv4Osnv68ouSB5uAETb1tPEXnEXr7QAKZ7MoK1iw9aXYgCA
 kGueHiPY0R9lCWz77i11JUis6Tj/7BcVCebN+r+OxnFSSWQ78eZid5qnbJ4OLXbqntjc=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2evl-000Mj3-JP; Tue, 27 Aug 2019 17:06:55 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6C032B03C;
 Tue, 27 Aug 2019 17:06:41 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id D57F2DA809; Tue, 27 Aug 2019 19:07:00 +0200 (CEST)
Date: Tue, 27 Aug 2019 19:07:00 +0200
From: David Sterba <dsterba@suse.cz>
To: Mark Salyzyn <salyzyn@android.com>
Message-ID: <20190827170700.GW2752@suse.cz>
Mail-Followup-To: dsterba@suse.cz, Mark Salyzyn <salyzyn@android.com>,
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 Tyler Hicks <tyhicks@canonical.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 "David S. Miller" <davem@davemloft.net>,
 Mathieu Malaterre <malat@debian.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 devel@driverdev.osuosl.org, Vyacheslav Dubeyko <slava@dubeyko.com>,
 Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mark@fasheh.com>,
 Chris Mason <clm@fb.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Eric Van Hensbergen <ericvh@gmail.com>,
 Ilya Dryomov <idryomov@gmail.com>,
 Bharath Vedartham <linux.bhar@gmail.com>,
 Eric Biggers <ebiggers@google.com>, Hugh Dickins <hughd@google.com>,
 Jann Horn <jannh@google.com>, Serge Hallyn <serge@hallyn.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Gao Xiang <gaoxiang25@huawei.com>, Chao Yu <yuchao0@huawei.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>, Tejun Heo <tj@kernel.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mimi Zohar <zohar@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 devel@lists.orangefs.org, linux-erofs@lists.ozlabs.org,
 samba-technical@lists.samba.org,
 jfs-discussion@lists.sourceforge.net,
 linux-f2fs-devel@lists.sourceforge.net,
 v9fs-developer@lists.sourceforge.net,
 Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>,
 James Morris <jmorris@namei.org>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Richard Weinberger <richard@nod.at>,
 Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>,
 Allison Henderson <allison.henderson@oracle.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 ocfs2-devel@oss.oracle.com, Eric Paris <eparis@parisplace.org>,
 Paul Moore <paul@paul-moore.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Benjamin Coddington <bcodding@redhat.com>,
 "J. Bruce Fields" <bfields@redhat.com>,
 Brian Foster <bfoster@redhat.com>, cluster-devel@redhat.com,
 Dave Chinner <dchinner@redhat.com>,
 David Howells <dhowells@redhat.com>,
 Bob Peterson <rpeterso@redhat.com>, Sage Weil <sage@redhat.com>,
 Steve French <sfrench@samba.org>,
 Eric Sandeen <sandeen@sandeen.net>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.com>,
 Jan Kara <jack@suse.cz>, Miklos Szeredi <miklos@szeredi.hu>,
 Josef Bacik <josef@toxicpanda.com>,
 Stephen Smalley <sds@tycho.nsa.gov>, ceph-devel@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org,
 netdev@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 selinux@vger.kernel.org, stable@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
References: <20190827150544.151031-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827150544.151031-1-salyzyn@android.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1i2evl-000Mj3-JP
Subject: Re: [f2fs-dev] [PATCH v8] Add flags option to get xattr method
 paired to __vfs_getxattr
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
Reply-To: dsterba@suse.cz
Cc: Latchesar Ionkov <lucho@ionkov.net>, Eric Sandeen <sandeen@sandeen.net>,
 Mike Marshall <hubcap@omnibond.com>, James Morris <jmorris@namei.org>,
 devel@lists.orangefs.org, Eric Van Hensbergen <ericvh@gmail.com>,
 Joel Becker <jlbec@evilplan.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jan Kara <jack@suse.com>, Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Hugh Dickins <hughd@google.com>,
 kernel-team@android.com, selinux@vger.kernel.org,
 Brian Foster <bfoster@redhat.com>, reiserfs-devel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-f2fs-devel@lists.sourceforge.net,
 Benjamin Coddington <bcodding@redhat.com>, linux-integrity@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Vyacheslav Dubeyko <slava@dubeyko.com>,
 Allison Henderson <allison.henderson@oracle.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
 Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 samba-technical@lists.samba.org, linux-xfs@vger.kernel.org,
 Bob Peterson <rpeterso@redhat.com>, Tejun Heo <tj@kernel.org>,
 linux-erofs@lists.ozlabs.org, Anna Schumaker <anna.schumaker@netapp.com>,
 ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Eric Biggers <ebiggers@google.com>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, devel@driverdev.osuosl.org,
 "J. Bruce Fields" <bfields@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 cluster-devel@redhat.com, Steve French <sfrench@samba.org>,
 v9fs-developer@lists.sourceforge.net, Bharath Vedartham <linux.bhar@gmail.com>,
 Jann Horn <jannh@google.com>, ecryptfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Dave Chinner <dchinner@redhat.com>,
 David Sterba <dsterba@suse.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 netdev@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 stable@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 linux-security-module@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Woodhouse <dwmw2@infradead.org>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Aug 27, 2019 at 08:05:15AM -0700, Mark Salyzyn wrote:
> Replace arguments for get and set xattr methods, and __vfs_getxattr
> and __vfs_setaxtr functions with a reference to the following now
> common argument structure:
> 
> struct xattr_gs_args {
> 	struct dentry *dentry;
> 	struct inode *inode;
> 	const char *name;
> 	union {
> 		void *buffer;
> 		const void *value;
> 	};
> 	size_t size;
> 	int flags;
> };
> 
> Which in effect adds a flags option to the get method and
> __vfs_getxattr function.
> 
> Add a flag option to get xattr method that has bit flag of
> XATTR_NOSECURITY passed to it.  XATTR_NOSECURITY is generally then
> set in the __vfs_getxattr path when called by security
> infrastructure.
> 
> This handles the case of a union filesystem driver that is being
> requested by the security layer to report back the xattr data.
> 
> For the use case where access is to be blocked by the security layer.
> 
> The path then could be security(dentry) ->
> __vfs_getxattr({dentry...XATTR_NOSECURITY}) ->
> handler->get({dentry...XATTR_NOSECURITY}) ->
> __vfs_getxattr({lower_dentry...XATTR_NOSECURITY}) ->
> lower_handler->get({lower_dentry...XATTR_NOSECURITY})
> which would report back through the chain data and success as
> expected, the logging security layer at the top would have the
> data to determine the access permissions and report back the target
> context that was blocked.
> 
> Without the get handler flag, the path on a union filesystem would be
> the errant security(dentry) -> __vfs_getxattr(dentry) ->
> handler->get(dentry) -> vfs_getxattr(lower_dentry) -> nested ->
> security(lower_dentry, log off) -> lower_handler->get(lower_dentry)
> which would report back through the chain no data, and -EACCES.
> 
> For selinux for both cases, this would translate to a correctly
> determined blocked access. In the first case with this change a correct avc
> log would be reported, in the second legacy case an incorrect avc log
> would be reported against an uninitialized u:object_r:unlabeled:s0
> context making the logs cosmetically useless for audit2allow.
> 
> This patch series is inert and is the wide-spread addition of the
> flags option for xattr functions, and a replacement of __vfs_getxattr
> with __vfs_getxattr({...XATTR_NOSECURITY}).
> 
> Signed-off-by: Mark Salyzyn <salyzyn@android.com>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Cc: Stephen Smalley <sds@tycho.nsa.gov>
> Cc: linux-kernel@vger.kernel.org
> Cc: kernel-team@android.com
> Cc: linux-security-module@vger.kernel.org
> Cc: stable@vger.kernel.org # 4.4, 4.9, 4.14 & 4.19
> ---
> v8:
> - Documentation reported 'struct xattr_gs_flags' rather than
>   'struct xattr_gs_flags *args' as argument to get and set methods.

For btrfs

>  fs/btrfs/xattr.c                  |  36 +++++-----

Acked-by: David Sterba <dsterba@suse.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
