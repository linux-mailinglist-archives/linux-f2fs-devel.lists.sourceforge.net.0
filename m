Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1005A791C77
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Sep 2023 20:11:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdE2j-0001qK-Ok;
	Mon, 04 Sep 2023 18:11:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qdE2h-0001q0-On;
 Mon, 04 Sep 2023 18:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tn8si3/qp2Z3di+DUREE9ynCu0UmgeFwPoR+nzbNswM=; b=Up0IbJdc+XkDYiPvfXykOqMXHV
 H3mAUhx2j9GCR7Nri8X9VnvmaSdX6wmn6k8Z1RYpqW1Gue2gsVTvJszyrkDIZUE3FU1R5L4guucIH
 KhqnU5zKxSdW3Y1QxpwcWFYA0GKUtNHJGG7QSbUH59mhgU0L4KVupBuqcCwBXLGdUGPE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tn8si3/qp2Z3di+DUREE9ynCu0UmgeFwPoR+nzbNswM=; b=OzB4ec9Z8QggV5fNo77TYvl4ne
 8ad1H7cv/almjsOpvufc8kdI+s5UphYTjo7FwQr61DeiCmiJdC1bYTQjjREvzdrQbVQ+kJNCCpynb
 CRCqu3ot82UAMJrmPhAVQJssr26rE0EeDdTeBaLzTsLmrpc1/Jd1bx9BRnLf1ythUJP4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdE2h-0007WY-VP; Mon, 04 Sep 2023 18:11:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9B152B80ED0;
 Mon,  4 Sep 2023 18:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26F6EC433BB;
 Mon,  4 Sep 2023 18:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693851069;
 bh=XLoa47KxRcps38wwidPhLGQHNoTClCg5nlSU2UvnxSI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XZUD/xT7QAeS9CwkDxlRqT/gRWQx0TmxhnpK0eSpl5TdmWje1tq2yvGH+3vZ2+BCT
 jCeZ3PliMwtj4PI/YG14pbxznaZzZiLpm9dwOITxs9QimCVLsdgcY+tXdL8VHHo6Xo
 yN1Gfw9YZmIyD8m43UuRL17+XTyHWk7a5WXn6oF5ggWXw6RS9S101xrDjQsPd+ZkCx
 1CnWWAtQSCxTFtksNwHsJ+bzmvgeWVNV2ZHBFMah4WlUviOzbSHDkb9JT06sfaty1l
 sU4YI09Bt9xI2xASG0RHXL6Mglihp9xk051QekITKNbwSi+f4qbVFzWkXoKrsHAJfp
 TL/wsjYXrOQBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C90EDC2BBD7; Mon,  4 Sep 2023 18:11:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169385106881.19669.3510550425397118597.git-patchwork-notify@kernel.org>
Date: Mon, 04 Sep 2023 18:11:08 +0000
References: <20230705185812.579118-1-jlayton@kernel.org>
In-Reply-To: <20230705185812.579118-1-jlayton@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Christian Brauner <brauner@kernel.org>: On Wed, 5 Jul 2023 14:58:09 -0400
 you wrote: > v2: > - prepend patches to add missing ctime updates > - add
 simple_rename_timestamp helper function > - rename ctime accessor functions
 as inode_get_cti [...] 
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
X-Headers-End: 1qdE2h-0007WY-VP
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

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Christian Brauner <brauner@kernel.org>:

On Wed,  5 Jul 2023 14:58:09 -0400 you wrote:
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
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,07/92] fs: add ctime accessors infrastructure
    https://git.kernel.org/jaegeuk/f2fs/c/9b6304c1d537
  - [f2fs-dev,v2,08/92] fs: new helper: simple_rename_timestamp
    https://git.kernel.org/jaegeuk/f2fs/c/0c4767923ed6
  - [f2fs-dev,v2,92/92] fs: rename i_ctime field to __i_ctime
    https://git.kernel.org/jaegeuk/f2fs/c/13bc24457850

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
