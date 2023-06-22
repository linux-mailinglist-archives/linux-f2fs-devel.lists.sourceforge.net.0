Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6841A739E2F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jun 2023 12:15:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qCHL7-0005gt-KB;
	Thu, 22 Jun 2023 10:14:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qCHL4-0005ga-MF;
 Thu, 22 Jun 2023 10:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7+cabg86v1cYpPv8vDJOW5RfunjhlSEWXfJLwIkmtqs=; b=TCdxCMWcRRzARYpKMKS7+1Y+AG
 478bjaG7+Tcd+i8mkiEGJ7+f9AmAPynbS7VgrzeebOKfccm6rgYKwGvU5EpZQqkZGJIjfxmvw+y8K
 UoIkmfuQxvcdjEJdiFdxHI3JDIGtK9w7f3SegkAFnOh7sJBmJ7dnAA4ylCXVvmf1dSX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7+cabg86v1cYpPv8vDJOW5RfunjhlSEWXfJLwIkmtqs=; b=aNoLjy8TDWkLQKIucPWmds71zz
 68DRdAjYqRf6oT5d/gy+dnEXpDecclHWVrgCJohhMu/fTGGshyPZb+m0Jo342f2qewglhBUgcqas3
 xCd5iKyyrrfOepWtJZd7Ky6G3xt1LXDPaiOEx+w9swT5lTcqaQd6BZsgtDhX5DlqA7LE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qCHL4-00BOfU-Di; Thu, 22 Jun 2023 10:14:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4277617BB;
 Thu, 22 Jun 2023 10:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2888C433C9;
 Thu, 22 Jun 2023 10:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687428888;
 bh=7+cabg86v1cYpPv8vDJOW5RfunjhlSEWXfJLwIkmtqs=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=bash4qEoN8ysoF4HTnLUBoIb4R/VvEf+WW/D9VIwZ7IkIbfsRZHAuo5DrHgU3mESQ
 YV3L6vJlJ5RLoTi5/71VkN5rQAydrP7yy38zcSGGfwasNdQxjqfQEDJO2KhRfaS72P
 L3pOkZCMNStmacczTh8Bxts4KstAt3iUVQoAzfNq5O0qEkTp/AQ/ZxnvFiOtuM8Rrh
 hGFigQvIDdzAyY8j4H2gTF58blmQ8XCJxFBrtJ8bp21DHjiO/HINP7f4QOOgCaaZnm
 wPOh/3PFD9MITyv48Pm3mcErp57QuFgfhsUJhmJROqlUtadgwIZDzlw31/avwVXFpE
 VwFt0TPP5toFA==
