Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AB47B235E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Sep 2023 19:09:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qluWD-0008Tl-S2;
	Thu, 28 Sep 2023 17:09:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qluW9-0008TN-Us;
 Thu, 28 Sep 2023 17:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WeJmzV4JvFZz14Bi7n5eT9UeLT4u7m3FR+NHBqKUVRI=; b=B797vJQ5o+/N5FYcgQ6OOGRqpt
 e/FP/gzSALXcmJfafnQrG6hO8qSxUGaCbjf1O98PyXxnNPlZMxY47vKJt2cK4BxjQD0SpYfefy1Kt
 P0mBHkqM4mid3gRxi8j7L3OrA76Ci/j0b0IRPOtHC3/rMETlI34+1T2lZPy8riad5qbI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WeJmzV4JvFZz14Bi7n5eT9UeLT4u7m3FR+NHBqKUVRI=; b=llNEY3cMCZMMYTNiVgiCUibBwK
 ryhDmM7bnKD54fH/auuqz6vi5ThBwJQ83kabUa1xHaYwX+Hbp6iy5s4R3mxZFKf3LhWUELG5UyFzQ
 sE3oKn2HWy6ZjA7wH/uar/0IuOUYDpbW6XCmg8oA5AbI+xiVlceAEVe/WRrg0im/adKM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qluW6-0001Yp-ND; Thu, 28 Sep 2023 17:09:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BE5D1CE223E;
 Thu, 28 Sep 2023 17:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E060C433C8;
 Thu, 28 Sep 2023 17:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695920964;
 bh=zRV/ipMOOeHJFSr00KRb3DbkWuWIfMUsmholMiYqIFk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=RTCWP38X/3Qiq9e2eoLruFi6qLhhyLJQrL65PrzDXWj1P7d+rG2Zhi5BPUongplET
 wsh5RnIrkn2G9TM6HAAN0NYZV5F3YR+mvgQFtP+9DfawGUb0VUEGN4ZEWFes0Iqc9f
 GfOE5yeYJ7UoCrij4lXLrG+jRW8wnHjCzfKNNQxN4dSF4K07yMiaZJqV+VHP19Z5O0
 9Eizi+4+cRTlhImq1fbs7Tb7Mmc79AROTIyl6OUF1ztlUjMfm5tqzXneCy0nyt31m3
 teqvuavXAiJG2oyvZuxOiGcbkwGZED723LL7ZyPIvGZsh/B5aAGwbzTt8Xw0FUHUy0
 P2xkFw6PYWKrw==
Message-ID: <555fd53b72742fe8a8d2b67c80502f749631d773.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, David
 Sterba <dsterba@suse.cz>, Amir Goldstein <amir73il@gmail.com>, Theodore
 Ts'o <tytso@mit.edu>,  Eric Biederman <ebiederm@xmission.com>, Kees Cook
 <keescook@chromium.org>, Jeremy Kerr <jk@ozlabs.org>, Arnd Bergmann
 <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>,  Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,  Alexander
 Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Arve
 =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Todd Kjos
 <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes
 <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, Suren
 Baghdasaryan <surenb@google.com>, Mattia Dongili <malattia@linux.it>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason
 Gunthorpe <jgg@ziepe.ca>,  Leon Romanovsky <leon@kernel.org>, Brad Warrum
 <bwarrum@linux.ibm.com>, Ritu Agarwal <rituagar@linux.ibm.com>, Hans de
 Goede <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Mark Gross <markgross@kernel.org>, Jiri
 Slaby <jirislaby@kernel.org>, Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet
 <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Sterba <dsterba@suse.com>, David Howells <dhowells@redhat.com>, Marc
 Dionne <marc.dionne@auristor.com>,  Ian Kent <raven@themaw.net>, Luis de
 Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,  Chris Mason
 <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, Xiubo Li
 <xiubli@redhat.com>,  Ilya Dryomov <idryomov@gmail.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Joel Becker <jlbec@evilplan.org>,
 Christoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Gao
 Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,  Yue Hu
 <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, Namjae Jeon
 <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara
 <jack@suse.com>, Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim
 <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Christoph Hellwig <hch@infradead.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Bob Peterson <rpeterso@redhat.com>, Andreas Gruenbacher
 <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Mikulas Patocka
 <mikulas@artax.karlin.mff.cuni.cz>,  Mike Kravetz
 <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>, Jan Kara
 <jack@suse.cz>,  David Woodhouse <dwmw2@infradead.org>, Dave Kleikamp
 <shaggy@kernel.org>, Tejun Heo <tj@kernel.org>, Trond Myklebust
 <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, Chuck
 Lever <chuck.lever@oracle.com>, Neil Brown <neilb@suse.de>, Olga
 Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey
 <tom@talpey.com>,  Ryusuke Konishi <konishi.ryusuke@gmail.com>, Anton
 Altaparmakov <anton@tuxera.com>, Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, Bob Copeland <me@bobcopeland.com>,
 Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg
 <martin@omnibond.com>, Luis Chamberlain <mcgrof@kernel.org>, Iurii Zaikin
 <yzaikin@google.com>, Tony Luck <tony.luck@intel.com>,  "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, Anders Larsen <al@alarsen.net>, Steve
 French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>, Ronnie
 Sahlberg <lsahlber@redhat.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Phillip Lougher
 <phillip@squashfs.org.uk>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Evgeniy Dushistov <dushistov@mail.ru>,
 Chandan Babu R <chandan.babu@oracle.com>, "Darrick J. Wong"
 <djwong@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota
 <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,  Hugh Dickins
 <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, John Johansen
 <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James
 Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Stephen
 Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>
