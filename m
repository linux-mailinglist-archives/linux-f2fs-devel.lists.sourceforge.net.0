Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C904474AF08
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jul 2023 12:51:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHj3Q-0006Ux-Jj;
	Fri, 07 Jul 2023 10:51:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qHj3O-0006Ue-Gl;
 Fri, 07 Jul 2023 10:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ldKWM9MUIfpU86mj7+BbtZZKGTcTUE1WlO3GxCj9e0Y=; b=VQTz9S9IDWy1bVOEttXKwRG1Xd
 bdXfDtipxog9WH/sVKEpuzl+UZ5NR4lTzL5DubyYt3Dg/BKOdFthpWsuFC1AKm4bl3fieEH2EjPHq
 ZNsgvB5C/VoVsXVFX3+W5QEwdhc0cGvpfRwVVnKDGQw1+mAEHS0hOJ1OgGocu5dYNK3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ldKWM9MUIfpU86mj7+BbtZZKGTcTUE1WlO3GxCj9e0Y=; b=Al1vEpy39r/3FLXndUvYLnmoJi
 3m4oZT9rdMvOKGuBzytABrMgnF+HBzvPp2hMUdOSk896BJmZZQCbnMqZbtylTj8c5QRN+o0yFtUS7
 dgfUzL9aNTibUyC2OxgSZ4tfkw7Mr0NguU85/uhhc0qnJrnG5LoaOoVC47EjV1TRfCxM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHj3O-000Zhi-1p; Fri, 07 Jul 2023 10:51:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C4C3618BB;
 Fri,  7 Jul 2023 10:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1904CC433C7;
 Fri,  7 Jul 2023 10:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688727060;
 bh=YY2+JZ9K159BEA5iSbeX62sRGYZcpbUaLjQvLugmLbE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=jXdQbiZ5Du/aIdze7VeTdm89AeKeYW1m4/7P1K420P54fp2uTq7aOaGBMwqlLnw11
 5T+jXE1w9xr2TFIydSymIs59E5/D60tiQwOrG5t4hwTmZ4+DNTLa0LgW/JlS7C6Rg0
 Mzl7zZGaHcBNbE8fs+RYzBh/pLfQTiwpAzbqUwnaVBq4Wks4CGEmJGniuijWbkznN9
 yKSAP4Wd0VGwzQyH6kGj1b/zaEVMosXLl47jzHBi50p2AWNvdkuhe4kCPVw/2GfwLp
 PcUD4QVeNETkqKyUuCjgzrA8gjstIliNy9GhxSwhdsoWExJoMegiOtBnIsuS31XbZX
 flM91ZzrsjFeA==
