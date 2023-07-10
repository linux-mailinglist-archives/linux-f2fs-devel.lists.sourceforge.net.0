Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D83474D7B9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Jul 2023 15:33:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qIr0r-00027F-1G;
	Mon, 10 Jul 2023 13:33:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qIr0X-00026h-0G;
 Mon, 10 Jul 2023 13:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ypo6EEC/a10vTp0LME1omXwBE1UiKK/mReyAl6l5UHQ=; b=EiSAjIWjAeS2aoEUSBYv8WahTM
 ebasPtQWLOUEH5eAm6dHZOeZZgCQFrhAi6vqX+AJhEqhcWTvspuD2DfnXWOm1QCEdvsosnA/L6nTM
 FSEDAZRDpPzWtqvK6cSwHDY77YYS96qCf3xYBPC/UrdOx55/CCcn1RLVwyWbfjOwveMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ypo6EEC/a10vTp0LME1omXwBE1UiKK/mReyAl6l5UHQ=; b=bgbhnY/RYO8pH3vjD0eTpxnDBm
 u0INSAFCMcC6KOcz3tH/vVv2oXc8IwFSIDh0IWdJ2W6RMFJaMa/MjR2DUvPbD8kj7UUYXAWftLVi4
 X4JElcOdC5mH4QqTOnimdgmGOewqIqCC90I+tlypl6mMDE7375HXl4F6UJX/S1q0CfM0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qIr0T-003Nhw-Bk; Mon, 10 Jul 2023 13:32:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58D4060B8D;
 Mon, 10 Jul 2023 13:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E3BC433C9;
 Mon, 10 Jul 2023 13:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688995962;
 bh=ypo6EEC/a10vTp0LME1omXwBE1UiKK/mReyAl6l5UHQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=J7Z7W1QfjLNRfgVQcSdKnYFRxtD+3fk+fVeHY9xuci1TKV61DCMVSYVvDG9kwuCBX
 g+QpzC0XDkSjeL9nV9+lGdPbp68Q96EXBiPlDNXBynN9HrAz4Y+E89ZYAnFm4gMFob
 SGwQAd+JWX6wsLqjr9V4UXCKsBkrO6/s1MT1FJcjDjR0RhV1HnH8M/padgIYfYI3iT
 50AKfuQ1Ba3eH+A3TeCdkft2SWR53hIVATzxttJnSld1dtaOLY6XNcMPkiIrdtp3w+
 UMgZy7XJf81pa8iQgs3v7vGfymFo80jGgmK2T6kIjmEHcqRaAvCUmLi8QnIHmVmDpT
 pZFJemBst7t+w==