Message-ID: <ad4bfb630128709588164db6f1fd2ef39c31d2a5.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Damien Le Moal <dlemoal@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, Arnd
 Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>,  Christophe Leroy
 <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>,  Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Todd Kjos
 <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes
 <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, Carlos
 Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason
 Gunthorpe <jgg@ziepe.ca>,  Leon Romanovsky <leon@kernel.org>, Brad Warrum
 <bwarrum@linux.ibm.com>, Ritu Agarwal <rituagar@linux.ibm.com>, Eric Van
 Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck
 <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, David Howells
 <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Ian Kent <raven@themaw.net>, Luis de
 Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Eric Biederman
 <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Chris Mason
 <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, Xiubo Li
 <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Joel Becker <jlbec@evilplan.org>,
 Christoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>,  "Rafael
 J. Wysocki" <rafael@kernel.org>, Tyler Hicks <code@tyhicks.com>, Ard
 Biesheuvel <ardb@kernel.org>, Gao Xiang <xiang@kernel.org>, Chao Yu
 <chao@kernel.org>,  Yue Hu <huyue2@coolpad.com>, Jeffle Xu
 <jefflexu@linux.alibaba.com>, Namjae Jeon <linkinjeon@kernel.org>, Sungjong
 Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>, Theodore Ts'o
 <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim
 <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Miklos
 Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, Andreas
 Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Mikulas Patocka
 <mikulas@artax.karlin.mff.cuni.cz>,  Mike Kravetz
 <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>, David
 Woodhouse <dwmw2@infradead.org>, Dave Kleikamp <shaggy@kernel.org>, Tejun
 Heo <tj@kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Anton Altaparmakov
 <anton@tuxera.com>,  Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Bob Copeland <me@bobcopeland.com>,
 Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg
 <martin@omnibond.com>, Luis Chamberlain <mcgrof@kernel.org>, Iurii Zaikin
 <yzaikin@google.com>, Tony Luck <tony.luck@intel.com>,  "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, Anders Larsen <al@alarsen.net>, Steve
 French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>, Ronnie
 Sahlberg <lsahlber@redhat.com>, Shyam Prasad N <sprasad@microsoft.com>, Tom
 Talpey <tom@talpey.com>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Evgeniy
 Dushistov <dushistov@mail.ru>, Hans de Goede <hdegoede@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Hugh Dickins <hughd@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge
 E. Hallyn" <serge@hallyn.com>, Stephen Smalley
 <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, 
 Juergen Gross <jgross@suse.com>, Ruihan Li <lrh2000@pku.edu.cn>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Udipto Goswami
 <quic_ugoswami@quicinc.com>,  Linyu Yuan <quic_linyyuan@quicinc.com>, John
 Keeping <john@keeping.me.uk>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>, Dan Carpenter <error27@gmail.com>, Yuta Hayama
 <hayama@lineo.co.jp>, Jozef Martiniak <jomajm@gmail.com>, Jens Axboe
 <axboe@kernel.dk>, Alan Stern <stern@rowland.harvard.edu>, Sandeep Dhavale
 <dhavale@google.com>, Dave Chinner <dchinner@redhat.com>, Johannes Weiner
 <hannes@cmpxchg.org>, ZhangPeng <zhangpeng362@huawei.com>, Viacheslav
 Dubeyko <slava@dubeyko.com>, Tetsuo Handa
 <penguin-kernel@I-love.SAKURA.ne.jp>,  Aditya Garg <gargaditya08@live.com>,
 Erez Zadok <ezk@cs.stonybrook.edu>, Yifei Liu <yifeliu@cs.stonybrook.edu>,
 Yu Zhe <yuzhe@nfschina.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Oleg Kanatov <okanatov@gmail.com>, "Dr. David Alan
 Gilbert" <linux@treblig.org>, Jiangshan Yi <yijiangshan@kylinos.cn>, xu xin
 <cgel.zte@gmail.com>, Stefan Roesch <shr@devkernel.io>, Zhihao Cheng
 <chengzhihao1@huawei.com>, "Liam R. Howlett" <Liam.Howlett@Oracle.com>, 
 Alexey Dobriyan <adobriyan@gmail.com>, Minghao Chi
 <chi.minghao@zte.com.cn>, Seth Forshee <sforshee@digitalocean.com>, Zeng
 Jingxiang <linuszeng@tencent.com>, Bart Van Assche <bvanassche@acm.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>,
 Zhang Yi <yi.zhang@huawei.com>, Tom Rix <trix@redhat.com>, "Fabio M. De
 Francesco" <fmdefrancesco@gmail.com>, Chen Zhongjin
 <chenzhongjin@huawei.com>, Zhengchao Shao <shaozhengchao@huawei.com>, Rik
 van Riel <riel@surriel.com>, Jingyu Wang <jingyuwang_vip@163.com>, Hangyu
 Hua <hbh25y@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,  linux-s390@vger.kernel.org,
 linux-rdma@vger.kernel.org,  linux-usb@vger.kernel.org,
 v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-afs@lists.infradead.org, autofs@vger.kernel.org, linux-mm@kvack.org, 
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
 codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
 linux-efi@vger.kernel.org,  linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org,  linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com,  linux-um@lists.infradead.org,
 linux-mtd@lists.infradead.org,  jfs-discussion@lists.sourceforge.net,
 linux-nfs@vger.kernel.org,  linux-nilfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net,  ntfs3@lists.linux.dev,
 ocfs2-devel@oss.oracle.com,  linux-karma-devel@lists.sourceforge.net,
 devel@lists.orangefs.org,  linux-unionfs@vger.kernel.org,
 linux-hardening@vger.kernel.org,  reiserfs-devel@vger.kernel.org,
 linux-cifs@vger.kernel.org,  samba-technical@lists.samba.org,
 linux-trace-kernel@vger.kernel.org,  linux-xfs@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,  apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org,  selinux@vger.kernel.org
Date: Thu, 22 Jun 2023 06:14:30 -0400
In-Reply-To: <99b3c749-23d9-6f09-fb75-6a84f3d1b066@kernel.org>
References: <20230621144507.55591-1-jlayton@kernel.org>
 <20230621144507.55591-2-jlayton@kernel.org>
 <99b3c749-23d9-6f09-fb75-6a84f3d1b066@kernel.org>
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 2023-06-22 at 09:46 +0900, Damien Le Moal wrote: >
 On 6/21/23 23:45, Jeff Layton wrote: > > struct timespec64 has unused bits
 in the tv_nsec field that can be used > > for other purposes. In f [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qCHL4-00BOfU-Di
Subject: Re: [f2fs-dev] [PATCH 01/79] fs: add ctime accessors infrastructure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 2023-06-22 at 09:46 +0900, Damien Le Moal wrote:
> On 6/21/23 23:45, Jeff Layton wrote:
> > struct timespec64 has unused bits in the tv_nsec field that can be used
> > for other purposes. In future patches, we're going to change how the
> > inode->i_ctime is accessed in certain inodes in order to make use of
> > them. In order to do that safely though, we'll need to eradicate raw
> > accesses of the inode->i_ctime field from the kernel.
> > 
> > Add new accessor functions for the ctime that we can use to replace them.
> > 
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> 
> [...]
> 
> > +/**
> > + * inode_ctime_peek - fetch the current ctime from the inode
> > + * @inode: inode from which to fetch ctime
> > + *
> > + * Grab the current ctime from the inode and return it.
> > + */
> > +static inline struct timespec64 inode_ctime_peek(const struct inode *inode)
> 
> To be consistent with inode_ctime_set(), why not call this one inode_ctime_get()

In later patches fetching the ctime for presentation may have side
effects on certain filesystems. Using "peek" here is a hint that we want
to avoid those side effects in these calls.

> ? Also, inode_set_ctime() & inode_get_ctime() may be a little more natural. But
> no strong opinion about that though.
> 

I like the consistency of the inode_ctime_* prefix. It makes it simpler
to find these calls when grepping, etc.

That said, my opinions on naming are pretty loosely-held, so if the
consensus is that the names should as you suggest, I'll go along with
it.
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
