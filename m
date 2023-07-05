Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8EF749071
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Jul 2023 23:58:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHAW0-0006cQ-GS;
	Wed, 05 Jul 2023 21:58:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qHAVn-0006c9-RF;
 Wed, 05 Jul 2023 21:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mxHGvJQ2lYXILM8RaLME+ro39f0e5w1WxdBDS1r/BDY=; b=M/dejq+xf9s6xIB5hoeA6i1Rtd
 MSk1qoMRLePOw3KN0HLCGIUNOSFTld3fd3Nch5ZzN13K9im6r06CxIxNaOCMKPJYluQjf/ey+z477
 8bg5OcD03tdwWKnjSW2QO9OUij0VCWv0/V1jWpmX+1n8R2n60NscSdzc1gY15LWnxbEg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mxHGvJQ2lYXILM8RaLME+ro39f0e5w1WxdBDS1r/BDY=; b=FaeuwErpEOVAwDVj+RjdqJWtf3
 uIizFlDSrdJN/aFAn7q9lisl/ntSkNsjoUq8J/+3YdObhf8lVU9q/UAPQ1Wq7p0cugn65OuKGTD7T
 4zZ+wIaXvYkGCriZOEaC1ssEYB+6AGeJ165MqVRU40b7ehGJZ49tQ/FpiN8MX/jneAVk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHAVn-007fC6-US; Wed, 05 Jul 2023 21:58:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E75216176E;
 Wed,  5 Jul 2023 21:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE02C433C7;
 Wed,  5 Jul 2023 21:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688594285;
 bh=JlErKO6ytzrETfJF10RJ07fFyXoxaUt5+ApLH28Eksk=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=ox9UCUOCrMoArAN2UWINeG7QvaXvn/rW6VX3bNg/iJYSvDmftw/A4NpK1NYTdX1NF
 gVgMoqKe4Wy+YcaUy/Dyaq00MJKT04z3nDqfKuQM4SFZsRbASIDWrt/F1bfZ/Sk9IA
 IlCUdLT6kxy2jL8SF3nViHjnNHXzs55XV4F3VEYsgVxzqxUcCiE9JSR2Z8IfDFpjTE
 aAs5GOvVMsx8Eye0YwI4OGGuVtit0IDRpyx+/wLT78cg1mMMLjGSPd8pWmdQxt1+Az
 UpvwRSPwHQIIqvl4d9BIKKNlv96fZDtb/zFnJIHpMrXV8Xk+YsvNrTXbO+lqW0MMpc
 fXzU6mvU9YhKA==