Message-ID: <ff1f471a9d33ae01ad570644273e4e579204a3b6.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Seth Arnold <seth.arnold@canonical.com>
Date: Fri, 07 Jul 2023 06:50:40 -0400
In-Reply-To: <20230706210236.GB3244704@millbarge>
References: <20230705185812.579118-1-jlayton@kernel.org>
 <20230705185812.579118-3-jlayton@kernel.org>
 <3b403ef1-22e6-0220-6c9c-435e3444b4d3@kernel.org>
 <7c783969641b67d6ffdfb10e509f382d083c5291.camel@kernel.org>
 <20230706210236.GB3244704@millbarge>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 2023-07-06 at 21:02 +0000, Seth Arnold wrote: > On
 Wed, Jul 05, 2023 at 08:04:41PM -0400, Jeff Layton wrote: > > > > I don't
 believe it's an issue. I've seen nothing in the POSIX spec that > > [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHj3O-000Zhi-1p
Subject: Re: [f2fs-dev] [apparmor] [PATCH v2 08/92] fs: new helper:
 simple_rename_timestamp
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
 brauner@kernel.org, wsa+renesas@sang-engineering.com,
 gregkh@linuxfoundation.org, stephen.smalley.work@gmail.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, lsahlber@redhat.com,
 senozhatsky@chromium.org, arve@android.com, chuck.lever@oracle.com,
 svens@linux.ibm.com, jolsa@kernel.org, jack@suse.com, tj@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 xu.xin16@zte.com.cn, shaggy@kernel.org, dhavale@google.com,
 penguin-kernel@I-love.SAKURA.ne.jp, zohar@linux.ibm.com, linux-mm@kvack.org,
 joel@joelfernandes.org, edumazet@google.com, sdf@google.com, jomajm@gmail.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, paul@paul-moore.com,
 leon@kernel.org, john.fastabend@gmail.com, mcgrof@kernel.org,
 chi.minghao@zte.com.cn, codalist@coda.cs.cmu.edu, selinux@vger.kernel.org,
 zhangpeng362@huawei.com, quic_ugoswami@quicinc.com, yhs@fb.com,
 yzaikin@google.com, linkinjeon@kernel.org, mhiramat@kernel.org,
 ecryptfs@vger.kernel.org, tkjos@android.com, madkar@cs.stonybrook.edu,
 gor@linux.ibm.com, yuzhe@nfschina.com, linuxppc-dev@lists.ozlabs.org,
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
 rostedt@goodmis.org, yifeliu@cs.stonybrook.edu,
 Damien Le Moal <dlemoal@kernel.org>, eparis@parisplace.org,
 ceph-devel@vger.kernel.org, xiang@kernel.org, yijiangshan@kylinos.cn,
 dhowells@redhat.com, linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 kolga@netapp.com, song@kernel.org, samba-technical@lists.samba.org,
 sfrench@samba.org, jk@ozlabs.org, netdev@vger.kernel.org, rpeterso@redhat.com,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, davem@davemloft.net,
 jfs-discussion@lists.sourceforge.net, princekumarmaurya06@gmail.com,
 ebiggers@google.com, neilb@suse.de, asmadeus@codewreck.org,
 linux_oss@crudebyte.com, me@bobcopeland.com, kpsingh@kernel.org,
 okanatov@gmail.com, almaz.alexandrovich@paragon-software.com,
 joseph.qi@linux.alibaba.com, hayama@lineo.co.jp, adilger.kernel@dilger.ca,
 mikulas@artax.karlin.mff.cuni.cz, shaozhengchao@huawei.com,
 chenzhongjin@huawei.com, ardb@kernel.org, anton.ivanov@cambridgegreys.com,
 agruenba@redhat.com, richard@nod.at, mark@fasheh.com, shr@devkernel.io,
 Dai.Ngo@oracle.com, cluster-devel@redhat.com, jgg@ziepe.ca, kuba@kernel.org,
 riel@surriel.com, salah.triki@gmail.com, dushistov@mail.ru,
 linux-cifs@vger.kernel.org, hca@linux.ibm.com, apparmor@lists.ubuntu.com,
 josef@toxicpanda.com, Liam.Howlett@Oracle.com, tom@talpey.com,
 hdegoede@redhat.com, linux-hardening@vger.kernel.org,
 aivazian.tigran@gmail.com, dchinner@redhat.com, dsterba@suse.com,
 xiubli@redhat.com, konishi.ryusuke@gmail.com, jgross@suse.com, jth@kernel.org,
 rituagar@linux.ibm.com, luisbg@kernel.org, martin.lau@linux.dev,
 v9fs@lists.linux.dev, fmdefrancesco@gmail.com, linux-unionfs@vger.kernel.org,
 lrh2000@pku.edu.cn, linux-security-module@vger.kernel.org,
 ezk@cs.stonybrook.edu, jefflexu@linux.alibaba.com, linux@treblig.org,
 hannes@cmpxchg.org, phillip@squashfs.org.uk, johannes@sipsolutions.net,
 sj1557.seo@samsung.com, dwmw2@infradead.org,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 jlbec@evilplan.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 2023-07-06 at 21:02 +0000, Seth Arnold wrote:
> On Wed, Jul 05, 2023 at 08:04:41PM -0400, Jeff Layton wrote:
> > 
> > I don't believe it's an issue. I've seen nothing in the POSIX spec that
> > mandates that timestamp updates to different inodes involved in an
> > operation be set to the _same_ value. It just says they must be updated.
> > 
> > It's also hard to believe that any software would depend on this either,
> > given that it's very inconsistent across filesystems today. AFAICT, this
> > was mostly done in the past just as a matter of convenience.
> 
> I've seen this assumption in several programs:
> 

Thanks for looking into this!

To be clear, POSIX doesn't require that _different_ inodes ever be set
to the same timestamp value. IOW, it certainly doesn't require that the
source and target directories on a rename() end up with the exact same
timestamp value.

Granted, POSIX is rather vague on timestamps in general, but most of the
examples below involve comparing different timestamps on the _same_
inode.


> mutt buffy.c
> https://sources.debian.org/src/mutt/2.2.9-1/buffy.c/?hl=625#L625
> 
>   if (mailbox->newly_created &&
>       (sb->st_ctime != sb->st_mtime || sb->st_ctime != sb->st_atime))
>     mailbox->newly_created = 0;
> 

This should be fine with this patchset. Note that this is comparing
a/c/mtime on the same inode, and our usual pattern on inode
instantiation is:

    inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);