Date: Thu, 28 Sep 2023 13:09:08 -0400
In-Reply-To: <20230928110554.34758-2-jlayton@kernel.org>
References: <20230928110554.34758-1-jlayton@kernel.org>
 <20230928110554.34758-2-jlayton@kernel.org>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 2023-09-28 at 07:05 -0400, Jeff Layton wrote: > This
 shaves 8 bytes off struct inode, according to pahole. > > Signed-off-by:
 Jeff Layton <jlayton@kernel.org> > --- > include/linux/fs.h | 32 + [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qluW6-0001Yp-ND
Subject: Re: [f2fs-dev] [PATCH 86/87] fs: switch timespec64 fields in inode
 to discrete integers
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
Cc: jfs-discussion@lists.sourceforge.net, linux-efi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-unionfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-serial@vger.kernel.org, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, linux-trace-kernel@vger.kernel.org,
 linux-cifs@vger.kernel.org, selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 autofs@vger.kernel.org, linux-um@lists.infradead.org,
 reiserfs-devel@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 v9fs@lists.linux.dev, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 2023-09-28 at 07:05 -0400, Jeff Layton wrote:
> This shaves 8 bytes off struct inode, according to pahole.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  include/linux/fs.h | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 831657011036..de902ff2938b 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -671,9 +671,12 @@ struct inode {
>  	};
>  	dev_t			i_rdev;
>  	loff_t			i_size;
> -	struct timespec64	__i_atime; /* use inode_*_atime accessors */
> -	struct timespec64	__i_mtime; /* use inode_*_mtime accessors */
> -	struct timespec64	__i_ctime; /* use inode_*_ctime accessors */
> +	time64_t		i_atime_sec;
> +	time64_t		i_mtime_sec;
> +	time64_t		i_ctime_sec;
> +	u32			i_atime_nsec;
> +	u32			i_mtime_nsec;
> +	u32			i_ctime_nsec;
>  	spinlock_t		i_lock;	/* i_blocks, i_bytes, maybe i_size */
>  	unsigned short          i_bytes;
>  	u8			i_blkbits;
> @@ -1519,7 +1522,9 @@ struct timespec64 inode_set_ctime_current(struct inode *inode);
>   */
>  static inline struct timespec64 inode_get_ctime(const struct inode *inode)
>  {
> -	return inode->__i_ctime;
> +	struct timespec64 ts = { .tv_sec  = inode->i_ctime_sec,
> +				 .tv_nsec = inode->i_ctime_nsec };
> +	return ts;
>  }
> 
>
>  
>  /**
> @@ -1532,7 +1537,8 @@ static inline struct timespec64 inode_get_ctime(const struct inode *inode)
>  static inline struct timespec64 inode_set_ctime_to_ts(struct inode *inode,
>  						      struct timespec64 ts)
>  {
> -	inode->__i_ctime = ts;
> +	inode->i_ctime_sec = ts.tv_sec;
> +	inode->i_ctime_nsec = ts.tv_sec;

Bug above and in the other inode_set_?time_to_ts() functions. This isn't
setting the nsec field correctly.

>  	return ts;
>  }
> 
> 


>  
> @@ -1555,13 +1561,17 @@ static inline struct timespec64 inode_set_ctime(struct inode *inode,
>  
>  static inline struct timespec64 inode_get_atime(const struct inode *inode)
>  {
> -	return inode->__i_atime;
> +	struct timespec64 ts = { .tv_sec  = inode->i_atime_sec,
> +				 .tv_nsec = inode->i_atime_nsec };
> +
> +	return ts;
>  }
>  
>  static inline struct timespec64 inode_set_atime_to_ts(struct inode *inode,
>  						      struct timespec64 ts)
>  {
> -	inode->__i_atime = ts;
> +	inode->i_atime_sec = ts.tv_sec;
> +	inode->i_atime_nsec = ts.tv_sec;
>  	return ts;
>  }
>  
> @@ -1575,13 +1585,17 @@ static inline struct timespec64 inode_set_atime(struct inode *inode,
>  
>  static inline struct timespec64 inode_get_mtime(const struct inode *inode)
>  {
> -	return inode->__i_mtime;
> +	struct timespec64 ts = { .tv_sec  = inode->i_mtime_sec,
> +				 .tv_nsec = inode->i_mtime_nsec };
> +
> +	return ts;
>  }
>  
>  static inline struct timespec64 inode_set_mtime_to_ts(struct inode *inode,
>  						      struct timespec64 ts)
>  {
> -	inode->__i_mtime = ts;
> +	inode->i_atime_sec = ts.tv_sec;
> +	inode->i_atime_nsec = ts.tv_sec;

Doh! s/atime/mtime/ in the above lines.

>  	return ts;
>  }
>  

Both bugs are fixed in my tree.
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
