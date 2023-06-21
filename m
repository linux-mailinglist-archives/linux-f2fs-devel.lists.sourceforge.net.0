Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5C1738FF6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jun 2023 21:22:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qC3PB-0004Ua-A9;
	Wed, 21 Jun 2023 19:22:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <SRS0=fXM2=CJ=goodmis.org=rostedt@kernel.org>)
 id 1qC3P9-0004UL-7e; Wed, 21 Jun 2023 19:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f7ZPpeY/pUTL/3pt09RFwymSSI1p5pOpdla6e7cL0TQ=; b=M+cDxDViENXMv+nwY6z7+e1SWj
 YZf7OaHhuwcvIP5EAx2eguZ38xuCbzW7FVES+NZbEVYGUNjJkPqlfsrX4702RCNZePs52Gzj4ZIxz
 hZASiQ0fHG7wSjEdRYJyNa+ndmR+r371DANIBBn4+nX+xY1goT0if1uZpm7IvThmcnWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f7ZPpeY/pUTL/3pt09RFwymSSI1p5pOpdla6e7cL0TQ=; b=XHEa2S0iqKqfmefCzF+dV+umJr
 2VnVnTyCUg669brdUdJH2/z6+lqPDTWkEPl8RCPgE//O524vGkf3jidSs2TnTu3zFCmUMdHwehYbv
 o9pKLqxZ4/gZMtRNKnBedpHQWNjnKXg04tAO9uGrpwnsIa7X6N0yaSbQU4SaDILuU+nc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qC3P8-00At1G-H0; Wed, 21 Jun 2023 19:22:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21AE7616A1;
 Wed, 21 Jun 2023 19:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D03C433C0;
 Wed, 21 Jun 2023 19:21:43 +0000 (UTC)
Date: Wed, 21 Jun 2023 15:21:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230621152141.5961cf5f@gandalf.local.home>
In-Reply-To: <20230621144507.55591-1-jlayton@kernel.org>
References: <20230621144507.55591-1-jlayton@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed,
 21 Jun 2023 10:45:05 -0400 Jeff Layton <jlayton@kernel.org>
 wrote: > Most of this conversion was done via coccinelle, with a few of the
 more > non-standard accesses done by hand. There should be no behavioral
 > changes with this set. That will come later, as we conve [...] 
 Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qC3P8-00At1G-H0
Subject: Re: [f2fs-dev] [PATCH 00/79] fs: new accessors for inode->i_ctime
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, "Rafael
 J. Wysocki" <rafael@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 Anders Larsen <al@alarsen.net>, Carlos Llamas <cmllamas@google.com>,
 Andrii Nakryiko <andrii@kernel.org>, Hugh Dickins <hughd@google.com>,
 John Johansen <john.johansen@canonical.com>,
 Seth Forshee <sforshee@digitalocean.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-xfs@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
 Michael Ellerman <mpe@ellerman.id.au>, John Keeping <john@keeping.me.uk>,
 Zhang Yi <yi.zhang@huawei.com>, James Morris <jmorris@namei.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Tyler Hicks <code@tyhicks.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Dave Kleikamp <shaggy@kernel.org>,
 Sandeep Dhavale <dhavale@google.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-mm@kvack.org,
 Joel Fernandes <joel@joelfernandes.org>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Hangyu Hua <hbh25y@gmail.com>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Arve =?UTF-8?B?SGrDuG5uZXY=?= =?UTF-8?B?w6Vn?= <arve@android.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, codalist@coda.cs.cmu.edu,
 selinux@vger.kernel.org, ZhangPeng <zhangpeng362@huawei.com>,
 Udipto Goswami <quic_ugoswami@quicinc.com>, Yonghong Song <yhs@fb.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, ecryptfs@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Yu Zhe <yuzhe@nfschina.com>, linuxppc-dev@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 Yue Hu <huyue2@coolpad.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Aditya Garg <gargaditya08@live.com>, Martijn Coenen <maco@android.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
 Muchun Song <muchun.song@linux.dev>, Roberto Sassu <roberto.sassu@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Jozef Martiniak <jomajm@gmail.com>, Eric Biederman <ebiederm@xmission.com>,
 Anna Schumaker <anna@kernel.org>, xu xin <cgel.zte@gmail.com>,
 Brad Warrum <bwarrum@linux.ibm.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 Jingyu Wang <jingyuwang_vip@163.com>, linux-efi@vger.kernel.org,
 Dan Carpenter <error27@gmail.com>, Martin Brandenburg <martin@omnibond.com>,
 Tom Rix <trix@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
 Ian Kent <raven@themaw.net>, Naohiro Aota <naohiro.aota@wdc.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, Linyu Yuan <quic_linyyuan@quicinc.com>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Jens Axboe <axboe@kernel.dk>, Zeng Jingxiang <linuszeng@tencent.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 autofs@vger.kernel.org, Yifei Liu <yifeliu@cs.stonybrook.edu>,
 Damien Le Moal <dlemoal@kernel.org>, Eric Paris <eparis@parisplace.org>,
 ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 Jiangshan Yi <yijiangshan@kylinos.cn>, David Howells <dhowells@redhat.com>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Song Liu <song@kernel.org>, samba-technical@lists.samba.org,
 Steve French <sfrench@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 netdev@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, "David S.
 Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com,
 jfs-discussion@lists.sourceforge.net,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>, KP Singh <kpsingh@kernel.org>,
 Oleg Kanatov <okanatov@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Yuta Hayama <hayama@lineo.co.jp>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Zhengchao Shao <shaozhengchao@huawei.com>,
 Chen Zhongjin <chenzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Stefan Roesch <shr@devkernel.io>,
 cluster-devel@redhat.com, Jason Gunthorpe <jgg@ziepe.ca>,
 Jakub Kicinski <kuba@kernel.org>, Rik van Riel <riel@surriel.com>,
 Salah Triki <salah.triki@gmail.com>, Evgeniy Dushistov <dushistov@mail.ru>,
 linux-cifs@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 apparmor@lists.ubuntu.com, Josef Bacik <josef@toxicpanda.com>,
 "Liam R. Howlett" <Liam.Howlett@Oracle.com>, Tom Talpey <tom@talpey.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Dave Chinner <dchinner@redhat.com>, David Sterba <dsterba@suse.com>,
 Xiubo Li <xiubli@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Juergen Gross <jgross@suse.com>, Johannes Thumshirn <jth@kernel.org>,
 Ritu Agarwal <rituagar@linux.ibm.com>, Luis de Bethencourt <luisbg@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, v9fs@lists.linux.dev, "Fabio M. De
 Francesco" <fmdefrancesco@gmail.com>, linux-unionfs@vger.kernel.org,
 Ruihan Li <lrh2000@pku.edu.cn>, linux-security-module@vger.kernel.org,
 Erez Zadok <ezk@cs.stonybrook.edu>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 "Dr. David Alan
 Gilbert" <linux@treblig.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Johannes Berg <johannes@sipsolutions.net>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 21 Jun 2023 10:45:05 -0400
Jeff Layton <jlayton@kernel.org> wrote:

> Most of this conversion was done via coccinelle, with a few of the more
> non-standard accesses done by hand. There should be no behavioral
> changes with this set. That will come later, as we convert individual
> filesystems to use multigrain timestamps.

BTW, Linus has suggested to me that whenever a conccinelle script is used,
it should be included in the change log.

-- Steve


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