Message-ID: <c4eaff9389fe63ec4e29404ec0d1181b74935426.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Date: Mon, 10 Jul 2023 09:32:23 -0400
In-Reply-To: <20230710-zudem-entkam-bb508cbd8c78@brauner>
References: <20230705185812.579118-1-jlayton@kernel.org>
 <5e40891f6423feb5b68f025e31f26e9a50ae9390.camel@kernel.org>
 <20230710-zudem-entkam-bb508cbd8c78@brauner>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2023-07-10 at 14:35 +0200, Christian Brauner wrote:
 > On Fri, Jul 07, 2023 at 08:42:31AM -0400, Jeff Layton wrote: > > On Wed,
 2023-07-05 at 14:58 -0400, Jeff Layton wrote: > > > v2: > > > - p [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qIr0T-003Nhw-Bk
Subject: Re: [f2fs-dev] [PATCH v2 00/89] fs: new accessors for inode->i_ctime
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
Cc: lucho@ionkov.net, rafael@kernel.org, djwong@kernel.org, al@alarsen.net,
 cmllamas@google.com, andrii@kernel.org, hughd@google.com,
 john.johansen@canonical.com, agordeev@linux.ibm.com, hch@lst.de,
 hubcap@omnibond.com, pc@manguebit.com, linux-xfs@vger.kernel.org,
 bvanassche@acm.org, jeffxu@chromium.org, mpe@ellerman.id.au,
 john@keeping.me.uk, yi.zhang@huawei.com, jmorris@namei.org,
 christophe.leroy@csgroup.eu, code@tyhicks.com, stern@rowland.harvard.edu,
 borntraeger@linux.ibm.com, devel@lists.orangefs.org, mirimmad17@gmail.com,
 sprasad@microsoft.com, jaharkes@cs.cmu.edu, linux-um@lists.infradead.org,
 npiggin@gmail.com, viro@zeniv.linux.org.uk, ericvh@kernel.org,
 surenb@google.com, trond.myklebust@hammerspace.com, anton@tuxera.com,
 wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org,
 stephen.smalley.work@gmail.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, lsahlber@redhat.com, senozhatsky@chromium.org,
 arve@android.com, chuck.lever@oracle.com, svens@linux.ibm.com,
 jolsa@kernel.org, jack@suse.com, tj@kernel.org, akpm@linux-foundation.org,
 linux-trace-kernel@vger.kernel.org, xu.xin16@zte.com.cn, shaggy@kernel.org,
 dhavale@google.com, penguin-kernel@I-love.SAKURA.ne.jp, zohar@linux.ibm.com,
 linux-mm@kvack.org, joel@joelfernandes.org, edumazet@google.com,
 sdf@google.com, jomajm@gmail.com, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, paul@paul-moore.com, rituagar@linux.ibm.com,
 john.fastabend@gmail.com, mcgrof@kernel.org, chi.minghao@zte.com.cn,
 codalist@coda.cs.cmu.edu, selinux@vger.kernel.org, zhangpeng362@huawei.com,
 quic_ugoswami@quicinc.com, yhs@fb.com, yzaikin@google.com,
 linkinjeon@kernel.org, mhiramat@kernel.org, ecryptfs@vger.kernel.org,
 tkjos@android.com, madkar@cs.stonybrook.edu, gor@linux.ibm.com,
 yuzhe@nfschina.com, linuxppc-dev@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, miklos@szeredi.hu, huyue2@coolpad.com,
 jaegeuk@kernel.org, gargaditya08@live.com, maco@android.com,
 hirofumi@mail.parknet.co.jp, haoluo@google.com, tony.luck@intel.com,
 tytso@mit.edu, nico@fluxnic.net, linux-ntfs-dev@lists.sourceforge.net,
 muchun.song@linux.dev, roberto.sassu@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net, yang.yang29@zte.com.cn,
 gpiccoli@igalia.com, ebiederm@xmission.com, anna@kernel.org,
 quic_uaggarwa@quicinc.com, bwarrum@linux.ibm.com, mike.kravetz@oracle.com,
 jingyuwang_vip@163.com, linux-efi@vger.kernel.org, error27@gmail.com,
 martin@omnibond.com, trix@redhat.com, ocfs2-devel@lists.linux.dev,
 ast@kernel.org, sebastian.reichel@collabora.com, clm@fb.com,
 linux-mtd@lists.infradead.org, willy@infradead.org, marc.dionne@auristor.com,
 linux-afs@lists.infradead.org, raven@themaw.net, naohiro.aota@wdc.com,
 daniel@iogearbox.net, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, quic_linyyuan@quicinc.com, coda@cs.cmu.edu,
 slava@dubeyko.com, idryomov@gmail.com, pabeni@redhat.com, adobriyan@gmail.com,
 serge@hallyn.com, axboe@kernel.dk, amir73il@gmail.com, linuszeng@tencent.com,
 keescook@chromium.org, arnd@arndb.de, autofs@vger.kernel.org,
 rostedt@goodmis.org, yifeliu@cs.stonybrook.edu, dlemoal@kernel.org,
 eparis@parisplace.org, ceph-devel@vger.kernel.org, xiang@kernel.org,
 yijiangshan@kylinos.cn, dhowells@redhat.com, linux-nfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, kolga@netapp.com, song@kernel.org,
 samba-technical@lists.samba.org, sfrench@samba.org, jk@ozlabs.org,
 netdev@vger.kernel.org, rpeterso@redhat.com, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 davem@davemloft.net, jfs-discussion@lists.sourceforge.net,
 princekumarmaurya06@gmail.com, ebiggers@google.com, neilb@suse.de,
 asmadeus@codewreck.org, linux_oss@crudebyte.com, me@bobcopeland.com,
 kpsingh@kernel.org, okanatov@gmail.com,
 almaz.alexandrovich@paragon-software.com, joseph.qi@linux.alibaba.com,
 hayama@lineo.co.jp, adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz,
 shaozhengchao@huawei.com, chenzhongjin@huawei.com, ardb@kernel.org,
 anton.ivanov@cambridgegreys.com, agruenba@redhat.com, richard@nod.at,
 mark@fasheh.com, shr@devkernel.io, Dai.Ngo@oracle.com,
 cluster-devel@redhat.com, jgg@ziepe.ca, kuba@kernel.org, riel@surriel.com,
 salah.triki@gmail.com, dushistov@mail.ru, linux-cifs@vger.kernel.org,
 hca@linux.ibm.com, apparmor@lists.ubuntu.com, josef@toxicpanda.com,
 Liam.Howlett@Oracle.com, tom@talpey.com, hdegoede@redhat.com,
 linux-hardening@vger.kernel.org, aivazian.tigran@gmail.com,
 dchinner@redhat.com, dsterba@suse.com, xiubli@redhat.com,
 konishi.ryusuke@gmail.com, jgross@suse.com, jth@kernel.org, leon@kernel.org,
 luisbg@kernel.org, martin.lau@linux.dev, v9fs@lists.linux.dev,
 fmdefrancesco@gmail.com, linux-unionfs@vger.kernel.org, lrh2000@pku.edu.cn,
 linux-security-module@vger.kernel.org, ezk@cs.stonybrook.edu,
 jefflexu@linux.alibaba.com, linux@treblig.org, hannes@cmpxchg.org,
 phillip@squashfs.org.uk, johannes@sipsolutions.net, sj1557.seo@samsung.com,
 dwmw2@infradead.org, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org, jlbec@evilplan.org
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 2023-07-10 at 14:35 +0200, Christian Brauner wrote:
> On Fri, Jul 07, 2023 at 08:42:31AM -0400, Jeff Layton wrote:
> > On Wed, 2023-07-05 at 14:58 -0400, Jeff Layton wrote:
> > > v2:
> > > - prepend patches to add missing ctime updates
> > > - add simple_rename_timestamp helper function
> > > - rename ctime accessor functions as inode_get_ctime/inode_set_ctime_*
> > > - drop individual inode_ctime_set_{sec,nsec} helpers
> > > =

> > =

> > After review by Jan and others, and Jan's ext4 rework, the diff on top
> > of the series I posted a couple of days ago is below. I don't really
> > want to spam everyone with another ~100 patch v3 series, but I can if
> > you think that's best.
> > =

> > Christian, what would you like me to do here?
> =

> I picked up the series from the list and folded the fixups you posted
> here into the respective fs conversion patches. I hope that helps you
> avoid a resend. You should have received a separate "thank you" mail for
> all of this.
> =

> To each patch that I folded one of the fixlets from below into I added a
> git note that records a link to your mail here and the respective patch
> hunk from this mail that I folded into the patch. git.kernel.org will
> show notes by default. For example,
> https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/commit/?h=3Dv=
fs.ctime&id=3D8b0e3c2e99004609a16ba145bcbdfdddb78e220e
> should show you the note I added. You can also fetch them via
> git fetch $remote refs/notes/*:refs/notes/*
> (You probably know that ofc but jic.) if you're interested.
> =

> Based on v6.5-rc1 as of today.
> =


Many thanks!!! I'll get to work rebasing the multigrain timestamp series
on top of that.

> Btw, both b4 and patchwork somehow treat the series in weird was.
> IOW, based on the message id of the cover letter I was able to pull most
> messages except for:
> =

> [07/92] fs: add ctime accessors infrastructure
> [08/92] fs: new helper: simple_rename_timestamp
> [92/92] fs: rename i_ctime field to __i_ctime
> =

> which I pulled in separately. Not sure what the cause of=A0
> =

> this is.

Good to know.

I ended up doing the send in two phases: one for the cover letter and
infrastructure patches that went to everyone, and one for the per-
subsystem patches that went do individual maintainers and lists.

I suspect that screwed up the message IDs somehow. Hopefully I won't
need to do a posting like that again soon, but I'll pay closer attention
to the message id handling next time.

Thanks again!
-- =

Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
