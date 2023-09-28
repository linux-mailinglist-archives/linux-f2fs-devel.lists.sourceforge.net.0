Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A04B37B233E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Sep 2023 19:06:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qluT7-0007Oi-0K;
	Thu, 28 Sep 2023 17:06:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qluT5-0007OP-58;
 Thu, 28 Sep 2023 17:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DNM/VlOuUT51G0bnMvXw+94sqfHee3c68K5vLwQuau4=; b=kA6qJviO4ZO2Ky9iYK/RgUJ0ry
 wbSKKvlrNYsDCJS/7bk3vu6XavUHT92DloU67M2SbW96UC3UJ3a3zKAMRl5gqsrB8dvEeVjdW7tH1
 EwV9JTcGrJYMzrO4whS4i8AQSJ6zZ1iBiGSyM41DmdQl7gVz5wgvo2SVh9ZPiPE2Q7gU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DNM/VlOuUT51G0bnMvXw+94sqfHee3c68K5vLwQuau4=; b=nNneVpDPOqSKBzvVJ/pDukSs/o
 SxkWhEW6WlxcmHqfl3V3igbU1ABc1dg+GZWMrwgQGxW6Gb20/hOy2sGFehnfzRcN+M0Zij39i5C2x
 dog8+Wllicsfbn7wh+5sH600fJ2V9ivL6G33tnIURET0LcdeZSgpD9HsKaXv5a06uZa8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qluT3-00ALxD-95; Thu, 28 Sep 2023 17:06:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A10FF61D47;
 Thu, 28 Sep 2023 17:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B31C433C8;
 Thu, 28 Sep 2023 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695920779;
 bh=DNM/VlOuUT51G0bnMvXw+94sqfHee3c68K5vLwQuau4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=T1EG9wCsmdavqbCDgZQmRYDY2hTjqQ8HvqU7HakqZRoba0+m8x7Xb0PPxNH54fTbK
 gxOvKBrhR/NUHAqOFYLgQFvCS4fbqqpdpyJ0meCz+VJBZB5WwUDXaofxixCnDwGA2b
 xVhvTR3lvjwhcUNCr4cL+zM4prum42dBj/EqssN3wQ5xwZohTtnO5wenm4djJ5rTsg
 au+O/I2DWLjGqSGQ9+pJFDrXNkgJ5uSZlH8zfxoOHymWjEqjSumVZbYplcXqZfm3+f
 KDfZ0aAr31be94G8szYCClaMWLFdZEYGpG76Y3w4tHoT3E7mgxWznMj5HFQTi8O+xa
 SaKUjb/2UX2Ww==
Message-ID: <af047e4a1c6947c59d4a13d4ae221c784a5386b4.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, David Sterba <dsterba@suse.cz>, Amir
 Goldstein <amir73il@gmail.com>, Theodore Ts'o <tytso@mit.edu>,  "Eric W.
 Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Jeremy Kerr <jk@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Todd Kjos
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
 Christoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Gao Xiang
 <xiang@kernel.org>, Chao Yu <chao@kernel.org>,  Yue Hu
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
 <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, John Johansen
 <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James
 Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Stephen
 Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>
Date: Thu, 28 Sep 2023 13:06:03 -0400
In-Reply-To: <6020d6e7-b187-4abb-bf38-dc09d8bd0f6d@app.fastmail.com>
References: <20230928110554.34758-1-jlayton@kernel.org>
 <20230928110554.34758-2-jlayton@kernel.org>
 <6020d6e7-b187-4abb-bf38-dc09d8bd0f6d@app.fastmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 2023-09-28 at 11:48 -0400, Arnd Bergmann wrote: >
 On Thu, Sep 28, 2023, at 07:05, Jeff Layton wrote: > > This shaves 8 bytes
 off struct inode, according to pahole. > > > > Signed-off-by: Jeff [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1qluT3-00ALxD-95
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
 linux-security-module@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 2023-09-28 at 11:48 -0400, Arnd Bergmann wrote:
> On Thu, Sep 28, 2023, at 07:05, Jeff Layton wrote:
> > This shaves 8 bytes off struct inode, according to pahole.
> > 
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> 
> FWIW, this is similar to the approach that Deepa suggested
> back in 2016:
> 
> https://lore.kernel.org/lkml/1452144972-15802-3-git-send-email-deepa.kernel@gmail.com/
> 
> It was NaKed at the time because of the added complexity,
> though it would have been much easier to do it then,
> as we had to touch all the timespec references anyway.
> 
> The approach still seems ok to me, but I'm not sure it's worth
> doing it now if we didn't do it then.
> 

I remember seeing those patches go by. I don't remember that change
being NaK'ed, but I wasn't paying close attention at the time 

Looking at it objectively now, I think it's worth it to recover 8 bytes
per inode and open a 4 byte hole that Amir can use to grow the
i_fsnotify_mask. We might even able to shave off another 12 bytes
eventually if we can move to a single 64-bit word per timestamp. 

It is a lot of churn though.
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
