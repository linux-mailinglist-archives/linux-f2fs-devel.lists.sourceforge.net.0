Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B017491A0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jul 2023 01:20:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHBnH-0000lC-Ul;
	Wed, 05 Jul 2023 23:20:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1qHBnF-0000kn-KT;
 Wed, 05 Jul 2023 23:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PBi/rBZUAKk0nwnQVnXmgkjzjjT+h/TfW+uo53o5M8k=; b=DHI0b3/thOFwLFParMsH++Yv4N
 yFnsf5V3VtZ4Uem7PdhSJCG2cxlNKG9369jiyJTD3mDU+6GjjKd9ee4Iqy9ntnDoNQEp2t1b5jAyg
 0ubHCmDFbR/nG1ZXjIqatx0dUL8EObUFt5GzIjpkWkunR0Vnj1xLxndwVU++960pe/mM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PBi/rBZUAKk0nwnQVnXmgkjzjjT+h/TfW+uo53o5M8k=; b=fk11o6USggewA/VsGoEQ4TbSSG
 k1VWaKfhqz7EuIliJkJlbJpeKj8evKTnhBWklHHivvIeCDNj7FbcIFhgU4qnfaLiTyOvV/MY2pWQ3
 EHSq3fq/J2rXCfBYbX6ulI6475M6fx3ZFVQyVCULGxw8+oP62rsB8Ji3xZSF2RSpXNk0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHBnE-0000mk-4O; Wed, 05 Jul 2023 23:20:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 751EB617F2;
 Wed,  5 Jul 2023 23:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26476C433C8;
 Wed,  5 Jul 2023 23:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688599209;
 bh=lKrue1sGsFTYklMQWRMbQ3My1e6nxD2ObDEGwR/VsF0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=HLxmQwiZ1LmjUMMnuuRPPSyg4M265uTgwaRQNcugB9qBZelv5caqUlnlZ5FOkyCBO
 LA9nfmoC3VcwDcNYXdLwyrAjpQ8qAvbq7SFByp4Q0d8VX6Iv9VyTpE94IU21bzQwq7
 AXFUzX0mVEu7h6lf94UAW2WWe3aMpfRBaJ0VbFwIq54AZXBu03Eb370uSlX/QYxLnb
 UXNpYhAvkUoamOq5NO810kR9phlIz2t2HqAG1QMsAKmqwo0IMtrDOTVHIlTnm36wsc
 mJPYsNRjIZdhZzmDYmS/04VlnpppU6zobkiJuxMYBpvIxpIIrXPcePBFRLkFK603MQ
 3zkknzFWV7lIQ==