Message-ID: <a4e6cfec345487fc9ac8ab814a817c79a61b123a.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: jk@ozlabs.org, arnd@arndb.de, mpe@ellerman.id.au, npiggin@gmail.com, 
 christophe.leroy@csgroup.eu, hca@linux.ibm.com, gor@linux.ibm.com, 
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
 gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
 maco@android.com,  joel@joelfernandes.org, brauner@kernel.org,
 cmllamas@google.com, surenb@google.com, 
 dennis.dalessandro@cornelisnetworks.com, jgg@ziepe.ca, leon@kernel.org, 
 bwarrum@linux.ibm.com, rituagar@linux.ibm.com, ericvh@kernel.org,
 lucho@ionkov.net,  asmadeus@codewreck.org, linux_oss@crudebyte.com,
 dsterba@suse.com,  dhowells@redhat.com, marc.dionne@auristor.com,
 viro@zeniv.linux.org.uk,  raven@themaw.net, luisbg@kernel.org,
 salah.triki@gmail.com,  aivazian.tigran@gmail.com, ebiederm@xmission.com,
 keescook@chromium.org,  clm@fb.com, josef@toxicpanda.com,
 xiubli@redhat.com, idryomov@gmail.com,  jaharkes@cs.cmu.edu,
 coda@cs.cmu.edu, jlbec@evilplan.org, hch@lst.de,  nico@fluxnic.net,
 rafael@kernel.org, code@tyhicks.com, ardb@kernel.org,  xiang@kernel.org,
 chao@kernel.org, huyue2@coolpad.com, jefflexu@linux.alibaba.com, 
 linkinjeon@kernel.org, sj1557.seo@samsung.com, jack@suse.com,
 tytso@mit.edu,  adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 hirofumi@mail.parknet.co.jp,  miklos@szeredi.hu, rpeterso@redhat.com,
 agruenba@redhat.com, richard@nod.at,  anton.ivanov@cambridgegreys.com,
 johannes@sipsolutions.net,  mikulas@artax.karlin.mff.cuni.cz,
 mike.kravetz@oracle.com, muchun.song@linux.dev,  dwmw2@infradead.org,
 shaggy@kernel.org, tj@kernel.org,  trond.myklebust@hammerspace.com,
 anna@kernel.org, chuck.lever@oracle.com,  neilb@suse.de, kolga@netapp.com,
 Dai.Ngo@oracle.com, tom@talpey.com,  konishi.ryusuke@gmail.com,
 anton@tuxera.com,  almaz.alexandrovich@paragon-software.com,
 mark@fasheh.com,  joseph.qi@linux.alibaba.com, me@bobcopeland.com,
 hubcap@omnibond.com,  martin@omnibond.com, amir73il@gmail.com,
 mcgrof@kernel.org, yzaikin@google.com,  tony.luck@intel.com,
 gpiccoli@igalia.com, al@alarsen.net, sfrench@samba.org,  pc@manguebit.com,
 lsahlber@redhat.com, sprasad@microsoft.com,  senozhatsky@chromium.org,
 phillip@squashfs.org.uk, rostedt@goodmis.org,  mhiramat@kernel.org,
 dushistov@mail.ru, hdegoede@redhat.com, djwong@kernel.org, 
 dlemoal@kernel.org, naohiro.aota@wdc.com, jth@kernel.org, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 song@kernel.org,  yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com,  haoluo@google.com, jolsa@kernel.org, hughd@google.com,
 akpm@linux-foundation.org,  davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com,  john.johansen@canonical.com,
 paul@paul-moore.com, jmorris@namei.org,  serge@hallyn.com,
 stephen.smalley.work@gmail.com, eparis@parisplace.org,  jgross@suse.com,
 stern@rowland.harvard.edu, lrh2000@pku.edu.cn, 
 sebastian.reichel@collabora.com, wsa+renesas@sang-engineering.com, 
 quic_ugoswami@quicinc.com, quic_linyyuan@quicinc.com, john@keeping.me.uk, 
 error27@gmail.com, quic_uaggarwa@quicinc.com, hayama@lineo.co.jp,
 jomajm@gmail.com,  axboe@kernel.dk, dhavale@google.com,
 dchinner@redhat.com, hannes@cmpxchg.org,  zhangpeng362@huawei.com,
 slava@dubeyko.com, gargaditya08@live.com, 
 penguin-kernel@I-love.SAKURA.ne.jp, yifeliu@cs.stonybrook.edu, 
 madkar@cs.stonybrook.edu, ezk@cs.stonybrook.edu, yuzhe@nfschina.com, 
 willy@infradead.org, okanatov@gmail.com, jeffxu@chromium.org,
 linux@treblig.org,  mirimmad17@gmail.com, yijiangshan@kylinos.cn,
 yang.yang29@zte.com.cn,  xu.xin16@zte.com.cn, chengzhihao1@huawei.com,
 shr@devkernel.io,  Liam.Howlett@Oracle.com, adobriyan@gmail.com,
 chi.minghao@zte.com.cn,  roberto.sassu@huawei.com, linuszeng@tencent.com,
 bvanassche@acm.org,  zohar@linux.ibm.com, yi.zhang@huawei.com,
 trix@redhat.com, fmdefrancesco@gmail.com,  ebiggers@google.com,
 princekumarmaurya06@gmail.com, chenzhongjin@huawei.com,  riel@surriel.com,
 shaozhengchao@huawei.com, jingyuwang_vip@163.com, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org, 
 linux-usb@vger.kernel.org, v9fs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org,  linux-afs@lists.infradead.org,
 autofs@vger.kernel.org, linux-mm@kvack.org,  linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org,  codalist@coda.cs.cmu.edu,
 ecryptfs@vger.kernel.org, linux-efi@vger.kernel.org, 
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com, 
 linux-um@lists.infradead.org, linux-mtd@lists.infradead.org, 
 jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org, 
 linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, 
 ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 linux-karma-devel@lists.sourceforge.net, devel@lists.orangefs.org, 
 linux-unionfs@vger.kernel.org, linux-hardening@vger.kernel.org, 
 reiserfs-devel@vger.kernel.org, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-trace-kernel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org
Date: Wed, 05 Jul 2023 17:57:46 -0400
In-Reply-To: <20230705185812.579118-1-jlayton@kernel.org>
References: <20230705185812.579118-1-jlayton@kernel.org>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 2023-07-05 at 14:58 -0400, Jeff Layton wrote: > v2:
 > - prepend patches to add missing ctime updates > - add
 simple_rename_timestamp
 helper function > - rename ctime accessor functions as inod [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHAVn-007fC6-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 2023-07-05 at 14:58 -0400, Jeff Layton wrote:
> v2:
> - prepend patches to add missing ctime updates
> - add simple_rename_timestamp helper function
> - rename ctime accessor functions as inode_get_ctime/inode_set_ctime_*
> - drop individual inode_ctime_set_{sec,nsec} helpers
> 
> I've been working on a patchset to change how the inode->i_ctime is
> accessed in order to give us conditional, high-res timestamps for the
> ctime and mtime. struct timespec64 has unused bits in it that we can use
> to implement this. In order to do that however, we need to wrap all
> accesses of inode->i_ctime to ensure that bits used as flags are
> appropriately handled.
> 
> The patchset starts with reposts of some missing ctime updates that I
> spotted in the tree. It then adds a new helper function for updating the
> timestamp after a successful rename, and new ctime accessor
> infrastructure.
> 
> The bulk of the patchset is individual conversions of different
> subsysteme to use the new infrastructure. Finally, the patchset renames
> the i_ctime field to __i_ctime to help ensure that I didn't miss
> anything.
> 
> This should apply cleanly to linux-next as of this morning.
> 
> Most of this conversion was done via 5 different coccinelle scripts, run
> in succession, with a large swath of by-hand conversions to clean up the
> remainder.
> 

A couple of other things I should note:

If you sent me an Acked-by or Reviewed-by in the previous set, then I
tried to keep it on the patch here, since the respun patches are mostly
just renaming stuff from v1. Let me know if I've missed any.

I've also pushed the pile to my tree as this tag:

    https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/tag/?h=ctime.20230705

In case that's easier to work with.

Cheers,
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