...which should result in all of inode's timestamps being synchronized.

> 
> neomutt mbox/mbox.c
> https://sources.debian.org/src/neomutt/20220429+dfsg1-4.1/mbox/mbox.c/?hl=1820#L1820
> 
>   if (m->newly_created && ((st.st_ctime != st.st_mtime) || (st.st_ctime != st.st_atime)))
>     m->newly_created = false;
> 

Ditto here.

> 
> screen logfile.c
> https://sources.debian.org/src/screen/4.9.0-4/logfile.c/?hl=130#L130
> 
>   if ((!s->st_dev && !s->st_ino) ||             /* stat failed, that's new! */
>       !s->st_nlink ||                           /* red alert: file unlinked */
>       (s->st_size < o.st_size) ||               /*           file truncated */
>       (s->st_mtime != o.st_mtime) ||            /*            file modified */
>       ((s->st_ctime != o.st_ctime) &&           /*     file changed (moved) */
>        !(s->st_mtime == s->st_ctime &&          /*  and it was not a change */
>          o.st_ctime < s->st_ctime)))            /* due to delayed nfs write */
>   {
> 

This one is really weird. You have two different struct stat's, "o" and
"s". I assume though that these should be stat values from the same
inode, because otherwise this comparison would make no sense:

      ((s->st_ctime != o.st_ctime) &&           /*     file changed (moved) */

In general, we can never contrive to ensure that the ctime of two
different inodes are the same, since that is always set by the kernel to
the current time, and you'd have to ensure that they were created within
the same jiffy (at least with today's code).

> nemo libnemo-private/nemo-vfs-file.c
> https://sources.debian.org/src/nemo/5.6.5-1/libnemo-private/nemo-vfs-file.c/?hl=344#L344
> 
> 		/* mtime is when the contents changed; ctime is when the
> 		 * contents or the permissions (inc. owner/group) changed.
> 		 * So we can only know when the permissions changed if mtime
> 		 * and ctime are different.
> 		 */
> 		if (file->details->mtime == file->details->ctime) {
> 			return FALSE;
> 		}
> 

Ditto here with the first examples. This involves comparing timestamps
on the same inode, which should be fine.

> 
> While looking for more examples, I found a perl test that seems to suggest
> that at least Solaris, AFS, AmigaOS, DragonFly BSD do as you suggest:
> https://sources.debian.org/src/perl/5.36.0-7/t/op/stat.t/?hl=158#L140
> 

(I kinda miss Perl. I wrote a bunch of stuff in it in the 90's and early
naughties)

I think this test is supposed to be testing whether the mtime changes on
link() ?

-----------------8<----------------
    my($nlink, $mtime, $ctime) = (stat($tmpfile))[$NLINK, $MTIME, $CTIME];

[...]


        skip "Solaris tmpfs has different mtime/ctime link semantics", 2
                                     if $Is_Solaris and $cwd =~ m#^/tmp# and
                                        $mtime && $mtime == $ctime;
-----------------8<----------------

...again, I think this would be ok too since it's just comparing the
mtime and ctime of the same inode. Granted this is a Solaris-specific
test, but Linux would be fine here too.

So in conclusion, I don't think this patchset will cause problems with
any of the above code.
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
