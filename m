Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 740FA74917B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jul 2023 01:13:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHBgr-0007mH-27;
	Wed, 05 Jul 2023 23:13:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1qHBgp-0007m2-9a;
 Wed, 05 Jul 2023 23:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uzYZE+978ggnisu9DTYb/lai0rQfPYZCN/CDTFDIYSg=; b=O4ML6c/YV090/b5wFmTdYcZzNU
 345DgsIUfkLhkt8byxxhyBD+VfqEmRrqLDeD0qahbOxJmk9pHupCKbtL7+z4D2Zv+IjAOuPL0nkrd
 g+k6R15h0ha1ZphZXVsHHflWH/AQ21Q8yQTHQlcjav433wMcfI9SPeo7FGie/8BMMRU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uzYZE+978ggnisu9DTYb/lai0rQfPYZCN/CDTFDIYSg=; b=XD+w6KrC7CKHep8n/Xs9/jBvNI
 t/U41qjNiH03QNcyk3G+zwagrCKpnqp9VJmWkFF8GngItSlFTbPEIjZwUO0mqG9gF/chGPAI9Q+2H
 LfjT3NIN6ZvsvtmBMKed5s/c5mvQ0PCr/yozU3Zl+uIw2t92JwJWgDP5r9UmqA43Ls5g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHBgb-00007a-WC; Wed, 05 Jul 2023 23:13:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E429A6183D;
 Wed,  5 Jul 2023 23:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9B7C433C7;
 Wed,  5 Jul 2023 23:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688598798;
 bh=dbVAcwdmAronKN2/exh+7rTyLVmJxnKKBZZH/rfELec=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=di4vANHGk01g6BG5D+kP8/xay3uXUiIBLtBnwrNkmTzBqnQe5y4Yy3r3sKprZdrZU
 hLYRxm6m/yexaa2MvMrDAkxslOrCPsdA+8QIJT4XlTSOO9bW5v7MHkxYlPIViPfKeF
 fRn/+0zT6OSrjtw22jXVBH/ovhdvc9vkFCNM1EBs2VjepM0ULrtRhvag5CPbr192w0
 cRcfbru+GTcRyXj7Wbzq75c7s6EGwzFcQQiKkr0Wkg0zmTaRA5F4rovPj6XXBdkkmN
 kDb1CQGmDyQbWx+r141kxp0SAX3Yzem7fUjViBscjxeGvouGbK76BC9mhrZWRfN3n1
 Ec6Ry2aMc3ZpQ==
Message-ID: <96225b66-61df-ce60-4581-d34f345210a1@kernel.org>
Date: Thu, 6 Jul 2023 08:12:54 +0900
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
 <20230705185812.579118-2-jlayton@kernel.org>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230705185812.579118-2-jlayton@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/6/23 03:58, Jeff Layton wrote: > struct timespec64 has
 unused bits in the tv_nsec field that can be used > for other purposes. In
 future patches, we're going to change how the > inode->i_ctime is [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
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
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHBgb-00007a-WC
Subject: Re: [f2fs-dev] [PATCH v2 07/92] fs: add ctime accessors
 infrastructure
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
Cc: Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/6/23 03:58, Jeff Layton wrote:
> struct timespec64 has unused bits in the tv_nsec field that can be used
> for other purposes. In future patches, we're going to change how the
> inode->i_ctime is accessed in certain inodes in order to make use of
> them. In order to do that safely though, we'll need to eradicate raw
> accesses of the inode->i_ctime field from the kernel.
> 
> Add new accessor functions for the ctime that we use to replace them.
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
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
