Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B05574A211
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jul 2023 18:15:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHRdm-0008HL-Us;
	Thu, 06 Jul 2023 16:15:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qHRdc-0008Gs-M6;
 Thu, 06 Jul 2023 16:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TxLDV50UNGuwfdwrUq1A15tGUegvUIwgImLkAQWsDq8=; b=N6Wjm8iVkuDcL6S54Xk8rDrpjG
 hIKB5YpKWKfkuwCdOoZbIo87X44GyiLm9ktBLjZpFwywpjswe1cw2e4pI9n2NJPCV5lzKYLg2vslZ
 FJp1enTra4d7DD8pRBo0DUTZLfLYvpuhAUCsSje0mZlKDmLdYdccGX5KdemM0eJTMotw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TxLDV50UNGuwfdwrUq1A15tGUegvUIwgImLkAQWsDq8=; b=OpDuqhTKlIlVgrqKyK5HlZRLd6
 owqMMEi49JOmYPfDy3OjUCy5HWRgQdEmXKGeA5J8yL0YglK8jYdnCIfe3HJDdb1u5IzwHv+q0wZiN
 0keJhi3UYZ2SXq6fm+SKbgl08dcv7yjcJc3SU4/gapYaegJ1j8PQCbyDKIMOrG72MyLU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHRdc-008anS-GR; Thu, 06 Jul 2023 16:15:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F322860EEE;
 Thu,  6 Jul 2023 16:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD63C433C7;
 Thu,  6 Jul 2023 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688660118;
 bh=r5Eqjb/koo4X65bgDBYxDesIkgsRAdhnfATQ4gt2Esk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=uOgU9evq5o16T6L6tpJH1n8YSQl4p50BjR5wiJPLoKkMzHgO7DWjFII6ePLp5KpdE
 3SlBOVBQ0Ayb1Ck5njyhQkfK/lBmsjOnzq7A/dE1stN3VqJX7pH6IQsgFKtN1DalJo
 E+zh6oq4S0OPw7rIh8zXpFwi+8/fexgoqLXDvhFUUOG0TWnPj5LM1mmg7dIC7PaCB3
 IOEyQDVn/tGwcs+s3mZaJELn1kEqbOemjyG66rmihhs9u/EaGnd4WvmH/942idbgOQ
 fgiPtHR0C+lrv0o8CzKEzOTX/CaJMpmdnCKaL0ZpaSmvJsFgbp9PEliTkXRbGZddzd
 Fm4yxVau37qTQ==
Message-ID: <3948ae7653d1cb7c51febcca26a35775e71a53b4.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Date: Thu, 06 Jul 2023 12:14:58 -0400
In-Reply-To: <87ilaxgjek.fsf@email.froward.int.ebiederm.org>
References: <20230705185812.579118-1-jlayton@kernel.org>
 <a4e6cfec345487fc9ac8ab814a817c79a61b123a.camel@kernel.org>
 <87ilaxgjek.fsf@email.froward.int.ebiederm.org>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 2023-07-06 at 10:16 -0500, Eric W. Biederman wrote:
 > Jeff Layton <jlayton@kernel.org> writes: > > > On Wed, 2023-07-05 at 14:58
 -0400, Jeff Layton wrote: > > > v2: > > > - prepend patches to [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHRdc-008anS-GR
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
 gpiccoli@igalia.com, anna@kernel.org, quic_uaggarwa@quicinc.com,
 bwarrum@linux.ibm.com, mike.kravetz@oracle.com, jingyuwang_vip@163.com,
 linux-efi@vger.kernel.org, error27@gmail.com, martin@omnibond.com,
 trix@redhat.com, ocfs2-devel@lists.linux.dev, ast@kernel.org,
 sebastian.reichel@collabora.com, clm@fb.com, linux-mtd@lists.infradead.org,
 willy@infradead.org, marc.dionne@auristor.com, linux-afs@lists.infradead.org,
 raven@themaw.net, naohiro.aota@wdc.com, daniel@iogearbox.net,
 dennis.dalessandro@cornelisnetworks.com, linux-rdma@vger.kernel.org,
 quic_linyyuan@quicinc.com, coda@cs.cmu.edu, slava@dubeyko.com,
 idryomov@gmail.com, pabeni@redhat.com, adobriyan@gmail.com, serge@hallyn.com,
 axboe@kernel.dk, amir73il@gmail.com, linuszeng@tencent.com,
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
 konishi.ryusuke@gmail.com, jgross@suse.com, jth@kernel.org,
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

On Thu, 2023-07-06 at 10:16 -0500, Eric W. Biederman wrote:
> Jeff Layton <jlayton@kernel.org> writes:
> 
> > On Wed, 2023-07-05 at 14:58 -0400, Jeff Layton wrote:
> > > v2:
> > > - prepend patches to add missing ctime updates
> > > - add simple_rename_timestamp helper function
> > > - rename ctime accessor functions as inode_get_ctime/inode_set_ctime_*
> > > - drop individual inode_ctime_set_{sec,nsec} helpers
> > > 
> > > I've been working on a patchset to change how the inode->i_ctime is
> > > accessed in order to give us conditional, high-res timestamps for the
> > > ctime and mtime. struct timespec64 has unused bits in it that we can use
> > > to implement this. In order to do that however, we need to wrap all
> > > accesses of inode->i_ctime to ensure that bits used as flags are
> > > appropriately handled.
> > > 
> > > The patchset starts with reposts of some missing ctime updates that I
> > > spotted in the tree. It then adds a new helper function for updating the
> > > timestamp after a successful rename, and new ctime accessor
> > > infrastructure.
> > > 
> > > The bulk of the patchset is individual conversions of different
> > > subsysteme to use the new infrastructure. Finally, the patchset renames
> > > the i_ctime field to __i_ctime to help ensure that I didn't miss
> > > anything.
> > > 
> > > This should apply cleanly to linux-next as of this morning.
> > > 
> > > Most of this conversion was done via 5 different coccinelle scripts, run
> > > in succession, with a large swath of by-hand conversions to clean up the
> > > remainder.
> > > 
> > 
> > A couple of other things I should note:
> > 
> > If you sent me an Acked-by or Reviewed-by in the previous set, then I
> > tried to keep it on the patch here, since the respun patches are mostly
> > just renaming stuff from v1. Let me know if I've missed any.
> > 
> > I've also pushed the pile to my tree as this tag:
> > 
> >     https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/tag/?h=ctime.20230705
> > 
> > In case that's easier to work with.
> 
> Are there any preliminary patches showing what you want your introduced
> accessors to turn into?  It is hard to judge the sanity of the
> introduction of wrappers without seeing what the wrappers are ultimately
> going to do.
> 
> Eric

I have a draft version of the multigrain patches on top of the wrapper
conversion I've already posted in my "mgctime-experimental" branch:

    https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/log/?h=mgctime-experimental

The rationale is best explained in this changelog:

    https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?h=mgctime-experimental&id=face437a144d3375afb7f70c233b0644b4edccba

The idea will be to enable this on a per-fs basis.
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