Message-ID: <a482ca9b-9621-7363-0233-1c0bec15aa6c@kernel.org>
Date: Thu, 6 Jul 2023 08:19:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Jeff Layton <jlayton@kernel.org>, jk@ozlabs.org, arnd@arndb.de,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, gregkh@linuxfoundation.org,
 arve@android.com, tkjos@android.com, maco@android.com,
 joel@joelfernandes.org, brauner@kernel.org, cmllamas@google.com,
 surenb@google.com, dennis.dalessandro@cornelisnetworks.com, jgg@ziepe.ca,
 leon@kernel.org, bwarrum@linux.ibm.com, rituagar@linux.ibm.com,
 ericvh@kernel.org, lucho@ionkov.net, asmadeus@codewreck.org,
 linux_oss@crudebyte.com, dsterba@suse.com, dhowells@redhat.com,
 marc.dionne@auristor.com, viro@zeniv.linux.org.uk, raven@themaw.net,
 luisbg@kernel.org, salah.triki@gmail.com, aivazian.tigran@gmail.com,
 ebiederm@xmission.com, keescook@chromium.org, clm@fb.com,
 josef@toxicpanda.com, xiubli@redhat.com, idryomov@gmail.com,
 jaharkes@cs.cmu.edu, coda@cs.cmu.edu, jlbec@evilplan.org, hch@lst.de,
 nico@fluxnic.net, rafael@kernel.org, code@tyhicks.com, ardb@kernel.org,
 xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, linkinjeon@kernel.org, sj1557.seo@samsung.com,
 jack@suse.com, tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 hirofumi@mail.parknet.co.jp, miklos@szeredi.hu, rpeterso@redhat.com,
 agruenba@redhat.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
 johannes@sipsolutions.net, mikulas@artax.karlin.mff.cuni.cz,
 mike.kravetz@oracle.com, muchun.song@linux.dev, dwmw2@infradead.org,
 shaggy@kernel.org, tj@kernel.org, trond.myklebust@hammerspace.com,
 anna@kernel.org, chuck.lever@oracle.com, neilb@suse.de, kolga@netapp.com,
 Dai.Ngo@oracle.com, tom@talpey.com, konishi.ryusuke@gmail.com,
 anton@tuxera.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com,
 joseph.qi@linux.alibaba.com, me@bobcopeland.com, hubcap@omnibond.com,
 martin@omnibond.com, amir73il@gmail.com, mcgrof@kernel.org,
 yzaikin@google.com, tony.luck@intel.com, gpiccoli@igalia.com,
 al@alarsen.net, sfrench@samba.org, pc@manguebit.com, lsahlber@redhat.com,
 sprasad@microsoft.com, senozhatsky@chromium.org, phillip@squashfs.org.uk,
 rostedt@goodmis.org, mhiramat@kernel.org, dushistov@mail.ru,
 hdegoede@redhat.com, djwong@kernel.org, naohiro.aota@wdc.com,
 jth@kernel.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org,
 hughd@google.com, akpm@linux-foundation.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org,
 jgross@suse.com, stern@rowland.harvard.edu, lrh2000@pku.edu.cn,
 sebastian.reichel@collabora.com, wsa+renesas@sang-engineering.com,
 quic_ugoswami@quicinc.com, quic_linyyuan@quicinc.com, john@keeping.me.uk,
 error27@gmail.com, quic_uaggarwa@quicinc.com, hayama@lineo.co.jp,
 jomajm@gmail.com, axboe@kernel.dk, dhavale@google.com, dchinner@redhat.com,
 hannes@cmpxchg.org, zhangpeng362@huawei.com, slava@dubeyko.com,
 gargaditya08@live.com, penguin-kernel@I-love.SAKURA.ne.jp,
 yifeliu@cs.stonybrook.edu, madkar@cs.stonybrook.edu, ezk@cs.stonybrook.edu,
 yuzhe@nfschina.com, willy@infradead.org, okanatov@gmail.com,
 jeffxu@chromium.org, linux@treblig.org, mirimmad17@gmail.com,
 yijiangshan@kylinos.cn, yang.yang29@zte.com.cn, xu.xin16@zte.com.cn,
 chengzhihao1@huawei.com, shr@devkernel.io, Liam.Howlett@Oracle.com,
 adobriyan@gmail.com, chi.minghao@zte.com.cn, roberto.sassu@huawei.com,
 linuszeng@tencent.com, bvanassche@acm.org, zohar@linux.ibm.com,
 yi.zhang@huawei.com, trix@redhat.com, fmdefrancesco@gmail.com,
 ebiggers@google.com, princekumarmaurya06@gmail.com, chenzhongjin@huawei.com,
 riel@surriel.com, shaozhengchao@huawei.com, jingyuwang_vip@163.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-usb@vger.kernel.org, v9fs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 autofs@vger.kernel.org, linux-mm@kvack.org, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu,
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
References: <20230705185812.579118-1-jlayton@kernel.org>
 <20230705185812.579118-4-jlayton@kernel.org>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230705185812.579118-4-jlayton@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/6/23 03:58, Jeff Layton wrote: > Now that everything
 in-tree is converted to use the accessor functions, > rename the i_ctime field
 in the inode to discourage direct access. > > Signed-off-by: Je [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHBnE-0000mk-4O
Subject: Re: [f2fs-dev] [PATCH v2 92/92] fs: rename i_ctime field to
 __i_ctime
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

On 7/6/23 03:58, Jeff Layton wrote:
> Now that everything in-tree is converted to use the accessor functions,
> rename the i_ctime field in the inode to discourage direct access.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
